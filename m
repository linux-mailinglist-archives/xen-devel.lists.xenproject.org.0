Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588F878EDAB
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 14:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593853.926967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbh8u-0001lZ-GG; Thu, 31 Aug 2023 12:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593853.926967; Thu, 31 Aug 2023 12:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbh8u-0001jS-DS; Thu, 31 Aug 2023 12:51:24 +0000
Received: by outflank-mailman (input) for mailman id 593853;
 Thu, 31 Aug 2023 12:51:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5gKK=EQ=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1qbh8t-0001jM-9g
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 12:51:23 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15300d2f-47fd-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 14:51:20 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C99B468C4E; Thu, 31 Aug 2023 14:51:10 +0200 (CEST)
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
X-Inumbo-ID: 15300d2f-47fd-11ee-9b0d-b553b5be7939
Date: Thu, 31 Aug 2023 14:51:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Petr Tesarik <petrtesarik@huaweicloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Petr Tesarik <petr.tesarik.ext@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, James Seo <james@equiv.tech>,
	James Clark <james.clark@arm.com>,
	Kees Cook <keescook@chromium.org>,
	"moderated list:XEN HYPERVISOR ARM" <xen-devel@lists.xenproject.org>,
	"moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"open list:XEN SWIOTLB SUBSYSTEM" <iommu@lists.linux.dev>,
	"open list:SLAB ALLOCATOR" <linux-mm@kvack.org>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>, petr@tesarici.cz
Subject: Re: [PATCH v7 9/9] swiotlb: search the software IO TLB only if the
 device makes use of it
Message-ID: <20230831125109.GA11562@lst.de>
References: <cover.1690871004.git.petr.tesarik.ext@huawei.com> <adea71bd1fa8660d4c3157a562431ad8127016d4.1690871004.git.petr.tesarik.ext@huawei.com> <87a5uz3ob8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5uz3ob8.fsf@meer.lwn.net>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Aug 09, 2023 at 03:20:43PM -0600, Jonathan Corbet wrote:
> >  	spin_unlock_irqrestore(&dev->dma_io_tlb_lock, flags);
> >  
> > -	/* Pairs with smp_rmb() in swiotlb_find_pool(). */
> > -	smp_wmb();
> >  found:
> > +	dev->dma_uses_io_tlb = true;
> > +	/* Pairs with smp_rmb() in is_swiotlb_buffer() */
> > +	smp_wmb();
> > +
> 
> ...and here you set it if swiotlb is used.
> 
> But, as far as I can tell, you don't actually *use* this field anywhere.
> What am I missing?

It's very much unused.  Petr, I guess you wanted to use this in
is_swiotlb_buffer to avoid the lookup unless required.  Can you send
a follow up?

