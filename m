Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489A94BBE6E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 18:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275589.471554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL75C-0006de-5w; Fri, 18 Feb 2022 17:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275589.471554; Fri, 18 Feb 2022 17:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL75C-0006bm-1c; Fri, 18 Feb 2022 17:30:14 +0000
Received: by outflank-mailman (input) for mailman id 275589;
 Fri, 18 Feb 2022 17:30:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nO3j=TB=citrix.com=prvs=0411eaaf8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nL75A-0006Ln-1T
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 17:30:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a71c1d9-90e0-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 18:30:09 +0100 (CET)
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
X-Inumbo-ID: 6a71c1d9-90e0-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645205409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S+8V/rw6crKioKh5KpXJahKwQ6j0S27m+hsi0+7wm3c=;
  b=V/6PTdywwEZPJhtbEBJXUqHoKFu7IBfA809PEL0jCiZH65nOhgInghH2
   meeO7mndYzWm/dBa+aGBU3Djt3EFJOQML7jd+AqqyZnOCm0WSzME7NKc9
   QU/RvQfPk+81NJMQZU7REYOCJESbPLMZF6thDJ6LDUyumUu1shEfmZs8O
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 63974997
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6gJukq9cTUo/lsfNtB+1DrUDGX6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jZKDzyDPveCYmr3fY12PY/noEJV6pHVm9RjT1E9+Xg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HpW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYSeWVx1DIzro8MibwIFHiRFEJR6paCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKEWvHwm6DjdBPIvR53rSKTW/95Imjw3g6iiGN6AP
 JtGNWs+M3wsZTVgA3kKEapisd6FrWntLw9ogmqp+ro4tj27IAtZj+G2bYu9lsaxbftSmkGUt
 2fX5VPTCxsRNMGc4Ted+3fqjejK9QvgQ54bHrC88v9sgXWQy3YVBRlQUkG0ydGzh1SiQdtZJ
 woR8zA3sKkp3EWxS5/2WBjQiH2JoB8aHcZRGusS6QeRx66S6AGcbkAGUzgHbtUlvc03QDUC1
 1mVktevDjtq2JWXRmia7ay8ti6pNG4eKmpqTT8JS04J7sfupKk3jwnTVZBzHaitlNr3FDrsh
 TeQo0AWhb8ekMoK3KWT5k3cjnSnoZ2hZgwo4gTaWEq14wU/Y5SqD6S37XDL4PAGK5yWJmRtp
 1BdxZLYtrpXS8jQymrdG43hAY1F+d6dHi2H3WxOOKIGyAi2pnOmRq1p3GxhcRIB3tk/RRflZ
 0rauAV07ZBVPWe3YaIfX79dG/jG3oC7S427C6m8gs5mJ8EoKVTZpH0GiVu4gji1+HXAh53TL
 ntynSyEKX8BQZpqwzOtLwv2+e96n3turY8/qH2S8vhG7VZ8TCLEIVvmGAHXBgzc0E9iiFyEm
 zq4H5HXoyizqMWkPkHqHXc7dDjm10QTC5HssNBwfeWeOAdgE2xJI6aPne54IdA9zvgLz72gE
 pSBtqlwkQuXaZrvc1jiV5yeQOm3AcYXQYwTZkTAwmpEK1B8ON3yvc/zhrM8fKU99fwL8BKHZ
 6JtRil0OdwWEm6v021ENfHV9dU+HDz21VPmF3f0O1AXIs8/LzElD/e5J2MDAgFVVXHp3Sb/y
 pX9vj7mrW0rHVo6V5+OMKr1p75z1FBE8N9Ps4LzCoE7UC3RHEJCcEQdUtdfzxkwFCj+
IronPort-HdrOrdr: A9a23:K+/FK64hmRlmFIWTLwPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,379,1635220800"; 
   d="scan'208";a="63974997"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 1/2] xen+tools: Report Interrupt Controller Virtualization capabilities on x86
Date: Fri, 18 Feb 2022 17:29:42 +0000
Message-ID: <20220218172943.12182-2-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220218172943.12182-1-jane.malalane@citrix.com>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
and x2apic, on x86 hardware.
No such features are currently implemented on AMD hardware.

For that purpose, also add an arch-specific "capabilities" parameter
to struct xen_sysctl_physinfo.

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
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>

