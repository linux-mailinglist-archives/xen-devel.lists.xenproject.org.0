Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CBC445FE6
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222094.384205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9a-0002Q4-TX; Fri, 05 Nov 2021 06:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222094.384205; Fri, 05 Nov 2021 06:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9a-0002K5-K7; Fri, 05 Nov 2021 06:56:46 +0000
Received: by outflank-mailman (input) for mailman id 222094;
 Fri, 05 Nov 2021 06:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mit9Y-0008NQ-49
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:56:44 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88d4f31b-3e05-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 07:56:43 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id b15so10472327edd.7
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:56:43 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm3735150ejb.27.2021.11.04.23.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:56:42 -0700 (PDT)
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
X-Inumbo-ID: 88d4f31b-3e05-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f+1sZF7ROamhznPmSSkwy1b94iIH1O5NvYMBmRXBAH8=;
        b=A2TDKmeWGL2QFwTzv8KDdpoYv2eJE6NeCgA7AVx1l6oYPcqGOyG28ee0T4YGHbwTmY
         5Lxfgyn7gO6AjCLLcWNAVOgS4y34NOACvl0IGfGnW2uW9wCbAUtLH+XkO/7wCiI2sM3Q
         nO+XzRkBs0mq7Lv4TuegSkQACn7rOI3Odu61EnNiQi/AfEoXf5yR70Lyx+XuBU8GTPVq
         lzJpEwS7erjnemiMGTjBJvBgE+ixpjo/VS+l6ngpTp2bfvwwIuQAqrrzwVlru23wi1t6
         aclcSAHLHG1ZVsqPHVIvPDqM/SiXoHYrlo4jDJdn+x/fsG5tz/SteTSsjH8ErUJMgah7
         iXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f+1sZF7ROamhznPmSSkwy1b94iIH1O5NvYMBmRXBAH8=;
        b=lI1sRInMZoxFufHmtTXXuhK9LSv9cKDmV/nfEjo9BuUqqqN0r/y45HObNmDYa67yWS
         Gcl849dWENP1gNPTvb4xC20D+AgsXwfOaJxkIgHtAEj6EAN1j1crE9SAXgV4RSlDtGni
         bdUVhRSICDsf3eA5tuGCaO7DzXrxZWmAL9/eCSJgjRykttNUv9VaV2NFKTtpp5jvKQlZ
         iWO+IG48V3KXShnJlq5t03nnofxJe8nvdQUt4GU0dFvNkYO3qoTJLVLM+Z0VxxFIyoDl
         xGK1gwnMsKi1rxica2a2Uf3M061Zf/F2nqiS5Aw7eBvV2kNaOaTrohhD4G8pT2s1obOm
         jdfw==
X-Gm-Message-State: AOAM530GMkr6DgvllKNPUUmYKCosyBpVW7eoxqeUPRFTDt6VIZw2CU1L
	3B3pFcRHChQJY95cq/NaPrN9yNbL4f9y1A==
X-Google-Smtp-Source: ABdhPJwSvyYC+lehQ6glU0T9q9cBKvQJaw1rh4jciNd34Vt0gDz8IkOSukIGAv03A6mROto6h+7HKA==
X-Received: by 2002:aa7:c1c6:: with SMTP id d6mr35817680edp.203.1636095402813;
        Thu, 04 Nov 2021 23:56:42 -0700 (PDT)
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
Subject: [PATCH v4 09/11] vpci/header: reset the command register when adding devices
Date: Fri,  5 Nov 2021 08:56:27 +0200
Message-Id: <20211105065629.940943-10-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105065629.940943-1-andr2000@gmail.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
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
index 64cfc268c341..680319b3a63f 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -459,8 +459,7 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
-static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
-                            uint32_t cmd, void *data)
+static uint32_t emulate_cmd_reg(const struct pci_dev *pdev, uint32_t cmd)
 {
     /* TODO: Add proper emulation for all bits of the command register. */
 
@@ -472,7 +471,13 @@ static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
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
@@ -646,6 +651,10 @@ static int init_bars(struct pci_dev *pdev)
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


