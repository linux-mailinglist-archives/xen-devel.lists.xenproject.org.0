Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD400A80D12
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 15:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942201.1341451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29S4-00076w-Tj; Tue, 08 Apr 2025 13:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942201.1341451; Tue, 08 Apr 2025 13:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29S4-00074t-R8; Tue, 08 Apr 2025 13:57:20 +0000
Received: by outflank-mailman (input) for mailman id 942201;
 Tue, 08 Apr 2025 13:57:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u29S4-00074n-2x
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 13:57:20 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62991418-1481-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 15:57:18 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-399749152b4so2984272f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 06:57:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020da49sm14748417f8f.80.2025.04.08.06.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 06:57:17 -0700 (PDT)
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
X-Inumbo-ID: 62991418-1481-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744120638; x=1744725438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UppzuXNwnuqs9mK395VeYclTyPX/U0dRoUiq/ZYVsSw=;
        b=Jyykgjb9Gg8O3DnC1MS8H3A+QZfnS1nr8YK+4LjnUIkDycIUsJprCzsOyk+CJusWpp
         Wpb8h5qLDRaAilIaF/5uDiMVOInTmcwjw0buTwYN5ntHa0HNuJOr3/+DCH9vkd9lc6j4
         yS05Q7tPRUuOurN8wUAinjwt9ANzYLjMDdS/GdKxnB56XKiZlf7sJKazSTKHIRikzGK7
         UpADJ0BTXfKwsXlrWxqtpOH1dcXAw+/XVPn7JlnEMdNHxJHn/kvv+6/d2WXcWfQ81q1X
         Bp3kDlhZBUWSwF1eDZ4kR4on4mdCip5Wf0GV8h5ScqFz+8RdYpr8YJtlA51t9CJq3J/F
         ujSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120638; x=1744725438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UppzuXNwnuqs9mK395VeYclTyPX/U0dRoUiq/ZYVsSw=;
        b=Kjinmht6nt9RGb4S0KAWDhqybMWPsM1Xad5IkPyi5J8vxGoOKZWJfFYBsr8PKBSuvN
         +B4ZoxoB5tjFAMJGaEo0ylB19XjJHx9rLc6CGpCOTtdyjgS3GNPUKk2caFVnQEo0af6H
         WF6jEsf9JXgRiA4nUU0A+qXoA6REu4C2sg8hHp8BA/kkWqPsnr6HwZX37I3tzZOea1Kj
         qwCy7GgwGGX5gLIWMB63miOnrhUX7lKsQPJOnMlsl4rcUjrWxIQklqnYvhYI307EGaRh
         LqPxEW8HLeCkVNVp655d+wdxHKbbzjVgJ5VGOpOiyY46OC3UxVrsE4oSZw3HNOK7YrDQ
         C+1w==
X-Forwarded-Encrypted: i=1; AJvYcCVzjF5WLHQAH/FZcO1lQl9ktYEAL1YSEaa83Ymr+KgoJQrQgITSSxtwnjLqUqoCK2G/urJnxOOrLcw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxI1zO3VdIldOeXyiKy6iFVepEpM+bVJ6ZBjudW4fk4c7bUKh9l
	lah9uLX3AnV7igMC2avLmU6lnLmrw/xHb42LzhsEHTC6FtjNJ9qhZP+OYEwbhg==
X-Gm-Gg: ASbGncstAgDbE7QUFCLxjwkQg8GQRnAfF6UpnWUFVIsLLquVdhK9ch/1pdPNTpm2rtf
	kvW0ssbhIx5JS9QRFH3b927d76EmK9jX5mbcWqJks6/hgkHyw3Xx1XIi5Qun4ETHYVMO8uhJ2a0
	nxy0hmoKvrG3hxm3CU74ryxS8+yfvr9xOw8ht1YbOnjRub9GeTcB1hcYnSgkdUNyyEBsYxnXb46
	SBUzdi4aDKa6+1zuVY0aoorlOGZFqByYyW4WrueuwrTMfBpNYziZ6a+kK5c+0svBGGCO6ucXXaK
	Ifj28tjIWJelFP6KCiSSqvWqSDaR8tOTvgjkPQRX6zC2rj/rZgH1r8QN4k2FDHSkFucRoP0bU+n
	VvVx9ortGfzO+c0RZGNsaL1W+GmnG3nWyx04qdPbE
X-Google-Smtp-Source: AGHT+IGW5Lui4oZhYcdGewEqmZbwPC/QJl2L/GgM8P6IWw161HFxhaUwGfYh/CRlZgfB1MozWFN1/A==
X-Received: by 2002:a05:6000:1a88:b0:391:47d8:de3a with SMTP id ffacd0b85a97d-39cba97f7d5mr12786626f8f.53.1744120638180;
        Tue, 08 Apr 2025 06:57:18 -0700 (PDT)
Message-ID: <16c73cae-2ac0-4811-97d3-b25c95ed5abc@suse.com>
Date: Tue, 8 Apr 2025 15:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
To: Roger Pau Monne <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250408093156.83277-1-roger.pau@citrix.com>
 <20250408093156.83277-3-roger.pau@citrix.com>
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
In-Reply-To: <20250408093156.83277-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 11:31, Roger Pau Monne wrote:
> When running on AMD hardware in HVM mode the guest linear address (GLA)
> will not be provided to hvm_emulate_one_mmio(), and instead is
> unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
> always report an error, as the fault GLA generated by the emulation of the
> access won't be ~0.

Which means subpage_mmio_write_accept() is flawed, too, on AMD (or more
generally whenever .gla_valid isn't set).

> Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
> when the guest is PV.

This narrows checking too much, imo. For VT-x we could continue to do so,
provided we pass e.g. npfec down into hvm_emulate_one_mmio(), i.e. make
the gla_valid flag visible there.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5187,7 +5187,12 @@ int cf_check mmio_ro_emulated_write(
>  
>      /* Only allow naturally-aligned stores at the original %cr2 address. */
>      if ( ((bytes | offset) & (bytes - 1)) || !bytes ||
> -         offset != mmio_ro_ctxt->cr2 )
> +         /*
> +          * HVM domains might not have a valid fault GLA in the context, as AMD
> +          * NPT faults don't report the faulting GLA.  It's also possible for
> +          * the fault to happen in non-paging modes.
> +          */
> +         (is_pv_domain(current->domain) && offset != mmio_ro_ctxt->cr2) )
>      {
>          gdprintk(XENLOG_WARNING, "bad access (cr2=%lx, addr=%lx, bytes=%u)\n",
>                  mmio_ro_ctxt->cr2, offset, bytes);

Is logging the supposed CR2 value useful then for cases where the GLA
isn't valid? I fear it might be more confusing than helpful.

Jan

