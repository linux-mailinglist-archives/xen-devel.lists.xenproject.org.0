Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ECB4A940D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265012.458357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBf-0002H4-PH; Fri, 04 Feb 2022 06:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265012.458357; Fri, 04 Feb 2022 06:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBf-00022M-5X; Fri, 04 Feb 2022 06:35:15 +0000
Received: by outflank-mailman (input) for mailman id 265012;
 Fri, 04 Feb 2022 06:35:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBc-0008DX-K9
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:12 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aa7edd9-8584-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 07:35:11 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id o17so7205812ljp.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:11 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:11 -0800 (PST)
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
X-Inumbo-ID: 9aa7edd9-8584-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kqe4MtyzAvOGHGKuf3R4wkGH8c0Z7HCCzvLS5umkU1o=;
        b=aZkmCJKMeQMCzE2uO2NL3NExo6pehR9hggGJIxvr10ezeFkscLBRLAEIPtGHDIlsqF
         FveGForAVCWOyJlL3/TNTCBHOHo+Q0iyqVUt9stcPGLF6Mxk2yWgzk7Udh7NSFfXHgSv
         mGKlJEtlUNpEpXKgcI78rxcdD7OZBG30y0EUavYCZkEZvoe9YJ+rCGi+CILkvgXO8xu/
         wz9SJIAVk5jW9Ecnomi3T/yn2Mz+ym/5oytSRRlHKvzfNvb7mJPp89O6h5Roik30WQOq
         uKJVOEQyY9bj7IyjoH31Nbhg+RkJveky4PRhP+/wsOWjwiHZxyRidGJ8s5r75BtavSse
         pkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kqe4MtyzAvOGHGKuf3R4wkGH8c0Z7HCCzvLS5umkU1o=;
        b=AsEv10kFpOKydudwGvE8kQcOvV5LDlnubhJSs6Euvxc1+n1B+i5T2JVeFyu9cC2tYq
         1QvjKcQOrAsNCVDl88fo55sOK/EzhN7oC7BdB6iZklEE1ZlvaJaJBPDENKr+4tqIgNEa
         KI/kTxt/Yv/lsIRphH2zhYfDtY5BvWxaM250zotaOC6sFA3gncKiyor/YLWeTmgNWcKB
         CJVUrBeEJpQ9imhPSK011AV6eMZ2RV0+5dPRfUKXRRmEYatG1qhOXn0aB7zk1qLfVA8u
         8R103oAEH6o6c4/i/ENsxxulxWX4Oh/14J2lGNfN6JJxRSEHZO2YpXiKtsCgTsZstF3f
         A1Ng==
X-Gm-Message-State: AOAM532O27H6J7PQHT8ljmdzqNDO1XcM1mJgOiFCJyWgx9RZbxb1PMxo
	2SF8N9vkjE+G4tddnmN//7rxBa8WbtU=
X-Google-Smtp-Source: ABdhPJyB7jlJZ7qysvRjbOwP2BLmD+X+2ZSuXBZ47oczLChBA1MjcsRUZxy9FgQ7GWx1wfWjjkim7w==
X-Received: by 2002:a2e:bc1c:: with SMTP id b28mr936913ljf.40.1643956511398;
        Thu, 03 Feb 2022 22:35:11 -0800 (PST)
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
Subject: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for guests
Date: Fri,  4 Feb 2022 08:34:55 +0200
Message-Id: <20220204063459.680961-10-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204063459.680961-1-andr2000@gmail.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add basic emulation support for guests. At the moment only emulate
PCI_COMMAND_INTX_DISABLE bit, the rest is not emulated yet and left
as TODO.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v5:
- add additional check for MSI-X enabled while altering INTX bit
- make sure INTx disabled while guests enable MSI/MSI-X
Since v3:
- gate more code on CONFIG_HAS_MSI
- removed logic for the case when MSI/MSI-X not enabled
---
 xen/drivers/vpci/header.c | 21 +++++++++++++++++++--
 xen/drivers/vpci/msi.c    |  4 ++++
 xen/drivers/vpci/msix.c   |  4 ++++
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 88ca1ad8211d..33d8c15ae6e8 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -454,6 +454,22 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
+static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
+                            uint32_t cmd, void *data)
+{
+    /* TODO: Add proper emulation for all bits of the command register. */
+
+#ifdef CONFIG_HAS_PCI_MSI
+    if ( pdev->vpci->msi->enabled || pdev->vpci->msix->enabled )
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
@@ -661,8 +677,9 @@ static int init_bars(struct pci_dev *pdev)
     }
 
     /* Setup a handler for the command register. */
-    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
-                           2, header);
+    rc = vpci_add_register(pdev->vpci, vpci_hw_read16,
+                           is_hwdom ? cmd_write : guest_cmd_write,
+                           PCI_COMMAND, 2, header);
     if ( rc )
         return rc;
 
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index e3ce46869dad..90465dcb4831 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -70,6 +70,10 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
 
         if ( vpci_msi_arch_enable(msi, pdev, vectors) )
             return;
+
+        /* Make sure guest doesn't enable INTx while enabling MSI. */
+        if ( !is_hardware_domain(pdev->domain) )
+            pci_intx(pdev, false);
     }
     else
         vpci_msi_arch_disable(msi, pdev);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index d1dbfc6e0ffd..4c0e1836b589 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -92,6 +92,10 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
         for ( i = 0; i < msix->max_entries; i++ )
             if ( !msix->entries[i].masked && msix->entries[i].updated )
                 update_entry(&msix->entries[i], pdev, i);
+
+        /* Make sure guest doesn't enable INTx while enabling MSI-X. */
+        if ( !is_hardware_domain(pdev->domain) )
+            pci_intx(pdev, false);
     }
     else if ( !new_enabled && msix->enabled )
     {
-- 
2.25.1


