Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B187266887
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 21:08:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGoNt-0000n9-D0; Fri, 11 Sep 2020 19:06:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27I=CU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kGoNr-0000n4-SM
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 19:06:55 +0000
X-Inumbo-ID: 6bf68ab9-28e0-4cac-a89a-48a6dae1e900
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bf68ab9-28e0-4cac-a89a-48a6dae1e900;
 Fri, 11 Sep 2020 19:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599851213;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v81L6P9iNxxYEd7Z7t12B+1o/zIAfhxdzmxXdTC9Txo=;
 b=LkJZNTpuqaXVSn3dgHTPuI2eOb9Fcz7kZ1hZ6QKOnv+GY5q5QDr5hwh8
 hekKqL2Vpwub3Gwf4J6lYo1WL1exNXfzSOUgZV31wA0R/WYsladeeFGwC
 U7ZPnsp3N9GgTZ+AeHacfSHPeQCnuTttNgNO0k1B1wAYYL/P48km/s9q2 M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: D9NLvywHY8VRLoRffVi31ZfKhAXB8Sc5CQN0yStfm7V7b8l2F04ZNRAoVX8g9NuNEpYsX87Aqw
 kiqCT4TBQiPpnJcVTXMmYo8pNMJEEzpgY3QrtL3dcFvjQHwUI5tDADLah+SSnyKiGWpX8ChPU2
 QJ97k7RFA9+Y+SHiXBY+iyWDasBJazigosAfPPwDKWGONKt6KXgRuD/Yx4ZRDi0W9sh03LOaKl
 S2K1VoxMBGKCw6361vobtwfxkpaV1gLFguSTdK0L2cBdPTz7YReZULPciCLHHWYmzcJZ3dqQp4
 dcc=
X-SBRS: 2.7
X-MesageID: 26508873
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,416,1592884800"; d="scan'208";a="26508873"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Ian Jackson <Ian.Jackson@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH] tools: Delete XEN_DOMCTL_disable_migrate
Date: Fri, 11 Sep 2020 20:06:18 +0100
Message-ID: <20200911190618.14708-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It is conceptually wrong for this information to exist in the hypervisor in
the first place.  Only the toolstack is capable of correctly reasoning about
the non-migrateability of guests.

This hypercall has only ever existed to control the visibility of the
Invariant TSC flag to the guest.  Now that we have properly disentanged that
and moved ITSC into the guests CPUID policy, delete this hypercall.

Furthermore, this fixes a corner case where Xen would override the toolstacks
choice of ITSC for a xenstore stubdomain.  That said, init-xenstore-domain
doesn't currently ask for ITSC, and MiniOS doesn't know what ITSC is either,
so nothing actually changes in practice.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/libs/ctrl/include/xenctrl.h   |  2 --
 tools/libs/ctrl/xc_domain.c         |  9 ---------
 tools/libxl/libxl_dom.c             |  6 ------
 tools/python/xen/lowlevel/xc/xc.c   | 21 ---------------------
 xen/arch/arm/domctl.c               |  4 ----
 xen/arch/x86/cpuid.c                |  3 ++-
 xen/arch/x86/domctl.c               |  5 -----
 xen/common/domain.c                 |  4 ----
 xen/include/public/domctl.h         |  8 +-------
 xen/include/xen/sched.h             |  2 --
 xen/xsm/flask/hooks.c               |  1 -
 xen/xsm/flask/policy/access_vectors |  2 +-
 12 files changed, 4 insertions(+), 63 deletions(-)

diff --git a/tools/libs/ctrl/include/xenctrl.h b/tools/libs/ctrl/include/xenctrl.h
index 0a921a95fa..73e9535fc8 100644
--- a/tools/libs/ctrl/include/xenctrl.h
+++ b/tools/libs/ctrl/include/xenctrl.h
@@ -1351,8 +1351,6 @@ int xc_domain_get_tsc_info(xc_interface *xch,
                            uint32_t *gtsc_khz,
                            uint32_t *incarnation);
 
