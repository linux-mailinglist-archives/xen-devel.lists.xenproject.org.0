Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAIUKCdfoGmMiwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:56:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F7A1A814B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:56:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241996.1542791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcms-00019N-8g; Thu, 26 Feb 2026 14:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241996.1542791; Thu, 26 Feb 2026 14:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcms-00016t-5j; Thu, 26 Feb 2026 14:56:22 +0000
Received: by outflank-mailman (input) for mailman id 1241996;
 Thu, 26 Feb 2026 14:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvcmr-00016l-7L
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 14:56:21 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e208433-1323-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 15:56:18 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id C29404290134;
 Thu, 26 Feb 2026 09:55:57 -0500 (EST)
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
X-Inumbo-ID: 4e208433-1323-11f1-b164-2bf370ae4941
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 06/10] xsm/flask: Add XEN_DOMCTL_claim_memory to flask
Date: Thu, 26 Feb 2026 14:29:20 +0000
Message-Id: <8e5680575f37ce67a81a4c712e5409ccb3f6f612.1772098423.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1772098423.git.bernhard.kaindl@citrix.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:dpsmith@apertussolutions.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.986];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:email];
	RCVD_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 37F7A1A814B
X-Rspamd-Action: no action

Add a Flask security policy for the new XEN_DOMCTL_claim_memory hypercall
introduced in the previous commit. When Flask is enabled, this permission
controls whether a domain can stake memory claims for another domain.

The permission is granted to:
- dom0_t: Dom0 needs this to claim memory for guest domains
- create_domain_common: Domain builders need this during domain creation

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/flask/policy/modules/dom0.te  | 1 +
 tools/flask/policy/modules/xen.if   | 1 +
 xen/xsm/flask/hooks.c               | 3 +++
 xen/xsm/flask/policy/access_vectors | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index d30edf8be1fb..f5c330d01cec 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -103,6 +103,7 @@ allow dom0_t dom0_t:domain2 {
 	get_cpu_policy
 	dt_overlay
 	get_domain_state
+	claim_memory
 };
 allow dom0_t dom0_t:resource {
 	add
diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index ef7d8f438c65..8e2dceb505cd 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -98,6 +98,7 @@ define(`create_domain_common', `
 		vuart_op
 		set_llc_colors
 		get_domain_state
+		claim_memory
 	};
 	allow $1 $2:security check_context;
 	allow $1 $2:shadow enable;
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b250b2706535..0cc04ada82a9 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -820,6 +820,9 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     case XEN_DOMCTL_set_llc_colors:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SET_LLC_COLORS);
 
+    case XEN_DOMCTL_claim_memory:
+        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__CLAIM_MEMORY);
+
     default:
         return avc_unknown_permission("domctl", cmd);
     }
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index ce907d50a45e..2c9337f7a145 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -255,6 +255,8 @@ class domain2
     set_llc_colors
 # XEN_DOMCTL_get_domain_state
     get_domain_state
+# XEN_DOMCTL_claim_memory
+    claim_memory
 }
 
 # Similar to class domain, but primarily contains domctls related to HVM domains
-- 
2.39.5


