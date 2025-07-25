Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D333B1261F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 23:25:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058563.1426073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufPuU-0005pJ-Ux; Fri, 25 Jul 2025 21:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058563.1426073; Fri, 25 Jul 2025 21:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufPuU-0005nY-SE; Fri, 25 Jul 2025 21:24:58 +0000
Received: by outflank-mailman (input) for mailman id 1058563;
 Fri, 25 Jul 2025 21:24:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PByu=2G=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ufPuT-0005nS-US
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 21:24:57 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce8ec42b-699d-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 23:24:54 +0200 (CEST)
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
X-Inumbo-ID: ce8ec42b-699d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753478693; x=1753737893;
	bh=EaarDKVP8TReyQs/VDoLwcme9SKCe4a5A6rpuZDeukk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=e03DzFBFD+hYERc6aQ1NyEmcvKkl5ptmt157LHqAMFH4iasJXAF9+AZKWIlOqSeSe
	 3HtXl806TnZIf+Uylbj2/FfKJXqYaSEj4wKZBcNMrFBxjC4ob/wJ30r1Hm4oagh1oG
	 0kUjsBDz0Jsz52tBmerxcflR9UBLsPH/21huIlHru2iUwAPNgDxI9NeMkGVq2uFd/m
	 fr4anJW/EgiTBFeS1p99rcNyq7iEW/ocg+Y0gc6mnDKuz25nc9Qo6FNlrl5nUAlH12
	 NTy+qepZKDkKb/oZp44Z7hBW2ToNtDbn8C4ZjUhHKRaG54fevV4aWz8DUivdRprsXP
	 wwTLyrU+Z7RhA==
Date: Fri, 25 Jul 2025 21:24:48 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1] xen/console: remove __printk_ratelimit()
Message-ID: <20250725212235.753363-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0e43bf99a3625267a7494b3358aff87c243e061a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

__printk_ratelimit() is never used outside of the console driver.
Remove it from the lib.h and merge with the public printk_ratelimit().

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 29 ++++++++++++-----------------
 xen/include/xen/lib.h      |  1 -
 2 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 75fa033ce74d..80f8f2ed1bae 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -979,7 +979,7 @@ static void vprintk_common(const char *fmt, va_list arg=
s, const char *prefix)
     char         *p, *q;
     unsigned long flags;
=20
-    /* console_lock can be acquired recursively from __printk_ratelimit().=
 */
+    /* console_lock can be acquired recursively from printk_ratelimit(). *=
/
     local_irq_save(flags);
     rspin_lock(&console_lock);
     state =3D &this_cpu(state);
@@ -1266,13 +1266,19 @@ void console_end_sync(void)
     atomic_dec(&print_everything);
 }
=20
+/* minimum time in ms between messages */
+static int __read_mostly printk_ratelimit_ms =3D 5 * 1000;
+
+/* number of messages we send before ratelimiting */
+static int __read_mostly printk_ratelimit_burst =3D 10;
+
 /*
  * printk rate limiting, lifted from Linux.
  *
  * This enforces a rate limit: not more than one kernel message
  * every printk_ratelimit_ms (millisecs).
  */
-int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst)
+int printk_ratelimit(void)
 {
     static DEFINE_SPINLOCK(ratelimit_lock);
     static unsigned long toks =3D 10 * 5 * 1000;
@@ -1288,13 +1294,13 @@ int __printk_ratelimit(int ratelimit_ms, int rateli=
mit_burst)
     spin_lock_irqsave(&ratelimit_lock, flags);
     toks +=3D ms - last_msg;
     last_msg =3D ms;
-    if ( toks > (ratelimit_burst * ratelimit_ms))
-        toks =3D ratelimit_burst * ratelimit_ms;
-    if ( toks >=3D ratelimit_ms )
+    if ( toks > (printk_ratelimit_burst * printk_ratelimit_ms) )
+        toks =3D printk_ratelimit_burst * printk_ratelimit_ms;
+    if ( toks >=3D printk_ratelimit_ms )
     {
         int lost =3D missed;
         missed =3D 0;
-        toks -=3D ratelimit_ms;
+        toks -=3D printk_ratelimit_ms;
         spin_unlock(&ratelimit_lock);
         if ( lost )
         {
@@ -1316,17 +1322,6 @@ int __printk_ratelimit(int ratelimit_ms, int ratelim=
it_burst)
     return 0;
 }
=20
-/* minimum time in ms between messages */
-static int __read_mostly printk_ratelimit_ms =3D 5 * 1000;
-
-/* number of messages we send before ratelimiting */
-static int __read_mostly printk_ratelimit_burst =3D 10;
-
-int printk_ratelimit(void)
-{
-    return __printk_ratelimit(printk_ratelimit_ms, printk_ratelimit_burst)=
;
-}
-
 /*
  * **************************************************************
  * ********************** Error-report **************************
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index e63ec5039f92..a33c25dd1610 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -80,7 +80,6 @@ extern void guest_printk(const struct domain *d, const ch=
ar *fmt, ...)
     __attribute__ ((format (printf, 2, 3)));
 extern void noreturn panic(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2)));
-extern int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst);
 extern int printk_ratelimit(void);
=20
 #define gprintk(lvl, fmt, args...) \
--=20
2.34.1



