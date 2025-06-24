Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E0AE5AB6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 06:01:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022961.1398877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqF-0003UN-VH; Tue, 24 Jun 2025 04:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022961.1398877; Tue, 24 Jun 2025 04:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqF-0003QQ-NX; Tue, 24 Jun 2025 04:01:03 +0000
Received: by outflank-mailman (input) for mailman id 1022961;
 Tue, 24 Jun 2025 04:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTumk-0006IZ-W9
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:57:26 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 574ca993-50af-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 05:57:26 +0200 (CEST)
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
X-Inumbo-ID: 574ca993-50af-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750737445; x=1750996645;
	bh=XBHNSuDbgBBMVwzL8Si36lrzIPH6BlSYi7VpRWP3DmY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bnXBk56uU4B3o8hqrw5rpChmiKLfMsbyky9ML+81U/L7dns2DqJIL4R1ta73+Zklq
	 LKpZYSEfpMHdCY2aVUJY4tL9ayh0LDCf+3VhOZ2LV0xJ4LVOOkl9p5jN35AK2iI9Wk
	 b7N7D0Vs8PPdDLe1hQ5OGkIRsglVNiwKK6+ak0q+g3wMKi1Mv1pUu5bEg6ymEqmuhh
	 RpcASFCkyjUmFRW2G5bEus6IsUo2rD+3QdeAe7G0aid+QJ7gr6ZLiGR6sClj0zF8ar
	 vg6Au5UQCIdiTa+958eke45qh+SHAPzN0sbrLDKZvjvYZWVzQ/9rbIc8m1Dk6DjFyQ
	 cMzzHsBpp1U8A==
Date: Tue, 24 Jun 2025 03:57:18 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 16/16] drivers/vuart: hook simple MMIO-based UART to vUART framework
Message-ID: <20250624035443.344099-17-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 1977647053db5ab95117f34afa1110e2b05be770
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Add new emulation flag DOMAIN_EMU_UART_MMIO and add it to domain_has_vuart(=
).

Add needed shims for vuart framework integration to MMIO-based UART emulato=
r.

