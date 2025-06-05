Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A071ACE797
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 02:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006089.1385349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMykW-0003kX-VZ; Thu, 05 Jun 2025 00:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006089.1385349; Thu, 05 Jun 2025 00:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMykW-0003iT-Sy; Thu, 05 Jun 2025 00:46:28 +0000
Received: by outflank-mailman (input) for mailman id 1006089;
 Thu, 05 Jun 2025 00:46:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nB46=YU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uMykV-0003dI-U2
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 00:46:27 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8219daa8-41a6-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 02:46:25 +0200 (CEST)
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
X-Inumbo-ID: 8219daa8-41a6-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749084383; x=1749343583;
	bh=ytJlHdADwkkLmr+mgrJUrJhb0F+8LfeAiZe0wZX+P8A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=EP6C7l8fDk2SwJtGOgSdTXBfj0wrG/AVrppMfyQE44MTZmrM3JLHDgfhQPk8HnxUq
	 scVEGoWLjHzM4dAbro+EvoEj6hfF2EpwiESi/o7htny+2KBdoIGgY8VqsDbgLJHRLf
	 QfQL36Yc38v+1a+9/qeNS6hqWpT+uAwiVlbqRoezFQX5NYPXbct1mcNuLaJ2zDO5s5
	 QQ0gF8BMgiKrYO8yn1rc4PyP43mQY71Fv4+Egumd3mGw8QiEgAYW5XELmxNihQWKjl
	 Qi+PwUqZOCw1KwpyOkDxDhgzJTSpGfaXMKZQCHRjU0LdNKkA5R5yvCvjz3bCK7QCk1
	 aU64wecrYevPg==
Date: Thu, 05 Jun 2025 00:46:17 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 1/2] xen/console: introduce CONSOLE_PREFIX
Message-ID: <20250605004601.1142090-2-dmukhin@ford.com>
In-Reply-To: <20250605004601.1142090-1-dmukhin@ford.com>
References: <20250605004601.1142090-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: fe120c6f48d95d38ba42437ca80885342328b0b0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add CONSOLE_PREFIX symbol to keep the prefix of the hypervisor's diagnostic
messages.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- n/a
---
 xen/drivers/char/console.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 9a9836ba91..a8cb6363ea 100644
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
@@ -1014,7 +1017,7 @@ static void vprintk_common(const char *fmt, va_list a=
rgs, const char *prefix)
=20
 void vprintk(const char *fmt, va_list args)
 {
-    vprintk_common(fmt, args, "(XEN) ");
+    vprintk_common(fmt, args, CONSOLE_PREFIX);
 }
=20
 void printk(const char *fmt, ...)
@@ -1285,7 +1288,7 @@ int __printk_ratelimit(int ratelimit_ms, int ratelimi=
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



