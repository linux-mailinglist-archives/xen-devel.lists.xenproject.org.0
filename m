Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92C7AD08F6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 22:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008812.1387984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNdPW-0000CD-OL; Fri, 06 Jun 2025 20:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008812.1387984; Fri, 06 Jun 2025 20:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNdPW-0000Ai-LZ; Fri, 06 Jun 2025 20:11:30 +0000
Received: by outflank-mailman (input) for mailman id 1008812;
 Fri, 06 Jun 2025 20:11:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fxa/=YV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uNdPU-00009b-DZ
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 20:11:28 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b281b22-4312-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 22:11:23 +0200 (CEST)
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
X-Inumbo-ID: 6b281b22-4312-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ifubwuzdrngs7k2lxbfr5quiby.protonmail; t=1749240681; x=1749499881;
	bh=GdEbK8D2ZDN7Lr8LitkKUBGodl297aVwXtvJS3LFQEE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=dxJKsf2KYlnsgOS0HqmrmgLopO40zDwgsWN4j5QYgvjNTiMZEudh67hVi8pFTPiPr
	 xMpYOS/lGlFTxqRVY8Ho6RWV5IZ+qGwIwTnporf6ztbZl1Sw/2x+/4+dyVgTMNygVJ
	 rQIQiB18gDJUFKJst3HEd6bYd/7UgmA+JXpKm/zfaCMX1randC8DMM0XZMp0v35aC0
	 Y/vk38l9/dpC8ofoR+taD1XRJpSONu7wEyJ3G+g8bpzqTOik3mkHawW/wCxAbzCQ3X
	 EYTfk6fiSEPDB2KT/qu8pnf6sFw3iJXbUFBSwTRiKmIwXbxixcluQPWZmDDNICSZLG
	 bVgzFqvALYamg==
Date: Fri, 06 Jun 2025 20:11:17 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 1/2] xen/console: introduce CONSOLE_PREFIX
Message-ID: <20250606201102.2414022-2-dmukhin@ford.com>
In-Reply-To: <20250606201102.2414022-1-dmukhin@ford.com>
References: <20250606201102.2414022-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e1dd58d38b52f9c478d11af804f89d4558dcda61
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add CONSOLE_PREFIX symbol to keep the prefix of the hypervisor's diagnostic
messages.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- n/a
---
 xen/drivers/char/console.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index e3731bf174..6e77b4af82 100644
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
@@ -1017,7 +1020,7 @@ static void vprintk_common(const char *fmt, va_list a=
rgs, const char *prefix)
=20
 void vprintk(const char *fmt, va_list args)
 {
-    vprintk_common(fmt, args, "(XEN) ");
+    vprintk_common(fmt, args, CONSOLE_PREFIX);
 }
=20
 void printk(const char *fmt, ...)
@@ -1288,7 +1291,7 @@ int __printk_ratelimit(int ratelimit_ms, int ratelimi=
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



