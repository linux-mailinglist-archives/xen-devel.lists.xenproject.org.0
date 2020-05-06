Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C6A1C7821
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 19:39:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWO0u-0007oD-H4; Wed, 06 May 2020 17:39:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdQ7=6U=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jWO0s-0007o8-Tz
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 17:39:18 +0000
X-Inumbo-ID: 82354b34-8fc0-11ea-b9cf-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82354b34-8fc0-11ea-b9cf-bc764e2007e4;
 Wed, 06 May 2020 17:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588786758;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gNJeaSFtUXhaF0WRCgtPP9MBU8Vk1oM89jkeKYoBEos=;
 b=P4E1YHuRXgEhfm7XCzkY8rf7xs5QAdlwMNXNzcUeXOF52mTx0mQF0fyT
 0jC5dIH5O8c1Z/nXQbh+XX46E2sJlZVQhN1urA2qsrGA4Kaa6ORzd2w11
 ed3DYyWl6piY0q0s21i7Un5wJR4ACldU+wajB9ttjN/EJEOBHv8vzpV6e g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8gYCjedZNdxxXMvt0NqJrUQU58Iqm/Sg3jwZ+y5KHNvDl6oB/ct5azkOj4LVk8mA0PoF+lJWDO
 X9/uzf4UkYdsQVxj1M58GoCjP79G/f6TJyEF9J8p32URiSr69vAl9wiZpCLJCnJp39drDfdlSo
 uhXnvM3JOwf2xKshIpds7ZSJqeeHqLTwK7HJceuqzYHDsfSZfXS8nFtryLjKDmwlSA+vxXu8WN
 BKMTml6Z9UnER+NT+RCc+E78/gxkzHN7gYDTMFqzO2djCCHtKoISmv9tbozO7x9e24gZOfzK/G
 Xi8=
X-SBRS: 2.7
X-MesageID: 17157782
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,360,1583211600"; d="scan'208";a="17157782"
Subject: Re: [PATCH] x86/svm: Use flush-by-asid when available
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200505182539.12247-1-andrew.cooper3@citrix.com>
 <20200506070852.GE1353@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <630df298-1647-ad66-047e-5c98e1ff1546@citrix.com>
Date: Wed, 6 May 2020 18:39:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506070852.GE1353@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/05/2020 08:08, Roger Pau Monné wrote:
> On Tue, May 05, 2020 at 07:25:39PM +0100, Andrew Cooper wrote:
>> AMD Fam15h processors introduced the flush-by-asid feature, for more fine
>> grain flushing purposes.
>>
>> Flushing everything including ASID 0 (i.e. Xen context) is an an unnecesserily
>> large hammer, and never necessary in the context of guest TLBs needing
>> invalidating.
>>
>> When available, use TLB_CTRL_FLUSH_ASID in preference to TLB_CTRL_FLUSH_ALL.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>
> I should also look into restricting the usage of FLUSH_HVM_ASID_CORE
> and instead perform more fine grained per-vCPU flushes when possible,
> since FLUSH_HVM_ASID_CORE resets the pCPU ASID generation forcing a
> new ASID to be allocated for all vCPUs running on that pCPU.
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> The APM currently describes tlb_control encoding 1 as "Flush entire
>> TLB (Should be used only by legacy hypervisors.)".  AMD have agreed that this
>> is misleading and should say "legacy hardware" instead.
> AFAICT using TLB_CTRL_FLUSH_ASID on hardware not supporting the
> feature has not been found to be safe? Ie: TLB_CTRL_FLUSH_ALL is a
> subset of TLB_CTRL_FLUSH_ASID from a bitmap PoV, so if those bits
> where ignored on older hardware it should be safe to unconditionally
> use it.

So as far as I can tell, TLB_CTRL_FLUSH_ASID is safe to use on older
hardware, but I was told in no uncertain terms by an AMD architect that
we can't rely on that.

Hence this patch not being s/TLB_CTRL_FLUSH_ALL/TLB_CTRL_FLUSH_ALL/ in
asid.c

>
>> This change does come with a minor observed perf improvement on Fam17h
>> hardware, of ~0.6s over ~22s for my XTF pagewalk test.  This test will spot
>> TLB flushing issues, but isn't optimal for spotting the perf increase from
>> better flushing.  There were no observed differences for Fam15h, but this
>> could simply mean that the measured code footprint was larger than the TLB on
>> this CPU.
>> ---
>>  xen/arch/x86/hvm/svm/asid.c       | 9 ++++++---
>>  xen/include/asm-x86/hvm/svm/svm.h | 1 +
>>  2 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
>> index 9be90058c7..ab06dd3f3a 100644
>> --- a/xen/arch/x86/hvm/svm/asid.c
>> +++ b/xen/arch/x86/hvm/svm/asid.c
>> @@ -18,6 +18,7 @@
>>  #include <asm/amd.h>
>>  #include <asm/hvm/nestedhvm.h>
>>  #include <asm/hvm/svm/asid.h>
>> +#include <asm/hvm/svm/svm.h>
>>  
>>  void svm_asid_init(const struct cpuinfo_x86 *c)
>>  {
>> @@ -47,15 +48,17 @@ void svm_asid_handle_vmrun(void)
>>      if ( p_asid->asid == 0 )
>>      {
>>          vmcb_set_guest_asid(vmcb, 1);
>> -        /* TODO: investigate using TLB_CTRL_FLUSH_ASID here instead. */
>> -        vmcb->tlb_control = TLB_CTRL_FLUSH_ALL;
>> +        vmcb->tlb_control =
>> +            cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
>>          return;
>>      }
>>  
>>      if ( vmcb_get_guest_asid(vmcb) != p_asid->asid )
>>          vmcb_set_guest_asid(vmcb, p_asid->asid);
>>  
>> -    vmcb->tlb_control = need_flush ? TLB_CTRL_FLUSH_ALL : TLB_CTRL_NO_FLUSH;
>> +    vmcb->tlb_control =
>> +        !need_flush ? TLB_CTRL_NO_FLUSH :
>> +        cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
> Since this code structure is used in two places I would consider
> locally introducing something like:
>
> #define TLB_CTRL_FLUSH_CMD (cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID \
>                                                     : TLB_CTRL_FLUSH_ALL)
>
> To abstract it away.

Right, but TLB_CTRL_FLUSH_CMD is easy to confuse as constant in the same
space as TLB_CTRL_FLUSH_*, and the logic isn't going to survive a
conversion to a finer grain flushing in exactly this form.

~Andrew

