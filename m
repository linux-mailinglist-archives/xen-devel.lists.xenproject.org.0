Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F48B3B67D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 10:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100891.1454169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uruuQ-0004lO-Pz; Fri, 29 Aug 2025 08:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100891.1454169; Fri, 29 Aug 2025 08:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uruuQ-0004iO-Mj; Fri, 29 Aug 2025 08:56:34 +0000
Received: by outflank-mailman (input) for mailman id 1100891;
 Fri, 29 Aug 2025 08:56:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I7Ro=3J=cloud.com=mark.syms@srs-se1.protection.inumbo.net>)
 id 1uruuP-0004P6-Kb
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 08:56:33 +0000
Received: from na1pdmzitismtp02.tibco.com (unknown [160.101.131.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f607385-84b6-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 10:56:33 +0200 (CEST)
Received: from mewpvdipd1010.corp.cloud.com (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 3ABD2810A2A8;
 Fri, 29 Aug 2025 04:55:49 -0400 (EDT)
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
X-Inumbo-ID: 0f607385-84b6-11f0-8adc-4578a1afcccb
From: Mark Syms <mark.syms@cloud.com>
To: jgross@suse.com,
	roger.pau@citrix.com,
	andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Cc: Mark Syms <mark.syms@cloud.com>
Subject: [PATCH v2] Clarify the cases where BLKIF_RSP_EOPNOTSUPP can be returned.
Date: Fri, 29 Aug 2025 09:56:27 +0100
Message-ID: <20250829085627.407307-1-mark.syms@cloud.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828093821.372024-1-mark.syms@cloud.com>
References: <20250828093821.372024-1-mark.syms@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously this said it would only happen on barrier writes. Except
the documentation blocks for
 * feature-flush-cache
 * feature-discard

Also say that they can return this error.

Signed-off-by: Mark Syms <mark.syms@cloud.com>

---
v2: simplify to remove references to features as requested.
---
 xen/include/public/io/blkif.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.h
index 8407453324..e96c9af7c6 100644
--- a/xen/include/public/io/blkif.h
+++ b/xen/include/public/io/blkif.h
@@ -710,7 +710,7 @@ typedef struct blkif_response blkif_response_t;
 /*
  * STATUS RETURN CODES.
  */
- /* Operation not supported (only happens on barrier writes). */
+ /* Operation not supported. */
 #define BLKIF_RSP_EOPNOTSUPP  -2
  /* Operation failed for some unspecified reason (-EIO). */
 #define BLKIF_RSP_ERROR       -1
-- 
2.50.1


