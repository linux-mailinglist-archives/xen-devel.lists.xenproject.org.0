Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1513C64F0
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 22:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154762.285881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32WU-0008Dx-As; Mon, 12 Jul 2021 20:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154762.285881; Mon, 12 Jul 2021 20:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32WU-0008Bt-6s; Mon, 12 Jul 2021 20:27:26 +0000
Received: by outflank-mailman (input) for mailman id 154762;
 Mon, 12 Jul 2021 20:27:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Agf=ME=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m32WS-00089m-ID
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 20:27:24 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fbb819a-e34f-11eb-8706-12813bfff9fa;
 Mon, 12 Jul 2021 20:27:22 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1626121625956852.6416374676493;
 Mon, 12 Jul 2021 13:27:05 -0700 (PDT)
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
X-Inumbo-ID: 8fbb819a-e34f-11eb-8706-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1626121627; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VWYjf37AA/MPBjBL565JbWtbyTaps0GHyX1sBAyrZHzk04fUMa7RG4zNSan1fgrHxI9Egv+MMh40wuQH1pkFK71ts6yIr/V1cFe8mo7741nAiRmr+jpRE89TLbKIHJOJIPkAeb/hGfGJ10uAwJJ/+mTDalnp6FpNq8sRXumJUwE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626121627; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=gDu8jJ6R5Zx5yM5PugT1EdL7sMQTspIU2RFRkJquHjo=; 
	b=FeWAeCNPQ+WfltohGZpLcbTGCLjl1dtqmQnBZy18ieBRkVDqA/c3C6h4PHppCWvl0+n2HuZsEcxk+Wh4qr0iWDojA5Z7h0CQF0ivdo919t3sevZtScVdK4vLayGOcQ/E2TBIV8UxEbzKTJinJUzZn4c5YOi/zSN73iNoeJpOgdA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626121627;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gDu8jJ6R5Zx5yM5PugT1EdL7sMQTspIU2RFRkJquHjo=;
	b=KKRKxsBv+p+tMstCS8kSOXECk5N/HRgMjS3p6x0fGxG3igx2PHX+kAb3Vhiu4WwF
	9ftA2fJV+qkdUO45k9VGEDDz3yB4bSjQM+7KM+z6Hqb3Mh0skwxeT+LM6ODfJu3ZvDF
	B4ja3RSSABxtcG83KvIDJqz2qLlnoW7QsveFkKIU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v2 02/10] xsm: refactor xsm_ops handling
