Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4931660DEC9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 12:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430425.682136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondWq-0006ED-Pa; Wed, 26 Oct 2022 10:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430425.682136; Wed, 26 Oct 2022 10:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondWq-0006Ct-L5; Wed, 26 Oct 2022 10:20:56 +0000
Received: by outflank-mailman (input) for mailman id 430425;
 Wed, 26 Oct 2022 10:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JODj=23=citrix.com=prvs=291bfe38a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ondWp-0004c6-C0
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 10:20:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de3d0b22-5517-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 12:20:53 +0200 (CEST)
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
X-Inumbo-ID: de3d0b22-5517-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666779653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6JO0wvwDsV/DC/XiuqlUU3zZyv9PlBtYFfVcD+Dl1Yk=;
  b=ZzKALwUtY2MP2luNc+3vGhB9ir8VR7KrUSPNt9raZQoXsHUyeHE+yggc
   ubX055S7Um8MmQS8cQBIgtfor8MXhWbWa/hhZgmD42Rw3knt6MHJTFGfm
   iH9epURcL6Rw0wSQVzo9OYqz/O4bCViZ9hn6iErAe97nXsd6htflt/rMW
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 83149672
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RG+9rq/C2N/jZfLaAU/cDrUDEH6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WMWDDqCPvaJYGf2eo0jao3i8k1Q7ZDVmN4yTws6ri48E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5AJmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0utHWnt2r
 qIiEzIcfzKg2+WJ/+ufSPY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9KofTGZQLwRzwS
 mTu5iO+LQ0mapulywGczDX3ic7GhBjyR9dHfFG/3qEz2wDCroAJMzUoUl+8rei8m1SJcdtVI
 EwJ+QIjtaE3skesS7HVXQC8oXOClg4RXZxXCeJSwCGAzLDFpTmQAGcsRyRELtchsaceTzEwy
 kWAmd+vADV1qaCUUlqU7LLSpjS3UQAONnMLbyIASQoD4vHgrZs1gxaJScxseIaug9boAzDs0
 hiaoS54gK8c5eYb2qP+8V3ZjjaEopnSUhVz9gjRRnii7A5yeMiifYPAwUffxeZNKsCeVFbpl
 FoultWa7esOJYqQjyHLS+IIdIxF/N7cbmea2wQ2WcB8qXL9oBZPYLy8/hlzFBxzCp1aQwTrc
 V7xml9W26AKGHm1OPofj52KN+wmyq3pFNLAX//Sb8ZTbpUZSDJr7B2CdmbLgTmzzRFEfbUXf
 M7CLJ3yVSpy5bFPlmLeegsL7VM8KsnSL0v3TIuz8Rmo2KH2iJW9GeZcawvmggzUAcq5TOTpH
 zR3bZXiJ/Z3CreWjszrHWk7dAliEJTDLcqqw/G7j8baSuacJEkvCuXK3ZQqcJF/kqJem4/gp
 y/jBBACkgum3CefdG1mj0yPj5u2A/5CQY8TZ3RwbT5EJVB/CWpQ0EvvX8RuJuR2nACS5fV1U
 +MEa6297gdnE1z6F8AmRcCl9uRKLU3z7SrXZnrNXdTKV8M5L+A/0oS/JVWHGehnJnffiPbSV
 JX6jVqKHMReGlUK4QS/QKvH8m5ddEM1wIpaN3Yk6PEIEKkw2OCG8xDMs8I=
IronPort-HdrOrdr: A9a23:2y1U3qi9oXjHXi8/RW5FVYLsbXBQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.95,214,1661832000"; 
   d="scan'208";a="83149672"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen Security Team
	<security@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	"Anthony PERARD" <anthony.perard@citrix.com>
Subject: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m mempool hypercalls
Date: Wed, 26 Oct 2022 11:20:17 +0100
Message-ID: <20221026102018.4144-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221026102018.4144-1-andrew.cooper3@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This reverts most of commit cf2a68d2ffbc3ce95e01449d46180bddb10d24a0, and bits
of cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7.

First of all, with ARM borrowing x86's implementation, the logic to set the
pool size should have been common, not duplicated.  Introduce
libxl__domain_set_p2m_pool_size() as a shared implementation, and use it from
the ARM and x86 paths.  It is left as an exercise to the reader to judge how
libxl/xl can reasonably function without the ability to query the pool size...

Remove ARM's p2m_domctl() infrastructure now the functioanlity has been
replaced with a working and unit tested interface.

