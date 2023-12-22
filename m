Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F7881CBF1
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659412.1029053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDQ-0000Q4-VL; Fri, 22 Dec 2023 15:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659412.1029053; Fri, 22 Dec 2023 15:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDQ-0000N1-Qm; Fri, 22 Dec 2023 15:13:32 +0000
Received: by outflank-mailman (input) for mailman id 659412;
 Fri, 22 Dec 2023 15:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDQ-0007Ie-3c
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:32 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aae1dd13-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:31 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50e6bcca684so531274e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:31 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:30 -0800 (PST)
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
X-Inumbo-ID: aae1dd13-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258010; x=1703862810; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+kt5AigK7rVqFmhurbl+e1IZXdwgqzAuGxn4PNWXw8=;
        b=RHKBE9OuHMf4jkEAwNGZF37qfKCJXU8RuCJANgnxGSRU+Zp4a4U7IkQrDLKpX+e5Vy
         Be/IJXtvG8Iuyk2FvM5UTwr2MkfMpM04FLDPP0wW1qOzsQtTlYS6qiVkL4ciZeSfuq+c
         Vh+kCyOJ5ecOFIU9XwDCi+1/1hUKg8Yd1O1XknIdKEQvuHCqVxOW/xXabfkkUfhMvlJ/
         yF7UkLQtPx5ZPm7wjkjK5bghX5d9wnxIKs+roDetweRDbNEm5d+xxudK6QfzEygXG9q/
         9zLQpixjRn5rcNiZkGaMJG491Mui3JCuNGo/bgYjt9h/ADCSbX6cH3/3bvLO0gtR94sw
         AEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258010; x=1703862810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+kt5AigK7rVqFmhurbl+e1IZXdwgqzAuGxn4PNWXw8=;
        b=A4BIy3Uj1k2HDAge8W5ZWis5SoaOY3mhX9KUv0Ws9O5WGEcZVUA8mYCdFu2lUdUJFD
         ubhd9LRPKXRHGqCQLS0juTI3zOCmKJvPi5+ZICxdySMkegLgzC/sRHzIuA25ZCifYPiR
         0hKZ6Z7mo5Ti08eVhaB03nbbeLnQ5P91FcT3cFS2hy2Ev0SNu14eOYnKfVdlqLaHnuel
         gcXi/dKIHjfnTFqqHS8MQZEsfO1Lsx6HlZ/hQXTmzz/lFk0B1hUZTCn5gmxFzA1EcbPE
         kb3YfL1dxCTdQ9n/x84Oor1mS9lrn34CY84DdpTzLnrv9l5/T9bhQa+G/SLpIwYqKuQ3
         wAqw==
X-Gm-Message-State: AOJu0Yx8fKEr/+/qCXR+8Y5zwM2c2PwAyRvSk8iMgNZc+ECOzls2CCqf
	lFnggAneZcNbnMRWAukZzkOMm7UmwqI=
X-Google-Smtp-Source: AGHT+IFnHS146v3pWVOKbv24Ye76LXeE/ahHJ1qCkyDhXubqUwiTb8fSXnpsOXcKj6SZtVRuNyqcig==
X-Received: by 2002:a19:7703:0:b0:50e:6f89:a149 with SMTP id s3-20020a197703000000b0050e6f89a149mr52393lfc.11.1703258010408;
        Fri, 22 Dec 2023 07:13:30 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 07/34] xen/asm-generic: introdure nospec.h
Date: Fri, 22 Dec 2023 17:12:51 +0200
Message-ID: <a1360d3de3da8757c69f11c3fafd99ff65654ae8.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The <asm/nospec.h> header is similar between Arm, PPC, and RISC-V,
so it has been moved to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - new patch.
---
 xen/arch/arm/include/asm/Makefile                 |  1 +
 xen/arch/ppc/include/asm/Makefile                 |  1 +
 xen/arch/ppc/include/asm/nospec.h                 | 15 ---------------
 xen/arch/riscv/include/asm/Makefile               |  1 +
 .../include/asm => include/asm-generic}/nospec.h  | 10 +++++-----
 5 files changed, 8 insertions(+), 20 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/nospec.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/nospec.h (54%)

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index c3f4291ee2..dfb4e9e45c 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -3,6 +3,7 @@ generic-y += altp2m.h
 generic-y += device.h
 generic-y += hardirq.h
 generic-y += iocap.h
+generic-y += nospec.h
 generic-y += numa.h
 generic-y += paging.h
 generic-y += percpu.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index adb752b804..0e96ad54c3 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -5,6 +5,7 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
+generic-y += nospec.h
 generic-y += numa.h
 generic-y += paging.h
 generic-y += percpu.h
diff --git a/xen/arch/ppc/include/asm/nospec.h b/xen/arch/ppc/include/asm/nospec.h
deleted file mode 100644
index b97322e48d..0000000000
--- a/xen/arch/ppc/include/asm/nospec.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/* From arch/arm/include/asm/nospec.h. */
-#ifndef __ASM_PPC_NOSPEC_H__
-#define __ASM_PPC_NOSPEC_H__
-
-static inline bool evaluate_nospec(bool condition)
-{
-    return condition;
-}
-
-static inline void block_speculation(void)
-{
-}
-
-#endif /* __ASM_PPC_NOSPEC_H__ */
diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
index adb752b804..0e96ad54c3 100644
--- a/xen/arch/riscv/include/asm/Makefile
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -5,6 +5,7 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
+generic-y += nospec.h
 generic-y += numa.h
 generic-y += paging.h
 generic-y += percpu.h
diff --git a/xen/arch/arm/include/asm/nospec.h b/xen/include/asm-generic/nospec.h
similarity index 54%
rename from xen/arch/arm/include/asm/nospec.h
rename to xen/include/asm-generic/nospec.h
index 51c7aea4f4..5ded9746f3 100644
--- a/xen/arch/arm/include/asm/nospec.h
+++ b/xen/include/asm-generic/nospec.h
@@ -1,8 +1,8 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved. */
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_GENERIC_NOSPEC_H
+#define _ASM_GENERIC_NOSPEC_H
 
-#ifndef _ASM_ARM_NOSPEC_H
-#define _ASM_ARM_NOSPEC_H
+#include <xen/stdbool.h>
 
 static inline bool evaluate_nospec(bool condition)
 {
@@ -13,7 +13,7 @@ static inline void block_speculation(void)
 {
 }
 
-#endif /* _ASM_ARM_NOSPEC_H */
+#endif /* _ASM_GENERIC_NOSPEC_H */
 
 /*
  * Local variables:
-- 
2.43.0


