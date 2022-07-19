Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C5057A59E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370804.602751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFh-00083t-TX; Tue, 19 Jul 2022 17:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370804.602751; Tue, 19 Jul 2022 17:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFh-000801-K6; Tue, 19 Jul 2022 17:43:21 +0000
Received: by outflank-mailman (input) for mailman id 370804;
 Tue, 19 Jul 2022 17:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6sG=XY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDrFf-00065R-4W
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:43:19 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4614dfb9-078a-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 19:43:18 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id y8so20648513eda.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 10:43:18 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b0072af92fa086sm6903268ejb.32.2022.07.19.10.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:43:16 -0700 (PDT)
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
X-Inumbo-ID: 4614dfb9-078a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NQVKGUXCWq6gwb2au9pJADkwFsbt3FsEYw9qYU1cR14=;
        b=D9S5tYQQeZHWtI9eesc3VZSqYMxyAotVHoWWiJ7yYXf2UlUbz9JY1/YTEO0g6yWeiY
         UCsW4olncR1OY0PPhWMKYCCGmJIGcnv1JXE7Ls4LWcidv9XU1RYDp0ThkNPxN8/GouGj
         all35/LcBjtqVPu2CWxYD1ydAvgOTHOjD9SQ5ekMPVm9o47Lqfp5kyt6YHAaH3u69y73
         CFqNXyJpq+nWoR2SixcgsPVzGesYfFRXnDR9eoKSadi12IwNeJxpfiXd53HaLxUPfpK5
         j/acfgMEh845vECyhcRq4LfK5ADBzdyGyzxBdVEDUlRYE9nKzPWo9lEfhy3HkENZgASF
         gIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NQVKGUXCWq6gwb2au9pJADkwFsbt3FsEYw9qYU1cR14=;
        b=26VWz8Hg/8Iuy/yMBh8FnczxRtPIa7RyCGAE9kpMFc2sVBTaN1dPwJeFo2f1YsP31B
         2gH/LGUt5OmTMcDC/KoF3LjoMMOqGMc2Q6ezUEbnpL94aiJA4Mkp/rXzwL1HKgg8LTeY
         hPlgOX8/prMuk6m97Wf8/oZlatZRFlaXE15lRGxNuxoPSyI8aUWBXfCLhV4Zcq+gZB4J
         XpRbnFWqSSjebpYyepXYXd0rQzvyGlV7vkcqFSCK/L79cn00c8HghX8ZQflMu5bUH/eu
         EWGUWzehNQv5zghIl1xh5Tp+ZG2Ob/EdLzMAZocDMiDkVwZaRUc25QGDac2GGeoeicxs
         r7fA==
X-Gm-Message-State: AJIora8hBUr5mu7XH4+5ibYvVUpiIPQC7elJURy1EjmMhWmcB8bEGrTd
	zVpoYp9H6JRTERveotlgz3T3P9ViZR4+rg==
X-Google-Smtp-Source: AGRyM1vJguGRMwMPFUWXrI9LSVBvRsLUYgXtF2tzmcgsvM+heKS5t0myo4bf5MxMeZPzYYVdvf+WsA==
X-Received: by 2002:a05:6402:3881:b0:43a:691f:8e3b with SMTP id fd1-20020a056402388100b0043a691f8e3bmr45389885edb.217.1658252597458;
        Tue, 19 Jul 2022 10:43:17 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH V7 07/11] vpci/header: emulate PCI_COMMAND register for guests
Date: Tue, 19 Jul 2022 20:42:49 +0300
Message-Id: <20220719174253.541965-8-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719174253.541965-1-olekstysh@gmail.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
guest's view of this will want to be zero initially, the host having set
it to 1 may not easily be overwritten with 0, or else we'd effectively
imply giving the guest control of the bit. Thus, PCI_COMMAND register needs
proper emulation in order to honor host's settings.

There are examples of emulators [1], [2] which already deal with PCI_COMMAND
register emulation and it seems that at most they care about is the only INTx
bit (besides IO/memory enable and bus master which are write through).
It could be because in order to properly emulate the PCI_COMMAND register
we need to know about the whole PCI topology, e.g. if any setting in device's
command register is aligned with the upstream port etc.
This makes me think that because of this complexity others just ignore that.
Neither I think this can easily be done in Xen case.

According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
Device Control" the reset state of the command register is typically 0,
so when assigning a PCI device use 0 as the initial state for the guest's view
of the command register.

