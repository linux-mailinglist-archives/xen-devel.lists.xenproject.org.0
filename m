Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34F045D8B3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230883.399214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCX0-0004Jl-U0; Thu, 25 Nov 2021 11:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230883.399214; Thu, 25 Nov 2021 11:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCX0-000440-Fz; Thu, 25 Nov 2021 11:03:10 +0000
Received: by outflank-mailman (input) for mailman id 230883;
 Thu, 25 Nov 2021 11:03:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCWx-0001K8-9f
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:03:07 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 447957b9-4ddf-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 12:03:06 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id t26so15312528lfk.9
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:03:06 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:03:05 -0800 (PST)
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
X-Inumbo-ID: 447957b9-4ddf-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nyrz1DyhOvYhqBK8nvrcaWou5z7OLEnK+mhXV6s0HlU=;
        b=V870hY+Si8qenQfHmDNp7t1IDTMRn/UwCIGehQvYQgixBMY8M4Fn9NrqqUta2QNPUu
         04vENHAecm1kgPQnPRIaIjCThiEhj/mz2ERJh3tdh5oqauIihr1RacIP+ZJBvkdOyS2o
         S3dlDXnvjOzZdzlincmq4yYNkLxpS4ZoOtvoRSyepL0mMHIOtSEFOgso6PXsDjeYWrfF
         KgikvrmgQGQpw9DYZHd/M4L43ZL+sMN9OxuC88t/utyEBmNjy3xk3XQrdYmrHiQ6bDNk
         ZuTBLTUsAdzW0LHJbcz2X0MR1mbzQeuR+wXtdW5NmFSfojX9v2m4whQIXkomngrqcwT1
         3EFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nyrz1DyhOvYhqBK8nvrcaWou5z7OLEnK+mhXV6s0HlU=;
        b=LjGj2kFjW4Wnx8AonA4vXwfNtrzhC6gVI0wheBte7HC9TFEPkpCYJb/AoyTLhIgb2D
         LfUpSGkULk2yShLs69zxwC2PU40mTLsNJ3+UFMmY/MM4wDrZior/Dpgno92/B56qE7bT
         mtB03v+vimgK7j/+bKVw+dD4WZ+LSUszP+eErcn6gSnm+SExHQSjhw3EZ8EY3VTp3gqT
         VfLxe0n7RySjwfnPK5jBi50o4Px59opX+JjwIiWIrD9tL1oZfea+QenLKp/pZSWCL8La
         Hv2QALNx3tbz0f/Y3g2yY+40Bytbmkejs1UL1GTnMZmR1FnDnI3cntBiRtptkyqCDIdT
         gRHA==
X-Gm-Message-State: AOAM530fsijH0QITmffTL3H0oMz4fHYwp0M4wLqFDlW7Lftw9etKF3hq
	rEVF43N30phAy+gCqOOhjKBm4uQtRLVo6A==
X-Google-Smtp-Source: ABdhPJzGjzT6zakGE3+HWjoenO7aqNkiIWjxzh5Xrz+J75cQSaEJ9+zwzgD/iqnblW5fj+SeYObF8A==
X-Received: by 2002:a05:6512:a92:: with SMTP id m18mr1738441lfu.306.1637838185738;
        Thu, 25 Nov 2021 03:03:05 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for guests
Date: Thu, 25 Nov 2021 13:02:46 +0200
Message-Id: <20211125110251.2877218-10-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add basic emulation support for guests. At the moment only emulate
PCI_COMMAND_INTX_DISABLE bit, the rest is not emulated yet and left
as TODO.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v3:
- gate more code on CONFIG_HAS_MSI
- removed logic for the case when MSI/MSI-X not enabled
---
 xen/drivers/vpci/header.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index b0499d32c5d8..2e44055946b0 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -491,6 +491,22 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
+static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
+                            uint32_t cmd, void *data)
+{
+    /* TODO: Add proper emulation for all bits of the command register. */
+
+#ifdef CONFIG_HAS_PCI_MSI
+    if ( pdev->vpci->msi->enabled )
+    {
+        /* Guest wants to enable INTx. It can't be enabled if MSI/MSI-X enabled. */
+        cmd |= PCI_COMMAND_INTX_DISABLE;
+    }
+#endif
+
+    cmd_write(pdev, reg, cmd, data);
+}
+
 static void bar_write(const struct pci_dev *pdev, unsigned int reg,
                       uint32_t val, void *data)
 {
@@ -663,8 +679,9 @@ static int init_bars(struct pci_dev *pdev)
     }
 
     /* Setup a handler for the command register. */
-    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
-                           2, header);
+    rc = vpci_add_register(pdev->vpci, vpci_hw_read16,
+                           is_hwdom ? cmd_write : guest_cmd_write,
+                           PCI_COMMAND, 2, header);
     if ( rc )
         return rc;
 
-- 
2.25.1


