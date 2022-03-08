Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1534D1F34
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 18:37:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287274.487195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRdlm-0006N7-A9; Tue, 08 Mar 2022 17:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287274.487195; Tue, 08 Mar 2022 17:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRdlm-0006Kf-4x; Tue, 08 Mar 2022 17:37:10 +0000
Received: by outflank-mailman (input) for mailman id 287274;
 Tue, 08 Mar 2022 17:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibIM=TT=citrix.com=prvs=059cca470=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nRdlk-0006KZ-VS
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 17:37:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ea8f63a-9f06-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 18:37:06 +0100 (CET)
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
X-Inumbo-ID: 5ea8f63a-9f06-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646761026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PuVF+5M7HHdRXwWAxurkiC/Vp4T8SRmRHmS44tLJrbI=;
  b=HNP4ZhqUWQyBVbRWtt8QBUrkLQrsHp3UWGFjgB7r+XWrGWtODAef30VS
   jz/rHti6ReWmon6HHSYo7Z2loNqW7CXKgUcaGjk1sjaJZwTgXmmoGz/+b
   NJfGUjjGXJgFqyeEZ+Z+mt7EYqcEIVtgrgyxvX0cLREOPPcxK7KWi9Fy/
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65661895
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+1NwOK/NmyEO0ZyTfZQnDrUDY36TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jBJWGuGaf7eYTTyKdwjbN63/E0GsMTczIMyTFRprno8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDpW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYy8DgkTObDXodZDSTIJVH89YLZ+3rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKEWvHwm6DjdBPIvR53rSKTW/95Imjw3g6iiGN6AO
 pRHMGo+MXwsZTVhKnIlGrMOmtumrWvzWi8Gp0+Erqo4tj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3Eru3SmSL2XqoCGbv+8eRl6HWtwWgUBAwTREGMi/CzgU6jWPpSM
 0URvCEpqMAa+EW1Q/HnUha/oXrCuQQTM/JSHPc98xql0bfP7kCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaJiw9PWIEIygeQmMt4dPuvYUyhRLnVct4Hei+ididJN3r6
 2nU9m5k3exV1JNVkfXglbzav96yjojFCQAP4RjMZ1D79CgoI9DmOpeQz1eOuJ6sM72lZlWGu
 XEFne2X4+YPEYyBmUSxfQkdIF26z63baWOB2DaDC7Fkrm3woCD7Iei89RkjfB8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZKVfvEMJGPxf4M4XRfK4Ey/lX1
 XCzK5rEMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlZbgXRPr1itfPZ+205F
 uqz0ePQkH2zt8WkPkHqHXM7dwhWfRDX+7iswyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 RmAtrtj4AOn3xXvcFzSAlg6Me+Hdcsv/BoTYH13VX71iidLXGpaxPpGH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwTEmSXoWpMN8KhxGGgHTzy7T+z0+OeSGBXV/Zdq8bhoLcIoiOHGPEyMxeK
IronPort-HdrOrdr: A9a23:ILOjXayjG6j1RaUkj2S1KrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65661895"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 2/2] x86/xen: Allow per-domain usage of hardware virtualized APIC
Date: Tue, 8 Mar 2022 17:36:43 +0000
Message-ID: <20220308173643.2929-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220307150609.10662-3-jane.malalane@citrix.com>
References: <20220307150609.10662-3-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Introduce a new per-domain creation x86 specific flag to
select whether hardware assisted virtualization should be used for
x{2}APIC.

A per-domain option is added to xl in order to select the usage of
x{2}APIC hardware assisted virtualization, as well as a global
configuration option.

Having all APIC interaction exit to Xen for emulation is slow and can
induce much overhead. Hardware can speed up x{2}APIC by decoding the
APIC access and providing a VM exit with a more specific exit reason
than a regular EPT fault or by altogether avoiding a VM exit.

On the other hand, being able to disable x{2}APIC hardware assisted
virtualization can be useful for testing and debugging purposes.

Note: vmx_install_vlapic_mapping doesn't require modifications
regardless of whether the guest has "Virtualize APIC accesses" enabled
or not, i.e., setting the APIC_ACCESS_ADDR VMCS field is fine so long
as virtualize_apic_accesses is supported by the CPU.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>

