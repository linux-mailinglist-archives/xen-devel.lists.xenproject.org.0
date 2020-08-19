Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F337324A464
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:53:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8RKb-0003yD-57; Wed, 19 Aug 2020 16:52:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qP9Y=B5=gmail.com=don.slutz@srs-us1.protection.inumbo.net>)
 id 1k8RKZ-0003kZ-LA
 for xen-devel@lists.xen.org; Wed, 19 Aug 2020 16:52:55 +0000
X-Inumbo-ID: 8d5413bf-f60f-4661-a088-a6f4955accda
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d5413bf-f60f-4661-a088-a6f4955accda;
 Wed, 19 Aug 2020 16:52:28 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d14so22197212qke.13
 for <xen-devel@lists.xen.org>; Wed, 19 Aug 2020 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=UOZwC4Sr72TsLIpeWc9kglyixuN4WULXzUwKP2kaYAQ=;
 b=YE6Jjt1JsB5r8GESgFnMrZyy6LmwKAdGskg760FQtdpjBLOwr82fwOfPFs6hfk9Ox9
 21Wmtu3PySlcuMDrsachk0TUZHmt5p8QhYkzOvf5wNscH/iq1TyoJh7mZtIs7bPMdEG1
 YazrZ0daATMkJx0OJ2GFri1tPdcnRWCR0WhA3Pp/l82bLUVaBzidzGcQePG9iKERtgbI
 8aXqHBzdVMiFH8YFp7zOK+e4xTqQrEisw3MRKb2Jziy/mB4IuITs4mWmN/lcDpBFzo++
 f380IdllcpCYPIp1qyz0M/rCwSShPkk5pxHU4geoa2i588IF690opttCrvgyX0Ym+u4j
 DQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=UOZwC4Sr72TsLIpeWc9kglyixuN4WULXzUwKP2kaYAQ=;
 b=tCKU5JTVp+qEdUxdpSBbFCdaea7XbDJ3CVU8H9qgfNslcXH/zYJLsItSO530ltRysK
 ZMaBrVyKF8TJxucIgsO3drYtrOXVKkhMaJwZdvpETFN0NoRClY8R4sjgUT+uMik0M3pr
 nX21xXEv1BoyEfWsErzjodnjlmjR2to2xKdCc6GH96GiyPivRfixiWATwZLYrUGKv+j+
 iI+1KdlGZmgCvzI4F513snvFVm0qvKjp7/hrK81dp3RmJeS6GW9m4f4IRbo9r2d5I9ri
 iOWtA0yZrBTvp9V71GPcez7cTqY9k/ZcLuuorIQgWxWXS2EbX3NgwuH9rfFK09J73ozi
 PGlA==
X-Gm-Message-State: AOAM532aSNP1tao/Mv9329xIkClDyxlCVGvtaJfDqGcaKfpNhn0mN4h2
 RB2Ykdc31RugcCEQHwtDJxKZuX/UrpvraZxB
X-Google-Smtp-Source: ABdhPJwXNKLrXid2Qv0hgCR00yyNfNwl5CZfuvD2a0A06Ta58hRZG6JMEOyJxrajfGKem6rlWUsZ8A==
X-Received: by 2002:a37:9d53:: with SMTP id g80mr21774186qke.17.1597855947858; 
 Wed, 19 Aug 2020 09:52:27 -0700 (PDT)
Received: from TestCloud1.don.dslutz.org.zatium.us
 (pool-96-230-225-98.bstnma.fios.verizon.net. [96.230.225.98])
 by smtp.googlemail.com with ESMTPSA id
 128sm25105832qkk.101.2020.08.19.09.52.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 09:52:27 -0700 (PDT)
