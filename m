Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18057A08A5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602411.939075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgny5-0007wU-9t; Thu, 14 Sep 2023 15:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602411.939075; Thu, 14 Sep 2023 15:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgny5-0007tE-6Y; Thu, 14 Sep 2023 15:09:21 +0000
Received: by outflank-mailman (input) for mailman id 602411;
 Thu, 14 Sep 2023 15:09:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmT-0002W4-AQ
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:21 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0160b900-530f-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:20 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bcb0b973a5so16354911fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:20 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:19 -0700 (PDT)
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
X-Inumbo-ID: 0160b900-530f-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703440; x=1695308240; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F15dxGQnK3sehzSOwvv5F5BATla17v6rMpQqDBCmSQQ=;
        b=f1day6IZI0EyS5QL0FGOS3ahfAVDmhGG+Dl6+RppPGoqRo+JIqqJjFTrs0CvOp9qyv
         deF9YhzlhwFTcX6Gktanfu3XDMYVMDfeDMCsUOj3oN369GvX4MxW7oZaZ315rlL6LvLJ
         NTXo9gqqaXw5LZb2tHejeF0nyXK0Ya4kVTw7giO8lSBViy/Wld+24C/HTc4/AuAL+MwU
         ElavM4lVEI5yK7PlwgCit5tFT03LOroPNe3GDa07q+Y/TMtyPUUz9nVEJpaRRVIk8kIa
         QmtxuT15TTPjWYMLhFfhvBhlNrIcGpRPgN6fYASQiAKqUfWYDihQNOswlPXLcjrBEqAt
         7Bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703440; x=1695308240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F15dxGQnK3sehzSOwvv5F5BATla17v6rMpQqDBCmSQQ=;
        b=mOtS5NjDfWulM1qxPwNzgs/E8zt366+i0WqCrUHcBRuRTThDSBLCL3WS00xGcoSJHy
         0czF4hCgQO8HfnWq0KUcRsvSIqGo8hRNQsasG12QqSpV8aCAMEjyfQS3Ig+uZpLMaZwa
         K3iPcU99q6IKBLqFfzRzaQ2rzlh/Yk3thTDgr84pPA1xpUT/o/aOBN0PJtNEVYDPnGOv
         xA60/HTI8RGLAqaTEhTjyZlloUW6CSK2ALCvmRCdTnFxLNvw0fSGNRLA1uVkHLQ+VmCQ
         TxnqfLASryKnACSuhc8YSdeM+NboCS+BBkpKQgHaZXJf9/ZpW4g4953cqlKHKQ/Qm07q
         VmiQ==
X-Gm-Message-State: AOJu0YxfgdfUafVx34xjXgn38S8Bqbec6DE54TOSp8w3pDIth+5ijDQl
	SOpsmIaXvniS28AidwN6RnR2BK3M9/M=
X-Google-Smtp-Source: AGHT+IH4+dQpAED5rWJZE+3xxCQwXeBCWcvjSgP1BciK56T83EKqzyhY0y2XpPJ3tVhD+xl6eNkHNQ==
X-Received: by 2002:a2e:b178:0:b0:2b9:f27f:e491 with SMTP id a24-20020a2eb178000000b002b9f27fe491mr5594299ljm.42.1694703439916;
        Thu, 14 Sep 2023 07:57:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 16/29] xen/asm-generic: introduce stub header flushtlb.h
Date: Thu, 14 Sep 2023 17:56:37 +0300
Message-ID: <8f5e2ac850eced2153d68effcb36aca1ed065aee.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/flushtlb.h | 42 ++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 xen/include/asm-generic/flushtlb.h

diff --git a/xen/include/asm-generic/flushtlb.h b/xen/include/asm-generic/flushtlb.h
new file mode 100644
index 0000000000..79e4773179
--- /dev/null
+++ b/xen/include/asm-generic/flushtlb.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_FLUSHTLB_H__
+#define __ASM_GENERIC_FLUSHTLB_H__
+
+#include <xen/cpumask.h>
+
+/*
+ * Filter the given set of CPUs, removing those that definitely flushed their
+ * TLB since @page_timestamp.
+ */
+/* XXX lazy implementation just doesn't clear anything.... */
+static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timestamp) {}
+
+#define tlbflush_current_time() (0)
+
+static inline void page_set_tlbflush_timestamp(struct page_info *page)
+{
+    BUG();
+}
+
+/* Flush specified CPUs' TLBs */
+void arch_flush_tlb_mask(const cpumask_t *mask);
+
+#endif /* __ASM_GENERIC_FLUSHTLB_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
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


