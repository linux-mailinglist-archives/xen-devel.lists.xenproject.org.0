Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977C97445A1
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 02:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557675.871297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWq-0001qb-9g; Sat, 01 Jul 2023 00:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557675.871297; Sat, 01 Jul 2023 00:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWq-0001hu-08; Sat, 01 Jul 2023 00:31:56 +0000
Received: by outflank-mailman (input) for mailman id 557675;
 Sat, 01 Jul 2023 00:31:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFOWo-0007yM-Lf
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 00:31:54 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac76a5b0-17a6-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 02:31:53 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-262e3c597b9so1620980a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 17:31:52 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s68-20020a632c47000000b0055b61cd99a1sm1824296pgs.81.2023.06.30.17.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 17:31:50 -0700 (PDT)
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
X-Inumbo-ID: ac76a5b0-17a6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688171511; x=1690763511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmW5UL4mCfeFM30iYwmo6ORQbNbEDrG26I97OFcvUzw=;
        b=mDKgu0N+J33pO8y0qR4pSU8R7axaOqaVgxvtdIbHJ/u5JctG4BQbpTI1b8p0w6bMxj
         vBWwRDK2eoOR5P9dkryVjt5TX0WBEPhbhga2jxGg5Vb61RbW9ZtEutPIhi/rZtxxBsR0
         4F8CEALSdMAiVUH7yX86MmPiH0ejByPiN5EDvdXMaR1DMEimhq7JT6vRvgTqUsL0cKUA
         vqUeyprCLh7K6Op05ef3VP0rWttXdevLjPaXqhhpPmeeJcaiY+GPx1vML2mt3/G5IcyM
         jtiWQEJFHX+gk4Id3se+AhfCekKQavsgUuRccMqLcTFrqcPs4SUl7LvaQHGFOEZYe+o0
         Xv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688171511; x=1690763511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CmW5UL4mCfeFM30iYwmo6ORQbNbEDrG26I97OFcvUzw=;
        b=dJYjYyFU1zKU79X4H1VUfv/78iWDGlpP22nyiB51VNVrLFGYb4OfB32ws7wAQpl1hF
         nH30KzAsEiM68Wy1G1O+gLcIBMMz+Pj9A2uVYyaTDZeRNSjvbONzRB0ecba0k24B8CH+
         /94dJhr7QlSDaecJsfUcKlKLEWPno6FwhJC59ySfjahmuOecVUQ2YjtGs02Zbc91A1ti
         Rc2U3zHJITVTkMCe7sS2UqLJawagpqqegaZ9aKrbu3KDKjWyEjRBdAPncCspz+FGjugL
         gWhehBNQy2jK+Zaz31SZIodqxB0RoEuz9PvvQlSVM9S7lfCpo8anJrPxc5Loa1r9+ukN
         pZEA==
X-Gm-Message-State: ABy/qLYG9wtwcn6sUvSNp3RnXiXciJQduXNhKU7nDwn0iXSkuyq4Qlma
	DRZP4zqn9xaV5TJoje/uu1SPpcn+1tg=
X-Google-Smtp-Source: APBJJlGMLddV7br5bz18vAf2YOGfu1jHgiMmcg8DV5OkPbHOCTMCceaaVMmcoUwcBKrRC46JWnECog==
X-Received: by 2002:a17:90a:f00c:b0:262:c9f4:141 with SMTP id bt12-20020a17090af00c00b00262c9f40141mr3264484pjb.42.1688171510911;
        Fri, 30 Jun 2023 17:31:50 -0700 (PDT)
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
Subject: [PATCH 09/11] x86, arm, riscv: add per-arch bootinfo headers to allow x86 boot include
Date: Fri, 30 Jun 2023 17:31:30 -0700
Message-Id: <20230701003132.2210306-10-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
References: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The <xen/bootinfo.h> header contains structures that will be used in efi
logic prior to the main start of Xen, so will soon be included in Arm
builds. This same header will also used in early x86 boot, where asm/*
headers are not reachable and yet it contains a needed include of
<asm/bootinfo.h>, so...

Add initial per-arch <asm/bootinfo.h> headers to Arm and RISC-V so that
inclusion of <asm/bootinfo.h> succeeds in each main arch build and then
gate that inclusion from <xen/bootinfo.h> on CONFIG variables so that it
does not take effect in the early x86 boot build where CONFIG_X86 is not
defined to prevent build failure there. The early x86 boot logic can
then directly include asm/bootinfo.h via a specified directory path to
bring in the necessary definitions.

Is this fantastic? No. Does it help? Yep.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

New for v2 series.
---
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


