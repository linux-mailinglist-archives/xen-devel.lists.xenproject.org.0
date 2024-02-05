Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29AA849EA9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:46:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676323.1052443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1AW-0000M1-0f; Mon, 05 Feb 2024 15:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676323.1052443; Mon, 05 Feb 2024 15:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1AV-0000JI-Sf; Mon, 05 Feb 2024 15:45:59 +0000
Received: by outflank-mailman (input) for mailman id 676323;
 Mon, 05 Feb 2024 15:45:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0y6-0007Hv-E1
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:10 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddca2410-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:33:09 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-511490772f6so1898306e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:33:09 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:33:08 -0800 (PST)
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
X-Inumbo-ID: ddca2410-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147189; x=1707751989; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr1JIkqZUw59vhziDxsEOtOcbHipI28A4qI7Th4nh3I=;
        b=ebOoL/yHt91EqBggIqPED2pcz6NPC6I0H2eMbiGMkGaUIqr5AMu9rLat+EB3uo+2T/
         iSPXO3rufyhTjkhrRvlqucCG46SE2G3qnhkO3XrBnxq7447EEc60uchglMy5RueB8ZuZ
         z0cf9f642hCplgR3qu3AfTXe4dVqQFRGOEOHGRjVksal9PBLj7rKffxtng1iyjmjJtFx
         RBFb4hni+aMHjmn2fSgnsrV8yalX5FsvyUZ/J7ArBiqn+C7jqlPwS3H9KKAE9JDawv3b
         hftKusZwBjS510dtIZPjUXxwqGufXhRhLVq65BBOA7iKMdwWaunVPjT/SW6jN4hPupwf
         Sm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147189; x=1707751989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr1JIkqZUw59vhziDxsEOtOcbHipI28A4qI7Th4nh3I=;
        b=js0yVxnwGi6FhWSgmaGGcoB2GTsR4eji1HR0it0Vw1DYuhKNGjYHtcTmKd176KgDbm
         Ii135pykExjETatPTI/KJ2Up6Iv9Ey+NA3RYFNJ9uEiZDpOgSvV2t4iwDhGdzjWmAbAP
         fRM6HByD99SR2vfvs386vUjOjecuxUuwpj+m/y0Z7MFVrBbxPsdFyh/jqi8snZJtQGiA
         xwFeaBGrCR3uJFz3vgpoZuihRoDw4Uf/BOCRglRqpH+aEx7UXDWdukX4EvG4xwvDEs7k
         Bgm1AdwuOXSzTlt9cPdou9miRMeyBsKblMJN+VdCl1nAVf/YgJesB+Y53Aq1muw9nx8Y
         uDGw==
X-Gm-Message-State: AOJu0Yw4WdHDZ/tRYEAgv1zUnFivBe5E6BcdFEuHTP8x4SF+n6td2Ai6
	EpohZIU56BloZTyAfeqHUP/JOFY8F79trS7mnqH1uvB/DYQDhCV6bWXReVAJ
X-Google-Smtp-Source: AGHT+IGwJaRnIl/URwdxyGrPY2aME7vWG9iYCEASGJw/ZYqBRvRAZwQ5rWk5qWkpdt+and2V7g4MqQ==
X-Received: by 2002:ac2:4a66:0:b0:511:448c:3225 with SMTP id q6-20020ac24a66000000b00511448c3225mr3916512lfp.68.1707147188770;
        Mon, 05 Feb 2024 07:33:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWGLfC38zmbTLqFoizgpOLmX9xgciuDWE1OExVLIcIFtkeRRWddEA80x4w1bcD2gLdeJ4coDuHNAxUzMQpVfp0YswBKs65ruHtXYXnqXTNH/JkCyvaXg9bbLNVxfQzWa2sJol/PaTJU1auIvrbbR2FIcjJUSEHKSGs7PtCDKrDW8ylwJN34zANmAxBBVcCmgLRifT/hU+1V7b4pVHH/2qI0T3pXtMoMAVkDM+tu5qhqRSxmckrpOX/pQ0ZhCAuVQl+ZbA==
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v4 27/30] xen/riscv: introduce vm_event_*() functions
Date: Mon,  5 Feb 2024 16:32:34 +0100
Message-ID: <acc19ced590be534606d0923d929d3c15f887530.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


