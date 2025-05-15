Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10BAAB9041
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 21:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985921.1371700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFegQ-0004L1-FV; Thu, 15 May 2025 19:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985921.1371700; Thu, 15 May 2025 19:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFegQ-0004Iu-Bt; Thu, 15 May 2025 19:55:58 +0000
Received: by outflank-mailman (input) for mailman id 985921;
 Thu, 15 May 2025 19:55:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=us+D=X7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFegP-00043V-Jz
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 19:55:57 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d0a4fb8-31c6-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 21:55:55 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso11051245e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 12:55:55 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ebd6fe86sm78320035e9.0.2025.05.15.12.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 12:55:53 -0700 (PDT)
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
X-Inumbo-ID: 9d0a4fb8-31c6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747338955; x=1747943755; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFY+crOJ6uli3zRfjr13DW1h8fGEztjSlHefAA2118A=;
        b=EvzktjRkGRTNKA2frJwF7icapIoR5y/ec+njt3zMebHQ1bD165p6RSz7pRt+LpwRiz
         mWK5TLIzdLU1dx+1r/bphv1FyDppyBg55RUUdy1n/rPkPXCodw9m0sc9Ccn2h5iFWohY
         ELJeTfjvSYVBULp8X6xQKdvpLAcGtPmAucnKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747338955; x=1747943755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFY+crOJ6uli3zRfjr13DW1h8fGEztjSlHefAA2118A=;
        b=Dhbsod/4ukqT3f1eFdbAsp5I+8vutTazMZL5NfulswNIYXMDUVfWXXJZnPa+1Kp5L0
         FOsxJup06FN88pGQF5cIE+X7vIZBuGzzJtCR1J4PK5sBoverV2ENzOoC4/BbJH8M6zgA
         ApwN2DP5FIeYov9FHgqG1goG0RFNe3nD9dpu36SUgWRMfMS9ANy1n+bK1pxfXVIve7Gf
         dggTf7ILSRwLplE/1j9uw/fqW6V6afiJUTV3dms93lT5Ob7v3FqMFVoe+SHaWrcuenFY
         IFjvtbnBHxB3Gg0AxcUoHDIQ1ZfhYeiy9Wuk5kEqfOdc0A+h6EBFag+ZfcJQJRLhOwDx
         ZPKQ==
X-Gm-Message-State: AOJu0Ywi/6YZueub9OLmNaivihIkk/g7x3m8dsRt8+XBF2Z2WMbV9s/9
	YZHXmQNjubvLcSI314kSR1+3NPmRW8RI3MLbVIE2xzKLgu39fz8jCNd4N+spWokuYkUvYUMsLUt
	LxFuG
X-Gm-Gg: ASbGncuW64HwaZoUGv5ktyFO3G0WrWagZbb9zpyWVmBi2u+qdBIGhw0nWlCUoMauvqW
	BY8RVPyuxMQ2XKvnRoqESy99itJ5SPOcmvvNwAtZUmQbjy4n4YezQdfh+zRNAnI2MVJrhLMlQ1b
	yEgkFM/a49S354IakqPjhfXguftOraHnYhHpMOL7DPt8ar6FVsjh6iYmwh3jqIcOOd9Y/5SXQ79
	4xPIOBuewPUJ04q27hDm/QmyQi1Qg19jvNULpFdMHg01jZ/jD2ks3yAfP5vScWlRRB3Z4iSwPPO
	5qiO9w1xEOPxxefjdy/NxQMxx9Phtri+CKAySWVET3+mDZPk9AJhTkwO5Jn0y7iUfD1kp5I60KE
	aJTNK/w774i4YNZyLHSZ1hvqD
X-Google-Smtp-Source: AGHT+IEo6SRUhBVfLLFYMkghRkXLjLJFU7gt1APsW7jxNCCW/d2OIsYmRGE0cyza9+Q+T3HfSs7D4g==
X-Received: by 2002:a05:600c:384b:b0:43c:f8fc:f6a6 with SMTP id 5b1f17b1804b1-442fd6100famr8204345e9.9.1747338954976;
        Thu, 15 May 2025 12:55:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 1/3] xen: Introduce asm inline and use it for BUG_FRAME
Date: Thu, 15 May 2025 20:55:47 +0100
Message-Id: <20250515195549.3703017-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250515195549.3703017-1-andrew.cooper3@citrix.com>
References: <20250515195549.3703017-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compilers estimate the size of an asm() block for inlining purposes.

