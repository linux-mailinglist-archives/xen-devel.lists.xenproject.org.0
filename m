Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C2B17694
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 21:22:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066271.1431509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYqm-0007od-Fu; Thu, 31 Jul 2025 19:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066271.1431509; Thu, 31 Jul 2025 19:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYqm-0007nd-Bm; Thu, 31 Jul 2025 19:22:00 +0000
Received: by outflank-mailman (input) for mailman id 1066271;
 Thu, 31 Jul 2025 19:21:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhYqk-00075q-VO
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 19:21:58 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9feebe00-6e43-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 21:21:57 +0200 (CEST)
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
X-Inumbo-ID: 9feebe00-6e43-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753989716; x=1754248916;
	bh=zoECH25YDbXdPHfB0p+7Gx5JFpntJLKgd+Ev0MYzaRE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Rq9L0vAOUN3qibhR0iaxdCvnrXNIYJIKxypeihxa6pdNfoLYnIjxkEJy6WPz1vyFo
	 MwnC9yGEecffdRpx0BOaaEmXRtjmdxYgD1bvLgQHWOUbXYjGbkpUn4rCZGXWIKy57V
	 dPTtmNt0uQ0SZzQue/Ng/lo+3k7WZ/AIc1eoGza+IwAwFdQkjl+CtSWyL7cZP19gLs
	 lVHcaYxiDx9Fuizvn9kPJpKF4BQCNbafBQ6R8m6hWZGGzO/6RsEjylxTtIR+Kx9RQ7
	 4TcsUnzzq4kMv6eVefGq8frmPB/Vz/TsRUh8b+eRK2d6GzLGuRG9DyMZC6/fKAwPYj
	 DcZziHFr16EnQ==
Date: Thu, 31 Jul 2025 19:21:54 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 3/8] x86/domain: allocate d->{iomem,irq}_caps before arch-specific initialization
Message-ID: <20250731192130.3948419-4-dmukhin@ford.com>
In-Reply-To: <20250731192130.3948419-1-dmukhin@ford.com>
References: <20250731192130.3948419-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b0e8eac80caf4ec0b2ae99bb705b93baabca747a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Move IRQ/IOMEM rangesets allocation before arch_domain_create().

That guarantees that arch-specific code could access those rangesets to
register traps for emulation.

It is necessary for those emulators registering trap handlers and ensuring
that emulated IRQs are not shared with the physical IRQs.

Move dom0_setup_permissions() call right after I/O rangesets are allocated.

Move pvh_setup_mmcfg() inside dom0_setup_permissions() close to the place
where MMCFG ranges are initialized.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Chanhes since v3:
- new patch
---
 xen/arch/x86/dom0_build.c     | 26 +++++++++++++++++++++++
 xen/arch/x86/hvm/dom0_build.c | 39 -----------------------------------
 xen/arch/x86/hvm/hvm.c        | 16 ++++++++++++++
 xen/common/domain.c           | 12 +++++------
 4 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4fc..e965f506a3c8 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -471,6 +471,24 @@ static void __init process_dom0_ioports_disable(struct=
 domain *dom0)
     }
 }
