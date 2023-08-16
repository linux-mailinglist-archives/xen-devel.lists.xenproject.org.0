Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC87E77DEC5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584491.915331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoy-0003sn-Fi; Wed, 16 Aug 2023 10:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584491.915331; Wed, 16 Aug 2023 10:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoy-0003mV-AX; Wed, 16 Aug 2023 10:32:12 +0000
Received: by outflank-mailman (input) for mailman id 584491;
 Wed, 16 Aug 2023 10:32:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdj-0003R9-6B
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:35 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89168ebc-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:34 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31768ce2e81so5612816f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:34 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:33 -0700 (PDT)
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
X-Inumbo-ID: 89168ebc-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181233; x=1692786033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRtiTYQRYbcZrtXq4n+hG2e+DxiDviaEq931etLVkR0=;
        b=aMuSACQJ5APZ3KpcB+04LYm5+njozs1fC9hVKCmbVy1RUcfg2pFx3iwFSYbMHKlEUw
         2lQ/EVWyUwG+1moRnw9HgqZXtqfadnx3CxoTh/RU72DEdghHWSjB2poXJvkt/w+Pypmd
         dsXZkYyGMJwz8yHdwf2S7acfUlvOK6IpygEfI7Vf07nyz7W3StzqKJEbVzrQXgiyQTE+
         s/tJnqq1IeiBNjo+BAY5S1zqhaxJZoW59g2UiVL9Y+DkkMhIdiyYqBfhVMmPgPWD5nPf
         8f+TlkcqMfjTlrwcwtE5tOsZo4NLxY9e3KKRDTEfYKgt4ZAulGzx3xzoiTwABCcC+Gdo
         xccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181233; x=1692786033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRtiTYQRYbcZrtXq4n+hG2e+DxiDviaEq931etLVkR0=;
        b=Ewi2pD85/X5A/7iV55vp0N6fNDL1D4O5Fmt3XtalM1NqEAYuMMHKwu1X1s0u4dKX0f
         h3ywMwALBm+OqUIsPTMThW7Tvnb0EIm5eBm/F/3VHb6gHpf4qjeGri2grsYr0uWJgv2j
         ehyt60FPKzEJTCzuskndQf/Kdlma0cdSFEmgpQdzR40y1s/Cvxf6vsQ0tTUMF4zZzxlC
         u1TKUakS3BZrIKDBo2WfPMuPtYAHZLmgZFeRYjgWhbE+ccog/HEanAgPYpe1jY+N8XfC
         zFtfdQPyqTpfMMBv0+rGb6MxTNXcm8TPw3aEnDPqEscIap6AuuUgfICqMoHKK3XWW0FI
         jMfw==
X-Gm-Message-State: AOJu0YypgsY0cHjNvwkF1lZ9wvyQszeANMcAPZqr7dl52a7jHH2cPsUP
	pLQY/TWYhOiWBRDzj2WakcX2TtQpsgVmXFY3
X-Google-Smtp-Source: AGHT+IFbTFVylxr/IB5kRWU6W9n2p2yc0LAU+SeWWffoBbgNlIVl7gRfczsV2vsmERd3aTbwxs9ANA==
X-Received: by 2002:a5d:5349:0:b0:30e:19a8:4b0a with SMTP id t9-20020a5d5349000000b0030e19a84b0amr1086272wrv.2.1692181233369;
        Wed, 16 Aug 2023 03:20:33 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 23/57] xen/riscv: introduce flushtlb.h
Date: Wed, 16 Aug 2023 13:19:34 +0300
Message-ID: <d3ad3f549b1fe58075d7140d4e8202b4d5293feb.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/flushtlb.h | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/flushtlb.h

diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
new file mode 100644
index 0000000000..7059a53823
--- /dev/null
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -0,0 +1,31 @@
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


