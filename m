Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF507E7DCF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630618.983722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPS-00087w-8O; Fri, 10 Nov 2023 16:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630618.983722; Fri, 10 Nov 2023 16:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPR-000808-RU; Fri, 10 Nov 2023 16:31:05 +0000
Received: by outflank-mailman (input) for mailman id 630618;
 Fri, 10 Nov 2023 16:31:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPP-0005Bj-H2
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:31:03 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89596297-7fe6-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:31:02 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9d10972e63eso363843366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:31:02 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:31:00 -0800 (PST)
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
X-Inumbo-ID: 89596297-7fe6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633861; x=1700238661; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+9+gnHXJ2k1bhGlVA4uqBRS88NAaQ/Yn9M7Z3WD+Pc=;
        b=CHQ1SYGEzugavrjNBgqaI5mAQZCLDu1PtoyDbWeZi4qE8WPrcgIuLb4xn7YIDX+4+x
         NKsheO5rD/+T8VetYuyEpKvEy81csCsEGYEgLlEG3yoOE+vWx773TsltlWFPZMw4inWk
         m89uPxV3BTYlUlM16/47cF4OJOZ3HMg13uoOFe4qtuRON54DfdJ4cRKzvB1uUWZ7hPWY
         uI6La+3rpgNUFSDZhlezMWvsqGxTR9iD1g1dZg0FtgcoFxnXj94FcK0nFhcFPCJFaVax
         UMiToj4aSpAasyoYolS7ylB3NBk3WZub2oi9ipvrloL5g1FrlJdSu7D0RLQxDYgkczxj
         GtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633861; x=1700238661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+9+gnHXJ2k1bhGlVA4uqBRS88NAaQ/Yn9M7Z3WD+Pc=;
        b=rvA3dLWBUv4huuSTR1oVSxy/3T6UmTitlS51JOlD16RAENT7/nOO+qmCAtw80WDsxt
         R3IIO+RSQ0qzakq5z5q9b5lLpuR4oW1KAvQJjDaOkBe95YR8Zk3xKfZALJx9lKXeGND/
         xf6qD44uwxTY0lef20T8GpGl+Xc4YyQRnBgXXmQKCN6prm51ENe8Yxst4ARl7ldfLJgc
         gJCoMbVDgGCW9sjZBq7O33LJ2+LQIumdyLzHr3bHkSv8KOPL2PJ/NX87EYYfDHveEshS
         XCGRS681HFJUw/vEbbUdGxmlEfMJnEHJYLLd9n+Xanj1kcRXZUlL68bO0GaxvE0YYnVt
         Khdg==
X-Gm-Message-State: AOJu0YzP17Nu31nTHTC+9jgbtEMgIcLbNthN/l3EzyIKEXZi0rFT49jH
	NyAx6naFcYY7/NZY1d1mYNUSq76hfVQ=
X-Google-Smtp-Source: AGHT+IF74GDtuCLj6a3p2eVzqEK/v9ZfwvG0RlX7aPu6Jr8YEkHkFbbegKQQLi8srL2C2PKE7wOdsA==
X-Received: by 2002:a17:907:724f:b0:9bd:a65e:b594 with SMTP id ds15-20020a170907724f00b009bda65eb594mr8078571ejc.3.1699633861211;
        Fri, 10 Nov 2023 08:31:01 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 10/15] xen/asm-generic: introduce generalized hardirq.h
Date: Fri, 10 Nov 2023 18:30:36 +0200
Message-ID: <bfd62969c9b94f59ecab4966af2a7bb6d4f1032d.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/hardirq.h> is common through archs thereby it is moved
to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
	- add #include <xen/cache.h>.
	- update the commit message
---
 xen/include/asm-generic/hardirq.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 xen/include/asm-generic/hardirq.h

diff --git a/xen/include/asm-generic/hardirq.h b/xen/include/asm-generic/hardirq.h
new file mode 100644
index 0000000000..ddccf460b9
--- /dev/null
+++ b/xen/include/asm-generic/hardirq.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_HARDIRQ_H
+#define __ASM_GENERIC_HARDIRQ_H
+
+#include <xen/cache.h>
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
+#endif /* __ASM_GENERIC_HARDIRQ_H */
+
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


