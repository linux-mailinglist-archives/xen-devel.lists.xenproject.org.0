Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BA8CF4A9F
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:26:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195620.1513549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnPL-000144-K8; Mon, 05 Jan 2026 16:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195620.1513549; Mon, 05 Jan 2026 16:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnPL-00011o-HT; Mon, 05 Jan 2026 16:26:15 +0000
Received: by outflank-mailman (input) for mailman id 1195620;
 Mon, 05 Jan 2026 16:26:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcnPK-00011h-2u
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:26:14 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ff4a40f-ea53-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 17:26:12 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47d3ffb0f44so561255e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 08:26:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6d45aa2fsm157096235e9.13.2026.01.05.08.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 08:26:11 -0800 (PST)
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
X-Inumbo-ID: 3ff4a40f-ea53-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767630372; x=1768235172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=edV0gUOR7nY9cH1pifz+KBx2Cfr0fY764GA/rtQ9ryg=;
        b=L9e9ATc8CZz+d0AqzUma7T7ynZKAVMpww6XNVZAKWaJ6BUcqoPo6Uh+C9uwcHtqhjh
         gsSNNmE41YIbQAtWRDOg7RJ8nGYtB4th8ZqTsktyBfa27m3UPGWsZVYVJrA8ClsU1gf2
         +cDkZfFN+kf2LIX6SpmNmV2i0GtBMmDi40aluapH626T24b80wbEQ+dr5yiAOMFsm0bO
         C99TX4XOeHe/pBZQDQ8A6zZOZ9MRyp7HnhR66Gu8m1q9WnvE1gu1aZHmfKuL3ExO4M+o
         Jf3IphriD/sJRxYb5nSFX7rf/W3Vio/i72jOCvjhiMCj7Zx1gojYrGPHfS5kcIVJ95Q4
         REgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767630372; x=1768235172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edV0gUOR7nY9cH1pifz+KBx2Cfr0fY764GA/rtQ9ryg=;
        b=ulIQt5krM+VDMKlyE01yIzWmCtBlcnvP2BJGCUfwTsG6fz9wemRZoHLqkmbivjIFVN
         XDKLnegpZVjYcjXsqRAsEC31UsT13KjObC3bQ7U28Jfrb1XVKRpj2V3fUn9++wA4Sfr8
         ewL6dhSv5K3Z8x24R8aUx4VVkJ/TpCdGPVKPDJsPQ1OBSyVJuz6oYhuZ8yAwooC2IeGg
         rREuQEE9mcfIDq6g4OyuJ4li5VSehUuq6H9n8Ew6MZFTyMAlG9G15sxZ6IXddUgE7YLG
         U+RLNl6xr98eviAg31iUBq3vlCzrDLipl3QvBeWWFlyHfTsfsX33MnJ8c7DveQwDjuW8
         0g0g==
X-Forwarded-Encrypted: i=1; AJvYcCVFnZITheHeWo6FNrcXEEGFECOK6tAM1DRXLsWD941Zs3N21diatHA7AfF+bWBi//TPtrafjIQcP34=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxI+Tn3qLYs9vfW3cAExuhDB61pxCh9FVHbtGmDHHSd7B4WFYXj
	LzVVvAHHDULQfvuz169BBp5ulf/upyarLQ6LOCLgi5yx+bgg2QD947uoGdPvoRXx9A==
X-Gm-Gg: AY/fxX7SDM+Tjlk2jLHpoXcpkiKx56TeSfCBYz46FcYs5qjyUACJdzir4bS+sCe8w5a
	UtrJyYOfgArWqWyBoR9q34fMAhzgLuDa8E3tResN5kp5YcLPrxsIaiqPV/zUyD6XVleLcXvaZua
	/aUm4IbfDrxZ1P29hQV2uOt840ePVpsyXneTDA6J/65PrtJGjoDBt8XbOAGkWWQoln58ky+zXnT
	ONEaHYO6L+2TbtZFfbTVjhsMSIgwl+Kr9VzfavjnU1mkvgCqDaNArK2gjOeWKvllV5z+L0pttF6
	VySgpMVXZFVjZ2Hn6Q3chfRsqcVZxkQ4zxYgqbwaF3erHe0pC4Hzhw1wT2Ot6scKecEMWBuNEyH
	5yqa1DZBRu3sniddoqY9toaTSzAT4+VF4FzHhLVu7AFKE+5nHARCTF+rA3M4917a/xc31bRVbNh
	3G/7CGzQHcY/Lzz+nkh90fau/8Ycf2kV6QA6yMqqeuHYYITHydk0/Vb29WzlPa6JOTd1rqs6w7w
	25/1Dw9VKerVg==
