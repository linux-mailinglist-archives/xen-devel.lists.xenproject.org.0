Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E7392CAD
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 13:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133022.248050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmEBt-0000oO-6H; Thu, 27 May 2021 11:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133022.248050; Thu, 27 May 2021 11:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmEBt-0000lX-2v; Thu, 27 May 2021 11:28:41 +0000
Received: by outflank-mailman (input) for mailman id 133022;
 Thu, 27 May 2021 11:28:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmEBr-0000lM-OX
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 11:28:39 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccfcc1ee-1dbb-455d-bd5f-db6eeff6947e;
 Thu, 27 May 2021 11:28:38 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 063A51FD2E;
 Thu, 27 May 2021 11:28:38 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id CC96211A98;
 Thu, 27 May 2021 11:28:37 +0000 (UTC)
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
X-Inumbo-ID: ccfcc1ee-1dbb-455d-bd5f-db6eeff6947e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622114918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CyjWzZjN/Vq2WXc19AjsyaFDZn+HLKqQXYu8edCK+Vc=;
	b=mvj530uTOp1qx/bWOOlC07BLw+nhdeqY1ck6hybsZwIxQnyejbDdrXT5FUMKG63fsSekXR
	R8f533asQK2vnvpwpKqIAvJggbkJaIH8j35D1TdHnJKE9kvZZvMzAuz6I54GPWjSZ3VJn5
	tW+LPqPLAv/40pBUBG3xHx9UgC0/4Og=
Subject: [PATCH v6 2/3] evtchn: add helper for port_is_valid() +
 evtchn_from_port()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
Message-ID: <76106d2d-6219-bbb1-ee06-601da6f40673@suse.com>
Date: Thu, 27 May 2021 13:28:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The combination is pretty common, so adding a simple local helper seems
worthwhile. Make it const- and type-correct, in turn requiring the
two called function to also be const-correct (and at this occasion also
make them type-correct).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v6: Re-base, also for re-ordering / shrinking of series.
v4: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -147,6 +147,12 @@ static bool virq_is_global(unsigned int
     return true;
 }
 
