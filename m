Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D85743E63C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 18:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218180.378507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg8Pc-00030Q-2y; Thu, 28 Oct 2021 16:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218180.378507; Thu, 28 Oct 2021 16:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg8Pb-0002yG-Vh; Thu, 28 Oct 2021 16:37:55 +0000
Received: by outflank-mailman (input) for mailman id 218180;
 Thu, 28 Oct 2021 16:37:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TkaK=PQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mg8Pa-0002yA-61
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 16:37:54 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1eb2b4f-33f2-47de-b446-c78ea2ff80a1;
 Thu, 28 Oct 2021 16:37:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58AE461056;
 Thu, 28 Oct 2021 16:37:51 +0000 (UTC)
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
X-Inumbo-ID: b1eb2b4f-33f2-47de-b446-c78ea2ff80a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635439071;
	bh=1mfaE+t0DGF3qhqf6/10hRKufFVGSY27UZia8A0NKyU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JOnfjlMZ2/OkxYmpeCyrIi9FSsE9220WL8zRKqYlBFG7GT8SR8ONlZft/D+NnfhOC
	 Swe0b7txGApP/RKxMJk6UG0Lkv+qSkNsEjRVhHLBkJXiaLHcK5YubTMXPAkEIcYCuO
	 Okf8YM9MUOtEiuAimzWRh5l6ew4fINhV21veLZAWp7fRgnJGZf3cxIMO4wvMn3TL/X
	 3eqGlLJKbEPxDR5CaNqArbp5TSHm0KThso4u5ZL20tkvx5pWNJ6wk3mVftbUlxnSf2
	 WB+tZX7IzcCAKCB8g5i+HmqbHI7nlCqgve7e8xbM1F6jGRK3fpXmlCHDKvTWJuAe0w
	 hH7JDwZS723Kw==
