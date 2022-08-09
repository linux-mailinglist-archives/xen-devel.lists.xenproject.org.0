Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC81C58D68F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 11:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382862.617911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLLZm-0006X9-P1; Tue, 09 Aug 2022 09:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382862.617911; Tue, 09 Aug 2022 09:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLLZm-0006Uh-LM; Tue, 09 Aug 2022 09:31:02 +0000
Received: by outflank-mailman (input) for mailman id 382862;
 Tue, 09 Aug 2022 09:31:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeFk=YN=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oLLZl-0006UY-Cg
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 09:31:01 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9b4b0d3-17c5-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 11:31:00 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id z2so14402955edc.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Aug 2022 02:30:58 -0700 (PDT)
Received: from uni.. ([2a02:587:ac16:4a00:ffbe:91df:428c:5448])
 by smtp.googlemail.com with ESMTPSA id
 14-20020a170906328e00b007308fab3eb7sm890025ejw.195.2022.08.09.02.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 02:30:57 -0700 (PDT)
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
X-Inumbo-ID: f9b4b0d3-17c5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=GKf425hQpe0PuKB2CboK1V+rcOcRfhoh8GDez6kIN+s=;
        b=Uazp/VRgepPhK3ZjanepFrhaJzeQlZt9m6RQZqr2/r1soHMFRiJcGnoDOGJEixZTIG
         YQateJa7SnyEicp60liI4cdH19a5sTnn0NHBMzjPuTPqQW20k6SEQUKQMhW74U038kHz
         86NVMEHSWZ9E05cD8S9j72TovMt/HnKprLbSf3rrY3KzRtom1kHw/2fgCZvh9DVbmq+J
         v5ZtMcq8DTQaQWmWIqktRgyWpdQttQGgwuhtKDYC82IrXciKKrcOszVLr+XUDTWBJDdn
         caTco++3oGs41wL9JRaCB0T9ZIzE5yif6bnxzVhT4mDYjGydCrRjfhktPabvPpjLjQsw
         +Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=GKf425hQpe0PuKB2CboK1V+rcOcRfhoh8GDez6kIN+s=;
        b=WlXC/b9WlUKabf2OkFv5RUbgTiQdLafIz8CvAa/PSkZZQO+0yJrrbCQz1lLZxw1bBJ
         xOZTlpJ2+K9MjDa9WrfniDrNICLw3UHSceB0kjhKR13gAxG1og8pswaKniP5DglDsO7D
         kiZ8R4secmFW6v6b/BWCJO8wpPU8lZzWfKvNvJfrH/7Tqe12QJ7oNcIfGLmyjn19jaEp
         KEQZjSJGgK4oFgRUExSm4qoQi1lIJezuPWQfo9xavT6szrEvA3hZy3Kr6CFZKWj90c3Q
         wuVj+bWdJ7WLoVX4oQe/G6eKOE110czJpyGZ/O60zoGsNXuBYdArbgqpxVII7cyr5i0L
         NiOQ==
X-Gm-Message-State: ACgBeo027pRLPWnk5XWW+LpLIAZ+6yrXlE0mnuEnvOcrNsmsMNFII72q
	k2tq2+tYHO9AaMlrVKHJkuW972FijiI=
X-Google-Smtp-Source: AA6agR4PcxieVKljj2LSYZb9hvlkouYZasC20AZdREBl+9zuPeFIijZ0BNfExWGz4VGgqziGGeMI6w==
X-Received: by 2002:a05:6402:50c9:b0:43e:42b0:f84a with SMTP id h9-20020a05640250c900b0043e42b0f84amr20758381edb.72.1660037457829;
        Tue, 09 Aug 2022 02:30:57 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: vreg: Fix MISRA C 2012 Rule 20.7 violation
Date: Tue,  9 Aug 2022 12:30:48 +0300
Message-Id: <20220809093048.1893025-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In VREG_REG_HELPERS(), the macro parameter 'offmask' is used as expression and
therefore it is good to be enclosed in parentheses to prevent against
unintended expansions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/include/asm/vreg.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
index fa2f4cdb17..f26a70d024 100644
--- a/xen/arch/arm/include/asm/vreg.h
+++ b/xen/arch/arm/include/asm/vreg.h
@@ -141,7 +141,7 @@ static inline void vreg_reg_clearbits(unsigned long *reg, register_t bits,
 static inline register_t vreg_reg##sz##_extract(uint##sz##_t reg,       \
                                                 const mmio_info_t *info)\
 {                                                                       \
-    return vreg_reg_extract(reg, info->gpa & offmask,                   \
+    return vreg_reg_extract(reg, info->gpa & (offmask),                 \
                             info->dabt.size);                           \
 }                                                                       \
                                                                         \
@@ -151,7 +151,7 @@ static inline void vreg_reg##sz##_update(uint##sz##_t *reg,             \
 {                                                                       \
     unsigned long tmp = *reg;                                           \
                                                                         \
-    vreg_reg_update(&tmp, val, info->gpa & offmask,                     \
+    vreg_reg_update(&tmp, val, info->gpa & (offmask),                   \
                     info->dabt.size);                                   \
                                                                         \
     *reg = tmp;                                                         \
@@ -163,7 +163,7 @@ static inline void vreg_reg##sz##_setbits(uint##sz##_t *reg,            \
 {                                                                       \
     unsigned long tmp = *reg;                                           \
                                                                         \
-    vreg_reg_setbits(&tmp, bits, info->gpa & offmask,                   \
+    vreg_reg_setbits(&tmp, bits, info->gpa & (offmask),                 \
                      info->dabt.size);                                  \
                                                                         \
     *reg = tmp;                                                         \
@@ -175,7 +175,7 @@ static inline void vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
 {                                                                       \
     unsigned long tmp = *reg;                                           \
                                                                         \
-    vreg_reg_clearbits(&tmp, bits, info->gpa & offmask,                 \
+    vreg_reg_clearbits(&tmp, bits, info->gpa & (offmask),               \
                        info->dabt.size);                                \
                                                                         \
     *reg = tmp;                                                         \
-- 
2.34.1


