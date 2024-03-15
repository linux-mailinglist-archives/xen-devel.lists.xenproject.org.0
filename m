Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B3787D348
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694000.1082827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBx5-0001o9-RN; Fri, 15 Mar 2024 18:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694000.1082827; Fri, 15 Mar 2024 18:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBx5-0001lV-7B; Fri, 15 Mar 2024 18:06:43 +0000
Received: by outflank-mailman (input) for mailman id 694000;
 Fri, 15 Mar 2024 18:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBx2-0005yV-Lj
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:40 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c507ed31-e2f6-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 19:06:39 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d46dd8b0b8so29375951fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:39 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:37 -0700 (PDT)
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
X-Inumbo-ID: c507ed31-e2f6-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525998; x=1711130798; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzOhvuVMEWrAlSN3mvrz481DJXnExskCp2xBFUwfERo=;
        b=cQ9/5Y9TEVASjQMSMaaxSfdX0Hlgd/Q7eJlW3PATxiqClupFrwjwucLY5bngPzLMKD
         1Sxwudp0ZjKPNAyajWtuGJ42gr+YiFNxmiXOKeQhEG508lIgEcR0R3P+5pysho0KwpPZ
         mykauijp0kgktbag2SwzEb6rEZ3KaZS7yd+e2O+q03LSWzi7B3Z3snT4wlb14sAiD76X
         C7byOQSPQoHuhaCYY2LMM9lsLRgTmrHRyy0gMyJBoPsX1BawyYkanC8rlqRp9yEuQUmL
         9HD2pE5CU5xpBIR0trjk8FhNSaHM/HncVGChjK7s437puwqbknRX121agWhkILEyKA8o
         L4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525998; x=1711130798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzOhvuVMEWrAlSN3mvrz481DJXnExskCp2xBFUwfERo=;
        b=xF0eqDK5cIRePFlzr6miQPrcWosgzfhYPUmLQcVBxx1xbTBQ0mEiYeDSmhYZ7qIbzz
         0Uq3M+BDOG2jVzfqDj/DIy6RRsLIAO1aDR6pFogSf/Lbnp2dA3sP9mt/QHJ+If7EsjHv
         dqqimtUt2NMyvbDRgiulXZ3OjuJbQKPDnTEn5frIcI6BEuSPqweJnh3AYVRqA8EhgbV2
         4161i+4Q1Z+36aSEcgWWjh/cYx+irfpRFUDcPj2S/JwTpNo3nd+EPgk9l7Jbbbmy4Oa9
         j9ycjFb/Tezn7PbxRKWK13bM0q2yLO2cAkz4qSRy5a7dNfXPiLGZ5Si46v6ReuR5yzO+
         TFjA==
X-Gm-Message-State: AOJu0YzEe5jNYMa5OTk6E/B99yIu8o+P47Crfj7CShGFktB+6i/+CPXs
	s8j6JUt2RbpoLtwuYkOWJE7Q9WkPYWCi6thGQUUZDV/FdqOp+rYSr/cjdgyvJkw=
X-Google-Smtp-Source: AGHT+IEFh/oiRzCaxpgEPIJLr01iJJh2LVc57Qy0M1nc4LK03in1ME6rGNfPlUCj0rkhca1tkDJqng==
X-Received: by 2002:a05:651c:19a1:b0:2d4:6d57:84f4 with SMTP id bx33-20020a05651c19a100b002d46d5784f4mr5028421ljb.8.1710525997947;
        Fri, 15 Mar 2024 11:06:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v6 17/20] xen/riscv: introduce vm_event_*() functions
Date: Fri, 15 Mar 2024 19:06:13 +0100
Message-ID: <446494168f3c3dbdba90536c4e69af7e9d6b4999.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5-V6:
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


