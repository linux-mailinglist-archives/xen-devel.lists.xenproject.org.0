Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575DC2209AA
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:16:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveSj-0007W1-7v; Wed, 15 Jul 2020 10:16:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveSi-0007Vs-A2
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:16:28 +0000
X-Inumbo-ID: 3e600278-c684-11ea-93af-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e600278-c684-11ea-93af-12813bfff9fa;
 Wed, 15 Jul 2020 10:16:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19FADB090;
 Wed, 15 Jul 2020 10:16:30 +0000 (UTC)
Subject: [PATCH 2/2] evtchn/fifo: don't enforce higher than necessary alignment
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
Message-ID: <e47a9ef5-5f4c-1ca6-1b31-f7b10516e5ed@suse.com>
Date: Wed, 15 Jul 2020 12:16:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Neither the code nor the original commit provide any justification for
the need to 8-byte align the struct in all cases. Enforce just as much
alignment as the structure actually needs - 4 bytes - by using alignof()
instead of a literal number.

Take the opportunity and also
- add so far missing validation that native and compat mode layouts of
  the structures actually match,
- tie sizeof() expressions to the types of the fields we're actually
  after, rather than specifying the type explicitly (which in the
  general case risks a disconnect, even if there's close to zero risk in
  this particular case),
- use ENXIO instead of EINVAL for the two cases of the address not
  satisfying the requirements, which will make an issue here better
  stand out at the call site.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I question the need for the array_index_nospec() here. Or else I'd
expect map_vcpu_info() would also need the same.

--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -504,6 +504,16 @@ static void setup_ports(struct domain *d
     }
 }
 
+#ifdef CONFIG_COMPAT
+
+#include <compat/event_channel.h>
+
+#define xen_evtchn_fifo_control_block evtchn_fifo_control_block
+CHECK_evtchn_fifo_control_block;
+#undef xen_evtchn_fifo_control_block
+
+#endif
+
 int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
 {
     struct domain *d = current->domain;
@@ -523,19 +533,20 @@ int evtchn_fifo_init_control(struct evtc
         return -ENOENT;
 
     /* Must not cross page boundary. */
-    if ( offset > (PAGE_SIZE - sizeof(evtchn_fifo_control_block_t)) )
-        return -EINVAL;
+    if ( offset > (PAGE_SIZE - sizeof(*v->evtchn_fifo->control_block)) )
+        return -ENXIO;
 
     /*
      * Make sure the guest controlled value offset is bounded even during
      * speculative execution.
      */
     offset = array_index_nospec(offset,
-                           PAGE_SIZE - sizeof(evtchn_fifo_control_block_t) + 1);
+                                PAGE_SIZE -
+                                sizeof(*v->evtchn_fifo->control_block) + 1);
 
-    /* Must be 8-bytes aligned. */
-    if ( offset & (8 - 1) )
-        return -EINVAL;
+    /* Must be suitably aligned. */
+    if ( offset & (alignof(*v->evtchn_fifo->control_block) - 1) )
+        return -ENXIO;
 
     spin_lock(&d->event_lock);
 
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -46,6 +46,7 @@
 ?	evtchn_bind_vcpu		event_channel.h
 ?	evtchn_bind_virq		event_channel.h
 ?	evtchn_close			event_channel.h
+?	evtchn_fifo_control_block	event_channel.h
 ?	evtchn_op			event_channel.h
 ?	evtchn_send			event_channel.h
 ?	evtchn_status			event_channel.h


