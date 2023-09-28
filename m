Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36F97B2128
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 17:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609917.949094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlssy-0003Bo-6z; Thu, 28 Sep 2023 15:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609917.949094; Thu, 28 Sep 2023 15:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlssy-000368-28; Thu, 28 Sep 2023 15:25:04 +0000
Received: by outflank-mailman (input) for mailman id 609917;
 Thu, 28 Sep 2023 15:25:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRba=FM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qlssw-00032t-FF
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 15:25:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30d2370d-5e13-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 17:25:01 +0200 (CEST)
Received: from beta.station (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id A66FB4EE0C81;
 Thu, 28 Sep 2023 17:25:00 +0200 (CEST)
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
X-Inumbo-ID: 30d2370d-5e13-11ee-878a-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	jbeulich@suse.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Gianluca Luparini <gianluca.luparini@bugseng.com>
Subject: [XEN PATCH v7 2/4] x86/hvm: address violations of MISRA C:2012 Rule 7.2
Date: Thu, 28 Sep 2023 17:23:02 +0200
Message-Id: <02713e9b349a4d45262e808da1968474bf86284f.1695913900.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695913900.git.simone.ballarin@bugseng.com>
References: <cover.1695913900.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type.

For the sake of uniformity, the following change is made:
- add 'U' suffixes to 'mask16' in 'stdvga.c'

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v7:
- add Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
- switch order of Signed-off-by tags
Changes in v6:
- new patch obtained by splitting HVM related changes from
"xen/x86: address violations of MISRA C:2012 Rule 7.2 (v5)"
- fix inadvertent changes to "sr_mask"
---
 xen/arch/x86/hvm/hypercall.c           |  2 +-
 xen/arch/x86/hvm/pmtimer.c             |  4 ++--
 xen/arch/x86/hvm/stdvga.c              | 32 +++++++++++++-------------
 xen/arch/x86/hvm/vlapic.c              |  6 ++---
 xen/arch/x86/include/asm/hvm/trace.h   |  4 ++--
 xen/arch/x86/include/asm/hvm/vioapic.h |  2 +-
 6 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 20d266ffd5..eeb73e1aa5 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -129,7 +129,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         break;
     }
 