From: Don Slutz <don.slutz@gmail.com>
X-Google-Original-From: Don Slutz <Don.Slutz@Gmail.com
To: xen-devel@lists.xen.org
Cc: Aravind Gopalakrishnan <Aravind.Gopalakrishnan@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Eddie Dong <eddie.dong@intel.com>, Ian Campbell <ian.campbell@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Keir Fraser <keir@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Don Slutz <dslutz@verizon.com>, Don Slutz <don.slutz@gmail.com>
Subject: [Xen-devel] [XEN PATCH v14 8/8] Add xentrace to vmware_port
Date: Wed, 19 Aug 2020 12:52:02 -0400
Message-Id: <1bfc92ee47f425235821c3655564a5a4b3d34593.1597854908.git.don.slutz@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <bfe0b9bb7b283657bc33edb7c4b425930564ca46.1597854908.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
 <34a50dc69e4c5722597e02a4df4e3da6d6586ec7.1597854907.git.don.slutz@gmail.com>
 <67b90d11eae2c88faab22d458e7e38db0f5aada4.1597854907.git.don.slutz@gmail.com>
 <c1560bc4cecae1c40de5f5cfc39832394f77c5ed.1597854907.git.don.slutz@gmail.com>
 <ce3e037dc51581629fdb158f71f8f2e9e56d9eae.1597854907.git.don.slutz@gmail.com>
 <5d2e424a19ea4934be3be962cdbe6a0ec8db9a6c.1597854907.git.don.slutz@gmail.com>
 <4780b5be94be7820861f29fb618a2420effe26f5.1597854907.git.don.slutz@gmail.com>
 <bfe0b9bb7b283657bc33edb7c4b425930564ca46.1597854908.git.don.slutz@gmail.com>
In-Reply-To: <cover.1597854907.git.don.slutz@gmail.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Don Slutz <dslutz@verizon.com>

Also added missing TRAP_DEBUG & VLAPIC.

Signed-off-by: Don Slutz <dslutz@verizon.com>
CC: Don Slutz <don.slutz@gmail.com>
---
Acked-by: Ian Campbell <ian.campbell@citrix.com>

v14:
  Reworked to current code.
  Added VMPORT_SEND because I wanted to see it during testing.

v13:
    Please do this by extending the existing infrastructure rather
    than special-casing 7 on the side.  (i.e. extend ND to take 7
    parameters, and introduce HVMTRACE_7D)
    = { d1, d2, d3, d4, d5, d6, d7 } will be far shorter, linewise.

v12:
  Switch VMPORT_IGNORED to port, regs->_eax.

v11:
  No change

v10:
  Added Acked-by: Ian Campbell
  Added back in the trace point calls.

    Why is cmd in this patch?
      Because the trace points use it.

v9:
  Dropped unneed VMPORT_UNHANDLED, VMPORT_DECODE.

v7:
      Dropped some of the new traces.
      Added HVMTRACE_ND7.

v6:
      Dropped the attempt to use svm_nextrip_insn_length via
      __get_instruction_length (added in v2).  Just always look
      at upto 15 bytes on AMD.

v5:
      exitinfo1 is used twice.
        Fixed.

 tools/xentrace/formats           |  6 ++++
 xen/arch/x86/hvm/ioreq.c         |  3 ++
 xen/arch/x86/hvm/svm/svm.c       |  6 ++--
 xen/arch/x86/hvm/vmware/vmport.c | 16 +++++++++--
 xen/arch/x86/hvm/vmx/vmx.c       |  6 ++--
 xen/include/asm-x86/hvm/trace.h  | 60 ++++++++++++++++++++--------------------
 xen/include/public/trace.h       |  4 +++
 7 files changed, 62 insertions(+), 39 deletions(-)

diff --git a/tools/xentrace/formats b/tools/xentrace/formats
index deac4d8..9e7056c 100644
--- a/tools/xentrace/formats
+++ b/tools/xentrace/formats
@@ -132,6 +132,12 @@
 0x00082020  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  INTR_WINDOW [ value = 0x%(1)08x ]
 0x00082021  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  NPF         [ gpa = 0x%(2)08x%(1)08x mfn = 0x%(4)08x%(3)08x qual = 0x%(5)04x p2mt = 0x%(6)04x ]
 0x00082023  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  TRAP        [ vector = 0x%(1)02x ]
