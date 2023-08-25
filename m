Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E760788C13
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 17:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590948.923317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZYKi-0007J5-Ew; Fri, 25 Aug 2023 15:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590948.923317; Fri, 25 Aug 2023 15:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZYKi-0007HE-C9; Fri, 25 Aug 2023 15:02:44 +0000
Received: by outflank-mailman (input) for mailman id 590948;
 Fri, 25 Aug 2023 15:02:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFgK=EK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qZYKg-0007H5-KM
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 15:02:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f3359e5-4358-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 17:02:40 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 8F3724EE0737;
 Fri, 25 Aug 2023 17:02:38 +0200 (CEST)
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
X-Inumbo-ID: 6f3359e5-4358-11ee-8783-cb3800f73035
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Paul Durrant <paul@xen.org>
Subject: [XEN PATCH] ioreq: include arch-specific ioreq header in <xen/ioreq.h>
Date: Fri, 25 Aug 2023 17:02:17 +0200
Message-Id: <e5f13920dfcb9f828abb4a36dd410d342f4c0939.1692974235.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The common header file for ioreq should include the arch-specific one.
This also addresses violations of MISRA C:2012 Rule 8.4 caused by the missing
inclusion of <asm/ioreq.h> in the arm implementation file.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
- The deleted includes are therefore no longer necessary, since
 <xen/ioreq.h> is sufficient.
- The functions (possibly) missing a visible declaration prior to their definition
  currently are 'handle_ioserv' and 'try_fwd_ioserv'
---
 xen/arch/arm/io.c       | 1 -
 xen/common/ioreq.c      | 1 -
 xen/include/xen/ioreq.h | 1 +
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 96c740d5636c..13ae1fed5718 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -14,7 +14,6 @@
 #include <xen/sort.h>
 #include <asm/cpuerrata.h>
 #include <asm/current.h>
-#include <asm/ioreq.h>
 #include <asm/mmio.h>
 #include <asm/traps.h>

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 7cb717f7a2a4..bde1a1f4eaa1 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -28,7 +28,6 @@
 #include <xen/trace.h>

 #include <asm/guest_atomics.h>
-#include <asm/ioreq.h>

 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index a26614d331e3..d85477c665e9 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -20,6 +20,7 @@
 #define __XEN_IOREQ_H__

 #include <xen/sched.h>
+#include <asm/ioreq.h>

 #include <public/hvm/dm_op.h>

--
2.34.1

