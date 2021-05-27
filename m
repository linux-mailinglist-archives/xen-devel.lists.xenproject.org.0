Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C5C392CAE
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 13:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133027.248060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmECE-0001O3-GG; Thu, 27 May 2021 11:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133027.248060; Thu, 27 May 2021 11:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmECE-0001Kf-CR; Thu, 27 May 2021 11:29:02 +0000
Received: by outflank-mailman (input) for mailman id 133027;
 Thu, 27 May 2021 11:29:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmECD-0001H9-9o
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 11:29:01 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccd41df2-1a00-4c88-b47c-5a3e3295610c;
 Thu, 27 May 2021 11:29:00 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B92B2218DD;
 Thu, 27 May 2021 11:28:59 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 89EBA11A98;
 Thu, 27 May 2021 11:28:59 +0000 (UTC)
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
X-Inumbo-ID: ccd41df2-1a00-4c88-b47c-5a3e3295610c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622114939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qa0Zu1mlw1DByVU5m9GtwBNK3+ZFmTcifmkaJak5uN8=;
	b=d+b+azCuQyhsO/FD1UhTHtvaamexyHVttDUtgvuCVkKpDRVdJJn1InNe1ALl1V5+1vrRgY
	Zwg+6cEZjmwGb2H83o+yRriuFsXz1aqqPvBJAUCTFC+w7H1bCRhU1X1G9enZgB3c0jMM1v
	GTCXDSE2vdFln/wWaohvCRlqP8xvQnk=
Subject: [PATCH v6 3/3] evtchn: type adjustments
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
Message-ID: <8f7b57da-cd10-5f96-62fe-1a6e28c8981f@suse.com>
Date: Thu, 27 May 2021 13:28:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
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
v6: Re-base for re-ordering / shrinking of series.
v4: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -284,13 +284,12 @@ void evtchn_free(struct domain *d, struc
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
@@ -342,13 +341,13 @@ static void double_evtchn_unlock(struct
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
@@ -484,12 +483,12 @@ int evtchn_bind_virq(evtchn_bind_virq_t
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
@@ -543,16 +542,16 @@ static void unlink_pirq_port(struct evtc
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
@@ -608,7 +607,7 @@ int evtchn_close(struct domain *d1, int
 {
     struct domain *d2 = NULL;
     struct evtchn *chn1 = _evtchn_from_port(d1, port1), *chn2;
-    long           rc = 0;
+    int            rc = 0;
 
     if ( !chn1 )
         return -EINVAL;
@@ -959,7 +958,7 @@ int evtchn_status(evtchn_status_t *statu
     domid_t          dom = status->dom;
     int              port = status->port;
     struct evtchn   *chn;
-    long             rc = 0;
+    int              rc = 0;
 
     d = rcu_lock_domain_by_any_id(dom);
     if ( d == NULL )
@@ -1025,11 +1024,11 @@ int evtchn_status(evtchn_status_t *statu
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
@@ -1168,12 +1167,11 @@ int evtchn_reset(struct domain *d, bool
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
@@ -1189,7 +1187,7 @@ static long evtchn_set_priority(const st
 
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


