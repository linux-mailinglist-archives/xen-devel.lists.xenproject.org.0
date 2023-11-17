Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A837EF235
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635099.990848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xal-0003bC-Hx; Fri, 17 Nov 2023 12:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635099.990848; Fri, 17 Nov 2023 12:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3xal-0003Xr-F2; Fri, 17 Nov 2023 12:04:59 +0000
Received: by outflank-mailman (input) for mailman id 635099;
 Fri, 17 Nov 2023 12:04:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3xaj-0003Xj-Rk
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:04:57 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 863fb1d0-8541-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 13:04:56 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so15538015e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:04:56 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c429500b0040a4cc876e0sm2447375wmc.40.2023.11.17.04.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:04:55 -0800 (PST)
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
X-Inumbo-ID: 863fb1d0-8541-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700222696; x=1700827496; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dLFzUW6/wb0srpQqKWk54q2GmVgvGwjkRl4RtOKuHn0=;
        b=hU7DNS+4lyDrL+78wv+6DB5uBMkQnDpegciA4cxzV9DvPMPgYpbZXqrOUY7+hUtE+M
         oqlhX84b98inFCpw25e7ntLfHEYut3QAnICN8KxU9xqZYUMFCizkIXK+BL1xz8ajVHPU
         9xGhi2pvPu4kpd7jXbxnjIcAerTldDfoIdPD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700222696; x=1700827496;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLFzUW6/wb0srpQqKWk54q2GmVgvGwjkRl4RtOKuHn0=;
        b=hX9+NKbV/ewbD8tpT0oqvCD0XUJA8aClPbuXVuMtv+r14nMDuIB4OQt5Z6d79zkp7b
         cdVJh8k44TW0UiipUJpYa4IxnN68XmJTC3MH/d9SRzsdV+4obSF5+Ej8trwBtHiQF/0I
         aOfW5uGaJVrjy/nigb/G3Rh06vGeFVE4xkIapPtQIh9CZ0dDbsfw0cUfTWFE/uroaDP7
         eQQTyzZpjHCmEtO0L0TyagKtmAETfnFhRj4d1923M6YfthHYwp+YlcgQmwAMFB55fATS
         UybubmrmzCggUSEt9t9RconnGUuM7qTSljMD2k/1YvV42DwsRPuz5XaqvS/MW9PvFUPo
         JWlw==
X-Gm-Message-State: AOJu0Yw2ICVUHd4+0wonYzKbD6U8sEzqEPm/MlZx+MlcJW3a0Ih8EBFl
	7lh86kbH+hH3647+Km4XiCv4mZuoVBghoOEz0lA=
X-Google-Smtp-Source: AGHT+IEKApUrJxfbalBtW+AgaBcxk6AWSfoSkFTzaZNGbKEENcCnDeuz6BH59IZrcGOeTMN/Uee1mg==
X-Received: by 2002:a05:600c:138b:b0:408:4160:150a with SMTP id u11-20020a05600c138b00b004084160150amr4204823wmf.33.1700222695996;
        Fri, 17 Nov 2023 04:04:55 -0800 (PST)
Date: Fri, 17 Nov 2023 13:04:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] x86/iommu: use a rangeset for hwdom setup
Message-ID: <ZVdW5lf8VlauTDh-@macbook.local>
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231117094749.81091-4-roger.pau@citrix.com>

