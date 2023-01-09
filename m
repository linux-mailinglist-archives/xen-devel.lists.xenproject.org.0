Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9959F662A61
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 16:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473748.734508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMe-0001xl-DJ; Mon, 09 Jan 2023 15:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473748.734508; Mon, 09 Jan 2023 15:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMe-0001vF-A4; Mon, 09 Jan 2023 15:47:08 +0000
Received: by outflank-mailman (input) for mailman id 473748;
 Mon, 09 Jan 2023 15:47:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEuMc-0001Ok-Jv
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 15:47:06 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd5f96aa-9034-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 16:47:04 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id gh17so21186565ejb.6
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 07:47:05 -0800 (PST)
Received: from 2a02.2378.102e.bce5.ip.kyivstar.net
 ([2a02:2378:102e:bce5:dfc0:9312:b994:6b21])
 by smtp.gmail.com with ESMTPSA id
 22-20020a170906311600b0082535e2da13sm3851561ejx.6.2023.01.09.07.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 07:47:03 -0800 (PST)
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
X-Inumbo-ID: dd5f96aa-9034-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwR1sb54ILTyXGbtU2ZO9pB2xjozIDX5an4zwc8vv24=;
        b=L7QA222PU0VUvuvMGGBDEY5WIvlPUOE7OnFknuP1vJWZ+5DsSu77SARWSBKusBvSlF
         VU1828ahEjw5maLmBJNeq0NvYEOVv7cN4Yc+7Wpk6f5gCQHbI6zMLWtEMeM4f+rJbGUU
         GLADZG2QCj6M1aaCP4RMM8FZxZlEXBozg/y87Fk0OIpQ+4UqwJzzDbdpRU5LhHzLtbdR
         FnmLP4SWJWlwYO+OXKR/tPpoNmMDgyB7yJnD8osLu0y33H5iVrXt0XqvsDb1K0yyEwY1
         6KXhM4Yc5YJBeqRd+XxHwQq3GTR7VDRERVYx26NiJWfltrnzQXI9gMkolZimFpwHKb4I
         KRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwR1sb54ILTyXGbtU2ZO9pB2xjozIDX5an4zwc8vv24=;
        b=zwWgHIcYvFw6d94iT7lfj5qeUoj6dCvq+peAHTu/RK/9apxrWeYRsO7/esFgu+cK0E
         sPnfDz984IYcGoTZ0WcgEm6wVpcjpsCejPjDZxPWntcggaCalxRKASC45TGrToh4Vv/Q
         EX2QYDsGVKpmr4d6VenaDWcyau7cIf73qu0Q7U3vXMINb6w+kvxhwEkX7CisOktnjstD
         f2hdKwV5QCG0UI0OWK0xpTvekU6aryD4Ry++hNC8SAQKTas27m1BIpvuXmpV/Y+6OZ6l
         Nu4OIwjxq7dQO5i7tEjxTzA/Vl0Hq9D4ojaHKpAfPaNkoFqvvlm1bzB763mBaXwGTCKA
         0TbA==
X-Gm-Message-State: AFqh2koCt9f8BE/bFL1FWOCvDxWO5QxG7o3t2SqwbNxHJYmlMIY0MBJ/
	YNhFK22wgSBJEbMRClg8TBZ43rb9ozbo4w==
X-Google-Smtp-Source: AMrXdXvL4MYDqwCFCVKx5v3neXASMMTKKrCJr293/g3qz2bXcc55OuB2ZHUZv2Yb9p0KAYzdzrRApA==
X-Received: by 2002:a17:907:c018:b0:7c1:bb3:45e4 with SMTP id ss24-20020a170907c01800b007c10bb345e4mr55092176ejc.21.1673279224277;
        Mon, 09 Jan 2023 07:47:04 -0800 (PST)
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
Subject: [PATCH v2 2/8] xen/riscv: introduce asm/types.h header file
Date: Mon,  9 Jan 2023 17:46:49 +0200
Message-Id: <ca2674739cfa71cae0bf084a7b471ad4518026d3.1673278109.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673278109.git.oleksii.kurochko@gmail.com>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
    - Remove unneeded now types from <asm/types.h>
---
 xen/arch/riscv/include/asm/types.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/types.h

diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
new file mode 100644
index 0000000000..fbe352ef20
--- /dev/null
+++ b/xen/arch/riscv/include/asm/types.h
@@ -0,0 +1,22 @@
+#ifndef __RISCV_TYPES_H__
+#define __RISCV_TYPES_H__
+
+#ifndef __ASSEMBLY__
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
2.38.1


