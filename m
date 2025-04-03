Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C0A7B260
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 01:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937483.1338441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0TtL-0005sA-O9; Thu, 03 Apr 2025 23:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937483.1338441; Thu, 03 Apr 2025 23:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0TtL-0005pU-LQ; Thu, 03 Apr 2025 23:22:35 +0000
Received: by outflank-mailman (input) for mailman id 937483;
 Thu, 03 Apr 2025 23:22:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu4W=WV=edera.dev=alexander@srs-se1.protection.inumbo.net>)
 id 1u0TtJ-0005pO-H3
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 23:22:33 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81dfa565-10e2-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 01:22:28 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7c56a3def84so132170585a.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 16:22:28 -0700 (PDT)
Received: from dell.axolotl-tone.ts.net
 ([2605:9480:312:2031:4ed7:17ff:feaa:a013])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c76ea8f8f3sm134106285a.110.2025.04.03.16.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 16:22:26 -0700 (PDT)
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
X-Inumbo-ID: 81dfa565-10e2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1743722547; x=1744327347; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8klrRKu2RIliPNwwgLNPRbdN+AHscLCfYpURpberkhM=;
        b=Ek9gYFKZmY/N99Z+2phH6xqzgA9eHVMHAP6YRVD52wtmT9TXDn3ha6rEc1qZVYJ/BA
         r+bQAe94uooswf//d8aAIBLApmq7A64QhH3QFSslOHTjRs9DZG/2WqIvQ1q1l+/6tuys
         a9BVe2LPLtbjH1GfimPDYCfgM4Mqr3z0wZlRGYL4xPgwrzjAZowil6LXMJEzl6mi1Ute
         7oZ9dq7bbcEQ7uZvT0ccFWLxXBQDR4HKLxL20HQbOgnnJgWeBSQPp2z8hznoMXxOlNeR
         o8OjRHCEnWfk7TlIDOQo4er8xziqzqVJgG3xlgU54Iy1irrl/Y8Dwbxi3dKtwhiZiohu
         xjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743722547; x=1744327347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8klrRKu2RIliPNwwgLNPRbdN+AHscLCfYpURpberkhM=;
        b=ch3oPPNWjls0gmIJgdrOM+BIu8Y1Ry2S96hvLFQ73xjypEszYB3/FIDHOP/r37elGh
         zJMKLrDNHYm4Sjl5jj/Ya2DEKT0KuaAS9qRQ9WSIrLMGY6tNf74hX8hXhiCFzO60ysYM
         wKAJy0lFfakQzkuMo+VgBEqPkED3O9WrFMRVa+xGd4qNYws5YuUfhfT+qArFidXPteJO
         KnxIHYZWJ8Y0Cg5/gsftfbxWFKiNh0dUVVw+Od53LGKTmZOfDMCye9xBT1e5TtKGkDZC
         DpuOyAVvkgn6EB763Jro3n0R2ajkj2K4TVmueJJFCNzJvvC2XmE4s5paQY5YftT2rSnV
         KC8A==
X-Gm-Message-State: AOJu0YzHdljzkofbmJpEI0z7cVhhBLYUKyD5SCk/cREEXdEa66+H8msG
	l6htLCr3dL6Lsx0iIFi0dyDptyI8ypdIIbgXAf0XHhpp2lvrusGY+VAwSTGKQQlTLg2BKyvVU5w
	W9Z4=
X-Gm-Gg: ASbGncsosZWGm+VqP0NeZroMsNeduxydnXROPFVuSJNU4kqmrjQtBDqXCg83j4yIoEf
	U9kjeAEOkffkRkkep7/s3CUu76O89yrWyjUn3q3pv8qJm+9xqMQGeOboWQWuwMcPWP/7s9jHGMe
	Q0tZoDnSNORu7DzF0RPqhpjUPTJoQ7DFai8X6DZuHHsIfcHRGGMzL+HI/kc1sy4AgLTtfwrroxw
	4W3GzzQzD2EX4RiLDR9gWOJvf3UH7ab1/uhtFUhnxYJHTMA6D4AoBBBJmNxS6LbpbsYz5lH9evp
	gLdHpNnvoYIcOyx1Yc7YSJtqNu9xgI1PeYXtOyU2rrHdpMjuMG6iDkHW+p1o35ew
