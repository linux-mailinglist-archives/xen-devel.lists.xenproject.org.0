Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BB2908C0D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 14:50:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740684.1147782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI6NU-0007VL-4w; Fri, 14 Jun 2024 12:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740684.1147782; Fri, 14 Jun 2024 12:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI6NU-0007Sq-2F; Fri, 14 Jun 2024 12:50:00 +0000
Received: by outflank-mailman (input) for mailman id 740684;
 Fri, 14 Jun 2024 12:49:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/js=NQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sI6NS-0007Sk-77
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 12:49:58 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99bd14cd-2a4c-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 14:49:56 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57c75464e77so2532270a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 05:49:56 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da3fb9sm182654866b.30.2024.06.14.05.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 05:49:54 -0700 (PDT)
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
X-Inumbo-ID: 99bd14cd-2a4c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718369395; x=1718974195; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cNg/dPncJ5qZGG9Ab9DyeK/zvBXVRY+iIi96hwU1hbU=;
        b=QGDM8uCQX+fNYTLoU2+KRIfW4bEjr5agWC56Up997pK7hxLMnaJkNwIND/bzIeuInq
         wpi85T6tloteTf3/UDZgdOWenylSHC2AhMpR5PzaR0mITDXl6qPtzk3VPhib9ZLcnXv+
         9S1qnZ5X3cf9Vw1u+ctntJcgP/3Az5hREqy0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718369395; x=1718974195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNg/dPncJ5qZGG9Ab9DyeK/zvBXVRY+iIi96hwU1hbU=;
        b=FpHVu4747bAY7EGy6cIbt312lA2oyl3G6ib+i8L0vSx5Fj0pszCSTz20GF7MzCQnJs
         lJO4Cvu6hfFIZ12XJOspQTr5cH+emoWmJBca0WOdvjwwYAlyC1W8c5d0KRkbXHNlQf3h
         OQInCyul0Xj7s9M+Z2NyhHKdxZl4qVnyBWoxECDXWpe6HkgF4rey1yXpxMAGWOdF7XSA
         RXWmjZUFtr63JMYRclQDK/duZDbK+FPrUomeAkWEOMNOyIcp0bIgPL3IaKzmIKAFxryX
         5Y4NPZVW1nbt2VdMMR9LeEvzDFLc5pJ6oCY5bHvgF1onKvqIaB80UqYtNU0F480oEbhP
         2TwQ==
X-Gm-Message-State: AOJu0YzuBbMNLmyhuGqE+kOmedqE5fw0vNZIoQBKfGHacgAwLeHKQEUP
	+tmbzkJDnGNO21Jqb9fiRyKdvbi1T/Qm4hhYK3CFtRX1psVdTyc76APU5q7aIfcjZ7tqpC/yhzr
	1XsA=
X-Google-Smtp-Source: AGHT+IFD57JmEK2X990R98Iafbehf5kBDNmxRpZ2N7QCaNurdAUZnGfrr26o+tj5qZg6s4PfZpVukA==
X-Received: by 2002:a17:906:2f81:b0:a6f:57f1:cebe with SMTP id a640c23a62f3a-a6f60cefd96mr194337966b.5.1718369394581;
        Fri, 14 Jun 2024 05:49:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH for-4.19] xen/arch: Centralise __read_mostly and __ro_after_init
Date: Fri, 14 Jun 2024 13:49:50 +0100
Message-Id: <20240614124950.1557058-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These being in cache.h is inherited from Linux, but is an inappropriate
location to live.

__read_mostly is an optimisation related to data placement in order to avoid
having shared data in cachelines that are likely to be written to, but it
really is just a section of the linked image separating data by usage
patterns; it has nothing to do with cache sizes or flushing logic.

Worse, __ro_after_init was only in xen/cache.h because __read_mostly was in
arch/cache.h, and has literally nothing whatsoever to do with caches.

Move the definitions into xen/sections.h, which in paritcular means that
RISC-V doesn't need to repeat the problematic pattern.  Take the opportunity
to provide a short descriptions of what these are used for.

For now, leave TODO comments next to the other identical definitions.  It
turns out that unpicking cache.h is more complicated than it appears because a
number of files use it for transitive dependencies.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

