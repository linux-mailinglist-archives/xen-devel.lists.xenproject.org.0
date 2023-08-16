Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECD677DEAB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584393.915107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnI-00088R-Uf; Wed, 16 Aug 2023 10:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584393.915107; Wed, 16 Aug 2023 10:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnI-00084Z-Qx; Wed, 16 Aug 2023 10:30:28 +0000
Received: by outflank-mailman (input) for mailman id 584393;
 Wed, 16 Aug 2023 10:30:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDeC-0003RA-31
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:21:04 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93a13a6d-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:52 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3178dd81ac4so5366036f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:52 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:51 -0700 (PDT)
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
X-Inumbo-ID: 93a13a6d-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181251; x=1692786051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5MPq5DygjzyAlHzsM1ZXMMzIEwTEHmb1QcQbJ7UkYM=;
        b=bc6Gb7G1G4/JMw6UAMpIhiufcYrwo5fKSjYIAb6vk4dK4Bqhq91Wrx7k6GmTcDL95m
         4HrUPNpNGXNOXRAmN9fy/l7jsTm2u82jsQE/JfnMCEqJdeH/wqvhIlTy5lqaiiwSysDA
         vB5HSiiB62ad1VjNmw9L+njEdfkvlOliLuD+jcFn455bKkDG46R8VaKt9XAFCgv+aSFx
         9FOz6fJT0y49/PX8UqF3GUJGpl94bOkII1+/hvXqQD+afDYMmtCr+2y0lKqoAdIA4qTS
         LnHjYVpbOcZ62xD8FA7/Y+csCaOAS9g5SY8DJ33zl4Z4kzW0JXH7YIuOkUVmyibQB7sP
         aZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181251; x=1692786051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5MPq5DygjzyAlHzsM1ZXMMzIEwTEHmb1QcQbJ7UkYM=;
        b=K27oQD5DeaCHiFW1FRmwz95Xe+GryBVmIYgTIABUS7E75vic3AZ8JXHfaGMnpMxIOv
         EgelK0xaHIb8ptTIvdDOoA9CU3upJ8sgkMu99/tDmasPee/g35xWtEPc9FHsUyvJrtUJ
         ub3oNclu2X46nQgPnUocM+iaNyyBuJQ2759JmQI3JtVl7PLR8rJ8Qyk6eSDQIVzhgNLK
         x5bgvHnBXGuRKtshknq1I7KVMKzyWEzhXErWzZvstDZVAJu+L7pIwTh/QNvZ0IqsfyZ7
         O4P800yGqD9rSTnbOUvMcdfxhfhj1sedpl4Im3ONjdv8efU6mym6SIFrmi0a2kcYXH7o
         Oz6Q==
X-Gm-Message-State: AOJu0YyY8/6EZOEHNLPECfjbEpcCefzPWrCz3SOraNqpZKDdzD5ZqxHG
	+ucxX0yH/jLyJJjDmwhHXAAwQ+OwLp2R1vE5
X-Google-Smtp-Source: AGHT+IF+u/J4kc1sHrAUue10sPytMhLlMCAnQ0GAtA3S6GiL6rf81JTFGodamk6ws+17rwvLnCQ2sQ==
X-Received: by 2002:a05:6000:104e:b0:314:1fdc:796d with SMTP id c14-20020a056000104e00b003141fdc796dmr952901wrx.70.1692181251276;
        Wed, 16 Aug 2023 03:20:51 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 44/57] xen/riscv: introduce asm/vm_event.h
Date: Wed, 16 Aug 2023 13:19:57 +0300
Message-ID: <5e9219fb6c5e3d0ad921d7d050abc2a802d1742b.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/vm_event.h | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/vm_event.h

diff --git a/xen/arch/riscv/include/asm/vm_event.h b/xen/arch/riscv/include/asm/vm_event.h
new file mode 100644
index 0000000000..4cae80840a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vm_event.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * vm_event.h: architecture specific vm_event handling routines
+ *
+ * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
+ */
+
+#ifndef __ASM_RISCV_VM_EVENT_H__
+#define __ASM_RISCV_VM_EVENT_H__
+
+#include <xen/sched.h>
+#include <xen/vm_event.h>
+#include <public/domctl.h>
+
+static inline int vm_event_init_domain(struct domain *d)
+{
+    /* Nothing to do. */
+    return 0;
+}
+
+static inline void vm_event_cleanup_domain(struct domain *d)
+{
+    memset(&d->monitor, 0, sizeof(d->monitor));
+}
+
+static inline void vm_event_toggle_singlestep(struct domain *d, struct vcpu *v,
+                                              vm_event_response_t *rsp)
+{
+    /* Not supported on RISCV. */
+}
+
+static inline
+void vm_event_register_write_resume(struct vcpu *v, vm_event_response_t *rsp)
+{
+    /* Not supported on RISCV. */
+}
+
+static inline
+void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
+{
+    /* Not supported on RISCV. */
+}
+
+static inline
+void vm_event_sync_event(struct vcpu *v, bool value)
+{
+    /* Not supported on RISCV. */
+}
+
+void vm_event_reset_vmtrace(struct vcpu *v);
+
+#endif /* __ASM_RISCV_VM_EVENT_H__ */
-- 
2.41.0


