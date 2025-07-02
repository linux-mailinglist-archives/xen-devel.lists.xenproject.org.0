Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC71AF0DC4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:21:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030563.1404316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsik-00042v-RV; Wed, 02 Jul 2025 08:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030563.1404316; Wed, 02 Jul 2025 08:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsik-0003wK-Ee; Wed, 02 Jul 2025 08:21:34 +0000
Received: by outflank-mailman (input) for mailman id 1030563;
 Wed, 02 Jul 2025 08:21:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsb0-00082X-PW
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 720692c1-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:33 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 56A701F452;
 Wed,  2 Jul 2025 08:13:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 337A913A24;
 Wed,  2 Jul 2025 08:13:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id onwjCyrqZGgbSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:30 +0000
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
X-Inumbo-ID: 720692c1-571c-11f0-b894-0df219b8e170
Authentication-Results: smtp-out2.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/9] libevtchn: add O_CLOEXEC support for Mini-OS
Date: Wed,  2 Jul 2025 10:12:59 +0200
Message-ID: <20250702081305.14440-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081305.14440-1-jgross@suse.com>
References: <20250702081305.14440-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 56A701F452
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00

With Mini-OS now supporting O_CLOEXEC for the kexec case, no longer
ignore the XENEVTCHN_NO_CLOEXEC flag in minios.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/evtchn/minios.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 046cd28d37..0d2a201438 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -114,10 +114,6 @@ static void evtchn_initialize(void)
     ftype_evtchn = alloc_file_type(&evtchn_ops);
 }
 
-/*
- * XENEVTCHN_NO_CLOEXEC is being ignored, as there is no exec() call supported
- * in Mini-OS.
- */
 int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
     int fd;
@@ -137,6 +133,8 @@ int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
         return -1;
     }
 
+    if ( !(flags & XENEVTCHN_NO_CLOEXEC) )
+        file->cloexec = true;
     file->dev = ports;
     XEN_LIST_INIT(&ports->list);
     xce->fd = fd;
-- 
2.43.0