X-Google-Smtp-Source: AGHT+IHxfbzSlx7zX9X+w3q0ALAHutiIvQHxdMAdeap0X0Ebh+d0ez7SbzvWXeI5z4LKOfdUg5I+Aw==
X-Received: by 2002:a05:620a:29c3:b0:7c5:65fb:fe0e with SMTP id af79cd13be357-7c774d099b0mr157542985a.6.1743722546701;
        Thu, 03 Apr 2025 16:22:26 -0700 (PDT)
From: "Alexander M. Merritt" <alexander@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: "Alexander M. Merritt" <alexander@edera.dev>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86: drop XSAVEOPT and CLWB build flags
Date: Thu,  3 Apr 2025 23:22:19 +0000
Message-ID: <3de09e4e2a3320e0f314803e349fbe6520d04b12.1743719892.git.alexander@edera.dev>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new toolchain baseline knows both the XSAVEOPT and CLWB instructions.

Resolves: https://gitlab.com/xen-project/xen/-/work_items/205
Signed-off-by: Alexander M. Merritt <alexander@edera.dev>
---
 xen/arch/x86/arch.mk              |  2 --
 xen/arch/x86/flushtlb.c           | 28 +---------------------------
 xen/arch/x86/include/asm/system.h |  7 -------
 3 files changed, 1 insertion(+), 36 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 258e459bec..baa83418bc 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -15,9 +15,7 @@ $(call as-option-add,CFLAGS,CC,"crc32 %eax$(comma)%eax",-DHAVE_AS_SSE4_2)
 $(call as-option-add,CFLAGS,CC,"invept (%rax)$(comma)%rax",-DHAVE_AS_EPT)
 $(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
 $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
-$(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
 $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
-$(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_SYM)
 $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$(comma)%rax",-DHAVE_AS_INVPCID)
 $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVDIR)
diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 65be0474a8..962bb87d69 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -313,33 +313,7 @@ void cache_writeback(const void *addr, unsigned int size)
     clflush_size = current_cpu_data.x86_clflush_size ?: 16;
     addr -= (unsigned long)addr & (clflush_size - 1);
     for ( ; addr < end; addr += clflush_size )
-    {
-/*
- * The arguments to a macro must not include preprocessor directives. Doing so
- * results in undefined behavior, so we have to create some defines here in
- * order to avoid it.
- */
-#if defined(HAVE_AS_CLWB)
-# define CLWB_ENCODING "clwb %[p]"
-#elif defined(HAVE_AS_XSAVEOPT)
-# define CLWB_ENCODING "data16 xsaveopt %[p]" /* clwb */
-#else
-# define CLWB_ENCODING ".byte 0x66, 0x0f, 0xae, 0x30" /* clwb (%%rax) */
-#endif
-
-#define BASE_INPUT(addr) [p] "m" (*(const char *)(addr))
-#if defined(HAVE_AS_CLWB) || defined(HAVE_AS_XSAVEOPT)
-# define INPUT BASE_INPUT
-#else
-# define INPUT(addr) "a" (addr), BASE_INPUT(addr)
-#endif
-
-        asm volatile (CLWB_ENCODING :: INPUT(addr));
-
-#undef INPUT
-#undef BASE_INPUT
-#undef CLWB_ENCODING
-    }
+        asm volatile ("clwb %[p]" :: [p] "m" (*(const char *)(addr)));
 
     asm volatile ("sfence" ::: "memory");
 }
diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
index 8ceaaf45d1..c3529f99dd 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -28,14 +28,7 @@ static inline void clflushopt(const void *p)
 
 static inline void clwb(const void *p)
 {
-#if defined(HAVE_AS_CLWB)
     asm volatile ( "clwb %0" :: "m" (*(const char *)p) );
-#elif defined(HAVE_AS_XSAVEOPT)
-    asm volatile ( "data16 xsaveopt %0" :: "m" (*(const char *)p) );
-#else
-    asm volatile ( ".byte 0x66, 0x0f, 0xae, 0x32"
-                   :: "d" (p), "m" (*(const char *)p) );
-#endif
 }
 
 #define xchg(ptr,v) \
-- 
2.45.2


