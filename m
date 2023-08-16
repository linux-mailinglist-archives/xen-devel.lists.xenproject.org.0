Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9AD77DEA8
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584376.915067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDmz-0006g4-NR; Wed, 16 Aug 2023 10:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584376.915067; Wed, 16 Aug 2023 10:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDmz-0006dY-KF; Wed, 16 Aug 2023 10:30:09 +0000
Received: by outflank-mailman (input) for mailman id 584376;
 Wed, 16 Aug 2023 10:30:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDe0-0003RA-1Q
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:52 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f0b964a-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:44 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31977ace1c8so2581488f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:44 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:43 -0700 (PDT)
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
X-Inumbo-ID: 8f0b964a-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181243; x=1692786043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qabthrf3WuIFhKG0aPx+f/gl7fkW41S3cfH+4WOWAo=;
        b=o9prk/8bIkhqAjR8Sc2hhLFOUp4vssSSvpzG8j2XHj4dAehdtxhCV+jVJL8WwwvQU1
         OImpm8Ec7ICTf7x2wU9VHczSa0RBGsLmiHQLsBGgjD62IkuMR24Qgl53Jw91JsZAFA3R
         R23qW0jWH3rjtSHli/wVbpyxX664/hupW4lm4mLDpJ9Gz5ciMmloYM/eOzNJLoqUd5hx
         AZSCtkCwmeNoom+KhE86yTgFiZfAKMGYhHwfQHx2SJdp1R23BDQKl4ttEdtPai5tgGCO
         iPUFqAHRXmXziRbklZbxwOnushJ8YrnW2IKVTZvBHQkksy/Wafl7zOUSCLZijU1A4SNI
         0LXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181243; x=1692786043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qabthrf3WuIFhKG0aPx+f/gl7fkW41S3cfH+4WOWAo=;
        b=k2xSmeZyK6mQf3DUblQk+XcMpP5eFzETJC1wT0bnPXC6mibuFlQTYmqOJ8RtkWe2qi
         l13XhXWM81X3dqrm0PuSwK1WQqF5YnjsIq/wWL6YG6nS8bSifutsJSg8gVm/15nFP0o1
         adMntK2w6YqE3HBjlXYLf68UZbvvqdDHDcDb5KswGjIxPY623umWAQ9oxlrwQymucEMd
         RqiQF7ajZOkBk6VrKWfaW1EHCaY8byiwcSGLX2hVgBvK8kTk0rBj0iE2G6QyUtlz/GBi
         hWt70j5JhpGK1xC76VIkAkK1Oc6z4vj79CM3Zss8UDVlqKelqA9Lj53y8pCoYMxpOCu3
         LtSA==
X-Gm-Message-State: AOJu0Yzq6LhD6DDL8R7GE85oFKTwny82ryG3xsrt1k9wP9BNXc5urz0s
	AZXQeRogYAUonw/OAUBmbHXimui4B4Qc83S6
X-Google-Smtp-Source: AGHT+IG/P0EQNkrXaE3fVLPqB+wQhZBB6/ClOFaMSvF0M3DhkohnxG/nvZZpwwwjzvQVQWoWbQMLhw==
X-Received: by 2002:a5d:664f:0:b0:317:1b08:b317 with SMTP id f15-20020a5d664f000000b003171b08b317mr1057011wrw.6.1692181243592;
        Wed, 16 Aug 2023 03:20:43 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 35/57] xen/riscv: introduce asm/domain.h
Date: Wed, 16 Aug 2023 13:19:47 +0300
Message-ID: <a7c6142549c7bf004e87cccfdf12b8d703a0b812.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/domain.h | 43 +++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/domain.h

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
new file mode 100644
index 0000000000..680c357d4d
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
\ No newline at end of file
-- 
2.41.0


