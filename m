Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A7F4F42A4
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 23:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299321.509964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbr41-0004UM-L4; Tue, 05 Apr 2022 21:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299321.509964; Tue, 05 Apr 2022 21:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbr41-0004SB-Hd; Tue, 05 Apr 2022 21:50:13 +0000
Received: by outflank-mailman (input) for mailman id 299321;
 Tue, 05 Apr 2022 21:50:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbr3z-0004S1-C5
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 21:50:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cd20014-b52a-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 23:50:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7603B81F72;
 Tue,  5 Apr 2022 21:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E531AC385A1;
 Tue,  5 Apr 2022 21:50:06 +0000 (UTC)
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
X-Inumbo-ID: 5cd20014-b52a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649195407;
	bh=98Oczl+Cemt9on2evQm3vjoUysUyGYL/MpUuzYtn7TE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WSO4lAuLxwdCGJIiiJAvImUjNB2WSVx4SPRTLEBx84BsZlcWvSTcnXmkWZSWMomPG
	 3RCamX13js0bl3Q0pSmaQtEInwmSgFmby/heWWYcIQdDJ461f88NCr6bfOpzvqyREM
	 4wmybBwxAzXjnPJTjAZeldlXFmAVfOEMXx0DINWzJ4d/f5zs2tZOc4jBgChvXsv50H
	 rXUUyWXTRoHdcYTnHroYj0veMad5Lmc2yOgy08FvMJjXFNgkqKndM0Dsaj3gM+45w4
	 aaGPkYpq2Uy/3QwLwTpRTggl95ee8d6ap4xxHzYg3ibrQm0SWY7j40lVZVYVtM+ptU
	 DqvuNBLUHnUsw==
Date: Tue, 5 Apr 2022 14:50:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 17/19] xen/arm64: mm: Add memory to the boot allocator
 first
In-Reply-To: <20220221102218.33785-18-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051444220.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-18-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Feb 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, memory is added to the boot allocator after the xenheap
> mappings are done. This will break if the first mapping is more than
> 512GB of RAM.
> 
> In addition to that, a follow-up patch will rework setup_xenheap_mappings()
> to use smaller mappings (e.g. 2MB, 4KB). So it will be necessary to have
> memory in the boot allocator earlier.
> 
> Only free memory (e.g. not reserved or modules) can be added to the boot
> allocator. It might be possible that some regions (including the first
> one) will have no free memory.
> 
> So we need to add all the free memory to the boot allocator first
> and then add do the mappings.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v3:
>         - Patch added
> ---
>  xen/arch/arm/setup.c | 63 +++++++++++++++++++++++++++++---------------
>  1 file changed, 42 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed48a..777cf96639f5 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -767,30 +767,18 @@ static void __init setup_mm(void)
>      init_staticmem_pages();
>  }
>  #else /* CONFIG_ARM_64 */
> -static void __init setup_mm(void)
> +static void __init populate_boot_allocator(void)
>  {
> -    paddr_t ram_start = ~0;
> -    paddr_t ram_end = 0;
> -    paddr_t ram_size = 0;
> -    int bank;
> -
> -    init_pdx();
> +    unsigned int i;
> +    const struct meminfo *banks = &bootinfo.mem;
>  
> -    total_pages = 0;
> -    for ( bank = 0 ; bank < bootinfo.mem.nr_banks; bank++ )
> +    for ( i = 0; i < banks->nr_banks; i++ )
>      {
> -        paddr_t bank_start = bootinfo.mem.bank[bank].start;
> -        paddr_t bank_size = bootinfo.mem.bank[bank].size;
> -        paddr_t bank_end = bank_start + bank_size;
> +        const struct membank *bank = &banks->bank[i];
> +        paddr_t bank_end = bank->start + bank->size;
>          paddr_t s, e;
>  
> -        ram_size = ram_size + bank_size;
> -        ram_start = min(ram_start,bank_start);
> -        ram_end = max(ram_end,bank_end);
> -
> -        setup_xenheap_mappings(bank_start>>PAGE_SHIFT, bank_size>>PAGE_SHIFT);
> -
> -        s = bank_start;
> +        s = bank->start;
>          while ( s < bank_end )
>          {
>              paddr_t n = bank_end;
> @@ -798,9 +786,7 @@ static void __init setup_mm(void)
>              e = next_module(s, &n);
>  
>              if ( e == ~(paddr_t)0 )
> -            {
>                  e = n = bank_end;
> -            }
>  
>              if ( e > bank_end )
>                  e = bank_end;
> @@ -809,6 +795,41 @@ static void __init setup_mm(void)
>              s = n;
>          }
>      }
> +}
> +
> +static void __init setup_mm(void)
> +{
> +    const struct meminfo *banks = &bootinfo.mem;
> +    paddr_t ram_start = ~0;
> +    paddr_t ram_end = 0;
> +    paddr_t ram_size = 0;
> +    unsigned int i;
> +
> +    init_pdx();
> +
> +    /*
> +     * We need some memory to allocate the page-tables used for the xenheap
> +     * mappings. But some regions may contain memory already allocated
> +     * for other uses (e.g. modules, reserved-memory...).
> +     *
> +     * For simplify add all the free regions in the boot allocator.
> +     */

We currently have:

BUG_ON(nr_bootmem_regions == (PAGE_SIZE / sizeof(struct bootmem_region)));

Do you think we should check for the limit in populate_boot_allocator?
Or there is no need because it is unrealistic to reach it?


> +    populate_boot_allocator();
> +
> +    total_pages = 0;
> +
> +    for ( i = 0; i < banks->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &banks->bank[i];
> +        paddr_t bank_end = bank->start + bank->size;
> +
> +        ram_size = ram_size + bank->size;
> +        ram_start = min(ram_start, bank->start);
> +        ram_end = max(ram_end, bank_end);
> +
> +        setup_xenheap_mappings(PFN_DOWN(bank->start),
> +                               PFN_DOWN(bank->size));
> +    }
>  
>      total_pages += ram_size >> PAGE_SHIFT;
>  
> -- 
> 2.32.0
> 

