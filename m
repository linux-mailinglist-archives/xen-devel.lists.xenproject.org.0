Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891BCA73CA4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 18:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929884.1332652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txrG6-0005u8-PD; Thu, 27 Mar 2025 17:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929884.1332652; Thu, 27 Mar 2025 17:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txrG6-0005s0-MY; Thu, 27 Mar 2025 17:43:14 +0000
Received: by outflank-mailman (input) for mailman id 929884;
 Thu, 27 Mar 2025 17:43:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txrG4-0005rs-VC
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 17:43:12 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f15adb23-0b32-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 18:43:07 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3913fdd0120so790312f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 10:43:07 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a4498sm142475f8f.99.2025.03.27.10.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 10:43:06 -0700 (PDT)
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
X-Inumbo-ID: f15adb23-0b32-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743097387; x=1743702187; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPCyN3mhqjB6y1nALjXr18LIWD/daYld8rTdpJBNiws=;
        b=LnNMLreKxOJMZPDhkRjLHP9ysORdvu45BCN4VKpfHTHJ6zD86fE5QqMrup2j5AYT65
         +CrWC4H2Vd24xU4NiAlk9F+PGD8m8Am2XXgodGk7RVLKdEBBxPjlRIt2h9Eyumdvc0pO
         VQmD/hR8CsOXZhokz2ftUqlKzDlC8wJkJDou8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743097387; x=1743702187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPCyN3mhqjB6y1nALjXr18LIWD/daYld8rTdpJBNiws=;
        b=TqAnJEwR7OJnV47p6vigAmqhW4vANMUpBhtz7e5IY61NoNW+fM/2aSbkT+F4VAR8NS
         E61phYxq2at1TKvWij5gTxklADkbhSMXafd2gtT4GSAxA3GmwrfY4StCGAqupD9hofG+
         C7azI+nMtyNDoJThQR+cKGTJJps2c/tOmDxinoLe3+NPVfeaY+TXiOeV2SmERUHmGz8/
         m17hlW8BEGiELE3IVD4MAXiqg4uoW+Py4H6dGVyxOBA9h7CODJD5UmuHWfPTXYxw32fM
         rbsSA/BfnEOXHxAptFvHOgFGVc3ZHkSu4cQCJntwGtekz2uRRixV4ck30H6dLurN8EGn
         7U8Q==
X-Gm-Message-State: AOJu0YybaXhcjCOXd/INTy5fbpTA1w4gz7l5dMzCvCZprqY5Nak1fCIP
	MxItbvGoN47ObtT77XxqTL5WEtdzEiENVBii4yhvUJ5LXexvFPcJJIhemTFEZK24QPiji4crzj+
	OF1Q=
X-Gm-Gg: ASbGncvq7qpj62q3wzez+i2AM+6zfEMSrClmiEhA4aBodznfCTwU35O/hHeH41wBjyg
	CO5ehHj7GnwkZ0qdg4fYW1Tkcoo7q1YI89z2C5Ao9RaErG3h0LyKAy6YOhmXYqkRpEu3Jjmic1y
	XmrXvT0iGGyBtrJH3enc2nclmhj0d00t5CkA5Fvh6L3Juumh2pWfQ+U0hJwYwxo8RYr60wwZudd
	LjHE7tuuh+vfn/xHEQ62ntyQEMRRpKEdHYCb9nwa8ypWwJa+U0zgxtnZFo2M9BfvlZ2Q73trEyC
	1hIZ4fOepHaAph+VhjBQSb7QUaxoxnJrcUO/RgtYVJq20kwrG+m4swuRiowIKc6HKO8Iml92omI
	y7FKTt6WcLKMPVd5vew==
X-Google-Smtp-Source: AGHT+IGDiVfgjkRSnE4XOJND0Taxnn8dRSdT8EmKDZA3gonFDCJ8qQut7D1kG/hKQpqr6qjMzuVYbw==
X-Received: by 2002:a05:6000:4021:b0:391:3b70:2dab with SMTP id ffacd0b85a97d-39ad1746712mr3542349f8f.17.1743097386625;
        Thu, 27 Mar 2025 10:43:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v3] Xen: Update compiler checks
Date: Thu, 27 Mar 2025 17:43:02 +0000
Message-Id: <20250327174302.412821-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have checks in both xen/compiler.h, and Config.mk.  Both are incomplete.

The check in Config.mk sees $(CC) in system and cross-compiler form, so cannot
express anything more than the global baseline.  Change it to simply 5.1.

In xen/compiler.h, rewrite the expression for clarity/brevity.

Include a GCC 12.2 check for RISCV, and include a Clang 11 baseline check.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v3:
 * Reinstate the xen/compiler.h block
 * Restrict Config.mk to the baseline only
v2:
 * Change to altering Config.mk

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1738778376 with
the CI changes reverted, so as to expect failures for CentOS 7 and earlier
Ubuntu Clangs.

The $(eval $(check-y)) is badly positioned:

  xen.git/xen$ make
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
    HOSTCC  tools/fixdep
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  make[1]: *** [scripts/Makefile.host:108: tools/fixdep] Error 1
    HOSTCC  tools/symbols
  *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
  make[1]: *** [scripts/Makefile.host:108: tools/symbols] Error 1
  make: *** [Makefile:610: xen] Error 2

It is involved every time Config.mk is included, rather than once per `make`
invocation.
---
 Config.mk                  |  4 ++--
 xen/include/xen/compiler.h | 26 ++++++++++++++------------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/Config.mk b/Config.mk
index 8a73f3da62b4..8a60d4a55abf 100644
--- a/Config.mk
+++ b/Config.mk
@@ -125,8 +125,8 @@ define cc-ver-check-closure
     endif
 endef
 
-# Require GCC v4.1+
-check-$(gcc) = $(call cc-ver-check,CC,0x040100,"Xen requires at least gcc-4.1")
+# Require GCC v5.1 as the project global baseline
+check-$(gcc) = $(call cc-ver-check,CC,0x050100,"Xen requires at least GCC 5.1")
 $(eval $(check-y))
 
 ld-ver-build-id = $(shell $(1) --build-id 2>&1 | \
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 636a85bc417d..38b8fa3d386d 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -1,19 +1,21 @@
 #ifndef __LINUX_COMPILER_H
 #define __LINUX_COMPILER_H
 
-#if !defined(__GNUC__) || (__GNUC__ < 4)
-#error Sorry, your compiler is too old/not recognized.
-#elif CONFIG_CC_IS_GCC
-# if defined(CONFIG_ARM_32) && CONFIG_GCC_VERSION < 40900
-#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
-# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
-/*
- * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
- * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
- */
-#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
+#if CONFIG_CC_IS_GCC
+
+# if defined(CONFIG_RISCV) && CONFIG_GCC_VERSION < 120200
+#  error Sorry, please use GCC >= 12.2
+# elif CONFIG_GCC_VERSION < 50100
+#  error Sorry, please use GCC >= 5.1
 # endif
-#endif
+
+#elif CONFIG_CC_IS_CLANG
+
+# if CONFIG_CLANG_VERSION < 110000
+#  error Sorry, please use Clang >= 11
+# endif
+
+#endif /* Compiler checks. */
 
 #ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
 /* Results in more efficient PIC code (no indirections through GOT or PLT). */
-- 
2.39.5


