Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D19B1768F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 21:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066288.1431538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYr6-0000nq-EK; Thu, 31 Jul 2025 19:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066288.1431538; Thu, 31 Jul 2025 19:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYr6-0000kP-A0; Thu, 31 Jul 2025 19:22:20 +0000
Received: by outflank-mailman (input) for mailman id 1066288;
 Thu, 31 Jul 2025 19:22:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhYr5-0008Dk-2S
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 19:22:19 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac4c0a31-6e43-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 21:22:18 +0200 (CEST)
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
X-Inumbo-ID: ac4c0a31-6e43-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=mf5fmfeiw5ha5k2lpkowwvxjba.protonmail; t=1753989737; x=1754248937;
	bh=rd0G6a/A4rABeVEFW8qJpuxTuABcWJivkWerOleXwlU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MNyGnYhYaaH8+FLwfbSbiLB/PZXSeQnvA1lQG0zmsdSdmRbUGZTU0ZpE11upnYzUu
	 wE7UtWK8bVJCBgmrRx2yOt+G/5axI8e/6HNzWYbEk0Kq8pGMaDdOTEjupCES4DkBVp
	 iUk6/GIpH69J/THOfXDvidHVCZ13IcK8BMlr9OWaEDt5TrWSoPEG66aDcRzKSCHhjN
	 Mu19j4IE2T52DRdCiBnJh7mZZZO+dE8RGW0lzB5hvTgmv5TMgbA3RxoCTyYcH7Ln+J
	 f9P24wy4tH8nGD39vO6KBRQDFxPVRhpKTyhNFSDCDZ9TxQRfMcge4L+Q14hmtXXVH8
	 RuDTvseE7J0ew==
Date: Thu, 31 Jul 2025 19:22:12 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 6/8] tools/xl: enable NS16550-compatible UART emulator for HVM (x86)
Message-ID: <20250731192130.3948419-7-dmukhin@ford.com>
In-Reply-To: <20250731192130.3948419-1-dmukhin@ford.com>
References: <20250731192130.3948419-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f3da0372c12c9890250b561537f7a33a735fa7be
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Enable UART emulator to be individually configured per HVM-domain.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- new patch
---
 docs/man/xl.cfg.5.pod.in             |  9 ++++--
 tools/golang/xenlight/helpers.gen.go |  4 +--
 tools/golang/xenlight/types.gen.go   |  3 +-
 tools/libs/light/libxl_arm.c         | 26 ++++++++++++-----
 tools/libs/light/libxl_create.c      |  2 +-
 tools/libs/light/libxl_types.idl     |  3 +-
 tools/libs/light/libxl_x86.c         | 42 ++++++++++++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/xl/xl_parse.c                  |  2 +-
 xen/arch/x86/domain.c                |  5 ++--
 11 files changed, 80 insertions(+), 18 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 5362fb0e9a6f..e1d012274eaf 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3032,14 +3032,17 @@ the domain was created.
 This requires hardware compatibility with the requested version, either
 natively or via hardware backwards compatibility support.
=20
-=3Ditem B<vuart=3D"uart">
+=3Ditem B<vuart=3D[ "sbsa_uart", "ns16550" ]>
=20
 To enable vuart console, user must specify the following option in the
-VM config file:
+VM config file, e.g:
=20
+```
 vuart =3D "sbsa_uart"
+```
=20
-Currently, only the "sbsa_uart" model is supported for ARM.
+Currently, "sbsa_uart" (ARM) and "ns16550" (x86) are the only supported
+UART models.
=20
 =3Dback
=20
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/h=
elpers.gen.go
index b43aad7d0064..e56af8a8a8c5 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1160,7 +1160,6 @@ x.TypeUnion =3D &typePvh
 default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion =3D GicVersion(xc.arch_arm.gic_version)
-x.ArchArm.Vuart =3D VuartType(xc.arch_arm.vuart)
 x.ArchArm.SveVl =3D SveType(xc.arch_arm.sve_vl)
 x.ArchArm.NrSpis =3D uint32(xc.arch_arm.nr_spis)
 if err :=3D x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err !=3D =