Date: Mon, 12 Jul 2021 16:32:25 -0400
Message-Id: <20210712203233.20289-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712203233.20289-1-dpsmith@apertussolutions.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This converts the global xsm_ops from being a pointer to a struct xsm_ops to being an
explicit instance. It then reworks the XSM modules init function to
return their xsm_ops struct which is copied in to the global xsm_ops.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/xsm.h    | 215 ++++++++++++++++++++-------------------
 xen/xsm/dummy.c          |   2 -
 xen/xsm/flask/flask_op.c |   4 +-
 xen/xsm/flask/hooks.c    |  11 +-
 xen/xsm/silo.c           |   5 +-
 xen/xsm/xsm_core.c       |  72 +++++++------
 6 files changed, 158 insertions(+), 151 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index ad3cddbf7d..a8805f514b 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -191,295 +191,295 @@ struct xsm_operations {
 
 #ifdef CONFIG_XSM
 
-extern struct xsm_operations *xsm_ops;
+extern struct xsm_operations xsm_ops;
 
 #ifndef XSM_NO_WRAPPERS
 
 static inline void xsm_security_domaininfo (struct domain *d,
                                         struct xen_domctl_getdomaininfo *info)
 {
-    xsm_ops->security_domaininfo(d, info);
+    xsm_ops.security_domaininfo(d, info);
 }
 
 static inline int xsm_domain_create (xsm_default_t def, struct domain *d, u32 ssidref)
 {
-    return xsm_ops->domain_create(d, ssidref);
+    return xsm_ops.domain_create(d, ssidref);
 }
 
 static inline int xsm_getdomaininfo (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->getdomaininfo(d);
+    return xsm_ops.getdomaininfo(d);
 }
 
 static inline int xsm_domctl_scheduler_op (xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops->domctl_scheduler_op(d, cmd);
+    return xsm_ops.domctl_scheduler_op(d, cmd);
 }
 
 static inline int xsm_sysctl_scheduler_op (xsm_default_t def, int cmd)
 {
-    return xsm_ops->sysctl_scheduler_op(cmd);
+    return xsm_ops.sysctl_scheduler_op(cmd);
 }
 
 static inline int xsm_set_target (xsm_default_t def, struct domain *d, struct domain *e)
 {
-    return xsm_ops->set_target(d, e);
+    return xsm_ops.set_target(d, e);
 }
 
 static inline int xsm_domctl (xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops->domctl(d, cmd);
+    return xsm_ops.domctl(d, cmd);
 }
 
 static inline int xsm_sysctl (xsm_default_t def, int cmd)
 {
-    return xsm_ops->sysctl(cmd);
+    return xsm_ops.sysctl(cmd);
 }
 
 static inline int xsm_readconsole (xsm_default_t def, uint32_t clear)
 {
-    return xsm_ops->readconsole(clear);
+    return xsm_ops.readconsole(clear);
 }
 
 static inline int xsm_evtchn_unbound (xsm_default_t def, struct domain *d1, struct evtchn *chn,
                                                                     domid_t id2)
 {
-    return xsm_ops->evtchn_unbound(d1, chn, id2);
+    return xsm_ops.evtchn_unbound(d1, chn, id2);
 }
 
 static inline int xsm_evtchn_interdomain (xsm_default_t def, struct domain *d1,
                 struct evtchn *chan1, struct domain *d2, struct evtchn *chan2)
 {
-    return xsm_ops->evtchn_interdomain(d1, chan1, d2, chan2);
+    return xsm_ops.evtchn_interdomain(d1, chan1, d2, chan2);
 }
 
 static inline void xsm_evtchn_close_post (struct evtchn *chn)
 {
-    xsm_ops->evtchn_close_post(chn);
+    xsm_ops.evtchn_close_post(chn);
 }
 
 static inline int xsm_evtchn_send (xsm_default_t def, struct domain *d, struct evtchn *chn)
 {
-    return xsm_ops->evtchn_send(d, chn);
+    return xsm_ops.evtchn_send(d, chn);
 }
 
 static inline int xsm_evtchn_status (xsm_default_t def, struct domain *d, struct evtchn *chn)
 {
-    return xsm_ops->evtchn_status(d, chn);
+    return xsm_ops.evtchn_status(d, chn);
 }
 
 static inline int xsm_evtchn_reset (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->evtchn_reset(d1, d2);
+    return xsm_ops.evtchn_reset(d1, d2);
 }
 
 static inline int xsm_grant_mapref (xsm_default_t def, struct domain *d1, struct domain *d2,
                                                                 uint32_t flags)
 {
-    return xsm_ops->grant_mapref(d1, d2, flags);
+    return xsm_ops.grant_mapref(d1, d2, flags);
 }
 
 static inline int xsm_grant_unmapref (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_unmapref(d1, d2);
+    return xsm_ops.grant_unmapref(d1, d2);
 }
 
 static inline int xsm_grant_setup (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_setup(d1, d2);
+    return xsm_ops.grant_setup(d1, d2);
 }
 
 static inline int xsm_grant_transfer (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_transfer(d1, d2);
+    return xsm_ops.grant_transfer(d1, d2);
 }
 
 static inline int xsm_grant_copy (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_copy(d1, d2);
+    return xsm_ops.grant_copy(d1, d2);
 }
 
 static inline int xsm_grant_query_size (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_query_size(d1, d2);
+    return xsm_ops.grant_query_size(d1, d2);
 }
 
 static inline int xsm_alloc_security_domain (struct domain *d)
 {
-    return xsm_ops->alloc_security_domain(d);
+    return xsm_ops.alloc_security_domain(d);
 }
 
 static inline void xsm_free_security_domain (struct domain *d)
 {
-    xsm_ops->free_security_domain(d);
+    xsm_ops.free_security_domain(d);
 }
 
 static inline int xsm_alloc_security_evtchns(
     struct evtchn chn[], unsigned int nr)
 {
-    return xsm_ops->alloc_security_evtchns(chn, nr);
+    return xsm_ops.alloc_security_evtchns(chn, nr);
 }
 
 static inline void xsm_free_security_evtchns(
     struct evtchn chn[], unsigned int nr)
 {
-    xsm_ops->free_security_evtchns(chn, nr);
+    xsm_ops.free_security_evtchns(chn, nr);
 }
 
 static inline char *xsm_show_security_evtchn (struct domain *d, const struct evtchn *chn)
 {
-    return xsm_ops->show_security_evtchn(d, chn);
+    return xsm_ops.show_security_evtchn(d, chn);
 }
 
 static inline int xsm_init_hardware_domain (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->init_hardware_domain(d);
+    return xsm_ops.init_hardware_domain(d);
 }
 
 static inline int xsm_get_pod_target (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->get_pod_target(d);
+    return xsm_ops.get_pod_target(d);
 }
 
 static inline int xsm_set_pod_target (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->set_pod_target(d);
+    return xsm_ops.set_pod_target(d);
 }
 
 static inline int xsm_memory_exchange (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->memory_exchange(d);
+    return xsm_ops.memory_exchange(d);
 }
 
 static inline int xsm_memory_adjust_reservation (xsm_default_t def, struct domain *d1, struct
                                                                     domain *d2)
 {
-    return xsm_ops->memory_adjust_reservation(d1, d2);
+    return xsm_ops.memory_adjust_reservation(d1, d2);
 }
 
 static inline int xsm_memory_stat_reservation (xsm_default_t def, struct domain *d1,
                                                             struct domain *d2)
 {
-    return xsm_ops->memory_stat_reservation(d1, d2);
+    return xsm_ops.memory_stat_reservation(d1, d2);
 }
 
 static inline int xsm_memory_pin_page(xsm_default_t def, struct domain *d1, struct domain *d2,
                                       struct page_info *page)
 {
-    return xsm_ops->memory_pin_page(d1, d2, page);
+    return xsm_ops.memory_pin_page(d1, d2, page);
 }
 
 static inline int xsm_add_to_physmap(xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->add_to_physmap(d1, d2);
+    return xsm_ops.add_to_physmap(d1, d2);
 }
 
 static inline int xsm_remove_from_physmap(xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->remove_from_physmap(d1, d2);
+    return xsm_ops.remove_from_physmap(d1, d2);
 }
 
 static inline int xsm_map_gmfn_foreign (xsm_default_t def, struct domain *d, struct domain *t)
 {
-    return xsm_ops->map_gmfn_foreign(d, t);
+    return xsm_ops.map_gmfn_foreign(d, t);
 }
 
 static inline int xsm_claim_pages(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->claim_pages(d);
+    return xsm_ops.claim_pages(d);
 }
 
 static inline int xsm_console_io (xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops->console_io(d, cmd);
+    return xsm_ops.console_io(d, cmd);
 }
 
 static inline int xsm_profile (xsm_default_t def, struct domain *d, int op)
 {
-    return xsm_ops->profile(d, op);
+    return xsm_ops.profile(d, op);
 }
 
 static inline int xsm_kexec (xsm_default_t def)
 {
-    return xsm_ops->kexec();
+    return xsm_ops.kexec();
 }
 
 static inline int xsm_schedop_shutdown (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->schedop_shutdown(d1, d2);
+    return xsm_ops.schedop_shutdown(d1, d2);
 }
 
 static inline char *xsm_show_irq_sid (int irq)
 {
-    return xsm_ops->show_irq_sid(irq);
+    return xsm_ops.show_irq_sid(irq);
 }
 
 static inline int xsm_map_domain_pirq (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->map_domain_pirq(d);
+    return xsm_ops.map_domain_pirq(d);
 }
 
 static inline int xsm_map_domain_irq (xsm_default_t def, struct domain *d, int irq, void *data)
 {
-    return xsm_ops->map_domain_irq(d, irq, data);
+    return xsm_ops.map_domain_irq(d, irq, data);
 }
 
 static inline int xsm_unmap_domain_pirq (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->unmap_domain_pirq(d);
+    return xsm_ops.unmap_domain_pirq(d);
 }
 
 static inline int xsm_unmap_domain_irq (xsm_default_t def, struct domain *d, int irq, void *data)
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
 
 static inline int xsm_irq_permission (xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
 {
-    return xsm_ops->irq_permission(d, pirq, allow);
+    return xsm_ops.irq_permission(d, pirq, allow);
 }
 
 static inline int xsm_iomem_permission (xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
-    return xsm_ops->iomem_permission(d, s, e, allow);
+    return xsm_ops.iomem_permission(d, s, e, allow);
 }
 
 static inline int xsm_iomem_mapping (xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
-    return xsm_ops->iomem_mapping(d, s, e, allow);
+    return xsm_ops.iomem_mapping(d, s, e, allow);
 }
 
 static inline int xsm_pci_config_permission (xsm_default_t def, struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access)
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
 
 static inline int xsm_assign_device(xsm_default_t def, struct domain *d, uint32_t machine_bdf)
 {
-    return xsm_ops->assign_device(d, machine_bdf);
+    return xsm_ops.assign_device(d, machine_bdf);
 }
 
 static inline int xsm_deassign_device(xsm_default_t def, struct domain *d, uint32_t machine_bdf)
 {
-    return xsm_ops->deassign_device(d, machine_bdf);
+    return xsm_ops.deassign_device(d, machine_bdf);
 }
 #endif /* HAS_PASSTHROUGH && HAS_PCI) */
 
@@ -487,240 +487,240 @@ static inline int xsm_deassign_device(xsm_default_t def, struct domain *d, uint3
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
 
 static inline int xsm_resource_plug_pci (xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops->resource_plug_pci(machine_bdf);
+    return xsm_ops.resource_plug_pci(machine_bdf);
 }
 
 static inline int xsm_resource_unplug_pci (xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops->resource_unplug_pci(machine_bdf);
+    return xsm_ops.resource_unplug_pci(machine_bdf);
 }
 
 static inline int xsm_resource_plug_core (xsm_default_t def)
 {
-    return xsm_ops->resource_plug_core();
+    return xsm_ops.resource_plug_core();
 }
 
 static inline int xsm_resource_unplug_core (xsm_default_t def)
 {
-    return xsm_ops->resource_unplug_core();
+    return xsm_ops.resource_unplug_core();
 }
 
 static inline int xsm_resource_setup_pci (xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops->resource_setup_pci(machine_bdf);
+    return xsm_ops.resource_setup_pci(machine_bdf);
 }
 
 static inline int xsm_resource_setup_gsi (xsm_default_t def, int gsi)
 {
-    return xsm_ops->resource_setup_gsi(gsi);
+    return xsm_ops.resource_setup_gsi(gsi);
 }
 
 static inline int xsm_resource_setup_misc (xsm_default_t def)
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
 
 static inline long xsm_do_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
-    return xsm_ops->do_xsm_op(op);
+    return xsm_ops.do_xsm_op(op);
 }
 
 #ifdef CONFIG_COMPAT
 static inline int xsm_do_compat_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
-    return xsm_ops->do_compat_op(op);
+    return xsm_ops.do_compat_op(op);
 }
 #endif
 
 static inline int xsm_hvm_param (xsm_default_t def, struct domain *d, unsigned long op)
 {
-    return xsm_ops->hvm_param(d, op);
+    return xsm_ops.hvm_param(d, op);
 }
 
 static inline int xsm_hvm_control(xsm_default_t def, struct domain *d, unsigned long op)
 {
-    return xsm_ops->hvm_control(d, op);
+    return xsm_ops.hvm_control(d, op);
 }
 
 static inline int xsm_hvm_param_altp2mhvm (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->hvm_param_altp2mhvm(d);
+    return xsm_ops.hvm_param_altp2mhvm(d);
 }
 
 static inline int xsm_hvm_altp2mhvm_op (xsm_default_t def, struct domain *d, uint64_t mode, uint32_t op)
 {
-    return xsm_ops->hvm_altp2mhvm_op(d, mode, op);
+    return xsm_ops.hvm_altp2mhvm_op(d, mode, op);
 }
 
 static inline int xsm_get_vnumainfo (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->get_vnumainfo(d);
+    return xsm_ops.get_vnumainfo(d);
 }
 
 static inline int xsm_vm_event_control (xsm_default_t def, struct domain *d, int mode, int op)
 {
-    return xsm_ops->vm_event_control(d, mode, op);
+    return xsm_ops.vm_event_control(d, mode, op);
 }
 
 #ifdef CONFIG_MEM_ACCESS
 static inline int xsm_mem_access (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->mem_access(d);
+    return xsm_ops.mem_access(d);
 }
 #endif
 
 #ifdef CONFIG_MEM_PAGING
 static inline int xsm_mem_paging (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->mem_paging(d);
+    return xsm_ops.mem_paging(d);
 }
 #endif
 
 #ifdef CONFIG_MEM_SHARING
 static inline int xsm_mem_sharing (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->mem_sharing(d);
+    return xsm_ops.mem_sharing(d);
 }
 #endif
 
 static inline int xsm_platform_op (xsm_default_t def, uint32_t op)
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
 
 static inline int xsm_shadow_control (xsm_default_t def, struct domain *d, uint32_t op)
 {
-    return xsm_ops->shadow_control(d, op);
+    return xsm_ops.shadow_control(d, op);
 }
 
 static inline int xsm_mem_sharing_op (xsm_default_t def, struct domain *d, struct domain *cd, int op)
 {
-    return xsm_ops->mem_sharing_op(d, cd, op);
+    return xsm_ops.mem_sharing_op(d, cd, op);
 }
 
 static inline int xsm_apic (xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops->apic(d, cmd);
+    return xsm_ops.apic(d, cmd);
 }
 
 static inline int xsm_memtype (xsm_default_t def, uint32_t access)
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
 
 static inline int xsm_mmu_update (xsm_default_t def, struct domain *d, struct domain *t,
                                   struct domain *f, uint32_t flags)
 {
-    return xsm_ops->mmu_update(d, t, f, flags);
+    return xsm_ops.mmu_update(d, t, f, flags);
 }
 
 static inline int xsm_mmuext_op (xsm_default_t def, struct domain *d, struct domain *f)
 {
-    return xsm_ops->mmuext_op(d, f);
+    return xsm_ops.mmuext_op(d, f);
 }
 
 static inline int xsm_update_va_mapping(xsm_default_t def, struct domain *d, struct domain *f,
                                                             l1_pgentry_t pte)
 {
-    return xsm_ops->update_va_mapping(d, f, pte);
+    return xsm_ops.update_va_mapping(d, f, pte);
 }
 
 static inline int xsm_priv_mapping(xsm_default_t def, struct domain *d, struct domain *t)
 {
-    return xsm_ops->priv_mapping(d, t);
+    return xsm_ops.priv_mapping(d, t);
 }
 
 static inline int xsm_ioport_permission (xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
-    return xsm_ops->ioport_permission(d, s, e, allow);
+    return xsm_ops.ioport_permission(d, s, e, allow);
 }
 
 static inline int xsm_ioport_mapping (xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
-    return xsm_ops->ioport_mapping(d, s, e, allow);
+    return xsm_ops.ioport_mapping(d, s, e, allow);
 }
 
 static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int op)
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
 
 static inline int xsm_xen_version (xsm_default_t def, uint32_t op)
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
@@ -747,16 +747,14 @@ extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
 extern bool has_xsm_magic(paddr_t);
 #endif
 
