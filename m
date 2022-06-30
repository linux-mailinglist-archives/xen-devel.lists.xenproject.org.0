Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11D2560F17
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 04:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358159.587205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6joi-0008JL-Ur; Thu, 30 Jun 2022 02:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358159.587205; Thu, 30 Jun 2022 02:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6joi-0008Ep-Rq; Thu, 30 Jun 2022 02:22:04 +0000
Received: by outflank-mailman (input) for mailman id 358159;
 Thu, 30 Jun 2022 02:22:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o6joh-0008BT-A4
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 02:22:03 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6beadad3-f81b-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 04:22:01 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1656555682878122.91886337918402;
 Wed, 29 Jun 2022 19:21:22 -0700 (PDT)
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
X-Inumbo-ID: 6beadad3-f81b-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1656555685; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=beWn45PMRfvxFhMizYRNdnezsGJT5qkQk2GeVtvsU4doaI4qGTEH92PNUfVkzgOCP19hPXkZ4neQMnQqWwEE8FLs0RR7xC2oaJg7LxODwyXeg+CcF6gamkP4pPaH+pAAIgiiSh6/J7MtBzgmLcKA8a2d7YUA6VnR3jO+t/Q21JE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1656555685; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=lgQtLIGn/s1ADo/YMy42iciFpzQ0Han+37xft97wtw4=; 
	b=mOUUOw+SCuiGAlKPfFqV32hrboan+vKN9hsj6xxFGVIUd+D7YhhvypbiNE4dDZZXYQcYIiUOqT+kmOhpP6SXQ1npX7VteJmtHNK8jHfn6PNZv0cio8LW21vQRy0SVlfn9rLaYEuBJdQWP0U7Ngqv5g7bfoiuFltRQS5CtSYk5Z8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656555685;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=lgQtLIGn/s1ADo/YMy42iciFpzQ0Han+37xft97wtw4=;
	b=jqaEV/m+/820i+9oBGJS2fZd+R8jU6KNKf8cUovdFCAei597pVP1g19wEyIXtEi6
	ffYNQ4uC280IlUL9/Umjye0SLXunFLGxj8yW3RjcJ3P7DuH1Y0t1Q3TzUmlAo5JY+oh
	5lKx4GYFNIf/NjuCoxxTtzu8pruzoTJ2u0vXe1cE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	jandryuk@gmail.com,
	christopher.clark@starlab.io,
	Luca Fancellu <luca.fancellu@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v9 2/3] flask: implement xsm_set_system_active
Date: Wed, 29 Jun 2022 22:21:09 -0400
Message-Id: <20220630022110.31555-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220630022110.31555-1-dpsmith@apertussolutions.com>
References: <20220630022110.31555-1-dpsmith@apertussolutions.com>
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
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
---
 tools/flask/policy/modules/xen.if      | 7 +++++++
 tools/flask/policy/modules/xen.te      | 1 +
 tools/flask/policy/policy/initial_sids | 1 +
 xen/xsm/flask/hooks.c                  | 9 ++++++++-
 xen/xsm/flask/policy/initial_sids      | 1 +
 5 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index 5e2aa472b6..424daab6a0 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -62,6 +62,13 @@ define(`create_domain_common', `
 			setparam altp2mhvm altp2mhvm_op dm };
 ')
 
+# xen_build_domain(target)
+#   Allow a domain to be created at boot by the hypervisor
+define(`xen_build_domain', `
+	allow xenboot_t $1:domain create;
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
index c97c44f803..8c9cd0f297 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -173,7 +173,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
     switch ( d->domain_id )
     {
     case DOMID_IDLE:
-        dsec->sid = SECINITSID_XEN;
+        dsec->sid = SECINITSID_XENBOOT;
         break;
     case DOMID_XEN:
         dsec->sid = SECINITSID_DOMXEN;
@@ -193,9 +193,14 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
 
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
@@ -210,6 +215,8 @@ static int cf_check flask_set_system_active(void)
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


