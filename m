Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B04C53ABF68
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 01:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144195.265467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1Sh-0001eU-EV; Thu, 17 Jun 2021 23:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144195.265467; Thu, 17 Jun 2021 23:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1Sh-0001bv-BA; Thu, 17 Jun 2021 23:30:15 +0000
Received: by outflank-mailman (input) for mailman id 144195;
 Thu, 17 Jun 2021 23:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uRdX=LL=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lu1Sg-00010r-0g
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 23:30:14 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40ef623f-d304-42f1-ba20-cc0930f6336c;
 Thu, 17 Jun 2021 23:30:10 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1623972573889956.4417367035688;
 Thu, 17 Jun 2021 16:29:33 -0700 (PDT)
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
X-Inumbo-ID: 40ef623f-d304-42f1-ba20-cc0930f6336c
ARC-Seal: i=1; a=rsa-sha256; t=1623972575; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VDKBwQj1nBzvqtW2U2T2yODFSh19+L7TNYnUcxqns/QuplbzvW7nIDrbYXQgy7M91qcLWPbJk6BEFZIPml78757s0m8aEYgJTT5tuhC32L91UqceBmLI3UJFkXAgIPMQMcnPN8b7EBkMBoYrexquS8zNDwKSt3t/lFlvLzTp9aw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1623972575; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fWqFbTBqMZZzOoUgYd44Oj5rLniCHoQ0vcCj6pqgPxc=; 
	b=MaY4qcskFZUZlhXJgduggXnSC0ghPNgOGTbIsKKf46uIrBFueWmCl6CYfLB/Vf3lLt+99loQntPcMlgnfvB6u0JhUA6goPnR9oLfd0A9/dj434dsR5VLomAPBPIi34grMh+Zw6kL4RSpPzeNoZUgeQuoneauTf1qgmpg0ujHpBs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623972575;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=fWqFbTBqMZZzOoUgYd44Oj5rLniCHoQ0vcCj6pqgPxc=;
	b=S3z/HflOTs1iefs2tCSSlgFxak5hHmUP9Y4UI15vvY+pTCWIsOSyQKXnOTzDmpZC
	TaCMr48D4YFMgM2Bc6aDabniZnrJzOVMCUo0PUe6VtscyCNB47bOBXMN0Ys3UU/zULt
	FzUre7lguw/7AIKMOC5I5N45CskbMKOqDnTYDThk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	persaur@gmail.com,
	christopher.w.clark@gmail.com,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [PATCH 1/6] xsm: refactor xsm_ops handling
Date: Thu, 17 Jun 2021 19:39:13 -0400
Message-Id: <20210617233918.10095-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617233918.10095-1-dpsmith@apertussolutions.com>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The assignment and setup of xsm_ops structure was refactored to make it a
one-time assignment. The calling of the xsm_ops were refactored to use the
alternate_call framework to reduce the need for retpolines.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/xsm.h    | 206 ++++++++++++++++++++-------------------
 xen/xsm/dummy.c          |   2 -
 xen/xsm/flask/flask_op.c |  21 +---
 xen/xsm/xsm_core.c       |  50 ++++++----
 4 files changed, 138 insertions(+), 141 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index ad3cddbf7d..86ca045e74 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -15,6 +15,9 @@
 #ifndef __XSM_H__
 #define __XSM_H__
 
+#ifdef CONFIG_XSM
+#include <asm/alternative.h>
+#endif
 #include <xen/sched.h>
 #include <xen/multiboot.h>
 
