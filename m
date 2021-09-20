Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB9411E1F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191055.340988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN3J-0006ra-S6; Mon, 20 Sep 2021 17:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191055.340988; Mon, 20 Sep 2021 17:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN3J-0006nF-K4; Mon, 20 Sep 2021 17:26:01 +0000
Received: by outflank-mailman (input) for mailman id 191055;
 Mon, 20 Sep 2021 17:25:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSN3H-0003ck-Jq
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:25:59 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 498bb826-dae4-419f-ac12-f9a647422097;
 Mon, 20 Sep 2021 17:25:41 +0000 (UTC)
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
X-Inumbo-ID: 498bb826-dae4-419f-ac12-f9a647422097
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632158741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J0c0EKnncyso937b/nTJN9IuK7CtJgbwEqGNFEbbFdw=;
  b=XMLZZqrr0xpZvQ+ZtRLizLDBiFLs1uqWKFDjte7izRhO7XyvgvfOV8gt
   RXXqAjjkR3BC1Qx+nsqU6qszje/xmB0iBgLsrNw47ntghRlzS0VWNnv43
   +KHofx5kvA9NgLHv6cFBX1xuMy45H2l5SGAbUsB8JXbD6sQctCjBuNXe7
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QB/yb4BU8YtWfEDbbD4DxptDgnCuvdzoDh+lOslCjvNzO4tKfOWSn+1prs7uogfJ6ihuV5Ue7n
 cVTlTdvqGC0rqqfOyb/D3PSWb/h/vwShtTZwcQwimY0kS90tOPM9mUt80vZzkUOmn7rwb7N+aG
 Bvhpy1R5//SFzhQa2H6/XCsl/Q1Ngpxk9euAg+ReM8896N6Cjkt1p/LPZJZeX3R0bd8MpU7qwa
 np9qMPUp8QBV0usth7HbOPa0fDTNw6zsIOKIjouzDm3NLNupZOp6TMQxAD5h87tAxRmARwKTQi
 5Kex866Cmmg2MLCEGmo1oM+s
X-SBRS: 5.1
X-MesageID: 54938587
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4OdDPKMtBZYO/N/vrR29kMFynXyQoLVcMsEvi/4bfWQNrUoj3zAGn
 TBNUGGGbvmKazehLt0jbN/ioR8O6JDczdBgSQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En552Eg7w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoy+MgPBI5
 txPjpDqUgg5ALTTkdwaTjANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWth3ZATTam2i
 8wxWBVQNT7fajNzHEZQE80gwMiQo2j0WmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaeuwE8YvRZEdY2shqC2pTN/A+hAXUtG2sphMMdiCMmedA7/
 gbXxIq5Xm0+6Of9pWG1rejP/GjrUcQBBSpbP3ZVE1FdizX2iNxr1nryosBf/LlZZzEfMQr5x
 SyD5AM6jq8a5SLg//TmpQ2b695AS56gc+LU2uk1djn+hu+aTNT8D2BN1bQ8xawbRLt1tnHb4
 BA5dzG2tYji961hcRBhp81WRtmUCwutamWA0TaD4bF4r2nFF4GfkXB4v2gleRYB3jcsUj71e
 k7D0T69F7cKZyDCUEODWKroU55C5fG5TbzND6mIBvITMskZXFLWp0lGOB/Pt10BZWBxyMnTz
 7/AKp3yZZvbYIw6pAeLqxA1i+5zmn9mmjONGvgWDX2PiNKjWZJccp9dWHPmUwzzxPjsTNz9/
 4kNOs2U5Q9YVeGiMCDb/ZRKdQIBLGQhBICwoMtSL7bRLg1jEWAnKvnQ3bJ+JNA1w/ULzr/Fr
 iOnR0tV6Fvjnnmbew+EXW9uNeH0VpFloHNlYSF1ZQS022IuaJqE5bsEc8dlZqEu8eFulKYmT
 /QMd8iaLO5ITzDLp2YUYZXn9dQwfxW3nwOeeSGiZWFnLZJnQgXI/P7ifxfuq3ZSXnbm65Nmr
 uT5hA3BQJcFSwBzN+rsaaqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTEiPzWr4qtFOciTENWE3OCsOSzPCjeuGGi3ZVBQKCDejWEDDH4/6CrZ
 ON0yfDgMaJYwAYW4tQkS7s7n7gj49bPpqNBylU2FXrGWF2nF7d8LyTUxsJIrKBMmudUtAbet
 phjITWG1WFl4P/YLWM=
