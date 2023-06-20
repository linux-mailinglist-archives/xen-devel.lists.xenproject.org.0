Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2DC736A32
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551544.861179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ73-0000RL-Mc; Tue, 20 Jun 2023 11:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551544.861179; Tue, 20 Jun 2023 11:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ73-0000E6-Em; Tue, 20 Jun 2023 11:01:29 +0000
Received: by outflank-mailman (input) for mailman id 551544;
 Tue, 20 Jun 2023 10:35:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovpU=CI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBYhr-0004Pq-I4
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 10:35:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b8d6657-0f56-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 12:35:26 +0200 (CEST)
Received: from beta.bugseng.com (93-40-74-174.ip37.fastwebnet.it
 [93.40.74.174])
 by support.bugseng.com (Postfix) with ESMTPSA id 079F94EE0757;
 Tue, 20 Jun 2023 12:35:24 +0200 (CEST)
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
X-Inumbo-ID: 2b8d6657-0f56-11ee-b234-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 05/13] xen/common: fixed violations of MISRA C:2012 Rule 7.2
Date: Tue, 20 Jun 2023 12:34:57 +0200
Message-Id: <8aff4bc56b29372345e828462766d803b8c9b710.1687250177.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687250177.git.gianluca.luparini@bugseng.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
"A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".

I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/common/device_tree.c        | 4 ++--
 xen/include/xen/libfdt/fdt.h    | 2 +-
 xen/include/xen/libfdt/libfdt.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 8da1052911..0677193ab3 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2115,7 +2115,7 @@ static void __init __unflatten_device_tree(const void *fdt,
     /* Allocate memory for the expanded device tree */
     mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
 
-    ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
+    ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeefU);
 
     dt_dprintk("  unflattening %lx...\n", mem);
 
@@ -2125,7 +2125,7 @@ static void __init __unflatten_device_tree(const void *fdt,
     if ( be32_to_cpup((__be32 *)start) != FDT_END )
         printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
                   *((u32 *)start));
-    if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeef )
+    if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeefU )
         printk(XENLOG_WARNING "End of tree marker overwritten: %08x\n",
                   be32_to_cpu(((__be32 *)mem)[size / 4]));
     *allnextp = NULL;
diff --git a/xen/include/xen/libfdt/fdt.h b/xen/include/xen/libfdt/fdt.h
index f2e68807f2..7c99d838e8 100644
--- a/xen/include/xen/libfdt/fdt.h
+++ b/xen/include/xen/libfdt/fdt.h
@@ -47,7 +47,7 @@ struct fdt_property {
 
 #endif /* !__ASSEMBLY */
 
-#define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
+#define FDT_MAGIC	0xd00dfeedU	/* 4: version, 4: total size */
 #define FDT_TAGSIZE	sizeof(fdt32_t)
 
 #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
index c71689e2be..dd6b649602 100644
--- a/xen/include/xen/libfdt/libfdt.h
+++ b/xen/include/xen/libfdt/libfdt.h
@@ -109,7 +109,7 @@ extern "C" {
 #define FDT_ERR_MAX		19
 
 /* constants */
-#define FDT_MAX_PHANDLE 0xfffffffe
+#define FDT_MAX_PHANDLE 0xfffffffeU
 	/* Valid values for phandles range from 1 to 2^32-2. */
 
 /**********************************************************************/
-- 
2.41.0


