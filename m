Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5989E2D1212
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 14:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46566.82636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGb2-0006eI-2f; Mon, 07 Dec 2020 13:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46566.82636; Mon, 07 Dec 2020 13:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGb1-0006dt-VQ; Mon, 07 Dec 2020 13:30:31 +0000
Received: by outflank-mailman (input) for mailman id 46566;
 Mon, 07 Dec 2020 13:30:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DX/D=FL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kmGb0-0006dg-TL
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 13:30:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71266572-2b70-4f48-9a71-f1b698e0947e;
 Mon, 07 Dec 2020 13:30:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04B78AB63;
 Mon,  7 Dec 2020 13:30:29 +0000 (UTC)
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
X-Inumbo-ID: 71266572-2b70-4f48-9a71-f1b698e0947e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607347829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TlW6LRYzNqv2k8YiMXo4C8ho53DA5MhvO4sDaaIu7G8=;
	b=Isny2xaeNXr0QwvWgDPZvWhlph9aEdARWAGMR8XD8mIwJQVGDRljPeuqNDCgqaNncogi7U
	kExKzaMsp3RukRSg9ga3/hbaAlEjkMHMsOZBAa9to1CWegHsRMFs8r6bfuK7vxPsMa92G0
	EoXiC//R5iM0/X6/MTVWmbjDGY0eTzI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] xen: fix using ZONE_DEVICE memory for foreign mappings
Date: Mon,  7 Dec 2020 14:30:22 +0100
Message-Id: <20201207133024.16621-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an issue found in dom0 when running on a host with NVMe.

Juergen Gross (2):
  xen: add helpers for caching grant mapping pages
  xen: don't use page->lru for ZONE_DEVICE memory

 drivers/block/xen-blkback/blkback.c |  89 ++++----------------
 drivers/block/xen-blkback/common.h  |   4 +-
 drivers/block/xen-blkback/xenbus.c  |   6 +-
 drivers/xen/grant-table.c           | 123 ++++++++++++++++++++++++++++
 drivers/xen/unpopulated-alloc.c     |  20 +++--
 drivers/xen/xen-scsiback.c          |  60 +++-----------
 include/xen/grant_table.h           |  17 ++++
 7 files changed, 182 insertions(+), 137 deletions(-)

-- 
2.26.2


