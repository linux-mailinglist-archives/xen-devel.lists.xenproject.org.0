Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82FD3ACD99
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 16:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144704.266305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luFXg-0005JB-Ch; Fri, 18 Jun 2021 14:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144704.266305; Fri, 18 Jun 2021 14:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luFXg-0005HM-9T; Fri, 18 Jun 2021 14:32:20 +0000
Received: by outflank-mailman (input) for mailman id 144704;
 Fri, 18 Jun 2021 14:32:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l/oB=LM=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1luFXe-0005HG-A3
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 14:32:18 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8fdbde9-77ec-47df-b4e4-dea65f9d1b95;
 Fri, 18 Jun 2021 14:32:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 64B2C68D08; Fri, 18 Jun 2021 16:32:12 +0200 (CEST)
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
X-Inumbo-ID: d8fdbde9-77ec-47df-b4e4-dea65f9d1b95
Date: Fri, 18 Jun 2021 16:32:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Claire Chang <tientzu@chromium.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	benh@kernel.crashing.org, paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com,
	xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org,
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
	Jim Quinlan <james.quinlan@broadcom.com>,
	Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com,
	Bjorn Helgaas <bhelgaas@google.com>, chris@chris-wilson.co.uk,
	Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com, Jianxiong Gao <jxgao@google.com>,
	joonas.lahtinen@linux.intel.com, linux-pci@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v13 01/12] swiotlb: Refactor swiotlb init functions
Message-ID: <20210618143212.GA19284@lst.de>
References: <20210617062635.1660944-1-tientzu@chromium.org> <20210617062635.1660944-2-tientzu@chromium.org> <alpine.DEB.2.21.2106171434480.24906@sstabellini-ThinkPad-T480s> <CALiNf29SJ0jXirWVDhJw4BUNvkjUeGPyGNJK9m8c30OPX41=5Q@mail.gmail.com> <741a34cc-547c-984d-8af4-2f309880acfa@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <741a34cc-547c-984d-8af4-2f309880acfa@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Jun 18, 2021 at 09:09:17AM -0500, Tom Lendacky wrote:
> > swiotlb_init_with_tbl uses memblock_alloc to allocate the io_tlb_mem
> > and memblock_alloc[1] will do memset in memblock_alloc_try_nid[2], so
> > swiotlb_init_with_tbl is also good.
> > I'm happy to add the memset in swiotlb_init_io_tlb_mem if you think
> > it's clearer and safer.
> 
> On x86, if the memset is done before set_memory_decrypted() and memory
> encryption is active, then the memory will look like ciphertext afterwards
> and not be zeroes. If zeroed memory is required, then a memset must be
> done after the set_memory_decrypted() calls.

Which should be fine - we don't care that the memory is cleared to 0,
just that it doesn't leak other data.  Maybe a comment would be useful,
though,

