Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D1B7A08B1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602417.939085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnzC-000154-Il; Thu, 14 Sep 2023 15:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602417.939085; Thu, 14 Sep 2023 15:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnzC-00012g-G5; Thu, 14 Sep 2023 15:10:30 +0000
Received: by outflank-mailman (input) for mailman id 602417;
 Thu, 14 Sep 2023 15:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmY-0002W4-N8
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:26 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04179e09-530f-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:25 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bcb50e194dso17175671fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:25 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:24 -0700 (PDT)
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
X-Inumbo-ID: 04179e09-530f-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703445; x=1695308245; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xihVi8cLegPWMrOminjSxQFBOuvSV7/slHXRNJVd6Zo=;
        b=ML3fcGQf42pnah569J9f9n0fyLAN8pEwkxvqpybrAKLcMZBXghrEBwuXyV87sQ+N7w
         tuO6jB+/jbqwjYQ50OjcgQ6zxGgghkCkTG5egclErDsezBlceMHoI3MkWcwVhI6hX0W7
         +f8S5R3BfxUejzW9qPbPpLYR7ENVhqBEGmjk3ZcaRLZEc6STZsJ9HnDzrVd+DJQbhLgG
         Hc/OKCyJB75IMgjPTBeGvBp/EEDcF2wmmnrRJzFgiWhS4Mtvg73iFhfSSbx5tzToL32S
         LYVMk61MRXwzA75CP4SCtkzkIFWe6rebOn10eADoC6395v4ZO7LoahZETiBZPds3vmLY
         fHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703445; x=1695308245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xihVi8cLegPWMrOminjSxQFBOuvSV7/slHXRNJVd6Zo=;
        b=IyaJA1yU1susb5mPjCyUW0dEC85fy4r0XpscS8c66qnp4cd5Mdf+IDUNIXfWbyGzdq
         XTF5+p+Z6OWtiRcRggKot60KLmUTVJjrHrVGOic3CQeTRpdg+n/sJgb+oPl9KYkhqPfg
         wE6uBl9TtNzeF2LgXfS6jFmB0dSDrDAqT29N0ZtEDA9FHXOmnguGgBgCkVPGhY05+WOP
         DYB0zcLxynCpKors5EbtGSJ+AkSZB4mF7oQnbVgqiIIS3PtDAC1tRky+/DI6pHfhNP7B
         EGF5ZbouFVXMJNHVwTtTzQ1UOHPAV/xNLpCREVGHaKgsgoH38AILLdXbNBzIcay+ILe9
         Pb3Q==
X-Gm-Message-State: AOJu0YyVsaXOsQ/3gJwTdpTvm0UIYWLjLb+5wRsZQ6Jg0/V4OE30B75I
	j1hRDSCayRCuIukHWaNa7KUshHfvNcA=
X-Google-Smtp-Source: AGHT+IHcNL9UzH0cQh+dGNpR4iMJisR8+ZLwwYuot1CAr0VLDWMpIoH4hZ483tzDR9SsBIXTPDo92w==
X-Received: by 2002:a2e:8651:0:b0:2bd:2240:8376 with SMTP id i17-20020a2e8651000000b002bd22408376mr5647353ljj.14.1694703444722;
        Thu, 14 Sep 2023 07:57:24 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 22/29] xen/asm-generic: introduce stub header delay.h
Date: Thu, 14 Sep 2023 17:56:43 +0300
Message-ID: <b16677ea84860ae7143339b8c856f0da7f8c2b6c.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/delay.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 xen/include/asm-generic/delay.h

diff --git a/xen/include/asm-generic/delay.h b/xen/include/asm-generic/delay.h
new file mode 100644
index 0000000000..1e68c6cacb
--- /dev/null
+++ b/xen/include/asm-generic/delay.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_GENERIC_DELAY_H
+#define _ASM_GENERIC_DELAY_H
+
+#include <xen/lib.h>
+
+static inline void udelay(unsigned long usecs)
+{
+    BUG();
+}
+
+#endif /* _ASM_GENERIC_DELAY_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: BSD
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