v6:
 * Use ENODEV instead of EINVAL when rejecting assisted_x{2}apic
   for PV guests
 * Move has_assisted_x{2}apic macros out of an Intel specific header
 * Remove references to Intel specific features in documentation

v5:
 * Revert v4 changes in vmx_vlapic_msr_changed(), preserving the use of
   the has_assisted_x{2}apic macros
 * Following changes in assisted_x{2}apic_available definitions in
   patch 1, retighten conditionals for setting
   XEN_HVM_CPUID_APIC_ACCESS_VIRT and XEN_HVM_CPUID_X2APIC_VIRT in
   cpuid_hypervisor_leaves()

v4:
 * Add has_assisted_x{2}apic macros and use them where appropriate
 * Replace CPU checks with per-domain assisted_x{2}apic control
   options in vmx_vlapic_msr_changed() and cpuid_hypervisor_leaves(),
   following edits to assisted_x{2}apic_available definitions in
   patch 1
   Note: new assisted_x{2}apic_available definitions make later
   cpu_has_vmx_apic_reg_virt and cpu_has_vmx_virtual_intr_delivery
   checks redundant in vmx_vlapic_msr_changed()

v3:
 * Change info in xl.cfg to better express reality and fix
   capitalization of x{2}apic
 * Move "physinfo" variable definition to the beggining of
   libxl__domain_build_info_setdefault()
 * Reposition brackets in if statement to match libxl coding style
 * Shorten logic in libxl__arch_domain_build_info_setdefault()
 * Correct dprintk message in arch_sanitise_domain_config()
 * Make appropriate changes in vmx_vlapic_msr_changed() and
   cpuid_hypervisor_leaves() for amended "assisted_x2apic" bit
 * Remove unneeded parantheses

v2:
 * Add a LIBXL_HAVE_ASSISTED_APIC macro
 * Pass xcpyshinfo as a pointer in libxl__arch_get_physinfo
 * Add a return statement in now "int"
   libxl__arch_domain_build_info_setdefault()
 * Preserve libxl__arch_domain_build_info_setdefault 's location in
   libxl_create.c
 * Correct x{2}apic default setting logic in
   libxl__arch_domain_prepare_config()
 * Correct logic for parsing assisted_x{2}apic host/guest options in
   xl_parse.c and initialize them to -1 in xl.c
 * Use guest options directly in vmx_vlapic_msr_changed
 * Fix indentation of bool assisted_x{2}apic in struct hvm_domain
 * Add a change in xenctrl_stubs.c to pass xenctrl ABI checks
---
 docs/man/xl.cfg.5.pod.in              | 15 +++++++++++++++
 docs/man/xl.conf.5.pod.in             | 12 ++++++++++++
 tools/golang/xenlight/helpers.gen.go  | 12 ++++++++++++
 tools/golang/xenlight/types.gen.go    |  2 ++
 tools/include/libxl.h                 |  7 +++++++
 tools/libs/light/libxl_arch.h         |  5 +++--
 tools/libs/light/libxl_arm.c          |  7 +++++--
 tools/libs/light/libxl_create.c       | 22 +++++++++++++---------
 tools/libs/light/libxl_types.idl      |  2 ++
 tools/libs/light/libxl_x86.c          | 27 +++++++++++++++++++++++++--
 tools/ocaml/libs/xc/xenctrl.ml        |  2 ++
 tools/ocaml/libs/xc/xenctrl.mli       |  2 ++
 tools/ocaml/libs/xc/xenctrl_stubs.c   |  2 +-
 tools/xl/xl.c                         |  8 ++++++++
 tools/xl/xl.h                         |  2 ++
 tools/xl/xl_parse.c                   | 16 ++++++++++++++++
 xen/arch/x86/domain.c                 | 28 +++++++++++++++++++++++++++-
 xen/arch/x86/hvm/vmx/vmcs.c           |  4 ++++
 xen/arch/x86/hvm/vmx/vmx.c            | 13 ++++---------
 xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
 xen/arch/x86/include/asm/hvm/hvm.h    |  6 ++++++
 xen/arch/x86/traps.c                  |  5 +++--
 xen/include/public/arch-x86/xen.h     |  2 ++
 23 files changed, 179 insertions(+), 28 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b98d161398..b4239fcc5e 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1862,6 +1862,21 @@ firmware tables when using certain older guest Operating
 Systems. These tables have been superseded by newer constructs within
 the ACPI tables.
 
