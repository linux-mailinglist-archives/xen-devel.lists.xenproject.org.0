Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCBCB38768
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 18:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096486.1451181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urIhl-00082O-3e; Wed, 27 Aug 2025 16:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096486.1451181; Wed, 27 Aug 2025 16:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urIhl-0007zE-0T; Wed, 27 Aug 2025 16:08:57 +0000
Received: by outflank-mailman (input) for mailman id 1096486;
 Wed, 27 Aug 2025 16:08:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7rPc=3H=cloud.com=mark.syms@srs-se1.protection.inumbo.net>)
 id 1urIhj-0007jm-Jf
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 16:08:55 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.corp.cloud.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 202c29c6-8360-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 18:08:53 +0200 (CEST)
Received: from mewpvdipd1010.corp.cloud.com (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 5B60C40D6683;
 Wed, 27 Aug 2025 12:08:14 -0400 (EDT)
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
X-Inumbo-ID: 202c29c6-8360-11f0-ae26-e363de0e7a9e
From: Mark Syms <mark.syms@cloud.com>
To: qemu-devel@nongnu.org,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	Mark Syms <mark.syms@cloud.com>
Subject: [PATCH] [xen-block] Return BLKIF_RSP_EOPNOTSUPP for unknown operation
Date: Wed, 27 Aug 2025 17:08:41 +0100
Message-ID: <20250827160841.351707-1-mark.syms@cloud.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Returning BLKIF_RSP_ERROR if an operation is not supoprted does not
allow the frontend to exercise any discretion on how to handle the
response and may lead to an operating system crash. As different
backends may support different feature sets and we might, during a
migration, switch backends, an in-flight request might be issued (or
reissued) which is then not supported by this backend.

Signed-off-by: Mark Syms <mark.syms@cloud.com>
---
 hw/block/dataplane/xen-block.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 48c2e315f3..32cf919a97 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -167,7 +167,8 @@ static int xen_block_parse_request(XenBlockRequest *request)
         return 0;
     default:
         error_report("error: unknown operation (%d)", request->req.operation);
-        goto err;
+        request->status = BLKIF_RSP_EOPNOTSUPP;
+        return -1;
     };
 
     if (request->req.operation != BLKIF_OP_READ &&
-- 
2.50.1


