Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF1FA5D17C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909304.1316346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uJ-00025Y-4s; Tue, 11 Mar 2025 21:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909304.1316346; Tue, 11 Mar 2025 21:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uI-0001yw-TD; Tue, 11 Mar 2025 21:12:58 +0000
Received: by outflank-mailman (input) for mailman id 909304;
 Tue, 11 Mar 2025 21:12:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts6uH-0008V9-Ch
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:12:57 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99dc90dc-febd-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 22:12:55 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so7741045e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 14:12:55 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfba9sm19480872f8f.39.2025.03.11.14.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 14:12:54 -0700 (PDT)
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
X-Inumbo-ID: 99dc90dc-febd-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741727575; x=1742332375; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELTmL9+t2/EDs2TC9abOCsUNCvZ0XnggaJfjdGBA0Ow=;
        b=sv6x1b5lRPp3R5QZVsb2eTiHoCifdt1oLZv67tFOledHBnLnxCxVrw39GMMD7Gyp+u
         AopoVyeVZUb08VOF7zmgVz55dG6ekpCgIvR0KPfw+kw4QFDeoesLvZUgg1EEWWk+HnkL
         ESREkNL5DYJBjlAlYk2FhiLIde+l0jFqOcXcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741727575; x=1742332375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELTmL9+t2/EDs2TC9abOCsUNCvZ0XnggaJfjdGBA0Ow=;
        b=FNpjbWxNBFqfCe+1lm8LFc8MzLYnPpnxCYDkMTG+3zqhA3nDnRcgrVQDFp9bxhxVi4
         9X4cExC4/2ZHgX7sZEpfJqkXMfUKAzP/lfTaxwq+C4X4cOL6jsn72RKLwOyKopCntwHU
         oq90puHn8Q/F9ntvK5GvzhRwR/aBrbLJ3/r//OUJUC/odqWsEyTBeLK9VHc1fSjuvLbw
         UlrOpq/x/k385rgYKa/WK9QzUIp8Df+Xr7AA+471LcrLZvAKk6O754P8SDlZNl0BW8r9
         0bRomnjuL6XUAGMQHQrzgu9Y+RakUUogtzIz9OMNCEiqTixMPrq1Zxydo2LicvuFlZWt
         dWJA==
X-Gm-Message-State: AOJu0Yz1GfcKmUSzzFyXvAE3ARMKtOX6Tpj53CoBqU0s4RD2t85yrmdv
	DwEFAdRPyeDiZxDb9ZO1aJf451LSPBHkqEgLZK40QHW+o1v2bRj7B3RVvW+9lQF6OAkBJh38l0l
	S
X-Gm-Gg: ASbGncuh6VBUBxpYKnAq7KRxWdyBfqDWCW/HoLJ4XqjQP8mMOlp8nFnNoz8K/gwe3r3
	iyyR8WEZDkVZ3yQxe9GfbXD1vXKGQy/ZSkqfgervWr+GtIsc1NASrqUX28EooGfCVw6URvWiJTZ
	yMQvmfV0kcrTffPS2B3bN2xmMTdUXAPYIElB+5hDs3uwKPEKosAUEiCnsfmCFiYBGzwtZ1W+XtQ
	/PoUqh7VrUJ19QHvKl77vVwjYqpYo6muV9Q7b4d2iyPUZbwzGlFVwlIJl268af8WTpQwQEGkWGx
	TGju4R+XhVjPm4mQy3DAmDFRMpOIZi1+YNbRH2H6meEBgqknwRRZxL55bq0o/54MVTkaVmFg438
	qXa0Tqv7H4OFG+QoIQXyNnZfd
X-Google-Smtp-Source: AGHT+IHrlMMVED2OGhb/bvwgeOVR+uJmOwxEzLT1GTo4/e+macMG8RVTwXUyCSFe7YtaPlSC/PlVSw==
X-Received: by 2002:a5d:6d8a:0:b0:391:12a5:3cb3 with SMTP id ffacd0b85a97d-39132d2af8bmr15755406f8f.3.1741727574848;
        Tue, 11 Mar 2025 14:12:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 8/8] x86: Drop the vm86 segments selectors from struct cpu_user_regs
Date: Tue, 11 Mar 2025 21:10:43 +0000
Message-Id: <20250311211043.3629696-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The data segment registers are part of the on-stack IRET frame when
interrupting Virtual 8086 mode, but this ceased being relevant for Xen in
commit 5d1181a5ea5e ("xen: Remove x86_32 build target.") in 2012.

With all other cleanup in place, delete the fields so we can introduce FRED
support which uses this space for different data.

Everywhere which used the es field as an offset in cpu_user_regs needs
adjusting.  However, they'll change again for FRED, so no cleanup is performed
at this juncture.

This also undoes the OoB Read workaround in show_registers(), which can now
switch back to being simple structure copy.

No functional change, but a lot of rearranging of stack and struct layout
under the hood.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c                | 2 +-
 xen/arch/x86/include/asm/cpu-user-regs.h | 4 ----
 xen/arch/x86/include/asm/current.h       | 8 ++++----
 xen/arch/x86/include/asm/hvm/hvm.h       | 4 ----
 xen/arch/x86/include/asm/regs.h          | 3 +--
 xen/arch/x86/traps.c                     | 2 +-
 xen/arch/x86/x86_64/asm-offsets.c        | 2 +-
 xen/arch/x86/x86_64/traps.c              | 8 +-------
 8 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index b934ce7ca487..654f847e1f8c 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -917,7 +917,7 @@ void load_system_tables(void)
 	 * Defer checks until exception support is sufficiently set up.
 	 */
 	BUILD_BUG_ON((sizeof(struct cpu_info) -
-		      offsetof(struct cpu_info, guest_cpu_user_regs.es)) & 0xf);
+		      sizeof(struct cpu_user_regs)) & 0xf);
 	BUG_ON(system_state != SYS_STATE_early_boot && (stack_bottom & 0xf));
 }
 
