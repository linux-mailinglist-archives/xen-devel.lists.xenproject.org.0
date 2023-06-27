Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A233273F633
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 09:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555900.868091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3Z0-0008Vf-WA; Tue, 27 Jun 2023 07:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555900.868091; Tue, 27 Jun 2023 07:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3Z0-0008TP-SZ; Tue, 27 Jun 2023 07:56:38 +0000
Received: by outflank-mailman (input) for mailman id 555900;
 Tue, 27 Jun 2023 07:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4+f=CP=citrix.com=prvs=535d699d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qE3Yz-0008EH-3z
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 07:56:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2149129d-14c0-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 09:56:34 +0200 (CEST)
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
X-Inumbo-ID: 2149129d-14c0-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687852594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rEzOoITBgpwDiJCCnFkjnD9qLBpCoNJN36r0v427lIA=;
  b=fTjuJmOv38lw2906L0YVrn6/PdXBh6z/rWCbpVl1x86dMVdv5BVaflu3
   NGYtDBGONqHBiu5SHsblhQzOTog43oLqVBTrKLyJW5Za+1XeedWsMBk7a
   0O/+KR5FoanQhfhRGA1di3o/XyRjkrbJZFGXvCvFzP9ib6ilZPwvBTJNl
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116835822
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:YpLqrqjc6qMw0z17sc7c9YAuX161YBcKZh0ujC45NGQN5FlHY01je
 htvWWqHbPneYDHwet52PYm2oUkG78LdnNMxTgU5qX9hQyob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4gWBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQUMRMEbDuNpNi3xbKWGuhHnN8NFNvSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 zyWpDmpWEty2Nq3+Dq3tUyllLLztyq4Qp4gNpizzvI7uQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+LqRuiNC5TKnUNDQcGUA8E7t/LsIw1yBXVQb5LLqmxidHkHCDq9
 BqDpiM+mrY7gNYC0uOw+lWvqzihvITTRwg5oADeRHu47xhRbZSgIYev7DDz5PJBN5qQT0PHs
 mINncOf98gRAZrLnyuIKM0HG7uj9vueMDnRhFdpN5Yk/jWpvXWkeOh46zZ4IkBrPs8aeCTBb
 0rauAcX75hWVFOtaaJ0eIOwTcc316/rFdfifv/RZ9tKJJN2cWev5yhobFWM1nvsl2A2mLkjP
 o2Wd8mtC3sXE6Vhw3y9QOJ1+aMzyykk3mTVbYry1wigy7eYa3+TRLofMV2BKOs+6cu5TB79q
 ogFcZHQklMGDbO4O3OMmWIOEbwUBXQiJpn0gMJ0TO+GIic2GUo7ENHp04p0LuSJgJ9pevf0E
 mCVAxEIlwqi3C2dd21meVg4NuqxAM8XQWYTeHV1YA32gyVLjZOHtv93SnchQVUwGAWPJ9ZQR
 uJNRciPC+8npt/vq2VENsmVQGCPmX2WaeOy08mNOmJXk2ZIHVChxzMdVlKHGNMyJiS2r9Aih
 LaryxnWR5EOLyw7UpaJOKrzkwrg4iBD8A6XY6cvCoMJEHgADaAwc3Ch5hPJC59kxer/Ksuyi
 F/NXEZwSRjlqI4p6tjZ7Z1oXK/we9aS6nFyRjGBhZ7vbHmyw4ZW6dMYOAp+VWyHBTycFWTLT
 bk98swQx9VdwwoR4tsnSuY2pU/8jvO2z4JnIs1fNC2jRzyW5nlIeBFqAeEnWnVx+4Jk
IronPort-HdrOrdr: A9a23:GoMyK6vWN7l6iQQ81LNKJ8rN7skDYdV00zEX/kB9WHVpm6uj9/
 xG/c576faQsl16ZJhOo6HjBED+ewK4yXcY2+Qs1NSZMjUO2lHYT72KhLGKqwEIcBeQygcy78
 tdmqFFebnNMWQ=
X-Talos-CUID: 9a23:bInOcWC/HH6s1u36EyV+10cWMc4GSHzYzFqAImSiEkhRWoTAHA==
X-Talos-MUID: 9a23:alGz8grotK85Rv15lTcezwBiBoBW6rbzNGoE0o8aieuhPhR8ag7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,161,1684814400"; 
   d="scan'208";a="116835822"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Timothy Pearson
	<tpearson@raptorengineering.com>
