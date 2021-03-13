Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E0339E56
	for <lists+xen-devel@lfdr.de>; Sat, 13 Mar 2021 14:43:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97531.185286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lL4Wr-000810-Oz; Sat, 13 Mar 2021 13:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97531.185286; Sat, 13 Mar 2021 13:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lL4Wr-00080b-LZ; Sat, 13 Mar 2021 13:42:05 +0000
Received: by outflank-mailman (input) for mailman id 97531;
 Sat, 13 Mar 2021 13:42:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lL4Wq-00080W-60
 for xen-devel@lists.xenproject.org; Sat, 13 Mar 2021 13:42:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lL4Wo-0003UQ-H0; Sat, 13 Mar 2021 13:42:02 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lL4Wo-0000Th-6K; Sat, 13 Mar 2021 13:42:02 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=X5LsG9ymoBz2OvK8Dyuay4FldkMlI9IsWMLmTitdIJY=; b=jUtNE9KtZiZA7NUGjvBYszMo0Q
	OJFCNEqhXmDZ349IxTaEHEeiC+afC+DQsMinJn33sMEXGQm+mA0MLV2AynJ3z3UMU0c9qIisnAZI+
	3r5Ifs++JnuQWmokETzZsELbhheH51K4GdrUeoPxKL6YE3vHUxeNTveAcAKaOuzXhXFk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	volodymyr_babchuk@epam.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.15 v2] xen: Bump the minimum version of GCC supported to 4.9 for arm32 and 5.1 on arm64
Date: Sat, 13 Mar 2021 13:41:58 +0000
Message-Id: <20210313134158.24363-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Compilers older than 4.8 have known codegen issues which can lead to
silent miscompilation:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145

Furthermore, pre-4.9 GCC have known bugs (including things like
internal compiler errors on Arm) which would require workaround (I
haven't checked if we have any in Xen).

The minimum version of GCC to build the hypervisor on arm is now
raised to 4.9.

In addition to that, on arm64, GCC version >= 4.9 and < 5.1 have been
shown to emit memory references beyond the stack pointer, resulting in
memory corruption if an interrupt is taken after the stack pointer has
been adjusted but before the reference has been executed.

Therefore, the minimum for arm64 is raised to 5.1.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This patch is candidate to 4.15 and backport.

This is only a build change and will be low-risk for anyone using newer
compiler (5.1+ for arm64 and 4.9+ for arm32). Xen will stop building
for anyone using older compiler. But it is better than fighting
with codegen issues.

Changes in v2:
    - Only bump the GCC version for Arm.
---
 README                     |  7 +++++--
 xen/include/xen/compiler.h | 10 ++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/README b/README
index 8c99c30986c1..aa8b4fe126a8 100644
--- a/README
+++ b/README
@@ -42,8 +42,11 @@ provided by your OS distributor:
         - GNU Binutils 2.16.91.0.5 or later
         or
         - Clang/LLVM 3.5 or later
-      - For ARM:
-        - GCC 4.8 or later
+      - For ARM 32-bit:
+        - GCC 4.9 or later
+        - GNU Binutils 2.24 or later
+      - For ARM 64-bit:
+        - GCC 5.1 or later
         - GNU Binutils 2.24 or later
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.6 or later (e.g., python-dev)
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 0ec0b4698ea7..17cf00e1ec92 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -3,6 +3,16 @@
 
 #if !defined(__GNUC__) || (__GNUC__ < 4)
 #error Sorry, your compiler is too old/not recognized.
+#elif CONFIG_CC_IS_GCC
+# if defined(CONFIG_ARM_32) && CONFIG_GCC_VERSION < 40900
+#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
+# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
+/*
+ * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
+ * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
+ */
+#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
+# endif
 #endif
 
 #define barrier()     __asm__ __volatile__("": : :"memory")
-- 
2.17.1


