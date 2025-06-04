Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B7BACDC0E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 12:43:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005396.1384874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMlak-0008Eb-Q6; Wed, 04 Jun 2025 10:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005396.1384874; Wed, 04 Jun 2025 10:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMlak-0008DA-NC; Wed, 04 Jun 2025 10:43:30 +0000
Received: by outflank-mailman (input) for mailman id 1005396;
 Wed, 04 Jun 2025 10:43:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMlaj-0008D4-Rr
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 10:43:29 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdca830d-4130-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 12:43:24 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-602346b1997so11477760a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 03:43:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-605fab0272csm4751346a12.17.2025.06.04.03.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 03:43:23 -0700 (PDT)
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
X-Inumbo-ID: bdca830d-4130-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749033804; x=1749638604; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sCgXzljo2K/JIVDYKaT2wzXng1unvS3CANAtMI00h2w=;
        b=df43tUAnUzhZ5i/hmzPDRhsiSm/u0lrbLXkhbbDVw69CNVwTcqyIcz96YIgwsv2v06
         +VmeJeGKdW6LYQPiq3mkPOlsqhp4yt8dmW2vYqcqb8hww9mWrpVi8e0VGSIvjjedd0jl
         ZAUUe6ug0nuPM9g1j5VYLeJXxJkz4Rp8KxS8K71rMLV6k9/HhrbfKpDZ1xkMUBkoWjSp
         cL34tst8u1xhjgbw2mF1oZDHakhoLQoraaq8PUHqnUnKWin+PW5VR38ayavOxdAbFn+v
         NASye/l2bvgfo6Ttrm6VhWQG+pNX+WDhsLhG0aaerqCn5hUGNYkoL2lvhoVb/i7fg730
         Z9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749033804; x=1749638604;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCgXzljo2K/JIVDYKaT2wzXng1unvS3CANAtMI00h2w=;
        b=Lg/z2X3cBLK1/kdEIZl90xSS47o2jzIBdPOC3w/OurQghJpY2H4+/DT8F2VxoNIF8h
         rpWHNVvQAR+XwdJ+3ljBYg6ExQb0Y74WeEYp74JVE/s2jCaMOKFw7lCm+1UzcMI49XEX
         oGH7J+s7zl3k6B66AxeE9wmF7VVgzz+lKK0D3i8xQTVJO5aJZ8yLyFFhMerwHfXoth0P
         1TF7p/yMX+BXLTNkaQjY3qSYHCA1OdPOAAsxH/GNltz1lm7KstLfdopCyP8hp6qLeSXj
         JqqGqT60a9dQeisCCyKRBdpTZ9M3TNIeh3DDz5lUsyJWytg+cPLJ170SpqZgxaWF6NpO
         pOjw==
X-Forwarded-Encrypted: i=1; AJvYcCVH7kc2nMVUymovkCv/FRBGgcocPkrudIJ6ZmUSwel9e5nnccYGigZA8MVTAsY3XC3RsLFGF7uPNO0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgQjOK59EYuNatfJxp+90DO/w5C46Kar6lJrd7Y7uwKRtIgl4N
	C8okHGCDDC+ciz/MAIcyli3P/xNMyc6Hu9ExzrXUZHRLR2NzXqn4DWMrPszE6g36mA==
X-Gm-Gg: ASbGnctn6jBsU/LvGyXdm57G/XmzMX3XGOuisK4yPo9WNci56EuGGygxLlVIDkfRPQe
	G0rNDyioEzwFdG8poBJ3+soHTQSxruUCIM698BMfBI1Y+7yoMBkt1mWUntqBC3mJnqONPGS5x08
	eAlNwmfiKIA4J7SjYRSlxx0j889zcglJSXdIM4mbEhaGg5qQ+Xu/aENg9FgcSIs8/JAT6ZTCAX6
	W6JzWZf10fBIx6rljAzIX9bRNT4GsnAABc95QecJg5D30xt8Wci7lJAjR8D9qwrbYmVj8No656m
	5+gavSXjQJQQTv/u0T9L9b5TVwGXESWbSnw7SkTVVukzoip5YFxzSUzyuCFJsLb0ExG/mHyWHPx
	UHrPixEmwqjiNK2sUT8l4e/+Ns6U0gNsw+YmS
