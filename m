Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FBE9126DC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 15:42:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745264.1152409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKeVk-0005d8-2b; Fri, 21 Jun 2024 13:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745264.1152409; Fri, 21 Jun 2024 13:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKeVj-0005bC-Ua; Fri, 21 Jun 2024 13:41:03 +0000
Received: by outflank-mailman (input) for mailman id 745264;
 Fri, 21 Jun 2024 13:41:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gfdn=NX=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sKeVi-0005b6-P6
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 13:41:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e563ec7a-2fd3-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 15:41:00 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-17-171-46.retail.telecomitalia.it [87.17.171.46])
 by support.bugseng.com (Postfix) with ESMTPSA id A38BA4EE0738;
 Fri, 21 Jun 2024 15:40:58 +0200 (CEST)
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
X-Inumbo-ID: e563ec7a-2fd3-11ef-90a3-e314d9c70b13
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] common/unlzo: address violation of MISRA C Rule 7.3
Date: Fri, 21 Jun 2024 15:40:47 +0200
Message-Id: <847f9b715b3c8e2ba0637fdd79111f4f828389c6.1718976211.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses violations of MISRA C:2012 Rule 7.3 which states as
following: the lowercase character `l' shall not be used in a literal
suffix.

The file common/unlzo.c defines the non-compliant constant LZO_BLOCK_SIZE with
having a lowercase 'l'.
It is now defined as '256*1024L'.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
Changes from v1:
Instead of deviating /common/unlzo.c reports fro Rule 7.3 they are addressed by
changing the non-compliant definition of LZO_BLOCK_SIZE.
---
 xen/common/unlzo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/unlzo.c b/xen/common/unlzo.c
index bdcefa95b3..acb8dff600 100644
--- a/xen/common/unlzo.c
+++ b/xen/common/unlzo.c
@@ -52,7 +52,7 @@ static inline u32 get_unaligned_be32(const void *p)
 static const unsigned char lzop_magic[] = {
 	0x89, 0x4c, 0x5a, 0x4f, 0x00, 0x0d, 0x0a, 0x1a, 0x0a };
 
-#define LZO_BLOCK_SIZE        (256*1024l)
+#define LZO_BLOCK_SIZE        (256*1024L)
 #define HEADER_HAS_FILTER      0x00000800L
 #define HEADER_SIZE_MIN       (9 + 7     + 4 + 8     + 1       + 4)
 #define HEADER_SIZE_MAX       (9 + 7 + 1 + 8 + 8 + 4 + 1 + 255 + 4)
-- 
2.34.1


