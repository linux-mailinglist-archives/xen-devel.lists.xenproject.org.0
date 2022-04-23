Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C5550C795
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 07:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311409.528627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni8Ax-0005as-Ns; Sat, 23 Apr 2022 05:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311409.528627; Sat, 23 Apr 2022 05:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni8Ax-0005Z6-Ka; Sat, 23 Apr 2022 05:19:19 +0000
Received: by outflank-mailman (input) for mailman id 311409;
 Sat, 23 Apr 2022 05:19:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fLqp=VB=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1ni8Aw-0005Z0-6a
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 05:19:18 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eafcb626-c2c4-11ec-a405-831a346695d4;
 Sat, 23 Apr 2022 07:19:17 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CEC0C68AFE; Sat, 23 Apr 2022 07:19:12 +0200 (CEST)
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
X-Inumbo-ID: eafcb626-c2c4-11ec-a405-831a346695d4
Date: Sat, 23 Apr 2022 07:19:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Rahul Singh <Rahul.Singh@arm.com>,
	Christoph Hellwig <hch@lst.de>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
Message-ID: <20220423051912.GB17488@lst.de>
References: <49E3535A-5672-4047-AF86-05D5597C7019@arm.com> <alpine.DEB.2.22.394.2204191933450.915916@ubuntu-linux-20-04-desktop> <5C7EC3F4-9126-46E8-9321-60878357F939@arm.com> <alpine.DEB.2.22.394.2204201523390.915916@ubuntu-linux-20-04-desktop> <12279FAE-2141-469E-A424-9984348E84BB@arm.com> <alpine.DEB.2.22.394.2204211444190.915916@ubuntu-linux-20-04-desktop> <20220422050405.GA10195@lst.de> <105DB518-DB5B-47F8-852F-C997678BBCE6@arm.com> <86bc7ae3-d7af-5f6e-d246-b53a4fa8bc79@suse.com> <alpine.DEB.2.22.394.2204221319490.915916@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204221319490.915916@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Apr 22, 2022 at 01:29:54PM -0700, Stefano Stabellini wrote:
> It is great to remove xen_alloc_coherent_pages/xen_free_coherent_pages
> for ARM. We can safely remove them because on ARM we can only use
> swiotlb-xen when the domain is 1:1 mapped. So it is impossible to get
> into a situation where memory allocated expected to be contiguous is not
> actually contiguous.
> 
> So, from an ARM point of view, it is great. However,
> DMA_ATTR_NO_KERNEL_MAPPING wouldn't work on x86 still? I don't know if
> matters.

It works by ignoring it, just like it works for most of the other
DMA OPS instance.  The problem with the existing xen swiotlb case
is it tries to interpret what is returned by dma_direct_alloc.
Driver must not do that per the API contract and just use the DMA
handle while using the return value as a cookie only. It is a odd
API and I plan to remove it eventually.

> Then a small NIT: the declaration of xen_create_contiguous_region and
> xen_destroy_contiguous_region should be moved away from
> include/xen/xen-ops.h to an arch/x86 specific header. For instance to
> arch/x86/include/asm/xen/swiotlb-xen.h. Or at least the #ifdef in
> include/xen/xen-ops.h should change, currently it is:
> 
> #if defined(CONFIG_XEN_PV) || defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
> 				unsigned int address_bits,
> 				dma_addr_t *dma_handle);
> void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order);
> #endif

I'll resend a cleaned up version in a bit.