X-Google-Smtp-Source: AGHT+IFo3zceErhBG/yUTlPOz1TJtpZoZAvwh+Bi7j1y6aK/nAE3eubsf+hTI4biordwJhr/o86PGg==
X-Received: by 2002:a05:6402:27d0:b0:606:a99d:91d4 with SMTP id 4fb4d7f45d1cf-606ea16f586mr2465169a12.27.1749033804199;
        Wed, 04 Jun 2025 03:43:24 -0700 (PDT)
Message-ID: <b0970d27-ff9f-43ee-a7e4-b0aa24bf0916@suse.com>
Date: Wed, 4 Jun 2025 12:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] xen/domain: rewrite emulation_flags_ok()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250602191717.148361-1-dmukhin@ford.com>
 <20250602191717.148361-3-dmukhin@ford.com>
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
In-Reply-To: <20250602191717.148361-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 21:17, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Rewrite emulation_flags_ok() to simplify future modifications.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Changes since v4:
> - updated commentaries
> - added Teddy's R-b, kept Stefano's R-b
> ---
>  xen/arch/x86/domain.c | 91 ++++++++++++++++++++++++++++++++++---------
>  1 file changed, 73 insertions(+), 18 deletions(-)

Given this diffstat, I wonder what the other x86 maintainers think about
this.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -743,32 +743,87 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      return 0;
>  }
>  
> +/*
> + * Verify that the domain's emulation flags resolve to a supported configuration.
> + *
> + * This ensures we only allow a known, safe subset of emulation combinations
> + * (for both functionality and security). Arbitrary mixes are likely to cause
> + * errors (e.g., null pointer dereferences).
> + *
> + * NB: use the internal X86_EMU_XXX symbols, not the public XEN_X86_EMU_XXX
> + * symbols.
> + */
>  static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>  {
> +    enum {
> +        CAP_PV          = BIT(0, U),
> +        CAP_HVM         = BIT(1, U),
> +        CAP_HWDOM       = BIT(2, U),
> +        CAP_DOMU        = BIT(3, U),
> +    };
> +    static const struct {
> +        unsigned int caps;
> +        uint32_t min;
> +        uint32_t opt;
> +    } configs[] = {
> +#ifdef CONFIG_PV
> +        /* PV */
> +        {
> +            .caps   = CAP_PV | CAP_DOMU,
> +            .min    = 0,
> +            .opt    = 0,

Why the latter two initializers? Imo adding ones which say nothing else than
what's the default is only enlarging code without much real benefit.

> +        },
> +
> +        /* PV dom0 */
> +        {
> +            .caps   = CAP_PV | CAP_HWDOM,
> +            .min    = X86_EMU_PIT,
> +            .opt    = 0,
> +        },
> +#endif /* #ifdef CONFIG_PV */
> +
> +#ifdef CONFIG_HVM
> +        /* PVH dom0 */
> +        {
> +            .caps   = CAP_HVM | CAP_HWDOM,
> +            .min    = X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI,
> +            .opt    = 0,
> +        },
> +
> +        /* HVM domU */
> +        {
> +            .caps   = CAP_HVM | CAP_DOMU,
> +            .min    = X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ),
> +            /* HVM PIRQ feature is user-selectable. */
> +            .opt    = X86_EMU_USE_PIRQ,
> +        },
> +
> +        /* PVH domU */
> +        {
> +            .caps   = CAP_HVM | CAP_DOMU,
> +            .min    = X86_EMU_LAPIC,
> +            .opt    = 0,
> +        },
> +#endif /* #ifdef CONFIG_HVM */
> +    };
> +    unsigned int i, caps = is_hardware_domain(d) ? CAP_HWDOM : CAP_DOMU;
> +
> +    if ( is_pv_domain(d) )
> +        caps |= CAP_PV;
> +    else if ( is_hvm_domain(d) )
> +        caps |= CAP_HVM;

There's no 3rd case, so this could be expressed with plain "else", and hence
also with a conditional operator, and hence could also be right in the
initializer. How far to go with those transformations I'm not sure; personally
I'd go all the way, but I'd be okay-ish with just the first of the steps.

Jan

