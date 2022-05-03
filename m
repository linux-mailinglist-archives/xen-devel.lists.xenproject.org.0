Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FAC518328
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 13:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319496.539756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlqYX-0000KX-Gc; Tue, 03 May 2022 11:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319496.539756; Tue, 03 May 2022 11:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlqYX-0000IQ-CZ; Tue, 03 May 2022 11:19:01 +0000
Received: by outflank-mailman (input) for mailman id 319496;
 Tue, 03 May 2022 11:18:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7qc=VL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nlqYV-0007yH-FH
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 11:18:59 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2730006-cad2-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 13:18:57 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1651576668065384.3787219888786;
 Tue, 3 May 2022 04:17:48 -0700 (PDT)
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
X-Inumbo-ID: d2730006-cad2-11ec-8fc4-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1651576669; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JJKOcvVdOwQS1pxmXpLQvNqeO6TYNQd3WQq/oka+M0XDcaEgfHuTdazTFxC8uIxYFXH/DNHFx/ucW/6nFTqs0zrca0Mfir8GLPtgtCMjdaj3HdagRqIPAnpO+CN30FNYCypzjFyCkl4i6tF2ydxTkFIFvgijvdAIxe0vrpAFY4w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1651576669; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Rn8pIJ5/E/d7mP3iWH7p9KqhjeTfcKsV2dbiWGsA9xU=; 
	b=drY5Qa0hxPVoMWUXPs5Uxbnx97yU2hSMvDHWga62lN3KUDzSeBIyUAii4M1IMTeAlyWtGkhz3W5qaJ3ZSzLjQd9EoBgq0AjdFYz8YM3rYGlSdbY+OwE7NP+TYlCCQWimqKQSKeocaMvOng+npS74KZBWjxvrmDD6HPpdO6ndsGI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1651576669;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Rn8pIJ5/E/d7mP3iWH7p9KqhjeTfcKsV2dbiWGsA9xU=;
	b=MHF5gDLgRXZ3HxxgnQlW4GIcm9QG/sWt2Zcuf3cGbXNJgadnTkAni/OVPBJQcRkl
	CCN1OwQ07j3J7atN8PuIihA/NVJEeut/e1bRFDupLUgjpEz+EBu4dojrDpa+4oDtzdR
	FKl7Ysa/4pOESghTf4OyrrMuIQmJRKqSDQ54TG4c=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	jandryuk@gmail.com,
	christopher.clark@starlab.io,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v6 2/2] flask: implement xsm_set_system_active
Date: Tue,  3 May 2022 07:17:31 -0400
Message-Id: <20220503111731.12642-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220503111731.12642-1-dpsmith@apertussolutions.com>
References: <20220503111731.12642-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit implements full support for starting the idle domain privileged by
introducing a new flask label xenboot_t which the idle domain is labeled with
at creation.  It then provides the implementation for the XSM hook
xsm_set_system_active to relabel the idle domain to the existing xen_t flask
label.

In the reference flask policy a new macro, xen_build_domain(target), is
introduced for creating policies for dom0less/hyperlaunch allowing the
hypervisor to create and assign the necessary resources for domain
construction.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/flask/policy/modules/xen.if      | 6 ++++++
 tools/flask/policy/modules/xen.te      | 1 +
 tools/flask/policy/policy/initial_sids | 1 +
 xen/xsm/flask/hooks.c                  | 9 ++++++++-
 xen/xsm/flask/policy/initial_sids      | 1 +
 5 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index 5e2aa472b6..4ec676fff1 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -62,6 +62,12 @@ define(`create_domain_common', `
 			setparam altp2mhvm altp2mhvm_op dm };
 ')
 
+# xen_build_domain(target)
+#   Allow a domain to be created at boot by the hypervisor
+define(`xen_build_domain', `
+	allow xenboot_t $1_channel:event create;
+')
+
 # create_domain(priv, target)
 #   Allow a domain to be created directly
 define(`create_domain', `
diff --git a/tools/flask/policy/modules/xen.te b/tools/flask/policy/modules/xen.te
index 3dbf93d2b8..de98206fdd 100644
--- a/tools/flask/policy/modules/xen.te
+++ b/tools/flask/policy/modules/xen.te
@@ -24,6 +24,7 @@ attribute mls_priv;
 ################################################################################
 
 # The hypervisor itself
+type xenboot_t, xen_type, mls_priv;
 type xen_t, xen_type, mls_priv;
 
 # Domain 0
diff --git a/tools/flask/policy/policy/initial_sids b/tools/flask/policy/policy/initial_sids
index 6b7b7eff21..ec729d3ba3 100644
--- a/tools/flask/policy/policy/initial_sids
+++ b/tools/flask/policy/policy/initial_sids
@@ -2,6 +2,7 @@
 # objects created before the policy is loaded or for objects that do not have a
 # label defined in some other manner.
 
+sid xenboot gen_context(system_u:system_r:xenboot_t,s0)
 sid xen gen_context(system_u:system_r:xen_t,s0)
 sid dom0 gen_context(system_u:system_r:dom0_t,s0)
 sid domxen gen_context(system_u:system_r:domxen_t,s0)
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b93101191e..734d9de16a 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -168,7 +168,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
     switch ( d->domain_id )
     {
     case DOMID_IDLE:
-        dsec->sid = SECINITSID_XEN;
+        dsec->sid = SECINITSID_XENBOOT;
         break;
     case DOMID_XEN:
         dsec->sid = SECINITSID_DOMXEN;
@@ -188,9 +188,14 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
 
 static int cf_check flask_set_system_active(void)
 {
+    struct domain_security_struct *dsec;
     struct domain *d = current->domain;
 
+    dsec = d->ssid;
+
     ASSERT(d->is_privileged);
+    ASSERT(dsec->sid == SECINITSID_XENBOOT);
+    ASSERT(dsec->self_sid == SECINITSID_XENBOOT);
 
     if ( d->domain_id != DOMID_IDLE )
     {
@@ -205,6 +210,8 @@ static int cf_check flask_set_system_active(void)
      */
     d->is_privileged = false;
 
+    dsec->self_sid = dsec->sid = SECINITSID_XEN;
+
     return 0;
 }
 
diff --git a/xen/xsm/flask/policy/initial_sids b/xen/xsm/flask/policy/initial_sids
index 7eca70d339..e8b55b8368 100644
--- a/xen/xsm/flask/policy/initial_sids
+++ b/xen/xsm/flask/policy/initial_sids
@@ -3,6 +3,7 @@
 #
 # Define initial security identifiers 
 #
+sid xenboot
 sid xen
 sid dom0
 sid domio
-- 
2.20.1


