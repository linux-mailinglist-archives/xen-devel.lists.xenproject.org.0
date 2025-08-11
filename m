Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F9AB20A56
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 15:35:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077626.1438665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulSgV-0003KZ-4Y; Mon, 11 Aug 2025 13:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077626.1438665; Mon, 11 Aug 2025 13:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulSgV-0003J1-1l; Mon, 11 Aug 2025 13:35:31 +0000
Received: by outflank-mailman (input) for mailman id 1077626;
 Mon, 11 Aug 2025 13:35:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6owi=2X=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1ulSgU-0003IJ-A1
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 13:35:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0ba046c3-76b8-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 15:35:29 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FD1D150C;
 Mon, 11 Aug 2025 06:35:20 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.55.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B406E3F63F;
 Mon, 11 Aug 2025 06:35:26 -0700 (PDT)
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
X-Inumbo-ID: 0ba046c3-76b8-11f0-a325-13f23c93f187
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 1/6] xen/arm: Create tee command line parameter
Date: Mon, 11 Aug 2025 15:34:57 +0200
Message-ID: <c2e116655396a539a67e4467dc1aef3c312e4359.1754899329.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1754899329.git.bertrand.marquis@arm.com>
References: <cover.1754899329.git.bertrand.marquis@arm.com>
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
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v8:
- None
Changes in v7:
- Add Julien A-b
Changes in v6:
- Add Jens R-b
Changes in v5:
- Typo fix and rewording in command line doc (Julien)
- fix include order in tee.c (Julien)
- use a local bool instead of retesting the string each time in tee_init
  (Julien)
Changes in v4:
- None
Changes in v3:
- Properly classify tee as arm specific (Jan)
Changes in v2:
- Patch introduced to add a command line selection of the TEE
---
 docs/misc/xen-command-line.pandoc  | 14 +++++++++++++
 xen/arch/arm/include/asm/tee/tee.h |  4 ++++
 xen/arch/arm/tee/tee.c             | 32 ++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6865a61220ca..ad5800ac45a8 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2655,6 +2655,20 @@ Specify the per-cpu trace buffer size in pages.
 
 Flag to enable TSC deadline as the APIC timer mode.
 
+### tee (arm)
+> `= <string>`
+
+Specify the TEE mediator to be probed and use.
+
+The default behaviour is to probe all TEEs supported by Xen and use
+the first one successfully probed. When this parameter is passed, Xen will
+probe only the TEE mediator passed as argument and boot will fail if this
+mediator is not properly probed or if the requested TEE is not supported by
+Xen.
+
+This parameter can be set to `optee` or `ffa` if the corresponding mediators
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
index 3f65e45a7892..8501443c8e57 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -18,6 +18,7 @@
 
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/param.h>
 #include <xen/types.h>
 
 #include <asm/tee/tee.h>
@@ -25,6 +26,10 @@
 extern const struct tee_mediator_desc _steemediator[], _eteemediator[];
 static const struct tee_mediator_desc __read_mostly *cur_mediator;
 
+/* Select the TEE mediator using a name on command line. */
+static char __initdata opt_mediator[16] = "";
+string_param("tee", opt_mediator);
+
 /*
  * TODO: Add function to alter Dom0 DTB, so we can properly describe
  * present TEE.
@@ -80,15 +85,42 @@ uint16_t tee_get_type(void)
 static int __init tee_init(void)
 {
     const struct tee_mediator_desc *desc;
+    bool select_mediator = strcmp(opt_mediator, "");
+
+    if ( select_mediator )
+        printk(XENLOG_INFO "TEE Mediator %s selected from command line\n",
+               opt_mediator);
 
+    /*
+     * When a specific TEE is selected using the 'tee=' command line
+     * argument, we panic if the probe fails or if the requested TEE is not
+     * supported.
+     */
     for ( desc = _steemediator; desc != _eteemediator; desc++ )
     {
+        if ( select_mediator &&
+             strncmp(opt_mediator, desc->cmdline_name, sizeof(opt_mediator)) )
+            continue;
+
         if ( desc->ops->probe() )
         {
             printk(XENLOG_INFO "Using TEE mediator for %s\n", desc->name);
             cur_mediator = desc;
             return 0;
         }
+        else if ( select_mediator )
+        {
+            panic("TEE mediator %s from command line probe failed\n",
+                  opt_mediator);
+            return -EFAULT;
+        }
+    }
+
+    if ( select_mediator )
+    {
+        panic("TEE Mediator %s from command line not supported\n",
+              opt_mediator);
+        return -EINVAL;
     }
 
     return 0;
-- 
2.47.1


