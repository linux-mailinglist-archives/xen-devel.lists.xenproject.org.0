Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9041027AC57
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 12:59:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqsE-0004dP-4B; Mon, 28 Sep 2020 10:59:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMqsD-0004dH-64
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 10:59:13 +0000
X-Inumbo-ID: 3e66c6d3-274f-4454-a73d-b962ecfa2abc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e66c6d3-274f-4454-a73d-b962ecfa2abc;
 Mon, 28 Sep 2020 10:59:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601290751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHDyMtgX+8dhvc5uYQZOZEiupXAKqbAo9RNgQWlQ91k=;
 b=ji1VVHJqQsIf2fqUMHdMRoX1moyqYV7lyuG7ffEh9HGB2Rn9yRDo3ziDDBdHTnCnN/jXXU
 LTsTXPsQYshX2m0Po8wSrCLEWrqfZ/mk83uv3Gt3X5FJi8YU1Giq2lAKSV/Zg3xn83/QbQ
 Vu8mT5zrmtYGmkxCUyuAHUcTZPai3Vw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9CD1AD82;
 Mon, 28 Sep 2020 10:59:11 +0000 (UTC)
Subject: [PATCH 06/12] evtchn: don't bypass unlinking pIRQ when closing port
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Message-ID: <6add36f5-93de-dc8e-7c14-dc5ae1c794eb@suse.com>
Date: Mon, 28 Sep 2020 12:59:11 +0200
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

There's no other path causing a terminal unlink_pirq_port() to be called
(evtchn_bind_vcpu() relinks it right away) and hence _if_ pirq can
indeed be NULL when closing the port, list corruption would occur when
bypassing the unlink (unless the structure never gets linked again). As
we can't come here after evtchn_destroy() anymore, (late) domain
destruction also isn't a reason for a possible exception, and hence the
only alternative looks to be that the check was pointless in the first
place. While I haven't observed the case, from code inspection I'm far
from sure I can exclude this being possible, so it feels more safe to
re-arrange the code instead.

Fixes: c24536b636f2 ("replace d->nr_pirqs sized arrays with radix tree")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -615,17 +615,18 @@ int evtchn_close(struct domain *d1, int
     case ECS_PIRQ: {
         struct pirq *pirq = pirq_info(d1, chn1->u.pirq.irq);
 
-        if ( !pirq )
-            break;
-        if ( !is_hvm_domain(d1) )
-            pirq_guest_unbind(d1, pirq);
-        pirq->evtchn = 0;
-        pirq_cleanup_check(pirq, d1);
-        unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
+        if ( pirq )
+        {
+            if ( !is_hvm_domain(d1) )
+                pirq_guest_unbind(d1, pirq);
+            pirq->evtchn = 0;
+            pirq_cleanup_check(pirq, d1);
 #ifdef CONFIG_X86
-        if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
-            unmap_domain_pirq_emuirq(d1, pirq->pirq);
+            if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
+                unmap_domain_pirq_emuirq(d1, pirq->pirq);
 #endif
+        }
+        unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
         break;
     }
 


