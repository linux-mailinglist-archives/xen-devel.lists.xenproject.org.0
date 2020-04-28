Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A41BB691
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 08:31:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTJlW-0000FR-Dn; Tue, 28 Apr 2020 06:30:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wX7d=6M=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jTJkq-0008HL-Uc
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 06:30:04 +0000
X-Inumbo-ID: b1ca9e74-8919-11ea-9887-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1ca9e74-8919-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 06:30:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k13so23235831wrw.7
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 23:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yaK0Tjz4Mh+yIXINkTHSBD8ilpF6Ag6GsRW6Q4ivbTA=;
 b=R5NuyA6+wVEyDRerxt4JF4uR7UXbtDIJQluhU5qdZRUx9wPQijBaoWHuKExJN5wcHQ
 dVVb7NvWWvf+1x2czH+0zGPevI1byLqnHr0MPTULlbp1TmfLkOR7zhSX12CHtxPziZqE
 gIYYkCH2yH67+b14kvapCJJAkntr5shxNmrmXBWoPuyBdwMyFzJ3yTMESUZS+Y0tVk4w
 DTWuCjUR+LEPcrjoz1zyxDLbyWhlSB376x47pXgSXHBY/FF+FiAJhzVWWhXvFZ2IEc+f
 tHNOsxrLpYTCg1pxz6A04Dsg5icQdRwAAw0m5HdjYoYhhxeOJb88DkJS8DbXJXz+Th1F
 xAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yaK0Tjz4Mh+yIXINkTHSBD8ilpF6Ag6GsRW6Q4ivbTA=;
 b=f2Rf9mam1p9kw5Quesark8tiqfc1nUAMeOmxTHBIkKgpr7lF4KqK2SFn3M3KLhYVCv
 t9SwceIwCXfftfWB+aQuwZTtPwBu7rUDDRzB+PB4vvOMQ4xcq5FhgGFACaDKHIqwpzLV
 f/BYL3y5ZNcHk5Fi1P1ji3Sasfe7Mxdf0KVNe7C3CN6gWrW/3c+cM3Rlz2eybx+X1wdy
 9bsFFAsTBRdLsffCnV5yxUtvXKKDk7iCBLwWfGu76pAv/OyRmUWIa+aZJ2tM6s56e7V3
 ADP7TPqQ3WzS2arkYZYC+9cpnzUf7Y1CzD1k3yUSFmBRCYBN/Uo8uAxGYj1VQSjAp5bd
 z2Tg==
X-Gm-Message-State: AGi0PuZZrIho/gmRMHxuWPtJjRBtxlfbSv/UfcsYcQy/rUKBTSGm598e
 PvxZyFsGrZRo7nEulvrG4tM=
X-Google-Smtp-Source: APiQypJu6V8g7t351GQHZKstcuogANA7URIwmgoWma5c7hYJSKzrp8DyniKXjLah1RJeLvvREzjpfw==
X-Received: by 2002:adf:f8c6:: with SMTP id f6mr34233073wrq.276.1588055403438; 
 Mon, 27 Apr 2020 23:30:03 -0700 (PDT)
Received: from localhost.localdomain (public-gprs351065.centertel.pl.
 [37.47.2.154])
 by smtp.gmail.com with ESMTPSA id a205sm2030564wmh.29.2020.04.27.23.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 23:30:02 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] Improve legacy vbios handling
Date: Tue, 28 Apr 2020 06:28:47 +0000
Message-Id: <20200428062847.7764-3-gorbak25@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200428062847.7764-1-gorbak25@gmail.com>
References: <20200428062847.7764-1-gorbak25@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 28 Apr 2020 06:30:43 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: artur@puzio.waw.pl, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, jakub@bartmin.ski,
 marmarek@invisiblethingslab.com, Grzegorz Uriasz <gorbak25@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
---
 hw/xen/xen_pt.c          |  8 +++++--
 hw/xen/xen_pt_graphics.c | 48 +++++++++++++++++++++++++++++++++++++---
 hw/xen/xen_pt_load_rom.c |  2 +-
 3 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index b91082cb8b..ffc3559dd4 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -483,8 +483,12 @@ static int xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
                    i, r->size, r->base_addr, type);
     }
 
