Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41A42645A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 07:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204345.359540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirh-0002Sa-Mo; Fri, 08 Oct 2021 05:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204345.359540; Fri, 08 Oct 2021 05:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirh-0002PD-Hz; Fri, 08 Oct 2021 05:56:17 +0000
Received: by outflank-mailman (input) for mailman id 204345;
 Fri, 08 Oct 2021 05:56:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipo1=O4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mYirf-0007cA-Kt
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 05:56:15 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7695a0a1-c5b1-4e65-894c-89d7bfc211df;
 Fri, 08 Oct 2021 05:55:47 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y15so34649433lfk.7
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 22:55:47 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f8sm151147lfq.168.2021.10.07.22.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 22:55:46 -0700 (PDT)
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
X-Inumbo-ID: 7695a0a1-c5b1-4e65-894c-89d7bfc211df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=goBcPmRp2ohWna+/gXXwyGZm/zW9wdOzUquFDTCwT10=;
        b=cX19K/TYDn8vW4HwKU48r0qTiY6u4hpHnfe75SOv2g6lg/739OtMcTs1VfZi56IOFb
         3Sb2UyHnVpDICH/QwOqqye9oXXlZI8ZHwPpd7qi1QaS5PgGhgCZ7nVokYO5eQrU908se
         z2IgC4WDRpO9ynOqGMyb4llqr8LSzbgz83sb/QjiT+/yCrx8ZibjSSuMLHGcNTdo7Ap2
         NL3In+YVGcZjcJd2JXTVjB1ji5V9UdsoWNFxJlJQk10i86BwrJnExqD0gwgG+JZ+caI4
         LlA+aqvTcHVtPAEjICb/D/piDO/0Secv8r2Lxw2yNGhZCZQyeMVmUadsEVpVgY/jb1lp
         6lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=goBcPmRp2ohWna+/gXXwyGZm/zW9wdOzUquFDTCwT10=;
        b=NZZxQYoZLxsd7+tU8tlhRUfDYj1rABt6q+TnTDDxqoZcGW5auX8xqc3cyt83U+IQ/v
         /X1GMmjb31jlsype/oQTyT1Js6FzozxG+QxEABcs2iCtZ2iOxSuRu6Z5hR3dGiztLggk
         K9rWe1A8NWEMvMlK3kPE6WPly44fufKFodPk8KDHxunabE2ftxVYqulLDTiYPkFQeNlP
         VIVTPIepwWf+aCRHxpfehuUyU/JVF01N0mOOptx8EtAEnn+Ipni454qsRBmDAhFNFhps
         IzRzZ/iScAqqj06MvWGcJS2THralEvU+N/O9nLRLg4uR3iEGKA+UigK3ukBnF/S5flYR
         rXrg==
X-Gm-Message-State: AOAM533RrB7OzlzhiLoPlHtg5E4KEh2sFqwq429roAt7FOM+gqoO9Ou1
	AFlxL1Zb0wii9nwpIBYfrXtneyYXDgA=
X-Google-Smtp-Source: ABdhPJwlTn/wOzkXL/qlTPFqV3Ub7ABbU4xc8mOsh6FwPIjRr3AZzSK+WsDY1a4okJWcWyHdVrYwYQ==
X-Received: by 2002:a05:6512:31e:: with SMTP id t30mr8361782lfp.82.1633672546470;
        Thu, 07 Oct 2021 22:55:46 -0700 (PDT)
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
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 07/10] libxl: Only map legacy PCI IRQs if they are supported
Date: Fri,  8 Oct 2021 08:55:32 +0300
Message-Id: <20211008055535.337436-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008055535.337436-1-andr2000@gmail.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Arm's PCI passthrough implementation doesn't support legacy interrupts,
but MSI/MSI-X. This can be the case for other platforms too.
For that reason introduce a new CONFIG_PCI_SUPP_LEGACY_IRQ and add
it to the CFLAGS and compile the relevant code in the toolstack only if
applicable.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Juergen Gross <jgross@suse.com>

Since v1:
 - Minimized #idefery by introducing pci_supp_legacy_irq function
   for relevant checks
---
 tools/libs/light/Makefile    |  4 ++++
 tools/libs/light/libxl_pci.c | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 7d8c51d49242..bd3f6be2a183 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -46,6 +46,10 @@ CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
 	-Wno-declaration-after-statement -Wformat-nonliteral
 CFLAGS += -I.
 
+ifeq ($(CONFIG_X86),y)
+CFLAGS += -DCONFIG_PCI_SUPP_LEGACY_IRQ
+endif
+
 SRCS-$(CONFIG_X86) += libxl_cpuid.c
 SRCS-$(CONFIG_X86) += libxl_x86.c
 SRCS-$(CONFIG_X86) += libxl_psr.c
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 59f3686fc85e..4c2d7aeefbb2 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1364,6 +1364,15 @@ static void pci_add_timeout(libxl__egc *egc, libxl__ev_time *ev,
     pci_add_dm_done(egc, pas, rc);
 }
 
+static bool pci_supp_legacy_irq(void)
+{
+#ifdef CONFIG_PCI_SUPP_LEGACY_IRQ
+    return true;
+#else
+    return false;
+#endif
+}
+
 static void pci_add_dm_done(libxl__egc *egc,
                             pci_add_state *pas,
                             int rc)
@@ -1434,6 +1443,8 @@ static void pci_add_dm_done(libxl__egc *egc,
         }
     }
     fclose(f);
+    if (!pci_supp_legacy_irq())
+        goto out_no_irq;
     sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
                                 pci->bus, pci->dev, pci->func);
     f = fopen(sysfs_path, "r");
@@ -1983,6 +1994,8 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
         }
         fclose(f);
 skip1:
+        if (!pci_supp_legacy_irq())
+            goto skip_irq;
         sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
                                pci->bus, pci->dev, pci->func);
         f = fopen(sysfs_path, "r");
-- 
2.25.1


