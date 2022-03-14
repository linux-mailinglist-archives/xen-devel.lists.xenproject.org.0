Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0F4D804F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 12:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290150.492070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTiRd-0001yD-9Y; Mon, 14 Mar 2022 11:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290150.492070; Mon, 14 Mar 2022 11:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTiRd-0001wF-6Z; Mon, 14 Mar 2022 11:00:57 +0000
Received: by outflank-mailman (input) for mailman id 290150;
 Mon, 14 Mar 2022 11:00:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0cW6=TZ=citrix.com=prvs=065348267=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nTiRc-0001w5-3j
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 11:00:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff5ab574-a385-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 12:00:46 +0100 (CET)
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
X-Inumbo-ID: ff5ab574-a385-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647255654;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cdyEoBU/f1cnQ43XUIskjAet3xho8xWImznx9yUFDrc=;
  b=cdxQ1xFjs1o8zJhYFDlPRs9kNioYkuh7BFcO6zbbrOR0TgVVoyFp9aVU
   YYt46cG6AWcB5Uag3SyfzORx3fyZSz7Zfj1rfA9QWqwgBKZEFLaMLBLFp
   rnjh9MFqbfzET+l4/jlM3E6Kdk8c68NldzZaYh0EUtTFo/D38lQ8gjKUR
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66562350
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:e0rf4KplmGQFcJ9DiZP4/BBZPnheBmIIZRIvgKrLsJaIsI4StFCzt
 garIBnQPP+LNDage9B0aom+pk8GvMPQzdZjT1Ruqy9nESlEpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 I+q+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBGv2WwfU4XEViHXtZD+5k17/lA2XivpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxMkmeOUYSYj/7DroArcCPnCO8eAdn9nmemPsx2neU6R5Yhe2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34T+M6HelnOLMtSL9RoMJFbe8++JqgVuc3WgaAlsdUl7Tiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYVbNrO6FiDzuAyZPCl1BRwAEbykYvta29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWB2zaD/LF7rlxBHkJPmqgKvFlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i6D6GLNIIRPcEpHONiwM2JTRTMt10BbWB2yf1vU
 XtlWZvE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz8uYdykEW9EO9fWHPXN7hRxPrd/G39r
 oYOX+PXmk43eLCvPUHqHXs7cAliwY4TXsut9aS6t4erf2JbJY3WI6SIkO17JNA9wfg9eyWh1
 ijVZ3K0AWHX3RXvQThmoFg5AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:cPdSHqDmP59tFC/lHemf55DYdb4zR+YMi2TDgXoBMCC9E/bo8v
 xH/pwgvyMc7Qx9ZJhOo7y90cW7Lk80lqQFg7X5X43DYOC8ghrPEGgK1+KLqAEIfReRygc379
 YCT0ERMrzN5fcRt7eD3OEVeexQpOVuUcqT9IDj80s=
X-IronPort-AV: E=Sophos;i="5.90,180,1643691600"; 
   d="scan'208";a="66562350"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/cet: Clear IST supervisor token busy bits on S3 resume
Date: Mon, 14 Mar 2022 11:00:34 +0000
Message-ID: <20220314110034.28498-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Stacks are not freed across S3.  Execution just stops, leaving supervisor
token busy bits active.  Fixing this for the primary shadow stack was done
previously, but there is a (rare) risk that an IST token is left busy too.
This will manifest as #DF next time the IST vector gets used.

Introduce rdssp() and wrss() helpers in a new shstk.h, cleaning up
fixup_exception_return() and explaining the trick with the literal 1.

Then this infrastructure to rewrite the IST tokens in load_system_tables()
when all the other IST details are being set up.  In the case that an IST
token were left busy across S3, this will clear the busy bit before the stack
gets used.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/arch/x86/cpu/common.c        | 25 ++++++++++++++++++----
 xen/arch/x86/include/asm/shstk.h | 46 ++++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/traps.c             |  8 +++----
 3 files changed, 70 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/shstk.h

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index bd2207163a35..6eab7dbe894c 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -13,6 +13,7 @@
 #include <asm/apic.h>
 #include <asm/random.h>
 #include <asm/setup.h>
+#include <asm/shstk.h>
 #include <mach_apic.h>
 #include <public/sysctl.h> /* for XEN_INVALID_{SOCKET,CORE}_ID */
 
