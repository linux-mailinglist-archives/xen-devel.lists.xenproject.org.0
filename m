Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F7A40F45C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 10:47:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189093.338607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vh-0003kR-0n; Fri, 17 Sep 2021 08:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189093.338607; Fri, 17 Sep 2021 08:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vg-0003hL-Rb; Fri, 17 Sep 2021 08:46:16 +0000
Received: by outflank-mailman (input) for mailman id 189093;
 Fri, 17 Sep 2021 08:46:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OQJ=OH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mR9Vg-0003AJ-45
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 08:46:16 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d547ed4a-333f-44c9-9f2c-1ddc9a887db3;
 Fri, 17 Sep 2021 08:46:11 +0000 (UTC)
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
X-Inumbo-ID: d547ed4a-333f-44c9-9f2c-1ddc9a887db3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631868371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=r4SmFOIEP9O9irUeiBnJE4TyoFxvXpO9Kd5PyOYMvEY=;
  b=VdEryaI+n2oP8rggt8mhuolRClVpUxk3JcmvrzkvHqAhVGxULyN2Du3l
   LVSA08yOljQtbzURU1rby7k+yjWHjlyJZO3/7kJsvt1x5bjfsJ/fMGL4q
   EoCW2icpl2G1FrbYfv4SnkgKfozUuSuTqP9mVHRm0BDlqO604BovW/F0f
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JSm8SffdyxHUd9GVLPoEWHdUZetYvTIPnsvJw++KHnM9g7TtIDSLADXykFj5d7TLYoGcH2iEVY
 WjjDFN0dKbyGZkmP1n30c94zl5/niS2MpbxpVhETM5l1iWfoCYpAzSfkg03znMt+HQRrcUxVLO
 S+EBalbPRG1YJmf7lZ6ASho8Mwhc9iiT+KCvCU/2SQDXQkQTEM76Yx/k1yIoiwBfQoy4ki0ezK
 qF4aH0SMs6FT4NwSN8yIiI4OJ1vROdfUTGJkJ+lNCVp327z8beqmgU+y7XFXN1oRx2EhMO3Vac
 net3eBX44u6KPgYql4hj69hI
X-SBRS: 5.1
X-MesageID: 54750987
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d1SstK8cXCf95j2PDyx5DrUDfHmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 jFOWWGHOP2OZjb3e9AjbIvg/UtSupTUx9YwGVdupC88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6w79g3dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgrm
 NRRtJeCUz0uBfz9p+8iCz5ZPBlXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0SQquGN
 ppGAdZpRB/CbTwRAwwZMbsZluaMqWPeVDcJo2vA8MLb5ECMlVcsgdABKuH9eMGORMhTtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoeGrS3+f9thFy73XEIBVsdUl7Tiea9ol6zXZRYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL84hmbLngJSCZbb94rv9NwQiYlv
 neShM/gDzFrtLyTSFqe+62SoDf0PjIaRVLufgddE1FDuYO65thu0FSfFb6PDZJZkPWvSTDsw
 ju4thI5vOQissU0j4K60mju1mfESofycuIl2unGdjv7tVokNdH6OdXABUvztqkbfd3AJrWVl
 D1dwZHPsrpWZX2YvHHVGI0w8KeVC+Fp2dE2qWVmGYUovx+p8mSqFWy7yGAjfBo1WirolDmAX
 aMyhe+zzMQIVJdJRfUuC25UNyjM5fO4fTgCfqqPBueimrArKGe6ENhGPCZ8JVwBdXTAd4lkY
 f93lu73Vh4n5VlPlmLqF4/xL5dynn1WKZzvqWDTkE38jOv2iI+9YrYZKlqeBt3VH4vd+169z
 jqrDOPTk083eLSnOkH/qNdPRXhXfSlTLc2n8KR/K7/cSjeK7Ul8Upc9N5t6INc790mU/8+Vl
 kyAtrhwkwam3iybdlzRMxiOqtrHBP5CkJ7yBgR0VX7A5pTpSd/HAH43e8RlcL852vZkyPIoH
 fAJd9/ZWqZESyjd+iRbZp749dQweBOujAOIHiykfDlgIMIwG12XoofpLln16S0DLiurrs9i8
 beu4RzWHMgYTAN4AceINP/2lwGtvWIQkf5ZVlfTJoUBY13l9YVncnSjjvI+L8wWBw/Ewz+Wi
 1SfDRsC/LGfqI4p6tjZw6uDqt7xQed5G0NbGUjd7Kq3anaGrjbyn9cYXb/RLz7HVW7y9KGzX
 slvzqnxYK8dgVJHk4tgCLI3n6gw0MTi+u1BxQN+EXSVM1nyUuF8ImOL1NVkv7FWwuMLohO/X
 0+C94UIObiNP8+5QlcdKBB8M7aG3PAQ3DLT8e40MAPx4youpOiLVkBbPh+tji1BLeQqbNN5k
 Ll54MNGuRaijhcKM8qdinEG/muBGXUMTqE7u8xIG4TskAcqlglPbJG05vUaO31ThwGg6nUXH
 wI=
IronPort-HdrOrdr: A9a23:Dqtkna1wdC6jgNq1E38FPAqjBLAkLtp133Aq2lEZdPRUGvb3qy
 nOpoVj6faaslYssR0b9exofZPwJE80lqQFh7X5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtsp
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.85,300,1624334400"; 
   d="scan'208";a="54750987"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: [PATCH 4/6] x86/trace: Reduce stack usage from HVMTRACE_ND()
Date: Fri, 17 Sep 2021 09:45:57 +0100
Message-ID: <20210917084559.22673-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210917084559.22673-1-andrew.cooper3@citrix.com>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

It is pointless to write all 6 entries and only consume the useful subset.
bloat-o-meter shows quite how obscene the overhead is in vmx_vmexit_handler(),
weighing in at 11% of the function arranging unread zeroes on the stack, and
8% for svm_vmexit_handler().

  add/remove: 0/0 grow/shrink: 0/20 up/down: 0/-1867 (-1867)
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
  svm_vmenter_helper                           238     190     -48
  hvm_hlt                                      197     146     -51
  svm_inject_event                            1678    1614     -64
  svm_vmexit_handler                          5880    5416    -464
  vmx_vmexit_handler                          7281    6473    -808
  Total: Before=3644184, After=3642317, chg -0.05%

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>

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
index 5cd459b855b7..2bbac45044ce 100644
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
+                        sizeof(_d), _d);                                  \
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


