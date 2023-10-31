Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F14C7DCF34
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 15:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625829.975518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpj3-0000cA-Tr; Tue, 31 Oct 2023 14:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625829.975518; Tue, 31 Oct 2023 14:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpj3-0000Zh-QZ; Tue, 31 Oct 2023 14:28:13 +0000
Received: by outflank-mailman (input) for mailman id 625829;
 Tue, 31 Oct 2023 14:28:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rkuq=GN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qxpj3-0000Zb-0f
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 14:28:13 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8715eaf-77f9-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 15:28:12 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c5210a1515so82881591fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 07:28:12 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g36-20020a0565123ba400b005041ce44bbdsm222423lfv.5.2023.10.31.07.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 07:28:10 -0700 (PDT)
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
X-Inumbo-ID: b8715eaf-77f9-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698762491; x=1699367291; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PeoBK4eZojRJWM9XP3Nhwb/OMadMJxCx1vrYbxWtSFA=;
        b=mtcRLIQrU6rmL8wFTe6rY8za4nqkYjP2OC/HVVdcaW2b6tYShruiB6OeVbnDxtTirp
         OOS0RFFIFidymxYnnD+nNy+cPOqDVD/DeFn5Vwy49LNNAReENTAW1VjVxYSkVn9qIzzd
         Um3bwoduHkfE6hkYVe5JDxMpFQNMIzQ40VzVTATLdb2QhsMJ1h7VEAXfERtbFEUUcFQO
         RxBRLslEoBACCbk788QyZPlKCJWvl4YXhDPrwQCx9MD26cqXfZD78MrjScTHTB5kuNnF
         yhK57bpv/0Q7J6BCbfwjpAQz7FdPxFU9DlQOIbE8HUve6uvjNweN+uMcntmPHCLn8Ug8
         tyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698762491; x=1699367291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PeoBK4eZojRJWM9XP3Nhwb/OMadMJxCx1vrYbxWtSFA=;
        b=w30w5+XgdaLz0M7QSkhLO9AaOgUSfXNMxiEtxmCgSbqRyJQXq2QHGmWe8YBk3b4m62
         J+9ZiuFY6kyLSdKqvfMM7kaHH0E7d33j0muQBpnyum2K+VqajDazm/51Yr5mUQt8CJAt
         j5nokccU9mAwt8iAmKDhVp2w9mBNMI3K442tx4Kk5sXvPO3Mu7rVA28iQLtr+6dzM4N8
         9MaVOcMAnD1HGAjGTnEp69uzsMZOGSN/P74eXmfNvLbpgxW5bT23xaoayW2aBEtec02x
         KhnvA6AcjKwd7uxjbtC/2zM30wMExIYYr9jxBaAfQg+Sd4+vcU9uciWUk5DTyLruijyl
         Jzdw==
X-Gm-Message-State: AOJu0Yz26neU2ECZWolqahWysiwDFu+D3znJqJL+9kE9Ax6pCzbckcRM
	i1DmtaTIUsLjemPMoqDwOXoNdeckrnI=
X-Google-Smtp-Source: AGHT+IHYT4gMQTkO0pLFGTJSIZKpFv0myU3OaygMxvVU64X6bYhV27VdHmt2gn/RuUOnRLr20YIdgg==
X-Received: by 2002:a05:6512:52c:b0:509:dee:f70c with SMTP id o12-20020a056512052c00b005090deef70cmr7343122lfc.27.1698762490845;
        Tue, 31 Oct 2023 07:28:10 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] xen: remove <asm/delay.h>
Date: Tue, 31 Oct 2023 16:28:07 +0200
Message-ID: <3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

<asm/delay.h> only declares udelay() function so udelay()
declaration was moved to xen/delay.h.

For x86, __udelay() was renamed to udelay() and removed
inclusion of <asm/delay.h> in x86 code.

For ppc, udelay() stub definition was moved to ppc/stubs.c.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
 - rebase on top of the latest staging.
 - add Suggested-by:/Reviewed-by: Jan Beulich <jbeulich@suse.com>.
 - remove <asm/delay.h> for PPC.
 - remove changes related to RISC-V's <asm/delay.h> as they've not
   introduced in staging branch yet.
