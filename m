Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3975677DEB0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584421.915158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnj-0002aE-Lv; Wed, 16 Aug 2023 10:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584421.915158; Wed, 16 Aug 2023 10:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnj-0002Xi-Cn; Wed, 16 Aug 2023 10:30:55 +0000
Received: by outflank-mailman (input) for mailman id 584421;
 Wed, 16 Aug 2023 10:30:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDeF-0003RA-3Z
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:21:07 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 952015ea-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:54 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe12820bffso57889045e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:54 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:53 -0700 (PDT)
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
X-Inumbo-ID: 952015ea-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181254; x=1692786054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWgznkgkDSshrAfNbytlr6AV1H8ztUkA/H/Hf0rQB3M=;
        b=LSPfHBYC6q/1n9/pJaDTOaUXTe+bqBrU3MNFwS3erS5DxSVY4qVhe8Gbp9U41b8BFe
         kISATESXoQxpqCTHDqol7IiLs73kghoLMwMwxfJ+n3/0uSr+/50sIOO40/ICWHpad4Kd
         bEuENkWODZNTaVZwIfCFtmJRx+98kxfQlz+QL3JmdWKsZaTV0VIOzlapS2qUppUD9mbX
         qEaj0ayuQXwmqx6SHbSL4uXZZXD1nSWxzGD9lISx5ep8yeARCoCMees6GPpu7bn74xka
         3kUPzkwr2WiWGcJt3gxq9gjLOBVVPAJ5q0e1xL7gDOMytW8vpRvqdRMFuoJc2r0oz03i
         eolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181254; x=1692786054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWgznkgkDSshrAfNbytlr6AV1H8ztUkA/H/Hf0rQB3M=;
        b=HMK1gyyR0FRltZVmzX/nU9ecvZ4XhWL12johaYCnpQy4DpYr2Vir4WG0OoAt/lQuE+
         G31KcT4F05enSMaKOM+LKahLBP0o/bAOKdWTvec9yQa0ilU0M4bnKWuL5Js9ODUB8pBp
         YiLtMulCZ1JQHYCwUOLixkoD4/OK1iHIkKMfO7Yk9uWYCg7JTypYBKR62WZ28CyBWDO2
         ccULl00m5j3nZIiG7u+gkJQ0YJdL2JNR+T39Fg/BK1s+IHAom1msxxDyPGxAjboDAylv
         pe5sKTIwx40ZpA+9DKCbYV7YJnG6sHkVCoGDUCFxoGj/ppx2rOLiASnrQbVAbuggH6BM
         nVYg==
X-Gm-Message-State: AOJu0YwyKXV6olGuWcqV7s24l9vj7aJ/X1WQPJnzrjL5hkiKWGaqUwkx
	IekHkKZcgYLDeWLHEGLf2xSZfdD0eIWmbB9S
X-Google-Smtp-Source: AGHT+IHfKBICqnt18KsAWotBgPULnHOZ7+IYwE4eAY/DTUER3Wf6rQjOa3JW/PJtPCA/8XGaeIrBbA==
X-Received: by 2002:a5d:43ca:0:b0:317:7330:bd82 with SMTP id v10-20020a5d43ca000000b003177330bd82mr1159786wrr.8.1692181253716;
        Wed, 16 Aug 2023 03:20:53 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 47/57] xen/riscv: add required things to asm/current.h
Date: Wed, 16 Aug 2023 13:20:00 +0300
Message-ID: <c70a50df2e7dda1081a2464f84c4671fe0e66bf0.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimal requied things to be able to build full Xen.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/current.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index d84f15dc50..d03d172f14 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -3,6 +3,21 @@
 #ifndef __ASM_CURRENT_H
 #define __ASM_CURRENT_H
 
+#include <xen/percpu.h>
+
+#ifndef __ASSEMBLY__
+
+struct vcpu;
+
+/* Which VCPU is "current" on this PCPU. */
+DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
+
+#define current            (this_cpu(curr_vcpu))
+#define set_current(vcpu)  do { current = (vcpu); } while (0)
+#define get_cpu_current(cpu)  (per_cpu(curr_vcpu, cpu))
+
+#define guest_cpu_user_regs() (0)
+
 #define switch_stack_and_jump(stack, fn) do {               \
     asm volatile (                                          \
             "mv sp, %0\n"                                   \
@@ -10,4 +25,6 @@
     unreachable();                                          \
 } while ( false )
 
+#endif /* __ASSEMBLY__ */
+
 #endif /* __ASM_CURRENT_H */
-- 
2.41.0


