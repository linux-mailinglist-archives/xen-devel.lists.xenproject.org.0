Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B9C576A39
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 00:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368574.599939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCU9e-0005qG-3B; Fri, 15 Jul 2022 22:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368574.599939; Fri, 15 Jul 2022 22:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCU9e-0005np-0Q; Fri, 15 Jul 2022 22:51:26 +0000
Received: by outflank-mailman (input) for mailman id 368574;
 Fri, 15 Jul 2022 22:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tST6=XU=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oCU9b-0005Xu-Um
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 22:51:23 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3f3db26-0490-11ed-924f-1f966e50362f;
 Sat, 16 Jul 2022 00:51:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 838E5B80B9D;
 Fri, 15 Jul 2022 22:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43707C3411E;
 Fri, 15 Jul 2022 22:51:16 +0000 (UTC)
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
X-Inumbo-ID: a3f3db26-0490-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657925477;
	bh=o0ng7rDUX3HJX5PzVTuirQIgJKM/KMzDsM7dZaRh1UQ=;
	h=From:To:Cc:Subject:Date:From;
	b=jN2p0VTKf1wUpI/xIITkZTZrE1Q/c7CqHuh8qboGE4G0SNvGc9IfTeBQLq2ahdIuY
	 do2hayd/4Mmdbw5t7ZkJv8RDEvHCtnoaNR+ZQRxgkhfP63e+xVcp0HK1+dGzHK+Ezq
	 SU0WLlUSv1HgX09NslYVXtXxn7idycRhZNlLaHkx+pQhPv2DjP/5iM1qPm5Wt49clu
	 KSJFB+1yJ9ejUCFuXU6tGi7Iw+xJiJsJAwEWDq7XAOf5txN7DzZccNtqA5IcsLvr5E
	 /Ouo0Gdk7SlwryUAz67KdbHlBT/dXn9pau8TVZIxon9PgFxpE4eJHTjPbFNjXOp1Mn
	 Jtupck9KTLUQA==
From: SeongJae Park <sj@kernel.org>
To: roger.pau@citrix.com
Cc: axboe@kernel.dk,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	olekstysh@gmail.com,
	andrii.chepurnyi82@gmail.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	SeongJae Park <sj@kernel.org>
Subject: [PATCH v4 0/3] xen-blk{back,front}: Fix two bugs in 'feature_persistent'
Date: Fri, 15 Jul 2022 22:51:05 +0000
Message-Id: <20220715225108.193398-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduction of 'feature_persistent' made two bugs.  First one is wrong
overwrite of 'vbd->feature_gnt_persistent' in 'blkback' due to wrong
parameter value caching position, and the second one is unintended
behavioral change that could break previous dynamic frontend/backend
persistent feature support changes.  This patchset fixes the issues.

Changes from v3
(https://lore.kernel.org/xen-devel/20220715175521.126649-1-sj@kernel.org/)
- Split 'blkback' patch for each of the two issues
- Add 'Reported-by: Andrii Chepurnyi <andrii.chepurnyi82@gmail.com>'

Changes from v2
(https://lore.kernel.org/xen-devel/20220714224410.51147-1-sj@kernel.org/)
- Keep the behavioral change of v1
- Update blkfront's counterpart to follow the changed behavior
- Update documents for the changed behavior

Changes from v1
(https://lore.kernel.org/xen-devel/20220106091013.126076-1-mheyne@amazon.de/)
- Avoid the behavioral change
  (https://lore.kernel.org/xen-devel/20220121102309.27802-1-sj@kernel.org/)
- Rebase on latest xen/tip/linux-next
- Re-work by SeongJae Park <sj@kernel.org>
- Cc stable@

Maximilian Heyne (1):
  xen-blkback: Apply 'feature_persistent' parameter when connect

SeongJae Park (2):
  xen-blkback: fix persistent grants negotiation
  xen-blkfront: Apply 'feature_persistent' parameter when connect

 .../ABI/testing/sysfs-driver-xen-blkback      |  2 +-
 .../ABI/testing/sysfs-driver-xen-blkfront     |  2 +-
 drivers/block/xen-blkback/xenbus.c            | 20 ++++++++-----------
 drivers/block/xen-blkfront.c                  |  4 +---
 4 files changed, 11 insertions(+), 17 deletions(-)

-- 
2.25.1


