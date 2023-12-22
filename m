Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85B81CBED
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659425.1029133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDh-0003Zb-IF; Fri, 22 Dec 2023 15:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659425.1029133; Fri, 22 Dec 2023 15:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDh-0003TJ-Cj; Fri, 22 Dec 2023 15:13:49 +0000
Received: by outflank-mailman (input) for mailman id 659425;
 Fri, 22 Dec 2023 15:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDf-0000EM-RY
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:47 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3ae300e-a0dc-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 16:13:46 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50e384cd6ebso2165744e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:46 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:44 -0800 (PST)
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
X-Inumbo-ID: b3ae300e-a0dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258025; x=1703862825; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZzYufQNZjpcCeO79bMfJlqcSeS2q9i+NJUjGOoMktg=;
        b=GqxNI7l3IvQUrCjA2pmqzELRVAwM/eZ5jxbw9RplT9zwxcdvUeWvbTjvgudodxZSHC
         oHqED1qlg1DPygfnab4v9QPuDxpLBGo9Mj9bgseJZzMoVskCJdyTgrXdFJA33urCVtrf
         ObJZyGSk3v4E3z0grZlS+t5dL8c2mzQp3C39ituL7230ls4G2twFkBoCX4zvLrExwDuT
         eumIpHU6sfGgFPuS2jXp4AI3cHKfEUwWdfwRWxyRf8sR6rF69shz8MUzpgUrdTeKESqd
         1AmAzROAW3Ds9qZ01wXeDmjO5Dj2Tsi016Ewx4DJfcWJK/hduFSziqKifTfxlUvgHb54
         8eHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258025; x=1703862825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZzYufQNZjpcCeO79bMfJlqcSeS2q9i+NJUjGOoMktg=;
        b=eizwG3w5X3n9zzhCWs8DSqRVKKlx2rRiAvIxVQA5OMvg9nR/QQgmLIz/JAFyE1O0bR
         FYrWJUP9UKtv9Ml0+3/UDAytSXcvOUY9Jt/vZvdCR8hxw/6QtTVMmwToQluFBVLnT/rb
         BkYaAaMJM5HW2rJeNUv+z0bsGUloEI5z8DUJ38YEt1DOGqkuifiD2Fceck39Y1sWCj5j
         NH+i9xxVrmD2UvaMBqyXUwgCM2+bFiQEwAZXHciKtBHU2DAN8H99z8d+lhHYiBOq+AJL
         FLn6+Rc3P1YyWw7tXDKy0ZJnvZI+N5K6NQVGbYjS3WdoSZCuze0t7b1W91DG/6T5YkO1
         leqA==
X-Gm-Message-State: AOJu0Yy/un40VaH1ZbgZQTdvb/vCaG3AhL65IwzBvNFriFH9Ar1AINgx
	KZtG9JfMFEu94r4oG6jW2TJlSC9E7Fs=
X-Google-Smtp-Source: AGHT+IEa3Lci85EhlI7EpPIDFh0+qGFFKZULIcciEknrUzZzxtIMyZ6rBYeGHZ5G1fa/JP5TfkTZ3A==
X-Received: by 2002:ac2:51a7:0:b0:50d:1c5e:7982 with SMTP id f7-20020ac251a7000000b0050d1c5e7982mr492145lfk.182.1703258025192;
        Fri, 22 Dec 2023 07:13:45 -0800 (PST)
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
Subject: [PATCH v3 20/34] xen/riscv: introduce irq.h
Date: Fri, 22 Dec 2023 17:13:04 +0200
Message-ID: <11613eb5a0378315d70fc2f4d4f744ede579cca3.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - add SPDX
 - remove all that was wraped to HAS_DEVICETREE_... as for RISC-V it is going to be
   always selected.
 - update the commit message
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
index 0000000000..a4434fb8ae
--- /dev/null
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_IRQ_H__
+#define __ASM_RISCV_IRQ_H__
+
+#include <xen/bug.h>
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
+#endif /* __ASM_RISCV_IRQ_H__ */
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