This is part of XSA-409 / CVE-2022-33747.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Xen Security Team <security@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Henry Wang <Henry.Wang@arm.com>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_arm.c      | 14 +----------
 tools/libs/light/libxl_dom.c      | 19 ++++++++++++++
 tools/libs/light/libxl_internal.h |  3 +++
 tools/libs/light/libxl_x86.c      | 15 ++---------
 xen/arch/arm/domctl.c             | 53 ---------------------------------------
 xen/arch/arm/include/asm/p2m.h    |  1 -
 xen/arch/arm/p2m.c                |  8 ------
 7 files changed, 25 insertions(+), 88 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 2a5e93c28403..2f5615263543 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -209,19 +209,7 @@ int libxl__arch_domain_create(libxl__gc *gc,
                               libxl__domain_build_state *state,
                               uint32_t domid)
 {
-    libxl_ctx *ctx = libxl__gc_owner(gc);
-    unsigned int shadow_mb = DIV_ROUNDUP(d_config->b_info.shadow_memkb, 1024);
-
-    int r = xc_shadow_control(ctx->xch, domid,
-                              XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
-                              &shadow_mb, 0);
-    if (r) {
-        LOGED(ERROR, domid,
-              "Failed to set %u MiB shadow allocation", shadow_mb);
-        return ERROR_FAIL;
-    }
-
-    return 0;
+    return libxl__domain_set_p2m_pool_size(gc, d_config, domid);
 }
 
 int libxl__arch_extra_memory(libxl__gc *gc,
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 2abaab439c4f..f93b221f1c1f 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -1448,6 +1448,25 @@ int libxl_userdata_unlink(libxl_ctx *ctx, uint32_t domid,
     return rc;
 }
 
+int libxl__domain_set_p2m_pool_size(
+    libxl__gc *gc, libxl_domain_config *d_config, uint32_t domid)
+{
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+    uint64_t shadow_mem;
+
+    shadow_mem = d_config->b_info.shadow_memkb;
+    shadow_mem <<= 10;
+
+    int r = xc_get_p2m_mempool_size(ctx->xch, domid, &shadow_mem);
+    if (r) {
+        LOGED(ERROR, domid,
+              "Failed to set p2m pool size to %"PRIu64"kB", shadow_mem);
+        return ERROR_FAIL;
+    }
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index cb9e8b3b8b5a..f31164bc6c0d 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4864,6 +4864,9 @@ int libxl__is_domid_recent(libxl__gc *gc, uint32_t domid, bool *recent);
 /* os-specific implementation of setresuid() */
 int libxl__setresuid(uid_t ruid, uid_t euid, uid_t suid);
 
+_hidden int libxl__domain_set_p2m_pool_size(
+    libxl__gc *gc, libxl_domain_config *d_config, uint32_t domid);
+
 #endif
 
 /*
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 7c5ee74443e5..99aba51d05df 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -538,20 +538,9 @@ int libxl__arch_domain_create(libxl__gc *gc,
         xc_domain_set_time_offset(ctx->xch, domid, rtc_timeoffset);
 
     if (d_config->b_info.type != LIBXL_DOMAIN_TYPE_PV) {
-        unsigned int shadow_mb = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
-                                             1024);
-        int r = xc_shadow_control(ctx->xch, domid,
-                                  XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
-                                  &shadow_mb, 0);
-
-        if (r) {
-            LOGED(ERROR, domid,
-                  "Failed to set %u MiB %s allocation",
-                  shadow_mb,
-                  libxl_defbool_val(d_config->c_info.hap) ? "HAP" : "shadow");
-            ret = ERROR_FAIL;
+        ret = libxl__domain_set_p2m_pool_size(gc, d_config, domid);
+        if (ret)
             goto out;
-        }
     }
 
     if (d_config->c_info.type == LIBXL_DOMAIN_TYPE_PV &&
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index c8fdeb124084..1baf25c3d98b 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -47,64 +47,11 @@ static int handle_vuart_init(struct domain *d,
     return rc;
 }
 
-static long p2m_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
-                       XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
-{
-    long rc;
-    bool preempted = false;
-
-    if ( unlikely(d == current->domain) )
-    {
-        printk(XENLOG_ERR "Tried to do a p2m domctl op on itself.\n");
-        return -EINVAL;
-    }
-
-    if ( unlikely(d->is_dying) )
-    {
-        printk(XENLOG_ERR "Tried to do a p2m domctl op on dying domain %u\n",
-               d->domain_id);
-        return -EINVAL;
-    }
-
-    switch ( sc->op )
-    {
-    case XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION:
-    {
-        /* Allow and handle preemption */
-        spin_lock(&d->arch.paging.lock);
-        rc = p2m_set_allocation(d, sc->mb << (20 - PAGE_SHIFT), &preempted);
-        spin_unlock(&d->arch.paging.lock);
-
-        if ( preempted )
-            /* Not finished. Set up to re-run the call. */
-            rc = hypercall_create_continuation(__HYPERVISOR_domctl, "h",
-                                               u_domctl);
-        else
-            /* Finished. Return the new allocation. */
-            sc->mb = p2m_get_allocation(d);
-
-        return rc;
-    }
-    case XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION:
-    {
-        sc->mb = p2m_get_allocation(d);
-        return 0;
-    }
-    default:
-    {
-        printk(XENLOG_ERR "Bad p2m domctl op %u\n", sc->op);
-        return -EINVAL;
-    }
-    }
-}
-
 long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
     switch ( domctl->cmd )
     {
-    case XEN_DOMCTL_shadow_op:
-        return p2m_domctl(d, &domctl->u.shadow_op, u_domctl);
     case XEN_DOMCTL_cacheflush:
     {
         gfn_t s = _gfn(domctl->u.cacheflush.start_pfn);
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index c8f14d13c2c5..91df922e1c9f 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -222,7 +222,6 @@ void p2m_restore_state(struct vcpu *n);
 /* Print debugging/statistial info about a domain's p2m */
 void p2m_dump_info(struct domain *d);
 
-unsigned int p2m_get_allocation(struct domain *d);
 int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted);
 int p2m_teardown_allocation(struct domain *d);
 
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 4607cde6f0b8..92b678cf0d09 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -92,14 +92,6 @@ static void p2m_free_page(struct domain *d, struct page_info *pg)
     spin_unlock(&d->arch.paging.lock);
 }
 
-/* Return the size of the pool, rounded up to the nearest MB */
-unsigned int p2m_get_allocation(struct domain *d)
-{
-    unsigned long nr_pages = ACCESS_ONCE(d->arch.paging.p2m_total_pages);
-
-    return ROUNDUP(nr_pages, 1 << (20 - PAGE_SHIFT)) >> (20 - PAGE_SHIFT);
-}
-
 /* Return the size of the pool, in bytes. */
 int arch_get_p2m_mempool_size(struct domain *d, uint64_t *size)
 {
-- 
2.11.0


