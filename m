Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D763791B2
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 16:59:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125298.235850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg7Md-0004CQ-CL; Mon, 10 May 2021 14:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125298.235850; Mon, 10 May 2021 14:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg7Md-0004AY-9E; Mon, 10 May 2021 14:58:31 +0000
Received: by outflank-mailman (input) for mailman id 125298;
 Mon, 10 May 2021 14:58:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5bM6=KF=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lg7Mb-0004AQ-An
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 14:58:29 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ed29534-d824-44e2-9d55-8d77ae5a880b;
 Mon, 10 May 2021 14:58:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7F6AC67373; Mon, 10 May 2021 16:58:23 +0200 (CEST)
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
X-Inumbo-ID: 9ed29534-d824-44e2-9d55-8d77ae5a880b
Date: Mon, 10 May 2021 16:58:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	benh@kernel.crashing.org, paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org, Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com, xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org,
	bauerman@linux.ibm.com, peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>, tfiga@chromium.org,
	bskeggs@redhat.com, bhelgaas@google.com, chris@chris-wilson.co.uk,
	daniel@ffwll.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	jxgao@google.com, joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com, nouveau@lists.freedesktop.org,
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v6 01/15] swiotlb: Refactor swiotlb init functions
Message-ID: <20210510145823.GA28066@lst.de>
References: <20210510095026.3477496-1-tientzu@chromium.org> <20210510095026.3477496-2-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510095026.3477496-2-tientzu@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

