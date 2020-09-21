Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B2A2731BD
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 20:17:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKQNG-0004qX-WC; Mon, 21 Sep 2020 18:17:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JKs4=C6=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kKQNF-0004qS-AC
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 18:17:13 +0000
X-Inumbo-ID: 1cd0558a-b0c7-49b3-8f26-3d78b368480e
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1cd0558a-b0c7-49b3-8f26-3d78b368480e;
 Mon, 21 Sep 2020 18:17:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 76B4068AFE; Mon, 21 Sep 2020 20:17:08 +0200 (CEST)
Date: Mon, 21 Sep 2020 20:17:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Minchan Kim <minchan@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nitin Gupta <ngupta@vflare.org>, x86@kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 1/6] zsmalloc: switch from alloc_vm_area to get_vm_area
Message-ID: <20200921181708.GA2067@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-2-hch@lst.de> <20200921174256.GA387368@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921174256.GA387368@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 21, 2020 at 10:42:56AM -0700, Minchan Kim wrote:
> IIRC, the problem was runtime pte popluating needs GFP_KERNEL but
> zs_map_object API runs under non-preemtible section.

Make sense.

> > -	area->vm = alloc_vm_area(PAGE_SIZE * 2, NULL);
> > +	area->vm = get_vm_area(PAGE_SIZE * 2, 0);
> >  	if (!area->vm)
> >  		return -ENOMEM;
> >  	return 0;
> 
> I think it shoud work.
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 05789aa4af12..6a1e4d854593 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2232,7 +2232,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  	arch_enter_lazy_mmu_mode();
>  
>  	do {
> -		if (create || !pte_none(*pte)) {
> +		if ((create || !pte_none(*pte)) && fn) {
>  			err = fn(pte++, addr, data);
>  			if (err)
>  				break;
> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index 3e4fe3259612..9ef7daf3d279 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -1116,6 +1116,8 @@ static struct zspage *find_get_zspage(struct size_class *class)
>  #ifdef CONFIG_ZSMALLOC_PGTABLE_MAPPING
>  static inline int __zs_cpu_up(struct mapping_area *area)
>  {
> +	int ret;
> +
>  	/*
>  	 * Make sure we don't leak memory if a cpu UP notification
>  	 * and zs_init() race and both call zs_cpu_up() on the same cpu
> @@ -1125,7 +1127,13 @@ static inline int __zs_cpu_up(struct mapping_area *area)
>  	area->vm = get_vm_area(PAGE_SIZE * 2, 0);
>  	if (!area->vm)
>  		return -ENOMEM;
> -	return 0;
> +
> +	/*
> +	 * Populate ptes in advance to avoid pte allocation with GFP_KERNEL
> +	 * in non-preemtible context of zs_map_object.
> +	 */
> +	ret = apply_to_page_range(&init_mm, NULL, PAGE_SIZE * 2, NULL, NULL);
> +	return ret;

I think this needs the addr from the vm area somewhere..

We probaby want to add a trivial helper to prefault an area instead of
the open coded variant.

