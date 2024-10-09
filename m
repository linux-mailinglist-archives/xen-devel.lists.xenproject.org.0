Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7F0996C8C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 15:46:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814532.1228130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syX0j-0005tU-Uc; Wed, 09 Oct 2024 13:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814532.1228130; Wed, 09 Oct 2024 13:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syX0j-0005qb-Qw; Wed, 09 Oct 2024 13:45:53 +0000
Received: by outflank-mailman (input) for mailman id 814532;
 Wed, 09 Oct 2024 13:45:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wKy=RF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syX0i-0005Gw-I0
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 13:45:52 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbfea96b-8644-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 15:45:51 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53994aadb66so6262247e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 06:45:51 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e0598947sm5435334a12.11.2024.10.09.06.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 06:45:49 -0700 (PDT)
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
X-Inumbo-ID: cbfea96b-8644-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728481550; x=1729086350; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSPaRmxzt0eAVlcbacBly/DaDiKEi9jlpaGGhdonnXU=;
        b=nFDSlchmC6qt4Yfd40Sz2ZKbuss5LIlunBOwS/NPmUw6kFf2ACF8fDnyl1vQ/Z6Agz
         QqqECZtdpOu09GNbp+BicS/LneTW+gkJpREzkWKqL5al61YJG/wRf8yKIt5dNABaTP+X
         8/jkQ1fvhI7jncgH0r5EshIycaEOm6BJtvD0HJT06k0Kf66EZVElQFlGvqyWfCh5Hrg2
         7ibqT3WJQMzC1H2SvQ3eHbKkR+fyUUSD+pe95GPTXcTqEyADpgVwzCRb0ZFEQdctRqaO
         J7BObTDqUgIGaMtu+LbJsAIc5q3h9a6jFnydfGOFMkHQHdd5ripbrYXppnmZtK91fzj0
         qeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728481550; x=1729086350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSPaRmxzt0eAVlcbacBly/DaDiKEi9jlpaGGhdonnXU=;
        b=ta4wzEh51Mph+0rEO7/JOa6GFN+0tglbVMk6FjWovqmUm4PpfmzcEyETAws40S0p95
         5oWZZqRdNU8wC2QLVtU5iH9a1/5XutKq6he5gJ3uIySJhRinu6vNx4EmPSq9yBdT8e+I
         z49Dp+zZTJCbhdXaya1dobwH8YemmqA/CQYTIYZlN38Heb1qiLe+1HQNgM80vGgkZbbM
         UBl6tN7MqR9Upyn9+BVQQiobqA/9VIwm4TKGuCJOMj0GhXiQ4xMPhr7xiIDySHL8fi+X
         iVUvnY1oUL2vdA+FQ2pe+dS/nEVChNVwy4feSEvNJLnBgynhGoi5svQrepMrO3QIwzSY
         /U0g==
X-Gm-Message-State: AOJu0Yyj7S1SDRjBXcRH7yt85n7xeVLjk4/KLiPjwFg0lemkr6APX6JC
	akD+9oBm21FLbwqIwu23mn9RdIuHomAyqVVynl3rKm1svCvvZwBFwYz2Cg==
X-Google-Smtp-Source: AGHT+IETkjSORs4fMVZO6b+/grQCRsc7UVKkbbOABRhAOi7uwdEmraxZ2/th2k7e3kvUZwRQbn65RA==
X-Received: by 2002:a05:6512:3050:b0:533:46cc:a736 with SMTP id 2adb3069b0e04-539c92b1a6bmr141554e87.37.1728481550026;
        Wed, 09 Oct 2024 06:45:50 -0700 (PDT)
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
Subject: [PATCH v3 3/3] xen/riscv: register Xen's load address as a boot module
Date: Wed,  9 Oct 2024 15:45:41 +0200
Message-ID: <cbc4249cfe7af3a8e0be0a5223933f2fbc20a957.1728472163.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <cover.1728472163.git.oleksii.kurochko@gmail.com>
References: <cover.1728472163.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid using BOOTMOD_XEN region for other purposes or boot modules
which could result in memory corruption or undefined behaviour.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V2:
 - Drop local variable xen_bootmodule as it won't be used after initialization.
 - Drop unnecessary cast for the 3rd argument of add_boot_module() call in
   start_xen().
 - Change BUG_ON(!xen_bootmodule) to panic().
---
 xen/arch/riscv/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 6d156c3a40..f531ca38ee 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/bug.h>
+#include <xen/bootfdt.h>
 #include <xen/compile.h>
 #include <xen/device_tree.h>
 #include <xen/init.h>
@@ -44,6 +45,11 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
               "Please check your bootloader.\n",
               dtb_addr, BOOT_FDT_VIRT_SIZE);
 
+    /* Register Xen's load address as a boot module. */
+    if ( !add_boot_module(BOOTMOD_XEN, virt_to_maddr(_start),
+                          _end - _start, false) )
+        panic("Failed to add BOOTMOD_XEN\n");
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.46.2


