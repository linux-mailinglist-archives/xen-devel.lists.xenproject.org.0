Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKs7OkUhl2kJvAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 15:42:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5788C15FAFB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 15:42:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236414.1539137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt5E8-00067r-Eq; Thu, 19 Feb 2026 14:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236414.1539137; Thu, 19 Feb 2026 14:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt5E8-00064k-Bv; Thu, 19 Feb 2026 14:42:00 +0000
Received: by outflank-mailman (input) for mailman id 1236414;
 Thu, 19 Feb 2026 14:41:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/wp=AX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vt5E6-00064e-Nn
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 14:41:58 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2318b972-0da1-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 15:41:56 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1771512105172179.85618630309523;
 Thu, 19 Feb 2026 06:41:45 -0800 (PST)
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
X-Inumbo-ID: 2318b972-0da1-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1771512109; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GmPpSgtzR0jw990HLRwR+n9r9u4wy9qoV+v5rZpJrOPcPBXLgXQzLnTWcib+f0SNDxExEIr8mND2FKQ8swEOxBWHocVjR+SRkYNG+XzGCAtkDwOpgSjcyoR/hHl2uFwoHOdf5FcVDSKc4k1Zf/8VdnQdS+EOn4RwYMGsIoHYECQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771512109; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kEm1nq/NUwA6BJvciL7qaSBoCWLjHLldQ4dQbjG98JM=; 
	b=D6RmEA12LVy/ekj8BI+n30etJR4AsRd526cQ4ohkSl+t0MQd7xTLfte9X+lo6b6ITKJQSq9bmL0/JrQbhkNtPLo6qs6zLC2u+jFlgYLik+1xHytS/nJwZKAy2t1aQBQBoJe/dESBosQywqiwEYY5WxomtTibD8ciC8UuCr3CFHM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771512109;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=kEm1nq/NUwA6BJvciL7qaSBoCWLjHLldQ4dQbjG98JM=;
	b=Pxfyp7ab3aTY+emXhJgAC8CO/NzZvEZR/n7vYXGhi3Qk3u2S0TYEXAM/TeQQPSKK
	w9Ke/LsyWWpa52td4Svey23ilpsZbz5f4OjlSa2ee3Pd16arCb90l20EltIBdLYprD+
	gAez8u92bh2uuVRFX7y0xGdbg+O0/AMFX80X/ynQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Chris Rogers <rogersc@ainfosec.com>,
	Dmytro Firsov <dmytro_firsov@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [BUG v3] common/domctl: xsm update for get_domain_state access
Date: Thu, 19 Feb 2026 09:37:07 -0500
Message-Id: <20260219143707.1588-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[apertussolutions.com];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,apertussolutions.com:mid,apertussolutions.com:dkim,apertussolutions.com:email,ainfosec.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5788C15FAFB
X-Rspamd-Action: no action

When using XSM Flask, passing DOMID_INVALID will result in a NULL pointer
reference from the passing of NULL as the target domain to
xsm_get_domain_state(). Simply not invoking xsm_get_domain_state() when the
target domain is NULL opens the opportunity to circumvent the XSM
get_domain_state access check. This is due to the fact that the call to
xsm_domctl() for get_domain_state op is a no-op check, deferring to
xsm_get_domain_state().

Modify the helper get_domain_state() to ensure the requesting domain has
get_domain_state access for the target domain, whether the target domain is
explicitly set or implicitly determined with a domain state search. In the case
of access not being allowed for a domain found during an implicit search, the
search will continue to the next domain whose state has changed.

Fixes: 3ad3df1bd0aa ("xen: add new domctl get_domain_state")
Reported-by: Chris Rogers <rogersc@ainfosec.com>
Reported-by: Dmytro Firsov <dmytro_firsov@epam.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes in v3:
- collapse if statements
- dropped unnecessary NULL
- use true for copyback

Changes in v2:
- fix commit message
- init dom as -1
- rework loop logic to use test_and_clear_bit()
---
 xen/common/domain.c | 37 ++++++++++++++++++++++---------------
 xen/common/domctl.c |  7 ++-----
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index de6fdf59236e..73d6c72d9709 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -210,7 +210,7 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
 int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
                      domid_t *domid)
 {
-    unsigned int dom;
+    unsigned int dom = -1;
     int rc = -ENOENT;
     struct domain *hdl;
 
@@ -219,6 +219,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
 
     if ( d )
     {
+        rc = xsm_get_domain_state(XSM_XS_PRIV, d);
+        if ( rc )
+            return rc;
+
         set_domain_state_info(info, d);
 
         return 0;
@@ -238,28 +242,31 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
 
     while ( dom_state_changed )
     {
-        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
+        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom + 1);
         if ( dom >= DOMID_FIRST_RESERVED )
             break;
-        if ( test_and_clear_bit(dom, dom_state_changed) )
-        {
-            *domid = dom;
-
-            d = rcu_lock_domain_by_id(dom);
 
+        d = rcu_lock_domain_by_id(dom);
+        if ( (d && xsm_get_domain_state(XSM_XS_PRIV, d)) ||
+             !test_and_clear_bit(dom, dom_state_changed) )
+        {
             if ( d )
-            {
-                set_domain_state_info(info, d);
-
                 rcu_unlock_domain(d);
-            }
-            else
-                memset(info, 0, sizeof(*info));
+            continue;
+        }
 
-            rc = 0;
+        *domid = dom;
 
-            break;
+        if ( d )
+        {
+            set_domain_state_info(info, d);
+            rcu_unlock_domain(d);
         }
+        else
+            memset(info, 0, sizeof(*info));
+
+        rc = 0;
+        break;
     }
 
  out:
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 29a7726d32d0..93738931c575 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -860,12 +860,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
 
     case XEN_DOMCTL_get_domain_state:
-        ret = xsm_get_domain_state(XSM_XS_PRIV, d);
-        if ( ret )
-            break;
-
-        copyback = 1;
         ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
+        if ( !ret )
+            copyback = true;
         break;
 
     default:
-- 
2.39.5


