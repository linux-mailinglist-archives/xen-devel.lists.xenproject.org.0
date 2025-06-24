Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9E6AE5A9F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 05:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022915.1398797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTukv-00079s-A6; Tue, 24 Jun 2025 03:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022915.1398797; Tue, 24 Jun 2025 03:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTukv-00077K-7E; Tue, 24 Jun 2025 03:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1022915;
 Tue, 24 Jun 2025 03:55:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTuku-000639-8e
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:55:32 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 107216de-50af-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 05:55:27 +0200 (CEST)
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
X-Inumbo-ID: 107216de-50af-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7g7ds4sgnbbihb27j7qq7z4iwq.protonmail; t=1750737326; x=1750996526;
	bh=dPqyJU0mYRSIBJYCmrPsH7iYJx5buk1sy890qmF0Tmw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dvpyMqsUZLPINvEcjflIliFXuDqRJcrcIFmcNj3RMVV7DuwyIOwnnu+Z/rOMJEKN4
	 b8rTXJ/TJaNkSuXk6TaogyMTjh8AxSzl6pLTnfQGZs4ToQKkwpTLk79ii5kk64asWW
	 3ekwlv4wz33ItTBn26fwejLk/lDSIkxjOcWOoIFL/r4ds7YE48TJFobUXL59sKQeQc
	 NYg3UzzFbcVEf5C2kvg9KWUuCqdNjqcWRGzNcm0kCL2zUFv4nDVAc22nu+QSvwNONK
	 JxcjhvegN+K6ud4KKrwXHstZfH9ahuRJv5aAC6Wl44bAZWM1JPWPRKKGa04kX+v1Gf
	 cr5PkBy9rQqpQ==
