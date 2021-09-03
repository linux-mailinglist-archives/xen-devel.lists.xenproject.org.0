Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320F74001BA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 17:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178150.324051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAnG-0008TL-OH; Fri, 03 Sep 2021 15:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178150.324051; Fri, 03 Sep 2021 15:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAnG-0008Qo-Kx; Fri, 03 Sep 2021 15:07:50 +0000
Received: by outflank-mailman (input) for mailman id 178150;
 Fri, 03 Sep 2021 15:07:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yFRs=NZ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mMAnF-0008Ng-0V
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 15:07:49 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b54bf82a-424d-4da4-8874-e24ba0bfc054;
 Fri, 03 Sep 2021 15:07:46 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630681603149519.7405960574835;
 Fri, 3 Sep 2021 08:06:43 -0700 (PDT)
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
X-Inumbo-ID: b54bf82a-424d-4da4-8874-e24ba0bfc054
ARC-Seal: i=1; a=rsa-sha256; t=1630681606; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eIFKDRxScrmARw/p8OWVj6UYH+9U3O5yIrXvnRa08cFoYdq+RvT5pR92aEvueq3tpvbGYI0jYPgxSlTaGLWbqoQTTTxarh1yJ7xFqbbBTS3dh+b+HTiBKYxqw7pBxNEAfJSP/c8X+y/PBYCfLamYzE0aytfL34v5IbGLatfg3WQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630681606; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=X6+g8YK8ugcXGm10Da/blBL4IQsisq76l+m3qPb65X4=; 
	b=gNH2ChyRgro6MyqW8nJEXxu8GLOuVXGx57dOyP4yCnDrwhKk0Lt9SmW5H6/vonGtIol3mRNOReEFgBGMwM0ZaCCEa9r8mSi9FBlsWuALLxoFmMtgiPK2Pyi78I0gjp+3j11n7HGekBX2oLGgplsCsE9k1+rhWcoJeSwMpICuCJY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630681606;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=X6+g8YK8ugcXGm10Da/blBL4IQsisq76l+m3qPb65X4=;
	b=Y9JeDUu8fY+J7m3/RFW79S1nkc1pVjIcfOvBS7yPevkL6IBYpOiaP0uEChQbd3p8
	bx3LXocsuxNUqYmVok5VgqvyeU43bIABNkASSoaoP7dSMb5j+3lDMnxiVSD9fzncfhy
	8zR7o4Ljpd70au/OZPJX0YebnuDJyB2ezDIyhTks=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v4 05/11] xsm: refactor xsm_ops handling
Date: Fri,  3 Sep 2021 15:06:23 -0400
Message-Id: <20210903190629.11917-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903190629.11917-1-dpsmith@apertussolutions.com>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This renames the `struct xsm_operations` to the shorter `struct xsm_ops` and
converts the global xsm_ops from being a pointer to an explicit instance. As
part of this conversion, it reworks the XSM modules init function to return
their xsm_ops struct which is copied in to the global xsm_ops instance.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/xsm.h | 222 +++++++++++++++++++++---------------------
 xen/xsm/dummy.c       |   4 +-
 xen/xsm/flask/hooks.c |  12 +--
 xen/xsm/silo.c        |   7 +-
 xen/xsm/xsm_core.c    |  77 ++++++++-------
 5 files changed, 167 insertions(+), 155 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 8878281eae..3888172045 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -46,7 +46,7 @@ enum xsm_default {
 };
 typedef enum xsm_default xsm_default_t;
 
