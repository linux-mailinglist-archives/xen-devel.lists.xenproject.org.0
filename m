Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7943C7F9AF5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 08:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641633.1000382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7W3S-0005rn-F5; Mon, 27 Nov 2023 07:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641633.1000382; Mon, 27 Nov 2023 07:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7W3S-0005pJ-C9; Mon, 27 Nov 2023 07:29:18 +0000
Received: by outflank-mailman (input) for mailman id 641633;
 Mon, 27 Nov 2023 07:29:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRKV=HI=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1r7W3R-0005Pb-GN
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 07:29:17 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a927e4ff-8cf6-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 08:29:14 +0100 (CET)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id D12B61A520;
 Mon, 27 Nov 2023 02:29:11 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id B6CE61A51F;
 Mon, 27 Nov 2023 02:29:11 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [188.163.75.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 0A6921A51E;
 Mon, 27 Nov 2023 02:29:07 -0500 (EST)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: a927e4ff-8cf6-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=CbeTAHYGk50C0Qkwb6apv4tsO
	0V8YdHsdOnMVLhr/r0=; b=xWhj6BPsp3N9S19K57k/v1fh2zscMH5AGetvd+XPU
	FOm5uFAueJTD6M/C7Q22wu71dw0Ro8C49TpAdCY7J78Hqo/rJ2D/u9vc98l+4O4O
	wg1ptGK4eQT0lzz+V02jYv9xyFDy6w+XLXlEzOZxDs6ZTVmvA836rkuF2pbgRCEv
	i4=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org,
	Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [RFC PATCH v1 3/5] libxl/arm: Add basic virtio-pci support
Date: Mon, 27 Nov 2023 09:27:52 +0200
Message-Id: <20231127072754.4045254-4-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127072754.4045254-1-Sergiy_Kibrik@epam.com>
References: <20231127072754.4045254-1-Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 A6A2B34E-8CF6-11EE-8C37-A19503B9AAD1-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Introduce new transport mechanism "pci" for the Virtio device
and update parsing and configuration logic accordingly.

In order to enable more use-cases such as having multiple
device-models (Qemu) running in different backend domains which provide
virtio-pci devices for the same guest, we allocate and expose one
PCI host bridge for every virtio backend domain for that guest.

Also extend PCI Host bridge DT node exposed to the guest by adding
bindings for Legacy PCI interrupts (#INTA - #INTD).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 docs/man/xl.cfg.5.pod.in          |   9 +-
 tools/libs/light/libxl_arm.c      | 287 ++++++++++++++++++++++++++++--
 tools/libs/light/libxl_create.c   |  18 +-
 tools/libs/light/libxl_dm.c       |  70 ++++++++
 tools/libs/light/libxl_internal.h |   5 +
 tools/libs/light/libxl_types.idl  |  34 +++-
 tools/libs/light/libxl_virtio.c   |  98 +++++++---
 tools/xl/xl_parse.c               |  36 ++++
 8 files changed, 507 insertions(+), 50 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 2e234b450e..0fba750815 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1616,8 +1616,13 @@ hexadecimal format, without the "0x" prefix and al=
l in lower case, like
=20
 =3Ditem B<transport=3DSTRING>
=20
-Specifies the transport mechanism for the Virtio device, only "mmio" is
-supported for now.
+Specifies the transport mechanism for the Virtio device, both "mmio" and=
 "pci"
+are supported. This option is mandatory.
+
+=3Ditem B<bdf=3DSTRING>
+
+The Virtio device with transport "pci" must be identified by its B<BDF>.
+See L<xl-pci-configuration(5)> for more details about the format for B<B=
DF>.
=20
 =3Ditem B<grant_usage=3DBOOLEAN>
=20
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 1539191774..4789ee08d2 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -20,6 +20,11 @@
  */
 #define VIRTIO_MMIO_DEV_SIZE   xen_mk_ullong(0x200)
=20
+#define VIRTIO_PCI_HOST_MEM_SIZE            xen_mk_ullong(0x400000)
+#define VIRTIO_PCI_HOST_PREFETCH_MEM_SIZE   xen_mk_ullong(0x400000)
+#define VIRTIO_PCI_HOST_NUM_SPIS            4
+#define VIRTIO_PCI_MAX_HOSTS                8
+
 static uint64_t alloc_virtio_mmio_base(libxl__gc *gc, uint64_t *virtio_m=
mio_base)
 {
     uint64_t base =3D *virtio_mmio_base;
@@ -80,14 +85,101 @@ static const char *gicv_to_string(libxl_gic_version =
gic_version)
     }
 }
=20
+static int alloc_virtio_pci_host(libxl__gc *gc,
+                                 uint32_t backend_domid,
+                                 uint32_t *host_id,
+                                 unsigned int *num_hosts,
+                                 libxl_virtio_pci_host *hosts)
+{
+    unsigned int i;
+
+    BUILD_BUG_ON(VIRTIO_PCI_MAX_HOSTS !=3D
+                 GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE / GUEST_VIRTIO_PCI_HOS=
T_ECAM_SIZE);
+    BUILD_BUG_ON(VIRTIO_PCI_MAX_HOSTS !=3D
+                 GUEST_VIRTIO_PCI_MEM_SIZE / VIRTIO_PCI_HOST_MEM_SIZE);
+    BUILD_BUG_ON(VIRTIO_PCI_MAX_HOSTS !=3D
+                 GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE / VIRTIO_PCI_HOST_PR=
EFETCH_MEM_SIZE);
+    BUILD_BUG_ON(VIRTIO_PCI_MAX_HOSTS !=3D
+                 (GUEST_VIRTIO_PCI_SPI_LAST - GUEST_VIRTIO_PCI_SPI_FIRST=
) / VIRTIO_PCI_HOST_NUM_SPIS);
+
+    if (*num_hosts > VIRTIO_PCI_MAX_HOSTS)
+        return ERROR_INVAL;
+
+    for (i =3D 0; i < *num_hosts; i++) {
+        if (hosts[i].backend_domid =3D=3D backend_domid) {
+            *host_id =3D hosts[i].id;
+
+            LOG(DEBUG, "Reuse host #%u: "
+                        "ECAM: 0x%"PRIx64"-0x%"PRIx64" "
+                        "MEM: 0x%"PRIx64"-0x%"PRIx64" "
+                        "PREFETCH_MEM: 0x%"PRIx64"-0x%"PRIx64" "
+                        "IRQ: %u-%u",
+                        hosts[i].id,
+                        hosts[i].ecam_base,
+                        hosts[i].ecam_base + hosts[i].ecam_size - 1,
+                        hosts[i].mem_base,
+                        hosts[i].mem_base + hosts[i].mem_size - 1,
+                        hosts[i].prefetch_mem_base,
+                        hosts[i].prefetch_mem_base + hosts[i].prefetch_m=
em_size - 1,
+                        hosts[i].irq_first,
+                        hosts[i].irq_first + hosts[i].num_irqs - 1);
+
+            return 0;
+        }
+    }
+
+    if (i =3D=3D VIRTIO_PCI_MAX_HOSTS) {
+        LOG(ERROR, "Ran out of reserved resources for virtio-pci host\n"=
);
+        return ERROR_FAIL;
+    }
+
+    hosts[i].backend_domid =3D backend_domid;
+    hosts[i].id =3D i;
+    hosts[i].ecam_base =3D GUEST_VIRTIO_PCI_ECAM_BASE +
+        i * GUEST_VIRTIO_PCI_HOST_ECAM_SIZE;
+    hosts[i].ecam_size =3D GUEST_VIRTIO_PCI_HOST_ECAM_SIZE;
+    hosts[i].mem_base =3D GUEST_VIRTIO_PCI_MEM_ADDR +
+        i * VIRTIO_PCI_HOST_MEM_SIZE;
+    hosts[i].mem_size =3D VIRTIO_PCI_HOST_MEM_SIZE;
+    hosts[i].prefetch_mem_base =3D GUEST_VIRTIO_PCI_PREFETCH_MEM_ADDR +
+        i * VIRTIO_PCI_HOST_PREFETCH_MEM_SIZE;
+    hosts[i].prefetch_mem_size =3D VIRTIO_PCI_HOST_PREFETCH_MEM_SIZE;
+    hosts[i].irq_first =3D GUEST_VIRTIO_PCI_SPI_FIRST +
+        i * VIRTIO_PCI_HOST_NUM_SPIS;
+    hosts[i].num_irqs =3D VIRTIO_PCI_HOST_NUM_SPIS;
+
+    *host_id =3D hosts[i].id;
+
+    (*num_hosts)++;
+
+    LOG(DEBUG, "Allocate host #%u: "
+                "ECAM: 0x%"PRIx64"-0x%"PRIx64" "
+                "MEM: 0x%"PRIx64"-0x%"PRIx64" "
+                "PREFETCH_MEM: 0x%"PRIx64"-0x%"PRIx64" "
+                "IRQ: %u-%u",
+                hosts[i].id,
+                hosts[i].ecam_base,
+                hosts[i].ecam_base + hosts[i].ecam_size - 1,
+                hosts[i].mem_base,
+                hosts[i].mem_base + hosts[i].mem_size - 1,
+                hosts[i].prefetch_mem_base,
+                hosts[i].prefetch_mem_base + hosts[i].prefetch_mem_size =
- 1,
+                hosts[i].irq_first,
+                hosts[i].irq_first + hosts[i].num_irqs - 1);
+
+    return 0;
+}
+
 int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
                                       struct xen_domctl_createdomain *co=
nfig)
 {
     uint32_t nr_spis =3D 0;
     unsigned int i;
-    uint32_t vuart_irq, virtio_irq =3D 0;
-    bool vuart_enabled =3D false, virtio_enabled =3D false;
+    uint32_t vuart_irq, virtio_mmio_irq_last, virtio_pci_irq_last =3D 0;
+    bool vuart_enabled =3D false, virtio_mmio_enabled =3D false;
+    unsigned int num_virtio_pci_hosts =3D 0;
+    libxl_virtio_pci_host virtio_pci_hosts[VIRTIO_PCI_MAX_HOSTS] =3D {0}=
;
     uint64_t virtio_mmio_base =3D GUEST_VIRTIO_MMIO_BASE;
     uint32_t virtio_mmio_irq =3D GUEST_VIRTIO_MMIO_SPI_FIRST;
     int rc;
@@ -118,11 +210,17 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc=
,
     for (i =3D 0; i < d_config->num_virtios; i++) {
         libxl_device_virtio *virtio =3D &d_config->virtios[i];
=20
-        if (virtio->transport !=3D LIBXL_VIRTIO_TRANSPORT_MMIO)
-            continue;
-
-        rc =3D alloc_virtio_mmio_params(gc, &virtio->base, &virtio->irq,
-                                      &virtio_mmio_base, &virtio_mmio_ir=
q);
+        if (virtio->transport !=3D LIBXL_VIRTIO_TRANSPORT_MMIO) {
+            rc =3D alloc_virtio_pci_host(gc,
+                                       virtio->backend_domid,
+                                       &virtio->u.pci.host_id,
+                                       &num_virtio_pci_hosts,
+                                       virtio_pci_hosts);
+        } else {
+            rc =3D alloc_virtio_mmio_params(gc, &virtio->u.mmio.base,
+                                          &virtio->u.mmio.irq,
+                                          &virtio_mmio_base, &virtio_mmi=
o_irq);
+        }
=20
         if (rc)
             return rc;
@@ -134,14 +232,25 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc=
,
      * The resulting "nr_spis" needs to cover the highest possible SPI.
      */
     if (virtio_mmio_irq !=3D GUEST_VIRTIO_MMIO_SPI_FIRST) {
-        virtio_enabled =3D true;
+        virtio_mmio_enabled =3D true;
=20
         /*
          * Assumes that "virtio_mmio_irq" is the highest allocated irq, =
which is
          * updated from alloc_virtio_mmio_irq() currently.
          */
-        virtio_irq =3D virtio_mmio_irq - 1;
-        nr_spis =3D max(nr_spis, virtio_irq - 32 + 1);
+        virtio_mmio_irq_last =3D virtio_mmio_irq - 1;
+        nr_spis =3D max(nr_spis, virtio_mmio_irq_last - 32 + 1);
+    }
+
+    if (num_virtio_pci_hosts) {
+        libxl_virtio_pci_host *host =3D &virtio_pci_hosts[num_virtio_pci=
_hosts - 1];
+
+        /*
+         * Assumes that latest allocated host contains the highest alloc=
ated
+         * irq range.
+         */
+        virtio_pci_irq_last =3D host->irq_first + host->num_irqs - 1;
+        nr_spis =3D max(nr_spis, virtio_pci_irq_last - 32 + 1);
     }
=20
     for (i =3D 0; i < d_config->b_info.num_irqs; i++) {
@@ -164,10 +273,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc=
,
         }
=20
         /* The same check as for vpl011 */
-        if (virtio_enabled &&
-            (irq >=3D GUEST_VIRTIO_MMIO_SPI_FIRST && irq <=3D virtio_irq=
)) {
+        if (virtio_mmio_enabled &&
+            (irq >=3D GUEST_VIRTIO_MMIO_SPI_FIRST && irq <=3D virtio_mmi=
o_irq_last)) {
             LOG(ERROR, "Physical IRQ %u conflicting with Virtio MMIO IRQ=
 range\n", irq);
             return ERROR_FAIL;
+        } else if (num_virtio_pci_hosts &&
+            (irq >=3D GUEST_VIRTIO_PCI_SPI_FIRST && irq <=3D virtio_pci_=
irq_last)) {
+            LOG(ERROR, "Physical IRQ %u conflicting with Virtio PCI IRQ =
range\n", irq);
+            return ERROR_FAIL;
         }
=20
         if (irq < 32)
@@ -179,6 +292,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             nr_spis =3D spi + 1;
     }
=20
+    if (num_virtio_pci_hosts) {
+        d_config->b_info.num_virtio_pci_hosts =3D num_virtio_pci_hosts;
+        d_config->b_info.virtio_pci_hosts =3D libxl__calloc(NOGC,
+            num_virtio_pci_hosts, sizeof(*d_config->b_info.virtio_pci_ho=
sts));
+        memcpy(d_config->b_info.virtio_pci_hosts, virtio_pci_hosts,
+            sizeof(*d_config->b_info.virtio_pci_hosts) * num_virtio_pci_=
hosts);
+    }
+
     LOG(DEBUG, "Configure the domain");
=20
     config->arch.nr_spis =3D nr_spis;
@@ -908,6 +1029,130 @@ static int make_vpci_node(libxl__gc *gc, void *fdt=
,
     return 0;
 }
=20
+#define PCI_IRQ_MAP_MIN_STRIDE   8
+
+static int create_virtio_pci_irq_map(libxl__gc *gc, void *fdt,
+                                     libxl_virtio_pci_host *host)
+{
+    uint32_t *full_irq_map, *irq_map;
+    size_t len;
+    unsigned int slot, pin;
+    int res, cells;
+
+    res =3D fdt_property_cell(fdt, "#interrupt-cells", 1);
+    if (res) return res;
+
+    /* assume GIC node to be present, due to
+     * make_gicv2_node()/make_gicv3_node() get called earlier
+     */
+    res =3D fdt_node_offset_by_phandle(fdt, GUEST_PHANDLE_GIC);
+    if (res < 0)
+        return res;
+
+    res =3D fdt_address_cells(fdt, res);
+    /* handle case of make_gicv2_node() setting #address-cells to 0 */
+    if (res =3D=3D -FDT_ERR_BADNCELLS)
+        res =3D 0;
+    else if (res < 0)
+        return res;
+
+    cells =3D res;
+    len =3D sizeof(uint32_t) * host->num_irqs * host->num_irqs *
+          (PCI_IRQ_MAP_MIN_STRIDE + cells);
+    irq_map =3D full_irq_map =3D libxl__malloc(gc, len);
+
+    for (slot =3D 0; slot < host->num_irqs; slot++) {
+        for (pin =3D 0; pin < host->num_irqs; pin++) {
+            uint32_t irq =3D host->irq_first + ((pin + slot) % host->num=
_irqs);
+            unsigned int i =3D 0;
+
+            /* PCI address (3 cells) */
+            irq_map[i++] =3D cpu_to_fdt32(PCI_DEVFN(slot, 0) << 8);
+            irq_map[i++] =3D cpu_to_fdt32(0);
+            irq_map[i++] =3D cpu_to_fdt32(0);
+
+            /* PCI interrupt (1 cell) */
+            irq_map[i++] =3D cpu_to_fdt32(pin + 1);
+
+            /* GIC phandle (1 cell) */
+            irq_map[i++] =3D cpu_to_fdt32(GUEST_PHANDLE_GIC);
+
+            /* GIC unit address, set 0 because vgic itself handles vpci =
IRQs */
+            for (int c =3D cells; c--; irq_map[i++] =3D cpu_to_fdt32(0))=
;
+
+            /* GIC interrupt (3 cells) */
+            irq_map[i++] =3D cpu_to_fdt32(0); /* SPI */
+            irq_map[i++] =3D cpu_to_fdt32(irq - 32);
+            irq_map[i++] =3D cpu_to_fdt32(DT_IRQ_TYPE_LEVEL_HIGH);
+
+            irq_map +=3D PCI_IRQ_MAP_MIN_STRIDE + cells;
+        }
+    }
+
+    res =3D fdt_property(fdt, "interrupt-map", full_irq_map, len);
+    if (res) return res;
+
+    res =3D fdt_property_values(gc, fdt, "interrupt-map-mask", 4,
+                              PCI_DEVFN(3, 0) << 8, 0, 0, 0x7);
+    if (res) return res;
+
+    return 0;
+}
+
+/* TODO Consider reusing make_vpci_node() */
+static int make_virtio_pci_node(libxl__gc *gc, void *fdt,
+                                libxl_virtio_pci_host *host,
+                                libxl_domain_config *d_config)
+{
+    int res;
+    const char *name =3D GCSPRINTF("pcie@%"PRIx64, host->ecam_base);
+
+    res =3D fdt_begin_node(fdt, name);
+    if (res) return res;
+
+    res =3D fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
+    if (res) return res;
+
+    res =3D fdt_property_string(fdt, "device_type", "pci");
+    if (res) return res;
+
+    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+        GUEST_ROOT_SIZE_CELLS, 1, host->ecam_base, host->ecam_size);
+    if (res) return res;
+
+    res =3D fdt_property_values(gc, fdt, "bus-range", 2, 0, 0);
+    if (res) return res;
+
+    res =3D fdt_property_cell(fdt, "#address-cells", 3);
+    if (res) return res;
+
+    res =3D fdt_property_cell(fdt, "#size-cells", 2);
+    if (res) return res;
+
+    res =3D fdt_property_string(fdt, "status", "okay");
+    if (res) return res;
+
+    res =3D fdt_property_vpci_ranges(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+        GUEST_ROOT_SIZE_CELLS, 2,
+        GUEST_VIRTIO_PCI_ADDR_TYPE_MEM, host->mem_base, host->mem_size,
+        GUEST_VIRTIO_PCI_ADDR_TYPE_PREFETCH_MEM, host->prefetch_mem_base=
,
+        host->prefetch_mem_size);
+    if (res) return res;
+
+    /* The same property as for virtio-mmio device */
+    res =3D fdt_property(fdt, "dma-coherent", NULL, 0);
+    if (res) return res;
+
+    /* Legacy PCI interrupts (#INTA - #INTD) */
+    res =3D create_virtio_pci_irq_map(gc, fdt, host);
+    if (res) return res;
+
+    res =3D fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
 {
     int res;
@@ -1384,20 +1629,26 @@ next_resize:
         for (i =3D 0; i < d_config->num_virtios; i++) {
             libxl_device_virtio *virtio =3D &d_config->virtios[i];
=20
-            if (virtio->transport !=3D LIBXL_VIRTIO_TRANSPORT_MMIO)
-                continue;
-
             if (libxl_defbool_val(virtio->grant_usage))
                 iommu_needed =3D true;
=20
-            FDT( make_virtio_mmio_node_device(gc, fdt, virtio->base,
-                                              virtio->irq, virtio->type,
+            if (virtio->transport !=3D LIBXL_VIRTIO_TRANSPORT_MMIO)
+                continue;
+
+            FDT( make_virtio_mmio_node_device(gc, fdt, virtio->u.mmio.ba=
se,
+                                              virtio->u.mmio.irq, virtio=
->type,
                                               virtio->backend_domid,
                                               libxl_defbool_val(virtio->=
grant_usage)) );
         }
=20
+        for (i =3D 0; i < d_config->b_info.num_virtio_pci_hosts; i++) {
+            libxl_virtio_pci_host *host =3D &d_config->b_info.virtio_pci=
_hosts[i];
+
+            FDT( make_virtio_pci_node(gc, fdt, host, d_config) );
+        }
+
         /*
-         * The iommu node should be created only once for all virtio-mmi=
o
+         * The iommu node should be created only once for all virtio
          * devices.
          */
         if (iommu_needed)
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_cre=
ate.c
index ce1d431103..22b4fa40cc 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1273,8 +1273,9 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
     }
=20
     for (i =3D 0; i < d_config->num_virtios; i++) {
-        ret =3D libxl__virtio_devtype.set_default(gc, domid,
-                                                &d_config->virtios[i], f=
alse);
+        libxl_device_virtio *virtio =3D &d_config->virtios[i];
+
+        ret =3D libxl__virtio_devtype.set_default(gc, domid, virtio, fal=
se);
         if (ret) {
             LOGD(ERROR, domid, "Unable to set virtio defaults for device=
 %d", i);
             goto error_out;
@@ -1770,6 +1771,19 @@ static void domcreate_launch_dm(libxl__egc *egc, l=
ibxl__multidev *multidev,
     for (i =3D 0; i < d_config->num_virtios; i++)
         libxl__device_add(gc, domid, &libxl__virtio_devtype,
                           &d_config->virtios[i]);
+    /*
+     * This should be done before spawning device model, but after
+     * the creation of "device-model" directory in Xenstore.
+     */
+    for (i =3D 0; i < d_config->b_info.num_virtio_pci_hosts; i++) {
+        libxl_virtio_pci_host *host =3D &d_config->b_info.virtio_pci_hos=
ts[i];
+
+        ret =3D libxl__save_dm_virtio_pci_host(gc, domid, host);
+        if (ret) {
+            LOGD(ERROR, domid, "Unable to save virtio_pci_host for devic=
e model");
+            goto error_out;
+        }
+    }
=20
     switch (d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 0b2548d35b..4e9391fc08 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -3375,6 +3375,76 @@ static void device_model_postconfig_done(libxl__eg=
c *egc,
     dmss->callback(egc, dmss, rc);
 }
=20
+int libxl__save_dm_virtio_pci_host(libxl__gc *gc,
+                                   uint32_t domid,
+                                   libxl_virtio_pci_host *host)
+{
+    const char *dm_path;
+    char **dir;
+    xs_transaction_t t =3D XBT_NULL;
+    unsigned int n;
+    int rc;
+
+    dm_path =3D GCSPRINTF("/local/domain/%d/device-model", host->backend=
_domid);
+
+    dir =3D libxl__xs_directory(gc, XBT_NULL, dm_path, &n);
+    if (!dir)
+        return ERROR_INVAL;
+
+    dm_path =3D DEVICE_MODEL_XS_PATH(gc, host->backend_domid, domid, "/v=
irtio_pci_host");
+
+    for (;;) {
+        rc =3D libxl__xs_transaction_start(gc, &t);
+        if (rc) goto out;
+
+        rc =3D libxl__xs_write_checked(gc, t, GCSPRINTF("%s/id", dm_path=
),
+                                     GCSPRINTF("%u", host->id));
+        if (rc) goto out;
+
+        rc =3D libxl__xs_write_checked(gc, t, GCSPRINTF("%s/ecam_base", =
dm_path),
+                                     GCSPRINTF("%#"PRIx64, host->ecam_ba=
se));
+        if (rc) goto out;
+
+        rc =3D libxl__xs_write_checked(gc, t, GCSPRINTF("%s/ecam_size", =
dm_path),
+                                     GCSPRINTF("%#"PRIx64, host->ecam_si=
ze));
+        if (rc) goto out;
+
+        rc =3D libxl__xs_write_checked(gc, t, GCSPRINTF("%s/mem_base", d=
m_path),
+                                     GCSPRINTF("%#"PRIx64, host->mem_bas=
e));
+        if (rc) goto out;
+
+        rc =3D libxl__xs_write_checked(gc, t, GCSPRINTF("%s/mem_size", d=
m_path),
+                                     GCSPRINTF("%#"PRIx64, host->mem_siz=
e));
+        if (rc) goto out;
+
+        rc =3D libxl__xs_write_checked(gc, t, GCSPRINTF("%s/prefetch_mem=
_base", dm_path),
+                                     GCSPRINTF("%#"PRIx64, host->prefetc=
h_mem_base));
+        if (rc) goto out;
+
+        rc =3D libxl__xs_write_checked(gc, t, GCSPRINTF("%s/prefetch_mem=
_size", dm_path),
+                                     GCSPRINTF("%#"PRIx64, host->prefetc=
h_mem_size));
+        if (rc) goto out;
+
+        rc =3D libxl__xs_write_checked(gc, t, GCSPRINTF("%s/irq_first", =
dm_path),
+                                     GCSPRINTF("%u", host->irq_first));
+        if (rc) goto out;
+
+        rc =3D libxl__xs_write_checked(gc, t, GCSPRINTF("%s/num_irqs", d=
m_path),
+                                     GCSPRINTF("%u", host->num_irqs));
+        if (rc) goto out;
+
+        rc =3D libxl__xs_transaction_commit(gc, &t);
+        if (!rc) break;
+        if (rc < 0) goto out;
+    }
+
+    return 0;
+
+out:
+    libxl__xs_transaction_abort(gc, &t);
+    return rc;
+}
+
 void libxl__spawn_qdisk_backend(libxl__egc *egc, libxl__dm_spawn_state *=
dmss)
 {
     STATE_AO_GC(dmss->spawn.ao);
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_i=
nternal.h
index d5732d1c37..75d370d739 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4199,6 +4199,11 @@ _hidden void libxl__spawn_qdisk_backend(libxl__egc=
 *egc,
                                         libxl__dm_spawn_state *dmss);
 _hidden int libxl__destroy_qdisk_backend(libxl__gc *gc, uint32_t domid);
=20
+
+_hidden int libxl__save_dm_virtio_pci_host(libxl__gc *gc,
+                                           uint32_t domid,
+                                           libxl_virtio_pci_host *host);
+
 /*----- Domain creation -----*/
=20
=20
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
index 7d8bd5d216..a86c601994 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -281,6 +281,7 @@ libxl_vkb_backend =3D Enumeration("vkb_backend", [
 libxl_virtio_transport =3D Enumeration("virtio_transport", [
     (0, "UNKNOWN"),
     (1, "MMIO"),
+    (2, "PCI"),
     ])
=20
 libxl_passthrough =3D Enumeration("passthrough", [
@@ -558,6 +559,19 @@ libxl_altp2m_mode =3D Enumeration("altp2m_mode", [
     (3, "limited"),
     ], init_val =3D "LIBXL_ALTP2M_MODE_DISABLED")
=20
+libxl_virtio_pci_host =3D Struct("virtio_pci_host", [
+    ("backend_domid",     libxl_domid),
+    ("id",                uint32),
+    ("ecam_base",         uint64),
+    ("ecam_size",         uint64),
+    ("mem_base",          uint64),
+    ("mem_size",          uint64),
+    ("prefetch_mem_base", uint64),
+    ("prefetch_mem_size", uint64),
+    ("irq_first",         uint32),
+    ("num_irqs",          uint32),
+    ])
+
 libxl_domain_build_info =3D Struct("domain_build_info",[
     ("max_vcpus",       integer),
     ("avail_vcpus",     libxl_bitmap),
@@ -631,6 +645,7 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
     ("apic",             libxl_defbool),
     ("dm_restrict",      libxl_defbool),
     ("tee",              libxl_tee_type),
+    ("virtio_pci_hosts", Array(libxl_virtio_pci_host, "num_virtio_pci_ho=
sts")),
     ("u", KeyedUnion(None, libxl_domain_type, "type",
                 [("hvm", Struct(None, [("firmware",         string),
                                        ("bios",             libxl_bios_t=
ype),
@@ -764,13 +779,22 @@ libxl_device_virtio =3D Struct("device_virtio", [
     ("backend_domid", libxl_domid),
     ("backend_domname", string),
     ("type", string),
-    ("transport", libxl_virtio_transport),
+    ("u", KeyedUnion(None, libxl_virtio_transport, "transport",
+              [("unknown", None),
+               # Note that virtio-mmio parameters (irq and base) are for=
 internal
+               # use by libxl and can't be modified.
+               ("mmio", Struct(None, [("irq", uint32),
+                                      ("base", uint64),
+                                     ])),
+               ("pci", Struct(None,  [("func", uint8),
+                                      ("dev", uint8),
+                                      ("bus", uint8),
+                                      ("domain", uint16),
+                                      ("host_id", uint32),
+                                     ])),
+              ])),
     ("grant_usage", libxl_defbool),
     ("devid", libxl_devid),
-    # Note that virtio-mmio parameters (irq and base) are for internal
-    # use by libxl and can't be modified.
-    ("irq", uint32),
-    ("base", uint64)
     ])
=20
 libxl_device_disk =3D Struct("device_disk", [
diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_vir=
tio.c
index e5e321adc5..8062423c75 100644
--- a/tools/libs/light/libxl_virtio.c
+++ b/tools/libs/light/libxl_virtio.c
@@ -57,8 +57,21 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, u=
int32_t domid,
 {
     const char *transport =3D libxl_virtio_transport_to_string(virtio->t=
ransport);
=20
-    flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->irq));
-    flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio->ba=
se));
+    if (virtio->transport =3D=3D LIBXL_VIRTIO_TRANSPORT_MMIO) {
+        flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->u.mmi=
o.irq));
+        flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio=
->u.mmio.base));
+    } else {
+        /*
+         * TODO:
+         * Probably we will also need to store PCI Host bridge details (=
irq and
+         * mem ranges) this particular PCI device belongs to if emulator=
 cannot
+         * or should not rely on what is described at include/public/arc=
h-arm.h
+         */
+        flexarray_append_pair(back, "bdf", GCSPRINTF("%04x:%02x:%02x.%01=
x",
+                              virtio->u.pci.domain, virtio->u.pci.bus,
+                              virtio->u.pci.dev, virtio->u.pci.func));
+        flexarray_append_pair(back, "host_id", GCSPRINTF("%u", virtio->u=
.pci.host_id));
+    }
     flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
     flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport))=
;
     flexarray_append_pair(back, "grant_usage",
@@ -84,33 +97,72 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc,=
 const char *libxl_path,
     rc =3D libxl__backendpath_parse_domid(gc, be_path, &virtio->backend_=
domid);
     if (rc) goto out;
=20
-    rc =3D libxl__xs_read_checked(gc, XBT_NULL,
-				GCSPRINTF("%s/irq", be_path), &tmp);
-    if (rc) goto out;
-
-    if (tmp) {
-        virtio->irq =3D strtoul(tmp, NULL, 0);
+    tmp =3D libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/transport", be_pa=
th));
+    if (!tmp) {
+        LOG(ERROR, "Missing xenstore node %s/transport", be_path);
+        rc =3D ERROR_INVAL;
+        goto out;
     }
=20
-    tmp =3D NULL;
-    rc =3D libxl__xs_read_checked(gc, XBT_NULL,
-				GCSPRINTF("%s/base", be_path), &tmp);
-    if (rc) goto out;
+    rc =3D libxl_virtio_transport_from_string(tmp, &virtio->transport);
+    if (rc) {
+        LOG(ERROR, "Unable to parse xenstore node %s/transport", be_path=
);
+        goto out;
+    }
=20
-    if (tmp) {
-        virtio->base =3D strtoul(tmp, NULL, 0);
+    if (virtio->transport !=3D LIBXL_VIRTIO_TRANSPORT_MMIO &&
+        virtio->transport !=3D LIBXL_VIRTIO_TRANSPORT_PCI) {
+        LOG(ERROR, "Unexpected transport for virtio");
+        rc =3D ERROR_INVAL;
+        goto out;
     }
=20
-    tmp =3D NULL;
-    rc =3D libxl__xs_read_checked(gc, XBT_NULL,
-				GCSPRINTF("%s/transport", be_path), &tmp);
-    if (rc) goto out;
+    if (virtio->transport =3D=3D LIBXL_VIRTIO_TRANSPORT_MMIO) {
+        tmp =3D NULL;
+        rc =3D libxl__xs_read_checked(gc, XBT_NULL,
+                                    GCSPRINTF("%s/irq", be_path), &tmp);
+        if (rc) goto out;
=20
-    if (tmp) {
-        if (!strcmp(tmp, "mmio")) {
-            virtio->transport =3D LIBXL_VIRTIO_TRANSPORT_MMIO;
-        } else {
-            return ERROR_INVAL;
+        if (tmp) {
+            virtio->u.mmio.irq =3D strtoul(tmp, NULL, 0);
+        }
+
+        tmp =3D NULL;
+        rc =3D libxl__xs_read_checked(gc, XBT_NULL,
+                                    GCSPRINTF("%s/base", be_path), &tmp)=
;
+        if (rc) goto out;
+
+        if (tmp) {
+            virtio->u.mmio.base =3D strtoul(tmp, NULL, 0);
+        }
+    } else {
+        unsigned int domain, bus, dev, func;
+
+        tmp =3D NULL;
+        rc =3D libxl__xs_read_checked(gc, XBT_NULL,
+                                    GCSPRINTF("%s/bdf", be_path), &tmp);
+        if (rc) goto out;
+
+        if (tmp) {
+            if (sscanf(tmp, "%04x:%02x:%02x.%01x",
+                &domain, &bus, &dev, &func) !=3D 4) {
+                rc =3D ERROR_INVAL;
+                goto out;
+            }
+
+            virtio->u.pci.domain =3D domain;
+            virtio->u.pci.bus =3D bus;
+            virtio->u.pci.dev =3D dev;
+            virtio->u.pci.func =3D func;
+        }
+
+        tmp =3D NULL;
+        rc =3D libxl__xs_read_checked(gc, XBT_NULL,
+                                    GCSPRINTF("%s/host_id", be_path), &t=
mp);
+        if (rc) goto out;
+
+        if (tmp) {
+            virtio->u.pci.host_id =3D strtoul(tmp, NULL, 0);
         }
     }
=20
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index ed983200c3..4544ce2307 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1217,6 +1217,24 @@ static int parse_virtio_config(libxl_device_virtio=
 *virtio, char *token)
         if (rc) return rc;
     } else if (MATCH_OPTION("grant_usage", token, oparg)) {
         libxl_defbool_set(&virtio->grant_usage, strtoul(oparg, NULL, 0))=
;
+    } else if (MATCH_OPTION("bdf", token, oparg)) {
+        /*
+         * TODO:
+         * We pretend that we are ordinary PCI device to reuse BDF parsi=
ng
+         * logic. This needs to be properly reused by adjusting parse_bd=
f().
+         */
+        libxl_device_pci pci;
+
+        rc =3D xlu_pci_parse_bdf(NULL, &pci, oparg);
+        if (rc) {
+            fprintf(stderr, "Unable to parse BDF `%s' for virtio-pci\n",=
 oparg);
+            return -1;
+        }
+
+        virtio->u.pci.domain =3D pci.domain;
+        virtio->u.pci.bus =3D pci.bus;
+        virtio->u.pci.dev =3D pci.dev;
+        virtio->u.pci.func =3D pci.func;
     } else {
         fprintf(stderr, "Unknown string \"%s\" in virtio spec\n", token)=
;
         return -1;
@@ -1238,6 +1256,7 @@ static void parse_virtio_list(const XLU_Config *con=
fig,
         while ((item =3D xlu_cfg_get_listitem(virtios, entry)) !=3D NULL=
) {
             libxl_device_virtio *virtio;
             char *p;
+            bool bdf_present =3D false;
=20
             virtio =3D ARRAY_EXTEND_INIT(d_config->virtios, d_config->nu=
m_virtios,
                                        libxl_device_virtio_init);
@@ -1260,6 +1279,8 @@ static void parse_virtio_list(const XLU_Config *con=
fig,
                         strcat(str, p2);
                         p =3D str;
                     }
+                } else if (MATCH_OPTION("bdf", p, oparg)) {
+                    bdf_present =3D true;
                 }
=20
                 rc =3D parse_virtio_config(virtio, p);
@@ -1270,6 +1291,21 @@ static void parse_virtio_list(const XLU_Config *co=
nfig,
                 p =3D strtok(NULL, ",");
             }
=20
+            if (virtio->transport =3D=3D LIBXL_VIRTIO_TRANSPORT_UNKNOWN)=
 {
+                fprintf(stderr, "Unspecified transport for virtio\n");
+                rc =3D ERROR_FAIL; goto out;
+            }
+
+            if (virtio->transport =3D=3D LIBXL_VIRTIO_TRANSPORT_PCI &&
+                !bdf_present) {
+                fprintf(stderr, "BDF must be specified for virtio-pci\n"=
);
+                rc =3D ERROR_FAIL; goto out;
+            } else if (virtio->transport =3D=3D LIBXL_VIRTIO_TRANSPORT_M=
MIO &&
+                bdf_present) {
+                fprintf(stderr, "BDF must not be specified for virtio-mm=
io\n");
+                rc =3D ERROR_FAIL; goto out;
+            }
+
             entry++;
             free(buf);
         }
--=20
2.25.1


