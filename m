Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF3CB26DD5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 19:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082101.1442014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umbth-00074G-5S; Thu, 14 Aug 2025 17:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082101.1442014; Thu, 14 Aug 2025 17:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umbth-00071i-25; Thu, 14 Aug 2025 17:37:53 +0000
Received: by outflank-mailman (input) for mailman id 1082101;
 Thu, 14 Aug 2025 17:37:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cDpc=22=infradead.org=rdunlap@srs-se1.protection.inumbo.net>)
 id 1umbtf-00071c-5l
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 17:37:52 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64e10aaf-7935-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 19:37:49 +0200 (CEST)
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1umbtD-00000000E9n-3MTt; Thu, 14 Aug 2025 17:37:23 +0000
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
X-Inumbo-ID: 64e10aaf-7935-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=OE4LAchkYGbRbWIAPtKdq4yp8AV8hBrJ1qdnR14GXT4=; b=4KLyFDU/Vumsz96izTNEFh1dPT
	gcELlCyTppY1dhYETNtbcxbOIeh1/sthMu9DbTeiVaAcP7tcEuyIkykR+tjpcFgzaiM4l5e7zW/99
	WT21f95NU5V6ne9427BqfukuNCmE4P8LKLVbcXGI3NVbyx+CI0xucaJY3VBJ0r3B7kFJXEhhBYBCH
	rRABtXI9ZkOcgZvf82D6jL0f5HF0S2ekt30gXEkdZuKsfcL0Px0gARfb1GdZ7N6PG/l3W5OuzmpWz
	GxsIWFejW3a3LSYz1Mfw2PcJDMlTUQWwRae7vRCeE50nJNZOOiGyqf3SNV1eNn7Mpy146jdENj5EG
	0OjLyf7Q==;
Message-ID: <c855a4f9-4a50-4e02-9ac6-372abe7da730@infradead.org>
Date: Thu, 14 Aug 2025 10:37:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] dma-mapping: introduce new DMA attribute to
 indicate MMIO memory
To: Leon Romanovsky <leon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Alexander Potapenko <glider@google.com>, Alex Gaynor
 <alex.gaynor@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
 iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
 kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-trace-kernel@vger.kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin"
 <mst@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
 Sagi Grimberg <sagi@grimberg.me>, Stefano Stabellini
 <sstabellini@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1755153054.git.leon@kernel.org>
 <f832644c76e13de504ecf03450fd5d125f72f4c6.1755153054.git.leon@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <f832644c76e13de504ecf03450fd5d125f72f4c6.1755153054.git.leon@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Leon,

On 8/14/25 3:13 AM, Leon Romanovsky wrote:
> diff --git a/Documentation/core-api/dma-attributes.rst b/Documentation/core-api/dma-attributes.rst
> index 1887d92e8e92..58a1528a9bb9 100644
> --- a/Documentation/core-api/dma-attributes.rst
> +++ b/Documentation/core-api/dma-attributes.rst
> @@ -130,3 +130,21 @@ accesses to DMA buffers in both privileged "supervisor" and unprivileged
>  subsystem that the buffer is fully accessible at the elevated privilege
>  level (and ideally inaccessible or at least read-only at the
>  lesser-privileged levels).
> +
> +DMA_ATTR_MMIO
> +-------------
> +
> +This attribute indicates the physical address is not normal system
> +memory. It may not be used with kmap*()/phys_to_virt()/phys_to_page()
> +functions, it may not be cachable, and access using CPU load/store

Usually "cacheable" (git grep -w cacheable counts 1042 hits vs.
55 hits for "cachable"). And the $internet agrees.

> +instructions may not be allowed.
> +
> +Usually this will be used to describe MMIO addresses, or other non

non-cacheable

> +cachable register addresses. When DMA mapping this sort of address we

> +call the operation Peer to Peer as a one device is DMA'ing to another
> +device. For PCI devices the p2pdma APIs must be used to determine if
> +DMA_ATTR_MMIO is appropriate.
> +
> +For architectures that require cache flushing for DMA coherence
> +DMA_ATTR_MMIO will not perform any cache flushing. The address
> +provided must never be mapped cachable into the CPU.
again.

thanks.
-- 
~Randy