+0x00082024  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  TRAP_DEBUG  [ exit_qualification = 0x%(1)08x ]
+0x00082025  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VLAPIC
+0x00082028  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMPORT_HANDLED   [ cmd = %(1)d eax = 0x%(2)08x ebx = 0x%(3)08x ecx = 0x%(4)08x edx = 0x%(5)08x esi = 0x%(6)08x edi = 0x%(7)08x ]
+0x00082029  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMPORT_IGNORED   [ port = %(1)d eax = 0x%(2)08x ]
+0x0008202a  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMPORT_QEMU      [ eax = 0x%(1)08x ebx = 0x%(2)08x ecx = 0x%(3)08x edx = 0x%(4)08x esi = 0x%(5)08x edi = 0x%(6)08x ]
+0x0008202b  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  VMPORT_SEND      [ cmd = 0x%(1)08x ebx = 0x%(2)08x ecx = 0x%(3)08x edx = 0x%(4)08x esi = 0x%(5)08x edi = 0x%(6)08x ]
 
 0x0010f001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_grant_map      [ domid = %(1)d ]
 0x0010f002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  page_grant_unmap    [ domid = %(1)d ]
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index a5d124e..c64fda8 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -262,6 +262,9 @@ bool handle_hvm_io_completion(struct vcpu *v)
                 regs->edx = vr->edx;
                 regs->esi = vr->esi;
                 regs->edi = vr->edi;
+                HVMTRACE_ND(VMPORT_QEMU, 0, 1/*cycles*/, 6,
+                            vio->io_req.data, regs->ebx, regs->ecx,
+                            regs->edx, regs->esi, regs->edi, 0);
             }
         }
         return handle_pio(vio->io_req.addr, vio->io_req.size,
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index ca3bbfc..60c030a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1052,7 +1052,7 @@ void svm_vmenter_helper(const struct cpu_user_regs *regs)
     if ( unlikely(tb_init_done) )
         HVMTRACE_ND(VMENTRY,
                     nestedhvm_vcpu_in_guestmode(curr) ? TRC_HVM_NESTEDFLAG : 0,
-                    1/*cycles*/, 0, 0, 0, 0, 0, 0, 0);
+                    1/*cycles*/, 0, 0, 0, 0, 0, 0, 0, 0);
 
     svm_sync_vmcb(curr, vmcb_needs_vmsave);
 
@@ -2531,11 +2531,11 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     if ( hvm_long_mode_active(v) )
         HVMTRACE_ND(VMEXIT64, vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0,
                     1/*cycles*/, 3, exit_reason,
-                    regs->eip, regs->rip >> 32, 0, 0, 0);
+                    regs->eip, regs->rip >> 32, 0, 0, 0, 0);
     else
         HVMTRACE_ND(VMEXIT, vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0,
                     1/*cycles*/, 2, exit_reason,
-                    regs->eip, 0, 0, 0, 0);
+                    regs->eip, 0, 0, 0, 0, 0);
 
     if ( vcpu_guestmode )
     {
diff --git a/xen/arch/x86/hvm/vmware/vmport.c b/xen/arch/x86/hvm/vmware/vmport.c
index 3c2e7d5..0467aff 100644
--- a/xen/arch/x86/hvm/vmware/vmport.c
+++ b/xen/arch/x86/hvm/vmware/vmport.c
@@ -17,6 +17,7 @@
 #include <asm/mc146818rtc.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/support.h>
+#include <asm/hvm/trace.h>
 
 #include "backdoor_def.h"
 
@@ -62,6 +63,7 @@ static int vmport_ioport(int dir, uint32_t port, uint32_t bytes, uint32_t *val)
     if ( port == BDOOR_PORT && regs->eax == BDOOR_MAGIC )
     {
         uint32_t new_eax = ~0u;
+        uint16_t cmd = regs->ecx;
         uint64_t value;
         struct vcpu *curr = current;
         struct domain *currd = curr->domain;
@@ -72,7 +74,7 @@ static int vmport_ioport(int dir, uint32_t port, uint32_t bytes, uint32_t *val)
          * leaving the high 32-bits unchanged, unlike what one would
          * expect to happen.
          */
-        switch ( regs->ecx & 0xffff )
+        switch ( cmd )
         {
         case BDOOR_CMD_GETMHZ:
             new_eax = currd->arch.tsc_khz / 1000;
@@ -147,14 +149,22 @@ static int vmport_ioport(int dir, uint32_t port, uint32_t bytes, uint32_t *val)
             break;
 
         default:
+            HVMTRACE_6D(VMPORT_SEND, cmd, regs->ebx, regs->ecx,
+                        regs->edx, regs->esi, regs->edi);
             /* Let backing DM handle */
             return X86EMUL_UNHANDLEABLE;
         }
+        HVMTRACE_7D(VMPORT_HANDLED, cmd, new_eax, regs->ebx, regs->ecx,
+                    regs->edx, regs->esi, regs->edi);
         if ( dir == IOREQ_READ )
             *val = new_eax;
     }
-    else if ( dir == IOREQ_READ )
-        *val = ~0u;
+    else
+    {
+        HVMTRACE_2D(VMPORT_IGNORED, port, regs->eax);
+        if ( dir == IOREQ_READ )
+            *val = ~0u;
+    }
 
     return X86EMUL_OKAY;
 }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a0d58ff..8cba2a3 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3683,10 +3683,10 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
     if ( hvm_long_mode_active(v) )
         HVMTRACE_ND(VMEXIT64, 0, 1/*cycles*/, 3, exit_reason,
-                    regs->eip, regs->rip >> 32, 0, 0, 0);
+                    regs->eip, regs->rip >> 32, 0, 0, 0, 0);
     else
         HVMTRACE_ND(VMEXIT, 0, 1/*cycles*/, 2, exit_reason,
-                    regs->eip, 0, 0, 0, 0);
+                    regs->eip, 0, 0, 0, 0, 0);
 
     perfc_incra(vmexits, exit_reason);
 
