Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BD47A081C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602361.938951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmQ-0004bd-OE; Thu, 14 Sep 2023 14:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602361.938951; Thu, 14 Sep 2023 14:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmQ-0004Qh-3t; Thu, 14 Sep 2023 14:57:18 +0000
Received: by outflank-mailman (input) for mailman id 602361;
 Thu, 14 Sep 2023 14:57:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmN-0002W4-KH
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:15 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdff76fd-530e-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:15 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-501b9f27eb2so2682321e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:15 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:14 -0700 (PDT)
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
X-Inumbo-ID: fdff76fd-530e-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703434; x=1695308234; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcqiE7BQiD0mwY/JfAVivf/SF/vqIglLM0lEIM6lctY=;
        b=OAAi8FqEBOBX5CJI/69S4+aL+iKmYYGQM8u7Y1dfKAxRkbsjwQdA14PxVNDpV2lNdX
         s1q3fQYg0cM//ezwvAg0JZ6e4TShz51YF1FW5BH3LJK0t28MCnNtVk6kA5FEOLQjvOgS
         H4aT2F1kSq4ryjej4ASG6KrJ0vD4UtQld2RysxIG7WJ0gPrat5ZBJxecWU5LqVnN12m2
         jVavWmvJV6DbHCNBaYBFxRVWRqW7E0POEt12o/C0qZu1dT0qZ5L/dHdq+qBpDH8iHndH
         hLU0/2WnLQId+TSvDbBBnNyHt+gWLKuxFW5K1lxxjg0v+zyLjNjNXRvkrAjaXaKnW/ZK
         q5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703434; x=1695308234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcqiE7BQiD0mwY/JfAVivf/SF/vqIglLM0lEIM6lctY=;
        b=w8VSm7MQNj1QKQ8Otx64FGrREiCLvlwJ9Qt6g7VYrIIfxXWZxL7qioqPpR15VbApTg
         /Rkkm5V1bSjeE/mvSE/DhFzUMQ+eK8Z5fNNwR5NnGCgly8sZwJZ5KvRl5qW4DqVGr6uN
         bn56l/w/A7co1r6AUvikF40uRUfZCMs/PpnyaASpkriU7QO7/5P1OoCXPC5EU/kbG6Gk
         rLorKwCjxqrsE3/22HS1UWS9Hg/56jLeo5alV0W2wTPd/I98MIBbvFFmsRzHnH/Ro5CW
         XCyt076+nADA0gDZ6YDbjuC6jldBUnPdmlYlJrSLK10z8JkY9BnVWYq7EXXQFHWJUdV9
         HbPw==
X-Gm-Message-State: AOJu0YxdeMljQa8IXaRAsuk0G9D2U/umWhygdUAQzDkhZZFVrmRI9UQm
	IOsdgwT2TVR23aDO0JE4RlPLmA1asKc=
X-Google-Smtp-Source: AGHT+IFaiW0NQmH71YpP+316A+ougjlhV+18iywnNP4KrA2JUtc8IpKB6myxYW+M7DNi7WajL0xo6w==
X-Received: by 2002:a05:6512:a94:b0:500:b09f:eb3d with SMTP id m20-20020a0565120a9400b00500b09feb3dmr894717lfu.30.1694703434471;
        Thu, 14 Sep 2023 07:57:14 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 09/29] xen/asm-generic: introduce stub header iocap.h
Date: Thu, 14 Sep 2023 17:56:30 +0300
Message-ID: <df3a94a5670b900ddc1a2b7e8142555a09571b52.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/iocap.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 xen/include/asm-generic/iocap.h

diff --git a/xen/include/asm-generic/iocap.h b/xen/include/asm-generic/iocap.h
new file mode 100644
index 0000000000..dd7cb45488
--- /dev/null
+++ b/xen/include/asm-generic/iocap.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_IOCAP_H__
+#define __ASM_GENERIC_IOCAP_H__
+
+#define cache_flush_permitted(d)                        \
+    (!rangeset_is_empty((d)->iomem_caps))
+
+#endif /* __ASM_GENERIC_IOCAP_H__ */
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
2.41.0


