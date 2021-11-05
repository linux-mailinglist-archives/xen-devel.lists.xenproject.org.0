Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA4445FB1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:33:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222020.384021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misn7-0001Dg-OB; Fri, 05 Nov 2021 06:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222020.384021; Fri, 05 Nov 2021 06:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misn7-0001AZ-KT; Fri, 05 Nov 2021 06:33:33 +0000
Received: by outflank-mailman (input) for mailman id 222020;
 Fri, 05 Nov 2021 06:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1misn6-0000uf-DE
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:33:32 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b4c8a72-3e02-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 07:33:31 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id g10so29445450edj.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:33:31 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id e12sm3599870ejs.86.2021.11.04.23.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:33:30 -0700 (PDT)
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
X-Inumbo-ID: 4b4c8a72-3e02-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NpxZeW1ob2oJ1OjlMF1HQC/OBJW7HkL+IWHKhX4cdFQ=;
        b=VpF5QomEvz3AkIO6BVmFPxKcI93OQn8rhyLo6uT1gpTKm/Sl2UKZNcBwhrCq3iYt4N
         0he1AifpyHyfLaPdDfkPQz4X9UCSxf5WFJahzUGsrm2XIE6EPPEaYjzTFY1lM/A/NaYW
         nbC7urXradjKl/AEnXLqcHfbjeRiMgN7+V0ktv/qfchhPwBXxLtpkfRigySJ4gOUsGHG
         44Kg62aPnzk8mCQYd3jYJAmEHGQAFXSJI7aH1uNF0gLSS4FUR4ABmWuNE7yeKE9PaUnA
         3Q6IWepGjLAxchz4R8A12nZO5bz9mYre/RZ7rJCdJFoPWd2/R6eKxGTR6KMUFXuZSY6X
         CU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NpxZeW1ob2oJ1OjlMF1HQC/OBJW7HkL+IWHKhX4cdFQ=;
        b=YzULZWg3ZX0c5oR60p7AjG4F4xRPoKhrXlJzSoYE31sBJ4dVy8gPxsgdRH+d92ssNf
         p5bkawlFRkwKVJy0omV9SlQlVfaYUwU7apcUpboGMUuIXm4yygjSFzTx7yOVifGtGQHK
         5S8TlSOCdeUtIYej35hWFBBlQoGh8raPUgUf7owTAnJtlkVrE1WbEY7k/CzBhgbMsjXZ
         Dmmap/+FcSQp/2BSh3eSqQnx+Q5N45UJXlnKQ5wuVROjYd9Kx9QPsa9+9jTnHHijdFo8
         GjlEBior6Z6o0oOUjmdwNhege9AduWhdNutswXojMz2W2hKqXqvI/Eg5BuKwn5hgpsPS
         bV/w==
X-Gm-Message-State: AOAM5307Cj9WKqyQQrF7GoAhtsKwte8DwT5w62InqMq8KUz6dEG45SCt
	pkon8WfoFDtJhddkbuR6mEK73M680PwJBw==
X-Google-Smtp-Source: ABdhPJwiKXxH8CFi6cbmauliu4A8R5NQ6lsQtohPzmA81YwvSXPzM2kcbskCcVp9emt/qAgTee6K7A==
X-Received: by 2002:aa7:cf91:: with SMTP id z17mr55010868edx.193.1636094011048;
        Thu, 04 Nov 2021 23:33:31 -0700 (PDT)
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
Subject: [PATCH v6 1/7] xen/arm: rename DEVICE_PCI to DEVICE_PCI_HOSTBRIDGE
Date: Fri,  5 Nov 2021 08:33:20 +0200
Message-Id: <20211105063326.939843-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105063326.939843-1-andr2000@gmail.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

To better reflect the nature of the device type and not to make any
confusion rename DEVICE_PCI to DEVICE_PCI_HOSTBRIDGE which it
really is.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Suggested-by: Julien Grall <julien@xen.org>

---
New in v6
---
 xen/arch/arm/pci/pci-host-generic.c | 2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  | 2 +-
 xen/arch/arm/pci/pci.c              | 2 +-
 xen/include/asm-arm/device.h        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
index 33457fbe9615..46de6e43cc72 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -32,7 +32,7 @@ static int __init pci_host_generic_probe(struct dt_device_node *dev,
     return pci_host_common_probe(dev, &pci_generic_ecam_ops);
 }
 
-DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI)
+DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
 .dt_match = gen_pci_dt_match,
 .init = pci_host_generic_probe,
 DT_DEVICE_END
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
index 61a9807d3d58..516982bca833 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -49,7 +49,7 @@ static int __init pci_host_generic_probe(struct dt_device_node *dev,
     return pci_host_common_probe(dev, &nwl_pcie_ops);
 }
 
-DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
+DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
 .dt_match = nwl_pcie_dt_match,
 .init = pci_host_generic_probe,
 DT_DEVICE_END
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 082c14e127a8..78b97beaef12 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -46,7 +46,7 @@ static int __init dt_pci_init(void)
 
     dt_for_each_device_node(dt_host, np)
     {
-        rc = device_init(np, DEVICE_PCI, NULL);
+        rc = device_init(np, DEVICE_PCI_HOSTBRIDGE, NULL);
         /*
          * Ignore the following error codes:
          *   - EBADF: Indicate the current device is not a pci device.
diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
index 3782660751b6..086dde13eb6b 100644
--- a/xen/include/asm-arm/device.h
+++ b/xen/include/asm-arm/device.h
@@ -37,7 +37,7 @@ enum device_class
     DEVICE_SERIAL,
     DEVICE_IOMMU,
     DEVICE_GIC,
-    DEVICE_PCI,
+    DEVICE_PCI_HOSTBRIDGE,
     /* Use for error */
     DEVICE_UNKNOWN,
 };
-- 
2.25.1


