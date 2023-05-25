Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C573710F91
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 17:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539711.840875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CtF-0007eN-UI; Thu, 25 May 2023 15:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539711.840875; Thu, 25 May 2023 15:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CtF-0007bn-Qa; Thu, 25 May 2023 15:28:33 +0000
Received: by outflank-mailman (input) for mailman id 539711;
 Thu, 25 May 2023 15:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g/QV=BO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q2CtD-0007Iw-SB
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 15:28:31 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce124b03-fb10-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 17:28:31 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f4db9987f8so482761e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 08:28:31 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d22-20020ac244d6000000b004f37c0dfcaasm246853lfm.118.2023.05.25.08.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 08:28:30 -0700 (PDT)
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
X-Inumbo-ID: ce124b03-fb10-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685028511; x=1687620511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kekLKeFIbeYDOHCuOxDTya7bEvDS56y6sN78THRHMuo=;
        b=L0CP3/72F4YA3SVThEPqoI7mTlLcCENpjUKA/RQczdmkGSSN/de6tE/mxtfAJdhp/b
         s7Pmr8VVHhdqY4kZV6LfPBeV1Q9uTNKQYVB9czdcwZiT7nKq/20beg2Q/XXpIcIVl3g8
         DnxVTZOcwq56h8WzlnSlSw8SHJFilJqe5ATvyh+KXLiZofdcdDWXrGCoR+KIIf6DDHzO
         vUR7WmdwtwEAwZlfpBm6WgzSi4ztPzBnFxT0FGkrVTQtZxaBsQarYV2ZRSUYcyouLu/J
         PDLHHmPqMS4W1a79PtbJ5g+k/qdARdyheDU2XrzNei7cF3DEiHKdaJEUy4Ymp9Z0W4bq
         sBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685028511; x=1687620511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kekLKeFIbeYDOHCuOxDTya7bEvDS56y6sN78THRHMuo=;
        b=KnjVyu8Pqntljor17/+E23b85aOFh1jnTtP9ajheDG63U2ZZuuozuj0agIDrf2COnr
         BgHavI9UM5CbnBK6qIftfOE5Skvbd2I+5yoPVdsVVs6AV8nGed7C3umPnhdu3E7CsJSX
         H1ZMg8ieAcX96jMk9x0KkdqlP05fwQ3MBUcxqF3UqaNJnBo3NvDoFtce8Lq9RDXqkW6r
         AxgRPgjC6mMZ5FtYZrmnI6mrGnejPkGV5mAYgiY7iciQ6IJX4xtXtUYPvS60Mx57OOhZ
         DG5rsEw/Sf/RabKt2TP4SUNcjrfNi/M5TN+9Bf2PEZ8m+Qd3mOjtOowUyvaB4iCbe+s8
         QLfg==
X-Gm-Message-State: AC+VfDyp6Yq91aTYGqeASX4kKxGxFrDhDKobJxuGPIKPwq+2wAocMF+O
	7bJ+kK1qV/J9LCRgxzZUcmztRrIIaGg=
X-Google-Smtp-Source: ACHHUZ54mKL4yz2tswCT6bUSDgiMcAVpL9rQyxTaKnt81R9rivSGkf0GpgexQ4aAjwSzkEN/G8cAXg==
X-Received: by 2002:a05:6512:3c86:b0:4eb:412f:9e0e with SMTP id h6-20020a0565123c8600b004eb412f9e0emr1126234lfv.26.1685028510793;
        Thu, 25 May 2023 08:28:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v9 4/5] xen/riscv: setup initial pagetables
Date: Thu, 25 May 2023 18:28:17 +0300
Message-Id: <6ea28216df1c7f29ebd88e20adb05cdf75af20fe.1685027257.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1685027257.git.oleksii.kurochko@gmail.com>
References: <cover.1685027257.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch does two thing:
1. Setup initial pagetables.
2. Enable MMU which end up with code in
   cont_after_mmu_is_enabled()

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V9:
 - Nothing changed. Only rebase
---
Changes in V8:
 - Nothing changed. Only rebase
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


