Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOqpNaYPlmkXZgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 20:14:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 802C9158F5E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 20:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235944.1538754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsmzd-0006Kk-Lm; Wed, 18 Feb 2026 19:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235944.1538754; Wed, 18 Feb 2026 19:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsmzd-0006Hn-Iy; Wed, 18 Feb 2026 19:13:49 +0000
Received: by outflank-mailman (input) for mailman id 1235944;
 Wed, 18 Feb 2026 19:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfGN=AW=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vsmzc-0006Ha-LH
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 19:13:48 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f18b903b-0cfd-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 20:13:45 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1771442013028766.098741949677;
 Wed, 18 Feb 2026 11:13:33 -0800 (PST)
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
X-Inumbo-ID: f18b903b-0cfd-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1771442015; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ge3gzbpeAUp+XtLApcWZpNBAZv0oLMDjCtHZgiiavFdmAlLGOEJ2cOngiFQMpvZTp8TVyEdm4FKKs8clWfZDGiMLV25gynnAHM3w7//FJUy1sBVvMGK3auguKGjhpQTvKgZa/qUhJfDNCxlQIZ5PaHKic2w4SSC/YMv0frt04TQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771442015; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=co65X2ipz281/zfrv1FcGAsrzzR3sJZcw4PMaqb9Nn0=; 
	b=g5qtz8xPoA22JrKZoTokwN3CYmdcsMk8E4Dd7Fxbd50b6EgLf6G5JtQbMhs+QrGT0EflNLV6IEALLAw/nSqrGVdRIZjCyiP1DfaO6qwmZLHNO6DpEi0sj1QekpI08MU+iJBWPkh7mWLeYHs1fzp9y3mmBF0eETFyLp6tA7JZnyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771442015;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=co65X2ipz281/zfrv1FcGAsrzzR3sJZcw4PMaqb9Nn0=;
	b=gdxwCTZGZ6LJB3GJ0eTXlLhoMznXnsUYrbRbKl7V8U2U88fkXvImFYMoPdpXqyXN
	i6/0mv0ToNjpLc0nGmTVSEnhLZtz9Jm9aJjQ29A37kKJwcw4EBP3ZrK/TRptLPVumCF
	hB1lsBy38rJtcb9kji6d6wDpe7yBp77IxeZ4qEI4=
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
Subject: [BUG v2] common/domctl: xsm update for get_domain_state access
Date: Wed, 18 Feb 2026 14:08:55 -0500
Message-Id: <20260218190855.7272-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,apertussolutions.com:mid,apertussolutions.com:dkim,apertussolutions.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 802C9158F5E
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
Changes in v2:
- fix commit message
- init dom as -1
- rework loop logic to use test_and_clear_bit()
---
 xen/common/domain.c | 27 +++++++++++++++++++++------
 xen/common/domctl.c |  7 ++-----
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index de6fdf59236e..2ffec331a8d1 100644
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
@@ -238,28 +242,39 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
 
     while ( dom_state_changed )
     {
-        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
+        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom + 1);
         if ( dom >= DOMID_FIRST_RESERVED )
             break;
+
+        d = rcu_lock_domain_by_id(dom);
+        if ( d && xsm_get_domain_state(XSM_XS_PRIV, d) )
+        {
+            rcu_unlock_domain(d);
+            d = NULL;
+            continue;
+        }
+
         if ( test_and_clear_bit(dom, dom_state_changed) )
         {
             *domid = dom;
 
-            d = rcu_lock_domain_by_id(dom);
-
             if ( d )
             {
                 set_domain_state_info(info, d);
-
                 rcu_unlock_domain(d);
             }
             else
                 memset(info, 0, sizeof(*info));
 
             rc = 0;
-
             break;
         }
+
+        if ( d )
+        {
+            rcu_unlock_domain(d);
+            d = NULL;
+        }
     }
 
  out:
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 29a7726d32d0..2eedc639c72a 100644
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
+            copyback = 1;
         break;
 
     default:
-- 
2.39.5


