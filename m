Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343421BD2C4
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 05:05:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTd1k-0002vA-JB; Wed, 29 Apr 2020 03:04:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cw0=6N=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jTd1j-0002um-6S
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 03:04:47 +0000
X-Inumbo-ID: 2b74c630-89c6-11ea-9887-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b74c630-89c6-11ea-9887-bc764e2007e4;
 Wed, 29 Apr 2020 03:04:41 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e26so293207wmk.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 20:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MFxxzEsM5GfOkfgyaKw8Kz24FnJBi9lLjF7uh1T3+yM=;
 b=Ml9H7kdFfKHLrPPnYLICG9djXTuB/GA+1a6LqrTQxGGNkNJxCNdRS2clqs+BPiSaDo
 SyDSYfAFPEVvMLZE53vt6LjJUGrWhyg2uP48+5Sp8JH/PFYvzj47b4hIdShvxZBnCvzt
 d/MHprmO+6eDewWi8n5QAuvcyvODR4vbkp3lFjbCmAr5WpDkeuyk8frileoa4IteY9nl
 63aJmdKg+mGax5YgJy6sQ5P8fsduxB/TCCu0sSM5W6EAyEP9+wr5mzYCYLTrFRWlaPgN
 vegKSMP7+zwJX5Dsx86WJlzPqx2lM0Ue6tru7DS1zb1UpztfuArjUPSTwPkXfGEVRaoA
 Jfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MFxxzEsM5GfOkfgyaKw8Kz24FnJBi9lLjF7uh1T3+yM=;
 b=eWQZPnPjNYQYJ0zbukeSqBCGUpVm3h6A4jt18vBFzuxD9glKCTLewuYghvOIJiMoLv
 5q47DUXIFFWbtM7QfCrq3NuzleE06Aqgjz5Nu3I2oS3s2b6z1m/fr4Uz6lxhiwqQZ/Um
 IKylFjCiI19fBdlkUncdirOmUUcnqeOtFV/kIuBjL0YMooCHShPLfekbhM1DkKqmF2EF
 yJm6oGfMQxaxeaPMl6e/h03WsQQ+pQJkHcqbe0jnB8BX80eZVtJT5h8wEpcVc+JNi/+7
 9ziDK9F7IIlji/dIrHd2Lm+pioHbzjkxaa+jlPfN8cEjV+9HNwB0jkLYAZOcnrIXCBRO
 9z4A==
X-Gm-Message-State: AGi0PuZcNTYqGpmL3Fw2HEdtWNm+rhIDsZJWYjnfi9CegnUtwf/nUw5u
 2WFnZn1uvXKEya8Nhpd2h5I=
X-Google-Smtp-Source: APiQypJ7i6XB4Z4DtGjW0thFBqIHvxddUzWj5q8KwPgw4tknkPlZoRrX8MoglxKZaemp9rCnP0Ki8A==
X-Received: by 2002:a1c:cc1a:: with SMTP id h26mr525239wmb.127.1588129480910; 
 Tue, 28 Apr 2020 20:04:40 -0700 (PDT)
Received: from localhost.localdomain (public-gprs636909.centertel.pl.
 [5.184.31.46])
 by smtp.gmail.com with ESMTPSA id o6sm19713725wrw.63.2020.04.28.20.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 20:04:40 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] Improve legacy vbios handling
Date: Wed, 29 Apr 2020 03:04:09 +0000
Message-Id: <20200429030409.9406-3-gorbak25@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429030409.9406-1-gorbak25@gmail.com>
References: <20200429030409.9406-1-gorbak25@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The current method of getting the vbios is broken - it just isn't working on any device I've tested - the reason
for this is explained in the previous patch. The vbios is polymorphic and getting a proper unmodified copy is
often not possible without reverse engineering the firmware. We don't need an unmodified copy for most purposes -
an unmodified copy is only needed for initializing the bios framebuffer and providing the bios with a corrupted
copy of the rom won't do any damage as the bios will just ignore the rom.

After the i915 driver takes over the vbios is only needed for reading some metadata/configuration stuff etc...
I've tested that not having any kind of vbios in the guest actually works fine but on older generations of IGD
there are some slight hiccups. To maximize compatibility the best approach is to just copy the results of the vbios
execution directly to the guest. It turns out the vbios is always present on an hardcoded memory range in a reserved
memory range from real mode - all we need to do is to memcpy it into the guest.

The following patch does 2 things:
1) When pci_assign_dev_load_option_rom fails to read the vbios from sysfs(this works only when the igd is not the
boot gpu - this is unlikely to happen) it falls back to using /dev/mem to copy the vbios directly to the guest.
Using /dev/mem should be fine as there is more xen specific pci code which also relies on /dev/mem.
2) When dealing with IGD in the more generic code we skip the allocation of the rom resource - the reason for this is to prevent
a malicious guest from modifying the vbios in the host -> this is needed as someone might try to pwn the i915 driver in the host by doing so
(attach igd to guest, guest modifies vbios, the guest is terminated and the idg is reattached to the host, i915 driver in the host uses data from the modified vbios).
This is also needed to not overwrite the proper shadow copy made before.

I've tested this patch and it works fine - the guest isn't complaining about the missing vbios tables and the pci config
space in the guest looks fine.

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


