Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611A9A5D174
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909297.1316286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uC-0000Zp-OC; Tue, 11 Mar 2025 21:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909297.1316286; Tue, 11 Mar 2025 21:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uC-0000XP-KR; Tue, 11 Mar 2025 21:12:52 +0000
Received: by outflank-mailman (input) for mailman id 909297;
 Tue, 11 Mar 2025 21:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts6uB-0008Uq-D9
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:12:51 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96d77c12-febd-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 22:12:50 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so2403710f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 14:12:50 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfba9sm19480872f8f.39.2025.03.11.14.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 14:12:49 -0700 (PDT)
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
X-Inumbo-ID: 96d77c12-febd-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741727570; x=1742332370; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiR2XpbypvshRbRNfBioPM8wWuD1cIjIcqBLxXLhlGE=;
        b=ea4HZ0jUAA8Hr1Yq+ZGyUuuGbpQTfF1+rCRj800IzG+er75qgHhpkGEGVsnozSE/lj
         NyypmMXtPaTJZx2hflmhF9MbdoNmR4KQOLqrxxrWjYaLLoxATSo3xRGdcS0kS2cTyKdq
         3NyvYoscqhwjnURCciJJ4hFGUjrbq+/JAt2q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741727570; x=1742332370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiR2XpbypvshRbRNfBioPM8wWuD1cIjIcqBLxXLhlGE=;
        b=Q1bW4lWxFkdpoxZmtNg/+SM1e2FmT5fKnRn/mwSl57MC4hhpnntJ8gkzf8S8o3QbFC
         SV8DJqtypswc+7GLEsfeqw8qplryBs/NxiwC/pwvNLGNx4rzuPsWQVMsJ3YCxFtwjSF3
         DOIZvfETXe2V3xzlJQXTLi5qx8TuazONDSIjaQhwdLW8LOslsyXYHx9oI3pH4/YFFpCa
         rT8T3T+UvN2xaeJ01S8iNQzO8CJhejJYL2OfeXnQaDbFxE1iPj1/qYvu9Znyr5KAFaXk
         1r9TQKvhNLX13ciIU1wKFsr3bcFMj3FHPfyPUD0A2ndm9tDHXCQN9dxvf8OA8CHNn/F1
         GHjQ==
X-Gm-Message-State: AOJu0Yz2gf/7EduHmTPhbdgP6VbF2rYeMElie/lEZMkqWp2I6+hGYowB
	5ZJNs3+r767BmIBfnzSMxKcE1C0tNAsXs7wrnLQxucyMphF0L4BcmZfJx3z6/CHza8iNYmdMgRJ
	g
X-Gm-Gg: ASbGncs88ew1grFNlcQY25wSNXU0+JI1JJ+OL3ZIA+7WXxxTBjhHRY/jV5t6373WhIf
	znT3D3a/1pCXX6fNS9gy2oL9S7ZAF5X5ec9xh5xSnzSH0BbAbb6QSgv3yWFsGR5KjXOU88SqS/K
	yIbNmK6aU2CiGUSdagKcJ9DP3N9V6AFBCCkFCvv8YK6CKEY5Ci/n+PB00DPVoYRPxwSXsI509tt
	Y46FaczlwZR04CgTBre9UAmAPF1Q+eiE+gXhExPXb84eOCNq61ScunwUHypysvAp3t/Ghoekw29
	Q4fGDRJwA7m98xslYmdPbIVUjIfZwjLhlakyDaCg8sHBdnCnGKAxjYrdDcno9ZSlngc4orY5weR
	fUS0uZXEbENC5sJJRvxqd5IBvSRodsbKLqr0=
X-Google-Smtp-Source: AGHT+IEksX+aXkXkg07Um+9mSO9nX2sNvAhlsA7pWNcI+p2ZNrCqDLY4p05fIO2bIMnjr9gY6I/uEg==
X-Received: by 2002:a5d:64aa:0:b0:390:e853:85bd with SMTP id ffacd0b85a97d-39132db1108mr16961540f8f.48.1741727569762;
        Tue, 11 Mar 2025 14:12:49 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/8] x86/traps: Avoid OoB accesses to print the data selectors
Date: Tue, 11 Mar 2025 21:10:38 +0000
Message-Id: <20250311211043.3629696-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

_show_registers() prints the data selectors from struct cpu_user_regs, but
these fields are sometimes out-of-bounds.  See commit 6065a05adf15
("x86/traps: 'Fix' safety of read_registers() in #DF path").

There are 3 callers of _show_registers():

 1. vcpu_show_registers(), which always operates on a scheduled-out vCPU,
    where v->arch.user_regs (or aux_regs on the stack) is always in-bounds.

 2. show_registers() where regs is always an on-stack frame.  regs is copied
    into a local variable first (which is an OoB read for constructs such as
    WARN()), before being modified (so no OoB write).

 3. do_double_fault(), where regs is adjacent to the stack guard page, and
    written into directly.  This is an out of bounds read and write, with a
    bodge to avoid the writes hitting the guard page.

