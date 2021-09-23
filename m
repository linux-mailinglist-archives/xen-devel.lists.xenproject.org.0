Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AB4415F2F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 15:07:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194181.345988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTORj-0002bT-Ne; Thu, 23 Sep 2021 13:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194181.345988; Thu, 23 Sep 2021 13:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTORj-0002YO-Kl; Thu, 23 Sep 2021 13:07:27 +0000
Received: by outflank-mailman (input) for mailman id 194181;
 Thu, 23 Sep 2021 13:07:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOHp-0004it-7d
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:57:13 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af9177de-3a8d-49c1-bd4a-675a79d72820;
 Thu, 23 Sep 2021 12:55:14 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g41so26148978lfv.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:55:14 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id o12sm453010lft.254.2021.09.23.05.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:55:12 -0700 (PDT)
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
X-Inumbo-ID: af9177de-3a8d-49c1-bd4a-675a79d72820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fpEmkp363zGTNG/sREpOTD2+RNFlDcJmlTvIa8Vah1w=;
        b=bpnFyr4vGY6stFAtsMo9qX7ZkqJW7256vkP2otZyANDs5R1Qyh53a03oaQJiIO9Tfi
         VADZFcegMz3d43HptXQRRBCE9Gxx0vMyS8AniNFVc6xLaJS/vx7Kr/+07sfBFJGV6Xpy
         LWMfQ+PUwmyqY1X4GEDMUqma1EjVbZWsOyffYXaXWsC3eFY2Q3Tjq5sZYjCYc7l44EbK
         +BEtyp5dq7r4QF+GRr9FVsKAJNxYFta58KVMQ46xAP7fQOZS6a7hNPN2rK1zMl8tkN0i
         jQnXs/gd5/oBSDCzcsb/stq18qcDugzMPAdsbGVksToFDkWLkYEExgyQFAkWHJhxMcTk
         0iYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fpEmkp363zGTNG/sREpOTD2+RNFlDcJmlTvIa8Vah1w=;
        b=XNnh9CH91uvB4PJSWypfv+a04zGMlc4T0gpFr0UW/wldx8mHS8w+AfqnBoNeEld63T
         FkMAWn85cOS+DWTIt/qDxow0sTpgNhiNo1ISDEyDaugaJIDn5iQQYEZhr55tR9ASs6X0
         YHYKxYgiIky21a+m90TD+uwgD0ZP/fcn5c/94Ff+ipXGvsiTasr+p15aq+E+A7AbaNtd
         WQ5OjQE37XOAyDcKzvvCjCbHzhFshhHDfsw+IAoWOpiaH3H2GWo+SGm4rX92idwe+fEn
         Ad60xkX8w5NC4lrVrVUwgmgecjVWElRnVd2BzQRFjDEbKyM5kzvaXrn9oM8KKPgIz2R9
         Z0vw==
X-Gm-Message-State: AOAM533t8YI7tTjNk9C3SUk3nz/tlb3MMoGhftBhiAuFhRKfAYti2fex
	DzEdRyooIXWUDc8uKlfJWcbMqWmt9HcHiQ==
X-Google-Smtp-Source: ABdhPJzdYDxTei6IVbz6wkAAT9SIcXwlU/2hhWG9paV9ZKyig0hoON0I5dQvzIu3rLdWmGK1j+rN+w==
X-Received: by 2002:a05:6512:32c6:: with SMTP id f6mr3953415lfg.503.1632401713136;
        Thu, 23 Sep 2021 05:55:13 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 08/11] vpci/header: Emulate PCI_COMMAND register for guests
Date: Thu, 23 Sep 2021 15:54:58 +0300
Message-Id: <20210923125501.234252-9-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125501.234252-1-andr2000@gmail.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add basic emulation support for guests. At the moment only emulate
PCI_COMMAND_INTX_DISABLE bit, the rest is not emulated yet and left
as TODO.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
New in v2
---
 xen/drivers/vpci/header.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index bdd18599b205..99f9c37dfb00 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -452,6 +452,32 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
+static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
+                            uint32_t cmd, void *data)
+{
+    /* TODO: Add proper emulation for all bits of the command register. */
+
+    if ( (cmd & PCI_COMMAND_INTX_DISABLE) == 0 )
+    {
+        /*
+         * Guest wants to enable INTx. It can't be enabled if:
+         *  - host has INTx disabled
+         *  - MSI/MSI-X enabled
+         */
+        if ( pdev->vpci->msi->enabled )
+            cmd |= PCI_COMMAND_INTX_DISABLE;
+        else
+        {
+            uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
+
+            if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
+                cmd |= PCI_COMMAND_INTX_DISABLE;
+        }
+    }
+
+    cmd_write(pdev, reg, cmd, data);
+}
+
 static void bar_write(const struct pci_dev *pdev, unsigned int reg,
                       uint32_t val, void *data)
 {
@@ -599,9 +625,12 @@ static int add_bar_handlers(const struct pci_dev *pdev, bool is_hwdom)
     struct vpci_bar *bars = header->bars;
     int rc;
 
-    /* Setup a handler for the command register: same for hwdom and guests. */
-    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
-                           2, header);
+    if ( is_hwdom )
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write,
+                               PCI_COMMAND, 2, header);
+    else
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read16, guest_cmd_write,
+                               PCI_COMMAND, 2, header);
     if ( rc )
         return rc;
 
-- 
2.25.1


