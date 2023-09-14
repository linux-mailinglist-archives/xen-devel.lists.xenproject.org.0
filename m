Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4308A7A0927
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602522.939205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoEt-0003T4-M0; Thu, 14 Sep 2023 15:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602522.939205; Thu, 14 Sep 2023 15:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoEt-0003Qh-Ie; Thu, 14 Sep 2023 15:26:43 +0000
Received: by outflank-mailman (input) for mailman id 602522;
 Thu, 14 Sep 2023 15:26:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmW-0002W4-Mn
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:24 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02aea674-530f-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:23 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso17661681fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:23 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:21 -0700 (PDT)
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
X-Inumbo-ID: 02aea674-530f-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703442; x=1695308242; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coEQMPTgAm6PCB5dv/pWiS4JQtiix5jmfz04ylJhE40=;
        b=U68eC7Sux8mDz6sKnDFTntRGIm6U9n9g+F87dvQnfSTL+Sp/u3UEhfFP1BNxKBfTDU
         iDstZKmlR+mdZQcwmJunQFwhc9HSkAuLvghZ4suhASIP+9ZbVmNo9W2wgp3MW5SbEe9a
         bZdaao7XPGU/1jCCAs4TcT/ACYYc238zvUx0dcErd93MAAHzvclg72yTEZrWQ0uReA3S
         7RdhioKloLraF2vHgfDuxW9V+uJlkdO+xwYOd1/Fu1m99+shq3j3jzJ+0tmU+MQq5Uki
         ZYcsG0xQjBgcd89+TepKx3UIf+T0tegRSiP5voi3XXi29GN9cXolXjFJGzIQnQK6QSuF
         vzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703442; x=1695308242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=coEQMPTgAm6PCB5dv/pWiS4JQtiix5jmfz04ylJhE40=;
        b=uIB2GcTywX+FLkmV9RlaX09qibCMSp8CAqljmsAu8hRdv8nzrSVWVSk07qykThq212
         J68eHHpJC/5/tknziOg0XREDLwYWSQCAMkrTFnTaj743tpM5aJm3ejkVmMb3eUqYZLwJ
         AtVt5Dc2+xf6O8Pf1cfZZ3MbfWM3jYYS2OUBQTuvKaK7eAWzeCqJnr8iMfJVqR2vvI4y
         pS1/ptzOagK/YB41/7EbG6Pz/h6XiDTaGr0IARZXqm01/tDTsPw5z/9hHHiCMd3+KefK
         WLx/XlOp7Z66Axk/IOMN//RodrbuE2/cYqc/3mnPteeQ/363j3e170WK39prDNndpsbW
         9qew==
X-Gm-Message-State: AOJu0YzFzBMrn4JvWC72OsdiHwb4rgdGl/mwSopIBxqZROxzWvfJixFq
	mKf8C28Cstnw+7tSIQ5vg26BIsyknUk=
X-Google-Smtp-Source: AGHT+IFC2dIiXATfiVYVDyfYgZUhjeLJYrsUFTZdHSupAzDtjcwvdxW+cyBAPNTcBWlsyBGzGs+9IA==
X-Received: by 2002:a2e:9dc2:0:b0:2bf:ac97:df26 with SMTP id x2-20020a2e9dc2000000b002bfac97df26mr5007231ljj.25.1694703442287;
        Thu, 14 Sep 2023 07:57:22 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 19/29] xen/asm-generic: introduce stub header hardirq.h
Date: Thu, 14 Sep 2023 17:56:40 +0300
Message-ID: <cb76190d2b0b056c6733c1f5cfc941d0201f6490.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/hardirq.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 xen/include/asm-generic/hardirq.h

diff --git a/xen/include/asm-generic/hardirq.h b/xen/include/asm-generic/hardirq.h
new file mode 100644
index 0000000000..b4b71a7315
--- /dev/null
+++ b/xen/include/asm-generic/hardirq.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_HARDIRQ_H
+#define __ASM_GENERIC_HARDIRQ_H
+
+#include <xen/smp.h>
+
+typedef struct {
+        unsigned long __softirq_pending;
+        unsigned int __local_irq_count;
+} __cacheline_aligned irq_cpustat_t;
+
+#include <xen/irq_cpustat.h>    /* Standard mappings for irq_cpustat_t above */
+
+#define in_irq() (local_irq_count(smp_processor_id()) != 0)
+
+#define irq_enter()     (local_irq_count(smp_processor_id())++)
+#define irq_exit()      (local_irq_count(smp_processor_id())--)
+
+#endif /* __ASM_GENERIC_HARDIRQ_H */
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


