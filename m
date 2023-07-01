Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 436457447A8
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 09:19:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557780.871474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsq-0008V3-CB; Sat, 01 Jul 2023 07:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557780.871474; Sat, 01 Jul 2023 07:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsp-0008Mf-UT; Sat, 01 Jul 2023 07:19:03 +0000
Received: by outflank-mailman (input) for mailman id 557780;
 Sat, 01 Jul 2023 07:19:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFUsn-0006No-Mk
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 07:19:01 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c2d35ba-17df-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 09:18:59 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-765a1690003so243658785a.0
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jul 2023 00:18:59 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s19-20020aa78d53000000b00673e652985bsm4108866pfe.118.2023.07.01.00.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 00:18:57 -0700 (PDT)
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
X-Inumbo-ID: 8c2d35ba-17df-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688195938; x=1690787938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QhG22aQsFtoXwrbtiP3WpdRgLLL1OgLfVThRSuYPKs=;
        b=Xufe3eFixvp3WBnPziVs80DQh009NwLwQM6EmrmrWavtVCOa8YgwA9pfjao+cAXVas
         Kyh7NFdj2mutOKU6e/K9NmVnVRMHMvvsxAHM2H7s/wdfwNUJqty255GlKJlQCu5vQg96
         yMvmF4cr8adBv12o8hV8+Gb6TT1qKi+BOtZsVa9JgUGb91VptVwDYhxigH7Plvht5kFk
         hQ/2poKjMCSRtoxMxmmCSgVCA1NxfbetFR38XRkeTHBaPjoW/7sJORRNsEHFsi/D9xsE
         bZgAsWrgM4RD3RrSSUWizUz9rFrt4Au3FDfBgUA6zCTlgR7lva9PPIsa/Ji9tGStjP2z
         jB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688195938; x=1690787938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+QhG22aQsFtoXwrbtiP3WpdRgLLL1OgLfVThRSuYPKs=;
        b=GSxg7PyvpWJqFMZpfXtx4qBks6uNAhGXozvuXZ2cZ1yfOOFu1QKtUHoMcvfqJJUt6r
         4CORg7jPzuI8XbnNnt4uX3n46gBNqm+GtqQvIXgZVwrJsNJ1JFYldpCOVRmgvH9Tc1WL
         7h7vRafMgsXrYxY1LH6GF66MDx+J7vgSADyiYd4qVscK+VT1G1degNTGXEt7nt557F2z
         Z+Qu3S8dGuQuv6lGiaRnHbKksNOSrHPtJEA71jo/tb35V9kWyeMslQw1uhMVHcku6ZOX
         Ij40XVFrHazidwcutEJgyvVDMa7gHCgt6yhU2kuY0JduptZXUEWy4guetiTBkd3mmmf3
         3EYQ==
X-Gm-Message-State: AC+VfDxSRZ4h6HhRklzePlI35OemwAa2XePstlp/6nqR88wmfhsIMGzZ
	LO3NDhPIfC0mEVC7O0ZkdojQ+PlZG2Q=
X-Google-Smtp-Source: ACHHUZ6vQvz5edMFsBO0yDqxfBhGyFJGqYSD7CweucRlegb7fUq3Gfct1s2EEfK8Q/Zr5W+gSLpFLg==
X-Received: by 2002:a05:620a:4010:b0:766:fa1f:4ea4 with SMTP id h16-20020a05620a401000b00766fa1f4ea4mr5546488qko.1.1688195938407;
        Sat, 01 Jul 2023 00:18:58 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
	stefano.stabellini@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rich Persaud <persaur@gmail.com>
Subject: [PATCH 08/10] x86, arm, riscv: add per-arch bootinfo headers
Date: Sat,  1 Jul 2023 00:18:33 -0700
Message-Id: <20230701071835.41599-9-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701071835.41599-1-christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes to ensure that inclusion of <xen/bootinfo.h> succeeds in each
of the main archtecture builds and in the 32-bit early x86 boot build.

The <xen/bootinfo.h> header contains structures that will be used in efi
logic prior to the main start of Xen, so it needs to be suitable for
inclusion in Arm source files.

The same header will also be included in early x86 boot logic, where
asm/* headers are not reachable, and so they cannot be transitively
included, so a ifdef condition is needed to prevent an attempt to
include <asm/bootinfo.h> from within <xen/bootinfo.h> in that case.

The early x86 boot logic can then directly include <asm/bootinfo.h> via
a specified directory path where it can be included successfully.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---
New for v2 series.

 xen/arch/arm/include/asm/bootinfo.h   | 20 ++++++++++++++++++++
 xen/arch/riscv/include/asm/bootinfo.h | 20 ++++++++++++++++++++
 xen/include/xen/bootinfo.h            |  7 ++-----
 3 files changed, 42 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/bootinfo.h
 create mode 100644 xen/arch/riscv/include/asm/bootinfo.h

diff --git a/xen/arch/arm/include/asm/bootinfo.h b/xen/arch/arm/include/asm/bootinfo.h
new file mode 100644
index 0000000000..5316c87a3d
--- /dev/null
+++ b/xen/arch/arm/include/asm/bootinfo.h
@@ -0,0 +1,20 @@
+#ifndef __ARCH_ARM_BOOTINFO_H__
+#define __ARCH_ARM_BOOTINFO_H__
+
+struct __packed arch_bootmodule { };
+DEFINE_STRUCT_PTR_TYPE(arch_bootmodule);
+
+struct __packed arch_boot_info { };
+DEFINE_STRUCT_PTR_TYPE(arch_boot_info);
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/bootinfo.h b/xen/arch/riscv/include/asm/bootinfo.h
new file mode 100644
index 0000000000..5316c87a3d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bootinfo.h
@@ -0,0 +1,20 @@
+#ifndef __ARCH_ARM_BOOTINFO_H__
+#define __ARCH_ARM_BOOTINFO_H__
+
+struct __packed arch_bootmodule { };
+DEFINE_STRUCT_PTR_TYPE(arch_bootmodule);
+
+struct __packed arch_boot_info { };
+DEFINE_STRUCT_PTR_TYPE(arch_boot_info);
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index 8389da4f72..bf5586a76b 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -5,11 +5,8 @@
 #include <xen/compiler.h>
 #include <xen/mm-frame.h>
 
-#ifdef CONFIG_X86
-#include <asm/bootinfo.h>
-#else
-    struct arch_bootmodule { };
-    struct arch_boot_info { };
+#if defined CONFIG_X86 || CONFIG_ARM || CONFIG_RISCV
+# include <asm/bootinfo.h>
 #endif
 
 /* Boot module binary type / purpose */
-- 
2.25.1


