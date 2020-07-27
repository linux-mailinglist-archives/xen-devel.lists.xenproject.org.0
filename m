Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006D522E804
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 10:42:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzyiV-0001cc-UV; Mon, 27 Jul 2020 08:42:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jzyiU-0001cV-80
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 08:42:38 +0000
X-Inumbo-ID: 1ef7292e-cfe5-11ea-a774-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ef7292e-cfe5-11ea-a774-12813bfff9fa;
 Mon, 27 Jul 2020 08:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595839357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2o9INdDVMeRMpvPPdJXUmq8eiLdRA5WJoeGCeiRGYrU=;
 b=F73vK9BpepB+vPl+d+c78bY95pYqIU0GVLtohWw9kd+zjMGX069bJmnQ
 Tj1gfvPmyVUcTQSTAGykOb3Ic7D05uNr9RgV088pGbCuZ5SItOVLut+wm
 36ktWWWOeHylGtp9Ij9Vy5lRvzK69PN1JMfHxiR+Ae39mBOpufYtNuBao k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Yca7UCFJpaeOVZ9HKKhOTpqfBIiKAriZvcgYQaPo0HE6fOZZvkR2AsF9VPPYu+epj83BLXOj3k
 gl4P3yNaDa+q84isI/NKLZRu5XiC5bGaEOEF3FTgoj+iZcb/ix9957FLQMorJuzTQAIMY4mlrr
 +Np4yzWrMWMuXFxxLOYqckYRLVib17RgIt6eFK+1pbXrqnh8A0gbggdDiPM/afSmih9XF5fKrg
 wxNMorQafr287qc0Qw8RptqovfS5+FeO5tPZwpnc2Guobc2FdC+j1QTLSlRwnKGOD1mALt5D0y
 MwQ=
X-SBRS: 2.7
X-MesageID: 23253209
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23253209"
Date: Mon, 27 Jul 2020 10:42:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 4/4] xen: add helpers to allocate unpopulated memory
Message-ID: <20200727084216.GO7191@Air-de-Roger>
References: <20200724124241.48208-1-roger.pau@citrix.com>
 <20200724124241.48208-5-roger.pau@citrix.com>
 <1778c97f-3a69-8280-141c-879814dd213f@redhat.com>
 <1fd1d29e-5c10-0c29-0628-b79807f81de6@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fd1d29e-5c10-0c29-0628-b79807f81de6@oracle.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan
 Yankovskyi <yyankovskyi@gmail.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Daniel Vetter <daniel@ffwll.ch>, xen-devel@lists.xenproject.org,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 24, 2020 at 12:36:33PM -0400, Boris Ostrovsky wrote:
> On 7/24/20 10:34 AM, David Hildenbrand wrote:
> > CCing Dan
> >
> > On 24.07.20 14:42, Roger Pau Monne wrote:
> >> +
> >> +#include <linux/errno.h>
> >> +#include <linux/gfp.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/mm.h>
> >> +#include <linux/memremap.h>
> >> +#include <linux/slab.h>
> >> +
> >> +#include <asm/page.h>
> >> +
> >> +#include <xen/page.h>
> >> +#include <xen/xen.h>
> >> +
> >> +static DEFINE_MUTEX(lock);
> >> +static LIST_HEAD(list);
> >> +static unsigned int count;
> >> +
> >> +static int fill(unsigned int nr_pages)
> 
> 
> Less generic names? How about  list_lock, pg_list, pg_count,
> fill_pglist()? (But these are bad too, so maybe you can come up with
> something better)

OK, I have to admit I like using such short names when the code allows
to, for example this code is so simple that it didn't seem to warrant
using longer names. Will rename on next version.

