Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579E6738ED
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 13:46:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480995.745643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUIQ-0001zP-Nm; Thu, 19 Jan 2023 12:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480995.745643; Thu, 19 Jan 2023 12:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUIQ-0001vd-JN; Thu, 19 Jan 2023 12:45:34 +0000
Received: by outflank-mailman (input) for mailman id 480995;
 Thu, 19 Jan 2023 12:45:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qz+V=5Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIUIP-0001sI-9n
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 12:45:33 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27bfb1ab-97f7-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 13:45:29 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id b7so1753884wrt.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 04:45:30 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b002bddac15b3dsm17909808wrw.33.2023.01.19.04.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 04:45:29 -0800 (PST)
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
X-Inumbo-ID: 27bfb1ab-97f7-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acnYUtdnwYpIYk/Tnrxms/hajM4oUKDgrFUUijudygw=;
        b=fiKGHKGKwpDrTvmCiM74i7136tjFAyfH92GasnFvrNwTJFHTQ+iayvuHUegZ2Xx8/4
         OX8qH1Oom3DqFA9AtTMm8xlRIIJiA7JwqnZ5qewfCd1/LIVy4ZO63RjW4e1fIetEyR0+
         0ESh9VWdxZBvsiAYz8Vzev5NAKvI1hB+Naexqmf++owO1XnB8SqPakvwEsSMnfJ8+dqx
         nm6E3PYf65jA/MvSosGSMscI54W5PgVPvY4cHvzXtF1FDMbrZ+4kmOl8FiJG71MPk35C
         Dmjw7XIN7uPNVEKh12w7ZNEepP5YFR3HcOTxEQyFbKvA8qhqXpWZdO6OzNw/7Dfp+cJ7
         ZmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acnYUtdnwYpIYk/Tnrxms/hajM4oUKDgrFUUijudygw=;
        b=1Na3xqk2W2NHj/PbnSF9lL/J5/0x8N8QFhl6aNmlx/4f3CPsY3/xcbd2il7ysZSQ1Z
         eA3S7ZLDCnHDnp1sTvjHXiOtnoQ7ORA9iTX5zxQT90zyv6Y3i23gisZTeZq16uMBarDp
         3AbbeFA9HUQNEFejLhdBaM6F/g5eJFWGU/bp4bga+14EPQxrYiJw4ZLWQIGiX09HK0+t
         /27OwrdmiovdVaqOXy8tGvjcF3wIZheMySHbknIhH6XQ9vzGHt40EXDEVyGSIfVNLn08
         F3DNoMM0CIti/zaG6ElKBRv/vd26RJBBKdcOccsSyF7R6McBXpkC9BJ++cfShU2aDGRi
         Asjw==
X-Gm-Message-State: AFqh2kofoVDSOSr73oL6CjSzOw/xdxW8DsTYimUMZ/TixzQkHpffL5Cu
	8WCSV72uRrZ7SVbt1M0LskQXCRyZRUfZqJfi
X-Google-Smtp-Source: AMrXdXuLd2cVE1yxR480O9jxyrvcMnhHBJPHs7EDwDAYwFWZTSRzOK3BLzvo1J6H30JNMHJrJhSL7Q==
X-Received: by 2002:adf:fc4c:0:b0:2bd:dbbb:e7e2 with SMTP id e12-20020adffc4c000000b002bddbbbe7e2mr9152216wrs.60.1674132329722;
        Thu, 19 Jan 2023 04:45:29 -0800 (PST)
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
Date: Thu, 19 Jan 2023 14:45:14 +0200
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


