Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5965F7A0921
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:26:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602518.939195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoEY-0002ll-EW; Thu, 14 Sep 2023 15:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602518.939195; Thu, 14 Sep 2023 15:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoEY-0002jk-BX; Thu, 14 Sep 2023 15:26:22 +0000
Received: by outflank-mailman (input) for mailman id 602518;
 Thu, 14 Sep 2023 15:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnma-0002WX-60
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:28 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 048d46ba-530f-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:26 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bfb0a2682fso17384781fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:25 -0700 (PDT)
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
X-Inumbo-ID: 048d46ba-530f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703445; x=1695308245; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIPWd/mQM1gGtdYNlRah5nW+TfnslfR5ETeR77/EyyI=;
        b=G+fbZQl+z8NzfrxacDW77EfcYrgD0u20XzhM0/O6Y/v86rz3GGbp7FT6+Fn/xzdXK4
         tdd6Nm1y0qkC9hpj7b0ZFupsOd6ZcrhbEktk2VSjfhzHjzO4QqqWFW9Q6vGfDBayJaU9
         9jT5QkQWw/tJNTLIev3xKzQ1OnoEE/mqbdt0da3ZTN3esS5+UmWqf0DLMDyaeCoXET82
         /kX4cdKgnMX9xSQML3uhQT8zmAF0odutxY+hSUzmcSFGewQTPD5vGOk+x1TUfT96MyX0
         SgaYsuiGwl4wncT2tAU86h2y3UF6j7uJT415uzCkCyu7V3AsYpyCnTWdIcVvaiq8DmxF
         uS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703445; x=1695308245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIPWd/mQM1gGtdYNlRah5nW+TfnslfR5ETeR77/EyyI=;
        b=laIy0j+NvfDFl479PoCpAW+zemgywnQkJRT92RAUOMrF/PbVE4lGIr1uM2SnkbeP1N
         ekRFYqm/EnJB55DgDW0cJVV7ejRWlqVGtNs7ndOUFhU9Jvorzrqfjz+STCIRWVPn2yko
         jeDXZZDoMNWUpeRxb8Q0JNlqF7WHQMu7Mor+42L88YVJkxaW1KjZL+dr8Tt9dPnkMHj4
         Ewwuo03cOmdVi0ayqqTcaT87B+o7VQCUgW6Jkq+aL0p0S4LyCSa8YuWuJuchGoRjAmNF
         hAuIgq7/F8WjyH6M8JbEXLRFNuKKrPzKuTcykx/PpNuji+dLTpDhtRSi9wdVC72eaWpc
         oDxw==
X-Gm-Message-State: AOJu0YxxVYpAKa+afXU8/Za8lHrhqFC+qoetVKsLnp4t1T1koh+uh/Oz
	186GY9H+Krj9LXRFsQlwDnaauT0a9bs=
X-Google-Smtp-Source: AGHT+IHZJLrYAX+ZwlZsM8IMNqzqVlG24nint87g5vBGG8RvnDK75EuJ6Iokrhga+g1C4PO9R/8oGA==
X-Received: by 2002:a2e:a1d0:0:b0:2bc:db5a:9546 with SMTP id c16-20020a2ea1d0000000b002bcdb5a9546mr4611238ljm.7.1694703445495;
        Thu, 14 Sep 2023 07:57:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 23/29] xen/asm-generic: introduce stub header domain.h
Date: Thu, 14 Sep 2023 17:56:44 +0300
Message-ID: <d6f4a476c21958894b658d31bae3c855f081e964.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/domain.h | 53 ++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 xen/include/asm-generic/domain.h

diff --git a/xen/include/asm-generic/domain.h b/xen/include/asm-generic/domain.h
new file mode 100644
index 0000000000..b2d244d121
--- /dev/null
+++ b/xen/include/asm-generic/domain.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DOMAIN_H__
+#define __ASM_GENERIC_DOMAIN_H__
+
+#include <xen/xmalloc.h>
+#include <public/hvm/params.h>
+
+struct hvm_domain
+{
+    uint64_t              params[HVM_NR_PARAMS];
+};
+
+#define is_domain_direct_mapped(d) ((void)(d), 0)
+
+struct arch_vcpu_io {
+};
+
+struct arch_vcpu {
+};
+
+struct arch_domain {
+    struct hvm_domain hvm;
+};
+
+#include <xen/sched.h>
+
+static inline struct vcpu_guest_context *alloc_vcpu_guest_context(void)
+{
+    return xmalloc(struct vcpu_guest_context);
+}
+
+static inline void free_vcpu_guest_context(struct vcpu_guest_context *vgc)
+{
+    xfree(vgc);
+}
+
+struct guest_memory_policy {};
+static inline void update_guest_memory_policy(struct vcpu *v,
+                                              struct guest_memory_policy *gmp)
+{}
+
+static inline void arch_vcpu_block(struct vcpu *v) {}
+
+#endif /* __ASM_GENERIC_DOMAIN_H__ */
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


