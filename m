Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E9RITL0g2n6wAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 02:36:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219B0EDB0A
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 02:36:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221356.1529664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoIA-0002rd-1I; Thu, 05 Feb 2026 01:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221356.1529664; Thu, 05 Feb 2026 01:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI9-0002mM-QE; Thu, 05 Feb 2026 01:36:21 +0000
Received: by outflank-mailman (input) for mailman id 1221356;
 Thu, 05 Feb 2026 01:36:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vnoI8-0002cG-0K
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 01:36:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI7-003wRJ-33;
 Thu, 05 Feb 2026 01:36:19 +0000
Received: from [140.209.201.102] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI7-00HVXb-1R;
 Thu, 05 Feb 2026 01:36:19 +0000
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
	bh=bNWaJuUXW1hcVfeutPblFaJxcDIyBZhI3ZQ6lYZGoTo=; b=SVkMCn+PN2IcPts2W9aqfA74Q/
	3LhLaJthRaMLGDt5IMwKF9TsHjQWxQA7RlLRpqGUdCnP2GOxwcTbPJLIrxLIc2VA31I/9bsnqXfwA
	UDaUW6Ov1D2RETN8r6ef+r+kBXyRGddOfvmkexjwjkzLLeuL5XAIz5uOpY/KdZMYKOn8=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v5 6/6] xen/console: add conring buffer size alignment setting
Date: Wed,  4 Feb 2026 17:36:06 -0800
Message-ID: <20260205013606.3384798-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205013606.3384798-1-dmukhin@ford.com>
References: <20260205013606.3384798-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dmukhin@xen.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,ford.com:mid,ford.com:email];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 219B0EDB0A
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Introduce CONFIG_CONRING_ALIGN_PAGE_SIZE to control rounding down of the
user-defined conring buffer size.

Also, update the logline reporting the final conring buffer size to report
bytes instead of kilobytes, since the user-defined size may not necessarily
be kilobyte-alined.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
---
 xen/drivers/char/Kconfig   |  7 +++++++
 xen/drivers/char/console.c | 15 +++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index d083ba4c9cdf..1b96fbc3ed7c 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -95,6 +95,13 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 32768 (32KiB).
 
+config CONRING_ALIGN_PAGE_SIZE
+	bool
+	default y
+	help
+	  This selects the console ring buffer size alignment (rounding down)
+	  to a multiple of PAGE_SIZE.
+
 config CONRING_SHIFT
 	int "Console ring buffer size (power of 2)"
 	range 14 27
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 9394ab2a89eb..c13818715a52 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -470,12 +470,15 @@ void __init console_init_ring(void)
         return;
 
     opt_conring_size = max(opt_conring_size, conring_size);
-    size = ROUNDDOWN(opt_conring_size, PAGE_SIZE);
-    if ( size != opt_conring_size )
+    if ( IS_ENABLED(CONFIG_CONRING_ALIGN_PAGE_SIZE) )
     {
-        opt_conring_size = size;
-        printk(XENLOG_WARNING "Rounding down console ring size to multiple of %lu KiB.\n",
-               PAGE_SIZE >> 10);
+        size = ROUNDDOWN(opt_conring_size, PAGE_SIZE);
+        if ( size != opt_conring_size )
+        {
+            opt_conring_size = size;
+            printk(XENLOG_WARNING "Rounding down console ring size to multiple of %lu KiB.\n",
+                   PAGE_SIZE >> 10);
+        }
     }
     if ( opt_conring_size >= GB(2) )
     {
@@ -512,7 +515,7 @@ void __init console_init_ring(void)
 
     nrspin_unlock_irqrestore(&console_lock, flags);
 
-    printk("Allocated console ring of %u KiB.\n", opt_conring_size >> 10);
+    printk("Allocated console ring of %u bytes.\n", opt_conring_size);
 }
 
 /*
-- 
2.52.0


