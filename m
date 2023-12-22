Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D41381CBE8
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659417.1029099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDX-0001lA-59; Fri, 22 Dec 2023 15:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659417.1029099; Fri, 22 Dec 2023 15:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDW-0001e9-Jm; Fri, 22 Dec 2023 15:13:38 +0000
Received: by outflank-mailman (input) for mailman id 659417;
 Fri, 22 Dec 2023 15:13:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDU-0007Ie-CA
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:36 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad0273a2-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:35 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50e67f70f34so1064574e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:35 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:34 -0800 (PST)
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
X-Inumbo-ID: ad0273a2-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258014; x=1703862814; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34jIfAHruS1igTLy4v5O5K/2+Cv87aWM2kyu/xj3kDI=;
        b=hGTGvTbadHqjtAesU75R/y1q7dMNwI3VAKV5+rZCuDPHI6E8C3AgJTtQWAL07IVQt9
         o3pRnIaZJgLKkfCJ7CmeB1QjXiEw65EIlXkmFzuq+W6jYpstl/5Cdgxbpsefx/yHo9bC
         Grd2j4u4YOztNGjACFNq+ioYReUokF5ISIEyDnvHWqzeY/8PBejLBbUfyKn8aJzLfLGr
         qn64kH6uUO/H5agJIpcpwHeP9bi0w3LRhifZXaG2aqB/cKXqt2ysDN8B+6OlSnYEjNuY
         aUgPVdjRZs+P7BR+Qjm20NhToT8uredgmmKWwt4BfFPyS8XGA8RobY/LYq50qvHXvdqe
         ecUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258014; x=1703862814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34jIfAHruS1igTLy4v5O5K/2+Cv87aWM2kyu/xj3kDI=;
        b=kMGBTh5SpQPuhGQVvkTMH+H0W42tYjq85O8YbvY09oIrLDgmj+TeM1w0+Z+Tv1+xmI
         Vonp8Qt9ZsE373er4k0K9TOrfraHQckfbjRM6/v/d2Y9qMnKv00Vnr+S0/c3SVS8tJX3
         Cru+fVMMiT7N5WZcm4J/GWD6EqGUoAQU6RngCZEZVSks5/R6/eXgNwxXWSAuL46vK7G2
         yXaN3mcIjLgfSwPuWIadkseQfK9wOi8R2bDJDU/wbTWuHsynHj/Xn4pGOHo3HyhZyb9W
         CH7UfgfMQ5EONJZmXuuEdKFTftf1bzKU98yjINCxS/pEqpEFnXg8ecrWemiH4DbxsBfB
         6NdQ==
X-Gm-Message-State: AOJu0YxKkTT8CmdnWMBXFcLV4a35+Latd2BSgbbHoLl8XJXRYoANN3sE
	7ol9mgtYk/gqEmSXMb+rICw83Niy02k=
X-Google-Smtp-Source: AGHT+IHD/yBfdoadthgsprvPOestR7uYY9evy4Bg+UKv4XV9FrHwiZpUfNCXyls3OXQrVJFlRkEKHQ==
X-Received: by 2002:a05:6512:613:b0:50e:568d:d527 with SMTP id b19-20020a056512061300b0050e568dd527mr706765lfe.11.1703258014512;
        Fri, 22 Dec 2023 07:13:34 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 11/34] xen/riscv: introduce flushtlb.h
Date: Fri, 22 Dec 2023 17:12:55 +0200
Message-ID: <2e067c286c7002b4b2a41538dde040ff06fc6cfb.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - add SPDX & footer
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/flushtlb.h | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/flushtlb.h

diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
new file mode 100644
index 0000000000..3bdcb08e3a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_FLUSHTLB_H__
+#define __ASM_RISCV_FLUSHTLB_H__
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
+#endif /* __ASM_RISCV_FLUSHTLB_H__ */
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
2.43.0