Subject: [PATCH v2 2/3] treewide: Avoid including asm/types.h
Date: Tue, 27 Jun 2023 08:56:17 +0100
Message-ID: <20230627075618.1180248-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
References: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We're about to rearrange the common and arch types.h split.  While most
users already include <xen/types.h>, a few do not and some files fail to
compile as a result.

Almost all logic is going to have types very early in the include chain.  Drop
the include entirely from C files, and swap to the common types.h in headers.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Connor Davis <connojdavis@gmail.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Timothy Pearson <tpearson@raptorengineering.com>
---

v2: New

 xen/arch/arm/arm64/lib/find_next_bit.c      | 2 +-
 xen/arch/x86/cpu/mcheck/mce.h               | 1 -
 xen/arch/x86/cpu/vpmu.c                     | 1 -
 xen/arch/x86/cpu/vpmu_intel.c               | 1 -
 xen/arch/x86/hvm/hvm.c                      | 1 -
 xen/arch/x86/hvm/vmx/vvmx.c                 | 1 -
 xen/arch/x86/include/asm/byteorder.h        | 2 +-
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h | 2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h      | 3 ++-
 xen/arch/x86/include/asm/io_apic.h          | 3 ++-
 xen/arch/x86/include/asm/page.h             | 2 +-
 xen/arch/x86/include/asm/processor.h        | 1 -
 xen/arch/x86/include/asm/x86_64/page.h      | 2 +-
 xen/arch/x86/mm/p2m-ept.c                   | 1 -
 xen/common/trace.c                          | 1 -
 xen/drivers/char/arm-uart.c                 | 2 +-
 xen/include/xen/bitops.h                    | 2 +-
 xen/include/xen/spinlock.h                  | 3 ++-
 18 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/arm64/lib/find_next_bit.c b/xen/arch/arm/arm64/lib/find_next_bit.c
index 8ebf8bfe973c..ca6f82277e77 100644
--- a/xen/arch/arm/arm64/lib/find_next_bit.c
+++ b/xen/arch/arm/arm64/lib/find_next_bit.c
@@ -9,7 +9,7 @@
  * 2 of the License, or (at your option) any later version.
  */
 #include <xen/bitops.h>
-#include <asm/types.h>
+
 #include <asm/byteorder.h>
 
 #ifndef find_next_bit
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index bea08bdc7464..dd5d258362e6 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -7,7 +7,6 @@
 #include <xen/sched.h>
 #include <xen/smp.h>
 
-#include <asm/types.h>
 #include <asm/traps.h>
 #include <asm/atomic.h>
 
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index f31c32bcf3a6..a022126f18fd 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -14,7 +14,6 @@
 #include <xen/hypercall.h>
 #include <xen/sched.h>
 #include <asm/regs.h>
-#include <asm/types.h>
 #include <asm/msr.h>
 #include <asm/nmi.h>
 #include <asm/p2m.h>
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 35e350578b84..ab122b22f3ac 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -12,7 +12,6 @@
 #include <xen/xenoprof.h>
 #include <asm/system.h>
 #include <asm/regs.h>
-#include <asm/types.h>
 #include <asm/apic.h>
 #include <asm/traps.h>
 #include <asm/msr.h>
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index a67ef79dc003..57363c2ae124 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -38,7 +38,6 @@
 #include <asm/regs.h>
 #include <asm/cpufeature.h>
 #include <asm/processor.h>
-#include <asm/types.h>
 #include <asm/msr.h>
 #include <asm/i387.h>
 #include <asm/xstate.h>
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 1034534c977b..16b0ef82b6c8 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -10,7 +10,6 @@
 
 #include <xen/ioreq.h>
 
-#include <asm/types.h>
 #include <asm/mtrr.h>
 #include <asm/p2m.h>
 #include <asm/hvm/support.h>
diff --git a/xen/arch/x86/include/asm/byteorder.h b/xen/arch/x86/include/asm/byteorder.h
index 1f77e502a528..e935f7b2b03b 100644
--- a/xen/arch/x86/include/asm/byteorder.h
+++ b/xen/arch/x86/include/asm/byteorder.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_X86_BYTEORDER_H__
 #define __ASM_X86_BYTEORDER_H__
 