+static struct evtchn *_evtchn_from_port(const struct domain *d,
+                                        evtchn_port_t port)
+{
+    return port_is_valid(d, port) ? evtchn_from_port(d, port) : NULL;
+}
+
 static void free_evtchn_bucket(struct domain *d, struct evtchn *bucket)
 {
     if ( !bucket )
@@ -319,7 +325,6 @@ static long evtchn_alloc_unbound(evtchn_
     return rc;
 }
 
-
 static void double_evtchn_lock(struct evtchn *lchn, struct evtchn *rchn)
 {
     ASSERT(lchn != rchn);
@@ -365,9 +370,9 @@ static long evtchn_bind_interdomain(evtc
         ERROR_EXIT(lport);
     lchn = evtchn_from_port(ld, lport);
 
-    if ( !port_is_valid(rd, rport) )
+    rchn = _evtchn_from_port(rd, rport);
+    if ( !rchn )
         ERROR_EXIT_DOM(-EINVAL, rd);
-    rchn = evtchn_from_port(rd, rport);
     if ( (rchn->state != ECS_UNBOUND) ||
          (rchn->u.unbound.remote_domid != ld->domain_id) )
         ERROR_EXIT_DOM(-EINVAL, rd);
@@ -602,15 +607,12 @@ static long evtchn_bind_pirq(evtchn_bind
 int evtchn_close(struct domain *d1, int port1, bool guest)
 {
     struct domain *d2 = NULL;
-    struct evtchn *chn1, *chn2;
-    int            port2;
+    struct evtchn *chn1 = _evtchn_from_port(d1, port1), *chn2;
     long           rc = 0;
 
-    if ( !port_is_valid(d1, port1) )
+    if ( !chn1 )
         return -EINVAL;
 
-    chn1 = evtchn_from_port(d1, port1);
-
  again:
     spin_lock(&d1->event_lock);
 
@@ -698,10 +700,8 @@ int evtchn_close(struct domain *d1, int
             goto out;
         }
 
-        port2 = chn1->u.interdomain.remote_port;
-        BUG_ON(!port_is_valid(d2, port2));
-
-        chn2 = evtchn_from_port(d2, port2);
+        chn2 = _evtchn_from_port(d2, chn1->u.interdomain.remote_port);
+        BUG_ON(!chn2);
         BUG_ON(chn2->state != ECS_INTERDOMAIN);
         BUG_ON(chn2->u.interdomain.remote_dom != d1);
 
@@ -739,15 +739,13 @@ int evtchn_close(struct domain *d1, int
 
 int evtchn_send(struct domain *ld, unsigned int lport)
 {
-    struct evtchn *lchn, *rchn;
+    struct evtchn *lchn = _evtchn_from_port(ld, lport), *rchn;
     struct domain *rd;
     int            rport, ret = 0;
 
-    if ( !port_is_valid(ld, lport) )
+    if ( !lchn )
         return -EINVAL;
 
-    lchn = evtchn_from_port(ld, lport);
-
     evtchn_read_lock(lchn);
 
     /* Guest cannot send via a Xen-attached event channel. */
@@ -967,15 +965,15 @@ int evtchn_status(evtchn_status_t *statu
     if ( d == NULL )
         return -ESRCH;
 
-    spin_lock(&d->event_lock);
-
-    if ( !port_is_valid(d, port) )
+    chn = _evtchn_from_port(d, port);
+    if ( !chn )
     {
-        rc = -EINVAL;
-        goto out;
+        rcu_unlock_domain(d);
+        return -EINVAL;
     }
 
-    chn = evtchn_from_port(d, port);
+    spin_lock(&d->event_lock);
+
     if ( consumer_is_xen(chn) )
     {
         rc = -EACCES;
@@ -1038,11 +1036,10 @@ long evtchn_bind_vcpu(unsigned int port,
     if ( (v = domain_vcpu(d, vcpu_id)) == NULL )
         return -ENOENT;
 
-    if ( !port_is_valid(d, port) )
+    chn = _evtchn_from_port(d, port);
+    if ( !chn )
         return -EINVAL;
 
-    chn = evtchn_from_port(d, port);
-
     spin_lock(&d->event_lock);
 
     /* Guest cannot re-bind a Xen-attached event channel. */
@@ -1088,13 +1085,11 @@ long evtchn_bind_vcpu(unsigned int port,
 int evtchn_unmask(unsigned int port)
 {
     struct domain *d = current->domain;
-    struct evtchn *evtchn;
+    struct evtchn *evtchn = _evtchn_from_port(d, port);
 
-    if ( unlikely(!port_is_valid(d, port)) )
+    if ( unlikely(!evtchn) )
         return -EINVAL;
 
-    evtchn = evtchn_from_port(d, port);
-
     evtchn_read_lock(evtchn);
 
     evtchn_port_unmask(d, evtchn);
@@ -1177,14 +1172,12 @@ static long evtchn_set_priority(const st
 {
     struct domain *d = current->domain;
     unsigned int port = set_priority->port;
-    struct evtchn *chn;
+    struct evtchn *chn = _evtchn_from_port(d, port);
     long ret;
 
-    if ( !port_is_valid(d, port) )
+    if ( !chn )
         return -EINVAL;
 
-    chn = evtchn_from_port(d, port);
-
     evtchn_read_lock(chn);
 
     ret = evtchn_port_set_priority(d, chn, set_priority->priority);
@@ -1410,10 +1403,10 @@ void free_xen_event_channel(struct domai
 
 void notify_via_xen_event_channel(struct domain *ld, int lport)
 {
-    struct evtchn *lchn, *rchn;
+    struct evtchn *lchn = _evtchn_from_port(ld, lport), *rchn;
     struct domain *rd;
 
-    if ( !port_is_valid(ld, lport) )
+    if ( !lchn )
     {
         /*
          * Make sure ->is_dying is read /after/ ->valid_evtchns, pairing
@@ -1424,8 +1417,6 @@ void notify_via_xen_event_channel(struct
         return;
     }
 
-    lchn = evtchn_from_port(ld, lport);
-
     if ( !evtchn_read_trylock(lchn) )
         return;
 
@@ -1580,12 +1571,14 @@ static void domain_dump_evtchn_info(stru
 
     spin_lock(&d->event_lock);
 
-    for ( port = 1; port_is_valid(d, port); ++port )
+    for ( port = 1; ; ++port )
     {
-        const struct evtchn *chn;
+        const struct evtchn *chn = _evtchn_from_port(d, port);
         char *ssid;
 
-        chn = evtchn_from_port(d, port);
+        if ( !chn )
+            break;
+
         if ( chn->state == ECS_FREE )
             continue;
 
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -120,7 +120,7 @@ static inline void evtchn_read_unlock(st
     read_unlock(&evtchn->lock);
 }
 
-static inline bool_t port_is_valid(struct domain *d, unsigned int p)
+static inline bool port_is_valid(const struct domain *d, evtchn_port_t p)
 {
     if ( p >= read_atomic(&d->valid_evtchns) )
         return false;
@@ -135,7 +135,8 @@ static inline bool_t port_is_valid(struc
     return true;
 }
 
-static inline struct evtchn *evtchn_from_port(struct domain *d, unsigned int p)
+static inline struct evtchn *evtchn_from_port(const struct domain *d,
+                                              evtchn_port_t p)
 {
     if ( p < EVTCHNS_PER_BUCKET )
         return &d->evtchn[array_index_nospec(p, EVTCHNS_PER_BUCKET)];


