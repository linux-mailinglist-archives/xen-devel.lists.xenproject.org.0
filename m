Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB96B2873B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083888.1443368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ev-0006P3-1X; Fri, 15 Aug 2025 20:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083888.1443368; Fri, 15 Aug 2025 20:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Eu-0006Ij-OZ; Fri, 15 Aug 2025 20:41:28 +0000
Received: by outflank-mailman (input) for mailman id 1083888;
 Fri, 15 Aug 2025 20:41:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Et-0005Rl-Bk
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:27 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3617a41b-7a18-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 22:41:25 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b9d41cd38dso1675761f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:25 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:24 -0700 (PDT)
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
X-Inumbo-ID: 3617a41b-7a18-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290485; x=1755895285; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GDtBG/SpNuMZzE1pyYu4N7XQrylYOdxJ81PeErRVSs=;
        b=Dw6vr7CrSyUBDbltO864XQQPFmKN+6MDE249cCZimzhW/pSICGsCbnaQLvJDL676au
         T3m+JBf8i1zyt95dmgxsUedEmbEj/u5tinSx0WiwID2TnTNffuhjHRc9ocUuUhc2VBOn
         wmKF81jc7x7WkfF1R/B+48n4repsBLJapMwRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290485; x=1755895285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GDtBG/SpNuMZzE1pyYu4N7XQrylYOdxJ81PeErRVSs=;
        b=IAi9c+ICygqLVqAa3q/ButkZZClR6nSLhDjOMmK3GNYZ72FS+vw2FmzKRDuFFBBHsf
         AGXF+sEcrkbK/bSdMw+jooa5VRX09lmZ4QNIKPTd3ijgq63LrBo4Xq8fG2scVIri4oGs
         lPfNYZ91m1cYbSbqqjjpbxjsm3vwx+KJmeEFrOUjqaKEe6nZM8B360n4gAxTTHG6/0XD
         7C8lct6oAgmQJ3Wqg0Bryenjl+tCJ1g+cOp83CW75FF9/LA/1t6fRwzpAuE7WsXAOJut
         KXGmHCTkSX+WpWbYDoJ8OlS7/ISiyQVDgMavlM7innQuj1tz5SF8B/NjYuho34LLleCx
         ofhw==
X-Gm-Message-State: AOJu0YwLiZWAz+CKsgekkwdlQzCghMGJmOf6Sm+P88aDRTm4t6WZUSxZ
	CCbWdbRWFQ9+sdD6r0ngFOt/6attkyLw3Q4P8wu6r1UuVqGixXijQUA6eBFU8LlcZzF1c9zQpcm
	NX1Hi
X-Gm-Gg: ASbGncuksO7SROeF0a01e4B8ir8erUZne31wAclmo/3Men+qpq+HMi7eCudDAAkoQsw
	hw+0wkzwJxYWqfYz64ETgvpXawdlGMcv8vXYLnp2N+54xpjTcXLFNtXWhXLzk99r1aSl36gsW7+
	bQkc6Jm5T4pmTCnjKCzFklgzhHtro0QZgVshZ4ou2hzyYYylDU2ZLshRaBiDZ6sswGyNAkgnmU3
	eyHtArdonhjgqwgNU1aOrDoH43lyvUQ6g3HIC3xUB0FJiG/zEmEUHzyhtY4EV8wdhO2oYVmH3fF
	y9V4wRVpIYa2iTMEuySWeuXGzvbyA6cCvZlPBcvGLRGf3P19EOHAuHh0CkdoGadFhhNWxKK9shm
	NSbyBWV0LgZ7z5vmAVh6XbWUET+ppjkXeSE+o9aEpv7omUAlwn3DKjS2PPijChXiH8YRTy33p9/
	dV
X-Google-Smtp-Source: AGHT+IE8eryCLPtShJuII1V24pM2mtTDi57utajU6P334frxZMAAONClZbDhtSHCJ9O1ZA2rAat2mA==
X-Received: by 2002:a5d:5f85:0:b0:3b7:8a49:eee9 with SMTP id ffacd0b85a97d-3bb66180720mr2429221f8f.8.1755290484539;
        Fri, 15 Aug 2025 13:41:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 05/16] x86/msr: Split out fsgsbase.h
