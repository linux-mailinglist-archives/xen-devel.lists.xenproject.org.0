Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084239D9FB5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844341.1259916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG58A-0003Ef-33; Tue, 26 Nov 2024 23:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844341.1259916; Tue, 26 Nov 2024 23:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG589-0003BU-V9; Tue, 26 Nov 2024 23:38:05 +0000
Received: by outflank-mailman (input) for mailman id 844341;
 Tue, 26 Nov 2024 23:38:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4so-0000At-E6
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f621fc5-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:22:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD2565C5DA1;
 Tue, 26 Nov 2024 23:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12E37C4CED8;
 Tue, 26 Nov 2024 23:21:58 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 08948D66B9A;
 Tue, 26 Nov 2024 23:21:58 +0000 (UTC)
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
X-Inumbo-ID: 3f621fc5-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNmNjIxZmM1LWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzI1Ljk4NTY5OSwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663318;
	bh=rm9Rfw2X1emp+k6O3Rfqq3jQzpQZEqHAsm70LmgQdN8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fC+fp3S/a4J15BEcEE3UUNrNN0fMF1o8trNXlcTxvSUnRdG91DwKePim4+MCu9ttd
	 bq3sOodnYYTxRoQCAhcykn2MCu6u3qY1mAyTpcrVohK/sqAN47y3KWvsCmuI9B4iAM
	 gZZlV9oUKQuvQj7ZRse5ZBumkeMZzb5v6+6aAoy/JRnIocJz/ivk5Z2H3D728H1q7u
	 dMPDZ94fw2HQ+Pyqg4Vrh60Gpv2mx6mMFMkJo1l+bthtPbqq98iqLI/lQptrCMbemk
	 WXxPVc5Pzj2vkD+WOzvRVrik7VP6AWfOoWgHO9YBRDiKxdBh1snqsYCzLkyp8S4Z2x
	 isEkFAvIINWBw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:25 -0800
Subject: [PATCH 35/36] xen/console: enable console owners w/ emulated
 NS8250
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-35-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=1133;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=WQSeR36nIyjmpuQo8H1p9/NbRUrGXqQm6ZbcYesml3s=;
 b=CpDYEchPnsqpvivWMdQylePfQPuJSv0/SjOEWfua7YW9lLt1hgiNJ6VsfmU5JHvY35yc3Ople
 waiIIpFcbLcC2C5el3B47d6MtywojYP1vjZQlm+z48MSNaddZKt8lgp
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Enable console focus for domains w/ virtual NS8250.

Code change allows to capture the output from the guest OS now and send it to
the physical console device.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 24a8263045b0e5ecf901d08e627f34a80edd297d..54595b486b9761d0a17831b95481f2fa9bdcfcc7 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -41,6 +41,9 @@
 #ifdef CONFIG_SBSA_VUART_CONSOLE
 #include <asm/vpl011.h>
 #endif
+#if defined(CONFIG_HAS_VUART_NS8250)
+#include <asm/hvm/vuart_ns8250.h>
+#endif
 
 /* console: comma-separated list of console outputs. */
 static char __initdata opt_console[30] = OPT_CONSOLE_STR;
@@ -581,6 +584,8 @@ static void handle_keypress_in_domain(struct domain *d, char c)
     {
 #if defined(CONFIG_SBSA_VUART_CONSOLE)
         rc = vpl011_rx_char_xen(d, c);
+#elif defined(CONFIG_HAS_VUART_NS8250)
+        rc = vuart_putchar(&d->arch.hvm.vuart, c);
 #endif
     }
     /*

-- 
2.34.1