v3:
 * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
   set arch_capbilities, via a call to c_bitmap_to_ocaml_list()
 * Have assisted_x2apic_available only depend on
   cpu_has_vmx_virtualize_x2apic_mode
v2:
 * Use one macro LIBXL_HAVE_PHYSINFO_ASSISTED_APIC instead of two
 * Pass xcpyshinfo as a pointer in libxl__arch_get_physinfo
 * Set assisted_x{2}apic_available to be conditional upon "bsp" and
   annotate it with __ro_after_init
 * Change XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_X{2}APIC to
   (...)_X86_ASSISTED_X{2}APIC
 * Keep XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X{2}APIC contained within
   sysctl.h
 * Fix padding introduced in struct xen_sysctl_physinfo and bump
   XEN_SYSCTL_INTERFACE_VERSION
---
 tools/golang/xenlight/helpers.gen.go |  4 ++++
 tools/golang/xenlight/types.gen.go   |  2 ++
 tools/include/libxl.h                |  7 +++++++
 tools/libs/light/libxl.c             |  3 +++
 tools/libs/light/libxl_arch.h        |  4 ++++
 tools/libs/light/libxl_arm.c         |  5 +++++
 tools/libs/light/libxl_types.idl     |  2 ++
 tools/libs/light/libxl_x86.c         | 11 +++++++++++
 tools/ocaml/libs/xc/xenctrl.ml       |  5 +++++
 tools/ocaml/libs/xc/xenctrl.mli      |  5 +++++
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 14 +++++++++++---
 tools/xl/xl_info.c                   |  6 ++++--
 xen/arch/x86/hvm/vmx/vmcs.c          |  7 +++++++
 xen/arch/x86/include/asm/domain.h    |  3 +++
 xen/arch/x86/sysctl.c                |  7 +++++++
 xen/include/public/sysctl.h          | 11 ++++++++++-
 16 files changed, 90 insertions(+), 6 deletions(-)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index b746ff1081..dd4e6c9f14 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -3373,6 +3373,8 @@ x.CapVmtrace = bool(xc.cap_vmtrace)
 x.CapVpmu = bool(xc.cap_vpmu)
 x.CapGnttabV1 = bool(xc.cap_gnttab_v1)
 x.CapGnttabV2 = bool(xc.cap_gnttab_v2)
+x.CapAssistedXapic = bool(xc.cap_assisted_xapic)
+x.CapAssistedX2Apic = bool(xc.cap_assisted_x2apic)
 
  return nil}
 
@@ -3407,6 +3409,8 @@ xc.cap_vmtrace = C.bool(x.CapVmtrace)
 xc.cap_vpmu = C.bool(x.CapVpmu)
 xc.cap_gnttab_v1 = C.bool(x.CapGnttabV1)
 xc.cap_gnttab_v2 = C.bool(x.CapGnttabV2)
+xc.cap_assisted_xapic = C.bool(x.CapAssistedXapic)
+xc.cap_assisted_x2apic = C.bool(x.CapAssistedX2Apic)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index b1e84d5258..87be46c745 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -1014,6 +1014,8 @@ CapVmtrace bool
 CapVpmu bool
 CapGnttabV1 bool
 CapGnttabV2 bool
+CapAssistedXapic bool
+CapAssistedX2Apic bool
 }
 
 type Connectorinfo struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 51a9b6cfac..333ffad38d 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -528,6 +528,13 @@
 #define LIBXL_HAVE_MAX_GRANT_VERSION 1
 
 /*
+ * LIBXL_HAVE_PHYSINFO_ASSISTED_APIC indicates that libxl_physinfo has
+ * cap_assisted_x{2}apic fields, which indicates the availability of x{2}APIC
+ * hardware assisted virtualization.
+ */
+#define LIBXL_HAVE_PHYSINFO_ASSISTED_APIC 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index a0bf7d186f..6d699951e2 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -15,6 +15,7 @@
 #include "libxl_osdeps.h"
 
 #include "libxl_internal.h"
+#include "libxl_arch.h"
 
 int libxl_ctx_alloc(libxl_ctx **pctx, int version,
                     unsigned flags, xentoollog_logger * lg)
@@ -410,6 +411,8 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
     physinfo->cap_gnttab_v2 =
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
 
