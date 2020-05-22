Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2242C1DE3B1
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:06:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4Yl-0000y2-Hb; Fri, 22 May 2020 10:05:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Somd=7E=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jc4Yj-0000xx-AW
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:05:45 +0000
X-Inumbo-ID: cc84cdcc-9c13-11ea-aba9-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc84cdcc-9c13-11ea-aba9-12813bfff9fa;
 Fri, 22 May 2020 10:05:44 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: y7eq3Hxw3uie9y4rdx1w4vE06kp/+C79LbQUjxLbRHkoTo0/t5VK6MXIXnjXf3u6zfsBlOxTkW
 Vgnpt/VHI+Oec7D5ijLXVqYz+OKOqq/XGamFsaTdxIvVmLMrKjfIIAuIYU60eEVQB8PKzz52pW
 zgYz2qr5JQpaC5wtueWTyJCQUFPJyk2wlfO7w76UOD+Z6no7nNtOgpUQ++SlcO1TRv+eXYFkyx
 pfmTpNEjkZJs6apbiFi7ytQKbeT4KAKG9kySmdIfkD6BH8ocCw0pTsmRlL4a1gBcI2hMPltAbe
 ujg=
X-SBRS: 2.7
X-MesageID: 18193849
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18193849"
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
 <dae35bcf-5b85-a760-9d15-139973215334@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <506f21d4-ed81-2cd5-46af-162407553c91@citrix.com>
Date: Fri, 22 May 2020 11:05:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dae35bcf-5b85-a760-9d15-139973215334@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 22/05/2020 10:45, Andrew Cooper wrote:
> On 21/05/2020 22:43, Igor Druzhinin wrote:
>> If a recalculation NPT fault hasn't been handled explicitly in
>> hvm_hap_nested_page_fault() then it's potentially safe to retry -
>> US bit has been re-instated in PTE and any real fault would be correctly
>> re-raised next time.
>>
>> This covers a specific case of migration with vGPU assigned on AMD:
>> global log-dirty is enabled and causes immediate recalculation NPT
>> fault in MMIO area upon access. This type of fault isn't described
>> explicitly in hvm_hap_nested_page_fault (this isn't called on
>> EPT misconfig exit on Intel) which results in domain crash.
>>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>> ---
>>  xen/arch/x86/hvm/svm/svm.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>> index 46a1aac..f0d0bd3 100644
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -1726,6 +1726,10 @@ static void svm_do_nested_pgfault(struct vcpu *v,
>>          /* inject #VMEXIT(NPF) into guest. */
>>          nestedsvm_vmexit_defer(v, VMEXIT_NPF, pfec, gpa);
>>          return;
>> +    case 0:
>> +        /* If a recalculation page fault hasn't been handled - just retry. */
>> +        if ( pfec & PFEC_user_mode )
>> +            return;
> 
> This smells like it is a recipe for livelocks.
> 
> Everything should have been handled properly by the call to
> p2m_pt_handle_deferred_changes() which precedes svm_do_nested_pgfault().
> 
> It is legitimate for the MMIO mapping to end up being transiently
> recalculated, but the fact that p2m_pt_handle_deferred_changes() doesn't
> fix it up suggests that the bug is there.
> 
> Do you have the complete NPT walk to the bad mapping? Do we have
> _PAGE_USER in the leaf mapping, or is this perhaps a spurious fault?

It does fix it up. The problem is that currently in SVM we enter
svm_do_nested_pgfault immediately after p2m_pt_handle_deferred_changes
is finished finished. 

Yes, we don't have _PAGE_USER initially and, yes, it's fixed up
correctly in p2m_pt_handle_deferred_changes but svm_do_nested_pgfault
doesn't know about it.

Please read my second email about alternatives that suggest to resolve
the issue you're worrying about.

Igor

