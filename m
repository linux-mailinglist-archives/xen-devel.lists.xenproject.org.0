Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4243F12C9
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 07:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168383.307438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGads-0003ur-NN; Thu, 19 Aug 2021 05:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168383.307438; Thu, 19 Aug 2021 05:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGads-0003rO-K6; Thu, 19 Aug 2021 05:31:04 +0000
Received: by outflank-mailman (input) for mailman id 168383;
 Thu, 19 Aug 2021 05:31:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/7+2=NK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mGadr-0003rI-Pp
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 05:31:03 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3d6454f-00ae-11ec-a5b3-12813bfff9fa;
 Thu, 19 Aug 2021 05:31:02 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 315D41FD2D;
 Thu, 19 Aug 2021 05:31:01 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id F1AA31371C;
 Thu, 19 Aug 2021 05:31:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id WOnxOJTsHWEzFgAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 19 Aug 2021 05:31:00 +0000
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
X-Inumbo-ID: a3d6454f-00ae-11ec-a5b3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629351061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JAlAwR9/QksTzRSgjsQCc86kQ6ZiSu8rGtdbGLfgZFw=;
	b=qUfHRUp4JLy98LyOC+faN9t1R0hLK1Rk6uOLQQtwBdMkLLL5KQvuX5KL0Bk4a2B1Sgk4Oq
	kXbTG3n/EEPyvOgGxtAsnIrjYoP7hj5l5vWn2mb/Wz407/Q1TS+XLAnWZaKuT9053wUl7z
	34IoPGJ/QgVjuHmTfgo19BMXmVgzwBM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] mini-os: netfront: fix initialization without ip address in xenstore
Date: Thu, 19 Aug 2021 07:30:56 +0200
Message-Id: <20210819053056.32675-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4821876fcd2ff ("mini-os: netfront: fix suspend/resume handling")
introduced a NULL pointer dereference in the initialization of netfront
in the case of no IP address being set in Xenstore.

Fix that by testing this condition. At the same time fix a long
standing bug for the same condition if someone used init_netfront()
with a non-NULL ip parameter.

Fixes: 4821876fcd2ff ("mini-os: netfront: fix suspend/resume handling")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 netfront.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/netfront.c b/netfront.c
index f927e99..dfe065b 100644
--- a/netfront.c
+++ b/netfront.c
@@ -365,7 +365,7 @@ out:
         rawmac[5] = dev->rawmac[5];
 	}
     if (ip)
-        *ip = strdup(dev->ip);
+        *ip = dev->ip ? strdup(dev->ip) : NULL;
 
 err:
     return dev;
@@ -527,7 +527,7 @@ done:
         snprintf(path, sizeof(path), "%s/ip", dev->backend);
         xenbus_read(XBT_NIL, path, &dev->ip);
 
-        p = strchr(dev->ip, ' ');
+        p = dev->ip ? strchr(dev->ip, ' ') : NULL;
         if (p) {
             *p++ = '\0';
             dev->mask = p;
-- 
2.26.2


