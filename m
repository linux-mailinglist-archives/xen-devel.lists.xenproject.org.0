Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C233516BD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 18:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104674.200496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS0RG-0003G7-QT; Thu, 01 Apr 2021 16:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104674.200496; Thu, 01 Apr 2021 16:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS0RG-0003Fg-N0; Thu, 01 Apr 2021 16:44:58 +0000
Received: by outflank-mailman (input) for mailman id 104674;
 Thu, 01 Apr 2021 16:44:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lS0RF-0003FE-N5
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 16:44:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lS0RF-00026n-Br; Thu, 01 Apr 2021 16:44:57 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lS0RF-0003Vh-2c; Thu, 01 Apr 2021 16:44:57 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=4YIJNP3sWTEa4vKgS74NPmWXjoR7OyE6WG88MKH7VTw=; b=guT/9ZpPHn6MZTCpv+qMsJpHb
	xMtlyzFUHnsvz7WGxXHsFoIUtMw0Iz9Q5VRQjmNEo8aTq5qTK67iue4Xm2V0fg1BFvM1BojDTnQSc
	n9DCGx96NfxHisxpm9EvL10/UtlVFCzifxQNFPsvqaE5NYnBGyeDWwDxgo2nfgXchqgso=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 1/2] xen/arm: Include asm/asm-offsets.h and asm/macros.h on every assembly files
Date: Thu,  1 Apr 2021 17:44:43 +0100
Message-Id: <20210401164444.20377-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210401164444.20377-1-julien@xen.org>
References: <20210401164444.20377-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

In a follow-up patch we may want to automatically replace some
mnemonics (such as ret) with a different sequence.

To ensure all the assembly files will include asm/macros.h it is best to
automatically include it on single assembly. This can be done via
config.h.

It was necessary to include a few more headers as dependency:
  - <asm/asm_defns.h> to define sizeof_*
  - <xen/page-size.h> which is already a latent issue given STACK_ORDER
  rely on PAGE_SIZE.

Unfortunately the build system will use -D__ASSEMBLY__ when generating
the linker script. A new option -D__LINKER__ is introduceed and used for
the linker script to avoid including headers (such as asm/macros.h) that
may not be compatible with the syntax.

Lastly, take the opportunity to remove both asm/asm-offsets.h and
asm/macros.h from the various assembly files as they are now
automagically included.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

---
    Changes in v3:
        - Include <asm/asm_defns.h> rather than <asm/asm-offsets.h>
        - Add Bertrand's reviewed-by tag

    Changes in v2:
        - Patch added
---
 xen/arch/arm/Makefile                | 2 +-
 xen/arch/arm/arm32/entry.S           | 1 -
 xen/arch/arm/arm32/head.S            | 1 -
 xen/arch/arm/arm32/proc-v7.S         | 1 -
 xen/arch/arm/arm64/debug-cadence.inc | 1 -
 xen/arch/arm/arm64/debug-pl011.inc   | 2 --
 xen/arch/arm/arm64/entry.S           | 2 --
 xen/arch/arm/arm64/head.S            | 2 --
 xen/arch/arm/arm64/smc.S             | 3 ---
 xen/include/asm-arm/config.h         | 6 ++++++
 10 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 46e6a95fec98..ca75f1040dcc 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -134,7 +134,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
 	$(CC) $(filter-out -flto,$(c_flags)) -S -o $@ $<
 
 xen.lds: xen.lds.S
-	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
+	$(CPP) -P $(a_flags) -D__LINKER__ -MQ $@ -o $@ $<
 
 dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 
diff --git a/xen/arch/arm/arm32/entry.S b/xen/arch/arm/arm32/entry.S
index b228d44b190c..f2f1bc7a3158 100644
--- a/xen/arch/arm/arm32/entry.S
+++ b/xen/arch/arm/arm32/entry.S
@@ -1,4 +1,3 @@
-#include <asm/asm_defns.h>
 #include <asm/sysregs.h>
 #include <asm/regs.h>
 #include <asm/alternative.h>
diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 50f019ed98ea..7178865f48c3 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -18,7 +18,6 @@
  */
 
 #include <asm/page.h>
-#include <asm/asm_defns.h>
 #include <asm/early_printk.h>
 
 #define ZIMAGE_MAGIC_NUMBER 0x016f2818
diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
index 46bfc7a9074c..1efde2d72da0 100644
--- a/xen/arch/arm/arm32/proc-v7.S
+++ b/xen/arch/arm/arm32/proc-v7.S
@@ -17,7 +17,6 @@
  * GNU General Public License for more details.
  */
 
-#include <asm/asm_defns.h>
 #include <asm/arm32/processor.h>
 #include <asm/sysregs.h>
 
diff --git a/xen/arch/arm/arm64/debug-cadence.inc b/xen/arch/arm/arm64/debug-cadence.inc
index 7df0abe4756f..0b6f2e094e18 100644
--- a/xen/arch/arm/arm64/debug-cadence.inc
+++ b/xen/arch/arm/arm64/debug-cadence.inc
@@ -17,7 +17,6 @@
  * GNU General Public License for more details.
  */
 
-#include <asm/asm_defns.h>
 #include <asm/cadence-uart.h>
 
 /*
diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
index 385deff49b1b..1928a2e3ffbb 100644
--- a/xen/arch/arm/arm64/debug-pl011.inc
+++ b/xen/arch/arm/arm64/debug-pl011.inc
@@ -16,8 +16,6 @@
  * GNU General Public License for more details.
  */
 
-#include <asm/asm_defns.h>
-
 /*
  * PL011 UART initialization
  * xb: register which containts the UART base address
diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index 175ea2981e72..ab9a65fc1475 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -1,6 +1,4 @@
-#include <asm/asm_defns.h>
 #include <asm/current.h>
-#include <asm/macros.h>
 #include <asm/regs.h>
 #include <asm/alternative.h>
 #include <asm/smccc.h>
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index f38a8dfca7dc..aa1f88c76498 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -21,11 +21,9 @@
  */
 
 #include <asm/page.h>
-#include <asm/asm_defns.h>
 #include <asm/early_printk.h>
 #include <efi/efierr.h>
 #include <asm/arm64/efibind.h>
-#include <asm/arm64/macros.h>
 
 #define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
 #define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
index b0752be57e8f..91bae62dd4d2 100644
--- a/xen/arch/arm/arm64/smc.S
+++ b/xen/arch/arm/arm64/smc.S
@@ -13,9 +13,6 @@
  * GNU General Public License for more details.
  */
 
-#include <asm/asm_defns.h>
-#include <asm/macros.h>
-
 /*
  * void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
  *                          register_t a3, register_t a4, register_t a5,
diff --git a/xen/include/asm-arm/config.h b/xen/include/asm-arm/config.h
index 5c10c755db46..c7b77912013e 100644
--- a/xen/include/asm-arm/config.h
+++ b/xen/include/asm-arm/config.h
@@ -69,6 +69,7 @@
 #endif
 
 #include <xen/const.h>
+#include <xen/page-size.h>
 
 /*
  * Common ARM32 and ARM64 layout:
@@ -190,6 +191,11 @@ extern unsigned long frametable_virt_end;
 #define watchdog_disable() ((void)0)
 #define watchdog_enable()  ((void)0)
 
+#if defined(__ASSEMBLY__) && !defined(__LINKER__)
+#include <asm/asm_defns.h>
+#include <asm/macros.h>
+#endif
+
 #endif /* __ARM_CONFIG_H__ */
 /*
  * Local variables:
-- 
2.17.1


