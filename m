Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E3187AD30
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 18:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692671.1080028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSNz-0002PS-26; Wed, 13 Mar 2024 17:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692671.1080028; Wed, 13 Mar 2024 17:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSNy-0002JF-UT; Wed, 13 Mar 2024 17:27:26 +0000
Received: by outflank-mailman (input) for mailman id 692671;
 Wed, 13 Mar 2024 17:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9/O=KT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkSNx-00023P-SW
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 17:27:25 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4f4daec-e15e-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 18:27:24 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so11269366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 10:27:24 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f15-20020a170906048f00b00a42ee62b634sm5005732eja.106.2024.03.13.10.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:27:22 -0700 (PDT)
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
X-Inumbo-ID: f4f4daec-e15e-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710350844; x=1710955644; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlFjhhn3RPAHKYuNj8Ur+L4ReTenR22KzyO8QJjXINY=;
        b=GJeeMxi+KKJqEGwVMksOZSo3oH6lFTcjQL9pAIs7VESJnWBZ76YvozGPLTxn9Ainf3
         vwSUWdfuXponQlsTw11Uis+6Scr0hEIhYgnKv7mwdln/JhK0K6JVluYCHjcupC+eNryd
         LAXYzoZhAlvkRJDWwhNrD+xgRq4FmNSWkDJtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710350844; x=1710955644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlFjhhn3RPAHKYuNj8Ur+L4ReTenR22KzyO8QJjXINY=;
        b=iqDB5oK5IJgHTDFvijlxzOnTH87QxXCnzi+BVxovy/361EvLHPhZhFFymRQYFqYa+0
         xlY43Rt6i1z/QfysywIKgIf/PtsHqDrWj/fXXBH96h//lXNj+UtBx/10Z2D2HWPJW1ew
         whWQaJCIkNFcrJmOiXY8j706f9m6DVzhAAoX+qaJmuhvgi2yesU44q69bRSDAmf9mY+z
         e9lVyohUWelVPSQgED94YHsieymIz6B6zEyvqrCg/zDxk1N4L8pyL2ENhQeR6jH5MFJ7
         eG7zXmyUpN3KW4A0Sa0e4iZj8mHwiMWOfaoJVCLVqMghonG8wVo0N/NN7rZ182yHeTLD
         GLBA==
X-Gm-Message-State: AOJu0YzSh06GChDqQvEXzEZ4ugWqLebxNBRBuS8smz1VziY5f3itZZYw
	DUJZ0J028PS9COEPGTzjtbAQXPBrijt1njIg5W/9Dojq2Y0d6Ns//PoVgy1b8fK2QEH/rAe7gqb
	q
X-Google-Smtp-Source: AGHT+IGyRscQkGqeocdnAjLem4S/ovvLA2xS7fr6bR6SxeaGoAp/cZ5SJUKwtSqtY3P3ypAv9a2rLA==
X-Received: by 2002:a17:907:1681:b0:a46:1e16:317c with SMTP id cx1-20020a170907168100b00a461e16317cmr8639997ejd.55.1710350844192;
        Wed, 13 Mar 2024 10:27:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 3/7] xen/bitops: Implement ffsl() in common logic
Date: Wed, 13 Mar 2024 17:27:12 +0000
Message-Id: <20240313172716.2325427-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Exactly as per ffs() in the previous patch.  Express the upper bound of the
testing in terms of BITS_PER_LONG as it varies between architectures.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/include/asm/bitops.h |  2 +-
 xen/arch/ppc/include/asm/bitops.h |  1 -
 xen/arch/x86/include/asm/bitops.h | 30 +++++++++++++-----------------
 xen/common/bitops.c               |  7 +++++++
 xen/include/xen/bitops.h          | 12 ++++++++++++
 5 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 09c6064274a7..59ae8ed150b6 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -158,7 +158,7 @@ static inline int fls(unsigned int x)
 
 
 #define arch_ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
-#define ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
+#define arch_ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
 
 /**
  * find_first_set_bit - find the first set bit in @word
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 635a3b4e3e33..ecec2a826660 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -173,7 +173,6 @@ static inline int __test_and_clear_bit(int nr, volatile void *addr)
 
 #define flsl(x) generic_flsl(x)
 #define fls(x) generic_fls(x)
-#define ffsl(x) ({ unsigned long t_ = (x); flsl(t_ & -t_); })
 
 /* Based on linux/include/asm-generic/bitops/ffz.h */
 /*
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 2c5b103cbbd9..99342877e32f 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -413,23 +413,6 @@ static inline unsigned int find_first_set_bit(unsigned long word)
     return (unsigned int)word;
 }
 
-/**
- * ffs - find first bit set
- * @x: the word to search
- *
- * This is defined the same way as the libc and compiler builtin ffs routines.
- */
-static inline int ffsl(unsigned long x)
-{
-    long r;
-
-    asm ( "bsf %1,%0\n\t"
-          "jnz 1f\n\t"
-          "mov $-1,%0\n"
-          "1:" : "=r" (r) : "rm" (x));
-    return (int)r+1;
-}
-
 static inline unsigned int arch_ffs(unsigned int x)
 {
     int r = -1;
@@ -448,6 +431,19 @@ static inline unsigned int arch_ffs(unsigned int x)
 }
 #define arch_ffs arch_ffs
 
+static inline unsigned int arch_ffsl(unsigned long x)
+{
+    long r = -1;
+
+    /* See arch_ffs() for safety discussion. */
+    asm ( "bsf %[val], %[res]"
+          : [res] "+r" (r)
+          : [val] "rm" (x) );
+
+    return r + 1;
+}
+#define arch_ffsl arch_ffsl
+
 /**
  * fls - find last bit set
  * @x: the word to search
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index 484df68768ad..eceffe5029d6 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -40,6 +40,13 @@ static void test_ffs(void)
     CHECK(ffs, 0, 0);
     CHECK(ffs, 1, 1);
     CHECK(ffs, 0x80000000U, 32);
+
+    /* unsigned int ffsl(unsigned long) */
+    CHECK(ffsl, 0, 0);
+    CHECK(ffsl, 1, 1);
+    CHECK(ffsl, 1UL << (BITS_PER_LONG - 1), BITS_PER_LONG);
+    if ( BITS_PER_LONG > 32 )
+        CHECK(ffsl, 1UL << 32, 33);
 }
 
 static int __init cf_check test_bitops(void)
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index fb3645d9cf87..a37b42342bc5 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -125,6 +125,18 @@ static always_inline __pure unsigned int ffs(unsigned int x)
     return arch_ffs(x);
 }
 
+static always_inline __pure unsigned int ffsl(unsigned long x)
+{
+    if ( __builtin_constant_p(x) )
+        return __builtin_ffsl(x);
+
+#ifndef arch_ffsl
+#define arch_ffsl __builtin_ffsl
+#endif
+
+    return arch_ffsl(x);
+}
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
-- 
2.30.2


