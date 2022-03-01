Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A02C4C89D7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 11:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281110.479303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP08M-00033h-UL; Tue, 01 Mar 2022 10:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281110.479303; Tue, 01 Mar 2022 10:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP08M-00031m-PB; Tue, 01 Mar 2022 10:53:34 +0000
Received: by outflank-mailman (input) for mailman id 281110;
 Tue, 01 Mar 2022 10:53:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AA0s=TM=bombadil.srs.infradead.org=BATV+e5026ef6e36407c4b08a+6764+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nP08L-00031a-2h
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 10:53:33 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d356a529-994d-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 11:53:30 +0100 (CET)
Received: from [2.53.44.23] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP083-00GCvx-8y; Tue, 01 Mar 2022 10:53:16 +0000
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
X-Inumbo-ID: d356a529-994d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=FLoPcwp8W110QTyBUFSAYe56vwqhsB+0w1jgowBLDrQ=; b=x4Ls4LGXlw3mqit2JgZ989HyZb
	T5qpKmQGteCGW5NyuTbuloRJzt7HhHDSWBkn6XMthvcPktTNRGiMhEjm3jNCxNFXallKVQH7jYfkV
	yMP1NQbMBXexGqNGRQAxlptnMjCU6iBaEsSYx496tSDH97RR6D0tylDgXaeXfMovaKcRHhD1mlnuz
	OQ2BdFcAyA097bBGDwCVXhJV6sp+r3vCa43JaFB+f/7FaiduK6PaxwT2gDQredky9tC0CHGWz/iGt
	MF2HppH9e3IKlAYjXSzy/Ts9RTiST6h6Fjh5rDDovAP92KH/7Uv2VhH/n7QVymPp/mWYAgqqJl+PH
	rhUuKZnQ==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: cleanup swiotlb initialization v4
Date: Tue,  1 Mar 2022 12:52:59 +0200
Message-Id: <20220301105311.885699-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

this series tries to clean up the swiotlb initialization, including
that of swiotlb-xen.  To get there is also removes the x86 iommu table
infrastructure that massively obsfucates the initialization path.

Git tree:

    git://git.infradead.org/users/hch/misc.git swiotlb-init-cleanup

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-init-cleanup

Changes since v3:
 - fix a compilation issue on some powerpc configfs
 - fix and cleanup how forced bounce buffering is enabled for
   guest memory encryption

Changes since v2:
 - make ppc_swiotlb_flags actually work again
 - also force enable swiotlb for guest encrypted memory to cater
   to hyperv which doesn't set the host encrypted memory flag

Changes since v1:
 - skip IOMMU initialization on Xen PV kernels
 - various small whitespace / typo fixes

Diffstat:

