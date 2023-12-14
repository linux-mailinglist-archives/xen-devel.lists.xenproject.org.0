Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9643081352E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 16:48:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654665.1021816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDnwW-0002hQ-IV; Thu, 14 Dec 2023 15:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654665.1021816; Thu, 14 Dec 2023 15:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDnwW-0002fj-FP; Thu, 14 Dec 2023 15:48:08 +0000
Received: by outflank-mailman (input) for mailman id 654665;
 Thu, 14 Dec 2023 15:48:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDnwV-0002fd-0y
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 15:48:07 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ae01578-9a98-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 16:48:04 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a1f47f91fc0so1000893166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 07:48:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 tl18-20020a170907c31200b00a1da2c9b06asm9534582ejc.42.2023.12.14.07.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 07:48:03 -0800 (PST)
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
X-Inumbo-ID: 2ae01578-9a98-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702568884; x=1703173684; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3VZnS/XqbUIqSxZOPYZeTGzImphUl2TuDlrCaZ0Atk=;
        b=Pjwrc3oEjSTAp8amywq9dTyrmPPom5aJMuzSD8ub034cPectSdcpJTK6HYhUjPvxTn
         akLCLoTHY3TU61sGcjGJbQTsLrIKHMIxshY54P3blPH6sPmj9lqSmaqCraKNeuQ+aFJq
         NLP9iUAJn8Q1N1wO2Yn8QueUkOv+XSpO323qVCv2QHm0ea1HNgBMDkuIBpVKzAZMNeLy
         uHtmfae00JlU9EQzSJKpbCiIAThf27K8utYC4KrT97i57g99RrUuLYcSJG6zK7aWot5l
         n3Wbo+bZ2wEvIS7X7N2HUw+ld2bZ9pnooXXRJkvGFOJHuDMS13KwHpuLGSkI8ePvArBJ
         9ayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702568884; x=1703173684;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3VZnS/XqbUIqSxZOPYZeTGzImphUl2TuDlrCaZ0Atk=;
        b=BF3vXfcFxuwyOj6j4gZf+Zj+pQJvJ1WtJBzr3Kw44QIDJ8/L221xQj5zi0ZvhUA7+/
         8zHlnPQiA+yEVmy6GckSh/j62E3T4eicAVzoxTHGtbfH1uBCOn99cppOdewAl92xWcI4
         36+tMdQuESwUWc4be4vGZ1mFEZbD59+oAGuNzwlzopizEyfZ9UOGegVCEEnPpTubb7cH
         VwYiE16k/y67P747CQKjr56NwyEyurQws2Fz5LtF2XD/z83qXXxYiQTB8zgnmWl5GzPi
         /qGqsWHkT2dnX9bjZB7UAcRUTr+IG7xWL4kPEoUoEgcn5XYhk9kmJS8eIyxLS6VlCUNO
         4FbQ==
X-Gm-Message-State: AOJu0YxgWw0HMccwdmlL3nr7Os9yakw1eRd0TS2h0AUePVbB6arfkozU
	krWkdh52GF551/Y+tzEROW2D
X-Google-Smtp-Source: AGHT+IGE9sKpgW5hnKvRFTQJfA7VtOioYJStTE9Hc2YotSFBvK92RRKDs8OUJGQ/7T0CMr5XhOmT0w==
X-Received: by 2002:a17:906:184:b0:a19:a19b:55ce with SMTP id 4-20020a170906018400b00a19a19b55cemr5086234ejb.94.1702568883952;
        Thu, 14 Dec 2023 07:48:03 -0800 (PST)
Message-ID: <b2c42d56-6bc8-4ea8-9e6f-cae259c274c5@suse.com>
Date: Thu, 14 Dec 2023 16:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/39] xen/riscv: define an address of frame table
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <13ad41657814e4fc235772fa0928de1723ae7c3d.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <13ad41657814e4fc235772fa0928de1723ae7c3d.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Also the patchs adds some helpful macros.

In how far they're (going to be) helpful is hard to tell without uses
and without some suitable comments.

> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -77,12 +77,31 @@
>    name:
>  #endif
>  
> +#define VPN_BITS    (9)
> +#define OFFSET_BITS (12)

Whose offset? In how far is this different from PAGE_SHIFT?

>  #ifdef CONFIG_RISCV_64
> +
> +#define SLOTN_ENTRY_BITS        (HYP_PT_ROOT_LEVEL * VPN_BITS + OFFSET_BITS)
> +#define SLOTN(slot)             (_AT(vaddr_t,slot) << SLOTN_ENTRY_BITS)

Nit: Missing blank after comma.

> +#define SLOTN_ENTRY_SIZE        SLOTN(1)
> +
>  #define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 - GB(1)) */
> +
> +#define FRAMETABLE_VIRT_START   SLOTN(196)
> +#define FRAMETABLE_SIZE         GB(3)
> +#define FRAMETABLE_NR           (FRAMETABLE_SIZE / sizeof(*frame_table))
> +#define FRAMETABLE_VIRT_END     (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
> +
> +#define VMAP_VIRT_START         SLOTN(194)
> +#define VMAP_VIRT_SIZE          GB(1)

May I suggest that you keep these blocks sorted by slot number? Or wait,
the layout comment further up is also in decreasing order, so that's
fine here, but then can all of this please be moved next to the comment
actually providing the necessary context (thus eliminating the need for
new comments)? You'll then also notice that the generalization here
(keeping basically the same layout for e.g. SATP_MODE_SV48, just shifted
by 9 bits) isn't in line with the comment there.

> @@ -95,6 +114,8 @@
>  #define RV_STAGE1_MODE SATP_MODE_SV32
>  #endif
>  
> +#define HYP_PT_ROOT_LEVEL (CONFIG_PAGING_LEVELS - 1)

I understand that CONFIG_PAGING_LEVELS is defined only just up from here,
but what that identifier stands for is quite clear. It would seem to me
that moving this up ahead if its first use would help clarity.

Jan

