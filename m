Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1861577DEB7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584452.915227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDo6-0006Fu-Qb; Wed, 16 Aug 2023 10:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584452.915227; Wed, 16 Aug 2023 10:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDo6-0006CF-JA; Wed, 16 Aug 2023 10:31:18 +0000
Received: by outflank-mailman (input) for mailman id 584452;
 Wed, 16 Aug 2023 10:31:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdk-0003RA-Ii
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:36 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 897f77b2-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:35 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fe9c20f449so28962775e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:35 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:33 -0700 (PDT)
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
X-Inumbo-ID: 897f77b2-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181234; x=1692786034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLIASc1fyYfMjusfrMttWAQg8/twNkOwdqmjV/1G2Fc=;
        b=kaKR7umiM0h39ZFQVRDgarJtolm0eEM3cAXiiUmpiUjOm/GhJyFf3lAQMTlmWGzZsi
         A///Bu2YCorwkk8FNYajoQ1vZW6JzswOHpLciHtSoP7txJMeoHtTMAFluiODsrekrBpG
         X0c7hMgS13SBynL1LXctnbsXZojkdMPIARs+mu5AyjMRrdpqUosmARPycrlC5g6xelJ5
         pi9y58fFFnVjBP0lJJqIvlayApQyvJkTgDMjedmUBx8Orl5h5urRrzjYo42duU0RdXnH
         ZOWJ8DFedXoPQF7An3KQFTxSulg1fINZYY7ckw/0kWDMI5H/GhKkVQzoXvrD+4GU+NKd
         mRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181234; x=1692786034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLIASc1fyYfMjusfrMttWAQg8/twNkOwdqmjV/1G2Fc=;
        b=OpEFVSrW9I7RaIpIeq7DlEsjX4RlFn86EPTg8tbJPmSDT024i4VKDQb7zQ9FD4XMd+
         vFi7iiyDGU6kqLGDDzGIb210LuuAS7qPxeZ2z2PfuQq3fwkNo4knppWcFU4k7sURtWK1
         d6bLscWPxME8eIMH3mT9J+brWg/hhbHinDa8JbpCvCD9v5XiDnXmvOeD7X4tBpBthrmz
         l9zwATl6XEd4f7vJrqm1B9zKe8dATwJ/BJ8842B0DuyBeAJblo3g6VKCmMjjeA2Nyt+r
         yWa31uIgbR15P2HV16lEKxpnGF6erDunKC9YJ4zoITJlb3q8vxEstww1S0TNe/oQl1qC
         JBOA==
X-Gm-Message-State: AOJu0Yzgb5gDmN5cX8SG3WIGWisf+6JGddDYBHDrH3saDPBc0rXOVH3n
	UVivNX2fT6g7L13RYjXZsBgYwQdDrco6gkyk
X-Google-Smtp-Source: AGHT+IFBrDaJx0kKlKbLXHePOS4B9TQ+9HilzbO+YwCEtC0GDaCRTRdAkcbgAXUOL00030HssdY92A==
X-Received: by 2002:a1c:f715:0:b0:3fc:60:7dbf with SMTP id v21-20020a1cf715000000b003fc00607dbfmr1055200wmh.41.1692181234302;
        Wed, 16 Aug 2023 03:20:34 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 24/57] xen/riscv: introduce asm/percpu.h
Date: Wed, 16 Aug 2023 13:19:35 +0300
Message-ID: <2b60f93696f70dcd430cb525597b12f5d154262c.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/percpu.h | 33 +++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/percpu.h

diff --git a/xen/arch/riscv/include/asm/percpu.h b/xen/arch/riscv/include/asm/percpu.h
new file mode 100644
index 0000000000..6b317a28fd
--- /dev/null
+++ b/xen/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,33 @@
+#ifndef __ASM_RISCV_PERCPU_H__
+#define __ASM_RISCV_PERCPU_H__
+
+#ifndef __ASSEMBLY__
+
+#include <xen/types.h>
+
+extern char __per_cpu_start[], __per_cpu_data_end[];
+extern unsigned long __per_cpu_offset[NR_CPUS];
+void percpu_init_areas(void);
+
+#define per_cpu(var, cpu)  \
+    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
+
+#define this_cpu(var) \
+    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[get_processor_id()]))
+
+#define per_cpu_ptr(var, cpu)  \
+    (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
+#define this_cpu_ptr(var) \
+    (*RELOC_HIDE(var, get_processor_id()))
+
+#endif
+
+#endif /* __ASM_RISCV_PERCPU_H__ */
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


