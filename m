Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F592CB5E5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 08:49:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42447.76324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkMsj-00014q-0Q; Wed, 02 Dec 2020 07:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42447.76324; Wed, 02 Dec 2020 07:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkMsi-00014R-TB; Wed, 02 Dec 2020 07:48:56 +0000
Received: by outflank-mailman (input) for mailman id 42447;
 Wed, 02 Dec 2020 07:48:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvYF=FG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kkMsh-00014M-Kl
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 07:48:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8c4eed8-3b31-459f-825d-5a256df6ba8b;
 Wed, 02 Dec 2020 07:48:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F383CAC2D;
 Wed,  2 Dec 2020 07:48:53 +0000 (UTC)
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
X-Inumbo-ID: a8c4eed8-3b31-459f-825d-5a256df6ba8b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606895334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=q1Dze1pG8rgwLtTU9aw5X1Gw1LFcmWyazwJ7hYALEbs=;
	b=QitdUtl3wYEt1I99ljM8l5g31HPq6AdnyKgUiNgghRIoNniaM6oJCjRv8UYt+H5OJ0Sx5/
	LwzcEX6WYr/Rc/bT8H5lR8WoZ18KcznB0SMWisF4W3Xziv2TxTsyS0GkxbC3nudGbqOCO+
	Rjj5yfKYldc1qjjGaRNuW6T7jeM244A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v9] xen/events: do some cleanups in evtchn_fifo_set_pending()
Date: Wed,  2 Dec 2020 08:48:52 +0100
Message-Id: <20201202074852.30473-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

evtchn_fifo_set_pending() can be simplified a little bit. Especially
testing for the fifo control block to exist can be moved out of the
main if clause of the function enabling to avoid testing the LINKED bit
twice.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V8:
- new patch

V9:
- move test for control_block existing to after setting PENDING bit
  (Jan Beulich)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/event_fifo.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index a6cca4798d..d508d57219 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -229,29 +229,24 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
         goto done;
     }
 
+    /*
+     * Control block not mapped.  The guest must not unmask an
+     * event until the control block is initialized, so we can
+     * just drop the event.
+     */
+    if ( unlikely(!v->evtchn_fifo->control_block) )
+    {
+        printk(XENLOG_G_WARNING
+               "%pv has no FIFO event channel control block\n", v);
+        goto unlock;
+    }
+
     /*
      * Link the event if it unmasked and not already linked.
      */
     if ( !guest_test_bit(d, EVTCHN_FIFO_MASKED, word) &&
-         !guest_test_bit(d, EVTCHN_FIFO_LINKED, word) )
+         !guest_test_and_set_bit(d, EVTCHN_FIFO_LINKED, word) )
     {
-        event_word_t *tail_word;
-
-        /*
-         * Control block not mapped.  The guest must not unmask an
-         * event until the control block is initialized, so we can
-         * just drop the event.
-         */
-        if ( unlikely(!v->evtchn_fifo->control_block) )
-        {
-            printk(XENLOG_G_WARNING
-                   "%pv has no FIFO event channel control block\n", v);
-            goto unlock;
-        }
-
-        if ( guest_test_and_set_bit(d, EVTCHN_FIFO_LINKED, word) )
-            goto unlock;
-
         /*
          * If this event was a tail, the old queue is now empty and
          * its tail must be invalidated to prevent adding an event to
@@ -286,6 +281,8 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
         linked = false;
         if ( q->tail )
         {
+            event_word_t *tail_word;
+
             tail_word = evtchn_fifo_word_from_port(d, q->tail);
             linked = evtchn_fifo_set_link(d, tail_word, port);
         }
-- 
2.26.2


