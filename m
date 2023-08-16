Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EA977DE7D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584330.914987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdd-0006FB-4c; Wed, 16 Aug 2023 10:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584330.914987; Wed, 16 Aug 2023 10:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdc-00065W-IU; Wed, 16 Aug 2023 10:20:28 +0000
Received: by outflank-mailman (input) for mailman id 584330;
 Wed, 16 Aug 2023 10:20:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdZ-0003RA-NG
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:25 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82fe95de-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:24 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe1fc8768aso63586685e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:24 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:22 -0700 (PDT)
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
X-Inumbo-ID: 82fe95de-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181223; x=1692786023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2Jdx+KwZKJQ07SwetjGwa6e6quzsbm65vjFWJ2VZjE=;
        b=asmzzdIeUYaKf4aosTs0YvHKz5h7T3WODoTTlyhSNgMp8Xn1Mr8DPR/QQ2Gw4EKrKp
         oCTFUhLqP7q3RKZXqb+Dw7rU5TzFwrnRu4ee9cIV2QgSztO/7mJiOw/lS7JplzcQA8IS
         jrXPTzHuEj5WdzpzDpbcxz6hvNwEyEbDfPcSKRhfXzs8A/CRtyDrupHScX5HFAFSOgts
         0EFnHOxSqY5DJF6wlMx7OBI9qxxKC0FdeLBAbS0051pz88Y1RJaJepMjitvFweQCrgsx
         zup7xiZITFUrvHykJfELZJDhIjS8g63F1pM2awpVuNMX0ezJhhdSa4MP8sesanDrJGWa
         Op7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181223; x=1692786023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2Jdx+KwZKJQ07SwetjGwa6e6quzsbm65vjFWJ2VZjE=;
        b=T52ke+FhYLnl82nneaAlzEMKPI6VU5zCXgf0trwzHlVONR7LXFueVngjWAm+iHHx2y
         GopXENJ8dyZYLWq/FJOPXLIrfNxn8o0MiIbj1cEu98y9hjWgEG8tkKKjf/YCDgYXkEsT
         +bKizPadbqboDl/Rlj9DuQ/egM8KUMlse8WD3Y5Spwjjhg5nDeLf6rgZX3AShhA9Kcp8
         Y92adVAEiI/eUZQMGfOZIw+QfRPPkCaGfEY/SZjaTylgti4I2D2pgSVM//twBIP7+ifa
         gi2PmRmlXMJsV4pPl8cWi2YZYRnssVtew6v1WG9Fs0OUks6Nk3eyKdbN+h8oKdp/mBk8
         fSHQ==
X-Gm-Message-State: AOJu0YzvK8J7OZc2bqeddDVro8I3CdGcLWmP/bnvuDoMaXwar6iatvYW
	sVa5XCSjN5jaOQQIb5fPF4aFOQ2zxWNyJG/Q
X-Google-Smtp-Source: AGHT+IGgRaih8qQzEUvaYYV8ogI066zpN5T/FNlUkpZ7LcSBI3lFTX3yUhO3gzqTNs8Z8KHcwRstVA==
X-Received: by 2002:a5d:6386:0:b0:317:6849:2d39 with SMTP id p6-20020a5d6386000000b0031768492d39mr1098757wru.10.1692181223330;
        Wed, 16 Aug 2023 03:20:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 11/57] xen/riscv: introduce asm/guest_atomics.h
Date: Wed, 16 Aug 2023 13:19:21 +0300
Message-ID: <02e2850d01d0184b9a1f0c643de4879773c5ad49.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/guest_atomics.h | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/guest_atomics.h

diff --git a/xen/arch/riscv/include/asm/guest_atomics.h b/xen/arch/riscv/include/asm/guest_atomics.h
new file mode 100644
index 0000000000..71b0b11a25
--- /dev/null
+++ b/xen/arch/riscv/include/asm/guest_atomics.h
@@ -0,0 +1,49 @@
+#ifndef __ASM_RISCV_GUEST_ATOMICS_H
+#define __ASM_RISCV_GUEST_ATOMICS_H
+
+/*
+ * TODO: implement guest atomics
+ */
+
+#define guest_testop(name)                                                  \
+static inline int guest_##name(struct domain *d, int nr, volatile void *p)  \
+{                                                                           \
+    (void) d;       \
+    (void) nr;      \
+    (void) p;       \
+                                                                            \
+    return 0;                                                               \
+}
+
+#define guest_bitop(name)                                                   \
+static inline void guest_##name(struct domain *d, int nr, volatile void *p) \
+{                                                                           \
+    (void) d;                                                               \
+    (void) nr;                                                              \
+    (void) p;                                                               \
+}
+
+guest_bitop(set_bit)
+guest_bitop(clear_bit)
+guest_bitop(change_bit)
+
+#undef guest_bitop
+
+guest_testop(test_and_set_bit)
+guest_testop(test_and_clear_bit)
+guest_testop(test_and_change_bit)
+
+#undef guest_testop
+
+
+#define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
+
+#endif /* __ASM_RISCV_GUEST_ATOMICS_H */
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


