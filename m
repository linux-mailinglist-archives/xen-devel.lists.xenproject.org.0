Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776F50BD35
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 18:35:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311092.528125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwFy-0002qI-LU; Fri, 22 Apr 2022 16:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311092.528125; Fri, 22 Apr 2022 16:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwFy-0002nV-Hr; Fri, 22 Apr 2022 16:35:42 +0000
Received: by outflank-mailman (input) for mailman id 311092;
 Fri, 22 Apr 2022 16:35:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JQBp=VA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhwFx-0001uU-Kf
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 16:35:41 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e8b4b10-c25a-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 18:35:40 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165064530941963.43325690543736;
 Fri, 22 Apr 2022 09:35:09 -0700 (PDT)
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
X-Inumbo-ID: 3e8b4b10-c25a-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1650645311; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oLqbNKpiqPiNQ5j07LT6UG3ZTC//M5oxdfEs5UvLbxSlQjl/QmPGVn7x17J7YcZ4uYwXcgnKQ3QKCTcINEtX8br2nxFETxZmwPabqaRD2FoLpANavOsFjw2tBs5Zee/sawySkdIau4Rb6NUNedlCNksXDAiLszEgcoTlgoTr21Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650645311; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dIZZxXRju0ki+6zOp/C2v1mFoGOokA/bwLqQioVO/ao=; 
	b=LNdTzGeBakQRjAxgPyWXmKoJV8W9NR7oFbczw3nyNXg8MNIR4HrC+wFVWzW62Pf4CWb2VnVM5L6mlglj9Dz9QqWc/Rdq8W6xWT/+F4X4z3DfCzVEyaM6E8eDhP02YSgBFqsFWBXhV2GU83uvOKtyk5z74CNMPmcqP87fT1CpwV8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650645311;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=dIZZxXRju0ki+6zOp/C2v1mFoGOokA/bwLqQioVO/ao=;
	b=DoZFpJylZ1DiowysRvd+6VMTpUxbM48G+WXVH6fPXb2hmGCRLqs3xfeT4qGFkY/5
	IIZ0H/zHXC76tko7sIK3c8UQev7+FoXp81Is5FqQV/8b+5SQ0hY1BDsnip8TD2mUBHf
	/VTmilRwLCwSLQKS94VgtcFckHUHeatJdnGJjliU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	jandryuk@gmail.com,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 2/2] flask: implement xsm_set_system_active
Date: Fri, 22 Apr 2022 12:34:58 -0400
Message-Id: <20220422163458.30170-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220422163458.30170-1-dpsmith@apertussolutions.com>
References: <20220422163458.30170-1-dpsmith@apertussolutions.com>
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
---
 tools/flask/policy/modules/xen.if      | 6 ++++++
 tools/flask/policy/modules/xen.te      | 1 +
 tools/flask/policy/policy/initial_sids | 1 +
 xen/xsm/flask/hooks.c                  | 8 +++++++-
 xen/xsm/flask/policy/initial_sids      | 1 +
 5 files changed, 16 insertions(+), 1 deletion(-)

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
index 8a62de2fd6..4732ca4019 100644
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
@@ -188,8 +188,12 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
 
 static int cf_check flask_set_system_active(void)
 {
+    struct domain_security_struct *dsec;
     struct domain *d = current->domain;
 
+    dsec = d->ssid;
+    ASSERT( dsec->sid == SECINITSID_XENBOOT);
+
     if ( d->domain_id != DOMID_IDLE )
     {
         printk("xsm_set_system_active should only be called by idle domain\n");
@@ -203,6 +207,8 @@ static int cf_check flask_set_system_active(void)
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