@@ -826,15 +827,31 @@ void load_system_tables(void)
 	 */
 	if (cpu_has_xen_shstk) {
 		volatile uint64_t *ist_ssp = tss_page->ist_ssp;
+		unsigned long
+			mce_ssp = stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8,
+			nmi_ssp = stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8,
+			db_ssp  = stack_top + (IST_DB  * IST_SHSTK_SIZE) - 8,
+			df_ssp  = stack_top + (IST_DF  * IST_SHSTK_SIZE) - 8;
 
 		ist_ssp[0] = 0x8600111111111111ul;
-		ist_ssp[IST_MCE] = stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8;
-		ist_ssp[IST_NMI] = stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8;
-		ist_ssp[IST_DB]	 = stack_top + (IST_DB	* IST_SHSTK_SIZE) - 8;
-		ist_ssp[IST_DF]	 = stack_top + (IST_DF	* IST_SHSTK_SIZE) - 8;
+		ist_ssp[IST_MCE] = mce_ssp;
+		ist_ssp[IST_NMI] = nmi_ssp;
+		ist_ssp[IST_DB]	 = db_ssp;
+		ist_ssp[IST_DF]	 = df_ssp;
 		for ( i = IST_DF + 1; i < ARRAY_SIZE(tss_page->ist_ssp); ++i )
 			ist_ssp[i] = 0x8600111111111111ul;
 
+		if (rdssp() != SSP_NO_SHSTK) {
+			/*
+			 * Rewrite supervisor tokens when shadow stacks are
+			 * active.  This resets any busy bits left across S3.
+			 */
+			wrss(mce_ssp, _p(mce_ssp));
+			wrss(nmi_ssp, _p(nmi_ssp));
+			wrss(db_ssp,  _p(db_ssp));
+			wrss(df_ssp,  _p(df_ssp));
+		}
+
 		wrmsrl(MSR_INTERRUPT_SSP_TABLE, (unsigned long)ist_ssp);
 	}
 
diff --git a/xen/arch/x86/include/asm/shstk.h b/xen/arch/x86/include/asm/shstk.h
new file mode 100644
index 000000000000..a26e3c70f0c6
--- /dev/null
+++ b/xen/arch/x86/include/asm/shstk.h
@@ -0,0 +1,46 @@
+/******************************************************************************
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Copyright (c) 2022 Citrix Systems Ltd.
+ */
+#ifndef XEN_ASM_SHSTK_H
+#define XEN_ASM_SHSTK_H
+
+/*
+ * RDSSP is a nop when shadow stacks are active.  Also, SSP has a minimum
+ * alignment of 4 which enforced by hardware.
+ *
+ * We load 1 into a register, then RDSSP.  If shadow stacks are not active,
+ * RDSSP is a nop, and the 1 is preserved.  If shadow stacks are active, the 1
+ * is clobbered with the real SSP, which has the bottom two bits clear.
+ */
+#define SSP_NO_SHSTK 1
+
+static inline unsigned long rdssp(void)
+{
+    unsigned long ssp;
+
+    asm volatile ( "rdsspq %0" : "=r" (ssp) : "0" (SSP_NO_SHSTK) );
+
+    return ssp;
+}
+
+static inline void wrss(unsigned long val, unsigned long *ptr)
+{
+    asm ( "wrssq %[val], %[ptr]"
+          : [ptr] "=m" (*ptr)
+          : [val] "r" (val) );
+}
+
+#endif /* XEN_ASM_SHSTK_H */
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index a2278d9499d0..86595479707a 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -84,6 +84,7 @@
 #include <asm/pv/traps.h>
 #include <asm/pv/trace.h>
 #include <asm/pv/mm.h>
+#include <asm/shstk.h>
 
 /*
  * opt_nmi: one of 'ignore', 'dom0', or 'fatal'.
@@ -868,8 +869,7 @@ static void fixup_exception_return(struct cpu_user_regs *regs,
     {
         unsigned long ssp, *ptr, *base;
 
-        asm ( "rdsspq %0" : "=r" (ssp) : "0" (1) );
-        if ( ssp == 1 )
+        if ( (ssp = rdssp()) == SSP_NO_SHSTK )
             goto shstk_done;
 
         ptr = _p(ssp);
@@ -898,9 +898,7 @@ static void fixup_exception_return(struct cpu_user_regs *regs,
              */
             if ( ptr[0] == regs->rip && ptr[1] == regs->cs )
             {
-                asm ( "wrssq %[fix], %[stk]"
-                      : [stk] "=m" (ptr[0])
-                      : [fix] "r" (fixup) );
+                wrss(fixup, ptr);
                 goto shstk_done;
             }
         }
-- 
2.11.0


