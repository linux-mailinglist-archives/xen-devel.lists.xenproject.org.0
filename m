Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D43B293E26
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 16:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9648.25349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUsJF-0000fP-TP; Tue, 20 Oct 2020 14:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9648.25349; Tue, 20 Oct 2020 14:08:17 +0000
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
	id 1kUsJF-0000ez-Q3; Tue, 20 Oct 2020 14:08:17 +0000
Received: by outflank-mailman (input) for mailman id 9648;
 Tue, 20 Oct 2020 14:08:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUsJE-0000en-Pe
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:08:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a56a16c-0143-4418-9ae9-953674bb583b;
 Tue, 20 Oct 2020 14:08:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B588AC6A;
 Tue, 20 Oct 2020 14:08:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUsJE-0000en-Pe
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:08:16 +0000
X-Inumbo-ID: 9a56a16c-0143-4418-9ae9-953674bb583b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9a56a16c-0143-4418-9ae9-953674bb583b;
	Tue, 20 Oct 2020 14:08:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603202894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gz4CIzBYeY0DzdSnosyvNHqxygRimtPUEZJgMtPh2JM=;
	b=ppTkP9wcauH3/HIG64Srdl/1gMbZuRl4B1z8mW6y8gH1+CfKlA8rJbDQZPk/vBWUtF4U8a
	UUgmRJRupzrTHZAJ7VpbNzpfGfoGz1IHp95oMVQHhr+a095GifJ73GKwK5GSjxB6+oTgCZ
	3rKddf3MuspuylQRA7r6zfF36jHL084=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2B588AC6A;
	Tue, 20 Oct 2020 14:08:14 +0000 (UTC)
Subject: [PATCH v2 1/8] evtchn: avoid race in get_xen_consumer()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Message-ID: <9ecafa4d-db5b-20a2-3a9d-6a6cda91252c@suse.com>
Date: Tue, 20 Oct 2020 16:08:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no global lock around the updating of this global piece of data.
Make use of cmpxchgptr() to avoid two entities racing with their
updates.

While touching the functionality, mark xen_consumers[] read-mostly (or
else the if() condition could use the result of cmpxchgptr(), writing to
the slot unconditionally).

The use of cmpxchgptr() here points out (by way of clang warning about
it) that its original use of const was slightly wrong. Adjust the
placement, or else undefined behavior of const qualifying a function
type will result.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use (and hence generalize) cmpxchgptr(). Add comment. Expand /
    adjust description.

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
@@ -80,8 +81,9 @@ static uint8_t get_xen_consumer(xen_even
 
     for ( i = 0; i < ARRAY_SIZE(xen_consumers); i++ )
     {
+        /* Use cmpxchgptr() in lieu of a global lock. */
         if ( xen_consumers[i] == NULL )
-            xen_consumers[i] = fn;
+            cmpxchgptr(&xen_consumers[i], NULL, fn);
         if ( xen_consumers[i] == fn )
             break;
     }
--- a/xen/include/asm-x86/system.h
+++ b/xen/include/asm-x86/system.h
@@ -148,13 +148,6 @@ static always_inline unsigned long cmpxc
     return prev;
 }
 
-#define cmpxchgptr(ptr,o,n) ({                                          \
-    const __typeof__(**(ptr)) *__o = (o);                               \
-    __typeof__(**(ptr)) *__n = (n);                                     \
-    ((__typeof__(*(ptr)))__cmpxchg((ptr),(unsigned long)__o,            \
-                                   (unsigned long)__n,sizeof(*(ptr)))); \
-})
-
 /*
  * Undefined symbol to cause link failure if a wrong size is used with
  * arch_fetch_and_add().
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -178,6 +178,17 @@ unsigned long long parse_size_and_unit(c
 
 uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c);
 
+/*
+ * A slightly more typesafe variant of cmpxchg() when the entities dealt with
+ * are pointers.
+ */
+#define cmpxchgptr(ptr, o, n) ({                                        \
+    __typeof__(**(ptr)) *const o_ = (o);                                \
+    __typeof__(**(ptr)) *n_ = (n);                                      \
+    ((__typeof__(*(ptr)))__cmpxchg(ptr, (unsigned long)o_,              \
+                                   (unsigned long)n_, sizeof(*(ptr)))); \
+})
+
 #define TAINT_SYNC_CONSOLE              (1u << 0)
 #define TAINT_MACHINE_CHECK             (1u << 1)
 #define TAINT_ERROR_INJECT              (1u << 2)


