Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D15ACE9D48
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:54:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194220.1512706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaaBM-0008Rt-1v; Tue, 30 Dec 2025 13:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194220.1512706; Tue, 30 Dec 2025 13:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaaBL-0008PH-TZ; Tue, 30 Dec 2025 13:54:39 +0000
Received: by outflank-mailman (input) for mailman id 1194220;
 Tue, 30 Dec 2025 13:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vaaBJ-0007fS-Ij
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:54:37 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13560d4d-e587-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 14:54:35 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43284ed32a0so1534261f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 05:54:35 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea226d1sm70198245f8f.13.2025.12.30.05.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 05:54:33 -0800 (PST)
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
X-Inumbo-ID: 13560d4d-e587-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767102875; x=1767707675; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocUUAwnTL1KF0z21fxsbu2k7KeGdeeLnlr7V9yXtvoE=;
        b=NWvatK5fVo7Qj/w7aE1+5bOxBs5M6r8Q+l95R9qJSaCjIEBbOiyg3acj5ZKm+PgdVi
         KJoIOnFS2AN/uFmbwy/6ylLXLtqsyoCFCz0HyH/KMbnL5w2dQ8OSQ7wG+ELtN5rSu9ch
         2xe2B7D/sr1z/lh5+eaRgot3w33DyD+hBiJEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102875; x=1767707675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ocUUAwnTL1KF0z21fxsbu2k7KeGdeeLnlr7V9yXtvoE=;
        b=L/vmqI/lleD5NztSuGSvaVK2nw0Ds8+GKEV7MeCDKXMCH5iifbi22N5YFEpiOn16Xv
         /a9baur4pvkHuXyDcIKaV2nj4mpmSqQUcukOoscVCjWfMPIEIPQoaX/l78szPcTxZF1y
         QJwAWEj+ZyyPH13UY4B9fM5HwfcaN71CkYQsRtnNacZ+kFqd7o/JVtpmuswHk+SgDUK8
         PCNyflafZ3GRrhdjzO8Zl3SK2TrsrJ3uBTg47KWs8JEAiuCZKDGKr6AA5jv6nqFBg4T/
         s/CUG4Ezl96z79if/N1WuQY1ZPBojPNtp2iwfsq+B9xoHjGDvJh6RauaihdssxUNmf8a
         byAw==
X-Gm-Message-State: AOJu0YwHI/B8vUwY5LigRpqlmCaCUoPRx52w0aVlYpwaYnZfSbp2oP0e
	pgyqUVplOVAfBcMpO16F7nQ5x6OEocya3g6X0z3I/LM+TkMv+BuMcHPQi1IYg36fmMxuLpZtS/R
	L+cRp
X-Gm-Gg: AY/fxX5RSvI7fCEVEzZnYtpwvTvJZwWpP7NfaL46uafhw6ISxYYD7AvP3kG8MA+u14v
	s7jyFr6jkKpPWVfIIiodENLLA/m8SdJrFSC7VZG0I1RweitTaps9Ms7/FVuFvMpMdBJ8Wz5UDlD
	f8yTqKWK9uQKGACiJuoE9WzteJTjE+7pbSzAttn5UGvbcJLvGHLx+iKutdTD0hPvDgq+K7iqdnS
	ubYV+qXXBG+s6ELmIk/HL0p2zhRmnyVLwQ7dE5rxQ2RVwlvwy+QTLEP6piAWgP5WHyielBj6vMR
	QZKLfluaWd3D8WFb6r4+6fQXkL+mQmBamuWy/Jt7dX3wTfLAgXOGVI6nLk50LdCHgNGxu9Z6zgO
	L8kCInjJSxneWmEzjhWWqes96AmrsAjJ7fKNIQ0Q+olSL/bC+DPZOEJIl+MRX3+xgd1Td81CZDm
	QOPD59ju5/q3+O4LLA7yUKhPt0A8JKyIg5HW41LodV5MyiUVeP5cF3Ghmgkuzovw==
