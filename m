Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD77E665A95
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 12:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475231.736834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFZWm-0000tF-CR; Wed, 11 Jan 2023 11:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475231.736834; Wed, 11 Jan 2023 11:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFZWm-0000qf-9l; Wed, 11 Jan 2023 11:44:20 +0000
Received: by outflank-mailman (input) for mailman id 475231;
 Wed, 11 Jan 2023 11:44:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pFZWk-0000qZ-MG
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 11:44:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFZWj-0005Uq-UA; Wed, 11 Jan 2023 11:44:17 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFZWj-0004U7-LW; Wed, 11 Jan 2023 11:44:17 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=IqfAabigwW7CFHzU0bZ0FY9KOz/BysPhEjw0xmgSgig=; b=Gy3Snw
	FPKTAkG1qUEP9B/Bco0jMaZx0BKx8PW1ffs1HugeclmkrTKpKNVlnrKChowYRzR8eXFv63DX5ljo1
	OBnOt9MsCW4mGAC1hU0Go3L28u6iv2S9k1EWjK/HuzVG/Fo1cUz7HGUK89Yp2o2TIj5XPYtUFQt8T
	RzG+oNgFc6Y=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] xen: Remove the arch specific header init.h
Date: Wed, 11 Jan 2023 11:44:09 +0000
Message-Id: <20230111114409.7495-1-julien@xen.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Both x86 and (soon) RISC-V version of init.h are empty. On Arm, it contains
a structure that should not be used by any common code.

The structure init_info is used to store information to setup the CPU
currently being brought-up. setup.h seems to be more suitable even though
the header is getting quite crowded.

Looking through the history, <asm/init.h> was introduced at the same
time as the ia64 port because for some reasons most of the macros
where duplicated. This was changed in 72c07f413879 and I don't
foresee any reason to require arch specific definition for init.h
in the near future.

Therefore remove asm/init.h for both x86 and arm (the only definition
is moved in setup.h). With that RISC-V will not need to introduce
an empty header.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/arm32/asm-offsets.c |  1 +
 xen/arch/arm/arm64/asm-offsets.c |  1 +
 xen/arch/arm/include/asm/init.h  | 20 --------------------
 xen/arch/arm/include/asm/setup.h |  8 ++++++++
 xen/arch/x86/acpi/power.c        |  1 -
 xen/arch/x86/include/asm/init.h  |  4 ----
 xen/include/xen/init.h           |  2 --
 7 files changed, 10 insertions(+), 27 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/init.h
 delete mode 100644 xen/arch/x86/include/asm/init.h

diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
index 2116ba5b95bf..05c692bb2822 100644
--- a/xen/arch/arm/arm32/asm-offsets.c
+++ b/xen/arch/arm/arm32/asm-offsets.c
@@ -11,6 +11,7 @@
 #include <public/xen.h>
 #include <asm/current.h>
 #include <asm/procinfo.h>
+#include <asm/setup.h>
 
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
index 280ddb55bfd4..7226cd9b2eb0 100644
--- a/xen/arch/arm/arm64/asm-offsets.c
+++ b/xen/arch/arm/arm64/asm-offsets.c
@@ -10,6 +10,7 @@
 #include <xen/bitops.h>
 #include <public/xen.h>
 #include <asm/current.h>
+#include <asm/setup.h>
 #include <asm/smccc.h>
 
 #define DEFINE(_sym, _val)                                                 \
diff --git a/xen/arch/arm/include/asm/init.h b/xen/arch/arm/include/asm/init.h
deleted file mode 100644
index 5ac8cf8797d6..000000000000
--- a/xen/arch/arm/include/asm/init.h
+++ /dev/null
@@ -1,20 +0,0 @@
-#ifndef _XEN_ASM_INIT_H
-#define _XEN_ASM_INIT_H
-
-struct init_info
-{
-    /* Pointer to the stack, used by head.S when entering in C */
-    unsigned char *stack;
-    /* Logical CPU ID, used by start_secondary */
-    unsigned int cpuid;
-};
-
-#endif /* _XEN_ASM_INIT_H */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index fdbf68aadcaa..a926f30a2be4 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -168,6 +168,14 @@ int map_range_to_domain(const struct dt_device_node *dev,
 
 extern const char __ro_after_init_start[], __ro_after_init_end[];
 
+struct init_info
+{
+    /* Pointer to the stack, used by head.S when entering in C */
+    unsigned char *stack;
+    /* Logical CPU ID, used by start_secondary */
+    unsigned int cpuid;
+};
+
 #endif
 /*
  * Local variables:
diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index b76f673acb1a..d23335391c67 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -17,7 +17,6 @@
 #include <xen/sched.h>
 #include <asm/acpi.h>
 #include <asm/irq.h>
-#include <asm/init.h>
 #include <xen/spinlock.h>
 #include <xen/sched.h>
 #include <xen/domain.h>
diff --git a/xen/arch/x86/include/asm/init.h b/xen/arch/x86/include/asm/init.h
deleted file mode 100644
index 5295b35e6337..000000000000
--- a/xen/arch/x86/include/asm/init.h
+++ /dev/null
@@ -1,4 +0,0 @@
-#ifndef _XEN_ASM_INIT_H
-#define _XEN_ASM_INIT_H
-
-#endif /* _XEN_ASM_INIT_H */
diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index 0af0e234ec80..1d7c0216bc80 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -1,8 +1,6 @@
 #ifndef _LINUX_INIT_H
 #define _LINUX_INIT_H
 
-#include <asm/init.h>
-
 /*
  * Mark functions and data as being only used at initialization
  * or exit time.
-- 
2.38.1


