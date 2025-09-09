Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8915DB5067F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 21:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117303.1463463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw4AB-0002mc-PG; Tue, 09 Sep 2025 19:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117303.1463463; Tue, 09 Sep 2025 19:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw4AB-0002kr-KZ; Tue, 09 Sep 2025 19:37:59 +0000
Received: by outflank-mailman (input) for mailman id 1117303;
 Tue, 09 Sep 2025 19:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XOGe=3U=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1uw4A9-0002kl-NQ
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 19:37:57 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a9de4b7-8db4-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 21:37:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0F194442F8;
 Tue,  9 Sep 2025 19:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BB1C4CEF4;
 Tue,  9 Sep 2025 19:37:52 +0000 (UTC)
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
X-Inumbo-ID: 7a9de4b7-8db4-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757446672;
	bh=Vkfs1C2Q/m2ciXngYEnMywKI/5g7jYuOYmYnMi4Z+6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BK33sGpV6gJZdNQka35B5igzFncF6O4QoVJduYx5uymEwm19+Pae/Y8Ji2ztm6vFh
	 Of79hrgQzN752E6kK9Pd6CitdpQ05JM71b0yY2nJK5WUadz3JmWI4AqHd+rhRkpPML
	 jPSesTwS7Zw48bKNgh3AxJtfj3r28MMf09jWFv3Lide1Ok8C5lkasp0zoJfr6zuOnF
	 N5cxlSvTSt07fnYvpbKZtFqt6TP2eL80kCSBPIQL9mOveIT/STSyNFrSlP91N6uUF+
	 FdL0uwcDH/ATxbhiykxuiJP1XMjnnp4vhtxpR+0sRrU4PCEIaA22KI5S4HXWZpjWlB
	 smMV1bUYsFvcA==
Date: Tue, 9 Sep 2025 22:37:48 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v6 03/16] dma-debug: refactor to use physical addresses
 for page mapping
Message-ID: <20250909193748.GG341237@unreal>
References: <cover.1757423202.git.leonro@nvidia.com>
 <56d1a6769b68dfcbf8b26a75a7329aeb8e3c3b6a.1757423202.git.leonro@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56d1a6769b68dfcbf8b26a75a7329aeb8e3c3b6a.1757423202.git.leonro@nvidia.com>

On Tue, Sep 09, 2025 at 04:27:31PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>

<...>

>  include/linux/page-flags.h         |  1 +

<...>

> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -614,6 +614,7 @@ FOLIO_FLAG(dropbehind, FOLIO_HEAD_PAGE)
>   * available at this point.
>   */
>  #define PageHighMem(__p) is_highmem_idx(page_zonenum(__p))
> +#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))

This was a not so great idea to add PhysHighMem() because of "else"
below which unfolds to maze of macros and automatically generated
functions with "static inline int Page##uname ..." signature.

>  #define folio_test_highmem(__f)	is_highmem_idx(folio_zonenum(__f))
>  #else
>  PAGEFLAG_FALSE(HighMem, highmem)

Thanks

