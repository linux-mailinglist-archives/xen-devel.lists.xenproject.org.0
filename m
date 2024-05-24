Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033D48CEAA5
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729752.1135073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8t-0000pA-ED; Fri, 24 May 2024 20:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729752.1135073; Fri, 24 May 2024 20:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8t-0000lM-94; Fri, 24 May 2024 20:03:55 +0000
Received: by outflank-mailman (input) for mailman id 729752;
 Fri, 24 May 2024 20:03:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8r-000773-GY
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:53 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdc52165-1a08-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 22:03:51 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57863a8f4b2so697576a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:51 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:50 -0700 (PDT)
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
X-Inumbo-ID: bdc52165-1a08-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581031; x=1717185831; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXTYEDY4WICxpm22K4ZAGRtYdV5nmr0pV6oeY/cb0HI=;
        b=svZVCs81BDol0Nqi7hrpXxJqPkVkkSFCmLJJCc240DBF13QxqFCT7f2N51das48CRM
         BbWvagSsw/7+U+vxw8jB0vGF3Q2B7mVPq6kbx3V/zkV0X7El6ej/lOWYhnA2S7RsZVfF
         gPSWHE+9TWy2IOXRQQGSAFGdSDUNTxwBhI0dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581031; x=1717185831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXTYEDY4WICxpm22K4ZAGRtYdV5nmr0pV6oeY/cb0HI=;
        b=dndMvJkb8jP+dmoEXIe3+if+gEbmR1+gIzYkdz8NYkuEZdMGCbkVOQcry4lwX35ZMh
         0niO8G/Nw/0Q4O8vM70uOtyLDa0g/8nuygLKRLEA0KP0cY+ivhZuNUkiR0Wfhd0BYGDX
         GB21mfzzAw5swWjfqkiNJU+6ItGVFhuWRySlUtY97ohlNHlN37G94iSodczeFWuWLvlc
         lYkZJnAuj0CAPJH856yWskG0MLWKn7M8VrxkvKeId9j1RQFW/FwDU82+M62JjvnagXDv
         DNl7Ihc0HK4sL3lXl7HJZAkCXXHDgUdqzuf7TJjEEsS+FdnD979yoLTScY3bMQwZsTjb
         yDIA==
X-Gm-Message-State: AOJu0YyCA6Kw/734pZruKaeKrRnDn3WLtQDOzYZ0qWt9twzvRVd4Uk+8
	QRytzUCmLRLGPfNebGt8WC94gqfg8DwA8/dcc0oNw7Ajf1PFZfoDPiiDsEyV/Onup3eozdJ9LRm
	wC4k=
X-Google-Smtp-Source: AGHT+IFb3M2wCqEZnAg0P7Oi7/XtKFSPQytPacHnXNOWFHuZBirGiXxcH2/y/aqny8HR74UaaGekqQ==
X-Received: by 2002:a17:906:3ed1:b0:a59:c23d:85d8 with SMTP id a640c23a62f3a-a6264f15e2cmr222340566b.51.1716581031018;
        Fri, 24 May 2024 13:03:51 -0700 (PDT)
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
Subject: [PATCH v2 08/13] xen/bitops: Implement ffsl() in common logic
Date: Fri, 24 May 2024 21:03:33 +0100
Message-Id: <20240524200338.1232391-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Just like ffs() in the previous changes.  Express the upper bound of the
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

v2:
 * Swap to #if BITS_PER_LONG > 32 to avoid a compile error on arm32
 * Changes to mirror ffs() v2.
---
 xen/arch/arm/include/asm/bitops.h |  2 +-
 xen/arch/ppc/include/asm/bitops.h |  2 +-
 xen/arch/x86/include/asm/bitops.h | 35 ++++++++++++++++---------------
 xen/common/bitops.c               | 13 ++++++++++++
 xen/include/xen/bitops.h          | 12 +++++++++++
 5 files changed, 45 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index a88ec2612e16..ba39802c9de3 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -158,7 +158,7 @@ static inline int fls(unsigned int x)
 
 
 #define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
-#define ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
+#define arch_ffsl(x) ((x) ? 1 + __builtin_ctzl(x) : 0)
 
 /**
  * find_first_set_bit - find the first set bit in @word
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 5c36a6cc0ce3..ce0f6436f727 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -174,7 +174,7 @@ static inline int __test_and_clear_bit(int nr, volatile void *addr)
 #define flsl(x) generic_flsl(x)
 #define fls(x) generic_flsl(x)
 #define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
-#define ffsl(x) ({ unsigned long t_ = (x); flsl(t_ & -t_); })
+#define arch_ffsl(x) ((x) ? 1 + __builtin_ctzl(x) : 0)
 
 /**
  * hweightN - returns the hamming weight of a N-bit word
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 1d7aea6065ef..51d3c0f40473 100644
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
 static always_inline unsigned int arch_ffs(unsigned int x)
 {
     unsigned int r;
@@ -458,6 +441,24 @@ static always_inline unsigned int arch_ffs(unsigned int x)
 }
 #define arch_ffs arch_ffs
 
+static always_inline unsigned int arch_ffsl(unsigned long x)
+{
+    unsigned int r;
+
+    /* See arch_ffs() for safety discussions. */
+    if ( __builtin_constant_p(x > 0) && x > 0 )
+        asm ( "bsf %[val], %q[res]"
+              : [res] "=r" (r)
+              : [val] "rm" (x) );
+    else
+        asm ( "bsf %[val], %q[res]"
+              : [res] "=r" (r)
+              : [val] "rm" (x), "[res]" (-1) );
+
+    return r + 1;
+}
+#define arch_ffsl arch_ffsl
+
 /**
  * fls - find last bit set
  * @x: the word to search
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index 8c161b8ea7fa..b3813f818198 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -11,6 +11,19 @@ static void __init test_ffs(void)
     CHECK(ffs, 7, 1);
     CHECK(ffs, 6, 2);
     CHECK(ffs, 0x80000000U, 32);
+
+    /* unsigned int ffsl(unsigned long) */
+    CHECK(ffsl, 0, 0);
+    CHECK(ffsl, 1, 1);
+    CHECK(ffsl, 3, 1);
+    CHECK(ffsl, 7, 1);
+    CHECK(ffsl, 6, 2);
+
+    CHECK(ffsl, 1UL << (BITS_PER_LONG - 1), BITS_PER_LONG);
+#if BITS_PER_LONG > 32
+    CHECK(ffsl, 1UL << 32, 33);
+    CHECK(ffsl, 1UL << 63, 64);
+#endif
 }
 
 static void __init __constructor test_bitops(void)
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index f7e90a2893a5..88cf27a88bcf 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -48,6 +48,18 @@ static always_inline __pure unsigned int ffs(unsigned int x)
 #endif
 }
 
+static always_inline __pure unsigned int ffsl(unsigned long x)
+{
+    if ( __builtin_constant_p(x) )
+        return __builtin_ffsl(x);
+
+#ifdef arch_ffs
+    return arch_ffsl(x);
+#else
+    return generic_ffsl(x);
+#endif
+}
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
-- 
2.30.2