-int xc_domain_disable_migrate(xc_interface *xch, uint32_t domid);
-
 int xc_domain_maximum_gpfn(xc_interface *xch, uint32_t domid, xen_pfn_t *gpfns);
 
 int xc_domain_nr_gpfns(xc_interface *xch, uint32_t domid, xen_pfn_t *gpfns);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 43fab50c06..e7cea4a17d 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -815,15 +815,6 @@ int xc_domain_set_time_offset(xc_interface *xch,
     return do_domctl(xch, &domctl);
 }
 
-int xc_domain_disable_migrate(xc_interface *xch, uint32_t domid)
-{
-    DECLARE_DOMCTL;
-    domctl.cmd = XEN_DOMCTL_disable_migrate;
-    domctl.domain = domid;
-    domctl.u.disable_migrate.disable = 1;
-    return do_domctl(xch, &domctl);
-}
-
 int xc_domain_set_tsc_info(xc_interface *xch,
                            uint32_t domid,
                            uint32_t tsc_mode,
diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
index e2dca64aa1..597a6826d1 100644
--- a/tools/libxl/libxl_dom.c
+++ b/tools/libxl/libxl_dom.c
@@ -257,12 +257,6 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
         return ERROR_FAIL;
     }
 
-    if (libxl_defbool_val(d_config->b_info.disable_migrate) &&
-        xc_domain_disable_migrate(ctx->xch, domid) != 0) {
-        LOG(ERROR, "Couldn't set nomigrate");
-        return ERROR_FAIL;
-    }
-
     /*
      * Check if the domain has any CPU or node affinity already. If not, try
      * to build up the latter via automatic NUMA placement. In fact, in case
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 8c7b184f0b..ce123f0409 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -1469,20 +1469,6 @@ static PyObject *pyxc_domain_set_tsc_info(XcObject *self, PyObject *args)
     return zero;
 }
 
-static PyObject *pyxc_domain_disable_migrate(XcObject *self, PyObject *args)
-{
-    uint32_t dom;
-
-    if (!PyArg_ParseTuple(args, "i", &dom))
-        return NULL;
-
-    if (xc_domain_disable_migrate(self->xc_handle, dom) != 0)
-        return pyxc_error_to_exception(self->xc_handle);
-
-    Py_INCREF(zero);
-    return zero;
-}
-
 static PyObject *pyxc_domain_send_trigger(XcObject *self,
                                           PyObject *args,
                                           PyObject *kwds)
@@ -2306,13 +2292,6 @@ static PyMethodDef pyxc_methods[] = {
       "                   1=always emulate 2=never emulate\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "domain_disable_migrate",
-      (PyCFunction)pyxc_domain_disable_migrate,
-      METH_VARARGS, "\n"
-      "Marks domain as non-migratable AND non-restoreable\n"
-      " dom        [int]: Domain whose TSC mode is being set.\n"
-      "Returns: [int] 0 on success; -1 on error.\n" },
-
     { "domain_send_trigger",
       (PyCFunction)pyxc_domain_send_trigger,
       METH_VARARGS | METH_KEYWORDS, "\n"
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index 9da88b8c64..b7d27f37df 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -146,10 +146,6 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
         return 0;
     }
 
-    case XEN_DOMCTL_disable_migrate:
-        d->disable_migrate = domctl->u.disable_migrate.disable;
-        return 0;
-
     case XEN_DOMCTL_vuart_op:
     {
         int rc;
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 23425790e1..dde3e95284 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -708,7 +708,8 @@ int init_domain_cpuid_policy(struct domain *d)
     if ( !p )
         return -ENOMEM;
 
-    if ( d->disable_migrate )
+    /* The hardware domain can't migrate.  Give it ITSC if available. */
+    if ( is_hardware_domain(d) )
         p->extd.itsc = cpu_has_itsc;
 
     /*
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 7c644add92..2ee29a0f78 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1277,11 +1277,6 @@ long arch_do_domctl(
 
         break;
 
-    case XEN_DOMCTL_disable_migrate:
-        d->disable_migrate = domctl->u.disable_migrate.disable;
-        recalculate_cpuid_policy(d);
-        break;
-
     case XEN_DOMCTL_get_cpu_policy:
         /* Process the CPUID leaves. */
         if ( guest_handle_is_null(domctl->u.cpu_policy.cpuid_policy) )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f0f9c62feb..61ffccde0c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -371,7 +371,6 @@ struct domain *domain_create(domid_t domid,
         if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
             panic("The value of hardware_dom must be a valid domain ID\n");
 
-        d->disable_migrate = true;
         old_hwdom = hardware_domain;
         hardware_domain = d;
     }
