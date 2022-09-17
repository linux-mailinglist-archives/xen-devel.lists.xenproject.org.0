Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED085BB5B0
	for <lists+xen-devel@lfdr.de>; Sat, 17 Sep 2022 04:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408255.651044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNz2-0000vE-Mm; Sat, 17 Sep 2022 02:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408255.651044; Sat, 17 Sep 2022 02:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNz2-0000sG-Ji; Sat, 17 Sep 2022 02:55:08 +0000
Received: by outflank-mailman (input) for mailman id 408255;
 Sat, 17 Sep 2022 02:55:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=os+o=ZU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oZNw2-0002wS-3w
 for xen-devel@lists.xenproject.org; Sat, 17 Sep 2022 02:52:02 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2f6f342-3633-11ed-9761-273f2230c3a0;
 Sat, 17 Sep 2022 04:51:59 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0D4AB5C00A9;
 Fri, 16 Sep 2022 22:51:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 16 Sep 2022 22:51:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 22:51:57 -0400 (EDT)
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
X-Inumbo-ID: b2f6f342-3633-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663383119; x=1663469519; bh=IOSjuCul4w
	NhkTi/wMpmUnl0G6R+XqWCZmHQlR92CgM=; b=qiyCpUjq+YPAbKEg+TibaXgOFr
	KJk2VQViikzQS2hZcUWFZjbb0BdDjTHcWXrcXiokaEJU02Rs5RFq8scf4E0XMNFw
	g+Mnqj8jz8MHM3PS8kEJw3+YqL+5ya4HHnQpel+tO2AN8Z7Z0BUDCOzOEKw4qqyV
	Egva0vf2N4UAGXOzg/zt/tVYHm5szmxsD4BX5rY95MwrEuccZMx2AP+XQD8i+z1o
	jlJymD7FBp8IkyVwKivpyKi/DzhqVfjxIhwwAZxOx6v8CMx8Sx+V+lIq0ifbyse9
	LgoEIrmvpr0YWgQh/UVIVUuPHe+bdieKQ1kAjdErkz18WlZTwDFtpTFUYzNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663383119; x=
	1663469519; bh=IOSjuCul4wNhkTi/wMpmUnl0G6R+XqWCZmHQlR92CgM=; b=h
	b9tVyw/6wwWYFb8YC5xfiNup5lirrUJRu8AJJqCF/z9Prl0B4bWiw6iOaHyN/rVC
	XT+VT5d4d6R0BvhVtK8mgk9DtYjAOX/yRjzYJ26zx0ZqIotNGdvAfZGB5s7XGR1R
	mFbS8zL2TB21GgcuYkOdEQdPnKORlzDdHe6hHjuoNQp7Jn35d5xdIMcpPApb2b6g
	YsgX9H1XFzG3ztUTrPf1IJiti3PEt/ac4bv6dChHbXoa94kWvNsVCzaS+qPueMZV
	ftmGW+Wcbo71r0+VG2WCTHegVLW6R+7/xmOem5Z8/3gARPBsTTicZzr5rXjkosJU
	G5o06IIMozrQTfA5tV8jA==
X-ME-Sender: <xms:TjYlY3D9xJ5Xr_wk0l1ebdcd56xrFt00I2pq4aifkW37zvN2XEWGwA>
    <xme:TjYlY9ikyKA-8ZoUTFKyQqQ6mC8eVu-4sCfnqNhkCODEDew5uYBxxA2l3-IlQBG57
    9XTfY4UIk9Ijg>
X-ME-Received: <xmr:TjYlYymYCPj5A7p7iKkFi64Z_nQ4_ybxjgAcO31K4gYLPDKPW6mM1sILSj-LPQvfavOp3ao5BneuofbM6Ha4z6xmqidxoZ1Mq5G9bnUSgYyJ9B1K2MhUyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:TjYlY5wLDW1aYdLBDA-ovSnwkusjL4tY1rbZwXqKP7_TXp5FrPoWuA>
    <xmx:TjYlY8TdD1-FmHvN2_ot_SBM3DG-ZBmb22iRqa9KxpFRK_XOQ1xiZA>
    <xmx:TjYlY8YglqQxuCfC4e0xf7O_ZXLH11yoPdppq20xaiVdOp9xGc865g>
    <xmx:TzYlYxJqpRxPsqBbjVz8GTu6vOkjFeQa0T7Eg2v31qrdvJf_jy0adg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 11/11] drivers/char: add console=ehci as an alias for console=dbgp
Date: Sat, 17 Sep 2022 04:51:30 +0200
Message-Id: <6832b5dd97a1cd09ea8060e64fe1e8c8310e4974.1663383053.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make it consistent with console=xhci.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 docs/misc/xen-command-line.pandoc | 4 ++--
 xen/drivers/char/serial.c         | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1c755563c40d..74b519f0c5bd 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -409,7 +409,7 @@ The following are examples of correct specifications:
 Specify the size of the console ring buffer.
 
 ### console
-> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | xhci | none ]`
+> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | none ]`
 
 > Default: `console=com1,vga`
 
@@ -428,7 +428,7 @@ cleared.  This allows a single port to be shared by two subsystems
 `pv` indicates that Xen should use Xen's PV console. This option is
 only available when used together with `pv-in-pvh`.
 
-`dbgp` indicates that Xen should use a USB2 debug port.
+`dbgp` or `ehci` indicates that Xen should use a USB2 debug port.
 
 `xhci` indicates that Xen should use a USB3 debug port.
 
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index 9d9445039232..00efe69574f3 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -311,6 +311,12 @@ int __init serial_parse_handle(const char *conf)
         goto common;
     }
 
+    if ( !strncmp(conf, "ehci", 4) && (!conf[4] || conf[4] == ',') )
+    {
+        handle = SERHND_DBGP;
+        goto common;
+    }
+
     if ( !strncmp(conf, "xhci", 4) && (!conf[4] || conf[4] == ',') )
     {
         handle = SERHND_XHCI;
-- 
git-series 0.9.1

