Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68C961F36
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 08:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784478.1193821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjBto-0001bV-0L; Wed, 28 Aug 2024 06:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784478.1193821; Wed, 28 Aug 2024 06:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjBtn-0001ZV-TL; Wed, 28 Aug 2024 06:11:19 +0000
Received: by outflank-mailman (input) for mailman id 784478;
 Wed, 28 Aug 2024 06:11:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gvM=P3=bombadil.srs.infradead.org=BATV+4c6678e563c2e29e76cf+7675+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sjBtm-0001ZP-AV
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 06:11:18 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 550b1831-6504-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 08:11:16 +0200 (CEST)
Received: from [2001:4bb8:2dc:a2cd:2ccf:8fbe:8ab4:c9db] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sjBtc-0000000E1uI-0svg; Wed, 28 Aug 2024 06:11:08 +0000
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
X-Inumbo-ID: 550b1831-6504-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3ciW+jDJYrdLJiK7yrXhNzVEL4ig56HUYUk4VOvh/z0=; b=DachNt1cx+ujVHKXHJfhguYPcC
	9aAqfBoRuTD2BycDnkoq2+XVJgduR0jUZafb+wHb4B+tRHNCEo+SGOrtcsQvZMydA7tNGInWBQs5w
	69FOaQMwVwWuo6pPJtsi2BcUec+73lr/fSkNmYLKWVNWI7lSQZKrpLFPAp9IcRtasZAYiQf8cOkxO
	tni42Ic2e8NqYRy7ZadXs2xugccm0Zfp5fifHQ9pwwtZOGq968HzDTabeQWV+VtZubJN2NukZ+srM
	m7lxrEC4huwPqB6G7d3uGQA+7nAvrJsZgB3gE8FZFou6JBOpJJHKhnTlWsvD8OBG21HfoKRWJ0AQk
	brwIO41g==;
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
Subject: clearly mark DMA_OPS support as an architecture feature v2
Date: Wed, 28 Aug 2024 09:10:27 +0300
Message-ID: <20240828061104.1925127-1-hch@lst.de>
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

This series renames the option to ARCH_HAS_DMA_OPS and adds very explicit
comment to not use it in drivers.  The ipu6 and vdpa_sim/user drivers
that abuse the mechanism are made to depend on the option instead of
selecting it with a big comment, but I expect this to be fixed rather
sooner than later (I know the ipu6 maintainers are on it based on a
previous discussion).

Changes since v1:
 - s/ARCH_DMA_OPS/ARCH_HAS_DMA_OPS/g
 - spelling fixes
 - vdpa_sim actually doesn't need dma ops these days, add a prep patch
   to remove the dependency

