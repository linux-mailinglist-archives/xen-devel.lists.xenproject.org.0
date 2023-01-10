Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298FB664463
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 16:18:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474743.736069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGO9-0005Z6-KM; Tue, 10 Jan 2023 15:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474743.736069; Tue, 10 Jan 2023 15:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGO9-0005Qw-E2; Tue, 10 Jan 2023 15:18:09 +0000
Received: by outflank-mailman (input) for mailman id 474743;
 Tue, 10 Jan 2023 15:18:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pFGO8-0005Fu-CU
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 15:18:08 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fba76ff9-90f9-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 16:18:06 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id m6so18937020lfj.11
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 07:18:06 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 y19-20020a0565123f1300b00498fc3d4cfdsm2203396lfa.189.2023.01.10.07.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 07:18:05 -0800 (PST)
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
X-Inumbo-ID: fba76ff9-90f9-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDdmAaTmfRPA7/hoydJZPcOqFW6WO2Afa2sA0FosFio=;
        b=NEM8j9tyoYg5poO13W2TCJj3Us3bcZztoSFaeK51xO9v2vjzt/4x/SAKmRlJDzpp6J
         wD7Ws/2wnbVb8EYWs1Hn1RE9SPTb/mKzgWwvtZs814huxoBRsBgBvQsrrjxYUAXfzb4t
         o028CXIN+4Ofa4UM8B6PhJFmnIme18puLhWbYEmOMHbR97mTwtrmkBRIczssJEFhRO2s
         0QqzKSA+1r+qYq0W16LsB8Ou0hJ7lkXdjb9dYGdV9QBc319Uzz7TglhmqKn5z8gpc/t1
         FQKkFXRiRlWxpcCurzLJxbIkeUxR15z9QtlmUCA1lRKihUMUBoVkGSPyWBhO/oMZWJPw
         itXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDdmAaTmfRPA7/hoydJZPcOqFW6WO2Afa2sA0FosFio=;
        b=bNUBWrFyWg1L0KawxXVYPn8CPmT6v89FiA1Q+1sqgIiuiAt3L7HMhbt+jKJdi4Sn86
         YqXRWiWKaFKtJZMXX1P860x+bufJfwq1B/NbtK6knXsOmjhPeIGjYQhq7RXLSsygQIEp
         b9ypry9Mc9qD1aDS8oRiaCGwsfzR5oH5JvaKCVG2xmjSdPeJQO82c0rVNN6l8kyz0DB5
         kFCFLfN78JoZPCSikzyQKn4kfXdzzAoq8noCZe48mHYX0dUDwJS6rKOPzJTmGSvuMFZ3
         4jV6euxS900YAQXDjEOIXJYLITbaaWUDi/OefFvWrz+CemExP1xfiozBqDRPwxPpSmHt
         1qYQ==
X-Gm-Message-State: AFqh2kq7p4NqOS7OPN62x3U7V3r3ob3j6ELD/lC5Irz1iZuTFJIztu6m
	Mkk71k9451NlZtlWHvOX4h33pwhv5mb6wj6T
X-Google-Smtp-Source: AMrXdXvWG7xcUGOUpgh3YFTt+CPFUf7TwcKA+mL7/QGv6LAVJKwcJ5XHoU93PSXd60PvcRq90rS7Bw==
X-Received: by 2002:ac2:5dce:0:b0:4b5:b988:b409 with SMTP id x14-20020ac25dce000000b004b5b988b409mr18504737lfq.21.1673363885739;
        Tue, 10 Jan 2023 07:18:05 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 2/6] xen/riscv: introduce asm/types.h header file
Date: Tue, 10 Jan 2023 17:17:55 +0200
Message-Id: <ca2674739cfa71cae0bf084a7b471ad4518026d3.1673362493.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673362493.git.oleksii.kurochko@gmail.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
    - Nothing changed
---
Changes in V2:
    - Remove unneeded now types from <asm/types.h>
---
 xen/arch/riscv/include/asm/types.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/types.h

diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
new file mode 100644
index 0000000000..fbe352ef20
--- /dev/null
+++ b/xen/arch/riscv/include/asm/types.h
@@ -0,0 +1,22 @@
+#ifndef __RISCV_TYPES_H__
+#define __RISCV_TYPES_H__
+
+#ifndef __ASSEMBLY__
+
+#if defined(__SIZE_TYPE__)
+typedef __SIZE_TYPE__ size_t;
+#else
+typedef unsigned long size_t;
+#endif
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __RISCV_TYPES_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.38.1


