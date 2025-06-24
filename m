Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A63AE5AB9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 06:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022973.1398907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqP-0004sZ-TU; Tue, 24 Jun 2025 04:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022973.1398907; Tue, 24 Jun 2025 04:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqP-0004ov-OS; Tue, 24 Jun 2025 04:01:13 +0000
Received: by outflank-mailman (input) for mailman id 1022973;
 Tue, 24 Jun 2025 04:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTulk-000639-8f
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:56:24 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31584067-50af-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 05:56:22 +0200 (CEST)
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
X-Inumbo-ID: 31584067-50af-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750737381; x=1750996581;
	bh=7T+qIgAVUUiUK7ZTM4nraoYQpj7JidPaaBMAqs8DTzI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gYTSUmos3OTm/ib6bGqk3P2QXZpmK3ZA3efPElwsFB2j22ReGJzpzlNg/hquCDDue
	 7duJ8O/RT7lI2OM25Y7EdJfmy1QuD9NuWx6QIJ6ry0bfqReywOxhqHw1OtudLm72EB
	 F6nNLRX4EHVYMKSuPNlFoaJ4uJuv4lhfH1R/GhCAmS0ZikHydlXeHnNstFZFox5RfV
	 kM+roRK/2OKyym7xane8d04kqrd22y3FCSMZCmbbPOVjSFzWKafr56a7NdvGFT7eaJ
	 I/KLSS/GUTESRGJDgZlpLS1xZNil924ILXHbxpnlNWW5mCeGOIyY/wGe3aRyHrKrc2
	 2PBDgcb6cXXnw==
Date: Tue, 24 Jun 2025 03:56:17 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 09/16] arm/vuart: use void pointer in domain struct
Message-ID: <20250624035443.344099-10-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 73cbc7bdf76c47a54c44afdb6056201ea0f919a1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Make all public data structures private to simple MMIO-based vUART
implementation and switch struct domain to using void pointer to reduce
compile-time dependencies.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/include/asm/domain.h | 14 ++-----
 xen/arch/arm/vuart.c              | 68 ++++++++++++++++++++++---------
 2 files changed, 52 insertions(+), 30 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index d668c11d7e2c..38873c66f1f8 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -90,16 +90,6 @@ struct arch_domain
=20
     struct vgic_dist vgic;
=20
-#ifdef CONFIG_HAS_VUART_MMIO
-    struct vuart {
-#define VUART_BUF_SIZE 128
-        char                        *buf;
-        int                         idx;
-        const struct vuart_info     *info;
-        spinlock_t                  lock;
-    } vuart;
-#endif
-
     unsigned int evtchn_irq;
 #ifdef CONFIG_ACPI
     void *efi_acpi_table;
@@ -116,6 +106,10 @@ struct arch_domain
     void *vpl011;
 #endif
=20
+#ifdef CONFIG_HAS_VUART_MMIO
+    void *vuart;
+#endif
+
 #ifdef CONFIG_TEE
     void *tee;
 #endif
diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index 5403ed284846..d2f90ab0c64f 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -29,8 +29,16 @@
 #include <asm/mmio.h>
 #include <xen/perfc.h>
 #include <xen/vuart.h>
+#include <xen/xvmalloc.h>
=20
-#define domain_has_vuart(d) ((d)->arch.vuart.info !=3D NULL)
+#define VUART_BUF_SIZE          128
+
+struct vuart {
+    char                        *buf;
+    int                         idx;
+    const struct vuart_info     *info;
+    spinlock_t                  lock;
+};
=20
 static int vuart_mmio_read(struct vcpu *v, mmio_info_t *info,
                            register_t *r, void *priv);
@@ -44,39 +52,57 @@ static const struct mmio_handler_ops vuart_mmio_handler=
 =3D {
=20
 int domain_vuart_init(struct domain *d)
 {
-    ASSERT( is_hardware_domain(d) );
+    const struct vuart_info *info;
+    struct vuart *vdev;
=20
-    d->arch.vuart.info =3D serial_vuart_info(SERHND_DTUART);
-    if ( !d->arch.vuart.info )
+    if ( !is_hardware_domain(d) )
         return 0;
=20
-    spin_lock_init(&d->arch.vuart.lock);
-    d->arch.vuart.idx =3D 0;
+    info =3D serial_vuart_info(SERHND_DTUART);
+    if ( !info )
+        return 0;
=20
-    d->arch.vuart.buf =3D xzalloc_array(char, VUART_BUF_SIZE);
-    if ( !d->arch.vuart.buf )
+    vdev =3D xvzalloc(typeof(*vdev));
+    if ( !vdev )
         return -ENOMEM;
=20
-    register_mmio_handler(d, &vuart_mmio_handler,
-                          d->arch.vuart.info->base_addr,
-                          d->arch.vuart.info->size,
+    vdev->buf =3D xzalloc_array(char, VUART_BUF_SIZE);
+    if ( !vdev->buf )
+    {
+        xfree(vdev);
+        return -ENOMEM;
+    }
+
+    spin_lock_init(&vdev->lock);
+
+    register_mmio_handler(d,
+                          &vuart_mmio_handler,
+                          info->base_addr,
+                          info->size,
                           NULL);
=20
+    vdev->info =3D info;
+    d->arch.vuart =3D vdev;
+
     return 0;
 }
=20
 void domain_vuart_free(struct domain *d)
 {
-    if ( !domain_has_vuart(d) )
-        return;
+    struct vuart *vdev =3D d->arch.vuart;
=20
-    xfree(d->arch.vuart.buf);
+    if ( vdev )
+    {
+        xfree(vdev->buf);
+        xfree(vdev);
+        d->arch.vuart =3D NULL;
+    }
 }
=20
 static void vuart_print_char(struct vcpu *v, char c)
 {
     struct domain *d =3D v->domain;
-    struct vuart *uart =3D &d->arch.vuart;
+    struct vuart *uart =3D d->arch.vuart;
=20
     if ( !is_console_printable(c) )
         return ;
@@ -98,16 +124,17 @@ static int vuart_mmio_read(struct vcpu *v, mmio_info_t=
 *info,
                            register_t *r, void *priv)
 {
     struct domain *d =3D v->domain;
-    paddr_t offset =3D info->gpa - d->arch.vuart.info->base_addr;
+    struct vuart *vdev =3D d->arch.vuart;
+    paddr_t offset =3D info->gpa - vdev->info->base_addr;
=20
     perfc_incr(vuart_reads);
=20
     /* By default zeroed the register */
     *r =3D 0;
=20
-    if ( offset =3D=3D d->arch.vuart.info->status_off )
+    if ( offset =3D=3D vdev->info->status_off )
         /* All holding registers empty, ready to send etc */
-        *r =3D d->arch.vuart.info->status;
+        *r =3D vdev->info->status;
=20
     return 1;
 }
@@ -116,11 +143,12 @@ static int vuart_mmio_write(struct vcpu *v, mmio_info=
_t *info,
                             register_t r, void *priv)
 {
     struct domain *d =3D v->domain;
-    paddr_t offset =3D info->gpa - d->arch.vuart.info->base_addr;
+    struct vuart *vdev =3D d->arch.vuart;
+    paddr_t offset =3D info->gpa - vdev->info->base_addr;
=20
     perfc_incr(vuart_writes);
=20
-    if ( offset =3D=3D d->arch.vuart.info->data_off )
+    if ( offset =3D=3D vdev->info->data_off )
         /* ignore any status bits */
         vuart_print_char(v, r & 0xFF);
=20
--=20
2.34.1