+=item B<assisted_xapic=BOOLEAN>
+
+B<(x86 only)> Enables or disables hardware assisted virtualization for
+xAPIC. With this option enabled, a memory-mapped APIC access will be
+decoded by hardware and either issue a more specific VM exit than just
+an EPT fault, or altogether avoid a VM exit. The
+default is settable via L<xl.conf(5)>.
+
+=item B<assisted_x2apic=BOOLEAN>
+
+B<(x86 only)> Enables or disables hardware assisted virtualization for
+x2APIC. With this option enabled, certain accesses to MSR APIC
+registers will avoid a VM exit into the hypervisor. The default is
+settable via L<xl.conf(5)>.
+
 =item B<nx=BOOLEAN>
 
 B<(x86 only)> Hides or exposes the No-eXecute capability. This allows a guest
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index df20c08137..95d136d1ea 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -107,6 +107,18 @@ Sets the default value for the C<max_grant_version> domain config value.
 
 Default: maximum grant version supported by the hypervisor.
 
+=item B<assisted_xapic=BOOLEAN>
+
+If enabled, domains will use xAPIC hardware assisted virtualization by default.
+
+Default: enabled if supported.
+
+=item B<assisted_x2apic=BOOLEAN>
+
+If enabled, domains will use x2APIC hardware assisted virtualization by default.
+
+Default: enabled if supported.
+
 =item B<vif.default.script="PATH">
 
 Configures the default hotplug script used by virtual network devices.
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index dd4e6c9f14..dece545ee0 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1120,6 +1120,12 @@ x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
 if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
+if err := x.ArchX86.AssistedXapic.fromC(&xc.arch_x86.assisted_xapic);err != nil {
+return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
+}
+if err := x.ArchX86.AssistedX2Apic.fromC(&xc.arch_x86.assisted_x2apic);err != nil {
+return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
+}
 x.Altp2M = Altp2MMode(xc.altp2m)
 x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
 if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
@@ -1605,6 +1611,12 @@ xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
 if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
+if err := x.ArchX86.AssistedXapic.toC(&xc.arch_x86.assisted_xapic); err != nil {
+return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
+}
+if err := x.ArchX86.AssistedX2Apic.toC(&xc.arch_x86.assisted_x2apic); err != nil {
+return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
+}
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
 xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
 if err := x.Vpmu.toC(&xc.vpmu); err != nil {
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 87be46c745..253c9ad93d 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -520,6 +520,8 @@ Vuart VuartType
 }
 ArchX86 struct {
 MsrRelaxed Defbool
+AssistedXapic Defbool
+AssistedX2Apic Defbool
 }
 Altp2M Altp2MMode
 VmtraceBufKb int
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 94e6355822..cdcccd6d01 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -535,6 +535,13 @@
 #define LIBXL_HAVE_PHYSINFO_ASSISTED_APIC 1
 
 /*
+ * LIBXL_HAVE_ASSISTED_APIC indicates that libxl_domain_build_info has
+ * assisted_xapic and assisted_x2apic fields for enabling hardware
+ * assisted virtualization for x{2}apic per domain.
+ */
+#define LIBXL_HAVE_ASSISTED_APIC 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index 207ceac6a1..03b89929e6 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -71,8 +71,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
                                                libxl_domain_create_info *c_info);
 
 _hidden
-void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
-                                              libxl_domain_build_info *b_info);
+int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
+                                             libxl_domain_build_info *b_info,
+                                             const libxl_physinfo *physinfo);
 
 _hidden
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 39fdca1b49..ba5b8f433f 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1384,8 +1384,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
     }
 }
 