nil {
@@ -1169,6 +1168,7 @@ return fmt.Errorf("converting field ArchX86.MsrRelaxe=
d: %v", err)
 x.Altp2M =3D Altp2MMode(xc.altp2m)
 x.Altp2MCount =3D uint32(xc.altp2m_count)
 x.VmtraceBufKb =3D int(xc.vmtrace_buf_kb)
+x.Vuart =3D VuartType(xc.vuart)
 if err :=3D x.Vpmu.fromC(&xc.vpmu);err !=3D nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
 }
@@ -1695,7 +1695,6 @@ break
 default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version =3D C.libxl_gic_version(x.ArchArm.GicVersion)
-xc.arch_arm.vuart =3D C.libxl_vuart_type(x.ArchArm.Vuart)
 xc.arch_arm.sve_vl =3D C.libxl_sve_type(x.ArchArm.SveVl)
 xc.arch_arm.nr_spis =3D C.uint32_t(x.ArchArm.NrSpis)
 if err :=3D x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err !=3D n=
il {
@@ -1704,6 +1703,7 @@ return fmt.Errorf("converting field ArchX86.MsrRelaxe=
d: %v", err)
 xc.altp2m =3D C.libxl_altp2m_mode(x.Altp2M)
 xc.altp2m_count =3D C.uint32_t(x.Altp2MCount)
 xc.vmtrace_buf_kb =3D C.int(x.VmtraceBufKb)
+xc.vuart =3D C.libxl_vuart_type(x.Vuart)
 if err :=3D x.Vpmu.toC(&xc.vpmu); err !=3D nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/typ=
es.gen.go
index 4777f528b52c..2f4153d2510b 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -253,6 +253,7 @@ type VuartType int
 const(
 VuartTypeUnknown VuartType =3D 0
 VuartTypeSbsaUart VuartType =3D 1
+VuartTypeNs16550 VuartType =3D 2
 )
=20
 type VkbBackend int
@@ -596,7 +597,6 @@ Type DomainType
 TypeUnion DomainBuildInfoTypeUnion
 ArchArm struct {
 GicVersion GicVersion
-Vuart VuartType
 SveVl SveType
 NrSpis uint32
 }
@@ -608,6 +608,7 @@ Altp2MCount uint32
 VmtraceBufKb int
 Vpmu Defbool
 TrapUnmappedAccesses Defbool
+Vuart VuartType
 }
=20
 type DomainBuildInfoTypeUnion interface {
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 4a19a8d22bdf..f4721b24763c 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -92,14 +92,26 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     uint32_t virtio_mmio_irq =3D GUEST_VIRTIO_MMIO_SPI_FIRST;
     int rc;
=20
-    /*
-     * If pl011 vuart is enabled then increment the nr_spis to allow alloc=
ation
-     * of SPI VIRQ for pl011.
-     */
-    if (d_config->b_info.arch_arm.vuart =3D=3D LIBXL_VUART_TYPE_SBSA_UART)=
 {
+    switch ( d_config->b_info.vuart )
+    {
+    case LIBXL_VUART_TYPE_SBSA_UART:
+        /*
+         * If pl011 vuart is enabled then increment the nr_spis to allow
+         * allocation of SPI VIRQ for pl011.
+         */
         nr_spis +=3D (GUEST_VPL011_SPI - 32) + 1;
         vuart_irq =3D GUEST_VPL011_SPI;
         vuart_enabled =3D true;
+        break;
+
+    case LIBXL_VUART_TYPE_NS16550:
+        LOG(ERROR, "unsupported UART emulator %d\n", d_config->b_info.vuar=
t);
+        abort();
+        break;
+
+    case LIBXL_VUART_TYPE_UNKNOWN:
+    default:
+        break;
     }
=20
     for (i =3D 0; i < d_config->num_disks; i++) {
@@ -1372,7 +1384,7 @@ next_resize:
         FDT( make_timer_node(gc, fdt, ainfo, state->clock_frequency) );
         FDT( make_hypervisor_node(gc, fdt, vers) );
=20
-        if (info->arch_arm.vuart =3D=3D LIBXL_VUART_TYPE_SBSA_UART)
+        if (info->vuart =3D=3D LIBXL_VUART_TYPE_SBSA_UART)
             FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
=20
         if (info->tee =3D=3D LIBXL_TEE_TYPE_OPTEE)
@@ -1725,7 +1737,7 @@ int libxl__arch_build_dom_finish(libxl__gc *gc,
 {
     int rc =3D 0, ret;
=20
-    if (info->arch_arm.vuart !=3D LIBXL_VUART_TYPE_SBSA_UART) {
+    if (info->vuart !=3D LIBXL_VUART_TYPE_SBSA_UART) {
         rc =3D 0;
         goto out;
     }
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_creat=
e.c
index 4042ae1a8957..cfd7e827867a 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1815,7 +1815,7 @@ static void domcreate_launch_dm(libxl__egc *egc, libx=
l__multidev *multidev,
                               &d_config->vfbs[i]);
         }
=20
-        if (d_config->b_info.arch_arm.vuart =3D=3D LIBXL_VUART_TYPE_SBSA_U=
ART) {
+        if (d_config->b_info.vuart =3D=3D LIBXL_VUART_TYPE_SBSA_UART) {
             init_console_info(gc, &vuart, 0);
             vuart.backend_domid =3D state->console_domid;
             libxl__device_vuart_add(gc, domid, &vuart, state);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index fe251649f346..fd60c2b26764 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -276,6 +276,7 @@ libxl_checkpointed_stream =3D Enumeration("checkpointed=
_stream", [
 libxl_vuart_type =3D Enumeration("vuart_type", [
     (0, "unknown"),
     (1, "sbsa_uart"),
+    (2, "ns16550"),
     ])
=20
 libxl_vkb_backend =3D Enumeration("vkb_backend", [
@@ -722,7 +723,6 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
=20
=20
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
-                               ("vuart", libxl_vuart_type),
                                ("sve_vl", libxl_sve_type),
                                ("nr_spis", uint32, {'init_val': 'LIBXL_NR_=
SPIS_DEFAULT'}),
                               ])),
@@ -739,6 +739,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
=20
     ("vpmu", libxl_defbool),
     ("trap_unmapped_accesses", libxl_defbool),
+    ("vuart", libxl_vuart_type),
=20
     ], dir=3DDIR_IN,
        copy_deprecated_fn=3D"libxl__domain_build_info_copy_deprecated",
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 60d4e8661c93..0f039ca65a88 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -2,6 +2,45 @@
 #include "libxl_arch.h"
 #include <xen/arch-x86/cpuid.h>
=20
+static void libxl__arch_domain_vuart_assert(
+    libxl__gc *gc,
+    libxl_domain_config *d_config,
+    struct xen_domctl_createdomain *config)
+{
+    LOG(ERROR, "unsupported UART emulator %d\n", d_config->b_info.vuart);
+    abort();
+}
+
+static void libxl__arch_domain_vuart_unsupported(
+    libxl__gc *gc,
+    libxl_domain_config *d_config,
+    struct xen_domctl_createdomain *config)
+{
+    if ( d_config->b_info.vuart !=3D LIBXL_VUART_TYPE_UNKNOWN )
+        libxl__arch_domain_vuart_assert(gc, d_config, config);
+}
+
+static void libxl__arch_domain_vuart_enable(
+    libxl__gc *gc,
+    libxl_domain_config *d_config,
+    struct xen_domctl_createdomain *config)
+{
+    switch ( d_config->b_info.vuart )
+    {
+    case LIBXL_VUART_TYPE_SBSA_UART:
+        libxl__arch_domain_vuart_assert(gc, d_config, config);
+        break;
+
+    case LIBXL_VUART_TYPE_NS16550:
+        config->arch.emulation_flags |=3D XEN_X86_EMU_NS16550;
+        break;
+
+    case LIBXL_VUART_TYPE_UNKNOWN:
+    default:
+        break;
+    }
+}
+
 int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
                                       struct xen_domctl_createdomain *conf=
ig)
@@ -9,14 +48,17 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     switch(d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
         config->arch.emulation_flags =3D (XEN_X86_EMU_ALL & ~XEN_X86_EMU_V=
PCI);
+        libxl__arch_domain_vuart_enable(gc, d_config, config);
         if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
             config->arch.emulation_flags &=3D ~XEN_X86_EMU_USE_PIRQ;
         break;
     case LIBXL_DOMAIN_TYPE_PVH:
         config->arch.emulation_flags =3D XEN_X86_EMU_LAPIC;
+        libxl__arch_domain_vuart_unsupported(gc, d_config, config);
         break;
     case LIBXL_DOMAIN_TYPE_PV:
         config->arch.emulation_flags =3D 0;
+        libxl__arch_domain_vuart_unsupported(gc, d_config, config);
         break;
     default:
         abort();
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.m=
l
index 7e1aabad6cba..4539e78bb283 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -47,6 +47,7 @@ type x86_arch_emulation_flags =3D
   | X86_EMU_PIT
   | X86_EMU_USE_PIRQ
   | X86_EMU_VPCI
+  | X86_EMU_NS16550
=20
 type x86_arch_misc_flags =3D
   | X86_MSR_RELAXED
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.=
mli
index f44dba61aeab..66a98180d99b 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -41,6 +41,7 @@ type x86_arch_emulation_flags =3D
   | X86_EMU_PIT
   | X86_EMU_USE_PIRQ
   | X86_EMU_VPCI
+  | X86_EMU_NS16550
=20
 type x86_arch_misc_flags =3D
   | X86_MSR_RELAXED
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 28cdbf07c213..b0d266b5bf63 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1498,7 +1498,7 @@ void parse_config_data(const char *config_source,
         b_info->max_vcpus =3D l;
=20
     if (!xlu_cfg_get_string(config, "vuart", &buf, 0)) {
-        if (libxl_vuart_type_from_string(buf, &b_info->arch_arm.vuart)) {
+        if (libxl_vuart_type_from_string(buf, &b_info->vuart)) {
             fprintf(stderr, "ERROR: invalid value \"%s\" for \"vuart\"\n",
                     buf);
             exit(1);
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7fd4f7a831dc..6a010a509a60 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -780,9 +780,10 @@ static bool emulation_flags_ok(const struct domain *d,=
 uint32_t emflags)
         /* HVM domU */
         {
             .caps   =3D CAP_HVM | CAP_DOMU,
-            .min    =3D X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ),
+            .min    =3D X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ |
+                                      X86_EMU_NS16550),
             /* HVM PIRQ feature is user-selectable. */
-            .opt    =3D X86_EMU_USE_PIRQ,
+            .opt    =3D X86_EMU_USE_PIRQ | X86_EMU_NS16550,
         },
 #endif /* #ifdef CONFIG_HVM */
     };
--=20
2.34.1



