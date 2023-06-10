Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E1C72AEC5
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 22:41:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546628.853661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q85Os-000301-23; Sat, 10 Jun 2023 20:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546628.853661; Sat, 10 Jun 2023 20:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q85Or-0002wk-VB; Sat, 10 Jun 2023 20:41:29 +0000
Received: by outflank-mailman (input) for mailman id 546628;
 Sat, 10 Jun 2023 20:41:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujxR=B6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q85Oq-0001iX-Db
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 20:41:28 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b03a00f-07cf-11ee-8611-37d641c3527e;
 Sat, 10 Jun 2023 22:41:26 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BC3FA32003F4;
 Sat, 10 Jun 2023 16:41:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 10 Jun 2023 16:41:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Jun 2023 16:41:22 -0400 (EDT)
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
X-Inumbo-ID: 2b03a00f-07cf-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1686429683; x=1686516083; bh=1qqdCLnk8X
	ZZUpiOqZUTKehWt/5RjR4FGu3vEMkB/ek=; b=RNwmi56tXuI4aB88VxWVJYjN5P
	Hw7IIvlioRJaQi72PlbFI1iAp/W+LJONn/SSjyoyfgXBQxQ0KA7W7Mc/KqThl2zb
	af8HmrPGpQtGd5GC+cOL3ZZ1SK6m5ZrWdVG8ihyzvV6gblHO/C7ZBXhAWREuWsck
	P/g4bx+3HxvTx6+/yDS2c5DBMMQFrL8GiOJhY5YudZtIlNTDo5KOoDHvYPEDONHZ
	F88JNfxJWhVbTrlVR/L2/pabGG7mxCdMlpxtpJBG+2Us+QaQYXB33WJPfePwC5GE
	HYQ82LY3dbImVJt0Rzh8ItSiO2PaLZocQKmv0t91vqNopAb+hirVaAjqVSxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1686429683; x=
	1686516083; bh=1qqdCLnk8XZZUpiOqZUTKehWt/5RjR4FGu3vEMkB/ek=; b=e
	1mOAh0xXnK84ZU62LsR9vciVBb905DBIyIteDQ5rBbSwWerkYe1jAZAYBdrFYzWh
	m2vltF2suhspVwl1kvNwOYOEmLgTez3EoBzzaEzy0NDKiAnhO2dG/n16qg+LfJE3
	Ft668WUWrvb/WZI83UP9j76y7XZbSFj6XDjsD02ZW+CmT65nGehwF0TIXGAI/WLs
	BiUNxC5ohQYin08dwphHgImXf+s6laXlgOPZWB5Mzs482WbPW4ilyswaqrDY2cXe
	0IlaI2nVmKDzFENJfYkN6yLiJRrt2qq1DqnduA9nMIAk3AMNfUvmJruejW8eVrds
	/H3018pqeMwbr9tpnAUEg==
X-ME-Sender: <xms:89-EZBPPQkFmBUJ0gud1RkOc0Py4z0fUW1gvJXXzBjiFXmn6AbOyuA>
    <xme:89-EZD9Z93YcxwNqIlKcOwZckhWj8X1jx2Hy_rG0toDjJJkSdQb3I9xeVM0JjQTjY
    9lGnXcE2chdkZE>
X-ME-Received: <xmr:89-EZATy88DDpm9MKdEI1W9JxmKwcqqkF3Z4NZHyMCdNxwT_MriGQAuKT4FAfKcxcGLtU0lRkq0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedutddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:89-EZNsP4SvUHS5WfyHzoSSCdPHktbzD9FyQ7NiTa2DGQTBIiPe7NQ>
    <xmx:89-EZJdGOqfqeTrSlvYm1JamcAjElSKmbrsUqeO0EqMf6g_7rgVfjA>
    <xmx:89-EZJ1UVhU4_ZWZ8lg6XfKoI0CenNKCwwVgrp9S8zR28CiGfVU4TQ>
    <xmx:89-EZMWteewgvf_6iu0kUYfW1H0XHyXVVTxFAMDx5YGxnto3YouPzA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Lee Jones <lee@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 4/4] Reject NUL bytes in xenstore nodes
Date: Sat, 10 Jun 2023 16:40:44 -0400
Message-Id: <20230610204044.3653-5-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230610204044.3653-1-demi@invisiblethingslab.com>
References: <20230610204044.3653-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This rejects bogus xenstore node values that include interior NUL
bytes.  These would be truncated by functions that expect NUL-terminated
strings.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/xen/xenbus/xenbus_xs.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index 12e02eb01f5991b31db451cc57037205359b347f..7cb2a22a7698ac40c81add23476594d9f27de8d0 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -569,16 +569,20 @@ int xenbus_scanf(struct xenbus_transaction t,
 		 const char *dir, const char *node, const char *fmt, ...)
 {
 	va_list ap;
-	int ret;
+	int ret = 0;
+	unsigned int len;
 	char *val;
 
-	val = xenbus_read(t, dir, node, NULL);
+	val = xenbus_read(t, dir, node, &len);
 	if (IS_ERR(val))
 		return PTR_ERR(val);
+	if (strlen(val) != len)
+		goto bad;
 
 	va_start(ap, fmt);
 	ret = vsscanf(val, fmt, ap);
 	va_end(ap);
+bad:
 	kfree(val);
 	/* Distinctive errno. */
 	if (ret == 0)
@@ -636,15 +640,18 @@ int xenbus_gather(struct xenbus_transaction t, const char *dir, ...)
 	while (ret == 0 && (name = va_arg(ap, char *)) != NULL) {
 		const char *fmt = va_arg(ap, char *);
 		void *result = va_arg(ap, void *);
+		unsigned len;
 		char *p;
 
-		p = xenbus_read(t, dir, name, NULL);
+		p = xenbus_read(t, dir, name, &len);
 		if (IS_ERR(p)) {
 			ret = PTR_ERR(p);
 			break;
 		}
-		if (fmt) {
-			if (sscanf(p, fmt, result) == 0)
+		if (strlen(p) != len)
+			ret = -EINVAL;
+		else if (fmt) {
+			if (sscanf(p, fmt, result) <= 0)
 				ret = -EINVAL;
 			kfree(p);
 		} else
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