=20
+static void __hwdom_init setup_mmcfg(struct domain *d)
+{
+    unsigned int i;
+    int rc;
+
+    for ( i =3D 0; i < pci_mmcfg_config_num; i++ )
+    {
+        rc =3D register_vpci_mmcfg_handler(d, pci_mmcfg_config[i].address,
+                                         pci_mmcfg_config[i].start_bus_num=
ber,
+                                         pci_mmcfg_config[i].end_bus_numbe=
r,
+                                         pci_mmcfg_config[i].pci_segment);
+        if ( rc )
+            printk("Unable to setup MMCFG handler at %#lx for segment %u\n=
",
+                   pci_mmcfg_config[i].address,
+                   pci_mmcfg_config[i].pci_segment);
+    }
+}
+
 int __init dom0_setup_permissions(struct domain *d)
 {
     unsigned long mfn;
@@ -480,6 +498,14 @@ int __init dom0_setup_permissions(struct domain *d)
     if ( pv_shim )
         return 0;
=20
+    /*
+     * MMCFG initialization must be performed before setting domain
+     * permissions, as the MCFG areas must not be part of the domain IOMEM
+     * accessible regions.
+     */
+    if ( is_hvm_domain(d) )
+        setup_mmcfg(d);
+
     /* The hardware domain is initially permitted full I/O capabilities. *=
/
     rc =3D ioports_permit_access(d, 0, 0xFFFF);
     rc |=3D iomem_permit_access(d, 0UL,
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 5551f9044836..6f47c9eeeaa6 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1310,24 +1310,6 @@ static int __init pvh_setup_acpi(struct domain *d, p=
addr_t start_info)
     return 0;
 }
=20
-static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
-{
-    unsigned int i;
-    int rc;
-
-    for ( i =3D 0; i < pci_mmcfg_config_num; i++ )
-    {
-        rc =3D register_vpci_mmcfg_handler(d, pci_mmcfg_config[i].address,
-                                         pci_mmcfg_config[i].start_bus_num=
ber,
-                                         pci_mmcfg_config[i].end_bus_numbe=
r,
-                                         pci_mmcfg_config[i].pci_segment);
-        if ( rc )
-            printk("Unable to setup MMCFG handler at %#lx for segment %u\n=
",
-                   pci_mmcfg_config[i].address,
-                   pci_mmcfg_config[i].pci_segment);
-    }
-}
-
 int __init dom0_construct_pvh(const struct boot_domain *bd)
 {
     paddr_t entry, start_info;
@@ -1339,27 +1321,6 @@ int __init dom0_construct_pvh(const struct boot_doma=
in *bd)
     if ( bd->kernel =3D=3D NULL )
         panic("Missing kernel boot module for %pd construction\n", d);
=20
-    if ( is_hardware_domain(d) )
-    {
-        /*
-         * MMCFG initialization must be performed before setting domain
-         * permissions, as the MCFG areas must not be part of the domain I=
OMEM
-         * accessible regions.
-         */
-        pvh_setup_mmcfg(d);
-
-        /*
-         * Setup permissions early so that calls to add MMIO regions to th=
e
-         * p2m as part of vPCI setup don't fail due to permission checks.
-         */
-        rc =3D dom0_setup_permissions(d);
-        if ( rc )
-        {
-            printk("%pd unable to setup permissions: %d\n", d, rc);
-            return rc;
-        }
-    }
-
     /*
      * Craft dom0 physical memory map and set the paging allocation. This =
must
      * be done before the iommu initializion, since iommu initialization c=
ode
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index cb8ecd050d41..b7edb1d6555d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -35,6 +35,7 @@
 #include <asm/hap.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
+#include <asm/dom0_build.h>
 #include <asm/e820.h>
 #include <asm/regs.h>
 #include <asm/cpufeature.h>
@@ -651,6 +652,17 @@ int hvm_domain_initialise(struct domain *d,
             goto fail1;
         }
         memset(d->arch.hvm.io_bitmap, ~0, HVM_IOBITMAP_SIZE);
+
+        /*
+         * Setup permissions early so that calls to add MMIO regions to th=
e
+         * p2m as part of vPCI setup don't fail due to permission checks.
+         */
+        rc =3D dom0_setup_permissions(d);
+        if ( rc )
+        {
+            printk("%pd unable to setup permissions: %d\n", d, rc);
+            goto fail1;
+        }
     }
     else
         d->arch.hvm.io_bitmap =3D hvm_io_bitmap;
@@ -680,6 +692,10 @@ int hvm_domain_initialise(struct domain *d,
         break;
     }
=20
+    BUG_ON(!d->irq_caps);
+    BUG_ON(!d->iomem_caps);
+    BUG_ON(!d->arch.ioport_caps);
+
     vpic_init(d);
=20
     rc =3D vioapic_init(d);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5241a1629eeb..187637e8114a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -944,6 +944,12 @@ struct domain *domain_create(domid_t domid,
     radix_tree_init(&d->pirq_tree);
 #endif
=20
+    err =3D -ENOMEM;
+    d->iomem_caps =3D rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_=
hex);
+    d->irq_caps   =3D rangeset_new(d, "Interrupts", 0);
+    if ( !d->iomem_caps || !d->irq_caps )
+        goto fail;
+
     if ( (err =3D arch_domain_create(d, config, flags)) !=3D 0 )
         goto fail;
     init_status |=3D INIT_arch;
@@ -951,12 +957,6 @@ struct domain *domain_create(domid_t domid,
     watchdog_domain_init(d);
     init_status |=3D INIT_watchdog;
=20
-    err =3D -ENOMEM;
-    d->iomem_caps =3D rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_=
hex);
-    d->irq_caps   =3D rangeset_new(d, "Interrupts", 0);
-    if ( !d->iomem_caps || !d->irq_caps )
-        goto fail;
-
     if ( (err =3D xsm_domain_create(XSM_HOOK, d, config->ssidref)) !=3D 0 =
)
         goto fail;
=20
--=20
2.34.1



