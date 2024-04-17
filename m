Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C478A8A8056
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707314.1105209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AR-00036i-5V; Wed, 17 Apr 2024 10:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707314.1105209; Wed, 17 Apr 2024 10:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AQ-0002y4-Uv; Wed, 17 Apr 2024 10:05:26 +0000
Received: by outflank-mailman (input) for mailman id 707314;
 Wed, 17 Apr 2024 10:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2AP-0007lI-0R
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:25 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 021eca86-fca2-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 12:05:24 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-518d98b9620so4271773e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:24 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:23 -0700 (PDT)
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
X-Inumbo-ID: 021eca86-fca2-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348324; x=1713953124; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Zxkw+mL5T/sVZ6fXp1IjzLMBsRj7OUQ6lwn8noHNI4=;
        b=CshkhIO36ZwBu8dZNU7jSQiCfUeZ7/NHzc9tZ8vnmd6ejTV1RCepZ9lq3rts9po2cE
         xy9yDP/aZzCwC0yhu+d8X9GwAVxowkpcVsBKlTUzoxwKCOtNYS8P+JQKXfw7H2ADQYSc
         zLIAmAy0U6et3G+6VpzSOILE+2R+hY3TJtXpPFxaX0nEPCrRK9EYFH/+cJh8HTwhhGV+
         rHBcwBbFY41pM/X1zQFlGqBjpNtyD5ZRttRhwVBwQfpuLqmtbTY3TcIoFBV2xuNg4fDG
         blj7o0fx3YF6BGbNG4s1plCErpyE0/b+TzS3MNoI2CGmkeCgH4GYfv6db3ULQJBLKcj5
         qdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348324; x=1713953124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Zxkw+mL5T/sVZ6fXp1IjzLMBsRj7OUQ6lwn8noHNI4=;
        b=hnuFTNtQWdn+NlfIK/TB4iuzBOWFsPckkR5j77l0PUt12TrtReSpbJ+Nc+TEOCQ0Kb
         uTYwM83tHFAmAmSfftdyLnIVatiXDGIfbCI0Edp7U56hf78cZBy6WGYpIlW0PQ7fe6PO
         clCc5jMoPfU7yyTTq2S6Hi7TVv2G2db4sdDXr/64ycopbQ4rTAD88G9kHv1Cf0aSBcvn
         MoSVVGLkyV0q9wwvdf16cM5DYmntiU1JMOnLrH7bEPRYIrjhQXGh3SrpB7Fnu9JZT4B5
         fBhN44/QKdecHb4bMJ42MUi0Smg1vODn8Xsh8Su9a+cQG0REjjA4OWPdr+tyTjxcLkXD
         s07A==
X-Gm-Message-State: AOJu0YzJHOZHG5xPZ79meVidbpqUmjDoUGgUNmyP1OvZi3bT9NpdyoU5
	bUtcZXDHL0I1u7GUYtrixNeepXg08rSya1CTgvWO/5TsnuhUgQYt1I6GVg==
X-Google-Smtp-Source: AGHT+IEuhthCCU0JkRD0CKl2C5yuozX9kjs4TkkACQDg21fir9fI4U+/HQIqv5CQ0pW6Ey+JqIN48A==
X-Received: by 2002:ac2:555a:0:b0:515:cb19:41f4 with SMTP id l26-20020ac2555a000000b00515cb1941f4mr8962194lfk.59.1713348323866;
        Wed, 17 Apr 2024 03:05:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v8 14/17] xen/riscv: introduce vm_event_*() functions
Date: Wed, 17 Apr 2024 12:04:57 +0200
Message-ID: <011af5970c3c59b54d03d3f5c0876387958228bc.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5-V8:
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
2.44.0


