Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJpyML7vu2m1qQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:44:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 302752CB4EB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:44:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257066.1551508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Cjk-0004us-Q8; Thu, 19 Mar 2026 12:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257066.1551508; Thu, 19 Mar 2026 12:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Cjk-0004sc-N8; Thu, 19 Mar 2026 12:44:28 +0000
Received: by outflank-mailman (input) for mailman id 1257066;
 Thu, 19 Mar 2026 12:44:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1n9k=BT=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1w3Cjj-0004rk-4c
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 12:44:27 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c7827b8-2391-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 13:44:25 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-66873d8cc9dso531435a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 05:44:25 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.82]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b97f173a3ccsm427458766b.59.2026.03.19.05.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 05:44:24 -0700 (PDT)
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
X-Inumbo-ID: 5c7827b8-2391-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773924265; x=1774529065; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1x/q7Pzqhcox5qVHHVmOplx8xc0kpk20cjnS3zV1gJ8=;
        b=nFhn9nFCIeHQuAFnMpQlnFXYmqv1KeLv60aa+kbzzbI6bMNXQJ+pDDddJSgEpFrdEe
         cAouMUg0VZYsJnr2k2kdHC7+BWxn2rwd+01w96TeA259x2gIhWPuPiJRS62qTS3UQZc2
         AYgXX7CkzWU4G9bwmi1OVlAieODYLzuTYuJAitktVdxt7drapADNGJh5+n+l9M9a/MIW
         WE7HURhe3s7hm52A2xVMpX0mmO7QCmCGu/xI9HbI3gyw2hAxJ1rw7dqdDUvnI82mwMs0
         y2IGEwP7ZnJO5JU5GjXcB0NeGSBY16dsmJJk/UoukBm6YW83IZIPiFaV2812fEyq+fyu
         9BlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924265; x=1774529065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1x/q7Pzqhcox5qVHHVmOplx8xc0kpk20cjnS3zV1gJ8=;
        b=UAPTyB2lwgUF8wMeHA67IUxMkEv8yjL/1oPnlDNG1O5pvO+APu4wz3SBsJywkDPBCf
         WQkgOaaPnecZnN5+csciNy8YqyTczDU5sZ2CMNRy/lAhflUi50fVCQY6XhqrTPnuFk1F
         s2pKdUkrOCXoR5MrLPhE9TJKSim3zLK2trPuoLncNLihOyA1bZPRYE+LwivPX1My5kLt
         j1HGyP8PIVWUtvi3pQSAnsl/Fd1u6bp8C+nIQ+ydSVMZcPeO1aWtce1ipDdOwgDKkl4D
         hCO36RWqQSz1bPEgHEB1D5itILKemIhjji72cW3XKseAai4A1InAyRP9/8fvFJG5u4yK
         HSVQ==
X-Gm-Message-State: AOJu0Yym4X40VqaN4ZLYf7ShdRuiDbfgPxcTcybnrwO3s3pWKc4qovJn
	f9xrDqZ2i9Mm8uUCotHRH8oBh1ucM5EenM7aX85Hwl1CDRwLXmWkYshWqDKLsQ==
X-Gm-Gg: ATEYQzyP2fGKrcoVZDCkyBoV7rp3XzG3sGCzXY748+y9rzDTnBNnuokipmqxI0oCFpR
	xyeOi1MjESJYmep/IHaoZ7GAz699WJkOkFtzz794D2UUrtuX0iOTqlEWIKQBNGRXE5eNr0Jre9o
	wQnW/LT4e6wSg0pRUJyuGl4kormLXJoeQRv5DQzLWSoikHarfQLoz9oCksmf3SGhGNUOWJoeur6
	O4JxldYhvxp94mAD3CN1i1fLgi9sD7apMhoa07b0bpLdYve51LHBIcPe60+CVdZvJpPP9NxGnAa
	IAHedf/yFiGEWzUjq8UjUAQohZoR4g2agGjEeQ9F8JHCzU9eE5h/bix3fnj0epOmhkDjiPLBPi1
	pwo09GKr089gDE5oDr4EZVZmu6VWwIJhwggcYtsJkKBWnCVtWhs9Y4kjFdhYw9UzOv6CRhIAnap
	lWCtqjaGvdkbSifQXrFRNth9KqMg==
