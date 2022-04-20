Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A34A508DEF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 19:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309517.525832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhDjj-000210-VE; Wed, 20 Apr 2022 17:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309517.525832; Wed, 20 Apr 2022 17:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhDjj-0001yL-Ro; Wed, 20 Apr 2022 17:03:27 +0000
Received: by outflank-mailman (input) for mailman id 309517;
 Wed, 20 Apr 2022 17:03:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUyO=U6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhDji-0001aR-PC
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 17:03:26 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca307303-c0cb-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 19:03:25 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650474160905460.02002794635507;
 Wed, 20 Apr 2022 10:02:40 -0700 (PDT)
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
X-Inumbo-ID: ca307303-c0cb-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1650474163; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CTxWLgCeuWnLv2VOCcXmi09a880v9ZBTFREtRMNRReO5Ru90scD+dp9jKce9+YVRuetMrRG0+e9q7mr+ehzCqdg1+HDOZk4fRp4fimRwl6I7iJIOvlbR+rbglj/vZrmGpE5Tkqy3AeYMxLBRdE98XROonvOhGNvoBbEjZb4VEeo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650474163; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=TymRc8V7wVKkFF8i7BKHRUOSpUbifIpbb54+vNPswqA=; 
	b=RzW18awQrx3YbGuvUIdfikJQfzRSHreOPJFzXcRy4HGLjio/TCmYPpIgdnbl3+zoVA9LBEswyI50xMqp0u/QYimSn+aNHt0oeF42+ILKp1QnL38sk71MhztuyciiD2/L5wA9G48/+yF39D+aaB6miSCMPSEEqVh4GuNKdjoe5lw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650474163;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=TymRc8V7wVKkFF8i7BKHRUOSpUbifIpbb54+vNPswqA=;
	b=h/P7V63m83DhKw/S5tRl3bFWX8Tps4+Zua/m7YoXu3ixN88k1Sa9NDZQ0rGRFsQR
	Gd4l5QuEDcY1ItX9au60TvwQPoCa1I52RPDDXDyFaxQApp29zelfevOFmPE4jrDq37I
	4FrZZo0x1s/sfO+fbl5Jy7dingqFRvzMFiLXDcjU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	jandryuk@gmail.com,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/2] flask: implement xsm_transtion_running
Date: Wed, 20 Apr 2022 17:04:07 -0400
Message-Id: <20220420210407.18060-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220420210407.18060-1-dpsmith@apertussolutions.com>
References: <20220420210407.18060-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit implements full support for starting the idle domain privileged by
introducing a new flask label xenboot_t which the idle domain is labeled with
at creation.  It then provides the implementation for the XSM hook
xsm_transition_running to relabel the idle domain to the existing xen_t flask
label.

In the reference flask policy a new macro, xen_build_domain(target), is
introduced for creating policies for dom0less/hyperlaunch allowing the
hypervisor to create and assign the necessary resources for domain
construction.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 tools/flask/policy/modules/xen.if      | 6 ++++++
 tools/flask/policy/modules/xen.te      | 1 +
 tools/flask/policy/policy/initial_sids | 1 +
 xen/xsm/flask/hooks.c                  | 6 +++++-
 xen/xsm/flask/policy/initial_sids      | 1 +
 5 files changed, 14 insertions(+), 1 deletion(-)

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
index 51c896d9f7..7e840af6fc 100644
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
@@ -188,6 +188,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
 
 static void cf_check flask_domain_runtime_security(void)
 {
+    struct domain_security_struct *dsec;
     struct domain *d = current->domain;
 
     if ( d->domain_id != DOMID_IDLE )
@@ -198,6 +199,9 @@ static void cf_check flask_domain_runtime_security(void)
      * set to false for the consistency check(s) in the setup code.
      */
     d->is_privileged = false;
+
+    dsec = d->ssid;
+    dsec->sid = SECINITSID_XEN;
 }
 
 static void cf_check flask_domain_free_security(struct domain *d)
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


