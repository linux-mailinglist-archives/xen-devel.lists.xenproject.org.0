Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3D666C25D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478689.742068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQeI-0007e0-PG; Mon, 16 Jan 2023 14:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478689.742068; Mon, 16 Jan 2023 14:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQeI-0007Xz-LI; Mon, 16 Jan 2023 14:39:46 +0000
Received: by outflank-mailman (input) for mailman id 478689;
 Mon, 16 Jan 2023 14:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQBk=5N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pHQeG-0007HD-D8
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:39:44 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cc0f7fb-95ab-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 15:39:42 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id k8so13185874wrc.9
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jan 2023 06:39:42 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 m13-20020adfe94d000000b002714b3d2348sm26543406wrn.25.2023.01.16.06.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 06:39:41 -0800 (PST)
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
X-Inumbo-ID: 9cc0f7fb-95ab-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acnYUtdnwYpIYk/Tnrxms/hajM4oUKDgrFUUijudygw=;
        b=cxG7BbmW5EXJNbhiyxD1yAxapzKZ7gMV68sns7gJQCN7WUJtlGmCflt02xwBi9E0QU
         XCIqlfgCTJnf4u4w2jNqppDx69EZXTos4ebt4L9RLfOxVmPXm37+o7y4ktUebM1POWh6
         KC4wk9Y48hgQE831bQnbOTNvib59wbUtidFC+Yacqyi45gxRMuUkoWUXXrkUCgYc3dxY
         CVs6Nxsl9lR3bgfbjXAf3RQYRa7XzbPOLswZ5Ugfneb7lBKQVNVzzMZ1uVBR2/EMAO41
         QD7pFAFYZ/6BXKTgxcWSqOgZgjWVhI4etdmBWh5iuBbmDKIH1rcd9hVmIBHlFncraUgP
         NHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acnYUtdnwYpIYk/Tnrxms/hajM4oUKDgrFUUijudygw=;
        b=Arsk2hssVlloOF4NHyut+t9M30sZ3xOrQuxNN4GiDwSI6FdPSLbsQNUJIk4LUIU0yG
         dN64qWJg2jshCG7DWaShK/IxcLRc58cr4BvUwXlmt1j+Vlp/BmLmL0kZgqbiL1YwqpOV
         JWD1roRqUQXBpigZn2JN7vev1Jewm9z+6aURUNwcYwQ8u9BAeKia389Jf5PDq8NqJ0TF
         pCIlPSmZKbWajamDM3t4Xk2p35SQOoTGTKPiMa27geoOMzPfjY8ZF1cBtdNd/sb30yTr
         Q10zAkrJ4+lW0QyLvQKxMJ9nWh5gk7AR/gcCvcjPWWa3VHjWJPlKq6zcYhBhhzx1GCdQ
         yCHg==
X-Gm-Message-State: AFqh2ko5wWDaVU7VfmOmxl0zPEKf5Rc7vFw7pRymxiLbcDAAWaIr80iB
	JYCeRREueqh92Qe+qqv4so7siOzq20JClQ==
X-Google-Smtp-Source: AMrXdXvPGgIAD4uUIPtpMwYIG4Gu4t19pJZkcwzDCMxf2+lAo8E2HMSDR2iuZ9/T3wbfqQKphEZZZw==
X-Received: by 2002:a05:6000:1c09:b0:2bd:eb6b:173a with SMTP id ba9-20020a0560001c0900b002bdeb6b173amr8447699wrb.36.1673879981399;
        Mon, 16 Jan 2023 06:39:41 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 1/4] xen/riscv: introduce asm/types.h header file
Date: Mon, 16 Jan 2023 16:39:29 +0200
Message-Id: <2ce57f95f8445a4880e0992668a48ffe7c2f9732.1673877778.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673877778.git.oleksii.kurochko@gmail.com>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
    - Clean up types in <asm/types.h> and remain only necessary.
      The following types was removed as they are defined in <xen/types.h>:
      {__|}{u|s}{8|16|32|64}
---
Changes in V3:
    - Nothing changed
---
Changes in V2:
    - Remove unneeded now types from <asm/types.h>
---
 xen/arch/riscv/include/asm/types.h | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/types.h

diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
new file mode 100644
index 0000000000..9e55bcf776
--- /dev/null
+++ b/xen/arch/riscv/include/asm/types.h
@@ -0,0 +1,43 @@
+#ifndef __RISCV_TYPES_H__
+#define __RISCV_TYPES_H__
+
+#ifndef __ASSEMBLY__
+
+#if defined(CONFIG_RISCV_32)
+typedef unsigned long long u64;
+typedef unsigned int u32;
+typedef u32 vaddr_t;
+#define PRIvaddr PRIx32
+typedef u64 paddr_t;
+#define INVALID_PADDR (~0ULL)
+#define PRIpaddr "016llx"
+typedef u32 register_t;
+#define PRIregister "x"
+#elif defined (CONFIG_RISCV_64)
+typedef unsigned long u64;
+typedef u64 vaddr_t;
+#define PRIvaddr PRIx64
+typedef u64 paddr_t;
+#define INVALID_PADDR (~0UL)
+#define PRIpaddr "016lx"
+typedef u64 register_t;
+#define PRIregister "lx"
+#endif
+
+#if defined(__SIZE_TYPE__)
+typedef __SIZE_TYPE__ size_t;
+#else
+typedef unsigned long size_t;
+#endif
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __RISCV_TYPES_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.39.0


