Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE5C3FFC1A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177859.323635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4ef-0002AI-AP; Fri, 03 Sep 2021 08:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177859.323635; Fri, 03 Sep 2021 08:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4ef-00025O-5o; Fri, 03 Sep 2021 08:34:33 +0000
Received: by outflank-mailman (input) for mailman id 177859;
 Fri, 03 Sep 2021 08:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM4ed-0006kQ-Dn
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:34:31 +0000
Received: from mail-ej1-x633.google.com (unknown [2a00:1450:4864:20::633])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcfff0c5-87bc-448e-bd89-368f58f11371;
 Fri, 03 Sep 2021 08:33:59 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id jg16so7370339ejc.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 01:33:59 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id i7sm2311932ejx.73.2021.09.03.01.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:33:58 -0700 (PDT)
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
X-Inumbo-ID: fcfff0c5-87bc-448e-bd89-368f58f11371
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hx54vdgUoheVTz/8kdwndGE5xFCEvdbxwnx2M5LV2vg=;
        b=RdDtLXI6Rg8R+9WLRJYoNMq8UIn9C9UYiKM3atwuaiVC9bWq2G1D1gEb8701s40UoB
         q3Vkp/Q+AaXXiFaOTz5uyjQxEyJLgSw8QJB7PO+sZnWNbsk2QivJXAbq5fg+Jqbdfysp
         +QSpl4wnAMWZmYNE5OUiwggYvVyrZQF2WSlhbdngi69rmyZVt6LY3os3UdU+56o7z0Qz
         aXLK85ahPpB0tLKxrNsEPTzR/jIdjbVD9jnl5/AcTadm4B0eFB/U0iKObJlOH+vNr5El
         RDPi9bmWAmk9pV5ibKbmzIYJq18buRGok9BqADlAyv9Sraqe2G5UHaYHUFkzWsJQvwxk
         vQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hx54vdgUoheVTz/8kdwndGE5xFCEvdbxwnx2M5LV2vg=;
        b=ZU935E9As03e8TxEeil25qhW+riYm6XE9eWITrr/ZJ9UU6It0Y8jMfSb27gbCyZYQH
         7rVTysvwC+z+PqfePhYlj9jhf8iLKqItd5YCy/pp6AwTvmRxvSNdGRr8bw+AQ09xauuC
         aOg4wIrhnSUkmfE//8coPTDi1QWx1XoPJCDGAzhgqSsscpeuoyHZM93lvn+7p+tgkGCi
         tpLceNS3iPxbtrDhEmKVVVO/HGnb84qfctwWpCLdxhnV3eSyXNmGgI264Bg354M5o7g3
         KKqrCyHRhrobvkbroh5XCSw5ojMMTlDPWV22YeF7t3kwE3lpR6pbSAwVAN2wMIvsW1KJ
         aenw==
X-Gm-Message-State: AOAM5307TcEyC4GgLUAmz5c86aiXM/0OKVw8x0dRJJCxgTU1kneIREPD
	tkiVI4TVLaedressSxtb1tk39/tniUM=
X-Google-Smtp-Source: ABdhPJxbTzY7zXsW8PjrsejxN3DPMeW22l0e+skzCHi5HgMf4ECl+/PSNQ7TpHFwniDROzLZHbVUSw==
X-Received: by 2002:a17:906:a01:: with SMTP id w1mr2947033ejf.117.1630658038658;
        Fri, 03 Sep 2021 01:33:58 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 08/11] libxl: Only map legacy PCI IRQs if they are supported
Date: Fri,  3 Sep 2021 11:33:44 +0300
Message-Id: <20210903083347.131786-9-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903083347.131786-1-andr2000@gmail.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Arm's PCI passthrough implementation doesn't support legacy interrupts,
but MSI/MSI-X. This can be the case for other platforms too.
For that reason introduce a new CONFIG_PCI_SUPP_LEGACY_IRQ and add
it to the CFLAGS and compile the relevant code in the toolstack only if
applicable.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
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
index 59f3686fc85e..cd4fea46c3f7 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1434,6 +1434,7 @@ static void pci_add_dm_done(libxl__egc *egc,
         }
     }
     fclose(f);
+#ifndef CONFIG_PCI_SUPP_LEGACY_IRQ
     sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
                                 pci->bus, pci->dev, pci->func);
     f = fopen(sysfs_path, "r");
@@ -1460,6 +1461,7 @@ static void pci_add_dm_done(libxl__egc *egc,
         }
     }
     fclose(f);
+#endif
 
     /* Don't restrict writes to the PCI config space from this VM */
     if (pci->permissive) {
@@ -1471,7 +1473,9 @@ static void pci_add_dm_done(libxl__egc *egc,
         }
     }
 
+#ifndef CONFIG_PCI_SUPP_LEGACY_IRQ
 out_no_irq:
+#endif
     if (!isstubdom) {
         if (pci->rdm_policy == LIBXL_RDM_RESERVE_POLICY_STRICT) {
             flag &= ~XEN_DOMCTL_DEV_RDM_RELAXED;
@@ -1951,7 +1955,9 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
                                      pci->bus, pci->dev, pci->func);
         FILE *f = fopen(sysfs_path, "r");
         unsigned int start = 0, end = 0, flags = 0, size = 0;
+#ifndef CONFIG_PCI_SUPP_LEGACY_IRQ
         int irq = 0;
+#endif
         int i;
 
         if (f == NULL) {
@@ -1983,6 +1989,7 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
         }
         fclose(f);
 skip1:
+#ifndef CONFIG_PCI_SUPP_LEGACY_IRQ
         sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
                                pci->bus, pci->dev, pci->func);
         f = fopen(sysfs_path, "r");
@@ -2001,8 +2008,14 @@ skip1:
             }
         }
         fclose(f);
+#else
+        /* Silence error: label at end of compound statement */
+        ;
+#endif
     }
+#ifndef CONFIG_PCI_SUPP_LEGACY_IRQ
 skip_irq:
+#endif
     rc = 0;
 out_fail:
     pci_remove_detached(egc, prs, rc); /* must be last */
-- 
2.25.1


