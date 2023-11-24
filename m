Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849DF7F71A8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640428.998656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tb4-0005QZ-Qq; Fri, 24 Nov 2023 10:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640428.998656; Fri, 24 Nov 2023 10:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tb4-0005Np-NR; Fri, 24 Nov 2023 10:39:42 +0000
Received: by outflank-mailman (input) for mailman id 640428;
 Fri, 24 Nov 2023 10:39:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTC-0006hy-6I
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:34 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a36b0e0d-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:33 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a02ba1f500fso254069466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:33 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:32 -0800 (PST)
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
X-Inumbo-ID: a36b0e0d-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821892; x=1701426692; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYGdUaxClo88qkYZTfmXx6C4vZjKDWY65LgrL6BSEIQ=;
        b=WZzlNpXhZhW1vyY5IQnIw6vpSW49m24E9pJ+u3K9nOwTO1Vg8CpliYnZ4gLkCteCNt
         lzOK9owJw8B6TwkIEGuNtQKQHQU68nZ8/WHXpUlhpgDAKmt9+Q0hs37ptddQWTJ9ODgG
         nTMkqrj0hlltKV4b5WBvXXzGEowSPh02WMBCqnVTIvIetow4JwVgTrsRFUlaE2aJZ+CG
         2pMTYerwRtOVKrLrsYwVbdcBJB2Zn9bpLW2WuGXymDYaMCw0JgBgq609MX9/FkHn9hhj
         bO5qrmBTI+9EiFDJsw8wnRhVtpHFeIUMZwkJ0y1EOCpyzBQmwwo7oKOxBVcLbJFKUQdh
         5cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821892; x=1701426692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYGdUaxClo88qkYZTfmXx6C4vZjKDWY65LgrL6BSEIQ=;
        b=Xs541Xbk+3oSC/rMPtednsDppY+p69nm4kDDcrUJD3iml74Y/rgkuT/lTm/2HhY8+y
         0EQ9JIZD+lUfXjkIRIP8GCsror851IVQXL8bB1gYC2iNe3IKqtZacW26mPUwTasKgUEr
         HN76Mjz6cyXUh2yKhLuuWKBaMufUFZ2G4d9rPfn5QRm5n5OYZmvTJMy5R7eT/kMZfeVx
         r9jJEhP7Jh9NPW3VwLNo6IqakPA6CVRNyLv8Gj9FJOWYZrQtcXNCPS1e1IPjBPiNNjCc
         CYLKcinjwyqcSMtdQ4qlUhj5YJnxadUHwA8rD7VteIs0kEYvQfwdRHcTsNpJ7u8KY+kp
         ZnOQ==
X-Gm-Message-State: AOJu0Yy+7NE5s/izOE+Z3YW5luBrv+zrVGT/27OGrXYlvgS7GyWgBuA6
	1LvZ4biEIR4cXermFarY33JaW2wfoKUVcA==
X-Google-Smtp-Source: AGHT+IGP6o+c3A/KNH1KEDT1+8QFRWy/ZU+PHOe8CjqgHxjk0FKV5rFaOf7mLnoO23Pr1C8gUjlKzw==
X-Received: by 2002:a17:906:856:b0:a00:2de3:73cc with SMTP id f22-20020a170906085600b00a002de373ccmr1316095ejd.69.1700821892494;
        Fri, 24 Nov 2023 02:31:32 -0800 (PST)
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
Subject: [PATCH v2 22/39] xen/riscv: introduce asm/domain.h
Date: Fri, 24 Nov 2023 12:30:42 +0200
Message-ID: <25fa93f2195ff1b87d7c7c28e6aa6eb654faca7b.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/domain.h | 43 +++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/domain.h

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
new file mode 100644
index 0000000000..f2dccf370f
--- /dev/null
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -0,0 +1,43 @@
+#ifndef __ASM_RISCV_DOMAIN_H__
+#define __ASM_RISCV_DOMAIN_H__
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
+#endif /* __ASM_RISCV_DOMAIN_H__ */
-- 
2.42.0


