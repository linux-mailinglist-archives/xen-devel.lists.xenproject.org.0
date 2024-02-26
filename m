Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6834D867EE6
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685709.1066976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reex2-0005LZ-Pn; Mon, 26 Feb 2024 17:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685709.1066976; Mon, 26 Feb 2024 17:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reex2-000549-A3; Mon, 26 Feb 2024 17:39:40 +0000
Received: by outflank-mailman (input) for mailman id 685709;
 Mon, 26 Feb 2024 17:39:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewy-0007pd-5s
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:36 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01d71309-d4ce-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 18:39:35 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d240d8baf6so42591771fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:35 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:34 -0800 (PST)
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
X-Inumbo-ID: 01d71309-d4ce-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969174; x=1709573974; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RsympPuEgBknw/9wTxPuYHDwH2qWezPZnr8TKX/wj4=;
        b=GhBiZmPA4LegGkMI6WGCgiHYs3cuDsk3EtTnQblQ4kHV9n3/FtYP2X/rrDWyWwcXHO
         5SjcyAMocnVVch2xVLxq6EDHL2W8/CdIPkbpINRLxH+55QNLX02qy4gDfxY1KglVY5e4
         dIQN4726227lMqWl4WBfq4NpiyK1d+cXy5x1EEb/Ao7XEVqoqb9xNW44sd9vN5fA1G8G
         8VnRRp9zxR055DYsUHyYk0odJLMy1kRe0hSIRf3U49bfy4KI8XFq7UUnzu2ZwRq91Fvk
         uKOR2TZLcGXKGnh9jH4fxBmk+Ea08k060Rfsao4qcaIWPex+zIaFqVv4FxKW378tYtn0
         h9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969174; x=1709573974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RsympPuEgBknw/9wTxPuYHDwH2qWezPZnr8TKX/wj4=;
        b=TRaLM0BP/R8s+sC8s9xZciGQ7xfg8Fpbca8GZMNeGUU775qiR2peoD/U+nQNcCSzHF
         2jXfVcnQ8o+sncPHlCQbowm8FhSbLqri+nwrymd8+e27UZnAfdv4WHO1c3Y7Oacsan/J
         DOGdTxkhOhJDDhxl0vnWRMY01td9PQY2sqBl62Y7s0+okenWo9dGJptBAWfnz4da70x5
         V6x14cuEmJ7V9XpxcK8rJ9NZWnXVLd3otsqhbDmc4Dg7XnQDqBm8P01R5gy5anWgkLqs
         fG/b4S399HXBCttpJYxEpHzvXbpU1Od6eu+ROw5WhqSY5ExdnicPhlc54iWOBv53i4ce
         m2Uw==
X-Gm-Message-State: AOJu0YxIjd4dBWrlt83kKBWd5A61Cxwl/sANs9S380hkdF7KnCHdjkzx
	95InGvitl9aL4kDDTp0Tv9Ml1dBNKc4OemTCj6bnZR2Ni4nBPodTw0CVMJz6
X-Google-Smtp-Source: AGHT+IELBKLqzsNxDEfYRgyCkeSZDD+7XeWu4l9xHCHuL97TqolRL4k1BVXLLvSsCsFGw1fN3waNeA==
X-Received: by 2002:a2e:ba14:0:b0:2d0:b2f7:84c5 with SMTP id p20-20020a2eba14000000b002d0b2f784c5mr3819090lja.53.1708969174356;
        Mon, 26 Feb 2024 09:39:34 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v5 20/23] xen/riscv: introduce vm_event_*() functions
Date: Mon, 26 Feb 2024 18:39:02 +0100
Message-ID: <e80322d7613f45fbd806e8314b530dc564f20ee5.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
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


