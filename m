Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLhvNKFbl2lFxQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 19:51:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369C8161C9B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 19:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236668.1539285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt96D-0002mF-CO; Thu, 19 Feb 2026 18:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236668.1539285; Thu, 19 Feb 2026 18:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt96D-0002kL-9c; Thu, 19 Feb 2026 18:50:05 +0000
Received: by outflank-mailman (input) for mailman id 1236668;
 Thu, 19 Feb 2026 18:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/wp=AX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vt96C-0002U1-2I
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 18:50:04 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb1211ad-0dc3-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 19:50:01 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1771526981000758.3994514741934;
 Thu, 19 Feb 2026 10:49:41 -0800 (PST)
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
X-Inumbo-ID: cb1211ad-0dc3-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1771526985; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T28865CASPrTt1LdptX8bwjVHOjUx7GzRf5bewXEHreiFb+3s1H/wzCUoBlCHWj8kDW2IAdI3Fmvt5FaUCgeXGK1mHN1xmTlLT2l0f5RECh1G84QMDydr9GtuzHJf7bkvk0MMi5xflJXQcGFhNOIw2xl5BRVzsxwwLY/jW/wgvA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771526985; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VHY/T0wopJAWiL3NdiLTaFQP/Ul375gxAfFHesT4wrQ=; 
	b=Qtv06B1ruySR2PJPiKFWiMlIp3InRHij5dDrolhr01ZiOebWPbHQUw5zqsdAmgQzf4K96/kSJLpZ90kNt6IyQqx41CAxnAEAZUYkB/XAK5w7glFrnFqlfFw0X74afKnSfweOYw8dIK9IPch9VzZJ4VJBRQ8tIArEF0rEOHVVFzc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771526985;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=VHY/T0wopJAWiL3NdiLTaFQP/Ul375gxAfFHesT4wrQ=;
	b=d8GMGpI9Y5a8t5/02gSNmGgq+1yfCmepExlAPW5oYFogmgpguLef9Ayh5mCdsi7q
	SDOHHUrXa8nxOQa/l6ggieI1p0hPx4lGkR2b6BSRo3npX8oXtrRDY9O5J9jL3yDL6yW
	1myykh9hD3e3lGbyQxD9F36aQINf2BzR07YwcRHo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xsm: move the console read properly under xsm
Date: Thu, 19 Feb 2026 13:45:03 -0500
Message-Id: <20260219184503.21918-1-dpsmith@apertussolutions.com>
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apertussolutions.com:mid,apertussolutions.com:dkim,apertussolutions.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 369C8161C9B
X-Rspamd-Action: no action

The access control for domU to read the console should be controlled via XSM.
By moving it under XSM, FLASK will now be able to work correctly with the domU
console read capability that was introduced recently.

To enable console read under XSM, the legacy is_console field in struct domain
was collapsed with the new input_allowed field in struct domain_console. Having
two fields over console was redundant. By merging them together under the
permissions field in struct domain_console, this allows better alignment with
the existing fine grained access controls under FLASK.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/arm/vpl011.c                   |  2 +-
 xen/arch/x86/pv/shim.c                  |  2 +-
 xen/common/device-tree/dom0less-build.c |  2 +-
 xen/common/domain.c                     |  1 -
 xen/drivers/char/console.c              |  4 ++--
 xen/include/xen/sched.h                 |  8 ++++----
 xen/include/xsm/dummy.h                 | 17 ++++++++++++-----
 7 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index d0d17c76b72c..1461c27afed0 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -713,7 +713,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     }
     else
     {
-        d->console->input_allowed = true;
+        d->console->permissions = DOMAIN_CONSOLE_READ;
         vpl011->backend_in_domain = false;
 
         vpl011->backend.xen = xzalloc(struct vpl011_xen_backend);
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index bd29c53a2d34..03990dfc0e01 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -239,7 +239,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
      */
     d->max_pages = domain_tot_pages(d);
 
-    d->console->input_allowed = true;
+    d->console->permissions = DOMAIN_CONSOLE_READ;
 }
 
 static void write_start_info(struct domain *d)
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 840d14419da2..d144720fe195 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -871,7 +871,7 @@ void __init create_domUs(void)
                   dt_node_name(node), rc);
 #endif /* CONFIG_HAS_LLC_COLORING */
 
-        ki.bd.d->is_console = true;
+        ki.bd.d->console->permissions = DOMAIN_CONSOLE_WRITE;
         dt_device_set_used_by(node, ki.bd.d->domain_id);
 
         rc = construct_domU(&ki, node);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 2e46207d2db0..331c048e2f72 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -999,7 +999,6 @@ struct domain *domain_create(domid_t domid,
         goto fail;
 
     spin_lock_init(&d->console->lock);
-    d->console->input_allowed = is_hardware_domain(d);
 
     /*
      * This assertion helps static analysis tools infer that config cannot be
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index bcd6d261491b..909e0fdb8c08 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -554,7 +554,7 @@ struct domain *console_get_domain(void)
     if ( !d )
         return NULL;
 
-    if ( d->console->input_allowed )
+    if ( !xsm_console_io(XSM_OTHER, d, CONSOLEIO_read) )
         return d;
 
     rcu_unlock_domain(d);
@@ -595,7 +595,7 @@ static void console_switch_input(void)
         d = rcu_lock_domain_by_id(domid);
         if ( d )
         {
-            if ( !d->console->input_allowed )
+            if ( xsm_console_io(XSM_OTHER, d, CONSOLEIO_read) )
             {
                 rcu_unlock_domain(d);
                 continue;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 40a35fc15c65..3713664aaea5 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -377,8 +377,10 @@ struct evtchn_port_ops;
 
 /* Domain console settings. */
 struct domain_console {
-    /* Permission to take ownership of the physical console input. */
-    bool input_allowed;
+    /* XSM: permission to use HYPERCALL_console_io hypercall */
+#define DOMAIN_CONSOLE_READ  (1u << 0)
+#define DOMAIN_CONSOLE_WRITE (1u << 1)
+    unsigned int permissions;
 
     /* hvm_print_line() and guest_console_write() logging. */
     unsigned int idx;
@@ -528,8 +530,6 @@ struct domain
     bool             auto_node_affinity;
     /* Is this guest fully privileged (aka dom0)? */
     bool             is_privileged;
-    /* XSM: permission to use HYPERCALL_console_io hypercall */
-    bool             is_console;
     /* Is this guest being debugged by dom0? */
     bool             debugger_attached;
     /*
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index b8fd7aeedd9e..129823b8d37b 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -269,12 +269,19 @@ static XSM_INLINE int cf_check xsm_console_io(
     XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
-    if ( d->is_console )
-        return xsm_default_action(XSM_HOOK, d, NULL);
-#ifdef CONFIG_VERBOSE_DEBUG
-    if ( cmd == CONSOLEIO_write )
-        return xsm_default_action(XSM_HOOK, d, NULL);
+    switch ( cmd )
+    {
+    case CONSOLEIO_read:
+        if ( d->console->permissions & DOMAIN_CONSOLE_READ )
+            return xsm_default_action(XSM_HOOK, d, NULL);
+        break;
+    case CONSOLEIO_write:
+#ifndef CONFIG_VERBOSE_DEBUG
+        if ( d->console->permissions & DOMAIN_CONSOLE_WRITE )
 #endif
+		return xsm_default_action(XSM_HOOK, d, NULL);
+        break;
+    }
     return xsm_default_action(XSM_PRIV, d, NULL);
 }
 
-- 
2.39.5


