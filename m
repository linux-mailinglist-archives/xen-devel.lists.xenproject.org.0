Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BFF7F9DB6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641837.1000791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z0K-00073S-R2; Mon, 27 Nov 2023 10:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641837.1000791; Mon, 27 Nov 2023 10:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z0K-000707-O8; Mon, 27 Nov 2023 10:38:16 +0000
Received: by outflank-mailman (input) for mailman id 641837;
 Mon, 27 Nov 2023 10:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7YqE-0000Co-Oj
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:27:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d1e6be3-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:27:50 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4352220214;
 Mon, 27 Nov 2023 10:27:49 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 18344132A6;
 Mon, 27 Nov 2023 10:27:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id TMKfBCVvZGUqfwAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:27:49 +0000
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
X-Inumbo-ID: 9d1e6be3-8d0f-11ee-98e2-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 26/32] Mini-OS: add EXPORT_SYMBOL() instances to netfront.c
Date: Mon, 27 Nov 2023 11:25:17 +0100
Message-Id: <20231127102523.28003-27-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++++++++++++
X-Spam-Score: 15.00
X-Rspamd-Server: rspamd1
X-Spam-Level: ***************
X-Rspamd-Queue-Id: 4352220214
X-Spam-Flag: YES
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Result: default: False [15.00 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(0.15)[64.57%];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam: Yes

Add the needed instances of EXPORT_SYMBOL() to netfront.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 netfront.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/netfront.c b/netfront.c
index 164fdc66..7de2498a 100644
--- a/netfront.c
+++ b/netfront.c
@@ -370,16 +370,19 @@ out:
 err:
     return dev;
 }
+EXPORT_SYMBOL(init_netfront);
 
 char *netfront_get_netmask(struct netfront_dev *dev)
 {
     return dev->mask ? strdup(dev->mask) : NULL;
 }
+EXPORT_SYMBOL(netfront_get_netmask);
 
 char *netfront_get_gateway(struct netfront_dev *dev)
 {
     return dev->gw ? strdup(dev->gw) : NULL;
 }
+EXPORT_SYMBOL(netfront_get_gateway);
 
 static struct netfront_dev *_init_netfront(struct netfront_dev *dev)
 {
@@ -625,6 +628,7 @@ int netfront_tap_open(char *nodename) {
     file->dev = dev;
     return dev->fd;
 }
+EXPORT_SYMBOL(netfront_tap_open);
 #endif
 
 void shutdown_netfront(struct netfront_dev *dev)
@@ -654,6 +658,7 @@ void shutdown_netfront(struct netfront_dev *dev)
         free_netfront(dev);
     }
 }
+EXPORT_SYMBOL(shutdown_netfront);
 
 static int _shutdown_netfront(struct netfront_dev *dev)
 {
@@ -813,6 +818,7 @@ void netfront_xmit(struct netfront_dev *dev, const unsigned char *data, int len)
     network_tx_buf_gc(dev);
     local_irq_restore(flags);
 }
+EXPORT_SYMBOL(netfront_xmit);
 
 #ifdef HAVE_LIBC
 ssize_t netfront_receive(struct netfront_dev *dev, unsigned char *data, size_t len)
@@ -840,6 +846,7 @@ ssize_t netfront_receive(struct netfront_dev *dev, unsigned char *data, size_t l
 
     return dev->rlen;
 }
+EXPORT_SYMBOL(netfront_receive);
 #endif
 
 void netfront_set_rx_handler(struct netfront_dev *dev,
-- 
2.35.3


