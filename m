Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E881BB25735
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 01:05:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080417.1440842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umKXC-0004kc-5B; Wed, 13 Aug 2025 23:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080417.1440842; Wed, 13 Aug 2025 23:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umKXC-0004jN-0o; Wed, 13 Aug 2025 23:05:30 +0000
Received: by outflank-mailman (input) for mailman id 1080417;
 Wed, 13 Aug 2025 23:05:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umKXB-0004jH-29
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 23:05:29 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 009a271e-789a-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 01:05:28 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45a1b00f23eso1699115e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 16:05:28 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1a596268sm16654445e9.30.2025.08.13.16.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 16:05:26 -0700 (PDT)
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
X-Inumbo-ID: 009a271e-789a-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755126327; x=1755731127; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gN3kD3X0X0m2TC8QZtRjGZ8xhEzi9InYdII0ioKWdxU=;
        b=KEG6A4dBG2d7STlbZwklAq3SUGjovzcJgwm2E2UDXUzDhXkgTa9vNjiWv4+B1WEQaI
         jKWHvrcxmm9M5Mm0ghA47geUkBEZW8G1ExoBlxDsr4o1julsiZY6JToq8wJ5+5tB4sX2
         zvKFxmtduu/ZhTk4oCt7GjppbwqLjl31ObLV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755126327; x=1755731127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gN3kD3X0X0m2TC8QZtRjGZ8xhEzi9InYdII0ioKWdxU=;
        b=Hm1UofjPkFhEcn+Kxn4zlp2ImkTdyhNzGWRumcW5HpI+48dpeNuHccHbhigb/jUL0X
         I9IHDwP/KGpDJPifw2M4t1Ds/vXUmk2no3xbPRLC9FQWTfSCPEaKMlvnscZTyD1bhcLA
         p8X4XypGheHASp0ZVzQyjg20sZD182eNJSIJpSGmykHIh2Zp6tCFC2Nr6RhndmJyehMt
         AdzcuUh56/CCRq/te0kqwaF7NHiNilw2CZujM+eczp1SkjGBV635M/B4iJox3zAplJLm
         A8/s7QoxT+gNaZngLVa1fxcpFSrq1Mv6yG/L2FKQIy14sKPmt4Nw766QNOfNZA4x2vJW
         V8eg==
X-Gm-Message-State: AOJu0Yy5Lk8qn/5KGYFHaPDG2cE6dEY3UL6e1MjTANJeemof7MBObwAa
	omUy0MNXfNlmRh1c6VEI/m+4cupYgnb1QKogQeiNK75FSd2Usejr2lyMfnW6yKJSkIzZ+p60Tun
	9b8KJ
X-Gm-Gg: ASbGncsRprkJIFsY/9mgDMO1qa8HwU5rJiugSeK88qAm7hief1W7Ko2GZYhgF8G4GBf
	QX6NKcqhspbzGAgwVKpBkQkR+7vDJ69NrGXJYwd/d8GmT0fmmDeNkF84Emyr4MdUvE0jP9TWzA/
	hfhvK/VsaCb1EhfS0OJWQM3vMMn7c87DJRW9VkBuzpnOvMfeZHTq0Tp0BiFxLOCCM6BEgAwQlmo
	dnTtZ/aFPzkWgk+ZDqBLl7NEGsKZlk7U/NNZfdcIMLzUHKglIiszLhDt6Lc58fjzbpvQWTD2oUr
	Zeb1WKFgUoXZGbK9RIidxq32jFspCDA16STFZU81MV6PhTObI6OKizRvCwmgXQycH0GL5ps/Rcg
	68jSkyAxciHLQSv7yMI0lE4GaQp1JnrckYdoC9v9E/98qAQkIzGplkJobgHBWGzQu+l0vOBsHk1
	J9
X-Google-Smtp-Source: AGHT+IHkIwCuAIHPK2T7cS7M+u19zSggc8Amix/yPmTXwsMy4z9wvKBF76A7YMCAHux0SEJJomkJEg==
X-Received: by 2002:a05:600c:3b21:b0:455:bd8a:7e7 with SMTP id 5b1f17b1804b1-45a1b61ea3cmr3820045e9.9.1755126327142;
        Wed, 13 Aug 2025 16:05:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Nicola Vetrini <nicola.vetrini@gmail.com>
Subject: [PATCH] x86/cpu-policy: Drop workaround for pre-GCC-5 PIC issue
Date: Thu, 14 Aug 2025 00:05:25 +0100
Message-Id: <20250813230525.2435414-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC 5.1 is the minimum supported toolchain version now.  Drop the workaround
for the PIC hard register in earlier versions.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Nicola Vetrini <nicola.vetrini@gmail.com>

Noticed when reviewing the other GCC cleanup.
---
 xen/include/xen/lib/x86/cpu-policy.h | 35 ++++------------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index dd204a825b07..f94f23e159d2 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -29,45 +29,18 @@ struct cpuid_leaf
     uint32_t a, b, c, d;
 };
 
-/*
- * Versions of GCC before 5 unconditionally reserve %rBX as the PIC hard
- * register, and are unable to cope with spilling it.  This results in a
- * rather cryptic error:
- *    error: inconsistent operand constraints in an ‘asm’
- *
- * In affected situations, work around the issue by using a separate register
- * to hold the the %rBX output, and xchg twice to leave %rBX preserved around
- * the asm() statement.
- */
-#if defined(__PIC__) && __GNUC__ < 5 && !defined(__clang__) && defined(__i386__)
-# define XCHG_BX "xchg %%ebx, %[bx];"
-# define BX_CON [bx] "=&r"
-#elif defined(__PIC__) && __GNUC__ < 5 && !defined(__clang__) && \
-    defined(__x86_64__) && (defined(__code_model_medium__) || \
-                            defined(__code_model_large__))
-# define XCHG_BX "xchg %%rbx, %q[bx];"
-# define BX_CON [bx] "=&r"
-#else
-# define XCHG_BX ""
-# define BX_CON "=&b"
-#endif
-
 static inline void cpuid_leaf(uint32_t leaf, struct cpuid_leaf *l)
 {
-    asm ( XCHG_BX
-          "cpuid;"
-          XCHG_BX
-          : "=a" (l->a), BX_CON (l->b), "=&c" (l->c), "=&d" (l->d)
+    asm ( "cpuid"
+          : "=a" (l->a), "=b" (l->b), "=c" (l->c), "=d" (l->d)
           : "a" (leaf) );
 }
 
 static inline void cpuid_count_leaf(
     uint32_t leaf, uint32_t subleaf, struct cpuid_leaf *l)
 {
-    asm ( XCHG_BX
-          "cpuid;"
-          XCHG_BX
-          : "=a" (l->a), BX_CON (l->b), "=c" (l->c), "=&d" (l->d)
+    asm ( "cpuid"
+          : "=a" (l->a), "=b" (l->b), "=c" (l->c), "=d" (l->d)
           : "a" (leaf), "c" (subleaf) );
 }
 
-- 
2.39.5


