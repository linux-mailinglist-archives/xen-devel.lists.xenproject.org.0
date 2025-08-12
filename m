Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B472B2216D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 10:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078452.1439452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulkZH-00027w-5y; Tue, 12 Aug 2025 08:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078452.1439452; Tue, 12 Aug 2025 08:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulkZH-00025t-3L; Tue, 12 Aug 2025 08:41:15 +0000
Received: by outflank-mailman (input) for mailman id 1078452;
 Tue, 12 Aug 2025 08:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulkZF-000245-LQ
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 08:41:13 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19c37585-7758-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 10:41:12 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6182b3218aeso3401087a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 01:41:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8feaf2fsm19629216a12.38.2025.08.12.01.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 01:41:11 -0700 (PDT)
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
X-Inumbo-ID: 19c37585-7758-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754988072; x=1755592872; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6bHBrTtcsFNvDGEPfkFSlriiOrbe/T9oNttNa050lxM=;
        b=ULBh2blc8HhxyriSI+jUwNs47bJ5pOJRstU9mNODrZlYBLLDyOj6k8NbBN/p5WAQFh
         qUhocrtrXS20LECV1oNTxmnacdlaTGRDF2plrWdR3E+uRHb+tzOsjvNyWRQshU1TlhTx
         QDQdfZllXvAk7H908yzVc2wJxS5K3i72vWxZPu1MGEenNGlYrjXeBcD5fVQaDt5NV1RP
         EGHjVKn+L+pqnMsNQ3s9j6YZJggs4i/HH9osoP+4pKPvYikbUNAyN+Ps0uT6Zbx3pGja
         1uQq/3PZj/hk9onG229gDJgRsJw4Sx7waxdQAU21G0OQgctJ5JgSv90SQgWHpM0vKBZ3
         3FTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754988072; x=1755592872;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bHBrTtcsFNvDGEPfkFSlriiOrbe/T9oNttNa050lxM=;
        b=XNnsIoPrMOaujUJTFSKG8KajWk1c+McbqgTaNEKusRT0uS0wtqR4fKT+I4bibpNLPP
         ypBFCpzpojUevxlG8EaLfGEbpe0pPZW0dXk/EZKQ1oKwzDLWwMJdpp0iHVAoDIIqiIXn
         GQZClWAqlOHsD3TeNrRm2V4FX1rRoVl1569JyeWVnIpBmUqGU++R+517D/gi4bMMtIP5
         Cz2beymuVLv8saHHDejDF6iADQG+0KKpwnZTLxqcTN46/6nLhiHJr4ATpc+bHdKnQsNf
         QNiky2HDgtjorBYRclzih1itZlYE/NEQrwjwYx4Vz/o2GEBs/n0txbxkC/xzzExkvahs
         xOCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUo9NhZqNgwIKV8083en0lSbS/A5M6WHmjtvVrES5oWhy9+kgiyWk/SdDT0szIN9v3sT7ojVr08ZY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyvrwasDSjESKzeJO0K2WUxPo2djD3v4Iwn47JgI9xW6dMuqta
	pJm1p/ucrDqXM1R28I5fgH5SqHDAq1KHla4ADArNWf3RExGOMAwlZD+MhqkLtieOQMZsKApkUEj
	z/2w=
X-Gm-Gg: ASbGncuJ77y8Hy97QFfPUwKCW48ItZm/giehyUJ96q0kxjyY3QHGZT0BrqPRsERsPow
	jhDaX35SvBL9IybrGNIH+elF5Lpy4R1ERT3T8js8og10AT5oUY2+kUu/TXH2QrglmtMSOLIzpkp
	ghDIVYTfT5eQT/LANIAyPRIMTKQuCUpezQWWUPAPCJTNFsv0alwuKPnwwB9yUtr3kJGZqH9E1Zf
	YB9wS+fIQxcfWD7P73VY2mGTTrYVNEtZWf9LkZjNcsradErrDRBcbuXormv8ObxIRA9HTA0rfEx
	j4t4DgupN41iKJTQupwFNA4PF7VJm7/f36r2DGdKVeO386e4QCo35VUVQmVNvPAbW7Y6A2rIFm8
	sDGSY9PSlt+BuDBlBaVJO93IIxd1UMXo1LPOnEk1XXXZuPxn8SSpoldwyH59Y6W7pxhSFE1hasI
	ZiPNIZXPB0B0W8Byg0fm7u7aiwqhW8
X-Google-Smtp-Source: AGHT+IE+XH4cjk87nisW+DOKv62FY5GY7l5ZhtVOCCYVQTe83olwKiHRIq5gvm3Omg5T1Zl/BXzukw==
X-Received: by 2002:a05:6402:1510:b0:618:18e3:bd73 with SMTP id 4fb4d7f45d1cf-6184eb46d44mr1700559a12.15.1754988071689;
        Tue, 12 Aug 2025 01:41:11 -0700 (PDT)
Message-ID: <d6573487-14ed-4e1f-9525-b702048bb87e@suse.com>
Date: Tue, 12 Aug 2025 10:41:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/22] x86/traps: Introduce ap_early_traps_init() and set
 up exception handling earlier
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-9-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250808202314.1045968-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> --- a/xen/arch/x86/acpi/wakeup_prot.S
> +++ b/xen/arch/x86/acpi/wakeup_prot.S
> @@ -63,6 +63,9 @@ LABEL(s3_resume)
>          pushq   %rax
>          lretq
>  1:
> +        /* Set up early exceptions and CET before entering C properly. */
> +        call    ap_early_traps_init

But this is the BSP?

> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -327,12 +327,7 @@ void asmlinkage start_secondary(void)
>      struct cpu_info *info = get_cpu_info();
>      unsigned int cpu = smp_processor_id();
>  
> -    /* Critical region without IDT or TSS.  Any fault is deadly! */
> -
> -    set_current(idle_vcpu[cpu]);
> -    this_cpu(curr_vcpu) = idle_vcpu[cpu];
>      rdmsrl(MSR_EFER, this_cpu(efer));
> -    init_shadow_spec_ctrl_state(info);
>  
>      /*
>       * Just as during early bootstrap, it is convenient here to disable
> @@ -352,14 +347,6 @@ void asmlinkage start_secondary(void)
>       */
>      spin_debug_disable();
>  
> -    get_cpu_info()->use_pv_cr3 = false;
> -    get_cpu_info()->xen_cr3 = 0;
> -    get_cpu_info()->pv_cr3 = 0;
> -
> -    load_system_tables();
> -
> -    /* Full exception support from here on in. */
> -
>      if ( cpu_has_pks )
>          wrpkrs_and_cache(0); /* Must be before setting CR4.PKS */
>  
> @@ -1064,8 +1051,12 @@ static int cpu_smpboot_alloc(unsigned int cpu)
>              goto out;
>  
>      info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
> +    memset(info, 0, sizeof(*info));

Why do we suddenly need this? Or is this just out of an abundance of
caution (while making the individual ->*_cr3 writes unnecessary)?

> +    init_shadow_spec_ctrl_state(info);

May I suggest to move this further down a little, at least ...

>      info->processor_id = cpu;

... past here? Just in case other values in the struct may be needed
in the function at some point.

>      info->per_cpu_offset = __per_cpu_offset[cpu];
> +    info->current_vcpu = idle_vcpu[cpu];

To be able to spot this, I think it wants /* set_current() */ or some
such.

> +    per_cpu(curr_vcpu, cpu) = idle_vcpu[cpu];

It's a little odd to do this early (and remotely), but it looks all fine
with how the variable is currently used.

Jan

