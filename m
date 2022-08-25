Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1085A1680
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 18:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393510.632513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRFVt-0004Hk-Gd; Thu, 25 Aug 2022 16:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393510.632513; Thu, 25 Aug 2022 16:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRFVt-0004FS-DF; Thu, 25 Aug 2022 16:15:25 +0000
Received: by outflank-mailman (input) for mailman id 393510;
 Thu, 25 Aug 2022 16:15:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iKVJ=Y5=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oRFVs-0004FH-4H
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 16:15:24 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e75133b-2491-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 18:15:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78C08B82A1E;
 Thu, 25 Aug 2022 16:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C59FC433C1;
 Thu, 25 Aug 2022 16:15:19 +0000 (UTC)
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
X-Inumbo-ID: 1e75133b-2491-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661444120;
	bh=XyBLgn4uCh2rzAZM0VjsQj/nGaK5vZjLuP0BYgrnjyM=;
	h=From:To:Cc:Subject:Date:From;
	b=grFS/aMrCjdFegM+Ml+ScBgzeRNF4Xyvl1oPuxKLCoLPjMk6M3mKMe1zkZliXk/fr
	 mltiLJUpC7/eM61LfFLCM9XlvZuzU+5fzI+NVz36p8nhj4S6cssk6SHODopLV/SlA/
	 nW36rVQ/WTj80LXFyiNBVJKU8n+9q4m/jWQBPItuS239gW0bmW5T8vPSRgjFlet32R
	 iTiCUuP6cgTi7kxNUmHNTOXyiZY64V1KYu3ZJ5P/D5XMLiNVereZROTcmTor8ygLBs
	 WekZG7relWUBrdvm0mgicofCNSm5g2vlQrGOEb+b7rKTc/D50xwlaVBbRmHCH027gF
	 oMZ/eSvVlXgaw==
From: SeongJae Park <sj@kernel.org>
To: jgross@suse.com,
	roger.pau@citrix.com
Cc: marmarek@invisiblethingslab.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	axboe@kernel.dk,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	SeongJae Park <sj@kernel.org>
Subject: [PATCH 0/2] xen-blk{front,back}: Advertise feature-persistent as user requested
Date: Thu, 25 Aug 2022 16:15:09 +0000
Message-Id: <20220825161511.94922-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit e94c6101e151 ("xen-blkback: Apply 'feature_persistent' parameter
when connect") made blkback to advertise its support of the persistent
grants feature only if the user sets the 'feature_persistent' parameter
of the driver and the frontend advertised its support of the feature.
However, following commit 402c43ea6b34 ("xen-blkfront: Apply
'feature_persistent' parameter when connect") made the blkfront to work
in the same way.  That is, blkfront also advertises its support of the
persistent grants feature only if the user sets the 'feature_persistent'
parameter of the driver and the backend advertised its support of the
feature.

Hence blkback and blkfront will never advertise their support of the
feature but wait until the other advertises the support, even though
users set the 'feature_persistent' parameters of the drivers.  As a
result, the persistent grants feature is disabled always regardless of
the 'feature_persistent' values[1].

The problem comes from the misuse of the semantic of the advertisement
of the feature.  The advertisement of the feature should means only
availability of the feature not the decision for using the feature.
However, current behavior is working in the wrong way.

This patchset fixes the issue by making both blkback and blkfront
advertise their support of the feature as user requested via
'feature_persistent' parameter regardless of the otherend's support of
the feature.

[1] https://lore.kernel.org/xen-devel/bd818aba-4857-bc07-dc8a-e9b2f8c5f7cd@suse.com/

SeongJae Park (2):
  xen-blkback: Advertise feature-persistent as user requested
  xen-blkfront: Advertise feature-persistent as user requested

 drivers/block/xen-blkback/common.h | 3 +++
 drivers/block/xen-blkback/xenbus.c | 6 ++++--
 drivers/block/xen-blkfront.c       | 8 ++++++--
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.25.1


