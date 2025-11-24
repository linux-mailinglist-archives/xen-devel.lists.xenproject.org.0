Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E865C81231
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:49:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171230.1496247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXsa-000260-Kn; Mon, 24 Nov 2025 14:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171230.1496247; Mon, 24 Nov 2025 14:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXsa-00023e-I7; Mon, 24 Nov 2025 14:49:24 +0000
Received: by outflank-mailman (input) for mailman id 1171230;
 Mon, 24 Nov 2025 14:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNXsZ-00023Y-2H
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:49:23 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2fe4d6e-c944-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 15:49:21 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47755de027eso23251935e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 06:49:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf36f535sm204499595e9.8.2025.11.24.06.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 06:49:20 -0800 (PST)
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
X-Inumbo-ID: c2fe4d6e-c944-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763995761; x=1764600561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gWfNSzqAC8AW/7s6q88tAPramR0SZ5gZ2E2soGsmlcI=;
        b=MWmK4vbeVbIcZ1W5zmPpd/AsTGLePgeMbrx8nV6k/xw8ZTnm5vPubRjtpSpo6JYf9s
         lnohgkTsyQUYFHOSWxo1BBk44wvuiGPP/JYz0lgfDM9cMMbntLkryyc2vZI7isX4TN/O
         OYdked+xsZOzuFXyxR+pBJYJGsWNwVhNs47IiOtJhW0X3xrZmf5Fo+7FSnB/JRExB3FC
         eBAQYHHJrvJLY1YlHUoCR6fMNNHpIBP+Mf5sm4eIrKv6lyq+ltG9QhlZpVrukxc7GThN
         IcH8S4I8eOyzLc4qhJyuI5DSTsdz8tiU5ZpF/b51r1hlY2pjqZdMZUssbeDRWxfLnoQB
         7ISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763995761; x=1764600561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWfNSzqAC8AW/7s6q88tAPramR0SZ5gZ2E2soGsmlcI=;
        b=becbQEAzA5cO8QPVMdKDpKgE9dsDZGB160hCG5iK4sRrmfoljE8t8ZEn0jrav8QK4r
         8qlfb3u7nZHWASpYpCw1+21gzMbAx9PncStr6tTQ545avdMUMvE/xotyoixU12qwcdGc
         fH6FLWc/35WhYhtYyHhGPs4C/y8ahozo+Qu1esM0IkXQDZ+YG0yF4/5kTExyLd9ext4O
         gf7ft7/YT8lpMgivhIozeT5wlrX2Ga+9z3Tiesbrd0Z3LsKtUB4N7g51Sp5gJNzskZIQ
         WWS4XXLtgyrDayhMkGpjwEW59nLly7UTh+w7Typ1NRGTuimPuHoTU5miBtYPJcdpbArz
         9IHw==
X-Forwarded-Encrypted: i=1; AJvYcCXCcmKPqnAagwCmLhBhitLusI83DjycirFNBlxxDKEluepb/a/uszeBQF6ZrJsRuKna1fNT/I8wgxg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5r5c4Edh/Mc7DVet7dQzzPkEDD684Apaathy6cR9Xf40G93CN
	9bAnCBZedgovZ9ad70/OzOLIw09o3QmV298dD4fV82g7AqokFTfV2tT0XQO8Ce6N9g==
X-Gm-Gg: ASbGncv3elcmUHjLdxaztivSZzgaeoJCOJIdATsN3ndmP1G9IpewkjY2xevx6ioDJzc
	nOyy914tlnHY689lHiwgpFB4QIEZoQfrREJE+8j4o/cae199iHQx99wFeEc7WSLq17MG/73jEzt
	F/GY2VgrHGbHk79XEfmR4oz9KQYTSdWf7dp8kJ+hNx3MrR/wfefCtWP4h2FjWh5ePcDCCPg7vxt
	sBMlGQrHH74YvbPBf7EljyXZgFm/uXGa01VNdpzPG4I9DelvJiUv2xxNEN8N8Myjn2UutiSwjr2
	nkpy7r5MQftPFnJNa8++cZjiHg8nHsWga9TuofwvwQ2PeKwNIIzhYAOkHcJap7+LMQz3vfAxgK/
	9bc4BHSZXlHTRevnozoWtZ6viGS8n/q0uo5XvK1EWpSmYvyEWTBrhIq2oR5uHTbmMvsK8I4cHmL
	x3F7SfeY4ABW5NEqOA7I+7qf66K3o9+WY1RDQBZ6T/ZS1tVWGERb+j6V+PSxpb+U4SFIvkLvIgK
	mw=
