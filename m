Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E9456727
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 01:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227604.393696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnsFB-00083y-41; Fri, 19 Nov 2021 00:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227604.393696; Fri, 19 Nov 2021 00:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnsFB-00082C-13; Fri, 19 Nov 2021 00:59:09 +0000
Received: by outflank-mailman (input) for mailman id 227604;
 Fri, 19 Nov 2021 00:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVl8=QG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mnsF9-000826-J0
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 00:59:07 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3c51046-48d3-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 01:59:05 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17C5460F14;
 Fri, 19 Nov 2021 00:59:03 +0000 (UTC)
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
X-Inumbo-ID: e3c51046-48d3-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637283543;
	bh=GctSgusPNnJzGCE58MSOzEI8+sqmTJV7hQouDc+Ntmc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SZUhPGRT21IfRbX1voo4H4AZ9pzIFRQgrJEpMvgKjy2I1dgUd7sy0SEHjWSksWvwF
	 uA/70iA/c1c27rkXlmIPMKM32ePXHlyv9HIAFmOqNcpRYxylCn7bj3m8QbsEFb51OG
	 9oyJoxNa1XnPszreDyST04klLVrBj+F47pdJ7JhE3BmmD8pku5r81nZnDABboKioE+
	 fU7PmR6LpZ4k7udS1giyaZUFc1ts7mA0vvymqakpN3oamQsNnU3/66eRjOXMSRB2JV
	 B4rEj0pyDOWpc9hd0h3h4CB+a4TcqlTMAI3iOAKu8F11tKL7OIy9sn1iTZxxMxWFE3
	 sKOIIc9xd8dwg==
