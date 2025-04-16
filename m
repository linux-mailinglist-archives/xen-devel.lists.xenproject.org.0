Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3906A8B807
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955728.1349427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QF-0000SF-6x; Wed, 16 Apr 2025 11:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955728.1349427; Wed, 16 Apr 2025 11:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QE-0000Kc-Jf; Wed, 16 Apr 2025 11:59:18 +0000
Received: by outflank-mailman (input) for mailman id 955728;
 Wed, 16 Apr 2025 11:59:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51QB-0006At-CV
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:15 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37b3e36b-1aba-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 13:59:15 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so32146835e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:15 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:13 -0700 (PDT)
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
X-Inumbo-ID: 37b3e36b-1aba-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804754; x=1745409554; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndy0JOtlK/bC2KJaj8i9qdYW+j1KeU0OftG9F4DlSoM=;
        b=W5PUoJV4Cbz53aVPvMV+PTTukz/QKOtf2oBkR3J8TI+XmVvaQHLRNP0n6dF3labp1Y
         7E2CSBYeC2dUilpHnv5wQoe0FEImV8u84+fpkz//BJoQkOhBN9XDZhmxKOguxRk7J8/q
         OR7opn7TLjXCYAumNjGml8Hj1qGnv8FX8Rs7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804754; x=1745409554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ndy0JOtlK/bC2KJaj8i9qdYW+j1KeU0OftG9F4DlSoM=;
        b=URXY3vYBP68+3j2zkyv7htW+a+/hJ63RWh30V0zo459jtHXdB8Gdpe10oRBFL5ZSji
         s5j6rn6tjGNI+WquQCkomrSSqSqxNEUJ+yekU141hfZ6ct92pvTZLD3SU3qu4laoV2lf
         9SosWGkXgsgJAYicx4MeM1MpB5cNaLcALXghRRXt0l14SUOxiFzmCWdAJ+UZabwEIfb4
         7Q03gGuZ81nQGF33i3qLrn5Bl5dbzFN93sV4U2qZnCjxYPHLGxZcGx1vZKytaIKf7JBH
         /LS6dqGAClcwg09mZDXGHGw5ViTKR1j6oz0N8JyCuJlhMEx6bckvpyI2lygF7Jgvz6cX
         9njg==
X-Gm-Message-State: AOJu0YxEh+VuYpx4+Quy2u7tSwxsYBo5vqMmFsqR+04o76aAralLTKlo
	ou2phkb4ncLa4HZ6Xp0Ub8G8yUPM8Nb836Jx96udh/rufRX3ZRKXLuDvIhrQGcDqlc0u7KuVMo3
	haAo=
X-Gm-Gg: ASbGncvG4GJrH5mNjgLqvAyq1HiyjCp3CkDl7JoYizQoT6ygiXJDMySdxHUQ+EKR+LG
	ecx/X9NTgLyDLPopuiQiT5/jP4teOQQ9FBe5W3AUIJmmGx2qQlZ8mq/WDd8UoIz1c9wjFNJsKQg
	xA/3Sv8ByQB8hmBxqL1WHzKkPWaz8Vasxsjkt5rd9VJpmhCPqle/x47NXOWEXzsh27C3LgWq9Y8
	kXcTLwxfGl2PUbCmtPbQt8YlrZYY6UTsPOF5QAIu+mJBNDyT3fhF0p4Qaw6oybKpcVcRUgkuZCB
	CBUTwFRHBEDW3edwgsy67Nf5YisERnhBkKPKfevjIj3JK0UAlHHR/vFOU4wUbPwGvbk45b7sGkf
	68oTmTY1+AhJIyiInSv7J3W1T
X-Google-Smtp-Source: AGHT+IHjitMFCJIsOumP7C7YLSXHYWhRq5UWsU2ckJinOJ8U3LIkkSfZML+N3VGJ5UBDzmHXLpes4g==
X-Received: by 2002:a05:600d:1:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-4405fbffccbmr7736715e9.30.1744804754200;
        Wed, 16 Apr 2025 04:59:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v6 12/15] arm: Remove asm/byteorder.h
Date: Wed, 16 Apr 2025 12:58:57 +0100
Message-Id: <20250416115900.2491661-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the common code moved fully onto xen/byteorder.h, clean up the dregs.

Sort includes in some files while swapping over to xen/byteorder.h.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

