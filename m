Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097231DE453
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:25:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4ra-0003S2-GP; Fri, 22 May 2020 10:25:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Somd=7E=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jc4rZ-0003Rs-E4
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:25:13 +0000
X-Inumbo-ID: 850f8a1a-9c16-11ea-9887-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 850f8a1a-9c16-11ea-9887-bc764e2007e4;
 Fri, 22 May 2020 10:25:12 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: R5BCy4Mm6hu+Y/B//3BD/MyNFQ7VieS0kynn/j1Jlvpij2/3pt77sF5e/dNfy+xhR0GzD1mSMp
 YRlW9u5pg5XObifXw88+woch64g5Fvx3MDpQIESudlmz5LzsGq2LRmIMAYN/95wZ4CcvbHvvqg
 DaNQaZTO4scThbMdlg9hua6jTtB/f99mvl5dPuX5wYf1kXGj6uHyowczed257G1NUohUNB75/n
 r4Sq4UNYnnX+AndykIOKpCVwWh3G49s3JeSKRvM2iF6YHgEGdbb9/9YyWwpaYathrpjqoRdEiH
 zTo=
X-SBRS: 2.7
X-MesageID: 18427610
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18427610"
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
 <dae35bcf-5b85-a760-9d15-139973215334@citrix.com>
 <506f21d4-ed81-2cd5-46af-162407553c91@citrix.com>
 <15df5f0a-43f7-ca0c-613f-25a1a1a19640@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <c74e1075-1f66-9757-7d2c-429cacd337d4@citrix.com>
Date: Fri, 22 May 2020 11:25:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <15df5f0a-43f7-ca0c-613f-25a1a1a19640@citrix.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/05/2020 11:19, Andrew Cooper wrote:
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

In Jan's defense that saves one additional VMEXIT in rare cases
if the fault had other implications (write to RO page in log-dirty)
in addition to recalculation.

Igor
other 

