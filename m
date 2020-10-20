Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFF3293E27
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 16:08:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9651.25361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUsJZ-0000jt-8i; Tue, 20 Oct 2020 14:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9651.25361; Tue, 20 Oct 2020 14:08:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUsJZ-0000jS-4v; Tue, 20 Oct 2020 14:08:37 +0000
Received: by outflank-mailman (input) for mailman id 9651;
 Tue, 20 Oct 2020 14:08:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUsJX-0000jJ-W0
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:08:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29a9faeb-f22d-4aa5-ad60-f6da90b5e2c2;
 Tue, 20 Oct 2020 14:08:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 160A0AC6A;
 Tue, 20 Oct 2020 14:08:34 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUsJX-0000jJ-W0
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:08:36 +0000
X-Inumbo-ID: 29a9faeb-f22d-4aa5-ad60-f6da90b5e2c2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 29a9faeb-f22d-4aa5-ad60-f6da90b5e2c2;
	Tue, 20 Oct 2020 14:08:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603202914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UwtAw9MFG3NRnXuuCSs6MsSB/uT680OjsEYW6ot3L34=;
	b=FCYP1qk7r+4wlxSydtGqUEiw3PoHnCHPaGKkRO1cLpFIqt1TaaLOeSBe+JfLadJvrspKzW
	x1/d757gmJjQon5isYFNeeAb8YdRG7LMiO2zEG4WxVJR/0xN6N0ag5XRO1A9zYGED67v0j
	dAD5MJGmuRdXTGhPcTz9eLQQRlYTHt4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 160A0AC6A;
	Tue, 20 Oct 2020 14:08:34 +0000 (UTC)
Subject: [PATCH v2 2/8] evtchn: replace FIFO-specific header by generic
 private one
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Message-ID: <3fea358e-d6d1-21d4-2d83-d9bd457ba3b5@suse.com>
Date: Tue, 20 Oct 2020 16:08:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Having a FIFO specific header is not (or at least no longer) warranted
with just three function declarations left there. Introduce a private
header instead, moving there some further items from xen/event.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.
---
TBD: If - considering the layering violation that's there anyway - we
     allowed PV shim code to make use of this header, a few more items
     could be moved out of "public sight".

--- a/xen/common/event_2l.c
+++ b/xen/common/event_2l.c
@@ -7,11 +7,12 @@
  * Version 2 or later.  See the file COPYING for more details.
  */
 
+#include "event_channel.h"
+
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
-#include <xen/event.h>
 
 #include <asm/guest_atomics.h>
 
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -14,17 +14,17 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "event_channel.h"
+
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
-#include <xen/event.h>
 #include <xen/irq.h>
 #include <xen/iocap.h>
 #include <xen/compat.h>
 #include <xen/guest_access.h>
 #include <xen/keyhandler.h>
-#include <xen/event_fifo.h>
 #include <asm/current.h>
 
 #include <public/xen.h>
--- /dev/null
+++ b/xen/common/event_channel.h
@@ -0,0 +1,63 @@
+/* Event channel handling private header. */
+
+#include <xen/event.h>
+
+static inline unsigned int max_evtchns(const struct domain *d)
+{
+    return d->evtchn_fifo ? EVTCHN_FIFO_NR_CHANNELS
+                          : BITS_PER_EVTCHN_WORD(d) * BITS_PER_EVTCHN_WORD(d);
+}
+
+static inline bool evtchn_is_busy(const struct domain *d,
+                                  const struct evtchn *evtchn)
+{
+    return d->evtchn_port_ops->is_busy &&
+           d->evtchn_port_ops->is_busy(d, evtchn);
+}
+
+static inline void evtchn_port_unmask(struct domain *d,
+                                      struct evtchn *evtchn)
+{
+    if ( evtchn_usable(evtchn) )
+        d->evtchn_port_ops->unmask(d, evtchn);
+}
+
+static inline int evtchn_port_set_priority(struct domain *d,
+                                           struct evtchn *evtchn,
+                                           unsigned int priority)
+{
+    if ( !d->evtchn_port_ops->set_priority )
+        return -ENOSYS;
+    if ( !evtchn_usable(evtchn) )
+        return -EACCES;
+    return d->evtchn_port_ops->set_priority(d, evtchn, priority);
+}
+
+static inline void evtchn_port_print_state(struct domain *d,
+                                           const struct evtchn *evtchn)
+{
+    d->evtchn_port_ops->print_state(d, evtchn);
+}
+
+/* 2-level */
+
+void evtchn_2l_init(struct domain *d);
+
+/* FIFO */
+
+struct evtchn_init_control;
+struct evtchn_expand_array;
+
+int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
+int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
+void evtchn_fifo_destroy(struct domain *d);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -7,12 +7,12 @@
  * Version 2 or later.  See the file COPYING for more details.
  */
 
