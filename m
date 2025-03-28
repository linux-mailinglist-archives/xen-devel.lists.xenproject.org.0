Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32762A74EB6
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 17:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930973.1333497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyD2Y-0001jz-Rq; Fri, 28 Mar 2025 16:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930973.1333497; Fri, 28 Mar 2025 16:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyD2Y-0001hh-Nn; Fri, 28 Mar 2025 16:58:42 +0000
Received: by outflank-mailman (input) for mailman id 930973;
 Fri, 28 Mar 2025 16:58:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QVst=WP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tyD2X-00011d-GG
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 16:58:41 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e65dbb7e-0bf5-11f0-9ea4-5ba50f476ded;
 Fri, 28 Mar 2025 17:58:41 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5eb5ecf3217so4399092a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 09:58:40 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc16aae90sm1665004a12.15.2025.03.28.09.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 09:58:39 -0700 (PDT)
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
X-Inumbo-ID: e65dbb7e-0bf5-11f0-9ea4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743181120; x=1743785920; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3F8SefbWZUmJrgPRZAQY4Ulx3HIoSvhY6ydZ1zkGaiQ=;
        b=f8OzuAZVA7KxXw+Gp7JPkW2JdlqEzyIgJOU3bwnmJK+S2UTapH+N0b6Nc6KSEB9XZp
         hATe1VF7sf1yUupQSFpdZLHh536fq5rk6MK107IYYjqoi3t3TDQIgEf8UtsWVMuu55LB
         Kei5Y4wQTyxuAaXdrtohPV7Pe+BctyQnSOlgRMA1L8BHlOVX6DNuqnkcL8UEmMq4LElE
         BEWTLZYISg0xKWUCaeI1r8cGQ1C4b4v/ESGpYxdbVzsznM3RPf+RpA8EkRzBMo9xgPKX
         bkzYhGLzl64bbGQoOale7AncHhQGth+eJD4UWP3gOLTxPZFIS6YXL3trMixqvpksh4wy
         CEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743181120; x=1743785920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3F8SefbWZUmJrgPRZAQY4Ulx3HIoSvhY6ydZ1zkGaiQ=;
        b=OxHRJa6ZLE6RF+uhz0kQQlnS39g0cs0rwYgCx2aVXhos9DtEhpoZo+ZppRxntK4DU8
         6ATw3cq6ioOaNCrS7T/E/AOcYUtfuLNY/J64xnV85wKOEOcBw44/H0ZfDeuenVnfJIL4
         rWxbhKpE0BeWAKYQb3+etu36+Pt4TAc6RFL4gmymOmlZA5LnJLxpo9izceTxxlDsnowM
         JAgU/BOzcy+foMPjLPlpiV/VyMBFNdU5DPyStU3LI7uMTaQE7TLJd0v+toUZxivHCTWK
         ZOs1c3Gv3ZdkMdcs/KpQDcKpjbkEReorkGquQDmOIghL8tlsm0U19c3iNDdiVt7wfTwY
         0Pkg==
X-Gm-Message-State: AOJu0YzH1kxVytf92qtoc3lXIKeIIeoIrRCBDK4F91CycR/d419Lh58w
	jAT7rQLdF+gAzz4lJ/t5qmdUarOtOAbfiLBa9NFFgAzZ+G303sZNqGCWEA==
X-Gm-Gg: ASbGncuGBlXhkzOvYJ1Kha7YcMT2ps6VLHFeAn7MBWguxzEudFj5XXULHIKh4CxOF/O
	YD8rT30Y1sT/nhcQsI/EoWqaZRFHAgTu75L/m9/aIVSH6lse5f9WsFQ3xUXHazNr2UbauUjlOYA
	UWC8Eh869NXfrzRb+iyRh7u4ypWB95dVQK10jFE30vUDN16P772EwntR+dGeDi9Vg+1gs7ArucF
	odlB71FSnMGhqRrlt8EJnKRUVFu2gyB+kiPU3YXVtEJP7yho/TUTWdgh4T3JtGUi/WlAEJhItua
	kFMGLdrEojNpfRVoTH2MxTx2psEHVKZIzhBjoXE36qmqUXeW69NV2jxQDawuLBOys7+4owXZVab
	Qe+JAhhPTM/2LdA==
X-Google-Smtp-Source: AGHT+IFMk2+7VOHOfkNZXBVL6jGpGNPstwNgNOtiIRIFyqbaWJvvmMA3HwW/LNlNGuaTtc5SOVaf9w==
X-Received: by 2002:a05:6402:5106:b0:5e7:b015:c636 with SMTP id 4fb4d7f45d1cf-5ed8e25550dmr9349717a12.6.1743181119936;
        Fri, 28 Mar 2025 09:58:39 -0700 (PDT)
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
Subject: [PATCH v3 4/4] xen/riscv: introduce intc_preinit()
Date: Fri, 28 Mar 2025 17:58:32 +0100
Message-ID: <3bce47b0cd1984dcc9a283051e717f0cfec7c146.1743165791.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <4ddde60347edf6740fbc69b5739d099616f5b5ff.1743165791.git.oleksii.kurochko@gmail.com>
References: <4ddde60347edf6740fbc69b5739d099616f5b5ff.1743165791.git.oleksii.kurochko@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
2.49.0


