Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8FA411EF4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:35:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191092.341010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSNBg-0002Rh-Ek; Mon, 20 Sep 2021 17:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191092.341010; Mon, 20 Sep 2021 17:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSNBg-0002P5-Aq; Mon, 20 Sep 2021 17:34:40 +0000
Received: by outflank-mailman (input) for mailman id 191092;
 Mon, 20 Sep 2021 17:34:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSNBe-0002Oz-Sr
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:34:38 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3aa76012-671c-46b2-b7a2-2af9ef69522c;
 Mon, 20 Sep 2021 17:34:36 +0000 (UTC)
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
X-Inumbo-ID: 3aa76012-671c-46b2-b7a2-2af9ef69522c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632159276;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bEpl8O1bP+VDWCJVrreYPoTbBZNOjPBNBltwePd93CU=;
  b=KF5GMFAE6TRaE/3VSJfM+NcTNBHSQ94Xl6twuYgkrqIxIhECxhURbpHQ
   otn6N/He5dOJZ4qPy0Fz4Mo0767et1gbX/6KdQUMfspkt7fnPS5mrRRDW
   9pSHuKmcAujEgFttZvpi1ms13ggBlKywOskFaQ32zdYh0omwIvOvXpn80
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jgyIU6088m3DDnn0RqsxcHn+/fcrkyd6geGy4fk9c2sF5hI+Xad3Tn7YU41JSyyJaW5ck7Gd+g
 w5TGS1/+aZZ0ZzEuft50O1FXgLn4AQt0+7Cl5dyyPakWc+5749KEIgg462kis+2bqP0PsPDpvi
 z32BucEwxDuVqS8msx2P/9A5/weFq770xh52KUNknDB44QyjQ1xW0dP68RQU2mBQaOV099mRax
 STU++DjoGaMe6l0VqO+gvsgMlf+XfKut3VaZBrJ2/ic40tEwhZSitfoMXWMGP9S0OiAh3z+rd0
 EJZSVcw4pA3wMh9pkHZNNpVO
X-SBRS: 5.1
X-MesageID: 53136338
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LIKyZ6r0JKXuBZcPfpBy+qXNNPBeBmIAYhIvgKrLsJaIsI4StFCzt
 garIBnUOa2INGWkctF1boXno00EucXWm982SQM5pCkxHypB8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncw0ILhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnb+gVlk7YI2WpMU2VQIfIShSG71MyIaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 pFAMmQ0N0SojxtnIFYUBs0TgemSoXS8KTJRiG3IofcV7D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajk4HtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUZ+B7T2PT0uTq4LW4fCQxIRPo2vv8PEGlCO
 kCyoz/5OdB+mOTLEivNrebF9Wna1Ts9djBZNHRdJecRy5y6+thi0EiXJjp2OPPt1rXI9SfML
 ydmRcTUr44ai9ICn46/9ErO695HjsmUFlNpjuk7s2TM0++YWGJHT9fzgbQ4xawZRGp8crVml
 CJf8/VyFMhUUfmweNWlGY3h5o1FAspp1xWH2zZS82QJrWzxqxZPg6gJuGwWyLhV3jYsJmayP
 R67VfJ5z55PJnq6BZKbkKroUJ9C8EQULvy8Dqq8RoMXOvBZLVbblAkzNR/49z28yyAEzPBgU
 ap3hO7xVB72/4w8l2HoLwrcuJd2rh0DKZT7H8Gjk0v/jurAOxZ4i94taTOzUwzw14vcyC29z
 jqVH5LiJ8x3XLKsby/J35QUKFxWf3E3CYqv855cd/KZIxogE2YkUqeDzbQkco1jvqJUiuaXo
 S3tBh4GkALy1S/dNAGHSnF/c7ezD5xxmm02YH43NlGy1nl9PYv2tPUDd4E6dKUM/fB4yaImV
 OEMfsiNW6wdSjnO9zkHQ4P6qYhuKEaiiQ6UZnL3azkjZZ9wAQfO/4a8LAfo8SAPCAuxtNc//
 OL8hl+KH8JbSl07XsjMaf+pw1eghlQnmbp/DxnSP91eWETw64w2eSb/ueA6fpMXIhLZyzrEi
 wvPWUUEpfPAqpMe+cXSgfzWtJ+gFuZzExYIH2Tf6rrqZyDW8nD6nN1FWeeMOzvcSHn16OOpY
 uAMl6PwN/gOnVBrtYtgEuk0kfJitoW3/7IKnB55GHjrbkiwDuIyK3aL6sBDq6lRy+ILogCxQ
 E+OpoFXNLjh1BkJy7LNyN7Jtti+6Mw=
