Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC15C1FB58
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 12:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153494.1483815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEQVz-0003ic-TK; Thu, 30 Oct 2025 11:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153494.1483815; Thu, 30 Oct 2025 11:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEQVz-0003gV-Pi; Thu, 30 Oct 2025 11:08:23 +0000
Received: by outflank-mailman (input) for mailman id 1153494;
 Thu, 30 Oct 2025 11:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEQVy-0003gP-9V
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 11:08:22 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be03ae51-b580-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 12:08:19 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so9233865e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 04:08:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d3532sm32304362f8f.20.2025.10.30.04.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 04:08:18 -0700 (PDT)
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
X-Inumbo-ID: be03ae51-b580-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761822499; x=1762427299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KPVei3AC58lafOD+u4KMBRphnbJclXFl+81EB4IY++I=;
        b=gKZJqvV05+2/tzLBm1J6x6zPbNYXILmRO4e8nPKP8Y+jS4dkwfkjtqEGVOjnqANYwO
         P7OZTueobDCc0L40TNEj1sb3QC7DwMv6sRFXRzX5RhAJKvPhmCi+8DrZd2hj+Mxw0Rt9
         Lk9oX34WhFqGmb38Rxmd6kw44Gl6/CV6T7Teb1o8nAaRyVQ5TrZvMm/h3ylsBPGUc0fm
         Gq6ZKhLkRtU57VQyzOruwZNYG8J3jt04X8klasdhBMJ6Rf0ufxkgKHW0Y8YRJKYWMPz0
         7oz6Ywf//yOp5lcgQcAF04icYpi8DBe2GkP0JOYIxXmdAolhmF6Xnhw8EKUuGuWG6EwF
         VmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822499; x=1762427299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPVei3AC58lafOD+u4KMBRphnbJclXFl+81EB4IY++I=;
        b=A4tOkdWWbT//qigXsxeXdDby1d9vriHAFY1MN3RC5LYrpuj2XH8e+waH2s6WXHVoRG
         bS/U3Uw8+71HPxvI1n963Z2eKiUFPmhcmCDfsfcuPBBGWSi8MGUgZtV4dbTLW61ExWTI
         wVhdDgFOogAzbGRs5wIQgtY14bs4vRfrnRgmX5UkaZOfalXmv9oyLL6DXwDh0Rl0y0UH
         2Mzgi4BBETVjR5PB9e/CKwC2zLJdjTpgsZt6EnQ0CQN1gIyK5aGRupizOgK8SVmZPh2V
         KjamPFegrMhGlQslUKkIDlj1tUvDYWf5BTjadBF9GE+WUuYWyx9FtqyqD1k1UwfixRh8
         jw1A==
X-Forwarded-Encrypted: i=1; AJvYcCXpMRv5DVrYXoWC0Mh30ECbQVoCdl95hZgPYOqDJjk/GzNop4L1c8nluYjyqlMFobjcy/kyst9iOX8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzueXDyJzcVCs3J0bDT6fdFHFtns0OJ3aUrjEkHhonQ5pF1HCQX
	8mGgJ+EBtWzsat/UXphLVxyvAXfsrsYUQLsEG7LkTLx131Uz9si3jvt4DAvkz0iEIQ==
X-Gm-Gg: ASbGncsw6Ad5nX11tfp2f49H/Ij2QnsbBlTj6SXP5rIsA/0ieysUQ6GPLo4M2B/VfTR
	pC052wpHlGq/XOy8vjPmtEqoptMwcnPd3Pm0PYPIl6kJfwUEzquplE0PhKjdcgQJXmxiK9VfrFU
	vg0bVNbKEDD3TxODu6q+d2TEyBm1IY3sWeJ73hZNbB/4YMwKS4O/9sSdpGSDcS7RWJCP8e/7QFq
	BlBnNi9B/DdS0a3V0XKgfzQj9Lgn/V+a4bp40Yusj6QW2Wlgd1R17L9INM3TW3wBiQm0hdm6+g3
	RT9tYFz4fmhxNKGh9FFQur/FLEWKsl9u7a8PmQKYEX2I+EOTNulB6Rrp60W33Zfk8fsH1+ntmYg
	51R1FFXDlNwDQIoXiaxat95H2L8/PzhEsk5S9fr2MmOE+17+NMBzkG81BBS3G14g16lm8Q9YHNs
	g9k+KHqv+d2tdt2cHzXWJ+LBVFVthGHgGXkysZzZVj8sEtXOlKS1KIrBXOIaxLkgSFX3HTO4Q=
