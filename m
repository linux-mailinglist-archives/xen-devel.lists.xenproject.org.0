Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F221E4E05
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:19:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1a7-0003zk-Dr; Wed, 27 May 2020 19:19:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1a5-0003za-UD
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:19:13 +0000
X-Inumbo-ID: f25930ee-a04e-11ea-81bc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f25930ee-a04e-11ea-81bc-bc764e2007e4;
 Wed, 27 May 2020 19:19:12 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: mbKeQ7QpZv3IAsquSsZ+NyeeuXXDsp5Ov4NaEfAcMJJ0LNNrOgQw0Ti7QwRh7vNC2an6Gox6Hs
 eZCEKK9hD4wSVxN90TtlQHL7WVq9ol/YPFFm6tWBpni7cPHg/oUYxNKCPBKRGjUCh2Ly6s3kvd
 JkNKKmQy5NMUDurQa7eM8aLs9WzGh9bZpl2MGsu0TCHcHBgh0ZFO9TZbxqmbVvDvPmMO3IqMK3
 TmThn2U46kTojFfzBjApdDj6z4gcqzab3mVmIyHk0Nr5PHI8VhwC6cUGNhMq9Yk3lWBhiiMqqq
 RkQ=
X-SBRS: 2.7
X-MesageID: 18850555
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="18850555"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 08/14] x86/cpu: Adjust reset_stack_and_jump() to be shadow
 stack compatible
Date: Wed, 27 May 2020 20:18:41 +0100
Message-ID: <20200527191847.17207-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200527191847.17207-1-andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We need to unwind up to the supervisor token.  See the comment for details.

The use of UNLIKELY_END_SECTION in this case highlights that it isn't safe
when it isn't the final statement of an asm().  Adjust all declarations with a
newline.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Drop 'cmc' which was stray debugging.
 * Replace raw numbers with defines.
 * Use a real BUG frame in .fixup, to get static branch preduction working the
   right way around.
---
 xen/include/asm-x86/asm_defns.h |  8 +++----
 xen/include/asm-x86/current.h   | 48 ++++++++++++++++++++++++++++++++++++++---
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/xen/include/asm-x86/asm_defns.h b/xen/include/asm-x86/asm_defns.h
index b42a19b654..035708adac 100644
--- a/xen/include/asm-x86/asm_defns.h
+++ b/xen/include/asm-x86/asm_defns.h
@@ -177,13 +177,13 @@ register unsigned long current_stack_pointer asm("rsp");
 
 #ifdef __clang__ /* clang's builtin assember can't do .subsection */
 
-#define UNLIKELY_START_SECTION ".pushsection .text.unlikely,\"ax\""
-#define UNLIKELY_END_SECTION   ".popsection"
+#define UNLIKELY_START_SECTION ".pushsection .text.unlikely,\"ax\"\n\t"
+#define UNLIKELY_END_SECTION   ".popsection\n\t"
 
 #else
 
-#define UNLIKELY_START_SECTION ".subsection 1"
-#define UNLIKELY_END_SECTION   ".subsection 0"
+#define UNLIKELY_START_SECTION ".subsection 1\n\t"
+#define UNLIKELY_END_SECTION   ".subsection 0\n\t"
 
 #endif
 
diff --git a/xen/include/asm-x86/current.h b/xen/include/asm-x86/current.h
index 99b66a0087..086326b81a 100644
--- a/xen/include/asm-x86/current.h
+++ b/xen/include/asm-x86/current.h
@@ -124,13 +124,55 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
 # define CHECK_FOR_LIVEPATCH_WORK ""
 #endif
 
+#ifdef CONFIG_XEN_SHSTK
+/*
+ * We need to unwind the primary shadow stack to its supervisor token, located
+ * at 0x5ff8 from the base of the stack blocks.
+ *
+ * Read the shadow stack pointer, subtract it from 0x5ff8, divide by 8 to get
+ * the number of slots needing popping.
+ *
+ * INCSSPQ can't pop more than 255 entries.  We shouldn't ever need to pop
+ * that many entries, and getting this wrong will cause us to #DF later.  Turn
+ * it into a BUG() now for fractionally easier debugging.
+ */
+# define SHADOW_STACK_WORK                                      \
+    "mov $1, %[ssp];"                                           \
+    "rdsspd %[ssp];"                                            \
+    "cmp $1, %[ssp];"                                           \
+    "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
+    "mov $%c[skstk_base], %[val];"                              \
+    "and $%c[stack_mask], %[ssp];"                              \
+    "sub %[ssp], %[val];"                                       \
+    "shr $3, %[val];"                                           \
+    "cmp $255, %[val];" /* More than 255 entries?  Crash. */    \
+    UNLIKELY_START(a, shstk_adjust)                             \
+    _ASM_BUGFRAME_TEXT(0)                                       \
+    UNLIKELY_END_SECTION                                        \
+    "incsspq %q[val];"                                          \
+    ".L_shstk_done.%=:"
+#else
+# define SHADOW_STACK_WORK ""
+#endif
+
 #define switch_stack_and_jump(fn, instr)                                \
     ({                                                                  \
+        unsigned int tmp;                                               \
         __asm__ __volatile__ (                                          \
-            "mov %0,%%"__OP"sp;"                                        \
+            SHADOW_STACK_WORK                                           \
+            "mov %[stk], %%rsp;"                                        \
             instr                                                       \
-             "jmp %c1"                                                  \
-            : : "r" (guest_cpu_user_regs()), "i" (fn) : "memory" );     \
+            "jmp %c[fun];"                                              \
+            : [val] "=&r" (tmp),                                        \
+              [ssp] "=&r" (tmp)                                         \
+            : [stk] "r" (guest_cpu_user_regs()),                        \
+              [fun] "i" (fn),                                           \
+              [skstk_base] "i"                                          \
+              ((PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8),               \
+              [stack_mask] "i" (STACK_SIZE - 1),                        \
+              _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__,                \
+                                 __FILE__, NULL)                        \
+            : "memory" );                                               \
         unreachable();                                                  \
     })
 
-- 
2.11.0