On Fri, Nov 17, 2023 at 10:47:49AM +0100, Roger Pau Monne wrote:
> The current loop that iterates from 0 to the maximum RAM address in order to
> setup the IOMMU mappings is highly inefficient, and it will get worse as the
> amount of RAM increases.  It's also not accounting for any reserved regions
> past the last RAM address.
> 
> Instead of iterating over memory addresses, iterate over the memory map regions
> and use a rangeset in order to keep track of which ranges need to be identity
> mapped in the hardware domain physical address space.
> 
> On an AMD EPYC 7452 with 512GiB of RAM, the time to execute
> arch_iommu_hwdom_init() in nanoseconds is:
> 
> x old
> + new
>     N           Min           Max        Median           Avg        Stddev
> x   5 2.2364154e+10  2.338244e+10 2.2474685e+10 2.2622409e+10 4.2949869e+08
> +   5       1025012       1033036       1026188     1028276.2     3623.1194
> Difference at 95.0% confidence
> 	-2.26214e+10 +/- 4.42931e+08
> 	-99.9955% +/- 9.05152e-05%
> 	(Student's t, pooled s = 3.03701e+08)
> 
> Execution time of arch_iommu_hwdom_init() goes down from ~22s to ~0.001s.
> 
> Note there's a change for HVM domains (ie: PVH dom0) that get switched to
> create the p2m mappings using map_mmio_regions() instead of
> p2m_add_identity_entry(), so that ranges can be mapped with a single function
> call if possible.  Note that the interface of map_mmio_regions() doesn't
> allow creating read-only mappings, but so far there are no such mappings
> created for PVH dom0 in arch_iommu_hwdom_init().
> 
> No change intended in the resulting mappings that a hardware domain gets.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/io.c               |  15 +-
>  xen/arch/x86/include/asm/hvm/io.h   |   4 +-
>  xen/drivers/passthrough/x86/iommu.c | 355 +++++++++++++++++-----------
>  3 files changed, 231 insertions(+), 143 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
> index d75af83ad01f..7c4b7317b13a 100644
> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -364,9 +364,20 @@ static const struct hvm_mmcfg *vpci_mmcfg_find(const struct domain *d,
>      return NULL;
>  }
>  
> -bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
> +int vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
>  {
> -    return vpci_mmcfg_find(d, addr);
> +    const struct hvm_mmcfg *mmcfg;
> +
> +    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
> +    {
> +        int rc = rangeset_remove_range(r, PFN_DOWN(mmcfg->addr),
> +                                       PFN_DOWN(mmcfg->addr + mmcfg->size - 1));
> +
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return 0;
>  }
>  
>  static unsigned int vpci_mmcfg_decode_addr(const struct hvm_mmcfg *mmcfg,
> diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
> index e5225e75ef26..c9d058fd5695 100644
> --- a/xen/arch/x86/include/asm/hvm/io.h
> +++ b/xen/arch/x86/include/asm/hvm/io.h
> @@ -153,8 +153,8 @@ int register_vpci_mmcfg_handler(struct domain *d, paddr_t addr,
>  /* Destroy tracked MMCFG areas. */
>  void destroy_vpci_mmcfg(struct domain *d);
>  
> -/* Check if an address is between a MMCFG region for a domain. */
> -bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr);
> +/* Remove MMCFG regions from a given rangeset. */
> +int vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r);
>  
>  #endif /* __ASM_X86_HVM_IO_H__ */
>  
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
> index d70cee9fea77..be2c909f61d8 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -301,129 +301,133 @@ void iommu_identity_map_teardown(struct domain *d)
>      }
>  }
>  
> -static int __hwdom_init xen_in_range(unsigned long mfn)
> +static int __hwdom_init remove_xen_ranges(struct rangeset *r)
>  {
>      paddr_t start, end;
> -    int i;
> -
> -    enum { region_s3, region_ro, region_rw, region_bss, nr_regions };
> -    static struct {
> -        paddr_t s, e;
> -    } xen_regions[nr_regions] __hwdom_initdata;
> +    int rc;
>  
> -    /* initialize first time */
> -    if ( !xen_regions[0].s )
> -    {
> -        /* S3 resume code (and other real mode trampoline code) */
> -        xen_regions[region_s3].s = bootsym_phys(trampoline_start);
> -        xen_regions[region_s3].e = bootsym_phys(trampoline_end);
> +    /* S3 resume code (and other real mode trampoline code) */
> +    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
> +                               PFN_DOWN(bootsym_phys(trampoline_end)));
> +    if ( rc )
> +        return rc;
>  
> -        /*
> -         * This needs to remain in sync with the uses of the same symbols in
> -         * - __start_xen()
> -         * - is_xen_fixed_mfn()
> -         * - tboot_shutdown()
> -         */
> +    /*
> +     * This needs to remain in sync with the uses of the same symbols in
> +     * - __start_xen()
> +     * - is_xen_fixed_mfn()
> +     * - tboot_shutdown()
> +     */
> +    /* hypervisor .text + .rodata */
> +    rc = rangeset_remove_range(r, PFN_DOWN(__pa(&_stext)),
> +                               PFN_DOWN(__pa(&__2M_rodata_end)));
> +    if ( rc )
> +        return rc;
>  
> -        /* hypervisor .text + .rodata */
> -        xen_regions[region_ro].s = __pa(&_stext);
> -        xen_regions[region_ro].e = __pa(&__2M_rodata_end);
> -        /* hypervisor .data + .bss */
> -        xen_regions[region_rw].s = __pa(&__2M_rwdata_start);
> -        xen_regions[region_rw].e = __pa(&__2M_rwdata_end);
> -        if ( efi_boot_mem_unused(&start, &end) )
> -        {
> -            ASSERT(__pa(start) >= xen_regions[region_rw].s);
> -            ASSERT(__pa(end) <= xen_regions[region_rw].e);
> -            xen_regions[region_rw].e = __pa(start);
> -            xen_regions[region_bss].s = __pa(end);
> -            xen_regions[region_bss].e = __pa(&__2M_rwdata_end);
> -        }
> +    /* hypervisor .data + .bss */
> +    if ( efi_boot_mem_unused(&start, &end) )
> +    {
> +        ASSERT(__pa(start) >= __pa(&__2M_rwdata_start));
> +        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
> +                                   PFN_DOWN(__pa(start)));
> +        if ( rc )
> +            return rc;
> +        ASSERT(__pa(end) <= __pa(&__2M_rwdata_end));
> +        rc = rangeset_remove_range(r, PFN_DOWN(__pa(end)),
> +                                   PFN_DOWN(__pa(&__2M_rwdata_end)));
> +        if ( rc )
> +            return rc;
> +    }
> +    else
> +    {
> +        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
> +                                   PFN_DOWN(__pa(&__2M_rwdata_end)));
> +        if ( rc )
> +            return rc;
>      }
> -
> -    start = (paddr_t)mfn << PAGE_SHIFT;
> -    end = start + PAGE_SIZE;
> -    for ( i = 0; i < nr_regions; i++ )
> -        if ( (start < xen_regions[i].e) && (end > xen_regions[i].s) )
> -            return 1;
>  
>      return 0;
>  }
>  
> -static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
> -                                                 unsigned long pfn,
> -                                                 unsigned long max_pfn)
> +static int __hwdom_init map_subtract(unsigned long s, unsigned long e,

Bah, this (and others below) are missing cf_check attribute.

Will fix in v2.

Roger.

