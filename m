Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED01A5CAA9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 17:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908731.1315853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2Ko-0002hB-AG; Tue, 11 Mar 2025 16:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908731.1315853; Tue, 11 Mar 2025 16:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2Ko-0002cr-5D; Tue, 11 Mar 2025 16:20:02 +0000
Received: by outflank-mailman (input) for mailman id 908731;
 Tue, 11 Mar 2025 16:20:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHpu=V6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ts2Km-0002GP-QC
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 16:20:00 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad2f2ec2-fe94-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 17:19:58 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5dca468c5e4so11032476a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 09:19:58 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c74a9303sm8706016a12.42.2025.03.11.09.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 09:19:57 -0700 (PDT)
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
X-Inumbo-ID: ad2f2ec2-fe94-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741709998; x=1742314798; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Yt18gcQ1yC9rvNCINUWZVXIFi/Nspn28W4yOKXTQyE=;
        b=SeXNRVOpoPyTXO1VOIE5nglyWT9B2o45+dkQtJhNwv+9DgmEDzZ5lhgmi8aWKY6SBM
         V+HV0M3ZDdJ+bjqVXC072+9+SMDwDrZ5aIw270sYN45MRIJ33nCoLy4YGtVQB/HpC5ZY
         PtiOsO7U88SM0ekoFNfsBlqstwlsc/2uoz86CVyX6bsMmhD1c3UbZ436mOkFNH+4CbZk
         8YVc8ho6MG5Qs7BGHxDw71WvxTFd+tnok5LJREtI5wxRdRyNvX3YceffzaJMj2oY6jtc
         yMrLUqTWElC4E9CqGNRdBJul9A7d3h9B2DOy09HxNO1J1MQ34lqch1Am56s2mABWg8Ow
         yFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741709998; x=1742314798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Yt18gcQ1yC9rvNCINUWZVXIFi/Nspn28W4yOKXTQyE=;
        b=MXSrGvNWpr5VFByIiw6/sE+jIxPXrZww547tCU0Ryz4Av0CzBY70jZhix3QbwQbzWY
         t4JZjnoaveSGLPju5wb3GkQn30+dSIJawTCc6YpLQ/STrLT3rlxR5JOTFPjpS+D2M59D
         IpHGobUeBQLj/yx7xrEAjhSnHLsUUNF3Duwfvuyk0P+zE0iIeO1jGG5UBniQhIISlz5T
         kULPz/yCMnvp3IMxkD8wKqpPVmSBq+hfU4I6EG1jut4nGgUDpjDr5H4G5xBQRkKwefFK
         iE+Les03p3SX2BPu+MWMvS8jVS4+bfP6JZJZHdkWOJGjRrNF+dUuuyh50JCcy+UyAYYN
         gPPQ==
X-Gm-Message-State: AOJu0Yx8AfzL7wonM3y3Nbcdn7YuE73Xhv209YRejx8Px8RIU9qpn9gv
	p+4mtlvBpm8Yn26eZ5KlfkKRLvCjtleNjkrSq9hhvDi+zH2GGILv3w99DQ==
X-Gm-Gg: ASbGncuAEMcZajmw+lA9qjJdYf7kC3rKyYLXMb140jUaJrYedG4QfDednh4JcFG/J4D
	rkaCWjvXNBtY15mBPoH7jk8JHakWwiytFszOE7uk3Jb43X50DFtmyCC/PfCewAngKXSrVbtOOt2
	0UIdKwN8OHHYcuDMIOJ2bOd1vU41fvYzYR70e2+LkRLeQGAdyQm24zJg+jqpD8rz51EnLgwCdcs
	LxzRvb4ZGjjrZAC5eScIpuP6uiHOoNwjtj++AawXenvXetd9VGHNPr7Q3lnAK4SC92vY/RYs9/V
	zMeqnc62Betac/rctqYpGygCp+FrrN1bHKpsPVeZYuxRH7lU4NCKYXLhSSnDAB8Lkqe3gj2qV2a
	ZO2cWVln+RRBNkA==
X-Google-Smtp-Source: AGHT+IF+VJjado6lRs7C2itypF7Vkd2vqg41aeZMyC655n240kmKRCaVI0urIwO7FOLZ318p2ifCNw==
X-Received: by 2002:a05:6402:3594:b0:5e6:4ac8:c361 with SMTP id 4fb4d7f45d1cf-5e64ac8c790mr15505247a12.28.1741709997755;
        Tue, 11 Mar 2025 09:19:57 -0700 (PDT)
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
Subject: [PATCH v1 4/4] xen/riscv: introduce intc_preinit()
Date: Tue, 11 Mar 2025 17:19:51 +0100
Message-ID: <d89d647a0b71b0a0bc8aeb90395b28bcab15074e.1741709885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, only the device tree method is available to locate and perform
pre-initialization steps for the interrupt controller. When `acpi_disabled`
is true, the system will scan for a node with the "interrupt-controller"
property and then call `device_init()` to validate if it is an expected
interrupt controller and if yes then save this node for further usage.

If `acpi_disabled` is false, the system will panic, as ACPI support is not
yet implemented for RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


