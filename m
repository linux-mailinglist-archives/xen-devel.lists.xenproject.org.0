Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B524B426454
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 07:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204332.359507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirS-0000og-Ix; Fri, 08 Oct 2021 05:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204332.359507; Fri, 08 Oct 2021 05:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirS-0000i0-Dd; Fri, 08 Oct 2021 05:56:02 +0000
Received: by outflank-mailman (input) for mailman id 204332;
 Fri, 08 Oct 2021 05:56:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipo1=O4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mYirQ-0007cA-KE
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 05:56:00 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9308316-49c6-416a-9af9-45f1a05d2721;
 Fri, 08 Oct 2021 05:55:44 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t9so33577352lfd.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 22:55:43 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f8sm151147lfq.168.2021.10.07.22.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 22:55:42 -0700 (PDT)
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
X-Inumbo-ID: b9308316-49c6-416a-9af9-45f1a05d2721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kBaCDB1jQf5kZrJ+C9TzIUopo/UW+RufCsCBCZcFZhQ=;
        b=AdHvna/o6jg3eodxk+IR/WwNFV5s5aQlphltA0H3ObfsdkpSqDi/xT+d6K2H5owUYO
         Vyg7zHOfG+cmfBXt9AMqqLWUuGNBcl62D1oXFsli1B9xmkOweMH4SS5wNXsY1VINoDer
         IbtJwYG45/Gdih9ianuT1GZuuBI9n1kJPZvMFTg4ZDam12jk9AFgO7SeduxOms33jr+M
         J4boOrt+EK1Ug5oScVE/+VLbgidaq7PcnOoiC/q/j/4ZdzKWHQt7wjof57Vlm766/Vv5
         JNv771Bo+9kCND0z5UCRap0WykZeQZ4rZVeGb1AhdomIG5FXwhKFOzTERXoOtsx6Yjq1
         XHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kBaCDB1jQf5kZrJ+C9TzIUopo/UW+RufCsCBCZcFZhQ=;
        b=6SOz4HKY7qtLwmz6/tNHYt9TNjaAQutxJ/5q5Qh1HnLQGG9Rk6frb/iJJY8lAO/Jp3
         TB6rQlypR6qvWKdmU5uOYwcd5r6UBSccNpB4NMCq3iPY+fFhuyFLag5Xj1tSLbQ2vC/q
         2Lo3AABF4ZoEYbg+Nl9fnTQ3WFtJYLnKbPSQjI5nJ7wUkVu57Rrqhq/HH4ZU7JZ3uHn2
         UV7KkYKRsuntJ907pHokG0klmEETBlR14uc6NmEBwEsSdNJgWkLbLFt0SQNFYK14ARww
         Oq5nTX8QUF+aZW+Y2nhDy+Z1F2eoEp2lrrW7l3FYLw7elyA3WGfnPxqNLwspryWRtKHY
         FGyg==
X-Gm-Message-State: AOAM533ztV8vICMYYgu6Mhdo/gPHr6Rq7vAuVM/BzEORI57azROvUZVp
	KEgYR9eoz0iVhinuGHaldTIhUUc3Mnc=
X-Google-Smtp-Source: ABdhPJxh8orDP66nDG63AjGag7W745tT+yg4DFTW8P7aAuYsgvYGCDXxaCJQV2aL2G7HiK0kq3rzLg==
X-Received: by 2002:a05:6512:2393:: with SMTP id c19mr8840366lfv.518.1633672542822;
        Thu, 07 Oct 2021 22:55:42 -0700 (PDT)
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
Subject: [PATCH v5 04/10] xen/arm: Mark device as PCI while creating one
Date: Fri,  8 Oct 2021 08:55:29 +0300
Message-Id: <20211008055535.337436-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008055535.337436-1-andr2000@gmail.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

While adding a PCI device mark it as such, so other frameworks
can distinguish it from DT devices.
For that introduce an architecture defined helper which may perform
additional initialization of the newly created PCI device.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
[applicable parts]
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>

Since v3:
- fixed Arm build without CONFIG_HAS_PCI
Since v2:
 - !! dropped Stefano's r-b because of the changes
 - introduced arch_pci_init_pdev (Jan)
Since v1:
 - moved the assignment from iommu_add_device to alloc_pdev
---
 xen/arch/arm/pci/pci.c        | 5 +++++
 xen/drivers/passthrough/pci.c | 2 ++
 xen/include/asm-arm/pci.h     | 7 +++++++
 xen/include/asm-x86/pci.h     | 2 ++
 4 files changed, 16 insertions(+)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 138da19284ab..082c14e127a8 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -34,6 +34,11 @@ struct pci_dev *dev_to_pci(struct device *dev)
     return container_of(dev, struct pci_dev, arch.dev);
 }
 
+void arch_pci_init_pdev(struct pci_dev *pdev)
+{
+    pci_to_dev(pdev)->type = DEV_PCI;
+}
+
 static int __init dt_pci_init(void)
 {
     struct dt_device_node *np;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index b36d5a481162..9e6246afeef5 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -329,6 +329,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     *((u8*) &pdev->devfn) = devfn;
     pdev->domain = NULL;
 
+    arch_pci_init_pdev(pdev);
+
     rc = pdev_msi_init(pdev);
     if ( rc )
     {
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 9aa8eca53175..98cb22d39ef1 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -105,6 +105,9 @@ static always_inline bool is_pci_passthrough_enabled(void)
 {
     return pci_passthrough_enabled;
 }
+
+void arch_pci_init_pdev(struct pci_dev *pdev);
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
@@ -121,5 +124,9 @@ static inline int pci_get_host_bridge_segment(const struct dt_device_node *node,
     return -EINVAL;
 }
 
+struct pci_dev;
+
+static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
+
 #endif  /*!CONFIG_HAS_PCI*/
 #endif /* __ARM_PCI_H__ */
diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
index c4a4fdcbc239..443f25347d08 100644
--- a/xen/include/asm-x86/pci.h
+++ b/xen/include/asm-x86/pci.h
@@ -36,4 +36,6 @@ static always_inline bool is_pci_passthrough_enabled(void)
     return true;
 }
 
+static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
+
 #endif /* __X86_PCI_H__ */
-- 
2.25.1


