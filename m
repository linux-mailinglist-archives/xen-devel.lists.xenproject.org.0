Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ADAA1D417
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877582.1287718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcM3G-0008I4-Ua; Mon, 27 Jan 2025 10:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877582.1287718; Mon, 27 Jan 2025 10:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcM3G-0008FS-RS; Mon, 27 Jan 2025 10:09:06 +0000
Received: by outflank-mailman (input) for mailman id 877582;
 Mon, 27 Jan 2025 10:09:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcM3G-0008FM-2r
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:09:06 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcbde66c-dc96-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 11:09:04 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so855112966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:09:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760ab26asm554650966b.111.2025.01.27.02.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 02:09:03 -0800 (PST)
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
X-Inumbo-ID: bcbde66c-dc96-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737972544; x=1738577344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ei6kV8GCrFpcOMgKNhaAoBHMAESFzzrlx3lF3NeC/CY=;
        b=fL6dBuHWk8o+ZNjNBrL67IUVIkrqnK3RgaTz1jVegoSuHzcCq9+rGLEY+FSHY70zkv
         7l3Ewk2dSHSs7i+gH9upG6sVC1jPTKU/AE4Vox9A72L0sIG9pwiaaod3waGzVgGmcIXx
         e4Qpp3RN+3YxlWeUwzjeMPUSmoABw/sY6e+/09LSGx+wO5LXC6jEzfC8j7yI2K+O2MpI
         eGXkKXjbg2RoRESRFRRxndEWa+IFT7kVUMGncnEXnrmzqaCGlSgH0DijzZh6miLNG0hq
         WfQcGt8kcVvw6pFSMlt7hA2fup+tKDdJR0YyZAoZo2Y61ffljteRIr0BQPP0DciC51kb
         qHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737972544; x=1738577344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ei6kV8GCrFpcOMgKNhaAoBHMAESFzzrlx3lF3NeC/CY=;
        b=rgpFXmwjEkaUVbO4+mLGTroDM6ku93pyrhpiOvi1DDIdMIwQmjb8pC3Xqoaj/ufcgC
         ySXya912dBlkHKhbj9gCXNhXGgfxhyd+lcIqPKJ32LZLMpX22MlUDGB3WXD01LdI960Z
         1zzSrBA/tbU3Vt1v6evexuvR5E8aAJFqatyQyNW+VTdRQk6W0EyUL4wF76LiJ7c7R0GH
         i9RyOcVDD0po+fxXtlmz+VkMA0zhSm9gzwOpq6D8bZ931Wczc7XeKTpqZGDkKFbm3xtG
         cSnCVBYVveauY/xqhOgJ97S/0RfSIWsIqhzD46PNxv86LkRCoiw0aP4EFrKHjV+tXgAa
         K+cw==
X-Forwarded-Encrypted: i=1; AJvYcCXzZfb6Z8OewfUV/+o4XB92/vyD0Ol1Cm3OmvQn4OBSxuycI5RgFmjqfGZ/KedrIgp0xkFslDN53qI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+DKmEZnxi0v/Vp7M6zzoPyN5wDvwGE28ck8FNVBvha50XoCVT
	0hVzITdkViKDgi1Ofq64BvNOXFTUHAKuPOmAu/TGVUxm4frvH3qBGfSPooD9qA==
X-Gm-Gg: ASbGncuSCQ7aHu0kLKbla4HqU3wdP7Wl/Lir6zj06bgmgfd7xhToftIlrJ8JM+eA/3E
	uO/FH8e/PVTsXuo0XxlWVlCDnMQ2/gMcYZxyVvgx3x3yQ/ByM0jaRsYdLkD3aFcQHROCsKNIE6l
	qHYWrLBY+lnlAAOfLrY7YeHBUxfTd2UR0htqCSvLSXKqboMjwJVxTjRZ9KzSeMm18/9x65PAWHl
	vpqhp/9w51uZS6OBoKgQ1WKISOtDcFyucsVzoB17zhB/lsEJncjeSKbwxrMC4NdxIePHb07lRSy
	v2fbgAgk7WLGZdcWReH0DJ0pRHkJGF0UQinELLstmu2bgCLFbUhQUMFIkYcRb61Oig==
X-Google-Smtp-Source: AGHT+IFAvxkwOkiLdl1MuXJxKTdGk9iaC2ZqMvxNmlOE3G/tr7LiSglopafw3E2Xyfc0YRUeKAb6TA==
X-Received: by 2002:a17:907:6ea4:b0:ab2:bffb:4b5c with SMTP id a640c23a62f3a-ab38b24bd9emr3492394666b.18.1737972543672;
        Mon, 27 Jan 2025 02:09:03 -0800 (PST)
Message-ID: <2bf6ef11-fb4e-40ef-b258-dd9314cba791@suse.com>
Date: Mon, 27 Jan 2025 11:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/riscv: update defintion of vmap_to_mfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
 <bf85f6987c2a2f3374ad47fc0bf1513d69372b1f.1737391102.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <bf85f6987c2a2f3374ad47fc0bf1513d69372b1f.1737391102.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.01.2025 17:54, Oleksii Kurochko wrote:
> vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA from
> either the direct map region or Xen's linkage region (XEN_VIRT_START).
> An assertion will occur if it is used with other regions, in particular for
> the VMAP region.
> 
> Since RISC-V lacks a hardware feature to request the MMU to translate a VA to
> a PA (as Arm does, for example), software page table walking (pt_walk()) is
> used for the VMAP region to obtain the PA.
> 
> Fixes: 7db8d2bd9b ("xen/riscv: add minimal stuff to mm.h to build full Xen")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -25,7 +25,7 @@ paddr_t pt_walk(vaddr_t va);
>  #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
>  #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
>  #define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
> -#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)(va)))
> +#define vmap_to_mfn(va)     maddr_to_mfn(pt_walk((vaddr_t)(va)))

With this being the first use of pt_walk(), I wonder whether the function might
better return mfn_t (and simply ignore the low 12 bits of Vthe incoming VA; see
my respective comment on the earlier patch). After all it is quite natural for
a page table walk to return a page frame number, not a physical address.

Jan

