Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090EC42111C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201475.356029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhh-0002Ud-R1; Mon, 04 Oct 2021 14:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201475.356029; Mon, 04 Oct 2021 14:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhh-0002QP-LX; Mon, 04 Oct 2021 14:12:29 +0000
Received: by outflank-mailman (input) for mailman id 201475;
 Mon, 04 Oct 2021 14:12:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Qt=OY=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mXOhg-0008QG-EO
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:12:28 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e72701a1-b62e-4ec6-ab73-34ca2ca8a6d9;
 Mon, 04 Oct 2021 14:12:04 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id e15so72226937lfr.10
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 07:12:04 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id n12sm1076809lfe.145.2021.10.04.07.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:12:00 -0700 (PDT)
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
X-Inumbo-ID: e72701a1-b62e-4ec6-ab73-34ca2ca8a6d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nrv8Q7YNNTYEmccS6yS28+CJYz+9hljBpl00ZO95JOI=;
        b=nHuD21akS1FNyvIKBPdF6k+GqRtBWoOQJqggbF4XIO3yURxuakjo8JjEARjNGJ/4Mg
         WfTvVAT5I5o6ZU+MbvJb3Tj/KcCPI6VoaqiJ05HXRRTiBm6t34rg3/m85WvcLmfrowJ/
         R+UZsE1C8easZFmv5iXiFnTWuyAcJmxcsF/+zx8ga1h717rcjGaa3rXtvoUXWepavkEB
         xMbCejYM6qEP67QHbHlDsoLkV02Bs/+PHQs1KeNnVEsc5tziliRzG9hXNw/SQZJdbJpU
         7FqiFK2kY1BHxmUJ0gGQEzHT52jM8K8KbD8pNBWW82B46ohRvq9PRq8wRq4xIqY3NGL7
         wZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nrv8Q7YNNTYEmccS6yS28+CJYz+9hljBpl00ZO95JOI=;
        b=QkDa5yPT6MEIkGHtzxSfHoY9oQ5yDxQYOlKlcKImX2oXCjqhNNBa0fJGCyIJjJrBWG
         jgnzn5nj3zmQfrlhibpG5ZS5lGQzvlxy53rvjW2oL2EJ6ZXfyLlJPhnS0Y/tEvvq44yg
         c0GhH+MT0LhM9QaQa/pUaurmuojJX+UfUgHBayJYUJauIg1YedzX5y3ytvrSwZ+Pohbg
         cg4iiXG4hzCJF3rrMBlbXNnABUCNlE/fUHofRCM/PntR0PCBTRi/vinM8GHTKz4Uumw2
         uRt6dt9tsGO4yFoNVFjiGTkBURYFXA0ZVPoZ9O3iJRe3BUgKI7xw26q3TbOZvFMyiJPD
         lBKg==
X-Gm-Message-State: AOAM5314s+tBHfc6+nFKEqzGMNnwvEjX9HO1odES1Emx1DEns/zQfNnK
	hR2EMJcrxWuzjVwbxKbdqaj+dx46bWQ=
X-Google-Smtp-Source: ABdhPJx9kKhnJbCVxMMJxRpcRGYsGoLBXte/mgqMMAh+YYTdLQh7eBnZZ9pPdA0Flx+hyPuS8jf1JQ==
X-Received: by 2002:a2e:9cd:: with SMTP id 196mr16213782ljj.434.1633356720823;
        Mon, 04 Oct 2021 07:12:00 -0700 (PDT)
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
Subject: [PATCH v4 05/11] xen/arm: Mark device as PCI while creating one
Date: Mon,  4 Oct 2021 17:11:45 +0300
Message-Id: <20211004141151.132231-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004141151.132231-1-andr2000@gmail.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

While adding a PCI device mark it as such, so other frameworks
can distinguish it from DT devices.
For that introduce an architecture defined helper which may perform
additional initialization of the newly created PCI device.

Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
[applicable parts]
Acked-by: Jan Beulich <jbeulich@suse.com>
---
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
index e6d4000e2ac8..ea87ec6006fc 100644
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


