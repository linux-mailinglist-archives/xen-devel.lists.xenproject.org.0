Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86254A7084D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:37:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926817.1329662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8D7-0000hr-11; Tue, 25 Mar 2025 17:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926817.1329662; Tue, 25 Mar 2025 17:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8D6-0000dh-TW; Tue, 25 Mar 2025 17:37:08 +0000
Received: by outflank-mailman (input) for mailman id 926817;
 Tue, 25 Mar 2025 17:37:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogJ6=WM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tx8D5-0000Qx-VR
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:37:07 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5ea9d0c-099f-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 18:37:07 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac297cbe017so13710766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 10:37:07 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efb65871sm897012066b.96.2025.03.25.10.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 10:37:05 -0700 (PDT)
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
X-Inumbo-ID: c5ea9d0c-099f-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742924227; x=1743529027; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rULmv9ycnH1A0yzpu+OMW8L+kKFgN+RXzTeCgFhTv8U=;
        b=WvC4DrTM9zG+2N7j0bQPadYTLtvfSIEZ21tNvVt346bqY50ZZjSVmc/I2Ywu2mNm7c
         dQ+KGz5/b7mbbo7IPmq1Le5OkCJ4BcsAvIc3TBv+LTh6cLSiSH2aW6oTjWXip5SE1bwK
         EBHpWkzDXO4rAu7ecILWSLmQ1GUCj0+5dzGInBedZJ99DSYjmHKsBuf8FdCQ2pWE8HCa
         uosScMl5Sgta8yuDq7lB76q0TJjH46zUKZ17+qSbyHVnf/4TWoKPhAZpLVq549EOq/mB
         5FhQ0KM5mvUg1fBZcX6M2xeshFPRJPjNuF7SH7HQnKQdb5RmL/P+IFchBYz3JyyKan2y
         72cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742924227; x=1743529027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rULmv9ycnH1A0yzpu+OMW8L+kKFgN+RXzTeCgFhTv8U=;
        b=CyX4wWckX89kDI3K7gqomkPoWRUvWMyBJJDtHqVW9UwNDUyE3kbExWVDuZA3gOrKce
         ljAMdNsndB3s3zTOUQ031D1YiSS7onysVLOCevBoglc+aS6K1T0h7gdAs/qcSJNg44v4
         HEk2aW4sNZnGp1wMXG5JD0K/6M3rXQqFY0HJnSqvwz3zfnbStE3ymvZ3m4aDH7DWlk3U
         A65HB/XL9BsHAG792db4zretwCZGfQAQJcxd2sMCx2PtrdMk7mWn95A3z/C9uS7cmBbR
         qonbcd5jtUeJ+SWDyU66qahZJumTR66uAfuVCuGCoNpFnnz3O/X3rJeJNFMpfz8H4tSC
         oyYQ==
X-Gm-Message-State: AOJu0YxxKFJNrRpw07vlto6gOKSe6J8NecwrliHIdE1nW9dgqr7cP7Eo
	o38gokAtE9FuCz9aCBt35AV1guOmSdW4i1vacOKCxVQflfPuIsuOadHQ6A==
X-Gm-Gg: ASbGncuOf6KMkWlu0tgqZiX5IIODuLb7Z86xITIkPLlXgFxvhVvkaee/XPSbPZEnpM/
	SjO3DFYOSv/QRJHkU1QxxggNW0Qeb0Iz5pB2wi+3+W3ffoFl0UWPm8Xy2o4WaD5FmrA9pEHt3Eh
	J5zoJKzbDLnG1NOVQFknqsu75BRI0vAJRZ2UD33Jur2CJZSUTqAbJzF5vIhFWTrnKnuJ/RCq2H4
	s89lOD+SzmBMKqRTOjyLMTSKGybp9D9Apvml3mQtCbU9MOqfE83tBvxcyrfVHJGwJxDNue75akD
	NQiY94zj8yw58F4kGZjX4v5mSlb3VUqW18CIUeOInb2XJIKdO10PNJRFtXO+1LEXJjKRkRDvfcX
	wEcQlF2/Ndw2bCA==
X-Google-Smtp-Source: AGHT+IGzfaRCnzLnTAgLUcqXTkYf64vr0phicvjXgIyFK6kSvdSKl4A48jO+rc6JsIs9JfGEkXrmaQ==
X-Received: by 2002:a17:907:7212:b0:ac2:d5d3:2b77 with SMTP id a640c23a62f3a-ac6e0a25ad2mr68355266b.8.1742924226447;
        Tue, 25 Mar 2025 10:37:06 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/4] xen/riscv: introduce intc_preinit()
Date: Tue, 25 Mar 2025 18:37:00 +0100
Message-ID: <eedcc238a88ca10e9d1733443d8ec07832e4e33e.1742918184.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
References: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, only the device tree method is available to locate and perform
pre-initialization steps for the interrupt controller (at the moment, only
one interrupt controller is going to be supported). When `acpi_disabled`
is true, the system will scan for a node with the "interrupt-controller"
property and then call `device_init()` to validate if it is an expected
interrupt controller and if yes then save this node for further usage.

If `acpi_disabled` is false, the system will panic, as ACPI support is not
yet implemented for RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Update the commit message.
---
 xen/arch/riscv/Makefile           |  1 +
 xen/arch/riscv/include/asm/intc.h |  2 ++
 xen/arch/riscv/intc.c             | 14 ++++++++++++++
 xen/arch/riscv/setup.c            |  3 +++
 4 files changed, 20 insertions(+)
 create mode 100644 xen/arch/riscv/intc.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index dd5fd25c7d..0c6c4a38a3 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -2,6 +2,7 @@ obj-y += aplic.o
 obj-y += cpufeature.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
+obj-y += intc.o
 obj-y += mm.o
 obj-y += pt.o
 obj-$(CONFIG_RISCV_64) += riscv64/
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index ff9bb33896..52ba196d87 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -17,4 +17,6 @@ struct intc_info {
     const struct dt_device_node *node;
 };
 
+void intc_preinit(void);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
new file mode 100644
index 0000000000..4061a3c457
--- /dev/null
+++ b/xen/arch/riscv/intc.c
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/acpi.h>
+#include <xen/device_tree.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+
+void __init intc_preinit(void)
+{
+    if ( acpi_disabled )
+        intc_dt_preinit();
+    else
+        panic("ACPI interrupt controller preinit() isn't implemented\n");
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 836ad16fed..4e416f6e44 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -16,6 +16,7 @@
 #include <asm/cpufeature.h>
 #include <asm/early_printk.h>
 #include <asm/fixmap.h>
+#include <asm/intc.h>
 #include <asm/sbi.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
@@ -128,6 +129,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     preinit_xen_time();
 
+    intc_preinit();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.48.1


