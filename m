Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED36748800
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559309.874226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4PZ-0002NZ-K7; Wed, 05 Jul 2023 15:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559309.874226; Wed, 05 Jul 2023 15:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4PZ-0002Ij-Ci; Wed, 05 Jul 2023 15:27:21 +0000
Received: by outflank-mailman (input) for mailman id 559309;
 Wed, 05 Jul 2023 15:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yX3c=CX=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qH4PX-0001UO-Tn
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:27:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dd367f7-1b48-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 17:27:19 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.163.248.64])
 by support.bugseng.com (Postfix) with ESMTPSA id 144FF4EE0C8A;
 Wed,  5 Jul 2023 17:27:18 +0200 (CEST)
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
X-Inumbo-ID: 6dd367f7-1b48-11ee-b237-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v2 05/13] xen/device-tree: fix violations of MISRA C:2012 Rule 7.2
Date: Wed,  5 Jul 2023 17:26:27 +0200
Message-Id: <da656a93e42e5d04e02f62002b1f5ab357c8c16a.1688559115.git.gianluca.luparini@bugseng.com>
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
- change commit title to the right one
- change commit message
- change maintainers in Cc
- remove changes in 'libfdt'
---
 xen/common/device_tree.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
2.41.0


