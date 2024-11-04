Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 269999BB00B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 10:44:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829902.1244823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7tc6-0007C6-5l; Mon, 04 Nov 2024 09:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829902.1244823; Mon, 04 Nov 2024 09:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7tc6-00078w-2z; Mon, 04 Nov 2024 09:43:10 +0000
Received: by outflank-mailman (input) for mailman id 829902;
 Mon, 04 Nov 2024 09:43:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t7tc4-00078q-T1
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 09:43:08 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fb2a2f5-9a91-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 10:43:03 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so30860835e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 01:43:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c1182732sm12710742f8f.111.2024.11.04.01.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 01:43:02 -0800 (PST)
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
X-Inumbo-ID: 2fb2a2f5-9a91-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJmYjJhMmY1LTlhOTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzEzMzgzLjUxMTY2OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730713383; x=1731318183; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mcpvzx3K5y6+iHArK8api36uDX7D0tLmWWdm6TTd6k0=;
        b=fU9dKNQ7msGllLVIbDXWSGo0UnTe68e0mCloxtsmw/AG9VmXNSTZOvbnSAvy0fEvbq
         cgx6ViZ+mYx2w5dIKuXWywAtMMVzWNM0iN+H7zXiF26bf0wNS8jIbHiwjLO2bAHcKE/R
         E6MOL0Ni/+2HHRb+jzTmejH/NPl/eU78j5vB00LxlLd0KjNcmzlVpXiXU8o7AiC2fa2X
         H7OC3OrdQPfJ3AJ6hboLAkhu3xGOIn555L3R61Bfk0CHsZnrLId7T96nEgjAwZCUwitn
         BhPn1pYBPTGx3F5HgPF3Rzchpr5fLNY2LG9t7CplPgHIxJwA+DYovr1oO+CnMEpkjrgO
         Vkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730713383; x=1731318183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mcpvzx3K5y6+iHArK8api36uDX7D0tLmWWdm6TTd6k0=;
        b=Tnu+74Pw1yNPC+Giwqc+c99B8VONM89T1RST/EMiO80U6Hx12AX+l2dX/BrLwVlGSf
         dQ3u7xNg4nFBobq1G7eNx7CBuGMhg9NejKFvu8ka6wi4b326jh0C6sppuEU1FAd70JZd
         orr7a3Dl5x7NX9PulED5YY172WKgC3xOF382hnLcfbe4JToEdQQjqiK3H/fvhMZU/OIn
         r8d6EOopohrosfw6+/Agqkz+RGgG99kZm5wRKfbcKTsAu3Ocswqf2+z7j8F+BDx1ILdK
         pmcw3BKB4jrtmWT+VDIaEZCWNEODVRSGD3LHAXE53vECCG/3mtfwdnQNnvd8mntymXte
         QXLw==
X-Forwarded-Encrypted: i=1; AJvYcCUwmm3Qer71cyIFdkQ/wyj0bXaPTWP+LCcP0+CF8SbHEGj1lRqUaM2kLZbZdpPTYuDXmlMkPdyuMkY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2fZAwgnllqHmWp/ar9Jvy3XA8dZeroW/bQeNlxTegdMXNZife
	ArCFR9J+A3HU8vWNEa83p2S7scUrvxpM5T6iewHK3q41sabr8mW89ypNvqieIQ==
X-Google-Smtp-Source: AGHT+IFDCHxSPc5BBWtwyX83TRu8MCmm6HeWGpnptfOei6lnARcpnRvdJaghV/3JkWHKj8yo2HctSw==
X-Received: by 2002:a05:600c:1d97:b0:431:5459:33c2 with SMTP id 5b1f17b1804b1-431bb99053bmr193047195e9.17.1730713382783;
        Mon, 04 Nov 2024 01:43:02 -0800 (PST)
Message-ID: <d4ba8ef9-b84f-4c9b-9b3c-2322b04d179d@suse.com>
Date: Mon, 4 Nov 2024 10:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/device-tree: Let DT reserve map entries
 overlap reserved-memory
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1727388925.git.sanastasio@raptorengineering.com>
 <302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.09.2024 00:24, Shawn Anastasio wrote:
