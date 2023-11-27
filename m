Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E77F9DCC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641908.1000931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z2K-0005gC-J6; Mon, 27 Nov 2023 10:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641908.1000931; Mon, 27 Nov 2023 10:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z2K-0005ab-DF; Mon, 27 Nov 2023 10:40:20 +0000
Received: by outflank-mailman (input) for mailman id 641908;
 Mon, 27 Nov 2023 10:40:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7Yps-0000Co-TB
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:27:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 900feff4-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:27:28 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2CB5C202A8;
 Mon, 27 Nov 2023 10:27:27 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 01A33132A6;
 Mon, 27 Nov 2023 10:27:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id rjPDOg5vZGUQfwAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:27:26 +0000
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
X-Inumbo-ID: 900feff4-8d0f-11ee-98e2-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 22/32] Mini-OS: add EXPORT_SYMBOL() instances to lwip-*.c
Date: Mon, 27 Nov 2023 11:25:13 +0100
Message-Id: <20231127102523.28003-23-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++++++++++++
X-Spam-Score: 15.00
X-Rspamd-Server: rspamd1
X-Spam-Level: ***************
X-Rspamd-Queue-Id: 2CB5C202A8
X-Spam-Flag: YES
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Result: default: False [15.00 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 BAYES_SPAM(1.04)[81.94%];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam: Yes

Add the needed instances of EXPORT_SYMBOL() to lwip-*.c.

Most added symbols are in LWIP, but we can't add the EXPORT_SYMBOL()
instances easily there.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 lwip-arch.c | 9 +++++++++
 lwip-net.c  | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/lwip-arch.c b/lwip-arch.c
index 21e941e9..7907f446 100644
--- a/lwip-arch.c
+++ b/lwip-arch.c
@@ -12,7 +12,9 @@
 #include <console.h>
 #include <xmalloc.h>
 #include <lwip/sys.h>
+#include <lwip/inet.h>
 #include <stdarg.h>
+#include <mini-os/export.h>
 
 /* Is called to initialize the sys_arch layer */
 void sys_init(void)
@@ -293,3 +295,10 @@ void lwip_die(char *fmt, ...)
     printk("\n");
     BUG();
 }
+
+EXPORT_SYMBOL(htonl);
+EXPORT_SYMBOL(htons);
+EXPORT_SYMBOL(inet_aton);
+EXPORT_SYMBOL(inet_ntoa);
+EXPORT_SYMBOL(ntohl);
+EXPORT_SYMBOL(ntohs);
diff --git a/lwip-net.c b/lwip-net.c
index 16950d32..e71a11c7 100644
--- a/lwip-net.c
+++ b/lwip-net.c
@@ -250,7 +250,7 @@ void networking_set_addr(struct ip_addr *ipaddr, struct ip_addr *netmask, struct
   netif_set_netmask(the_interface, netmask);
   netif_set_gw(the_interface, gw);
 }
-
+EXPORT_SYMBOL(networking_set_addr);
 
 static void
 arp_timer(void *arg)
-- 
2.35.3


