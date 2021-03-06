Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBC32FD95
	for <lists+xen-devel@lfdr.de>; Sat,  6 Mar 2021 22:43:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94384.177949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIegW-0007nN-It; Sat, 06 Mar 2021 21:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94384.177949; Sat, 06 Mar 2021 21:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIegW-0007my-Fj; Sat, 06 Mar 2021 21:42:04 +0000
Received: by outflank-mailman (input) for mailman id 94384;
 Sat, 06 Mar 2021 21:42:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lIegV-0007mt-0y
 for xen-devel@lists.xenproject.org; Sat, 06 Mar 2021 21:42:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIegT-0001PC-Hl; Sat, 06 Mar 2021 21:42:01 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIegT-00066t-11; Sat, 06 Mar 2021 21:42:01 +0000
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
	bh=VU75K8jemcqWW+CW4IZ/uc+bhcZ1ef0hQsKo4FgR/38=; b=HyLA+aZFi+QgIcIUfhDI7p1/M1
	01Qpw5jwR3QF7RNAZCLjtOL/M5z/cSq/d31TBtIRKW+fSeN4PYBLfb8b0qnkM16nKuu4TU178BMWr
	0Dlc9vBfsNDPwWoSnVA1Qj8q0zH0NGqM7TnLtCc05FyigOY1jACxb3wRRCgtkJG6+mCk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.15] xen: Bump the minimum version of GCC supported to 4.9 (5.1 on arm64)
Date: Sat,  6 Mar 2021 21:41:48 +0000
Message-Id: <20210306214148.27021-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Compilers older than 4.8 have known codegen issues which can lead to
silent miscompilation:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145

Furthermore, pre-4.9 GCC have known bugs (including things like
internal compiler errors on Arm) which would require workaround (I
haven't checked if we have any in Xen).

The minimum version of GCC to build the hypervisor is now raised to 4.9.

In addition to that, on arm64, GCC version >= 4.9 and < 5.1 have been
shown to emit memory references beyond the stack pointer, resulting in
memory corruption if an interrupt is taken after the stack pointer has
been adjusted but before the reference has been executed.

Therefore, the minimum for arm64 is raised to 5.1.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

I don't have a strong opinion on the minimum version for GCC on x86.
So this is following Andrew's suggestion and the minimum from Linux.

This patch is candidate to 4.15 and backport.

This is only a build change and will be low-risk for anyone using newer
compiler (5.1+ for arm64 and 4.9 for everyone else). Xen will stop
building for anyone using older compiler. But it is better than fighting
with codegen issues.
---
 README                     |  9 ++++++---
 xen/include/xen/compiler.h | 13 +++++++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/README b/README
index 8c99c30986c1..5c32c03f2ea1 100644
--- a/README
+++ b/README
@@ -38,12 +38,15 @@ provided by your OS distributor:
     * GNU Make v3.80 or later
     * C compiler and linker:
       - For x86:
-        - GCC 4.1.2_20070115 or later
+        - GCC 4.9 or later
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
index 0ec0b4698ea7..46779660cc8f 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -5,6 +5,19 @@
 #error Sorry, your compiler is too old/not recognized.
 #endif
 
+#if CONFIG_CC_IS_GCC
+# if CONFIG_GCC_VERSION < 40900
+/* https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145 */
+#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
+# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
+/*
+ * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
+ * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
+ */
+#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
+# endif
+#endif
+
 #define barrier()     __asm__ __volatile__("": : :"memory")
 
 #define likely(x)     __builtin_expect(!!(x),1)
-- 
2.17.1