@@ -4463,7 +4463,7 @@ bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
     if ( unlikely(curr->arch.hvm.vmx.lbr_flags & LBR_FIXUP_MASK) )
         lbr_fixup();
 
-    HVMTRACE_ND(VMENTRY, 0, 1/*cycles*/, 0, 0, 0, 0, 0, 0, 0);
+    HVMTRACE_ND(VMENTRY, 0, 1/*cycles*/, 0, 0, 0, 0, 0, 0, 0, 0);
 
     __vmwrite(GUEST_RIP,    regs->rip);
     __vmwrite(GUEST_RSP,    regs->rsp);
diff --git a/xen/include/asm-x86/hvm/trace.h b/xen/include/asm-x86/hvm/trace.h
index 5cd459b..9d7f04e 100644
--- a/xen/include/asm-x86/hvm/trace.h
+++ b/xen/include/asm-x86/hvm/trace.h
@@ -56,6 +56,10 @@
 #define DO_TRC_HVM_TRAP             DEFAULT_HVM_MISC
 #define DO_TRC_HVM_TRAP_DEBUG       DEFAULT_HVM_MISC
 #define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC
+#define DO_TRC_HVM_VMPORT_HANDLED   DEFAULT_HVM_IO
+#define DO_TRC_HVM_VMPORT_IGNORED   DEFAULT_HVM_IO
+#define DO_TRC_HVM_VMPORT_QEMU      DEFAULT_HVM_IO
+#define DO_TRC_HVM_VMPORT_SEND      DEFAULT_HVM_IO
 
 
 #define TRC_PAR_LONG(par) ((par)&0xFFFFFFFF),((par)>>32)
@@ -67,38 +71,34 @@
 #define TRACE_2_LONG_4D(_e, d1, d2, d3, d4, ...) \
     TRACE_6D(_e, d1, d2, d3, d4)
 
