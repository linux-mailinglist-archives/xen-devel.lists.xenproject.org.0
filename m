Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E47AF0DB3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:20:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030437.1404125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWshw-0004d6-OM; Wed, 02 Jul 2025 08:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030437.1404125; Wed, 02 Jul 2025 08:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWshw-0004Vh-Du; Wed, 02 Jul 2025 08:20:44 +0000
Received: by outflank-mailman (input) for mailman id 1030437;
 Wed, 02 Jul 2025 08:20:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsbG-00082X-OB
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a51eb2c-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:47 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 130932117F;
 Wed,  2 Jul 2025 08:13:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D892813A54;
 Wed,  2 Jul 2025 08:13:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PcglMzrqZGhGSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:46 +0000
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
X-Inumbo-ID: 7a51eb2c-571c-11f0-b894-0df219b8e170
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 6/9] xenstored: don't use xenevtchn_fdopen() in stubdom
Date: Wed,  2 Jul 2025 10:13:02 +0200
Message-ID: <20250702081305.14440-7-jgross@suse.com>
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
X-Rspamd-Queue-Id: 130932117F
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00

When running in a stubdom environment xenevtchn_fdopen() won't work,
as any file descriptor state is lost across kexec().

Use a wrapper to replace the call of xenevtchn_fdopen() with the
really needed xenevtchn_open() when running on top of Mini-OS.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.h   | 3 +++
 tools/xenstored/domain.c | 2 +-
 tools/xenstored/minios.c | 5 +++++
 tools/xenstored/posix.c  | 5 +++++
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 1ba9592d16..bef24a688c 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -29,6 +29,7 @@
 #include <stdint.h>
 #include <time.h>
 #include <errno.h>
+#include <xenevtchn.h>
 
 #include "xenstore_lib.h"
 #include "xenstore_state.h"
@@ -405,6 +406,8 @@ void handle_special_fds(void);
 int get_socket_fd(void);
 void set_socket_fd(int fd);
 
+xenevtchn_handle *evtchn_fdopen(int fd);
+
 #ifdef __MINIOS__
 void mount_9pfs(void);
 #endif
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index e1d5e8d614..e0c2342edb 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1326,7 +1326,7 @@ void domain_init(int evtfd)
 	if (evtfd < 0)
 		xce_handle = xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
 	else
-		xce_handle = xenevtchn_fdopen(NULL, evtfd, 0);
+		xce_handle = evtchn_fdopen(evtfd);
 
 	if (xce_handle == NULL)
 		barf_perror("Failed to open evtchn device");
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index a229954cf4..aa1f03fd6b 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -85,6 +85,11 @@ void set_socket_fd(int fd)
 {
 }
 
+xenevtchn_handle *evtchn_fdopen(int fd)
+{
+	return xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
+}
+
 static void mount_thread(void *p)
 {
 	xenbus_event_queue events = NULL;
diff --git a/tools/xenstored/posix.c b/tools/xenstored/posix.c
index 6037d739d0..ebdec82215 100644
--- a/tools/xenstored/posix.c
+++ b/tools/xenstored/posix.c
@@ -408,6 +408,11 @@ void set_socket_fd(int fd)
 	sock = fd;
 }
 
+xenevtchn_handle *evtchn_fdopen(int fd)
+{
+	return xenevtchn_fdopen(NULL, fd, 0);
+}
+
 const char *xenstore_rundir(void)
 {
 	return xenstore_daemon_rundir();
-- 
2.43.0


