Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BA67E7DD1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630620.983736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPV-0000GK-2F; Fri, 10 Nov 2023 16:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630620.983736; Fri, 10 Nov 2023 16:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPU-00005i-LT; Fri, 10 Nov 2023 16:31:08 +0000
Received: by outflank-mailman (input) for mailman id 630620;
 Fri, 10 Nov 2023 16:31:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPR-0005Bj-Oo
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:31:05 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8aa08540-7fe6-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:31:04 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9c2a0725825so373926466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:31:04 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:31:03 -0800 (PST)
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
X-Inumbo-ID: 8aa08540-7fe6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633863; x=1700238663; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2OC2mLTPUW0OTqFJaHSe7X4rN302Y9S9BHakRvCcW4=;
        b=UMGKP9FB1ZlcsIkiINfHwy1pfW8I2lCm4I+5/zz90pr7DVzDDT421iAyh0rcT9rRSx
         wVlU3LpLbg5U8xgNcq7YlVdSB7tNQbPFHDc3OTx3etd7WNFaJ0XQZrA6Fq388KfLNBSp
         +ZIjKFt9n0Idacckk+d6AjWSh+fP430cs/ejC7Fopon0R9VU+zffmnigfw8+cBTiHQsR
         h+P2HgDVWislZHJjhUHRTDqA1r2ut9PRmoZAto1Kh4rH7rwZ7vgtOU5kcQFKMi0DiK4n
         q7Qjcc8JLJ4Us/mTUrQ9dWOSTOHU/djJteSEg0B99aaa3560mQiNvVJcK3mDWVFmU4DN
         bwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633863; x=1700238663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2OC2mLTPUW0OTqFJaHSe7X4rN302Y9S9BHakRvCcW4=;
        b=VbmZg5N3qjCMp+JybwJlmWD867r5DcegKHCg5Hc7+M8Of1OHmBCSQj0YABBiu5bqUm
         0RQPms87fUMoWNzIB7J69v0gWxyVrJ23au3pzVPH9l3b3IIBKCB+C6e8fGWxz+FiuL3X
         ii/GDWX9MSZS1iuD1/5Yt+WHg6DxE3Vw/rAB6oIcr0hDf6fdPc70loiTA7so+jdWxls2
         OGMu9D+ZA0CTszYcdcs3w2pnkwgRQxNbdXjPUZwoMRDVWnptp/27OFHaNAWyyTooTvEi
         zqiXwNhpzWR3H6+Ee719YxZEf7bGcz6HQpElyTLeWoUo2yEIIlnx+G5NvYAD//0JAJeZ
         Kvvg==
X-Gm-Message-State: AOJu0Yw060wHwBn9i/P/fFdX1yLVbOKGcI6vQ0PdO5orlSQRmS4d1uPA
	jn9y7ML7I49XiwpPjf9X7B8yX9lcipw=
X-Google-Smtp-Source: AGHT+IEgYkziwugrZTGxvkfRzAXjCkhGuDr/lp53TRtNZFFCA9UcGfdam8F4QklPrey7LGiQIjU/og==
X-Received: by 2002:a17:907:3e1c:b0:9b2:d554:da0e with SMTP id hp28-20020a1709073e1c00b009b2d554da0emr8169466ejc.69.1699633863436;
        Fri, 10 Nov 2023 08:31:03 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 12/15] xen/asm-generic: introduce generic header altp2m.h
Date: Fri, 10 Nov 2023 18:30:38 +0200
Message-ID: <28c99b07d388ff566c9a529903b17b94d35474ba.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/alt2pm.h> is common between archs so it is moved to
asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
	- change uint16_t to unsigned int in declaration of altp2m_vcpu_idx
	- update the commit message
---
 xen/include/asm-generic/altp2m.h | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 xen/include/asm-generic/altp2m.h

diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/altp2m.h
new file mode 100644
index 0000000000..39865a842a
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
+static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
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