For now our emulation only makes sure INTx is set according to the host
requirements, i.e. depending on MSI/MSI-X enabled state.

This implementation and the decision to only emulate INTx bit for now
is based on the previous discussion at [3].

[1] https://github.com/qemu/qemu/blob/master/hw/xen/xen_pt_config_init.c#L310
[2] https://github.com/projectacrn/acrn-hypervisor/blob/master/hypervisor/hw/pci.c#L336
[3] https://patchwork.kernel.org/project/xen-devel/patch/20210903100831.177748-9-andr2000@gmail.com/

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v6:
- fold guest's logic into cmd_write
- implement cmd_read, so we can report emulated INTx state to guests
- introduce header->guest_cmd to hold the emulated state of the
  PCI_COMMAND register for guests
- OT: rebased
- OT: add cf_check specifier to cmd_read()
Since v5:
- add additional check for MSI-X enabled while altering INTX bit
- make sure INTx disabled while guests enable MSI/MSI-X
Since v3:
- gate more code on CONFIG_HAS_MSI
- removed logic for the case when MSI/MSI-X not enabled
---
 xen/drivers/vpci/header.c | 38 +++++++++++++++++++++++++++++++++++++-
 xen/drivers/vpci/msi.c    |  4 ++++
 xen/drivers/vpci/msix.c   |  4 ++++
 xen/include/xen/vpci.h    |  3 +++
 4 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 4e6547a54d..2ce69a63a2 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -443,11 +443,27 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     return 0;
 }
 
+/* TODO: Add proper emulation for all bits of the command register. */
 static void cf_check cmd_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
 {
     uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
 
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        struct vpci_header *header = data;
+
+        header->guest_cmd = cmd;
+#ifdef CONFIG_HAS_PCI_MSI
+        if ( pdev->vpci->msi->enabled || pdev->vpci->msix->enabled )
+            /*
+             * Guest wants to enable INTx, but it can't be enabled
+             * if MSI/MSI-X enabled.
+             */
+            cmd |= PCI_COMMAND_INTX_DISABLE;
+#endif
+    }
+
     /*
      * Let Dom0 play with all the bits directly except for the memory
      * decoding one.
@@ -464,6 +480,19 @@ static void cf_check cmd_write(
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
+static uint32_t cf_check cmd_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
+{
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        struct vpci_header *header = data;
+
+        return header->guest_cmd;
+    }
+
+    return pci_conf_read16(pdev->sbdf, reg);
+}
+
 static void cf_check bar_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
@@ -665,8 +694,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
         return -EOPNOTSUPP;
     }
 
+    /*
+     * According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
+     * Device Control" the reset state of the command register is
+     * typically all 0's, so this is used as initial value for the guests.
+     */
+    ASSERT(header->guest_cmd == 0);
+
     /* Setup a handler for the command register. */
-    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
+    rc = vpci_add_register(pdev->vpci, cmd_read, cmd_write, PCI_COMMAND,
                            2, header);
     if ( rc )
         return rc;
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index d864f740cf..c8c495e2d7 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -70,6 +70,10 @@ static void cf_check control_write(
 
         if ( vpci_msi_arch_enable(msi, pdev, vectors) )
             return;
+
+        /* Make sure guest doesn't enable INTx while enabling MSI. */
+        if ( !is_hardware_domain(pdev->domain) )
+            pci_intx(pdev, false);
     }
     else
         vpci_msi_arch_disable(msi, pdev);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 35cc9280f4..06f84b8b02 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -92,6 +92,10 @@ static void cf_check control_write(
         for ( i = 0; i < msix->max_entries; i++ )
             if ( !msix->entries[i].masked && msix->entries[i].updated )
                 update_entry(&msix->entries[i], pdev, i);
+
+        /* Make sure guest doesn't enable INTx while enabling MSI-X. */
+        if ( !is_hardware_domain(pdev->domain) )
+            pci_intx(pdev, false);
     }
     else if ( !new_enabled && msix->enabled )
     {
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 6332659c4a..1010f68c28 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -87,6 +87,9 @@ struct vpci {
         } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
         /* At most 6 BARS + 1 expansion ROM BAR. */
 
+        /* Guest view of the PCI_COMMAND register. */
+        uint16_t guest_cmd;
+
         /*
          * Store whether the ROM enable bit is set (doesn't imply ROM BAR
          * is mapped into guest p2m) if there's a ROM BAR on the device.
-- 
2.25.1


