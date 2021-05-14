Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F5538145D
	for <lists+xen-devel@lfdr.de>; Sat, 15 May 2021 01:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127629.239893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhhaN-00013i-C6; Fri, 14 May 2021 23:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127629.239893; Fri, 14 May 2021 23:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhhaN-00011q-8l; Fri, 14 May 2021 23:51:15 +0000
Received: by outflank-mailman (input) for mailman id 127629;
 Fri, 14 May 2021 23:51:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=saLk=KJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lhhaL-00011k-Rt
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 23:51:13 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38076f80-e871-4904-b875-bfd62736c1a3;
 Fri, 14 May 2021 23:51:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 033A261440;
 Fri, 14 May 2021 23:51:11 +0000 (UTC)
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
X-Inumbo-ID: 38076f80-e871-4904-b875-bfd62736c1a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621036272;
	bh=RkuxY7UFyW2YAXExWN195eVZmIgYm5uFRGdSYrW1fKc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l4jnYRa+mphpanBZnHu/qHfk0lts6053+TAWO9YtwOLj25UPd75UdaZWj5nEym/tY
	 t6UmNpQ1/gB0Z4dFFzWQHxmSYCmQsAUne+hHwKeD+hIsoxazZ9W8L9p85XtH36BZ1I
	 aF/bhAXKE4W0kXsTDY1wbYOenAL84+qq54DKKrtNu39vZVOYthi7TH7AyvVsWJjyWS
	 GsPDi+Kkmc4bOpbRL7f7Le5Q92wx6JROL27/zx+TECiQf5vHOgh3YWr0At/GCT0ZXu
	 ebpMmZc0giGGk0yhwOtpDAsro523n68KZEvAxwqtCFNmcxXtNUDkd5pZu5bnBAkNQf
	 4K/8kb/5yPKSQ==
Date: Fri, 14 May 2021 16:51:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH RFCv2 14/15] xen/arm: mm: Rework
 setup_xenheap_mappings()
In-Reply-To: <20210425201318.15447-15-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105141646340.14426@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-15-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Apr 2021, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> A few issues have been reported with setup_xenheap_mappings() over the
> last couple of years. The main ones are:
>     - It will break on platform supporting more than 512GB of RAM
>       because the memory allocated by the boot allocator is not yet
>       mapped.
>     - Aligning all the regions to 1GB may lead to unexpected result
>       because we may alias non-cacheable region (such as device or reserved
>       regions).
> 
> map_pages_to_xen() was recently reworked to allow superpage mappings and
> deal with the use of page-tables before they are mapped.
> 
> Most of the code in setup_xenheap_mappings() is now replaced with a
> single call to map_pages_to_xen().
> 
> This also require to re-order the steps setup_mm() so the regions are
> given to the boot allocator first and then we setup the xenheap
> mappings.

I know this is paranoia but doesn't this introduce a requirement on the
size of the first bank in bootinfo.mem.bank[] ?

It should be at least 8KB?

I know it is unlikely but it is theoretically possible to have a first
bank of just 1KB.

I think we should write the requirement down with an in-code comment?
Or better maybe we should write a message about it in the panic below?


> Note that the 1GB alignment is not yet removed.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - New patch
> 
>     TODO:
>         - Remove the 1GB alignment
>         - Add support for setting the contiguous bit
> ---
>  xen/arch/arm/mm.c    | 60 ++++----------------------------------------
>  xen/arch/arm/setup.c | 10 ++++++--

I love it!