+    libxl__arch_get_physinfo(physinfo, &xcphysinfo);
+
     GC_FREE;
     return 0;
 }
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index 1522ecb97f..207ceac6a1 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -86,6 +86,10 @@ int libxl__arch_extra_memory(libxl__gc *gc,
                              uint64_t *out);
 
 _hidden
+void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
+                              const xc_physinfo_t *xcphysinfo);
+
+_hidden
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src);
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index eef1de0939..39fdca1b49 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1431,6 +1431,11 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
+                              const xc_physinfo_t *xcphysinfo)
+{
+}
+
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src)
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 2a42da2f7d..42ac6c357b 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1068,6 +1068,8 @@ libxl_physinfo = Struct("physinfo", [
     ("cap_vpmu", bool),
     ("cap_gnttab_v1", bool),
     ("cap_gnttab_v2", bool),
+    ("cap_assisted_xapic", bool),
+    ("cap_assisted_x2apic", bool),
     ], dir=DIR_OUT)
 
 libxl_connectorinfo = Struct("connectorinfo", [
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 1feadebb18..e0a06ecfe3 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -866,6 +866,17 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
+                              const xc_physinfo_t *xcphysinfo)
+{
+    physinfo->cap_assisted_xapic =
+        !!(xcphysinfo->arch_capabilities &
+           XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC);
+    physinfo->cap_assisted_x2apic =
+        !!(xcphysinfo->arch_capabilities &
+           XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC);
+}
+
 void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src)
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 7503031d8f..21783d3622 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -127,6 +127,10 @@ type physinfo_cap_flag =
 	| CAP_Gnttab_v1
 	| CAP_Gnttab_v2
 
+type physinfo_arch_cap_flag =
+	| CAP_X86_ASSISTED_XAPIC
+	| CAP_X86_ASSISTED_X2APIC
+
 type physinfo =
 {
 	threads_per_core : int;
@@ -139,6 +143,7 @@ type physinfo =
 	scrub_pages      : nativeint;
 	(* XXX hw_cap *)
 	capabilities     : physinfo_cap_flag list;
+	arch_capabilities : physinfo_arch_cap_flag list;
 	max_nr_cpus      : int;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index d1d9c9247a..af6ba3d1a0 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -112,6 +112,10 @@ type physinfo_cap_flag =
   | CAP_Gnttab_v1
   | CAP_Gnttab_v2
 
+type physinfo_arch_cap_flag =
+  | CAP_X86_ASSISTED_XAPIC
+  | CAP_X86_ASSISTED_X2APIC
+
 type physinfo = {
   threads_per_core : int;
   cores_per_socket : int;
@@ -122,6 +126,7 @@ type physinfo = {
   free_pages       : nativeint;
   scrub_pages      : nativeint;
   capabilities     : physinfo_cap_flag list;
+  arch_capabilities : physinfo_arch_cap_flag list;
   max_nr_cpus      : int; (** compile-time max possible number of nr_cpus *)
 }
 type version = { major : int; minor : int; extra : string; }
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 5b4fe72c8d..1fa5453043 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -712,7 +712,7 @@ CAMLprim value stub_xc_send_debug_keys(value xch, value keys)
 CAMLprim value stub_xc_physinfo(value xch)
 {
 	CAMLparam1(xch);
-	CAMLlocal2(physinfo, cap_list);
+	CAMLlocal3(physinfo, cap_list, arch_cap_list);
 	xc_physinfo_t c_physinfo;
 	int r;
 
@@ -730,8 +730,15 @@ CAMLprim value stub_xc_physinfo(value xch)
 		/* ! physinfo_cap_flag CAP_ lc */
 		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_MAX max */
 		(c_physinfo.capabilities);
+	/*
+	 * arch_capabilities: physinfo_arch_cap_flag list;
+	 */
+	arch_cap_list = c_bitmap_to_ocaml_list
+		/* ! physinfo_arch_cap_flag CAP_ none */
+		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_ARCH_MAX max */
+		(c_physinfo.arch_capabilities);
 
-	physinfo = caml_alloc_tuple(10);
+	physinfo = caml_alloc_tuple(11);
 	Store_field(physinfo, 0, Val_int(c_physinfo.threads_per_core));
 	Store_field(physinfo, 1, Val_int(c_physinfo.cores_per_socket));
 	Store_field(physinfo, 2, Val_int(c_physinfo.nr_cpus));
@@ -741,7 +748,8 @@ CAMLprim value stub_xc_physinfo(value xch)
 	Store_field(physinfo, 6, caml_copy_nativeint(c_physinfo.free_pages));
 	Store_field(physinfo, 7, caml_copy_nativeint(c_physinfo.scrub_pages));
 	Store_field(physinfo, 8, cap_list);
-	Store_field(physinfo, 9, Val_int(c_physinfo.max_cpu_id + 1));
+	Store_field(physinfo, 9, arch_cap_list);
+	Store_field(physinfo, 10, Val_int(c_physinfo.max_cpu_id + 1));
 
 	CAMLreturn(physinfo);
 }
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 712b7638b0..3205270754 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -210,7 +210,7 @@ static void output_physinfo(void)
          info.hw_cap[4], info.hw_cap[5], info.hw_cap[6], info.hw_cap[7]
         );
 
-    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s\n",
+    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
          info.cap_pv ? " pv" : "",
          info.cap_hvm ? " hvm" : "",
          info.cap_hvm && info.cap_hvm_directio ? " hvm_directio" : "",
@@ -221,7 +221,9 @@ static void output_physinfo(void)
          info.cap_vmtrace ? " vmtrace" : "",
          info.cap_vpmu ? " vpmu" : "",
          info.cap_gnttab_v1 ? " gnttab-v1" : "",
-         info.cap_gnttab_v2 ? " gnttab-v2" : ""
+         info.cap_gnttab_v2 ? " gnttab-v2" : "",
+         info.cap_assisted_xapic ? " assisted_xapic" : "",
+         info.cap_assisted_x2apic ? " assisted_x2apic" : ""
         );
 
     vinfo = libxl_get_version_info(ctx);
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 7ab15e07a0..be981e11bc 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -343,6 +343,13 @@ static int vmx_init_vmcs_config(bool bsp)
             MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
     }
 