-#define HVMTRACE_ND(evt, modifier, cycles, count, d1, d2, d3, d4, d5, d6) \
-    do {                                                                  \
-        if ( unlikely(tb_init_done) && DO_TRC_HVM_ ## evt )               \
-        {                                                                 \
-            struct {                                                      \
-                u32 d[6];                                                 \
-            } _d;                                                         \
-            _d.d[0]=(d1);                                                 \
-            _d.d[1]=(d2);                                                 \
-            _d.d[2]=(d3);                                                 \
-            _d.d[3]=(d4);                                                 \
-            _d.d[4]=(d5);                                                 \
-            _d.d[5]=(d6);                                                 \
-            __trace_var(TRC_HVM_ ## evt | (modifier), cycles,             \
-                        sizeof(*_d.d) * count, &_d);                      \
-        }                                                                 \
+#define HVMTRACE_ND(evt, modifier, cycles, count, d1, d2, d3, d4, d5, d6, d7) \
+    do {                                                                      \
+        if ( unlikely(tb_init_done) && DO_TRC_HVM_ ## evt )                   \
+        {                                                                     \
+            struct {                                                          \
+                u32 d[7];                                                     \
+            } _d = { { d1, d2, d3, d4, d5, d6, d7 } };                        \
+            __trace_var(TRC_HVM_ ## evt | (modifier), cycles,                 \
+                        sizeof(*_d.d) * count, &_d);                          \
+        }                                                                     \
     } while(0)
 
-#define HVMTRACE_6D(evt, d1, d2, d3, d4, d5, d6)    \
-    HVMTRACE_ND(evt, 0, 0, 6, d1, d2, d3, d4, d5, d6)
-#define HVMTRACE_5D(evt, d1, d2, d3, d4, d5)        \
-    HVMTRACE_ND(evt, 0, 0, 5, d1, d2, d3, d4, d5,  0)
-#define HVMTRACE_4D(evt, d1, d2, d3, d4)            \
-    HVMTRACE_ND(evt, 0, 0, 4, d1, d2, d3, d4,  0,  0)
-#define HVMTRACE_3D(evt, d1, d2, d3)                \
-    HVMTRACE_ND(evt, 0, 0, 3, d1, d2, d3,  0,  0,  0)
-#define HVMTRACE_2D(evt, d1, d2)                    \
-    HVMTRACE_ND(evt, 0, 0, 2, d1, d2,  0,  0,  0,  0)
-#define HVMTRACE_1D(evt, d1)                        \
-    HVMTRACE_ND(evt, 0, 0, 1, d1,  0,  0,  0,  0,  0)
-#define HVMTRACE_0D(evt)                            \
-    HVMTRACE_ND(evt, 0, 0, 0,  0,  0,  0,  0,  0,  0)
+#define HVMTRACE_7D(evt, d1, d2, d3, d4, d5, d6, d7) \
+    HVMTRACE_ND(evt, 0, 0, 7, d1, d2, d3, d4, d5, d6, d7)
+#define HVMTRACE_6D(evt, d1, d2, d3, d4, d5, d6)     \
+    HVMTRACE_ND(evt, 0, 0, 6, d1, d2, d3, d4, d5, d6, 0)
+#define HVMTRACE_5D(evt, d1, d2, d3, d4, d5)         \
+    HVMTRACE_ND(evt, 0, 0, 5, d1, d2, d3, d4, d5,  0, 0)
+#define HVMTRACE_4D(evt, d1, d2, d3, d4)             \
+    HVMTRACE_ND(evt, 0, 0, 4, d1, d2, d3, d4,  0,  0, 0)
+#define HVMTRACE_3D(evt, d1, d2, d3)                 \
+    HVMTRACE_ND(evt, 0, 0, 3, d1, d2, d3,  0,  0,  0, 0)
+#define HVMTRACE_2D(evt, d1, d2)                     \
+    HVMTRACE_ND(evt, 0, 0, 2, d1, d2,  0,  0,  0,  0, 0)
+#define HVMTRACE_1D(evt, d1)                         \
+    HVMTRACE_ND(evt, 0, 0, 1, d1,  0,  0,  0,  0,  0, 0)
+#define HVMTRACE_0D(evt)                             \
+    HVMTRACE_ND(evt, 0, 0, 0,  0,  0,  0,  0,  0,  0, 0)
 
 #define HVMTRACE_LONG_1D(evt, d1)                  \
                    HVMTRACE_2D(evt ## 64, (d1) & 0xFFFFFFFF, (d1) >> 32)
diff --git a/xen/include/public/trace.h b/xen/include/public/trace.h
index d5fa4ae..6b93f62 100644
--- a/xen/include/public/trace.h
+++ b/xen/include/public/trace.h
@@ -237,6 +237,10 @@
 #define TRC_HVM_VLAPIC           (TRC_HVM_HANDLER + 0x25)
 #define TRC_HVM_XCR_READ64      (TRC_HVM_HANDLER + TRC_64_FLAG + 0x26)
 #define TRC_HVM_XCR_WRITE64     (TRC_HVM_HANDLER + TRC_64_FLAG + 0x27)
+#define TRC_HVM_VMPORT_HANDLED  (TRC_HVM_HANDLER + 0x28)
+#define TRC_HVM_VMPORT_IGNORED  (TRC_HVM_HANDLER + 0x29)
+#define TRC_HVM_VMPORT_QEMU     (TRC_HVM_HANDLER + 0x2a)
+#define TRC_HVM_VMPORT_SEND     (TRC_HVM_HANDLER + 0x2b)
 
 #define TRC_HVM_IOPORT_WRITE    (TRC_HVM_HANDLER + 0x216)
 #define TRC_HVM_IOMEM_WRITE     (TRC_HVM_HANDLER + 0x217)
-- 
1.8.3.1


