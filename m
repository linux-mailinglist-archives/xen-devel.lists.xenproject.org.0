Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA5A77DEC6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584493.915347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoz-0004B5-UL; Wed, 16 Aug 2023 10:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584493.915347; Wed, 16 Aug 2023 10:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoz-00045Y-Ew; Wed, 16 Aug 2023 10:32:13 +0000
Received: by outflank-mailman (input) for mailman id 584493;
 Wed, 16 Aug 2023 10:32:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdt-0003RA-0i
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:45 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cb6470f-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:40 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3198d2745feso785166f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:40 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:39 -0700 (PDT)
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
X-Inumbo-ID: 8cb6470f-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181239; x=1692786039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4I6eA2DfhGVic2hhNkD5xN/OU4Yb/bwZVUQf7796whk=;
        b=kU3O4+GFXpRltHqXmITIzOlaANPth255bgxtJpjewVEdXvzTGwP339wul+2CfLDB5J
         SpTTUA6+fKemIua66xFyov/g0YPmWNEADVlMI+wAGo+FHpHd9WyEKrHSZczOy9T6Xis9
         BDYdUbA9fiw97nqD5VPTdPXMc+6Au7BRGAbAjRqRntgquvpFVSKwN7hFpTqjFR4/z0ir
         /97tfW72WJUuvRH9lf/hacyIxrQJHJX6SNYqJnyLJgwdm3OiOlQ1wZjZynRmSthf3Lbm
         8jalJeWMAN9NY7Q01Ow9CRruCTs2ezYmvKU23293ikhH+PHSzpQPEs6txMIPzRvw+/hV
         hu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181239; x=1692786039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4I6eA2DfhGVic2hhNkD5xN/OU4Yb/bwZVUQf7796whk=;
        b=OldYx1rOB4V76WrsETS73kINbGR3iazNpbdmJo+0V6KLcrf9FER8BKiPE6rpVrlGn1
         OMd5jnhUxfAzOvlhKYkqjMo52lDb/GWj6thd3XtASH0psbTtYOg8LL2MH7N9VILTmoaJ
         pN7bXZEvbm99JHXeHhz0euipkHS68khOPQ86Wg6ysrOPTtiQ3/5IjLvWE3FeJPlfhlmm
         65Xk/Jms2TFnKtiqpc/QIqvF7xN557kYMMlrf3vF72Q/RH5v+U9uP7j3zmjbcpHgrfkM
         Bx/0HwXu5tZXrY/9dO56XCEJam0v2ZFfKD6HeVKhGVwoAsOxaiIw8ZFHjdErN/MtFeWJ
         kDiw==
X-Gm-Message-State: AOJu0Yyo9jW2E5y6Vx4PHlpNhMnRtfvJ43VUPsOC68WzRL25RhGv3equ
	T5Po+WrQl2SqojNls2YlECs08dE7hTDkNYaB
X-Google-Smtp-Source: AGHT+IEY1mBwUiohfO7KVB1Gp4KLSEV6RYPBK+GPFqJtYHhLK7/BR/5O9viFqRn79uZ8/Ona5CjnnQ==
X-Received: by 2002:adf:db48:0:b0:315:a773:394b with SMTP id f8-20020adfdb48000000b00315a773394bmr985986wrj.53.1692181239487;
        Wed, 16 Aug 2023 03:20:39 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 30/57] xen/riscv: introduce div64.h
Date: Wed, 16 Aug 2023 13:19:42 +0300
Message-ID: <167762fc457a89f284dc4e90408ed8e37fa25fdf.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/div64.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/div64.h

diff --git a/xen/arch/riscv/include/asm/div64.h b/xen/arch/riscv/include/asm/div64.h
new file mode 100644
index 0000000000..212dfe4e8a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/div64.h
@@ -0,0 +1,22 @@
+#ifndef __ASM_RISCV_DIV64
+#define __ASM_RISCV_DIV64
+
+#include <xen/types.h>
+
+# define do_div(n,base) ({                                      \
+        uint32_t __base = (base);                               \
+        uint32_t __rem;                                         \
+        __rem = ((uint64_t)(n)) % __base;                       \
+        (n) = ((uint64_t)(n)) / __base;                         \
+        __rem;                                                  \
+ })
+
+#endif
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