X-Google-Smtp-Source: AGHT+IHHa2n4VdrYc2IaW2mvpmc9IT7q+wFhO2fin3Ufa4JVXVUTo/OYtKAAr7iqkuvsn7zYXaoAoQ==
X-Received: by 2002:a05:600c:198b:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-47d1df12f84mr606872715e9.0.1767630371898;
        Mon, 05 Jan 2026 08:26:11 -0800 (PST)
Message-ID: <63a1aa58-f609-4bfe-b827-90c59e40a02d@suse.com>
Date: Mon, 5 Jan 2026 17:26:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1767108625.git.oleksii.kurochko@gmail.com>
 <d49e5b9555d4f04d569e20d9c9feb23b298c7ee1.1767108625.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d49e5b9555d4f04d569e20d9c9feb23b298c7ee1.1767108625.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.12.2025 16:50, Oleksii Kurochko wrote:
> Add support of virtual SBI base extension calls for RISC-V guests, delegating
> hardware-specific queries to the underlying SBI and handling version and
> firmware ID queries directly.
> 
> The changes include:
> 1. Define new SBI base extension function IDs (SBI_EXT_BASE_GET_MVENDORID,
>    SBI_EXT_BASE_GET_MARCHID, SBI_EXT_BASE_GET_MIMPID).
> 2. Introduce XEN_SBI_VER_MAJOR, XEN_SBI_VER_MINOR for imeplenataion of
>    SBI_EXT_BASE_GET_SPEC_VERSION.
> 4. Introduce SBI_XEN_IMPID to implement SBI_EXT_BASE_GET_IMP_ID.
> 5. Implement handling of SBI base extension functions, including version,
>    firmware ID, and machine-specific queries.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit with a question:

> --- /dev/null
> +++ b/xen/arch/riscv/vsbi/base-extension.c
> @@ -0,0 +1,82 @@
> +
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +#include <xen/version.h>
> +
> +#include <asm/processor.h>
> +#include <asm/sbi.h>
> +#include <asm/vsbi.h>
> +
> +/* Xen-controlled SBI version reported to guests */
> +#define XEN_SBI_VER_MAJOR 0
> +#define XEN_SBI_VER_MINOR 2

Is it clear from whatever spec it is that is ...

> +static int vsbi_base_ecall_handler(unsigned long eid, unsigned long fid,
> +                                   struct cpu_user_regs *regs)
> +{
> +    int ret = 0;
> +    struct sbiret sbi_ret;
> +
> +    ASSERT(eid == SBI_EXT_BASE);
> +
> +    switch ( fid )
> +    {
> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
> +        regs->a1 = MASK_INSR(XEN_SBI_VER_MAJOR, SBI_SPEC_VERSION_MAJOR_MASK) |
> +                   XEN_SBI_VER_MINOR;
> +        break;

... implied here (it's ..._SPEC_VERSION after all) under what conditions the
version would need bumping and what effects this would have on existing (e.g.
migrating-in) guests? Recall that ...

> +    case SBI_EXT_BASE_GET_IMP_ID:
> +        regs->a1 = SBI_XEN_IMPID;
> +        break;
> +
> +    case SBI_EXT_BASE_GET_IMP_VERSION:
> +        regs->a1 = (xen_major_version() << 16) | xen_minor_version();
> +        break;
> +
> +    case SBI_EXT_BASE_GET_MVENDORID:
> +    case SBI_EXT_BASE_GET_MARCHID:
> +    case SBI_EXT_BASE_GET_MIMPID:
> +        if ( is_hardware_domain(current->domain) )
> +        {
> +            sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
> +            ret = sbi_ret.error;
> +            regs->a1 = sbi_ret.value;
> +        }
> +        else
> +            /*
> +             * vSBI should present a consistent, virtualized view to guests.
> +             * In particular, DomU-visible data must remain stable across
> +             * migration and must not expose hardware-specific details.

... what is being said here applies to other sub-functions as well. IOW it
looks to me as if the version reported needs to be a per-guest property.

Jan

