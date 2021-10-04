Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA47421120
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201485.356051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhx-00040Z-EO; Mon, 04 Oct 2021 14:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201485.356051; Mon, 04 Oct 2021 14:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhx-0003xS-9C; Mon, 04 Oct 2021 14:12:45 +0000
Received: by outflank-mailman (input) for mailman id 201485;
 Mon, 04 Oct 2021 14:12:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Qt=OY=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mXOhv-0008QG-ET
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:12:43 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 184555a2-32a8-4530-a7e4-70f36408f919;
 Mon, 04 Oct 2021 14:12:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j5so67294813lfg.8
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 07:12:09 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id n12sm1076809lfe.145.2021.10.04.07.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:12:04 -0700 (PDT)
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
X-Inumbo-ID: 184555a2-32a8-4530-a7e4-70f36408f919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WtoV9kcozcsPgkYbTZ9sQ3MmnsSfH8oWiuIZRPzZ8Ac=;
        b=AZ+cyo6GcrFP4hY/gE6hDkzOR9T02GILiuinadnUzET4hfCR1Srfx/E6RgvAfWIsa9
         bOBBw36L/JXpoXRYFTZfST5OU9O/ZvWkROEQV1EDN9Fg5Hh0qKTUgclN/86LumqYrGh+
         d8oJZUnRALtfC/3d9KlBg9W0gofCLJtG/e94oiI2xezAxfCFME0HLP0IGsEjZ4qqU5O0
         xo6c5yOSz8p9zKMK39OwMYQ7KerZe0xpGbLWH0dJFmyqPOLDnbh1h9Yvj7EkkcIydy0b
         zzVpfDeq15pPw2oVD9CMCHKz7qG4zlF1QBSUu8vKTUMukFUoqL+JL30pEka2uvB8161b
         87fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WtoV9kcozcsPgkYbTZ9sQ3MmnsSfH8oWiuIZRPzZ8Ac=;
        b=g76AWiFkunYJpGkh9LvTH2CM+ICema9Q/9bdXuqmiicfGkHs+YaGAyURDFMnY8peqp
         IvwD1Zmko30jBQM5KJU2acIWHfESy/SPBel+hAEHW0KehaVbcfWfi4NEgodjXMCPrK1N
         de5MzRIJ3TxoJ9/ZkzMR6e6HHbQfPyrq9Q4pPiTVUo4Mi3oNFgaijHF2ROLl+DedFe1y
         D3Ptqn79UgDnd7EuR+H3BA3wR+DgWMY98fREu4UheRIHBA3yH3HR4Yg3BvuMZ3yVRVMC
         ovYr5fMd7+IdZ+iKKujInT+dhBJmEJFnl0kVM7XU6Wk0hiJB4ZVhtEuwewrKl9KAVFUa
         vRRA==
X-Gm-Message-State: AOAM532LzBWOCwRO0Tqru80vBtfRNMqZ+Quv8hafIozh2Ii5BGn4DLwz
	TDNCWCWN87GfH+B+oj6dc2sfD0g6arQvGw==
X-Google-Smtp-Source: ABdhPJx7yYnDt/IPOUn/fYX+ZAr0w8Wz5KXnxNDbO6A4Jyp69+rQKY5NEvMdRFUBepGVdWzeBMqIUg==
X-Received: by 2002:a05:6512:1053:: with SMTP id c19mr14669899lfb.283.1633356725200;
        Mon, 04 Oct 2021 07:12:05 -0700 (PDT)
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
Subject: [PATCH v4 08/11] libxl: Only map legacy PCI IRQs if they are supported
Date: Mon,  4 Oct 2021 17:11:48 +0300
Message-Id: <20211004141151.132231-9-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004141151.132231-1-andr2000@gmail.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Arm's PCI passthrough implementation doesn't support legacy interrupts,
but MSI/MSI-X. This can be the case for other platforms too.
For that reason introduce a new CONFIG_PCI_SUPP_LEGACY_IRQ and add
it to the CFLAGS and compile the relevant code in the toolstack only if
applicable.

Cc: Ian Jackson <iwj@xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


