Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C540A59824
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 15:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906550.1313968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1treTH-0003Do-Iv; Mon, 10 Mar 2025 14:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906550.1313968; Mon, 10 Mar 2025 14:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1treTH-0003Bx-DS; Mon, 10 Mar 2025 14:51:11 +0000
Received: by outflank-mailman (input) for mailman id 906550;
 Mon, 10 Mar 2025 14:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+uq=V5=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1treTF-0003BL-OY
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 14:51:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 190a7474-fdbf-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 15:51:07 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62E3216F2;
 Mon, 10 Mar 2025 07:51:18 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.38.103])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C699F3F5A1;
 Mon, 10 Mar 2025 07:51:04 -0700 (PDT)
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
X-Inumbo-ID: 190a7474-fdbf-11ef-9898-31a8f345e629
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v2 1/5] xen/arm: Create tee command line parameter
Date: Mon, 10 Mar 2025 15:50:33 +0100
Message-ID: <9313ffc0cf2e8be7e39ba24e8849a27b6bae2526.1741617888.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1741617888.git.bertrand.marquis@arm.com>
References: <cover.1741617888.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new command line parameter "tee=" to be used to explicitly select
what tee mediator is to be used by Xen and fail if it does not exist
or the probe function for it failed.

Without specifying which tee is to be used, Xen will use the first one
for which the probe function succeeds which depends on the order of the
mediator list which depends on the compiler.
Using the command line argument, it is now possible to explicit request
a specific TEE mediator and panic on boot if it is not available.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- Patch introduced to add a command line selection of the TEE
---
 docs/misc/xen-command-line.pandoc  | 14 ++++++++++++++
 xen/arch/arm/include/asm/tee/tee.h |  4 ++++
 xen/arch/arm/tee/tee.c             | 31 ++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 89db6e83be66..8464d7127890 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2651,6 +2651,20 @@ Specify the per-cpu trace buffer size in pages.
 
 Flag to enable TSC deadline as the APIC timer mode.
 
+### tee
+> `= <string>`
+
+Specify the TEE mediator to be probed and use.
+
+The default behaviour is to probe all supported TEEs supported by Xen and use
+the first one successfully probed. When this parameter is passed, Xen will
+probe only the TEE mediator passed as argument and boot will fail if this
+mediator is not properly probed or if the requested TEE is not supported by
+Xen.
+
+This parameter can be set to `optee` of `ffa` if the corresponding mediators
+are compiled in.
+
 ### tevt_mask
 > `= <integer>`
 
diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
index 0169fd746bcd..15d664e28dce 100644
--- a/xen/arch/arm/include/asm/tee/tee.h
+++ b/xen/arch/arm/include/asm/tee/tee.h
@@ -55,6 +55,9 @@ struct tee_mediator_desc {
     /* Printable name of the TEE. */
     const char *name;
 
+    /* Command line name of the TEE (to be used with tee= cmdline option) */
+    const char *cmdline_name;
+
     /* Mediator callbacks as described above. */
     const struct tee_mediator_ops *ops;
 
@@ -77,6 +80,7 @@ void tee_free_domain_ctx(struct domain *d);
 static const struct tee_mediator_desc __tee_desc_##_name __used     \
 __section(".teemediator.info") = {                                  \
     .name = _namestr,                                               \
+    .cmdline_name = #_name,                                         \
     .ops = _ops,                                                    \
     .tee_type = _type                                               \
 }
diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 3f65e45a7892..066b5ba40f9d 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -19,12 +19,17 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/types.h>
+#include <xen/param.h>
 
 #include <asm/tee/tee.h>
 
 extern const struct tee_mediator_desc _steemediator[], _eteemediator[];
 static const struct tee_mediator_desc __read_mostly *cur_mediator;
 
+/* Select the TEE mediator using a name on command line. */
+static char __initdata opt_mediator[16] = "";
+string_param("tee", opt_mediator);
+
 /*
  * TODO: Add function to alter Dom0 DTB, so we can properly describe
  * present TEE.
@@ -81,14 +86,40 @@ static int __init tee_init(void)
 {
     const struct tee_mediator_desc *desc;
 
+    if ( strcmp(opt_mediator, "") )
+        printk(XENLOG_INFO "TEE Mediator %s selected from command line\n",
+               opt_mediator);
+
+    /*
+     * When a specific TEE is selected using the 'tee=' command line
+     * argument, we panic if the probe fails or if the requested TEE is not
+     * supported.
+     */
     for ( desc = _steemediator; desc != _eteemediator; desc++ )
     {
+        if ( strcmp(opt_mediator, "") &&
+             strncmp(opt_mediator, desc->cmdline_name, sizeof(opt_mediator)) )
+            continue;
+
         if ( desc->ops->probe() )
         {
             printk(XENLOG_INFO "Using TEE mediator for %s\n", desc->name);
             cur_mediator = desc;
             return 0;
         }
+        else if ( strcmp(opt_mediator, "") )
+        {
+            panic("TEE mediator %s from command line probe failed\n",
+                  opt_mediator);
+            return -EFAULT;
+        }
+    }
+
+    if ( strcmp(opt_mediator, "") )
+    {
+        panic("TEE Mediator %s from command line not supported\n",
+              opt_mediator);
+        return -EINVAL;
     }
 
     return 0;
-- 
2.47.1


