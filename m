Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B47483AE4F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 17:25:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671148.1044341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSg3h-00016c-PE; Wed, 24 Jan 2024 16:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671148.1044341; Wed, 24 Jan 2024 16:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSg3h-00014c-MR; Wed, 24 Jan 2024 16:25:01 +0000
Received: by outflank-mailman (input) for mailman id 671148;
 Wed, 24 Jan 2024 16:25:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zgc/=JC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rSg3f-00014W-Uu
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 16:24:59 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d51f4eb-bad5-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 17:24:57 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cf0390eddbso37265901fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 08:24:57 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 qa32-20020a17090786a000b00a26f1e3093asm45708ejc.49.2024.01.24.08.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 08:24:57 -0800 (PST)
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
X-Inumbo-ID: 1d51f4eb-bad5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706113497; x=1706718297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MMKz5CptMuNtGt+EBWiwk2MAAOeXuEqdjAeN7o3H6DU=;
        b=nlnwADHwfwUZP8mPwIMf9n/QWbWLvVMDruKtHCuSHWsqtM30L7cwIP+EwSbS+jGRfp
         hoJfFZrkNN3koAurG0rjTtSQB+svve5ebNioW3n5pOZATsuc0s51acYpuz+EJS4jxIgA
         ExbBpK2dJHu9b/9KZJe8RSTpWmkL7FxB4xeZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706113497; x=1706718297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MMKz5CptMuNtGt+EBWiwk2MAAOeXuEqdjAeN7o3H6DU=;
        b=xKeVRkqRCnK1WS0gGui3ByPKThilWbon4lSYGot7vVRUm2iuJNPzKXlmXW5Pq8NJ+b
         nnLawdQVxXu9AskHRpG/pQ7hkDORgf034NC1Bwguvik+KTHVviBS/LOLwwvC8SmWtho5
         /fVShdhvwArubVAalcMrJv69Fr89JYhXb/Q5d7zUDdxEOn42r53IHW2clksstSUwikF5
         J6sjlZpzbsLTxNN+ItKvZjxYpYJ/e0yp8fVqKkqucSF1RF0BUFIVc9NLQUs9BDJeFTlU
         y913ms0PzqGMWJH9PePRexQlHLv2+A4PlsvBgGnQM7n3922jQwJis4RBJAYNnwz9uCbv
         Q0OA==
X-Gm-Message-State: AOJu0YyjdslUMG6BFAqLZbV1Q5TJ25UDDfO0mfZxxpuqKX5R5lijGFzz
	g8lCiSvGH+LekPZh89rNSoQ0aOgYhyrGGA6uWAkK6NLrGqHJIyynphG/frjULiw=
X-Google-Smtp-Source: AGHT+IF0oOv4bZBenh47isSuOEjVw5uXj7fpSLUPsDfAitrqZfczle/PnveJSK6UtgV3WXHCuubjmA==
X-Received: by 2002:a05:6512:3ca8:b0:510:1620:939b with SMTP id h40-20020a0565123ca800b005101620939bmr523854lfv.0.1706113497343;
        Wed, 24 Jan 2024 08:24:57 -0800 (PST)
Message-ID: <e6dcf78b-bd68-49bc-8711-381befc25f02@citrix.com>
Date: Wed, 24 Jan 2024 16:24:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: amend 'n' debug-key output with SMI count
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <50978ef4-9f11-4c70-952b-94107616f265@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <50978ef4-9f11-4c70-952b-94107616f265@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/01/2024 3:27 pm, Jan Beulich wrote:
> ... if available only, of course.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -406,9 +406,15 @@ void __init early_cpu_init(bool verbose)
>  		paddr_bits -= (ebx >> 6) & 0x3f;
>  	}
>  
> -	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
> +	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))) {
> +		uint64_t smi_count;
> +
>  		park_offline_cpus = opt_mce;
>  
> +		if (!verbose && !rdmsr_safe(MSR_SMI_COUNT, smi_count))
> +			setup_force_cpu_cap(X86_FEATURE_SMI_COUNT);
> +	}
> +

I know you're re-using an existing condition, but I think it's more
likely that it's Intel-only than common to VIA and Shanghai.

Also, why is gated on verbose?

(I think I can see why this is rhetorical question, and I expect you can
guess what the feedback will be.)

>  	initialize_cpu_data(0);
>  }
>  
> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SY
>  XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
>  XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
>  XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
> -/* Bit 12 unused. */
> +XEN_CPUFEATURE(SMI_COUNT,         X86_SYNTH(12)) /* MSR_SMI_COUNT exists */
>  XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
>  XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
>  XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -28,6 +28,8 @@
>  #define  TEST_CTRL_SPLITLOCK_DETECT         (_AC(1, ULL) << 29)
>  #define  TEST_CTRL_SPLITLOCK_DISABLE        (_AC(1, ULL) << 31)
>  
> +#define MSR_SMI_COUNT                       0x00000034
> +
>  #define MSR_INTEL_CORE_THREAD_COUNT         0x00000035
>  #define  MSR_CTC_THREAD_MASK                0x0000ffff
>  #define  MSR_CTC_CORE_MASK                  _AC(0xffff0000, U)
> --- a/xen/arch/x86/nmi.c
> +++ b/xen/arch/x86/nmi.c
> @@ -589,9 +589,20 @@ static void cf_check do_nmi_stats(unsign
>      unsigned int cpu;
>      bool pend, mask;
>  
> -    printk("CPU\tNMI\n");
> +    printk("CPU\tNMI%s\n", boot_cpu_has(X86_FEATURE_SMI_COUNT) ? "\tSMI" : "");
>      for_each_online_cpu ( cpu )
> -        printk("%3u\t%3u\n", cpu, per_cpu(nmi_count, cpu));
> +    {
> +        printk("%3u\t%3u", cpu, per_cpu(nmi_count, cpu));
> +        if ( boot_cpu_has(X86_FEATURE_SMI_COUNT) )
> +        {
> +            unsigned int smi_count, dummy;
> +
> +            rdmsr(MSR_SMI_COUNT, smi_count, dummy);
> +            printk("\t%3u\n", smi_count);

This reads MSR_SMI_COUNT repeatedly on the same CPU.

You'll need to IPI all CPUs to dump the count into a per-cpu variable.

~Andrew

