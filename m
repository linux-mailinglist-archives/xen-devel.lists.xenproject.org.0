Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5D175048E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:34:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562213.878871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXAW-0008LD-L3; Wed, 12 Jul 2023 10:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562213.878871; Wed, 12 Jul 2023 10:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXAW-00087p-4l; Wed, 12 Jul 2023 10:34:00 +0000
Received: by outflank-mailman (input) for mailman id 562213;
 Wed, 12 Jul 2023 10:33:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0TT=C6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qJXAT-0006Dd-NS
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:33:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9af0ad29-209f-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 12:33:56 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.161.151.90])
 by support.bugseng.com (Postfix) with ESMTPSA id AF8ED4EE0C8B;
 Wed, 12 Jul 2023 12:33:55 +0200 (CEST)
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
X-Inumbo-ID: 9af0ad29-209f-11ee-b239-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v3 09/15] xen/public: fix violations of MISRA C:2012 Rule 7.2
Date: Wed, 12 Jul 2023 12:32:10 +0200
Message-Id: <bb386366e1754b08392915736413ee93bd2356f6.1689152719.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689152719.git.gianluca.luparini@bugseng.com>
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type.

For the sake of uniformity, the following changes are made:
- add the 'U' suffix to integer constants before the '?' operator

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- change 'Signed-off-by' ordering
- change commit message

Changes in v2:
- minor change to commit title
- change commit message
- correct macros code style
---
 xen/include/public/io/ring.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index 025939278b..0cae4367be 100644
--- a/xen/include/public/io/ring.h
+++ b/xen/include/public/io/ring.h
@@ -36,11 +36,11 @@
 typedef unsigned int RING_IDX;
 
 /* Round a 32-bit unsigned constant down to the nearest power of two. */
-#define __RD2(_x)  (((_x) & 0x00000002) ? 0x2                  : ((_x) & 0x1))
-#define __RD4(_x)  (((_x) & 0x0000000c) ? __RD2((_x)>>2)<<2    : __RD2(_x))
-#define __RD8(_x)  (((_x) & 0x000000f0) ? __RD4((_x)>>4)<<4    : __RD4(_x))
-#define __RD16(_x) (((_x) & 0x0000ff00) ? __RD8((_x)>>8)<<8    : __RD8(_x))
-#define __RD32(_x) (((_x) & 0xffff0000) ? __RD16((_x)>>16)<<16 : __RD16(_x))
+#define __RD2(x)  (((x) & 0x00000002U) ? 0x2                     : ((x) & 0x1))
+#define __RD4(x)  (((x) & 0x0000000cU) ? __RD2((x) >> 2) << 2    : __RD2(x))
+#define __RD8(x)  (((x) & 0x000000f0U) ? __RD4((x) >> 4) << 4    : __RD4(x))
+#define __RD16(x) (((x) & 0x0000ff00U) ? __RD8((x) >> 8) << 8    : __RD8(x))
+#define __RD32(x) (((x) & 0xffff0000U) ? __RD16((x) >> 16) << 16 : __RD16(x))
 
 /*
  * Calculate size of a shared ring, given the total available space for the
-- 
2.41.0