-void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
-                                              libxl_domain_build_info *b_info)
+int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
+                                             libxl_domain_build_info *b_info,
+                                             const libxl_physinfo *physinfo)
 {
     /* ACPI is disabled by default */
     libxl_defbool_setdefault(&b_info->acpi, false);
@@ -1399,6 +1400,8 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
     memset(&b_info->u, '\0', sizeof(b_info->u));
     b_info->type = LIBXL_DOMAIN_TYPE_INVALID;
     libxl_domain_build_info_init_type(b_info, LIBXL_DOMAIN_TYPE_PVH);
+
+    return 0;
 }
 
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 15ed021f41..88d08d7277 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -75,6 +75,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
                                         libxl_domain_build_info *b_info)
 {
     int i, rc;
+    libxl_physinfo info;
 
     if (b_info->type != LIBXL_DOMAIN_TYPE_HVM &&
         b_info->type != LIBXL_DOMAIN_TYPE_PV &&
@@ -264,7 +265,18 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
     if (!b_info->event_channels)
         b_info->event_channels = 1023;
 
-    libxl__arch_domain_build_info_setdefault(gc, b_info);
+    rc = libxl_get_physinfo(CTX, &info);
+    if (rc) {
+        LOG(ERROR, "failed to get hypervisor info");
+        return rc;
+    }
+
+    rc = libxl__arch_domain_build_info_setdefault(gc, b_info, &info);
+    if (rc) {
+        LOG(ERROR, "unable to set domain arch build info defaults");
+        return rc;
+    }
+
     libxl_defbool_setdefault(&b_info->dm_restrict, false);
 
     if (b_info->iommu_memkb == LIBXL_MEMKB_DEFAULT)
@@ -457,14 +469,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
     }
 
     if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
-        libxl_physinfo info;
-
-        rc = libxl_get_physinfo(CTX, &info);
-        if (rc) {
-            LOG(ERROR, "failed to get hypervisor info");
-            return rc;
-        }
-
         if (info.cap_gnttab_v2)
             b_info->max_grant_version = 2;
         else if (info.cap_gnttab_v1)
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 42ac6c357b..db5eb0a0b3 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -648,6 +648,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                ("vuart", libxl_vuart_type),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
+                               ("assisted_xapic", libxl_defbool),
+                               ("assisted_x2apic", libxl_defbool),
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index e0a06ecfe3..c7f9f3774f 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -23,6 +23,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
         config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
 
+    if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV)
+    {
+        if (libxl_defbool_val(d_config->b_info.arch_x86.assisted_xapic))
+            config->arch.misc_flags |= XEN_X86_ASSISTED_XAPIC;
+
+        if (libxl_defbool_val(d_config->b_info.arch_x86.assisted_x2apic))
+            config->arch.misc_flags |= XEN_X86_ASSISTED_X2APIC;
+    }
     return 0;
 }
 
@@ -819,11 +827,26 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
 {
 }
 
-void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
-                                              libxl_domain_build_info *b_info)
+int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
+                                             libxl_domain_build_info *b_info,
+                                             const libxl_physinfo *physinfo)
 {
     libxl_defbool_setdefault(&b_info->acpi, true);
     libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
+
+    if (b_info->type != LIBXL_DOMAIN_TYPE_PV) {
+        libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic,
+                             physinfo->cap_assisted_xapic);
+        libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic,
+                             physinfo->cap_assisted_x2apic);
+    }
+    else if (!libxl_defbool_is_default(b_info->arch_x86.assisted_xapic) ||
+             !libxl_defbool_is_default(b_info->arch_x86.assisted_x2apic)) {
+        LOG(ERROR, "Interrupt Controller Virtualization not supported for PV");
+        return ERROR_INVAL;
+    }
+
+    return 0;
 }
 
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 712456e098..32f3028828 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -50,6 +50,8 @@ type x86_arch_emulation_flags =
 
 type x86_arch_misc_flags =
 	| X86_MSR_RELAXED
