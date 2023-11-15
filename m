Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D56F7EC146
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 12:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633574.988543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3E2X-0005f5-I5; Wed, 15 Nov 2023 11:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633574.988543; Wed, 15 Nov 2023 11:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3E2X-0005aJ-Dt; Wed, 15 Nov 2023 11:26:37 +0000
Received: by outflank-mailman (input) for mailman id 633574;
 Wed, 15 Nov 2023 11:26:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zXr+=G4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1r3E2W-0005V6-17
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 11:26:36 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3fb67b3-83a9-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 12:26:32 +0100 (CET)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 36B251C1C99;
 Wed, 15 Nov 2023 06:26:32 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 2EF4C1C1C96;
 Wed, 15 Nov 2023 06:26:32 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 7779B1C1C94;
 Wed, 15 Nov 2023 06:26:31 -0500 (EST)
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
X-Inumbo-ID: d3fb67b3-83a9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=bJ1K9417KGsGUq+XU588aVVIf
	/tv3/XL1FVqkz2VF7A=; b=vn9D5N5Q99fKdsV0zwrWAywVo5Q/2YxKPG6uSMGrp
	ERvWdm76Gsx8DGi0ko/UnV1gFsT1iv+V+VjOS356Z5KrE2NuS8DbMwFSCym41rW/
	I/JUmehNOqs3lXwxHdH9jgrIIyqqEtxf54XQVGeXtl+NjHaTQp5UMMK5gw+xOeM7
	7M=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [RFC PATCH 5/6] xen/arm: Intercept vPCI config accesses and forward them to emulator
Date: Wed, 15 Nov 2023 13:26:10 +0200
Message-Id: <20231115112611.3865905-6-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 D36F423A-83A9-11EE-A32A-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is needed for supporting virtio-pci.

In case when the PCI Host bridge is emulated outside of Xen
(IOREQ server), we need some mechanism to intercept config space
accesses on Xen on Arm, and forward them to the emulator
(for example, virtio backend) via IOREQ request.

Unlike x86, on Arm these accesses are MMIO, there is no CFC/CF8 method
to detect which PCI device is targeted.

In order to not mix PCI passthrough with virtio-pci features we add
one more region to cover the total configuration space for all possible
host bridges which can serve virtio-pci devices for that guest.
We expose one PCI host bridge per virtio backend domain.

To distinguish between virtio-pci devices belonging to PCI host
bridges emulated by device-models running in different backend domains
we also need to calculate a segment in virtio_pci_ioreq_server_get_addr()=
.
For this to work the toolstack is responsible to allocate and assign uniq=
ue
configuration space range and segment (host_id) within total reserved ran=
ge
for these device-models. The device-models are responsible for applying
a segment when forming DM op for registering PCI devices with IOREQ Serve=
r.

Introduce new CONFIG_VIRTIO_PCI to guard the whole handling.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/arm/Kconfig                  |  10 +++
 xen/arch/arm/domain.c                 |   2 +-
 xen/arch/arm/{ =3D> include/asm}/vpci.h |  11 +++
 xen/arch/arm/io.c                     |   8 +-
 xen/arch/arm/ioreq.c                  |  19 ++++-
 xen/arch/arm/vpci.c                   | 106 +++++++++++++++++++++++++-
 6 files changed, 146 insertions(+), 10 deletions(-)
 rename xen/arch/arm/{ =3D> include/asm}/vpci.h (75%)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2939db429b..9e8d6c4ce2 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -190,6 +190,16 @@ config STATIC_SHM
 	help
 	  This option enables statically shared memory on a dom0less system.
=20
+config VIRTIO_PCI
+	bool "Support of virtio-pci transport" if EXPERT
+	depends on ARM_64
+	select HAS_PCI
+	select HAS_VPCI
+	select IOREQ_SERVER
+	default n
+	help
+	  This option enables support of virtio-pci transport
+
 endmenu
=20
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 28e3aaa5e4..140f9bbd58 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -28,9 +28,9 @@
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
+#include <asm/vpci.h>
 #include <asm/vtimer.h>
=20
-#include "vpci.h"
 #include "vuart.h"
=20
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/include/asm/vpci.h
similarity index 75%
rename from xen/arch/arm/vpci.h
rename to xen/arch/arm/include/asm/vpci.h
index 3c713f3fcd..54d083c67b 100644
--- a/xen/arch/arm/vpci.h
+++ b/xen/arch/arm/include/asm/vpci.h
@@ -30,6 +30,17 @@ static inline unsigned int domain_vpci_get_num_mmio_ha=
ndlers(struct domain *d)
 }
 #endif
