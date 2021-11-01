Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B3E442449
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 00:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219607.380465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhgz3-0004qp-CM; Mon, 01 Nov 2021 23:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219607.380465; Mon, 01 Nov 2021 23:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhgz3-0004nu-9C; Mon, 01 Nov 2021 23:44:57 +0000
Received: by outflank-mailman (input) for mailman id 219607;
 Mon, 01 Nov 2021 23:44:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y+Wa=PU=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1mhgz1-0004nk-AV
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 23:44:55 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c4a7ba2a-9e80-492e-8fb3-c93c84997b9e;
 Mon, 01 Nov 2021 23:44:53 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-OOTu8dxFPXOK1VhXYfJ1ag-1; Mon, 01 Nov 2021 19:44:52 -0400
Received: by mail-ed1-f71.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so17058636edv.10
 for <xen-devel@lists.xenproject.org>; Mon, 01 Nov 2021 16:44:52 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id s4sm1603180edd.32.2021.11.01.16.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:44:50 -0700 (PDT)
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
X-Inumbo-ID: c4a7ba2a-9e80-492e-8fb3-c93c84997b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635810293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hQpOeuAFUR/YU+yLEEiQzjlSsfEbb0a1M35err53O2c=;
	b=OGYpZqdBuNXsmxiGgdvXdch14ocsrFIcHHVcklpqDlzrI5elMmodkVSXsNcftYNCxX7hu4
	8UDRUUZIt2Rqdsp6V13ivOFTyMjwlNVptI6JoHjjHFO6v84BS/unbJJb79w0pG//nKS/kM
	X0an77UMXMXx/Tbi79GdpAroSQmQg0s=
X-MC-Unique: OOTu8dxFPXOK1VhXYfJ1ag-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hQpOeuAFUR/YU+yLEEiQzjlSsfEbb0a1M35err53O2c=;
        b=dE8PctFdwfQQCGN7/UoIhY1fVWmU1nClz5cRrxC4K+S7CJTNx1bWR8iRlWpkJXnFo8
         f1OCewb4Y5ZaTLfmr7MoH3PHb8SX7KEAI4+AYVFZI3cOcjEuzbV6tNhfmO4V5+pTYP3m
         otP729wYbbyd+CQFgbq1cJtT731pvNRvq8ExRcFjEKppWPu5esmPQPYeb1dqG/QQP3i1
         GvY33nMy9HbNcnKhdLYvDcgu6gGligREO7VkRGnRbGEuCuQ6G2grnc/WqQV/MwFVpTlM
         nt0KXTeqZYjtz+cI3elYVcjVw2tkM4pu7mwLr3z/g4C36KwwK1B2GdG1eRkT0p9hwTGk
         b2vQ==
X-Gm-Message-State: AOAM5301SghOYOuK0gd5VMsZ8Ds3R+/zbPaaSyr58XjxvYx6F5ANcmx4
	Oqh/CudUyBVTMsNAJ/VwYlfkjy4ICTBvDY40c/VMle9Vgev8HXEn3di9Lwg9Wve6zwKMqTJcnMG
	L+jB1ztIKmbGpdhxdW9IqF+TiSYU=
X-Received: by 2002:a17:907:ea5:: with SMTP id ho37mr14408251ejc.133.1635810291054;
        Mon, 01 Nov 2021 16:44:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwukbwhcUWvJJuqHH8/khRQQjZoqF2HrG8wBex3bhnCrcMlXkuR308ikOKPoGaR9Bmsmei6wA==
X-Received: by 2002:a17:907:ea5:: with SMTP id ho37mr14408220ejc.133.1635810290860;
        Mon, 01 Nov 2021 16:44:50 -0700 (PDT)
Date: Mon, 1 Nov 2021 19:44:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Greg Kurz <groug@kaod.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
Subject: [PULL 8/9] pci: Export pci_for_each_device_under_bus*()
Message-ID: <20211101234358.582487-9-mst@redhat.com>
References: <20211101234358.582487-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211101234358.582487-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Peter Xu <peterx@redhat.com>

