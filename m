Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6EC27F616
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 01:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968.3271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNliR-0003ob-AG; Wed, 30 Sep 2020 23:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968.3271; Wed, 30 Sep 2020 23:40:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNliR-0003oB-6f; Wed, 30 Sep 2020 23:40:55 +0000
Received: by outflank-mailman (input) for mailman id 968;
 Wed, 30 Sep 2020 23:40:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kNliP-0003o5-Ro
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 23:40:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7984949-6e1a-4f5a-9d85-b8eae811b32d;
 Wed, 30 Sep 2020 23:40:53 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1DF1320B1F;
 Wed, 30 Sep 2020 23:40:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BzSz=DH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kNliP-0003o5-Ro
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 23:40:53 +0000
X-Inumbo-ID: d7984949-6e1a-4f5a-9d85-b8eae811b32d
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d7984949-6e1a-4f5a-9d85-b8eae811b32d;
	Wed, 30 Sep 2020 23:40:53 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1DF1320B1F;
	Wed, 30 Sep 2020 23:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601509252;
	bh=oG7ii9IEJfscsnafeqju/2puWYFbOdNU+I9kx0WFXrE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dyPYFva0abcqK8JwfUsxtAIcSPezJerh+OuKX7x8+yjWjEhEuzp4onr5lqJLiDri9
	 TBGYN1A32rurBLBABiA1gqkmuMDYZGVOgPDQy57f1EvzlMglS6avZYLKB46XEmT/ft
	 uG6kpx04SAFCdC3HnOfzyGGyiJcIrDYse1ej2F+E=
Date: Wed, 30 Sep 2020 16:40:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org, 
    masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/4] xen/arm: Introduce fw_unreserved_regions() and use
 it
In-Reply-To: <20200926205542.9261-5-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2009301630250.10908@sstabellini-ThinkPad-T480s>
References: <20200926205542.9261-1-julien@xen.org> <20200926205542.9261-5-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 26 Sep 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 6e3e77120378 "xen/arm: setup: Relocate the Device-Tree
> later on in the boot", the device-tree will not be kept mapped when
> using ACPI.
> 
> However, a few places are calling dt_unreserved_regions() which expects
> a valid DT. This will lead to a crash.
> 
> As the DT should not be used for ACPI (other than for detecting the
> modules), a new function fw_unreserved_regions() is introduced.
> 
> It will behave the same way on DT system. On ACPI system, it will
> unreserve the whole region.

The patch is good.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


I have a small suggestion for improvement that could be done on commit:
given that bootinfo is actually used on EFI systems (granted, not
bootinfo.reserved_mem but bootinfo.mem, see
xen/arch/arm/efi/efi-boot.h:efi_process_memory_map_bootinfo) so
technically bootinfo could be in-use with ACPI, maybe we could add a
comment on top of xen/include/asm-arm/setup.h:bootinfo to say that
reserved_mem is device tree only?



> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> Is there any region we should exclude on ACPI?
> ---
>  xen/arch/arm/kernel.c       |  2 +-
>  xen/arch/arm/setup.c        | 22 +++++++++++++++++-----
>  xen/include/asm-arm/setup.h |  2 +-
>  3 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 032923853f2c..ab78689ed2a6 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -307,7 +307,7 @@ static __init int kernel_decompress(struct bootmodule *mod)
>       * Free the original kernel, update the pointers to the
>       * decompressed kernel
>       */
> -    dt_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
> +    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
>  
>      return 0;
>  }
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 35e5bee04efa..7fcff9af2a7e 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -196,8 +196,9 @@ static void __init processor_id(void)
>      processor_setup();
>  }
>  
> -void __init dt_unreserved_regions(paddr_t s, paddr_t e,
> -                                  void (*cb)(paddr_t, paddr_t), int first)
> +static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
> +                                         void (*cb)(paddr_t, paddr_t),
> +                                         int first)
>  {
>      int i, nr = fdt_num_mem_rsv(device_tree_flattened);
>  
> @@ -244,6 +245,17 @@ void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>      cb(s, e);
>  }
>  
> +void __init fw_unreserved_regions(paddr_t s, paddr_t e,
> +                                  void (*cb)(paddr_t, paddr_t), int first)
> +{
> +    if ( acpi_disabled )
> +        dt_unreserved_regions(s, e, cb, first);
> +    else
> +        cb(s, e);
> +}
> +
> +
> +
>  struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>                                            paddr_t start, paddr_t size,
>                                            bool domU)
> @@ -405,7 +417,7 @@ void __init discard_initial_modules(void)
>               !mfn_valid(maddr_to_mfn(e)) )
>              continue;
>  
> -        dt_unreserved_regions(s, e, init_domheap_pages, 0);
> +        fw_unreserved_regions(s, e, init_domheap_pages, 0);
>      }
>  
>      mi->nr_mods = 0;
> @@ -712,7 +724,7 @@ static void __init setup_mm(void)
>                  n = mfn_to_maddr(mfn_add(xenheap_mfn_start, xenheap_pages));
>              }
>  
> -            dt_unreserved_regions(s, e, init_boot_pages, 0);
> +            fw_unreserved_regions(s, e, init_boot_pages, 0);
>  
>              s = n;
>          }
> @@ -765,7 +777,7 @@ static void __init setup_mm(void)
>              if ( e > bank_end )
>                  e = bank_end;
>  
> -            dt_unreserved_regions(s, e, init_boot_pages, 0);
> +            fw_unreserved_regions(s, e, init_boot_pages, 0);
>              s = n;
>          }
>      }
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index 2f8f24e286ed..34df23247b87 100644
> --- a/xen/include/asm-arm/setup.h
> +++ b/xen/include/asm-arm/setup.h
> @@ -96,7 +96,7 @@ int construct_dom0(struct domain *d);
>  void create_domUs(void);
>  
>  void discard_initial_modules(void);
> -void dt_unreserved_regions(paddr_t s, paddr_t e,
> +void fw_unreserved_regions(paddr_t s, paddr_t e,
>                             void (*cb)(paddr_t, paddr_t), int first);
>  
>  size_t boot_fdt_info(const void *fdt, paddr_t paddr);
> -- 
> 2.17.1
> 