-    /* Register expansion ROM address */
-    if (d->rom.base_addr && d->rom.size) {
+    /*
+     * Register expansion ROM address. If we are dealing with a ROM
+     * shadow copy for legacy vga devices then don't bother to map it
+     * as previous code creates a proper shadow copy
+     */
+    if (d->rom.base_addr && d->rom.size && !(is_igd_vga_passthrough(d))) {
         uint32_t bar_data = 0;
 
         /* Re-set BAR reported by OS, otherwise ROM can't be read. */
diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index a3bc7e3921..fe0ef2685c 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -129,7 +129,7 @@ int xen_pt_unregister_vga_regions(XenHostPCIDevice *dev)
     return 0;
 }
 
-static void *get_vgabios(XenPCIPassthroughState *s, int *size,
+static void *get_sysfs_vgabios(XenPCIPassthroughState *s, int *size,
                        XenHostPCIDevice *dev)
 {
     return pci_assign_dev_load_option_rom(&s->dev, size,
@@ -137,6 +137,45 @@ static void *get_vgabios(XenPCIPassthroughState *s, int *size,
                                           dev->dev, dev->func);
 }
 
+static void xen_pt_direct_vbios_copy(XenPCIPassthroughState *s, Error **errp)
+{
+    int fd = -1;
+    void *guest_bios = NULL;
+    void *host_vbios = NULL;
+    /* This is always 32 pages in the real mode reserved region */
+    int bios_size = 32 << XC_PAGE_SHIFT;
+    int vbios_addr = 0xc0000;
+
+    fd = open("/dev/mem", O_RDONLY);
+    if (fd == -1) {
+        error_setg(errp, "Can't open /dev/mem: %s", strerror(errno));
+        return;
+    }
+    host_vbios = mmap(NULL, bios_size,
+            PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, fd, vbios_addr);
+    close(fd);
+
+    if (host_vbios == MAP_FAILED) {
+        error_setg(errp, "Failed to mmap host vbios: %s", strerror(errno));
+        return;
+    }
+
+    memory_region_init_ram(&s->dev.rom, OBJECT(&s->dev),
+            "legacy_vbios.rom", bios_size, &error_abort);
+    guest_bios = memory_region_get_ram_ptr(&s->dev.rom);
+    memcpy(guest_bios, host_vbios, bios_size);
+
+    if (munmap(host_vbios, bios_size) == -1) {
+        XEN_PT_LOG(&s->dev, "Failed to unmap host vbios: %s\n", strerror(errno));
+    }
+
+    cpu_physical_memory_write(vbios_addr, guest_bios, bios_size);
+    memory_region_set_address(&s->dev.rom, vbios_addr);
+    pci_register_bar(&s->dev, PCI_ROM_SLOT, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->dev.rom);
+    s->dev.has_rom = true;
+    XEN_PT_LOG(&s->dev, "Legacy VBIOS registered\n");
+}
+
 /* Refer to Seabios. */
 struct rom_header {
     uint16_t signature;
@@ -179,9 +218,11 @@ void xen_pt_setup_vga(XenPCIPassthroughState *s, XenHostPCIDevice *dev,
         return;
     }
 
-    bios = get_vgabios(s, &bios_size, dev);
+    bios = get_sysfs_vgabios(s, &bios_size, dev);
     if (!bios) {
-        error_setg(errp, "VGA: Can't get VBIOS");
+        XEN_PT_LOG(&s->dev, "Unable to get host VBIOS from sysfs - "
+                            "falling back to a direct copy of memory ranges\n");
+        xen_pt_direct_vbios_copy(s, errp);
         return;
     }
 
@@ -223,6 +264,7 @@ void xen_pt_setup_vga(XenPCIPassthroughState *s, XenHostPCIDevice *dev,
 
     /* Currently we fixed this address as a primary for legacy BIOS. */
     cpu_physical_memory_write(0xc0000, bios, bios_size);
+    XEN_PT_LOG(&s->dev, "Legacy VBIOS registered\n");
 }
 
 uint32_t igd_read_opregion(XenPCIPassthroughState *s)
diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index 9f100dc159..8cd9aa84dc 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -65,7 +65,7 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
         goto close_rom;
     }
 
-    pci_register_bar(dev, PCI_ROM_SLOT, 0, &dev->rom);
+    pci_register_bar(dev, PCI_ROM_SLOT, PCI_BASE_ADDRESS_SPACE_MEMORY, &dev->rom);
     dev->has_rom = true;
     *size = st.st_size;
 close_rom:
-- 
2.26.1