For 4.19.  This is to help the RISC-V "full build of Xen" effort without
introducing a pattern that's going to require extra effort to undo after the
fact.
---
 xen/arch/arm/include/asm/cache.h |  1 +
 xen/arch/ppc/include/asm/cache.h |  1 +
 xen/arch/x86/include/asm/cache.h |  1 +
 xen/include/xen/cache.h          |  1 +
 xen/include/xen/sections.h       | 21 +++++++++++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/xen/arch/arm/include/asm/cache.h b/xen/arch/arm/include/asm/cache.h
index 240b6ae0eaa3..029b2896fb3e 100644
--- a/xen/arch/arm/include/asm/cache.h
+++ b/xen/arch/arm/include/asm/cache.h
@@ -6,6 +6,7 @@
 #define L1_CACHE_SHIFT  (CONFIG_ARM_L1_CACHE_SHIFT)
 #define L1_CACHE_BYTES  (1 << L1_CACHE_SHIFT)
 
+/* TODO: Phase out the use of this via cache.h */
 #define __read_mostly __section(".data.read_mostly")
 
 #endif
diff --git a/xen/arch/ppc/include/asm/cache.h b/xen/arch/ppc/include/asm/cache.h
index 0d7323d7892f..13c0bf3242c8 100644
--- a/xen/arch/ppc/include/asm/cache.h
+++ b/xen/arch/ppc/include/asm/cache.h
@@ -3,6 +3,7 @@
 #ifndef _ASM_PPC_CACHE_H
 #define _ASM_PPC_CACHE_H
 
+/* TODO: Phase out the use of this via cache.h */
 #define __read_mostly __section(".data.read_mostly")
 
 #endif /* _ASM_PPC_CACHE_H */
diff --git a/xen/arch/x86/include/asm/cache.h b/xen/arch/x86/include/asm/cache.h
index e4770efb22b9..956c05493e23 100644
--- a/xen/arch/x86/include/asm/cache.h
+++ b/xen/arch/x86/include/asm/cache.h
@@ -9,6 +9,7 @@
 #define L1_CACHE_SHIFT	(CONFIG_X86_L1_CACHE_SHIFT)
 #define L1_CACHE_BYTES	(1 << L1_CACHE_SHIFT)
 
+/* TODO: Phase out the use of this via cache.h */
 #define __read_mostly __section(".data.read_mostly")
 
 #ifndef __ASSEMBLY__
diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
index f52a0aedf768..55456823c543 100644
--- a/xen/include/xen/cache.h
+++ b/xen/include/xen/cache.h
@@ -15,6 +15,7 @@
 #define __cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
 #endif
 
+/* TODO: Phase out the use of this via cache.h */
 #define __ro_after_init __section(".data.ro_after_init")
 
 #endif /* __LINUX_CACHE_H */
diff --git a/xen/include/xen/sections.h b/xen/include/xen/sections.h
index b6cb5604c285..6d4db2b38f0f 100644
--- a/xen/include/xen/sections.h
+++ b/xen/include/xen/sections.h
@@ -3,9 +3,30 @@
 #ifndef __XEN_SECTIONS_H__
 #define __XEN_SECTIONS_H__
 
+#include <xen/compiler.h>
+
 /* SAF-0-safe */
 extern char __init_begin[], __init_end[];
 
+/*
+ * Some data is expected to be written very rarely (if at all).
+ *
+ * For performance reasons is it helpful to group such data in the build, to
+ * avoid the linker placing it adjacent to often-written data.
+ */
+#define __read_mostly __section(".data.read_mostly")
+
+/*
+ * Some data should be chosen during boot and be immutable thereafter.
+ *
+ * Variables annotated with __ro_after_init will become read-only after boot
+ * and suffer a runtime access fault if modified.
+ *
+ * For architectures/platforms which haven't implemented support, these
+ * variables will be treated as regular mutable data.
+ */
+#define __ro_after_init __section(".data.ro_after_init")
+
 #endif /* !__XEN_SECTIONS_H__ */
 /*
  * Local variables:

base-commit: 8b4243a9b560c89bb259db5a27832c253d4bebc7
-- 
2.39.2


