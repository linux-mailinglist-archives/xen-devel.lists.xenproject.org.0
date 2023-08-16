Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1D577DECE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584515.915430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpG-0007vY-PZ; Wed, 16 Aug 2023 10:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584515.915430; Wed, 16 Aug 2023 10:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpG-0007bi-1t; Wed, 16 Aug 2023 10:32:30 +0000
Received: by outflank-mailman (input) for mailman id 584515;
 Wed, 16 Aug 2023 10:32:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdw-0003R9-HZ
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:48 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90e320d6-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:47 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe1e1142caso62478825e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:47 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:46 -0700 (PDT)
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
X-Inumbo-ID: 90e320d6-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181246; x=1692786046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9c/qFLMpNTGlGWuyHg5yK8zegTq/c08CfdB4QgYtyrI=;
        b=Jqrp+5Hxxq1kFXNBSyUBlk/cDY78DINASdkRMpgYoMSeE5Nc4OrIyXjq5D7OT7cI50
         3nzJIHGNVpv7qB/PX5PAg+dKLmCsJkqwlt+zPNRnUScV2FfiNcEs9OP+Wxgtupw9I/U4
         Z8euCzkfnUpLaBq62/nuFSZ1XZjS5wqRvF9IjZGupb+0pqGIXYzCMTwP6lk5XEIpGuoF
         Y34WWTc+TciCvZUidtuMIC711/54c9TeIsyIXkbu/Lxlo/KgIAtOZtMDyiP88Lsbn6JF
         jLQOY1HVwGzvI9NVzVe/olg46al5cBv9TQema6Gs0dhAOwlxOuXv1IfxTKIQkXIHZVOP
         aOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181246; x=1692786046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9c/qFLMpNTGlGWuyHg5yK8zegTq/c08CfdB4QgYtyrI=;
        b=CIe608XR3tSN0chXoM7tDiSdix2DBVSU3uzHUp7x7XLcGE7N1X8VZWnm/u56Z1wD/2
         5ysFipf+U35E/bdJXLkdWo4KC/fqgtAN8wQeWymZLZ02hDsKcJK/1Xfphn7pqc6ZVlt0
         4nd4WXH3QXv1cisCVqlv5O/Thq0sk2kVf7EypXsBLEDjP11FSPJZxY9N7m81HUlrfZJp
         OjkhH6VZ/j15+Nwf+D5SEnwweUrPLNYcoG+Z4HlHgMLRgpC9FdckUniGV5APaqT562uf
         Je2RV8FOJ45G5M10tOXi8Ex4VsxtAZ63u2Dz5eG8Xk8GuJ7jYYbfeFe3PNluRe0uL6rF
         +LdQ==
X-Gm-Message-State: AOJu0YyKtESIATdZl/soafHENm8A03bpkGJf/FR124v0ZPDLJI/2rwF3
	9h/hohJbL9XQiABmjZwhfUbVHC2UZ/dbSmk5
X-Google-Smtp-Source: AGHT+IE/kYNUjdBrAxTziIYecwHbDLHsUrOSD+RoYsKy3yWsd7mCNkNVrzxoyXb4SqyoKlHpTbwVVQ==
X-Received: by 2002:a5d:6706:0:b0:317:5f04:bc00 with SMTP id o6-20020a5d6706000000b003175f04bc00mr1176233wru.27.1692181246630;
        Wed, 16 Aug 2023 03:20:46 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 39/57] xen/riscv: introduce asm/numa.h
Date: Wed, 16 Aug 2023 13:19:51 +0300
Message-ID: <f704c2f068214fa1a7369b22e6207b9057a56079.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/numa.h | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/numa.h

diff --git a/xen/arch/riscv/include/asm/numa.h b/xen/arch/riscv/include/asm/numa.h
new file mode 100644
index 0000000000..0cfeeed38a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/numa.h
@@ -0,0 +1,38 @@
+#ifndef __ARCH_RISCV_NUMA_H
+#define __ARCH_RISCV_NUMA_H
+
+#include <xen/mm.h>
+
+typedef u8 nodeid_t;
+
+/* Fake one node for now. See also node_online_map. */
+#define cpu_to_node(cpu) 0
+#define node_to_cpumask(node)   (cpu_online_map)
+
+/*
+ * TODO: make first_valid_mfn static when NUMA is supported on RISCV, this
+ * is required because the dummy helpers are using it.
+ */
+extern mfn_t first_valid_mfn;
+
+/* XXX: implement NUMA support */
+#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
+#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
+#define __node_distance(a, b) (20)
+
+static inline unsigned int arch_get_dma_bitsize(void)
+{
+    return 32;
+}
+
+#define arch_want_default_dmazone() (false)
+
+#endif /* __ARCH_RISCV_NUMA_H */
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


