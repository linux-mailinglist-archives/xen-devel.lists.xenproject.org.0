Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900F541D4D4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199521.353695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqsT-0005bA-JI; Thu, 30 Sep 2021 07:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199521.353695; Thu, 30 Sep 2021 07:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqsT-0005Wt-Ep; Thu, 30 Sep 2021 07:53:13 +0000
Received: by outflank-mailman (input) for mailman id 199521;
 Thu, 30 Sep 2021 07:53:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqsS-00017f-6C
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:53:12 +0000
Received: from mail-lf1-x12c.google.com (unknown [2a00:1450:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b5aaab3-e57d-4343-9b5c-247ec58c3a4c;
 Thu, 30 Sep 2021 07:52:34 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id j5so16804013lfg.8
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:52:34 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id 13sm251099ljf.51.2021.09.30.00.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:52:32 -0700 (PDT)
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
X-Inumbo-ID: 9b5aaab3-e57d-4343-9b5c-247ec58c3a4c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OR+8PvgVFP8pLzhFaQ6RjiWWTesnzHH/8qQE78jWNGs=;
        b=h6yENr4JdtnEf1wnG93DzqvZpXcFLZuU/1n0d6/YtV6R/vfnAzlRk88b3OdwgWTGhv
         IInWBJMeO4gdxQHRrESr85YYKjh60ND9+7IeV680A5/04pP2uAvMtNtSXoR1CpWWVhBj
         udqAiXOK/yIn2GDG8DVJ9J4/NDo+zQU18k6LOP++b/03/Bk5tsVOK2LghgJBrqM4ktmS
         IVFAFFPSAhmWHpLrF/GPFBiIDvne2z26lgVMN542h3uSRpSvkELVtq/IuXBPn8ndYKm7
         /95BPB/BGwq574gch5vj3+XDhH22/QPCchQL1UWhBWjU+KjiACBU6bHJmWOWf/J7CsQK
         oEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OR+8PvgVFP8pLzhFaQ6RjiWWTesnzHH/8qQE78jWNGs=;
        b=ga4IY3PqtAiqUaJfqNGsZnT5frsVlxscfrZHnuSpXdNTRom8bx611UrSS6BpLsioLo
         SUhWCxCUwnGhYnyh59XhWEafdauQOLEtlbLJGfenF8Knz4ybAAB++i8F/pVHs2e46zHC
         WcvcWEGydpOOrSI2pKst27c0YGlApLo+OwIUg02IpY+0WgPuUkiuhuvtRibs2qVO4AAi
         BeugOlYemxY0bxWMmGDBxDkHuOjeEw5tqvOed450JW1FZkmAbgTVlGMty4CtCN/zSied
         f/78JbTDB70hH8lU1HccYsWEGcsM3Ik86xRidbMs1odc8iyEVsryy5RboCChsVG+xTsX
         Z4Vw==
X-Gm-Message-State: AOAM530LeGu8010FXSg24ogihVtuOwGKLpyWlmu4WPxG9Zg/4kXUuAWW
	WaoajmY1OeVDw3IIHn1crgkCliAvW6A=
X-Google-Smtp-Source: ABdhPJwJzt7joepxqpjEuultT1xkb7pTstL7l3EASTsUuwntiXFMaEoCuRVVohr5ZAIfI4WqJIiFfQ==
X-Received: by 2002:ac2:5c50:: with SMTP id s16mr99079lfp.605.1632988353306;
        Thu, 30 Sep 2021 00:52:33 -0700 (PDT)
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
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Michal Orzel <michal.orzel@arm.com>
Subject: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for guests
Date: Thu, 30 Sep 2021 10:52:20 +0300
Message-Id: <20210930075223.860329-9-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930075223.860329-1-andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add basic emulation support for guests. At the moment only emulate
PCI_COMMAND_INTX_DISABLE bit, the rest is not emulated yet and left
as TODO.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@arm.com>
---
New in v2
---
 xen/drivers/vpci/header.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index f23c956cde6c..754aeb5a584f 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -451,6 +451,32 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
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
@@ -598,9 +624,12 @@ static int add_bar_handlers(const struct pci_dev *pdev, bool is_hwdom)
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


