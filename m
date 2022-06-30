Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9175B560F18
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 04:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358162.587216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6jp5-0000Kr-6K; Thu, 30 Jun 2022 02:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358162.587216; Thu, 30 Jun 2022 02:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6jp5-0000J3-2k; Thu, 30 Jun 2022 02:22:27 +0000
Received: by outflank-mailman (input) for mailman id 358162;
 Thu, 30 Jun 2022 02:22:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o6jp3-0008BT-FC
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 02:22:25 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79b04c7c-f81b-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 04:22:24 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1656555684266753.5376810279763;
 Wed, 29 Jun 2022 19:21:24 -0700 (PDT)
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
X-Inumbo-ID: 79b04c7c-f81b-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1656555685; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mYop27cKJl+Hmae0mmbw30oqw52xmdc7fV5P5iUOIyOt8fZiB3e7AEI34J+ZuOOhDSE4+gfFgiGzZZnujk01tQQSLEBvkMjwNhZngt6hx2Hvhc5n+rXkt8ZTANbiiD6baa+RwzuD9X8JOhl4zt6glPVRpm5Y9BGoQmH7XXuzoBU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1656555685; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=tlQWv3Rz2gRTz+BpNK92sdZYks2PMVMJJttWyeIdrUk=; 
	b=Jnb6FbLXL0hEpkIFCRP+1kxfAE85YAgZCzWa2i90pzYWf1BulCvO9egCf7WZylXUmT5tuMmyVSy0kmN5ZD/MZCkgKvjyXvIZEhqaQ2UHh+KG+UWWnRc1X4YTP+qhcJsF7IbKr5UIgFtmJCBpgtVnJOpUGdyqoho53Nk0p7Emx6A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656555685;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=tlQWv3Rz2gRTz+BpNK92sdZYks2PMVMJJttWyeIdrUk=;
	b=n9weZOBj6+lDaTHCecVjlcFGekNIr0LkNffiAlFm7i5Pw0k76kRQM89psgp4IRDz
	NS7ZiJJsmrahuUXDZ6S5hVT+NULP5yM3OrbQbguLlvj8CV8yswTOaiWb5YfcIR81sw5
	/9ad6XlXHtQ9zekJumjJY2dvKhQYySQNA/U4HzP0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	jandryuk@gmail.com,
	christopher.clark@starlab.io,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v9 3/3] xsm: refactor flask sid alloc and domain check
Date: Wed, 29 Jun 2022 22:21:10 -0400
Message-Id: <20220630022110.31555-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220630022110.31555-1-dpsmith@apertussolutions.com>
References: <20220630022110.31555-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The function flask_domain_alloc_security() is where a default sid should be
assigned to a domain under construction. For reasons unknown, the initial
domain would be assigned unlabeled_t and then fixed up under
flask_domain_create().  With the introduction of xenboot_t it is now possible
to distinguish when the hypervisor is in the boot state.

This commit looks to correct this by using a check to see if the hypervisor is
under the xenboot_t context in flask_domain_alloc_security(). If it is, then it
will inspect the domain's is_privileged field, and select the appropriate
default label, dom0_t or domU_t, for the domain. The logic for
flask_domain_create() was changed to allow the incoming sid to override the
default label.

The base policy was adjusted to allow the idle domain under the xenboot_t
context to be able to construct domains of both types, dom0 and domU.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 tools/flask/policy/modules/dom0.te |  3 +++
 tools/flask/policy/modules/domU.te |  3 +++
 xen/xsm/flask/hooks.c              | 34 ++++++++++++++++++------------
 3 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index 0a63ce15b6..2022bb9636 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -75,3 +75,6 @@ admin_device(dom0_t, ioport_t)
 admin_device(dom0_t, iomem_t)
 
 domain_comms(dom0_t, dom0_t)
+
+# Allow they hypervisor to build domains of type dom0_t
+xen_build_domain(dom0_t)
diff --git a/tools/flask/policy/modules/domU.te b/tools/flask/policy/modules/domU.te
index b77df29d56..73fc90c3c6 100644
--- a/tools/flask/policy/modules/domU.te
+++ b/tools/flask/policy/modules/domU.te
@@ -13,6 +13,9 @@ domain_comms(domU_t, domU_t)
 migrate_domain_out(dom0_t, domU_t)
 domain_self_comms(domU_t)
 
+# Allow they hypervisor to build domains of type domU_t
+xen_build_domain(domU_t)
+
 # Device model for domU_t.  You can define distinct types for device models for
 # domains of other types, or add more make_device_model lines for this type.
 declare_domain(dm_dom_t)
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 8c9cd0f297..caa0ae7d4c 100644
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
@@ -548,23 +556,21 @@ static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
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
+    /*
+     * If domain has not already been labeled or a valid new label is provided,
+     * then use the provided label, otherwise use the existing label.
+     */
+    if ( dsec->sid == SECINITSID_UNLABELED || ssidref > 0 )
     {
-        rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN,
-                          DOMAIN__CREATE, NULL);
-        if ( rc )
-            return rc;
-
         dsec->sid = ssidref;
+        dsec->self_sid = dsec->sid;
     }
-    dsec->self_sid = dsec->sid;
+
+    rc = avc_current_has_perm(dsec->sid, SECCLASS_DOMAIN,
+                              DOMAIN__CREATE, NULL);
+    if ( rc )
+        return rc;
 
     rc = security_transition_sid(dsec->sid, dsec->sid, SECCLASS_DOMAIN,
                                  &dsec->self_sid);
-- 
2.20.1


