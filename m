Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB2A50C077
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 21:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311203.528300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhzCF-0000tZ-1e; Fri, 22 Apr 2022 19:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311203.528300; Fri, 22 Apr 2022 19:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhzCE-0000qy-UY; Fri, 22 Apr 2022 19:44:02 +0000
Received: by outflank-mailman (input) for mailman id 311203;
 Fri, 22 Apr 2022 19:44:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JQBp=VA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhzCD-0000qs-3W
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 19:44:01 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c375f41-c274-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 21:43:58 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650656632818594.2966413037028;
 Fri, 22 Apr 2022 12:43:52 -0700 (PDT)
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
X-Inumbo-ID: 8c375f41-c274-11ec-8fc2-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1650656634; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JRl+DMZtthZJ96hEuSHBTBYsIm2kTrfjWn95dAVKIGStX95lDe+c363VKK0nLfQAcfxpMYDuH5zUYEusikt1BFmt+T/A6ok067ZAjet+49TGAdp5M9vklf+SmWSeNbiYFimuThFbTrtmKzA8S5B7SvVrMwgrwvrU+3q3/vde+aw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650656634; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=gZoPE3ey9o58yT/dUqy4QzWLLVgIJXl38ETuW0qXh5U=; 
	b=klLYoxZzdf1lTQAkq0ND+T4fkva5hjfmfwfKJJMWsC+DET0Aa+hHdqkaGKHuYc94sg7Ir8BtVOaCqYBZmcxaZl5IApNL61bg8AAyconHSyV4Sh+503QEu6C6poJ4G36ulmxLbZ1O1aYq/fBwBJ5jUmTgS5wAVyUuWHG0kW+lZyE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650656634;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=gZoPE3ey9o58yT/dUqy4QzWLLVgIJXl38ETuW0qXh5U=;
	b=JmIqFSMKeCF0Obd2gt0O6Uw7de0Xc9xCtQdqeVuFJZ/8GOX5381Y6OytiO0xRdZE
	7HI58fat5WyZWerYtg85/aYtJsOD29l3705VOLZcIpxuJGYbuQzuQDPwePM4b7AgJaY
	qFpibTxxl7BEQf1lhY1dAJLV1sQjHQsiFk3J8QtM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jandryuk@gmail.com,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH] xsm/flask: code style formatting
Date: Fri, 22 Apr 2022 15:43:44 -0400
Message-Id: <20220422194344.9318-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This is a quick code style cleanup patch for xsm/flask. The files flask_op.c
and hooks.c are Xen specific, thus full code style rules were applied. The
remaining files are from Linux and therefore only trailing whitespace was
remove from those files.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/flask/avc.c            |  14 +--
 xen/xsm/flask/flask_op.c       |  27 ++---
 xen/xsm/flask/hooks.c          | 186 +++++++++++++++++----------------
 xen/xsm/flask/include/avc.h    |   2 +-
 xen/xsm/flask/ss/avtab.c       |  10 +-
 xen/xsm/flask/ss/avtab.h       |   4 +-
 xen/xsm/flask/ss/conditional.c |   4 +-
 xen/xsm/flask/ss/context.h     |   4 +-
 xen/xsm/flask/ss/mls.c         |   2 +-
 xen/xsm/flask/ss/policydb.c    |   2 +-
 xen/xsm/flask/ss/services.c    |   6 +-
 xen/xsm/flask/ss/sidtab.c      |   6 +-
 12 files changed, 136 insertions(+), 131 deletions(-)

diff --git a/xen/xsm/flask/avc.c b/xen/xsm/flask/avc.c
index e20c165042..4a75ec97e2 100644
--- a/xen/xsm/flask/avc.c
+++ b/xen/xsm/flask/avc.c
@@ -13,9 +13,9 @@
  *    it under the terms of the GNU General Public License version 2,
  *      as published by the Free Software Foundation.
  */
- 
+
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
- 
+
 #include <xen/lib.h>
 #include <xen/xmalloc.h>
 #include <xen/types.h>
@@ -267,7 +267,7 @@ int avc_get_hash_stats(struct xen_flask_hash_stats *arg)
     }
 
     rcu_read_unlock(&avc_rcu_lock);
-    
+
     arg->entries = atomic_read(&avc_cache.active_nodes);
     arg->buckets_used = slots_used;
     arg->buckets_total = AVC_CACHE_SLOTS;
@@ -336,7 +336,7 @@ static inline int avc_reclaim_node(void)
         }
         rcu_read_unlock(&avc_rcu_lock);
         spin_unlock_irqrestore(lock, flags);
-    }    
+    }
  out:
     return ecx;
 }
