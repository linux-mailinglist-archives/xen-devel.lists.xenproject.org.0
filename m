Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EfzMDL0g2n6wAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 02:36:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B807EDB1F
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 02:36:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221352.1529631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI5-0002CP-OU; Thu, 05 Feb 2026 01:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221352.1529631; Thu, 05 Feb 2026 01:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI5-00029U-LZ; Thu, 05 Feb 2026 01:36:17 +0000
Received: by outflank-mailman (input) for mailman id 1221352;
 Thu, 05 Feb 2026 01:36:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vnoI4-0001w6-CE
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 01:36:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI4-003wQK-0H;
 Thu, 05 Feb 2026 01:36:15 +0000
Received: from [140.209.201.102] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI3-00HVXD-1m;
 Thu, 05 Feb 2026 01:36:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=OmHZuBlSWJtfYojCeHKDKiy+Jl/+TAljxD/KKQZ0HFU=; b=n5+kAtOKhadDbzsHZdN1u0lU/w
	fL/5Y0aJF/yxV9x7oEsewB/E2kjfDJmz533UFMuyzR68vvyrAkJjk6cGhlllJmo0ZJc+POQpt6i0i
	3lZpNMAMoT2m1zOhMbRd//TxTejqBCm8KNUc9RWR2/MacQyBUx3ioxT1h3TI3tylGPKo=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v5 2/6] xen/console: make console buffer size configurable
Date: Wed,  4 Feb 2026 17:36:02 -0800
Message-ID: <20260205013606.3384798-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205013606.3384798-1-dmukhin@ford.com>
References: <20260205013606.3384798-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[dmukhin@xen.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:mid,ford.com:email,xen.org:dkim,gitlab.com:url];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B807EDB1F
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Add new CONRING_SHIFT Kconfig parameter to specify the boot console buffer size
as a power of 2.

The supported range is [14..27] -> [16KiB..128MiB].

Set default to 15 (32 KiB).

Resolves: https://gitlab.com/xen-project/xen/-/issues/185
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v4:
- n/a
---
 docs/misc/xen-command-line.pandoc |  5 +++--
 xen/drivers/char/Kconfig          | 24 ++++++++++++++++++++++++
 xen/drivers/char/console.c        |  6 +++---
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index c1f2def9f99c..87392142e8e9 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -425,10 +425,11 @@ The following are examples of correct specifications:
 ### conring_size
 > `= <size>`
 
-> Default: `conring_size=16k`
-
 Specify the size of the console ring buffer.
 
+The default console ring buffer size is selected at build time via
+CONFIG_CONRING_SHIFT setting.
+
 ### console
 > `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | none ]`
 
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 8e49a52c735b..d083ba4c9cdf 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -95,6 +95,30 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 32768 (32KiB).
 
+config CONRING_SHIFT
+	int "Console ring buffer size (power of 2)"
+	range 14 27
+	default 15
+	help
+	  Select the boot console ring buffer size as a power of 2.
+	  Run-time console ring buffer size is the same as the boot console ring
+	  buffer size, unless overridden via 'conring_size=' boot parameter.
+
+	    27 => 128 MiB
+	    26 =>  64 MiB
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
+	    15 =>  32 KiB (default)
+	    14 =>  16 KiB
+
 config XHCI
 	bool "XHCI DbC UART driver"
 	depends on X86
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 86319600e0af..522b2f489a53 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -339,12 +339,12 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
  * ********************************************************
  */
 
-/* conring_size: allows a large console ring than default (16kB). */
+/* conring_size: override build-time CONFIG_CONRING_SHIFT setting. */
 static uint32_t __initdata opt_conring_size;
 size_param("conring_size", opt_conring_size);
 
-#define _CONRING_SIZE 16384
-#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
+#define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
+#define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
 static char __initdata _conring[_CONRING_SIZE];
 static char *__read_mostly conring = _conring;
 static uint32_t __read_mostly conring_size = _CONRING_SIZE;
-- 
2.52.0


