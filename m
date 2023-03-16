Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854C76BD61F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:44:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510730.789005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqhw-0003Ta-Gg; Thu, 16 Mar 2023 16:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510730.789005; Thu, 16 Mar 2023 16:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqhw-0003OQ-CL; Thu, 16 Mar 2023 16:44:04 +0000
Received: by outflank-mailman (input) for mailman id 510730;
 Thu, 16 Mar 2023 16:44:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcqhu-0001vH-HW
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:44:02 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1b300ba-c419-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 17:44:02 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id cn21so10302913edb.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 09:44:02 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 hp12-20020a1709073e0c00b00925ce7c7705sm4019163ejc.162.2023.03.16.09.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:44:01 -0700 (PDT)
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
X-Inumbo-ID: c1b300ba-c419-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678985041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4/tFHZNGBdxbclZ8qo10HAKR6kKnO62EANVEk6h44Y=;
        b=giPsQ7nWjl2XNoWSMcelD7Y3F9lMkKnnb+gZXCJO47QX0EBBlEoEEetyumB/xieCpK
         NMaSOBXwUQ0Mc8H3yvMEiyWUNacX9vmd8yFjKx/KzThLV44b87ECwKspBZBiNu4qV+O/
         sG2y7lvbjkwOeu/SaBsfcTvfvJh97CEJLcFd6mqs09dI70eI2ya+MHNQEBgXhHc74YxA
         /ELmsHOm1eWQc5BBga3Lsz2nbaK8H0vRzQIfgSsk2w+/RCY9IKa0fxp2U79ea6T6RQR8
         ZJbGUPP68pB9o1PzJd/cu2GvBHbWiEZyHsAqTGcdjSAxGmrGTQ2zLOX/O1xJXQKE7sqp
         imVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678985041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4/tFHZNGBdxbclZ8qo10HAKR6kKnO62EANVEk6h44Y=;
        b=gVhyJYGXTzkLcn/vNxqhDH8qXS4wd58yIa5a/Kyc+RT68J3KggTzTlXQf1c6WjS9Gh
         Ie5TR3wSqve7QGlBV2/qUh8/MApAAjl5HO425qEnoLZyJd609ezEC5ZUIXrIdT6vthF9
         FPw0Bf2SEbTKiPoEQitWpPsQ0ffqCjqck0ihwaewyJ4OI0rSPRbwt7Br6ni+T2zMc0pb
         iIFssSMw9EP3fU5AnS/CcdzzJjMRuP+sFIzHbO+Ms/ZS2XpByubmy6ZKYSAPYkPQqXf2
         X8wojBnzoMRfz7gx02xgK1+Ffl4W3nQzdzknT6UC6BeemOQTwy0z2kwYDs2bacxoSCro
         40Xg==
X-Gm-Message-State: AO0yUKVLXEgfspUoUk6SORQjy+gQdudtfC/H0lUpnIKKTSQKKHioP1ad
	xSUIdOZREuLsd1X119ftNQCRL+w5OfwGzQ==
X-Google-Smtp-Source: AK7set+lD0nudxZcL42hdmyvMz7QDO3FxDw0R2K3M+iu27im2Xaff4akGg5ugZIKjmpAcLeGw42PZw==
X-Received: by 2002:a17:906:8a43:b0:8b2:5262:562c with SMTP id gx3-20020a1709068a4300b008b25262562cmr10824009ejc.34.1678985041296;
        Thu, 16 Mar 2023 09:44:01 -0700 (PDT)
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
Subject: [PATCH v2 2/3] xen/riscv: setup initial pagetables
Date: Thu, 16 Mar 2023 18:43:53 +0200
Message-Id: <a748d8cf94fbf4ffee3ca3acb553a9caad1f423c.1678984041.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678984041.git.oleksii.kurochko@gmail.com>
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 * Update the commit message
---
 xen/arch/riscv/setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index b56c69a3dc..a3481973ff 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -6,6 +6,7 @@
 #include <asm/boot-info.h>
 #include <asm/csr.h>
 #include <asm/early_printk.h>
+#include <asm/mm.h>
 #include <asm/traps.h>
 
 /* Xen stack for bringing up the first CPU. */
@@ -53,6 +54,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     test_macros_from_bug_h();
 
+    setup_initial_pagetables();
+
+    enable_mmu();
+
     early_printk("All set up\n");
 
     for ( ;; )
-- 
2.39.2


