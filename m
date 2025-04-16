Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F1A8B268
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 09:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955184.1349002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xNc-0006AZ-FV; Wed, 16 Apr 2025 07:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955184.1349002; Wed, 16 Apr 2025 07:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xNc-00068D-8n; Wed, 16 Apr 2025 07:40:20 +0000
Received: by outflank-mailman (input) for mailman id 955184;
 Wed, 16 Apr 2025 07:40:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8b=XC=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1u4xNb-00065X-2O
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 07:40:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0a474548-1a96-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 09:40:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D823152B;
 Wed, 16 Apr 2025 00:40:14 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.44.175])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF4DB3F66E;
 Wed, 16 Apr 2025 00:40:14 -0700 (PDT)
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
X-Inumbo-ID: 0a474548-1a96-11f0-9ffb-bf95429c2676
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
Subject: [PATCH v5 1/6] xen/arm: Create tee command line parameter
Date: Wed, 16 Apr 2025 09:39:42 +0200
Message-ID: <e175a051ecefe0adf3b31d5c5bc25efda67d6b75.1744787720.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1744787720.git.bertrand.marquis@arm.com>
References: <cover.1744787720.git.bertrand.marquis@arm.com>
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
index 89db6e83be66..472de1911363 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2651,6 +2651,20 @@ Specify the per-cpu trace buffer size in pages.
 
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


