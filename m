Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDC079DC9E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 01:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600819.936630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgChJ-0000Qd-NC; Tue, 12 Sep 2023 23:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600819.936630; Tue, 12 Sep 2023 23:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgChJ-0000Op-K1; Tue, 12 Sep 2023 23:21:33 +0000
Received: by outflank-mailman (input) for mailman id 600819;
 Tue, 12 Sep 2023 23:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qLIb=E4=citrix.com=prvs=612d1dac3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgChH-0008LM-Ou
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 23:21:31 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a55f0f5-51c3-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 01:21:30 +0200 (CEST)
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
X-Inumbo-ID: 1a55f0f5-51c3-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694560889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=phPA3tnKIFy3A0mEPKxsnBzaUvqhIfnN1XY0+oKtm6Y=;
  b=YyKbNGbJdxnOrTIrKWg2aBcYeGSyQbUJ7aWE1pKb2vPXYY1JL4mOvWrG
   lqXuUagEn06WwXs/Sl/jZNumezLPFi9dyJEf8ZmQF2OovVKfdpO3iux4k
   cYTa32LtWEnKn55Jp4P5KXLTjq95crqkC9R1nMmhTDXj8E0ZC82dP3/IF
   Q=;
X-CSE-ConnectionGUID: 77hly/MbRSyZrodrhAl29Q==
X-CSE-MsgGUID: EjBfDZonQZG3XVVjx5Cd6A==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 122460588
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ucl286NgZscUsyrvrR2Nl8FynXyQoLVcMsEvi/4bfWQNrUoqhDcAy
 jQXWW2EMviCNmehed52b4u3pB8PuJbTzIM3Hgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/jrRC9H5qyo42tJ5wZmOJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rkoAWVfs
 tkSEgscXAqEi/i26bbhG9A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQH5kLxhvI9
 goq+UzUADsUGO6YzwO33SmcuNHNjX7QVNw7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebT4r0
 FiJ2dDgAzMps6e9RneU97PSpjS3URX5NkdbO3VCF1FcpYC+/sdq1Emnostf/LCd0YL1HSC35
 jqwlzkMnbIfl84i0//qxAWS696znaThQgkw7wTRe2uq6AJleYKoD7CVBUjnAeVod9jAEATY1
 JQQs43Htb1VU8nR/MCYaL9VdIxF8cppJ9E1bbRHO5A6vwqg9He4FWy7yGEvfRw5WirolNKAX
 aMyhe+zzMUDVJdJRfUtC25UNyjN5fG6fekJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yXCpHVf85kWPrGr51PVoXKscWnz+7eHwG507/jer2iIC9Gd/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnC/zGLnFnhTdSJTLcmv+6RqmhurflIO9JcJV6WAntvMuuVNw8xoqws/1
 ijkBBQAmAOh3SyvxMfjQikLVY4DlK1X9RoTVRHA937xs5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:AoxiXKAVwZLgQm/lHela55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZImPHrP4gr5N0tOpTntAse9qDbnhPxICOoqTNCftWvdyQiVxehZhOOP/9SjIVyaygc078
 xdmsNFebnN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-Talos-CUID: 9a23:2w4zKWNZ9amRyO5DB3Zn8F9TP8ofSWzv1nDcOU+RDTw4cejA
X-Talos-MUID: 9a23:d4hB1AmrzLyBJmFvZ6a0dnpPNu1mz5apDnk/vs42hfeGJXFbN2m02WE=
X-IronPort-AV: E=Sophos;i="6.02,141,1688443200"; 
   d="scan'208";a="122460588"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 5/5] x86/pv: Rewrite %dr6 handling
Date: Wed, 13 Sep 2023 00:21:13 +0100
Message-ID: <20230912232113.402347-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230912232113.402347-1-andrew.cooper3@citrix.com>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All #DB exceptions result in an update of %dr6, but this isn't handled
properly by Xen for any guest type.

To start with, add a new pending_dbg field to x86_event, sharing storage with
cr2, and using the Intel VMCS PENDING_DBG semantics.  Also introduce a
pv_inject_DB() wrapper use this field nicely.

Remove all ad-hoc dr6 handling, leaving it to pv_inject_event() in most cases
and using the new x86_merge_dr6() helper.

In do_debug(), adjust dr6 manually only when a debugger is attached.  This
maintains the old behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/include/asm/domain.h      | 12 ++++++++++++
 xen/arch/x86/pv/emul-priv-op.c         |  5 +----
 xen/arch/x86/pv/emulate.c              |  6 ++----
 xen/arch/x86/pv/ro-page-fault.c        |  4 ++--
 xen/arch/x86/pv/traps.c                | 17 +++++++++++++----
 xen/arch/x86/traps.c                   | 12 +++++++-----
 xen/arch/x86/x86_emulate/x86_emulate.h |  5 ++++-
 7 files changed, 41 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index c2d9fc333be5..5bf488437ce1 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -729,6 +729,18 @@ static inline void pv_inject_hw_exception(unsigned int vector, int errcode)
     pv_inject_event(&event);
 }
 
