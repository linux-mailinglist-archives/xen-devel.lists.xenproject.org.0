Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A95B2B84
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 03:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403747.645952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWSmS-0002uT-79; Fri, 09 Sep 2022 01:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403747.645952; Fri, 09 Sep 2022 01:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWSmS-0002ri-4J; Fri, 09 Sep 2022 01:26:04 +0000
Received: by outflank-mailman (input) for mailman id 403747;
 Fri, 09 Sep 2022 01:26:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F1lU=ZM=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oWSmP-0002rZ-K9
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 01:26:01 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aac2932-2fde-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 03:25:58 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1662686754262221.97457724687013;
 Thu, 8 Sep 2022 18:25:54 -0700 (PDT)
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
X-Inumbo-ID: 5aac2932-2fde-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; t=1662686755; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E8eHhFSNqKSkFwLgj80p2okNpmTz9D62iTuT8eHcO+VyUZsutcjQn5EZnuctb6+RsoJdiQPI7iNnk49Z52uNSBaEiYGYEfUWMwgwp0IG2th9P0dRPGP7zCrM7CSmD0itI/HEBLBN2KH9Aw59rckQe2mv7PjNvKC7WMW0RWB7icU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1662686755; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=06Il6Fk/dR1OUrL4o7viMHeSHJE1pbT7SdkOPcjyxO4=; 
	b=AI4N05lGgMDK0hVAtQLCI4X4qQIp/Go/N/E5aBCudVfWOBPh7itKKP3IOS6GeywSWd9F9bi5SkWMYQYwb/F5gmrYbvKBKrqgj7Yi4YQpsDJFbS+/I7fuvTWTQ98cH2pyaigBiZIXqZbCh1Bc/x8T5TNPXZ3OgALHDm1KMyPOHPc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662686755;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=06Il6Fk/dR1OUrL4o7viMHeSHJE1pbT7SdkOPcjyxO4=;
	b=lyFvQ1FNIekCi0Y704J11aYcBcO0BXTs+y7VyJi7cx31ZVuXcfYiEPI9yLa7aDpI
	y6Xt5mbZXe16ZVEefE37qeKHJmv8UqCbHeeri3oJhgSOzgWy4YDj6UovcpdONUeSAXP
	i12ShOpDYcy/7UdyHD4RFlf78feRiYNRd8fW3afU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jandryuk@gmail.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v13] xsm/flask: correcting initial sid assignment on context allocation
Date: Thu,  8 Sep 2022 21:25:46 -0400
Message-Id: <20220909012546.21807-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The current flow for initial SID assignment is that the function
flask_domain_alloc_security() allocates the security context and assigns an
initial SID based on the limited state information it can access. Specifically
the initial SID is determined by the domid of the domain, where it would assign
the label for one of the domains the hypervisor constructed with the exception
of initial domain (dom0). In the case of the initial domain and all other
domains it would use the unlabeled_t SID.

When it came to the SID for the initial domain, its assignment was managed by
flask_domain_create() where it would be switched from unlabeled_t to dom0_t.
This logic worked under the assumption that the first call to
flask_domain_create() would be the hypervisor constructing the initial domain.
After which it would be the toolstack constructing the domain, for which it is
expected to provide an appropriate SID or else unlabeled_t would be used.

The issue is that the assumptions upon which the current flow is built were
weak and are invalid for PV shim and dom0less. Under the current flow even
though the initial domain for PV shim is not set as privileged, flask would
label the domain as dom0_t. For dom0less, the situation is two-fold. First is
that every domain after the first domain creation will fail as they will be
labeled as unlabeled_t. The second is that if the dom0less configuration does
not include a "dom0", the first domain created would be labeled as dom0_t.

This commit only seeks to address the situation for PV shim, by including a
check for xenboot_t context in flask_domain_alloc_security() to determine if
the domain is being constructed at system boot. Then a check for is_privilged
and pv_shim is added to differentiate between a "dom0" initial domain and a PV
shim initial domain.

The logic for flask_domain_create() was altered to allow the incoming SID to
override the initial label. This allows a domain builder, whether it is a
toolstack, dom0less, or hyperlaunch, to provide the correct label for the
domain at construction.

The base policy was adjusted to allow the idle domain under the xenboot_t
context the ability to construct domains of both types, dom0_t and domu_t.
This will enable a hypervisor resident domain builder to construct domains
beyond the initial domain,

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---

Split out from series "Adds starting the idle domain privileged", earlier patches
from series have been committed.

Changes in v13:

After considering the points raised by Jason, a valid point that really stuck
is that changes to FLASK should not be made to address that dom0less did not
include support to work under FLASK. The reality is that both dom0less and
hyperlaunch are solutions that by design provide domain definitions to the
hypervisor for construction. Therefore, they should handle doing domain
construction under FLASK. Thus, the patch was adjusted to address correctly
labeling the initial domain under PV shim.

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
 xen/xsm/flask/hooks.c              | 55 +++++++++++++++++++++++-------
 3 files changed, 49 insertions(+), 12 deletions(-)

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
index 8bd56644ef..e7db7fe07a 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -38,6 +38,12 @@
 #include <conditional.h>
 #include "private.h"
 
+#ifdef CONFIG_X86
+#include <asm/pv/shim.h>
+#else
+#define pv_shim false
+#endif
+
 static uint32_t domain_sid(const struct domain *dom)
 {
     struct domain_security_struct *dsec = dom->ssid;
@@ -170,6 +176,9 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
     if ( !dsec )
         return -ENOMEM;
 
+    /* Set as unlabeled then change as appropriate. */
+    dsec->sid = SECINITSID_UNLABELED;
+
     switch ( d->domain_id )
     {
     case DOMID_IDLE:
@@ -182,7 +191,13 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
         dsec->sid = SECINITSID_DOMIO;
         break;
     default:
-        dsec->sid = SECINITSID_UNLABELED;
+        if ( domain_sid(current->domain) == SECINITSID_XENBOOT )
+        {
+            if ( d->is_privileged )
+                dsec->sid = SECINITSID_DOM0;
+            else if ( pv_shim )
+                dsec->sid = SECINITSID_DOMU;
+        }
     }
 
     dsec->self_sid = dsec->sid;
@@ -550,20 +565,36 @@ static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
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


