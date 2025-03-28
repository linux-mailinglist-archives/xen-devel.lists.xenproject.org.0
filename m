Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6BA74B66
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930675.1333358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0x-0008Og-LZ; Fri, 28 Mar 2025 13:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930675.1333358; Fri, 28 Mar 2025 13:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0x-0008DN-3E; Fri, 28 Mar 2025 13:44:51 +0000
Received: by outflank-mailman (input) for mailman id 930675;
 Fri, 28 Mar 2025 13:44:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0u-0005Dp-VT
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:48 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d03d945b-0bda-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 14:44:47 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso1165808f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:47 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:46 -0700 (PDT)
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
X-Inumbo-ID: d03d945b-0bda-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169486; x=1743774286; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndy0JOtlK/bC2KJaj8i9qdYW+j1KeU0OftG9F4DlSoM=;
        b=Jg3jnfNuv7NeEnD+o5BITmYdbPH0xSFgDOuuHWlSb9PhhDr25Lm/KWtz14JM2zw3fO
         3zGGfLcJhJyH4N23uEUXtx+cHeFcQpRQeWuQw2KQizAmx/9L07m3WoUMSPnWfOfB4HA6
         yJ5U3RdSnxwTc3AvPbZekyEuKq4q1c1xf+xcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169486; x=1743774286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ndy0JOtlK/bC2KJaj8i9qdYW+j1KeU0OftG9F4DlSoM=;
        b=G+T6i2KCPO8KsLd5DVZIXpy34VQV3yHu+BMH7X32KONpMAt8fJKAgVYSvXYIv3FQz/
         k27dJO4W3TQ4y4pnRjDPuUkqAN86dkcp50Oc0QU3WR3VTpO6//E73szeYOmwtgyghYQZ
         JcdUTm4NquJSBX866A2wLI71Hq7/Hv6x0VTFODR1tm+R0E7EuphXpACBJrtCUHvvBCzE
         GJHbLg3V0D+8kkoPigP3l6pL9JUi7DrNzPKXlVr2p9exUYhnGJq92QvGg98zlV85dusH
         X0Ftm576COAvQuZ6SpTa3lZ6oObW/JNtoofqjjqgFc/LpVrw6WFuAA7eH4tGkk08v/D5
         tpoQ==
X-Gm-Message-State: AOJu0YzlPQPzw7/riQt/i4RSEG/nrzbIJFSaguIGLsnMLB8KNXNDO/ow
	DpTrDHN7u0M5XnOuC8h5L3dXds2laYalYb8O9VCc8iaskZErcWqBjnQbeXDzXLUXjl5ga99SGLR
	gduc=
X-Gm-Gg: ASbGnctzW2ZlGRCdlAqVlWdNUBJvj8Hbe9BU0XEiiitWtOLQQLIaDcroaAFUySIB3MH
	IqUj4HIi/XGRLHL+dD4KQ0yQUJznrxf45qeMu15ztnrdNrMX9jb+oBOu178MqB650Txj5S90K14
	Yfu4NGgXQ9biw5fE3RnbeOb1UvIhE7J3p/5oo68PhqFTbSct4oJSYhsikKhzUBkt6FnmImmERBH
	P9cq67uSRX1WtAQFdTA66rtkqSo9UNLirpyM1G4XCSWcfzHIStjp9c/htAY+Ggxol0cjBmVm7zP
	xDXUV+KUP78tgHjg7ld/Ypb0AY6UER585vugrYY7ktl/9vPq2Wwa3XrgCd0SgxWn1W8By9kpHmO
	k1qkE1Em+t0eN4kb77bLw4wSLTM7+
X-Google-Smtp-Source: AGHT+IEZCb8zah9M+EwsxZJjuqRbSRKz3ql1yONsqA24plQVJp2eXkMTTqoezHlITccAeP0+Ht90FQ==
X-Received: by 2002:a05:6000:2d10:b0:39a:d336:16 with SMTP id ffacd0b85a97d-39ad33600edmr3783728f8f.34.1743169486526;
        Fri, 28 Mar 2025 06:44:46 -0700 (PDT)
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
Subject: [PATCH v5 13/16] arm: Remove asm/byteorder.h
Date: Fri, 28 Mar 2025 13:44:24 +0000
Message-Id: <20250328134427.874848-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
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


