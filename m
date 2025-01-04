Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFA6A011AC
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864838.1276142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtT9-0001Z6-DN; Sat, 04 Jan 2025 02:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864838.1276142; Sat, 04 Jan 2025 02:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtT9-0001WW-8T; Sat, 04 Jan 2025 02:00:51 +0000
Received: by outflank-mailman (input) for mailman id 864838;
 Sat, 04 Jan 2025 02:00:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQs-0005Ax-Sa
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e44473d-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 770E95C62A5;
 Sat,  4 Jan 2025 01:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C669C4CEE4;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 86F8EE7719A;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
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
X-Inumbo-ID: 5e44473d-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955895;
	bh=Xgs2bv4JXXqvUy90eTrxGWRi5qSOMQjEKlvhtNuvWD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gKVBWj1Q+WmEWJaWD7QxNZIudKk6SS4SvjEWEBLSsydcYHDXbuq+CkgIWhkKkYsyc
	 7WeIyRELjzVkDHwj15LTI350khFx9qlnLOokWC84cM6HB5z5hVOChWSsnWQW6Ji1Ir
	 omJTU6H1Egx9q8641wHVq8dtX6X3z/bqXX8gIPZ73a+bt0DlaDUYL99K+0zTNG8WF8
	 ZZ/YumZ5NXWnlnJMUIpNiPmFSAjZY35bI0zSNc1CgLXSUhXUYfgPAhsolJSqtsg4w/
	 gep+XQ6Eqs4vcfxNMlaCHFenrwxgjOfTQ6Aho0t3aG/hbiBIl5c7+f6DJClIUBcNXW
	 4pthH1KzgUtEg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:21 -0800
Subject: [PATCH v3 15/24] xen/console: make console buffer size
 configurable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-15-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=3361;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=Q9U/5BpyrJDws6KsGm2DI3/vHtnpVBTCL+jo+AixI4I=;
 b=hMkW/p8d9e8YlW1EjCatE/+J+TNOaD3M7w+4q9v/uuzLx8LRbhrHqNYhHbNPSDhfpAOt9c3kG
 jcKW3DW1vu0Cbj1R7uk77E9E7hi4M5hw7d3a21DBA5Atm3hRvg/QUs8
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Add new CONRING_SIZE Kconfig parameter to specify the boot console buffer size
in bytes. The value is rounded to the nearest power of 2 to match existing
conring_size= behavior.

The supported range is [16KiB..128MiB].

Bump default size to 32 KiB.

Link: https://gitlab.com/xen-project/xen/-/issues/185
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 docs/misc/xen-command-line.pandoc |  7 +++++--
 xen/drivers/char/Kconfig          | 11 +++++++++++
 xen/drivers/char/console.c        |  9 ++++++---
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1a5ee3c91c5cc8bf653e5054211035b5d1bd560f..aeaee482f61aab41438a44eda470902e1e0806f8 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -423,12 +423,15 @@ The following are examples of correct specifications:
     com1=baud=115200,parity=n,stop-bits=1,io-base=0x3f8,reg-width=4
 
 ### conring_size
-> `= <size>`
+> `= <size-in-bytes>`
 
-> Default: `conring_size=16k`
+> Default: `conring_size=32k`
 
 Specify the size of the console ring buffer.
 
+The console ring buffer size can be selected at build time via
+CONFIG_CONRING_SIZE.
+
 ### console
 > `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | none ]`
 
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e6e12bb4139717f9319031f51f5d20155d2caee2..f7e193e29e2d9ac7c1b878e13f3fb1ce444f31b5 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -96,6 +96,17 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 32768 (32KiB).
 
+config CONRING_SIZE
+	int "Console buffer size"
+	default 32768
+	help
+	  Select the boot console buffer size (in bytes).
+	  Note, the value provided will be rounded down to the nearest power of 2.
+	  Run-time console buffer size is the same as the boot console size,
+	  unless enforced via 'conring_size=' boot parameter.
+
+	  Default value is 32768 (32KiB). The supported range is [16KiB..128MiB].
+
 config XHCI
 	bool "XHCI DbC UART driver"
 	depends on X86
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 1308236403df8a0f87aeb7e2c00a036c2d8433a7..a33132b8fad95a1ad7e0aab4aef3fa3e46a5c03a 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -100,12 +100,15 @@ static int cf_check parse_console_timestamps(const char *s);
 custom_runtime_param("console_timestamps", parse_console_timestamps,
                      con_timestamp_mode_upd);
 
-/* conring_size: allows a large console ring than default (16kB). */
+/* conring_size: allows a large console ring than default (32 KiB). */
 static uint32_t __initdata opt_conring_size;
 size_param("conring_size", opt_conring_size);
 
-#define _CONRING_SIZE 16384
-#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
+#define _CONRING_SIZE       (1UL << (31 - __builtin_clz(CONFIG_CONRING_SIZE)))
+_Static_assert(_CONRING_SIZE >= 4096 && _CONRING_SIZE <= MB(128),
+    "CONFIG_CONRING_SIZE must be in [4K..128M] range");
+
+#define CONRING_IDX_MASK(i) ( (i) & (conring_size - 1) )
 static char __initdata _conring[_CONRING_SIZE];
 static char *__read_mostly conring = _conring;
 static uint32_t __read_mostly conring_size = _CONRING_SIZE;

-- 
2.34.1



