Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7610998A827
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807434.1218903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI0k-0002ga-G1; Mon, 30 Sep 2024 15:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807434.1218903; Mon, 30 Sep 2024 15:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI0k-0002a2-BI; Mon, 30 Sep 2024 15:08:30 +0000
Received: by outflank-mailman (input) for mailman id 807434;
 Mon, 30 Sep 2024 15:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svI0j-0002H5-3d
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:08:29 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9146b33-7f3d-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 17:08:28 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53959a88668so3586288e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:08:28 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a0432219sm1264423e87.132.2024.09.30.08.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 08:08:27 -0700 (PDT)
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
X-Inumbo-ID: d9146b33-7f3d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727708908; x=1728313708; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSOroKPGJr4XSbKSq9mzOX8MhVcwff6sm7/6Oa6ej/U=;
        b=GB1Om2QF3d2TE65T/jY4ZKyvMJfcWFB+f6I7/CZD6hfgM7M2oZTmjw7aVaPGui3JHz
         whJKpoWfo/azX+dpX3oFQ70gCDfZt+rcGePlqlYfLuW9g6VlQluKNhU7F4OOFTy+hU5R
         DEqE1ZQD2bcRlhEnGo59JFCT0+sjfpbSCY2w+aytVGLE9ORjbr1sIJ+aN6KKztDFKREz
         R6Lahop7ZSJ6VKxM6htnaw61sKKlnCk+VNXHffn6GOisGFoiqWXXFEWM00YdMZnhDLR/
         R7fFvdm+sNGRueA9ooSMNcD7rOBScvrw9Ff8UjHugnexmR2hJ7gLMIiyQu6sfZMZoc/U
         +jIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727708908; x=1728313708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSOroKPGJr4XSbKSq9mzOX8MhVcwff6sm7/6Oa6ej/U=;
        b=QRnhcAE7ZS4lLz6FJe13df+2VVcBhImib5C2VVrI2N23nKebsBVZOJ/LkKl/5fC9D7
         nSBKbCK1+ef00UXTzYvgokkx6mYtXkaDjOjotnQbjZ/sQdfZgcq2k5Dv/obg3enoQaS0
         sPXN4a6zWLfsQ+sBwWKzJv/W2THPvOF1rrhH8Gh1/6r0WZuuoX/N1YxNLdqpUAHEhuT0
         Rs65hro1a7GZqCoHdjEuTrbDoixaU59BGvE1uFkHPFbZJU1+uQlNRL/VlJEYzFtuboQa
         6UeHziPhlrlOsfwsN9YP+POI2FdcXeTR3Uag69ZSsV7kFzuhxK1G06qtUm4hxB8A6lJo
         2FKw==
X-Gm-Message-State: AOJu0Yw3krN+K5lHhVpWhDOGGxHdMGY0w3aNKj1LU/zop8ePhnMG2rkx
	7y3sOejl+AX5KS1ajvZw7Apx8qV9/xlZzZVwlYhcAdD0GDL3QVgVFq22tg==
X-Google-Smtp-Source: AGHT+IHiBtjsiueFbwVyej97It6FzP3dmxCYRHI65dyUougsaNjUslq5ZDsmuTVVeoorhen+1N9V2w==
X-Received: by 2002:a05:6512:4010:b0:539:8ef3:6688 with SMTP id 2adb3069b0e04-5398ef368c5mr3442546e87.23.1727708907546;
        Mon, 30 Sep 2024 08:08:27 -0700 (PDT)
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
Subject: [PATCH v1 3/3] xen/riscv: register Xen's load address as a boot module
Date: Mon, 30 Sep 2024 17:08:22 +0200
Message-ID: <2bd3589f322d30e93d81d091ca64439048c068fc.1727708665.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727708665.git.oleksii.kurochko@gmail.com>
References: <cover.1727708665.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid using BOOTMOD_XEN region for other purposes or boot modules
which could result in memory corruption or undefined behaviour.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 6d156c3a40..39375b3366 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/bug.h>
+#include <xen/bootfdt.h>
 #include <xen/compile.h>
 #include <xen/device_tree.h>
 #include <xen/init.h>
@@ -26,6 +27,8 @@ unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
+    struct bootmodule *xen_bootmodule;
+
     remove_identity_mapping();
 
     set_processor_id(0);
@@ -44,6 +47,13 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
               "Please check your bootloader.\n",
               dtb_addr, BOOT_FDT_VIRT_SIZE);
 
+    /* Register Xen's load address as a boot module. */
+    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
+                                     virt_to_maddr(_start),
+                                     (paddr_t)(_end - _start), false);
+
+    BUG_ON(!xen_bootmodule);
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.46.1


