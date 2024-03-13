Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3387AD2E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 18:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692670.1080021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSNy-0002GL-K9; Wed, 13 Mar 2024 17:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692670.1080021; Wed, 13 Mar 2024 17:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSNy-0002EA-FJ; Wed, 13 Mar 2024 17:27:26 +0000
Received: by outflank-mailman (input) for mailman id 692670;
 Wed, 13 Mar 2024 17:27:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9/O=KT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkSNw-0001lR-LF
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 17:27:24 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3d14d5f-e15e-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 18:27:23 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a450615d1c4so24687366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 10:27:23 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f15-20020a170906048f00b00a42ee62b634sm5005732eja.106.2024.03.13.10.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:27:21 -0700 (PDT)
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
X-Inumbo-ID: f3d14d5f-e15e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710350842; x=1710955642; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2oya0isulzFAqiR2Y4bOr7KNgkZIK98TBQV1YHRgn0=;
        b=tgN3u5Rl4VBjVMYFfH665xVPT01FrfQ26DouBvPsUIp6/IEpYZHe67CTfWwzTMDDgE
         GKTWbszIJA+rXPqCv84CSN5rKscOiGd2vjIAx31MEdRvylichcslzc2ny5I0Lm7OXt+b
         5URllXOM0AmYh6pJjYOT1uJ6opYp+xaC0zCMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710350842; x=1710955642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2oya0isulzFAqiR2Y4bOr7KNgkZIK98TBQV1YHRgn0=;
        b=bzGWniYsk53HGq4U8N94gAFlV6jLk9ltByn2ZlqXyTp+Y0fEm1JF2XwNC6Et+bOB7k
         /RuF1lQ8wRSfsmiFQZOv1yF8YhLw2UrONjPn82v4ELSqMHt3tondTNCufIGtrtdRyqxR
         LxEriIah61QRj+PqKXSorSmM7ciKRAGCdr50xjegCfI3neLnoRpJMMSh0Po9IGcSje2p
         Eynq5tTo88p0/P+bN4ppLSJfn+EWeOFLjkmgPEzw7hbHLAKdtBDhZflGePngZB649kNc
         IrMvoxNXBbw29Cr/b4WT5DL9RHevBSBN1MbaEZ8eM7VsltZ8XeRCIHYrjXe4exa0jdWO
         vH4g==
X-Gm-Message-State: AOJu0YxTESqZqPOSklFzmgv8PAEfY5KIiA3Gqeh+xFSLvYs6ZiB0/U2q
	i0ZofzQC/PLPYVDHJHwyZ4ws1ZexsNzRrbfnzYxA+dUQpvfDGFRU4YMSduF8Cch9wV1YndpnvuP
	c
X-Google-Smtp-Source: AGHT+IHOjqUYc+9/WYFvjA5tif1UP2IANWkp92gtxXAy0+hCRxUW7p1lSXmMlZsvtX+23e1kctw02A==
X-Received: by 2002:a17:906:7d50:b0:a45:f1fa:a17d with SMTP id l16-20020a1709067d5000b00a45f1faa17dmr2704000ejp.25.1710350842139;
        Wed, 13 Mar 2024 10:27:22 -0700 (PDT)
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
Subject: [PATCH 2/7] xen/bitops: Implement ffs() in common logic
Date: Wed, 13 Mar 2024 17:27:11 +0000
Message-Id: <20240313172716.2325427-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow the optimiser to elimiate the call completely, and use the compiler
builtin by default.  Architectures should only proide arch_ffs() if they think
they can do better than the compiler.

Confirm the expected behaviour with compile time and boot time tests.

For x86, correct the prototype, and simplify the asm() with the statement
given by the Intel architects to Linux about the behaviour on processors newer
than the 486.

For PPC, __builtin_ffs() is 1/3 of the size of size of the transform to
generic_fls().  Drop the definition entirely.

For ARM, simply rename ffs() to arch_ffs().  It appears that the
transformation to __builtin_clz() still makes better code than
__builtin_ffs().

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
 xen/arch/x86/include/asm/bitops.h | 19 +++++++++++++------
 xen/common/bitops.c               | 10 ++++++++++
 xen/include/xen/bitops.h          | 15 +++++++++++++++
 5 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index ab030b6cb032..09c6064274a7 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -157,7 +157,7 @@ static inline int fls(unsigned int x)
 }
 
 
-#define ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
+#define arch_ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
 #define ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
 
 /**
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 5820b9ce7bb5..635a3b4e3e33 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -173,7 +173,6 @@ static inline int __test_and_clear_bit(int nr, volatile void *addr)
 
 #define flsl(x) generic_flsl(x)
 #define fls(x) generic_fls(x)
-#define ffs(x) ({ unsigned int t_ = (x); fls(t_ & -t_); })
 #define ffsl(x) ({ unsigned long t_ = (x); flsl(t_ & -t_); })
 
 /* Based on linux/include/asm-generic/bitops/ffz.h */
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 5a71afbc89d5..2c5b103cbbd9 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -430,16 +430,23 @@ static inline int ffsl(unsigned long x)
     return (int)r+1;
 }
 
-static inline int ffs(unsigned int x)
+static inline unsigned int arch_ffs(unsigned int x)
 {
-    int r;
+    int r = -1;
+
+    /*
+     * The AMD manual states that BSF won't modify the destination register if
+     * x=0.  The Intel manual states that the result is undefined, but the
+     * architects have said that the register is written back with it's old
+     * value, possibly zero extended above 32 bits.
+     */
+    asm ( "bsf %[val], %[res]"
+          : [res] "+r" (r)
+          : [val] "rm" (x) );
 
-    asm ( "bsf %1,%0\n\t"
-          "jnz 1f\n\t"
-          "mov $-1,%0\n"
-          "1:" : "=r" (r) : "rm" (x));
     return r + 1;
 }
+#define arch_ffs arch_ffs
 
 /**
  * fls - find last bit set
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index 4c07191b4030..484df68768ad 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -34,8 +34,18 @@
         RUNTIME_CHECK(fn, val, res);            \
     } while ( 0 )
 
+static void test_ffs(void)
+{
+    /* unsigned int ffs(unsigned int) */
+    CHECK(ffs, 0, 0);
+    CHECK(ffs, 1, 1);
+    CHECK(ffs, 0x80000000U, 32);
+}
+
 static int __init cf_check test_bitops(void)
 {
+    test_ffs();
+
     return 0;
 }
 __initcall(test_bitops);
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 9b40f20381a2..fb3645d9cf87 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -110,6 +110,21 @@ static inline int generic_flsl(unsigned long x)
 
 #include <asm/bitops.h>
 
+/*
+ * Find First Set bit.  Bits are labelled from 1.
+ */
+static always_inline __pure unsigned int ffs(unsigned int x)
+{
+    if ( __builtin_constant_p(x) )
+        return __builtin_ffs(x);
+
+#ifndef arch_ffs
+#define arch_ffs __builtin_ffs
+#endif
+
+    return arch_ffs(x);
+}
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
-- 
2.30.2