-#include <asm/types.h>
+#include <xen/types.h>
 #include <xen/compiler.h>
 
 static inline __attribute_const__ __u32 ___arch__swab32(__u32 x)
diff --git a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
index f1cde676dca1..2fb76ec24c76 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
@@ -8,7 +8,7 @@
 #ifndef __ASM_X86_HVM_SVM_SVMDEBUG_H__
 #define __ASM_X86_HVM_SVM_SVMDEBUG_H__
 
-#include <asm/types.h>
+#include <xen/types.h>
 #include <asm/hvm/svm/vmcb.h>
 
 void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state);
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 36c108d8797d..c84acc221daa 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -8,7 +8,8 @@
 #define __ASM_X86_HVM_VMX_VMX_H__
 
 #include <xen/sched.h>
-#include <asm/types.h>
+#include <xen/types.h>
+
 #include <asm/regs.h>
 #include <asm/asm_defns.h>
 #include <asm/processor.h>
diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index ef0878b09e24..bd8cb95f46b1 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -1,7 +1,8 @@
 #ifndef __ASM_IO_APIC_H
 #define __ASM_IO_APIC_H
 
-#include <asm/types.h>
+#include <xen/types.h>
+
 #include <asm/mpspec.h>
 #include <asm/apicdef.h>
 #include <asm/fixmap.h>
diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index b585235d064a..3647bb1260c2 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -9,7 +9,7 @@
 #define PAGE_ORDER_1G       18
 
 #ifndef __ASSEMBLY__
-# include <asm/types.h>
+# include <xen/types.h>
 # include <xen/lib.h>
 #endif
 
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index f983ff501d95..3b3cf51814f8 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -9,7 +9,6 @@
 #include <xen/types.h>
 #include <xen/smp.h>
 #include <xen/percpu.h>
-#include <asm/types.h>
 #include <asm/cpufeature.h>
 #include <asm/desc.h>
 #endif
diff --git a/xen/arch/x86/include/asm/x86_64/page.h b/xen/arch/x86/include/asm/x86_64/page.h
index 26bdb4b19bb9..53faa7875baf 100644
--- a/xen/arch/x86/include/asm/x86_64/page.h
+++ b/xen/arch/x86/include/asm/x86_64/page.h
@@ -19,7 +19,7 @@ static inline unsigned long canonicalise_addr(unsigned long addr)
         return addr & ~CANONICAL_MASK;
 }
 
-#include <asm/types.h>
+#include <xen/types.h>
 
 #include <xen/pdx.h>
 
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index ffd34a1cc65f..85c4e8e54f66 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -11,7 +11,6 @@
 #include <asm/current.h>
 #include <asm/iocap.h>
 #include <asm/paging.h>
-#include <asm/types.h>
 #include <asm/domain.h>
 #include <asm/p2m.h>
 #include <asm/hvm/vmx/vmx.h>
diff --git a/xen/common/trace.c b/xen/common/trace.c
index df4a719e4b43..17d62f70561f 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -16,7 +16,6 @@
  * it's possible to reconstruct a chronological record of trace events.
  */
 
-#include <asm/types.h>
 #include <asm/io.h>
 #include <xen/lib.h>
 #include <xen/param.h>
diff --git a/xen/drivers/char/arm-uart.c b/xen/drivers/char/arm-uart.c
index eeb9ceefc06a..8098a968c285 100644
--- a/xen/drivers/char/arm-uart.c
+++ b/xen/drivers/char/arm-uart.c
@@ -18,7 +18,7 @@
  */
 
 #include <asm/device.h>
-#include <asm/types.h>
+
 #include <xen/console.h>
 #include <xen/device_tree.h>
 #include <xen/param.h>
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 33619a0873fe..4cd0310789b5 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -1,6 +1,6 @@
 #ifndef _LINUX_BITOPS_H
 #define _LINUX_BITOPS_H
-#include <asm/types.h>
+#include <xen/types.h>
 
 /*
  * Create a contiguous bitmask starting at bit position @l and ending at
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index ca40c71c88f9..0a02a527dc59 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -2,9 +2,10 @@
 #define __SPINLOCK_H__
 
 #include <xen/time.h>
+#include <xen/types.h>
+
 #include <asm/system.h>
 #include <asm/spinlock.h>
-#include <asm/types.h>
 
 #define SPINLOCK_CPU_BITS  12
 
-- 
2.30.2


