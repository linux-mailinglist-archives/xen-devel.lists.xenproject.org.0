Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0C29E6682
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:52:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849623.1264269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQKH-0003Wh-Cz; Fri, 06 Dec 2024 04:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849623.1264269; Fri, 06 Dec 2024 04:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQKH-0003UG-84; Fri, 06 Dec 2024 04:52:25 +0000
Received: by outflank-mailman (input) for mailman id 849623;
 Fri, 06 Dec 2024 04:52:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA4-0004Ka-N5
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64216c89-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 689D45C7326;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09FA7C4CED2;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 01DF2E77179;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
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
X-Inumbo-ID: 64216c89-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460099;
	bh=Im1Mvwd2pdpjWUGPxHVuvCi077+oaVpTSYKTKajHUUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YnIAFC1KOQscV16csADO8+1kFmxcwMoJQGjTMUDHNQJA23KSOad09CfF759yRqc49
	 hsY/hyXNoiVl7Uzd14gJ3vZGUG7YafwoZV2TsBPjoBqt+SXV9R4eSt7j2rsTAGwiu0
	 hVDelKN3R5paZ1L5BG/0aFmN1a1bqHxgZxsv9X7qhD7bbA0JHlHGfXmgMAG/OgzMmj
	 JphKEkeoyNNffgAqf8QyEoBXsKqH0hnAqIw7nEzsD8W9JAWbHl3wZk9RRbHu8g/n2d
	 rXBRCRn2YjwGgAGLqohLgjndBKXM9qGD19XGDqi8LKv9Hl4MIURbW/9fXzuGK8sSou
	 6YkgOd2+gctoA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:56 -0800
Subject: [PATCH v2 26/35] xen/console: make console buffer size
 configurable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-26-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=2270;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=c1A6Ce5BfoKvn4U6L7fgV9aDcO1E8jTShGZsUzA9o1w=;
 b=6nQIusazz8SZIdcS2FjkD73AGOVR3RZCfFt69UsZdbDOMeBLkjG7wc5tSw9FTJxQCypBclp6S
 qYSAqfv4s5xAyrHNjlKYKwaWHsnUW3YUkTF6v6RS2oc0+KOumBnFyY1
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Add new CONRING_LOG_SHIFT Kconfig parameter to specify the boot console buffer
size as a power of 2.

Bump default size to 32 KiB.

Link: https://gitlab.com/xen-project/xen/-/issues/185
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/Kconfig   | 23 +++++++++++++++++++++++
 xen/drivers/char/console.c |  4 ++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e6e12bb4139717f9319031f51f5d20155d2caee2..3bc892fc38d8cdeb3c76ea44d747f712a8d0d372 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -96,6 +96,29 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 32768 (32KiB).
 
+config CONRING_LOG_SHIFT
+	int "Console buffer size"
+	range 14 25
+	default 15
+	help
+	  Select the boot console buffer size as a power of 2.
+	  Run-time console buffer size is the same as the boot console size,
+	  unless enforced via 'conring_size=' boot parameter.
+
+	  Examples:
+	    25 =>  32 MiB
+	    24 =>  16 MiB
+	    23 =>   8 MiB
+	    22 =>   4 MiB
+	    21 =>   2 MiB
+	    20 =>   1 MiB
+	    19 => 512 KiB
+	    18 => 256 KiB
+	    17 => 128 KiB
+	    16 =>  64 KiB
+	    15 =>  32 KiB
+	    14 =>  16 KiB
+
 config XHCI
 	bool "XHCI DbC UART driver"
 	depends on X86
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index d22fb4a253af26f9b51d91bd408e1dbf4bb5a7c1..581ee22b85302a54db5b9d5d28e8b2d689d31403 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -104,11 +104,11 @@ static int cf_check parse_console_timestamps(const char *s);
 custom_runtime_param("console_timestamps", parse_console_timestamps,
                      con_timestamp_mode_upd);
 
-/* conring_size: allows a large console ring than default (16kB). */
+/* conring_size: allows a large console ring than default (32 KiB). */
 static uint32_t __initdata opt_conring_size;
 size_param("conring_size", opt_conring_size);
 
-#define _CONRING_SIZE 16384
+#define _CONRING_SIZE       (1U << CONFIG_CONRING_LOG_SHIFT)
 #define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
 static char __initdata _conring[_CONRING_SIZE];
 static char *__read_mostly conring = _conring;

-- 
2.34.1



