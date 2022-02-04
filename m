Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9184A940A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265013.458365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBg-0002Uv-R2; Fri, 04 Feb 2022 06:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265013.458365; Fri, 04 Feb 2022 06:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBg-0002Gc-8d; Fri, 04 Feb 2022 06:35:16 +0000
Received: by outflank-mailman (input) for mailman id 265013;
 Fri, 04 Feb 2022 06:35:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBd-0008DW-QM
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:13 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b59e52f-8584-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 07:35:13 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id z19so10659451lfq.13
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:13 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:12 -0800 (PST)
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
X-Inumbo-ID: 9b59e52f-8584-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FX99xFROYnnqXaxsrJbKwTBFYrf06bSi150/1Wew964=;
        b=cfEcGqDRT0H+u76W/kO7xJphKRiV6ogCbh4ol7qeJnPisV7JGCgkiVR1sSNGS4CRyM
         mh8fidCB4ulKXq5h9Smv+lSr4tSwufdbBKxBOxJcPOTv2tF3ohaLs5FRYsAZdqp/QwGU
         REu1w4eB5e1E3XbosGxE+NjRBsKrwEngfwtIf+UM+sTF2kwFk1mri4BqUPaT8yW/CgwY
         wLUctjH9xQn93iUyRBgB6cYJTIQC+GW/4RUPonIRmQDjYfRYEFd04iwKj2rr3TRN0hxF
         P6XUv5qj5Tv+x6thu/brLBbh6YBahufDoBOWqApfgdyuLFuffR4Tc94uaQ8eiDyUEQfX
         9OJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FX99xFROYnnqXaxsrJbKwTBFYrf06bSi150/1Wew964=;
        b=Cjez70YkqzDjVsQK8Msb0C4Am3DQ2qpnAuwFVOTpzBIQSa6FTWpCU9DUsi0ZHcu/XK
         tbzMPBMFeVhQ9ZyGKjhu4/K6cFyJh9DFojCqYHMQnC00uGXnL5dBumqXXX1vS0XNFgS9
         OwsuvmRhTbebroJN5z2CCeJPabLD/TNlMgT4ioqS1S8De9AhDF6uPHhXGTiuFU0FRjQQ
         XJM9ZCSs0GTOJANL/nCnFo5ONcEOvCcAC6XtHl1SpGuY+jpXoIlbdI791HrQMmOo1uI+
         2W1hHPkhwJxTe8aqHJAIa7tnLSFJWvOiCqxHCFWO2VZhphMXMgSS9LLUFn7fLGOxyacp
         FDig==
X-Gm-Message-State: AOAM531tcuQp3moQqirUboK3mf56If3i32UNdnvRxeFhmMdvKFW0tVyr
	0Af1W6h/iD9hcXBhCXJLozp1Q3syffY=
X-Google-Smtp-Source: ABdhPJwon9dynpKYpjG0DMccYwOaOzKCe/ToTI783e4Ajn2KtH8i/5XPF0PCpVRt0DG4lKESp5cs0g==
X-Received: by 2002:a05:6512:1082:: with SMTP id j2mr1237420lfg.371.1643956512552;
        Thu, 03 Feb 2022 22:35:12 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 10/13] vpci/header: reset the command register when adding devices
Date: Fri,  4 Feb 2022 08:34:56 +0200
Message-Id: <20220204063459.680961-11-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204063459.680961-1-andr2000@gmail.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reset the command register when assigning a PCI device to a guest:
according to the PCI spec the PCI_COMMAND register is typically all 0's
after reset.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v5:
- updated commit message
Since v1:
 - do not write 0 to the command register, but respect host settings.
---
 xen/drivers/vpci/header.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 33d8c15ae6e8..407fa2fc4749 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -454,8 +454,7 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
-static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
-                            uint32_t cmd, void *data)
+static uint32_t emulate_cmd_reg(const struct pci_dev *pdev, uint32_t cmd)
 {
     /* TODO: Add proper emulation for all bits of the command register. */
 
@@ -467,7 +466,13 @@ static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
     }
 #endif
 
-    cmd_write(pdev, reg, cmd, data);
+    return cmd;
+}
+
+static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
+                            uint32_t cmd, void *data)
+{
+    cmd_write(pdev, reg, emulate_cmd_reg(pdev, cmd), data);
 }
 
 static void bar_write(const struct pci_dev *pdev, unsigned int reg,
@@ -676,6 +681,10 @@ static int init_bars(struct pci_dev *pdev)
         return -EOPNOTSUPP;
     }
 
+    /* Reset the command register for the guest. */
+    if ( !is_hwdom )
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, emulate_cmd_reg(pdev, 0));
+
     /* Setup a handler for the command register. */
     rc = vpci_add_register(pdev->vpci, vpci_hw_read16,
                            is_hwdom ? cmd_write : guest_cmd_write,
-- 
2.25.1


