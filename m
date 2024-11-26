Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF38E9D967E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 12:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843657.1259286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFu4d-0000N7-H8; Tue, 26 Nov 2024 11:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843657.1259286; Tue, 26 Nov 2024 11:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFu4d-0000Ld-E5; Tue, 26 Nov 2024 11:49:43 +0000
Received: by outflank-mailman (input) for mailman id 843657;
 Tue, 26 Nov 2024 11:49:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFu4b-0000LX-Fj
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 11:49:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8348177a-abec-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 12:49:37 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-434a7ee3d60so2070405e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 03:49:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad61b0sm13341133f8f.7.2024.11.26.03.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 03:49:36 -0800 (PST)
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
X-Inumbo-ID: 8348177a-abec-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmYiLCJoZWxvIjoibWFpbC13bTEteDMyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjgzNDgxNzdhLWFiZWMtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjIxNzc3Ljc2MTA3Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732621777; x=1733226577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FVQJXT1kS/A88u7MRUw6kjpIXlwjmEIfSnCST/LNQxk=;
        b=gft6HbrA1IpPv3+yN4vE/qOluK2xUd/rlnGyFvVqM25fkJ7FebMvbpafx7GuweLZXZ
         ATn1IRYjwQiJdU7H47dNH+qrBUiLNI/OYnl4W/CmO6sGMhZflQBFOnHuVz2HV6kwmbvb
         skJdWs/qgNrQ/bi8Ds8YJMn0126FVvy9TusA+SpS6Z29kvZR6AvJUhTCrD4/Ruo1bkUP
         cCSE6xqM+ByzD/6OsmefujZqg4eF0GFam+FqHtMWKTtfSYKPcBsLaYLd8Pu8+wJXAAxd
         P7b4PteyNkGEKd0VQUVuEkfRqYgHwNvo/0pjSeEQusBF5O+NmrihFMWOpeVsw1Z4cdMA
         D/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732621777; x=1733226577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVQJXT1kS/A88u7MRUw6kjpIXlwjmEIfSnCST/LNQxk=;
        b=ItPkZtyNyVDR3M1hIKDzs9IeNkAyNE2fcEEMLm3rvmi2223NdPa+i1SsQW1Qw6VWsz
         mJkWYbXZikNvQh7r/pXHB0rpzayB+LA5LfMbCBF6z4GXIUdjDR8nVML7yZs5oRM8ffrH
         WN84LZKGjIOnp4o4w+r/WGEMAeevok3Xv248NPhe7BFPde7mh/PJ8Zl3D6NYqo+3jLnL
         0Y7anzKW4kzbmckD2QCLpRI0MvQoCvWrxoT75ItA6lXNReltXHOXDp3206Y9a3DktBDa
         M7+/tPy1uIFmsLsVuxR+HVMLDpeGkcoLB1LCfkKWi7VxkIv9GoFtPBMFy/5Zhl2GIqFP
         Duew==
X-Gm-Message-State: AOJu0YyG5TCtR9TwWwPYsuZNwVjs9I8XjgzqjDQ9luRvHhFWfIb4pZWa
	br8P0YoTwW5wW/UHhzQNXCyC5A/sXgFpYjAFASY+azlol5FB/iDlNaQkzb5jCQ==
X-Gm-Gg: ASbGncu06nEolfQv6cs8R/NvzZPVzW3SiAu8ScE8sP6GefiZC1qKZ8hYBYCaUfPizVZ
	CaaWvAtKhkZfu7Q19rMziSJtLYyimk0DbCRQfDVXz7jt3XYh7L3buLpqEoYNwsHNCrtvctlZJm6
	H1K2bVTkDXtXRf7Xdwzt9gaSp4UlIO0ygk9ONpv2uKE+iCXYNjz8lbnC9w0iyXIJ3tLjynLjkGL
	Ul9mN47lKZXtvDIOL/1koipt7U/YDgkpZxbg8rt/tE49nR7ghMBm7TS0iPjbBhgtYWiSoQ9nMml
	LAa3fGBXMTR73FPhgYhwZb/Co3BHUGenhg4=
X-Google-Smtp-Source: AGHT+IF9qsyijDwgGeZyjKvINgM8DRAw9wVTLZ+7y0x9Sh4rym9OYWjj9W7v04NC6D7Nvumde/wgog==
X-Received: by 2002:a5d:64c2:0:b0:382:444f:4eb0 with SMTP id ffacd0b85a97d-385bfaf0d52mr2603374f8f.13.1732621776993;
        Tue, 26 Nov 2024 03:49:36 -0800 (PST)
