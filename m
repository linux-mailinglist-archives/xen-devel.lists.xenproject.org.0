Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BF0405F4A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 00:13:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183610.331914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOSIl-0007Ci-Rm; Thu, 09 Sep 2021 22:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183610.331914; Thu, 09 Sep 2021 22:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOSIl-0007AV-ON; Thu, 09 Sep 2021 22:13:47 +0000
Received: by outflank-mailman (input) for mailman id 183610;
 Thu, 09 Sep 2021 22:13:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNcr=N7=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOSIl-00067V-3F
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 22:13:47 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2fe0a832-11bb-11ec-b1fd-12813bfff9fa;
 Thu, 09 Sep 2021 22:13:40 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 163122555715363.275802575096236;
 Thu, 9 Sep 2021 15:12:37 -0700 (PDT)
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
X-Inumbo-ID: 2fe0a832-11bb-11ec-b1fd-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631225560; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c1c4KJu5PKQBH7VbnL8EdGjOUDqLmNzkabWco/GVYzFNO0Z8oGmw+Xj01hFn1XA5gKgMD4SMnclkkUqEoRMdcrPXZ6xV6E16PqV7zkziXvR8gXBB3aiq1PfNoh67RBP3vCJDWMNC7ibNJyYeb3vPos5cWxD5rrZ9mAO31XPEzak=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631225560; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=CDXoQhlHqYlB6RcyCL6RNbfFCV/qaWUvnEQwBo6K6fw=; 
	b=cgdIGz7nc+Bq2GqIn3QHDRvQKqJmoUfz2Vf3qkN7853v7VNkB4QHvInd2EVe5WX61rdG84yeWzdmFsUaQMhGroUkAbaLHclasfakcJUFxO0kCvJV6aI/Klouxd3j1p25KcDNYQQpH5JPZzfwWRwdT+ICyPIdPbfScCHt/1pVkbs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631225560;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CDXoQhlHqYlB6RcyCL6RNbfFCV/qaWUvnEQwBo6K6fw=;
	b=NgqPxYWrpJDTXSDSuV3D67uF+JdRpTvZNnCHZUSsoPAQJPVrYBjwWf7BQaMqGlTT
	YRXWrQiJ7y00pli4BwuC5+h1nZy5zyWlg1AQmxqhbpfoS5ZWOsN8LgpMtZ4F2YdM8c+
	Rxp0AtwAJYljU4InJAva3ylTfq8Dg4P04R3VFWbk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v5 07/10] xsm: convert xsm_ops hook calls to alternative call
Date: Thu,  9 Sep 2021 22:12:32 -0400
Message-Id: <20210910021236.15082-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210910021236.15082-1-dpsmith@apertussolutions.com>
References: <20210910021236.15082-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

To reduce retpolines convert all the pointer function calls of the
xsm_ops hooks over to the alternative_call infrastructure.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/include/xsm/xsm.h | 191 +++++++++++++++++++++---------------------
 1 file changed, 96 insertions(+), 95 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 1d3a1be69d..80dc7f5373 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -15,6 +15,7 @@
 #ifndef __XSM_H__
 #define __XSM_H__
 
+#include <xen/alternative-call.h>
 #include <xen/sched.h>
 #include <xen/multiboot.h>
 
