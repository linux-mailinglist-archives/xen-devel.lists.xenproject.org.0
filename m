Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B6477DE6E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584327.914959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDda-0005Vt-7T; Wed, 16 Aug 2023 10:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584327.914959; Wed, 16 Aug 2023 10:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdZ-0005Pn-RE; Wed, 16 Aug 2023 10:20:25 +0000
Received: by outflank-mailman (input) for mailman id 584327;
 Wed, 16 Aug 2023 10:20:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdX-0003R9-BC
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:23 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 820176df-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:22 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3178dd81ac4so5365687f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:22 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:21 -0700 (PDT)
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
X-Inumbo-ID: 820176df-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181221; x=1692786021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOPCWOlsk//5NsNFMfUngW+bgS4vz6tmAAZqXsi40Z4=;
        b=PKVNMQkkTOpV3l9tkJj3H0QSlHMNSLndMXoNE+7vmmxVcp6e/UGlXZOMM7gU1tlRbd
         ty6W9OE0Ir4ELK+88L22Hhyu28Scx4+H19szE5i051RW5eyYtg/cGXEninyYml+iGfIv
         91Im2xVr4umnHywgh4XeqgnoZvX/j+n3Dn//Us/iJ5A8BgMQyisWYqlmIPR8GgvuibZl
         VFTXA84Bqicxza05fVyS+YwWX86E2Ddipq0lHchbosBlUi6/ec6zdMQOp+o0eFqy9JNe
         herM5t3+YgD/noSiI5YGN24D9rXl2DFHqIMuF62ATH02eT+Jd3tSrypz08bPkEbvyk5W
         U8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181221; x=1692786021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOPCWOlsk//5NsNFMfUngW+bgS4vz6tmAAZqXsi40Z4=;
        b=AqyHPW8CGjo5iLDWZRirr67842IFdOiSQyoiJwYB6baeGM7OqLWtVEHCoOWoYqCFRH
         f30YUWQS+XPD23N4fsHoquCJgTIqBlrB3NF2Zw/X6PaVmmU4Y6AaYdrYLK6GH64xG4VO
         AFeiplE1JkIKyveGoXNwsmXUifmZcTZtF1EedMh/iT+k57T47gQzrIFMBcVMHBpgACZ4
         +nMnsDAT9ALtunlReYjZeoywmj6Q6Tl6QsxQLjBeISVcukMJ1zlwUX7cbLErSI3Z7U8B
         wE41Cs5k/+pv7rWYNMxyBT0fv0R2Ck5HB2SJTjjFlaiGp+2zCNZlH46dyuBHb0mupVra
         Ke1w==
X-Gm-Message-State: AOJu0YyomBR2bf7su7HVVHlhIZLa7yo8cdG0QUHZtFUWJ5sBGfyHRMos
	UJ7Z3c9lAdTP8JbyqoRc8gLqKcWTAViQwQSU
X-Google-Smtp-Source: AGHT+IH5f/2j8GEK6/A/WLEbAIIE4G86ByRyu5uqM7K5dHyYqSMKIE8ExZ8lXUxhe0bfM3IA20iyyg==
X-Received: by 2002:a05:6000:1801:b0:314:2f5b:2ce with SMTP id m1-20020a056000180100b003142f5b02cemr1075008wrh.12.1692181221599;
        Wed, 16 Aug 2023 03:20:21 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 09/57] xen/riscv: introduce asm/event.h
Date: Wed, 16 Aug 2023 13:19:19 +0300
Message-ID: <8589c3816ae402d0770d2043c58065617aa73e7c.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/event.h | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/event.h

diff --git a/xen/arch/riscv/include/asm/event.h b/xen/arch/riscv/include/asm/event.h
new file mode 100644
index 0000000000..48630c77b3
--- /dev/null
+++ b/xen/arch/riscv/include/asm/event.h
@@ -0,0 +1,34 @@
+#ifndef __ASM_RISCV_EVENT_H__
+#define __ASM_RISCV_EVENT_H__
+
+void vcpu_mark_events_pending(struct vcpu *v);
+
+static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
+{
+    return 0;
+}
+
+static inline int local_events_need_delivery(void)
+{
+    return 0;
+}
+
+static inline void local_event_delivery_enable(void)
+{
+}
+
+/* No arch specific virq definition now. Default to global. */
+static inline bool arch_virq_is_global(unsigned int virq)
+{
+    return true;
+}
+
+#endif
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