Message-ID: <7f4f8f53-646e-4489-9fb8-1867a028dcc0@suse.com>
Date: Tue, 26 Nov 2024 12:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/vmx: Virtualize architectural LBRs
To: ngoc-tu.dinh@vates.tech
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
 <20241118084914.22268-5-ngoc-tu.dinh@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
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
In-Reply-To: <20241118084914.22268-5-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2024 09:49, ngoc-tu.dinh@vates.tech wrote:
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -788,6 +788,9 @@ static void __init calculate_hvm_max_policy(void)
>  
>          if ( !cpu_has_vmx_xsaves )
>              __clear_bit(X86_FEATURE_XSAVES, fs);
> +
> +        if ( !cpu_has_vmx_guest_lbr_ctl )
> +            __clear_bit(X86_FEATURE_ARCH_LBR, fs);

How will this be reflected onto leaf 1C? Patch 3 doesn't check this bit.
In fact I wonder whether patch 1 shouldn't introduce dependencies of all
leaf 1C bits upon this one bit (in tools/gen-cpuid.py).

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -423,65 +423,96 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>      return rc;
>  }
>  
> -static const struct lbr_info {
> +struct lbr_info {
>      u32 base, count;
> -} p4_lbr[] = {
> -    { MSR_P4_LER_FROM_LIP,          1 },
> -    { MSR_P4_LER_TO_LIP,            1 },
> -    { MSR_P4_LASTBRANCH_TOS,        1 },
> -    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
> -    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
> -    { 0, 0 }
> +    u64 initial;

uint64_t please in new code.

> +};
> +
> +static const struct lbr_info p4_lbr[] = {
> +    { MSR_P4_LER_FROM_LIP,          1, 0 },
> +    { MSR_P4_LER_TO_LIP,            1, 0 },
> +    { MSR_P4_LASTBRANCH_TOS,        1, 0 },
> +    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO, 0 },
> +    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO, 0 },
> +    { 0, 0, 0 }

If these adjustments are really needed, I'd wonder whether we wouldn't be
better of switching to C99 initializers instead.

> +static struct lbr_info __ro_after_init architectural_lbr[] = {
> +    { MSR_IA32_LASTINTFROMIP,        1, 0 },
> +    { MSR_IA32_LASTINTTOIP,          1, 0 },
> +    { MSR_IA32_LER_INFO,             1, 0 },
> +    /* to be updated by update_arch_lbr */

Nit: Comment style (start with a capital letter).

> +    { MSR_IA32_LASTBRANCH_0_INFO,    MAX_MSR_ARCH_LASTBRANCH_FROM_TO, 0 },
> +    { MSR_IA32_LASTBRANCH_0_FROM_IP, MAX_MSR_ARCH_LASTBRANCH_FROM_TO, 0 },
> +    { MSR_IA32_LASTBRANCH_0_TO_IP,   MAX_MSR_ARCH_LASTBRANCH_FROM_TO, 0 },
> +    { 0, 0, 0 }
> +};
> +static uint64_t __ro_after_init host_lbr_depth = 0;

No need for the initializer.

> +static void __init update_arch_lbr(void)
> +{
> +    struct lbr_info *lbr = architectural_lbr;
> +
> +    if ( boot_cpu_has(X86_FEATURE_ARCH_LBR) )
> +        rdmsrl(MSR_IA32_LASTBRANCH_DEPTH, host_lbr_depth);

Again you're reading an MSR here which was never written. Are you perhaps
assuming that the reset value is still in place?

> +    ASSERT((host_lbr_depth % 8) == 0 && (host_lbr_depth <= 64));
> +
> +    for ( ; lbr->count; lbr++ ) {
> +        if ( lbr->base == MSR_IA32_LASTBRANCH_0_INFO ||
> +             lbr->base == MSR_IA32_LASTBRANCH_0_FROM_IP ||
> +             lbr->base == MSR_IA32_LASTBRANCH_0_TO_IP )
> +            lbr->count = (u32)host_lbr_depth;

You don't want to use presently undefined bits here which may happen to
become defined on future hardware. IOW a cast is insufficient here.
(Comment applies to patch 2 as well.)

> @@ -3303,25 +3336,36 @@ static void __init ler_to_fixup_check(void)
>      }
>  }
>  
> -static int is_last_branch_msr(u32 ecx)
> +static const struct lbr_info * find_last_branch_msr(struct vcpu *v, u32 ecx)

Nit: Excess blank after the first *, and please take the opportunity to
switch to uint32_t.

>  {
> +    /*
> +     * Model-specific and architectural LBRs are mutually exclusive.
> +     * It's not necessary to check both lbr_info lists.
> +     */
>      const struct lbr_info *lbr = model_specific_lbr;
> +    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
>  
> -    if ( lbr == NULL )
> -        return 0;
> +    if ( lbr == NULL ) {
> +        if ( cp->feat.arch_lbr )
> +            lbr = architectural_lbr;

I'm inclined to think that this should be independent of lbr being NULL.
That would then also eliminate the style issue (with the placement of the
figure brace).

By the end of the patch / series, what I'm missing are context switch and
migration handling. You want to engage XSAVES to cover both (it being the
first XSS component we support, there'll be prereq work necessary, as I
think Andrew did already point out). Or did I overlook anything?

Jan

