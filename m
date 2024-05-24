Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC578CEAA8
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729751.1135063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8r-0000Uj-UL; Fri, 24 May 2024 20:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729751.1135063; Fri, 24 May 2024 20:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8r-0000Nd-Ml; Fri, 24 May 2024 20:03:53 +0000
Received: by outflank-mailman (input) for mailman id 729751;
 Fri, 24 May 2024 20:03:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8q-000773-2L
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:52 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcd8def2-1a08-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 22:03:50 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-578517c7ae9so1585194a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:50 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:48 -0700 (PDT)
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
X-Inumbo-ID: bcd8def2-1a08-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581029; x=1717185829; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIl6ox/sphrOz6UFI6xM1xqU962sO2kBKKT4aLgRbJg=;
        b=hZfnLyQsdBdRA5tWILs1WM3bIsDtlcwqINDLfI4JpCMKKtsBWOAFSiOlMgaRUZSDQH
         FzrqPEa8yMfRKCm1Nbjc96gv11s4VpsjugV0pM3l6QC8wLYo/aUL1VzHxN/qmpm2BZjB
         anmgeeG0KCXFRZReYOZ+PAdHzExgfNo4lQzI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581029; x=1717185829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIl6ox/sphrOz6UFI6xM1xqU962sO2kBKKT4aLgRbJg=;
        b=n62X7eyHznajFpCF94oATfA9z43bUfDvB2VV1IfFo3sbnQNaGNco1KqYVuWHfHrWpJ
         9/nHvBKjZ61NHD29ZHCuGFdODQCgE6hrmnsMIkGK5zBtEk26jhbFpntgmnYDEXOIGELP
         izZglrg3acJxtNVtjhEWQ5BnYwcOA71cQeGAbC+KrjB/ertbJuEexfFohvnWbat+ot2p
         ih/hVL0BH5jdPvnkjrXpC4wvF6jNXnKd9+ShKXdSNQoOFIs+mtOUlMiA3RCw0lqTJtRW
         674VyyIdG5M7LQXyuLXS1xlbkQcSMMjwaSDeDOdU9QKoTjmIykixMmHnXo+hwQ5ssfXL
         C5Pg==
X-Gm-Message-State: AOJu0Yz/fOwOt5blhYpg9wQjoEsODu8o6AdC9wS8ybYoqHXfK2VphgAq
	U/YknOlKy69ymLRiC2qUdxZojAKyP6ONyW0q1fffwm30fTzjv0eO2DOH2POdSa2aq41Z3Js6Wp2
	X3VA=
X-Google-Smtp-Source: AGHT+IEUVNV4EpZfmOgPpyYnZ5/OwkBVDwrdSNszXAXbvrntU8FqgakDCrtsvjr4fA673YXJNwZzFw==
X-Received: by 2002:a17:907:7844:b0:a5e:612e:fd58 with SMTP id a640c23a62f3a-a6264f126demr219304566b.51.1716581029010;
        Fri, 24 May 2024 13:03:49 -0700 (PDT)
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
Subject: [PATCH v2 06/13] xen/bitops: Implement ffs() in common logic
Date: Fri, 24 May 2024 21:03:31 +0100
Message-Id: <20240524200338.1232391-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Perform constant-folding unconditionally, rather than having it implemented
inconsistency between architectures.

Confirm the expected behaviour with compile time and boot time tests.

For non-constant inputs, use arch_ffs() if provided but fall back to
generic_ffsl() if not.  In particular, RISC-V doesn't have a builtin that
works in all configurations.

For x86, rename ffs() to arch_ffs() and adjust the prototype.

For PPC, __builtin_ctz() is 1/3 of the size of size of the transform to
generic_fls().  Drop the definition entirely.  ARM too benefits in the general
case by using __builtin_ctz(), but less dramatically because it using
optimised asm().

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
 * Fall back to generic, not builtin.
 * Extend the testing with multi-bit values.
 * Use always_inline for x86
 * Defer x86 optimisation to a later change
---
 xen/arch/arm/include/asm/bitops.h |  2 +-
 xen/arch/ppc/include/asm/bitops.h |  2 +-
 xen/arch/x86/include/asm/bitops.h |  3 ++-
 xen/common/Makefile               |  1 +
 xen/common/bitops.c               | 19 +++++++++++++++++++
 xen/include/xen/bitops.h          | 17 +++++++++++++++++
 6 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 xen/common/bitops.c

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index ec1cf7b9b323..a88ec2612e16 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -157,7 +157,7 @@ static inline int fls(unsigned int x)
 }
 
 
-#define ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
+#define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
 #define ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
 
 /**
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index ab692d01717b..5c36a6cc0ce3 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -173,7 +173,7 @@ static inline int __test_and_clear_bit(int nr, volatile void *addr)
 
 #define flsl(x) generic_flsl(x)
 #define fls(x) generic_flsl(x)
-#define ffs(x) ({ unsigned int t_ = (x); fls(t_ & -t_); })
+#define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
 #define ffsl(x) ({ unsigned long t_ = (x); flsl(t_ & -t_); })
 
 /**
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 5a71afbc89d5..122767fc0d10 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -430,7 +430,7 @@ static inline int ffsl(unsigned long x)
     return (int)r+1;
 }
 
-static inline int ffs(unsigned int x)
+static always_inline unsigned int arch_ffs(unsigned int x)
 {
     int r;
 
@@ -440,6 +440,7 @@ static inline int ffs(unsigned int x)
           "1:" : "=r" (r) : "rm" (x));
     return r + 1;
 }
+#define arch_ffs arch_ffs
 
 /**
  * fls - find last bit set
diff --git a/xen/common/Makefile b/xen/common/Makefile
index d512cad5243f..21a4fb4c7166 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
+obj-bin-$(CONFIG_DEBUG) += bitops.init.o
 obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
new file mode 100644
index 000000000000..8c161b8ea7fa
--- /dev/null
+++ b/xen/common/bitops.c
@@ -0,0 +1,19 @@
+#include <xen/bitops.h>
+#include <xen/boot-check.h>
+#include <xen/init.h>
+
+static void __init test_ffs(void)
+{
+    /* unsigned int ffs(unsigned int) */
+    CHECK(ffs, 0, 0);
+    CHECK(ffs, 1, 1);
+    CHECK(ffs, 3, 1);
+    CHECK(ffs, 7, 1);
+    CHECK(ffs, 6, 2);
+    CHECK(ffs, 0x80000000U, 32);
+}
+
+static void __init __constructor test_bitops(void)
+{
+    test_ffs();
+}
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index cd405df96180..f7e90a2893a5 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -31,6 +31,23 @@ unsigned int __pure generic_flsl(unsigned long x);
 
 #include <asm/bitops.h>
 
+/*
+ * Find First/Last Set bit (all forms).
+ *
+ * Bits are labelled from 1.  Returns 0 if given 0.
+ */
+static always_inline __pure unsigned int ffs(unsigned int x)
+{
+    if ( __builtin_constant_p(x) )
+        return __builtin_ffs(x);
+
+#ifdef arch_ffs
+    return arch_ffs(x);
+#else
+    return generic_ffsl(x);
+#endif
+}
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
-- 
2.30.2