-extern int register_xsm(struct xsm_operations *ops);
-
-extern struct xsm_operations dummy_xsm_ops;
 extern void xsm_fixup_ops(struct xsm_operations *ops);
 
 #ifdef CONFIG_XSM_FLASK
-extern void flask_init(const void *policy_buffer, size_t policy_size);
+extern struct xsm_operations *flask_init(const void *policy_buffer, size_t policy_size);
 #else
-static inline void flask_init(const void *policy_buffer, size_t policy_size)
+static inline struct xsm_operations *flask_init(const void *policy_buffer, size_t policy_size)
 {
+    return NULL;
 }
 #endif
 
@@ -766,9 +764,12 @@ extern const unsigned int xsm_flask_init_policy_size;
 #endif
 
 #ifdef CONFIG_XSM_SILO
-extern void silo_init(void);
+extern struct xsm_operations *silo_init(void);
 #else
-static inline void silo_init(void) {}
+static inline struct xsm_operations *silo_init(void)
+{
+    return NULL;
+}
 #endif
 
 #else /* CONFIG_XSM */
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index de44b10130..066694763a 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -13,8 +13,6 @@
 #define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
 
-struct xsm_operations dummy_xsm_ops;
-
 #define set_to_dummy_if_null(ops, function)                            \
     do {                                                               \
         if ( !ops->function )                                          \
diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index 01e52138a1..32e079d676 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -226,6 +226,7 @@ static int flask_security_sid(struct xen_flask_sid_context *arg)
 static int flask_disable(void)
 {
     static int flask_disabled = 0;
+    struct xsm_operations default_ops;
 
     if ( ss_initialized )
     {
@@ -244,7 +245,8 @@ static int flask_disable(void)
     flask_disabled = 1;
 
     /* Reset xsm_ops to the original module. */
-    xsm_ops = &dummy_xsm_ops;
+    xsm_fixup_ops(&default_ops);
+    xsm_ops = default_ops;
 
     return 0;
 }
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index f1a1217c98..a3a88aa8ed 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1883,7 +1883,8 @@ static struct xsm_operations flask_ops = {
 #endif
 };
 
-void __init flask_init(const void *policy_buffer, size_t policy_size)
+struct xsm_operations __init *flask_init(const void *policy_buffer,
+					 size_t policy_size)
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
 
@@ -1923,6 +1921,9 @@ void __init flask_init(const void *policy_buffer, size_t policy_size)
         printk(XENLOG_INFO "Flask:  Starting in enforcing mode.\n");
     else
         printk(XENLOG_INFO "Flask:  Starting in permissive mode.\n");
+
+    return &flask_ops;
+
 }
 
 /*
diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index fc2ca5cd2d..808350f122 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -112,12 +112,11 @@ static struct xsm_operations silo_xsm_ops = {
 #endif
 };
 
-void __init silo_init(void)
+struct xsm_operations __init *silo_init(void)
 {
     printk("Initialising XSM SILO mode\n");
 
-    if ( register_xsm(&silo_xsm_ops) )
-        panic("SILO: Unable to register with XSM\n");
+    return &silo_xsm_ops;
 }
 
 /*
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 5eab21e1b1..7265f742e9 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -28,9 +28,17 @@
 #include <asm/setup.h>
 #endif
 
-#define XSM_FRAMEWORK_VERSION    "1.0.0"
+#define XSM_FRAMEWORK_VERSION    "1.0.1"
 
-struct xsm_operations *xsm_ops;
+struct xsm_operations xsm_ops;
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
+	struct xsm_operations *mod_ops;
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
+        mod_ops = flask_init(policy_buffer, policy_size);
+	if ( mod_ops )
+	{
+		xsm_ops_registered = XSM_OPS_REGISTERED;
+		xsm_ops = *mod_ops;
+	}
         break;
 
     case XSM_BOOTPARAM_SILO:
-        silo_init();
+        mod_ops = silo_init();
+	if ( mod_ops )
+	{
+		xsm_ops_registered = XSM_OPS_REGISTERED;
+		xsm_ops = *mod_ops;
+	}
         break;
 
     default:
@@ -113,6 +124,17 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
         break;
     }
 
+    /*
+     * This handles three cases,
+     *   - dummy policy module was selected
+     *   - a policy module  does not provide all handlers
+     *   - a policy module failed to init
+     */
+    xsm_fixup_ops(&xsm_ops);
+
+    if ( xsm_ops_registered != XSM_OPS_REGISTERED )
+        xsm_ops_registered = XSM_OPS_REG_FAILED;
+
     return 0;
 }
 
@@ -195,22 +217,6 @@ bool __init has_xsm_magic(paddr_t start)
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
 
 long do_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
-- 
2.20.1


