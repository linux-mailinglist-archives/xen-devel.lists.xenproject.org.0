Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1980877DEB5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584444.915200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnu-0004Nh-Of; Wed, 16 Aug 2023 10:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584444.915200; Wed, 16 Aug 2023 10:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnu-0004JQ-Eo; Wed, 16 Aug 2023 10:31:06 +0000
Received: by outflank-mailman (input) for mailman id 584444;
 Wed, 16 Aug 2023 10:31:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdo-0003R9-6Q
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:40 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c5df3f5-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:39 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b9d07a8d84so101385581fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:39 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:38 -0700 (PDT)
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
X-Inumbo-ID: 8c5df3f5-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181239; x=1692786039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LCHRZgc+hBy0s0HZAJ5FU9CXl325alrh/h/y5fRpu8=;
        b=HCOYwN5QwnAk9n9txQ71i1zzvI+5FPCZe4HVXbwPsGrWlz7KhgPvQqLdTGRxTOBGXp
         SOwh8Ojv0RBdcQKR/SPm8GvzZ8uLUrzn1tHDQGAwrziMbE/jJELl/PgfyIazG/RdHqtM
         q2bbgkJnzGWz1TJVq1bLVC6PIH6H/+QTnktXL0ffCoNkDDXvSumYqo2jgWlcngQiSar1
         y0+1tREhOMo5cpWWFDg+/4gNmny+h4vMkQhh0MqSxawz96cbK73HNkMDT5fMbMT39rBf
         pTjaucez68ob3wzWHu4nHD0TJamv00vkJrjLljgce9KVlMTsD785zex7hmGTwcBhNQOZ
         dSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181239; x=1692786039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LCHRZgc+hBy0s0HZAJ5FU9CXl325alrh/h/y5fRpu8=;
        b=MBYdT88SLIRBH3ZCx5chP1qJ6JK8+hzkJejJVkYeh3DRKkTbDyda+OZvLOj491sayc
         a564Wg5FWBXvDES4kw8l91VQuZ+wFT3vXvFKVm6kxSgLi5zXGeEZt1zN5sRzoIIKR0KN
         UDUan+hAUkPsBpgXUdfXPV+ZYkpQXgX9eV07HlWDdqMjTAc6eKA7NfaGXainoS9Zesi1
         Q61On97fDy+aFQdJ5KenqrPHLq8xoKexEM+7hQ9IPM0+4NFdPcE4rc6nBOdUlChdhjZM
         CD5Dnmlkee/gNMHEhjQ04fnoZwzGe7TYuplrr12IqGAsTt1l1D0tamKo+2In3rLGHjGc
         0k/A==
X-Gm-Message-State: AOJu0YylXPUOsmCetMhhycwFkbNQ6Ph9Xt8q0s/kJQ+12b+1NRqQ8HxU
	pFCWBbEZEm/npW6v+OGvJPseOu33D2bWuiJc
X-Google-Smtp-Source: AGHT+IG39bsuDoglkMGjOOfoVa1/5SZpxRN/EtmpU69vaK33fvCzzUTYk3ADgyUhW0SL2+AjVkappg==
X-Received: by 2002:a2e:3a05:0:b0:2b7:b9ca:3eda with SMTP id h5-20020a2e3a05000000b002b7b9ca3edamr1176467lja.34.1692181238813;
        Wed, 16 Aug 2023 03:20:38 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 29/56] xxen/riscv: introduce asm/hardirq.h
Date: Wed, 16 Aug 2023 13:19:41 +0300
Message-ID: <94e7437392b5a77d58a91727b36eaf8c49c55cb3.1692166745.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692166745.git.oleksii.kurochko@gmail.com>
References: <cover.1692166745.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/hardirq.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/hardirq.h

diff --git a/xen/arch/riscv/include/asm/hardirq.h b/xen/arch/riscv/include/asm/hardirq.h
new file mode 100644
index 0000000000..467421849a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/hardirq.h
@@ -0,0 +1,26 @@
+#ifndef __ASM_RISCV_HARDIRQ_H
+#define __ASM_RISCV_HARDIRQ_H
+
+#include <xen/smp.h>
+
+typedef struct {
+        unsigned long __softirq_pending;
+        unsigned int __local_irq_count;
+} __cacheline_aligned irq_cpustat_t;
+
+#include <xen/irq_cpustat.h>    /* Standard mappings for irq_cpustat_t above */
+
+#define in_irq() (local_irq_count(smp_processor_id()) != 0)
+
+#define irq_enter()     (local_irq_count(smp_processor_id())++)
+#define irq_exit()      (local_irq_count(smp_processor_id())--)
+
+#endif /* __ASM_RISCV_HARDIRQ_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