+	| X86_ASSISTED_XAPIC
+	| X86_ASSISTED_X2APIC
 
 type xen_x86_arch_domainconfig =
 {
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index b034434f68..d0fcbc8866 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -44,6 +44,8 @@ type x86_arch_emulation_flags =
 
 type x86_arch_misc_flags =
   | X86_MSR_RELAXED
+  | X86_ASSISTED_XAPIC
+  | X86_ASSISTED_X2APIC
 
 type xen_x86_arch_domainconfig = {
   emulation_flags: x86_arch_emulation_flags list;
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 7e9c32ad1b..5df8aaa58f 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -239,7 +239,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 
 		cfg.arch.misc_flags = ocaml_list_to_c_bitmap
 			/* ! x86_arch_misc_flags X86_ none */
-			/* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
+			/* ! XEN_X86_ XEN_X86_ASSISTED_X2APIC max */
 			(VAL_MISC_FLAGS);
 
 #undef VAL_MISC_FLAGS
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 2d1ec18ea3..31eb223309 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -57,6 +57,8 @@ int max_grant_frames = -1;
 int max_maptrack_frames = -1;
 int max_grant_version = LIBXL_MAX_GRANT_DEFAULT;
 libxl_domid domid_policy = INVALID_DOMID;
+int assisted_xapic = -1;
+int assisted_x2apic = -1;
 
 xentoollog_level minmsglevel = minmsglevel_default;
 
@@ -201,6 +203,12 @@ static void parse_global_config(const char *configfile,
     if (!xlu_cfg_get_long (config, "claim_mode", &l, 0))
         claim_mode = l;
 
+    if (!xlu_cfg_get_long (config, "assisted_xapic", &l, 0))
+        assisted_xapic = l;
+
+    if (!xlu_cfg_get_long (config, "assisted_x2apic", &l, 0))
+        assisted_x2apic = l;
+
     xlu_cfg_replace_string (config, "remus.default.netbufscript",
         &default_remus_netbufscript, 0);
     xlu_cfg_replace_string (config, "colo.default.proxyscript",
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index c5c4bedbdd..528deb3feb 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -286,6 +286,8 @@ extern libxl_bitmap global_vm_affinity_mask;
 extern libxl_bitmap global_hvm_affinity_mask;
 extern libxl_bitmap global_pv_affinity_mask;
 extern libxl_domid domid_policy;
+extern int assisted_xapic;
+extern int assisted_x2apic;
 
 enum output_format {
     OUTPUT_FORMAT_JSON,
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 117fcdcb2b..0ab9b145fe 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1681,6 +1681,22 @@ void parse_config_data(const char *config_source,
         xlu_cfg_get_defbool(config, "vpt_align", &b_info->u.hvm.vpt_align, 0);
         xlu_cfg_get_defbool(config, "apic", &b_info->apic, 0);
 
+        e = xlu_cfg_get_long(config, "assisted_xapic", &l , 0);
+        if ((e == ESRCH && assisted_xapic != -1)) /* use global default if present */
+            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, assisted_xapic);
+        else if (!e)
+            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, l);
+        else
+            exit(1);
+
+        e = xlu_cfg_get_long(config, "assisted_x2apic", &l, 0);
+        if ((e == ESRCH && assisted_x2apic != -1)) /* use global default if present */
+            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, assisted_x2apic);
+        else if (!e)
+            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, l);
+        else
+            exit(1);
+
         switch (xlu_cfg_get_list(config, "viridian",
                                  &viridian, &num_viridian, 1))
         {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index a5048ed654..b18d5c9b52 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -619,6 +619,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
+    bool assisted_xapic = config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
+    bool assisted_x2apic = config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
     unsigned int max_vcpus;
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
@@ -685,13 +687,31 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
-    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
+    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED |
+                                     XEN_X86_ASSISTED_XAPIC |
+                                     XEN_X86_ASSISTED_X2APIC) )
     {
         dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
                 config->arch.misc_flags);
         return -EINVAL;
     }
 