@@ -622,7 +622,7 @@ static int avc_update_node(u32 perms, u32 ssid, u32 tsid, u16 tclass,
     struct hlist_head *head;
     struct hlist_node *next;
     spinlock_t *lock;
-    
+
     node = avc_alloc_node();
     if ( !node )
     {
@@ -630,7 +630,7 @@ static int avc_update_node(u32 perms, u32 ssid, u32 tsid, u16 tclass,
         goto out;
     }
 
-    hvalue = avc_hash(ssid, tsid, tclass);    
+    hvalue = avc_hash(ssid, tsid, tclass);
 
     head = &avc_cache.slots[hvalue];
     lock = &avc_cache.slots_lock[hvalue];
@@ -695,7 +695,7 @@ int avc_ss_reset(u32 seqno)
         rcu_read_unlock(&avc_rcu_lock);
         spin_unlock_irqrestore(lock, flag);
     }
-    
+
     avc_latest_notif_update(seqno, 0);
     return rc;
 }
diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index 707be72a3b..eb16e289c3 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -75,15 +75,15 @@ static int __init cf_check parse_flask_param(const char *s)
 }
 custom_param("flask", parse_flask_param);
 
-static int domain_has_security(struct domain *d, u32 perms)
+static int domain_has_security(struct domain *d, uint32_t perms)
 {
     struct domain_security_struct *dsec;
-    
+
     dsec = d->ssid;
     if ( !dsec )
         return -EACCES;
-        
-    return avc_has_perm(dsec->sid, SECINITSID_SECURITY, SECCLASS_SECURITY, 
+
+    return avc_has_perm(dsec->sid, SECINITSID_SECURITY, SECCLASS_SECURITY,
                         perms, NULL);
 }
 
@@ -130,7 +130,7 @@ static int flask_security_access(struct xen_flask_access *arg)
     arg->audit_allow = avd.auditallow;
     arg->audit_deny = avd.auditdeny;
     arg->seqno = avd.seqno;
-                
+
     return rv;
 }
 
