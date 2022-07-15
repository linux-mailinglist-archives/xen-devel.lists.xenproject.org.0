Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FBF576671
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368433.599709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPXh-0006sZ-Kd; Fri, 15 Jul 2022 17:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368433.599709; Fri, 15 Jul 2022 17:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPXh-0006pE-Hq; Fri, 15 Jul 2022 17:55:57 +0000
Received: by outflank-mailman (input) for mailman id 368433;
 Fri, 15 Jul 2022 17:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tST6=XU=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oCPXf-0006p6-VL
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:55:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eb5aeb0-0467-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 19:55:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21D2D622E8;
 Fri, 15 Jul 2022 17:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A0BC34115;
 Fri, 15 Jul 2022 17:55:51 +0000 (UTC)
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
X-Inumbo-ID: 5eb5aeb0-0467-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657907752;
	bh=3vpFnLXaDApO/bt2hcR2Da04h1fv9AjDwAOX2idNzpY=;
	h=From:To:Cc:Subject:Date:From;
	b=Q/ZTXqmNHNmAWAhqO90vFwqEL5aIVTYf+ebtpezt8GgJHQN+wfnpq6cNk4/7kFaX9
	 ufxmW2Sui2gMueP9cdN3WEXzj6fDf0gjv5bqwHPH+qh11iDvKKcH+72aEa281diUlo
	 xWFSSFsseYO6Pbbb7XKx4WeL5FIiTSUe5CtPTIttcnKrk1ajgtYis34qYUmSFiPfva
	 akRFGTDdtn7ZxgJg8oFbhSi0hv3ZkVcCcLqjYp4QtcmQYrYm8ZLVjb1k+v9Zbh+3U2
	 LtEeW8KscRSshrNMDjKjANF5k96gJWHR4IpuJwZbTrNXHp+gC9qYY6gAJBF3Vf8jpA
	 wqakYDG7mRLqg==
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
Subject: [PATCH v3 0/2] Fix persistent grants negotiation with a behavior change
Date: Fri, 15 Jul 2022 17:55:19 +0000
Message-Id: <20220715175521.126649-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch of this patchset fixes 'feature_persistent' parameter
handling in 'blkback' to respect the frontend's persistent grants
support always.  The fix makes a behavioral change, so the second patch
makes the counterpart of 'blkfront' to consistently follow the behavior
change.

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
  xen, blkback: fix persistent grants negotiation

SeongJae Park (1):
  xen-blkfront: Apply 'feature_persistent' parameter when connect

 Documentation/ABI/testing/sysfs-driver-xen-blkback  | 2 +-
 Documentation/ABI/testing/sysfs-driver-xen-blkfront | 2 +-
 drivers/block/xen-blkback/xenbus.c                  | 9 +++------
 drivers/block/xen-blkfront.c                        | 4 +---
 4 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.25.1


