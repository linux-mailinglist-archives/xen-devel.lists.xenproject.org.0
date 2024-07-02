Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E58923C4F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:24:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752361.1160588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObc8-0002UO-Gv; Tue, 02 Jul 2024 11:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752361.1160588; Tue, 02 Jul 2024 11:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObc8-0002SL-DM; Tue, 02 Jul 2024 11:24:00 +0000
Received: by outflank-mailman (input) for mailman id 752361;
 Tue, 02 Jul 2024 11:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObc6-0001mD-SC
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:23:58 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9323a9f8-3865-11ef-92e8-0d9d20120eaa;
 Tue, 02 Jul 2024 13:23:58 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so45956341fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:23:58 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5161fb73sm16149981fa.33.2024.07.02.04.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:23:56 -0700 (PDT)
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
X-Inumbo-ID: 9323a9f8-3865-11ef-92e8-0d9d20120eaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719919437; x=1720524237; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+B8xBmNcCIo57qB2YroROGMOiu001L1f4uYSEWgPoA=;
        b=bgKaLRPNnH/6HUYQnndymQoCV5ohNXL/yKk3DYegs3suvOFZctZMb3pdr+2QbCFObw
         X0tYsSmxt2tVxQnwqXkfm2KpcU+sVXceqqDa1U0yWwTvjnGG43Tybz84cPSFDFoYvB2V
         lrNhFgIktXB9X57p9HzWLCCzX251GAW/0i/ZDRY+Y0zHKnFgCoo5fuQ2kqTMWkeSaZYV
         P4bxyIlliSxFJ9GwHkH0NkSt4B/o1kFOYGxdYotZuzc1S3aCoJK3F6ntsFdRFvYqWeuB
         4s3BFClai6Lnd8Sb8LR/og+/BM4Wu9ickCXsgYC3es9KlfI56ROAFtkjDFKPDLKOLQG2
         UQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719919437; x=1720524237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+B8xBmNcCIo57qB2YroROGMOiu001L1f4uYSEWgPoA=;
        b=TgSLL0cn2yEaD2RPxf0kOnaTkAb5tIm7DFEn5hGPq5AZu+OkEG1E/6IyYD2YalQLe3
         TgSmvpYH3yub/Py3FukWPhmKQygb24phYuXVX1Vyd0x/YwGamdEQ8kozHzR83eg1pRv5
         BZqGWVKmVLz5wOPqra0MdDYYIpjO0iMyLOyxD8X/58kKFtHq4l0Y/vStxz2QHo0GmBBe
         9SESatzYsnki9093iE+UoZgQpTvRG0sV/HEAMvjZBdal+LIBIj4mdbMq1wYETSCSMJ0X
         XtjMDeVbrWdgcuAGF4sW+Z2PwFxn/en5r3AvJBGsahzk7zTcW7cHCGhlIO40ed5cJbsC
         LuTg==
X-Gm-Message-State: AOJu0YyHG6uF8xo+G+74ioGtU8Dg6q32xQmqioBARGSgM/shiR0v/b4w
	wzIcrOB0VyL61Ys0AKo81ZOzPNQDIBrX5JBNRITFrUuPP35i2+DsX5jIxz+M
X-Google-Smtp-Source: AGHT+IE1gKqgEzNkm0qflfc256ah5L6MMRtuh9OLgISEUhbAFxZEdVP2dp1xg0TjdcTzEurdxB+7vQ==
X-Received: by 2002:a2e:a813:0:b0:2ee:7a3e:4728 with SMTP id 38308e7fff4ca-2ee7a3e48d9mr1958171fa.53.1719919437437;
        Tue, 02 Jul 2024 04:23:57 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 3/5] xen/riscv: introduce trap_init()
Date: Tue,  2 Jul 2024 13:23:48 +0200
Message-ID: <83b9053330e4dae38e926c99f47d0ef11d9dd31d.1719918148.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719918148.git.oleksii.kurochko@gmail.com>
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 xen/arch/riscv/include/asm/traps.h |  1 +
 xen/arch/riscv/setup.c             |  3 +++
 xen/arch/riscv/traps.c             | 12 ++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index 3fef318478..c30118e095 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -9,6 +9,7 @@
 
 void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
+void trap_init(void);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index e3cb0866d5..a6a29a1508 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,6 +8,7 @@
 #include <public/version.h>
 
 #include <asm/early_printk.h>
+#include <asm/traps.h>
 
 void arch_get_xen_caps(xen_capabilities_info_t *info)
 {
@@ -23,6 +24,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     remove_identity_mapping();
 
+    trap_init();
+
     printk("All set up\n");
 
     for ( ;; )
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 37cec40dfa..cb18b30ff2 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -12,6 +12,18 @@
 #include <asm/riscv_encoding.h>
 #include <asm/traps.h>
 
+/*
+ * Initialize the trap handling.
+ *
+ * The function is called after MMU is enabled.
+ */
+void trap_init(void)
+{
+    unsigned long addr = (unsigned long)&handle_trap;
+
+    csr_write(CSR_STVEC, addr);
+}
+
 static const char *decode_trap_cause(unsigned long cause)
 {
     static const char *const trap_causes[] = {
-- 
2.45.2


