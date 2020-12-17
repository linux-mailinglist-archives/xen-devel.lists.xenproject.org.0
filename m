Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD422DCD06
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 08:41:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55735.97104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpnu1-0003LF-Sk; Thu, 17 Dec 2020 07:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55735.97104; Thu, 17 Dec 2020 07:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpnu1-0003Kq-Oz; Thu, 17 Dec 2020 07:40:45 +0000
Received: by outflank-mailman (input) for mailman id 55735;
 Thu, 17 Dec 2020 07:40:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YGc=FV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpnu0-0003Kl-Qr
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 07:40:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87cf3383-6e09-4149-9612-49aec6f0e635;
 Thu, 17 Dec 2020 07:40:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71BA3AC79;
 Thu, 17 Dec 2020 07:40:42 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 87cf3383-6e09-4149-9612-49aec6f0e635
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608190842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rl9ABB6r4JraSZR8pKlXjxJFaO92UWOODMdk+PucpY0=;
	b=Kbvn5X16Dz3weSrYihfT4fSsR6FWeDL9w8psZvca/vSxoK5WM/KSKgvi2Qmy06tGp3Csf2
	HukmPCVCKmF207pbD+XSoEMSsXU4IoEYfqOckMJ6Vr6YO9pqjGiqraLI2KMF2PJ76u5rEh
	CqpWurVhDJtfVqZqUY1QvqyVPBczKac=
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
To: boris.ostrovsky@oracle.com, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Cheyenne Wills <cheyenne.wills@gmail.com>
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
 <4fc3532b-f53f-2a15-ce64-f857816b0566@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f4ff3d16-40f6-e8a1-fcdd-ca52e1f52ca6@suse.com>
Date: Thu, 17 Dec 2020 08:40:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <4fc3532b-f53f-2a15-ce64-f857816b0566@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.12.2020 02:51, boris.ostrovsky@oracle.com wrote:
> 
> On 11/17/20 3:12 AM, Jan Beulich wrote:
>> On 16.11.2020 22:57, Cheyenne Wills wrote:
>>> Running Xen with XSA-351 is causing Solaris 11 systems to panic during
>>> boot.  The panic screen is showing the failure to be coming from
>>> "unix:rdmsr".  The panic occurs with existing guests (booting off a disk)
>>> and the  booting from an install ISO image.
>>>
>>> I discussed the problem with "andyhhp__" in the "#xen" IRC channel and he
>>> requested that I report it here.
>> Thanks. What we need though is information on the specific MSR(s) that
>> will need to have workarounds added: We surely would want to avoid
>> blindly doing this for all that the XSA change disallowed access to.
>> Reproducing the panic screen here might already help; proper full logs
>> would be even better.
> 
> 
> We hit this issue today so I poked a bit around Solaris code.
> 
> 
> It definitely reads MSR_RAPL_POWER_UNIT unguarded during boot.
> 
> 
> In addition, it may read MSR_*_ENERGY_STATUS when running kstat. I haven't been able to trigger those reads (I didn't have access to the system myself and with neither me nor the tester remembering much about Solaris we only tried some basic commands).
> 
> 
> The patch below lets Solaris guest boot on OVM. Our codebase is somewhat different from stable branches but if this is an acceptable workaround I will send proper patch for stable. I won't be able to test it though.

I think this is acceptable as a workaround, albeit we may want to
consider further restricting this (at least on staging), like e.g.
requiring a guest config setting to enable the workaround. But
maybe this will need to be part of the MSR policy for the domain
instead, down the road. We'll definitely want Andrew's view here.

Speaking of staging - before applying anything to the stable
branches, I think we want to have this addressed on the main
branch. I can't see how Solaris would work there.

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -131,6 +131,18 @@ int guest_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
>          *val &= ~(ARCH_CAPS_TSX_CTRL);
>          break;
>  
> +        /* Solaris reads these MSRs unguarded so let's return 0 */
> +    case MSR_RAPL_POWER_UNIT:
> +    case MSR_PKG_ENERGY_STATUS:
> +    case MSR_DRAM_ENERGY_STATUS:
> +    case MSR_PP0_ENERGY_STATUS:
> +    case MSR_PP1_ENERGY_STATUS:
> +        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
> +            goto gp_fault;
> +
> +        *val = 0;
> +        break;
> +
>          /*
>           * These MSRs are not enumerated in CPUID.  They have been around
>           * since the Pentium 4, and implemented by other vendors.
> @@ -151,11 +163,16 @@ int guest_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
>              break;
>  
>          /*fallthrough*/
> -    case MSR_RAPL_POWER_UNIT:
> -    case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
> -    case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
> -    case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
> -    case MSR_PP1_POWER_LIMIT  ... MSR_PP1_POLICY:
> +    case MSR_PKG_POWER_LIMIT:
> +    case MSR_PKG_PERF_STATUS:
> +    case MSR_PKG_POWER_INFO:
> +    case MSR_DRAM_POWER_LIMIT:
> +    case MSR_DRAM_PERF_STATUS:
> +    case MSR_DRAM_POWER_INFO:
> +    case MSR_PP0_POWER_LIMIT:
> +    case MSR_PP0_POLICY:
> +    case MSR_PP1_POWER_LIMIT:
> +    case MSR_PP1_POLICY:
>      case MSR_PLATFORM_ENERGY_COUNTER:
>      case MSR_PLATFORM_POWER_LIMIT:
>      case MSR_F15H_CU_POWER ... MSR_F15H_CU_MAX_POWER:

Note how you no longer handle MSRs previously included (one each
in the first two groups) in the range expressions. I think I'd
prefer the alternative of filtering just the STATUS ones here:

    case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
    case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
    case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
    case MSR_PP1_POWER_LIMIT  ... MSR_PP1_POLICY:
        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
             (msr & 0xf) != 1 /* MSR_*_POWER_STATUS */ )
            goto gp_fault;

        *val = 0;
        break;

Or, folding in MSR_RAPL_POWER_UNIT,

    case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
    case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
    case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
    case MSR_PP1_POWER_LIMIT  ... MSR_PP1_POLICY:
        if ( (msr & 0xf) != 1 /* MSR_*_POWER_STATUS */ )
            goto gp_fault;
        /* fallthrough */
    case MSR_RAPL_POWER_UNIT:
        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
            goto gp_fault;

        *val = 0;
        break;

Jan