>  2 files changed, 13 insertions(+), 57 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index f5768f2d4a81..c49403b687f5 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -143,17 +143,6 @@ static DEFINE_PAGE_TABLE(cpu0_pgtable);
>  static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
>  #endif
>  
> -#ifdef CONFIG_ARM_64
> -/* The first page of the first level mapping of the xenheap. The
> - * subsequent xenheap first level pages are dynamically allocated, but
> - * we need this one to bootstrap ourselves. */
> -static DEFINE_PAGE_TABLE(xenheap_first_first);
> -/* The zeroeth level slot which uses xenheap_first_first. Used because
> - * setup_xenheap_mappings otherwise relies on mfn_to_virt which isn't
> - * valid for a non-xenheap mapping. */
> -static __initdata int xenheap_first_first_slot = -1;
> -#endif
> -
>  /* Common pagetable leaves */
>  /* Second level page tables.
>   *
> @@ -818,9 +807,9 @@ void __init setup_xenheap_mappings(unsigned long base_mfn,
>  void __init setup_xenheap_mappings(unsigned long base_mfn,
>                                     unsigned long nr_mfns)
>  {
> -    lpae_t *first, pte;
>      unsigned long mfn, end_mfn;
>      vaddr_t vaddr;
> +    int rc;
>  
>      /* Align to previous 1GB boundary */
>      mfn = base_mfn & ~((FIRST_SIZE>>PAGE_SHIFT)-1);
> @@ -846,49 +835,10 @@ void __init setup_xenheap_mappings(unsigned long base_mfn,
>       */
>      vaddr = (vaddr_t)__mfn_to_virt(base_mfn) & FIRST_MASK;
>  
> -    while ( mfn < end_mfn )
> -    {
> -        int slot = zeroeth_table_offset(vaddr);
> -        lpae_t *p = &xen_pgtable[slot];
> -
> -        if ( p->pt.valid )
> -        {
> -            /* mfn_to_virt is not valid on the 1st 1st mfn, since it
> -             * is not within the xenheap. */
> -            first = slot == xenheap_first_first_slot ?
> -                xenheap_first_first : mfn_to_virt(lpae_get_mfn(*p));
> -        }
> -        else if ( xenheap_first_first_slot == -1)
> -        {
> -            /* Use xenheap_first_first to bootstrap the mappings */
> -            first = xenheap_first_first;
> -
> -            pte = pte_of_xenaddr((vaddr_t)xenheap_first_first);
> -            pte.pt.table = 1;
> -            write_pte(p, pte);
> -
> -            xenheap_first_first_slot = slot;
> -        }
> -        else
> -        {
> -            mfn_t first_mfn = alloc_boot_pages(1, 1);
> -
> -            clear_page(mfn_to_virt(first_mfn));
> -            pte = mfn_to_xen_entry(first_mfn, MT_NORMAL);
> -            pte.pt.table = 1;
> -            write_pte(p, pte);
> -            first = mfn_to_virt(first_mfn);
> -        }
> -
> -        pte = mfn_to_xen_entry(_mfn(mfn), MT_NORMAL);
> -        /* TODO: Set pte.pt.contig when appropriate. */
> -        write_pte(&first[first_table_offset(vaddr)], pte);
> -
> -        mfn += FIRST_SIZE>>PAGE_SHIFT;
> -        vaddr += FIRST_SIZE;
> -    }
> -
> -    flush_xen_tlb_local();
> +    rc = map_pages_to_xen(vaddr, _mfn(mfn), end_mfn - mfn,
> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to setup the xenheap mappings.\n");

This is the panic I was talking about


>  }
>  #endif
>  
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 00aad1c194b9..0993a4bb52d4 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -761,8 +761,11 @@ static void __init setup_mm(void)
>          ram_start = min(ram_start,bank_start);
>          ram_end = max(ram_end,bank_end);
>  
> -        setup_xenheap_mappings(bank_start>>PAGE_SHIFT, bank_size>>PAGE_SHIFT);
> -
> +        /*
> +         * Add the region to the boot allocator first, so we can use
> +         * some to allocate page-tables for setting up the xenheap
> +         * mappings.
> +         */
>          s = bank_start;
>          while ( s < bank_end )
>          {
> @@ -781,6 +784,9 @@ static void __init setup_mm(void)
>              fw_unreserved_regions(s, e, init_boot_pages, 0);
>              s = n;
>          }
> +
> +        setup_xenheap_mappings(bank_start >> PAGE_SHIFT,
> +                               bank_size >> PAGE_SHIFT);
>      }
>  
>      total_pages += ram_size >> PAGE_SHIFT;
> -- 
> 2.17.1
> 

