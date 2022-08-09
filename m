Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD1C58DA12
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 16:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382974.618054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLPsg-0004kh-Ub; Tue, 09 Aug 2022 14:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382974.618054; Tue, 09 Aug 2022 14:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLPsg-0004iv-Rq; Tue, 09 Aug 2022 14:06:50 +0000
Received: by outflank-mailman (input) for mailman id 382974;
 Tue, 09 Aug 2022 14:06:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQDH=YN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oLPse-0004ii-Us
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 14:06:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80985131-17ec-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 16:06:47 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1660054001486612.4994336146949;
 Tue, 9 Aug 2022 07:06:41 -0700 (PDT)
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
X-Inumbo-ID: 80985131-17ec-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1660054003; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yz+5D8xhS6VsduTkEUFAs4hiUQxEbdbbyvZbG1aSB43E1019kGqHblriqWdIsc6/S25pcx9PJWsB6ZAu/FvmAGfRFLnWrnDtmOhZFm7YGtjn03oHgBNdyyEEzyxj9WzFSPelHd+S4x1acSdCYszBuXgclJUISgYqPNdPoF9hQjQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660054003; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=sCUZgg3ZKh6+lUDHe7AdAiEFvyygFukiKyXKr0zD0o0=; 
	b=lkf5/zMqfnVhoQQcuScXg8fyUjOezt30WImA3gu8CLVALDRjRQtYi87nEIfs/ryzUL9XB4H6bz3H+mRu7Th3hMQCXAohPDhRTfflNvK424x3TuC5P+sJ+RffUhEcrczuxL57JCFlsY8ClmYlUV0tbHk8COhtXpXq1AibwAEfLvs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660054003;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=sCUZgg3ZKh6+lUDHe7AdAiEFvyygFukiKyXKr0zD0o0=;
	b=TXtWTEVVzGlWm6a04eaQPXf68QU8pxn7vDJ3klB7UQ2jZOlO+c20tBHYojL2Ot4K
	mFw2wKMYEAlga2biSJJ2Lvch4FMgZ1fthMtrS/6b9EDxm1WukPxBX3vDCGidpSOGA9l
	eltxtdNEhSPDV3YSD5IefcgAd6Wr0ZtcORo4sccI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jandryuk@gmail.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v12] xsm: refactor flask sid alloc and domain check
Date: Tue,  9 Aug 2022 10:06:33 -0400
Message-Id: <20220809140633.23537-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
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

Split out from series "Adds starting the idle domain privileged", earlier patches
from series have been committed.

Changes in v12:
- actually send the changes from v11

Changes in v11:
- put back dom0_created variable in flask_domain_create() to ensure the
  enforcement that dom0_t is a singleton label

Changes in v10:
- rewrote commit message
- fixed typos
- reworked logic in flask_domain_create() to be simpler and not result in
  changing the domain security struct before the access check fails

 tools/flask/policy/modules/dom0.te |  3 ++
 tools/flask/policy/modules/domU.te |  3 ++
 xen/xsm/flask/hooks.c              | 48 ++++++++++++++++++++++--------
 3 files changed, 42 insertions(+), 12 deletions(-)

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
index 8c9cd0f297..2c2d393edf 100644
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
@@ -550,20 +558,36 @@ static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
     struct domain_security_struct *dsec = d->ssid;
     static int dom0_created = 0;
 
-    if ( is_idle_domain(current->domain) && !dom0_created )
+    /*
+     * If the null label is passed, then use the label from security context
+     * allocation. NB: if the label from the allocated security context is also
+     * null, the security server will use unlabeled_t for the domain.
+     */
+    if ( ssidref == 0 )
+        ssidref = dsec->sid;
+
+    /*
+     * First check if the current domain is allowed to create the target domain
+     * type before making changes to the current state.
+     */
+    rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN, DOMAIN__CREATE, NULL);
+    if ( rc )
+        return rc;
+
+    /*
+     * The dom0_t label is expressed as a singleton label in the base policy.
+     * This cannot be enforced by the security server, therefore it will be
+     * enforced here.
+     */
+    if ( ssidref == SECINITSID_DOM0 )
     {
-        dsec->sid = SECINITSID_DOM0;
-        dom0_created = 1;
+        if ( !dom0_created )
+            dom0_created = 1;
+        else
+            return -EINVAL;
     }
-    else
-    {
-        rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN,
-                          DOMAIN__CREATE, NULL);
-        if ( rc )
-            return rc;
 
-        dsec->sid = ssidref;
-    }
+    dsec->sid = ssidref;
     dsec->self_sid = dsec->sid;
 
     rc = security_transition_sid(dsec->sid, dsec->sid, SECCLASS_DOMAIN,
-- 
2.20.1


