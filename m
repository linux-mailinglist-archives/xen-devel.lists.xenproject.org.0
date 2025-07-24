Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE6EB102DE
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 10:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055419.1423837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqzI-0000bM-D5; Thu, 24 Jul 2025 08:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055419.1423837; Thu, 24 Jul 2025 08:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqzI-0000YE-AU; Thu, 24 Jul 2025 08:07:36 +0000
Received: by outflank-mailman (input) for mailman id 1055419;
 Thu, 24 Jul 2025 08:07:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueqzG-0000Y7-IR
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 08:07:34 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b3b2f42-6865-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 10:07:24 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso616658f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 01:07:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054c599sm9923765e9.11.2025.07.24.01.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 01:07:23 -0700 (PDT)
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
X-Inumbo-ID: 3b3b2f42-6865-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753344444; x=1753949244; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o5EHt1fyhpT+4nnVIbBU0j8PdZPyNsYv1ZSwQsaetkc=;
        b=WKEvv0XFQFYLzvczbXTsZu+abWG6Kr3fyIrK3SZR7M+wvqpJqFi4AAgrLa7Dt4uHD0
         hDKa+CjiGiShAfy8TzFhSJ1uPhyWmIny+UpokY4BJ/xLzTN8XyaHzurqSzHO4LSuydQR
         0SslenoX8X5fbj7Gh9xsiinQXB2sAYhKOfhA0gdDC01dTybbWnZC0AlRy3XWmQgssNwK
         SLda40ibEEDHk0X9zzmtFOcIABMvmGroUKO8t1uFhQUezCqwErTbE62CHwTaNzDkikEQ
         QpkQalcQbidS06xp4SOx5LilGLCDM/Qzo3qyucrJqm0OacY+Oh5cBDS3kPWDBfsxHJCM
         XgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753344444; x=1753949244;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5EHt1fyhpT+4nnVIbBU0j8PdZPyNsYv1ZSwQsaetkc=;
        b=rlwYWPdeNmM8/jadw72/+N1BCp3/JLFVEOfE46zOw9T4HiD+WlrwED1L3/MV8re7FL
         rfa3sZzLHfxECCs9thZ30TD0Ntx7EmYS7++9bt3nFhA2t4ezDHHvgaDoEw1iV/Giz/rM
         o0bO+axJB4cfInJrG+Vm2QYx1OHTbGbhORoK9vquDfwUgCoSjeMJhIketBJ/WBfMPBNh
         TD/F+/TtX9TOJq4b091hLKNaPlVJvoMkFPtS4OGlvheq0ievKyOitLHAvT/efMKoZ8FH
         Z0BFVOWP9ZJZMRv6glMhdpOBdFQtBqhruCoU7e8Dba6THhtCR62XH6r4eB5WlQoWV+fL
         EBtg==
X-Forwarded-Encrypted: i=1; AJvYcCUc3W7k2bQ7ocQhCMwgvPYEls2oGv6etm+ci58XfDpxtAfMSGYJLrCqUmH5BX6sUmrTcLnUmpdiwOw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+t0HOJPBY9rL8JBGEw7ZRavOrZPq712Gb4O7wQyztgB+0h+0r
	O75cbXu9l7MpieLEqYFpd+mqL2FZhIWBUZ0u6ndGMTzEdbe2pqrbDCbs4u5QLfJqqw==
X-Gm-Gg: ASbGncv8pndEr88CCS9dcTrk3fz4MnXxdf8av9VEhEMLclZP2A1YDGFLb2mIioBmRpO
	YJyWRfEUrBip9gF3f+VTfINHnfJ6ESj4IAtPvh/IDe7FDzKFxcUSwRhb0kvwoHHWelO2vSO7hU3
	dpm771NKuv/K018T/gw1nl5/nibVq79Tp6tEOejIjpGzs5uhzjQnqT2fXJxouuhV6ovjjIFbXBg
	6nBkSETOhtazVTFRya2wfN+l79jzDoloMOWYEynV2SI9TBF446UoVKkW+pqmJjqAfYnqGfEzkCz
	2wjCi9m5MAQZ6tCxO5TXVQN8uJkY0AEGNdpcrZy78IfG0DxqLTGavgXlwo4iOB+8NTV9+teJ75W
	bm5NhqPSwoJASzd5DeKur4nX99mXvvPeM8u1ZamaIR+XIJdk9RbDGZmDZ7pcqzpS6vC6ZWcbG/b
	E74sR1bH+GVORMIkvscw==
X-Google-Smtp-Source: AGHT+IHNFi/+hHhaP4gayp2qS1hyORSDSZiL3p+VaW6zGcQYuho8zOQ9B5ca2rACa8aHKhOiRvovuQ==
X-Received: by 2002:a05:6000:4382:b0:3b7:5985:51f with SMTP id ffacd0b85a97d-3b768f060d3mr4979254f8f.44.1753344443734;
        Thu, 24 Jul 2025 01:07:23 -0700 (PDT)
Message-ID: <4004ecba-71c8-4b82-bd65-e1967da94352@suse.com>
Date: Thu, 24 Jul 2025 10:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen/arm: fix arm_iommu_map_page after f9f6b22abf1d
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250723181330.14305-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250723181330.14305-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 20:13, Stewart Hildebrand wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Up until f9f6b22abf1d "xen/arm: Map ITS doorbell register to IOMMU page
> tables" the only caller of iommu_map on ARM was grant_table.c which has
> a specific usage model and restrictions as described by the in-code
> comment in arm_iommu_map_page.
> 
> f9f6b22abf1d introduced a second caller to iommu_map on ARM:
> vgic_v3_its_init_virtual. This specific statement in the
> f9f6b22abf1d commit message is partially wrong:
> 
> "Note that the 1:1 check in arm_iommu_map_page remains for now, as
> virtual ITSes are currently only created for hwdom where the doorbell
> mapping is always 1:1."
> 
> Leading to crashes any time the hardware domain is not direct-mapped
> (e.g. cache coloring and non-Dom0 hardware domain):
> 
> (XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:47
> [...]
> (XEN) Xen call trace:
> (XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
> (XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
> (XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
> (XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
> (XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
> (XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
> (XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
> (XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
> (XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
> (XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
> (XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10
> 
> Specifically, non-1:1 hardware domain exists with cache coloring
> enabled. For that, is_domain_direct_mapped(d) is false but
> domain_use_host_layout(d) is true.
> 
> Change the is_domain_direct_mapped(d) checks in arm_iommu_map_page and
> arm_iommu_unmap_page into domain_use_host_layout(d) checks.
> 
> Move the in-code comment specific to the grant table to grant-table.c
> and adjust to be architecture-neutral.
> 
> Fixes: f9f6b22abf1d ("xen/arm: Map ITS doorbell register to IOMMU page tables")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v3->v4:
> * adjust comment to be architecture-neutral

Hmm, it's now arch-neutral, but still not quite correct.

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1274,6 +1274,11 @@ map_grant_ref(
>          }
>  
>          /*
> +         * Grant mappings can be used for DMA requests. The dev_bus_addr
> +         * returned by the hypercall is the MFN (not the GFN). For device
> +         * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
> +         * p2m to allow DMA request to work.
> +         *
>           * We're not translated, so we know that dfns and mfns are
>           * the same things, so the IOMMU entry is always 1-to-1.
>           */

The original comment, for a reason, talks about DFN, not GFN. The relationship
to P2M (where GFNs might indeed matter) also isn't quite clear to me:
iommu_legacy_map() alters IOMMU mappings. Which may or may not be shared with
CPU ones.

Fundamental question: What exactly is insufficient in the comment that's there
already?

Jan