@@ -191,295 +194,295 @@ struct xsm_operations {
 
 #ifdef CONFIG_XSM
 
-extern struct xsm_operations *xsm_ops;
+extern struct xsm_operations xsm_ops;
 
 #ifndef XSM_NO_WRAPPERS
 
 static inline void xsm_security_domaininfo (struct domain *d,
                                         struct xen_domctl_getdomaininfo *info)
 {
-    xsm_ops->security_domaininfo(d, info);
+    alternative_vcall(xsm_ops.security_domaininfo, d, info);
 }
 
 static inline int xsm_domain_create (xsm_default_t def, struct domain *d, u32 ssidref)
 {
-    return xsm_ops->domain_create(d, ssidref);
+    return alternative_call(xsm_ops.domain_create, d, ssidref);
 }
 
 static inline int xsm_getdomaininfo (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->getdomaininfo(d);
+    return alternative_call(xsm_ops.getdomaininfo, d);
 }
 
 static inline int xsm_domctl_scheduler_op (xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops->domctl_scheduler_op(d, cmd);
+    return alternative_call(xsm_ops.domctl_scheduler_op, d, cmd);
 }
 
 static inline int xsm_sysctl_scheduler_op (xsm_default_t def, int cmd)
 {
-    return xsm_ops->sysctl_scheduler_op(cmd);
+    return alternative_call(xsm_ops.sysctl_scheduler_op, cmd);
 }
 
 static inline int xsm_set_target (xsm_default_t def, struct domain *d, struct domain *e)
 {
-    return xsm_ops->set_target(d, e);
+    return alternative_call(xsm_ops.set_target, d, e);
 }
 
 static inline int xsm_domctl (xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops->domctl(d, cmd);
+    return alternative_call(xsm_ops.domctl, d, cmd);
 }
 
 static inline int xsm_sysctl (xsm_default_t def, int cmd)
 {
-    return xsm_ops->sysctl(cmd);
+    return alternative_call(xsm_ops.sysctl, cmd);
 }
 
 static inline int xsm_readconsole (xsm_default_t def, uint32_t clear)
 {
-    return xsm_ops->readconsole(clear);
+    return alternative_call(xsm_ops.readconsole, clear);
 }
 
 static inline int xsm_evtchn_unbound (xsm_default_t def, struct domain *d1, struct evtchn *chn,
                                                                     domid_t id2)
 {
-    return xsm_ops->evtchn_unbound(d1, chn, id2);
+    return alternative_call(xsm_ops.evtchn_unbound, d1, chn, id2);
 }
 
 static inline int xsm_evtchn_interdomain (xsm_default_t def, struct domain *d1,
                 struct evtchn *chan1, struct domain *d2, struct evtchn *chan2)
 {
-    return xsm_ops->evtchn_interdomain(d1, chan1, d2, chan2);
+    return alternative_call(xsm_ops.evtchn_interdomain, d1, chan1, d2, chan2);
 }
 
 static inline void xsm_evtchn_close_post (struct evtchn *chn)
 {
-    xsm_ops->evtchn_close_post(chn);
+    alternative_vcall(xsm_ops.evtchn_close_post, chn);
 }
 
 static inline int xsm_evtchn_send (xsm_default_t def, struct domain *d, struct evtchn *chn)
 {
-    return xsm_ops->evtchn_send(d, chn);
+    return alternative_call(xsm_ops.evtchn_send, d, chn);
 }
 
 static inline int xsm_evtchn_status (xsm_default_t def, struct domain *d, struct evtchn *chn)
 {
-    return xsm_ops->evtchn_status(d, chn);
+    return alternative_call(xsm_ops.evtchn_status, d, chn);
 }
 
 static inline int xsm_evtchn_reset (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->evtchn_reset(d1, d2);
+    return alternative_call(xsm_ops.evtchn_reset, d1, d2);
 }
 
 static inline int xsm_grant_mapref (xsm_default_t def, struct domain *d1, struct domain *d2,
                                                                 uint32_t flags)
 {
-    return xsm_ops->grant_mapref(d1, d2, flags);
+    return alternative_call(xsm_ops.grant_mapref, d1, d2, flags);
 }
 
 static inline int xsm_grant_unmapref (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_unmapref(d1, d2);
+    return alternative_call(xsm_ops.grant_unmapref, d1, d2);
 }
 
 static inline int xsm_grant_setup (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_setup(d1, d2);
+    return alternative_call(xsm_ops.grant_setup, d1, d2);
 }
 
 static inline int xsm_grant_transfer (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_transfer(d1, d2);
+    return alternative_call(xsm_ops.grant_transfer, d1, d2);
 }
 
 static inline int xsm_grant_copy (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_copy(d1, d2);
+    return alternative_call(xsm_ops.grant_copy, d1, d2);
 }
 
 static inline int xsm_grant_query_size (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_query_size(d1, d2);
+    return alternative_call(xsm_ops.grant_query_size, d1, d2);
 }
 
 static inline int xsm_alloc_security_domain (struct domain *d)
 {
-    return xsm_ops->alloc_security_domain(d);
+    return alternative_call(xsm_ops.alloc_security_domain, d);
 }
 
 static inline void xsm_free_security_domain (struct domain *d)
 {
-    xsm_ops->free_security_domain(d);
+    alternative_vcall(xsm_ops.free_security_domain, d);
 }
 
 static inline int xsm_alloc_security_evtchns(
     struct evtchn chn[], unsigned int nr)
 {
-    return xsm_ops->alloc_security_evtchns(chn, nr);
+    return alternative_call(xsm_ops.alloc_security_evtchns, chn, nr);
 }
 
 static inline void xsm_free_security_evtchns(
     struct evtchn chn[], unsigned int nr)
 {
-    xsm_ops->free_security_evtchns(chn, nr);
+    alternative_vcall(xsm_ops.free_security_evtchns, chn, nr);
 }
 
 static inline char *xsm_show_security_evtchn (struct domain *d, const struct evtchn *chn)
 {
-    return xsm_ops->show_security_evtchn(d, chn);
+    return alternative_call(xsm_ops.show_security_evtchn, d, chn);
 }
 
 static inline int xsm_init_hardware_domain (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->init_hardware_domain(d);
+    return alternative_call(xsm_ops.init_hardware_domain, d);
 }
 
 static inline int xsm_get_pod_target (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->get_pod_target(d);
+    return alternative_call(xsm_ops.get_pod_target, d);
 }
 
 static inline int xsm_set_pod_target (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->set_pod_target(d);
+    return alternative_call(xsm_ops.set_pod_target, d);
 }
 
 static inline int xsm_memory_exchange (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->memory_exchange(d);
+    return alternative_call(xsm_ops.memory_exchange, d);
 }
 
 static inline int xsm_memory_adjust_reservation (xsm_default_t def, struct domain *d1, struct
                                                                     domain *d2)
 {
-    return xsm_ops->memory_adjust_reservation(d1, d2);
+    return alternative_call(xsm_ops.memory_adjust_reservation, d1, d2);
 }
 
 static inline int xsm_memory_stat_reservation (xsm_default_t def, struct domain *d1,
                                                             struct domain *d2)
 {
-    return xsm_ops->memory_stat_reservation(d1, d2);
+    return alternative_call(xsm_ops.memory_stat_reservation, d1, d2);
 }
 
 static inline int xsm_memory_pin_page(xsm_default_t def, struct domain *d1, struct domain *d2,
                                       struct page_info *page)
 {
-    return xsm_ops->memory_pin_page(d1, d2, page);
+    return alternative_call(xsm_ops.memory_pin_page, d1, d2, page);
 }
 
 static inline int xsm_add_to_physmap(xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->add_to_physmap(d1, d2);
+    return alternative_call(xsm_ops.add_to_physmap, d1, d2);
 }
 
 static inline int xsm_remove_from_physmap(xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->remove_from_physmap(d1, d2);
+    return alternative_call(xsm_ops.remove_from_physmap, d1, d2);
 }
 
 static inline int xsm_map_gmfn_foreign (xsm_default_t def, struct domain *d, struct domain *t)
 {
-    return xsm_ops->map_gmfn_foreign(d, t);
+    return alternative_call(xsm_ops.map_gmfn_foreign, d, t);
 }
 
 static inline int xsm_claim_pages(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->claim_pages(d);
+    return alternative_call(xsm_ops.claim_pages, d);
 }
 
 static inline int xsm_console_io (xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops->console_io(d, cmd);
+    return alternative_call(xsm_ops.console_io, d, cmd);
 }
 
 static inline int xsm_profile (xsm_default_t def, struct domain *d, int op)
 {
-    return xsm_ops->profile(d, op);
+    return alternative_call(xsm_ops.profile, d, op);
 }
 
 static inline int xsm_kexec (xsm_default_t def)
 {
-    return xsm_ops->kexec();
+    return alternative_call(xsm_ops.kexec);
 }
 
 static inline int xsm_schedop_shutdown (xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->schedop_shutdown(d1, d2);
+    return alternative_call(xsm_ops.schedop_shutdown, d1, d2);
 }
 
 static inline char *xsm_show_irq_sid (int irq)
 {
-    return xsm_ops->show_irq_sid(irq);
+    return alternative_call(xsm_ops.show_irq_sid, irq);
 }
 
 static inline int xsm_map_domain_pirq (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->map_domain_pirq(d);
+    return alternative_call(xsm_ops.map_domain_pirq, d);
 }
 
 static inline int xsm_map_domain_irq (xsm_default_t def, struct domain *d, int irq, void *data)
 {
-    return xsm_ops->map_domain_irq(d, irq, data);
+    return alternative_call(xsm_ops.map_domain_irq, d, irq, data);
 }
 
 static inline int xsm_unmap_domain_pirq (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->unmap_domain_pirq(d);
+    return alternative_call(xsm_ops.unmap_domain_pirq, d);
 }
 
 static inline int xsm_unmap_domain_irq (xsm_default_t def, struct domain *d, int irq, void *data)
 {
-    return xsm_ops->unmap_domain_irq(d, irq, data);
+    return alternative_call(xsm_ops.unmap_domain_irq, d, irq, data);
 }
 
 static inline int xsm_bind_pt_irq(xsm_default_t def, struct domain *d,
                                   struct xen_domctl_bind_pt_irq *bind)
 {
-    return xsm_ops->bind_pt_irq(d, bind);
+    return alternative_call(xsm_ops.bind_pt_irq, d, bind);
 }
 
 static inline int xsm_unbind_pt_irq(xsm_default_t def, struct domain *d,
                                     struct xen_domctl_bind_pt_irq *bind)
 {
-    return xsm_ops->unbind_pt_irq(d, bind);
+    return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
 }
 
 static inline int xsm_irq_permission (xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
 {
-    return xsm_ops->irq_permission(d, pirq, allow);
+    return alternative_call(xsm_ops.irq_permission, d, pirq, allow);
 }
 
 static inline int xsm_iomem_permission (xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
-    return xsm_ops->iomem_permission(d, s, e, allow);
+    return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
 }
 
 static inline int xsm_iomem_mapping (xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
-    return xsm_ops->iomem_mapping(d, s, e, allow);
+    return alternative_call(xsm_ops.iomem_mapping, d, s, e, allow);
 }
 
 static inline int xsm_pci_config_permission (xsm_default_t def, struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access)
 {
-    return xsm_ops->pci_config_permission(d, machine_bdf, start, end, access);
+    return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
 static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops->get_device_group(machine_bdf);
+    return alternative_call(xsm_ops.get_device_group, machine_bdf);
 }
 
 static inline int xsm_assign_device(xsm_default_t def, struct domain *d, uint32_t machine_bdf)
 {
-    return xsm_ops->assign_device(d, machine_bdf);
+    return alternative_call(xsm_ops.assign_device, d, machine_bdf);
 }
 
 static inline int xsm_deassign_device(xsm_default_t def, struct domain *d, uint32_t machine_bdf)
 {
-    return xsm_ops->deassign_device(d, machine_bdf);
+    return alternative_call(xsm_ops.deassign_device, d, machine_bdf);
 }
 #endif /* HAS_PASSTHROUGH && HAS_PCI) */
 
@@ -487,240 +490,243 @@ static inline int xsm_deassign_device(xsm_default_t def, struct domain *d, uint3
 static inline int xsm_assign_dtdevice(xsm_default_t def, struct domain *d,
                                       const char *dtpath)
 {
-    return xsm_ops->assign_dtdevice(d, dtpath);
+    return alternative_call(xsm_ops.assign_dtdevice, d, dtpath);
 }
 
 static inline int xsm_deassign_dtdevice(xsm_default_t def, struct domain *d,
                                         const char *dtpath)
 {
-    return xsm_ops->deassign_dtdevice(d, dtpath);
+    return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
 }
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
 static inline int xsm_resource_plug_pci (xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops->resource_plug_pci(machine_bdf);
+    return alternative_call(xsm_ops.resource_plug_pci, machine_bdf);
 }
 
 static inline int xsm_resource_unplug_pci (xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops->resource_unplug_pci(machine_bdf);
+    return alternative_call(xsm_ops.resource_unplug_pci, machine_bdf);
 }
 
 static inline int xsm_resource_plug_core (xsm_default_t def)
 {
-    return xsm_ops->resource_plug_core();
+    return alternative_call(xsm_ops.resource_plug_core);
 }
 
 static inline int xsm_resource_unplug_core (xsm_default_t def)
 {
-    return xsm_ops->resource_unplug_core();
+    return alternative_call(xsm_ops.resource_unplug_core);
 }
 
 static inline int xsm_resource_setup_pci (xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops->resource_setup_pci(machine_bdf);
+    return alternative_call(xsm_ops.resource_setup_pci, machine_bdf);
 }
 
 static inline int xsm_resource_setup_gsi (xsm_default_t def, int gsi)
 {
-    return xsm_ops->resource_setup_gsi(gsi);
+    return alternative_call(xsm_ops.resource_setup_gsi, gsi);
 }
 
 static inline int xsm_resource_setup_misc (xsm_default_t def)
 {
-    return xsm_ops->resource_setup_misc();
+    return alternative_call(xsm_ops.resource_setup_misc);
 }
 
 static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
 {
-    return xsm_ops->page_offline(cmd);
+    return alternative_call(xsm_ops.page_offline, cmd);
 }
 
 static inline int xsm_hypfs_op(xsm_default_t def)
 {
-    return xsm_ops->hypfs_op();
+    return alternative_call(xsm_ops.hypfs_op);
 }
 
 static inline long xsm_do_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
-    return xsm_ops->do_xsm_op(op);
+    /* "op"(struct) is being passed by value, alternative_call does not support */
+    return xsm_ops.do_xsm_op(op);
 }
 
 #ifdef CONFIG_COMPAT
 static inline int xsm_do_compat_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
-    return xsm_ops->do_compat_op(op);
+    /* "op"(struct) is being passed by value, alternative_call does not support */
+    return xsm_ops.do_compat_op(op);
 }
 #endif
 
 static inline int xsm_hvm_param (xsm_default_t def, struct domain *d, unsigned long op)
 {
-    return xsm_ops->hvm_param(d, op);
+    return alternative_call(xsm_ops.hvm_param, d, op);
 }
 
 static inline int xsm_hvm_control(xsm_default_t def, struct domain *d, unsigned long op)
 {
-    return xsm_ops->hvm_control(d, op);
+    return alternative_call(xsm_ops.hvm_control, d, op);
 }
 
 static inline int xsm_hvm_param_altp2mhvm (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->hvm_param_altp2mhvm(d);
+    return alternative_call(xsm_ops.hvm_param_altp2mhvm, d);
 }
 
 static inline int xsm_hvm_altp2mhvm_op (xsm_default_t def, struct domain *d, uint64_t mode, uint32_t op)
 {
-    return xsm_ops->hvm_altp2mhvm_op(d, mode, op);
+    return alternative_call(xsm_ops.hvm_altp2mhvm_op, d, mode, op);
 }
 
 static inline int xsm_get_vnumainfo (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->get_vnumainfo(d);
+    return alternative_call(xsm_ops.get_vnumainfo, d);
 }
 
 static inline int xsm_vm_event_control (xsm_default_t def, struct domain *d, int mode, int op)
 {
-    return xsm_ops->vm_event_control(d, mode, op);
+    return alternative_call(xsm_ops.vm_event_control, d, mode, op);
 }
 
 #ifdef CONFIG_MEM_ACCESS
 static inline int xsm_mem_access (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->mem_access(d);
+    return alternative_call(xsm_ops.mem_access, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_PAGING
 static inline int xsm_mem_paging (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->mem_paging(d);
+    return alternative_call(xsm_ops.mem_paging, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_SHARING
 static inline int xsm_mem_sharing (xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->mem_sharing(d);
+    return alternative_call(xsm_ops.mem_sharing, d);
 }
 #endif
 
 static inline int xsm_platform_op (xsm_default_t def, uint32_t op)
 {
-    return xsm_ops->platform_op(op);
+    return alternative_call(xsm_ops.platform_op, op);
 }
 
 #ifdef CONFIG_X86
 static inline int xsm_do_mca(xsm_default_t def)
 {
-    return xsm_ops->do_mca();
+    return alternative_call(xsm_ops.do_mca);
 }
 
 static inline int xsm_shadow_control (xsm_default_t def, struct domain *d, uint32_t op)
 {
-    return xsm_ops->shadow_control(d, op);
+    return alternative_call(xsm_ops.shadow_control, d, op);
 }
 
 static inline int xsm_mem_sharing_op (xsm_default_t def, struct domain *d, struct domain *cd, int op)
 {
-    return xsm_ops->mem_sharing_op(d, cd, op);
+    return alternative_call(xsm_ops.mem_sharing_op, d, cd, op);
 }
 
 static inline int xsm_apic (xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops->apic(d, cmd);
+    return alternative_call(xsm_ops.apic, d, cmd);
 }
 
 static inline int xsm_memtype (xsm_default_t def, uint32_t access)
 {
-    return xsm_ops->memtype(access);
+    return alternative_call(xsm_ops.memtype, access);
 }
 
 static inline int xsm_machine_memory_map(xsm_default_t def)
 {
-    return xsm_ops->machine_memory_map();
+    return alternative_call(xsm_ops.machine_memory_map);
 }
 
 static inline int xsm_domain_memory_map(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->domain_memory_map(d);
+    return alternative_call(xsm_ops.domain_memory_map, d);
 }
 
 static inline int xsm_mmu_update (xsm_default_t def, struct domain *d, struct domain *t,
                                   struct domain *f, uint32_t flags)
 {
-    return xsm_ops->mmu_update(d, t, f, flags);
+    return alternative_call(xsm_ops.mmu_update, d, t, f, flags);
 }
 
 static inline int xsm_mmuext_op (xsm_default_t def, struct domain *d, struct domain *f)
 {
-    return xsm_ops->mmuext_op(d, f);
+    return alternative_call(xsm_ops.mmuext_op, d, f);
 }
 
 static inline int xsm_update_va_mapping(xsm_default_t def, struct domain *d, struct domain *f,
                                                             l1_pgentry_t pte)
 {
-    return xsm_ops->update_va_mapping(d, f, pte);
+    /* pte(struct) is being passed by value, alternative_call does not support */
+    return xsm_ops.update_va_mapping(d, f, pte);
 }
 
 static inline int xsm_priv_mapping(xsm_default_t def, struct domain *d, struct domain *t)
 {
-    return xsm_ops->priv_mapping(d, t);
+    return alternative_call(xsm_ops.priv_mapping, d, t);
 }
 
 static inline int xsm_ioport_permission (xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
-    return xsm_ops->ioport_permission(d, s, e, allow);
+    return alternative_call(xsm_ops.ioport_permission, d, s, e, allow);
 }
 
 static inline int xsm_ioport_mapping (xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
-    return xsm_ops->ioport_mapping(d, s, e, allow);
+    return alternative_call(xsm_ops.ioport_mapping, d, s, e, allow);
 }
 
 static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int op)
 {
-    return xsm_ops->pmu_op(d, op);
+    return alternative_call(xsm_ops.pmu_op, d, op);
 }
 
 #endif /* CONFIG_X86 */
 
 static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->dm_op(d);
+    return alternative_call(xsm_ops.dm_op, d);
 }
 
 static inline int xsm_xen_version (xsm_default_t def, uint32_t op)
 {
-    return xsm_ops->xen_version(op);
+    return alternative_call(xsm_ops.xen_version, op);
 }
 
 static inline int xsm_domain_resource_map(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops->domain_resource_map(d);
+    return alternative_call(xsm_ops.domain_resource_map, d);
 }
 
 #ifdef CONFIG_ARGO
 static inline int xsm_argo_enable(const struct domain *d)
 {
-    return xsm_ops->argo_enable(d);
+    return alternative_call(xsm_ops.argo_enable, d);
 }
 
 static inline int xsm_argo_register_single_source(const struct domain *d,
                                                   const struct domain *t)
 {
-    return xsm_ops->argo_register_single_source(d, t);
+    return alternative_call(xsm_ops.argo_register_single_source, d, t);
 }
 
 static inline int xsm_argo_register_any_source(const struct domain *d)
 {
-    return xsm_ops->argo_register_any_source(d);
+    return alternative_call(xsm_ops.argo_register_any_source, d);
 }
 
 static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 {
-    return xsm_ops->argo_send(d, t);
+    return alternative_call(xsm_ops.argo_send, d, t);
 }
 
 #endif /* CONFIG_ARGO */
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
index 01e52138a1..df9fcc1d6d 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -225,26 +225,7 @@ static int flask_security_sid(struct xen_flask_sid_context *arg)
 
 static int flask_disable(void)
 {
-    static int flask_disabled = 0;
-
-    if ( ss_initialized )
-    {
-        /* Not permitted after initial policy load. */
-        return -EINVAL;
-    }
-
-    if ( flask_disabled )
-    {
-        /* Only do this once. */
-        return -EINVAL;
-    }
-
-    printk("Flask:  Disabled at runtime.\n");
-
-    flask_disabled = 1;
-
-    /* Reset xsm_ops to the original module. */
-    xsm_ops = &dummy_xsm_ops;
+    printk("Flask:  Disabling is not supported.\n");
 
     return 0;
 }
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 5eab21e1b1..acc1af7166 100644
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
@@ -68,15 +76,6 @@ static int __init parse_xsm_param(const char *s)
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
 #ifdef CONFIG_XSM_FLASK_POLICY
@@ -87,17 +86,22 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
     }
 #endif
 
-    if ( verify(&dummy_xsm_ops) )
+    if ( xsm_ops_registered != XSM_OPS_UNREGISTERED )
     {
-        printk(XENLOG_ERR "Could not verify dummy_xsm_ops structure\n");
+        printk(XENLOG_ERR
+            "Could not init XSM, xsm_ops register already attempted\n");
         return -EIO;
     }
 
-    xsm_ops = &dummy_xsm_ops;
+    /* install the dummy ops as default to ensure ops
+     * are defined if requested policy fails init
+     */
+    xsm_fixup_ops(&xsm_ops);
 
     switch ( xsm_bootparam )
     {
     case XSM_BOOTPARAM_DUMMY:
+        xsm_ops_registered = XSM_OPS_REGISTERED;
         break;
 
     case XSM_BOOTPARAM_FLASK:
@@ -113,6 +117,9 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
         break;
     }
 
+    if ( xsm_ops_registered != XSM_OPS_REGISTERED )
+        xsm_ops_registered = XSM_OPS_REG_FAILED;
+
     return 0;
 }
 
@@ -197,16 +204,21 @@ bool __init has_xsm_magic(paddr_t start)
 
 int __init register_xsm(struct xsm_operations *ops)
 {
-    if ( verify(ops) )
+    if ( xsm_ops_registered != XSM_OPS_UNREGISTERED )
+        return -EAGAIN;
+
+    if ( !ops )
     {
-        printk(XENLOG_ERR "Could not verify xsm_operations structure\n");
+        xsm_ops_registered = XSM_OPS_REG_FAILED;
+        printk(XENLOG_ERR "Invalid xsm_operations structure registered\n");
         return -EINVAL;
     }
 
-    if ( xsm_ops != &dummy_xsm_ops )
-        return -EAGAIN;
+    /* use dummy ops for any empty ops */
+    xsm_fixup_ops(ops);
 
-    xsm_ops = ops;
+    xsm_ops = *ops;
+    xsm_ops_registered = XSM_OPS_REGISTERED;
 
     return 0;
 }
-- 
2.20.1


