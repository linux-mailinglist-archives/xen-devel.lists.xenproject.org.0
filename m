Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9FA72AEC9
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 22:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546624.853650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q85Ok-0002TA-L1; Sat, 10 Jun 2023 20:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546624.853650; Sat, 10 Jun 2023 20:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q85Ok-0002RL-Hr; Sat, 10 Jun 2023 20:41:22 +0000
Received: by outflank-mailman (input) for mailman id 546624;
 Sat, 10 Jun 2023 20:41:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujxR=B6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q85Oj-0001R8-Vt
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 20:41:21 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27b34702-07cf-11ee-b232-6b7b168915f2;
 Sat, 10 Jun 2023 22:41:21 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 1EB553200406;
 Sat, 10 Jun 2023 16:41:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sat, 10 Jun 2023 16:41:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Jun 2023 16:41:16 -0400 (EDT)
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
X-Inumbo-ID: 27b34702-07cf-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1686429677; x=1686516077; bh=zmp6AIFl9e
	0+GK3wpF6apHM7zkfOYrIi/BxUW3DBWhg=; b=XntlKjsZ5vDs46MOdTHeyZvitC
	BCBFcNS/FcjDeM4XTmVsTCGqKa9sKUIJGJiUpAMewiO6Plsxy3NVeFGBq8NGsvyU
	GmoJkr+GPhlevaRfzm4zjiJ08mvreC9A/De2b9rgogK/ImxMUZ+tJHDfol/yS0JY
	oyJcRP4oaJZsBnoYCeuKke1Vs53z97j0PgY+7WY0pIvTokA4oXghbVBdBd2H7jqA
	SnO5O6nFE6IxWxE82FkqwETAUDKyE7S9s2W+43S2zcLL7M/sYgX/0j4iH7Dn2AJD
	WYgthgHRztCWMpOsWFENQrdViXckE0dd6dTtn2+Yyzlgw/HGxm0feESXHAlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1686429677; x=
	1686516077; bh=zmp6AIFl9e0+GK3wpF6apHM7zkfOYrIi/BxUW3DBWhg=; b=t
	6bzJo1vxBIOrwPu0ry6yxCkK73ctnRvQQkcD14iOjwkykEWG1hVsXieiKE6k5NMo
	MvwbMUrFgySmNmuX99+3TZrYpJsSFglclvPh7wO7WVvxg69vgP3qdKR93ihj/9jB
	jLfH17ITpjrmIWan6f75YlQiAh8RePrGRDAtizZ+dIt0mZy+/jdNG4xoEyfTsM3D
	WlbGRbmJ+mTteuu4hoWczjdPd0U/JTe7vR4PcmqZHg+pKIe+Q824PocdJtNuIXvq
	THe/4dB4TnLuN5+5t/XxTtXSXXsB7rk2uxKJVjqObJYiZyAqQn96tu8km8ynSHYI
	Cg/oDgONfxx1lW5NjptVg==
X-ME-Sender: <xms:7d-EZP6MNBO7tgYs5yer3mUsq8Jly31Tz6UdRBT_SIlG_OUu5obqYA>
    <xme:7d-EZE5YKuqmq08X16L52OcREe1N6wW0Z3h4d_h9OUJC1IOr-fyajb6z8j3F_9Y-q
    wgr2uiK0eB9i3w>
X-ME-Received: <xmr:7d-EZGcFpsIPw6BZtwy2gFpR0wEVSGAV0zIFioJ22u0kw5e_5NWqfJ8nhkgIdBtxG5puB4KLVZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedutddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekveekveegudffgffgleekudeu
    keetlefgveelhfehuedtfedvgfeklefhtefgfeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:7d-EZAJDYpvyohwhYVmYIejddYDv4rz2BZMkV-g-ziV7TJ6JDQj4PQ>
    <xmx:7d-EZDIYJi-WvrKwbA1W4dVw7QRcjTnDi7Io3KHqlmbl7_HTi_RZPQ>
    <xmx:7d-EZJzV83cvJ9av1HfcZz90vuNGmhsF9LDtJLWTfX2yMuFVveDaqw>
    <xmx:7d-EZD9o4h5_Df4PuXlad6EA-xyxIZRm3-QZWRRr_QcjtRAW5OJR3A>
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
	xen-devel@lists.xenproject.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 3/4] vsscanf(): do not skip spaces
Date: Sat, 10 Jun 2023 16:40:43 -0400
Message-Id: <20230610204044.3653-4-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230610204044.3653-1-demi@invisiblethingslab.com>
References: <20230610204044.3653-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing spaces before e.g. an integer is usually
not intended.  This was suggested by Christoph in
https://lore.kernel.org/lkml/ZIQrohcizoj4bZWx@infradead.org/.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 lib/vsprintf.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 9e53355c35b1d6260631868228ede1d178fe3325..665f6197f8313d653f67d7886b12c43942e058dd 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -3551,8 +3551,6 @@ int vsscanf(const char *buf, const char *fmt, va_list args)
 			char *s = (char *)va_arg(args, char *);
 			if (field_width == -1)
 				field_width = SHRT_MAX;
-			/* first, skip leading white space in buffer */
-			str = skip_spaces(str);
 
 			/* now copy until next white space */
 			while (*str && !isspace(*str) && field_width--)
@@ -3639,11 +3637,7 @@ int vsscanf(const char *buf, const char *fmt, va_list args)
 			return num;
 		}
 
-		/* have some sort of integer conversion.
-		 * first, skip white space in buffer.
-		 */
-		str = skip_spaces(str);
-
+		/* have some sort of integer conversion. */
 		digit = *str;
 		if (is_sign && digit == '-') {
 			if (field_width == 1)
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