-    if ( (eax & 0x80000000) && is_viridian_domain(currd) )
+    if ( (eax & 0x80000000U) && is_viridian_domain(currd) )
     {
         int ret;
 
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 2145c531b6..eb4a455763 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -40,8 +40,8 @@
 #define SCI_IRQ 9
 
 /* We provide a 32-bit counter (must match the TMR_VAL_EXT bit in the FADT) */
-#define TMR_VAL_MASK  (0xffffffff)
-#define TMR_VAL_MSB   (0x80000000)
+#define TMR_VAL_MASK  (0xffffffffU)
+#define TMR_VAL_MSB   (0x80000000U)
 
 /* Dispatch SCIs based on the PM1a_STS and PM1a_EN registers */
 static void pmt_update_sci(PMTState *s)
diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index 2586891863..8da07ff8a2 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -39,22 +39,22 @@
 
 #define PAT(x) (x)
 static const uint32_t mask16[16] = {
-    PAT(0x00000000),
-    PAT(0x000000ff),
-    PAT(0x0000ff00),
-    PAT(0x0000ffff),
-    PAT(0x00ff0000),
-    PAT(0x00ff00ff),
-    PAT(0x00ffff00),
-    PAT(0x00ffffff),
-    PAT(0xff000000),
-    PAT(0xff0000ff),
-    PAT(0xff00ff00),
-    PAT(0xff00ffff),
-    PAT(0xffff0000),
-    PAT(0xffff00ff),
-    PAT(0xffffff00),
-    PAT(0xffffffff),
+    PAT(0x00000000U),
+    PAT(0x000000ffU),
+    PAT(0x0000ff00U),
+    PAT(0x0000ffffU),
+    PAT(0x00ff0000U),
+    PAT(0x00ff00ffU),
+    PAT(0x00ffff00U),
+    PAT(0x00ffffffU),
+    PAT(0xff000000U),
+    PAT(0xff0000ffU),
+    PAT(0xff00ff00U),
+    PAT(0xff00ffffU),
+    PAT(0xffff0000U),
+    PAT(0xffff00ffU),
+    PAT(0xffffff00U),
+    PAT(0xffffffffU),
 };
 
 /* force some bits to zero */
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index c7ce82d064..a8e87c4446 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -237,7 +237,7 @@ bool_t vlapic_match_dest(
     case APIC_DEST_NOSHORT:
         if ( dest_mode )
             return vlapic_match_logical_addr(target, dest);
-        return (dest == _VLAPIC_ID(target, 0xffffffff)) ||
+        return (dest == _VLAPIC_ID(target, 0xffffffffU)) ||
                (dest == VLAPIC_ID(target));
 
     case APIC_DEST_SELF:
@@ -467,7 +467,7 @@ static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
         return short_hand != APIC_DEST_SELF;
 
     if ( vlapic_x2apic_mode(vlapic) )
-        return dest_mode ? hweight16(dest) > 1 : dest == 0xffffffff;
+        return dest_mode ? hweight16(dest) > 1 : dest == 0xffffffffU;
 
     if ( dest_mode )
         return hweight8(dest &
@@ -831,7 +831,7 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
         break;
 
     case APIC_ICR2:
-        vlapic_set_reg(vlapic, APIC_ICR2, val & 0xff000000);
+        vlapic_set_reg(vlapic, APIC_ICR2, val & 0xff000000U);
         break;
 
     case APIC_LVTT:         /* LVT Timer Reg */
diff --git a/xen/arch/x86/include/asm/hvm/trace.h b/xen/arch/x86/include/asm/hvm/trace.h
index 696e42eb94..22eadbdd47 100644
--- a/xen/arch/x86/include/asm/hvm/trace.h
+++ b/xen/arch/x86/include/asm/hvm/trace.h
@@ -58,7 +58,7 @@
 #define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC
 
 
-#define TRC_PAR_LONG(par) ((par)&0xFFFFFFFF),((par)>>32)
+#define TRC_PAR_LONG(par) ((uint32_t)(par)), ((par) >> 32)
 
 #define TRACE_2_LONG_2D(_e, d1, d2, ...) \
     TRACE_4D(_e, d1, d2)
@@ -93,7 +93,7 @@
     HVMTRACE_ND(evt, 0, 0)
 
 #define HVMTRACE_LONG_1D(evt, d1)                  \
-                   HVMTRACE_2D(evt ## 64, (d1) & 0xFFFFFFFF, (d1) >> 32)
+                   HVMTRACE_2D(evt ## 64, (uint32_t)(d1), (d1) >> 32)
 #define HVMTRACE_LONG_2D(evt, d1, d2, ...)              \
                    HVMTRACE_3D(evt ## 64, d1, d2)
 #define HVMTRACE_LONG_3D(evt, d1, d2, d3, ...)      \
diff --git a/xen/arch/x86/include/asm/hvm/vioapic.h b/xen/arch/x86/include/asm/hvm/vioapic.h
index 2944ec20dd..68af6dce79 100644
--- a/xen/arch/x86/include/asm/hvm/vioapic.h
+++ b/xen/arch/x86/include/asm/hvm/vioapic.h
@@ -32,7 +32,7 @@
 #define VIOAPIC_EDGE_TRIG  0
 #define VIOAPIC_LEVEL_TRIG 1
 
-#define VIOAPIC_DEFAULT_BASE_ADDRESS  0xfec00000
+#define VIOAPIC_DEFAULT_BASE_ADDRESS  0xfec00000U
 #define VIOAPIC_MEM_LENGTH            0x100
 
 /* Direct registers. */
-- 
2.34.1


