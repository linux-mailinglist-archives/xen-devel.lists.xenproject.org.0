Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F4E96396B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 06:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785419.1194861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjWnr-0004uU-Df; Thu, 29 Aug 2024 04:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785419.1194861; Thu, 29 Aug 2024 04:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjWnr-0004sv-Ak; Thu, 29 Aug 2024 04:30:35 +0000
Received: by outflank-mailman (input) for mailman id 785419;
 Thu, 29 Aug 2024 04:30:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EacX=P4=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sjWnp-0004sn-1Y
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 04:30:33 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d05eb61-65bf-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 06:30:31 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F39EA68AFE; Thu, 29 Aug 2024 06:30:27 +0200 (CEST)
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
X-Inumbo-ID: 6d05eb61-65bf-11ef-a0b0-8be0dac302b0
Date: Thu, 29 Aug 2024 06:30:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Larsson <andreas@gaisler.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/2] dma-mapping: clearly mark DMA ops as an
 architecture feature
Message-ID: <20240829043027.GA4707@lst.de>
References: <20240828061104.1925127-1-hch@lst.de> <20240828061104.1925127-3-hch@lst.de> <12a0f286-3114-4dac-8b75-3a638d9c8635@gaisler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12a0f286-3114-4dac-8b75-3a638d9c8635@gaisler.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Aug 28, 2024 at 08:21:14AM +0200, Andreas Larsson wrote:
> On 2024-08-28 08:10, Christoph Hellwig wrote:
> > --- a/drivers/xen/Kconfig
> > +++ b/drivers/xen/Kconfig
> > @@ -177,8 +177,8 @@ config XEN_GRANT_DMA_ALLOC
> >  
> >  config SWIOTLB_XEN
> >  	def_bool y
> > +	depends on ARCH_DMA_OPS
> 
> Rename to ARCH_HAS_DMA_OPS in v2 is missing here

Thanks,

I've fixed this up locally now.