+static inline void pv_inject_DB(unsigned long pending_dbg)
+{
+    struct x86_event event = {
+        .vector      = X86_EXC_DB,
+        .type        = X86_EVENTTYPE_HW_EXCEPTION,
+        .error_code  = X86_EVENT_NO_EC,
+        .pending_dbg = pending_dbg,
+    };
+
+    pv_inject_event(&event);
+}
+
 static inline void pv_inject_page_fault(int errcode, unsigned long cr2)
 {
     const struct x86_event event = {
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 6963db35c960..437172ee0fc3 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1365,10 +1365,7 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
         ASSERT(!curr->arch.pv.trap_bounce.flags);
 
         if ( ctxt.ctxt.retire.pending_dbg )
-        {
-            curr->arch.dr6 |= ctxt.ctxt.retire.pending_dbg | DR_STATUS_RESERVED_ONE;
-            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
-        }
+            pv_inject_DB(ctxt.ctxt.retire.pending_dbg);
 
         /* fall through */
     case X86EMUL_RETRY:
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index e7a1c0a2cc4f..e522e58533f1 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -71,11 +71,9 @@ void pv_emul_instruction_done(struct cpu_user_regs *regs, unsigned long rip)
 {
     regs->rip = rip;
     regs->eflags &= ~X86_EFLAGS_RF;
+
     if ( regs->eflags & X86_EFLAGS_TF )
-    {
-        current->arch.dr6 |= DR_STEP | DR_STATUS_RESERVED_ONE;
-        pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
-    }
+        pv_inject_DB(X86_DR6_BS);
 }
 
 uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index cad28ef928ad..f6bb33556e72 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -389,8 +389,8 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
 
         /* Fallthrough */
     case X86EMUL_OKAY:
-        if ( ctxt.retire.singlestep )
-            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+        if ( ctxt.retire.pending_dbg )
+            pv_inject_DB(ctxt.retire.pending_dbg);
 
         /* Fallthrough */
     case X86EMUL_RETRY:
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 74f333da7e1c..553b04bca956 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -13,6 +13,7 @@
 #include <xen/softirq.h>
 
 #include <asm/pv/trace.h>
+#include <asm/debugreg.h>
 #include <asm/shared.h>
 #include <asm/traps.h>
 #include <irq_vectors.h>
@@ -50,9 +51,9 @@ void pv_inject_event(const struct x86_event *event)
     tb->cs    = ti->cs;
     tb->eip   = ti->address;
 
-    if ( event->type == X86_EVENTTYPE_HW_EXCEPTION &&
-         vector == X86_EXC_PF )
+    switch ( vector | -(event->type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
+    case X86_EXC_PF:
         curr->arch.pv.ctrlreg[2] = event->cr2;
         arch_set_cr2(curr, event->cr2);
 
@@ -62,9 +63,17 @@ void pv_inject_event(const struct x86_event *event)
             error_code |= PFEC_user_mode;
 
         trace_pv_page_fault(event->cr2, error_code);
-    }
-    else
+        break;
+
+    case X86_EXC_DB:
+        curr->arch.dr6 = x86_merge_dr6(curr->domain->arch.cpu_policy,
+                                       curr->arch.dr6, event->pending_dbg);
+        /* Fallthrough */
+
+    default:
         trace_pv_trap(vector, regs->rip, use_error_code, error_code);
+        break;
+    }
 
     if ( use_error_code )
     {
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index dead728ce329..ae5d73abf557 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1887,7 +1887,7 @@ void do_device_not_available(struct cpu_user_regs *regs)
 /* SAF-1-safe */
 void do_debug(struct cpu_user_regs *regs)
 {
-    unsigned long dr6;
+    unsigned long dr6, pending_dbg;
     struct vcpu *v = current;
 
     /* Stash dr6 as early as possible. */
@@ -1997,17 +1997,19 @@ void do_debug(struct cpu_user_regs *regs)
         return;
     }
 
-    /* Save debug status register where guest OS can peek at it */
-    v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
-    v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
+    /* Flip dr6 to have positive polarity. */
+    pending_dbg = dr6 ^ X86_DR6_DEFAULT;
 
     if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
     {
+        /* Save debug status register where gdbsx can peek at it */
+        v->arch.dr6 = x86_merge_dr6(v->domain->arch.cpu_policy,
+                                    v->arch.dr6, pending_dbg);
         domain_pause_for_debugger();
         return;
     }
 
-    pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+    pv_inject_DB(pending_dbg);
 }
 
 /* SAF-1-safe */
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index f0e74d23c378..81f99dfaa02f 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -78,7 +78,10 @@ struct x86_event {
     uint8_t       type;         /* X86_EVENTTYPE_* */
     uint8_t       insn_len;     /* Instruction length */
     int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
-    unsigned long cr2;          /* Only for X86_EXC_PF h/w exception */
+    union {
+        unsigned long cr2;         /* #PF */
+        unsigned long pending_dbg; /* #DB (new DR6 bits, positive polarity) */
+    };
 };
 
 /*
-- 
2.30.2


