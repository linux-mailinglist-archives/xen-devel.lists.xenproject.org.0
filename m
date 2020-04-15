Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1415B1A900B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 03:03:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOWSC-0001BX-Gv; Wed, 15 Apr 2020 01:03:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOWSA-0001BP-FG
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 01:02:58 +0000
X-Inumbo-ID: d85ab3c2-7eb4-11ea-83d8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d85ab3c2-7eb4-11ea-83d8-bc764e2007e4;
 Wed, 15 Apr 2020 01:02:58 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F091B2072D;
 Wed, 15 Apr 2020 01:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586912577;
 bh=wF9us2YMoPDg0/9cb4wsozJ6he+zFTvLWGF9kUPj4ls=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vbQLujcor6mYBLEyfu+PJcPRNRQfRbuzqSb6gqx/y3YBZ83w7hiDcrG01Kqxto946
 8uTCjm8hjxs+HWqTIZjAdZl0pGfkJZg+OSZtUnFe4yz9g+ZTNK5cuubIPqzgrvhuak
 2O+fQ7NMYANdRnN2k8zzdJOMYuJMG+5/4YPYfKgQ=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 01/12] xen: introduce xen_dom_flags
Date: Tue, 14 Apr 2020 18:02:44 -0700
Message-Id: <20200415010255.10081-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sstabellini@kernel.org, julien@xen.org, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 jbeulich@suse.com, Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Volodymyr_Babchuk@epam.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We are passing an extra special boolean flag at domain creation to
specify whether we want to the domain to be privileged (i.e. dom0) or
not. Another flag will be introduced later in this series.

Introduce a new struct xen_dom_flags and move the privileged flag to it.
Other flags will be added to struct xen_dom_flags.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: andrew.cooper3@citrix.com
CC: jbeulich@suse.com
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Wei Liu <wl@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: George Dunlap <george.dunlap@eu.citrix.com>
CC: Dario Faggioli <dfaggioli@suse.com>
---
 xen/arch/arm/domain.c       |  3 ++-
 xen/arch/arm/domain_build.c |  3 ++-
 xen/arch/arm/setup.c        |  3 ++-
 xen/arch/x86/domain.c       |  3 ++-
 xen/arch/x86/setup.c        |  3 ++-
 xen/common/domain.c         | 13 +++++++------
 xen/common/domctl.c         |  3 ++-
 xen/common/sched/core.c     |  3 ++-
 xen/include/xen/domain.h    |  7 ++++++-
 xen/include/xen/sched.h     |  2 +-
 10 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 6627be2922..b906a38b6b 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -669,7 +669,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 }
 
 int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config)
+                       struct xen_domctl_createdomain *config,
+                       struct xen_dom_flags *flags)
 {
     int rc, count = 0;
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4307087536..20e62a9fc4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2467,6 +2467,7 @@ void __init create_domUs(void)
             .max_grant_frames = 64,
             .max_maptrack_frames = 1024,
         };
+        struct xen_dom_flags flags = { false };
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
@@ -2491,7 +2492,7 @@ void __init create_domUs(void)
                                          GUEST_VPL011_SPI - 32 + 1);
         }
 
-        d = domain_create(++max_init_domid, &d_cfg, false);
+        d = domain_create(++max_init_domid, &d_cfg, &flags);
         if ( IS_ERR(d) )
             panic("Error creating domain %s\n", dt_node_name(node));
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7968cee47d..9ccb3f7385 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -787,6 +787,7 @@ void __init start_xen(unsigned long boot_phys_offset,
         .max_maptrack_frames = -1,
     };
     int rc;
+    struct xen_dom_flags flags = { true };
 
     dcache_line_bytes = read_dcache_line_bytes();
 
@@ -955,7 +956,7 @@ void __init start_xen(unsigned long boot_phys_offset,
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    dom0 = domain_create(0, &dom0_cfg, true);
+    dom0 = domain_create(0, &dom0_cfg, &flags);
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index a008d7df1c..b92776f824 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -529,7 +529,8 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 }
 
 int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config)
+                       struct xen_domctl_createdomain *config,
+                       struct xen_dom_flags *flags)
 {
     bool paging_initialised = false;
     uint32_t emflags;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 885919d5c3..e61114858b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -706,6 +706,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         .max_maptrack_frames = -1,
     };
     const char *hypervisor_name;
+    struct xen_dom_flags flags = { !pv_shim };
 
     /* Critical region without IDT or TSS.  Any fault is deadly! */
 
@@ -1761,7 +1762,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
     /* Create initial domain 0. */
-    dom0 = domain_create(get_initial_domain_id(), &dom0_cfg, !pv_shim);
+    dom0 = domain_create(get_initial_domain_id(), &dom0_cfg, &flags);
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 3dcd73f67c..dd53475cc3 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -341,7 +341,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
 
 struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
