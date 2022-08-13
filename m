Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE38B591837
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 03:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386018.621900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7Y-0001hG-MH; Sat, 13 Aug 2022 01:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386018.621900; Sat, 13 Aug 2022 01:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7Y-0001dD-Hn; Sat, 13 Aug 2022 01:39:24 +0000
Received: by outflank-mailman (input) for mailman id 386018;
 Sat, 13 Aug 2022 01:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oMg7W-0000pT-Gk
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 01:39:22 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0ea0dc3-1aa8-11ed-bd2e-47488cf2e6aa;
 Sat, 13 Aug 2022 03:39:21 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 05FBD5C00C6;
 Fri, 12 Aug 2022 21:39:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 12 Aug 2022 21:39:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 21:39:19 -0400 (EDT)
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
X-Inumbo-ID: c0ea0dc3-1aa8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660354761; x=1660441161; bh=CuU0vkjyg0
	0xrTN5+CAVp9rNToc1sgWnerp78tEHmck=; b=PlOGpumzCjezGXiu+VfkefLgnX
	eY+J1OwLIwHoBYrigFDSdC5w8fjkEAhX2EAwJPA8e1gMf3bqkTBtPv1DrFzLv43Y
	0PheyiEBREI9vZGmpCb0MkvpB/OmnkWlcuU581IlvF0vKM+V+UMSdmhi3Vw+z/VJ
	00imXz2OTjLygfAZGanVv2FP7rBkH/Z4D3Akp8XykJifDYwalYnc6ebtzqB9b7Q/
	zpX8GasztTQgbfUMiI3vMkDFBoaxEWol7alssCsd3XNQkuKHpCpZxmc18qwiujkJ
	OwxRMBS4L/F7lLIhIG577A0IIcxc7w6/L/FrsEs4qDzedu7jER0ZtWqWLOfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660354761; x=
	1660441161; bh=CuU0vkjyg00xrTN5+CAVp9rNToc1sgWnerp78tEHmck=; b=c
	T45S7SlU06hHV55pnp3DaxNJrcu8k760eJxr/tg/tFzK036oFBuhKyTOra2+kAiq
	fvOe7Ib34/ES09jntn6smhO1A11A5emH9ltGAXtqns+a9lOzFSbO3BMUAFAFDknv
	834pvgPuebO3TqoC3sXSn2Gv0qqYcFK49WyUCIQp9eMk2WwDDRCBLY17ZIXRnMWw
	qSrPH+Zb2Tg9s+Gzqh38pWTn+PfqAWPfhc/Qf2ncnc8t1FuWqsI91RiFAF7FB5tQ
	jRm39anEvnUjbBb1shCJpwhU9Bxa5CWXeWRvLXlI0o9vsJ5ztkIACw6jeYGA109b
	1bMIBCY+IXk7gVEp3ikCQ==
X-ME-Sender: <xms:yAD3YtTa1QygdTgl3D3sJTHEj65Qp_GjSpPiiXcR1Wt__QtPjVPyMA>
    <xme:yAD3YmzADnXI6dE73jBoFnZfKa-73gwBkHugivL6mljD80_iNXupWxEKl4D344CYw
    31UxAzbCqRsyQ>
X-ME-Received: <xmr:yAD3Yi1OGRva8Lu8PBTgX2IkAvu6_HdtxK2-uBnVro1hKddQuJqf3YUW4F-i140w0qhvNXlncx0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegjedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:yAD3YlAjYqJ9eFA-HGKw9eLhDKC8fh4i40pPKcMvzImJerxNcpM7Cw>
    <xmx:yAD3YmithnmxrMqAjAMALIXZZkdlweJYqLwopEaYqulg34YoudI3MA>
    <xmx:yAD3Yprh6Upe2ZnPtEYeQdc1Zbej5PGTKQmhHHq1Xr7RlD9SJr4FIw>
    <xmx:yQD3YoYzkQSi7jexUeqRFyipvQAc-o72rVYQ8Pw8M-1abXqAZuB7Kw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 04/11] drivers/char: make serial_parse_handle take const argument
Date: Sat, 13 Aug 2022 03:38:54 +0200
Message-Id: <c30950363e09ab1298ac2a692822252762a417d6.1660354597.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It doesn't modify it, and it will be necessary in a subsequent patch.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/serial.c | 2 +-
 xen/include/xen/serial.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index f6c944bd305b..47899222cef8 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -301,7 +301,7 @@ char serial_getc(int handle)
     return c & 0x7f;
 }
 
-int __init serial_parse_handle(char *conf)
+int __init serial_parse_handle(const char *conf)
 {
     int handle, flags = 0;
 
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 181e026967bc..4cd4ae5e6f1c 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -109,7 +109,7 @@ void serial_init_postirq(void);
 void serial_endboot(void);
 
 /* Takes a config string and creates a numeric handle on the COM port. */
-int serial_parse_handle(char *conf);
+int serial_parse_handle(const char *conf);
 
 /* Transmit a single character via the specified COM port. */
 void serial_putc(int handle, char c);
-- 
git-series 0.9.1

