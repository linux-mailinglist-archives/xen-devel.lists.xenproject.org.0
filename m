Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C045D8B4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230885.399227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCX3-0004kq-7D; Thu, 25 Nov 2021 11:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230885.399227; Thu, 25 Nov 2021 11:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCX2-0004Z0-G1; Thu, 25 Nov 2021 11:03:12 +0000
Received: by outflank-mailman (input) for mailman id 230885;
 Thu, 25 Nov 2021 11:03:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCWy-0001K8-TG
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:03:09 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4587c4b2-4ddf-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 12:03:08 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id z8so11729537ljz.9
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:03:08 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:03:06 -0800 (PST)
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
X-Inumbo-ID: 4587c4b2-4ddf-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v/1hCqpbICaVhImJYbNH1Pzo/XjLvxlkPWIsYcGJ7iE=;
        b=dsQ7fIdBbFEQQs2Kb7aJIZHQf8yS7jdmZpbsZmPLPp+D7gCSFnBnthiYhk1usVP3iJ
         E+V2JEJKVrOee7Q3nN7Yw/eX/axIZ+2aiUWwRx1VTZVi31YlDTtSMTNVqa+n9DdRtG/I
         swcHYM1ITfFItZHRJToOjmUTej2VquSRTl5ERXDfaum/IKjKfEXkrEnZWgjDaH8L4VDf
         BoQ3eUxD2XyEFuasUzNVu6cVgKl5TeNElm1vSaRCJxR/8oUt96kKvjy0HURaDw7v7lym
         RIVLa2CnK5NnCk7WJzHYT52/tdH+fy9TZy1r5MPMrcCay4qaA76sW3vlG21bIKq2iOx/
         5ZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v/1hCqpbICaVhImJYbNH1Pzo/XjLvxlkPWIsYcGJ7iE=;
        b=RjRI40w77MzBmTWENzUrTOxAFQgOfr9lIDS6xf1nEi1sM0CGyrYlpIUp+Fk1RYQ3Ml
         vYOYebtqf+7oZvsJa0ew1IM3kGcJJ7jX0doz2TwT9QFRMu2joVRqc4BEsyaLCdYZmfml
         IBqbrln1mhb6HUqmc4z0SwKeVKThMxb1jJzm381w9+sdxNAx2c2p+bG0oyjNR+HaxWuu
         BCCEgqRB/qiUvYH2QaRsKtXw38nYOt/OKfPoEkO7ZkWeEERfBL/PUBv1udsM9Oy32+YR
         2REFN6nYptPTaYQSbGzXIyHEZKM2MaAx+uNXUj3CzpZ4m/olEp5UWv38SV4521K9KWwj
         qY8w==
X-Gm-Message-State: AOAM531J47EHe7PVPnoGkAFndrW+OsEfAZJVy/J/slwmXfXkU9cgFQ2K
	0CxftU4Ry0lVZ52C+oRK93KkXtFj8R6ekA==
X-Google-Smtp-Source: ABdhPJzS3EW6c2oIc2r405IHk30Ssbig4XaZwvPXuufl47eVPHl5A6F8Pvxh9m5QoqHaFnustCOBYg==
X-Received: by 2002:a05:651c:1035:: with SMTP id w21mr22964089ljm.278.1637838186915;
        Thu, 25 Nov 2021 03:03:06 -0800 (PST)
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
Subject: [PATCH v5 10/14] vpci/header: reset the command register when adding devices
Date: Thu, 25 Nov 2021 13:02:47 +0200
Message-Id: <20211125110251.2877218-11-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reset the command register when passing through a PCI device:
it is possible that when passing through a PCI device its memory
decoding bits in the command register are already set. Thus, a
guest OS may not write to the command register to update memory
decoding, so guest mappings (guest's view of the BARs) are
left not updated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v1:
 - do not write 0 to the command register, but respect host settings.
---
 xen/drivers/vpci/header.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 2e44055946b0..41dda3c43d56 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -491,8 +491,7 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
-static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
-                            uint32_t cmd, void *data)
+static uint32_t emulate_cmd_reg(const struct pci_dev *pdev, uint32_t cmd)
 {
     /* TODO: Add proper emulation for all bits of the command register. */
 
@@ -504,7 +503,13 @@ static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
     }
 #endif
 
-    cmd_write(pdev, reg, cmd, data);
+    return cmd;
+}
+
+static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
+                            uint32_t cmd, void *data)
+{
+    cmd_write(pdev, reg, emulate_cmd_reg(pdev, cmd), data);
 }
 
 static void bar_write(const struct pci_dev *pdev, unsigned int reg,
@@ -678,6 +683,10 @@ static int init_bars(struct pci_dev *pdev)
         return -EOPNOTSUPP;
     }
 
+    /* Reset the command register for the guest. */
+    if ( !is_hwdom )
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, emulate_cmd_reg(pdev, 0));
+
     /* Setup a handler for the command register. */
     rc = vpci_add_register(pdev->vpci, vpci_hw_read16,
                            is_hwdom ? cmd_write : guest_cmd_write,
-- 
2.25.1


