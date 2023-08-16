Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F81477DED3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584543.915472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDph-0003iz-H7; Wed, 16 Aug 2023 10:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584543.915472; Wed, 16 Aug 2023 10:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDph-0003bE-Cc; Wed, 16 Aug 2023 10:32:57 +0000
Received: by outflank-mailman (input) for mailman id 584543;
 Wed, 16 Aug 2023 10:32:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdu-0003R9-HA
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:46 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ffa5610-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:46 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3196fdb3238so3156396f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:46 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:44 -0700 (PDT)
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
X-Inumbo-ID: 8ffa5610-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181245; x=1692786045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T49tZkAQeR8noCxKYSkS705bNR9eV7TlBqTPGyzE3TM=;
        b=mZXFwdNlW0SWlJc6RrvZAYdaGHjuxZFmTDOj8llQbYxrSZvhMP+kBFgHpQOgeBTb+3
         uOULziQzAXK0wq7KLVCNGA47O3jKd7Zk8fjke4d0JA0fVTnPbL8tH/8If/ktghwhkGPW
         +l3PIVXEkDkmBGX2LTEIcllnBDAoXWeS8Ca4cUFhaHJDWYbOs8XdH1cnOatCHyLyDa3o
         iBIwtdTuIk76XevlYRyOcx7MelhdInpPKJxqVQjfWj4JV51LDLcbvisNLmSGSfxHgsH5
         Y2JNcMoiFBZ6oY6XyAF8S/uckuD7xbo0xhxC6064vnlXMkSuPYLR1ELczBV4z403UpjU
         JISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181245; x=1692786045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T49tZkAQeR8noCxKYSkS705bNR9eV7TlBqTPGyzE3TM=;
        b=X8sclU58MwCdXPcrbUCFo4sswZYW2LQCKTHaCul4d7UckuhZLtNFoa7rKiKZsn9P5Z
         E3wWmxX0WS4UlpKl4pOhetpg9e0bQ6KrYBBWo4xglUEdljw/PflvPE+ardVuaOPw/2tJ
         BaSeRKQHXlS7SOAteh0kzwDkH9LvqiiFQqm3MXTWSRAHaEdv9WYkLbA9ur5xCwlhogFj
         pILPjhxoJBUApJxqte5kVvtDb4fYa+ZSuDmZTRuSeMW74V8RXAsvesYPI/Kzng0iVl5r
         Yofs4BIXZghg9ZyZJyQcaTJRrAXphZI9il/YqyERKBD0k4NPOZ8z2nsMFl0vAr+XpkSC
         Tzsw==
X-Gm-Message-State: AOJu0Yy0/1noFlVF/26PjhrqPCj+tsLno9/hRD18uun9yMI9k2aoQ3Xx
	wcCIs7Xt2F3I/z6n4min/fwtm/DXCJyknLDt
X-Google-Smtp-Source: AGHT+IFYXS0uByg6EvyNusfkF4IYow/JnDAQyb+YpiPj2io/McI/fxMDQGdunJVA1y436jtdtW5VZg==
X-Received: by 2002:a5d:548e:0:b0:315:ae39:27c with SMTP id h14-20020a5d548e000000b00315ae39027cmr1091413wrv.70.1692181245079;
        Wed, 16 Aug 2023 03:20:45 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 37/57] xen/riscv: introduce asm/irq.h
Date: Wed, 16 Aug 2023 13:19:49 +0300
Message-ID: <9c083a58f7371c1c8da92556ab5ae7f47e650b3d.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/irq.h | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/irq.h

diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
new file mode 100644
index 0000000000..7b08785f3f
--- /dev/null
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -0,0 +1,34 @@
+#ifndef __ASM_RISCV_IRQ_H__
+#define __ASM_RISCV_IRQ_H__
+
+#include <xen/lib.h>
+#include <xen/device_tree.h>
+#include <public/device_tree_defs.h>
+
+/* TODO */
+#define nr_irqs 0U
+#define nr_static_irqs 0
+#define arch_hwdom_irqs(domid) 0U
+
+#define domain_pirq_to_irq(d, pirq) (pirq)
+
+#define arch_evtchn_bind_pirq(d, pirq) ((void)((d) + (pirq)))
+
+struct arch_pirq {
+};
+
+struct arch_irq_desc {
+    unsigned int type;
+};
+
+static inline void arch_move_irqs(struct vcpu *v)
+{
+    BUG();
+}
+
+static inline int platform_get_irq(const struct dt_device_node *device, int index)
+{
+    BUG();
+}
+
+#endif /* __ASM_RISCV_IRQ_H__ */
\ No newline at end of file
-- 
2.41.0


