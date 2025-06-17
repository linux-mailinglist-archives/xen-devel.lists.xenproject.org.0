Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C243ADC245
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 08:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017730.1394730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRPfq-000596-4c; Tue, 17 Jun 2025 06:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017730.1394730; Tue, 17 Jun 2025 06:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRPfq-00057Z-1D; Tue, 17 Jun 2025 06:19:58 +0000
Received: by outflank-mailman (input) for mailman id 1017730;
 Tue, 17 Jun 2025 06:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRPfn-00057K-So
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 06:19:55 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1521b23d-4b43-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 08:19:54 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so2993195f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 23:19:54 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f21a:fe:66b6:9dc3:86d6?
 (p200300cab711f21a00fe66b69dc386d6.dip0.t-ipconnect.de.
 [2003:ca:b711:f21a:fe:66b6:9dc3:86d6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4533fc6578csm95968035e9.19.2025.06.16.23.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 23:19:52 -0700 (PDT)
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
X-Inumbo-ID: 1521b23d-4b43-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750141193; x=1750745993; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ALRs4fmk1Q3nugPIiT3bDFR9S6UwtHGaAddsMOx48nQ=;
        b=LrprPPgOPAqFIDOROVNS8zqDGxIz7bbNbu6KwFF9vK9G9SLMAlolQuy1ExXAFqrxaq
         BcSyhpm6z63AStCtoL8ovTYnb9kNKLE60GSrQbgcUhCn5wDX+i0le+kdZ+P5lIWwDC2L
         uLgy9P8XR+fJ4DaN1+//AFaJo+BW5R0VzsyOiCgTcGaHA8xw4Gd9XwnYPyhJaYplPXp5
         KowB8L4uuNJuPkUSir3XhDA84Idk43E4Jt+rZ0IY2rhipp8FgvNWXJavpxNbE+p4xodi
         thGlyIqZofiwP63OvYCTqGa3dmhcbyS9jnBrVP/60Vsi2HxSdTkJMF89AYGBMJKvh0R4
         cKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750141193; x=1750745993;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALRs4fmk1Q3nugPIiT3bDFR9S6UwtHGaAddsMOx48nQ=;
        b=vZij7K/RZQES8jn+FuKblyrtTLe/KMj7tzBt65SCHMX3hQuk0L/bdTvCdOf8xq017Q
         pg4+XQ54GhVI45FgUkzhyoMIqRAl9R0IfB6BWScM+DlTBsdNtYke6kEVWjgHYXXkLial
         cB+AXWggZJA3qG4J402HxAzmn2/Z/Pyg3TVHBCsC8h7TbZm1fPfvMwae9eSQaZifEiN4
         4STa3gI9htTXmDTlTFDjdt0XAX6kAEvCPx/xBDQTMvOBQyWeTzIKpIQicTYpbwHLGjBK
         TUjoB/f294F6uq5hNRbk0vHjFb49xwA/C6XhFBsew1E6lakbNWMngrAYTxvd2Ucy2hE5
         Qwlg==
X-Forwarded-Encrypted: i=1; AJvYcCWn1PG8gtWmM+nDCJvUPauMHdw55gGIxyeBG3z8Beb5bEPyxQo5U/yzqyGtZALU31lAhg3FfX8kNyQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCowR5x+A1HjdHclzsJozmXf4yNOn4o5JZStw72eM1gBX6sGRX
	rIFaklAUBaxH9kdIosdnraNWvM4dEB9Z55Ujl3ButalGs+g0YBYzY3USYKxcw9T12A==
X-Gm-Gg: ASbGncsJlaYrwj1s8JzEj0ErCy5HbeiJs5zXZExtb0HfOGh1q6W6znDyc9as6R7lt5n
	LBQ1sQCCk99TjKo4v8mpK016cHlOiq+OHdJlMOFRQxmG1N4k2osXKLUlutFPTgcPaD01lVzcxp4
	8q+86F5A08Xi0eGPtaTmjMwWy+2CfP70PzxhTOkonVzXd0ptfH/iMtM/VfmW+Hzh0zexOjZZHvR
	cVBsIIjVy5+xQiDNsWpdhsrOv2x1/NzbUnE5WCc/PNBIALhrhmmsVK8T1l/09Gv328ONG3r6qEX
	GiUrjj44gFKIO04Uwd7jwekG4w8dQOBWSW87GcUjkQemCqZOHEkGpYZAivZhcJg78GqeXP3oOvu
	G1alpZcbS9xClRRhvhX7CGemsQc+FqZm2dy+RAJ1z2o9c2oZvfo29AeM+wtOq1U3RKK8KrHZ7pB
	GCZeNK7UI/5cGFLO8=
X-Google-Smtp-Source: AGHT+IFXBgUPGTuHt0KPiOAOpdj0QiXbrr9arIjTOHRbPSXK4lSbODGK04pKIFeGwWxuaPOPzcWcMw==
X-Received: by 2002:a05:6000:26ca:b0:3a5:2f23:3780 with SMTP id ffacd0b85a97d-3a5723a2dbamr9748671f8f.18.1750141193311;
        Mon, 16 Jun 2025 23:19:53 -0700 (PDT)
Message-ID: <a8471943-ebf3-4b45-80bd-51bff5498ed2@suse.com>
Date: Tue, 17 Jun 2025 08:19:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen/domain: rewrite emulation_flags_ok()
To: dmkhn@proton.me, roger.pau@citrix.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, sstabellini@kernel.org, teddy.astie@vates.tech,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250617011519.55386-1-dmukhin@ford.com>
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
In-Reply-To: <20250617011519.55386-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2025 03:15, dmkhn@proton.me wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -743,32 +743,75 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      return 0;
>  }
>  
> +/*
> + * Verify that the domain's emulation flags resolve to a supported configuration.
> + *
> + * This ensures we only allow a known, safe subset of emulation combinations
> + * (for both functionality and security). Arbitrary mixes are likely to cause
> + * errors (e.g. null pointer dereferences).
> + *
> + * NB: use the internal X86_EMU_XXX symbols, not the public XEN_X86_EMU_XXX
> + * symbols, to take build-time config options (e.g. CONFIG_HVM) into account
> + * for short-circuited emulations.
> + */
>  static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>  {
> +    enum domain_capability {
> +        CAP_PV          = BIT(0, U),
> +        CAP_HVM         = BIT(1, U),
> +        CAP_HWDOM       = BIT(2, U),
> +        CAP_DOMU        = BIT(3, U),
> +    };
> +    static const struct {
> +        enum domain_capability caps;
> +        uint32_t min;
> +        uint32_t opt;
> +    } configs[] = {
> +#ifdef CONFIG_PV
> +        /* PV dom0 and domU */
> +        {
> +            .caps   = CAP_PV | CAP_HWDOM | CAP_DOMU,

Just to double check - are we sure Misra / Eclair will like this (ab)use
of an enum?

Jan

