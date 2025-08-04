Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2783B1A182
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 14:35:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069153.1432978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiuPD-0004vK-J2; Mon, 04 Aug 2025 12:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069153.1432978; Mon, 04 Aug 2025 12:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiuPD-0004tD-GF; Mon, 04 Aug 2025 12:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1069153;
 Mon, 04 Aug 2025 12:35:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uiuPC-0004t7-Dg
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 12:35:06 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72aa9bc7-712f-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 14:35:05 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-af66f444488so579656366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 05:35:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a243795sm727279666b.133.2025.08.04.05.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 05:35:04 -0700 (PDT)
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
X-Inumbo-ID: 72aa9bc7-712f-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754310904; x=1754915704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vFhG1S/5RjvlBUt76/bLDA0tsz6NYBSM5kuaOudpKWo=;
        b=J8iPqsvhuZWeOefpFBZtjUVGmi+j84lCgpM0I/rSUxfM8XggVXJZFuy82yR/o0JLvY
         nbKSqFj2SN45F1H/qDy4nLzeeOxrNCnUv/hTgvTZqThg2c4KSmHQvHHL2A4QD4EvnluE
         ze+ikODsCIwX/ZpaCGRys6QiaPB6TdsUiGTnuTKEz94a54vAfXh97H7773T5AnAHX7QW
         5vH8eW0XFA1Iaxhf+PHty1qw6kfQHRCkQ6cyHqjFIHlqg9ZoGZOD09T9t4INf2/uV4we
         KLT3yYfTeA77d+1+gbcLSNO1ea/9cepJwyrDZR4gr+g/t3KfUpIfBUOEbvCYZeN4j4qO
         BTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754310904; x=1754915704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFhG1S/5RjvlBUt76/bLDA0tsz6NYBSM5kuaOudpKWo=;
        b=pKzH5cUgTS2idugbHTLayV6zwcK2aua5hmd0CQUgdzEd3QS6WMABnKVE6D6lDeg+N8
         GOKoStJ7sRIGFcwoZPO8UmjyFp8Y3ABKIjVEWZsfgirAnFwwdfOT937V9iCkqkdGDmr+
         X8B2cmzJwfXXbW65Z7i/MeGGiEyBMsyXzvMP78tSStfP2aaaxKrPfIAC7uA1g0k3TULU
         /Xw8rlgYGlTiSl4BfKZ1iR//OG+iyN5TGmCJAgLuerkcxfICQ7inHN82kWcmn0xM8o4S
         OUOdIukmx5QykDkle+Zo0HNP1ssr+jNg0/qoMGm6jU3SS4Gb/gbefr8I4+miE/nCMP7f
         DZZg==
X-Forwarded-Encrypted: i=1; AJvYcCV1IzvijkGfW/K9H8KYgjNjcm6NIuE7embU4chFpLFjHNorTvZqtXYkbfNEydaL8kWT2AXXfEzKIh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTQkdGgOeGQqY/ieHcvWP/EhbXASdSvSWHSx5OefMert+giTJX
	6bD3Qvrduv360ZRpMOZguu2VpWc2ALEvDZeXc83YphaDIHYpJjoAOhW5iIskolegnA==
X-Gm-Gg: ASbGnctM3tRQJ6ba7iIrXc0b/b10LdyMvxoKQ4ObyjThfgyhlVJ7TF2MXt2s3NFIy/a
	L4x94DLcM3A0Vpf83SIfevPPHbtnaPW+pY0efCDcdMxWIkI2oRg7d5b+DcQVa3FX+s2uGK1m5W7
	X2Rdsz0BhJQDLCSrJ+FViz7xSf3jTLESqz60WivvrAw99WiG9Wk/XQzFOhORs8MDw4zyUNBX4S/
	738aSaSWnxYaq4/hvhFs9gRwsRzN+Uz/JS36RyyQMgGEZAX1u4IlhrUQSbhDiQCLQdO/nAAaa9T
	upqnjAEln3uROLBUV1N34ZimhOLMFnGfeioJkadvu65iySUOCSeB2YoRYGuwZslZBx8XUCAWHub
	j/PQxK6YTPSGUDyiQ6k1rhW7OiPbbsF1O31QyekZeKxpJ+qZMP0c1W8EmXeVA6D0eqf/mHnJVSO
	4flyDIw+OHRyq66HTqJw==
X-Google-Smtp-Source: AGHT+IFQws+/ozEyCpyAeo4+Pecr3MkSOuyyFaM3UHOQxACPKvQQFCNJfRAiBvdajyoloaRbWAy8tA==
X-Received: by 2002:a17:907:d78b:b0:aec:5a33:1549 with SMTP id a640c23a62f3a-af94018f2ffmr876699366b.40.1754310904373;
        Mon, 04 Aug 2025 05:35:04 -0700 (PDT)
Message-ID: <c0a0f5a4-7b58-43cd-82a7-7a6368070386@suse.com>
Date: Mon, 4 Aug 2025 14:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/25] xen/x86: complement PG_log_dirty wrapping
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
 <20250803094738.3625269-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20250803094738.3625269-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.08.2025 11:47, Penny Zheng wrote:
> We have PG_log_dirty flag to wrap codes about paging log-dirty support.
> The main entry is paging_domctl(),

Yet paging_domctl() serves other paging modes, too. In fact for the shim
PG_SH_forced is actually a mode that could plausibly come into use (even
if not by way of a toolstack requesting it). It was previously indicated
that it was wrong for SHADOW_PAGING to be forced off in shim-exclusive
mode. No patch ever surfaced, but that may want sorting before any new
boundaries are to be drawn. In fact, ...

> --- a/xen/arch/x86/include/asm/paging.h
> +++ b/xen/arch/x86/include/asm/paging.h
> @@ -55,7 +55,7 @@
>  #define PG_translate   0
>  #define PG_external    0
>  #endif
> -#if defined(CONFIG_HVM) || !defined(CONFIG_PV_SHIM_EXCLUSIVE)
> +#if defined(CONFIG_HVM)
>  /* Enable log dirty mode */
>  #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)

... the conditional here likely wants to become

#if defined(CONFIG_HVM) || defined(CONFIG_SHADOW_PAGING)

instead. This might actually be a far more isolated change then, still
moving you in the direction that you want (I think).

> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -189,6 +189,7 @@ out:
>      return rc;
>  }
>  
> +#if PG_log_dirty
>  /************************************************/
>  /*            HAP LOG DIRTY SUPPORT             */
>  /************************************************/
> @@ -254,6 +255,7 @@ static void cf_check hap_clean_dirty_bitmap(struct domain *d)
>      p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
>      guest_flush_tlb_mask(d, d->dirty_cpumask);
>  }
> +#endif /* PG_log_dirty */

Please also don't go overboard with #ifdef-ary: Files built for HVM=y
only don't need these, as HVM=y implies non-zero PG_log_dirty. But maybe,
with the other change that I outlined, you won't even need all of this
anymore.

Jan

