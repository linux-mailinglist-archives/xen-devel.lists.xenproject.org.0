Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEE42E071E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 09:15:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57683.101021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krcpU-0006MV-F3; Tue, 22 Dec 2020 08:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57683.101021; Tue, 22 Dec 2020 08:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krcpU-0006M6-Bk; Tue, 22 Dec 2020 08:15:36 +0000
Received: by outflank-mailman (input) for mailman id 57683;
 Tue, 22 Dec 2020 08:15:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krcpS-0006M1-FA
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 08:15:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 858f4152-44eb-4c5e-b7d1-fbb033117f1c;
 Tue, 22 Dec 2020 08:15:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13F21ABA1;
 Tue, 22 Dec 2020 08:15:33 +0000 (UTC)
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
X-Inumbo-ID: 858f4152-44eb-4c5e-b7d1-fbb033117f1c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608624933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMu54AWqUXHQnTwpNds3A+YKW+f7l7KpBil/J6yzXu0=;
	b=NQ2C4h30Y7e0BrChNj7YDkOWJhUg5GURXDDduGTVLDFrktxbVnd4bBuk6j7cKzFI4KSGLY
	/JNvan1yFeAi/QmRgowfO79i5aYTRl7uQvq7yc32mVRSqZz1njdNbPyH408S5dmOeMlerS
	hBl7u/f3jIs1u+MmHegTnM7T29Dxjtc=
Subject: [PATCH v2 2/2] evtchn/fifo: don't enforce higher than necessary
 alignment
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <2a08aa31-fdbf-89ee-cd49-813f818b709a@suse.com>
Message-ID: <8db2a31d-29da-a93d-5ded-d6573371516e@suse.com>
Date: Tue, 22 Dec 2020 09:15:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2a08aa31-fdbf-89ee-cd49-813f818b709a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Neither the code nor the original commit provide any justification for
the need to 8-byte align the struct in all cases. Enforce just as much
alignment as the structure actually needs - 4 bytes - by using alignof()
instead of a literal number.

While relaxation of the requirements is intended here, the primary goal
is to simply get rid of the hard coded number as well its lack of
connection to the structure that is is meant to apply to.

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
v2: Add comment to public header. Re-base.
---
I question the need for the array_index_nospec() here. Or else I'd
expect map_vcpu_info() would also need the same.

--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -567,6 +567,16 @@ static void setup_ports(struct domain *d
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
@@ -586,19 +596,20 @@ int evtchn_fifo_init_control(struct evtc
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
 
--- a/xen/include/public/event_channel.h
+++ b/xen/include/public/event_channel.h
@@ -368,6 +368,11 @@ typedef uint32_t event_word_t;
 
 #define EVTCHN_FIFO_NR_CHANNELS (1 << EVTCHN_FIFO_LINK_BITS)
 
+/*
+ * While this structure only requires 4-byte alignment, Xen versions 4.14 and
+ * earlier reject offset values (in struct evtchn_init_control) that aren't a
+ * multiple of 8.
+ */
 struct evtchn_fifo_control_block {
     uint32_t ready;
     uint32_t _rsvd;
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -67,6 +67,7 @@
 ?	evtchn_bind_virq		event_channel.h
 ?	evtchn_close			event_channel.h
 ?	evtchn_expand_array		event_channel.h
+?	evtchn_fifo_control_block	event_channel.h
 ?	evtchn_init_control		event_channel.h
 ?	evtchn_op			event_channel.h
 ?	evtchn_reset			event_channel.h


