Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9D630556B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 09:17:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75807.136600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4g0z-0005yO-It; Wed, 27 Jan 2021 08:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75807.136600; Wed, 27 Jan 2021 08:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4g0z-0005xq-FA; Wed, 27 Jan 2021 08:17:25 +0000
Received: by outflank-mailman (input) for mailman id 75807;
 Wed, 27 Jan 2021 08:17:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4g0y-0005xa-8i
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 08:17:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65358ec2-719f-4229-a7dc-dd82c1df4888;
 Wed, 27 Jan 2021 08:17:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B14AB98B;
 Wed, 27 Jan 2021 08:17:22 +0000 (UTC)
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
X-Inumbo-ID: 65358ec2-719f-4229-a7dc-dd82c1df4888
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611735442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B2RArq70ig3igybu8O+ijF3q8cBl2UbzWuYiOmMpvZE=;
	b=eWWC3vq1ur/Q277+fYhAZgfuXUk1s3cq36yvnSaGpKFlC3J7Ttz6W0lWoBkGoquHhChTxQ
	9E9w43A/GaYvz7Lme2lTm/sq/T3TShl9e6IziDcsezYd5HYNyO+ZIOzhY61Sz39uG7rHL2
	9EX9ufryz4CPBlg+ApMKX9MrBJPGqXI=
Subject: [PATCH v5 5/6] evtchn: type adjustments
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
Message-ID: <3cb6de31-39e3-43ff-2a9f-a09aa1b1fc26@suse.com>
Date: Wed, 27 Jan 2021 09:17:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

First of all avoid "long" when "int" suffices, i.e. in particular when
merely conveying error codes. 32-bit values are slightly cheaper to
deal with on x86, and their processing is at least no more expensive on
Arm. Where possible use evtchn_port_t for port numbers and unsigned int
for other unsigned quantities in adjacent code. In evtchn_set_priority()
eliminate a local variable altogether instead of changing its type.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -287,13 +287,12 @@ void evtchn_free(struct domain *d, struc
     xsm_evtchn_close_post(chn);
 }
 
-static long evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
+static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
 {
     struct evtchn *chn;
     struct domain *d;
-    int            port;
+    int            port, rc;
     domid_t        dom = alloc->dom;
-    long           rc;
 
     d = rcu_lock_domain_by_any_id(dom);
     if ( d == NULL )
@@ -346,13 +345,13 @@ static void double_evtchn_unlock(struct
     evtchn_write_unlock(rchn);
 }
 
-static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
+static int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
 {
     struct evtchn *lchn, *rchn;
     struct domain *ld = current->domain, *rd;
-    int            lport, rport = bind->remote_port;
+    int            lport, rc;
+    evtchn_port_t  rport = bind->remote_port;
     domid_t        rdom = bind->remote_dom;
-    long           rc;
 
     if ( (rd = rcu_lock_domain_by_any_id(rdom)) == NULL )
         return -ESRCH;
@@ -488,12 +487,12 @@ int evtchn_bind_virq(evtchn_bind_virq_t
 }
 
 
-static long evtchn_bind_ipi(evtchn_bind_ipi_t *bind)
+static int evtchn_bind_ipi(evtchn_bind_ipi_t *bind)
 {
     struct evtchn *chn;
     struct domain *d = current->domain;
-    int            port, vcpu = bind->vcpu;
-    long           rc = 0;
+    int            port, rc = 0;
+    unsigned int   vcpu = bind->vcpu;
 
     if ( domain_vcpu(d, vcpu) == NULL )
         return -ENOENT;
@@ -547,16 +546,16 @@ static void unlink_pirq_port(struct evtc
 }
 
 
-static long evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
+static int evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
 {
     struct evtchn *chn;
     struct domain *d = current->domain;
     struct vcpu   *v = d->vcpu[0];
     struct pirq   *info;
-    int            port = 0, pirq = bind->pirq;
-    long           rc;
+    int            port = 0, rc;
+    unsigned int   pirq = bind->pirq;
 
-    if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
+    if ( pirq >= d->nr_pirqs )
         return -EINVAL;
 
     if ( !is_hvm_domain(d) && !pirq_access_permitted(d, pirq) )
@@ -612,7 +611,7 @@ int evtchn_close(struct domain *d1, int
 {
     struct domain *d2 = NULL;
     struct evtchn *chn1 = _evtchn_from_port(d1, port1), *chn2;
-    long           rc = 0;
+    int            rc = 0;
 
     if ( !chn1 )
         return -EINVAL;
@@ -960,7 +959,7 @@ int evtchn_status(evtchn_status_t *statu
     struct domain   *d;
     domid_t          dom = status->dom;
     struct evtchn   *chn;
-    long             rc = 0;
+    int              rc = 0;
 
     d = rcu_lock_domain_by_any_id(dom);
     if ( d == NULL )
@@ -1026,11 +1025,11 @@ int evtchn_status(evtchn_status_t *statu
 }
 
 
-long evtchn_bind_vcpu(unsigned int port, unsigned int vcpu_id)
+int evtchn_bind_vcpu(evtchn_port_t port, unsigned int vcpu_id)
 {
     struct domain *d = current->domain;
     struct evtchn *chn;
-    long           rc = 0;
+    int           rc = 0;
     struct vcpu   *v;
 
     /* Use the vcpu info to prevent speculative out-of-bound accesses */
@@ -1169,12 +1168,11 @@ int evtchn_reset(struct domain *d, bool
     return rc;
 }
 
-static long evtchn_set_priority(const struct evtchn_set_priority *set_priority)
+static int evtchn_set_priority(const struct evtchn_set_priority *set_priority)
 {
     struct domain *d = current->domain;
-    unsigned int port = set_priority->port;
-    struct evtchn *chn = _evtchn_from_port(d, port);
-    long ret;
+    struct evtchn *chn = _evtchn_from_port(d, set_priority->port);
+    int ret;
 
     if ( !chn )
         return -EINVAL;
@@ -1190,7 +1188,7 @@ static long evtchn_set_priority(const st
 
 long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    long rc;
+    int rc;
 
     switch ( cmd )
     {
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -54,7 +54,7 @@ void send_guest_pirq(struct domain *, co
 int evtchn_send(struct domain *d, unsigned int lport);
 
 /* Bind a local event-channel port to the specified VCPU. */
-long evtchn_bind_vcpu(unsigned int port, unsigned int vcpu_id);
+int evtchn_bind_vcpu(evtchn_port_t port, unsigned int vcpu_id);
 
 /* Bind a VIRQ. */
 int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port);


