Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A1B26DE6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 19:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082111.1442024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umbzM-0000CC-Oi; Thu, 14 Aug 2025 17:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082111.1442024; Thu, 14 Aug 2025 17:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umbzM-00008w-Le; Thu, 14 Aug 2025 17:43:44 +0000
Received: by outflank-mailman (input) for mailman id 1082111;
 Thu, 14 Aug 2025 17:43:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hncw=22=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1umbzL-00008a-Qb
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 17:43:43 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 370e2266-7936-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 19:43:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7FB4F601D8;
 Thu, 14 Aug 2025 17:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66588C4CEED;
 Thu, 14 Aug 2025 17:43:38 +0000 (UTC)
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
X-Inumbo-ID: 370e2266-7936-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755193419;
	bh=NtGaXEt/rCXZbH6AhRXhKag5AQfcAprg8g7HcBf4fa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qET8o0XvKzXdUiWMSbCsLL3eECdWZ/AbT+J3b7auosgo7K/gf6rt6x3D6UTI76iqO
	 ti/iGG5xkCHTOQimoWMmFfEnk9qKFL2quOO5nh0SiN+AtdcIknOOMaCwhWCHlP4gMD
	 ykB+wRt62M5cjTVShpIgxGBKujUJevNaAvQmESCXsgTaz6eSAmBzP6Np2+HWgacd/i
	 ptn2QT+kSVgRjXKbq92+rFZQUf9rAqUBC2DFgoqq/jRE8er78UlpXtOrVW/WVebQgm
	 oscioXsT1akK/vdGGIJZToP0KYoeWZGwANzuVPBNp0BvFFlINHo65cmqBExc85Nyt2
	 XqGc4T1I2WbCQ==
Date: Thu, 14 Aug 2025 20:43:33 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 01/16] dma-mapping: introduce new DMA attribute to
 indicate MMIO memory
Message-ID: <20250814174333.GA8427@unreal>
References: <cover.1755153054.git.leon@kernel.org>
 <f832644c76e13de504ecf03450fd5d125f72f4c6.1755153054.git.leon@kernel.org>
 <c855a4f9-4a50-4e02-9ac6-372abe7da730@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c855a4f9-4a50-4e02-9ac6-372abe7da730@infradead.org>

On Thu, Aug 14, 2025 at 10:37:22AM -0700, Randy Dunlap wrote:
> Hi Leon,
> 
> On 8/14/25 3:13 AM, Leon Romanovsky wrote:
> > diff --git a/Documentation/core-api/dma-attributes.rst b/Documentation/core-api/dma-attributes.rst
> > index 1887d92e8e92..58a1528a9bb9 100644
> > --- a/Documentation/core-api/dma-attributes.rst
> > +++ b/Documentation/core-api/dma-attributes.rst
> > @@ -130,3 +130,21 @@ accesses to DMA buffers in both privileged "supervisor" and unprivileged
> >  subsystem that the buffer is fully accessible at the elevated privilege
> >  level (and ideally inaccessible or at least read-only at the
> >  lesser-privileged levels).
> > +
> > +DMA_ATTR_MMIO
> > +-------------
> > +
> > +This attribute indicates the physical address is not normal system
> > +memory. It may not be used with kmap*()/phys_to_virt()/phys_to_page()
> > +functions, it may not be cachable, and access using CPU load/store
> 
> Usually "cacheable" (git grep -w cacheable counts 1042 hits vs.
> 55 hits for "cachable"). And the $internet agrees.
> 
> > +instructions may not be allowed.
> > +
> > +Usually this will be used to describe MMIO addresses, or other non
> 
> non-cacheable
> 
> > +cachable register addresses. When DMA mapping this sort of address we
> 
> > +call the operation Peer to Peer as a one device is DMA'ing to another
> > +device. For PCI devices the p2pdma APIs must be used to determine if
> > +DMA_ATTR_MMIO is appropriate.
> > +
> > +For architectures that require cache flushing for DMA coherence
> > +DMA_ATTR_MMIO will not perform any cache flushing. The address
> > +provided must never be mapped cachable into the CPU.
> again.

Thanks, I will fix.

> 
> thanks.
> -- 
> ~Randy
> 
> 

