Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFA9259120
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 16:46:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD7Xk-0003pS-Uq; Tue, 01 Sep 2020 14:45:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD7Xj-0003pN-Ry
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 14:45:51 +0000
X-Inumbo-ID: 0071c89e-c8d3-4993-b6ff-c804dbd5b542
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0071c89e-c8d3-4993-b6ff-c804dbd5b542;
 Tue, 01 Sep 2020 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598971549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JdnTGG+FGAeYr/CaqX7nq47kV+5WzzeAxfnDtVerGyo=;
 b=SLYjGoK4HrL2DpYCS1/LA5fdNb6dd2b0HWdODbI8HSC7FhijV+TQKZ97
 LifBAsjQ7fJGXaZoEthWj6XaT/w42H+GOl68pg3oSvTYdXp4+Mh5q9I82
 BxrHH5BIsODzkymIMNgHAQzOmo3ZIe4ALpMvdlTLKnJf/MgwwKdMCSdmX Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Fx1CBO5kj/E1oAMz1SNj/x+W2f0hG4uH49vCOwacHjqiEVjH7W+Z6ZuJZjjum/02jE8xubVska
 3sIRr0yzCkV4UFYdAcAEcQc4GhV+gB8w1o75XW1D5ExaZvi5cN6ZLmCer9O+ksnWJQiP2Sgj10
 qB4qwe6YKfcng8UZr3n0SOQ5PpIFcJuHhd74YlTayszxMAsS0OrjOzM8z+nks1IfNFppYINasU
 Ro6lhbOIuB5NwPtFeaSBPdzODMC3WqFYJrILMML41cyYE6RwfKjxRUW9A0yz27uqJzHVG1uKB9
 Dt4=
X-SBRS: 2.7
X-MesageID: 26701517
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,379,1592884800"; d="scan'208";a="26701517"
Date: Tue, 1 Sep 2020 16:45:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Dan Carpenter
 <dan.carpenter@oracle.com>, Wei Liu <wl@xen.org>, Yan Yankovskyi
 <yyankovskyi@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <xen-devel@lists.xenproject.org>, <linux-mm@kvack.org>, David Hildenbrand
 <david@redhat.com>, Michal Hocko <mhocko@kernel.org>, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: [PATCH v5 3/3] xen: add helpers to allocate unpopulated memory
Message-ID: <20200901144539.GI753@Air-de-Roger>
References: <20200901083326.21264-1-roger.pau@citrix.com>
 <20200901083326.21264-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200901083326.21264-4-roger.pau@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Tue, Sep 01, 2020 at 10:33:26AM +0200, Roger Pau Monne wrote:
> +static int fill_list(unsigned int nr_pages)
> +{
> +	struct dev_pagemap *pgmap;
> +	void *vaddr;
> +	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
> +	int nid, ret;
> +
> +	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
> +	if (!pgmap)
> +		return -ENOMEM;
> +
> +	pgmap->type = MEMORY_DEVICE_GENERIC;
> +	pgmap->res.name = "Xen scratch";
> +	pgmap->res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> +
> +	ret = allocate_resource(&iomem_resource, &pgmap->res,
> +				alloc_pages * PAGE_SIZE, 0, -1,
> +				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
> +	if (ret < 0) {
> +		pr_err("Cannot allocate new IOMEM resource\n");
> +		kfree(pgmap);
> +		return ret;
> +	}
> +
> +	nid = memory_add_physaddr_to_nid(pgmap->res.start);

I think this is not needed ...

> +
> +#ifdef CONFIG_XEN_HAVE_PVMMU
> +        /*
> +         * memremap will build page tables for the new memory so
> +         * the p2m must contain invalid entries so the correct
> +         * non-present PTEs will be written.
> +         *
> +         * If a failure occurs, the original (identity) p2m entries
> +         * are not restored since this region is now known not to
> +         * conflict with any devices.
> +         */
> +	if (!xen_feature(XENFEAT_auto_translated_physmap)) {
> +		xen_pfn_t pfn = PFN_DOWN(pgmap->res.start);
> +
> +		for (i = 0; i < alloc_pages; i++) {
> +			if (!set_phys_to_machine(pfn + i, INVALID_P2M_ENTRY)) {
> +				pr_warn("set_phys_to_machine() failed, no memory added\n");
> +				release_resource(&pgmap->res);
> +				kfree(pgmap);
> +				return -ENOMEM;
> +			}
> +                }
> +	}
> +#endif
> +
> +	vaddr = memremap_pages(pgmap, nid);

... and NUMA_NO_NODE should be used here instead, as this memory is just
fictitious space to map foreign memory, and shouldn't be related to
any NUMA node.

The following chunk should be folded in, or I can resend.

Thanks, Roger.
---8<---
diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index 1b5d157c6977..3b98dc921426 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -20,7 +20,7 @@ static int fill_list(unsigned int nr_pages)
 	struct dev_pagemap *pgmap;
 	void *vaddr;
 	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
-	int nid, ret;
+	int ret;
 
 	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
 	if (!pgmap)
@@ -39,8 +39,6 @@ static int fill_list(unsigned int nr_pages)
 		return ret;
 	}
 
-	nid = memory_add_physaddr_to_nid(pgmap->res.start);
-
 #ifdef CONFIG_XEN_HAVE_PVMMU
         /*
          * memremap will build page tables for the new memory so
@@ -65,7 +63,7 @@ static int fill_list(unsigned int nr_pages)
 	}
 #endif
 
-	vaddr = memremap_pages(pgmap, nid);
+	vaddr = memremap_pages(pgmap, NUMA_NO_NODE);
 	if (IS_ERR(vaddr)) {
 		pr_err("Cannot remap memory range\n");
 		release_resource(&pgmap->res);


