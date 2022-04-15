Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69DB5025B0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 08:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305554.520625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfFZv-0000xF-9O; Fri, 15 Apr 2022 06:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305554.520625; Fri, 15 Apr 2022 06:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfFZv-0000uT-4w; Fri, 15 Apr 2022 06:37:11 +0000
Received: by outflank-mailman (input) for mailman id 305554;
 Fri, 15 Apr 2022 06:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTan=UZ=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nfFZt-0000uN-IG
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 06:37:09 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78b53c6c-bc86-11ec-a405-831a346695d4;
 Fri, 15 Apr 2022 08:37:08 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8657568B05; Fri, 15 Apr 2022 08:37:05 +0200 (CEST)
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
X-Inumbo-ID: 78b53c6c-bc86-11ec-a405-831a346695d4
Date: Fri, 15 Apr 2022 08:37:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	hch@lst.de
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
Message-ID: <20220415063705.GA24262@lst.de>
References: <C82612B1-FED5-4139-9B87-FB33DD81F01A@arm.com> <alpine.DEB.2.22.394.2204131354190.3066615@ubuntu-linux-20-04-desktop> <8C511888-6183-421E-A4C7-B271DAF46696@arm.com> <alpine.DEB.2.22.394.2204141329290.894007@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204141329290.894007@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Apr 14, 2022 at 01:39:23PM -0700, Stefano Stabellini wrote:
> OK, now we know that the code path with Xen is correct and it is the
> same code path taken (dma_alloc_direct) as when !CONFIG_XEN and !SMMU.
> That is how it should be.
> 
> I cannot explain why dma_alloc_direct() would fail when called from
> xen_swiotlb_alloc_coherent(), but it would succeed when called from
> dma_alloc_attrs() without Xen.
> 
> I am not aware of any restrictions that xen or swiotlb-xen would
> introduce in that regard. Unless you are just running out of memory
> because dom0_mem too low.

The crash is deep down in the page allocator.  Even if memory was low
it should no crash.  So there is some odd interaction between Xen
and the page allocator going on.  I think nvme and dma-direct really
are only the messenger here.

