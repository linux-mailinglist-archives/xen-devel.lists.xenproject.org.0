Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC9415F05
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194143.345923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOII-00054e-S3; Thu, 23 Sep 2021 12:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194143.345923; Thu, 23 Sep 2021 12:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOII-000503-Me; Thu, 23 Sep 2021 12:57:42 +0000
Received: by outflank-mailman (input) for mailman id 194143;
 Thu, 23 Sep 2021 12:57:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOGD-0004it-4L
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:55:33 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b31eb32d-d0f7-4a3d-99f4-de4ecf029500;
 Thu, 23 Sep 2021 12:54:54 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u18so25607498lfd.12
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:54:54 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id l7sm453584lfk.52.2021.09.23.05.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:54:50 -0700 (PDT)
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
X-Inumbo-ID: b31eb32d-d0f7-4a3d-99f4-de4ecf029500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7YmzvU66v4oKyYcFR8Qcx6xXzeJU6lQheixQJ2KXwag=;
        b=UfedQtUeDFQTn+SL64ems4Rn0J9SCZv6TQxUejF3126H4dXW34Fw4o335M+EgmuAVd
         Q+vcH55CqHDM1pXmnjXaPaOVe1VITRUSu5KXOh04yowdL3yGAtoN+5EaxqzzaU6qFi/w
         saapwqv3p3gpPNF+fCgc17fZVTb29xUu2viB7O22AyvNkzeroO4y1c/DDEzVJY32qKv5
         Fcwqf7Upq2oQFzm0tI0xEkjpjRRGSRVhZA2zwNFjvYuVwJwNZQsTsusoXy1tgf0JV05F
         IUgAvoCTNPEoVXx3FTZSPXP2TFvw6GhfjmySjOo5Y1UpfNnXInYqc8q7/HMGpyT+EPfg
         +JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7YmzvU66v4oKyYcFR8Qcx6xXzeJU6lQheixQJ2KXwag=;
        b=59WPZJewSNCCV6sZRSRIj5ycvpfiopsanY2e+JqnDUT7Xfw9cw6b8cX9IIAPo7jb9N
         mpCWc3rjl3lQAwK2PKes8uxQlgdb+P5azrLjgrivgKY9H3QQiR+v1lGFaD7pDxju8zad
         C/54hwEOJTmKDZckEk7s2v48iy3hdZQ2killPSK3VcNu/NhS4KGt8rRLDfEYgtwyXHEY
         g4JzNEMrRNiUoOqoMPeOz4SmuAF3GUMyckRqGFNeYvbA+H3ssyoR9T7/Xe5InvTm+swr
         OirMD/Td1rI+vh00LFZsvi/5UfgsbNu/cKD41PF/j/p/8J7AMGsZ0orQloffAXWYVRq0
         h9sw==
X-Gm-Message-State: AOAM531r2mCtl9ogTa74P9hp8fF74QdUf+aw6IcYfmI9pVfQHNazlN6Q
	s/cY2ptm0CIFVlY9cbzggt8NXD+8mRUM9Q==
X-Google-Smtp-Source: ABdhPJwQFyQoC6ZyqfOZz0jz5BMc2q86hNOrzHCE+sQ7nVhOg/JEVk7PIv0iNGvCwLta+XxiRKvQlw==
X-Received: by 2002:a2e:7f17:: with SMTP id a23mr5074537ljd.133.1632401690450;
        Thu, 23 Sep 2021 05:54:50 -0700 (PDT)
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
Subject: [PATCH v2 08/11] libxl: Only map legacy PCI IRQs if they are supported
Date: Thu, 23 Sep 2021 15:54:35 +0300
Message-Id: <20210923125438.234162-9-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125438.234162-1-andr2000@gmail.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
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


