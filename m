Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB90D86C9FE
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:15:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687081.1069908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgG6-0000Zp-AA; Thu, 29 Feb 2024 13:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687081.1069908; Thu, 29 Feb 2024 13:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgG6-0000Xg-7U; Thu, 29 Feb 2024 13:15:34 +0000
Received: by outflank-mailman (input) for mailman id 687081;
 Thu, 29 Feb 2024 13:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xh/y=KG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rfgG5-0000XX-6G
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:15:33 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d6ae6cd-d704-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 14:15:32 +0100 (CET)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5a0e5f083f1so340292eaf.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 05:15:32 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 w26-20020a05620a149a00b00787af8b5c02sm657685qkj.39.2024.02.29.05.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 05:15:30 -0800 (PST)
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
X-Inumbo-ID: 9d6ae6cd-d704-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709212530; x=1709817330; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+jK1WuNiZJxzm9wGU5l+tCGwClKbWQ4eO1w6yhByD4=;
        b=ZAligymMs4k+0qdeApLX4R/m/C6MI12dqj2kmYFZpYdHea82ch9J3xpkZtAHEOZLEm
         CLNp2orSsROdz4uGoHYf93A2+t6nAQzz5ak9fUZIk+Wq2jssc13Inhho9R+6wfzAEkN5
         GtEITJftDt76G1g3tmFnR1MtIT2+6+Lcs9GQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212530; x=1709817330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+jK1WuNiZJxzm9wGU5l+tCGwClKbWQ4eO1w6yhByD4=;
        b=Zhv21SGNlOfbrcFK/5hPrFk2HCqoLxEYPVb6VXvFq2V6euBU6CSFgAOURSQp3vpJGe
         Oc7qnermMdlwrNqupAg6FSiNq5wLRRqaq2fFdZxBwnvJS3zkF62qS7YYdArWfEPDPSDF
         lL7KL9liXgLcABVDx2R1kc10QggTw7Jesz354JYoXfQ4m4gUmyZpnM0aN0DaolVeanTB
         xgqQ2V8H+LjkbtuLV5SV+TqDa7yWWiCVq7f0rq927cVmdpIY/1uP0wPUAWS+hYduxXX1
         777B1MicFcfJu0juVcnYoJKvPa6L4NfEQGcNOOgD048yv3nrHGFZPtdoI9uJ8UWeYrVh
         yqPg==
X-Gm-Message-State: AOJu0YyRzwJZuR9GOL1WIucyYrX1NynS1ScPqz33nB5H0EoGhRKCEr2n
	FoAS1Q7+uwd3VPJSqLAvSQFZC/bplLLGQrZhzuKNX6kAoXQj1bA9bYc8YLn1iTf9VmdlBm8vXtF
	e
X-Google-Smtp-Source: AGHT+IFm+od/7YzI5/UCoJ7VKQ8UEdeF+iHN7TtG2XUW07j1auYpDJebl860+/4zkt5ps5FV6CbOKw==
X-Received: by 2002:a05:6358:8414:b0:17b:78f1:b4ea with SMTP id b20-20020a056358841400b0017b78f1b4eamr2186438rwk.28.1709212530508;
        Thu, 29 Feb 2024 05:15:30 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH] pci: fix locking around vPCI removal in pci_remove_device()
Date: Thu, 29 Feb 2024 14:15:25 +0100
Message-ID: <20240229131525.19099-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently vpci_deassign_device() is called without holding the per-domain
pci_lock in pci_remove_device(), which leads to:

Assertion 'rw_is_write_locked(&pdev->domain->pci_lock)' failed at ../drivers/vpci/vpci.c:47
[...]
Xen call trace:
   [<ffff82d040260eac>] R vpci_deassign_device+0x10d/0x1b9
   [<ffff82d04027932f>] S pci_remove_device+0x2b1/0x380
   [<ffff82d040260bd0>] F pci_physdev_op+0x197/0x19e
   [<ffff82d04032272d>] F do_physdev_op+0x342/0x12aa
   [<ffff82d0402f067a>] F pv_hypercall+0x58e/0x62b
   [<ffff82d0402012ba>] F lstar_enter+0x13a/0x140

Move the existing block that removes the device from the domain pdev_list ahead
and also issue the call to vpci_deassign_device() there.  It's fine to remove
the device from the domain list of assigned devices, as further functions only
care that the pdev domain field is correctly set to the owner of the device
about to be removed.

Moving the vpci_deassign_device() past the pci_cleanup_msi() call can be
dangerous, as doing the MSI cleanup ahead of having removed the vPCI handlers
could lead to stale data in vPCI MSI(-X) internal structures.

Fixes: 4f78438b45e2 ('vpci: use per-domain PCI lock to protect vpci structure')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 4c0a836486ec..194701c9137d 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -817,15 +817,15 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
         {
-            vpci_deassign_device(pdev);
-            pci_cleanup_msi(pdev);
-            ret = iommu_remove_device(pdev);
             if ( pdev->domain )
             {
                 write_lock(&pdev->domain->pci_lock);
+                vpci_deassign_device(pdev);
                 list_del(&pdev->domain_list);
                 write_unlock(&pdev->domain->pci_lock);
             }
+            pci_cleanup_msi(pdev);
+            ret = iommu_remove_device(pdev);
             printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
             free_pdev(pseg, pdev);
             break;
-- 
2.44.0


