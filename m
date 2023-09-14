Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60F7A0828
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602371.939033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnme-0007ts-80; Thu, 14 Sep 2023 14:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602371.939033; Thu, 14 Sep 2023 14:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmd-0007c1-Ia; Thu, 14 Sep 2023 14:57:31 +0000
Received: by outflank-mailman (input) for mailman id 602371;
 Thu, 14 Sep 2023 14:57:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmY-0002WX-5w
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:26 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03a6980d-530f-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:24 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bcd7a207f7so16659921fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:24 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:23 -0700 (PDT)
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
X-Inumbo-ID: 03a6980d-530f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703444; x=1695308244; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T7F67gdUCk5RxXzpIuqhSSFrgC4kIPj+C7zkKjIZjk=;
        b=MYZAZMANLfF6jA6b6WgMbOEPjhY0xSrcMFQyuCLJJnLIwR/jch+NoGkBVAtBARYoCb
         v4sWMHZQL0XsKmd4MexLU9ySjoxiGMdSeCrezOkFDzgLIzVM8ySrUj7d6FcSLehYikKp
         dt+k1d0Ss9pQx1ZKDn8XjR6aJpXbCT9jkv/7E+GWJwaNsaUUn1aqD191EdEx1TnPjFTN
         ohKzfcgH0jWzTsqItx4jfkDhYsH9rufUNGQCHLUKKPtqtEMsicFBUK3fMMaHNyg5ji15
         AaTAwij8hAgIqcEJvdEiWly64tGmzfTkAIOUw5TLuimnn2lOdS8P2p2JyD9o/MA/Km9g
         Oe4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703444; x=1695308244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T7F67gdUCk5RxXzpIuqhSSFrgC4kIPj+C7zkKjIZjk=;
        b=ezfoYaluxT9tF1gLlDiE3y2URBcWvLibsHAlGCzaY5T6YFjk2IkkEjIGcVWqN3UZom
         SnvZYoyboS8ro6vEVmr1E2MmYsuZpbGjhZhNynf2Wmz723RD56Nus/EPJVeYbpBdcj/H
         X7j3dynoLLtLw98K4C5U0Vv+yM8nD9pjk+LX1PfI2CM6hjIFWiKzchi+hErqCoGvQcuL
         CwuW7EPARQ653mQjA0p1K7fheREWVm+PkkaFlTTcMVRQmZx7dype88E+p2cHdL8Hab0H
         KwbNaZxJ7ij17vnGqb41MD4XyTiKMijzjPm+8oA3oT1jO1xDxB88tjyK+w/pnqso08x1
         d9Aw==
X-Gm-Message-State: AOJu0Yy6smKTtUXxD09hQ8mDrTRmrNRj2K+c8OZYBkgkPuo6UGggX2vE
	IS73Ql5EMHnfVQV9hohyl/R3tvCK/e8=
X-Google-Smtp-Source: AGHT+IE5hnkQJ/YBRz2XLkfxGXCOOALx/sf4bFP8n2YRPE2LtDydSYrRsL4Y2XSyuCPA2LsCZrI/5g==
X-Received: by 2002:a2e:501d:0:b0:2bf:b770:ac2e with SMTP id e29-20020a2e501d000000b002bfb770ac2emr4391412ljb.33.1694703443933;
        Thu, 14 Sep 2023 07:57:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 21/29] xen/asm-generic: introduce stub header altp2m.h
Date: Thu, 14 Sep 2023 17:56:42 +0300
Message-ID: <619b24fbd568f439baf1941a972c6943f423b4ad.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/altp2m.h | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 xen/include/asm-generic/altp2m.h

diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/altp2m.h
new file mode 100644
index 0000000000..e73cc8a04f
--- /dev/null
+++ b/xen/include/asm-generic/altp2m.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_ALTP2M_H
+#define __ASM_GENERIC_ALTP2M_H
+
+#include <xen/bug.h>
+
+struct domain;
+struct vcpu;
+
+/* Alternate p2m on/off per domain */
+static inline bool altp2m_active(const struct domain *d)
+{
+    /* Not implemented on GENERIC. */
+    return false;
+}
+
+/* Alternate p2m VCPU */
+static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    /* Not implemented on GENERIC, should not be reached. */
+    BUG();
+    return 0;
+}
+
+#endif /* __ASM_GENERIC_ALTP2M_H */
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


