Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5891B7A0906
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:25:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602507.939185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoD8-0001Xp-Vr; Thu, 14 Sep 2023 15:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602507.939185; Thu, 14 Sep 2023 15:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoD8-0001W4-Sm; Thu, 14 Sep 2023 15:24:54 +0000
Received: by outflank-mailman (input) for mailman id 602507;
 Thu, 14 Sep 2023 15:24:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnme-0002WX-6N
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:32 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06b79c7a-530f-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:29 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2bcb89b476bso17530101fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:29 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:26 -0700 (PDT)
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
X-Inumbo-ID: 06b79c7a-530f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703449; x=1695308249; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2OuKjDTzJ8+b8gwJlzazcZfiUCC0H+tkCh4KnTlNNA=;
        b=UXC2ifmarNKAVsr+HhivmKJQjNZM7Dlyss19BeZuRF4wBqpbjnfDvk8AyaChmd4Bv8
         zYCFImuXF4ElJpR0tEwyHjLlKNDACKUTZ69wujFC6RV1X/azHQhi8mWOpYIlWi7pyog7
         RR3fhyusmrIyx3RHIZEDWG3zmIyqsjEzh3g3VVlEUPAiiEqTjsmFWnXxnf1cJpwtPsQM
         nPygrpmNI7gLahXb2btxGUUeW/fFsaHCMzVwMLOMfe/Pf4SApk48dHtNeziBLKdCsq9H
         aVVw5Pgx0OgE8rw/DGJMtrRxCX05RGd547vXh2FJO84dvn/CKSq73FceTQQXi8TpOWXx
         jtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703449; x=1695308249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2OuKjDTzJ8+b8gwJlzazcZfiUCC0H+tkCh4KnTlNNA=;
        b=rDhadcmG02qGTv7SfDn83m/q7Zq8KjoKXUzBHjva0IFToXSqdM8QahrpX1I7ldt1UW
         lOJs/6ksQne4cU1NUe9UMqCasDl5OIm8h/JBZPWzid3kRKMonuWxy30ftzXCHsK8uCUZ
         oNsSLDfbyGO0WKhOrj4YUSQr9YzXa6wDWsWDo4Td5XixyPNTwYD83LI6FmUUGbflTtBe
         Zb7lVhDRCxwZo6kt1uG0vRavAXx01Cd3aXmYKq8FN+G6cfxb132Xccbno0rkcHUPuB9t
         kv+nP5YQdqvSX+q8NzHyyWA5YoTPwhf+l2xIvSX9V2MzfCWWxpWNZnNhNZTkd1OHKB9O
         G9Xg==
X-Gm-Message-State: AOJu0Yw8+cQJkvzml9F832pD+3EdU83yaD8Nz9LrFnyCPm//0wzk12BZ
	1W/kyC5q052Pr39swPrrcR64j/cYoXA=
X-Google-Smtp-Source: AGHT+IES/YCnHzoBVQcCOIIasE5ptSSuGBzMiYKuVGdk/KMS5bFPAER8EEaM8C1vbMEoic+0UL2oFg==
X-Received: by 2002:a2e:3305:0:b0:2bc:e954:4203 with SMTP id d5-20020a2e3305000000b002bce9544203mr4798655ljc.26.1694703447012;
        Thu, 14 Sep 2023 07:57:27 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 25/29] xen/asm-generic: introduce stub header irq.h
Date: Thu, 14 Sep 2023 17:56:46 +0300
Message-ID: <63ee09cef41d0d2ec5e26eb6dbe20df2e377a0fa.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/irq.h | 44 +++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 xen/include/asm-generic/irq.h

diff --git a/xen/include/asm-generic/irq.h b/xen/include/asm-generic/irq.h
new file mode 100644
index 0000000000..5f68cbd10d
--- /dev/null
+++ b/xen/include/asm-generic/irq.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_IRQ_H__
+#define __ASM_GENERIC_IRQ_H__
+
+#include <xen/lib.h>
+#include <xen/device_tree.h>
+#include <public/device_tree_defs.h>
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
+static inline int platform_get_irq(const struct dt_device_node *device, int index)
+{
+    BUG();
+}
+
+#endif /* __ASM_GENERIC_IRQ_H__ */
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


