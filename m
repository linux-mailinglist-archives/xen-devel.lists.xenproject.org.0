Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF56027AC5E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 13:00:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqtj-0005aY-1O; Mon, 28 Sep 2020 11:00:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMqth-0005Zc-IQ
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 11:00:45 +0000
X-Inumbo-ID: 83155394-b879-44aa-8d8b-10939de9ade9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83155394-b879-44aa-8d8b-10939de9ade9;
 Mon, 28 Sep 2020 11:00:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601290843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3olIW+XDYq9LhGrju2pwubOlX/CoG8pdd5sHxB6Izf8=;
 b=JzrFbwMirq7i4Y+9Ww9eJz+8aieMIvflIsJqg5T8QZSCQrpHPPde+/Bop3AdyjSBdEPSgP
 BNQTHcA/MA9wBSbq6aQbblJ2XuBFAt1uV68MUp9uN8ul3aXhsYMiD+y7HpQZ2YRFtmbE6q
 OZFDLM7W0f6QPXocv94cunGttDMnC18=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1A77AE07;
 Mon, 28 Sep 2020 11:00:43 +0000 (UTC)
Subject: [PATCH 09/12] evtchn: move FIFO-private struct declarations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Message-ID: <de54075d-2d2f-e4ca-8252-c6f333571027@suse.com>
Date: Mon, 28 Sep 2020 13:00:43 +0200
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

There's no need to expose them.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wonder whether we shouldn't do away with event_fifo.h altogether.

--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -21,6 +21,27 @@
 
 #include <public/event_channel.h>
 
+struct evtchn_fifo_queue {
+    uint32_t *head; /* points into control block */
+    uint32_t tail;
+    uint8_t priority;
+    spinlock_t lock;
+};
+
+struct evtchn_fifo_vcpu {
+    struct evtchn_fifo_control_block *control_block;
+    struct evtchn_fifo_queue queue[EVTCHN_FIFO_MAX_QUEUES];
+};
+
+#define EVTCHN_FIFO_EVENT_WORDS_PER_PAGE (PAGE_SIZE / sizeof(event_word_t))
+#define EVTCHN_FIFO_MAX_EVENT_ARRAY_PAGES \
+    (EVTCHN_FIFO_NR_CHANNELS / EVTCHN_FIFO_EVENT_WORDS_PER_PAGE)
+
+struct evtchn_fifo_domain {
+    event_word_t *event_array[EVTCHN_FIFO_MAX_EVENT_ARRAY_PAGES];
+    unsigned int num_evtchns;
+};
+
 static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
                                                        unsigned int port)
 {
--- a/xen/include/xen/event_fifo.h
+++ b/xen/include/xen/event_fifo.h
@@ -9,27 +9,6 @@
 #ifndef __XEN_EVENT_FIFO_H__
 #define __XEN_EVENT_FIFO_H__
 
-struct evtchn_fifo_queue {
-    uint32_t *head; /* points into control block */
-    uint32_t tail;
-    uint8_t priority;
-    spinlock_t lock;
-};
-
-struct evtchn_fifo_vcpu {
-    struct evtchn_fifo_control_block *control_block;
-    struct evtchn_fifo_queue queue[EVTCHN_FIFO_MAX_QUEUES];
-};
-
-#define EVTCHN_FIFO_EVENT_WORDS_PER_PAGE (PAGE_SIZE / sizeof(event_word_t))
-#define EVTCHN_FIFO_MAX_EVENT_ARRAY_PAGES \
-    (EVTCHN_FIFO_NR_CHANNELS / EVTCHN_FIFO_EVENT_WORDS_PER_PAGE)
-
-struct evtchn_fifo_domain {
-    event_word_t *event_array[EVTCHN_FIFO_MAX_EVENT_ARRAY_PAGES];
-    unsigned int num_evtchns;
-};
-
 int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
 int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
 void evtchn_fifo_destroy(struct domain *domain);