X-Received: by 2002:a17:907:3e83:b0:b97:1d24:bfed with SMTP id a640c23a62f3a-b97f4ab766emr468172166b.41.1773924264359;
        Thu, 19 Mar 2026 05:44:24 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [RFC PATCH] xen: handle domain_shutdown() return values
Date: Thu, 19 Mar 2026 14:42:13 +0200
Message-ID: <95dacecdce8f8417562548e16a4d3e11c41a3f27.1773923242.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,patchew.org:url];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 302752CB4EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

Propagate domain_shutdown() return codes through the shutdown paths
which can still report errors to their callers, and log explicit
failures in fire-and-forget paths instead of silently discarding the
result.

This makes the shutdown contract explicit for callers which can report
errors, while preserving observable diagnostics for the remaining
fire-and-forget paths.

It also fixes MISRA Dir 4.7 and Rule 17.7 violations by ensuring that
the returned status is tested or otherwise used.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Link to discussion: https://patchew.org/Xen/cover.1748848482.git.mykola._5Fkvach@epam.com/7bd75ecfff5b0a75ea5abd7cc4934582d7e1250c.1748848482.git.mykola._5Fkvach@epam.com/#90048f71-8313-4110-924c-f956a2bec5a0@suse.com
---
 xen/arch/arm/vpsci.c    | 10 ++++++++--
 xen/arch/x86/compat.c   |  3 +--
 xen/arch/x86/hvm/dm.c   |  3 +--
 xen/arch/x86/hvm/hvm.c  | 13 +++++++++++--
 xen/common/domain.c     |  9 +++++++--
 xen/common/sched/core.c |  9 +++++++--
 6 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 7ba9ccd94b..03b4cb0986 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -188,13 +188,19 @@ static int32_t do_psci_0_2_migrate_info_type(void)
 static void do_psci_0_2_system_off( void )
 {
     struct domain *d = current->domain;
-    domain_shutdown(d,SHUTDOWN_poweroff);
+    int rc = domain_shutdown(d, SHUTDOWN_poweroff);
+
+    if ( unlikely(rc) )
+        gprintk(XENLOG_ERR, "PSCI SYSTEM_OFF failed: rc=%d\n", rc);
 }
 
 static void do_psci_0_2_system_reset(void)
 {
     struct domain *d = current->domain;
-    domain_shutdown(d,SHUTDOWN_reboot);
+    int rc = domain_shutdown(d, SHUTDOWN_reboot);
+
+    if ( unlikely(rc) )
+        gprintk(XENLOG_ERR, "PSCI SYSTEM_RESET failed: rc=%d\n", rc);
 }
 
 static int32_t do_psci_1_0_features(uint32_t psci_func_id)
diff --git a/xen/arch/x86/compat.c b/xen/arch/x86/compat.c
index 217b5b1fcc..1c203a028f 100644
--- a/xen/arch/x86/compat.c
+++ b/xen/arch/x86/compat.c
@@ -39,8 +39,7 @@ long do_sched_op_compat(int cmd, unsigned long arg)
     case SCHEDOP_shutdown:
         TRACE_TIME(TRC_SCHED_SHUTDOWN,
                    current->domain->domain_id, current->vcpu_id, arg);
-        domain_shutdown(current->domain, (u8)arg);
-        break;
+        return domain_shutdown(current->domain, (u8)arg);
 
     default:
         return -ENOSYS;
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 3b53471af0..e32338efae 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -545,8 +545,7 @@ int dm_op(const struct dmop_args *op_args)
         const struct xen_dm_op_remote_shutdown *data =
             &op.u.remote_shutdown;
 
