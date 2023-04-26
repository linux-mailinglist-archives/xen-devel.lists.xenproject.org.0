Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404A46EF890
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 18:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526789.818770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1priC3-0000fZ-TA; Wed, 26 Apr 2023 16:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526789.818770; Wed, 26 Apr 2023 16:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1priC3-0000cS-QQ; Wed, 26 Apr 2023 16:40:35 +0000
Received: by outflank-mailman (input) for mailman id 526789;
 Wed, 26 Apr 2023 16:40:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4Vc=AR=citrix.com=prvs=473c62be2=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1priC2-0000cM-0w
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 16:40:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e918790-e451-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 18:40:32 +0200 (CEST)
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
X-Inumbo-ID: 0e918790-e451-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682527232;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xhRc0AT4ugGzA8EYup0rcdpey2Q9q4IGlb8wJi+JpaE=;
  b=TjYxTxOdlkxB8YmzrhS/LoTeeJTJvuBW0dNH71wkFL1HCzRnIJ6Jh+n4
   phVSmNLe3GQ7V6jApP7I3HnPO1jPk8pWRh7BFPFAC47/3MvhclQCX4tYd
   Wa3VhFpckVOCJssaI4fFnDHmQdq66n2lRRvHeuVoO93JQunyFGiAZWvIx
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106852690
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:EYMLyaoEVUAP5LGv6qU1xyonDJNeBmIoZRIvgKrLsJaIsI4StFCzt
 garIBmFPPuJZWP1fYx+aIi/pE8CuZDUyoAwSldkryw3QS4T85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCzSdNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC0SMRm/ovCp+r74RuBqpP4bC9OxBapK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVCr0mO464+7GXJ0wV11JDmMcbPe8zMTsJQ9qqdj
 jueoTSkWE9LbLRzzxKhtVW3o8X+sB//Sd4QSa+Hy9FK3Rqckzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6g6XzbHPyx2EHWVCRTlEAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+TqT6xIiETIXU1eT4fTQAF7t/gp6k+lhvKCN1kFcadh83/HjzYw
 D2QqiU6wbkQ5fPnzI3iowqB2Wj14MGUEEhsvF6/sn+ZAh1ReZH6brCN+0fh4bVMJYC7dGGmp
 iI9sp3LhAwRNq1hhBBhUc1UQuHzvKfYaGCM6bJ8N8J/rmrwohZPaagVuWgjfxkxb67obBezO
 CfuVRVtCIi/1ZdARYt+eMqPBssj1sAM/vy1B6mPPrKijnWcHTJrHR2ChmbKhQgBaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNFcqnk0v5juTPNCX9pVI53LymN7hR0U95iF+Nr
 4Y32zWikH2zr9ESkgGIqNVOfDjm3FAwBIzsqtw/S9Nv1jFOQTl7Y9eImONJRmCQt/gN/gs+1
 i3nCxAwJZuWrSGvFDhmnVg5MuKzDM8u9yxmVcHuVH7xs0UejU+UxP93X/MKkXMPrrELISJcJ
 xXdR/i9Pw==
IronPort-HdrOrdr: A9a23:15M3HaBMqRWZy0PlHemB55DYdb4zR+YMi2TDtnoBMiC9F/bzqy
 nApoV96faZslYssTQb6LO90cq7MBbhHPxOkO8s1N6ZNWGM2VdAbrsSj7cKqAeQYhEWmNQtrZ
 uIsJITNDQzNzVHZArBjzWQIpIA+p2p+LHtr+fSpk0dKT2CopsP0ztE
X-Talos-CUID: 9a23:6JP9AWFlsAhgqPrrqmJ66xEdJuU3bUfRj3vZJW2CMUFzEoS8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Ac4IR/A+JddBcYR6XmB0+dLuQf+MvxL+LInEgrZE?=
 =?us-ascii?q?X58vZJxNNFBfAyzviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,228,1677560400"; 
   d="scan'208";a="106852690"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <roger.pau@citrix.com>, <jgross@suse.com>, <sstabellini@kernel.org>,
	<oleksandr_tyshchenko@epam.com>, <axboe@kernel.dk>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [PATCH] xen/blkfront: Only check REQ_FUA for writes
Date: Wed, 26 Apr 2023 17:40:05 +0100
Message-ID: <20230426164005.2213139-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The existing code silently converts read operations with the
REQ_FUA bit set into write-barrier operations. This results in data
loss as the backend scribbles zeroes over the data instead of returning
it.

While the REQ_FUA bit doesn't make sense on a read operation, at least
one well-known out-of-tree kernel module does set it and since it
results in data loss, let's be safe here and only look at REQ_FUA for
writes.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 drivers/block/xen-blkfront.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 23ed258b57f0..c1890c8a9f6e 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -780,7 +780,8 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
 		ring_req->u.rw.handle = info->handle;
 		ring_req->operation = rq_data_dir(req) ?
 			BLKIF_OP_WRITE : BLKIF_OP_READ;
-		if (req_op(req) == REQ_OP_FLUSH || req->cmd_flags & REQ_FUA) {
+		if (req_op(req) == REQ_OP_FLUSH ||
+		    (req_op(req) == REQ_OP_WRITE && (req->cmd_flags & REQ_FUA))) {
 			/*
 			 * Ideally we can do an unordered flush-to-disk.
 			 * In case the backend onlysupports barriers, use that.
-- 
2.31.1


