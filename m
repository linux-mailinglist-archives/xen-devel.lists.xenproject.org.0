Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA4C305569
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 09:17:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75804.136588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4g0e-0005rv-9D; Wed, 27 Jan 2021 08:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75804.136588; Wed, 27 Jan 2021 08:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4g0e-0005rU-5f; Wed, 27 Jan 2021 08:17:04 +0000
Received: by outflank-mailman (input) for mailman id 75804;
 Wed, 27 Jan 2021 08:17:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4g0c-0005rK-Mj
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 08:17:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73088352-a3cb-4101-97d0-defbae38bcdc;
 Wed, 27 Jan 2021 08:17:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6C8AAF17;
 Wed, 27 Jan 2021 08:16:59 +0000 (UTC)
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
X-Inumbo-ID: 73088352-a3cb-4101-97d0-defbae38bcdc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611735420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gEGTEYpdjKYg3S3Ltj5tTKIk5+nFXk5YGvD0lOGX3do=;
	b=dM4GiI1fRZ4aTkYEKrCcaEnsfHx7/mSrbluDCPLEJH8zn/go4wVrf6mxeiGbkNODIUEkm8
	/AKTS1oPdNPA39tJkwdqRbmPI2nyLvwTsGEh5+HpXD+MBoWYh8BjjMI9iBjRsJPxytTOK5
	ihUgX1lgScKG0ojFxNb54k9M8D5wJoo=
Subject: [PATCH v5 4/6] evtchn: add helper for port_is_valid() +
 evtchn_from_port()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
Message-ID: <cf871b03-35e5-a81e-feca-a0c6d71b1c30@suse.com>
Date: Wed, 27 Jan 2021 09:16:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
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
v4: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -147,6 +147,11 @@ static bool virq_is_global(unsigned int
     return true;
 }
 
+static struct evtchn *_evtchn_from_port(const struct domain *d,
+                                        evtchn_port_t port)
+{
+    return port_is_valid(d, port) ? evtchn_from_port(d, port) : NULL;
+}
 
 static struct evtchn *alloc_evtchn_bucket(struct domain *d, unsigned int port)
 {
@@ -369,9 +374,9 @@ static long evtchn_bind_interdomain(evtc
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
@@ -606,15 +611,12 @@ static long evtchn_bind_pirq(evtchn_bind
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
     write_lock(&d1->event_lock);
 
@@ -700,10 +702,8 @@ int evtchn_close(struct domain *d1, int
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
 
@@ -741,15 +741,13 @@ int evtchn_close(struct domain *d1, int
 
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
@@ -961,7 +959,6 @@ int evtchn_status(evtchn_status_t *statu
 {
     struct domain   *d;
     domid_t          dom = status->dom;
-    int              port = status->port;
     struct evtchn   *chn;
     long             rc = 0;
 
@@ -969,14 +966,13 @@ int evtchn_status(evtchn_status_t *statu
     if ( d == NULL )
         return -ESRCH;
 
-    if ( !port_is_valid(d, port) )
+    chn = _evtchn_from_port(d, status->port);
+    if ( !chn )
     {
         rcu_unlock_domain(d);
         return -EINVAL;
     }
 
-    chn = evtchn_from_port(d, port);
-
     evtchn_read_lock(chn);
 
     if ( consumer_is_xen(chn) )
@@ -1041,11 +1037,10 @@ long evtchn_bind_vcpu(unsigned int port,
     if ( (v = domain_vcpu(d, vcpu_id)) == NULL )
         return -ENOENT;
 
-    if ( !port_is_valid(d, port) )
+    chn = _evtchn_from_port(d, port);
+    if ( !chn )
         return -EINVAL;
 
-    chn = evtchn_from_port(d, port);
-
     write_lock(&d->event_lock);
 
     /* Guest cannot re-bind a Xen-attached event channel. */
@@ -1091,13 +1086,11 @@ long evtchn_bind_vcpu(unsigned int port,
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
@@ -1180,14 +1173,12 @@ static long evtchn_set_priority(const st
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
@@ -1413,10 +1404,10 @@ void free_xen_event_channel(struct domai
 
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
@@ -1427,8 +1418,6 @@ void notify_via_xen_event_channel(struct
         return;
     }
 
-    lchn = evtchn_from_port(ld, lport);
-
     if ( !evtchn_read_trylock(lchn) )
         return;
 
@@ -1582,16 +1571,17 @@ static void domain_dump_evtchn_info(stru
            "Polling vCPUs: {%*pbl}\n"
            "    port [p/m/s]\n", d->domain_id, d->max_vcpus, d->poll_mask);
 
-    for ( port = 1; port_is_valid(d, port); ++port )
+    for ( port = 1; ; ++port )
     {
-        struct evtchn *chn;
+        struct evtchn *chn = _evtchn_from_port(d, port);
         char *ssid;
 
+        if ( !chn )
+            break;
+
         if ( !(port & 0x3f) )
             process_pending_softirqs();
 
-        chn = evtchn_from_port(d, port);
-
         if ( !evtchn_read_trylock(chn) )
         {
             printk("    %4u in flux\n", port);
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


