Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5867A081F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602363.938966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmS-00054O-GA; Thu, 14 Sep 2023 14:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602363.938966; Thu, 14 Sep 2023 14:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmS-0004sN-2e; Thu, 14 Sep 2023 14:57:20 +0000
Received: by outflank-mailman (input) for mailman id 602363;
 Thu, 14 Sep 2023 14:57:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmP-0002WX-RE
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:17 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe9e13dc-530e-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:16 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bb9a063f26so17205651fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:16 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:14 -0700 (PDT)
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
X-Inumbo-ID: fe9e13dc-530e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703435; x=1695308235; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9odqJZ8fT0NBvFL0G7lSK5C7AzXQQIJNuRADsMCRL4M=;
        b=Nzxtzi1qDDqkR6EUJA+G1RQMaiZYJNEUmzDSehNWorB09urBmjgpjS7ljLjKq/wnr+
         RBX72ahhIZ2o3KhIdbrIVfJwur76mY6i7r8EO1dYmnLUG/2rMKKQLnnjECBCKFmAi5Rf
         Va3EPfnKqna7mIv6J4zRrZjAvwDgZNeJWxno73fqG2stOssHZnEzRXF6HwW5SeHe7JSo
         uo7ZHyF8uRA/eGMvmpgqbO05hdFALFgKp0Ltix5+p/0VUcOycwxkV9eHdJWgYPfif7mD
         jHGcHc9mmSHPDTo57vf9dRBPWlr9RgFtWHnLtnAt9mmzeUxYE5IXeXjHaW5foXbCv9+a
         bWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703435; x=1695308235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9odqJZ8fT0NBvFL0G7lSK5C7AzXQQIJNuRADsMCRL4M=;
        b=n+s7L9HfOrO0uDZOb3Hm7rkUbHeHKWelkbRzmGHxy/EuXcfOhOI/SI1Elm+Bag7Xvr
         /zDBzbo2lxzKR4qeIjrK7lnVUnvl9NQG3yhoy8VNtUJg6YtWzZYuxDMmxdjeo2KcTALE
         2yIoqlYN42Sg9XpOwwJKizz3ejD9Z3kYGKtXtSdliKORQVc+tqmz9UlGBr8IwZh0VjIH
         LaCLmW3Z44HC6gd5LlmURg9ZkCFw3JdWSxjFG7lwdQulkvP+NbPmWgbwaez+E4jsuuuI
         bh1PUT3ZCu0ks4Ms/ZTTzuUabLpoflV5tX95hStFtp3KsI03T/uAVhs3HFCGG0WZJ+N0
         uiaw==
X-Gm-Message-State: AOJu0YxCpi/VvotwNV5AtUZiNWTmgDa9RujeTzs3ZQGmB8Agrm7Q8VRj
	L4UjCLkSR9j84tgtS9by6OpUGn2Dxbo=
X-Google-Smtp-Source: AGHT+IHlHMoKZAtkLLRCJfcaFKFCxeJBKrvwcBlZccS0UzUPAC7tzUAkexKmpg6t9lpw2h1MkhesfA==
X-Received: by 2002:a05:651c:1045:b0:2bc:e470:1405 with SMTP id x5-20020a05651c104500b002bce4701405mr5089269ljm.46.1694703435259;
        Thu, 14 Sep 2023 07:57:15 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 10/29] xen/asm-generic: introduce stub header iommu.h
Date: Thu, 14 Sep 2023 17:56:31 +0300
Message-ID: <8990c5c77c12333bfa7aba42b66bf7fffee5a096.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stub header necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/iommu.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 xen/include/asm-generic/iommu.h

diff --git a/xen/include/asm-generic/iommu.h b/xen/include/asm-generic/iommu.h
new file mode 100644
index 0000000000..b08550e6b3
--- /dev/null
+++ b/xen/include/asm-generic/iommu.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_IOMMU_H__
+#define __ASM_GENERIC_IOMMU_H__
+
+struct arch_iommu {
+};
+
+#endif /* __ASM_IOMMU_H__ */
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


