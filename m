Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4513D27AC50
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 12:57:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqqg-0004Qt-GB; Mon, 28 Sep 2020 10:57:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMqqe-0004Qa-MK
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 10:57:36 +0000
X-Inumbo-ID: 466685f1-d6eb-4bf2-96dd-3d519d94c68a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 466685f1-d6eb-4bf2-96dd-3d519d94c68a;
 Mon, 28 Sep 2020 10:57:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601290654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J/GpFR4UxC1zaNaCEb95T79spF3BCjvGuD9y1xyT+uQ=;
 b=RVVKkHlZS/xEOnOAPgxTCv0lxzuXd/cOPGTEQ2poXmT0bsBTY17chax2fe9swxBudLMq3u
 FB/Xuri9zDqF1uLv5u/xPqTQjtp7iVASdG7HeJhgJOqtq9vlyAyQFOFaUxLRqIaUcYUSNe
 xVS61sxQ7RkmvpaEE2QvG9jpGl3ZSKI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A0C6ACAC;
 Mon, 28 Sep 2020 10:57:34 +0000 (UTC)
Subject: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the
 per-channel lock
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Message-ID: <5b1700a8-7900-9450-1c21-323bcde1fccc@suse.com>
Date: Mon, 28 Sep 2020 12:57:33 +0200
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

evtchn_fifo_set_pending() (invoked with the per-channel lock held) has
two uses of the channel's priority field. The field gets updated by
evtchn_fifo_set_priority() with only the per-domain event_lock held,
i.e. the two reads may observe two different values. While the 2nd use
could - afaict - in principle be replaced by q->priority, I think
evtchn_set_priority() should acquire the per-channel lock in any event.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1132,7 +1132,9 @@ static long evtchn_set_priority(const st
 {
     struct domain *d = current->domain;
     unsigned int port = set_priority->port;
+    struct evtchn *chn;
     long ret;
+    unsigned long flags;
 
     spin_lock(&d->event_lock);
 
@@ -1142,8 +1144,10 @@ static long evtchn_set_priority(const st
         return -EINVAL;
     }
 
-    ret = evtchn_port_set_priority(d, evtchn_from_port(d, port),
-                                   set_priority->priority);
+    chn = evtchn_from_port(d, port);
+    spin_lock_irqsave(&chn->lock, flags);
+    ret = evtchn_port_set_priority(d, chn, set_priority->priority);
+    spin_unlock_irqrestore(&chn->lock, flags);
 
     spin_unlock(&d->event_lock);
 


