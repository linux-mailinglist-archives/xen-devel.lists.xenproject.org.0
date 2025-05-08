Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318CFAAF208
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 06:15:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978967.1365735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCsem-0003WJ-0I; Thu, 08 May 2025 04:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978967.1365735; Thu, 08 May 2025 04:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCsel-0003Tw-To; Thu, 08 May 2025 04:14:47 +0000
Received: by outflank-mailman (input) for mailman id 978967;
 Thu, 08 May 2025 04:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvPD=XY=bombadil.srs.infradead.org=BATV+b29930b5fa9b2b8daadf+7928+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1uCsej-0003Tm-C0
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 04:14:46 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7246e4c-2bc2-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 06:14:43 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uCsea-0000000HGrC-1ecu;
 Thu, 08 May 2025 04:14:36 +0000
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
X-Inumbo-ID: f7246e4c-2bc2-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=41y5a2fmLpkUVnjUrs+3spKKdWGJe+CFaj83hBx9tto=; b=il6E3u2hODnTYTdHGLvese8c4k
	moZHoVqHVx9Mv3WchvyW0oJ9k2NMXgY+5X9tjKFn7cA9vt21hz7oDJW7uw+PrrxehnVWvrK004O68
	bJ4+p3xV5IPwiv3dGKLczXIM4GPVqkBYvjUScsbDBcGBHg2oLTcs4N2xDXtIq+ZSSmkv4h+jE8Gmb
	cqrLDED7/LnE4h9Yt8IilMzCzlDps8RAVHzWoTPO/AzxKfR4dp8rS2f6w6zOEZ2tYNjGBarV+gnyl
	oCaJvmyAKhjtT+SuVOPqH3ZLM1fJ5Mt2yysevzIoCkfDmMs3PpP69DckYB5Sw/pwLSyRNMQHPpcyW
	OWLzkU0A==;
Date: Wed, 7 May 2025 21:14:36 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: John Ernberg <john.ernberg@actia.se>, Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 2/2] xen: swiotlb: Implement map_resource callback
Message-ID: <aBwvrLKD_VJapYkB@infradead.org>
References: <20250502114043.1968976-1-john.ernberg@actia.se>
 <20250502114043.1968976-3-john.ernberg@actia.se>
 <alpine.DEB.2.22.394.2505021007460.3879245@ubuntu-linux-20-04-desktop>
 <75266eb7-66a4-4477-ae8a-cbd1ebbee8db@actia.se>
 <alpine.DEB.2.22.394.2505071602570.3879245@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2505071602570.3879245@ubuntu-linux-20-04-desktop>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, May 07, 2025 at 04:09:15PM -0700, Stefano Stabellini wrote:
> > This mapping is not for a RAM backed address. In the eDMA case for the 
> > iMX8QXP the `phys` coming in here is the address of a register.
> 
> Ok, this information is important :-)
> 
> I am not certain whether the map_resource interface can only be called
> for MMIO addresses or if it can also be called for RAM-backed addresses
> with a size > PAGE_SIZE. In the latter case, we could run into the issue
> I was describing.

map_resource is intended for MMIO regions, although those could be >
PAGE_SIZE.  It must not be called on RAM.


