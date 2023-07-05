Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0177487FD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559314.874268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Pd-0003Xb-Ee; Wed, 05 Jul 2023 15:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559314.874268; Wed, 05 Jul 2023 15:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Pd-0003RD-57; Wed, 05 Jul 2023 15:27:25 +0000
Received: by outflank-mailman (input) for mailman id 559314;
 Wed, 05 Jul 2023 15:27:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yX3c=CX=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qH4Pb-0001UO-CH
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:27:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 701f4b6e-1b48-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 17:27:22 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.163.248.64])
 by support.bugseng.com (Postfix) with ESMTPSA id EA41A4EE0C99;
 Wed,  5 Jul 2023 17:27:21 +0200 (CEST)
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
X-Inumbo-ID: 701f4b6e-1b48-11ee-b237-6b7b168915f2
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
Subject: [XEN PATCH v2 09/13] xen/public: fix violations of MISRA C:2012 Rule 7.2
Date: Wed,  5 Jul 2023 17:26:31 +0200
Message-Id: <9e0d463e2fc09193a742fc7a64a331855705a4fb.1688559115.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688559115.git.gianluca.luparini@bugseng.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type and also to other
literals used in the same contexts or near violations, when their positive
nature is immediately clear. The latter changes are done for the sake of
uniformity.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
---
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