=20
+#ifdef CONFIG_VIRTIO_PCI
+bool virtio_pci_ioreq_server_get_addr(const struct domain *d,
+                                      paddr_t gpa, uint64_t *addr);
+#else
+static inline bool virtio_pci_ioreq_server_get_addr(const struct domain =
*d,
+                                                    paddr_t gpa, uint64_=
t *addr)
+{
+    return false;
+}
+#endif
+
 #endif /* __ARCH_ARM_VPCI_H__ */
=20
 /*
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 96c740d563..5c3e03e30d 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -26,6 +26,7 @@ static enum io_state handle_read(const struct mmio_hand=
ler *handler,
 {
     const struct hsr_dabt dabt =3D info->dabt;
     struct cpu_user_regs *regs =3D guest_cpu_user_regs();
+    int ret;
     /*
      * Initialize to zero to avoid leaking data if there is an
      * implementation error in the emulation (such as not correctly
@@ -33,8 +34,9 @@ static enum io_state handle_read(const struct mmio_hand=
ler *handler,
      */
     register_t r =3D 0;
=20
-    if ( !handler->ops->read(v, info, &r, handler->priv) )
-        return IO_ABORT;
+    ret =3D handler->ops->read(v, info, &r, handler->priv);
+    if ( ret !=3D IO_HANDLED )
+        return ret !=3D IO_RETRY ? IO_ABORT : ret;
=20
     r =3D sign_extend(dabt, r);
=20
@@ -53,7 +55,7 @@ static enum io_state handle_write(const struct mmio_han=
dler *handler,
=20
     ret =3D handler->ops->write(v, info, get_user_reg(regs, dabt.reg),
                               handler->priv);
-    return ret ? IO_HANDLED : IO_ABORT;
+    return ret !=3D IO_HANDLED && ret !=3D IO_RETRY ? IO_ABORT : ret;
 }
=20
 /* This function assumes that mmio regions are not overlapped */
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 5df755b48b..fd4cc755b6 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -10,6 +10,7 @@
=20
 #include <asm/traps.h>
 #include <asm/ioreq.h>
+#include <asm/vpci.h>
=20
 #include <public/hvm/ioreq.h>
=20
@@ -193,12 +194,24 @@ bool arch_ioreq_server_get_type_addr(const struct d=
omain *d,
                                      uint8_t *type,
                                      uint64_t *addr)
 {
+    uint64_t pci_addr;
+
     if ( p->type !=3D IOREQ_TYPE_COPY && p->type !=3D IOREQ_TYPE_PIO )
         return false;
=20
-    *type =3D (p->type =3D=3D IOREQ_TYPE_PIO) ?
-             XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
-    *addr =3D p->addr;
+    if ( p->type =3D=3D IOREQ_TYPE_COPY &&
+         virtio_pci_ioreq_server_get_addr(d, p->addr, &pci_addr) )
+    {
+        /* PCI config data cycle */
+        *type =3D XEN_DMOP_IO_RANGE_PCI;
+        *addr =3D pci_addr;
+    }
+    else
+    {
+        *type =3D (p->type =3D=3D IOREQ_TYPE_PIO) ?
+                 XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
+        *addr =3D p->addr;
+    }
=20
     return true;
 }
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb5508..1de4c3e71b 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -2,9 +2,12 @@
 /*
  * xen/arch/arm/vpci.c
  */
+#include <xen/ioreq.h>
 #include <xen/sched.h>
+#include <xen/sizes.h>
 #include <xen/vpci.h>
=20
+#include <asm/ioreq.h>
 #include <asm/mmio.h>
=20
 static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridg=
e,
@@ -24,6 +27,27 @@ static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_=
host_bridge *bridge,
     return sbdf;
 }
