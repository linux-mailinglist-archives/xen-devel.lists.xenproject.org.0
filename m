Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6AA7A0821
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602366.938990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmW-0005vU-3e; Thu, 14 Sep 2023 14:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602366.938990; Thu, 14 Sep 2023 14:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmV-0005bL-7w; Thu, 14 Sep 2023 14:57:23 +0000
Received: by outflank-mailman (input) for mailman id 602366;
 Thu, 14 Sep 2023 14:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmQ-0002W4-UV
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:18 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffd017fb-530e-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:18 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bfc2b26437so16161951fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:18 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.16
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
X-Inumbo-ID: ffd017fb-530e-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703437; x=1695308237; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ge5GOD9Fr0w6na65xCHQYy07lIZpjdeUTd6rT4/vFc8=;
        b=iG9qc431HTGoonnlR++lvmrbrY07uJBpY1WSJnrs1fAqB9En3x4G/nys1PVD3dZ1BX
         1dNeBhGktadAI15G2QAnoWcKBzR75bP3sIef3kALoH+/29gXIxvGZc92eRT5P8GUgZLn
         csdZTvZXeLMVFm13w5SFv3A7ZrXpGbAopx4PxoIWpYNC2hm4WlQOJYTxpX471s6TqfkN
         OuBUGWA34V0q+vw+qZVuREsQbIDMyqGleNVfpVXtGPEQtvG2viZyqLEwQEkf+VARO5LP
         QpmKiL80AlSq5kk1Ad8PcXBRLvF1kwE860Ga3uw597kWtx3THrVr+n/8CdXc1h7i2OIQ
         wUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703437; x=1695308237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ge5GOD9Fr0w6na65xCHQYy07lIZpjdeUTd6rT4/vFc8=;
        b=iWq62AI8DTM5B973MHkBFoUmZkZBkso3HnTenZypI68rMtQy/P69gMy0+k30BgAEPl
         Nz/XoQ9htIQKUElTwlzpRuO/os2zBlBMRt/xJd+1OXqFqMspXkyR44ZkPXjKxUyPM7xd
         hQ3YDNEgmrAKdvCU9SwmDqPZPRIg0WV1iDugwjAlAfJ+SLhY6U971PhdoFRQ+6jEUFA7
         LZs+8//S5GTc9HnJAbHw1dRP6ILCW9pBzm6+0olTpTVCcnZV22UziUXm3l0hOkWdjeX5
         rfE+HAnKziOvxUL/VvpyRgWXH4Yr06WadmM0opT8DffWIvjn7uI6ube2LMcFOym6ejIQ
         OZnA==
X-Gm-Message-State: AOJu0YwxZQFJ+0e9ggWMt6fq/GCPsNEvF3Y6ncKJwoxIS8C3pNQUW2dz
	r39w1NaFp5kYgZbjQedxAO1P4irkUZ0=
X-Google-Smtp-Source: AGHT+IG+wg0jHGf/n/TuTWW/3xuNm0mtFdh6lO8xxNiGJeFuNuosUrKFBO0cKnaRD18ayOqpevA9Ew==
X-Received: by 2002:a2e:958a:0:b0:2ba:7b3b:4b7d with SMTP id w10-20020a2e958a000000b002ba7b3b4b7dmr5024211ljh.17.1694703437524;
        Thu, 14 Sep 2023 07:57:17 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 13/29] xen/asm-generic: introduce stub header random.h
Date: Thu, 14 Sep 2023 17:56:34 +0300
Message-ID: <11661fae695fc50e212787829bbe8afb316f2a52.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/random.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 xen/include/asm-generic/random.h

diff --git a/xen/include/asm-generic/random.h b/xen/include/asm-generic/random.h
new file mode 100644
index 0000000000..cd2307e70b
--- /dev/null
+++ b/xen/include/asm-generic/random.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_RANDOM_H__
+#define __ASM_GENERIC_RANDOM_H__
+
+static inline unsigned int arch_get_random(void)
+{
+    return 0;
+}
+
+#endif /* __ASM_GENERIC_RANDOM_H__ */
+
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


