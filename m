Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0721777DE72
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584318.914876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdS-0003Tx-H8; Wed, 16 Aug 2023 10:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584318.914876; Wed, 16 Aug 2023 10:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdS-0003RL-EC; Wed, 16 Aug 2023 10:20:18 +0000
Received: by outflank-mailman (input) for mailman id 584318;
 Wed, 16 Aug 2023 10:20:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdR-0003R9-Av
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:17 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e27f481-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:16 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe4ad22e36so59441705e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:15 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:14 -0700 (PDT)
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
X-Inumbo-ID: 7e27f481-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181215; x=1692786015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNlUMCXZM8wTGBwDcTnzqCZP1USsnbTigMBS5QryLYg=;
        b=UaOfgeDVVCcHDO/Fbj4JlNrbwEsdEHx/qD1+6YghyDMqErv1gCUoX1bf3bp+V1DZHy
         WjnN25fTa3e1bEOA3+Qy7f5gEiMgswka58geOJnFCXO5rQqrwXXOrWpoPQLpxUuHVlSZ
         Snxe/AZcPC6TlOe9n+1Ii/4FRA3PRDyRw32riGRX2ZnkwZlRaQoiTb22XtmSYBbIV+8/
         LEXDsDcbTyfWZb/o5kVoCqwIitrUjFJLLwfORFHqYCGl4aY3S7+dOLghMKeXgotdNktU
         5yJcyR1DxTi7BJ4/eZfZR1GLbyTeNJrYKZLmfvtE7CbGVJe/vdfs71aU9+cP6XX4mtCx
         kj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181215; x=1692786015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNlUMCXZM8wTGBwDcTnzqCZP1USsnbTigMBS5QryLYg=;
        b=DEMXbb8D3NzO11eo35FzEsFXCXkW8tRluqbn9fOsG3pZsKjcGbvSW0Lsrvd7Gp6SWt
         jVwjn/t7gvkAuh1Teg8qJef2H53RcPzw3TtPs+vcUPDx2b7twFGl4jAMc0PZB7gTwkks
         G4BshjMW3YIic7VV45JvdY0usHxYeyUiccKWCrRkNW8mIDRv8QjBSVSCAtF9N5JzPrmu
         +sOzAVeRsX2VI9LnruHNLp3pyqBSt55whzgE0DWVpkD0VFh6D4PmYik8gfa+hWDHmS+3
         zgoZ2lx1nMVXL7bf5M8Jbz6HtSZXY7SeBLRV2NCAvm5KDK6QGR0gH1d0bVHQLZoxavkj
         cfVQ==
X-Gm-Message-State: AOJu0YzNvSt84aZDHRfSOx/pV2q1h2skNdaNnhWwAwgWcciGPHLYxOWJ
	q5Pw/2APu0uHhXJZKC2G3FjOufasD7vfRXGS
X-Google-Smtp-Source: AGHT+IGbWxAWynQJC1Q4f3JCBiOM0CoXQgf3J/Hz3numhj0Zto9ZEjPXoU+Cnxy5z6jJZMVxb0m3vw==
X-Received: by 2002:a5d:61cb:0:b0:314:39d0:26f6 with SMTP id q11-20020a5d61cb000000b0031439d026f6mr1194118wrv.18.1692181215008;
        Wed, 16 Aug 2023 03:20:15 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 01/57] xen/riscv:introduce asm/byteorder.h
Date: Wed, 16 Aug 2023 13:19:11 +0300
Message-ID: <026edfc051aafb87ed23d68cf757f9513ad78d91.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/byteorder.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/byteorder.h

diff --git a/xen/arch/riscv/include/asm/byteorder.h b/xen/arch/riscv/include/asm/byteorder.h
new file mode 100644
index 0000000000..320a03c88f
--- /dev/null
+++ b/xen/arch/riscv/include/asm/byteorder.h
@@ -0,0 +1,16 @@
+#ifndef __ASM_RISCV_BYTEORDER_H__
+#define __ASM_RISCV_BYTEORDER_H__
+
+#define __BYTEORDER_HAS_U64__
+
+#include <xen/byteorder/little_endian.h>
+
+#endif /* __ASM_RISCV_BYTEORDER_H__ */
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


