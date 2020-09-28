Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8156B27AC4E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 12:56:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqpt-0004Gb-OJ; Mon, 28 Sep 2020 10:56:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMqps-0004GP-5j
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 10:56:48 +0000
X-Inumbo-ID: ab44c1a4-0de3-4344-a2d2-3ea9938d2d36
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab44c1a4-0de3-4344-a2d2-3ea9938d2d36;
 Mon, 28 Sep 2020 10:56:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601290606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIibg70Z0Q3OYMfIABU4YuhHLrFzABuQ6LAinJpQr0A=;
 b=TX8K3Tpzn/+GVO1e9eEBy6N5AzwXkssDeYfUMZS9tELnLkKWaDCjebetJeBz0QeeuxS584
 w9BKIxJaTSKwVLQuW+pbHhGyh/F9CxNBKfDmFWiG0ErJj7yrLlv3jEYZnekcNchANxLO+Y
 xIzETASNPc1shtBDmMWvFJjE6SE6PKc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F13DEAD82;
 Mon, 28 Sep 2020 10:56:45 +0000 (UTC)
Subject: [PATCH 02/12] evtchn: avoid race in get_xen_consumer()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Message-ID: <b8f87009-ba1a-dfaf-e130-03c5500f76c4@suse.com>
Date: Mon, 28 Sep 2020 12:56:45 +0200
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

There's no global lock around the updating of this global piece of data.
Make use of cmpxchg() to avoid two entities racing with their updates.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: Initially I used cmpxchgptr() here, until realizing Arm doesn't
     have it. It's slightly more type-safe than cmpxchg() (requiring
     all arguments to actually be pointers), so I now wonder whether Arm
     should gain it (perhaps simply by moving the x86 implementation to
     xen/lib.h), or whether we should purge it from x86 as being
     pointless.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -57,7 +57,8 @@
  * with a pointer, we stash them dynamically in a small lookup array which
  * can be indexed by a small integer.
  */
-static xen_event_channel_notification_t xen_consumers[NR_XEN_CONSUMERS];
+static xen_event_channel_notification_t __read_mostly
+    xen_consumers[NR_XEN_CONSUMERS];
 
 /* Default notification action: wake up from wait_on_xen_event_channel(). */
 static void default_xen_notification_fn(struct vcpu *v, unsigned int port)
@@ -81,7 +82,7 @@ static uint8_t get_xen_consumer(xen_even
     for ( i = 0; i < ARRAY_SIZE(xen_consumers); i++ )
     {
         if ( xen_consumers[i] == NULL )
-            xen_consumers[i] = fn;
+            (void)cmpxchg(&xen_consumers[i], NULL, fn);
         if ( xen_consumers[i] == fn )
             break;
     }