IronPort-HdrOrdr: A9a23:9esM3KBYDB6bG3XlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="53136338"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 10/12] x86/pv: Move x86/trace.c to x86/pv/trace.c
Date: Mon, 20 Sep 2021 18:25:27 +0100
Message-ID: <20210920172529.24932-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This entire file is pv-only, and not excluded from the build by
CONFIG_TRACEBUFFER.  Move it into the pv/ directory, build it conditionally,
and drop unused includes.

Also move the contents of asm/trace.h to asm/pv/trace.h to avoid the functions
being declared across the entire hypervisor.

One caller in fixup_page_fault() is effectively PV only, but is not subject to
dead code elimination.  Add an additional IS_ENABLED(CONFIG_PV) to keep the
build happy.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 xen/arch/x86/Makefile                |  1 -
 xen/arch/x86/pv/Makefile             |  1 +
 xen/arch/x86/pv/emul-inv-op.c        |  2 +-
 xen/arch/x86/pv/emul-priv-op.c       |  1 +
 xen/arch/x86/pv/ro-page-fault.c      |  2 +-
 xen/arch/x86/{ => pv}/trace.c        | 13 +++++------
 xen/arch/x86/pv/traps.c              |  2 +-
 xen/arch/x86/traps.c                 |  3 ++-
 xen/include/asm-x86/{ => pv}/trace.h |  8 ++++---
 xen/include/asm-x86/trace.h          | 42 ------------------------------------
 10 files changed, 17 insertions(+), 58 deletions(-)
 rename xen/arch/x86/{ => pv}/trace.c (95%)
 copy xen/include/asm-x86/{ => pv}/trace.h (92%)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 202d4d27823d..82dd4e18bd36 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -61,7 +61,6 @@ obj-y += spec_ctrl.o
 obj-y += srat.o
 obj-y += string.o
 obj-y += time.o
-obj-y += trace.o
 obj-y += traps.o
 obj-y += tsx.o
 obj-y += usercopy.o
diff --git a/xen/arch/x86/pv/Makefile b/xen/arch/x86/pv/Makefile
index 75b01b0062d8..6cda354cc41f 100644
--- a/xen/arch/x86/pv/Makefile
+++ b/xen/arch/x86/pv/Makefile
@@ -12,6 +12,7 @@ obj-y += misc-hypercalls.o
 obj-y += mm.o
 obj-y += ro-page-fault.o
 obj-$(CONFIG_PV_SHIM) += shim.o
+obj-$(CONFIG_TRACEBUFFER) += trace.o
 obj-y += traps.o
 
 obj-bin-y += dom0_build.init.o
diff --git a/xen/arch/x86/pv/emul-inv-op.c b/xen/arch/x86/pv/emul-inv-op.c
index b15f302bcaad..2c07eed9a092 100644
--- a/xen/arch/x86/pv/emul-inv-op.c
+++ b/xen/arch/x86/pv/emul-inv-op.c
@@ -19,7 +19,7 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <xen/trace.h>
+#include <asm/pv/trace.h>
 
 #include "emulate.h"
 
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 11467a1e3a90..d0df5bc616c0 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -30,6 +30,7 @@
 #include <asm/hypercall.h>
 #include <asm/mc146818rtc.h>
 #include <asm/pv/domain.h>
+#include <asm/pv/trace.h>
 #include <asm/shared.h>
 
 #include <xsm/xsm.h>
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 335aa8dc5dc0..ac5b66870c8c 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -20,7 +20,7 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <xen/trace.h>
+#include <asm/pv/trace.h>
 #include <asm/shadow.h>
 
 #include "emulate.h"
diff --git a/xen/arch/x86/trace.c b/xen/arch/x86/pv/trace.c
similarity index 95%
rename from xen/arch/x86/trace.c
rename to xen/arch/x86/pv/trace.c
index 4a953c5b2f1e..550c22765bae 100644
--- a/xen/arch/x86/trace.c
+++ b/xen/arch/x86/pv/trace.c
@@ -1,9 +1,6 @@
-#include <xen/init.h>
-#include <xen/kernel.h>
-#include <xen/lib.h>
-#include <xen/domain.h>
 #include <xen/sched.h>
-#include <xen/trace.h>
+
+#include <asm/pv/trace.h>
 
 void __trace_pv_trap(int trapnr, unsigned long eip,
                      int use_error_code, unsigned error_code)
@@ -21,7 +18,7 @@ void __trace_pv_trap(int trapnr, unsigned long eip,
         d.trapnr = trapnr;
         d.error_code = error_code;
         d.use_error_code=!!use_error_code;
-                
+
         __trace_var(TRC_PV_TRAP, 1, sizeof(d), &d);
     }
     else