IronPort-HdrOrdr: A9a23:N/op3a9jBN2bb8cCXCVuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="54938587"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 04/12] x86/hvm: Reduce stack usage from HVMTRACE_ND()
Date: Mon, 20 Sep 2021 18:25:21 +0100
Message-ID: <20210920172529.24932-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It is pointless to write all 6 entries and only consume the useful subset.
bloat-o-meter shows quite how obscene the overhead is in vmx_vmexit_handler(),
weighing in at 12% of the function arranging unread zeroes on the stack, and
8% for svm_vmexit_handler().

  add/remove: 0/0 grow/shrink: 0/20 up/down: 0/-1929 (-1929)
  Function                                     old     new   delta
  hvm_msr_write_intercept                     1049    1033     -16
  vmx_enable_intr_window                       238     214     -24
  svm_enable_intr_window                       337     313     -24
  hvmemul_write_xcr                            115      91     -24
  hvmemul_write_cr                             350     326     -24
  hvmemul_read_xcr                             115      91     -24
  hvmemul_read_cr                              146     122     -24
  hvm_mov_to_cr                                438     414     -24
  hvm_mov_from_cr                              253     229     -24
  vmx_intr_assist                             1150    1118     -32
  svm_intr_assist                              459     427     -32
  hvm_rdtsc_intercept                          138     106     -32
  hvm_msr_read_intercept                       898     866     -32
  vmx_vmenter_helper                          1142    1094     -48
  vmx_inject_event                             813     765     -48
  svm_vmenter_helper                           238     187     -51
  hvm_hlt                                      197     146     -51
  svm_inject_event                            1678    1614     -64
  svm_vmexit_handler                          5880    5392    -488
  vmx_vmexit_handler                          7281    6438    -843
  Total: Before=3644277, After=3642348, chg -0.05%

Adjust all users of HVMTRACE_ND(), using TRC_PAR_LONG() where appropriate
instead of opencoding it.

The 0 case needs a little help.  All object in C must have a unique address
and _d is passed by pointer.  Explicitly permit the optimiser to drop the
array.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Adjust callers of HVMTRACE_ND() too
 * Drop _d[] for the 0 case.

Normally I wouldn't recommend patches like this for backport, but
{vmx,svm}_vmexit_handler() are fastpaths and this is a *lot* of I-cache lines
dropped...
---
 xen/arch/x86/hvm/svm/svm.c      |  8 +++-----
 xen/arch/x86/hvm/vmx/vmx.c      |  9 ++++-----
 xen/include/asm-x86/hvm/trace.h | 28 ++++++++++------------------
 3 files changed, 17 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index afb1ccb342c2..f0e10dec046e 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1052,7 +1052,7 @@ void svm_vmenter_helper(const struct cpu_user_regs *regs)
     if ( unlikely(tb_init_done) )
         HVMTRACE_ND(VMENTRY,
                     nestedhvm_vcpu_in_guestmode(curr) ? TRC_HVM_NESTEDFLAG : 0,
-                    1/*cycles*/, 0, 0, 0, 0, 0, 0, 0);
+                    1/*cycles*/);
 
     svm_sync_vmcb(curr, vmcb_needs_vmsave);
 
