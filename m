Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FA46F5C14
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 18:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529379.823726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFOl-00046f-3j; Wed, 03 May 2023 16:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529379.823726; Wed, 03 May 2023 16:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFOk-00044t-W0; Wed, 03 May 2023 16:32:10 +0000
Received: by outflank-mailman (input) for mailman id 529379;
 Wed, 03 May 2023 16:32:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1puFOj-0003pk-8I
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 16:32:09 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bc8b9ae-e9d0-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 18:32:08 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2a8dc00ade2so54559771fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 May 2023 09:32:08 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h20-20020a2e9ed4000000b002a634bfa224sm6074321ljk.40.2023.05.03.09.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 09:32:07 -0700 (PDT)
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
X-Inumbo-ID: 0bc8b9ae-e9d0-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683131528; x=1685723528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsfM97J5O+UpCSjMju/nOXYsGeOrD/W7nZOAovHNtiM=;
        b=W6+ogGuzG53c3UETfJpq0zks2Ni0FaBWiOO91I+UT4EJyiSF09+76TXD5JQmrocGMc
         DOUU6FJJ/GcfmvHwZunYG+5sVZ+CiwMOoxQAr6RIA7Gj24SF7kO103UHa+Ibwo3v1DsT
         +TA7Xxc9cjGjC2VbY4P/BCW0j19xEYdUU1kFe894TcyKutuVtv54B7rcH7q4PnkbMJnm
         27HaPgJIPAkunfK1kYIhD389Wz4IkQk3VXhQY4hifb08eAu81ccS7ReTGlwqozKP6ote
         7KiZeLYdJieEhZb8PrFyc9ooB6bt1PLmrFOYp5xILkPca3mtFC4H0hgwk9GuEv5zwV7F
         d+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683131528; x=1685723528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsfM97J5O+UpCSjMju/nOXYsGeOrD/W7nZOAovHNtiM=;
        b=ABQJ+WzFjLj61bJS+cD5ixJeI4/n5FKDrsTzo31eZmKbTMo7D38ZmvLcRnhycFuMnk
         +X7kuwTYBxAyz2pvYkYVVseFFa4HO4s6jWSlwx3fEjqrPeppwoH3l8a4xjwlCzM1tOzs
         P76Bpjuyzde2sdk7LIOxtRxowSSGZtvAa9grBGU6ARMkIo2dken3vS83rUa26ZvcblHw
         r6fmhEaAAH2OF46r6CLTF2sC+FjDFYQ6f9s5Z/ibdbLqyEGOF4ZU+NVjueHSZMChFunA
         0/Z2bAd7BziBAwdBID4koKSiLnZ3tf0jJoVd53+9czyDUfBBwVzogGdV4nlgfMifTJAC
         KoEw==
X-Gm-Message-State: AC+VfDwRb42PK1FDMSeAuu9YrJotZBzGCfBArE8ZxZIuS5NbLZIzXdnL
	/F9PPE/wV3xz3Ea5kKrT5+w4qPr8F9c=
X-Google-Smtp-Source: ACHHUZ503Xhj72fABoOXv+XvN3atFesd1TP1pzqMQS1XFTYQF0u1guxYyIZ7sV0gX6RP58M84Vi1ig==
X-Received: by 2002:a2e:920c:0:b0:2a1:ab4a:153d with SMTP id k12-20020a2e920c000000b002a1ab4a153dmr152012ljg.29.1683131527692;
        Wed, 03 May 2023 09:32:07 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 3/4] xen/riscv: setup initial pagetables
Date: Wed,  3 May 2023 19:32:00 +0300
Message-Id: <4880494180634e53332dcfde24cc03ed1fea1a86.1683131359.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1683131359.git.oleksii.kurochko@gmail.com>
References: <cover.1683131359.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch does two thing:
1. Setup initial pagetables.
2. Enable MMU which end up with code in
   cont_after_mmu_is_enabled()

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - Nothing changed. Only rebase
---
Changes in V5:
 - Nothing changed. Only rebase
---
Changes in V4:
 - Nothing changed. Only rebase
---
Changes in V3:
 - update the commit message that MMU is also enabled here
 - remove early_printk("All set up\n") as it was moved to
   cont_after_mmu_is_enabled() function after MMU is enabled.
---
Changes in V2:
 * Update the commit message
---
 xen/arch/riscv/setup.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 315804aa87..cf5dc5824e 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -21,7 +21,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     early_printk("Hello from C env\n");
 
-    early_printk("All set up\n");
+    setup_initial_pagetables();
+
+    enable_mmu();
+
     for ( ;; )
         asm volatile ("wfi");
 
-- 
2.40.1