diff --git a/xen/arch/x86/include/asm/cpu-user-regs.h b/xen/arch/x86/include/asm/cpu-user-regs.h
index 845b41a22ef2..c4cc8640c23f 100644
--- a/xen/arch/x86/include/asm/cpu-user-regs.h
+++ b/xen/arch/x86/include/asm/cpu-user-regs.h
@@ -55,10 +55,6 @@ struct cpu_user_regs
     DECL_REG_LO16(flags); /* rflags.IF == !saved_upcall_mask */
     DECL_REG_LO8(sp);
     uint16_t ss, _pad2[3];
-    uint16_t es, _pad3[3];
-    uint16_t ds, _pad4[3];
-    uint16_t fs, _pad5[3];
-    uint16_t gs, _pad6[3];
 };
 
 #undef DECL_REG_HI
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index 243d17ef79fd..a7c9473428b2 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -106,12 +106,12 @@ static inline struct cpu_info *get_cpu_info(void)
 #define get_per_cpu_offset()  (get_cpu_info()->per_cpu_offset)
 
 /*
- * Get the bottom-of-stack, as stored in the per-CPU TSS. This actually points
- * into the middle of cpu_info.guest_cpu_user_regs, at the section that
- * precisely corresponds to a CPU trap frame.
+ * Get the bottom-of-stack, as stored in the per-CPU TSS. This points at the
+ * end of cpu_info.guest_cpu_user_regs, at the section that precisely
+ * corresponds to a CPU trap frame.
  */
 #define get_stack_bottom()                      \
-    ((unsigned long)&get_cpu_info()->guest_cpu_user_regs.es)
+    ((unsigned long)(&get_cpu_info()->guest_cpu_user_regs + 1))
 
 /*
  * Get the reasonable stack bounds for stack traces and stack dumps.  Stack
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 963e8201130a..cde6efd7adc0 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -624,10 +624,6 @@ static inline void hvm_sanitize_regs_fields(struct cpu_user_regs *regs,
     regs->saved_upcall_mask = 0xbf;
     regs->cs = 0xbeef;
     regs->ss = 0xbeef;
-    regs->ds = 0xbeef;
-    regs->es = 0xbeef;
-    regs->fs = 0xbeef;
-    regs->gs = 0xbeef;
 #endif
 }
 
diff --git a/xen/arch/x86/include/asm/regs.h b/xen/arch/x86/include/asm/regs.h
index c05b9207c281..dcc45ac5af7f 100644
--- a/xen/arch/x86/include/asm/regs.h
+++ b/xen/arch/x86/include/asm/regs.h
@@ -20,8 +20,7 @@
     (!is_pv_32bit_vcpu(v) ? ((tb)->eip == 0) : (((tb)->cs & ~3) == 0))
 
 /* Number of bytes of on-stack execution state to be context-switched. */
-/* NB. Segment registers and bases are not saved/restored on x86/64 stack. */
-#define CTXT_SWITCH_STACK_BYTES (offsetof(struct cpu_user_regs, es))
+#define CTXT_SWITCH_STACK_BYTES sizeof(struct cpu_user_regs)
 
 #define guest_mode(r)                                                         \
 ({                                                                            \
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 5addb1f903d3..27e68285e504 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -416,7 +416,7 @@ unsigned long get_stack_trace_bottom(unsigned long sp)
     {
     case 1 ... 4:
         return ROUNDUP(sp, PAGE_SIZE) -
-            offsetof(struct cpu_user_regs, es) - sizeof(unsigned long);
+            sizeof(struct cpu_user_regs) - sizeof(unsigned long);
 
     case 6 ... 7:
         return ROUNDUP(sp, STACK_SIZE) -
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 630bdc39451d..2258b4ce1b95 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -52,7 +52,7 @@ void __dummy__(void)
     OFFSET(UREGS_eflags, struct cpu_user_regs, rflags);
     OFFSET(UREGS_rsp, struct cpu_user_regs, rsp);
     OFFSET(UREGS_ss, struct cpu_user_regs, ss);
-    OFFSET(UREGS_kernel_sizeof, struct cpu_user_regs, es);
+    DEFINE(UREGS_kernel_sizeof, sizeof(struct cpu_user_regs));
     BLANK();
 
     /*
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index cb06f99021d1..78c5b7a1e300 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -134,17 +134,11 @@ static void _show_registers(
 
 void show_registers(const struct cpu_user_regs *regs)
 {
-    struct cpu_user_regs fault_regs;
+    struct cpu_user_regs fault_regs = *regs;
     struct extra_state fault_state;
     enum context context;
     struct vcpu *v = system_state >= SYS_STATE_smp_boot ? current : NULL;
 
-    /*
-     * Don't read beyond the end of the hardware frame.  It is out of bounds
-     * for WARN()/etc.
-     */
-    memcpy(&fault_regs, regs, offsetof(struct cpu_user_regs, es));
-
     if ( guest_mode(regs) && is_hvm_vcpu(v) )
     {
         get_hvm_registers(v, &fault_regs, &fault_state);
-- 
2.39.5


