Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D3598A99A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 18:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807551.1219092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svJ6i-0001GS-RF; Mon, 30 Sep 2024 16:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807551.1219092; Mon, 30 Sep 2024 16:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svJ6i-0001CR-NI; Mon, 30 Sep 2024 16:18:44 +0000
Received: by outflank-mailman (input) for mailman id 807551;
 Mon, 30 Sep 2024 16:18:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Bw3=Q4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svJ6h-00019g-6Z
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 16:18:43 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a848fd9d-7f47-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 18:18:41 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d43657255so712779966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 09:18:41 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2776d83sm550760366b.43.2024.09.30.09.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 09:18:39 -0700 (PDT)
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
X-Inumbo-ID: a848fd9d-7f47-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727713120; x=1728317920; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gNq1CiPxbw6BvasIllJEVVgG1TpzbWw2PuiFCsE680=;
        b=MEIXRQD6kSFSjbRsWGCgJG0wfFdxWv6x1BdOjkM0wquKNt1AN6WSr7C58O1/JqrKXq
         X/TP7IDwPqNWvCuxJY7kiK3p5+QpCg7oU1LTpWfxixHqcORbxRFNVurafLKoXyyY/XHS
         K8pWofkce2D3zlo/ida4jhnJpbvdDw8tme/10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713120; x=1728317920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gNq1CiPxbw6BvasIllJEVVgG1TpzbWw2PuiFCsE680=;
        b=PEdiSfKl/axwm8uDHQucDpxyCrsVsXsUxFZf3ueHONr+a3aRM9GO8dbLBuoBYNWtfd
         rTEbElb0t7L6gYkupVztc0+TYjMJgRW0o+i0Z5YeTdH22Tot0B5cW6Rd1IxgdEy0/tLA
         gRonvyjFLxprW3YOk8LyjJ/Wwdxqip0G/Stjne8F6FlNbwzO4von+TG2UVeYp15AZQ0u
         OyzBc43dXpzF61Oi5x2k4cCaoxb4So+2VP+1ztxCa3rKBI2Kn48MU7Z3BzWM6RHPAVgk
         ozfsQ7f+9tFvsNEaQo/MCmqNKxUjn/3f0m99shevLmkSq+QKzIy9ofOgntzerbUIpJA1
         Wa9g==
X-Gm-Message-State: AOJu0YyDEPikHzA0iK6gJshgCXvxkGheef5yAhT5jnGb2jG5rBlcCVir
	f64tfCzQYvoLgEoRByTk59SJk2gy7dryRQBLWOdlO/lCDyUONYMxL9HrxXV3PDdQv4RfZypIfrl
	U4E4=
X-Google-Smtp-Source: AGHT+IGFsONaHL8RhvJNZdPGs/IjRVi7nzxDHvjGgE3s3eyYW3TehH+dXB2OaMJmOfI3fxkF5N613Q==
X-Received: by 2002:a17:906:730c:b0:a87:31c:c6c4 with SMTP id a640c23a62f3a-a93c490a094mr1658600466b.24.1727713120385;
        Mon, 30 Sep 2024 09:18:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] x86/pv: Rework guest_io_okay() to return X86EMUL_*
Date: Mon, 30 Sep 2024 17:18:36 +0100
Message-Id: <20240930161837.1248144-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
References: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to fix a bug with guest_io_okay() (subsequent patch), rework
guest_io_okay() to take in an emulation context, and return X86EMUL_* rather
than a boolean.

For the failing case, take the opporunity to inject #GP explicitly, rather
than returning X86EMUL_UNHANDLEABLE.  There is a logical difference between
"we know what this is, and it's #GP", vs "we don't know what this is".

There is no change in practice as emulation is the final step on general #GP
resolution, but returning X86EMUL_UNHANDLEABLE would be a latent bug if a
subsequent action were to appear.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/emul-priv-op.c | 36 ++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index b90f745c75ea..978bd6c0775f 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -156,14 +156,16 @@ static bool iopl_ok(const struct vcpu *v, const struct cpu_user_regs *regs)
 }
 
 /* Has the guest requested sufficient permission for this I/O access? */