Date: Fri, 15 Aug 2025 21:41:06 +0100
Message-Id: <20250815204117.3312742-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a large and complex API, but only a handful of translation units need
access.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c               |   1 +
 xen/arch/x86/hvm/vmx/vmx.c          |   1 +
 xen/arch/x86/include/asm/fsgsbase.h | 114 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/msr.h      | 105 -------------------------
 xen/arch/x86/pv/domain.c            |   1 +
 xen/arch/x86/pv/emul-priv-op.c      |   1 +
 xen/arch/x86/pv/misc-hypercalls.c   |   1 +
 xen/arch/x86/traps.c                |   1 +
 8 files changed, 120 insertions(+), 105 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/fsgsbase.h

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1bbe53e36b59..3015aac4adbc 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -44,6 +44,7 @@
 #include <asm/cpuidle.h>
 #include <asm/debugreg.h>
 #include <asm/desc.h>
+#include <asm/fsgsbase.h>
 #include <asm/guest-msr.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 4664a014bc8a..f97a7746531a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -22,6 +22,7 @@
 #include <asm/current.h>
 #include <asm/debugreg.h>
 #include <asm/event.h>
+#include <asm/fsgsbase.h>
 #include <asm/gdbsx.h>
 #include <asm/guest-msr.h>
 #include <asm/hvm/emulate.h>
diff --git a/xen/arch/x86/include/asm/fsgsbase.h b/xen/arch/x86/include/asm/fsgsbase.h
new file mode 100644
index 000000000000..03e6a85d31ce
--- /dev/null
+++ b/xen/arch/x86/include/asm/fsgsbase.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_FSGSBASE_H
+#define X86_FSGSBASE_H
+
+#include <asm/msr.h>
+#include <asm/processor.h>
+#include <asm/x86-defns.h>
+
+/*
+ * On hardware supporting FSGSBASE, the value loaded into hardware is the
+ * guest kernel's choice for 64bit PV guests (Xen's choice for Idle, HVM and
+ * 32bit PV).
+ *
+ * Therefore, the {RD,WR}{FS,GS}BASE instructions are only safe to use if
+ * %cr4.fsgsbase is set.
+ */
+static inline unsigned long __rdfsbase(void)
+{
+    unsigned long base;
+
+    asm volatile ( "rdfsbase %0" : "=r" (base) );
+
+    return base;
+}
+
+static inline unsigned long __rdgsbase(void)
+{
+    unsigned long base;
+
+    asm volatile ( "rdgsbase %0" : "=r" (base) );
+
+    return base;
+}
+
+static inline void __wrfsbase(unsigned long base)
+{
+    asm volatile ( "wrfsbase %0" :: "r" (base) );
+}
+
+static inline void __wrgsbase(unsigned long base)
+{
+    asm volatile ( "wrgsbase %0" :: "r" (base) );
+}
+
+static inline unsigned long read_fs_base(void)
+{
+    unsigned long base;
+
+    if ( read_cr4() & X86_CR4_FSGSBASE )
+        return __rdfsbase();
+
+    rdmsrl(MSR_FS_BASE, base);
+
+    return base;
+}
+
+static inline unsigned long read_gs_base(void)
+{
+    unsigned long base;
+
+    if ( read_cr4() & X86_CR4_FSGSBASE )
+        return __rdgsbase();
+
+    rdmsrl(MSR_GS_BASE, base);
+
+    return base;
+}
+
+static inline unsigned long read_gs_shadow(void)
+{
+    unsigned long base;
+
+    if ( read_cr4() & X86_CR4_FSGSBASE )
+    {
+        asm volatile ( "swapgs" );
+        base = __rdgsbase();
+        asm volatile ( "swapgs" );
+    }
+    else
+        rdmsrl(MSR_SHADOW_GS_BASE, base);
+
+    return base;
+}
+
+static inline void write_fs_base(unsigned long base)
+{
+    if ( read_cr4() & X86_CR4_FSGSBASE )
+        __wrfsbase(base);
+    else
+        wrmsrl(MSR_FS_BASE, base);
+}
+
+static inline void write_gs_base(unsigned long base)
+{
+    if ( read_cr4() & X86_CR4_FSGSBASE )
+        __wrgsbase(base);
+    else
+        wrmsrl(MSR_GS_BASE, base);
+}
+
+static inline void write_gs_shadow(unsigned long base)
+{
+    if ( read_cr4() & X86_CR4_FSGSBASE )
+    {
+        asm volatile ( "swapgs\n\t"
+                       "wrgsbase %0\n\t"
+                       "swapgs"
+                       :: "r" (base) );
+    }
+    else
+        wrmsrl(MSR_SHADOW_GS_BASE, base);
+}
+
+#endif /* X86_FSGSBASE_H */
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 787517802d9d..4a35cd0fdff6 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -168,111 +168,6 @@ static inline uint64_t rdtsc_ordered(void)
 			  : "=a" (low), "=d" (high) \
 			  : "c" (counter))
 