They're actually more commonly used than the helper without _under_bus, because
most callers do have the pci bus on hand.  After exporting we can switch a lot
of the call sites to use these two helpers.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20211028043129.38871-3-peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/pci/pci.h       |  5 +++++
 hw/i386/acpi-build.c       |  5 ++---
 hw/pci/pci.c               | 10 +++++-----
 hw/pci/pcie.c              |  4 +---
 hw/ppc/spapr_pci.c         | 12 +++++-------
 hw/ppc/spapr_pci_nvlink2.c |  7 +++----
 hw/ppc/spapr_pci_vfio.c    |  4 ++--
 hw/s390x/s390-pci-bus.c    |  5 ++---
 hw/xen/xen_pt.c            |  4 ++--
 9 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 4a8740b76b..5c4016b995 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -467,6 +467,11 @@ void pci_for_each_device(PCIBus *bus, int bus_num,
 void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
                                  pci_bus_dev_fn fn,
                                  void *opaque);
+void pci_for_each_device_under_bus(PCIBus *bus,
+                                   pci_bus_dev_fn fn, void *opaque);
+void pci_for_each_device_under_bus_reverse(PCIBus *bus,
+                                           pci_bus_dev_fn fn,
+                                           void *opaque);
 void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
                                   pci_bus_fn end, void *parent_state);
 PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 3ca6cc8118..a3ad6abd33 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2134,8 +2134,7 @@ dmar_host_bridges(Object *obj, void *opaque)
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
         if (bus && !pci_bus_bypass_iommu(bus)) {
-            pci_for_each_device(bus, pci_bus_num(bus), insert_scope,
-                                scope_blob);
+            pci_for_each_device_under_bus(bus, insert_scope, scope_blob);
         }
     }
 
@@ -2341,7 +2340,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
         if (bus && !pci_bus_bypass_iommu(bus)) {
-            pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd_blob);
+            pci_for_each_device_under_bus(bus, insert_ivhd, ivhd_blob);
         }
     }
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 17e59cb3a3..4a84e478ce 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1654,9 +1654,9 @@ static const pci_class_desc pci_class_descriptions[] =
     { 0, NULL}
 };
 
-static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
-                                                  pci_bus_dev_fn fn,
-                                                  void *opaque)
+void pci_for_each_device_under_bus_reverse(PCIBus *bus,
+                                           pci_bus_dev_fn fn,
+                                           void *opaque)
 {
     PCIDevice *d;
     int devfn;
@@ -1679,8 +1679,8 @@ void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
     }
 }
 
-static void pci_for_each_device_under_bus(PCIBus *bus,
-                                          pci_bus_dev_fn fn, void *opaque)
+void pci_for_each_device_under_bus(PCIBus *bus,
+                                   pci_bus_dev_fn fn, void *opaque)
 {
     PCIDevice *d;
     int devfn;
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 6e95d82903..914a9bf3d1 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -694,9 +694,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
         (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
         PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
-        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                            pcie_unplug_device, NULL);
-
+        pci_for_each_device_under_bus(sec_bus, pcie_unplug_device, NULL);
         pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
                                      PCI_EXP_SLTSTA_PDS);
         if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7430bd6314..5bfd4aa9e5 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1317,8 +1317,7 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, PCIBus *bus,
                           RESOURCE_CELLS_SIZE));
 
     assert(bus);
-    pci_for_each_device_reverse(bus, pci_bus_num(bus),
-                                spapr_dt_pci_device_cb, &cbinfo);
+    pci_for_each_device_under_bus_reverse(bus, spapr_dt_pci_device_cb, &cbinfo);
     if (cbinfo.err) {
         return cbinfo.err;
     }
@@ -2306,8 +2305,8 @@ static void spapr_phb_pci_enumerate_bridge(PCIBus *bus, PCIDevice *pdev,
         return;
     }
 
-    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                        spapr_phb_pci_enumerate_bridge, bus_no);
+    pci_for_each_device_under_bus(sec_bus, spapr_phb_pci_enumerate_bridge,
+                                  bus_no);
     pci_default_write_config(pdev, PCI_SUBORDINATE_BUS, *bus_no, 1);
 }
 
@@ -2316,9 +2315,8 @@ static void spapr_phb_pci_enumerate(SpaprPhbState *phb)
     PCIBus *bus = PCI_HOST_BRIDGE(phb)->bus;
     unsigned int bus_no = 0;
 
