Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE19A7DCA79
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 11:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625592.975027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlkk-0003HN-Sz; Tue, 31 Oct 2023 10:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625592.975027; Tue, 31 Oct 2023 10:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlkk-0003Dz-On; Tue, 31 Oct 2023 10:13:42 +0000
Received: by outflank-mailman (input) for mailman id 625592;
 Tue, 31 Oct 2023 10:13:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rkuq=GN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qxlkj-0003BG-9k
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 10:13:41 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29c4d5d1-77d6-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 11:13:40 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so7849208e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 03:13:40 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 e3-20020ac25463000000b005041cc98273sm164308lfn.300.2023.10.31.03.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 03:13:39 -0700 (PDT)
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
X-Inumbo-ID: 29c4d5d1-77d6-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698747219; x=1699352019; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/+UGoB/YVkCPzNK+d54Zw2EOnbrcrfW9mhrCGDpErfM=;
        b=c4cwaa+zWFys8z/zaAiG0yuoPQt1YKHmA9CX52t3WGajZecJ1HA5NqICdFISHDh7JS
         96o5Wj+fDQBkVfD4L0LpIVR0ARE1jv75rgj98avLT1vrDryaDlwTfS9gALRV2le8dwco
         y1/AQhoiC7U/dZw4Sl6UqKKzEoXxTiuNNGwfuhMSUQ0BZvfO44I8c6dTKF0lVp5KWXJk
         90vSfYHKPcv/S+RfmDfc4vFVtaJYyJ6hs3UPf/dbRn8qAToO7L+NbmZUeWkGHr3G09/j
         HSt8GNvWcOChl1ReyFnsG5wHyO0O/Ik+s3n81aRJz5kzyc+5J+DrxxYdfarokFyJL0O6
         MD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698747219; x=1699352019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+UGoB/YVkCPzNK+d54Zw2EOnbrcrfW9mhrCGDpErfM=;
        b=ECFbyktYyEaLZ4+V2hpkCVIEu4FHplMiWIaX6gpTHTRiERJMz57MILBw9m5foRgoGZ
         vGuMQ5L7Tph4bWCMdcK5ROP55WIC2vRDiYTA+qVKnucI7ivLIdo/QGgN3WE/mmiDM14D
         Eurdn+Zgn1bdxyjudVKo13IpsJiEDG3/ahLvGYKTphdau+HnNSAErO81eTDBW3T90mBE
         WZIXtLkjJYFI9kAmJt8H72k675aWfdlfkVT/rT/TIScV8Jhqma8y9toRw3C09J8XEzYl
         /hZ17G7+SzILITnJLEfbsFLYCpLY4qPZvNxHiX6u8/0CreIfwz4qga6/717B9ET/AJ3g
         JxkQ==
X-Gm-Message-State: AOJu0Ywovz/oVi/2XfAI/GC3pRvPE/CbaNYr+pYnUc9ZZ8QyvvgN7og8
	wQgLjI1wbdd3ZdkHjhjnXzeJ4mzNpe8=
X-Google-Smtp-Source: AGHT+IGydhocY4QehMNETMHftdd6w2MVIet3NE6G8sfD8CyNCL8MBQ6QAw5ItLTb5+5oa0xodIel5A==
X-Received: by 2002:a05:6512:488a:b0:502:d743:8a6c with SMTP id eq10-20020a056512488a00b00502d7438a6cmr8517233lfb.9.1698747219268;
        Tue, 31 Oct 2023 03:13:39 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen: remove <asm/delay.h>
Date: Tue, 31 Oct 2023 12:12:42 +0200
Message-ID: <a9eb7c50e99db286d011169030c6ef1d92f3da23.1698747162.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

<asm/delay.h> only declares udelay() function so udelay()  
declaration was moved to xen/delay.h.

For x86, __udelay() was renamed to udelay() and removed
inclusion of <asm/delay.h> in x86 code.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/include/asm/delay.h   | 14 --------------
 xen/arch/riscv/include/asm/delay.h | 13 -------------
 xen/arch/x86/cpu/microcode/core.c  |  2 +-
 xen/arch/x86/delay.c               |  2 +-
 xen/arch/x86/include/asm/delay.h   | 13 -------------
 xen/include/xen/delay.h            |  3 ++-
 6 files changed, 4 insertions(+), 43 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/delay.h
 delete mode 100644 xen/arch/riscv/include/asm/delay.h
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
diff --git a/xen/arch/riscv/include/asm/delay.h b/xen/arch/riscv/include/asm/delay.h
deleted file mode 100644
index 2d59622c75..0000000000
--- a/xen/arch/riscv/include/asm/delay.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
- * Copyright (C) 2016 Regents of the University of California
- */
-
-#ifndef _ASM_RISCV_DELAY_H
-#define _ASM_RISCV_DELAY_H
-
-#define udelay udelay
-extern void udelay(unsigned long usecs);
-
-#endif /* _ASM_RISCV_DELAY_H */
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index c3fee62906..48822360c0 100644
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
index 9d70ef035f..a5189329c7 100644
--- a/xen/include/xen/delay.h
+++ b/xen/include/xen/delay.h
@@ -3,8 +3,9 @@
 
 /* Copyright (C) 1993 Linus Torvalds */
 
-#include <asm/delay.h>
 #define mdelay(n) (\
 	{unsigned long msec=(n); while (msec--) udelay(1000);})
 
+void udelay(unsigned long usecs);
+
 #endif /* defined(_LINUX_DELAY_H) */
-- 
2.41.0