Date: Thu, 28 Oct 2021 09:37:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V2 3/4] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
In-Reply-To: <1635264312-3796-4-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2110280920110.20134@sstabellini-ThinkPad-T480s>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com> <1635264312-3796-4-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Oct 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The main reason of this change is that unpopulated-alloc
> code cannot be used in its current form on Arm, but there
> is a desire to reuse it to avoid wasting real RAM pages
> for the grant/foreign mappings.
> 
> The problem is that system "iomem_resource" is used for
> the address space allocation, but the really unallocated
> space can't be figured out precisely by the domain on Arm
> without hypervisor involvement. For example, not all device
> I/O regions are known by the time domain starts creating
> grant/foreign mappings. And following the advise from
> "iomem_resource" we might end up reusing these regions by
> a mistake. So, the hypervisor which maintains the P2M for
> the domain is in the best position to provide unused regions
> of guest physical address space which could be safely used
> to create grant/foreign mappings.
> 
> Introduce new helper arch_xen_unpopulated_init() which purpose
> is to create specific Xen resource based on the memory regions
> provided by the hypervisor to be used as unused space for Xen
> scratch pages.
> 
> If arch doesn't implement arch_xen_unpopulated_init() to
> initialize Xen resource the default "iomem_resource" will be used.
> So the behavior on x86 won't be changed.
> 
> Also fall back to allocate xenballooned pages (steal real RAM
> pages) if we do not have any suitable resource to work with and
> as the result we won't be able to provide unpopulated pages.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Changes RFC -> V2:
>    - new patch, instead of
>     "[RFC PATCH 2/2] xen/unpopulated-alloc: Query hypervisor to provide unallocated space"
> ---
>  drivers/xen/unpopulated-alloc.c | 89 +++++++++++++++++++++++++++++++++++++++--
>  include/xen/xen.h               |  2 +
>  2 files changed, 88 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
> index a03dc5b..1f1d8d8 100644
> --- a/drivers/xen/unpopulated-alloc.c
> +++ b/drivers/xen/unpopulated-alloc.c
> @@ -8,6 +8,7 @@
>  
>  #include <asm/page.h>
>  
> +#include <xen/balloon.h>
>  #include <xen/page.h>
>  #include <xen/xen.h>
>  
> @@ -15,13 +16,29 @@ static DEFINE_MUTEX(list_lock);
>  static struct page *page_list;
>  static unsigned int list_count;
>  
> +static struct resource *target_resource;
> +static struct resource xen_resource = {
> +	.name = "Xen unused space",
> +};
> +
> +/*
> + * If arch is not happy with system "iomem_resource" being used for
> + * the region allocation it can provide it's own view by initializing
> + * "xen_resource" with unused regions of guest physical address space
> + * provided by the hypervisor.
> + */
> +int __weak arch_xen_unpopulated_init(struct resource *res)
> +{
> +	return -ENOSYS;
> +}
> +
>  static int fill_list(unsigned int nr_pages)
>  {
>  	struct dev_pagemap *pgmap;
> -	struct resource *res;
> +	struct resource *res, *tmp_res = NULL;
>  	void *vaddr;
>  	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
> -	int ret = -ENOMEM;
> +	int ret;
>  
>  	res = kzalloc(sizeof(*res), GFP_KERNEL);
>  	if (!res)
> @@ -30,7 +47,7 @@ static int fill_list(unsigned int nr_pages)
>  	res->name = "Xen scratch";
>  	res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
>  
> -	ret = allocate_resource(&iomem_resource, res,
> +	ret = allocate_resource(target_resource, res,
>  				alloc_pages * PAGE_SIZE, 0, -1,
>  				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
>  	if (ret < 0) {
> @@ -38,6 +55,31 @@ static int fill_list(unsigned int nr_pages)
>  		goto err_resource;
>  	}
>  
> +	/*
> +	 * Reserve the region previously allocated from Xen resource to avoid
> +	 * re-using it by someone else.
> +	 */
> +	if (target_resource != &iomem_resource) {
> +		tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
> +		if (!res) {
> +			ret = -ENOMEM;
> +			goto err_insert;
> +		}
> +
> +		tmp_res->name = res->name;
> +		tmp_res->start = res->start;
> +		tmp_res->end = res->end;
> +		tmp_res->flags = res->flags;
> +
> +		ret = insert_resource(&iomem_resource, tmp_res);
> +		if (ret < 0) {
> +			pr_err("Cannot insert IOMEM resource [%llx - %llx]\n",
> +			       tmp_res->start, tmp_res->end);
> +			kfree(tmp_res);
> +			goto err_insert;
> +		}
> +	}

I am a bit confused.. why do we need to do this? Who could be
erroneously re-using the region? Are you saying that the next time
allocate_resource is called it could find the same region again? It
doesn't seem possible?


>  	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
>  	if (!pgmap) {
>  		ret = -ENOMEM;
> @@ -95,12 +137,40 @@ static int fill_list(unsigned int nr_pages)
>  err_memremap:
>  	kfree(pgmap);
>  err_pgmap:
> +	if (tmp_res) {
> +		release_resource(tmp_res);
> +		kfree(tmp_res);
> +	}
> +err_insert:
>  	release_resource(res);
>  err_resource:
>  	kfree(res);
>  	return ret;
>  }
>  
> +static void unpopulated_init(void)
> +{
> +	static bool inited = false;

initialized = false


> +	int ret;
> +
> +	if (inited)
> +		return;
> +
> +	/*
> +	 * Try to initialize Xen resource the first and fall back to default
> +	 * resource if arch doesn't offer one.
> +	 */
> +	ret = arch_xen_unpopulated_init(&xen_resource);
> +	if (!ret)
> +		target_resource = &xen_resource;
> +	else if (ret == -ENOSYS)
> +		target_resource = &iomem_resource;
> +	else
> +		pr_err("Cannot initialize Xen resource\n");
> +
> +	inited = true;
> +}

Would it make sense to call unpopulated_init from an init function,
rather than every time xen_alloc_unpopulated_pages is called?


>  /**
>   * xen_alloc_unpopulated_pages - alloc unpopulated pages
>   * @nr_pages: Number of pages
> @@ -112,6 +182,16 @@ int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
>  	unsigned int i;
>  	int ret = 0;
>  
> +	unpopulated_init();
> +
> +	/*
> +	 * Fall back to default behavior if we do not have any suitable resource
> +	 * to allocate required region from and as the result we won't be able to
> +	 * construct pages.
> +	 */
> +	if (!target_resource)
> +		return alloc_xenballooned_pages(nr_pages, pages);

The commit message says that the behavior on x86 doesn't change but this
seems to be a change that could impact x86?


>  	mutex_lock(&list_lock);
>  	if (list_count < nr_pages) {
>  		ret = fill_list(nr_pages - list_count);
> @@ -159,6 +239,9 @@ void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
>  {
>  	unsigned int i;
>  
> +	if (!target_resource)
> +		return free_xenballooned_pages(nr_pages, pages);
> +
>  	mutex_lock(&list_lock);
>  	for (i = 0; i < nr_pages; i++) {
>  		pages[i]->zone_device_data = page_list;
> diff --git a/include/xen/xen.h b/include/xen/xen.h
> index 43efba0..55d2ef8 100644
> --- a/include/xen/xen.h
> +++ b/include/xen/xen.h
> @@ -55,6 +55,8 @@ extern u64 xen_saved_max_mem_size;
>  #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
>  int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
>  void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
> +struct resource;

This is to avoid having to #include linux/ioport.h, right? Is it a
problem or is it just to minimize the headers dependencies?

It looks like adding #include <linux/ioport.h> below #include
<linux/types.h> in include/xen/xen.h would work too. I am not sure what
is the best way though, I'll let Juergen comment.


> +int arch_xen_unpopulated_init(struct resource *res);
>  #else
>  #define xen_alloc_unpopulated_pages alloc_xenballooned_pages
>  #define xen_free_unpopulated_pages free_xenballooned_pages
> -- 
> 2.7.4
> 

