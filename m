Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D84DF907663
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 17:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740059.1147071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHmBi-00066i-Pc; Thu, 13 Jun 2024 15:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740059.1147071; Thu, 13 Jun 2024 15:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHmBi-000647-Mi; Thu, 13 Jun 2024 15:16:30 +0000
Received: by outflank-mailman (input) for mailman id 740059;
 Thu, 13 Jun 2024 15:16:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9y96=NP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHmBh-00063O-HA
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 15:16:29 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8068be1-2997-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 17:16:28 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7971a9947e6so60524685a.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 08:16:28 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798ab4c16acsm58807085a.59.2024.06.13.08.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 08:16:26 -0700 (PDT)
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
X-Inumbo-ID: e8068be1-2997-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718291787; x=1718896587; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PfLirjC4I7QEInamUbgkgzt7hcToCwfJqOKrYGCSyaQ=;
        b=iFQSpkfd+H/AHBTKlvwatEKw3VUQ36fhzShMpIkSwHm662wkyiWtB9A37ipvrhvcAX
         QN3Htrz/wcpZJmU/QDxcx1W4xDbxEdf+PDW1PC/EJTZHGDSzoL15mBlopnNXw22YIOp8
         EYgGe35+YQB2KD7LM+YC30xhnp3Mtn3NRIZ6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718291787; x=1718896587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfLirjC4I7QEInamUbgkgzt7hcToCwfJqOKrYGCSyaQ=;
        b=nEPPa6afQFV1M+jHVIelJOZKYWrcbczAiPGghCdBtDt400DZYMjYKEGTAJFklvi92F
         9nyN5oIHF7m8RKEH3blM7QlIYj46LtV/mTJ5F52rzaL3WymLUf11YFLiGwq9uRi9kkPj
         WEOg/fKMmx9sQGHBqdC+L0ZWyFMLjmqBJ+x9RXd+fHLpjre+Ff2l3XssBQqf6cserH/2
         WagueA+GRsvr9BtNn1f0d+elRaK4gk8zVOo9xIAlnRU9ngNNCsYt63oBky/5z6hFOQPJ
         2uvMcM9ouHJsfA1wKNATaGvZQYqyFIFbSKlkecuQpLkQop8HBJx+pzNeFdo+HWCY53/N
         M8FA==
X-Gm-Message-State: AOJu0YwO9YHN6sV6x5bXFpNhfZk/8LzxLfhX9rj5wHWV2lwehFb0dfy7
	ryiA3YgS+e9PuuaCNuJSh0jKh0g3IKGRSnWeeKuIjDZYE3dgYWiuTQZpudNfNIY=
X-Google-Smtp-Source: AGHT+IEc3GLRs7dJQIIceFqtjsa8+3aiiyeOKgbOgzs7/CBDk5W5gZ9cAD4fcuD99qlHYQb/dWAIrQ==
X-Received: by 2002:a05:620a:29d2:b0:795:5440:f872 with SMTP id af79cd13be357-797f60a6d49mr609755785a.28.1718291787271;
        Thu, 13 Jun 2024 08:16:27 -0700 (PDT)
Date: Thu, 13 Jun 2024 17:16:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for 4.19?] x86/Intel: unlock CPUID earlier for the BSP
Message-ID: <ZmsNSUmum8mRxkCs@macbook>
References: <82277592-ea96-47c8-a991-7afd97d7a7bc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <82277592-ea96-47c8-a991-7afd97d7a7bc@suse.com>

On Thu, Jun 13, 2024 at 10:19:30AM +0200, Jan Beulich wrote:
> Intel CPUs have a MSR bit to limit CPUID enumeration to leaf two. If
> this bit is set by the BIOS then CPUID evaluation does not work when
> data from any leaf greater than two is needed; early_cpu_init() in
> particular wants to collect leaf 7 data.
> 
> Cure this by unlocking CPUID right before evaluating anything which
> depends on the maximum CPUID leaf being greater than two.
> 
> Inspired by (and description cloned from) Linux commit 0c2f6d04619e
> ("x86/topology/intel: Unlock CPUID before evaluating anything").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> While I couldn't spot anything, it kind of feels as if I'm overlooking
> further places where we might be inspecting in particular leaf 7 yet
> earlier.
> 
> No Fixes: tag(s), as imo it would be too many that would want
> enumerating.
> 
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -336,7 +336,8 @@ void __init early_cpu_init(bool verbose)
>  
>  	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
>  	switch (c->x86_vendor) {
> -	case X86_VENDOR_INTEL:    actual_cpu = intel_cpu_dev;    break;
> +	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
> +				  actual_cpu = intel_cpu_dev;    break;
>  	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
>  	case X86_VENDOR_CENTAUR:  actual_cpu = centaur_cpu_dev;  break;
>  	case X86_VENDOR_SHANGHAI: actual_cpu = shanghai_cpu_dev; break;
> --- a/xen/arch/x86/cpu/cpu.h
> +++ b/xen/arch/x86/cpu/cpu.h
> @@ -24,3 +24,5 @@ void amd_init_lfence(struct cpuinfo_x86
>  void amd_init_ssbd(const struct cpuinfo_x86 *c);
>  void amd_init_spectral_chicken(void);
>  void detect_zen2_null_seg_behaviour(void);
> +
> +void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c);
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -303,10 +303,24 @@ static void __init noinline intel_init_l
>  		ctxt_switch_masking = intel_ctxt_switch_masking;
>  }
>  
> -static void cf_check early_init_intel(struct cpuinfo_x86 *c)
> +/* Unmask CPUID levels if masked. */
> +void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c)
>  {
> -	u64 misc_enable, disable;
> +	uint64_t misc_enable, disable;
> +
> +	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> +
> +	disable = misc_enable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID;
> +	if (disable) {
> +		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
> +		bootsym(trampoline_misc_enable_off) |= disable;
> +		c->cpuid_level = cpuid_eax(0);
> +		printk(KERN_INFO "revised cpuid level: %u\n", c->cpuid_level);
> +	}
> +}
>  
> +static void cf_check early_init_intel(struct cpuinfo_x86 *c)
> +{
>  	/* Netburst reports 64 bytes clflush size, but does IO in 128 bytes */
>  	if (c->x86 == 15 && c->x86_cache_alignment == 64)
>  		c->x86_cache_alignment = 128;
> @@ -315,16 +329,7 @@ static void cf_check early_init_intel(st
>  	    bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE)
>  		printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
>  
> -	/* Unmask CPUID levels and NX if masked: */
> -	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> -
> -	disable = misc_enable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID;
> -	if (disable) {
> -		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
> -		bootsym(trampoline_misc_enable_off) |= disable;
> -		printk(KERN_INFO "revised cpuid level: %d\n",
> -		       cpuid_eax(0));
> -	}
> +	intel_unlock_cpuid_leaves(c);

Do you really need to call intel_unlock_cpuid_leaves() here?

For the BSP it will be taken care in early_cpu_init(), and for the APs
MSR_IA32_MISC_ENABLE it will be set as part of the trampoline with the
disables from trampoline_misc_enable_off.

Thanks, Roger.

