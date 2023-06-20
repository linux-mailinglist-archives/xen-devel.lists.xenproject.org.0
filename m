Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAE1736A29
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551553.861214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ75-00018C-Ty; Tue, 20 Jun 2023 11:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551553.861214; Tue, 20 Jun 2023 11:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ75-0000tY-Dt; Tue, 20 Jun 2023 11:01:31 +0000
Received: by outflank-mailman (input) for mailman id 551553;
 Tue, 20 Jun 2023 10:35:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovpU=CI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBYhz-0004Ou-8Q
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 10:35:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fa244a0-0f56-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 12:35:33 +0200 (CEST)
Received: from beta.bugseng.com (93-40-74-174.ip37.fastwebnet.it
 [93.40.74.174])
 by support.bugseng.com (Postfix) with ESMTPSA id 8BB184EE0754;
 Tue, 20 Jun 2023 12:35:32 +0200 (CEST)
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
X-Inumbo-ID: 2fa244a0-0f56-11ee-8611-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 09/13] xen/public: fixed violations of MISRA C:2012 Rule 7.2
Date: Tue, 20 Jun 2023 12:35:01 +0200
Message-Id: <2214598125081ccfb324555288bee0340f8b1024.1687250177.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687250177.git.gianluca.luparini@bugseng.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
"A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".

I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/include/public/io/ring.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index 025939278b..6a6deeee8f 100644
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
+#define __RD2(_x)  (((_x) & 0x00000002U) ? 0x2                  : ((_x) & 0x1))
+#define __RD4(_x)  (((_x) & 0x0000000cU) ? __RD2((_x)>>2)<<2    : __RD2(_x))
+#define __RD8(_x)  (((_x) & 0x000000f0U) ? __RD4((_x)>>4)<<4    : __RD4(_x))
+#define __RD16(_x) (((_x) & 0x0000ff00U) ? __RD8((_x)>>8)<<8    : __RD8(_x))
+#define __RD32(_x) (((_x) & 0xffff0000U) ? __RD16((_x)>>16)<<16 : __RD16(_x))
 
 /*
  * Calculate size of a shared ring, given the total available space for the
-- 
2.41.0


