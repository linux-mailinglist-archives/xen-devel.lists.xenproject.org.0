Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9769D9FB7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:39:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844364.1259935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG593-0004do-ND; Tue, 26 Nov 2024 23:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844364.1259935; Tue, 26 Nov 2024 23:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG593-0004bP-JZ; Tue, 26 Nov 2024 23:39:01 +0000
Received: by outflank-mailman (input) for mailman id 844364;
 Tue, 26 Nov 2024 23:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4so-0000Ao-NJ
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f92f938-ac4d-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 00:22:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F80A5C5D8A;
 Tue, 26 Nov 2024 23:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 778B7C4CEDB;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 6B238D66B94;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
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
X-Inumbo-ID: 3f92f938-ac4d-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNmOTJmOTM4LWFjNGQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjYzMzI2LjMyOTA4MSwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663317;
	bh=lj/mfdQca1gsUrIVD1+Z6uLYfT5KncbYzGoRr8znGg8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lTwL1lLxHQLzdkVdjZUQ3xsKci5v5odyqqMyYMPKv3tGFO3xyeaHNrTYTvvtLdsdK
	 Kvynjxx6BZtaBegtDmSZtYTY23fGx7Dt5weqMf6lE74dy6l2w+E91Ebvl5TFhS3Kbx
	 zusPn0uPxT+H1hzK6yPJdbOlyQI9y3tNoRHN3lwCd+cFp3qftklpB8Zvp98Y0kNlhe
	 puSPncppxvOf7Dv0QwqjN88qOQ3W0KeYfaxfyZKqzlsQ1SONSpcu38a5jctu0NTTVZ
	 39nl21KByRFDIWOh4Eh6lZcueLdEpYChXKnnTzrXr8tBtztdD2igoy0gZLPNDH1riC
	 S05WRt+GoBeKw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:19 -0800
Subject: [PATCH 29/36] xen/console: make console buffer size configurable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-29-87b9a8375b7a@ford.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=2270;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=AKwyQAvwjj+wQmu1WwmpWDVO3KxHtjslwmqsRTzrAD0=;
 b=2HaC4h5V7Nqz/P9NOv91yjhDKAIlxkFFwtZ/HQqHYBGIHO0FUCz24w2vidaasH3dA1AmaxlAe
 FHROVQWFA36AM3r9ufqu45LJzuW/14PyrFrvxk30PhdkkGk/KDETzzI
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
index e175d07c022b051c5af4e689061adba72f9b54a0..2c754545cf05e740bd3d59d88de464f3653fb68e 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -93,6 +93,29 @@ config SERIAL_TX_BUFSIZE
 
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
index 9f67ecb26f5ab1183d17c83631a17b45cfefd5ab..24a8263045b0e5ecf901d08e627f34a80edd297d 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -102,11 +102,11 @@ static int cf_check parse_console_timestamps(const char *s);
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



