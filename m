Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E0895DB6A
	for <lists+xen-devel@lfdr.de>; Sat, 24 Aug 2024 05:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782825.1192327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shhv8-0002yO-4O; Sat, 24 Aug 2024 03:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782825.1192327; Sat, 24 Aug 2024 03:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shhv8-0002sJ-0f; Sat, 24 Aug 2024 03:58:34 +0000
Received: by outflank-mailman (input) for mailman id 782825;
 Sat, 24 Aug 2024 03:58:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NNC+=PX=bombadil.srs.infradead.org=BATV+57a39d84037f3fd726e9+7671+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1shhv5-0002pe-J3
 for xen-devel@lists.xenproject.org; Sat, 24 Aug 2024 03:58:32 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f4295cd-61cd-11ef-a50a-bb4a2ccca743;
 Sat, 24 Aug 2024 05:58:30 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-7457-864c-9b77-b751.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7457:864c:9b77:b751] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1shhut-00000001ON7-0bmD; Sat, 24 Aug 2024 03:58:20 +0000
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
X-Inumbo-ID: 1f4295cd-61cd-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Q2nYRi9U4a8itDtDq9LNnEMZ/Twd4vEjX9CTeiWFtZk=; b=ibODa9lL5q7uggEbw2OOQZkuOl
	gdhQY0r9D/9beDb+Bd4qmVTCvwI+QiMjo95/+tPj+4V9U7F5hRFToRdX4k4DvPYHu1OLEHcIx+etT
	KIlSwzlSzvMKbYOerqEj9me07yLSDIeP/0/bbrlY9qqah4ekXhqi/eYjBvvldU6VljO5zLO6djC2Z
	2yksa1axP4sCcbZUGAWwKgEmbBGoAFPkoBoCxdpgqo5+6g1QWpb94Ilm4RmYcg8FZcggX2U6K6Sfe
	cGdem+9zPaemNy7/Cr0ZBWXuCzcsmrGl8tEN+ptWMeKG1q46THZ+VeovOI19ardMWa1DQRk/ZtOsI
	ioZS20vQ==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin " <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-media@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: clearly mark DMA_OPS support as an architecture feasture
Date: Sat, 24 Aug 2024 05:57:57 +0200
Message-ID: <20240824035817.1163502-1-hch@lst.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

we've had a long standing problems where drivers try to hook into the
DMA_OPS mechanisms to override them for something that is not DMA, or
to introduce additional dispatching.

Now that we are not using DMA_OPS support for dma-iommu and can build
kernels without DMA_OPS support on many common setups this becomes even
more problematic.

This series renames the option to ARCH_DMA_OPS and adds very explicit
comment to not use it in drivers.  The ipu6 and vdpa_sim/user drivers
that abuse the mechanism are made to depend on the option instead of
selecting it with a big comment, but I expect this to be fixed rather
sooner than later (I know the ipu6 maintainers are on it based on a
previous discussion).