> Commit 53dc37829c31 ("xen/arm: Add DT reserve map regions to
> bootinfo.reserved_mem") changes the way reserve map regions are tracked,
> and as a result broke bootfdt's ability to handle device trees in which
> the reserve map and the `reserved-memory` node contain the same entries
> as each other, as is the case on PPC when booted by skiboot.
> 
> Fix this behavior by moving the reserve map check to after the DT has
> been parsed and by explicitly allowing overlap with entries created by
> `reserved-memory` nodes.
> 
> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/common/device-tree/bootfdt.c  | 28 +++++++++++++++++++++++-----
>  xen/common/device-tree/bootinfo.c | 11 +++++++++--
>  xen/include/xen/bootfdt.h         |  3 ++-
>  3 files changed, 34 insertions(+), 8 deletions(-)

DT maintainers?

Jan

> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 911a630e7d..2a51ee44a3 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -177,7 +177,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>      {
>          device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
>          if ( mem == bootinfo_get_reserved_mem() &&
> -             check_reserved_regions_overlap(start, size) )
> +             check_reserved_regions_overlap(start, size, NULL) )
>              return -EINVAL;
>          /* Some DT may describe empty bank, ignore them */
>          if ( !size )
> @@ -590,14 +590,36 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>      if ( nr_rsvd < 0 )
>          panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
>  
> +    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
> +    if ( ret )
> +        panic("Early FDT parsing failed (%d)\n", ret);
> +
>      for ( i = 0; i < nr_rsvd; i++ )
>      {
> +        const struct membanks *overlap = NULL;
>          struct membank *bank;
>          paddr_t s, sz;
>  
>          if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
>              continue;
>  
> +        if ( check_reserved_regions_overlap(s, sz, &overlap) )
> +        {
> +            if ( overlap == bootinfo_get_reserved_mem() )
> +            {
> +                /*
> +                 * Some valid device trees, such as those generated by OpenPOWER
> +                 * skiboot firmware, expose all reserved memory regions in the
> +                 * FDT memory reservation block (here) AND in the
> +                 * reserved-memory node which has already been parsed. Thus, any
> +                 * overlaps in the mem_reserved banks should be ignored.
> +                 */
> +                 continue;
> +            }
> +            else
> +                panic("FDT reserve map overlapped with membanks/modules\n");
> +        }
> +
>          if ( reserved_mem->nr_banks < reserved_mem->max_banks )
>          {
>              bank = &reserved_mem->bank[reserved_mem->nr_banks];
> @@ -610,10 +632,6 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>              panic("Cannot allocate reserved memory bank\n");
>      }
>  
> -    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
> -    if ( ret )
> -        panic("Early FDT parsing failed (%d)\n", ret);
> -
>      /*
>       * On Arm64 setup_directmap_mappings() expects to be called with the lowest
>       * bank in memory first. There is no requirement that the DT will provide
> diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
> index f2e6a1145b..c1752bfdc8 100644
> --- a/xen/common/device-tree/bootinfo.c
> +++ b/xen/common/device-tree/bootinfo.c
> @@ -171,7 +171,8 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>   * existing reserved memory regions, otherwise false.
>   */
>  bool __init check_reserved_regions_overlap(paddr_t region_start,
> -                                           paddr_t region_size)
> +                                           paddr_t region_size,
> +                                           const struct membanks **out_overlapping_membanks)
>  {
>      const struct membanks *mem_banks[] = {
>          bootinfo_get_reserved_mem(),
> @@ -190,8 +191,14 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
>       * shared memory banks (when static shared memory feature is enabled)
>       */
>      for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
> +    {
>          if ( meminfo_overlap_check(mem_banks[i], region_start, region_size) )
> +        {
> +            if ( out_overlapping_membanks )
> +                *out_overlapping_membanks = mem_banks[i];
>              return true;
> +        }
> +    }
>  
>      /* Check if input region is overlapping with bootmodules */
>      if ( bootmodules_overlap_check(&bootinfo.modules,
> @@ -216,7 +223,7 @@ struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>          return NULL;
>      }
>  
> -    if ( check_reserved_regions_overlap(start, size) )
> +    if ( check_reserved_regions_overlap(start, size, NULL) )
>          return NULL;
>  
>      for ( i = 0 ; i < mods->nr_mods ; i++ )
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 16fa05f38f..03e1d5fde8 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -158,7 +158,8 @@ struct bootinfo {
>  extern struct bootinfo bootinfo;
>  
>  bool check_reserved_regions_overlap(paddr_t region_start,
> -                                    paddr_t region_size);
> +                                    paddr_t region_size,
> +                                    const struct membanks **out_overlapping_membanks);
>  
>  struct bootmodule *add_boot_module(bootmodule_kind kind,
>                                     paddr_t start, paddr_t size, bool domU);


