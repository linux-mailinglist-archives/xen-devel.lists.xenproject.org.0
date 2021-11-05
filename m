Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DE7445FF0
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222093.384193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9Z-00023Q-B9; Fri, 05 Nov 2021 06:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222093.384193; Fri, 05 Nov 2021 06:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9Z-0001rV-4s; Fri, 05 Nov 2021 06:56:45 +0000
Received: by outflank-mailman (input) for mailman id 222093;
 Fri, 05 Nov 2021 06:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mit9X-0008NQ-0W
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:56:43 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 882d0480-3e05-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 07:56:42 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id g14so29236504edz.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:56:42 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm3735150ejb.27.2021.11.04.23.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:56:41 -0700 (PDT)
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
X-Inumbo-ID: 882d0480-3e05-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pQYQjf/W6J0SupymAgyjXFbgcoTAynkHvQvG8kaNKtE=;
        b=REKx4tJPrYDsJUNCJKpj14ih7omKhQQe5cRTJOAGrnflNXA0QYA6mXstHT5V0pVFf6
         gNsdSf977poOoLNRmfBcW3sgmOZfOSLP0RSbsm0LCdFFSvfQYHnMDE3bUxk8m793XkIC
         /9K17kLCe9oGpNBb2DuvKwFkdh+gBs5zkdJx0zPY8ZVwqkL0ogMJob4pqdbPDiAVWOpc
         xRe7z9xHKBwMYi6LwPnCz6byiN8MmQR0wpZl9ZhyG6kNRYEFrBuUxdql6TGnv2ZD4+Y1
         NP52JvIugUJUToEgMWtL5Ubo+ViZQLrWdfSd2QzrpbWzLU7/d+HxQ9I7lJfjPuONycLB
         ispQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pQYQjf/W6J0SupymAgyjXFbgcoTAynkHvQvG8kaNKtE=;
        b=1uwUcklCiIJFLSLhTgUMJ4jYQGoRN2o2TIyoFzMh+G3HEBjZMLTF4saD939ycfRMmo
         cIFWkgDdMhhmqWH2/I3VvODN+lMDaqxt44OxhLjQTWixhqBurJvotWjUs6Bf1RWF552c
         H/alaZPbCE2d9B3Vr7jG1Ze53VsN86WGfJu2JUj4AbDTqifqcTdlOMERHAYPy3NgIR93
         F7XNGH832Omo4TPeBBt3dV0WWCOrpy7dXSmtDFsm271dPG0+roaFXvkEJH00Rt/r1cOB
         g/UtzEycbRa99K0OwzepFadmP/2ilMY5dHhWv7kJJprM5PPpGYyFY+1V5ZwLIdAln8QJ
         o/dw==
X-Gm-Message-State: AOAM531beRvJ+f8EVpsuGorHvMJMof0K8agxqF6KEYs0KVSquF2wY8iB
	bpB2Qo3wNCaCfCXRhZaFCIiSZ0ucHLMHuA==
X-Google-Smtp-Source: ABdhPJyfcQnz2s3OZb7zo0UDGNsehpeHVTWJcimzQRS/jBRT+UODYLMfQyENC816TfBAVXOfgiVs3Q==
X-Received: by 2002:a17:907:d94:: with SMTP id go20mr8942339ejc.78.1636095401673;
        Thu, 04 Nov 2021 23:56:41 -0700 (PDT)
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
Subject: [PATCH v4 08/11] vpci/header: emulate PCI_COMMAND register for guests
Date: Fri,  5 Nov 2021 08:56:26 +0200
Message-Id: <20211105065629.940943-9-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105065629.940943-1-andr2000@gmail.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
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
index 34158da2d5f6..64cfc268c341 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -459,6 +459,22 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
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
@@ -631,8 +647,9 @@ static int init_bars(struct pci_dev *pdev)
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


