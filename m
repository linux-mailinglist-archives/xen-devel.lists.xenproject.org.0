Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C717A0815
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602353.938886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmK-0002qf-G3; Thu, 14 Sep 2023 14:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602353.938886; Thu, 14 Sep 2023 14:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmK-0002pF-8N; Thu, 14 Sep 2023 14:57:12 +0000
Received: by outflank-mailman (input) for mailman id 602353;
 Thu, 14 Sep 2023 14:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmI-0002W4-Cm
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:10 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fabca7d9-530e-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:09 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2bfb12b24e5so16817971fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:09 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:08 -0700 (PDT)
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
X-Inumbo-ID: fabca7d9-530e-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703429; x=1695308229; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jEpXHP+OuMRsQeHRRUMj4I6Oo5C8G1ExV4GkIjkhtI=;
        b=nvjA5LY2GSLU9geYssUPn8L3eQ7wWGSFXo8wJXazO6+Ko5xHcMCi9K9nHHYRwhorAf
         4uzrWL12vC4MWEmiGzPwER4VDEEPKTLA1iudRAMm0khCXqL5orhQiAM1QgvALoNpn4Ie
         sRD0XpRaf+0GnsPXOE4pN68Sngm/FtzY3h4DtbDIZgbqQ4lgD4WcWvi2Pj2UmHxqWWhA
         gnfylb8lmymYgevFb9BKVx7BuMa8clJLEDNRzxmiNqk6S/kKDGJl9EwBPC9JJ3WDAxS8
         8Fh96sH6CCcCBVUuXx6tCbqjonycJV2Chbig8oqVtToe0gJL09MIctehmGH1FRQy7xWi
         ydUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703429; x=1695308229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jEpXHP+OuMRsQeHRRUMj4I6Oo5C8G1ExV4GkIjkhtI=;
        b=aHgsQ8Qnr9qLRtSsPDTsfAyAcvnYX3fW9Pc3p0MFr9GlFG4dMtP+sSGr3DVABvaoKs
         HtqppxBLpNoBh/XNN3LYrFpZqLETeQ7iQ0MAoIajFXWV8Novash707n1b16VZtHJm1eC
         sT1nSCoBTTCU/Z5NYjqAwVd7ysV64PyW2hwJlxkI4I2znH94oX0urTXZbx17LfsZbE5U
         2Zw7ieF+LloYEqxEU2v5BuUSYMnInhF6PVeGxByFXkF/Fusut8yrOk/B7n+JrLe1gDMH
         hFrFZfY+V9uAESLxduRXzrU1adqDJGujoezK9YpwpSyy6l5saDR5hzN89mvquFKM6Lh2
         0EDA==
X-Gm-Message-State: AOJu0Yzm99yL69HQhJ7TpFbo8VHW6fA+kuWgFJG6+RAOUcM29XswQh2/
	C13LTDn4IrauIbKLuDlt2CV3k5F/Tag=
X-Google-Smtp-Source: AGHT+IG28LRx3bM/lBmXIL99Mez49cq8lnL140PqPov3Oi+Y8Qtqvu8H8YR2MZUDNug7uHjuKZORSQ==
X-Received: by 2002:a2e:9d90:0:b0:2b9:b9c8:99 with SMTP id c16-20020a2e9d90000000b002b9b9c80099mr5629230ljj.22.1694703428934;
        Thu, 14 Sep 2023 07:57:08 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 02/29] xen/asm-generic: introduce stub header paging.h
Date: Thu, 14 Sep 2023 17:56:23 +0300
Message-ID: <5def596788d602b9b34302630c91644952c7115d.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stub header needed for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/paging.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 xen/include/asm-generic/paging.h

diff --git a/xen/include/asm-generic/paging.h b/xen/include/asm-generic/paging.h
new file mode 100644
index 0000000000..2aab63b536
--- /dev/null
+++ b/xen/include/asm-generic/paging.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_PAGING_H__
+#define __ASM_GENERIC_PAGING_H__
+
+#define paging_mode_translate(d)	(1)
+#define paging_mode_external(d)		(1)
+
+#endif /* __ASM_GENERIC_PAGING_H__ */
+
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


