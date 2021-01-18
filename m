Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26FA2FA41A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:07:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69709.124922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1W7H-0008F0-Tb; Mon, 18 Jan 2021 15:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69709.124922; Mon, 18 Jan 2021 15:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1W7H-0008Eb-Q3; Mon, 18 Jan 2021 15:06:51 +0000
Received: by outflank-mailman (input) for mailman id 69709;
 Mon, 18 Jan 2021 15:06:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1W7G-0008EW-Bc
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:06:50 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0750fda4-e6a9-49d3-a5e0-d01164f5b5ba;
 Mon, 18 Jan 2021 15:06:48 +0000 (UTC)
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
X-Inumbo-ID: 0750fda4-e6a9-49d3-a5e0-d01164f5b5ba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610982408;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WP0gkpgHQiFEJhGJMd905VW2FcOqMrv/bUHBdxt3Dik=;
  b=XG9/D/yEs3x+sHgrg03VUL5g9D0w9e1VZpY0MRBH2P0eiIZPgl1JzSve
   lMczw21GYSiAXoBYQS1MKiWRfIEM32nR2oBsFzaSY1QruHAblfRuNi8Ek
   YPDorqVrKYSOgY+s8af5CyHMW1rvF5jybu9yFmUkThPq53uRu7QVKL6ZR
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8E4wbJcZuEnnsj498DnFXbsRX6eYOTcj0F082nE5VIXjJ8h+OMkrCu/Klhh8qIkzXpP99xv4D6
 vKg02h2y9lcAGvhF4CiyTMaNq3EqpL4rcIABg1gtDSSmzIiRZacKmqieOSOd0rgETn4zE0zE3v
 yuZ/2Acv0kczgOEGRpqPy4JWYcS9PME+RQFP37MCl0cd12mojaWO1Z8bpBaGx9mQ/FKc9oS29g
 dXLwUCbBn/eWhQv/TNe+DTP15p3bYSpeaXCuxtQ6GubQUpdEAKNeSTd1S8gUs17U5CY6iL3BE0
 tCs=
X-SBRS: 5.1
X-MesageID: 36602525
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="36602525"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] xen/xsm: Improve alloc/free of evtchn buckets
Date: Mon, 18 Jan 2021 15:06:23 +0000
Message-ID: <20210118150623.29550-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently, flask_alloc_security_evtchn() is called in loops of
64 (EVTCHNS_PER_BUCKET), which for non-dummy implementations is a function
pointer call even in the no-op case.  The non no-op case only sets a single
constant, and doesn't actually fail.

Spectre v2 protections has made function pointer calls far more expensive, and
64 back-to-back calls is a waste.  Rework the APIs to pass the size of the
bucket instead, and call them once.

No practical change, but {alloc,free}_evtchn_bucket() should be rather more
efficient now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Spotted while fixing up evtchn to use fault-ttl semantics for testing the
error handling logic.
---
 xen/common/event_channel.c | 36 ++++++++++++++++--------------------
 xen/include/xsm/dummy.h    |  4 ++--
 xen/include/xsm/xsm.h      | 12 ++++++------
 xen/xsm/dummy.c            |  4 ++--
 xen/xsm/flask/hooks.c      | 20 +++++++++++++-------
 5 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index d590ddad99..2d84da2186 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -147,6 +147,14 @@ static bool virq_is_global(unsigned int virq)
     return true;
 }
 
+static void free_evtchn_bucket(struct domain *d, struct evtchn *bucket)
+{
+    if ( !bucket )
+        return;
+
+    xsm_free_security_evtchns(bucket, EVTCHNS_PER_BUCKET);
+    xfree(bucket);
+}
 
 static struct evtchn *alloc_evtchn_bucket(struct domain *d, unsigned int port)
 {
@@ -155,34 +163,22 @@ static struct evtchn *alloc_evtchn_bucket(struct domain *d, unsigned int port)
 
     chn = xzalloc_array(struct evtchn, EVTCHNS_PER_BUCKET);
     if ( !chn )
-        return NULL;
+        goto err;
+
+    if ( xsm_alloc_security_evtchns(chn, EVTCHNS_PER_BUCKET) )
+        goto err;
 
     for ( i = 0; i < EVTCHNS_PER_BUCKET; i++ )
     {
-        if ( xsm_alloc_security_evtchn(&chn[i]) )
-        {
-            while ( i-- )
-                xsm_free_security_evtchn(&chn[i]);
-            xfree(chn);
-            return NULL;
-        }
         chn[i].port = port + i;
         rwlock_init(&chn[i].lock);
     }
-    return chn;
-}
-
-static void free_evtchn_bucket(struct domain *d, struct evtchn *bucket)
-{
-    unsigned int i;
 
-    if ( !bucket )
-        return;
-
-    for ( i = 0; i < EVTCHNS_PER_BUCKET; i++ )
-        xsm_free_security_evtchn(bucket + i);
+    return chn;
 
-    xfree(bucket);
+ err:
+    free_evtchn_bucket(d, chn);
+    return NULL;
 }
 
 int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index fa40e880ba..b215429581 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -309,12 +309,12 @@ static XSM_INLINE int xsm_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1, struct
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_alloc_security_evtchn(struct evtchn *chn)
+static XSM_INLINE int xsm_alloc_security_evtchns(struct evtchn *chn, unsigned int nr)
 {
     return 0;
 }
 