Remove domain_vuart_{init,free}() and use generic vuart_{init,exit}() calls=
.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/domain.c          |  7 +++++--
 xen/common/domain.c            |  3 +++
 xen/drivers/vuart/vuart-mmio.c | 36 ++++++++++++++++++++++++++++++++--
 xen/include/xen/domain-emu.h   |  1 +
 xen/include/xen/vuart.h        | 20 -------------------
 5 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 3579d10d7e1d..5d7006241be0 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -780,7 +780,10 @@ int arch_domain_create(struct domain *d,
      * Only use it for the hardware domain because the linux kernel may no=
t
      * support multi-platform.
      */
-    if ( is_hardware_domain(d) && (rc =3D domain_vuart_init(d)) )
+    if ( is_hardware_domain(d) && IS_ENABLED(CONFIG_HAS_VUART_MMIO) )
+        d->emulation_flags |=3D DOMAIN_EMU_UART_MMIO;
+
+    if ( domain_has_vuart(d) && (rc =3D vuart_init(d, NULL)) !=3D 0 )
         goto fail;
=20
     if ( (rc =3D domain_vpci_init(d)) !=3D 0 )
@@ -849,7 +852,7 @@ void arch_domain_destroy(struct domain *d)
     iommu_domain_destroy(d);
     p2m_final_teardown(d);
     domain_vgic_free(d);
-    domain_vuart_free(d);
+    vuart_exit(d);
     free_xenheap_page(d->shared_info);
 #ifdef CONFIG_ACPI
     free_xenheap_pages(d->arch.efi_acpi_table,
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 071fee81fe2c..fc0ceb266d88 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2443,6 +2443,9 @@ bool domain_has_vuart(const struct domain *d)
     if ( IS_ENABLED(CONFIG_HAS_VUART_PL011) )
         mask |=3D DOMAIN_EMU_UART_PL011;
=20
+    if ( IS_ENABLED(CONFIG_HAS_VUART_MMIO) )
+        mask |=3D DOMAIN_EMU_UART_MMIO;
+
     return !!(d->emulation_flags & mask);
 }
=20
diff --git a/xen/drivers/vuart/vuart-mmio.c b/xen/drivers/vuart/vuart-mmio.=
c
index 66fac6c994ce..1888e44e3d94 100644
--- a/xen/drivers/vuart/vuart-mmio.c
+++ b/xen/drivers/vuart/vuart-mmio.c
@@ -49,7 +49,7 @@ static const struct mmio_handler_ops vuart_mmio_handler =
=3D {
     .write =3D vuart_mmio_write,
 };
=20
-int domain_vuart_init(struct domain *d)
+static int cf_check vuart_mmio_init(struct domain *d, struct vuart_params =
*params)
 {
     const struct vuart_info *info;
     struct vuart *vdev;
@@ -86,7 +86,7 @@ int domain_vuart_init(struct domain *d)
     return 0;
 }
=20
-void domain_vuart_free(struct domain *d)
+static void cf_check vuart_mmio_exit(struct domain *d)
 {
     struct vuart *vdev =3D d->arch.vuart;
=20
@@ -147,6 +147,38 @@ static int vuart_mmio_write(struct vcpu *v, mmio_info_=
t *info,
     return 1;
 }
=20
+static void cf_check vuart_mmio_dump(const struct domain *d)
+{
+    struct vuart *vdev =3D d->arch.vuart;
+
+    if ( !vdev )
+        return;
+
+    /* Allow printing state in case of a deadlock. */
+    if ( !spin_trylock(&vdev->lock) )
+        return;
+
+    printk("Virtual MMIO UART@%"PRIpaddr" owner %pd\n",
+           vdev->info->base_addr, d);
+    printk("  RX FIFO size %u idx %u\n",
+           VUART_BUF_SIZE, vdev->idx);
+    printk("  status 0x%lx 0x%lx\n",
+           vdev->info->status_off, vdev->info->status);
+
+    spin_unlock(&vdev->lock);
+}
+
+static const struct vuart_ops vuart_mmio_ops =3D {
+    .add_fwnode =3D NULL,
+    .init       =3D vuart_mmio_init,
+    .exit       =3D vuart_mmio_exit,
+    .dump       =3D vuart_mmio_dump,
+    /* Physical console focus is not supported */
+    .putchar    =3D NULL,
+};
+
+VUART_REGISTER(mmio, &vuart_mmio_ops);
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/domain-emu.h b/xen/include/xen/domain-emu.h
index 1d3a6c80fadd..9ef607666842 100644
--- a/xen/include/xen/domain-emu.h
+++ b/xen/include/xen/domain-emu.h
@@ -18,6 +18,7 @@
 #define DOMAIN_EMU_PCI              (1U << 10)
=20
 #define DOMAIN_EMU_UART_PL011       (1U << 15)
+#define DOMAIN_EMU_UART_MMIO        (1U << 16)
=20
 #endif /* XEN_DOMAIN_EMU_H */
=20
diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
index 1f4b47575359..4c923025b4eb 100644
--- a/xen/include/xen/vuart.h
+++ b/xen/include/xen/vuart.h
@@ -60,26 +60,6 @@ static inline int vuart_putchar(struct domain *d, char c=
)
=20
 #endif /* CONFIG_HAS_VUART */
=20
-#ifdef CONFIG_HAS_VUART_MMIO
-
-int domain_vuart_init(struct domain *d);
-void domain_vuart_free(struct domain *d);
-
-#else
-
-static inline int domain_vuart_init(struct domain *d)
-{
-    /*
-     * The vUART is unconditionally inialized for the hw domain. So we
-     * can't return an error.
-     */
-    return 0;
-}
-
-static inline void domain_vuart_free(struct domain *d) {};
-
-#endif /* CONFIG_HAS_VUART_MMIO */
-
 #endif /* XEN_VUART_H */
=20
 /*
--=20
2.34.1



