Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDjCHjL0g2n6wAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 02:36:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C875EDB09
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 02:36:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221354.1529651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI9-0002fd-8M; Thu, 05 Feb 2026 01:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221354.1529651; Thu, 05 Feb 2026 01:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI9-0002ct-3b; Thu, 05 Feb 2026 01:36:21 +0000
Received: by outflank-mailman (input) for mailman id 1221354;
 Thu, 05 Feb 2026 01:36:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vnoI6-0002Qc-Ul
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 01:36:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI6-003wQh-01;
 Thu, 05 Feb 2026 01:36:17 +0000
Received: from [140.209.201.102] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI5-00HVXL-1b;
 Thu, 05 Feb 2026 01:36:17 +0000
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
	bh=uMEQbYnd5xAAaBu981UD1vQcoXX8eKP0LOT3hk6YJ3Q=; b=mam4JDzfk/p6OWqgGA5SomxTJ1
	kfYr2LSIJttLdq4REByJY0418pIva21EdHEZQIO78b3QA0GPewW29bZ0QHloo0DXgouG4vk2mrXcv
	mviqLNow7s48GtjqYemVl4uDFo1wfUx6XF4hlmHTfx54LHwxzj9LP/4Aocal7ROGpHfk=;
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
Subject: [PATCH v5 4/6] xen/console: use memcpy() in console_init_ring()
Date: Wed,  4 Feb 2026 17:36:04 -0800
Message-ID: <20260205013606.3384798-5-dmukhin@ford.com>
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
X-Rspamd-Queue-Id: 1C875EDB09
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Make console_init_ring() more efficient by using memcpy()'s, rather than
copying the ring a byte at a time.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
---
 xen/drivers/char/console.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ef9131439bba..3ad86fd436e2 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -463,7 +463,7 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
 void __init console_init_ring(void)
 {
     char *ring;
-    unsigned int i, order, memflags;
+    unsigned int start, size, chunk, order, memflags;
     unsigned long flags;
 
     if ( !opt_conring_size )
@@ -479,11 +479,23 @@ void __init console_init_ring(void)
     opt_conring_size = PAGE_SIZE << order;
 
     nrspin_lock_irqsave(&console_lock, flags);
-    for ( i = conringc ; i != conringp; i++ )
-        ring[i & (opt_conring_size - 1)] = conring[i & (conring_size - 1)];
+
+    start = conringc & (conring_size - 1);
+    size = min(conringp - conringc, conring_size);
+    chunk = min(size, conring_size - start);
+
+    memcpy(&ring[0], &conring[start], chunk);
+    if ( size > chunk )
+        memcpy(&ring[chunk], &conring[0], size - chunk);
+
+    /* Data is moved to [0..size), re-position conring pointers. */
+    conringc = 0;
+    conringp = size;
+
     conring = ring;
     smp_wmb(); /* Allow users of console_force_unlock() to see larger buffer. */
     conring_size = opt_conring_size;
+
     nrspin_unlock_irqrestore(&console_lock, flags);
 
     printk("Allocated console ring of %u KiB.\n", opt_conring_size >> 10);
-- 
2.52.0


