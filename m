Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E58A736DD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929741.1332490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txq8X-00079w-Mk; Thu, 27 Mar 2025 16:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929741.1332490; Thu, 27 Mar 2025 16:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txq8X-000788-JX; Thu, 27 Mar 2025 16:31:21 +0000
Received: by outflank-mailman (input) for mailman id 929741;
 Thu, 27 Mar 2025 16:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txq8W-000782-5I
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:31:20 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8ae176e-0b28-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 17:31:18 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso8078865e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:31:18 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm44006925e9.40.2025.03.27.09.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 09:31:16 -0700 (PDT)
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
X-Inumbo-ID: e8ae176e-0b28-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743093077; x=1743697877; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsL60VlqbHYXCM0zVU73W2iigPLdV0ZH9iP6p4Fg3MI=;
        b=uRz6hI/+ndmOvA78v78b8ZboGk3duF/r6XilsgpurFKBMOLbQdK7tVaV9nJY0LDsuJ
         qmUX2ulSGcTb5ls+Za8U8feqL0uSnmkx0M2d8YUN02JQsE2ZsT+l2p+rdgKhdUEGiuQG
         qkUELYqMnkAIXaqO1oy7D/WPH+sCmJwLl/vbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093077; x=1743697877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsL60VlqbHYXCM0zVU73W2iigPLdV0ZH9iP6p4Fg3MI=;
        b=dzg3APB0YKKkq3w7yZ/s3dWfhdvG8Mc76RTAJuZKSLvp7AgIBp1DD5vE8XdL8qQmi9
         w03KVwBdQBWP0eHyhq+MUXUwTfRZ97Wqa4pOT8An2Tu/FL1r9LqPYEFjozD3VfL92wei
         VHqCnGqsXgQ1P0y8I5PGzvakxrtKFaOqA5f1MeQ4ccuEpqR0VxR9DN1awV5DJRPRCVLG
         X9HpQQnOxunEptXQgSRrmm0WGIuW+a/B4/fBOEOCw5ZWEsEtQpEittjeYM47KjnABJaJ
         /A86BXufzQFwHB2Zb78uHPb5fnom3S+H+mnRhjO21aqx8aVa3yowwZtEudgWov2kVOHg
         F7Zw==
X-Gm-Message-State: AOJu0Yw9vmypXVyu5Bx2s5hQUE2KCyHslA7Yl+IgPekoeL0yw8f9MIvP
	J11ithAucLgC+OifXM1W6QEoY1XNFW041QZZDqiRpRH+xuybgt5kU9YaE1Tmn7zmV4SvtTcdbuA
	a01A=
X-Gm-Gg: ASbGnctOqm8nAgC1ez9S7qb6qns4gXRtYp9mU+JK8aSZ1w7Lb/I+SelU502JadrxA/D
	shExtenJ8wYS6mqRmg/6x2GByN5Xz6V6D6AdL4gCDbdzC/8yo2l2oJXsgH4yGLbAGa8QnkyP2E0
	wDMzOmmcCETt4t3p78RxibLf5Ulu1tna/tFuBKD4e95BK7GbJ7usX0j0JaWKrx/hPlsc0kv3QRk
	AbJoX0Bz9PXA/L73tgF7Px12IXXm3lguEVVK15SQL5u7uPgDR1QwJe0vRNg49Fgve6IkMw0wsjD
	nixpuWXTykG8e1baItkrn9zKCzrmo1qx+ZySEYZufpwzpLT1xXRg9gjs6oCJRRjhBMjWCLwqU3p
	ggRB0bkE3d7oIwXYEGQ==
X-Google-Smtp-Source: AGHT+IEiBdJu2LFhdtlV+RK1eACdEVHQ7q7mIrkpk4WTY5pjnEkX9/KGS6ldIXIxBLK6SB4GEjiAQw==
X-Received: by 2002:a05:600c:1e16:b0:43c:f680:5c2e with SMTP id 5b1f17b1804b1-43d8e6c0616mr9159315e9.13.1743093077088;
        Thu, 27 Mar 2025 09:31:17 -0700 (PDT)
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
Subject: [PATCH v2] Xen: Update compiler checks
Date: Thu, 27 Mar 2025 16:31:14 +0000
Message-Id: <20250327163114.405824-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have checks in both xen/compiler.h, and Config.mk.  Both are incomplete.
Remove the one from compiler.h, as it's pointless to perform in addition to
the xen.git-wide one as well.

Expand the checks to cover RISCV wanting GCC 11.1, and to cover Clang on x86.

PPC still is unspecified, and inherits the GCC 5.1 global baseline.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * Change to altering Config.mk

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1738628602 with
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
 Config.mk                  | 14 ++++++++++++--
 xen/include/xen/compiler.h | 14 --------------
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/Config.mk b/Config.mk
index 8a73f3da62b4..a9d62fc10cfa 100644
--- a/Config.mk
+++ b/Config.mk
@@ -125,8 +125,18 @@ define cc-ver-check-closure
     endif
 endef
 
-# Require GCC v4.1+
-check-$(gcc) = $(call cc-ver-check,CC,0x040100,"Xen requires at least gcc-4.1")
+# Minimum GCC version: 5.1, except for RISCV which needs 11.1
+ifeq ($(XEN_TARGET_ARCH),riscv64)
+check-$(gcc) = $(call cc-ver-check,CC,0x110100,"Xen requires at least GCC 11.1")
+else
+check-$(gcc) = $(call cc-ver-check,CC,0x050100,"Xen requires at least GCC 5.1")
+endif
+
+# Minimum Clang version: 11, x86 only
+ifeq ($(XEN_TARGET_ARCH),x86_64)
+check-$(clang) = $(call cc-ver-check,CC,0x110000,"Xen requires at least Clang 11")
+endif
+
 $(eval $(check-y))
 
 ld-ver-build-id = $(shell $(1) --build-id 2>&1 | \
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 636a85bc417d..43b666133a92 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -1,20 +1,6 @@
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
-# endif
-#endif
-
 #ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
 /* Results in more efficient PIC code (no indirections through GOT or PLT). */
 #pragma GCC visibility push(hidden)
-- 
2.39.5


