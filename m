Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A31E41D446
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199415.353507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGn-00089J-86; Thu, 30 Sep 2021 07:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199415.353507; Thu, 30 Sep 2021 07:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGn-00086d-3W; Thu, 30 Sep 2021 07:14:17 +0000
Received: by outflank-mailman (input) for mailman id 199415;
 Thu, 30 Sep 2021 07:14:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqGl-0004B3-Ag
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:14:15 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e1c1189-8353-42d6-9b1f-c782ada7b6bb;
 Thu, 30 Sep 2021 07:13:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m3so21062150lfu.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:13:37 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id y3sm267835lfh.132.2021.09.30.00.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:13:35 -0700 (PDT)
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
X-Inumbo-ID: 0e1c1189-8353-42d6-9b1f-c782ada7b6bb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7YmzvU66v4oKyYcFR8Qcx6xXzeJU6lQheixQJ2KXwag=;
        b=DPS9owDYe0SrU04Tkqz8pVBaOYEPDHe/1M9uoRWQbJ4fzwucCP0lzxCsleZaVXMjy2
         WAonXBRY6B8YdoUTs5VRCU693cgFzaezS8q6briLup4Tj48PQI+K5skX5J/Sn1IsBGAX
         B00kUojW7vkP/GM6oOAnEKDYRBBHAdyhyExNEZMOc7yGGv5fpG+hhQo3kDVKFZ34xHj1
         zb1lghVJEQP4z6hcLdv2twbzp3p8kPrBaM21XVA0M9ssRK8Zx44U9CwQ3UnGokchlGoH
         2JSCe/e7pa2XJiVkco+vYBV4jDN6BEzfKTaBhoqkw7Kycb+jNR4b/Mw0US0jMKqTbIP1
         KZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7YmzvU66v4oKyYcFR8Qcx6xXzeJU6lQheixQJ2KXwag=;
        b=W+95KdK3XgJ+sOU8ZXvH/DfRHOpT82Tb80wyTTr3IQ2KY9AlKtRaVUCKj8RS7/3fK+
         2mqlXGFm1m2YPcBppJoORNAclg/MFcNjwiERMvYRf1TjZid1EF+DLEQKf3e4kT9OrnrY
         9DxAr0mMR56PkGstjjiKyFrlvZ2E9tp3S04EXXzyyNU1kpqSyywg/XUP9HfJ/u2MW3rb
         ep/fMd5VOilQFJfFAbt5FzfSxe5Iaf/mroBgmBcpHWlfIRJgGV1hL7kDgQLqKMyUBKiO
         /H8Wu6xZmDcZbFkoSx71Es3Wbv010lXBjV5ZAnybF7iZeCVvo5qAMdLG35uA9bf3Sp8x
         i/mg==
X-Gm-Message-State: AOAM531YneY5DMo3Dzpchm5MUC5wHjGi8oncqYEpirWTrhlS9Zp7LL27
	Jhs5Nu3m3ap3kjiH76HHhpls8U4dR8Y=
X-Google-Smtp-Source: ABdhPJzdNWHX6vLA3+VFvxgtFIgKFatKPLdNOnkIiZ8AUSDd7r1CIz1XOK8h44L41T5B42wSG7tgJQ==
X-Received: by 2002:ac2:59c7:: with SMTP id x7mr4391563lfn.662.1632986015644;
        Thu, 30 Sep 2021 00:13:35 -0700 (PDT)
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
Subject: [PATCH v3 08/11] libxl: Only map legacy PCI IRQs if they are supported
Date: Thu, 30 Sep 2021 10:13:23 +0300
Message-Id: <20210930071326.857390-9-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930071326.857390-1-andr2000@gmail.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
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


