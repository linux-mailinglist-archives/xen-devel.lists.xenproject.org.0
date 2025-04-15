Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB1CA89437
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 08:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952069.1347626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4aCT-0002CP-V1; Tue, 15 Apr 2025 06:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952069.1347626; Tue, 15 Apr 2025 06:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4aCT-0002Aw-SC; Tue, 15 Apr 2025 06:55:17 +0000
Received: by outflank-mailman (input) for mailman id 952069;
 Tue, 15 Apr 2025 06:55:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4aCR-0002An-U2
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 06:55:15 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 949241f8-19c6-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 08:55:13 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so5077700f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 23:55:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae97751fsm13077921f8f.41.2025.04.14.23.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 23:55:12 -0700 (PDT)
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
X-Inumbo-ID: 949241f8-19c6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744700113; x=1745304913; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gVd76tjTv5/XUW3W/5Md6xJyV/ZhfKtKIm9FZyTKt9g=;
        b=A8OFApkPqokrHdshWIjx2U6yHvL8DwIf6p2FPhevWHHeNN2TmFXvssVhIBmHdUUA/i
         V8tX47NPCMF13oNT/Tcd2WrLiP4twh6YWeT5aueHnmx4s16BcK7i3T14xQ4GrSoMWYBI
         jy4oKGHUQCfyzab8IXgwMxGzwEPNb5qun4We9CCmc+M8+rjwOdNQoThXZVCrDN7iZSIq
         25UxWLGXp4XPEAqMR90h75LdXwDze+AiOUM2GfObMiNSTXQxUFiCfGUJkGDPilpHahXH
         KeeJP7NxdeTGHiEkhhJrEgefynhpkpq6p4sv7SAU06ep9JStpSCA/Hgx9Z+Qow9Mh0D4
         oypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700113; x=1745304913;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVd76tjTv5/XUW3W/5Md6xJyV/ZhfKtKIm9FZyTKt9g=;
        b=d3QFo5RT/FkXh3zDVtl6Tt5b/PYjqRK/UtGMcjnc7StpRHGinIpMcULh7uUIcufrwH
         M6m2xWaAMWQ8c2Pi4Q61Y15yKTmNVe95Cq0RXCP+NqlFwO2R5VLrBgtbFEfqNa0G3xSY
         VH4PIg40gJgd5V/VXkH3clZArU4U0L9FiUAYkTjkK9oe1mNjhxRx9AIFDzmhwBSi1DdO
         Y+3i027QHaWtvVd6JZcXsU53PB8cZ4f5Fc4eAxofJwwGnGp/QQxglFfE9vSTuqMz7DE1
         uCwozXfyAHQfqcdOKiBZTsGYdhyeeJ6ePZ/zRTnVU1EBaO11Cky6aT6YAQOvwwa31xIX
         n75w==
X-Forwarded-Encrypted: i=1; AJvYcCX3WjHPt5uE+DW32z/9AwtzaulLWq8afFgQY74pfFQyZO5EFcieeiBoJeMfhfw7Nw9t/wI+RUwIb5Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhP9JVJb+Eqrfm2pDG3DR+9XU32/afkgvbYqd3YDQxqvD/khKR
	YL+a36yp55ewBBrdxN2wkxEinuIG5n7NKWlae6ryj8B5pWw5pPXTkJ3Cg1qT2g==
X-Gm-Gg: ASbGnctQHoqBJxgchiaoZNeF6JmcqVqh0C7NnzrLR0x0sheRjrHJ+9ts4ei4s65pmdy
	7nXeHPhlCmUp2e0XOB3C0073nrZ73GDcQiCwQ0GO9FozZ+uX6P1ukVzIYeTcSSVN5opuZcj7U0g
	IArewl/Xp+KorZA8woLbTNw+uJnglOaKBiZ6PInHarT8lQMKVnlPgw4cSr4tih77cElJq0JmX07
	Mh6M1bK383nLBrqZyLGDeOOv+S3vhy1YkPnBzrAbfUnxm8s+AP5RMgizCwKMAtQidlffDZy8ZMY
	Y3uvCTvd+IzEQdAqMorS07/x+XVuDbJpZwCoUuloNJBbT6xtP2OU9PO0vvMycVtv95lGtYj5Grg
	eSLaSgOC8jWO5fJgnysW6w39pGQ==
X-Google-Smtp-Source: AGHT+IGB+msyiasKsP6rPoLzITW40AtpkR9+FyARS3qGHU5XdM65GDzO6PiLjM2S55QaZjGC/SWHBg==
X-Received: by 2002:a5d:5f52:0:b0:39c:12ce:67d with SMTP id ffacd0b85a97d-39ea51d0fd7mr12234943f8f.9.1744700113107;
        Mon, 14 Apr 2025 23:55:13 -0700 (PDT)
Message-ID: <47fc3dad-3f7b-4a9b-89c1-99e79a048ad9@suse.com>
Date: Tue, 15 Apr 2025 08:55:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Enable early bootup of Armv8-R AArch32 systems
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 18:45, Ayan Kumar Halder wrote:
> Enable early booting of Armv8-R AArch32 based systems.
> 
> Added Luca's R-b in all the patches.
> Added Michal's R-b in patch 1 and 3.
> 
> Ayan Kumar Halder (3):
>   xen/arm: Move some of the functions to common file
>   xen/arm32: Create the same boot-time MPU regions as arm64
>   xen/arm32: mpu: Stubs to build MPU for arm32
> 
>  xen/arch/arm/arm32/Makefile              |   1 +
>  xen/arch/arm/arm32/mpu/Makefile          |   3 +
>  xen/arch/arm/arm32/mpu/head.S            | 104 +++++++++++++++++++++++
>  xen/arch/arm/arm32/mpu/p2m.c             |  19 +++++
>  xen/arch/arm/arm32/mpu/smpboot.c         |  26 ++++++
>  xen/arch/arm/arm64/mpu/head.S            |  78 +----------------
>  xen/arch/arm/include/asm/arm32/sysregs.h |  13 ++-
>  xen/arch/arm/include/asm/arm64/sysregs.h |  13 +++
>  xen/arch/arm/include/asm/cpregs.h        |   2 +
>  xen/arch/arm/include/asm/mm.h            |   9 +-
>  xen/arch/arm/include/asm/mmu/mm.h        |   7 ++
>  xen/arch/arm/include/asm/mpu/cpregs.h    |  32 +++++++
>  xen/arch/arm/include/asm/mpu/mm.h        |   5 ++
>  xen/arch/arm/include/asm/mpu/regions.inc |  79 +++++++++++++++++
>  xen/arch/arm/mpu/Makefile                |   1 +
>  xen/arch/arm/mpu/domain_page.c           |  45 ++++++++++
>  16 files changed, 350 insertions(+), 87 deletions(-)
>  create mode 100644 xen/arch/arm/arm32/mpu/Makefile
>  create mode 100644 xen/arch/arm/arm32/mpu/head.S
>  create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
>  create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
>  create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
>  create mode 100644 xen/arch/arm/include/asm/mpu/regions.inc
>  create mode 100644 xen/arch/arm/mpu/domain_page.c

Even if we have files of this name elsewhere, it would imo be nice if new ones
still used dash(es) instead of underscore(s) in their names.

Jan