-        domain_shutdown(d, data->reason);
-        rc = 0;
+        rc = domain_shutdown(d, data->reason);
         break;
     }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57..d3e5dcc30f 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1728,8 +1728,13 @@ void hvm_vcpu_down(struct vcpu *v)
     /* ... Shut down the domain if not. */
     if ( online_count == 0 )
     {
+        int rc;
+
         gdprintk(XENLOG_INFO, "All CPUs offline -- powering off.\n");
-        domain_shutdown(d, SHUTDOWN_poweroff);
+
+        rc = domain_shutdown(d, SHUTDOWN_poweroff);
+        if ( unlikely(rc) )
+            gdprintk(XENLOG_ERR, "Failed to power off: rc=%d\n", rc);
     }
 }
 
@@ -1758,12 +1763,16 @@ void hvm_triple_fault(void)
     struct vcpu *v = current;
     struct domain *d = v->domain;
     u8 reason = d->arch.hvm.params[HVM_PARAM_TRIPLE_FAULT_REASON];
+    int rc;
 
     gprintk(XENLOG_ERR,
             "Triple fault - invoking HVM shutdown action %d\n",
             reason);
     vcpu_show_execution_state(v);
-    domain_shutdown(d, reason);
+    rc = domain_shutdown(d, reason);
+    if ( unlikely(rc) )
+        gprintk(XENLOG_ERR,
+                "Failed to shut down after triple fault: rc=%d\n", rc);
 }
 
 void hvm_inject_event(const struct x86_event *event)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index ab910fcf93..13198bcca5 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1355,6 +1355,8 @@ int domain_kill(struct domain *d)
 
 void __domain_crash(struct domain *d)
 {
+    int rc;
+
     if ( d->is_shutting_down )
     {
         /* Print nothing: the domain is already shutting down. */
@@ -1371,7 +1373,10 @@ void __domain_crash(struct domain *d)
                d->domain_id, current->domain->domain_id, smp_processor_id());
     }
 
-    domain_shutdown(d, SHUTDOWN_crash);
+    rc = domain_shutdown(d, SHUTDOWN_crash);
+    if ( unlikely(rc) )
+        printk(XENLOG_ERR
+               "Failed to shut down crashed domain %pd: rc=%d\n", d, rc);
 }
 
 
@@ -2194,7 +2199,7 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
 
         if ( !rc ) /* Last vcpu going down? */
         {
-            domain_shutdown(d, SHUTDOWN_poweroff);
+            rc = domain_shutdown(d, SHUTDOWN_poweroff);
             break;
         }
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index a57d5dd929..6df631d925 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1537,6 +1537,7 @@ static void cf_check domain_watchdog_timeout(void *data)
      */
     struct domain *d = _p((unsigned long)data & PAGE_MASK);
     unsigned int id = (unsigned long)data & ~PAGE_MASK;
+    int rc;
 
     BUILD_BUG_ON(alignof(*d) < PAGE_SIZE);
 
@@ -1544,7 +1545,11 @@ static void cf_check domain_watchdog_timeout(void *data)
         return;
 
     printk("Watchdog timer %u fired for %pd\n", id, d);
-    domain_shutdown(d, SHUTDOWN_watchdog);
+
+    rc = domain_shutdown(d, SHUTDOWN_watchdog);
+    if ( unlikely(rc) )
+        printk(XENLOG_ERR
+               "Failed to shut down %pd after watchdog expiry: rc=%d\n", d, rc);
 }
 
 static long domain_watchdog(struct domain *d, uint32_t id, uint32_t timeout)
@@ -1977,7 +1982,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
         ret = xsm_schedop_shutdown(XSM_DM_PRIV, current->domain, d);
         if ( likely(!ret) )
-            domain_shutdown(d, sched_remote_shutdown.reason);
+            ret = domain_shutdown(d, sched_remote_shutdown.reason);
 
         rcu_unlock_domain(d);
 
-- 
2.43.0


