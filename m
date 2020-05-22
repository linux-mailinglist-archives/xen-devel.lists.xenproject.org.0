Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB6E1DE3E2
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:14:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4hE-0002CP-8O; Fri, 22 May 2020 10:14:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Somd=7E=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jc4hC-0002CK-J4
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:14:30 +0000
X-Inumbo-ID: 05af5a4e-9c15-11ea-aba9-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05af5a4e-9c15-11ea-aba9-12813bfff9fa;
 Fri, 22 May 2020 10:14:29 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NfqJwmCDKLrTc+jp4yFEKqPI5eWD2h76oct4UKWna0tTU6a/EdOgeh6S73OwCRSjv4X6PCPkCJ
 fu0llXY3dX6+Lbj9ZFmAoLCt1Q/pxUIjpXR0pQcv4dyB+9s0QnV4held04X5z0kJNlCrt+ePQP
 hQEuZN7qPyBUnVoB597x+cHfrsfEyrA2MyszHN6BDXrMgxi8vUW6VPzoNpdveO7SckpS9p6nkS
 AIVXWSwGvi2JKc84tw5/UIDg3joEn95wTRPT3woHxIlRExklzudx4c23W1E2PcccAr/eJT/k3p
 ZKI=
X-SBRS: 2.7
X-MesageID: 18427125
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18427125"
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
 <20200522100846.GV54375@Air-de-Roger>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <04ec4ab4-a121-c5be-0a65-316e237dd793@citrix.com>
Date: Fri, 22 May 2020 11:14:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200522100846.GV54375@Air-de-Roger>
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/05/2020 11:08, Roger Pau Monné wrote:
> On Thu, May 21, 2020 at 10:43:58PM +0100, Igor Druzhinin wrote:
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
> 
> Couldn't direct MMIO regions be handled like other types of memory for
> the purposes of logdiry mode?
> 
> I assume there's already a path here used for other memory types when
> logdirty is turned on, and hence would seem better to just make direct
> MMIO regions also use that path?

The proble of handling only MMIO case is that the issue still stays.
It will be hit with some other memory type since it's not MMIO specific.
The issue is that if global recalculation is called, the next hit to
this type will cause a transient fault which will not be handled
correctly after a due fixup by neither of our handlers.

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
> I'm slightly worried that this diverges from the EPT implementation
> now, in the sense that returning 0 from hvm_hap_nested_page_fault will
> no longer trigger a guest crash.

My second alternative from my follow up email addresses this. I also
didn't like this aspect.

Igor

