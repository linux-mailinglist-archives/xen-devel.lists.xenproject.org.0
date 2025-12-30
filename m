Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D047CE9D3F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194218.1512685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaaBJ-0007x2-Hu; Tue, 30 Dec 2025 13:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194218.1512685; Tue, 30 Dec 2025 13:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaaBJ-0007uL-DR; Tue, 30 Dec 2025 13:54:37 +0000
Received: by outflank-mailman (input) for mailman id 1194218;
 Tue, 30 Dec 2025 13:54:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vaaBH-0007RX-SB
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:54:35 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12575937-e587-11f0-b15c-2bf370ae4941;
 Tue, 30 Dec 2025 14:54:34 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42b3b0d76fcso5737414f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 05:54:34 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea226d1sm70198245f8f.13.2025.12.30.05.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 05:54:32 -0800 (PST)
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
X-Inumbo-ID: 12575937-e587-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767102873; x=1767707673; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MN4BFE0zEOL3BVNw4e4DwpxZUXh2vOZGnzYNY10L858=;
        b=HT7N8+PxYkzY+OrxbC1s3vhI7tWNqDVDu30adLMucxDWQXurWNVsBer3hNoA+8LMLo
         KMCmbxKQNp8eTcYWmqkd6nEK7/uM+HPbc94JNGSzB+zUVj1fJXvZNNjdYTThfYoJnGRe
         oqBA+1LVCTMTygoazKbwmtTdMTxkLDFJiLEyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102873; x=1767707673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MN4BFE0zEOL3BVNw4e4DwpxZUXh2vOZGnzYNY10L858=;
        b=b1ywm5xppRVvOvvMF0qMSsisnAC5O2bjt6W0LZ1hyxghznXzEVn8MsvD9ZYbRRtTNQ
         p/K9faL+M0UqkegrinMQ67wiiSIYuRFwAmJtbwoKDka06UWGpllZ9swqQnuvssPO7Y6d
         FmAraJn4Zanzfh0GBnoq4cc9tT+4vtX8FEAlNnQk3d0YTAg7yKicL5kyPhmNCN+4R6p6
         zDBabIQXflGL/PxtuJ8devKifOEjVRD5o//PIOXoXQfrB7c3fffGJ5MkrXBsBEFzlKAj
         gQzkquASeKKgFnTV7s7v3CZ1LwCXt8yH3Nd6apwakVerUNFm/USyj18nWzQ5Au8HexQK
         lPwA==
X-Gm-Message-State: AOJu0YwFFuYfNSlMTy0IIxiheEn6sdkvTXzRAiT3IA6awxLk/H3jwe7e
	s5ZvMztGIQfVTsR3QcflNOypWvHfeWvKWvDO9T0lnnLtFfWMPVjfY2z89qF+uTCm8kZ0IHMRTtN
	Pbjzy
X-Gm-Gg: AY/fxX6+MhpHlShmDda9TVgbduLPRTefg+tCsdNTaxTCnizJT29DQ1LnPtyCge5WHD9
	HupBfXWEGQyUJqwLJ9S5uxL5bw8gDiZ6vK16jUkNJDyFD8dNYkSmuYxSQ6BPIK8bLRZmYqot6iE
	E6OZZChSo60WQS4oh568uPlGCK4b1YVuYJzMy20LBg2e8D/aWoVTaKCfpUWhdzzS9Oe+JQa1OOs
	rEEv3nrxLLBVrvDEs2x5iB/Gbzn/3Vi2STOBKK1vhDutatWh1z/QGETgtGf9mrEe2E6NuZRmj9m
	rnLcWQ19Jkao+YEcsv0WxPojsflJPTL4IkD8MGJue2P/tEqDe6I6LWa9cjX4+t/vpqhe/G9ufz+
	Az0ddu9oDG3QopW1LuDWbnnsLipvVttHwmcX/78j7sE0WV8+SWcquIsxdIxxk7xud3osNjrTm37
	yYDCgV7Q1PRCgYrZYrbjee9ztuIB5ecQp5LOMc2bwz6JRBxtonr2aB71FR9bA52A==
X-Google-Smtp-Source: AGHT+IHFH/BV9WhXNCgKpX0SIy7xp1x+BfEGUzDeblCEGZc8taSwD0E9sOYy6vTP8EC8/FdC48ljbg==
X-Received: by 2002:a05:6000:178e:b0:430:b100:f594 with SMTP id ffacd0b85a97d-4324e50d9bcmr41314069f8f.50.1767102872660;
        Tue, 30 Dec 2025 05:54:32 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/4] x86/xstate: Rework XSAVE/XRSTOR given a newer toolchain baseline
Date: Tue, 30 Dec 2025 13:54:25 +0000
Message-Id: <20251230135427.188440-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230135427.188440-1-andrew.cooper3@citrix.com>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new toolchain baseline knows all the mnemonics, so a plain memory operand
can be used, rather than needing to hard-code the ModRM byte as (%rdi).

For xrstor(), use asm goto rather than hiding the increment of the faults
variable inside the .fixup section.  Remove the loop and replace it with a
goto retry pattern.  Put the domain_crash() into the default case for fault
handling, and provide a concrete error message rather than leaving it as an
exercise for extra code diving.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/xstate.c | 77 ++++++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 41 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 384f78bd5281..4215a83efefb 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -310,21 +310,21 @@ void xsave(struct vcpu *v, uint64_t mask)
     uint32_t hmask = mask >> 32;
     uint32_t lmask = mask;
     unsigned int fip_width = v->domain->arch.x87_fip_width;
-#define XSAVE(pfx) \
-        if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY ) \
-            asm volatile ( ".byte " pfx "0x0f,0xc7,0x2f\n" /* xsaves */ \
-                           : "=m" (*ptr) \
-                           : "a" (lmask), "d" (hmask), "D" (ptr) ); \
-        else \
-            alternative_io(".byte " pfx "0x0f,0xae,0x27\n", /* xsave */ \
-                           ".byte " pfx "0x0f,0xae,0x37\n", /* xsaveopt */ \
-                           X86_FEATURE_XSAVEOPT, \
-                           "=m" (*ptr), \
-                           "a" (lmask), "d" (hmask), "D" (ptr))
+
+#define XSAVE(pfx)                                                      \
+    if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY )                      \
+        asm volatile ( "xsaves %0"                                      \
+                       : "=m" (*ptr)                                    \
+                       : "a" (lmask), "d" (hmask) );                    \
+    else                                                                \
+        alternative_io("xsave %0",                                      \
+                       "xsaveopt %0", X86_FEATURE_XSAVEOPT,             \
+                       "=m" (*ptr),                                     \
+                       "a" (lmask), "d" (hmask))
 
     if ( fip_width == 8 || !(mask & X86_XCR0_X87) )
     {
-        XSAVE("0x48,");
+        XSAVE("rex64 ");
     }
     else if ( fip_width == 4 )
     {
@@ -349,7 +349,7 @@ void xsave(struct vcpu *v, uint64_t mask)
 
         ptr->fpu_sse.fip.addr = bad_fip;
 
-        XSAVE("0x48,");
+        XSAVE("rex64 ");
 
         /* FIP/FDP not updated? Restore the old FIP value. */
         if ( ptr->fpu_sse.fip.addr == bad_fip )
@@ -384,7 +384,7 @@ void xrstor(struct vcpu *v, uint64_t mask)
     uint32_t hmask = mask >> 32;
     uint32_t lmask = mask;
     struct xsave_struct *ptr = v->arch.xsave_area;
-    unsigned int faults, prev_faults;
+    unsigned int faults = 0;
 
     /*
      * Some CPUs don't save/restore FDP/FIP/FOP unless an exception
@@ -405,22 +405,15 @@ void xrstor(struct vcpu *v, uint64_t mask)
      * possibility, which may occur if the block was passed to us by control
      * tools or through VCPUOP_initialise, by silently adjusting state.
      */
-    for ( prev_faults = faults = 0; ; prev_faults = faults )
-    {
+ retry:
     switch ( __builtin_expect(ptr->fpu_sse.x[FPU_WORD_SIZE_OFFSET], 8) )
     {
-        BUILD_BUG_ON(sizeof(faults) != 4); /* Clang doesn't support %z in asm. */
-#define _xrstor(insn)                                               \
-        asm volatile ( "1: .byte " insn "\n"                        \
-                       "3:\n"                                       \
-                       "   .section .fixup,\"ax\"\n"                \
-                       "2: incl %[faults]\n"                        \
-                       "   jmp 3b\n"                                \
-                       "   .previous\n"                             \
-                       _ASM_EXTABLE(1b, 2b)                         \
-                       : [mem] "+m" (*ptr), [faults] "+g" (faults)  \
-                       : [lmask] "a" (lmask), [hmask] "d" (hmask),  \
-                         [ptr] "D" (ptr) )
+#define _xrstor(insn)                                       \
+        asm_inline volatile goto (                          \
+            "1: " insn " %0\n"                              \
+            _ASM_EXTABLE(1b, %l[fault])                     \
+            :: "m" (*ptr), "a" (lmask), "d" (hmask)         \
+            :: fault )
 
 #define XRSTOR(pfx) \
         if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY ) \
@@ -432,13 +425,13 @@ void xrstor(struct vcpu *v, uint64_t mask)
                 ptr->xsave_hdr.xcomp_bv = ptr->xsave_hdr.xstate_bv | \
                                           XSTATE_COMPACTION_ENABLED; \
             } \
-            _xrstor(pfx "0x0f,0xc7,0x1f"); /* xrstors */ \
+            _xrstor(pfx "xrstors"); \
         } \
         else \
-            _xrstor(pfx "0x0f,0xae,0x2f") /* xrstor */
+            _xrstor(pfx "xrstor")
 
     default:
-        XRSTOR("0x48,");
+        XRSTOR("rex64 ");
         break;
 
     case 4: case 2:
@@ -449,8 +442,10 @@ void xrstor(struct vcpu *v, uint64_t mask)
 #undef _xrstor
     }
 
-    if ( likely(faults == prev_faults) )
-        break;
+    return;
+
+ fault:
+    faults++;
 
 #ifndef NDEBUG
     gprintk(XENLOG_WARNING, "fault#%u: mxcsr=%08x\n",
@@ -489,17 +484,17 @@ void xrstor(struct vcpu *v, uint64_t mask)
             ptr->xsave_hdr.xcomp_bv = 0;
         }
         memset(ptr->xsave_hdr.reserved, 0, sizeof(ptr->xsave_hdr.reserved));
-        continue;
+        goto retry;
 
     case 2: /* Stage 2: Reset all state. */
         ptr->fpu_sse.mxcsr = MXCSR_DEFAULT;
         ptr->xsave_hdr.xstate_bv = 0;
         ptr->xsave_hdr.xcomp_bv = v->arch.xcr0_accum & XSTATE_XSAVES_ONLY
             ? XSTATE_COMPACTION_ENABLED : 0;
-        continue;
-    }
+        goto retry;
 
-        domain_crash(current->domain);
+    default: /* Stage 3: Nothing else to do. */
+        domain_crash(v->domain, "Uncorrectable XRSTOR fault\n");
         return;
     }
 }
@@ -1041,17 +1036,17 @@ uint64_t read_bndcfgu(void)
 
     if ( cpu_has_xsavec )
     {
-        asm ( ".byte 0x0f,0xc7,0x27\n" /* xsavec */
+        asm ( "xsavec %0"
               : "=m" (*xstate)
-              : "a" (X86_XCR0_BNDCSR), "d" (0), "D" (xstate) );
+              : "a" (X86_XCR0_BNDCSR), "d" (0) );
 
         bndcsr = (void *)(xstate + 1);
     }
     else
     {
-        asm ( ".byte 0x0f,0xae,0x27\n" /* xsave */
+        asm ( "xsave %0"
               : "=m" (*xstate)
-              : "a" (X86_XCR0_BNDCSR), "d" (0), "D" (xstate) );
+              : "a" (X86_XCR0_BNDCSR), "d" (0) );
 
         bndcsr = (void *)xstate + xstate_offsets[ilog2(X86_XCR0_BNDCSR)];
     }
-- 
2.39.5


