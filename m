Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB95493579
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 08:29:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258727.445926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5OY-0003mx-RO; Wed, 19 Jan 2022 07:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258727.445926; Wed, 19 Jan 2022 07:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5OY-0003fV-KQ; Wed, 19 Jan 2022 07:28:38 +0000
Received: by outflank-mailman (input) for mailman id 258727;
 Wed, 19 Jan 2022 07:28:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nA5OW-0003Y6-Uf
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 07:28:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68f5772c-78f9-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 08:28:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D97E218A9;
 Wed, 19 Jan 2022 07:28:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3BEB313B28;
 Wed, 19 Jan 2022 07:28:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uD16DaK952EyZQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 19 Jan 2022 07:28:34 +0000
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
X-Inumbo-ID: 68f5772c-78f9-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642577314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IsvRZQmjV7CnvRfLpi5YfUDyG/LXLUAroV6J520N8oI=;
	b=Cv5vnxnkQ0OvUxrwzCEFGs/LGsUTgjV1zPZstuhlMr3TAXv8/2eq9OTzLfeoBy+Z2849q4
	zFBah217L23cMfHr6+0n7hE7HWCgu7gPOJlT2q3bFcdpDahcTjd6ZSPMo5uzGQID1nIGBI
	HNWH+PhyNoAHw9gjS301f0MNZaCtOgA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/3] tools/libs/evtchn: remove old mini-os callback
Date: Wed, 19 Jan 2022 08:28:22 +0100
Message-Id: <20220119072823.21025-3-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220119072823.21025-1-jgross@suse.com>
References: <20220119072823.21025-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible now to delete minios_evtchn_close_fd() and the extern
declaration of event_queue.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- rebase
---
 tools/libs/evtchn/minios.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index ee3da9f8fe..30f98bc7e4 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -47,10 +47,6 @@ struct port_info {
     bool bound;
 };
 
-extern struct wait_queue_head event_queue;
-
-void minios_evtchn_close_fd(int fd);
-
 /* XXX Note: This is not threadsafe */
 static struct port_info *port_alloc(xenevtchn_handle *xce)
 {
@@ -152,13 +148,6 @@ int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid)
     return -1;
 }
 
-void minios_evtchn_close_fd(int fd)
-{
-    struct file *file = get_file_from_fd(fd);
-
-    evtchn_close_fd(file);
-}
-
 int xenevtchn_notify(xenevtchn_handle *xce, evtchn_port_t port)
 {
     int ret;
-- 
2.31.1