@@ -38,7 +35,7 @@ void __trace_pv_trap(int trapnr, unsigned long eip,
         d.trapnr = trapnr;
         d.error_code = error_code;
         d.use_error_code=!!use_error_code;
-                
+
         event = TRC_PV_TRAP;
         event |= TRC_64_FLAG;
         __trace_var(event, 1, sizeof(d), &d);
@@ -58,7 +55,7 @@ void __trace_pv_page_fault(unsigned long addr, unsigned error_code)
         d.eip = eip;
         d.addr = addr;
         d.error_code = error_code;
-                
+
         __trace_var(TRC_PV_PAGE_FAULT, 1, sizeof(d), &d);
     }
     else
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 7439b76df88d..764773c02104 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -22,10 +22,10 @@
 #include <xen/event.h>
 #include <xen/hypercall.h>
 #include <xen/lib.h>
-#include <xen/trace.h>
 #include <xen/softirq.h>
 
 #include <asm/apic.h>
+#include <asm/pv/trace.h>
 #include <asm/shared.h>
 #include <asm/traps.h>
 #include <irq_vectors.h>
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 4a0e498b4c21..0cc1ee95cb5b 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -82,6 +82,7 @@
 #include <xsm/xsm.h>
 #include <asm/mach-default/irq_vectors.h>
 #include <asm/pv/traps.h>
+#include <asm/pv/trace.h>
 #include <asm/pv/mm.h>
 
 /*
@@ -1480,7 +1481,7 @@ static int fixup_page_fault(unsigned long addr, struct cpu_user_regs *regs)
     {
         int ret = paging_fault(addr, regs);
 
-        if ( ret == EXCRET_fault_fixed )
+        if ( IS_ENABLED(CONFIG_PV) && ret == EXCRET_fault_fixed )
             trace_trap_two_addr(TRC_PV_PAGING_FIXUP, regs->rip, addr);
         return ret;
     }
diff --git a/xen/include/asm-x86/trace.h b/xen/include/asm-x86/pv/trace.h
similarity index 92%
copy from xen/include/asm-x86/trace.h
copy to xen/include/asm-x86/pv/trace.h
index e65b5de6eec4..c616206eeb15 100644
--- a/xen/include/asm-x86/trace.h
+++ b/xen/include/asm-x86/pv/trace.h
@@ -1,5 +1,7 @@
-#ifndef __ASM_TRACE_H__
-#define __ASM_TRACE_H__
+#ifndef XEN_X86_PV_TRACE_H
+#define XEN_X86_PV_TRACE_H
+
+#include <xen/trace.h>
 
 #include <asm/page.h>
 
@@ -43,4 +45,4 @@ static inline void trace_ptwr_emulation(unsigned long addr, l1_pgentry_t npte)
         __trace_ptwr_emulation(addr, npte);
 }
 
-#endif /* __ASM_TRACE_H__ */
+#endif /* XEN_X86_PV_TRACE_H */
diff --git a/xen/include/asm-x86/trace.h b/xen/include/asm-x86/trace.h
index e65b5de6eec4..edef1bb099d4 100644
--- a/xen/include/asm-x86/trace.h
+++ b/xen/include/asm-x86/trace.h
@@ -1,46 +1,4 @@
 #ifndef __ASM_TRACE_H__
 #define __ASM_TRACE_H__
 
-#include <asm/page.h>
-
-void __trace_pv_trap(int trapnr, unsigned long eip,
-                     int use_error_code, unsigned error_code);
-static inline void trace_pv_trap(int trapnr, unsigned long eip,
-                                 int use_error_code, unsigned error_code)
-{
-    if ( unlikely(tb_init_done) )
-        __trace_pv_trap(trapnr, eip, use_error_code, error_code);
-}
-
-void __trace_pv_page_fault(unsigned long addr, unsigned error_code);
-static inline void trace_pv_page_fault(unsigned long addr,
-                                       unsigned error_code)
-{
-    if ( unlikely(tb_init_done) )
-        __trace_pv_page_fault(addr, error_code);
-}
-
-void __trace_trap_one_addr(unsigned event, unsigned long va);
-static inline void trace_trap_one_addr(unsigned event, unsigned long va)
-{
-    if ( unlikely(tb_init_done) )
-        __trace_trap_one_addr(event, va);
-}
-
-void __trace_trap_two_addr(unsigned event, unsigned long va1,
-                           unsigned long va2);
-static inline void trace_trap_two_addr(unsigned event, unsigned long va1,
-                                       unsigned long va2)
-{
-    if ( unlikely(tb_init_done) )
-        __trace_trap_two_addr(event, va1, va2);
-}
-
-void __trace_ptwr_emulation(unsigned long addr, l1_pgentry_t npte);
-static inline void trace_ptwr_emulation(unsigned long addr, l1_pgentry_t npte)
-{
-    if ( unlikely(tb_init_done) )
-        __trace_ptwr_emulation(addr, npte);
-}
-
 #endif /* __ASM_TRACE_H__ */
-- 
2.11.0