Date: Tue, 24 Jun 2025 03:55:22 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 03/16] arm/vpl011: use vuart_ prefix in vpl011 public calls
Message-ID: <20250624035443.344099-4-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3253eba4e882246fd04bbb7112b4eac0d3f069ba
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Use generic names prefixed with 'vuart_' in public PL011 emulator data
structures and functions.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/dom0less-build.c     |  4 ++--
 xen/arch/arm/domain.c             |  3 ++-
 xen/arch/arm/domctl.c             | 14 +++++++------
 xen/arch/arm/include/asm/vpl011.h | 20 ------------------
 xen/arch/arm/vpl011.c             | 24 +++++++++++-----------
 xen/drivers/char/console.c        |  6 ++----
 xen/include/xen/vuart.h           | 34 ++++++++++++++++++++++++++++++-
 7 files changed, 59 insertions(+), 46 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 7c1b59750fb5..11b8498d3b22 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -216,7 +216,7 @@ int __init init_vuart(struct domain *d, struct kernel_i=
nfo *kinfo,
      */
     if ( kinfo->arch.vpl011 )
     {
-        rc =3D domain_vpl011_init(d, NULL);
+        rc =3D vuart_init(d, NULL);
         if ( rc < 0 )
             return rc;
     }
@@ -247,7 +247,7 @@ void __init arch_create_domUs(struct dt_device_node *no=
de,
          * d->arch.vpl011.irq. So the logic to find the vIRQ has to
          * be hardcoded.
          * The logic here shall be consistent with the one in
-         * domain_vpl011_init().
+         * vuart_init().
          */
         if ( flags & CDF_directmap )
         {
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index be58a23dd725..68297e619bad 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -11,6 +11,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/wait.h>
+#include <xen/vuart.h>
=20
 #include <asm/arm64/sve.h>
 #include <asm/cpuerrata.h>
@@ -1072,7 +1073,7 @@ int domain_relinquish_resources(struct domain *d)
          * Release the resources allocated for vpl011 which were
          * allocated via a DOMCTL call XEN_DOMCTL_vuart_op.
          */
-        domain_vpl011_deinit(d);
+        vuart_exit(d);
=20
 #ifdef CONFIG_IOREQ_SERVER
         ioreq_server_destroy_all(d);
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad914c915f81..dde25ceff6d0 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -14,6 +14,7 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/types.h>
+#include <xen/vuart.h>
 #include <xsm/xsm.h>
 #include <public/domctl.h>
=20
@@ -30,10 +31,11 @@ static int handle_vuart_init(struct domain *d,
                              struct xen_domctl_vuart_op *vuart_op)
 {
     int rc;
-    struct vpl011_init_info info;
-
-    info.console_domid =3D vuart_op->console_domid;
-    info.gfn =3D _gfn(vuart_op->gfn);
+    struct vuart_params params =3D {
+        .console_domid =3D vuart_op->console_domid,
+        .gfn =3D _gfn(vuart_op->gfn),
+        .evtchn =3D 0,
+    };
=20
     if ( d->creation_finished )
         return -EPERM;
@@ -41,10 +43,10 @@ static int handle_vuart_init(struct domain *d,
     if ( vuart_op->type !=3D XEN_DOMCTL_VUART_TYPE_VPL011 )
         return -EOPNOTSUPP;
=20
-    rc =3D domain_vpl011_init(d, &info);
+    rc =3D vuart_init(d, &params);
=20
     if ( !rc )
-        vuart_op->evtchn =3D info.evtchn;
+        vuart_op->evtchn =3D params.evtchn;
=20
     return rc;
 }
diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/v=
pl011.h
index be64883b8628..5c308cc8c148 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -59,26 +59,6 @@ struct vpl011 {
     evtchn_port_t evtchn;
 };
=20
-struct vpl011_init_info {
-    domid_t console_domid;
-    gfn_t gfn;
-    evtchn_port_t evtchn;
-};
-
-#ifdef CONFIG_HAS_VUART_PL011
-int domain_vpl011_init(struct domain *d,
-                       struct vpl011_init_info *info);
-void domain_vpl011_deinit(struct domain *d);
-int vpl011_rx_char_xen(struct domain *d, char c);
-#else
-static inline int domain_vpl011_init(struct domain *d,
-                                     struct vpl011_init_info *info)
-{
-    return -ENOSYS;
-}
-
-static inline void domain_vpl011_deinit(struct domain *d) { }
-#endif
 #endif  /* _VPL011_H_ */
=20
 /*
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index cafc532cf028..2cf88a70ecdb 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -134,7 +134,7 @@ static void vpl011_write_data_xen(struct domain *d, uin=
t8_t data)
=20
 /*
  * vpl011_read_data_xen reads data when the backend is xen. Characters
- * are added to the vpl011 receive buffer by vpl011_rx_char_xen.
+ * are added to the vpl011 receive buffer by vuart_putchar.
  */
 static uint8_t vpl011_read_data_xen(struct domain *d)
 {
@@ -571,9 +571,9 @@ static void vpl011_data_avail(struct domain *d,
 }
=20
 /*
- * vpl011_rx_char_xen adds a char to a domain's vpl011 receive buffer.
+ * vuart_putchar adds a char to a domain's vpl011 receive buffer.
  */
-int vpl011_rx_char_xen(struct domain *d, char c)
+int vuart_putchar(struct domain *d, char c)
 {
     unsigned long flags;
     struct vpl011 *vpl011 =3D &d->arch.vpl011;
@@ -642,7 +642,7 @@ static void vpl011_notification(struct vcpu *v, unsigne=
d int port)
     VPL011_UNLOCK(d, flags);
 }
=20
-int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
+int vuart_init(struct domain *d, struct vuart_params *params)
 {
     int rc;
     struct vpl011 *vpl011 =3D &d->arch.vpl011;
@@ -694,27 +694,27 @@ int domain_vpl011_init(struct domain *d, struct vpl01=
1_init_info *info)
     }
=20
     /*
-     * info is NULL when the backend is in Xen.
-     * info is !=3D NULL when the backend is in a domain.
+     * params is NULL when the backend is in Xen.
+     * params is !=3D NULL when the backend is in a domain.
      */
-    if ( info !=3D NULL )
+    if ( params !=3D NULL )
     {
         vpl011->backend_in_domain =3D true;
=20
         /* Map the guest PFN to Xen address space. */
         rc =3D  prepare_ring_for_helper(d,
-                                      gfn_x(info->gfn),
+                                      gfn_x(params->gfn),
                                       &vpl011->backend.dom.ring_page,
                                       &vpl011->backend.dom.ring_buf);
         if ( rc < 0 )
             goto out;
=20
-        rc =3D alloc_unbound_xen_event_channel(d, 0, info->console_domid,
+        rc =3D alloc_unbound_xen_event_channel(d, 0, params->console_domid=
,
                                              vpl011_notification);
         if ( rc < 0 )
             goto out1;
=20
-        vpl011->evtchn =3D info->evtchn =3D rc;
+        vpl011->evtchn =3D params->evtchn =3D rc;
     }
     else
     {
@@ -746,13 +746,13 @@ int domain_vpl011_init(struct domain *d, struct vpl01=
1_init_info *info)
     return 0;
=20
 out1:
-    domain_vpl011_deinit(d);
+    vuart_exit(d);
=20
 out:
     return rc;
 }
=20
-void domain_vpl011_deinit(struct domain *d)
+void vuart_exit(struct domain *d)
 {
     struct vpl011 *vpl011 =3D &d->arch.vpl011;
=20
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 0f37badc471e..f322d59515ab 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -33,13 +33,11 @@
 #include <asm/setup.h>
 #include <xen/sections.h>
 #include <xen/consoled.h>
+#include <xen/vuart.h>
=20
 #ifdef CONFIG_X86
 #include <asm/guest.h>
 #endif
-#ifdef CONFIG_HAS_VUART_PL011
-#include <asm/vpl011.h>
-#endif
=20
 /* Internal console flags. */
 enum {
@@ -609,7 +607,7 @@ static void __serial_rx(char c)
 #ifdef CONFIG_HAS_VUART_PL011
     else
         /* Deliver input to the emulated UART. */
-        rc =3D vpl011_rx_char_xen(d, c);
+        rc =3D vuart_putchar(d, c);
 #endif
=20
     if ( consoled_is_enabled() )
diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
index bb883823ea31..cae72ac9c6b9 100644
--- a/xen/include/xen/vuart.h
+++ b/xen/include/xen/vuart.h
@@ -2,14 +2,46 @@
 #ifndef XEN_VUART_H
 #define XEN_VUART_H
=20
+#include <public/xen.h>
+#include <public/event_channel.h>
+#include <xen/types.h>
+
+struct vuart_params {
+    domid_t console_domid;
+    gfn_t gfn;
+    evtchn_port_t evtchn;
+};
+
 #ifdef CONFIG_HAS_VUART_PL011
+
 int __init vuart_add_fwnode(struct domain *d, void *node);
+int vuart_init(struct domain *d, struct vuart_params *params);
+void vuart_exit(struct domain *d);
+int vuart_putchar(struct domain *d, char c);
+
 #else
+
 static inline int __init vuart_add_fwnode(struct domain *d, void *node)
 {
     return 0;
 }
-#endif
+
+static inline int vuart_init(struct domain *d, struct vuart_params *params=
)
+{
+    return 0;
+}
+
+static inline void vuart_exit(struct domain *d)
+{
+}
+
+static inline int vuart_putchar(struct domain *d, char c)
+{
+    ASSERT_UNREACHABLE();
+    return -ENODEV;
+}
+
+#endif /* CONFIG_HAS_VUART_PL011 */
=20
 #endif /* XEN_VUART_H */
=20
--=20
2.34.1