-    pci_for_each_device(bus, pci_bus_num(bus),
-                        spapr_phb_pci_enumerate_bridge,
-                        &bus_no);
+    pci_for_each_device_under_bus(bus, spapr_phb_pci_enumerate_bridge,
+                                  &bus_no);
 
 }
 
diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
index 8ef9b40a18..7fb0cf4d04 100644
--- a/hw/ppc/spapr_pci_nvlink2.c
+++ b/hw/ppc/spapr_pci_nvlink2.c
@@ -164,8 +164,7 @@ static void spapr_phb_pci_collect_nvgpu(PCIBus *bus, PCIDevice *pdev,
         return;
     }
 
-    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                        spapr_phb_pci_collect_nvgpu, opaque);
+    pci_for_each_device_under_bus(sec_bus, spapr_phb_pci_collect_nvgpu, opaque);
 }
 
 void spapr_phb_nvgpu_setup(SpaprPhbState *sphb, Error **errp)
@@ -183,8 +182,8 @@ void spapr_phb_nvgpu_setup(SpaprPhbState *sphb, Error **errp)
     sphb->nvgpus->nv2_atsd_current = sphb->nv2_atsd_win_addr;
 
     bus = PCI_HOST_BRIDGE(sphb)->bus;
-    pci_for_each_device(bus, pci_bus_num(bus),
-                        spapr_phb_pci_collect_nvgpu, sphb->nvgpus);
+    pci_for_each_device_under_bus(bus, spapr_phb_pci_collect_nvgpu,
+                                  sphb->nvgpus);
 
     if (sphb->nvgpus->err) {
         error_propagate(errp, sphb->nvgpus->err);
diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
index f3b37df8ea..2a76b4e0b5 100644
--- a/hw/ppc/spapr_pci_vfio.c
+++ b/hw/ppc/spapr_pci_vfio.c
@@ -164,8 +164,8 @@ static void spapr_phb_vfio_eeh_clear_dev_msix(PCIBus *bus,
 
 static void spapr_phb_vfio_eeh_clear_bus_msix(PCIBus *bus, void *opaque)
 {
-       pci_for_each_device(bus, pci_bus_num(bus),
-                           spapr_phb_vfio_eeh_clear_dev_msix, NULL);
+       pci_for_each_device_under_bus(bus, spapr_phb_vfio_eeh_clear_dev_msix,
+                                     NULL);
 }
 
 static void spapr_phb_vfio_eeh_pre_reset(SpaprPhbState *sphb)
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 6fafffb029..1b51a72838 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1163,8 +1163,7 @@ static void s390_pci_enumerate_bridge(PCIBus *bus, PCIDevice *pdev,
     }
 
     /* Assign numbers to all child bridges. The last is the highest number. */
-    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                        s390_pci_enumerate_bridge, s);
+    pci_for_each_device_under_bus(sec_bus, s390_pci_enumerate_bridge, s);
     pci_default_write_config(pdev, PCI_SUBORDINATE_BUS, s->bus_no, 1);
 }
 
@@ -1193,7 +1192,7 @@ static void s390_pcihost_reset(DeviceState *dev)
      * on every system reset, we also have to reassign numbers.
      */
     s->bus_no = 0;
-    pci_for_each_device(bus, pci_bus_num(bus), s390_pci_enumerate_bridge, s);
+    pci_for_each_device_under_bus(bus, s390_pci_enumerate_bridge, s);
 }
 
 static void s390_pcihost_class_init(ObjectClass *klass, void *data)
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index ca0a98187e..027190fa44 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -615,8 +615,8 @@ static void xen_pt_region_update(XenPCIPassthroughState *s,
     }
 
     args.type = d->io_regions[bar].type;
-    pci_for_each_device(pci_get_bus(d), pci_dev_bus_num(d),
-                        xen_pt_check_bar_overlap, &args);
+    pci_for_each_device_under_bus(pci_get_bus(d),
+                                  xen_pt_check_bar_overlap, &args);
     if (args.rc) {
         XEN_PT_WARN(d, "Region: %d (addr: 0x%"FMT_PCIBUS
                     ", len: 0x%"FMT_PCIBUS") is overlapped.\n",
-- 
MST


