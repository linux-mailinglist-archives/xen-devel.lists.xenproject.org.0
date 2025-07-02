Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B66AF0D9A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030391.1404076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsao-0001Mg-Ei; Wed, 02 Jul 2025 08:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030391.1404076; Wed, 02 Jul 2025 08:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsao-0001Hz-9j; Wed, 02 Jul 2025 08:13:22 +0000
Received: by outflank-mailman (input) for mailman id 1030391;
 Wed, 02 Jul 2025 08:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsan-00082X-1t
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:21 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69bb5852-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:19 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C2881F452;
 Wed,  2 Jul 2025 08:13:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07EDC13A24;
 Wed,  2 Jul 2025 08:13:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id r99lAB/qZGgISQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:19 +0000
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
X-Inumbo-ID: 69bb5852-571c-11f0-b894-0df219b8e170
Authentication-Results: smtp-out2.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 1/9] stubdom: configure kexec for PVH Xenstore stubdom
Date: Wed,  2 Jul 2025 10:12:57 +0200
Message-ID: <20250702081305.14440-2-jgross@suse.com>
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
X-Rspamd-Queue-Id: 3C2881F452
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00

Add the required configuration settings to enable kexec in the PVH
variant of xenstore-stubdom. This is required to support live update.

Set the number of kexec module pages to 18 in order to support using
the kexec module memory for the stubdom's 9pfs granted pages.

In Xenstore code test the CONFIG_KEXEC setting in order to determine
whether stubdom live update is supported (PV xenstore-stubdom doesn't
have live update support, as it lacks kexec).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/xenstorepvh-minios.cfg | 2 ++
 tools/xenstored/core.h         | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/stubdom/xenstorepvh-minios.cfg b/stubdom/xenstorepvh-minios.cfg
index 62a228f33d..ed2461d7fa 100644
--- a/stubdom/xenstorepvh-minios.cfg
+++ b/stubdom/xenstorepvh-minios.cfg
@@ -8,4 +8,6 @@ CONFIG_CONSFRONT=n
 CONFIG_LWIP=n
 CONFIG_9PFRONT=y
 CONFIG_BALLOON=y
+CONFIG_KEXEC=y
+CONFIG_KEXEC_MODULE_PAGES=18
 XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 632886cecf..1ba9592d16 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -45,6 +45,11 @@
 #endif
 #endif
 
+/* Live update in stubdom case needs kexec support. */
+#if defined(__MINIOS__) && !defined(CONFIG_KEXEC)
+#define NO_LIVE_UPDATE
+#endif
+
 /* DEFAULT_BUFFER_SIZE should be large enough for each errno string. */
 #define DEFAULT_BUFFER_SIZE 16
 
-- 
2.43.0