@@ -2565,12 +2565,10 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
 
     if ( hvm_long_mode_active(v) )
         HVMTRACE_ND(VMEXIT64, vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0,
-                    1/*cycles*/, 3, exit_reason,
-                    regs->eip, regs->rip >> 32, 0, 0, 0);
+                    1/*cycles*/, exit_reason, TRC_PAR_LONG(regs->rip));
     else
         HVMTRACE_ND(VMEXIT, vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0,
-                    1/*cycles*/, 2, exit_reason,
-                    regs->eip, 0, 0, 0, 0);
+                    1/*cycles*/, exit_reason, regs->eip);
 
     if ( vcpu_guestmode )
     {
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index b0a42d05f86a..d403e2d8060a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3864,11 +3864,10 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
     __vmread(VM_EXIT_REASON, &exit_reason);
 
     if ( hvm_long_mode_active(v) )
-        HVMTRACE_ND(VMEXIT64, 0, 1/*cycles*/, 3, exit_reason,
-                    regs->eip, regs->rip >> 32, 0, 0, 0);
+        HVMTRACE_ND(VMEXIT64, 0, 1/*cycles*/, exit_reason,
+                    TRC_PAR_LONG(regs->rip));
     else
-        HVMTRACE_ND(VMEXIT, 0, 1/*cycles*/, 2, exit_reason,
-                    regs->eip, 0, 0, 0, 0);
+        HVMTRACE_ND(VMEXIT, 0, 1/*cycles*/, exit_reason, regs->eip);
 
     perfc_incra(vmexits, exit_reason);
 
@@ -4645,7 +4644,7 @@ bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
     if ( unlikely(curr->arch.hvm.vmx.lbr_flags & LBR_FIXUP_MASK) )
         lbr_fixup();
 
-    HVMTRACE_ND(VMENTRY, 0, 1/*cycles*/, 0, 0, 0, 0, 0, 0, 0);
+    HVMTRACE_ND(VMENTRY, 0, 1/*cycles*/);
 
     __vmwrite(GUEST_RIP,    regs->rip);
     __vmwrite(GUEST_RSP,    regs->rsp);
diff --git a/xen/include/asm-x86/hvm/trace.h b/xen/include/asm-x86/hvm/trace.h
index 5cd459b855b7..145b59f6ac65 100644
--- a/xen/include/asm-x86/hvm/trace.h
+++ b/xen/include/asm-x86/hvm/trace.h
@@ -67,38 +67,30 @@
 #define TRACE_2_LONG_4D(_e, d1, d2, d3, d4, ...) \
     TRACE_6D(_e, d1, d2, d3, d4)
 
-#define HVMTRACE_ND(evt, modifier, cycles, count, d1, d2, d3, d4, d5, d6) \
+#define HVMTRACE_ND(evt, modifier, cycles, ...)                           \
     do {                                                                  \
         if ( unlikely(tb_init_done) && DO_TRC_HVM_ ## evt )               \
         {                                                                 \
-            struct {                                                      \
-                u32 d[6];                                                 \
-            } _d;                                                         \
-            _d.d[0]=(d1);                                                 \
-            _d.d[1]=(d2);                                                 \
-            _d.d[2]=(d3);                                                 \
-            _d.d[3]=(d4);                                                 \
-            _d.d[4]=(d5);                                                 \
-            _d.d[5]=(d6);                                                 \
+            uint32_t _d[] = { __VA_ARGS__ };                              \
             __trace_var(TRC_HVM_ ## evt | (modifier), cycles,             \
-                        sizeof(*_d.d) * count, &_d);                      \
+                        sizeof(_d), sizeof(_d) ? _d : NULL);              \
         }                                                                 \
     } while(0)
 
 #define HVMTRACE_6D(evt, d1, d2, d3, d4, d5, d6)    \
-    HVMTRACE_ND(evt, 0, 0, 6, d1, d2, d3, d4, d5, d6)
+    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4, d5, d6)
 #define HVMTRACE_5D(evt, d1, d2, d3, d4, d5)        \
-    HVMTRACE_ND(evt, 0, 0, 5, d1, d2, d3, d4, d5,  0)
+    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4, d5)
 #define HVMTRACE_4D(evt, d1, d2, d3, d4)            \
-    HVMTRACE_ND(evt, 0, 0, 4, d1, d2, d3, d4,  0,  0)
+    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4)
 #define HVMTRACE_3D(evt, d1, d2, d3)                \
-    HVMTRACE_ND(evt, 0, 0, 3, d1, d2, d3,  0,  0,  0)
+    HVMTRACE_ND(evt, 0, 0, d1, d2, d3)
 #define HVMTRACE_2D(evt, d1, d2)                    \
-    HVMTRACE_ND(evt, 0, 0, 2, d1, d2,  0,  0,  0,  0)
+    HVMTRACE_ND(evt, 0, 0, d1, d2)
 #define HVMTRACE_1D(evt, d1)                        \
-    HVMTRACE_ND(evt, 0, 0, 1, d1,  0,  0,  0,  0,  0)
+    HVMTRACE_ND(evt, 0, 0, d1)
 #define HVMTRACE_0D(evt)                            \
-    HVMTRACE_ND(evt, 0, 0, 0,  0,  0,  0,  0,  0,  0)
+    HVMTRACE_ND(evt, 0, 0)
 
 #define HVMTRACE_LONG_1D(evt, d1)                  \
                    HVMTRACE_2D(evt ## 64, (d1) & 0xFFFFFFFF, (d1) >> 32)
-- 
2.11.0


