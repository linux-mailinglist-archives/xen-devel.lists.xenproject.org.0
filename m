Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 044E28C8793
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724189.1129455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3O-0004Hj-UE; Fri, 17 May 2024 13:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724189.1129455; Fri, 17 May 2024 13:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3O-000489-1f; Fri, 17 May 2024 13:55:22 +0000
Received: by outflank-mailman (input) for mailman id 724189;
 Fri, 17 May 2024 13:55:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Ubw=MU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7y3K-0001cB-VD
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:55:18 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17fcc428-1455-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 15:55:18 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-572e48f91e9so5322423a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:55:18 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm1117456466b.113.2024.05.17.06.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:55:16 -0700 (PDT)
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
X-Inumbo-ID: 17fcc428-1455-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715954117; x=1716558917; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDbZAe0TMDQ2eX40FFZW7nZOljZEfwxgNBXnUjMJMos=;
        b=DCS0HfEobkxMSLXlx1UeDm1ahF8wyQc5Cn4VeKlJ9VvEkdQi6MKlDmqzPjfKaHfuRr
         Sjdh4F44aNNWzzm5kIcXXHVp20mYkv+Abtra5QPOh898i8kJn15+39Z0BP0pOCZk50oB
         EukBXcF6BZcivUw0CfKt5v/JVBh78oC5vxf9dosA50N6PGee3th4bHZ1lU2zfeApejSf
         hITmi022HAF+Xwt5rziYx9/xX/pUnu51kQ+CjUdyJQ8o0t9qQtsbsP5JByQ9blGPJRsR
         zcT7Ac8yPdH2mCzICa5DogPaqza7PqHLHgL2w/fwejhhcutzOwyHADRqWdL6FRtGqjYc
         kxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954117; x=1716558917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDbZAe0TMDQ2eX40FFZW7nZOljZEfwxgNBXnUjMJMos=;
        b=AUeYd8DhdBkYvlEdn9YYbbfM7uyJ0aJFGbh4ZobVjjyidiy8qvl4rtpeZVjzhx8Bgk
         Uh/2kHNzMIbjtI2z8AN6NIVBOeZSM4lj9E6TgmV6ZrCCTJ7re0iOWLf3QcF1UGd9vNIi
         5jsDSFPC5RPh9A4KLsrtZMCfpNP3GmHtoQ5Fn7+h1UNhouW+I8XtDS8/GpKC4d/nNE+2
         rWfwNr7LvWB03jRYbKblOTYQ4siD4FF2QoAS7awpCN0nO7Z0pwDJ64GlOznZ70NNJulx
         ww0fGOlI3TH10pcVzRi/rfo06VAEynZrTKwhCumO17CM9XWuGfO9ZDD3P3/igGKYoStl
         4vRg==
X-Gm-Message-State: AOJu0Yze98gzQkpTx0PZqg430AdvHEUl1ncOyG4swxDpvGYLmcm6aUpg
	waeuPzqxeU6SCMkOsCpvdar+CKe8cyrAEQ/gtU5KPZzKNS9xag69r3Jdo5w6
X-Google-Smtp-Source: AGHT+IHeeI4nFYYD06k+JYMKCpQ7dw73V97VzJ+EOfcxd9+nEg0sGqkAj/A88VrrcHWIlPoLSXPgyg==
X-Received: by 2002:a17:906:5394:b0:a52:2441:99c with SMTP id a640c23a62f3a-a5a2d67f8c0mr1592579666b.69.1715954117256;
        Fri, 17 May 2024 06:55:17 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v10 11/14] xen/riscv: introduce vm_event_*() functions
Date: Fri, 17 May 2024 15:55:00 +0200
Message-ID: <050567a35805361edc0e222f4ddebfa91403cfb6.1715952103.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715952103.git.oleksii.kurochko@gmail.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5-V10:
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