-                             bool is_priv)
+                             struct xen_dom_flags *flags)
 {
     struct domain *d, **pd, *old_hwdom = NULL;
     enum { INIT_watchdog = 1u<<1,
@@ -363,7 +363,7 @@ struct domain *domain_create(domid_t domid,
     ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
 
     /* Sort out our idea of is_control_domain(). */
-    d->is_privileged = is_priv;
+    d->is_privileged =  flags ? flags->is_priv : false;
 
     /* Sort out our idea of is_hardware_domain(). */
     if ( domid == 0 || domid == hardware_domid )
@@ -443,7 +443,7 @@ struct domain *domain_create(domid_t domid,
         radix_tree_init(&d->pirq_tree);
     }
 
-    if ( (err = arch_domain_create(d, config)) != 0 )
+    if ( (err = arch_domain_create(d, config, flags)) != 0 )
         goto fail;
     init_status |= INIT_arch;
 
@@ -547,6 +547,7 @@ struct domain *domain_create(domid_t domid,
 
 void __init setup_system_domains(void)
 {
+    struct xen_dom_flags flags = { false };
     /*
      * Initialise our DOMID_XEN domain.
      * Any Xen-heap pages that we will allow to be mapped will have
@@ -554,7 +555,7 @@ void __init setup_system_domains(void)
      * Hidden PCI devices will also be associated with this domain
      * (but be [partly] controlled by Dom0 nevertheless).
      */
-    dom_xen = domain_create(DOMID_XEN, NULL, false);
+    dom_xen = domain_create(DOMID_XEN, NULL, &flags);
     if ( IS_ERR(dom_xen) )
         panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
 
@@ -564,7 +565,7 @@ void __init setup_system_domains(void)
      * array. Mappings occur at the priv of the caller.
      * Quarantined PCI devices will be associated with this domain.
      */
-    dom_io = domain_create(DOMID_IO, NULL, false);
+    dom_io = domain_create(DOMID_IO, NULL, &flags);
     if ( IS_ERR(dom_io) )
         panic("Failed to create d[IO]: %ld\n", PTR_ERR(dom_io));
 
@@ -573,7 +574,7 @@ void __init setup_system_domains(void)
      * Initialise our COW domain.
      * This domain owns sharable pages.
      */
-    dom_cow = domain_create(DOMID_COW, NULL, false);
+    dom_cow = domain_create(DOMID_COW, NULL, &flags);
     if ( IS_ERR(dom_cow) )
         panic("Failed to create d[COW]: %ld\n", PTR_ERR(dom_cow));
 #endif
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index a69b3b59a8..cb8d25500a 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -364,6 +364,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     bool_t copyback = 0;
     struct xen_domctl curop, *op = &curop;
     struct domain *d;
+    struct xen_dom_flags flags ={ false };
 
     if ( copy_from_guest(op, u_domctl, 1) )
         return -EFAULT;
@@ -515,7 +516,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             rover = dom;
         }
 
-        d = domain_create(dom, &op->u.createdomain, false);
+        d = domain_create(dom, &op->u.createdomain, &flags);
         if ( IS_ERR(d) )
         {
             ret = PTR_ERR(d);
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 626861a3fe..6457c71ce1 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2888,6 +2888,7 @@ void __init scheduler_init(void)
 {
     struct domain *idle_domain;
     int i;
+    struct xen_dom_flags flags = { false };
 
     scheduler_enable();
 
@@ -2957,7 +2958,7 @@ void __init scheduler_init(void)
         sched_ratelimit_us = SCHED_DEFAULT_RATELIMIT_US;
     }
 
-    idle_domain = domain_create(DOMID_IDLE, NULL, false);
+    idle_domain = domain_create(DOMID_IDLE, NULL, &flags);
     BUG_ON(IS_ERR(idle_domain));
     BUG_ON(nr_cpu_ids > ARRAY_SIZE(idle_vcpu));
     idle_domain->vcpu = idle_vcpu;
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 7e51d361de..4423e34500 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -63,8 +63,13 @@ void arch_vcpu_destroy(struct vcpu *v);
 int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
 void unmap_vcpu_info(struct vcpu *v);
 
+struct xen_dom_flags {
+    bool is_priv;
+};
+
 int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config);
+                       struct xen_domctl_createdomain *config,
+                       struct xen_dom_flags *flags);
 
 void arch_domain_destroy(struct domain *d);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 195e7ee583..4112f1ffc9 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -594,7 +594,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config);
  */
 struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
-                             bool is_priv);
+                             struct xen_dom_flags *flags);
 
 /*
  * rcu_lock_domain_by_id() is more efficient than get_domain_by_id().
-- 
2.17.1


