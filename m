Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EACEAC988D
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 02:04:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001669.1381804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL9iE-0006uT-JU; Sat, 31 May 2025 00:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001669.1381804; Sat, 31 May 2025 00:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL9iE-0006rY-GP; Sat, 31 May 2025 00:04:34 +0000
Received: by outflank-mailman (input) for mailman id 1001669;
 Sat, 31 May 2025 00:04:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nViP=YP=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uL9iD-0006rG-R0
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:04:33 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3d9a105-3db2-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 02:04:31 +0200 (CEST)
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
X-Inumbo-ID: d3d9a105-3db2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748649870; x=1748909070;
	bh=QNtWtRFbL4X756RFISMxfDods+IHy+r3BttTuEdjCsg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QAsx8Eii+nMkyv+NMJfmJ9tXlHJxFESnipb/CZlaOY8CZPSVNiJcfinhbA4gmrKwL
	 jeoz3qI18DzteQFhIKQPQpg9U1U458XLk4n+dDR83TeVaht+5yqamXUwwxixP1eSfB
	 vxpQANc3Zw+5ZW1M4IKOdsFm9vTYY+0rB0nzQ/q27hadaMPOst3vG9uGps9Z42waRP
	 iAq5lmjjlzPW1W0n7kZn+GcIoIMSi5tG3HW789mQimxC6exX9zh25IdCs4OIQB/Iwn
	 kfMH89X8WrHPu4gyhLBoeyrsawicO84SwQBT1V5mM9mGYP1e5OQNGLrwwTlJm+tqku
	 EVyktucg/H3RQ==
Date: Sat, 31 May 2025 00:04:26 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 1/2] xen/console: introduce CONSOLE_PREFIX
Message-ID: <20250531000417.81750-2-dmukhin@ford.com>
In-Reply-To: <20250531000417.81750-1-dmukhin@ford.com>
References: <20250531000417.81750-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 79fdd7e190394e3e9e5e9c7af6db9aa47d177ddd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add CONSOLE_PREFIX symbol to keep the prefix of the hypervisor's diagnostic
messages.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c15987f5bb..27e3f8d8c6 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -61,6 +61,9 @@ enum {
     CONSOLE_ALL             =3D CONSOLE_DEFAULT | CONSOLE_RING,
 };
=20
+/* Prefix for hypervisor's diagnostic console messages. */
+#define CONSOLE_PREFIX      "(XEN) "
+
 static void console_send(const char *str, size_t len, unsigned int flags);
=20
 /* console: comma-separated list of console outputs. */
@@ -998,7 +1001,7 @@ static void vprintk_common(const char *fmt, va_list ar=
gs, const char *prefix)
=20
 void vprintk(const char *fmt, va_list args)
 {
-    vprintk_common(fmt, args, "(XEN) ");
+    vprintk_common(fmt, args, CONSOLE_PREFIX);
 }
=20
 void printk(const char *fmt, ...)
@@ -1269,7 +1272,7 @@ int __printk_ratelimit(int ratelimit_ms, int ratelimi=
t_burst)
             snprintf(lost_str, sizeof(lost_str), "%d", lost);
             /* console_lock may already be acquired by printk(). */
             rspin_lock(&console_lock);
-            printk_start_of_line("(XEN) ");
+            printk_start_of_line(CONSOLE_PREFIX);
             __putstr("printk: ");
             __putstr(lost_str);
             __putstr(" messages suppressed.\n");
--=20
2.34.1



