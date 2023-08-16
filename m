Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F4177DE6D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584325.914936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdX-0004pk-Us; Wed, 16 Aug 2023 10:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584325.914936; Wed, 16 Aug 2023 10:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdX-0004lf-Np; Wed, 16 Aug 2023 10:20:23 +0000
Received: by outflank-mailman (input) for mailman id 584325;
 Wed, 16 Aug 2023 10:20:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdV-0003RA-HU
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:21 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80899475-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:20 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb727cso64582635e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:20 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:18 -0700 (PDT)
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
X-Inumbo-ID: 80899475-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181219; x=1692786019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HR6OIRhc5EhJVw5OZ829cmd3qnltfojYEhQK5nZTlyw=;
        b=cyhe7FnRv5KOh16WBBKXEtIVARtsHGYYpwOc/0zBP/z4TERbKLNNNXSA1I1x0VPiiS
         5dw1OCA67QWAL20IoY1jhOMHonDAyjHQ1OGfeuWrLaJEg327r7g11OIN17mmBJDhqweG
         GWHmSl5eb+gk/v9YNfh9sAiHKED+KAvTzI+Ke23oW83E0lr/zoXB+I3RA/EWkjy38iD8
         TCXWD3SOV4+secw6GThyzL8OlABhvR/37sRPEYuwi5ob/V8SdVSXD5uvTpGKbFUNbxID
         rJqn8HMkl3cHiHJg+uEeXN5U4oAOQl7jG2oXMBn3Hp76b8eeH+nnoFZidHAIcPN0jebF
         vxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181219; x=1692786019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HR6OIRhc5EhJVw5OZ829cmd3qnltfojYEhQK5nZTlyw=;
        b=f3Vm0pTbR60mnlqY38+FXyv+lvJh9GDgM0QO/HQYdbBiwE+y/VA77BDkWQ+/mSFxzg
         m7imZiMg1iIzluxiQFa5GX4+BbItVHHlp7cPwdsr4NyJaG0paMVtB1WJ3I3XkiPB6f0I
         gZGnWrGBXVk/+mFxN3ga3Q9oHTQQXPAs+oAqkokWmjCVwrlyz0nsCWGRm1SrhmkopwiK
         xYGr8Oz6iEVQyUcm9T98ZXkribMa16ISo5HANluitSPoi4Ilst6k89w2kI7D2M74VyNX
         9gHtUOVKKJLyCmywptJZuIOPajNmSlh/PmDW0223jDzE7HRKKfc7oa7Bc1ULjFYZddSQ
         zgGg==
X-Gm-Message-State: AOJu0YwTYoO5tHwOzLhn3KmH+BSJ8oqhwm2kfhOS/Ivxp1uJC4XNOyG4
	2h711+wEUgCitm3GoWYpDPx/P4/8cB1fw/Gc
X-Google-Smtp-Source: AGHT+IG6CvmyHqRfmhR/vvA8dlfLODgvtiEuLgjuLGB60jb2bSzer07bo7lzn0bWt+NsO1oCVYF4Hg==
X-Received: by 2002:adf:ce8b:0:b0:313:f61c:42ab with SMTP id r11-20020adfce8b000000b00313f61c42abmr1271693wrn.56.1692181219109;
        Wed, 16 Aug 2023 03:20:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 06/57] xen/riscv: introduce paging.h
Date: Wed, 16 Aug 2023 13:19:16 +0300
Message-ID: <e8b968da5adb53da684b9ca21246463d1925c9b1.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/paging.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/paging.h

diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
new file mode 100644
index 0000000000..73810e83d4
--- /dev/null
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -0,0 +1,7 @@
+#ifndef __ASM_RISCV_PAGING_H__
+#define __ASM_RISCV_PAGING_H__
+
+#define paging_mode_translate(d)              (1)
+#define paging_mode_external(d)               (1)
+
+#endif /* __ASM_RISCV_PAGING_H__ */
\ No newline at end of file
-- 
2.41.0


