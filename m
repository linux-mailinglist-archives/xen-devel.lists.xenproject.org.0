Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D10853D3C8
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jun 2022 01:10:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341717.566946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxGPr-0000tR-MG; Fri, 03 Jun 2022 23:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341717.566946; Fri, 03 Jun 2022 23:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxGPr-0000rh-IN; Fri, 03 Jun 2022 23:09:15 +0000
Received: by outflank-mailman (input) for mailman id 341717;
 Fri, 03 Jun 2022 23:09:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nxGPp-0000rb-QR
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 23:09:13 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e29f754-e392-11ec-bd2c-47488cf2e6aa;
 Sat, 04 Jun 2022 01:09:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D1E8B82473;
 Fri,  3 Jun 2022 23:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195E9C385A9;
 Fri,  3 Jun 2022 23:09:10 +0000 (UTC)
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
X-Inumbo-ID: 2e29f754-e392-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654297750;
	bh=FnK2Y3LSrb78iul2thCA0adS6+qvrw7Rw8b8irhGjl0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nxEnw2N5ezlJB7DRLFf2ycdYflUqPpo4IqTAi2nE2jsLcS+7ARfWYgw58dDGtBJKU
	 B7L0Fk4/d/oc/AzTa9eei6eO+7m9dw4KECaOcjA+cvT6a+27J0g/PjlbZed1j/tVWz
	 pkoOCCQgidHFbLdSsK2CmOH5HUf5nbfSkwjuTsF25UdDgwnNbuuvleKLyFfJnVkgE5
	 gtIy/SeTmPen1rLGS/NV6vao+RGo2RsI7GfchH9b4GV0lu87SLZzHaCwSB1USZvPFp
	 01pVhWsDWggf5W2bPnXmKeuY2FKkRqy/JksZelDFYfMAS0ZPcBk2wNXDibiKebuodt
	 HnCaNApDUBblg==
Date: Fri, 3 Jun 2022 16:09:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 13/16] xen/arm32: setup: Move out the code to populate
 the boot allocator
In-Reply-To: <20220520120937.28925-14-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206031557080.2783803@ubuntu-linux-20-04-desktop>
References: <20220520120937.28925-1-julien@xen.org> <20220520120937.28925-14-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 May 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> In a follow-up patch, we will want to populate the boot allocator
> separately for arm64. The code will end up to be very similar to the one
> on arm32. So move out the code in a new helper populate_boot_allocator().
> 
> For now the code is still protected by CONFIG_ARM_32 to avoid any build
> failure on arm64.
> 
> Take the opportunity to replace mfn_add(xen_mfn_start, xenheap_pages) with
> xenheap_mfn_end as they are equivalent.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
>     Changes in v4:
>         - Patch added
> ---
>  xen/arch/arm/setup.c | 90 +++++++++++++++++++++++++-------------------
>  1 file changed, 51 insertions(+), 39 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed48a..3d5a2283d4ef 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -637,10 +637,58 @@ static void __init init_staticmem_pages(void)
>  }
>  
>  #ifdef CONFIG_ARM_32
> +/*
> + * Populate the boot allocator. All the RAM but the following regions
> + * will be added:
> + *  - Modules (e.g., Xen, Kernel)
> + *  - Reserved regions
> + *  - Xenheap
> + */
> +static void __init populate_boot_allocator(void)
> +{
> +    unsigned int i;
> +    const struct meminfo *banks = &bootinfo.mem;
> +
> +    for ( i = 0; i < banks->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &banks->bank[i];
> +        paddr_t bank_end = bank->start + bank->size;
> +        paddr_t s, e;
> +
> +        s = bank->start;
> +        while ( s < bank_end )
> +        {
> +            paddr_t n = bank_end;
> +
> +            e = next_module(s, &n);
> +
> +            if ( e == ~(paddr_t)0 )
> +                e = n = bank_end;
> +
> +            /*
> +             * Module in a RAM bank other than the one which we are
> +             * not dealing with here.
> +             */
> +            if ( e > bank_end )
> +                e = bank_end;
> +
> +            /* Avoid the xenheap */
> +            if ( s < mfn_to_maddr(xenheap_mfn_end) &&
> +                 mfn_to_maddr(xenheap_mfn_start) < e )
> +            {
> +                e = mfn_to_maddr(xenheap_mfn_start);
> +                n = mfn_to_maddr(xenheap_mfn_end);
> +            }
> +
> +            fw_unreserved_regions(s, e, init_boot_pages, 0);
> +            s = n;
> +        }
> +    }
> +}
> +
>  static void __init setup_mm(void)
>  {
> -    paddr_t ram_start, ram_end, ram_size;
> -    paddr_t s, e;
> +    paddr_t ram_start, ram_end, ram_size, e;
>      unsigned long ram_pages;
>      unsigned long heap_pages, xenheap_pages, domheap_pages;
>      int i;
> @@ -718,43 +766,7 @@ static void __init setup_mm(void)
>      setup_xenheap_mappings((e >> PAGE_SHIFT) - xenheap_pages, xenheap_pages);
>  
>      /* Add non-xenheap memory */
> -    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
> -    {
> -        paddr_t bank_start = bootinfo.mem.bank[i].start;
> -        paddr_t bank_end = bank_start + bootinfo.mem.bank[i].size;
> -
> -        s = bank_start;
> -        while ( s < bank_end )
> -        {
> -            paddr_t n = bank_end;
> -
> -            e = next_module(s, &n);
> -
> -            if ( e == ~(paddr_t)0 )
> -            {
> -                e = n = ram_end;
> -            }
> -
> -            /*
> -             * Module in a RAM bank other than the one which we are
> -             * not dealing with here.
> -             */
> -            if ( e > bank_end )
> -                e = bank_end;
> -
> -            /* Avoid the xenheap */
> -            if ( s < mfn_to_maddr(mfn_add(xenheap_mfn_start, xenheap_pages))
> -                 && mfn_to_maddr(xenheap_mfn_start) < e )
> -            {
> -                e = mfn_to_maddr(xenheap_mfn_start);
> -                n = mfn_to_maddr(mfn_add(xenheap_mfn_start, xenheap_pages));
> -            }
> -
> -            fw_unreserved_regions(s, e, init_boot_pages, 0);
> -
> -            s = n;
> -        }
> -    }
> +    populate_boot_allocator();
>  
>      /* Frame table covers all of RAM region, including holes */
>      setup_frametable_mappings(ram_start, ram_end);
> -- 
> 2.32.0
> 

