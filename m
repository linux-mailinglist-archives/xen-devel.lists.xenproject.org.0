Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8908849E36
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676204.1052246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xr-0001Gy-MS; Mon, 05 Feb 2024 15:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676204.1052246; Mon, 05 Feb 2024 15:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xr-0001Dm-Fb; Mon, 05 Feb 2024 15:32:55 +0000
Received: by outflank-mailman (input) for mailman id 676204;
 Mon, 05 Feb 2024 15:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xp-0007I6-Up
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:53 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d356a980-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:32:52 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-511490772f6so1897755e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:52 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:51 -0800 (PST)
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
X-Inumbo-ID: d356a980-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147171; x=1707751971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwio54x9hUhe11rwf/yjaXDL3sN8O/ZlCRLr2jTGTZY=;
        b=YiKPcRS4xFOtfvkWcvJEIARKHy4yISd78K9cDcOMFvuaKHlaVQ5XbUqwiCcrzA1P2E
         s2vCaAqGMfKbO+E8ZiNGlC/gS4HEU4+ZH3fDsf9YSmBrrvcIdagogyV5Q429V6CnrKI0
         5c588vcuWyvqRrYoKjUsv6MnNqASLA0mph9qc77MZsiftkc+1Kc1vgU3CLL3Fb6sYcPH
         PU10YNv9qwbJbTaJm6GoGoQbIOG2WD/iwf7z1+UVZJkTl05w3ccrAemTb+rr12EUeXwD
         dJ7j9MZt4mlzRB8Bx02sF3q6qmP8Z5KMO8gBryv6Xkr6ixv5cNyWe9ioENjiDZeJHhNY
         ligw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147171; x=1707751971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwio54x9hUhe11rwf/yjaXDL3sN8O/ZlCRLr2jTGTZY=;
        b=T3J2nD3LVZrsw71BPe9WwMCfmyj6ysIMPXT4M1mMGhDUA32Dih0Mq7XmHcbLcbRl9f
         ZJlwG2SUxvJ4aKXcmJtAF4a2w4uWb10YO/HLifVlGWu3IjJ9D6MEVy3Tt25DDP8Thj8Y
         VHQvuvQunKpKZX4Dd12UNjtOOZvqmojY1H4Zbp2cM3FXvOrN7T8/n+jlqoW83d3nuEM0
         D94we+Yoh3rhi7eoh3gFANGDwr3BGM9BemOVKEmBLWZDdEw2/qF1DT7REZsggl41oOnr
         IWyZ7GKgS2Vm+LioToRvV2kpjCYq8KUyfrG9TjkZdRo2OcXU6uddDBrCtEvovE7P1jPf
         WGaQ==
X-Gm-Message-State: AOJu0YxvY1DdcnhOphsgyolMiszYnsFbajNMa/kAGgWgPxJ/4FiJnZau
	tp72z/aPU/+V1XA65VQ6iLj20/Nqb43MnN9eHfT3J47hdwBa7InqNleyGofa
X-Google-Smtp-Source: AGHT+IFZGdwH2lHHVG2t/xS6L0Xo/4euF9vnU21rET/44ZrxCDcHHerFqoPvtRdlUYOOp0GTM1M7Xw==
X-Received: by 2002:ac2:5b85:0:b0:511:480a:adfd with SMTP id o5-20020ac25b85000000b00511480aadfdmr4253507lfn.51.1707147171368;
        Mon, 05 Feb 2024 07:32:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXMLrvdR3TOf3sG6UVBkrDQgQbFc3dXFK7MkHm3juaKt6SaYUZGlZVEm/ETsK+A1U2k4DPZt6nl9cRxNQgs76fc4GRvf6u3uhLTL4RXneFi89If90F8xCQ/72+zFpjgXeVbo1w8TOA20aQthv1YbS0YD7lcdcup3en6Owyu0E/3m8bqn/vSwA0mpgb+auJpU6a0Tf5AHy3bpPhsZDpNz8puqaf8sYHP1ud6srqliQFZYu/0tzQO+WYFXHlLRnXRiCqTMqj1ZgE2+yL6/RT6OFjxNud/2pJYQ01+gvNAnGJU1IkpkjYTt35m4iGaTJuTHQLwN015
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
Subject: [PATCH v4 10/30] xen/riscv: introduce flushtlb.h
Date: Mon,  5 Feb 2024 16:32:17 +0100
Message-ID: <0aa76252c83b60952d410b00645eda0b6e0b3be1.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - s/BUG/BUG_ON(...)
---
Changes in V3:
 - add SPDX & footer
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/flushtlb.h | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/flushtlb.h

diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
new file mode 100644
index 0000000000..7ce32bea0b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_FLUSHTLB_H__
+#define __ASM_RISCV_FLUSHTLB_H__
+
+#include <xen/bug.h>
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
+    BUG_ON("unimplemented");
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