-struct xsm_operations {
+struct xsm_ops {
     void (*security_domaininfo)(struct domain *d,
                                 struct xen_domctl_getdomaininfo *info);
     int (*domain_create)(struct domain *d, uint32_t ssidref);
@@ -201,63 +201,63 @@ struct xsm_operations {
 
 #ifdef CONFIG_XSM
 
-extern struct xsm_operations *xsm_ops;
+extern struct xsm_ops xsm_ops;
 
 #ifndef XSM_NO_WRAPPERS
 
 static inline void xsm_security_domaininfo(struct domain *d,
     struct xen_domctl_getdomaininfo *info)
 {
-    xsm_ops->security_domaininfo(d, info);
+    xsm_ops.security_domaininfo(d, info);
 }
 
 static inline int xsm_domain_create(xsm_default_t def, struct domain *d,
                                     uint32_t ssidref)
 {
-    return xsm_ops->domain_create(d, ssidref);
+    return xsm_ops.domain_create(d, ssidref);
 }
 
 static inline int xsm_getdomaininfo(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->getdomaininfo(d);
+    return xsm_ops.getdomaininfo(d);
 }
 
 static inline int xsm_domctl_scheduler_op(xsm_default_t def, struct domain *d,
                                           int cmd)
 {
-    return xsm_ops->domctl_scheduler_op(d, cmd);
+    return xsm_ops.domctl_scheduler_op(d, cmd);
 }
 
 static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
 {
-    return xsm_ops->sysctl_scheduler_op(cmd);
+    return xsm_ops.sysctl_scheduler_op(cmd);
 }
 
 static inline int xsm_set_target(xsm_default_t def, struct domain *d,
                                  struct domain *e)
 {
-    return xsm_ops->set_target(d, e);
+    return xsm_ops.set_target(d, e);
 }
 
 static inline int xsm_domctl(xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops->domctl(d, cmd);
+    return xsm_ops.domctl(d, cmd);
 }
 
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
-    return xsm_ops->sysctl(cmd);
+    return xsm_ops.sysctl(cmd);
 }
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
 {
-    return xsm_ops->readconsole(clear);
+    return xsm_ops.readconsole(clear);
 }
 
 static inline int xsm_evtchn_unbound(xsm_default_t def, struct domain *d1,
                                      struct evtchn *chn, domid_t id2)
 {
-    return xsm_ops->evtchn_unbound(d1, chn, id2);
+    return xsm_ops.evtchn_unbound(d1, chn, id2);
 }
 
 static inline int xsm_evtchn_interdomain(xsm_default_t def, struct domain *d1,
@@ -265,235 +265,235 @@ static inline int xsm_evtchn_interdomain(xsm_default_t def, struct domain *d1,
                                          struct domain *d2,
                                          struct evtchn *chan2)
 {
-    return xsm_ops->evtchn_interdomain(d1, chan1, d2, chan2);
+    return xsm_ops.evtchn_interdomain(d1, chan1, d2, chan2);
 }
 
 static inline void xsm_evtchn_close_post(struct evtchn *chn)
 {
-    xsm_ops->evtchn_close_post(chn);
+    xsm_ops.evtchn_close_post(chn);
 }
 
 static inline int xsm_evtchn_send(xsm_default_t def, struct domain *d,
                                   struct evtchn *chn)
 {
-    return xsm_ops->evtchn_send(d, chn);
+    return xsm_ops.evtchn_send(d, chn);
 }
 
 static inline int xsm_evtchn_status(xsm_default_t def, struct domain *d,
                                     struct evtchn *chn)
 {
-    return xsm_ops->evtchn_status(d, chn);
+    return xsm_ops.evtchn_status(d, chn);
 }
 
 static inline int xsm_evtchn_reset(xsm_default_t def, struct domain *d1,
                                    struct domain *d2)
 {
-    return xsm_ops->evtchn_reset(d1, d2);
+    return xsm_ops.evtchn_reset(d1, d2);
 }
 
 static inline int xsm_grant_mapref(xsm_default_t def, struct domain *d1,
                                    struct domain *d2, uint32_t flags)
 {
-    return xsm_ops->grant_mapref(d1, d2, flags);
+    return xsm_ops.grant_mapref(d1, d2, flags);
 }
 
 static inline int xsm_grant_unmapref(xsm_default_t def, struct domain *d1,
                                      struct domain *d2)
 {
-    return xsm_ops->grant_unmapref(d1, d2);
+    return xsm_ops.grant_unmapref(d1, d2);
 }
 
 static inline int xsm_grant_setup(xsm_default_t def, struct domain *d1,
                                   struct domain *d2)
 {
-    return xsm_ops->grant_setup(d1, d2);
+    return xsm_ops.grant_setup(d1, d2);
 }
 
 static inline int xsm_grant_transfer(xsm_default_t def, struct domain *d1,
                                      struct domain *d2)
 {
-    return xsm_ops->grant_transfer(d1, d2);
+    return xsm_ops.grant_transfer(d1, d2);
 }
 
 static inline int xsm_grant_copy(xsm_default_t def, struct domain *d1,
                                  struct domain *d2)
 {
-    return xsm_ops->grant_copy(d1, d2);
+    return xsm_ops.grant_copy(d1, d2);
 }
 
 static inline int xsm_grant_query_size(xsm_default_t def, struct domain *d1,
                                        struct domain *d2)
 {
-    return xsm_ops->grant_query_size(d1, d2);
+    return xsm_ops.grant_query_size(d1, d2);
 }
 
 static inline int xsm_alloc_security_domain(struct domain *d)
 {
-    return xsm_ops->alloc_security_domain(d);
+    return xsm_ops.alloc_security_domain(d);
 }
 
 static inline void xsm_free_security_domain(struct domain *d)
 {
-    xsm_ops->free_security_domain(d);
+    xsm_ops.free_security_domain(d);
 }
 
 static inline int xsm_alloc_security_evtchns(struct evtchn chn[],
                                              unsigned int nr)
 {
-    return xsm_ops->alloc_security_evtchns(chn, nr);
+    return xsm_ops.alloc_security_evtchns(chn, nr);
 }
 
 static inline void xsm_free_security_evtchns(struct evtchn chn[],
                                              unsigned int nr)
 {
-    xsm_ops->free_security_evtchns(chn, nr);
+    xsm_ops.free_security_evtchns(chn, nr);
 }
 
 static inline char *xsm_show_security_evtchn(struct domain *d,
                                              const struct evtchn *chn)
 {
-    return xsm_ops->show_security_evtchn(d, chn);
+    return xsm_ops.show_security_evtchn(d, chn);
 }
 
 static inline int xsm_init_hardware_domain(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->init_hardware_domain(d);
+    return xsm_ops.init_hardware_domain(d);
 }
 
 static inline int xsm_get_pod_target(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->get_pod_target(d);
+    return xsm_ops.get_pod_target(d);
 }
 
 static inline int xsm_set_pod_target(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->set_pod_target(d);
+    return xsm_ops.set_pod_target(d);
 }
 
 static inline int xsm_memory_exchange(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->memory_exchange(d);
+    return xsm_ops.memory_exchange(d);
 }
 
 static inline int xsm_memory_adjust_reservation(xsm_default_t def,
                                                 struct domain *d1,
                                                 struct domain *d2)
 {
-    return xsm_ops->memory_adjust_reservation(d1, d2);
+    return xsm_ops.memory_adjust_reservation(d1, d2);
 }
 
 static inline int xsm_memory_stat_reservation(xsm_default_t def,
                                               struct domain *d1,
                                               struct domain *d2)
 {
-    return xsm_ops->memory_stat_reservation(d1, d2);
+    return xsm_ops.memory_stat_reservation(d1, d2);
 }
 
 static inline int xsm_memory_pin_page(xsm_default_t def, struct domain *d1,
                                       struct domain *d2, struct page_info *page)
 {
-    return xsm_ops->memory_pin_page(d1, d2, page);
+    return xsm_ops.memory_pin_page(d1, d2, page);
 }
 
 static inline int xsm_add_to_physmap(xsm_default_t def, struct domain *d1,
                                      struct domain *d2)
 {
-    return xsm_ops->add_to_physmap(d1, d2);
+    return xsm_ops.add_to_physmap(d1, d2);
 }
 
 static inline int xsm_remove_from_physmap(xsm_default_t def, struct domain *d1,
                                           struct domain *d2)
 {
-    return xsm_ops->remove_from_physmap(d1, d2);
+    return xsm_ops.remove_from_physmap(d1, d2);
 }
 
 static inline int xsm_map_gmfn_foreign(xsm_default_t def, struct domain *d,
                                        struct domain *t)
 {
-    return xsm_ops->map_gmfn_foreign(d, t);
+    return xsm_ops.map_gmfn_foreign(d, t);
 }
 
 static inline int xsm_claim_pages(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->claim_pages(d);
+    return xsm_ops.claim_pages(d);
 }
 
 static inline int xsm_console_io(xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops->console_io(d, cmd);
+    return xsm_ops.console_io(d, cmd);
 }
 
 static inline int xsm_profile(xsm_default_t def, struct domain *d, int op)
 {
-    return xsm_ops->profile(d, op);
+    return xsm_ops.profile(d, op);
 }
 
 static inline int xsm_kexec(xsm_default_t def)
 {
-    return xsm_ops->kexec();
+    return xsm_ops.kexec();
 }
 
 static inline int xsm_schedop_shutdown(xsm_default_t def, struct domain *d1,
                                        struct domain *d2)
 {
-    return xsm_ops->schedop_shutdown(d1, d2);
+    return xsm_ops.schedop_shutdown(d1, d2);
 }
 
 static inline char *xsm_show_irq_sid(int irq)
 {
-    return xsm_ops->show_irq_sid(irq);
+    return xsm_ops.show_irq_sid(irq);
 }
 
 static inline int xsm_map_domain_pirq(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->map_domain_pirq(d);
+    return xsm_ops.map_domain_pirq(d);
 }
 
 static inline int xsm_map_domain_irq(xsm_default_t def, struct domain *d,
                                      int irq, void *data)
 {
-    return xsm_ops->map_domain_irq(d, irq, data);
+    return xsm_ops.map_domain_irq(d, irq, data);
 }
 
 static inline int xsm_unmap_domain_pirq(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->unmap_domain_pirq(d);
+    return xsm_ops.unmap_domain_pirq(d);
 }
 
 static inline int xsm_unmap_domain_irq(xsm_default_t def, struct domain *d,
                                        int irq, void *data)
 {
-    return xsm_ops->unmap_domain_irq(d, irq, data);
+    return xsm_ops.unmap_domain_irq(d, irq, data);
 }
 
 static inline int xsm_bind_pt_irq(xsm_default_t def, struct domain *d,
                                   struct xen_domctl_bind_pt_irq *bind)
 {
-    return xsm_ops->bind_pt_irq(d, bind);
+    return xsm_ops.bind_pt_irq(d, bind);
 }
 
 static inline int xsm_unbind_pt_irq(xsm_default_t def, struct domain *d,
                                     struct xen_domctl_bind_pt_irq *bind)
 {
-    return xsm_ops->unbind_pt_irq(d, bind);
+    return xsm_ops.unbind_pt_irq(d, bind);
 }
 
 static inline int xsm_irq_permission(xsm_default_t def, struct domain *d,
                                      int pirq, uint8_t allow)
 {
-    return xsm_ops->irq_permission(d, pirq, allow);
+    return xsm_ops.irq_permission(d, pirq, allow);
 }
 
 static inline int xsm_iomem_permission(xsm_default_t def, struct domain *d,
                                        uint64_t s, uint64_t e, uint8_t allow)
 {
-    return xsm_ops->iomem_permission(d, s, e, allow);
+    return xsm_ops.iomem_permission(d, s, e, allow);
 }
 
 static inline int xsm_iomem_mapping(xsm_default_t def, struct domain *d,
                                     uint64_t s, uint64_t e, uint8_t allow)
 {
-    return xsm_ops->iomem_mapping(d, s, e, allow);
+    return xsm_ops.iomem_mapping(d, s, e, allow);
 }
 
 static inline int xsm_pci_config_permission(xsm_default_t def, struct domain *d,
@@ -501,25 +501,25 @@ static inline int xsm_pci_config_permission(xsm_default_t def, struct domain *d,
                                             uint16_t start, uint16_t end,
                                             uint8_t access)
 {
-    return xsm_ops->pci_config_permission(d, machine_bdf, start, end, access);
+    return xsm_ops.pci_config_permission(d, machine_bdf, start, end, access);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
 static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops->get_device_group(machine_bdf);
+    return xsm_ops.get_device_group(machine_bdf);
 }
 
 static inline int xsm_assign_device(xsm_default_t def, struct domain *d,
                                     uint32_t machine_bdf)
 {
-    return xsm_ops->assign_device(d, machine_bdf);
+    return xsm_ops.assign_device(d, machine_bdf);
 }
 
 static inline int xsm_deassign_device(xsm_default_t def, struct domain *d,
                                       uint32_t machine_bdf)
 {
-    return xsm_ops->deassign_device(d, machine_bdf);
+    return xsm_ops.deassign_device(d, machine_bdf);
 }
 #endif /* HAS_PASSTHROUGH && HAS_PCI) */
 
@@ -527,254 +527,254 @@ static inline int xsm_deassign_device(xsm_default_t def, struct domain *d,
 static inline int xsm_assign_dtdevice(xsm_default_t def, struct domain *d,
                                       const char *dtpath)
 {
-    return xsm_ops->assign_dtdevice(d, dtpath);
+    return xsm_ops.assign_dtdevice(d, dtpath);
 }
 
 static inline int xsm_deassign_dtdevice(xsm_default_t def, struct domain *d,
                                         const char *dtpath)
 {
-    return xsm_ops->deassign_dtdevice(d, dtpath);
+    return xsm_ops.deassign_dtdevice(d, dtpath);
 }
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
 static inline int xsm_resource_plug_pci(xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops->resource_plug_pci(machine_bdf);
+    return xsm_ops.resource_plug_pci(machine_bdf);
 }
 
 static inline int xsm_resource_unplug_pci(xsm_default_t def,
                                           uint32_t machine_bdf)
 {
-    return xsm_ops->resource_unplug_pci(machine_bdf);
+    return xsm_ops.resource_unplug_pci(machine_bdf);
 }
 
 static inline int xsm_resource_plug_core(xsm_default_t def)
 {
-    return xsm_ops->resource_plug_core();
+    return xsm_ops.resource_plug_core();
 }
 
 static inline int xsm_resource_unplug_core(xsm_default_t def)
 {
-    return xsm_ops->resource_unplug_core();
+    return xsm_ops.resource_unplug_core();
 }
 
 static inline int xsm_resource_setup_pci(xsm_default_t def,
                                          uint32_t machine_bdf)
 {
-    return xsm_ops->resource_setup_pci(machine_bdf);
+    return xsm_ops.resource_setup_pci(machine_bdf);
 }
 
 static inline int xsm_resource_setup_gsi(xsm_default_t def, int gsi)
 {
-    return xsm_ops->resource_setup_gsi(gsi);
+    return xsm_ops.resource_setup_gsi(gsi);
 }
 
 static inline int xsm_resource_setup_misc(xsm_default_t def)
 {
-    return xsm_ops->resource_setup_misc();
+    return xsm_ops.resource_setup_misc();
 }
 
 static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
 {
-    return xsm_ops->page_offline(cmd);
+    return xsm_ops.page_offline(cmd);
 }
 
 static inline int xsm_hypfs_op(xsm_default_t def)
 {
-    return xsm_ops->hypfs_op();
+    return xsm_ops.hypfs_op();
 }
 
 static inline long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
-    return xsm_ops->do_xsm_op(op);
+    return xsm_ops.do_xsm_op(op);
 }
 
 #ifdef CONFIG_COMPAT
 static inline int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
-    return xsm_ops->do_compat_op(op);
+    return xsm_ops.do_compat_op(op);
 }
 #endif
 
 static inline int xsm_hvm_param(xsm_default_t def, struct domain *d,
                                 unsigned long op)
 {
-    return xsm_ops->hvm_param(d, op);
+    return xsm_ops.hvm_param(d, op);
 }
 
 static inline int xsm_hvm_control(xsm_default_t def, struct domain *d,
                                   unsigned long op)
 {
-    return xsm_ops->hvm_control(d, op);
+    return xsm_ops.hvm_control(d, op);
 }
 
 static inline int xsm_hvm_param_altp2mhvm(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->hvm_param_altp2mhvm(d);
+    return xsm_ops.hvm_param_altp2mhvm(d);
 }
 
 static inline int xsm_hvm_altp2mhvm_op(xsm_default_t def, struct domain *d,
                                        uint64_t mode, uint32_t op)
 {
-    return xsm_ops->hvm_altp2mhvm_op(d, mode, op);
+    return xsm_ops.hvm_altp2mhvm_op(d, mode, op);
 }
 
 static inline int xsm_get_vnumainfo(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->get_vnumainfo(d);
+    return xsm_ops.get_vnumainfo(d);
 }
 
 static inline int xsm_vm_event_control(xsm_default_t def, struct domain *d,
                                        int mode, int op)
 {
-    return xsm_ops->vm_event_control(d, mode, op);
+    return xsm_ops.vm_event_control(d, mode, op);
 }
 
 #ifdef CONFIG_MEM_ACCESS
 static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->mem_access(d);
+    return xsm_ops.mem_access(d);
 }
 #endif
 
 #ifdef CONFIG_MEM_PAGING
 static inline int xsm_mem_paging(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->mem_paging(d);
+    return xsm_ops.mem_paging(d);
 }
 #endif
 
 #ifdef CONFIG_MEM_SHARING
 static inline int xsm_mem_sharing(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->mem_sharing(d);
+    return xsm_ops.mem_sharing(d);
 }
 #endif
 
 static inline int xsm_platform_op(xsm_default_t def, uint32_t op)
 {
-    return xsm_ops->platform_op(op);
+    return xsm_ops.platform_op(op);
 }
 
 #ifdef CONFIG_X86
 static inline int xsm_do_mca(xsm_default_t def)
 {
-    return xsm_ops->do_mca();
+    return xsm_ops.do_mca();
 }
 
 static inline int xsm_shadow_control(xsm_default_t def, struct domain *d,
                                      uint32_t op)
 {
-    return xsm_ops->shadow_control(d, op);
+    return xsm_ops.shadow_control(d, op);
 }
 
 static inline int xsm_mem_sharing_op(xsm_default_t def, struct domain *d,
                                      struct domain *cd, int op)
 {
-    return xsm_ops->mem_sharing_op(d, cd, op);
+    return xsm_ops.mem_sharing_op(d, cd, op);
 }
 
 static inline int xsm_apic(xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops->apic(d, cmd);
+    return xsm_ops.apic(d, cmd);
 }
 
 static inline int xsm_memtype(xsm_default_t def, uint32_t access)
 {
-    return xsm_ops->memtype(access);
+    return xsm_ops.memtype(access);
 }
 
 static inline int xsm_machine_memory_map(xsm_default_t def)
 {
-    return xsm_ops->machine_memory_map();
+    return xsm_ops.machine_memory_map();
 }
 
 static inline int xsm_domain_memory_map(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->domain_memory_map(d);
+    return xsm_ops.domain_memory_map(d);
 }
 
 static inline int xsm_mmu_update(xsm_default_t def, struct domain *d,
                                  struct domain *t, struct domain *f,
                                  uint32_t flags)
 {
-    return xsm_ops->mmu_update(d, t, f, flags);
+    return xsm_ops.mmu_update(d, t, f, flags);
 }
 
 static inline int xsm_mmuext_op(xsm_default_t def, struct domain *d,
                                 struct domain *f)
 {
-    return xsm_ops->mmuext_op(d, f);
+    return xsm_ops.mmuext_op(d, f);
 }
 
 static inline int xsm_update_va_mapping(xsm_default_t def, struct domain *d,
                                         struct domain *f, l1_pgentry_t pte)
 {
-    return xsm_ops->update_va_mapping(d, f, pte);
+    return xsm_ops.update_va_mapping(d, f, pte);
 }
 
 static inline int xsm_priv_mapping(xsm_default_t def, struct domain *d,
                                    struct domain *t)
 {
-    return xsm_ops->priv_mapping(d, t);
+    return xsm_ops.priv_mapping(d, t);
 }
 
 static inline int xsm_ioport_permission(xsm_default_t def, struct domain *d,
                                         uint32_t s, uint32_t e, uint8_t allow)
 {
-    return xsm_ops->ioport_permission(d, s, e, allow);
+    return xsm_ops.ioport_permission(d, s, e, allow);
 }
 
 static inline int xsm_ioport_mapping(xsm_default_t def, struct domain *d,
                                      uint32_t s, uint32_t e, uint8_t allow)
 {
-    return xsm_ops->ioport_mapping(d, s, e, allow);
+    return xsm_ops.ioport_mapping(d, s, e, allow);
 }
 
 static inline int xsm_pmu_op(xsm_default_t def, struct domain *d,
                              unsigned int op)
 {
-    return xsm_ops->pmu_op(d, op);
+    return xsm_ops.pmu_op(d, op);
 }
 
 #endif /* CONFIG_X86 */
 
 static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->dm_op(d);
+    return xsm_ops.dm_op(d);
 }
 
 static inline int xsm_xen_version(xsm_default_t def, uint32_t op)
 {
-    return xsm_ops->xen_version(op);
+    return xsm_ops.xen_version(op);
 }
 
 static inline int xsm_domain_resource_map(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->domain_resource_map(d);
+    return xsm_ops.domain_resource_map(d);
 }
 
 #ifdef CONFIG_ARGO
 static inline int xsm_argo_enable(const struct domain *d)
 {
-    return xsm_ops->argo_enable(d);
+    return xsm_ops.argo_enable(d);
 }
 
 static inline int xsm_argo_register_single_source(const struct domain *d,
                                                   const struct domain *t)
 {
-    return xsm_ops->argo_register_single_source(d, t);
+    return xsm_ops.argo_register_single_source(d, t);
 }
 
 static inline int xsm_argo_register_any_source(const struct domain *d)
 {
-    return xsm_ops->argo_register_any_source(d);
+    return xsm_ops.argo_register_any_source(d);
 }
 
 static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 {
-    return xsm_ops->argo_send(d, t);
+    return xsm_ops.argo_send(d, t);
 }
 
 #endif /* CONFIG_ARGO */
@@ -801,17 +801,18 @@ int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
 bool has_xsm_magic(paddr_t);
 #endif
 
-int register_xsm(struct xsm_operations *ops);
+extern struct xsm_ops dummy_xsm_ops;
 
-extern struct xsm_operations dummy_xsm_ops;
-
-void xsm_fixup_ops(struct xsm_operations *ops);
+void xsm_fixup_ops(struct xsm_ops *ops);
 
 #ifdef CONFIG_XSM_FLASK
-void flask_init(const void *policy_buffer, size_t policy_size);
+extern const struct xsm_ops *flask_init(const void *policy_buffer,
+                                        size_t policy_size);
 #else
-static inline void flask_init(const void *policy_buffer, size_t policy_size)
+static const inline struct xsm_ops *flask_init(const void *policy_buffer,
+                                               size_t policy_size)
 {
+    return NULL;
 }
 #endif
 
@@ -821,9 +822,12 @@ extern const unsigned int xsm_flask_init_policy_size;
 #endif
 
 #ifdef CONFIG_XSM_SILO
-void silo_init(void);
+extern const struct xsm_ops *silo_init(void);
 #else
-static inline void silo_init(void) {}
+static const inline struct xsm_ops *silo_init(void)
+{
+    return NULL;
+}
 #endif
 
 #else /* CONFIG_XSM */
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index de44b10130..d8c935328e 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -13,15 +13,13 @@
 #define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
 
-struct xsm_operations dummy_xsm_ops;
-
 #define set_to_dummy_if_null(ops, function)                            \
     do {                                                               \
         if ( !ops->function )                                          \
             ops->function = xsm_##function;                            \
     } while (0)
 
-void __init xsm_fixup_ops (struct xsm_operations *ops)
+void __init xsm_fixup_ops (struct xsm_ops *ops)
 {
     set_to_dummy_if_null(ops, security_domaininfo);
     set_to_dummy_if_null(ops, domain_create);
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 1465db125a..25e87180b4 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1745,7 +1745,7 @@ static int flask_argo_send(const struct domain *d, const struct domain *t)
 long do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
 int compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
 
-static struct xsm_operations flask_ops = {
+static const struct xsm_ops __initconstrel flask_ops = {
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
@@ -1883,7 +1883,8 @@ static struct xsm_operations flask_ops = {
 #endif
 };
 
-void __init flask_init(const void *policy_buffer, size_t policy_size)
+const struct xsm_ops *__init flask_init(const void *policy_buffer,
+                                        size_t policy_size)
 {
     int ret = -ENOENT;
 
@@ -1891,7 +1892,7 @@ void __init flask_init(const void *policy_buffer, size_t policy_size)
     {
     case FLASK_BOOTPARAM_DISABLED:
         printk(XENLOG_INFO "Flask: Disabled at boot.\n");
-        return;
+        return NULL;
 
     case FLASK_BOOTPARAM_PERMISSIVE:
         flask_enforcing = 0;
@@ -1908,9 +1909,6 @@ void __init flask_init(const void *policy_buffer, size_t policy_size)
 
     avc_init();
 
-    if ( register_xsm(&flask_ops) )
-        panic("Flask: Unable to register with XSM\n");
-
     if ( policy_size && flask_bootparam != FLASK_BOOTPARAM_LATELOAD )
         ret = security_load_policy(policy_buffer, policy_size);
 
@@ -1923,6 +1921,8 @@ void __init flask_init(const void *policy_buffer, size_t policy_size)
         printk(XENLOG_INFO "Flask:  Starting in enforcing mode.\n");
     else
         printk(XENLOG_INFO "Flask:  Starting in permissive mode.\n");
+
+    return &flask_ops;
 }
 
 /*
diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index fc2ca5cd2d..3550dded7b 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -100,7 +100,7 @@ static int silo_argo_send(const struct domain *d1, const struct domain *d2)
 
 #endif
 
-static struct xsm_operations silo_xsm_ops = {
+static const struct xsm_ops __initconstrel silo_xsm_ops = {
     .evtchn_unbound = silo_evtchn_unbound,
     .evtchn_interdomain = silo_evtchn_interdomain,
     .grant_mapref = silo_grant_mapref,
@@ -112,12 +112,11 @@ static struct xsm_operations silo_xsm_ops = {
 #endif
 };
 
-void __init silo_init(void)
+const struct xsm_ops *__init silo_init(void)
 {
     printk("Initialising XSM SILO mode\n");
 
-    if ( register_xsm(&silo_xsm_ops) )
-        panic("SILO: Unable to register with XSM\n");
+    return &silo_xsm_ops;
 }
 
 /*
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 55483292c5..859af3fe9a 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -28,9 +28,17 @@
 #include <asm/setup.h>
 #endif
 
-#define XSM_FRAMEWORK_VERSION    "1.0.0"
+#define XSM_FRAMEWORK_VERSION    "1.0.1"
 
-struct xsm_operations *xsm_ops;
+struct xsm_ops __read_mostly xsm_ops;
+
+enum xsm_ops_state {
+    XSM_OPS_UNREGISTERED,
+    XSM_OPS_REG_FAILED,
+    XSM_OPS_REGISTERED,
+};
+
+static enum xsm_ops_state xsm_ops_registered = XSM_OPS_UNREGISTERED;
 
 enum xsm_bootparam {
     XSM_BOOTPARAM_DUMMY,
@@ -68,17 +76,10 @@ static int __init parse_xsm_param(const char *s)
 }
 custom_param("xsm", parse_xsm_param);
 
-static inline int verify(struct xsm_operations *ops)
-{
-    /* verify the security_operations structure exists */
-    if ( !ops )
-        return -EINVAL;
-    xsm_fixup_ops(ops);
-    return 0;
-}
-
 static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
 {
+    const struct xsm_ops *ops = NULL;
+
 #ifdef CONFIG_XSM_FLASK_POLICY
     if ( policy_size == 0 )
     {
@@ -87,25 +88,35 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
     }
 #endif
 
-    if ( verify(&dummy_xsm_ops) )
+    if ( xsm_ops_registered != XSM_OPS_UNREGISTERED )
     {
-        printk(XENLOG_ERR "Could not verify dummy_xsm_ops structure\n");
+        printk(XENLOG_ERR
+               "Could not init XSM, xsm_ops register already attempted\n");
         return -EIO;
     }
 
-    xsm_ops = &dummy_xsm_ops;
-
     switch ( xsm_bootparam )
     {
     case XSM_BOOTPARAM_DUMMY:
+        xsm_ops_registered = XSM_OPS_REGISTERED;
         break;
 
     case XSM_BOOTPARAM_FLASK:
-        flask_init(policy_buffer, policy_size);
+        ops = flask_init(policy_buffer, policy_size);
+        if ( ops )
+        {
+            xsm_ops_registered = XSM_OPS_REGISTERED;
+            xsm_ops = *ops;
+        }
         break;
 
     case XSM_BOOTPARAM_SILO:
-        silo_init();
+        ops = silo_init();
+        if ( ops )
+        {
+            xsm_ops_registered = XSM_OPS_REGISTERED;
+            xsm_ops = *ops;
+        }
         break;
 
     default:
@@ -113,6 +124,22 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
         break;
     }
 
+    /*
+     * This handles three cases,
+     *   - dummy policy module was selected
+     *   - a policy module does not provide all handlers
+     *   - a policy module failed to init
+     */
+    xsm_fixup_ops(&xsm_ops);
+
+    if ( xsm_ops_registered != XSM_OPS_REGISTERED )
+    {
+        xsm_ops_registered = XSM_OPS_REG_FAILED;
+        printk(XENLOG_ERR
+               "Could not init XSM, xsm_ops register failed\n");
+        return -EFAULT;
+    }
+
     return 0;
 }
 
@@ -195,22 +222,6 @@ bool __init has_xsm_magic(paddr_t start)
 }
 #endif
 
-int __init register_xsm(struct xsm_operations *ops)
-{
-    if ( verify(ops) )
-    {
-        printk(XENLOG_ERR "Could not verify xsm_operations structure\n");
-        return -EINVAL;
-    }
-
-    if ( xsm_ops != &dummy_xsm_ops )
-        return -EAGAIN;
-
-    xsm_ops = ops;
-
-    return 0;
-}
-
 #endif
 
 long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
-- 
2.20.1


