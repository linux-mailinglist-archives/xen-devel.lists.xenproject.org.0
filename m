Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A0C896C9E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700453.1093657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxx2-0004Bq-Bm; Wed, 03 Apr 2024 10:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700453.1093657; Wed, 03 Apr 2024 10:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxx2-0004A7-87; Wed, 03 Apr 2024 10:34:40 +0000
Received: by outflank-mailman (input) for mailman id 700453;
 Wed, 03 Apr 2024 10:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjQ-0007Ob-IC
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:36 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf04be71-f1a3-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 12:20:35 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-513dc9d6938so7606639e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:35 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:34 -0700 (PDT)
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
X-Inumbo-ID: cf04be71-f1a3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139634; x=1712744434; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9U6oW4Qnq2TPCE8LMjq0ZhGm7F+DtWBT/tWqvv+aXU=;
        b=d5/wMwb3mIW4KjJTOj3CH/jpRyF0qO8HkKNZR1bFib0yY4CPxk+Sol3yfR9TGw/VCL
         QX3u1oaxj51huWcALCKUwMv41J8ipp2pxbcQJ9KrbfpeYsUbWaKxFs73YOMsOcCMoW3W
         4lTbbv7NDR/X4MOLJg0R43+q7OY1sawHeAAHD9T7ah4szCmUU5LRYE4w4l024uoKCV6e
         iCA8wGy2/iBhuErOhZi82Jk/kJXKan5rFHDhOSz/6DFZLNGJVWNUnoQsTgguA2Df+9ml
         Htk7zCW2ErqKJ0ccvLsTAiXfJh0yhwIemIaRbLe4vAUVT6QJuNFBfDyCeSvdHn81LqGP
         cz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139634; x=1712744434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9U6oW4Qnq2TPCE8LMjq0ZhGm7F+DtWBT/tWqvv+aXU=;
        b=nq95hp3VC51S/tycfCTHb9zuHRB5kitmPRFPulBmnmPfkWF7uk7WIDn+fR3jXVG7eE
         VCqLIM+8p8i79zhx+BLnhBqahXEoQ601T47+1cI8vaVP+OmuS+Dst7V7MgLEPZPG1yOD
         fvsxxXK/+FG7Ql2SiAj0s9AhgFCK/lTKsgn6v6IfpdoLOks95t9wbGzc5vuIrbHSp+DQ
         b1nvkdbmNjXO1a5YI0fn7zuh6fRH/stu4BQkwOsZg/IWcfVC6sir3lcrRX4KoWcZQlhu
         e19VsMnNiLLfK/Gj/8/pJogiEOv77YlhbcvVZrQDCnjnWFLjP5gIQt2KaFULnDD040lS
         qm/Q==
X-Gm-Message-State: AOJu0Yz13zuD25chWzHs4VeKjqRWqghhhkI07XrKrAOgqOGRqi8vyMAH
	Ng73A5vQgeHeJ1yvBm0mGJ3LPj4OejPzsN1MkU7DokAH3KPFZ+BRzHCA8iMR
X-Google-Smtp-Source: AGHT+IHAjlE34P1pdcJxuNNymHnV7H32e+81w+VuX+xiJ8HK+FcCSsopU06OYV71JcG7clJorQq+mg==
X-Received: by 2002:ac2:5321:0:b0:516:7738:bd5c with SMTP id f1-20020ac25321000000b005167738bd5cmr1488007lfh.4.1712139634398;
        Wed, 03 Apr 2024 03:20:34 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v7 16/19] xen/riscv: introduce vm_event_*() functions
Date: Wed,  3 Apr 2024 12:20:09 +0200
Message-ID: <99f82a80c2013b138c4ddff1f070d53c6f28681c.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5-V7:
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
2.43.0