v5:
 * New
---
 xen/arch/arm/alternative.c           |  6 +++---
 xen/arch/arm/arm64/livepatch.c       |  2 +-
 xen/arch/arm/include/asm/arm32/io.h  |  3 ++-
 xen/arch/arm/include/asm/arm64/io.h  |  3 ++-
 xen/arch/arm/include/asm/byteorder.h | 14 --------------
 xen/arch/arm/kernel.c                |  2 +-
 xen/arch/arm/vgic/vgic-mmio.c        |  3 ++-
 7 files changed, 11 insertions(+), 22 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/byteorder.h

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index 2c1af6e7e426..adb9b7d8814b 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -6,18 +6,18 @@
  * Copyright (C) 2014-2016 ARM Ltd.
  */
 
+#include <xen/byteorder.h>
 #include <xen/init.h>
-#include <xen/types.h>
 #include <xen/kernel.h>
 #include <xen/llc-coloring.h>
 #include <xen/mm.h>
-#include <xen/vmap.h>
 #include <xen/smp.h>
 #include <xen/stop_machine.h>
 #include <xen/virtual_region.h>
+#include <xen/vmap.h>
+
 #include <asm/alternative.h>
 #include <asm/atomic.h>
-#include <asm/byteorder.h>
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
 #include <asm/page.h>
diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index 6efe4ec770d4..e135bd5bf99a 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -3,6 +3,7 @@
  */
 
 #include <xen/bitops.h>
+#include <xen/byteorder.h>
 #include <xen/errno.h>
 #include <xen/lib.h>
 #include <xen/livepatch_elf.h>
@@ -11,7 +12,6 @@
 #include <xen/vmap.h>
 
 #include <asm/bitops.h>
-#include <asm/byteorder.h>
 #include <asm/insn.h>
 #include <asm/livepatch.h>
 
diff --git a/xen/arch/arm/include/asm/arm32/io.h b/xen/arch/arm/include/asm/arm32/io.h
index 782b564809e3..fb0425e62930 100644
--- a/xen/arch/arm/include/asm/arm32/io.h
+++ b/xen/arch/arm/include/asm/arm32/io.h
@@ -21,8 +21,9 @@
 #ifndef _ARM_ARM32_IO_H
 #define _ARM_ARM32_IO_H
 
+#include <xen/byteorder.h>
+
 #include <asm/system.h>
-#include <asm/byteorder.h>
 
 static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
 {
diff --git a/xen/arch/arm/include/asm/arm64/io.h b/xen/arch/arm/include/asm/arm64/io.h
index 2e2ab24f7838..7d5959877759 100644
--- a/xen/arch/arm/include/asm/arm64/io.h
+++ b/xen/arch/arm/include/asm/arm64/io.h
@@ -20,8 +20,9 @@
 #ifndef _ARM_ARM64_IO_H
 #define _ARM_ARM64_IO_H
 
+#include <xen/byteorder.h>
+
 #include <asm/system.h>
-#include <asm/byteorder.h>
 #include <asm/alternative.h>
 
 /*
diff --git a/xen/arch/arm/include/asm/byteorder.h b/xen/arch/arm/include/asm/byteorder.h
deleted file mode 100644
index 7f1419c45a16..000000000000
--- a/xen/arch/arm/include/asm/byteorder.h
+++ /dev/null
@@ -1,14 +0,0 @@
-#ifndef __ASM_ARM_BYTEORDER_H__
-#define __ASM_ARM_BYTEORDER_H__
-
-#include <xen/byteorder.h>
-
-#endif /* __ASM_ARM_BYTEORDER_H__ */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 6eaf9e2b06b3..2647812e8e3e 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2011 Citrix Systems, Inc.
  */
+#include <xen/byteorder.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/guest_access.h>
@@ -15,7 +16,6 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
-#include <asm/byteorder.h>
 #include <asm/kernel.h>
 #include <asm/setup.h>
 
diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
index b4ba34cfc368..d2bcb32cd797 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -14,10 +14,11 @@
 
 #include <xen/bitops.h>
 #include <xen/bsearch.h>
+#include <xen/byteorder.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
+
 #include <asm/new_vgic.h>
-#include <asm/byteorder.h>
 
 #include "vgic.h"
 #include "vgic-mmio.h"
-- 
2.39.5