Include the data segment selectors in struct extra_state, and use those fields
instead of the fields in regs.  This resolves the OoB write on the #DF path.

Resolve the OoB read in show_registers() by doing a partial memcpy() rather
than full structure copy.  This is temporary until we've finished untangling
the vm86 fields fully.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_64/traps.c | 39 +++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index 01b4f0623282..23622cdb1440 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -27,6 +27,7 @@ struct extra_state
 {
     unsigned long cr0, cr2, cr3, cr4;
     unsigned long fsb, gsb, gss;
+    uint16_t ds, es, fs, gs;
 };
 
 static void print_xen_info(void)
@@ -40,18 +41,21 @@ static void print_xen_info(void)
 
 enum context { CTXT_hypervisor, CTXT_pv_guest, CTXT_hvm_guest };
 
-static void read_registers(struct cpu_user_regs *regs, struct extra_state *state)
+static void read_registers(struct extra_state *state)
 {
     state->cr0 = read_cr0();
     state->cr2 = read_cr2();
     state->cr3 = read_cr3();
     state->cr4 = read_cr4();
 
-    read_sregs(regs);
-
     state->fsb = read_fs_base();
     state->gsb = read_gs_base();
     state->gss = read_gs_shadow();
+
+    asm ( "mov %%ds, %0" : "=m" (state->ds) );
+    asm ( "mov %%es, %0" : "=m" (state->es) );
+    asm ( "mov %%fs, %0" : "=m" (state->fs) );
+    asm ( "mov %%gs, %0" : "=m" (state->gs) );
 }
 
 static void get_hvm_registers(struct vcpu *v, struct cpu_user_regs *regs,
@@ -68,17 +72,17 @@ static void get_hvm_registers(struct vcpu *v, struct cpu_user_regs *regs,
     regs->cs = sreg.sel;
 
     hvm_get_segment_register(v, x86_seg_ds, &sreg);
-    regs->ds = sreg.sel;
+    state->ds = sreg.sel;
 
     hvm_get_segment_register(v, x86_seg_es, &sreg);
-    regs->es = sreg.sel;
+    state->es = sreg.sel;
 
     hvm_get_segment_register(v, x86_seg_fs, &sreg);
-    regs->fs = sreg.sel;
+    state->fs = sreg.sel;
     state->fsb = sreg.base;
 
     hvm_get_segment_register(v, x86_seg_gs, &sreg);
-    regs->gs = sreg.sel;
+    state->gs = sreg.sel;
     state->gsb = sreg.base;
 
     hvm_get_segment_register(v, x86_seg_ss, &sreg);
@@ -124,17 +128,23 @@ static void _show_registers(
            state->fsb, state->gsb, state->gss);
     printk("ds: %04x   es: %04x   fs: %04x   gs: %04x   "
            "ss: %04x   cs: %04x\n",
-           regs->ds, regs->es, regs->fs,
-           regs->gs, regs->ss, regs->cs);
+           state->ds, state->es, state->fs,
+           state->gs, regs->ss, regs->cs);
 }
 
 void show_registers(const struct cpu_user_regs *regs)
 {
-    struct cpu_user_regs fault_regs = *regs;
+    struct cpu_user_regs fault_regs;
     struct extra_state fault_state;
     enum context context;
     struct vcpu *v = system_state >= SYS_STATE_smp_boot ? current : NULL;
 
+    /*
+     * Don't read beyond the end of the hardware frame.  It is out of bounds
+     * for WARN()/etc.
+     */
+    memcpy(&fault_regs, regs, offsetof(struct cpu_user_regs, es));
+
     if ( guest_mode(regs) && is_hvm_vcpu(v) )
     {
         get_hvm_registers(v, &fault_regs, &fault_state);
@@ -142,7 +152,7 @@ void show_registers(const struct cpu_user_regs *regs)
     }
     else
     {
-        read_registers(&fault_regs, &fault_state);
+        read_registers(&fault_state);
 
         if ( guest_mode(regs) )
         {
@@ -209,6 +219,11 @@ void vcpu_show_registers(struct vcpu *v)
         state.gsb = gsb;
         state.gss = gss;
 
+        state.ds = v->arch.user_regs.ds;
+        state.es = v->arch.user_regs.es;
+        state.fs = v->arch.user_regs.fs;
+        state.gs = v->arch.user_regs.gs;
+
         context = CTXT_pv_guest;
     }
 
@@ -291,7 +306,7 @@ void asmlinkage do_double_fault(struct cpu_user_regs *regs)
     printk("*** DOUBLE FAULT ***\n");
     print_xen_info();
 
-    read_registers(regs, &state);
+    read_registers(&state);
 
     printk("CPU:    %d\n", cpu);
     _show_registers(regs, &state, CTXT_hypervisor, NULL);
-- 
2.39.5


