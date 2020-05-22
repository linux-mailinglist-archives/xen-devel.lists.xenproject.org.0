Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3362C1DE81F
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 15:35:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc7p8-00062u-AH; Fri, 22 May 2020 13:34:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc7p7-00062o-I3
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 13:34:53 +0000
X-Inumbo-ID: 036762a6-9c31-11ea-abd3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 036762a6-9c31-11ea-abd3-12813bfff9fa;
 Fri, 22 May 2020 13:34:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 58067AFEC;
 Fri, 22 May 2020 13:34:53 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
 <dae35bcf-5b85-a760-9d15-139973215334@citrix.com>
 <506f21d4-ed81-2cd5-46af-162407553c91@citrix.com>
 <15df5f0a-43f7-ca0c-613f-25a1a1a19640@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5fb6ae3-37b8-1cf9-00dc-e70775792e8c@suse.com>
Date: Fri, 22 May 2020 15:34:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <15df5f0a-43f7-ca0c-613f-25a1a1a19640@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, roger.pau@citrix.com,
 wl@xen.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.05.2020 12:19, Andrew Cooper wrote:
> On 22/05/2020 11:05, Igor Druzhinin wrote:
>> On 22/05/2020 10:45, Andrew Cooper wrote:
>>> On 21/05/2020 22:43, Igor Druzhinin wrote:
>>>> If a recalculation NPT fault hasn't been handled explicitly in
>>>> hvm_hap_nested_page_fault() then it's potentially safe to retry -
>>>> US bit has been re-instated in PTE and any real fault would be correctly
>>>> re-raised next time.
>>>>
>>>> This covers a specific case of migration with vGPU assigned on AMD:
>>>> global log-dirty is enabled and causes immediate recalculation NPT
>>>> fault in MMIO area upon access. This type of fault isn't described
>>>> explicitly in hvm_hap_nested_page_fault (this isn't called on
>>>> EPT misconfig exit on Intel) which results in domain crash.
>>>>
>>>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>> ---
>>>>  xen/arch/x86/hvm/svm/svm.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>>>> index 46a1aac..f0d0bd3 100644
>>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>>> @@ -1726,6 +1726,10 @@ static void svm_do_nested_pgfault(struct vcpu *v,
>>>>          /* inject #VMEXIT(NPF) into guest. */
>>>>          nestedsvm_vmexit_defer(v, VMEXIT_NPF, pfec, gpa);
>>>>          return;
>>>> +    case 0:
>>>> +        /* If a recalculation page fault hasn't been handled - just retry. */
>>>> +        if ( pfec & PFEC_user_mode )
>>>> +            return;
>>> This smells like it is a recipe for livelocks.
>>>
>>> Everything should have been handled properly by the call to
>>> p2m_pt_handle_deferred_changes() which precedes svm_do_nested_pgfault().
>>>
>>> It is legitimate for the MMIO mapping to end up being transiently
>>> recalculated, but the fact that p2m_pt_handle_deferred_changes() doesn't
>>> fix it up suggests that the bug is there.
>>>
>>> Do you have the complete NPT walk to the bad mapping? Do we have
>>> _PAGE_USER in the leaf mapping, or is this perhaps a spurious fault?
>> It does fix it up. The problem is that currently in SVM we enter
>> svm_do_nested_pgfault immediately after p2m_pt_handle_deferred_changes
>> is finished finished.
> 
> Oh - so we do.  I'd read the entry condition for svm_do_nested_pgfault()
> incorrectly.
> 
> Jan - why did you chose to do it this way?  If
> p2m_pt_handle_deferred_changes() has made a modification, there is
> surely nothing relevant to do in svm_do_nested_pgfault().

Why? There can very well be multiple reasons for a single exit
to occur, and hence it did seem to make sense to allow processing
of such possible further reasons right away, instead of re-
entering the guest just to deal with another VM exit. What I can
accept is that the error code may not correctly represent the
"remaining" fault reason anymore at this point.

Jan