-static XSM_INLINE void xsm_free_security_evtchn(struct evtchn *chn)
+static XSM_INLINE void xsm_free_security_evtchns(struct evtchn *chn, unsigned int nr)
 {
     return;
 }
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 7bd03d8817..aaa3f60d9e 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -72,8 +72,8 @@ struct xsm_operations {
 
     int (*alloc_security_domain) (struct domain *d);
     void (*free_security_domain) (struct domain *d);
-    int (*alloc_security_evtchn) (struct evtchn *chn);
-    void (*free_security_evtchn) (struct evtchn *chn);
+    int (*alloc_security_evtchns) (struct evtchn *chn, unsigned int nr);
+    void (*free_security_evtchns) (struct evtchn *chn, unsigned int nr);
     char *(*show_security_evtchn) (struct domain *d, const struct evtchn *chn);
     int (*init_hardware_domain) (struct domain *d);
 
@@ -314,14 +314,14 @@ static inline void xsm_free_security_domain (struct domain *d)
     xsm_ops->free_security_domain(d);
 }
 
-static inline int xsm_alloc_security_evtchn (struct evtchn *chn)
+static inline int xsm_alloc_security_evtchns(struct evtchn *chn, unsigned int nr)
 {
-    return xsm_ops->alloc_security_evtchn(chn);
+    return xsm_ops->alloc_security_evtchns(chn, nr);
 }
 
-static inline void xsm_free_security_evtchn (struct evtchn *chn)
+static inline void xsm_free_security_evtchns(struct evtchn *chn, unsigned int nr)
 {
-    (void)xsm_ops->free_security_evtchn(chn);
+    xsm_ops->free_security_evtchns(chn, nr);
 }
 
 static inline char *xsm_show_security_evtchn (struct domain *d, const struct evtchn *chn)
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 9e09512144..715aa1bcb5 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -49,8 +49,8 @@ void __init xsm_fixup_ops (struct xsm_operations *ops)
 
     set_to_dummy_if_null(ops, alloc_security_domain);
     set_to_dummy_if_null(ops, free_security_domain);
-    set_to_dummy_if_null(ops, alloc_security_evtchn);
-    set_to_dummy_if_null(ops, free_security_evtchn);
+    set_to_dummy_if_null(ops, alloc_security_evtchns);
+    set_to_dummy_if_null(ops, free_security_evtchns);
     set_to_dummy_if_null(ops, show_security_evtchn);
     set_to_dummy_if_null(ops, init_hardware_domain);
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 19b0d9e3eb..562754f3b4 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -307,19 +307,25 @@ static int flask_evtchn_reset(struct domain *d1, struct domain *d2)
     return domain_has_perm(d1, d2, SECCLASS_EVENT, EVENT__RESET);
 }
 
-static int flask_alloc_security_evtchn(struct evtchn *chn)
+static int flask_alloc_security_evtchns(struct evtchn *chn, unsigned int nr)
 {
-    chn->ssid.flask_sid = SECINITSID_UNLABELED;
+    unsigned int i;
+
+    for ( i = 0; i < nr; ++i )
+        chn[i].ssid.flask_sid = SECINITSID_UNLABELED;
 
-    return 0;    
+    return 0;
 }
 
-static void flask_free_security_evtchn(struct evtchn *chn)
+static void flask_free_security_evtchns(struct evtchn *chn, unsigned int nr)
 {
+    unsigned int i;
+
     if ( !chn )
         return;
 
-    chn->ssid.flask_sid = SECINITSID_UNLABELED;
+    for ( i = 0; i < nr; ++i )
+        chn[i].ssid.flask_sid = SECINITSID_UNLABELED;
 }
 
 static char *flask_show_security_evtchn(struct domain *d, const struct evtchn *chn)
@@ -1766,8 +1772,8 @@ static struct xsm_operations flask_ops = {
 
     .alloc_security_domain = flask_domain_alloc_security,
     .free_security_domain = flask_domain_free_security,
-    .alloc_security_evtchn = flask_alloc_security_evtchn,
-    .free_security_evtchn = flask_free_security_evtchn,
+    .alloc_security_evtchns = flask_alloc_security_evtchns,
+    .free_security_evtchns = flask_free_security_evtchns,
     .show_security_evtchn = flask_show_security_evtchn,
     .init_hardware_domain = flask_init_hardware_domain,
 
-- 
2.11.0