> >> +{
> >> +	struct dev_pagemap *pgmap;
> >> +	void *vaddr;
> >> +	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
> >> +	int nid, ret;
> >> +
> >> +	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
> >> +	if (!pgmap)
> >> +		return -ENOMEM;
> >> +
> >> +	pgmap->type = MEMORY_DEVICE_DEVDAX;
> >> +	pgmap->res.name = "XEN SCRATCH";
> 
> 
> Typically iomem resources only capitalize first letters.
> 
> 
> >> +	pgmap->res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> >> +
> >> +	ret = allocate_resource(&iomem_resource, &pgmap->res,
> >> +				alloc_pages * PAGE_SIZE, 0, -1,
> >> +				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
> 
> 
> Are we not going to end up with a whole bunch of "Xen scratch" resource
> ranges for each miss in the page list? Or do we expect them to get merged?

PAGES_PER_SECTION is IMO big enough to prevent ending up with a lot of
separated ranges. I think the value is 32 or 64MiB on x86, so while we
are likely to end up with more than one resource added, I don't think
it's going to be massive.

> 
> >> +	if (ret < 0) {
> >> +		pr_err("Cannot allocate new IOMEM resource\n");
> >> +		kfree(pgmap);
> >> +		return ret;
> >> +	}
> >> +
> >> +	nid = memory_add_physaddr_to_nid(pgmap->res.start);
> 
> 
> Should we consider page range crossing node boundaries?

I'm not sure whether this is possible (I would think allocate_resource
should return a range from a single node), but then it would greatly
complicate the code to perform the memremap_pages, as we would have to
split the region into multiple dev_pagemap structs.

FWIW the current code in the balloon driver does exactly the same
(which doesn't mean it's correct, but that's where I got the logic
from).

> >> +
> >> +#ifdef CONFIG_XEN_HAVE_PVMMU
> >> +	/*
> >> +	 * We don't support PV MMU when Linux and Xen is using
> >> +	 * different page granularity.
> >> +	 */
> >> +	BUILD_BUG_ON(XEN_PAGE_SIZE != PAGE_SIZE);
> >> +
> >> +        /*
> >> +         * memremap will build page tables for the new memory so
> >> +         * the p2m must contain invalid entries so the correct
> >> +         * non-present PTEs will be written.
> >> +         *
> >> +         * If a failure occurs, the original (identity) p2m entries
> >> +         * are not restored since this region is now known not to
> >> +         * conflict with any devices.
> >> +         */
> >> +	if (!xen_feature(XENFEAT_auto_translated_physmap)) {
> >> +		xen_pfn_t pfn = PFN_DOWN(pgmap->res.start);
> >> +
> >> +		for (i = 0; i < alloc_pages; i++) {
> >> +			if (!set_phys_to_machine(pfn + i, INVALID_P2M_ENTRY)) {
> >> +				pr_warn("set_phys_to_machine() failed, no memory added\n");
> >> +				release_resource(&pgmap->res);
> >> +				kfree(pgmap);
> >> +				return -ENOMEM;
> >> +			}
> >> +                }
> >> +	}
> >> +#endif
> >> +
> >> +	vaddr = memremap_pages(pgmap, nid);
> >> +	if (IS_ERR(vaddr)) {
> >> +		pr_err("Cannot remap memory range\n");
> >> +		release_resource(&pgmap->res);
> >> +		kfree(pgmap);
> >> +		return PTR_ERR(vaddr);
> >> +	}
> >> +
> >> +	for (i = 0; i < alloc_pages; i++) {
> >> +		struct page *pg = virt_to_page(vaddr + PAGE_SIZE * i);
> >> +
> >> +		BUG_ON(!virt_addr_valid(vaddr + PAGE_SIZE * i));
> >> +		list_add(&pg->lru, &list);
> >> +		count++;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +/**
> >> + * xen_alloc_unpopulated_pages - alloc unpopulated pages
> >> + * @nr_pages: Number of pages
> >> + * @pages: pages returned
> >> + * @return 0 on success, error otherwise
> >> + */
> >> +int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
> >> +{
> >> +	unsigned int i;
> >> +	int ret = 0;
> >> +
> >> +	mutex_lock(&lock);
> >> +	if (count < nr_pages) {
> >> +		ret = fill(nr_pages);
> 
> 
> (nr_pages - count) ?

Yup, already fixed as Juergen also pointed it out.

> >> +
> >> +#ifdef CONFIG_XEN_PV
> >> +static int __init init(void)
> >> +{
> >> +	unsigned int i;
> >> +
> >> +	if (!xen_domain())
> >> +		return -ENODEV;
> >> +
> >> +	/*
> >> +	 * Initialize with pages from the extra memory regions (see
> >> +	 * arch/x86/xen/setup.c).
> >> +	 */
> 
> 
> This loop will be executing only for PV guests so we can just bail out
> for non-PV guests here.

Sure.

Thanks, Roger.