-static bool guest_io_okay(unsigned int port, unsigned int bytes,
-                          struct vcpu *v, struct cpu_user_regs *regs)
+static int guest_io_okay(unsigned int port, unsigned int bytes,
+                         struct x86_emulate_ctxt *ctxt)
 {
+    struct cpu_user_regs *regs = ctxt->regs;
+    struct vcpu *v = current;
     /* If in user mode, switch to kernel mode just to read I/O bitmap. */
     const bool user_mode = !(v->arch.flags & TF_kernel_mode);
 
     if ( iopl_ok(v, regs) )
-        return true;
+        return X86EMUL_OKAY;
 
     if ( (port + bytes) <= v->arch.pv.iobmp_limit )
     {
@@ -190,10 +192,12 @@ static bool guest_io_okay(unsigned int port, unsigned int bytes,
             toggle_guest_pt(v);
 
         if ( (x.mask & (((1 << bytes) - 1) << (port & 7))) == 0 )
-            return true;
+            return X86EMUL_OKAY;
     }
 
-    return false;
+    x86_emul_hw_exception(X86_EXC_GP, 0, ctxt);
+
+    return X86EMUL_EXCEPTION;
 }
 
 /* Has the administrator granted sufficient permission for this I/O access? */
@@ -353,12 +357,14 @@ static int cf_check read_io(
     struct priv_op_ctxt *poc = container_of(ctxt, struct priv_op_ctxt, ctxt);
     struct vcpu *curr = current;
     struct domain *currd = current->domain;
+    int rc;
 
     /* INS must not come here. */
     ASSERT((ctxt->opcode & ~9) == 0xe4);
 
-    if ( !guest_io_okay(port, bytes, curr, ctxt->regs) )
-        return X86EMUL_UNHANDLEABLE;
+    rc = guest_io_okay(port, bytes, ctxt);
+    if ( rc != X86EMUL_OKAY )
+        return rc;
 
     poc->bpmatch = check_guest_io_breakpoint(curr, port, bytes);
 
@@ -458,12 +464,14 @@ static int cf_check write_io(
     struct priv_op_ctxt *poc = container_of(ctxt, struct priv_op_ctxt, ctxt);
     struct vcpu *curr = current;
     struct domain *currd = current->domain;
+    int rc;
 
     /* OUTS must not come here. */
     ASSERT((ctxt->opcode & ~9) == 0xe6);
 
-    if ( !guest_io_okay(port, bytes, curr, ctxt->regs) )
-        return X86EMUL_UNHANDLEABLE;
+    rc = guest_io_okay(port, bytes, ctxt);
+    if ( rc != X86EMUL_OKAY )
+        return rc;
 
     poc->bpmatch = check_guest_io_breakpoint(curr, port, bytes);
 
@@ -612,8 +620,9 @@ static int cf_check rep_ins(
 
     *reps = 0;
 
-    if ( !guest_io_okay(port, bytes_per_rep, curr, ctxt->regs) )
-        return X86EMUL_UNHANDLEABLE;
+    rc = guest_io_okay(port, bytes_per_rep, ctxt);
+    if ( rc != X86EMUL_OKAY )
+        return rc;
 
     rc = read_segment(x86_seg_es, &sreg, ctxt);
     if ( rc != X86EMUL_OKAY )
@@ -678,8 +687,9 @@ static int cf_check rep_outs(
 
     *reps = 0;
 
-    if ( !guest_io_okay(port, bytes_per_rep, curr, ctxt->regs) )
-        return X86EMUL_UNHANDLEABLE;
+    rc = guest_io_okay(port, bytes_per_rep, ctxt);
+    if ( rc != X86EMUL_OKAY )
+        return rc;
 
     rc = read_segment(seg, &sreg, ctxt);
     if ( rc != X86EMUL_OKAY )
-- 
2.39.5


