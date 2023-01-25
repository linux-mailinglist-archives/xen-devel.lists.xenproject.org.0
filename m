Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A13567A81A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 01:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483823.750222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKU6q-0006rl-Qq; Wed, 25 Jan 2023 00:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483823.750222; Wed, 25 Jan 2023 00:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKU6q-0006pG-NH; Wed, 25 Jan 2023 00:57:52 +0000
Received: by outflank-mailman (input) for mailman id 483823;
 Wed, 25 Jan 2023 00:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a83O=5W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pKU6o-0006BH-Q9
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 00:57:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48f9b03a-9c4b-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 01:57:48 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F5D860B86;
 Wed, 25 Jan 2023 00:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413A2C433EF;
 Wed, 25 Jan 2023 00:57:46 +0000 (UTC)
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
X-Inumbo-ID: 48f9b03a-9c4b-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674608267;
	bh=C7QNZDgeCr1RHT/hC6pNJEHyiWlr0MI9uHe5zEejtcQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aYlbX9L1YVfwYY2oxWcwMIIsBnCeoRw7krUdToxYmXdCu9jI1fpTKjbW98cZUiQx0
	 egJujhcgsIQ2oCV6HDmHiJwpUNZLVmqeEhXRODIpPoFBSXsnt/JdFiMc1EnUTSYWtH
	 CiJp2K+fpgWMQH34171g3YCthpfGIBK4FtOobfUElBv/DT1RRZLI5AXW2mEdiC3Fj5
	 2FhzjjMMwmwOOI9cj1R9iksYN0OOAhOUH3afS51XTjVtJ5/W+uj5e737GusZcAL8Nk
	 0EaSIhwmyhOf8NYrYjxnULcOHZm27TJUv1yARuhpPV8BkE2Es2KOr9jlYT2ETdUnIq
	 JY0L/+mcQSsPw==
Date: Tue, 24 Jan 2023 16:57:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/3] xen/arm: Extend the memory overlap check to
 include EfiACPIReclaimMemory
In-Reply-To: <20221214031654.2815589-4-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2301241657380.1978264@ubuntu-linux-20-04-desktop>
References: <20221214031654.2815589-1-Henry.Wang@arm.com> <20221214031654.2815589-4-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Dec 2022, Henry Wang wrote:
> Similarly as the static regions and boot modules, memory regions with
> EfiACPIReclaimMemory type (defined in bootinfo.acpi if CONFIG_ACPI is
> enabled) should also not be overlapping with memory regions in
> bootinfo.reserved_mem and bootinfo.modules.
> 
> Therefore, this commit reuses the `meminfo_overlap_check()` to further
> extends the check in function `check_reserved_regions_overlap()` so that
> memory regions in bootinfo.acpi are included. If any error occurs in the
> extended `check_reserved_regions_overlap()`, the `meminfo_add_bank()`
> defined in `efi-boot.h` will return early.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v1 -> v2:
> 1. Rebase on top of patch #1 and #2.
> ---
>  xen/arch/arm/efi/efi-boot.h | 10 ++++++++--
>  xen/arch/arm/setup.c        |  6 ++++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 43a836c3a7..6121ba1f2f 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -161,13 +161,19 @@ static bool __init meminfo_add_bank(struct meminfo *mem,
>                                      EFI_MEMORY_DESCRIPTOR *desc)
>  {
>      struct membank *bank;
> +    paddr_t start = desc->PhysicalStart;
> +    paddr_t size = desc->NumberOfPages * EFI_PAGE_SIZE;
>  
>      if ( mem->nr_banks >= NR_MEM_BANKS )
>          return false;
> +#ifdef CONFIG_ACPI
> +    if ( check_reserved_regions_overlap(start, size) )
> +        return false;
> +#endif
>  
>      bank = &mem->bank[mem->nr_banks];
> -    bank->start = desc->PhysicalStart;
> -    bank->size = desc->NumberOfPages * EFI_PAGE_SIZE;
> +    bank->start = start;
> +    bank->size = size;
>  
>      mem->nr_banks++;
>  
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index ba0152f868..a0cb2dd588 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -342,6 +342,12 @@ int __init check_reserved_regions_overlap(paddr_t region_start,
>                                     region_start, region_end) )
>          return -EINVAL;
>  
> +#ifdef CONFIG_ACPI
> +    /* Check if input region is overlapping with ACPI EfiACPIReclaimMemory */
> +    if ( meminfo_overlap_check(&bootinfo.acpi, region_start, region_end) )
> +        return -EINVAL;
> +#endif
> +
>      return 0;
>  }
>  
> -- 
> 2.25.1
> 

