Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A814B50D3D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 07:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117529.1463589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwDLg-0007AP-6D; Wed, 10 Sep 2025 05:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117529.1463589; Wed, 10 Sep 2025 05:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwDLf-00077m-VX; Wed, 10 Sep 2025 05:26:27 +0000
Received: by outflank-mailman (input) for mailman id 1117529;
 Wed, 10 Sep 2025 05:26:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dfp=3V=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1uwDLf-00077g-Dc
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 05:26:27 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b173b8c9-8e06-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 07:26:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AFB3041752;
 Wed, 10 Sep 2025 05:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF34CC4CEF0;
 Wed, 10 Sep 2025 05:26:22 +0000 (UTC)
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
X-Inumbo-ID: b173b8c9-8e06-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757481983;
	bh=bqpgnX0YeaX4gP4gTelyGSzbrLPxwuSSl4ugIJkeFPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3++ctIiiR7UFpzqM9AUidv9AQ1n3Dz1tKeZadPk/293ETffI9nRLBp7aQx9AFled
	 M5GCYM1B4a3jkkhLPVRESnUtwcqokI2ZK9ojJ1YPCMkJpjHT45Cl+QruyYKY3aGARs
	 FpovID2F5xbpoec1xDhgC6MFSHIrXsB7JTzFkx6nfm41N+Pm3w/y/LnuGSrU2VRkhJ
	 x7tt8kh1ACIrOtgalXRNyxNgQvord1Z8/t1JGvHRdIaRHxawPvJnDmdHHJxvC9RDqD
	 RQiYwqXBRXcawbcju2eKP99VtdepUl8ofw/258NbTAl3BVZxhNFXZSkWH5N4CtNQIn
	 DIZ8LyFL6amIQ==
Date: Wed, 10 Sep 2025 08:26:18 +0300
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
Message-ID: <20250910052618.GH341237@unreal>
References: <cover.1757423202.git.leonro@nvidia.com>
 <56d1a6769b68dfcbf8b26a75a7329aeb8e3c3b6a.1757423202.git.leonro@nvidia.com>
 <20250909193748.GG341237@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909193748.GG341237@unreal>

On Tue, Sep 09, 2025 at 10:37:48PM +0300, Leon Romanovsky wrote:
> On Tue, Sep 09, 2025 at 04:27:31PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> 
> <...>
> 
> >  include/linux/page-flags.h         |  1 +
> 
> <...>
> 
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -614,6 +614,7 @@ FOLIO_FLAG(dropbehind, FOLIO_HEAD_PAGE)
> >   * available at this point.
> >   */
> >  #define PageHighMem(__p) is_highmem_idx(page_zonenum(__p))
> > +#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))
> 
> This was a not so great idea to add PhysHighMem() because of "else"
> below which unfolds to maze of macros and automatically generated
> functions with "static inline int Page##uname ..." signature.
> 
> >  #define folio_test_highmem(__f)	is_highmem_idx(folio_zonenum(__f))
> >  #else
> >  PAGEFLAG_FALSE(HighMem, highmem)

After sleeping over it, the following hunk will help:

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index dfbc4ba86bba2..2a1f346178024 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -614,11 +614,11 @@ FOLIO_FLAG(dropbehind, FOLIO_HEAD_PAGE)
  * available at this point.
  */
 #define PageHighMem(__p) is_highmem_idx(page_zonenum(__p))
-#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))
 #define folio_test_highmem(__f)        is_highmem_idx(folio_zonenum(__f))
 #else
 PAGEFLAG_FALSE(HighMem, highmem)
 #endif
+#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))

 /* Does kmap_local_folio() only allow access to one page of the folio? */
 #ifdef CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP


> 
> Thanks
> 

