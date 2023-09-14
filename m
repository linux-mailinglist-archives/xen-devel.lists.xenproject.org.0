Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812A07A0819
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602357.938924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmN-0003y6-Qe; Thu, 14 Sep 2023 14:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602357.938924; Thu, 14 Sep 2023 14:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmN-0003u9-HY; Thu, 14 Sep 2023 14:57:15 +0000
Received: by outflank-mailman (input) for mailman id 602357;
 Thu, 14 Sep 2023 14:57:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmL-0002W4-0W
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:13 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc74587a-530e-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:12 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bcb89b476bso17524671fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:12 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:11 -0700 (PDT)
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
X-Inumbo-ID: fc74587a-530e-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703432; x=1695308232; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnrZ/AmdCqfNq1dsaQTi3pnInRO1wYchAayEqPy5DtU=;
        b=SWPezd5cwS4hEBDJFtPlbCCbghk6ER0/ae5v26Y+e8MMJfvHhMLQ2NE3D253qM8E4f
         kl0CcXpr1Fj+KApTLA4fJwxVOUuUPW7z4UI6ykM1Roe9kLV6NEGfSQu92qs3O77wBVY0
         Yf+4c3oeg80vseQc88E43OI0aNThy1of1TdHphY21st+pvBLszcWxLU/lAj9XBFeshu5
         2xc0JG3XNgtBXweN7GfkiWWuCE9yGUqFfI4JXTapwLSuNzdSVi85XM5QfdGGx5ZOzGxI
         cY/AFrkg2NvK0iNXh7yFaf0a77ettmFJFJJUu/59LlD61LUSv6YMTbd8IG2YGcAe/Zc9
         J34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703432; x=1695308232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnrZ/AmdCqfNq1dsaQTi3pnInRO1wYchAayEqPy5DtU=;
        b=hy1ilJIQLz3DNqRrJOPHxV9KBwx12VUdvi8JBLWAyHCbIArFQKUAHBkB3xph9dk0Xp
         wWUC9izHNJGUA/HoB3stYy2XwDeuPS0wLT6RuX4vE90pktbd0haLtNTnBFuCVeP0HJtH
         9D+h1ozrXJkoOgrB7woY0NSs3fJmdMezFf9Wbo+zLXzXyp5UAEqWcoU+r3kGaJiJ38jK
         fvO3ALRhXD10t42XagmcKC5SG5k6HL78Z2Wpq5v9fA046QK2lNV8z8eOarhfp+Ympv1x
         j78JI81XDPFuMmh0VRTdIRHey0Mb0jCFSIuHqZNhIyoEtbjQvmjqNd2JSC1zBioiKcZk
         Y2kA==
X-Gm-Message-State: AOJu0YzycRyE7fPbSftVjYogdQmD8wLcofO80vNN6S5mD7Y+RXF0TdfN
	PUoaZcY9DTMvZgsjMJji6JfyLQwOmfM=
X-Google-Smtp-Source: AGHT+IGLaHC2tTJhb9pwr5tg/S3L9996rR8Rg4Lyo8UK7mYY3EfyvA05BRF1zgwyQZhTJBhS9HtegA==
X-Received: by 2002:a2e:3514:0:b0:2bc:f439:b5a5 with SMTP id z20-20020a2e3514000000b002bcf439b5a5mr5133368ljz.14.1694703431925;
        Thu, 14 Sep 2023 07:57:11 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 06/29] xen/asm-generic: introduce stub header grant_table.h
Date: Thu, 14 Sep 2023 17:56:27 +0300
Message-ID: <f3efdfc93780b62be93fecec68860e12026fe66c.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stub header needed for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/grant_table.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 xen/include/asm-generic/grant_table.h

diff --git a/xen/include/asm-generic/grant_table.h b/xen/include/asm-generic/grant_table.h
new file mode 100644
index 0000000000..bd8d85f1ff
--- /dev/null
+++ b/xen/include/asm-generic/grant_table.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_GRANTTABLE_H__
+#define __ASM_GENERIC_GRANTTABLE_H__
+
+#endif /* __ASM_GENERIC_GRANTTABLE_H__ */
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


