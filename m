Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D92A7F71A9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640435.998665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TbE-0006Gm-3K; Fri, 24 Nov 2023 10:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640435.998665; Fri, 24 Nov 2023 10:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TbE-0006Ex-08; Fri, 24 Nov 2023 10:39:52 +0000
Received: by outflank-mailman (input) for mailman id 640435;
 Fri, 24 Nov 2023 10:39:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTL-0006hx-BK
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:43 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a499f04d-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:35 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a00a9c6f1e9so250594566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:35 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:34 -0800 (PST)
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
X-Inumbo-ID: a499f04d-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821895; x=1701426695; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0C3Ch6z8tKuY04JIx8qm7izpoD3XbU6+MQf/w9I+Zg=;
        b=Jz0jnAij40C/FlFCQEXeaCfWm9azMGfWycv0NiPjnSxurFRvep9p8O141HWh3ggh7l
         3WuXpecglVSlzEHE5n1mQCGOQyBYs41sgy5LICESj65TY323eYyo65FbcVAL7rZu6/CJ
         MWG/7yBdvWu02Y4bQV0it9GkMQekWV1/QdACbJGDtFoj7xGJYn46w/2FoaxrKxuxh2z+
         xwZHzvXgD7vXvtEc+Pb+06ohJxOSUX8TIEGS8W7O4kFpP0WZBN8lbv3s9rK/iRrBBZWj
         8vt5cSvhjFHs4Sm3e6mEiBD2yRXvBC8QEBPBcAsLvSnuSUGAx5mGzHXXYjmAMbecOXP7
         F88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821895; x=1701426695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0C3Ch6z8tKuY04JIx8qm7izpoD3XbU6+MQf/w9I+Zg=;
        b=CCynR8pbHQZOTRdrQLrr1VeTP50IbGRUGJ093UmSYHtnNnJDvH15ZACx2qE6B/2C3R
         sYAyABn3vgLL4EwQVe3NMniuPmmvvS1ZkS2N3Jw/V59uBNHlc8XOBOsaok/2iSxdnAhi
         yiXiKVbenNqjMRXXC/+hJW4BOJpFr736wc3cs5sHqXU/bOzkFBjecFt9av+5VYLBvLD3
         6uC1jg7s6Ffkp+QXo9dnKe7SGETiA6/9qWwJ/+MHNWU1uW0Tp+4JyEasyoLBtaPMLzgX
         /zqtLItVhQjHbiY/QCr/KRFZ60Ok7qW4QT3oMCihv1NJuKWeGiEuTwVszZpivDwD2WLR
         WKkQ==
X-Gm-Message-State: AOJu0YzPaAEPkGvF/SouqrZqJUMtdcCQUr+D65M+1/2SPiYA60NBcEWm
	dxqptYImWfgDgRAMx4yNVvZ5LWlzksb9gA==
X-Google-Smtp-Source: AGHT+IFbdkFJ3SEuPodqyEBLwy6PEEz9f13WyBgHKw4XZGO8lZGGSRe/E8hTB495cXvr+mH5d0l/aQ==
X-Received: by 2002:a17:907:c718:b0:9ff:1dea:83b5 with SMTP id ty24-20020a170907c71800b009ff1dea83b5mr2001059ejc.42.1700821894858;
        Fri, 24 Nov 2023 02:31:34 -0800 (PST)
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
Subject: [PATCH v2 24/39] xen/riscv: introduce asm/irq.h
Date: Fri, 24 Nov 2023 12:30:44 +0200
Message-ID: <e9fc98cad562dad495ac1eb87b98be77cda72524.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
	- add ifdef CONFIG_HAS_DEVICE_TREE for things that shouldn't be
      in case !CONFIG_HAS_DEVICE_TREE
	- use proper includes.
---
 xen/arch/riscv/include/asm/irq.h | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/irq.h

diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
new file mode 100644
index 0000000000..ca49d3f9b4
--- /dev/null
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -0,0 +1,37 @@
+#ifndef __ASM_RISCV_IRQ_H__
+#define __ASM_RISCV_IRQ_H__
+
+#include <xen/bug.h>
+#ifdef CONFIG_HAS_DEVICE_TREE
+#include <xen/device_tree.h>
+#endif
+
+/* TODO */
+#define nr_irqs 0U
+#define nr_static_irqs 0
+#define arch_hwdom_irqs(domid) 0U
+
+#define domain_pirq_to_irq(d, pirq) (pirq)
+
+#define arch_evtchn_bind_pirq(d, pirq) ((void)((d) + (pirq)))
+
+struct arch_pirq {
+};
+
+struct arch_irq_desc {
+    unsigned int type;
+};
+
+static inline void arch_move_irqs(struct vcpu *v)
+{
+    BUG();
+}
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+static inline int platform_get_irq(const struct dt_device_node *device, int index)
+{
+    BUG();
+}
+#endif
+
+#endif /* __ASM_RISCV_IRQ_H__ */
-- 
2.42.0


