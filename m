Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B437A0822
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602367.939001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmY-0006Kq-4R; Thu, 14 Sep 2023 14:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602367.939001; Thu, 14 Sep 2023 14:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmW-00065I-Ue; Thu, 14 Sep 2023 14:57:24 +0000
Received: by outflank-mailman (input) for mailman id 602367;
 Thu, 14 Sep 2023 14:57:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmS-0002WX-Jd
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:20 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 005159c4-530f-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:19 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2bcde83ce9fso16702111fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:19 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:17 -0700 (PDT)
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
X-Inumbo-ID: 005159c4-530f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703438; x=1695308238; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJyUmaE6XVKkbHFSmL7W+qlUab1X3iwbXqdSKsKXOYM=;
        b=n2ewXsV2tfCn7d+ofIu/fI1q3330wmUQcxzGjpQ2NpAAOX3LsigmQAoJJt/daqlPU4
         0kZ7RE3W/+XDzKAzJYdu4wycPnGGfEeiUtMAKwOF52KS6WOF2U6moXyAZK3lloB/ENTj
         dFgeZJBYVE7o9OwuOsb5UZL8yU2aWvfx73Skz2XqmWCZbKmNw3frONXfV242YJC0yUaA
         cqN1NtSNcfZGdKEc+ES1Vdf2IbcT0x/dHeOPkWAPBaM/GGDOBW1Aynju5zxuEuEnnHLt
         cYP6eYMVUoQnm4o8/dIA79/rsX2EdrtkRTapn1M1Yi2iMxXBE1rCkow7oxTDJ5VW0h9t
         LX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703438; x=1695308238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJyUmaE6XVKkbHFSmL7W+qlUab1X3iwbXqdSKsKXOYM=;
        b=XJT1xtPeeExSUw0O4gKW3brsRxPRGmzRwSN773FyTdVMA1sPMF/OYdZZ66sw87ib6J
         ph8WORCpErNOtLXa15v9OeA6Lmq+Gs3Com5+rlKFOXlUla7S8VOZhVk7ZrRr4m0UoN0O
         SpS5BudG6f0JVM6x2Ld1S3uv+e7Dnt/vZc9DjSlzcZIBXFviYNg21AukiH1eqga+toF9
         VqfKMsoIRef1h49YmvysNHC8bb2f/ApKHHCQQcvoeaa1SuIjtlS9Bjt3o5k/WUxYvW1k
         MM47jtrzjWY3ts0as9Dmpuj/JLtleKu8IkS2fXO1Q+0wflHwYToSUixSNEPtzCgPR0mY
         o4PQ==
X-Gm-Message-State: AOJu0YzkvsJ2zTCq7XS//+p4N6VIvhIc3hpZsoW1KCjwSzmbmDq8uA8I
	UYfxIPvvJXc5VZ88R7S4XqVEoRVIeGE=
X-Google-Smtp-Source: AGHT+IHIQozzFk7f0tTtIVLGiTHEWo0Cm5pRE2Suj5w7XF4rAnDFFKB8g6Zsk06/GlJT42VJWlftVQ==
X-Received: by 2002:a2e:9141:0:b0:2bc:d38e:b500 with SMTP id q1-20020a2e9141000000b002bcd38eb500mr5761368ljg.42.1694703438367;
        Thu, 14 Sep 2023 07:57:18 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 14/29] xen/asm-generic: introduce stub header setup.h
Date: Thu, 14 Sep 2023 17:56:35 +0300
Message-ID: <0b0ec8c33722cf25a0b87cb3c24d6d96c3a90301.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/setup.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 xen/include/asm-generic/setup.h

diff --git a/xen/include/asm-generic/setup.h b/xen/include/asm-generic/setup.h
new file mode 100644
index 0000000000..37feac222f
--- /dev/null
+++ b/xen/include/asm-generic/setup.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_SETUP_H__
+#define __ASM_GENERIC_SETUP_H__
+
+#define max_init_domid (0)
+
+#endif /* __ASM_GENERIC_SETUP_H__ */
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