X-Google-Smtp-Source: AGHT+IHPK1Lv1iG0BMQX95Z3SF3lU6JdbuzNbiixY6Ys1VFmvVMgqeumy+0QX+FwMP06bBxQ8HAc5w==
X-Received: by 2002:a05:6000:186e:b0:432:86e1:bd34 with SMTP id ffacd0b85a97d-43286e1bddemr16955684f8f.39.1767102874079;
        Tue, 30 Dec 2025 05:54:34 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/4] x86: Avoid using .byte for instructions where safe to do so
Date: Tue, 30 Dec 2025 13:54:27 +0000
Message-Id: <20251230135427.188440-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230135427.188440-1-andrew.cooper3@citrix.com>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new toolchain baseline knows all of these instructions.

For the remaining uses of .byte for instructions, annotate the toolchain
minima.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/arch.mk                   |  4 +++
 xen/arch/x86/include/asm/asm-defns.h   |  4 ---
 xen/arch/x86/include/asm/msr.h         |  2 ++
 xen/arch/x86/include/asm/prot-key.h    |  6 ++---
 xen/arch/x86/include/asm/xstate.h      |  3 +--
 xen/arch/x86/x86_emulate/0f01.c        |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c | 34 ++++++++++++--------------
 7 files changed, 26 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 0203138a819a..3d8d9bfe4916 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -16,7 +16,11 @@ CFLAGS-$(CONFIG_CC_IS_GCC) += -malign-data=abi
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_SYM)
+
+# Binutils >= 2.31, Clang >= 7
 $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVDIR)
+
+# Binutils >= 2.33, Clang >= 9
 $(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_ENQCMD)
 
 # Check to see whether the assembler supports the .nop directive.
diff --git a/xen/arch/x86/include/asm/asm-defns.h b/xen/arch/x86/include/asm/asm-defns.h
index 239dc3af096c..f6fe4596a852 100644
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -1,9 +1,5 @@
 #include <asm/page-bits.h>
 