=20
+bool virtio_pci_ioreq_server_get_addr(const struct domain *d,
+                                      paddr_t gpa, uint64_t *addr)
+{
+    pci_sbdf_t sbdf;
+
+    if ( !has_vpci(d) )
+        return false;
+
+    if ( gpa < GUEST_VIRTIO_PCI_ECAM_BASE ||
+         gpa >=3D GUEST_VIRTIO_PCI_ECAM_BASE + GUEST_VIRTIO_PCI_TOTAL_EC=
AM_SIZE )
+        return false;
+
+    sbdf.sbdf =3D VPCI_ECAM_BDF((gpa - GUEST_VIRTIO_PCI_ECAM_BASE) %
+        GUEST_VIRTIO_PCI_HOST_ECAM_SIZE);
+    sbdf.seg =3D (gpa - GUEST_VIRTIO_PCI_ECAM_BASE) /
+        GUEST_VIRTIO_PCI_HOST_ECAM_SIZE;
+    *addr =3D ((uint64_t)sbdf.sbdf << 32) | ECAM_REG_OFFSET(gpa);
+
+    return true;
+}
+
 static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
                           register_t *r, void *p)
 {
@@ -36,12 +60,12 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t=
 *info,
                         1U << info->dabt.size, &data) )
     {
         *r =3D data;
-        return 1;
+        return IO_HANDLED;
     }
=20
     *r =3D ~0ul;
=20
-    return 0;
+    return IO_ABORT;
 }
=20
 static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
@@ -59,6 +83,61 @@ static const struct mmio_handler_ops vpci_mmio_handler=
 =3D {
     .write =3D vpci_mmio_write,
 };
=20
+#ifdef CONFIG_VIRTIO_PCI
+static int virtio_pci_mmio_read(struct vcpu *v, mmio_info_t *info,
+                                register_t *r, void *p)
+{
+    const uint8_t access_size =3D (1 << info->dabt.size) * 8;
+    const uint64_t access_mask =3D GENMASK_ULL(access_size - 1, 0);
+    int rc =3D IO_HANDLED;
+
+    ASSERT(!is_hardware_domain(v->domain));
+
+    if ( domain_has_ioreq_server(v->domain) )
+    {
+        rc =3D try_fwd_ioserv(guest_cpu_user_regs(), v, info);
+        if ( rc =3D=3D IO_HANDLED )
+        {
+            *r =3D v->io.req.data;
+            v->io.req.state =3D STATE_IOREQ_NONE;
+            return IO_HANDLED;
+        }
+        else if ( rc =3D=3D IO_UNHANDLED )
+            rc =3D IO_HANDLED;
+    }
+
+    *r =3D access_mask;
+    return rc;
+}
+
+static int virtio_pci_mmio_write(struct vcpu *v, mmio_info_t *info,
+                                 register_t r, void *p)
+{
+    int rc =3D IO_HANDLED;
+
+    ASSERT(!is_hardware_domain(v->domain));
+
+    if ( domain_has_ioreq_server(v->domain) )
+    {
+        rc =3D try_fwd_ioserv(guest_cpu_user_regs(), v, info);
+        if ( rc =3D=3D IO_HANDLED )
+        {
+            v->io.req.state =3D STATE_IOREQ_NONE;
+            return IO_HANDLED;
+        }
+        else if ( rc =3D=3D IO_UNHANDLED )
+            rc =3D IO_HANDLED;
+    }
+
+    return rc;
+}
+
+static const struct mmio_handler_ops virtio_pci_mmio_handler =3D {
+    .read  =3D virtio_pci_mmio_read,
+    .write =3D virtio_pci_mmio_write,
+};
+#endif
+
 static int vpci_setup_mmio_handler_cb(struct domain *d,
                                       struct pci_host_bridge *bridge)
 {
@@ -90,9 +169,17 @@ int domain_vpci_init(struct domain *d)
             return ret;
     }
     else
+    {
         register_mmio_handler(d, &vpci_mmio_handler,
                               GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE=
, NULL);
=20
+#ifdef CONFIG_VIRTIO_PCI
+        register_mmio_handler(d, &virtio_pci_mmio_handler,
+                              GUEST_VIRTIO_PCI_ECAM_BASE,
+                              GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE, NULL);
+#endif
+    }
+
     return 0;
 }
=20
@@ -105,6 +192,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
=20
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
=20
@@ -125,7 +214,18 @@ unsigned int domain_vpci_get_num_mmio_handlers(struc=
t domain *d)
      * For guests each host bridge requires one region to cover the
      * configuration space. At the moment, we only expose a single host =
bridge.
      */
-    return 1;
+    count =3D 1;
+
+    /*
+     * In order to not mix PCI passthrough with virtio-pci features we a=
dd
+     * one more region to cover the total configuration space for all po=
ssible
+     * host bridges which can serve virtio devices for that guest.
+     * We expose one host bridge per virtio backend domain.
+     */
+    if ( IS_ENABLED(CONFIG_VIRTIO_PCI) )
+        count++;
+
+    return count;
 }
=20
 /*
--=20
2.25.1