+    /* Check whether hardware supports accelerated xapic and x2apic. */
+    if ( bsp )
+    {
+        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
+        assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode;
+    }
+
     /* The IA32_VMX_EPT_VPID_CAP MSR exists only when EPT or VPID available */
     if ( _vmx_secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
                                         SECONDARY_EXEC_ENABLE_VPID) )
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index e62e109598..72431df26d 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -756,6 +756,9 @@ static inline void pv_inject_sw_interrupt(unsigned int vector)
                       : is_pv_32bit_domain(d) ? PV32_VM_ASSIST_MASK \
                                               : PV64_VM_ASSIST_MASK)
 
+extern bool assisted_xapic_available;
+extern bool assisted_x2apic_available;
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index aff52a13f3..642cc96985 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -69,6 +69,9 @@ struct l3_cache_info {
     unsigned long size;
 };
 
+bool __ro_after_init assisted_xapic_available;
+bool __ro_after_init assisted_x2apic_available;
+
 static void l3_cache_get(void *arg)
 {
     struct cpuid4_info info;
@@ -135,6 +138,10 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
+    if ( assisted_xapic_available )
+        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC;
+    if ( assisted_x2apic_available )
+        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC;
 }
 
 long arch_do_sysctl(
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 55252e97f2..d38141a780 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -35,7 +35,7 @@
 #include "domctl.h"
 #include "physdev.h"
 
-#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
+#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
 
 /*
  * Read console content from Xen buffer ring.
@@ -111,6 +111,13 @@ struct xen_sysctl_tbuf_op {
 /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
 #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
 
+/* The platform supports x{2}apic hardware assisted emulation. */
+#define XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC  (1u << 0)
+#define XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC (1u << 1)
+
+/* Max XEN_SYSCTL_PHYSCAP_X86{ARM}__* constant. Used for ABI checking. */
+#define XEN_SYSCTL_PHYSCAP_ARCH_MAX XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC
+
 struct xen_sysctl_physinfo {
     uint32_t threads_per_core;
     uint32_t cores_per_socket;
@@ -120,6 +127,8 @@ struct xen_sysctl_physinfo {
     uint32_t max_node_id; /* Largest possible node ID on this host */
     uint32_t cpu_khz;
     uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
+    uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_X86{ARM}_??? */
+    uint32_t pad; /* Must be zero. */
     uint64_aligned_t total_pages;
     uint64_aligned_t free_pages;
     uint64_aligned_t scrub_pages;
-- 
2.11.0


