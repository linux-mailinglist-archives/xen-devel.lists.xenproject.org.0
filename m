Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4E977DEB2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584429.915170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnk-0002u0-Qr; Wed, 16 Aug 2023 10:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584429.915170; Wed, 16 Aug 2023 10:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnk-0002oe-IR; Wed, 16 Aug 2023 10:30:56 +0000
Received: by outflank-mailman (input) for mailman id 584429;
 Wed, 16 Aug 2023 10:30:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDe1-0003RA-1V
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:53 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f7869d4-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:45 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb724cso59495765e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:45 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:44 -0700 (PDT)
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
X-Inumbo-ID: 8f7869d4-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181244; x=1692786044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SQGhzw7Z54ve6BdWhYdtY9jpypc4ffZo2cW4GL4tQI=;
        b=k/oGzO07yQPqf6KSnwR4eYwj5isgM7TpBXewlc8GdLYHmIdJWlkmnXvp+oRYK4w6px
         LlI0nuv/Rm0Lj17o9+keXsw3NwZVJp8MoXKqO1+sMGmc4UtQpfVTPtshUlcvHNJ4l3kr
         nlkBki5IXwgXFBZOIPZ0L51+Spv5cBCLsCweVGJMjPLLbtl2xYpsML/mNWMSknvXMQbV
         uzVIEDOcpytHQJk8srkTzRTwwFQfhfXiUM22NdVH2bTwYzs5hdE9Z7c+HrtobLZAlyEu
         fuqIbJ0ShUxx3ZDW7slJVD2sJpqx4xuPfmmusI9ERsbksQWvQSsW+kgeTKD2SBmb1UmO
         qDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181244; x=1692786044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SQGhzw7Z54ve6BdWhYdtY9jpypc4ffZo2cW4GL4tQI=;
        b=As6iMRiYgvAFZZcz0Mkqn0AH2em2uvfZd3cU4ZT9Hc8kP8He3EXQfK8pXnaew3lFe1
         ps90I2TbzCq6mPjLefvfK7WyRYDraFo/ptfgo0d3ppaPApYkchn+mGp7G22FxS3CANIg
         A6jMwM4fBVC0cXaFOuboCvGjp9PDirc+SvZBuPzTqp5Pt/3/D4EwgkI48sbcXeU+gYdj
         H8BwkQo/v6RSOyEfvex4g2ImUz/h7rcMD8h8u9j54RtUUsm/Ym1fmEHGzTlDhiC287oz
         R5Hj8DnQ4UHXIfBPVM1tYxHc6I04iss0ho75muTK0+Gfrb1eZiyoI+NZCHacLRAmiDtj
         MD/g==
X-Gm-Message-State: AOJu0YzEcyu0ETVaEQQUn8DAKwgSP63Da+VPhhJcE360Rdu5awHrJMMQ
	lIvA5dTRNTsbsBGo7VUxi8bb8PpW6eEnp2Cj
X-Google-Smtp-Source: AGHT+IF2ANjzEb8TnVK90wqPqlMyVQ4yLFdAl8ZVGmxtSU4/oqzOtyZnXf9SdyUU5iTvDm5rO3GdCg==
X-Received: by 2002:adf:e745:0:b0:319:650f:60e2 with SMTP id c5-20020adfe745000000b00319650f60e2mr1032627wrn.11.1692181244319;
        Wed, 16 Aug 2023 03:20:44 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 36/57] xen/riscv: introduce asm/guest_access.h
Date: Wed, 16 Aug 2023 13:19:48 +0300
Message-ID: <d22756677e8ce55ebbf00641abafd4ed6297efbf.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/guest_access.h | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/guest_access.h

diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
new file mode 100644
index 0000000000..7be5c4509d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -0,0 +1,29 @@
+#ifndef __ASM_RISCV_GUEST_ACCESS_H__
+#define __ASM_RISCV_GUEST_ACCESS_H__
+
+#include <xen/mm.h>
+
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
+unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
+
+#define __raw_copy_to_guest raw_copy_to_guest
+#define __raw_copy_from_guest raw_copy_from_guest
+
+#define guest_handle_okay(hnd, nr) (1)
+#define guest_handle_subrange_okay(hnd, first, last) (1)
+
+struct domain;
+unsigned long copy_to_guest_phys(struct domain *d,
+                                 paddr_t gpa,
+                                 void *buf,
+                                 unsigned int len);
+
+#endif /* __ASM_RISCV_GUEST_ACCESS_H__ */
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


