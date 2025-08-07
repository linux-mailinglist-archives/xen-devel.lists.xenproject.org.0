Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119DDB1D672
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 13:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072832.1435791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujycN-00033z-R1; Thu, 07 Aug 2025 11:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072832.1435791; Thu, 07 Aug 2025 11:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujycN-00031X-Mw; Thu, 07 Aug 2025 11:17:07 +0000
Received: by outflank-mailman (input) for mailman id 1072832;
 Thu, 07 Aug 2025 11:17:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYnK=2T=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujycL-00030Z-Tx
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 11:17:05 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bc7cd9b-7380-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 13:17:04 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-45994a72356so7051315e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 04:17:03 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5c84b8csm45456435e9.4.2025.08.07.04.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 04:17:02 -0700 (PDT)
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
X-Inumbo-ID: 0bc7cd9b-7380-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754565423; x=1755170223; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hmnpbxHbRiELs1onHAWQPq0xNtY0+GLpJxJ3yll7+U=;
        b=B5Bqf/Ep5QlNhAqZV9m7iFwVw11o2Lj+6BAoSXQnJyoE9ChEKen3WAuf/l/7fVEb4y
         +LqJ2YzmU1DV/BujzvzK2HTWELs0897QSwNmRC3AfJllHpM3FcAy6bTuIlWHpXGEoiWH
         0Vt3aZBt2BXWSe+Jqi0L94Ok1BRPitDI65HzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754565423; x=1755170223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hmnpbxHbRiELs1onHAWQPq0xNtY0+GLpJxJ3yll7+U=;
        b=f8zzinjij/7IqsWh85FDYDTNDAJpWMg5L8bBBvjAZ44gKFSIsBIrl0t8iL8o37xHPb
         tONsMGhbXAtVeOtYgtG1Fen8VXKR8bTnUEbfPxl05wDgd+e/gzE4uSuMvcAovS87Uphu
         H76bgeoHLYblUVXRmieRVGpYZnk9WAsa4Q1E4Py+0fcHyc0HNq24fb7Y3aENaljEvq8a
         xsIlSneXviT6H61Gl82JA0hVLl9IryrS7xPqlzJzfg5XS4FwiHXw1b3yGMUjnPjlneLx
         +JSKCHLDIF6I3tEP+b2ahtqwUxdBZQW43Sb//ujavscO9TzWqjOLMa8+hObZFHwfGSQ7
         d8UQ==
X-Gm-Message-State: AOJu0YwGViw4FbQUUlFmuw9gjAUea2aJ0WA9/IucRJJje0zr47jQ9H4N
	jCVRrLEQf+gbcA4UyefQ6THfzQsfEnVgi61HC/3CiCu+0PtTaX83oHmskp2elP7abkRASk7ASR7
	vKaOprvNaIQ==
X-Gm-Gg: ASbGncufMdhUagXBirJy08sQfOQr1vn0t7SBnqZifRHAm93ZQJ20LE1qm2NEf9OJn6g
	jBB91gsOf3kHnVbjL7UcEI85PeJu0SHO/t0iqhXgZrXyAyRWr9NFsxG9YtEy4Pl6IuN2SrOmgmd
	sDbSzkmRgTl+X095dWkhBk0XhvvxS6vucc9v5MN5NawmOOd88/12B31zTq3jqHcig61g/1s1xd8
	0Hzy3LLPa+vvjWkA9wymwm5m6nLQUa9oyvanmre+GowTEa9kaMnqP5J0yjRRYE63Kv0VvSDY1ZX
	F96DtsJRxe9EicKahzRqyyFQpHwoxTTEOOGhJPDYyrwbadV1oBdDZofN6QktHPNF6/eJcejLcaX
	fMPOErDXRatupdKMekaM+y6aqN6mDhm1upSdmR82xuHcXnyhim3rZ6Wv4CKhTCbTMRB4echmSUd
	LH
X-Google-Smtp-Source: AGHT+IFevs16pz+VsZb/UZMURkjLra61JgMdOci8x7oIf31U66eiK+gVeW8J+SsxN31mm6FKA6EFKg==
X-Received: by 2002:a05:600c:358b:b0:459:dd1d:2ee0 with SMTP id 5b1f17b1804b1-459ede03686mr29138935e9.0.1754565423049;
        Thu, 07 Aug 2025 04:17:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/4] x86: Drop the vm86 segments selectors from struct cpu_user_regs
Date: Thu,  7 Aug 2025 12:16:57 +0100
Message-Id: <20250807111657.201849-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250807111657.201849-1-andrew.cooper3@citrix.com>
References: <20250807111657.201849-1-andrew.cooper3@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c                | 2 +-
 xen/arch/x86/include/asm/cpu-user-regs.h | 5 -----
 xen/arch/x86/include/asm/current.h       | 8 ++++----
 xen/arch/x86/include/asm/hvm/hvm.h       | 4 ----
 xen/arch/x86/include/asm/regs.h          | 3 +--
 xen/arch/x86/traps.c                     | 2 +-
 xen/arch/x86/x86_64/asm-offsets.c        | 2 +-
 xen/arch/x86/x86_64/traps.c              | 8 +-------
 8 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index e063fe790a97..97bdda1d4a25 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -959,7 +959,7 @@ void load_system_tables(void)
 	 * Defer checks until exception support is sufficiently set up.
 	 */
 	BUILD_BUG_ON((sizeof(struct cpu_info) -
-		      offsetof(struct cpu_info, guest_cpu_user_regs.es)) & 0xf);
+		      sizeof(struct cpu_user_regs)) & 0xf);
 	BUG_ON(system_state != SYS_STATE_early_boot && (stack_bottom & 0xf));
 }
 
diff --git a/xen/arch/x86/include/asm/cpu-user-regs.h b/xen/arch/x86/include/asm/cpu-user-regs.h
index 0e78e38ed00d..d700a3ef3447 100644
--- a/xen/arch/x86/include/asm/cpu-user-regs.h
+++ b/xen/arch/x86/include/asm/cpu-user-regs.h
@@ -53,11 +53,6 @@ struct cpu_user_regs
      * For IDT delivery, tss->rsp0 points to this boundary as embedded within
      * struct cpu_info.  It must be 16-byte aligned.
      */
-
-    uint16_t es, _pad3[3];
-    uint16_t ds, _pad4[3];
-    uint16_t fs, _pad5[3];
-    uint16_t gs, _pad6[3];
 };
 
 #endif /* X86_CPU_USER_REGS_H */
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
index bf8bc2e100bd..18e40910ff71 100644
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
index ce9b028276a1..72595110e2d5 100644
--- a/xen/arch/x86/include/asm/regs.h
+++ b/xen/arch/x86/include/asm/regs.h
@@ -23,8 +23,7 @@
     (!is_pv_32bit_vcpu(v) ? ((tb)->eip == 0) : (((tb)->cs & ~3) == 0))
 
 /* Number of bytes of on-stack execution state to be context-switched. */
-/* NB. Segment registers and bases are not saved/restored on x86/64 stack. */
-#define CTXT_SWITCH_STACK_BYTES (offsetof(struct cpu_user_regs, es))
+#define CTXT_SWITCH_STACK_BYTES sizeof(struct cpu_user_regs)
 
 #define guest_mode(r)                                                         \
 ({                                                                            \
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 34dc077cad34..238d923dd188 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -387,7 +387,7 @@ unsigned long get_stack_trace_bottom(unsigned long sp)
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
index 29ac5a14ca3f..34adf55e48df 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -135,17 +135,11 @@ static void _show_registers(
 
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


