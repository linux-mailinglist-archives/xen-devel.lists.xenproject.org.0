Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AF45A83DB
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 18:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395940.635835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTR2v-0002Yg-Ml; Wed, 31 Aug 2022 16:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395940.635835; Wed, 31 Aug 2022 16:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTR2v-0002WA-Jn; Wed, 31 Aug 2022 16:58:33 +0000
Received: by outflank-mailman (input) for mailman id 395940;
 Wed, 31 Aug 2022 16:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aVYg=ZD=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oTR2t-0002W4-RC
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 16:58:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 231f4c19-294e-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 18:58:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BDEE619C5;
 Wed, 31 Aug 2022 16:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38422C433C1;
 Wed, 31 Aug 2022 16:58:27 +0000 (UTC)
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
X-Inumbo-ID: 231f4c19-294e-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661965108;
	bh=tZfN22S1Lxl3tbUEuVPncXdtkO44166H42D2+eKQcnY=;
	h=From:To:Cc:Subject:Date:From;
	b=coCKVdhzDhmWyMtp6GCC8uXi0gTkv5E/vTOeZiM83NFLAQa+E1QnzAT+QhgXmetVy
	 OJWP4w0q6QzVVjKMRm5HfiGX1pzNuHirw+IO3J0mdX24lEf1sHhKlUSDFk9WWsrBXQ
	 4chSataaa+BMfdqVjScabEPKjUSPmtpDB2yoHAScxWxi5wiwrkbtCIFTsIcq4T5eb5
	 KA94f2rc0NK2dQBLpglTL+I5UBgx+JYOZKMxFv6Aswg54pUtOuzx/TFKDEPdR9UvYL
	 dJGLeuxMsgpV2l7U06ZnikXYlLlWuRzkZkq5Y/mViKSxJaL5FHX3TLeb8oNay3vxXo
	 LrS7Hw7F1FAXw==
From: SeongJae Park <sj@kernel.org>
To: jgross@suse.com,
	roger.pau@citrix.com
Cc: SeongJae Park <sj@kernel.org>,
	marmarek@invisiblethingslab.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	axboe@kernel.dk,
	ptyadav@amazon.de,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] xen-blk{front,back}: Fix the broken semantic and flow of feature-persistent
Date: Wed, 31 Aug 2022 16:58:21 +0000
Message-Id: <20220831165824.94815-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes from v1
(https://lore.kernel.org/xen-devel/20220825161511.94922-1-sj@kernel.org/)
- Fix the wrong feature_persistent caching position of blkfront
- Set blkfront's feature_persistent field setting with simple '&&'
  instead of 'if' (Pratyush Yadav)

This patchset fixes misuse of the 'feature-persistent' advertisement
semantic (patches 1 and 2), and the wrong timing of the
'feature_persistent' value caching, which made persistent grants feature
always disabled.

SeongJae Park (3):
  xen-blkback: Advertise feature-persistent as user requested
  xen-blkfront: Advertise feature-persistent as user requested
  xen-blkfront: Cache feature_persistent value before advertisement

 drivers/block/xen-blkback/common.h |  3 +++
 drivers/block/xen-blkback/xenbus.c |  6 ++++--
 drivers/block/xen-blkfront.c       | 20 ++++++++++++--------
 3 files changed, 19 insertions(+), 10 deletions(-)

-- 
2.25.1


