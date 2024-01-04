Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E13823E5D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:12:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661280.1031031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJm9-0003s3-1w; Thu, 04 Jan 2024 09:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661280.1031031; Thu, 04 Jan 2024 09:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJm8-0003iR-T0; Thu, 04 Jan 2024 09:12:28 +0000
Received: by outflank-mailman (input) for mailman id 661280;
 Thu, 04 Jan 2024 09:12:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJcj-00085z-FK
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:02:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 061b23c4-aae0-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:02:44 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9270121EE1;
 Thu,  4 Jan 2024 09:02:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DB9413722;
 Thu,  4 Jan 2024 09:02:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RlydFTR0lmUSWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:02:44 +0000
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
X-Inumbo-ID: 061b23c4-aae0-11ee-98ef-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v3 19/33] tools/xenstored: rename xenbus_evtchn()
Date: Thu,  4 Jan 2024 10:00:41 +0100
Message-Id: <20240104090055.27323-20-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 9270121EE1
X-Spam-Flag: NO

Rename the xenbus_evtchn() function to get_xenbus_evtchn() in order to
avoid two externally visible symbols with the same name when Xenstore-
stubdom is being built with a Mini-OS with CONFIG_XENBUS set.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/xenstored/core.h   | 2 +-
 tools/xenstored/domain.c | 2 +-
 tools/xenstored/minios.c | 2 +-
 tools/xenstored/posix.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index ad87199042..480b0f5f7b 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -383,7 +383,7 @@ static inline bool domain_is_unprivileged(const struct connection *conn)
 }
 
 /* Return the event channel used by xenbus. */
-evtchn_port_t xenbus_evtchn(void);
+evtchn_port_t get_xenbus_evtchn(void);
 
 /* Write out the pidfile */
 void write_pidfile(const char *pidfile);
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 409b53acf9..6ef136e01f 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1208,7 +1208,7 @@ void dom0_init(void)
 	evtchn_port_t port;
 	struct domain *dom0;
 
-	port = xenbus_evtchn();
+	port = get_xenbus_evtchn();
 	if (port == -1)
 		barf_perror("Failed to initialize dom0 port");
 
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index b5c3a205e6..0779efbf91 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -38,7 +38,7 @@ void init_pipe(int reopen_log_pipe[2])
 	reopen_log_pipe[1] = -1;
 }
 
-evtchn_port_t xenbus_evtchn(void)
+evtchn_port_t get_xenbus_evtchn(void)
 {
 	return dom0_event;
 }
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 6ac45fdb45..7e03dd982d 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -111,7 +111,7 @@ void unmap_xenbus(void *interface)
 	munmap(interface, getpagesize());
 }
 
-evtchn_port_t xenbus_evtchn(void)
+evtchn_port_t get_xenbus_evtchn(void)
 {
 	int fd;
 	int rc;
-- 
2.35.3


