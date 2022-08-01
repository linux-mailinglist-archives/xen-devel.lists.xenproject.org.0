Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9BE58708F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 20:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379044.612326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIaUy-0003df-DY; Mon, 01 Aug 2022 18:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379044.612326; Mon, 01 Aug 2022 18:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIaUy-0003au-AV; Mon, 01 Aug 2022 18:50:40 +0000
Received: by outflank-mailman (input) for mailman id 379044;
 Mon, 01 Aug 2022 18:50:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvEX=YF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oIaUx-00033M-5d
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 18:50:39 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4a36c28-11ca-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 20:50:38 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1659379787630270.7014982877881;
 Mon, 1 Aug 2022 11:49:47 -0700 (PDT)
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
X-Inumbo-ID: d4a36c28-11ca-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1659379791; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q9mwUtvZGz/FCpcnMempPReZ50jrCpdFOBJC/fqJGT/hvjvdvJPBsEwb7S21NF15ACBe3+ZFaevzgdHFK45ZY5Kv25FKT/Vql9c/s2qFpRmI3MvJ4GBA67rhwm5YoLwhJS+8MUZ3PfP02IP/GS19zYDLE2Aub/SNHvQFtZlByEk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1659379791; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=gpmxoFgFxGv7Q9frig3z6tCtnPr6RMz7LbnBr0EPi6Y=; 
	b=SfMbc3DIJbpF77aj9/X1g7sECo44vbAct3Njj8nxmeUHn//gXVHH8uu/lddgfIIS4kKDJ4Ol1v17sWsNsUqazQExQC3v2PflZ5jN1KMdqk27Pwqkx+vY8tKttAXB1Egon1b/Fq5f/6uMuMkwprhJo/JNpdgUKHYgRkeljP0iJao=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659379791;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=gpmxoFgFxGv7Q9frig3z6tCtnPr6RMz7LbnBr0EPi6Y=;
	b=TJvdTcoNsknYMQkGlJ32+5N9ZhTSJaCdXRcItSuTBKVVjKI+4FxfCKWuuzzcUs5U
	4K/XSS/PNIiXFYl4kUkXeNRIlRr1u1UgZnEy5K1ohM6lNZXe5oKXA+yHEBP/3ZpXM4o
	3XR1YZxrHnB7B8r80m0NPGE2R3Y2LwaDX9c/U8Kc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jandryuk@gmail.com,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v10 3/3] xsm: refactor flask sid alloc and domain check
Date: Mon,  1 Aug 2022 14:49:28 -0400
Message-Id: <20220801184928.28522-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220801184928.28522-1-dpsmith@apertussolutions.com>
References: <20220801184928.28522-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The function flask_domain_alloc_security() allocates the security context and
assigns an initial SID for the domain under construction. When it came to SID
assignment of the initial domain, flask_domain_alloc_security() would assign
unlabeled_t. Then in flask_domain_create() it would be switched to dom0_t.
This logic worked under the assumption that the first domain constructed would
be the hypervisor constructing dom0 and all other domains would be constructed
by a toolstack, which would provide a SID. The introduction of dom0less and
subsequently hyperlaunch violates this assumption, as non-privileged domain may
be constructed before the initial domain or no initial domain may be
constructed at all. It is not possible currently for dom0less to express domain
labels in the domain configuration, as such the FLASK policy must employ a
sensible initial SID assignment that can differentiate between hypervisor and
toolstack domain construction.  With the introduction of xenboot_t it is now
possible to distinguish when the hypervisor is in the boot state, and thus any
domain construction happening at this time is being initiated by the
hypervisor.

This commit addresses the above situation by using a check to confirm if the
hypervisor is under the xenboot_t context in flask_domain_alloc_security().
When that is the case, it will inspect the domain's is_privileged field to
determine whether an initial label of dom0_t or domU_t should be set for the
domain. The logic for flask_domain_create() was changed to allow the incoming
SID to override the initial label.

The base policy was adjusted to allow the idle domain under the xenboot_t
context the ability to construct domains of both types, dom0_t and domu_t.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 tools/flask/policy/modules/dom0.te |  3 +++
 tools/flask/policy/modules/domU.te |  3 +++
 xen/xsm/flask/hooks.c              | 35 +++++++++++++++++-------------
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index 0a63ce15b6..f710ff9941 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -75,3 +75,6 @@ admin_device(dom0_t, ioport_t)
 admin_device(dom0_t, iomem_t)
 
 domain_comms(dom0_t, dom0_t)
+
+# Allow the hypervisor to build domains of type dom0_t
+xen_build_domain(dom0_t)
diff --git a/tools/flask/policy/modules/domU.te b/tools/flask/policy/modules/domU.te
index b77df29d56..3f269018f9 100644
--- a/tools/flask/policy/modules/domU.te
+++ b/tools/flask/policy/modules/domU.te
@@ -13,6 +13,9 @@ domain_comms(domU_t, domU_t)
 migrate_domain_out(dom0_t, domU_t)
 domain_self_comms(domU_t)
 
+# Allow the hypervisor to build domains of type domU_t
+xen_build_domain(domU_t)
+
 # Device model for domU_t.  You can define distinct types for device models for
 # domains of other types, or add more make_device_model lines for this type.
 declare_domain(dm_dom_t)
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 8c9cd0f297..cb81e62c52 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -182,7 +182,15 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
         dsec->sid = SECINITSID_DOMIO;
         break;
     default:
-        dsec->sid = SECINITSID_UNLABELED;
+        if ( domain_sid(current->domain) == SECINITSID_XENBOOT )
+        {
+            if ( d->is_privileged )
+                dsec->sid = SECINITSID_DOM0;
+            else
+                dsec->sid = SECINITSID_DOMU;
+        }
+        else
+            dsec->sid = SECINITSID_UNLABELED;
     }
 
     dsec->self_sid = dsec->sid;
@@ -548,22 +556,19 @@ static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
 {
     int rc;
     struct domain_security_struct *dsec = d->ssid;
-    static int dom0_created = 0;
 
-    if ( is_idle_domain(current->domain) && !dom0_created )
-    {
-        dsec->sid = SECINITSID_DOM0;
-        dom0_created = 1;
-    }
-    else
-    {
-        rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN,
-                          DOMAIN__CREATE, NULL);
-        if ( rc )
-            return rc;
+    /*
+     * If the null label is passed, then use the label from security context
+     * allocation.
+     */
+    if ( ssidref == 0 )
+        ssidref = dsec->sid;
 
-        dsec->sid = ssidref;
-    }
+    rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN, DOMAIN__CREATE, NULL);
+    if ( rc )
+        return rc;
+
+    dsec->sid = ssidref;
     dsec->self_sid = dsec->sid;
 
     rc = security_transition_sid(dsec->sid, dsec->sid, SECCLASS_DOMAIN,
-- 
2.20.1