@@ -196,7 +196,7 @@ static int flask_security_sid(struct xen_flask_sid_context *arg)
 {
     int rv;
     char *context;
-    u32 len;
+    uint32_t len;
 
     rv = domain_has_security(current->domain, SECURITY__CHECK_CONTEXT);
     if ( rv )
@@ -223,7 +223,8 @@ static int flask_security_sid(struct xen_flask_sid_context *arg)
 
 #ifndef COMPAT
 
-static int flask_security_setavc_threshold(struct xen_flask_setavc_threshold *arg)
+static int flask_security_setavc_threshold(
+    struct xen_flask_setavc_threshold *arg)
 {
     int rv = 0;
 
@@ -350,7 +351,7 @@ static int flask_security_get_bool(struct xen_flask_boolean *arg)
         if ( nameout_len > arg->size )
             rv = -ERANGE;
         arg->size = nameout_len;
- 
+
         if ( !rv && _copy_to_guest(arg->name, nameout, nameout_len) )
             rv = -EFAULT;
         xfree(nameout);
@@ -386,9 +387,9 @@ static int flask_security_make_bools(void)
     int ret = 0;
     int num;
     int *values = NULL;
-    
+
     xfree(bool_pending_values);
-    
+
     ret = security_get_bools(&num, NULL, &values, NULL);
     if ( ret != 0 )
         goto out;
@@ -474,8 +475,8 @@ static int flask_devicetree_label(struct xen_flask_devicetree_label *arg)
 {
     int rv;
     char *buf;
-    u32 sid = arg->sid;
-    u32 perm = sid ? SECURITY__ADD_OCONTEXT : SECURITY__DEL_OCONTEXT;
+    uint32_t sid = arg->sid;
+    uint32_t perm = sid ? SECURITY__ADD_OCONTEXT : SECURITY__DEL_OCONTEXT;
 
     rv = domain_has_security(current->domain, perm);
     if ( rv )
@@ -670,7 +671,7 @@ ret_t cf_check do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
 
     case FLASK_MLS:
         rv = flask_mls_enabled;
-        break;    
+        break;
 
     case FLASK_GETAVC_THRESHOLD:
         rv = avc_cache_threshold;
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 0bf63ffa84..e2ebbc7716 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -38,34 +38,34 @@
 #include <conditional.h>
 #include "private.h"
 
-static u32 domain_sid(const struct domain *dom)
+static uint32_t domain_sid(const struct domain *dom)
 {
     struct domain_security_struct *dsec = dom->ssid;
     return dsec->sid;
 }
 
-static u32 domain_target_sid(const struct domain *src,
-                             const struct domain *dst)
+static uint32_t domain_target_sid(
+    const struct domain *src, const struct domain *dst)
 {
     struct domain_security_struct *ssec = src->ssid;
     struct domain_security_struct *dsec = dst->ssid;
-    if (src == dst)
+    if ( src == dst )
         return ssec->self_sid;
-    if (src->target == dst)
+    if ( src->target == dst )
         return ssec->target_sid;
     return dsec->sid;
 }
 
-static u32 evtchn_sid(const struct evtchn *chn)
+static uint32_t evtchn_sid(const struct evtchn *chn)
 {
     return chn->ssid.flask_sid;
 }
 
-static int domain_has_perm(const struct domain *dom1,
-                           const struct domain *dom2,
-                           u16 class, u32 perms)
+static int domain_has_perm(
+    const struct domain *dom1, const struct domain *dom2, uint16_t class,
+    uint32_t perms)
 {
-    u32 ssid, tsid;
+    uint32_t ssid, tsid;
     struct avc_audit_data ad;
     AVC_AUDIT_DATA_INIT(&ad, NONE);
     ad.sdom = dom1;
@@ -77,34 +77,35 @@ static int domain_has_perm(const struct domain *dom1,
     return avc_has_perm(ssid, tsid, class, perms, &ad);
 }
 
-static int avc_current_has_perm(u32 tsid, u16 class, u32 perm,
-                                struct avc_audit_data *ad)
+static int avc_current_has_perm(
+    uint32_t tsid, uint16_t class, uint32_t perm, struct avc_audit_data *ad)
 {
-    u32 csid = domain_sid(current->domain);
+    uint32_t csid = domain_sid(current->domain);
     return avc_has_perm(csid, tsid, class, perm, ad);
 }
 
-static int current_has_perm(struct domain *d, u16 class, u32 perms)
+static int current_has_perm(struct domain *d, uint16_t class, uint32_t perms)
 {
     return domain_has_perm(current->domain, d, class, perms);
 }
 
-static int domain_has_evtchn(struct domain *d, struct evtchn *chn, u32 perms)
+static int domain_has_evtchn(
+    struct domain *d, struct evtchn *chn, uint32_t perms)
 {
-    u32 dsid = domain_sid(d);
-    u32 esid = evtchn_sid(chn);
+    uint32_t dsid = domain_sid(d);
+    uint32_t esid = evtchn_sid(chn);
 
     return avc_has_perm(dsid, esid, SECCLASS_EVENT, perms, NULL);
 }
 
-static int domain_has_xen(struct domain *d, u32 perms)
+static int domain_has_xen(struct domain *d, uint32_t perms)
 {
-    u32 dsid = domain_sid(d);
+    uint32_t dsid = domain_sid(d);
 
     return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_XEN, perms, NULL);
 }
 
-static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
+static int get_irq_sid(int irq, uint32_t *sid, struct avc_audit_data *ad)
 {
     if ( irq >= nr_irqs || irq < 0 )
         return -EINVAL;
@@ -120,8 +121,8 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
         struct irq_desc *desc = irq_to_desc(irq);
         if ( desc->msi_desc && desc->msi_desc->dev ) {
             struct pci_dev *dev = desc->msi_desc->dev;
-            u32 sbdf = (dev->seg << 16) | (dev->bus << 8) | dev->devfn;
-            if (ad) {
+            uint32_t sbdf = (dev->seg << 16) | (dev->bus << 8) | dev->devfn;
+            if ( ad ) {
                 AVC_AUDIT_DATA_INIT(ad, DEV);
                 ad->device = sbdf;
             }
@@ -130,7 +131,7 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
     }
 #endif
 
-    if (ad) {
+    if ( ad ) {
         AVC_AUDIT_DATA_INIT(ad, IRQ);
         ad->irq = irq;
     }
@@ -200,7 +201,7 @@ static void cf_check flask_domain_free_security(struct domain *d)
 static int cf_check flask_evtchn_unbound(
     struct domain *d1, struct evtchn *chn, domid_t id2)
 {
-    u32 sid1, sid2, newsid;
+    uint32_t sid1, sid2, newsid;
     int rc;
     struct domain *d2;
 
@@ -234,7 +235,7 @@ static int cf_check flask_evtchn_interdomain(
     struct domain *d1, struct evtchn *chn1,
     struct domain *d2, struct evtchn *chn2)
 {
-    u32 sid1, sid2, newsid, reverse_sid;
+    uint32_t sid1, sid2, newsid, reverse_sid;
     int rc;
     struct avc_audit_data ad;
     AVC_AUDIT_DATA_INIT(&ad, NONE);
@@ -336,9 +337,9 @@ static char *cf_check flask_show_security_evtchn(
     struct domain *d, const struct evtchn *chn)
 {
     int irq;
-    u32 sid = 0;
+    uint32_t sid = 0;
     char *ctx;
-    u32 ctx_len;
+    uint32_t ctx_len;
 
     switch ( chn->state )
     {
@@ -354,7 +355,7 @@ static char *cf_check flask_show_security_evtchn(
     }
     if ( !sid )
         return NULL;
-    if (security_sid_to_context(sid, &ctx, &ctx_len))
+    if ( security_sid_to_context(sid, &ctx, &ctx_len) )
         return NULL;
     return ctx;
 }
@@ -367,7 +368,7 @@ static int cf_check flask_init_hardware_domain(struct domain *d)
 static int cf_check flask_grant_mapref(
     struct domain *d1, struct domain *d2, uint32_t flags)
 {
-    u32 perms = GRANT__MAP_READ;
+    uint32_t perms = GRANT__MAP_READ;
 
     if ( !(flags & GNTMAP_readonly) )
         perms |= GRANT__MAP_WRITE;
@@ -445,7 +446,7 @@ static int cf_check flask_get_vnumainfo(struct domain *d)
 
 static int cf_check flask_console_io(struct domain *d, int cmd)
 {
-    u32 perm;
+    uint32_t perm;
 
     switch ( cmd )
     {
@@ -464,7 +465,7 @@ static int cf_check flask_console_io(struct domain *d, int cmd)
 
 static int cf_check flask_profile(struct domain *d, int op)
 {
-    u32 perm;
+    uint32_t perm;
 
     switch ( op )
     {
@@ -510,7 +511,7 @@ static void cf_check flask_security_domaininfo(
     info->ssidref = domain_sid(d);
 }
 
-static int cf_check flask_domain_create(struct domain *d, u32 ssidref)
+static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
 {
     int rc;
     struct domain_security_struct *dsec = d->ssid;
@@ -843,7 +844,7 @@ static int cf_check flask_sysctl(int cmd)
 
 static int cf_check flask_readconsole(uint32_t clear)
 {
-    u32 perms = XEN__READCONSOLE;
+    uint32_t perms = XEN__READCONSOLE;
 
     if ( clear )
         perms |= XEN__CLEARCONSOLE;
@@ -851,7 +852,7 @@ static int cf_check flask_readconsole(uint32_t clear)
     return domain_has_xen(current->domain, perms);
 }
 
-static inline u32 resource_to_perm(uint8_t access)
+static inline uint32_t resource_to_perm(uint8_t access)
 {
     if ( access )
         return RESOURCE__ADD;
@@ -861,13 +862,13 @@ static inline u32 resource_to_perm(uint8_t access)
 
 static char *cf_check flask_show_irq_sid(int irq)
 {
-    u32 sid, ctx_len;
+    uint32_t sid, ctx_len;
     char *ctx;
     int rc = get_irq_sid(irq, &sid, NULL);
     if ( rc )
         return NULL;
 
-    if (security_sid_to_context(sid, &ctx, &ctx_len))
+    if ( security_sid_to_context(sid, &ctx, &ctx_len) )
         return NULL;
 
     return ctx;
@@ -878,12 +879,13 @@ static int cf_check flask_map_domain_pirq(struct domain *d)
     return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
 }
 
-static int flask_map_domain_msi (struct domain *d, int irq, const void *data,
-                                 u32 *sid, struct avc_audit_data *ad)
+static int flask_map_domain_msi (
+    struct domain *d, int irq, const void *data, uint32_t *sid,
+    struct avc_audit_data *ad)
 {
 #ifdef CONFIG_HAS_PCI_MSI
     const struct msi_info *msi = data;
-    u32 machine_bdf = (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
+    uint32_t machine_bdf = (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
 
     AVC_AUDIT_DATA_INIT(ad, DEV);
     ad->device = machine_bdf;
@@ -894,7 +896,7 @@ static int flask_map_domain_msi (struct domain *d, int irq, const void *data,
 #endif
 }
 
-static u32 flask_iommu_resource_use_perm(const struct domain *d)
+static uint32_t flask_iommu_resource_use_perm(const struct domain *d)
 {
     /* Obtain the permission level required for allowing a domain
      * to use an assigned device.
@@ -905,7 +907,7 @@ static u32 flask_iommu_resource_use_perm(const struct domain *d)
      * less capable hardware (no IOMMU or IOMMU missing intremap capability)
      * via other separate permissions.
      */
-    u32 perm = RESOURCE__USE_NOIOMMU;
+    uint32_t perm = RESOURCE__USE_NOIOMMU;
 
     if ( is_iommu_enabled(d) )
         perm = ( iommu_intremap ? RESOURCE__USE_IOMMU :
@@ -913,18 +915,18 @@ static u32 flask_iommu_resource_use_perm(const struct domain *d)
     return perm;
 }
 
-static int cf_check flask_map_domain_irq(struct domain *d, int irq, const void *data)
+static int cf_check flask_map_domain_irq(
+    struct domain *d, int irq, const void *data)
 {
-    u32 sid, dsid;
+    uint32_t sid, dsid;
     int rc = -EPERM;
     struct avc_audit_data ad;
-    u32 dperm = flask_iommu_resource_use_perm(d);
+    uint32_t dperm = flask_iommu_resource_use_perm(d);
 
-    if ( irq >= nr_static_irqs && data ) {
+    if ( irq >= nr_static_irqs && data )
         rc = flask_map_domain_msi(d, irq, data, &sid, &ad);
-    } else {
+    else
         rc = get_irq_sid(irq, &sid, &ad);
-    }
 
     if ( rc )
         return rc;
@@ -944,12 +946,13 @@ static int cf_check flask_unmap_domain_pirq(struct domain *d)
     return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
 }
 
-static int flask_unmap_domain_msi (struct domain *d, int irq, const void *data,
-                                   u32 *sid, struct avc_audit_data *ad)
+static int flask_unmap_domain_msi (
+    struct domain *d, int irq, const void *data, uint32_t *sid,
+    struct avc_audit_data *ad)
 {
 #ifdef CONFIG_HAS_PCI_MSI
     const struct pci_dev *pdev = data;
-    u32 machine_bdf = (pdev->seg << 16) | (pdev->bus << 8) | pdev->devfn;
+    uint32_t machine_bdf = (pdev->seg << 16) | (pdev->bus << 8) | pdev->devfn;
 
     AVC_AUDIT_DATA_INIT(ad, DEV);
     ad->device = machine_bdf;
@@ -963,15 +966,15 @@ static int flask_unmap_domain_msi (struct domain *d, int irq, const void *data,
 static int cf_check flask_unmap_domain_irq(
     struct domain *d, int irq, const void *data)
 {
-    u32 sid;
+    uint32_t sid;
     int rc = -EPERM;
     struct avc_audit_data ad;
 
-    if ( irq >= nr_static_irqs && data ) {
+    if ( irq >= nr_static_irqs && data )
         rc = flask_unmap_domain_msi(d, irq, data, &sid, &ad);
-    } else {
+    else
         rc = get_irq_sid(irq, &sid, &ad);
-    }
+
     if ( rc )
         return rc;
 
@@ -982,11 +985,11 @@ static int cf_check flask_unmap_domain_irq(
 static int cf_check flask_bind_pt_irq(
     struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
-    u32 dsid, rsid;
+    uint32_t dsid, rsid;
     int rc = -EPERM;
     int irq;
     struct avc_audit_data ad;
-    u32 dperm = flask_iommu_resource_use_perm(d);
+    uint32_t dperm = flask_iommu_resource_use_perm(d);
 
     rc = current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
     if ( rc )
@@ -1020,14 +1023,14 @@ static int cf_check flask_irq_permission(
 }
 
 struct iomem_has_perm_data {
-    u32 ssid;
-    u32 dsid;
-    u32 perm;
-    u32 use_perm;
+    uint32_t ssid;
+    uint32_t dsid;
+    uint32_t perm;
+    uint32_t use_perm;
 };
 
 static int cf_check _iomem_has_perm(
-    void *v, u32 sid, unsigned long start, unsigned long end)
+    void *v, uint32_t sid, unsigned long start, unsigned long end)
 {
     struct iomem_has_perm_data *data = v;
     struct avc_audit_data ad;
@@ -1077,10 +1080,10 @@ static int cf_check flask_pci_config_permission(
     struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end,
     uint8_t access)
 {
-    u32 dsid, rsid;
+    uint32_t dsid, rsid;
     int rc = -EPERM;
     struct avc_audit_data ad;
-    u32 perm;
+    uint32_t perm;
 
     rc = security_device_sid(machine_bdf, &rsid);
     if ( rc )
@@ -1116,7 +1119,7 @@ static int flask_resource_use_core(void)
 
 static int cf_check flask_resource_plug_pci(uint32_t machine_bdf)
 {
-    u32 rsid;
+    uint32_t rsid;
     int rc = -EPERM;
     struct avc_audit_data ad;
 
@@ -1131,7 +1134,7 @@ static int cf_check flask_resource_plug_pci(uint32_t machine_bdf)
 
 static int cf_check flask_resource_unplug_pci(uint32_t machine_bdf)
 {
-    u32 rsid;
+    uint32_t rsid;
     int rc = -EPERM;
     struct avc_audit_data ad;
 
@@ -1146,7 +1149,7 @@ static int cf_check flask_resource_unplug_pci(uint32_t machine_bdf)
 
 static int cf_check flask_resource_setup_pci(uint32_t machine_bdf)
 {
-    u32 rsid;
+    uint32_t rsid;
     int rc = -EPERM;
     struct avc_audit_data ad;
 
@@ -1161,7 +1164,7 @@ static int cf_check flask_resource_setup_pci(uint32_t machine_bdf)
 
 static int cf_check flask_resource_setup_gsi(int gsi)
 {
-    u32 rsid;
+    uint32_t rsid;
     int rc = -EPERM;
     struct avc_audit_data ad;
 
@@ -1179,7 +1182,8 @@ static int cf_check flask_resource_setup_misc(void)
 
 static inline int cf_check flask_page_offline(uint32_t cmd)
 {
-    switch (cmd) {
+    switch ( cmd )
+    {
     case sysctl_page_offline:
         return flask_resource_unplug_core();
     case sysctl_page_online:
@@ -1214,7 +1218,7 @@ static int cf_check flask_map_gmfn_foreign(struct domain *d, struct domain *t)
 
 static int cf_check flask_hvm_param(struct domain *d, unsigned long op)
 {
-    u32 perm;
+    uint32_t perm;
 
     switch ( op )
     {
@@ -1289,7 +1293,7 @@ static int cf_check flask_mem_sharing(struct domain *d)
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
 static int cf_check flask_get_device_group(uint32_t machine_bdf)
 {
-    u32 rsid;
+    uint32_t rsid;
     int rc = -EPERM;
 
     rc = security_device_sid(machine_bdf, &rsid);
@@ -1301,7 +1305,7 @@ static int cf_check flask_get_device_group(uint32_t machine_bdf)
 
 static int flask_test_assign_device(uint32_t machine_bdf)
 {
-    u32 rsid;
+    uint32_t rsid;
     int rc = -EPERM;
 
     rc = security_device_sid(machine_bdf, &rsid);
@@ -1313,10 +1317,10 @@ static int flask_test_assign_device(uint32_t machine_bdf)
 
 static int cf_check flask_assign_device(struct domain *d, uint32_t machine_bdf)
 {
-    u32 dsid, rsid;
+    uint32_t dsid, rsid;
     int rc = -EPERM;
     struct avc_audit_data ad;
-    u32 dperm;
+    uint32_t dperm;
 
     if ( !d )
         return flask_test_assign_device(machine_bdf);
@@ -1344,7 +1348,7 @@ static int cf_check flask_assign_device(struct domain *d, uint32_t machine_bdf)
 static int cf_check flask_deassign_device(
     struct domain *d, uint32_t machine_bdf)
 {
-    u32 rsid;
+    uint32_t rsid;
     int rc = -EPERM;
 
     rc = current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
@@ -1362,7 +1366,7 @@ static int cf_check flask_deassign_device(
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
 static int flask_test_assign_dtdevice(const char *dtpath)
 {
-    u32 rsid;
+    uint32_t rsid;
     int rc = -EPERM;
 
     rc = security_devicetree_sid(dtpath, &rsid);
@@ -1375,10 +1379,10 @@ static int flask_test_assign_dtdevice(const char *dtpath)
 
 static int cf_check flask_assign_dtdevice(struct domain *d, const char *dtpath)
 {
-    u32 dsid, rsid;
+    uint32_t dsid, rsid;
     int rc = -EPERM;
     struct avc_audit_data ad;
-    u32 dperm;
+    uint32_t dperm;
 
     if ( !d )
         return flask_test_assign_dtdevice(dtpath);
@@ -1406,7 +1410,7 @@ static int cf_check flask_assign_dtdevice(struct domain *d, const char *dtpath)
 static int cf_check flask_deassign_dtdevice(
     struct domain *d, const char *dtpath)
 {
-    u32 rsid;
+    uint32_t rsid;
     int rc = -EPERM;
 
     rc = current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
@@ -1498,7 +1502,7 @@ static int cf_check flask_do_mca(void)
 
 static int cf_check flask_shadow_control(struct domain *d, uint32_t op)
 {
-    u32 perm;
+    uint32_t perm;
 
     switch ( op )
     {
@@ -1524,14 +1528,14 @@ static int cf_check flask_shadow_control(struct domain *d, uint32_t op)
 }
 
 struct ioport_has_perm_data {
-    u32 ssid;
-    u32 dsid;
-    u32 perm;
-    u32 use_perm;
+    uint32_t ssid;
+    uint32_t dsid;
+    uint32_t perm;
+    uint32_t use_perm;
 };
 
 static int cf_check _ioport_has_perm(
-    void *v, u32 sid, unsigned long start, unsigned long end)
+    void *v, uint32_t sid, unsigned long start, unsigned long end)
 {
     struct ioport_has_perm_data *data = v;
     struct avc_audit_data ad;
@@ -1590,7 +1594,7 @@ static int cf_check flask_mem_sharing_op(
 
 static int cf_check flask_apic(struct domain *d, int cmd)
 {
-    u32 perm;
+    uint32_t perm;
 
     switch ( cmd )
     {
@@ -1622,7 +1626,7 @@ static int cf_check flask_mmu_update(
     struct domain *d, struct domain *t, struct domain *f, uint32_t flags)
 {
     int rc = 0;
-    u32 map_perms = 0;
+    uint32_t map_perms = 0;
 
     if ( t && d != t )
         rc = domain_has_perm(d, t, SECCLASS_MMU, MMU__REMOTE_REMAP);
@@ -1649,7 +1653,7 @@ static int cf_check flask_mmuext_op(struct domain *d, struct domain *f)
 static int cf_check flask_update_va_mapping(
     struct domain *d, struct domain *f, l1_pgentry_t pte)
 {
-    u32 map_perms = MMU__MAP_READ;
+    uint32_t map_perms = MMU__MAP_READ;
     if ( !(l1e_get_flags(pte) & _PAGE_PRESENT) )
         return 0;
     if ( l1e_get_flags(pte) & _PAGE_RW )
@@ -1665,7 +1669,7 @@ static int cf_check flask_priv_mapping(struct domain *d, struct domain *t)
 
 static int cf_check flask_pmu_op(struct domain *d, unsigned int op)
 {
-    u32 dsid = domain_sid(d);
+    uint32_t dsid = domain_sid(d);
 
     switch ( op )
     {
@@ -1694,7 +1698,7 @@ static int cf_check flask_dm_op(struct domain *d)
 
 static int cf_check flask_xen_version(uint32_t op)
 {
-    u32 dsid = domain_sid(current->domain);
+    uint32_t dsid = domain_sid(current->domain);
 
     switch ( op )
     {
@@ -1902,8 +1906,8 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
 #endif
 };
 
-const struct xsm_ops *__init flask_init(const void *policy_buffer,
-                                        size_t policy_size)
+const struct xsm_ops *__init flask_init(
+    const void *policy_buffer, size_t policy_size)
 {
     int ret = -ENOENT;
 
diff --git a/xen/xsm/flask/include/avc.h b/xen/xsm/flask/include/avc.h
index c14bd07a2b..e29949f5a8 100644
--- a/xen/xsm/flask/include/avc.h
+++ b/xen/xsm/flask/include/avc.h
@@ -3,7 +3,7 @@
  *
  * Author : Stephen Smalley, <sds@epoch.ncsc.mil>
  */
- 
+
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
 #ifndef _FLASK_AVC_H_
diff --git a/xen/xsm/flask/ss/avtab.c b/xen/xsm/flask/ss/avtab.c
index 55c2b4d8a4..017f5183de 100644
--- a/xen/xsm/flask/ss/avtab.c
+++ b/xen/xsm/flask/ss/avtab.c
@@ -35,7 +35,7 @@ static inline int avtab_hash(struct avtab_key *keyp, u16 mask)
 }
 
 static struct avtab_node* avtab_insert_node(struct avtab *h, int hvalue,
-    struct avtab_node * prev, struct avtab_node * cur, struct avtab_key *key, 
+    struct avtab_node * prev, struct avtab_node * cur, struct avtab_key *key,
                                                     struct avtab_datum *datum)
 {
     struct avtab_node *newnode = xzalloc(struct avtab_node);
@@ -59,7 +59,7 @@ static struct avtab_node* avtab_insert_node(struct avtab *h, int hvalue,
     return newnode;
 }
 
-static int avtab_insert(struct avtab *h, struct avtab_key *key, 
+static int avtab_insert(struct avtab *h, struct avtab_key *key,
                                                     struct avtab_datum *datum)
 {
     int hvalue;
@@ -100,7 +100,7 @@ static int avtab_insert(struct avtab *h, struct avtab_key *key,
  * key/specified mask into the table, as needed by the conditional avtab.
  * It also returns a pointer to the node inserted.
  */
-struct avtab_node * avtab_insert_nonunique(struct avtab * h, 
+struct avtab_node * avtab_insert_nonunique(struct avtab * h,
                             struct avtab_key * key, struct avtab_datum * datum)
 {
     int hvalue;
@@ -110,7 +110,7 @@ struct avtab_node * avtab_insert_nonunique(struct avtab * h,
     if ( !h || !h->htable )
         return NULL;
     hvalue = avtab_hash(key, h->mask);
-    for ( prev = NULL, cur = h->htable[hvalue]; cur; 
+    for ( prev = NULL, cur = h->htable[hvalue]; cur;
                                                 prev = cur, cur = cur->next )
     {
         if ( key->source_type == cur->key.source_type &&
@@ -199,7 +199,7 @@ struct avtab_node* avtab_search_node(struct avtab *h, struct avtab_key *key)
     return NULL;
 }
 
-struct avtab_node* avtab_search_node_next(struct avtab_node *node, 
+struct avtab_node* avtab_search_node_next(struct avtab_node *node,
                                                                 int specified)
 {
     struct avtab_node *cur;
diff --git a/xen/xsm/flask/ss/avtab.h b/xen/xsm/flask/ss/avtab.h
index a2b50c222a..591604f927 100644
--- a/xen/xsm/flask/ss/avtab.h
+++ b/xen/xsm/flask/ss/avtab.h
@@ -74,12 +74,12 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
 
 int avtab_read(struct avtab *a, void *fp, struct policydb *pol);
 
-struct avtab_node *avtab_insert_nonunique(struct avtab *h, 
+struct avtab_node *avtab_insert_nonunique(struct avtab *h,
                             struct avtab_key *key, struct avtab_datum *datum);
 
 struct avtab_node *avtab_search_node(struct avtab *h, struct avtab_key *key);
 
-struct avtab_node *avtab_search_node_next(struct avtab_node *node, 
+struct avtab_node *avtab_search_node_next(struct avtab_node *node,
                                                                 int specified);
 
 #define MAX_AVTAB_HASH_BITS 13
diff --git a/xen/xsm/flask/ss/conditional.c b/xen/xsm/flask/ss/conditional.c
index b4b116666c..e74fc01746 100644
--- a/xen/xsm/flask/ss/conditional.c
+++ b/xen/xsm/flask/ss/conditional.c
@@ -452,7 +452,7 @@ static int cond_read_node(struct policydb *p, struct cond_node *node, void *fp)
             goto err;
         }
 
-        if ( i == 0 ) 
+        if ( i == 0 )
             node->expr = expr;
         else
             last->next = expr;
@@ -513,7 +513,7 @@ err:
 /* Determine whether additional permissions are granted by the conditional
  * av table, and if so, add them to the result
  */
-void cond_compute_av(struct avtab *ctab, struct avtab_key *key, 
+void cond_compute_av(struct avtab *ctab, struct avtab_key *key,
                                                         struct av_decision *avd)
 {
     struct avtab_node *node;
diff --git a/xen/xsm/flask/ss/context.h b/xen/xsm/flask/ss/context.h
index 302b3698a7..311edf8794 100644
--- a/xen/xsm/flask/ss/context.h
+++ b/xen/xsm/flask/ss/context.h
@@ -12,9 +12,9 @@
  *
  * Author : Stephen Smalley, <sds@epoch.ncsc.mil>
  */
- 
+
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
- 
+
 #ifndef _SS_CONTEXT_H_
 #define _SS_CONTEXT_H_
 
diff --git a/xen/xsm/flask/ss/mls.c b/xen/xsm/flask/ss/mls.c
index f2fa560810..a3255ae01a 100644
--- a/xen/xsm/flask/ss/mls.c
+++ b/xen/xsm/flask/ss/mls.c
@@ -70,7 +70,7 @@ int mls_compute_context_len(struct context * context)
         }
         if ( l == 0 )
         {
-            if ( mls_level_eq(&context->range.level[0], 
+            if ( mls_level_eq(&context->range.level[0],
                               &context->range.level[1]) )
                 break;
             else
diff --git a/xen/xsm/flask/ss/policydb.c b/xen/xsm/flask/ss/policydb.c
index ff2103c63e..162470bbbd 100644
--- a/xen/xsm/flask/ss/policydb.c
+++ b/xen/xsm/flask/ss/policydb.c
@@ -339,7 +339,7 @@ static int cf_check sens_index(void *key, void *datum, void *datap)
 
     if ( !levdatum->isalias )
     {
-        if ( !levdatum->level->sens || levdatum->level->sens > 
+        if ( !levdatum->level->sens || levdatum->level->sens >
                                                         p->p_levels.nprim )
             return -EINVAL;
         p->p_sens_val_to_name[levdatum->level->sens - 1] = key;
diff --git a/xen/xsm/flask/ss/services.c b/xen/xsm/flask/ss/services.c
index 2f6d3d350d..dab07b5f60 100644
--- a/xen/xsm/flask/ss/services.c
+++ b/xen/xsm/flask/ss/services.c
@@ -99,7 +99,7 @@ static int context_struct_compute_av(struct context *scontext,
  * constraint_expr_eval should pass in NULL for xcontext.
  */
 static int constraint_expr_eval(struct context *scontext,
-                            struct context *tcontext, struct context *xcontext, 
+                            struct context *tcontext, struct context *xcontext,
                                                 struct constraint_expr *cexpr)
 {
     u32 val1, val2;
@@ -1073,7 +1073,7 @@ static int security_compute_sid(u32 ssid,
                 /* Look for a role transition rule. */
                 for ( roletr = policydb.role_tr; roletr; roletr = roletr->next )
                 {
-                    if ( roletr->role == scontext->role && 
+                    if ( roletr->role == scontext->role &&
                                             roletr->type == tcontext->type )
                     {
                         /* Use the role transition rule. */
@@ -1485,7 +1485,7 @@ int security_irq_sid(int pirq, u32 *out_sid)
     POLICY_RDLOCK;
 
     c = policydb.ocontexts[OCON_PIRQ];
-    
+
     while ( c )
     {
         if ( c->u.pirq == pirq )
diff --git a/xen/xsm/flask/ss/sidtab.c b/xen/xsm/flask/ss/sidtab.c
index cd1360cb4a..74babfac9c 100644
--- a/xen/xsm/flask/ss/sidtab.c
+++ b/xen/xsm/flask/ss/sidtab.c
@@ -3,9 +3,9 @@
  *
  * Author : Stephen Smalley, <sds@epoch.ncsc.mil>
  */
- 
+
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
- 
+
 #include <xen/lib.h>
 #include <xen/xmalloc.h>
 #include <xen/errno.h>
@@ -192,7 +192,7 @@ void sidtab_map_remove_on_error(struct sidtab *s,
     return;
 }
 
-static inline u32 sidtab_search_context(struct sidtab *s, 
+static inline u32 sidtab_search_context(struct sidtab *s,
                                                         struct context *context)
 {
     int i;
-- 
2.20.1


