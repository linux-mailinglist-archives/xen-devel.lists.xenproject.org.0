Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F782EABDD
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:26:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61981.109404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmLv-0002uE-Ij; Tue, 05 Jan 2021 13:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61981.109404; Tue, 05 Jan 2021 13:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmLv-0002ts-Ff; Tue, 05 Jan 2021 13:26:23 +0000
Received: by outflank-mailman (input) for mailman id 61981;
 Tue, 05 Jan 2021 13:26:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwmLt-0002tm-JE
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:26:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37fa78f1-75c6-4fcc-8269-48c4cd320ff0;
 Tue, 05 Jan 2021 13:26:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48B18B1C2;
 Tue,  5 Jan 2021 13:26:19 +0000 (UTC)
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
X-Inumbo-ID: 37fa78f1-75c6-4fcc-8269-48c4cd320ff0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609853179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vnSIp4fMArYf7b2LO3zYntC45B/YVIqATPMyd0hThJ0=;
	b=pJURiI0Xv+0kZhTcs/K1Ssa9mIRdO27SB9po5rIut9pu5bEKArY2xF6Kdl5T2+1/aiDcly
	iXc1xoM+zVQg9Tx3B1cyYRwGSHpkRV4VF1HEN9CxsGPwFrWif7QfMRCAkFG7fUhzWMVZyD
	v5QHkYnFuAXxYv9ZuxPSPHQsPUrBYhs=
Subject: [PATCH 3/5] argo: don't pointlessly use get_domain_by_id()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
Message-ID: <1d565881-d3d7-2a25-326a-61c7bb640f3a@suse.com>
Date: Tue, 5 Jan 2021 14:26:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

For short-lived references rcu_lock_domain_by_id() is the better
(slightly cheaper) alternative.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Is it really intentional for fill_ring_data() to return success (0) in
case the domain can't be found or has argo disabled? Even if so, the
uninitialized ent.max_message_size will be leaked to the caller then
(and similarly when find_ring_info_by_match() returns NULL). Perhaps
the field should only be copied back when ent.flags is non-zero?

--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -445,13 +445,13 @@ signal_domain(struct domain *d)
 static void
 signal_domid(domid_t domain_id)
 {
-    struct domain *d = get_domain_by_id(domain_id);
+    struct domain *d = rcu_lock_domain_by_id(domain_id);
 
     if ( !d )
         return;
 
     signal_domain(d);
-    put_domain(d);
+    rcu_unlock_domain(d);
 }
 
 static void