+    if ( (assisted_xapic || assisted_x2apic) && !hvm )
+    {
+        dprintk(XENLOG_INFO,
+                "Interrupt Controller Virtualization not supported for PV\n");
+        return -ENODEV;
+    }
+
+    if ( (assisted_xapic && !assisted_xapic_available) ||
+         (assisted_x2apic && !assisted_x2apic_available) )
+    {
+        dprintk(XENLOG_INFO,
+                "Hardware assisted x%sAPIC requested but not available\n",
+                assisted_xapic && !assisted_xapic_available ? "" : "2");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
@@ -864,6 +884,12 @@ int arch_domain_create(struct domain *d,
 
     d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
 
+    d->arch.hvm.assisted_xapic =
+        config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
+
+    d->arch.hvm.assisted_x2apic =
+        config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
+
     return 0;
 
  fail:
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 77ce0b2121..7adb043ab7 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1157,6 +1157,10 @@ static int construct_vmcs(struct vcpu *v)
         __vmwrite(PLE_WINDOW, ple_window);
     }
 
+    if ( !has_assisted_xapic(v->domain) )
+        v->arch.hvm.vmx.secondary_exec_control &=
+            ~SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
+
     if ( cpu_has_vmx_secondary_exec_control )
         __vmwrite(SECONDARY_VM_EXEC_CONTROL,
                   v->arch.hvm.vmx.secondary_exec_control);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c075370f64..949ddd684c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3344,16 +3344,11 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
 
 void vmx_vlapic_msr_changed(struct vcpu *v)
 {
-    int virtualize_x2apic_mode;
     struct vlapic *vlapic = vcpu_vlapic(v);
     unsigned int msr;
 
-    virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
-                                cpu_has_vmx_virtual_intr_delivery) &&
-                               cpu_has_vmx_virtualize_x2apic_mode );
-
-    if ( !cpu_has_vmx_virtualize_apic_accesses &&
-         !virtualize_x2apic_mode )
+    if ( !has_assisted_xapic(v->domain) &&
+         !has_assisted_x2apic(v->domain) )
         return;
 
     vmx_vmcs_enter(v);
@@ -3363,7 +3358,7 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
     if ( !vlapic_hw_disabled(vlapic) &&
          (vlapic_base_address(vlapic) == APIC_DEFAULT_PHYS_BASE) )
     {
-        if ( virtualize_x2apic_mode && vlapic_x2apic_mode(vlapic) )
+        if ( has_assisted_x2apic(v->domain) && vlapic_x2apic_mode(vlapic) )
         {
             v->arch.hvm.vmx.secondary_exec_control |=
                 SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE;
@@ -3384,7 +3379,7 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
                 vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
             }
         }
-        else
+        else if ( has_assisted_xapic(v->domain) )
             v->arch.hvm.vmx.secondary_exec_control |=
                 SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
     }
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 698455444e..92bf53483c 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -117,6 +117,12 @@ struct hvm_domain {
 
     bool                   is_s3_suspended;
 
+    /* xAPIC hardware assisted virtualization. */
+    bool                   assisted_xapic;
+
+    /* x2APIC hardware assisted virtualization. */
+    bool                   assisted_x2apic;
+
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 5b7ec0cf69..65a978f670 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -373,6 +373,12 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
 #define hvm_tsc_scaling_ratio(d) \
     ((d)->arch.hvm.tsc_scaling_ratio)
 
+#define has_assisted_xapic(d) \
+    ((d)->arch.hvm.assisted_xapic)
+
+#define has_assisted_x2apic(d) \
+    ((d)->arch.hvm.assisted_x2apic)
+
 #define hvm_get_guest_time(v) hvm_get_guest_time_fixed(v, 0)
 
 #define hvm_paging_enabled(v) \
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index a2278d9499..a8dba88916 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1121,7 +1121,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         if ( !is_hvm_domain(d) || subleaf != 0 )
             break;
 
-        if ( cpu_has_vmx_apic_reg_virt )
+        if ( cpu_has_vmx_apic_reg_virt &&
+             has_assisted_xapic(d) )
             res->a |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
 
         /*
@@ -1130,7 +1131,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
          * and wrmsr in the guest will run without VMEXITs (see
          * vmx_vlapic_msr_changed()).
          */
-        if ( cpu_has_vmx_virtualize_x2apic_mode &&
+        if ( has_assisted_x2apic(d) &&
              cpu_has_vmx_apic_reg_virt &&
              cpu_has_vmx_virtual_intr_delivery )
             res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 7acd94c8eb..9da32c6239 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -317,6 +317,8 @@ struct xen_arch_domainconfig {
  * doesn't allow the guest to read or write to the underlying MSR.
  */
 #define XEN_X86_MSR_RELAXED (1u << 0)
+#define XEN_X86_ASSISTED_XAPIC (1u << 1)
+#define XEN_X86_ASSISTED_X2APIC (1u << 2)
     uint32_t misc_flags;
 };
 
-- 
2.11.0


