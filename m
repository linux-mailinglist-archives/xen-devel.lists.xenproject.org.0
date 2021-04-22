Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75FC367AED
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 09:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115019.219287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTcy-0002q0-8l; Thu, 22 Apr 2021 07:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115019.219287; Thu, 22 Apr 2021 07:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTcy-0002pU-4y; Thu, 22 Apr 2021 07:19:56 +0000
Received: by outflank-mailman (input) for mailman id 115019;
 Thu, 22 Apr 2021 07:19:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Z8K=JT=bombadil.srs.infradead.org=batv+ccca8c562e79e8576e72+6451+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lZTcw-0002oJ-CS
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 07:19:54 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3f0abab-4421-45c1-a115-b0ee4681c490;
 Thu, 22 Apr 2021 07:19:46 +0000 (UTC)
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTcS-00DRkA-CT; Thu, 22 Apr 2021 07:19:24 +0000
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
X-Inumbo-ID: c3f0abab-4421-45c1-a115-b0ee4681c490
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=aEdQBTMaUl2RRYZxc6tzp9x+ou0hYnPrwcHo24gdihQ=; b=jzhBxobmLoI0NNUrL8/EfTlash
	db9hFe8bub19NNsbPLexbUbQ/0Oek+2WiesnCwx+loiACq5t8ge/EL9W4DSMZFpoY87u/RPIoJkV0
	skPkrzEfku4t6XaFVhJGfYG1YSfoV53RnF9KVwcg5ui97sd7esymHU1XwRs6WoLw1zeQ/xSUREnAc
	pLvhgSOCyQ9FtJwrIeBOmivQMw3NSJjC5ztzsFnOy7RFUbjIm1NeQM1uhJ+ll3xBSMmyBBrUfwNnU
	aNTNXR8y7wle+wwoQB70hJnfC//sRMKPPOusASzTKEHs37fKR/o1nitVIKirzjTWHnkI4mspElf5g
	mAplpQhw==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux-foundation.org
Subject: cleanup and fix swiotlb sizing
Date: Thu, 22 Apr 2021 09:19:14 +0200
Message-Id: <20210422071921.1428607-1-hch@lst.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

based on a report from Tom that overriding the default sizing provided
by the x86 SEV code on the command line doesn't work anymore, this series
cleans up how we handle default and command line sizes for the swiotlb
buffer and then fixes the recently introduced bug in a straight-forward
way.

Diffstat:
 arch/mips/cavium-octeon/dma-octeon.c      |   16 +--------------
 arch/mips/include/asm/octeon/pci-octeon.h |    1 
 arch/mips/pci/pci-octeon.c                |    2 -
 arch/powerpc/platforms/pseries/svm.c      |   13 ++----------
 drivers/xen/swiotlb-xen.c                 |    2 -
 include/linux/swiotlb.h                   |    2 -
 kernel/dma/swiotlb.c                      |   32 +++++++++++++++---------------
 7 files changed, 25 insertions(+), 43 deletions(-)