@@ -452,9 +451,6 @@ struct domain *domain_create(domid_t domid,
         watchdog_domain_init(d);
         init_status |= INIT_watchdog;
 
-        if ( is_xenstore_domain(d) )
-            d->disable_migrate = true;
-
         d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
         d->irq_caps   = rangeset_new(d, "Interrupts", 0);
         if ( !d->iomem_caps || !d->irq_caps )
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 9464a9058a..be8bd79d9d 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -730,11 +730,6 @@ struct xen_domctl_hvmcontext_partial {
     XEN_GUEST_HANDLE_64(uint8) buffer;  /* OUT: buffer to write record into */
 };
 
-/* XEN_DOMCTL_disable_migrate */
-struct xen_domctl_disable_migrate {
-    uint32_t disable; /* IN: 1: disable migration and restore */
-};
-
 
 /* XEN_DOMCTL_gettscinfo */
 /* XEN_DOMCTL_settscinfo */
@@ -1191,7 +1186,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_gethvmcontext_partial         55
 #define XEN_DOMCTL_vm_event_op                   56
 #define XEN_DOMCTL_mem_sharing_op                57
-#define XEN_DOMCTL_disable_migrate               58
+/* #define XEN_DOMCTL_disable_migrate            58 - Obsolete */
 #define XEN_DOMCTL_gettscinfo                    59
 #define XEN_DOMCTL_settscinfo                    60
 #define XEN_DOMCTL_getpageframeinfo3             61
@@ -1242,7 +1237,6 @@ struct xen_domctl {
         struct xen_domctl_ioport_permission ioport_permission;
         struct xen_domctl_hypercall_init    hypercall_init;
         struct xen_domctl_settimeoffset     settimeoffset;
-        struct xen_domctl_disable_migrate   disable_migrate;
         struct xen_domctl_tsc_info          tsc_info;
         struct xen_domctl_hvmcontext        hvmcontext;
         struct xen_domctl_hvmcontext_partial hvmcontext_partial;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ac53519d7f..e9ce43cc9a 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -401,8 +401,6 @@ struct domain
     bool             is_privileged;
     /* Can this guest access the Xen console? */
     bool             is_console;
-    /* Non-migratable and non-restoreable? */
-    bool             disable_migrate;
     /* Is this guest being debugged by dom0? */
     bool             debugger_attached;
     /*
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index a314bf85ce..fab5d30c3a 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -710,7 +710,6 @@ static int flask_domctl(struct domain *d, int cmd)
         return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__SETDEBUGGING);
 
     case XEN_DOMCTL_subscribe:
-    case XEN_DOMCTL_disable_migrate:
         return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__SET_MISC_INFO);
 
     case XEN_DOMCTL_set_virq_handler:
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index b87c99ea98..fde5162c7e 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -176,7 +176,7 @@ class domain
     getpodtarget
 # XENMEM_set_pod_target
     setpodtarget
-# XEN_DOMCTL_subscribe, XEN_DOMCTL_disable_migrate
+# XEN_DOMCTL_subscribe
     set_misc_info
 # XEN_DOMCTL_set_virq_handler
     set_virq_handler
-- 
2.11.0


