Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05343AF38C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 20:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145658.267854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvOCk-0008JA-1K; Mon, 21 Jun 2021 17:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145658.267854; Mon, 21 Jun 2021 17:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvOCj-0008HM-U8; Mon, 21 Jun 2021 17:59:25 +0000
Received: by outflank-mailman (input) for mailman id 145658;
 Mon, 21 Jun 2021 17:59:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcYN=LP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lvOCi-0008HG-0G
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 17:59:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eee13637-5c1e-4326-b4f7-d79d554dd7b3;
 Mon, 21 Jun 2021 17:59:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94438611CE;
 Mon, 21 Jun 2021 17:59:20 +0000 (UTC)
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
X-Inumbo-ID: eee13637-5c1e-4326-b4f7-d79d554dd7b3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624298362;
	bh=y8attfyCFvmhE/rEq1lKuxtMSlY+L9uu0zEo4FMjkv8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nVdx/hwygYr/MG4oSfAecQoTkcAWFsVr6dFhXJUhFXwqSbH08hcJcQHHaJ6yNTgwJ
	 WFFrnk+RLaMbXPz1Xtr0MorwwBCBRCnNVEqXP2tUXHhGV2Usf3U4gjEu3zxeInr5od
	 B9ktxTxXUHFXTSVy1nFGEpPSBK9O5Aws7oD7ucKaVc2hx8hm7IAXVZOQ8U1l9ZRj62
	 sEXsTrg9MCBDzVl47wBX5+3xzZhCsWmVRvgAWZv47Xmzv8udI19xFqd0CjGvBvgqzh
	 BtSw3vV40r9z2Jdokw3+RVbueWCN8P3KLA5YE9ZkG0ZSqiTJvVk9SGjw4FEHT8nF7N
	 esGUOKjtCMepQ==
Date: Mon, 21 Jun 2021 10:59:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
cc: Tom Lendacky <thomas.lendacky@amd.com>, 
    Claire Chang <tientzu@chromium.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, 
    Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
    Frank Rowand <frowand.list@gmail.com>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, 
    jgross@suse.com, Marek Szyprowski <m.szyprowski@samsung.com>, 
    benh@kernel.crashing.org, paulus@samba.org, 
    "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, 
    Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, 
    xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>, mingo@kernel.org, 
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
    xen-devel@lists.xenproject.org, Nicolas Boichat <drinkcat@chromium.org>, 
    Jim Quinlan <james.quinlan@broadcom.com>, Tomasz Figa <tfiga@chromium.org>, 
    bskeggs@redhat.com, Bjorn Helgaas <bhelgaas@google.com>, 
    chris@chris-wilson.co.uk, Daniel Vetter <daniel@ffwll.ch>, 
    airlied@linux.ie, dri-devel@lists.freedesktop.org, 
    intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
    Jianxiong Gao <jxgao@google.com>, joonas.lahtinen@linux.intel.com, 
    linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
    matthew.auld@intel.com, rodrigo.vivi@intel.com, 
    thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v13 01/12] swiotlb: Refactor swiotlb init functions
In-Reply-To: <20210618143212.GA19284@lst.de>
Message-ID: <alpine.DEB.2.21.2106211052270.24906@sstabellini-ThinkPad-T480s>
References: <20210617062635.1660944-1-tientzu@chromium.org> <20210617062635.1660944-2-tientzu@chromium.org> <alpine.DEB.2.21.2106171434480.24906@sstabellini-ThinkPad-T480s> <CALiNf29SJ0jXirWVDhJw4BUNvkjUeGPyGNJK9m8c30OPX41=5Q@mail.gmail.com>
 <741a34cc-547c-984d-8af4-2f309880acfa@amd.com> <20210618143212.GA19284@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Jun 2021, Christoph Hellwig wrote:
> On Fri, Jun 18, 2021 at 09:09:17AM -0500, Tom Lendacky wrote:
> > > swiotlb_init_with_tbl uses memblock_alloc to allocate the io_tlb_mem
> > > and memblock_alloc[1] will do memset in memblock_alloc_try_nid[2], so
> > > swiotlb_init_with_tbl is also good.
> > > I'm happy to add the memset in swiotlb_init_io_tlb_mem if you think
> > > it's clearer and safer.
> > 
> > On x86, if the memset is done before set_memory_decrypted() and memory
> > encryption is active, then the memory will look like ciphertext afterwards
> > and not be zeroes. If zeroed memory is required, then a memset must be
> > done after the set_memory_decrypted() calls.
> 
> Which should be fine - we don't care that the memory is cleared to 0,
> just that it doesn't leak other data.  Maybe a comment would be useful,
> though,

Just as a clarification: I was referring to the zeroing of "mem" in
swiotlb_late_init_with_tbl and swiotlb_init_with_tbl. While it looks
like Tom and Christoph are talking about the zeroing of "tlb".

The zeroing of "mem" is required as some fields of struct io_tlb_mem
need to be initialized to zero. While the zeroing of "tlb" is not
required except from the point of view of not leaking sensitive data as
Christoph mentioned.

Either way, Claire's v14 patch 01/12 looks fine to me.