---
 xen/arch/arm/include/asm/delay.h  | 14 --------------
 xen/arch/ppc/include/asm/delay.h  | 12 ------------
 xen/arch/ppc/stubs.c              |  7 +++++++
 xen/arch/x86/cpu/microcode/core.c |  2 +-
 xen/arch/x86/delay.c              |  2 +-
 xen/arch/x86/include/asm/delay.h  | 13 -------------
 xen/include/xen/delay.h           |  2 +-
 7 files changed, 10 insertions(+), 42 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/delay.h
 delete mode 100644 xen/arch/ppc/include/asm/delay.h
 delete mode 100644 xen/arch/x86/include/asm/delay.h

diff --git a/xen/arch/arm/include/asm/delay.h b/xen/arch/arm/include/asm/delay.h
deleted file mode 100644
index 042907d9d5..0000000000
--- a/xen/arch/arm/include/asm/delay.h
+++ /dev/null
@@ -1,14 +0,0 @@
-#ifndef _ARM_DELAY_H
-#define _ARM_DELAY_H
-
-extern void udelay(unsigned long usecs);
-
-#endif /* defined(_ARM_DELAY_H) */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/ppc/include/asm/delay.h b/xen/arch/ppc/include/asm/delay.h
deleted file mode 100644
index da6635888b..0000000000
--- a/xen/arch/ppc/include/asm/delay.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_DELAY_H__
-#define __ASM_PPC_DELAY_H__
-
-#include <xen/lib.h>
-
-static inline void udelay(unsigned long usecs)
-{
-    BUG_ON("unimplemented");
-}
-
-#endif /* __ASM_PPC_DELAY_H__ */
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 4c276b0e39..a96e45626d 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -337,3 +337,10 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
 {
     BUG_ON("unimplemented");
 }
+
+/* delay.c */
+
+void udelay(unsigned long usecs)
+{
+    BUG_ON("unimplemented");
+}
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 65ebeb50de..22d5e04552 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -23,6 +23,7 @@
 
 #include <xen/alternative-call.h>
 #include <xen/cpu.h>
+#include <xen/delay.h>
 #include <xen/earlycpio.h>
 #include <xen/err.h>
 #include <xen/guest_access.h>
@@ -35,7 +36,6 @@
 
 #include <asm/apic.h>
 #include <asm/cpu-policy.h>
-#include <asm/delay.h>
 #include <asm/nmi.h>
 #include <asm/processor.h>
 #include <asm/setup.h>
diff --git a/xen/arch/x86/delay.c b/xen/arch/x86/delay.c
index 2662c26272..b3a41881a1 100644
--- a/xen/arch/x86/delay.c
+++ b/xen/arch/x86/delay.c
@@ -15,7 +15,7 @@
 #include <asm/msr.h>
 #include <asm/processor.h>
 
-void __udelay(unsigned long usecs)
+void udelay(unsigned long usecs)
 {
     unsigned long ticks = usecs * (cpu_khz / 1000);
     unsigned long s, e;
diff --git a/xen/arch/x86/include/asm/delay.h b/xen/arch/x86/include/asm/delay.h
deleted file mode 100644
index 9be2f46590..0000000000
--- a/xen/arch/x86/include/asm/delay.h
+++ /dev/null
@@ -1,13 +0,0 @@
-#ifndef _X86_DELAY_H
-#define _X86_DELAY_H
-
-/*
- * Copyright (C) 1993 Linus Torvalds
- *
- * Delay routines calling functions in arch/i386/lib/delay.c
- */
-
-extern void __udelay(unsigned long usecs);
-#define udelay(n) __udelay(n)
-
-#endif /* defined(_X86_DELAY_H) */
diff --git a/xen/include/xen/delay.h b/xen/include/xen/delay.h
index 9150226271..8fd3b8f99f 100644
--- a/xen/include/xen/delay.h
+++ b/xen/include/xen/delay.h
@@ -3,7 +3,7 @@
 
 /* Copyright (C) 1993 Linus Torvalds */
 
-#include <asm/delay.h>
+void udelay(unsigned long usecs);
 
 static inline void mdelay(unsigned long msec)
 {
-- 
2.41.0


