Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CF3310CDC
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 16:04:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81768.151191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l82eD-0004RW-9p; Fri, 05 Feb 2021 15:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81768.151191; Fri, 05 Feb 2021 15:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l82eD-0004R9-6W; Fri, 05 Feb 2021 15:03:49 +0000
Received: by outflank-mailman (input) for mailman id 81768;
 Fri, 05 Feb 2021 15:03:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=su6d=HH=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1l82eB-0004R4-Bh
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:03:47 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 13bb7c49-3fa4-4db7-a68f-67fc66518788;
 Fri, 05 Feb 2021 15:03:45 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-rMDRYlE6M6ineWQIZ6CPWw-1; Fri, 05 Feb 2021 10:03:40 -0500
Received: by mail-ej1-f72.google.com with SMTP id k3so6985835ejr.16
 for <xen-devel@lists.xenproject.org>; Fri, 05 Feb 2021 07:03:40 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id d5sm4104521edu.12.2021.02.05.07.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:03:37 -0800 (PST)
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
X-Inumbo-ID: 13bb7c49-3fa4-4db7-a68f-67fc66518788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612537424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zwMMO/GhT5P4qg6F1lADPTp5N9LNgrC5HBBNpAooZ60=;
	b=JMm3/v6hHQmW9FqmN1XFAIVzCKyoLAt/YOZKbvuW2LAvubDuiZj+hVF7m0i+EGFhKyp7PA
	UWLH/z1/N49N+R1ZDkR3Jl1ilUEaF0SVr4VthyXIaVI+aYcT6/VHqgawiSr/O6nJD4DEBK
	Q9XJJwZC1xKgQdYDS2p0VlVDh2ex15Q=
X-MC-Unique: rMDRYlE6M6ineWQIZ6CPWw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zwMMO/GhT5P4qg6F1lADPTp5N9LNgrC5HBBNpAooZ60=;
        b=eAnTf+msp/DZijAjpP+UIhMC8YrsyESxsyBDDQPPkOGlzAljmMefaHitsbcVdGzz5i
         pNau5Zl5OOpKjRifSuEI0x88joGIEgx4k6owasfxtlR+aov+86VICY/PO7aafIxXU1GV
         AofpHWw0lP4d+6lUIWfSUM4nYviQ3vOGDsym5XrhZAYnvCTAukXq0Jsjp9XXmBDaViUu
         qZtCMk7q0Ua4qh48b1y69/LO3mUVj1lp4mGts2CA/chTffooFZRvBflx3ldBKCxClDfa
         QUcV312jNVRtgwHun3e8aU6tHHAqfw06HVDVUtytsYqQ72FOyXGwf/BnYc+1O3a/jeEA
         8esg==
X-Gm-Message-State: AOAM5325bOKOKEHewiY2cP0pMv3fU2iZ8RzoBykDaD2QV5a0/hnJLF3u
	RfHyGKKou0GBw/JJGoAzJKmKte3NQUl872vKiEx1kZQdMgBr1kAwnK374MlvMki7leSwH4MXZmU
	aVHyak1F++beY+u3iMe+hmWUP6OY=
X-Received: by 2002:a17:907:98c3:: with SMTP id kd3mr4449968ejc.482.1612537419224;
        Fri, 05 Feb 2021 07:03:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyszPIeKkwa+10z8LK7e/ZhS/mQJGnrOXUtz/rjTwb1tdREvjR9aq3yiXVn0vxPl25KHrANHw==
X-Received: by 2002:a17:907:98c3:: with SMTP id kd3mr4449818ejc.482.1612537417767;
        Fri, 05 Feb 2021 07:03:37 -0800 (PST)
Date: Fri, 5 Feb 2021 10:03:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	David Edmondson <david.edmondson@oracle.com>,
	Laszlo Ersek <lersek@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: [PULL v2 02/16] pci: add romsize property
Message-ID: <20210205150135.94643-3-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Paolo Bonzini <pbonzini@redhat.com>

This property can be useful for distros to set up known-good ROM sizes for
migration purposes.  The VM will fail to start if the ROM is too large,
and migration compatibility will not be broken if the ROM is too small.

Note that even though romsize is a uint32_t, it has to be between 1
(because empty ROM files are not accepted, and romsize must be greater
than the file) and 2^31 (because values above are not powers of two and
are rejected).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20201218182736.1634344-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210203131828.156467-3-pbonzini@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Acked-by: Laszlo Ersek <lersek@redhat.com>
---
 include/hw/pci/pci.h     |  1 +
 hw/pci/pci.c             | 19 +++++++++++++++++--
 hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 66db08462f..1bc231480f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -344,6 +344,7 @@ struct PCIDevice {
 
     /* Location of option rom */
     char *romfile;
+    uint32_t romsize;
     bool has_rom;
     MemoryRegion rom;
     uint32_t rom_bar;
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 58560c044d..a9ebef8a35 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -69,6 +69,7 @@ static void pcibus_reset(BusState *qbus);
 static Property pci_props[] = {
     DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
     DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
+    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
     DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
     DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
                     QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
@@ -2084,6 +2085,11 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     bool is_default_rom;
     uint16_t class_id;
 
+    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
+        error_setg(errp, "ROM size %u is not a power of two", pci_dev->romsize);
+        return;
+    }
+
     /* initialize cap_present for pci_is_express() and pci_config_size(),
      * Note that hybrid PCIs are not set automatically and need to manage
      * QEMU_PCI_CAP_EXPRESS manually */
@@ -2349,7 +2355,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         g_free(path);
         return;
     }
-    size = pow2ceil(size);
+    if (pdev->romsize != -1) {
+        if (size > pdev->romsize) {
+            error_setg(errp, "romfile \"%s\" (%u bytes) is too large for ROM size %u",
+                       pdev->romfile, (uint32_t)size, pdev->romsize);
+            g_free(path);
+            return;
+        }
+    } else {
+        pdev->romsize = pow2ceil(size);
+    }
 
     vmsd = qdev_get_vmsd(DEVICE(pdev));
 
@@ -2359,7 +2374,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
     }
     pdev->has_rom = true;
-    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, size, &error_fatal);
+    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
     ptr = memory_region_get_ram_ptr(&pdev->rom);
     if (load_image_size(path, ptr, size) < 0) {
         error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index a50a80837e..03422a8a71 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -53,10 +53,20 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
     }
     fseek(fp, 0, SEEK_SET);
 
+    if (dev->romsize != -1) {
+        if (st.st_size > dev->romsize) {
+            error_report("ROM BAR \"%s\" (%ld bytes) is too large for ROM size %u",
+                         rom_file, (long) st.st_size, dev->romsize);
+            goto close_rom;
+        }
+    } else {
+        dev->romsize = st.st_size;
+    }
+
     snprintf(name, sizeof(name), "%s.rom", object_get_typename(owner));
-    memory_region_init_ram(&dev->rom, owner, name, st.st_size, &error_abort);
+    memory_region_init_ram(&dev->rom, owner, name, dev->romsize, &error_abort);
     ptr = memory_region_get_ram_ptr(&dev->rom);
-    memset(ptr, 0xff, st.st_size);
+    memset(ptr, 0xff, dev->romsize);
 
     if (!fread(ptr, 1, st.st_size, fp)) {
         error_report("pci-assign: Cannot read from host %s", rom_file);
-- 
MST