X-Google-Smtp-Source: AGHT+IHJSGnFXNW9+8W5pXnz7C6OMocJw9Y9PTH6rjCUYCi2bruqxJZ+iATCBFBv3FaLj2Yjwig9TA==
X-Received: by 2002:a05:6000:2c04:b0:427:7ad:cdac with SMTP id ffacd0b85a97d-429b4c89fc8mr2499763f8f.20.1761822498971;
        Thu, 30 Oct 2025 04:08:18 -0700 (PDT)
Message-ID: <308ecf14-e831-47f4-8c64-4005bb4dc857@suse.com>
Date: Thu, 30 Oct 2025 12:08:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 1/3] x86/hvm: move hvm_shadow_handle_cd() in vmx code
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
 <20251029235448.602380-2-grygorii_strashko@epam.com>
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
In-Reply-To: <20251029235448.602380-2-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2025 00:54, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Functions:
>  hvm_shadow_handle_cd()
>  hvm_set_uc_mode()
>  domain_exit_uc_mode()
> are used only by Intel VMX code, so move them in VMX code.

Nit: I think both in the title and here you mean "to" or "into".

> While here:
> - minor format change in domain_exit_uc_mode()
> - s/(0/1)/(false/true) for bool types
> 
> No functional changes.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

You did read Andrew's request to also move the involved structure field(s),
didn't you? Oh, wait - maybe that's going to be the subject of patch 3. While
often splitting steps helps, I'm not sure that's very useful here. You're
touching again immediately what you just have moved, all to reach a single
goal.

> @@ -1421,6 +1422,64 @@ static void cf_check vmx_set_segment_register(
>      vmx_vmcs_exit(v);
>  }
>  
> +/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
> +static bool domain_exit_uc_mode(struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +    struct vcpu *vs;
> +
> +    for_each_vcpu(d, vs)
> +    {
> +        if ( (vs == v) || !vs->is_initialised )
> +            continue;
> +        if ( (vs->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) ||
> +             mtrr_pat_not_equal(vs, v) )
> +            return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
> +{
> +    v->domain->arch.hvm.is_in_uc_mode = is_in_uc_mode;
> +    shadow_blow_tables_per_domain(v->domain);
> +}

Similarly I wonder whether this function wouldn't better change to taking
struct domain * right away. "v" itself is only ever used to get hold of
its domain. At the call sites this will then make obvious that this is a
domain-wide operation.

> +static void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
> +{
> +    if ( value & X86_CR0_CD )
> +    {
> +        /* Entering no fill cache mode. */
> +        spin_lock(&v->domain->arch.hvm.uc_lock);
> +        v->arch.hvm.cache_mode = NO_FILL_CACHE_MODE;
> +
> +        if ( !v->domain->arch.hvm.is_in_uc_mode )
> +        {
> +            domain_pause_nosync(v->domain);
> +
> +            /* Flush physical caches. */
> +            flush_all(FLUSH_CACHE_EVICT);
> +            hvm_set_uc_mode(v, true);
> +
> +            domain_unpause(v->domain);
> +        }
> +        spin_unlock(&v->domain->arch.hvm.uc_lock);
> +    }
> +    else if ( !(value & X86_CR0_CD) &&
> +              (v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
> +    {
> +        /* Exit from no fill cache mode. */
> +        spin_lock(&v->domain->arch.hvm.uc_lock);
> +        v->arch.hvm.cache_mode = NORMAL_CACHE_MODE;
> +
> +        if ( domain_exit_uc_mode(v) )
> +            hvm_set_uc_mode(v, false);
> +
> +        spin_unlock(&v->domain->arch.hvm.uc_lock);
> +    }
> +}

This function, in turn, could do with a local struct domain *d.

>  static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
>  {
>      if ( !paging_mode_hap(v->domain) ||

Why did you put the code above this function? It's solely a helper of
vmx_handle_cd(), so would imo best be placed immediately ahead of that one.

Bottom line: The change could go in as is, but imo it would be nice if it
was tidied some while moving.

Jan

