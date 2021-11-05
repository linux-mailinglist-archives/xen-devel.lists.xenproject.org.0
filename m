Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F7B445FE8
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222088.384142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9T-0000dL-E5; Fri, 05 Nov 2021 06:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222088.384142; Fri, 05 Nov 2021 06:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9T-0000bS-9m; Fri, 05 Nov 2021 06:56:39 +0000
Received: by outflank-mailman (input) for mailman id 222088;
 Fri, 05 Nov 2021 06:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mit9R-0008NQ-3q
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:56:37 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 849e8569-3e05-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 07:56:36 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id g14so29235879edz.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:56:36 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm3735150ejb.27.2021.11.04.23.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:56:35 -0700 (PDT)
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
X-Inumbo-ID: 849e8569-3e05-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ndViLhJiu5nJA5llxtFbdf7nx2zoDFBKma1YLn+Pglc=;
        b=O8CfU7uVVxraZ90rmP/W7ldSpEaLtcuqJl04xFonUzrW4ZHU+AieeyGl4xo8ymCEE2
         F1yrTAkkKUGDv0srM0HLcueKvmd8iQMSZDxUnoY4SloB+2xXg4y06Okekq07O2rrWgSM
         w3BM1tXvBhJ7mmCBABL7jmR5FSxICrh5YweHft2v8ekLuB5aXstiGGYlN5/hpxePp72j
         gePT1kfSPwV9VluNAs2+iIYlVcC3b8gIV1f5ANzq9Ok7TfBNZwfpiihepf0KOzRnZgC8
         iBAk9mgwqltzMIuz0nOyCdU+xsh30OYi9a/Jw+/d2WkSSthQfRd7YsZLv4mIhkrnDxKx
         U0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ndViLhJiu5nJA5llxtFbdf7nx2zoDFBKma1YLn+Pglc=;
        b=cokzhkZ2VR2XLCc351NSnC+0fIOVhcYSmL/6qbMXHk/43eet7fjN6FJRmRTpgyJ5L9
         fmTz+rYuelhu1KCW/GPrA6hyuu1Qcstih0Y6+NB189S//FiB7v1bT4VN9/RCOymMfNjN
         10Rh2QDr5UQ6NOMv1q8GWMtg/BL8jjUaF2mpXxbQTBStP2GMs3QHylsvVAePNcSe8h1M
         dNGAiKarXCD+5muTj3snnqBTpjlmvxmYCXNS+/Xe82kEwABzBqvTKUqKPVdwAOChRjRI
         N0WgH7mCHSnpr6bxHpCePFgusgm5CnUn12v3+W+5a6rx4U8pf2oxrVwgdA2mJ9EhAfXj
         2Ecw==
X-Gm-Message-State: AOAM533zPdk2zXzsfIsQUJcB+f+a7CBdPsng3rnenZt0LhTgtCl6am6v
	CnzxmiDeR2cnq/9ZBKFaP+4yYue2Udi9Gw==
X-Google-Smtp-Source: ABdhPJwvgUws2STx5uDR0C5x7eXgFsEjsvQ41PddklT8xFMzxt05VZNafwWyw+SPkIGRrx9enPTVmg==
X-Received: by 2002:a17:906:270e:: with SMTP id z14mr69685944ejc.414.1636095395773;
        Thu, 04 Nov 2021 23:56:35 -0700 (PDT)
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
Subject: [PATCH v4 03/11] vpci: make vpci registers removal a dedicated function
Date: Fri,  5 Nov 2021 08:56:21 +0200
Message-Id: <20211105065629.940943-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105065629.940943-1-andr2000@gmail.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

This is in preparation for dynamic assignment of the vpci register
handlers depending on the domain: hwdom or guest.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v3:
- remove all R-b's due to changes
- s/vpci_remove_device_registers/vpci_remove_device_handlers
- minor comment cleanup
Since v1:
 - constify struct pci_dev where possible
---
 xen/drivers/vpci/vpci.c | 6 +++++-
 xen/include/xen/vpci.h  | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 4e24956419aa..d7f033a0811f 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -35,7 +35,7 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
-void vpci_remove_device(struct pci_dev *pdev)
+void vpci_remove_device_handlers(const struct pci_dev *pdev)
 {
     if ( !has_vpci(pdev->domain) )
         return;
@@ -51,8 +51,12 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
+}
 
+void vpci_remove_device(struct pci_dev *pdev)
+{
     vpci_cancel_pending(pdev);
+    vpci_remove_device_handlers(pdev);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 609d6383b252..1883b9d08a70 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -30,6 +30,8 @@ int __must_check vpci_add_handlers(struct pci_dev *dev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
+/* Remove all handlers for the device. */
+void vpci_remove_device_handlers(const struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register(struct vpci *vpci,
-- 
2.25.1