Date: Thu, 18 Nov 2021 16:59:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V2 3/4] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
In-Reply-To: <1d122e60-df9c-2ac6-8148-f6a836b9e51d@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2111181642340.1412361@ubuntu-linux-20-04-desktop>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com> <1635264312-3796-4-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2110280920110.20134@sstabellini-ThinkPad-T480s> <1d122e60-df9c-2ac6-8148-f6a836b9e51d@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Nov 2021, Oleksandr wrote:
> On 28.10.21 19:37, Stefano Stabellini wrote:
> 
> Hi Stefano
> 
> I am sorry for the late response.
> 
> > On Tue, 26 Oct 2021, Oleksandr Tyshchenko wrote:
> > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > 
> > > The main reason of this change is that unpopulated-alloc
> > > code cannot be used in its current form on Arm, but there
> > > is a desire to reuse it to avoid wasting real RAM pages
> > > for the grant/foreign mappings.
> > > 
> > > The problem is that system "iomem_resource" is used for
> > > the address space allocation, but the really unallocated
> > > space can't be figured out precisely by the domain on Arm
> > > without hypervisor involvement. For example, not all device
> > > I/O regions are known by the time domain starts creating
> > > grant/foreign mappings. And following the advise from
> > > "iomem_resource" we might end up reusing these regions by
> > > a mistake. So, the hypervisor which maintains the P2M for
> > > the domain is in the best position to provide unused regions
> > > of guest physical address space which could be safely used
> > > to create grant/foreign mappings.
> > > 
> > > Introduce new helper arch_xen_unpopulated_init() which purpose
> > > is to create specific Xen resource based on the memory regions
> > > provided by the hypervisor to be used as unused space for Xen
> > > scratch pages.
> > > 
> > > If arch doesn't implement arch_xen_unpopulated_init() to
> > > initialize Xen resource the default "iomem_resource" will be used.
> > > So the behavior on x86 won't be changed.
> > > 
> > > Also fall back to allocate xenballooned pages (steal real RAM
> > > pages) if we do not have any suitable resource to work with and
> > > as the result we won't be able to provide unpopulated pages.
> > > 
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > ---
> > > Changes RFC -> V2:
> > >     - new patch, instead of
> > >      "[RFC PATCH 2/2] xen/unpopulated-alloc: Query hypervisor to provide
> > > unallocated space"
> > > ---
> > >   drivers/xen/unpopulated-alloc.c | 89
> > > +++++++++++++++++++++++++++++++++++++++--
> > >   include/xen/xen.h               |  2 +
> > >   2 files changed, 88 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/xen/unpopulated-alloc.c
> > > b/drivers/xen/unpopulated-alloc.c
> > > index a03dc5b..1f1d8d8 100644
> > > --- a/drivers/xen/unpopulated-alloc.c
> > > +++ b/drivers/xen/unpopulated-alloc.c
> > > @@ -8,6 +8,7 @@
> > >     #include <asm/page.h>
> > >   +#include <xen/balloon.h>
> > >   #include <xen/page.h>
> > >   #include <xen/xen.h>
> > >   @@ -15,13 +16,29 @@ static DEFINE_MUTEX(list_lock);
> > >   static struct page *page_list;
> > >   static unsigned int list_count;
> > >   +static struct resource *target_resource;
> > > +static struct resource xen_resource = {
> > > +	.name = "Xen unused space",
> > > +};
> > > +
> > > +/*
> > > + * If arch is not happy with system "iomem_resource" being used for
> > > + * the region allocation it can provide it's own view by initializing
> > > + * "xen_resource" with unused regions of guest physical address space
> > > + * provided by the hypervisor.
> > > + */
> > > +int __weak arch_xen_unpopulated_init(struct resource *res)
> > > +{
> > > +	return -ENOSYS;
> > > +}
> > > +
> > >   static int fill_list(unsigned int nr_pages)
> > >   {
> > >   	struct dev_pagemap *pgmap;
> > > -	struct resource *res;
> > > +	struct resource *res, *tmp_res = NULL;
> > >   	void *vaddr;
> > >   	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
> > > -	int ret = -ENOMEM;
> > > +	int ret;
> > >     	res = kzalloc(sizeof(*res), GFP_KERNEL);
> > >   	if (!res)
> > > @@ -30,7 +47,7 @@ static int fill_list(unsigned int nr_pages)
> > >   	res->name = "Xen scratch";
> > >   	res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> > >   -	ret = allocate_resource(&iomem_resource, res,
> > > +	ret = allocate_resource(target_resource, res,
> > >   				alloc_pages * PAGE_SIZE, 0, -1,
> > >   				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
> > >   	if (ret < 0) {
> > > @@ -38,6 +55,31 @@ static int fill_list(unsigned int nr_pages)
> > >   		goto err_resource;
> > >   	}
> > >   +	/*
> > > +	 * Reserve the region previously allocated from Xen resource to avoid
> > > +	 * re-using it by someone else.
> > > +	 */
> > > +	if (target_resource != &iomem_resource) {
> > > +		tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
> > > +		if (!res) {
> > > +			ret = -ENOMEM;
> > > +			goto err_insert;
> > > +		}
> > > +
> > > +		tmp_res->name = res->name;
> > > +		tmp_res->start = res->start;
> > > +		tmp_res->end = res->end;
> > > +		tmp_res->flags = res->flags;
> > > +
> > > +		ret = insert_resource(&iomem_resource, tmp_res);
> > > +		if (ret < 0) {
> > > +			pr_err("Cannot insert IOMEM resource [%llx - %llx]\n",
> > > +			       tmp_res->start, tmp_res->end);
> > > +			kfree(tmp_res);
> > > +			goto err_insert;
> > > +		}
> > > +	}
> > I am a bit confused.. why do we need to do this? Who could be
> > erroneously re-using the region? Are you saying that the next time
> > allocate_resource is called it could find the same region again? It
> > doesn't seem possible?
> 
> 
> No, as I understand the allocate_resource() being called for the same root
> resource won't provide the same region... We only need to do this (insert the
> region into "iomem_resource") if we allocated it from our *internal*
> "xen_resource", as *global* "iomem_resource" (which is used everywhere) is not
> aware of that region has been already allocated. So inserting a region here we
> reserving it, otherwise it could be reused elsewhere.

But elsewhere where?

Let's say that allocate_resource allocates a range from xen_resource.
From reading the code, it doesn't look like iomem_resource would have
that range because the extended regions described under /hypervisor are
not added automatically to iomem_resource.

So what if we don't call insert_resource? Nothing could allocate the
same range because iomem_resource doesn't have it at all and
xen_resource is not used anywhere if not here.

What am I missing?


Or maybe it is the other way around: core Linux code assumes everything
is described in iomem_resource so something under kernel/ or mm/ would
crash if we start using a page pointing to an address missing from
iomem_resource?
 
 
> > >   	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
> > >   	if (!pgmap) {
> > >   		ret = -ENOMEM;
> > > @@ -95,12 +137,40 @@ static int fill_list(unsigned int nr_pages)
> > >   err_memremap:
> > >   	kfree(pgmap);
> > >   err_pgmap:
> > > +	if (tmp_res) {
> > > +		release_resource(tmp_res);
> > > +		kfree(tmp_res);
> > > +	}
> > > +err_insert:
> > >   	release_resource(res);
> > >   err_resource:
> > >   	kfree(res);
> > >   	return ret;
> > >   }
> > >   +static void unpopulated_init(void)
> > > +{
> > > +	static bool inited = false;
> > initialized = false
> 
> ok.
> 
> 
> > 
> > 
> > > +	int ret;
> > > +
> > > +	if (inited)
> > > +		return;
> > > +
> > > +	/*
> > > +	 * Try to initialize Xen resource the first and fall back to default
> > > +	 * resource if arch doesn't offer one.
> > > +	 */
> > > +	ret = arch_xen_unpopulated_init(&xen_resource);
> > > +	if (!ret)
> > > +		target_resource = &xen_resource;
> > > +	else if (ret == -ENOSYS)
> > > +		target_resource = &iomem_resource;
> > > +	else
> > > +		pr_err("Cannot initialize Xen resource\n");
> > > +
> > > +	inited = true;
> > > +}
> > Would it make sense to call unpopulated_init from an init function,
> > rather than every time xen_alloc_unpopulated_pages is called?
> 
> Good point, thank you. Will do. To be honest, I also don't like the current
> approach much.
> 
> 
> > 
> > 
> > >   /**
> > >    * xen_alloc_unpopulated_pages - alloc unpopulated pages
> > >    * @nr_pages: Number of pages
> > > @@ -112,6 +182,16 @@ int xen_alloc_unpopulated_pages(unsigned int
> > > nr_pages, struct page **pages)
> > >   	unsigned int i;
> > >   	int ret = 0;
> > >   +	unpopulated_init();
> > > +
> > > +	/*
> > > +	 * Fall back to default behavior if we do not have any suitable
> > > resource
> > > +	 * to allocate required region from and as the result we won't be able
> > > to
> > > +	 * construct pages.
> > > +	 */
> > > +	if (!target_resource)
> > > +		return alloc_xenballooned_pages(nr_pages, pages);
> > The commit message says that the behavior on x86 doesn't change but this
> > seems to be a change that could impact x86?
> I don't think, however I didn't tested on x86 and might be wrong, but
> according to the current patch, on x86 the "target_resource" is always valid
> and points to the "iomem_resource" as arch_xen_unpopulated_init() is not
> implemented. So there won't be any fallback to use
> alloc_(free)_xenballooned_pages() here and fill_list() will behave as usual.
 
If target_resource is always valid, then we don't need this special
check. In fact, the condition should never be true.


> You raised a really good question, on Arm we need a fallback to balloon out
> RAM pages again if hypervisor doesn't provide extended regions (we run on old
> version, no unused regions with reasonable size, etc), so I decided to put a
> fallback code here, an indicator of the failure is invalid "target_resource".

I think it is unnecessary as we already assume today that
&iomem_resource is always available.


> I noticed the patch which is about to be upstreamed that removes
> alloc_(free)xenballooned_pages API [1]. Right now I have no idea how/where
> this fallback could be implemented as this is under build option control
> (CONFIG_XEN_UNPOPULATED_ALLOC). So the API with the same name is either used
> for unpopulated pages (if set) or ballooned pages (if not set). I would
> appreciate suggestions regarding that. I am wondering would it be possible and
> correctly to have both mechanisms (unpopulated and ballooned) enabled by
> default and some init code to decide which one to use at runtime or some sort?

I would keep it simple and remove the fallback from this patch. So:

- if not CONFIG_XEN_UNPOPULATED_ALLOC, then balloon
- if CONFIG_XEN_UNPOPULATED_ALLOC, then
    - xen_resource if present
    - otherwise iomem_resource

The xen_resource/iomem_resource config can be done at init time using
target_resource. At runtime, target_resource is always != NULL so we
just go ahead and use it.

 
> > 
> > >   	mutex_lock(&list_lock);
> > >   	if (list_count < nr_pages) {
> > >   		ret = fill_list(nr_pages - list_count);
> > > @@ -159,6 +239,9 @@ void xen_free_unpopulated_pages(unsigned int nr_pages,
> > > struct page **pages)
> > >   {
> > >   	unsigned int i;
> > >   +	if (!target_resource)
> > > +		return free_xenballooned_pages(nr_pages, pages);
> > > +
> > >   	mutex_lock(&list_lock);
> > >   	for (i = 0; i < nr_pages; i++) {
> > >   		pages[i]->zone_device_data = page_list;
> > > diff --git a/include/xen/xen.h b/include/xen/xen.h
> > > index 43efba0..55d2ef8 100644
> > > --- a/include/xen/xen.h
> > > +++ b/include/xen/xen.h
> > > @@ -55,6 +55,8 @@ extern u64 xen_saved_max_mem_size;
> > >   #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
> > >   int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page
> > > **pages);
> > >   void xen_free_unpopulated_pages(unsigned int nr_pages, struct page
> > > **pages);
> > > +struct resource;
> > This is to avoid having to #include linux/ioport.h, right? Is it a
> > problem or is it just to minimize the headers dependencies?
> > 
> > It looks like adding #include <linux/ioport.h> below #include
> > <linux/types.h> in include/xen/xen.h would work too. I am not sure what
> > is the best way though, I'll let Juergen comment.
> Yes, the initial reason to use forward declaration here was to minimize the
> headers dependencies.
> I have rechecked, your suggestion works as well, thank you. So I would be OK
> either way, let's wait for other opinions.
> 
> 
> > 
> > 
> > > +int arch_xen_unpopulated_init(struct resource *res);
> > >   #else
> > >   #define xen_alloc_unpopulated_pages alloc_xenballooned_pages
> > >   #define xen_free_unpopulated_pages free_xenballooned_pages
> > > -- 
> > > 2.7.4
> > > 
> 
> [1] https://lore.kernel.org/lkml/20211102092234.17852-1-jgross@suse.com/
> 
> -- 
> Regards,
> 
> Oleksandr Tyshchenko
> 