Constructs with embedded metadata (BUG_FRAME, ALTERNATIVE, EXTABLE, etc)
appear large, depsite often only being a handful of instructions.  asm
inline() overrides the estimation to identify the block as being small.

This has a substantial impact on inlining decisions, expected to be for the
better given that the compiler has a more accurate picture to work with.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

v2:
 * Split into multiple patches
 * Start with BUG().

The full bloat-o-meter for this on x86 is https://termbin.com/27we although
the saving is better than reported.

Note the pairs such as:

  vmx_update_secondary_exec_control.part         2       -      -2
  vmx_update_secondary_exec_control             60      57      -3

This is becuse the UD2 was out-of-lined, and was CALL'd.  When inlined, the 5
byte CALL instruction in is replace with the 2 byte UD2.  Further than
reported, we save another 14 bytes due to the 16 byte function alignment.

This undoes an unanticipated side effect of starting to use asm goto().
---
 xen/Kconfig                    |  4 ++++
 xen/arch/arm/include/asm/bug.h |  6 ++++--
 xen/include/xen/bug.h          | 11 ++++++-----
 xen/include/xen/compiler.h     | 15 +++++++++++++++
 4 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 1b24e8f3c0cd..07c4accf881c 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -29,6 +29,10 @@ config LD_IS_GNU
 config LD_IS_LLVM
 	def_bool $(success,$(LD) --version | head -n 1 | grep -q "^LLD")
 
+config CC_HAS_ASM_INLINE
+	# GCC >= 9, Clang >= 11
+	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
+
 # Use -f{function,data}-sections compiler parameters
 config CC_SPLIT_SECTIONS
 	bool
diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index 8bf71587bea1..0f436df63f26 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -34,7 +34,8 @@ struct bug_frame {
 #define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
     BUILD_BUG_ON((line) >> 16);                                             \
     BUILD_BUG_ON((type) >= BUGFRAME_NR);                                    \
-    asm ("1:"BUG_INSTR"\n"                                                  \
+    asm_inline (                                                            \
+         "1:"BUG_INSTR"\n"                                                  \
          ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
          "2:\t.asciz " __stringify(file) "\n"                               \
          "3:\n"                                                             \
@@ -60,7 +61,8 @@ struct bug_frame {
  */
 #define  run_in_exception_handler(fn) do {                                  \
     register unsigned long _fn asm (STR(BUG_FN_REG)) = (unsigned long)(fn); \
-    asm ("1:"BUG_INSTR"\n"                                                  \
+    asm_inline (                                                            \
+         "1:"BUG_INSTR"\n"                                                  \
          ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
          "             \"a\", %%progbits\n"                                 \
          "2:\n"                                                             \
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index 99814c4bef36..0cabdba37992 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -89,11 +89,12 @@ struct bug_frame {
 #ifndef BUG_FRAME
 
 #define BUG_FRAME(type, line, ptr, second_frame, msg) do {                   \
-    BUG_CHECK_LINE_WIDTH(line);                                           \
-    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                     \
-    asm volatile ( _ASM_BUGFRAME_TEXT(second_frame)                          \
-                   :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );            \
-} while ( false )
+        BUG_CHECK_LINE_WIDTH(line);                                          \
+        BUILD_BUG_ON((type) >= BUGFRAME_NR);                                 \
+        asm_inline volatile (                                                \
+            _ASM_BUGFRAME_TEXT(second_frame)                                 \
+            :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );                   \
+    } while ( false )
 
 #endif
 
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index c68fab189154..735c844d2d15 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -53,6 +53,21 @@
 #define unreachable() __builtin_unreachable()
 #endif
 
+/*
+ * Compilers estimate the size of an asm() block for inlining purposes.
+ *
+ * Constructs with embedded metadata (BUG_FRAME, ALTERNATIVE, EXTABLE, etc)
+ * appear large, depsite typically only being a handful of instructions.  asm
+ * inline() overrides the estimation to identify the block as being small.
+ *
+ * Note: __inline is needed to avoid getting caught up in INIT_SECTIONS_ONLY.
+ */
+#if CONFIG_CC_HAS_ASM_INLINE
+# define asm_inline asm __inline
+#else
+# define asm_inline asm
+#endif
+
 /*
  * Add the pseudo keyword 'fallthrough' so case statement blocks
  * must end with any of these keywords:
-- 
2.39.5


