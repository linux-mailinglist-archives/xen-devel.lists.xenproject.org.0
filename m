Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C222AD00
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 12:52:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyYpO-00017L-Fz; Thu, 23 Jul 2020 10:51:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyYpM-00017D-V8
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 10:51:52 +0000
X-Inumbo-ID: 82f20e01-ccd2-11ea-a278-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82f20e01-ccd2-11ea-a278-12813bfff9fa;
 Thu, 23 Jul 2020 10:51:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50C07AF2D;
 Thu, 23 Jul 2020 10:51:59 +0000 (UTC)
Subject: [PATCH 1/2] lockprof: don't leave locks uninitialized upon allocation
 failure
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <47f5478d-2f46-656c-0882-121aebc77f39@suse.com>
Message-ID: <7c4f50ce-6212-2f16-c9c5-c9af450b10ba@suse.com>
Date: Thu, 23 Jul 2020 12:51:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <47f5478d-2f46-656c-0882-121aebc77f39@suse.com>
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

Even if a specific struct lock_profile instance can't be allocated, the
lock itself should still be functional. As this isn't a production use
feature, also log a message in the event that the profiling struct can't
be allocated.

Fixes: d98feda5c756 ("Make lock profiling usable again")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -103,10 +103,16 @@ struct lock_profile_qhead {
     do {                                                                      \
         struct lock_profile *prof;                                            \
         prof = xzalloc(struct lock_profile);                                  \
-        if (!prof) break;                                                     \
+        (s)->l = (spinlock_t)_SPIN_LOCK_UNLOCKED(prof);                       \
+        if ( !prof )                                                          \
+        {                                                                     \
+            printk(XENLOG_WARNING                                             \
+                   "lock profiling unavailable for %p(%d)'s " #l "\n",        \
+                   s, (s)->profile_head.idx);                                 \
+            break;                                                            \
+        }                                                                     \
         prof->name = #l;                                                      \
         prof->lock = &(s)->l;                                                 \
-        (s)->l = (spinlock_t)_SPIN_LOCK_UNLOCKED(prof);                       \
         prof->next = (s)->profile_head.elem_q;                                \
         (s)->profile_head.elem_q = prof;                                      \
     } while(0)