-/*
- * On hardware supporting FSGSBASE, the value loaded into hardware is the
- * guest kernel's choice for 64bit PV guests (Xen's choice for Idle, HVM and
- * 32bit PV).
- *
- * Therefore, the {RD,WR}{FS,GS}BASE instructions are only safe to use if
- * %cr4.fsgsbase is set.
- */
-static inline unsigned long __rdfsbase(void)
-{
-    unsigned long base;
-
-    asm volatile ( "rdfsbase %0" : "=r" (base) );
-
-    return base;
-}
-
-static inline unsigned long __rdgsbase(void)
-{
-    unsigned long base;
-
-    asm volatile ( "rdgsbase %0" : "=r" (base) );
-
-    return base;
-}
-
-static inline void __wrfsbase(unsigned long base)
-{
-    asm volatile ( "wrfsbase %0" :: "r" (base) );
-}
-
-static inline void __wrgsbase(unsigned long base)
-{
-    asm volatile ( "wrgsbase %0" :: "r" (base) );
-}
-
-static inline unsigned long read_fs_base(void)
-{
-    unsigned long base;
-
-    if ( read_cr4() & X86_CR4_FSGSBASE )
-        return __rdfsbase();
-
-    rdmsrl(MSR_FS_BASE, base);
-
-    return base;
-}
-
-static inline unsigned long read_gs_base(void)
-{
-    unsigned long base;
-
-    if ( read_cr4() & X86_CR4_FSGSBASE )
-        return __rdgsbase();
-
-    rdmsrl(MSR_GS_BASE, base);
-
-    return base;
-}
-
-static inline unsigned long read_gs_shadow(void)
-{
-    unsigned long base;
-
-    if ( read_cr4() & X86_CR4_FSGSBASE )
-    {
-        asm volatile ( "swapgs" );
-        base = __rdgsbase();
-        asm volatile ( "swapgs" );
-    }
-    else
-        rdmsrl(MSR_SHADOW_GS_BASE, base);
-
-    return base;
-}
-
-static inline void write_fs_base(unsigned long base)
-{
-    if ( read_cr4() & X86_CR4_FSGSBASE )
-        __wrfsbase(base);
-    else
-        wrmsrl(MSR_FS_BASE, base);
-}
-
-static inline void write_gs_base(unsigned long base)
-{
-    if ( read_cr4() & X86_CR4_FSGSBASE )
-        __wrgsbase(base);
-    else
-        wrmsrl(MSR_GS_BASE, base);
-}
-
-static inline void write_gs_shadow(unsigned long base)
-{
-    if ( read_cr4() & X86_CR4_FSGSBASE )
-    {
-        asm volatile ( "swapgs\n\t"
-                       "wrgsbase %0\n\t"
-                       "swapgs"
-                       :: "r" (base) );
-    }
-    else
-        wrmsrl(MSR_SHADOW_GS_BASE, base);
-}
-
 DECLARE_PER_CPU(uint64_t, efer);
 static inline uint64_t read_efer(void)
 {
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 9334da1dab93..9c4785c187dd 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -12,6 +12,7 @@
 
 #include <asm/cpu-policy.h>
 #include <asm/cpufeature.h>
+#include <asm/fsgsbase.h>
 #include <asm/invpcid.h>
 #include <asm/spec_ctrl.h>
 #include <asm/pv/domain.h>
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index c3a484c50bf8..225d4cff03c1 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -16,6 +16,7 @@
 #include <asm/amd.h>
 #include <asm/debugreg.h>
 #include <asm/endbr.h>
+#include <asm/fsgsbase.h>
 #include <asm/hpet.h>
 #include <asm/mc146818rtc.h>
 #include <asm/pv/domain.h>
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index 17030d800d1b..7a37f16bf038 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -10,6 +10,7 @@
 #include <xen/hypercall.h>
 
 #include <asm/debugreg.h>
+#include <asm/fsgsbase.h>
 
 long do_set_debugreg(int reg, unsigned long value)
 {
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 270b93ed623e..0c5393cb2166 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -33,6 +33,7 @@
 #include <asm/debugreg.h>
 #include <asm/desc.h>
 #include <asm/flushtlb.h>
+#include <asm/fsgsbase.h>
 #include <asm/gdbsx.h>
 #include <asm/i387.h>
 #include <asm/io.h>
-- 
2.39.5