X-Google-Smtp-Source: AGHT+IGUEHJyV0JJ1ycLi+AVBRsLG1B+9VliEZlZuw9CsWjgHBP6cRCMJ1KXfkgo+Vw9MXUobnrH/A==
X-Received: by 2002:a05:600c:1c24:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-477c01be2b2mr162215925e9.16.1763995760876;
        Mon, 24 Nov 2025 06:49:20 -0800 (PST)
Message-ID: <8581c3ce-e0f7-41e5-aee7-cf607f8f338d@suse.com>
Date: Mon, 24 Nov 2025 15:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vhpet: Fix sanitization of legacy IRQ route
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251124134344.456-1-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20251124134344.456-1-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 14:43, Tu Dinh wrote:
> When setting a timer's config register, timer_sanitize_int_route will
> always reset the IRQ route value to what's valid corresponding to the
> !HPET_CFG_LEGACY case. This is applied even if the HPET is set to
> HPET_CFG_LEGACY.
> 
> When some operating systems (e.g. Windows) try to write to a timer
> config, they will verify and rewrite the register if the values don't
> match what they expect. This causes an unnecessary write to HPET_Tn_CFG.
> 
> Note, the HPET specification states that for the Tn_INT_ROUTE_CNF field:
> 
> "If the value is not supported by this prarticular timer, then the value
> read back will not match what is written. [...] If the LegacyReplacement
> Route bit is set, then Timers 0 and 1 will have a different routing, and
> this bit field has no effect for those two timers."
> 
> Therefore, Xen should not reset timer_int_route if legacy mode is
> enabled, regardless of what's in there.

Fixes: ec40d3fe2147 ("x86/vhpet: check that the set interrupt route is valid")
(I think)

> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
> ---
>  xen/arch/x86/hvm/hpet.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> --- a/xen/arch/x86/hvm/hpet.c
> +++ b/xen/arch/x86/hvm/hpet.c
> @@ -48,6 +48,8 @@
>  #define timer_is_32bit(h, n)     (timer_config(h, n) & HPET_TN_32BIT)
>  #define hpet_enabled(h)          ((h)->hpet.config & HPET_CFG_ENABLE)
>  #define timer_level(h, n)        (timer_config(h, n) & HPET_TN_LEVEL)
> +#define timer_is_legacy(h, n) \
> +    (((n) <= 1) && ((h)->hpet.config & HPET_CFG_LEGACY))
>  
>  #define timer_int_route(h, n)    MASK_EXTR(timer_config(h, n), HPET_TN_ROUTE)
>  
> @@ -244,7 +246,7 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
>           (timer_level(h, tn) && test_bit(tn, &h->hpet.isr)) )
>          return;
>  
> -    if ( !timer_int_route_valid(h, tn) )
> +    if ( !timer_is_legacy(h, tn) && !timer_int_route_valid(h, tn) )

Seeing this and the other use together with timer_int_route_valid(),
wouldn't timer_int_route_valid() better itself invoke the new macro?

> @@ -379,6 +381,9 @@ static int cf_check hpet_write(
>          h->hpet.config = hpet_fixup_reg(new_val, old_val,
>                                          HPET_CFG_ENABLE | HPET_CFG_LEGACY);
>  
> +        for ( i = 0; i < HPET_TIMER_NUM; i++ )
> +            timer_sanitize_int_route(h, i);

Strictly speaking this is needed only when HPET_CFG_LEGACY went from
1 to 0. Plus it's needed only on the first 2 channels, as it's only
there where timer_sanitize_int_route() changes behavior. I'm not going
to insist to limit it like this, but if you don't, then I'd like to ask
for a comment here clarifying that excess work is done for simplicity's
sake.

Jan

