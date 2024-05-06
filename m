Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0608BCBC3
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:15:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717442.1119747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNp-0004s5-JH; Mon, 06 May 2024 10:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717442.1119747; Mon, 06 May 2024 10:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNp-0004lC-57; Mon, 06 May 2024 10:15:45 +0000
Received: by outflank-mailman (input) for mailman id 717442;
 Mon, 06 May 2024 10:15:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNm-0001n2-MQ
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 975989c0-0b91-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 12:15:41 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59b58fe083so183322666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:41 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:39 -0700 (PDT)
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
X-Inumbo-ID: 975989c0-0b91-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990540; x=1715595340; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJEKHrBIx5KBw7idMYpZ76iQLa/FXNMtEBbm85wlAkQ=;
        b=ffGCpWoMoHPoAbf2L/IykxhXjay17Xkc4J9iApc8O9jhalQZNssqdAS+yL8cVsfG1b
         F8tzZNaS0Qdyk5nefMyNQ5SZBCwTc69uJCMRH6wd7LJHQ87ULuri5wkn5ZOvRAAaPffJ
         Y4V91ijdlOlqDaTEYEWGi/DSpESBmihsZIsfgEywEGpCQHq1i+hMkFvvAE43Ea9xXLkX
         +uZaEQcCnU2JUBIi6iDDSRekka8YoV6iLXMY0ZH2VL1kpCMekLc7D++3sN+3wAr4eFr2
         pPuUEHfip3YcX45q3kR014Fb5oL9uRYkKmaXpcq3CZNFkFbJOj/7vVYAvZk/gcGg6KKE
         b3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990540; x=1715595340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJEKHrBIx5KBw7idMYpZ76iQLa/FXNMtEBbm85wlAkQ=;
        b=nsW7NzutQknIrxYFpE38ZV3TyW+7+z2ZYIpoMB35sfqPcxjV43n6s37D6shORSy7c0
         rn5yJmFsFoGJUbHkmYNySugOpfsBEWD20aBUCEDODx/AiBzcPOGf9+Tmk6sBW/UiZd5d
         QYZUIa9aXqjk1vw8U7/fE9mFgM0gDjWObSZzj+ZF2w9Y9PAbHeMP+3GvwuFTk6BHawI3
         PgW3/iXN40kfx1b4Jv8DYRvvrmWixkejb4umhlPASaERWpO3rXaKJsNnRGa04yYiL2zW
         R/yIs+fdCrQ0BlalbMSM+rhB8QlsB1ZkD1ywTiram1cZvdPPa16zIA2YijvftETFxOSL
         Vl8A==
X-Gm-Message-State: AOJu0Yyhhc+Hu9g/2DxGw1OWW0hjAAbsezTavrdHbEt+yfSNIoEsVpLq
	DFZdkAsMd/CYPzFQoCehjji50sZURiEApf/66pGElWLy6EHd1/ps5iTxQw==
X-Google-Smtp-Source: AGHT+IGUvhxo85V6byRYRu8Q9mthG/6eb+72vYDKutlqNDRpiMEt+cDk1cNzkb80SvbNx0GUFzt0Ew==
X-Received: by 2002:a17:906:b52:b0:a59:a857:85ce with SMTP id v18-20020a1709060b5200b00a59a85785cemr3409654ejg.52.1714990539813;
        Mon, 06 May 2024 03:15:39 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v9 12/15] xen/riscv: introduce vm_event_*() functions
Date: Mon,  6 May 2024 12:15:21 +0200
Message-ID: <e157c2c6895f5b4939d461920d4e10dab9563312.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5-V9:
 - Only rebase was done.
---
Changes in V4:
  - New patch.
---
 xen/arch/riscv/Makefile   |  1 +
 xen/arch/riscv/vm_event.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 xen/arch/riscv/vm_event.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 2fefe14e7c..1ed1a8369b 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
 obj-y += traps.o
+obj-y += vm_event.o
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
diff --git a/xen/arch/riscv/vm_event.c b/xen/arch/riscv/vm_event.c
new file mode 100644
index 0000000000..bb1fc73bc1
--- /dev/null
+++ b/xen/arch/riscv/vm_event.c
@@ -0,0 +1,19 @@
+#include <xen/bug.h>
+
+struct vm_event_st;
+struct vcpu;
+
+void vm_event_fill_regs(struct vm_event_st *req)
+{
+    BUG_ON("unimplemented");
+}
+
+void vm_event_set_registers(struct vcpu *v, struct vm_event_st *rsp)
+{
+    BUG_ON("unimplemented");
+}
+
+void vm_event_monitor_next_interrupt(struct vcpu *v)
+{
+    /* Not supported on RISCV. */
+}
-- 
2.45.0


