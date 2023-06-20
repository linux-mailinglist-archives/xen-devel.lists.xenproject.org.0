Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D7A7372BE
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:26:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552067.861949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7P-0006Id-MN; Tue, 20 Jun 2023 17:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552067.861949; Tue, 20 Jun 2023 17:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7P-0006G4-J5; Tue, 20 Jun 2023 17:26:15 +0000
Received: by outflank-mailman (input) for mailman id 552067;
 Tue, 20 Jun 2023 17:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7O-0004q1-DZ
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:14 +0000
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [2607:f8b0:4864:20::112c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d435b48-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:26:12 +0200 (CEST)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-56fff21c2ebso53778057b3.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:12 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:10 -0700 (PDT)
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
X-Inumbo-ID: 8d435b48-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281971; x=1689873971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re4sewoUiAJAV4/kgcnlDrxKrE2Fa0zI8YeYhG23N0Y=;
        b=DfdES6JEvCQWTQ1WFDll4cGS97nAixB6PRsd09O5iFOLxZco6PKhbfyAEFkZAWyakT
         gCJzPrYhpd7a1DMuixAnPGnTmdPOTVwMM5rMfcTE2WmPXGz7o5UvRBvEZ0GteR42PRC2
         lVCvO5GXFsYJItGC1Q2scC7ydoOZ9VTsDqbOD9BN/OuN69tnXeoy0DIkIAtRXjuaqzjN
         013Eyyc3Oa4qordF985hTPAqy6uANH1i3Y6hPcC3nXertqQVA1BtmbjxNxMz81vSwaRD
         mIGdmNWqNoB5viq56p08Y7WwZY97IlnzgnqgCVOHaYsed6TmrP6sl/ttsrXBy3RlJ9hZ
         116w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281971; x=1689873971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=re4sewoUiAJAV4/kgcnlDrxKrE2Fa0zI8YeYhG23N0Y=;
        b=cCJuS6cyNVXVAQEyPO3EFys1Gn59wOiduatSx6PaRrPOWtAqkb+JznZURK4ouj10Bn
         DgyJFOi8q1HTt1DmKncEJ55A/FS1W4atrpiDfek0IMm+aoHZj7bvtrySzhAuS8UP2dG2
         miAFOpKmfxcYpsuZkHgDIhNfZFSNtgOim9pv/8Q3SkGOOykAFnMTcmrqnp3MchNIqnuA
         YSlYi+LRrvv5NSllUD/N7DY5ilPDH+LWlDAP8A5rhYleKi9YuhC4/WmPfzgFnFojJBq1
         BFkfONE5/cm/VEzjtpwSBwFknIp2VM2Oyah4JZiTp3/4FBduZVJIvLpdLWqYTqgfUO9r
         K2xw==
X-Gm-Message-State: AC+VfDwD48ND9gfINhSqwJEiKX+JP00obi2xy3pq7acty8rBuNyFeF3p
	tEfvkkDonf8lBKG8/C068e4=
X-Google-Smtp-Source: ACHHUZ7xi/MCe/ilteffhPiFjo95RMXHLzj+R6XW+7HT26RsjzlIhW2AGxlvpmO2zHaQ7cawV/D/bg==
X-Received: by 2002:a81:c213:0:b0:56c:ea52:a9fc with SMTP id z19-20020a81c213000000b0056cea52a9fcmr13911538ywc.12.1687281971388;
        Tue, 20 Jun 2023 10:26:11 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 08/23] xen/pt: determine the legacy/PCIe mode for a passed through device
Date: Tue, 20 Jun 2023 13:24:42 -0400
Message-Id: <c8948ca5513efd77d29c182dfdbaa35aa47f21a8.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even if we have some real PCIe device being passed through to a guest,
there are situations when we cannot use its PCIe features, primarily
allowing to access extended (>256) config space.

Basically, we can allow reading PCIe extended config space only if both
the device and emulated system are PCIe-capable. So it's a combination
of checks:
- PCI Express capability presence
- pci_is_express(device)
- pci_bus_is_express(device bus)

The AND-product of these checks is stored to pcie_enabled_dev flag
in XenPCIPassthroughState for later use in functions like
xen_pt_pci_config_access_check.

This way we get consistent behavior when the same PCIe device being passed
through to either i440 domain or Q35 one.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen_pt.c | 28 ++++++++++++++++++++++++++--
 hw/xen/xen_pt.h |  1 +
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index a540149639..65c5516ef4 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -701,6 +701,21 @@ static const MemoryListener xen_pt_io_listener = {
     .priority = 10,
 };
 
+static inline bool xen_pt_dev_is_pcie_mode(PCIDevice *d)
+{
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(d);
+    PCIBus *bus = pci_get_bus(d);
+
+    if (bus != NULL) {
+        if (pci_is_express(d) && pci_bus_is_express(bus) &&
+            xen_host_pci_find_next_cap(&s->real_device, 0, PCI_CAP_ID_EXP)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 /* destroy. */
 static void xen_pt_destroy(PCIDevice *d) {
 
@@ -787,8 +802,17 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
                    s->real_device.dev, s->real_device.func);
     }
 
-    /* Initialize virtualized PCI configuration (Extended 256 Bytes) */
-    memset(d->config, 0, PCI_CONFIG_SPACE_SIZE);
+    s->pcie_enabled_dev = xen_pt_dev_is_pcie_mode(d);
+    if (s->pcie_enabled_dev) {
+        XEN_PT_LOG(d, "Host device %04x:%02x:%02x.%d passed thru "
+                   "in PCIe mode\n", s->real_device.domain,
+                    s->real_device.bus, s->real_device.dev,
+                    s->real_device.func);
+    }
+
+    /* Initialize virtualized PCI configuration space (256/4K bytes) */
+    memset(d->config, 0, pci_is_express(d) ? PCIE_CONFIG_SPACE_SIZE
+                                           : PCI_CONFIG_SPACE_SIZE);
 
     s->memory_listener = xen_pt_memory_listener;
     s->io_listener = xen_pt_io_listener;
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index b20744f7c7..1c9cd6b615 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -234,6 +234,7 @@ struct XenPCIPassthroughState {
 
     PCIHostDeviceAddress hostaddr;
     bool is_virtfn;
+    bool pcie_enabled_dev;
     bool permissive;
     bool permissive_warned;
     XenHostPCIDevice real_device;
-- 
2.34.1


