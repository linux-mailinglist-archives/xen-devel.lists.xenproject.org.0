Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC506753A22
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 13:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563586.880909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKHJ8-0006NC-FX; Fri, 14 Jul 2023 11:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563586.880909; Fri, 14 Jul 2023 11:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKHJ8-0006LX-9y; Fri, 14 Jul 2023 11:49:58 +0000
Received: by outflank-mailman (input) for mailman id 563586;
 Fri, 14 Jul 2023 11:49:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z95V=DA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qKHJ5-0005Gy-UM
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 11:49:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c51e747-223c-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 13:49:54 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.163.94.163])
 by support.bugseng.com (Postfix) with ESMTPSA id 463314EE0C8D;
 Fri, 14 Jul 2023 13:49:53 +0200 (CEST)
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
X-Inumbo-ID: 8c51e747-223c-11ee-8611-37d641c3527e
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 4/4] xen/arm: initialize conditionally uninitialized local variables
Date: Fri, 14 Jul 2023 13:49:21 +0200
Message-Id: <6640fc480d550bb337455afc0c2663d4b288dd4f.1689329728.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689329728.git.nicola.vetrini@bugseng.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function 'guest_walk_tables' contains an initialization
pattern for the pointee of parameter 'perms' that is not easy
for automatic checkers to reason about.

A modified pattern that does not alter the semantics of the
code is introduced.

A const qualifier is added in 'xen/arch/arm/dm.c' because
'copy_to_guest_offset' doesn't modify that parameter.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/dm.c         |  2 +-
 xen/arch/arm/guest_walk.c | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index 5569efa121..910788e098 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -129,7 +129,7 @@ int dm_op(const struct dmop_args *op_args)
 
     if ( (!rc || rc == -ERESTART) &&
          !const_op && copy_to_guest_offset(op_args->buf[0].h, offset,
-                                           (void *)&op.u, op_size[op.op]) )
+                                           (const void *)&op.u, op_size[op.op]) )
         rc = -EFAULT;
 
  out:
diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index d99b411f3b..6c017242f2 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -552,15 +552,12 @@ bool guest_walk_tables(const struct vcpu *v, vaddr_t gva,
 {
     register_t sctlr = READ_SYSREG(SCTLR_EL1);
     register_t tcr = READ_SYSREG(TCR_EL1);
-    unsigned int _perms;
+    unsigned int _perms = GV2M_READ;
 
     /* We assume that the domain is running on the currently active domain. */
     if ( v != current )
         return false;
 
-    /* Allow perms to be NULL. */
-    perms = perms ?: &_perms;
-
     /*
      * Currently, we assume a GVA to IPA translation with EL1 privileges.
      * Since, valid mappings in the first stage address translation table are
@@ -570,7 +567,12 @@ bool guest_walk_tables(const struct vcpu *v, vaddr_t gva,
      * attributes that distinguish between EL0 and EL1 permissions (EL0 might
      * not have permissions on the particular mapping).
      */
-    *perms = GV2M_READ;
+    /* Allow perms to be NULL. */
+    if( perms ) {
+      *perms = _perms;
+    } else {
+      perms = &_perms;
+    }
 
     /* If the MMU is disabled, there is no need to translate the gva. */
     if ( !(sctlr & SCTLR_Axx_ELx_M) )
-- 
2.34.1