+#include "event_channel.h"
+
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
-#include <xen/event.h>
-#include <xen/event_fifo.h>
 #include <xen/paging.h>
 #include <xen/mm.h>
 #include <xen/domain_page.h>
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -105,12 +105,6 @@ void notify_via_xen_event_channel(struct
 #define bucket_from_port(d, p) \
     ((group_from_port(d, p))[((p) % EVTCHNS_PER_GROUP) / EVTCHNS_PER_BUCKET])
 
-static inline unsigned int max_evtchns(const struct domain *d)
-{
-    return d->evtchn_fifo ? EVTCHN_FIFO_NR_CHANNELS
-                          : BITS_PER_EVTCHN_WORD(d) * BITS_PER_EVTCHN_WORD(d);
-}
-
 static inline bool_t port_is_valid(struct domain *d, unsigned int p)
 {
     if ( p >= read_atomic(&d->valid_evtchns) )
@@ -176,8 +170,6 @@ static bool evtchn_usable(const struct e
 
 void evtchn_check_pollers(struct domain *d, unsigned int port);
 
-void evtchn_2l_init(struct domain *d);
-
 /* Close all event channels and reset to 2-level ABI. */
 int evtchn_reset(struct domain *d, bool resuming);
 
@@ -227,13 +219,6 @@ static inline void evtchn_port_clear_pen
         d->evtchn_port_ops->clear_pending(d, evtchn);
 }
 
-static inline void evtchn_port_unmask(struct domain *d,
-                                      struct evtchn *evtchn)
-{
-    if ( evtchn_usable(evtchn) )
-        d->evtchn_port_ops->unmask(d, evtchn);
-}
-
 static inline bool evtchn_is_pending(const struct domain *d,
                                      const struct evtchn *evtchn)
 {
@@ -259,13 +244,6 @@ static inline bool evtchn_port_is_masked
     return rc;
 }
 
-static inline bool evtchn_is_busy(const struct domain *d,
-                                  const struct evtchn *evtchn)
-{
-    return d->evtchn_port_ops->is_busy &&
-           d->evtchn_port_ops->is_busy(d, evtchn);
-}
-
 /* Returns negative errno, zero for not pending, or positive for pending. */
 static inline int evtchn_port_poll(struct domain *d, evtchn_port_t port)
 {
@@ -285,21 +263,4 @@ static inline int evtchn_port_poll(struc
     return rc;
 }
 
-static inline int evtchn_port_set_priority(struct domain *d,
-                                           struct evtchn *evtchn,
-                                           unsigned int priority)
-{
-    if ( !d->evtchn_port_ops->set_priority )
-        return -ENOSYS;
-    if ( !evtchn_usable(evtchn) )
-        return -EACCES;
-    return d->evtchn_port_ops->set_priority(d, evtchn, priority);
-}
-
-static inline void evtchn_port_print_state(struct domain *d,
-                                           const struct evtchn *evtchn)
-{
-    d->evtchn_port_ops->print_state(d, evtchn);
-}
-
 #endif /* __XEN_EVENT_H__ */
--- a/xen/include/xen/event_fifo.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/*
- * FIFO-based event channel ABI.
- *
- * Copyright (C) 2013 Citrix Systems R&D Ltd.
- *
- * This source code is licensed under the GNU General Public License,
- * Version 2 or later.  See the file COPYING for more details.
- */
-#ifndef __XEN_EVENT_FIFO_H__
-#define __XEN_EVENT_FIFO_H__
-
-int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
-int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
-void evtchn_fifo_destroy(struct domain *domain);
-
-#endif /* __XEN_EVENT_FIFO_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */


