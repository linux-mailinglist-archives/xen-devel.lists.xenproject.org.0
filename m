Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEQHNvAlomnZ0AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6261BEEEF
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243138.1543134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74f-0000lR-8s; Fri, 27 Feb 2026 23:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243138.1543134; Fri, 27 Feb 2026 23:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74f-0000jq-50; Fri, 27 Feb 2026 23:16:45 +0000
Received: by outflank-mailman (input) for mailman id 1243138;
 Fri, 27 Feb 2026 23:16:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74d-0008WD-T1
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:43 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60dd154e-1432-11f1-b164-2bf370ae4941;
 Sat, 28 Feb 2026 00:16:43 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-436309f1ad7so2114584f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:43 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:40 -0800 (PST)
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
X-Inumbo-ID: 60dd154e-1432-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234202; x=1772839002; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm1+0hl5wg0cTPkZkQcfwjLCPbdvhVekwrZIT03s7DQ=;
        b=NhvaORhEENEHrYdMpzFOb00mPzdMS8s5p3eibErAyaHS4HN5cZMw0VCwtVsAfoVCUS
         FezmlqiwMN81ItFbwEasbRZTCpP7QdY5HXGERw0ZvGFlDrA39NOOpy8G0qLUmGn1WCdf
         vsr6rSX0DSuobDRlofwDyt9M2ufMohsvkWFH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234202; x=1772839002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qm1+0hl5wg0cTPkZkQcfwjLCPbdvhVekwrZIT03s7DQ=;
        b=jtbBe6sK4hUekdOHZSj7/gFRhXMsOehouPHBhHPFf7DYOVCnFV/urAr5LClLPMJdmu
         c3I6yYQ8N0NonZbel7gmPgTx0BsZIgVfi500ltLJOwig1JcUZBOKX1FHnw4Aj1v0kq7M
         rsgAUk6e3qR/U1xMiTejgkeIghFYVEmMQMHrT8GiURTpy8bFUI0noz8ShoQLj/3ex8zO
         66Zs2FxqyVARxEhvMUzkKHb0N65OyfjUIbqnqRZfHNmRUnVL64FCcy9xpOrXFCNQThP1
         0M+7YyLN0/bZMdJ4QVeY1ieaiM2kNJ69H7lzcwQ+YrAZKMAsQO39SrY87OO1FviCd/F2
         y30g==
X-Gm-Message-State: AOJu0YxWfm9Xw5aMV35qa9obqqE3HDHEVJt3OcxxxOuS2v4fIVM3GkQE
	6t2XNUXH1ME0OLfmrOOOjUldlDtmsoObosKQp/43B7PdKlw4bF58gAsQMjuXRGUAbpbVBv9cjSj
	q+BMS
X-Gm-Gg: ATEYQzwOOi0gYW1S98Cu8s0fLFST1in5LE8muKd2HEcSE0ilbhs60OlAjjc4JjQjObp
	GKx6JPoNKAgJqiX9Syk3x8ZSMK807qwS5tkHn0wie++zk9JNIx5pNedmw1Dgqgr4VvxCzH1eqle
	odeSkCUQM+wn94ktZUF9JJSeMfPpQ2zT7TYfwL2b9wpkIfWdwZADGNrKncfgjg9PMlnPlaHvvVg
	VE8iN2ydvjBKl1fgX1a6ck9BKlMzmBwOFaVFDcNEpYZSxkeSlilcX8kT70MjouHu6HKsDud+Grh
	Qp0Rx3CP3wAfYndQs8aB3t0vCIfUCd8tC2BWNzxQwy6gXhN/3CkxFH4C5ePhCXFKrqf6dR3DxyY
	PJw8VvXnw++M6RWMMZ+5m+J2Z0pTlv21J7V6okdA/m2CG7hHW2atBFq/QJxfAvO114wkmUHc3VA
	4Wm56gSxcj574NYLqxR0BPqgT5DNW4siz1zy8+r7SJkcxjYbLkWk9xECn4X6tuf1uuGUcCvdI=
X-Received: by 2002:a05:6000:2313:b0:439:84cb:288d with SMTP id ffacd0b85a97d-4399de2cb36mr7877033f8f.41.1772234201407;
        Fri, 27 Feb 2026 15:16:41 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 01/14] x86/pv: Don't assume that INT $imm8 instructions are two bytes long
Date: Fri, 27 Feb 2026 23:16:23 +0000
Message-Id: <20260227231636.3955109-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_HAS_CURRENCY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5E6261BEEEF
X-Rspamd-Action: no action

For INT $N instructions (besides $0x80 for which there is a dedicated fast
path), handling is mostly fault-based because of DPL0 gates in the IDT.  This
means that when the guest kernel allows the instruction too, Xen must
increment %rip to the end of the instruction before passing a trap to the
guest kernel.

When an INT $N instruction has a prefix, it's longer than two bytes, and Xen
will deliver the "trap" with %rip pointing into the middle of the instruction.

Introduce a new pv_emulate_sw_interrupt() which uses x86_insn_length() to
determine the instruction length, rather than assuming two.

This is a change in behaviour for PV guests, but the prior behaviour cannot
reasonably be said to be intentional.

This change does not affect the INT $0x80 fastpath.  Prefixed INT $N
instructions occur almost exclusively in test code or exploits, and INT $0x80
appears to be the only user-usable interrupt gate in contemporary PV guests.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v4:
 * New
---
 xen/arch/x86/include/asm/pv/traps.h |  2 ++
 xen/arch/x86/pv/emul-priv-op.c      | 48 +++++++++++++++++++++++++++++
 xen/arch/x86/traps.c                |  3 +-
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/pv/traps.h b/xen/arch/x86/include/asm/pv/traps.h
index 8c201190923d..16e9a8d2aa3f 100644
--- a/xen/arch/x86/include/asm/pv/traps.h
+++ b/xen/arch/x86/include/asm/pv/traps.h
@@ -17,6 +17,7 @@
 int pv_raise_nmi(struct vcpu *v);
 
 int pv_emulate_privileged_op(struct cpu_user_regs *regs);
+void pv_emulate_sw_interrupt(struct cpu_user_regs *regs);
 void pv_emulate_gate_op(struct cpu_user_regs *regs);
 bool pv_emulate_invalid_op(struct cpu_user_regs *regs);
 
@@ -31,6 +32,7 @@ static inline bool pv_trap_callback_registered(const struct vcpu *v,
 static inline int pv_raise_nmi(struct vcpu *v) { return -EOPNOTSUPP; }
 
 static inline int pv_emulate_privileged_op(struct cpu_user_regs *regs) { return 0; }
+static inline void pv_emulate_sw_interrupt(struct cpu_user_regs *regs) {}
 static inline void pv_emulate_gate_op(struct cpu_user_regs *regs) {}
 static inline bool pv_emulate_invalid_op(struct cpu_user_regs *regs) { return true; }
 
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index a3c1fd12621d..87d3bbcf901f 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -8,6 +8,7 @@
  */
 
 #include <xen/domain_page.h>
+#include <xen/err.h>
 #include <xen/event.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
@@ -1401,6 +1402,53 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
     return 0;
 }
 
+/*
+ * Hardware already decoded the INT $N instruction and determinted that there
+ * was a DPL issue, hence the #GP.  Xen has already determined that the guest
+ * kernel has permitted this software interrupt.
+ *
+ * All that is needed is the instruction length, to turn the fault into a
+ * trap.  All errors are turned back into the original #GP, as that's the
+ * action that really happened.
+ */
+void pv_emulate_sw_interrupt(struct cpu_user_regs *regs)
+{
+    struct vcpu *curr = current;
+    struct domain *currd = curr->domain;
+    struct priv_op_ctxt ctxt = {
+        .ctxt.regs = regs,
+        .ctxt.lma = !is_pv_32bit_domain(currd),
+    };
+    struct x86_emulate_state *state;
+    uint8_t vector = regs->error_code >> 3;
+    unsigned int len, ar;
+
+    if ( !pv_emul_read_descriptor(regs->cs, curr, &ctxt.cs.base,
+                                  &ctxt.cs.limit, &ar, 1) ||
+         !(ar & _SEGMENT_S) ||
+         !(ar & _SEGMENT_P) ||
+         !(ar & _SEGMENT_CODE) )
+        goto error;
+
+    state = x86_decode_insn(&ctxt.ctxt, insn_fetch);
+    if ( IS_ERR_OR_NULL(state) )
+        goto error;
+
+    len = x86_insn_length(state, &ctxt.ctxt);
+    x86_emulate_free_state(state);
+
+    /* Note: Checked slightly late to simplify 'state' handling. */
+    if ( ctxt.ctxt.opcode != 0xcd /* INT $imm8 */ )
+        goto error;
+
+    regs->rip += len;
+    pv_inject_sw_interrupt(vector);
+    return;
+
+ error:
+    pv_inject_hw_exception(X86_EXC_GP, regs->entry_vector);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 5feac88d6c0b..907fb4c186c0 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1379,8 +1379,7 @@ void do_general_protection(struct cpu_user_regs *regs)
 
         if ( permit_softint(TI_GET_DPL(ti), v, regs) )
         {
-            regs->rip += 2;
-            pv_inject_sw_interrupt(vector);
+            pv_emulate_sw_interrupt(regs);
             return;
         }
     }
-- 
2.39.5


