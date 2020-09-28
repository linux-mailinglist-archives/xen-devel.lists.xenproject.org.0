Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0051427AC51
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 12:59:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqrs-0004aq-RC; Mon, 28 Sep 2020 10:58:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMqrs-0004ak-0L
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 10:58:52 +0000
X-Inumbo-ID: 97f7edf5-d8a0-4cae-8d7a-53e25c6143e9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97f7edf5-d8a0-4cae-8d7a-53e25c6143e9;
 Mon, 28 Sep 2020 10:58:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601290730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXan/rIQLrp6e3jD5KfkNxF5GmzyEUYe+HppsckrcEs=;
 b=gfxh9ZIOQVCsGQ8RpS0yY7MifqXvz5qhcRNXcNlqwKTY6iU07pjr2zEGxw39lKgTGh1xDZ
 bGnina5DUQNwP2+aKjsaRWKyM01UNpVfO7jA6OyAOY0dSHA8Y2BR2h6GzSx7NclhwTbUVz
 YqY5D98wSVTR+xCbGX7zCnflNBpXFNU=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 666F1AE07;
 Mon, 28 Sep 2020 10:58:50 +0000 (UTC)
Subject: [PATCH 05/12] evtchn/sched: reject poll requests for unusable ports
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Message-ID: <802a0866-6bcf-cb52-1c3f-edb628fbc9c7@suse.com>
Date: Mon, 28 Sep 2020 12:58:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Before and after XSA-342 there has been an asymmetry in how not really
usable ports get treated in do_poll(): Ones beyond a certain boundary
(max_evtchns originally, valid_evtchns subsequently) did get refused
with -EINVAL, while lower ones were accepted despite there potentially
being no way to wake the vCPU again from its polling state. Arrange to
also honor evtchn_usable() output in the decision.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1427,13 +1427,13 @@ static long do_poll(struct sched_poll *s
         if ( __copy_from_guest_offset(&port, sched_poll->ports, i, 1) )
             goto out;
 
-        rc = -EINVAL;
-        if ( !port_is_valid(d, port) )
-            goto out;
-
-        rc = 0;
-        if ( evtchn_port_is_pending(d, port) )
+        rc = evtchn_port_poll(d, port);
+        if ( rc )
+        {
+            if ( rc > 0 )
+                rc = 0;
             goto out;
+        }
     }
 
     if ( sched_poll->nr_ports == 1 )
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -240,19 +240,6 @@ static inline bool evtchn_is_pending(con
     return evtchn_usable(evtchn) && d->evtchn_port_ops->is_pending(d, evtchn);
 }
 
-static inline bool evtchn_port_is_pending(struct domain *d, evtchn_port_t port)
-{
-    struct evtchn *evtchn = evtchn_from_port(d, port);
-    bool rc;
-    unsigned long flags;
-
-    spin_lock_irqsave(&evtchn->lock, flags);
-    rc = evtchn_is_pending(d, evtchn);
-    spin_unlock_irqrestore(&evtchn->lock, flags);
-
-    return rc;
-}
-
 static inline bool evtchn_is_masked(const struct domain *d,
                                     const struct evtchn *evtchn)
 {
@@ -279,6 +266,24 @@ static inline bool evtchn_is_busy(const
            d->evtchn_port_ops->is_busy(d, evtchn);
 }
 
+static inline int evtchn_port_poll(struct domain *d, evtchn_port_t port)
+{
+    int rc = -EINVAL;
+
+    if ( port_is_valid(d, port) )
+    {
+        struct evtchn *evtchn = evtchn_from_port(d, port);
+        unsigned long flags;
+
+        spin_lock_irqsave(&evtchn->lock, flags);
+        if ( evtchn_usable(evtchn) )
+            rc = evtchn_is_pending(d, evtchn);
+        spin_unlock_irqrestore(&evtchn->lock, flags);
+    }
+
+    return rc;
+}
+
 static inline int evtchn_port_set_priority(struct domain *d,
                                            struct evtchn *evtchn,
                                            unsigned int priority)