@@ -202,315 +203,315 @@ extern struct xsm_ops xsm_ops;
 static inline void xsm_security_domaininfo(
     struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
-    xsm_ops.security_domaininfo(d, info);
+    alternative_vcall(xsm_ops.security_domaininfo, d, info);
 }
 
 static inline int xsm_domain_create(
     xsm_default_t def, struct domain *d, uint32_t ssidref)
 {
-    return xsm_ops.domain_create(d, ssidref);
+    return alternative_call(xsm_ops.domain_create, d, ssidref);
 }
 
 static inline int xsm_getdomaininfo(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.getdomaininfo(d);
+    return alternative_call(xsm_ops.getdomaininfo, d);
 }
 
 static inline int xsm_domctl_scheduler_op(
     xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops.domctl_scheduler_op(d, cmd);
+    return alternative_call(xsm_ops.domctl_scheduler_op, d, cmd);
 }
 
 static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
 {
-    return xsm_ops.sysctl_scheduler_op(cmd);
+    return alternative_call(xsm_ops.sysctl_scheduler_op, cmd);
 }
 
 static inline int xsm_set_target(
     xsm_default_t def, struct domain *d, struct domain *e)
 {
-    return xsm_ops.set_target(d, e);
+    return alternative_call(xsm_ops.set_target, d, e);
 }
 
 static inline int xsm_domctl(xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops.domctl(d, cmd);
+    return alternative_call(xsm_ops.domctl, d, cmd);
 }
 
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
-    return xsm_ops.sysctl(cmd);
+    return alternative_call(xsm_ops.sysctl, cmd);
 }
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
 {
-    return xsm_ops.readconsole(clear);
+    return alternative_call(xsm_ops.readconsole, clear);
 }
 
 static inline int xsm_evtchn_unbound(
     xsm_default_t def, struct domain *d1, struct evtchn *chn, domid_t id2)
 {
-    return xsm_ops.evtchn_unbound(d1, chn, id2);
+    return alternative_call(xsm_ops.evtchn_unbound, d1, chn, id2);
 }
 
 static inline int xsm_evtchn_interdomain(
     xsm_default_t def, struct domain *d1, struct evtchn *chan1,
     struct domain *d2, struct evtchn *chan2)
 {
-    return xsm_ops.evtchn_interdomain(d1, chan1, d2, chan2);
+    return alternative_call(xsm_ops.evtchn_interdomain, d1, chan1, d2, chan2);
 }
 
 static inline void xsm_evtchn_close_post(struct evtchn *chn)
 {
-    xsm_ops.evtchn_close_post(chn);
+    alternative_vcall(xsm_ops.evtchn_close_post, chn);
 }
 
 static inline int xsm_evtchn_send(
     xsm_default_t def, struct domain *d, struct evtchn *chn)
 {
-    return xsm_ops.evtchn_send(d, chn);
+    return alternative_call(xsm_ops.evtchn_send, d, chn);
 }
 
 static inline int xsm_evtchn_status(
     xsm_default_t def, struct domain *d, struct evtchn *chn)
 {
-    return xsm_ops.evtchn_status(d, chn);
+    return alternative_call(xsm_ops.evtchn_status, d, chn);
 }
 
 static inline int xsm_evtchn_reset(
     xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops.evtchn_reset(d1, d2);
+    return alternative_call(xsm_ops.evtchn_reset, d1, d2);
 }
 
 static inline int xsm_grant_mapref(
     xsm_default_t def, struct domain *d1, struct domain *d2, uint32_t flags)
 {
-    return xsm_ops.grant_mapref(d1, d2, flags);
+    return alternative_call(xsm_ops.grant_mapref, d1, d2, flags);
 }
 
 static inline int xsm_grant_unmapref(
     xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops.grant_unmapref(d1, d2);
+    return alternative_call(xsm_ops.grant_unmapref, d1, d2);
 }
 
 static inline int xsm_grant_setup(
     xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops.grant_setup(d1, d2);
+    return alternative_call(xsm_ops.grant_setup, d1, d2);
 }
 
 static inline int xsm_grant_transfer(
 	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops.grant_transfer(d1, d2);
+    return alternative_call(xsm_ops.grant_transfer, d1, d2);
 }
 
 static inline int xsm_grant_copy(
 	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops.grant_copy(d1, d2);
+    return alternative_call(xsm_ops.grant_copy, d1, d2);
 }
 
 static inline int xsm_grant_query_size(
 	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops.grant_query_size(d1, d2);
+    return alternative_call(xsm_ops.grant_query_size, d1, d2);
 }
 
 static inline int xsm_alloc_security_domain(struct domain *d)
 {
-    return xsm_ops.alloc_security_domain(d);
+    return alternative_call(xsm_ops.alloc_security_domain, d);
 }
 
 static inline void xsm_free_security_domain(struct domain *d)
 {
-    xsm_ops.free_security_domain(d);
+    alternative_vcall(xsm_ops.free_security_domain, d);
 }
 
 static inline int xsm_alloc_security_evtchns(
 	struct evtchn chn[], unsigned int nr)
 {
-    return xsm_ops.alloc_security_evtchns(chn, nr);
+    return alternative_call(xsm_ops.alloc_security_evtchns, chn, nr);
 }
 
 static inline void xsm_free_security_evtchns(
 	struct evtchn chn[], unsigned int nr)
 {
-    xsm_ops.free_security_evtchns(chn, nr);
+    alternative_vcall(xsm_ops.free_security_evtchns, chn, nr);
 }
 
 static inline char *xsm_show_security_evtchn(
 	struct domain *d, const struct evtchn *chn)
 {
-    return xsm_ops.show_security_evtchn(d, chn);
+    return alternative_call(xsm_ops.show_security_evtchn, d, chn);
 }
 
 static inline int xsm_init_hardware_domain(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.init_hardware_domain(d);
+    return alternative_call(xsm_ops.init_hardware_domain, d);
 }
 
 static inline int xsm_get_pod_target(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.get_pod_target(d);
+    return alternative_call(xsm_ops.get_pod_target, d);
 }
 
 static inline int xsm_set_pod_target(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.set_pod_target(d);
+    return alternative_call(xsm_ops.set_pod_target, d);
 }
 
 static inline int xsm_memory_exchange(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.memory_exchange(d);
+    return alternative_call(xsm_ops.memory_exchange, d);
 }
 
 static inline int xsm_memory_adjust_reservation(
 	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops.memory_adjust_reservation(d1, d2);
+    return alternative_call(xsm_ops.memory_adjust_reservation, d1, d2);
 }
 
 static inline int xsm_memory_stat_reservation(
 	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops.memory_stat_reservation(d1, d2);
+    return alternative_call(xsm_ops.memory_stat_reservation, d1, d2);
 }
 
 static inline int xsm_memory_pin_page(
 	xsm_default_t def, struct domain *d1, struct domain *d2,
     struct page_info *page)
 {
-    return xsm_ops.memory_pin_page(d1, d2, page);
+    return alternative_call(xsm_ops.memory_pin_page, d1, d2, page);
 }
 
 static inline int xsm_add_to_physmap(
 	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops.add_to_physmap(d1, d2);
+    return alternative_call(xsm_ops.add_to_physmap, d1, d2);
 }
 
 static inline int xsm_remove_from_physmap(
 	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops.remove_from_physmap(d1, d2);
+    return alternative_call(xsm_ops.remove_from_physmap, d1, d2);
 }
 
 static inline int xsm_map_gmfn_foreign(
 	xsm_default_t def, struct domain *d, struct domain *t)
 {
-    return xsm_ops.map_gmfn_foreign(d, t);
+    return alternative_call(xsm_ops.map_gmfn_foreign, d, t);
 }
 
 static inline int xsm_claim_pages(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.claim_pages(d);
+    return alternative_call(xsm_ops.claim_pages, d);
 }
 
 static inline int xsm_console_io(xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops.console_io(d, cmd);
+    return alternative_call(xsm_ops.console_io, d, cmd);
 }
 
 static inline int xsm_profile(xsm_default_t def, struct domain *d, int op)
 {
-    return xsm_ops.profile(d, op);
+    return alternative_call(xsm_ops.profile, d, op);
 }
 
 static inline int xsm_kexec(xsm_default_t def)
 {
-    return xsm_ops.kexec();
+    return alternative_call(xsm_ops.kexec);
 }
 
 static inline int xsm_schedop_shutdown(
 	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops.schedop_shutdown(d1, d2);
+    return alternative_call(xsm_ops.schedop_shutdown, d1, d2);
 }
 
 static inline char *xsm_show_irq_sid(int irq)
 {
-    return xsm_ops.show_irq_sid(irq);
+    return alternative_call(xsm_ops.show_irq_sid, irq);
 }
 
 static inline int xsm_map_domain_pirq(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.map_domain_pirq(d);
+    return alternative_call(xsm_ops.map_domain_pirq, d);
 }
 
 static inline int xsm_map_domain_irq(
 	xsm_default_t def, struct domain *d, int irq, void *data)
 {
-    return xsm_ops.map_domain_irq(d, irq, data);
+    return alternative_call(xsm_ops.map_domain_irq, d, irq, data);
 }
 
 static inline int xsm_unmap_domain_pirq(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.unmap_domain_pirq(d);
+    return alternative_call(xsm_ops.unmap_domain_pirq, d);
 }
 
 static inline int xsm_unmap_domain_irq(
 	xsm_default_t def, struct domain *d, int irq, void *data)
 {
-    return xsm_ops.unmap_domain_irq(d, irq, data);
+    return alternative_call(xsm_ops.unmap_domain_irq, d, irq, data);
 }
 
 static inline int xsm_bind_pt_irq(
 	xsm_default_t def, struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
-    return xsm_ops.bind_pt_irq(d, bind);
+    return alternative_call(xsm_ops.bind_pt_irq, d, bind);
 }
 
 static inline int xsm_unbind_pt_irq(
 	xsm_default_t def, struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
-    return xsm_ops.unbind_pt_irq(d, bind);
+    return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
 }
 
 static inline int xsm_irq_permission(
 	xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
 {
-    return xsm_ops.irq_permission(d, pirq, allow);
+    return alternative_call(xsm_ops.irq_permission, d, pirq, allow);
 }
 
 static inline int xsm_iomem_permission(
 	xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
-    return xsm_ops.iomem_permission(d, s, e, allow);
+    return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
 }
 
 static inline int xsm_iomem_mapping(
 	xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
-    return xsm_ops.iomem_mapping(d, s, e, allow);
+    return alternative_call(xsm_ops.iomem_mapping, d, s, e, allow);
 }
 
 static inline int xsm_pci_config_permission(
 	xsm_default_t def, struct domain *d, uint32_t machine_bdf, uint16_t start,
     uint16_t end, uint8_t access)
 {
-    return xsm_ops.pci_config_permission(d, machine_bdf, start, end, access);
+    return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
 static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops.get_device_group(machine_bdf);
+    return alternative_call(xsm_ops.get_device_group, machine_bdf);
 }
 
 static inline int xsm_assign_device(
 	xsm_default_t def, struct domain *d, uint32_t machine_bdf)
 {
-    return xsm_ops.assign_device(d, machine_bdf);
+    return alternative_call(xsm_ops.assign_device, d, machine_bdf);
 }
 
 static inline int xsm_deassign_device(
 	xsm_default_t def, struct domain *d, uint32_t machine_bdf)
 {
-    return xsm_ops.deassign_device(d, machine_bdf);
+    return alternative_call(xsm_ops.deassign_device, d, machine_bdf);
 }
 #endif /* HAS_PASSTHROUGH && HAS_PCI) */
 
@@ -518,62 +519,62 @@ static inline int xsm_deassign_device(
 static inline int xsm_assign_dtdevice(
 	xsm_default_t def, struct domain *d, const char *dtpath)
 {
-    return xsm_ops.assign_dtdevice(d, dtpath);
+    return alternative_call(xsm_ops.assign_dtdevice, d, dtpath);
 }
 
 static inline int xsm_deassign_dtdevice(
 	xsm_default_t def, struct domain *d, const char *dtpath)
 {
-    return xsm_ops.deassign_dtdevice(d, dtpath);
+    return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
 }
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
 static inline int xsm_resource_plug_pci(xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops.resource_plug_pci(machine_bdf);
+    return alternative_call(xsm_ops.resource_plug_pci, machine_bdf);
 }
 
 static inline int xsm_resource_unplug_pci(
 	xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops.resource_unplug_pci(machine_bdf);
+    return alternative_call(xsm_ops.resource_unplug_pci, machine_bdf);
 }
 
 static inline int xsm_resource_plug_core(xsm_default_t def)
 {
-    return xsm_ops.resource_plug_core();
+    return alternative_call(xsm_ops.resource_plug_core);
 }
 
 static inline int xsm_resource_unplug_core(xsm_default_t def)
 {
-    return xsm_ops.resource_unplug_core();
+    return alternative_call(xsm_ops.resource_unplug_core);
 }
 
 static inline int xsm_resource_setup_pci(
 	xsm_default_t def, uint32_t machine_bdf)
 {
-    return xsm_ops.resource_setup_pci(machine_bdf);
+    return alternative_call(xsm_ops.resource_setup_pci, machine_bdf);
 }
 
 static inline int xsm_resource_setup_gsi(xsm_default_t def, int gsi)
 {
-    return xsm_ops.resource_setup_gsi(gsi);
+    return alternative_call(xsm_ops.resource_setup_gsi, gsi);
 }
 
 static inline int xsm_resource_setup_misc(xsm_default_t def)
 {
-    return xsm_ops.resource_setup_misc();
+    return alternative_call(xsm_ops.resource_setup_misc);
 }
 
 static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
 {
-    return xsm_ops.page_offline(cmd);
+    return alternative_call(xsm_ops.page_offline, cmd);
 }
 
 static inline int xsm_hypfs_op(xsm_default_t def)
 {
-    return xsm_ops.hypfs_op();
+    return alternative_call(xsm_ops.hypfs_op);
 }
 
 static inline long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
@@ -591,107 +592,107 @@ static inline int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
 static inline int xsm_hvm_param(
 	xsm_default_t def, struct domain *d, unsigned long op)
 {
-    return xsm_ops.hvm_param(d, op);
+    return alternative_call(xsm_ops.hvm_param, d, op);
 }
 
 static inline int xsm_hvm_control(
 	xsm_default_t def, struct domain *d, unsigned long op)
 {
-    return xsm_ops.hvm_control(d, op);
+    return alternative_call(xsm_ops.hvm_control, d, op);
 }
 
 static inline int xsm_hvm_param_altp2mhvm(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.hvm_param_altp2mhvm(d);
+    return alternative_call(xsm_ops.hvm_param_altp2mhvm, d);
 }
 
 static inline int xsm_hvm_altp2mhvm_op(
 	xsm_default_t def, struct domain *d, uint64_t mode, uint32_t op)
 {
-    return xsm_ops.hvm_altp2mhvm_op(d, mode, op);
+    return alternative_call(xsm_ops.hvm_altp2mhvm_op, d, mode, op);
 }
 
 static inline int xsm_get_vnumainfo(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.get_vnumainfo(d);
+    return alternative_call(xsm_ops.get_vnumainfo, d);
 }
 
 static inline int xsm_vm_event_control(
 	xsm_default_t def, struct domain *d, int mode, int op)
 {
-    return xsm_ops.vm_event_control(d, mode, op);
+    return alternative_call(xsm_ops.vm_event_control, d, mode, op);
 }
 
 #ifdef CONFIG_MEM_ACCESS
 static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.mem_access(d);
+    return alternative_call(xsm_ops.mem_access, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_PAGING
 static inline int xsm_mem_paging(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.mem_paging(d);
+    return alternative_call(xsm_ops.mem_paging, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_SHARING
 static inline int xsm_mem_sharing(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.mem_sharing(d);
+    return alternative_call(xsm_ops.mem_sharing, d);
 }
 #endif
 
 static inline int xsm_platform_op(xsm_default_t def, uint32_t op)
 {
-    return xsm_ops.platform_op(op);
+    return alternative_call(xsm_ops.platform_op, op);
 }
 
 #ifdef CONFIG_X86
 static inline int xsm_do_mca(xsm_default_t def)
 {
-    return xsm_ops.do_mca();
+    return alternative_call(xsm_ops.do_mca);
 }
 
 static inline int xsm_shadow_control(
 	xsm_default_t def, struct domain *d, uint32_t op)
 {
-    return xsm_ops.shadow_control(d, op);
+    return alternative_call(xsm_ops.shadow_control, d, op);
 }
 
 static inline int xsm_mem_sharing_op(
 	xsm_default_t def, struct domain *d, struct domain *cd, int op)
 {
-    return xsm_ops.mem_sharing_op(d, cd, op);
+    return alternative_call(xsm_ops.mem_sharing_op, d, cd, op);
 }
 
 static inline int xsm_apic(xsm_default_t def, struct domain *d, int cmd)
 {
-    return xsm_ops.apic(d, cmd);
+    return alternative_call(xsm_ops.apic, d, cmd);
 }
 
 static inline int xsm_machine_memory_map(xsm_default_t def)
 {
-    return xsm_ops.machine_memory_map();
+    return alternative_call(xsm_ops.machine_memory_map);
 }
 
 static inline int xsm_domain_memory_map(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.domain_memory_map(d);
+    return alternative_call(xsm_ops.domain_memory_map, d);
 }
 
 static inline int xsm_mmu_update(
 	xsm_default_t def, struct domain *d, struct domain *t, struct domain *f,
     uint32_t flags)
 {
-    return xsm_ops.mmu_update(d, t, f, flags);
+    return alternative_call(xsm_ops.mmu_update, d, t, f, flags);
 }
 
 static inline int xsm_mmuext_op(
 	xsm_default_t def, struct domain *d, struct domain *f)
 {
-    return xsm_ops.mmuext_op(d, f);
+    return alternative_call(xsm_ops.mmuext_op, d, f);
 }
 
 static inline int xsm_update_va_mapping(
@@ -703,64 +704,64 @@ static inline int xsm_update_va_mapping(
 static inline int xsm_priv_mapping(
 	xsm_default_t def, struct domain *d, struct domain *t)
 {
-    return xsm_ops.priv_mapping(d, t);
+    return alternative_call(xsm_ops.priv_mapping, d, t);
 }
 
 static inline int xsm_ioport_permission(
 	xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
-    return xsm_ops.ioport_permission(d, s, e, allow);
+    return alternative_call(xsm_ops.ioport_permission, d, s, e, allow);
 }
 
 static inline int xsm_ioport_mapping(
 	xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
-    return xsm_ops.ioport_mapping(d, s, e, allow);
+    return alternative_call(xsm_ops.ioport_mapping, d, s, e, allow);
 }
 
 static inline int xsm_pmu_op(
 	xsm_default_t def, struct domain *d, unsigned int op)
 {
-    return xsm_ops.pmu_op(d, op);
+    return alternative_call(xsm_ops.pmu_op, d, op);
 }
 
 #endif /* CONFIG_X86 */
 
 static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.dm_op(d);
+    return alternative_call(xsm_ops.dm_op, d);
 }
 
 static inline int xsm_xen_version(xsm_default_t def, uint32_t op)
 {
-    return xsm_ops.xen_version(op);
+    return alternative_call(xsm_ops.xen_version, op);
 }
 
 static inline int xsm_domain_resource_map(xsm_default_t def, struct domain *d)
 {
-    return xsm_ops.domain_resource_map(d);
+    return alternative_call(xsm_ops.domain_resource_map, d);
 }
 
 #ifdef CONFIG_ARGO
 static inline int xsm_argo_enable(const struct domain *d)
 {
-    return xsm_ops.argo_enable(d);
+    return alternative_call(xsm_ops.argo_enable, d);
 }
 
 static inline int xsm_argo_register_single_source(
 	const struct domain *d, const struct domain *t)
 {
-    return xsm_ops.argo_register_single_source(d, t);
+    return alternative_call(xsm_ops.argo_register_single_source, d, t);
 }
 
 static inline int xsm_argo_register_any_source(const struct domain *d)
 {
-    return xsm_ops.argo_register_any_source(d);
+    return alternative_call(xsm_ops.argo_register_any_source, d);
 }
 
 static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 {
-    return xsm_ops.argo_send(d, t);
+    return alternative_call(xsm_ops.argo_send, d, t);
 }
 
 #endif /* CONFIG_ARGO */
-- 
2.20.1


