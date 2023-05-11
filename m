Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C006FF821
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 19:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533495.830259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px9nU-0003DF-6t; Thu, 11 May 2023 17:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533495.830259; Thu, 11 May 2023 17:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px9nU-00037l-2G; Thu, 11 May 2023 17:09:44 +0000
Received: by outflank-mailman (input) for mailman id 533495;
 Thu, 11 May 2023 17:09:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPy6=BA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1px9nS-0002Li-9Y
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 17:09:42 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dea8256-f01e-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 19:09:40 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f139de8cefso47444669e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 10:09:40 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 c9-20020a05651c014900b002aa3cff0529sm2443830ljd.74.2023.05.11.10.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 10:09:40 -0700 (PDT)
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
X-Inumbo-ID: 9dea8256-f01e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683824980; x=1686416980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UWycGli8sXbmjgB8uls+zGw7KkS5qUAPDnnmK+Uofw=;
        b=CFr0ljiWtQtZURNRmK+W0rNds1/uOMmxJC64s61zAMi4+24iYrCn4FBZr99w2rtNIk
         o8ufeYa4NDlXjF6jI0M6HxG8/AbLuv9RIo9quOjL+KaUQ7yMr3pqxoKbMgqu+uHJXevF
         E7JvsyetWYBiqvXzgmtX+OwL/4uekO/CO8421ruyQ7kOmZ3JacNaoPxm6U37bOHvnKDQ
         jPsq0uj+PxYf8+89xWHDtPoEM2mkbvK2rIvXgYC/sWYrqNBjnYf34Kv41wGBeroFbYOO
         LTwU+0OAXvPhCyXanDAK82CqYNUHuRVYStm9GB8Q/yWUEvxUbRCzvp3jFKdbnR0ZGAs+
         R2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683824980; x=1686416980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UWycGli8sXbmjgB8uls+zGw7KkS5qUAPDnnmK+Uofw=;
        b=iwhNNct8dT9J5yOTjK63g1JDw7h59uhZrM8pi/nheSkCfsv38tSX0qx4v9OJz7kzI6
         3edu+GZ6xyfIsdnj2/FyCeCK36jGc2dQPL9gmrZTvKCHkHJiM9osuv5XBvgqgyBEfaMn
         kl3iENRngm/UAWmQ83X+o1G7U2UztmG1W8jUkNKMoJ0UNo+9m+Jli6jYmElaVVjA9hB6
         Yr/kdyUIDVgHWojlt1AXGlfJc6z+eS1JT3+sE6eYz16/Elit6CNO2pVGM3KPQeI0q5ds
         V7WPmIw3q7OkzC6knnrQ0EJFhCld0fbILR/fNjwSIggWoPB95ZaIdvnvWmjjXoxtiemG
         +mZw==
X-Gm-Message-State: AC+VfDzLNYiITQzNdjaYdqNtHYacwC3ZWj4BaRZCS2jOjVf5H5jpMOAq
	A/0soarl8CWrsJ2zZO6R2+XgK3yNv+E=
X-Google-Smtp-Source: ACHHUZ4WsiO6Zk3o1Dla3fKJOAOJt6pH061LDn1vWRyukcylQsuRZeFs8TO6qz8yfwniP+D95fSNGw==
X-Received: by 2002:a2e:94cf:0:b0:2a7:6b40:7ea2 with SMTP id r15-20020a2e94cf000000b002a76b407ea2mr3084289ljh.14.1683824980238;
        Thu, 11 May 2023 10:09:40 -0700 (PDT)
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
Subject: [PATCH v7 4/5] xen/riscv: setup initial pagetables
Date: Thu, 11 May 2023 20:09:32 +0300
Message-Id: <eb9dee5bcc5d57822abb3aa7dea85421d9f7467e.1683824347.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1683824347.git.oleksii.kurochko@gmail.com>
References: <cover.1683824347.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch does two thing:
1. Setup initial pagetables.
2. Enable MMU which end up with code in
   cont_after_mmu_is_enabled()

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - Nothing changed. Only rebase
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


