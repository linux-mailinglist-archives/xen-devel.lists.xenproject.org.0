Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6C7CE72AA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 16:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194081.1512572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaEpE-0007KV-L2; Mon, 29 Dec 2025 15:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194081.1512572; Mon, 29 Dec 2025 15:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaEpE-0007Hq-Ha; Mon, 29 Dec 2025 15:06:24 +0000
Received: by outflank-mailman (input) for mailman id 1194081;
 Mon, 29 Dec 2025 15:06:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PeLl=7D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vaEpD-0007He-4d
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 15:06:23 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef44a2dc-e4c7-11f0-b15c-2bf370ae4941;
 Mon, 29 Dec 2025 16:06:21 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47d3ffa6720so33985455e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Dec 2025 07:06:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea22674sm64321599f8f.10.2025.12.29.07.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 07:06:20 -0800 (PST)
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
X-Inumbo-ID: ef44a2dc-e4c7-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767020781; x=1767625581; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ASk0IL4GdTMIFlqQWlB83En4Kn46atbuh9mB1I3mb0=;
        b=MOuEVaF2x9+I1MZ/nM2PTM1YCysu0axw+7xcbkFIgiqcF0pmQSskLUxv1Y2I5MwzGR
         d8PnSLb625tiaR1UyPxYEl41f0RKNt1TBjeYmPNkiQusMxw2UOidMJf8z8NbAzpcZJWG
         HaO3lwxXkeYKh/yyavsXH+sasEyHK8ov3Fb7AJ2nUc+UQOxqEcu7oDGS+LtYjKI4PJSt
         m3LhbItnvWJJ9vnsTYPwEExkvop9wRCV8Aj/ue7gljKnFwTsza7HmmpS1OmeBAtf4FQa
         mG4y7r0iUh+qMgzkOxexGX+kdJj0hVN9p6NYoYpY2FH2uoKH7Rz5GNusFgqV9BWyyarp
         ayOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767020781; x=1767625581;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ASk0IL4GdTMIFlqQWlB83En4Kn46atbuh9mB1I3mb0=;
        b=jVgrvAPRwGeCM/DoltpJlCM4oT65HaAkr0x7p6po4hMse0cH8q0VKYdxgAuaK21SYv
         Nqwo1MuW7MRvF7pdrSKCc3F/nHK7b5CsF+TqNBKtpGapbYmaRptpGPWNt0JQ6YzJjT1U
         v0Y7eZXToryYrzusafC9klkluQllzLY9xf+nh4O/HCqypMP5mGRLLwiDQEExvVUHYjXv
         h0mPoPWnTybgCVCPJysBppcSCRL1yY24I3drM09tmiGyDekFudwMeqoy54lSttSwHI/x
         XR9dCFBCif0GIxHjeGc2iZgjuvslYntpJUy1mx57gcDXgeqjsipa1Qc3+AZy4MOFocwd
         DmNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIeOF/eAdHQwTd9HhhA0oD6+0gI1qkzLfLMWlmXkWA/AmJveVEK3wRnjIeAokbUimF+cmt1HL3giM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9L40NoGLRmJRygJ88rhoO3TKVAYJ+7rlHnvQ8Bvq4HqFrrtKv
	XCl7vbackRBI9rOLyMDLe4H5czE2AXZekSEbKO8wjaLMzLnS8Rk6Gcg2K7KBrO+5UA==
X-Gm-Gg: AY/fxX6/hudKTEb/mQBpTmdprV1NXkcde5532DzN4mJKc3IFB1xen8HU+a47X577r0i
	i6nmDQE7eNkj/xDFUzitPrsuN7csMwUi8hwl7VyGhqeuUKDgJwOP6CE+AqRjKcCQi/4wo15b59K
	XvvJbQIlZoW5zBrNNThoM1IEnIPiVs8Nu0LbhkikBWCCtuiLTX5k0lQMdrw1Q88PJkqyAKDOx0B
	ta+lxvyVHBL6jVojWtvRqO8m+tkWbR5jhLomCzG3LS1c5PLsA65mz1tsrT0SkB5QHTSqSOg3Zsx
	CXjbZoWzt2csroZnOzBevwFMKxmHHP+hLhDJ+E3SbiacEsmzgQv+MfTEYFXw9EDEqEb/YiUOMBd
	9vJ7tTt7NlTDwP8Ey6FgYiFdaATvKHtENuLM+t67HD/nhvi4t82AWp+OP9VLI3zPTKI6a9QEM/k
	tnP1iE6sfDXZV/KGpL26DFdMXnP5bU2LugfpsUMPv7yRTE+9mFQK2qACzycCKPNdMlokAJH8OQV
	pM=
X-Google-Smtp-Source: AGHT+IG63OAcNeeFyN1juc0f8JCIZDRtzgIO66IUyWBTlizbr/0n8P4gF1n2/wxZgoikfzqL+fHkhA==
X-Received: by 2002:a05:600c:190f:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-47d195a72fbmr359283205e9.22.1767020780539;
        Mon, 29 Dec 2025 07:06:20 -0800 (PST)
Message-ID: <e77ddd04-3dfa-464c-9655-3cc853e1759e@suse.com>
Date: Mon, 29 Dec 2025 16:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766406895.git.oleksii.kurochko@gmail.com>
 <5d10efb00eebb35861135280dfee391d0c55cf0d.1766406895.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5d10efb00eebb35861135280dfee391d0c55cf0d.1766406895.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2025 17:37, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1057,3 +1057,188 @@ int map_regions_p2mt(struct domain *d,
>  
>      return rc;
>  }
> +
> +/*
> + * p2m_get_entry() should always return the correct order value, even if an
> + * entry is not present (i.e. the GFN is outside the range):
> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]    (1)
> + *
> + * This ensures that callers of p2m_get_entry() can determine what range of
> + * address space would be altered by a corresponding p2m_set_entry().
> + * Also, it would help to avoid costly page walks for GFNs outside range (1).
> + *
> + * Therefore, this function returns true for GFNs outside range (1), and in
> + * that case the corresponding level is returned via the level_out argument.
> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
> + * find the proper entry.
> + */
> +static bool check_outside_boundary(const struct p2m_domain *p2m, gfn_t gfn,
> +                                   gfn_t boundary, bool is_lower,
> +                                   unsigned int *level_out)
> +{
> +    unsigned int level = P2M_ROOT_LEVEL(p2m);
> +    bool ret = false;
> +
> +    ASSERT(p2m);
> +
> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
> +                  : gfn_x(gfn) > gfn_x(boundary) )
> +    {
> +        for ( ; level; level-- )
> +        {
> +            unsigned long mask = BIT(P2M_GFN_LEVEL_SHIFT(level), UL) - 1;
> +
> +            if ( is_lower ? (gfn_x(gfn) | mask) < gfn_x(boundary)
> +                          : (gfn_x(gfn) & ~mask) > gfn_x(boundary) )
> +                break;
> +        }
> +
> +        ret = true;

For this case ...

> +    }
> +
> +    if ( level_out )
> +        *level_out = level;

... this is correct, but of "ret" is still false it very likely isn't, and
arranging things this way may end up being confusing. Perhaps "level" should
be constrained to the if()'s scope? The caller cares about the value only
when the return value is true, after all.

Jan

