Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC2758708D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 20:50:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379039.612314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIaUh-000391-4d; Mon, 01 Aug 2022 18:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379039.612314; Mon, 01 Aug 2022 18:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIaUh-00036P-1W; Mon, 01 Aug 2022 18:50:23 +0000
Received: by outflank-mailman (input) for mailman id 379039;
 Mon, 01 Aug 2022 18:50:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvEX=YF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oIaUf-00033M-UQ
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 18:50:22 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca68af3f-11ca-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 20:50:20 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165937978515485.11645410728738;
 Mon, 1 Aug 2022 11:49:45 -0700 (PDT)
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
X-Inumbo-ID: ca68af3f-11ca-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1659379789; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DxN0kxPhr5x3cABPIiCbkjAeSiDhcQYP4CrTPaDAzmwvFl8Zoz4gjYKMAA950oh/FcCh6XbL5eRPSDptH0pq54DjwodP7WR9t3VSTiABrkrj73wsmslqWxRDffOXjD39PtHK6gD9SX4TuilAeAG+zzPRyXCk44ygW+DQukQhujI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1659379789; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=cpjxkhtgIS46NAqzn+lFjzbvDxK+C/y4xCBDpUybEIY=; 
	b=oAlFN9QvwQShmihItl6l7W/ILxT00mZiOI8ZS+T5BnInUamzEOPuQ6T/gw7tpTsxmoMM7PmbD8lsteCEelQoByDTpGKHY7QQreCkheAzLVMxBQMbq4VxGdjXSMZeFsealE2pXenybDZJ+BXX292kM1eDHl0GApguj5R0lp8qa0k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659379789;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=cpjxkhtgIS46NAqzn+lFjzbvDxK+C/y4xCBDpUybEIY=;
	b=eoNvb2GMcL0CnT61/Znvn9gJu1zkwmdm+qeqO80Wwta5cVU017osy8NRxzrIgxek
	IU6BSfxEKDLBLhexvD/TvcVteMw0mM70goGsVmPz5Y63RV+wnBi3TJm1Nzxx1R5Nm6h
	NEVWuMRODblPfmgk2F34I6ElFMKAWhIqO7tt5ass=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jandryuk@gmail.com,
	Luca Fancellu <luca.fancellu@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v10 2/3] flask: implement xsm_set_system_active
Date: Mon,  1 Aug 2022 14:49:27 -0400
Message-Id: <20220801184928.28522-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220801184928.28522-1-dpsmith@apertussolutions.com>
References: <20220801184928.28522-1-dpsmith@apertussolutions.com>
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
Tested-by: Henry Wang <Henry.Wang@arm.com>
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