@@ -983,7 +983,7 @@ ringbuf_insert(const struct domain *d, s
 static void
 wildcard_pending_list_remove(domid_t domain_id, struct pending_ent *ent)
 {
-    struct domain *d = get_domain_by_id(domain_id);
+    struct domain *d = rcu_lock_domain_by_id(domain_id);
 
     if ( !d )
         return;
@@ -996,13 +996,13 @@ wildcard_pending_list_remove(domid_t dom
         list_del(&ent->wildcard_node);
         spin_unlock(&d->argo->wildcard_L2_lock);
     }
-    put_domain(d);
+    rcu_unlock_domain(d);
 }
 
 static void
 wildcard_pending_list_insert(domid_t domain_id, struct pending_ent *ent)
 {
-    struct domain *d = get_domain_by_id(domain_id);
+    struct domain *d = rcu_lock_domain_by_id(domain_id);
 
     if ( !d )
         return;
@@ -1015,7 +1015,7 @@ wildcard_pending_list_insert(domid_t dom
         list_add(&ent->wildcard_node, &d->argo->wildcard_pend_list);
         spin_unlock(&d->argo->wildcard_L2_lock);
     }
-    put_domain(d);
+    rcu_unlock_domain(d);
 }
 
 static void
@@ -1283,7 +1283,7 @@ partner_rings_remove(struct domain *src_
                                                       struct argo_send_info,
                                                       node)) )
         {
-            struct domain *dst_d = get_domain_by_id(send_info->id.domain_id);
+            struct domain *dst_d = rcu_lock_domain_by_id(send_info->id.domain_id);
 
             if ( dst_d && dst_d->argo )
             {
@@ -1302,7 +1302,7 @@ partner_rings_remove(struct domain *src_
                 ASSERT_UNREACHABLE();
 
             if ( dst_d )
-                put_domain(dst_d);
+                rcu_unlock_domain(dst_d);
 
             list_del(&send_info->node);
             xfree(send_info);
@@ -1330,7 +1330,7 @@ fill_ring_data(const struct domain *curr
 
     ent.flags = 0;
 
-    dst_d = get_domain_by_id(ent.ring.domain_id);
+    dst_d = rcu_lock_domain_by_id(ent.ring.domain_id);
     if ( !dst_d || !dst_d->argo )
         goto out;
 
@@ -1340,10 +1340,7 @@ fill_ring_data(const struct domain *curr
      */
     ret = xsm_argo_send(currd, dst_d);
     if ( ret )
-    {
-        put_domain(dst_d);
-        return ret;
-    }
+        goto out;
 
     read_lock(&dst_d->argo->rings_L2_rwlock);
 
@@ -1405,7 +1402,7 @@ fill_ring_data(const struct domain *curr
 
  out:
     if ( dst_d )
-        put_domain(dst_d);
+        rcu_unlock_domain(dst_d);
 
     if ( !ret && (__copy_field_to_guest(data_ent_hnd, &ent, flags) ||
                   __copy_field_to_guest(data_ent_hnd, &ent, max_message_size)) )
@@ -1569,7 +1566,7 @@ unregister_ring(struct domain *currd,
     if ( ring_id.partner_id == XEN_ARGO_DOMID_ANY )
         goto out;
 
-    dst_d = get_domain_by_id(ring_id.partner_id);
+    dst_d = rcu_lock_domain_by_id(ring_id.partner_id);
     if ( !dst_d || !dst_d->argo )
     {
         ASSERT_UNREACHABLE();
@@ -1592,7 +1589,7 @@ unregister_ring(struct domain *currd,
     read_unlock(&L1_global_argo_rwlock);
 
     if ( dst_d )
-        put_domain(dst_d);
+        rcu_unlock_domain(dst_d);
 
     xfree(send_info);
 
@@ -1663,7 +1660,7 @@ register_ring(struct domain *currd,
     }
     else
     {
-        dst_d = get_domain_by_id(reg.partner_id);
+        dst_d = rcu_lock_domain_by_id(reg.partner_id);
         if ( !dst_d )
         {
             argo_dprintk("!dst_d, ESRCH\n");
@@ -1845,7 +1842,7 @@ register_ring(struct domain *currd,
 
  out:
     if ( dst_d )
-        put_domain(dst_d);
+        rcu_unlock_domain(dst_d);
 
     if ( ret )
         xfree(send_info);
@@ -1988,7 +1985,7 @@ sendv(struct domain *src_d, xen_argo_add
     src_id.domain_id = src_d->domain_id;
     src_id.partner_id = dst_addr->domain_id;
 
-    dst_d = get_domain_by_id(dst_addr->domain_id);
+    dst_d = rcu_lock_domain_by_id(dst_addr->domain_id);
     if ( !dst_d )
         return -ESRCH;
 
@@ -1998,7 +1995,7 @@ sendv(struct domain *src_d, xen_argo_add
         gprintk(XENLOG_ERR, "argo: XSM REJECTED %i -> %i\n",
                 src_d->domain_id, dst_d->domain_id);
 
-        put_domain(dst_d);
+        rcu_unlock_domain(dst_d);
 
         return ret;
     }
@@ -2068,7 +2065,7 @@ sendv(struct domain *src_d, xen_argo_add
         signal_domain(dst_d);
 
     if ( dst_d )
-        put_domain(dst_d);
+        rcu_unlock_domain(dst_d);
 
     return ( ret < 0 ) ? ret : len;
 }


