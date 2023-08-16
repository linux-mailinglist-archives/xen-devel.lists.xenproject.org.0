Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881577DE75
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584324.914931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdX-0004lm-L9; Wed, 16 Aug 2023 10:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584324.914931; Wed, 16 Aug 2023 10:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdX-0004jj-AD; Wed, 16 Aug 2023 10:20:23 +0000
Received: by outflank-mailman (input) for mailman id 584324;
 Wed, 16 Aug 2023 10:20:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdV-0003R9-An
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:21 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 810ce2ca-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:20 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-307d20548adso5631468f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:20 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:19 -0700 (PDT)
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
X-Inumbo-ID: 810ce2ca-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181220; x=1692786020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bL3WYgMaZMxc8HxTRNu8OB5FSzMnAq4vyPbvWFHbIzM=;
        b=qe4G0IZGIZqvXBZFYoIScOAbTh8Ek65dcQDBTkwURNgOWOGjPlTHyZRXV15jh1bfCS
         u3dW9/9yX+13lrjNqLUpinIV4tgJuRr11ALs6/K/qHI4rJ1te5HSkwbmmoEKIIKEL1YA
         twv9MC+u+cald4ob7It/Be3fjWIv+nbVeDCBw6gVVdobuG41ZToVOsF1v2XrxtY0cYUq
         Uh6D3qlXyHW657SDeSPT9clo2Tl4Qv6Pmuu9/Q0qbgfMCQG9ZzV8wrKFYbEY7brBdR5x
         ZnewFs52/sST8sg0Q0EsVs2Sb8YOqZiTMYbVR5HZXtQcbbFg9cVoiEn+8VCxFMTktI3S
         9Xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181220; x=1692786020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bL3WYgMaZMxc8HxTRNu8OB5FSzMnAq4vyPbvWFHbIzM=;
        b=ToOanxA8NuL6gmkd+7yohmf1HAg1D21oV+c2xcj9PgOHNa70P3q6HjbYRLyjB2oJt6
         acVnB3kdrZobR+SMrS4TUrU2PtpcY5N1G3ZMcoReNoTD3DGPcczsG5ZJjp1CbsJJce54
         t9lkG0WCOsKUmFtBJSDO/GjQKWzS+OsvwtlpIKBvbvf+YxpMtehsBdErNe8PtD5hCuKk
         qIBnLmC5TGA2UAvUbE59DEuVw8PInJ6mV5gI36++fuzsevtfddqeO4UKT/tFGeiVz8SB
         dQ+SIpIhSVK7+7QCDB/GHdT2OMNTt67KvlSrtfqswzpzZmsjsau0EYiJGLeAHvEPNMmI
         bA/g==
X-Gm-Message-State: AOJu0YxndJ23N5UBPZx0E+KvsHUGzlKu4+t/R1y5B+ve+mLCxNuVCYeC
	Cb9oaoRYxP4b9A3pWB3cf+SKV9ydunO3xleO
X-Google-Smtp-Source: AGHT+IFQw+bAIQepx0MDYZvcSR3LA4cpJby1Ndik78K+tb6WAYOrLwL7jrM7+MoWxgvUWOATg0eh/A==
X-Received: by 2002:a05:6000:14b:b0:319:867e:97cb with SMTP id r11-20020a056000014b00b00319867e97cbmr1073490wrx.42.1692181219986;
        Wed, 16 Aug 2023 03:20:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 07/57] xen/riscv: introduce asm/cpufeature.h
Date: Wed, 16 Aug 2023 13:19:17 +0300
Message-ID: <eecb01b229bcc72e02eb9f8805aab4c20f27852c.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/cpufeature.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h

diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 0000000000..211827f816
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,22 @@
+#ifndef __ASM_RISCV_CPUFEATURE_H
+#define __ASM_RISCV_CPUFEATURE_H
+
+#ifndef __ASSEMBLY__
+
+static inline int cpu_nr_siblings(unsigned int cpu)
+{
+    return 1;
+}
+
+#endif /* __ASSEMBLY__ */
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
+
-- 
2.41.0


