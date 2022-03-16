Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE524DB808
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 19:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291252.494227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUYYF-0001W6-Ah; Wed, 16 Mar 2022 18:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291252.494227; Wed, 16 Mar 2022 18:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUYYF-0001TE-7n; Wed, 16 Mar 2022 18:39:15 +0000
Received: by outflank-mailman (input) for mailman id 291252;
 Wed, 16 Mar 2022 18:39:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ybcc=T3=gmail.com=raphning@srs-se1.protection.inumbo.net>)
 id 1nUYYD-0001T8-PF
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 18:39:13 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fc02b8e-a558-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 19:39:12 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so3713830wms.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Mar 2022 11:39:12 -0700 (PDT)
Received: from dev-dsk-raphning-1b-027ba2d5.eu-west-1.amazon.com
 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b00389f368cf1esm975314wmq.40.2022.03.16.11.39.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Mar 2022 11:39:11 -0700 (PDT)
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
X-Inumbo-ID: 5fc02b8e-a558-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7hTe8lqUiQDtRa2eY7/ZeO/Y25PyQNsO2Qnt46oLy3Y=;
        b=mT46jWmHmz9VfTAbZ416/td5UINURUvs0TJNEqPRoQSTpuK1eb6zWj7jxSuqZzMY5v
         e9k8lRE3JzCQlcBNGdkTDGuj/mmMWE+LeVROAHMOukcVxnOBXCzNTOkZpQzW+Q12AFXF
         /22r4hGVAplRoLHn3lBEpDeBarOzO2aQ/KXfsVs0tMPjaZ0Kru45y8umicU4W6P2Nyf8
         17zHSy9TB1a0e6FVvegDtDQKI8/lC1mdfV6eoxSWo3c8tlk9prUWcWv3knoTbIW3iQNs
         n4L/GqSzooqwWgB5ldLzq1tlKprSgYppJc8wHM3BzdFrAtLXih6Hz968phrtLCq8kFWA
         aVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7hTe8lqUiQDtRa2eY7/ZeO/Y25PyQNsO2Qnt46oLy3Y=;
        b=NWDzpKSee+vBNmyamMpAujdRsu2B95FzpdxZ1RCvS25vQBPNzSANKUkxU3Y4wuD2ii
         oxMqRsOlHNmyUFnt7uCVcUKkiE13WNG8VMd+Q//yiIYQur6jWwAy27Rp9p972sBdLI2d
         MKa+dAO0tnGhscrpr/oyxUVxPPNTbnvvMvP1BbLZsG0vg9xUIjEYTLEgUpbeOUifK2b/
         x39MVbnnJLdncKFFN2tW/7B2B4s/WDwtjos8hDQXqlfz6EkM4VlxAi65gv34l1UqsyEK
         tCcViFp1wSX115IN0nZsr0dnTlMm91/BmPYniJsleE6MPDGKq5cka6aY2XsMyQaS+RKy
         x5cg==
X-Gm-Message-State: AOAM5337lyf+EOqmu20iarJV8KQPChHtYI9a8fu6Z28qMytMPFHikshg
	lfrWZaKbeHYyj/NtJ2045Iw1VoZlBIqBpzvv
X-Google-Smtp-Source: ABdhPJwJSwDpjRLgkpBFdDwAmL+zFum5LxzHvz3UWLoG6C5yDmhDomO90pIDvRnzZ77YkTGlNCVX3g==
X-Received: by 2002:a1c:7c06:0:b0:389:7fd0:f6ec with SMTP id x6-20020a1c7c06000000b003897fd0f6ecmr8318170wmc.44.1647455951712;
        Wed, 16 Mar 2022 11:39:11 -0700 (PDT)
From: Raphael Ning <raphning@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Raphael Ning <raphning@gmail.com>,
	Raphael Ning <raphning@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	David Vrabel <dvrabel@amazon.co.uk>
Subject: [XEN PATCH] evtchn/fifo: Don't set PENDING bit if guest misbehaves
Date: Wed, 16 Mar 2022 18:38:41 +0000
Message-Id: <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Raphael Ning <raphning@amazon.com>

Currently, evtchn_fifo_set_pending() will mark the event as PENDING even
if it fails to lock the FIFO event queue(s), or if the guest has not
initialized the FIFO control block for the target vCPU. A well-behaved
guest should never trigger either of these cases.

There is no good reason to set the PENDING bit (the guest should not
depend on this behaviour anyway) or check for pollers in such corner
cases, so skip that. In fact, both the comment above the for loop and
the commit message for

 41a822c39263 xen/events: rework fifo queue locking

suggest that the bit should be set after the FIFO queue(s) are locked.

Take the opportunity to rename the was_pending variable (flipping its
sense) and switch to the standard bool type.

Suggested-by: David Vrabel <dvrabel@amazon.co.uk>
Signed-off-by: Raphael Ning <raphning@amazon.com>
---
 xen/common/event_fifo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index ed4d3beb10f3..6c74ccebebb7 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -165,7 +165,7 @@ static void cf_check evtchn_fifo_set_pending(
     unsigned int port;
     event_word_t *word;
     unsigned long flags;
-    bool_t was_pending;
+    bool_t check_pollers = false;
     struct evtchn_fifo_queue *q, *old_q;
     unsigned int try;
     bool linked = true;
@@ -226,8 +226,6 @@ static void cf_check evtchn_fifo_set_pending(
         spin_unlock_irqrestore(&q->lock, flags);
     }
 
-    was_pending = guest_test_and_set_bit(d, EVTCHN_FIFO_PENDING, word);
-
     /* If we didn't get the lock bail out. */
     if ( try == 3 )
     {
@@ -249,6 +247,8 @@ static void cf_check evtchn_fifo_set_pending(
         goto unlock;
     }
 
+    check_pollers = !guest_test_and_set_bit(d, EVTCHN_FIFO_PENDING, word);
+
     /*
      * Link the event if it unmasked and not already linked.
      */
@@ -314,7 +314,7 @@ static void cf_check evtchn_fifo_set_pending(
                                  &v->evtchn_fifo->control_block->ready) )
         vcpu_mark_events_pending(v);
 
-    if ( !was_pending )
+    if ( check_pollers )
         evtchn_check_pollers(d, port);
 }
 
-- 
2.32.0