-.macro clzero
-    .byte 0x0f, 0x01, 0xfc
-.endm
-
 /* binutils >= 2.41 or LLVM >= 19 */
 .macro eretu
     .byte 0xf3, 0x0f, 0x01, 0xca
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 941a7612f4ba..1377d156f4e1 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -63,6 +63,8 @@ static inline void wrmsrns(uint32_t msr, uint64_t val)
     /*
      * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redundant CS
      * prefix to avoid a trailing NOP.
+     *
+     * Binutils >= 2.40, Clang >= 16
      */
     alternative_input(".byte 0x2e; wrmsr",
                       ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
diff --git a/xen/arch/x86/include/asm/prot-key.h b/xen/arch/x86/include/asm/prot-key.h
index 8fb15b5c32e9..1752756fd9c1 100644
--- a/xen/arch/x86/include/asm/prot-key.h
+++ b/xen/arch/x86/include/asm/prot-key.h
@@ -19,16 +19,14 @@ static inline uint32_t rdpkru(void)
 {
     uint32_t pkru;
 
-    asm volatile ( ".byte 0x0f,0x01,0xee"
-                   : "=a" (pkru) : "c" (0) : "dx" );
+    asm volatile ( "rdpkru" : "=a" (pkru) : "c" (0) : "dx" );
 
     return pkru;
 }
 
 static inline void wrpkru(uint32_t pkru)
 {
-    asm volatile ( ".byte 0x0f,0x01,0xef"
-                   :: "a" (pkru), "d" (0), "c" (0) );
+    asm volatile ( "wrpkru" :: "a" (pkru), "d" (0), "c" (0) );
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index e3b9745543d7..9cfee1fa9c5a 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -120,8 +120,7 @@ static inline uint64_t xgetbv(unsigned int index)
     uint32_t lo, hi;
 
     ASSERT(index); /* get_xcr0() should be used instead. */
-    asm volatile ( ".byte 0x0f,0x01,0xd0" /* xgetbv */
-                   : "=a" (lo), "=d" (hi) : "c" (index) );
+    asm volatile ( "xgetbv" : "=a" (lo), "=d" (hi) : "c" (index) );
 
     return lo | ((uint64_t)hi << 32);
 }
diff --git a/xen/arch/x86/x86_emulate/0f01.c b/xen/arch/x86/x86_emulate/0f01.c
index 1ba99609d6fd..4791465fc83f 100644
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -122,7 +122,7 @@ int x86emul_0f01(struct x86_emulate_state *s,
         {
         case vex_none: /* serialize */
             host_and_vcpu_must_have(serialize);
-            asm volatile ( ".byte 0x0f, 0x01, 0xe8" );
+            asm volatile ( ".byte 0x0f, 0x01, 0xe8" ); /* Binutils >= 2.34, Clang >= 11 */
             break;
         case vex_f2: /* xsusldtrk */
             vcpu_must_have(tsxldtrk);
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index d830aea430d4..a3b7142fde7e 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -4748,27 +4748,25 @@ x86_emulate(
                  */
                 if ( vex.l )
                 {
-                    /* vpxor %xmmN, %xmmN, %xmmN */
-                    asm volatile ( ".byte 0xc5,0xf9,0xef,0xc0" );
-                    asm volatile ( ".byte 0xc5,0xf1,0xef,0xc9" );
-                    asm volatile ( ".byte 0xc5,0xe9,0xef,0xd2" );
-                    asm volatile ( ".byte 0xc5,0xe1,0xef,0xdb" );
-                    asm volatile ( ".byte 0xc5,0xd9,0xef,0xe4" );
-                    asm volatile ( ".byte 0xc5,0xd1,0xef,0xed" );
-                    asm volatile ( ".byte 0xc5,0xc9,0xef,0xf6" );
-                    asm volatile ( ".byte 0xc5,0xc1,0xef,0xff" );
+                    asm volatile ( "vpxor %xmm0, %xmm0, %xmm0" );
+                    asm volatile ( "vpxor %xmm1, %xmm1, %xmm1" );
+                    asm volatile ( "vpxor %xmm2, %xmm2, %xmm2" );
+                    asm volatile ( "vpxor %xmm3, %xmm3, %xmm3" );
+                    asm volatile ( "vpxor %xmm4, %xmm4, %xmm4" );
+                    asm volatile ( "vpxor %xmm5, %xmm5, %xmm5" );
+                    asm volatile ( "vpxor %xmm6, %xmm6, %xmm6" );
+                    asm volatile ( "vpxor %xmm7, %xmm7, %xmm7" );
                 }
                 else
                 {
-                    /* vpor %xmmN, %xmmN, %xmmN */
-                    asm volatile ( ".byte 0xc5,0xf9,0xeb,0xc0" );
-                    asm volatile ( ".byte 0xc5,0xf1,0xeb,0xc9" );
-                    asm volatile ( ".byte 0xc5,0xe9,0xeb,0xd2" );
-                    asm volatile ( ".byte 0xc5,0xe1,0xeb,0xdb" );
-                    asm volatile ( ".byte 0xc5,0xd9,0xeb,0xe4" );
-                    asm volatile ( ".byte 0xc5,0xd1,0xeb,0xed" );
-                    asm volatile ( ".byte 0xc5,0xc9,0xeb,0xf6" );
-                    asm volatile ( ".byte 0xc5,0xc1,0xeb,0xff" );
+                    asm volatile ( "vpor %xmm0, %xmm0, %xmm0" );
+                    asm volatile ( "vpor %xmm1, %xmm1, %xmm1" );
+                    asm volatile ( "vpor %xmm2, %xmm2, %xmm2" );
+                    asm volatile ( "vpor %xmm3, %xmm3, %xmm3" );
+                    asm volatile ( "vpor %xmm4, %xmm4, %xmm4" );
+                    asm volatile ( "vpor %xmm5, %xmm5, %xmm5" );
+                    asm volatile ( "vpor %xmm6, %xmm6, %xmm6" );
+                    asm volatile ( "vpor %xmm7, %xmm7, %xmm7" );
                 }
 
                 ASSERT(!state->simd_size);
-- 
2.39.5


