Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE114415F36
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 15:08:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194208.346010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOSm-0003ri-9s; Thu, 23 Sep 2021 13:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194208.346010; Thu, 23 Sep 2021 13:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOSm-0003pI-6M; Thu, 23 Sep 2021 13:08:32 +0000
Received: by outflank-mailman (input) for mailman id 194208;
 Thu, 23 Sep 2021 13:08:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOHz-0004it-87
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:57:23 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dde5d022-867a-48eb-9e7e-8b40d99586ad;
 Thu, 23 Sep 2021 12:55:17 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b15so25738434lfe.7
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:55:17 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id o12sm453010lft.254.2021.09.23.05.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:55:13 -0700 (PDT)
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
X-Inumbo-ID: dde5d022-867a-48eb-9e7e-8b40d99586ad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t+TG3ZsjniyYOn1TjIrSDa/ZTsIEIfPrt6I6dPYbhyk=;
        b=eV8YVH5NC4DmSL4x9/RAgitTwlfCmkQPMgFjPMCQK0n3AeZxwnSn+Udn3ubor53chc
         UEnrd9Smm1404yKVVdaLjy3hOJiWBs7T/rVlalmkXg8d5F1EoxTvtMek+bFqTzq7ufkJ
         Ydn5qa0Q1Oxs7w9E3XPmEQi5d5dBjhmPZfK3TsooOGEDddIb3G3she0IOltWH9l+WSHp
         BoZAPk6yFF9zp3nTpBJacx+xWWVLPo3Lt6e8BYc8qB1gr7SsEU4ljwiOFgqvyHmb9Leo
         VFFmKbTyuoA/iNCivDgXGHSYRXDzRaeZbBxNiOBI6RvCi+2vKVJbQWuifzkPHZXRqUEv
         jw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t+TG3ZsjniyYOn1TjIrSDa/ZTsIEIfPrt6I6dPYbhyk=;
        b=a4/HE7eoZgMpj0aWHKgbDfO6ZtTPItnWKwsbJHvbMH45Q6R0cJlyjXAt+x1R+40x0b
         x59R7FZAfaSfjNbw7QCO5xsCIkOoBBNmei47TleChP1Kvtye2uOy/QykAmKzaKb1DMK5
         JZWdVDJQIb4a/tr6bmRmC/Zg4mOichC8cKiZIpuwKwfQComQbzeP4vq4o7Ax3Fn3oOIu
         IdUHAxe4LO0wl4MV0F+HXFDQT5WeNEntgUlAQ7l2jygd6KkoTYtsE0oDoJ7TFgQzKl+y
         myz5c63ww7C4SgbDcifSbDVNkUJJUdTc4JZ175psdAXDt0rJigyBp9HNwcVAwJ94p3vx
         IDdw==
X-Gm-Message-State: AOAM530xdypUlPNi81Zzfcc264FQKMSX2UEoFBFTVHR/y2k++2zUxPSW
	GNSakt2H/UpebwyaZIRsXK4MeGIOKAVgfA==
X-Google-Smtp-Source: ABdhPJyeEpTK6x6nOoWHlX/qYeM4XHS0Q00/ZB2U8VKbmN/QGEVH32sZonpdDV4deZk47lwatxUBhA==
X-Received: by 2002:a2e:bd03:: with SMTP id n3mr5073432ljq.359.1632401714161;
        Thu, 23 Sep 2021 05:55:14 -0700 (PDT)
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
Subject: [PATCH v2 09/11] vpci/header: Reset the command register when adding devices
Date: Thu, 23 Sep 2021 15:54:59 +0300
Message-Id: <20210923125501.234252-10-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125501.234252-1-andr2000@gmail.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
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
 xen/drivers/vpci/header.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 99f9c37dfb00..b2829b9d206b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -452,8 +452,7 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
-static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
-                            uint32_t cmd, void *data)
+static uint32_t emulate_cmd_reg(const struct pci_dev *pdev, uint32_t cmd)
 {
     /* TODO: Add proper emulation for all bits of the command register. */
 
@@ -468,14 +467,20 @@ static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
             cmd |= PCI_COMMAND_INTX_DISABLE;
         else
         {
-            uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
+            uint16_t current_cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
 
             if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
                 cmd |= PCI_COMMAND_INTX_DISABLE;
         }
     }
 
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
@@ -794,6 +799,10 @@ int vpci_bar_add_handlers(const struct domain *d, const struct pci_dev *pdev)
         gdprintk(XENLOG_ERR,
                  "%pp: failed to add BAR handlers for dom%pd: %d\n",
                  &pdev->sbdf, d, rc);
+
+    /* Reset the command register with respect to host settings. */
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, emulate_cmd_reg(pdev, 0));
+
     return rc;
 }
 
-- 
2.25.1


