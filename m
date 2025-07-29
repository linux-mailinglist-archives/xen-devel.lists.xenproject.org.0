Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C553BB14CA7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 13:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062445.1428147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugi63-0003Jf-RE; Tue, 29 Jul 2025 11:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062445.1428147; Tue, 29 Jul 2025 11:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugi63-0003IW-MZ; Tue, 29 Jul 2025 11:02:15 +0000
Received: by outflank-mailman (input) for mailman id 1062445;
 Tue, 29 Jul 2025 11:02:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugi61-0002qP-PO
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 11:02:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a820397-6c6b-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 13:02:12 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E05C521A36;
 Tue, 29 Jul 2025 11:02:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B259B13876;
 Tue, 29 Jul 2025 11:02:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hJkoKjOqiGjPbQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 29 Jul 2025 11:02:11 +0000
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
X-Inumbo-ID: 7a820397-6c6b-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753786932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/WAy7ZfzAdZfOYDos9+uJhuz1NfdLzQ8HaGXK/lMiv8=;
	b=IaHmpMpxracdfNWyqS1XTw44ULWaNWmEPOVrM4UIwqmZNV50CZW/LywA3dlMps5PhL2C6s
	iUfPjqWcSBTqfW0FmZcmHDBDzdOj3E6WOjghFimwcWaQ+9MRVhkBZ43y8vFDiR1++X9Mp5
	GRkoDM+xQ0sH45VsXzPyc5Krdcm6Y10=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753786931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/WAy7ZfzAdZfOYDos9+uJhuz1NfdLzQ8HaGXK/lMiv8=;
	b=b3IPhDpZRxeJ4ADKWQrfkc9dYhovK21eCxTxlY8tIdk3b2goR6JHlT6jFk4ReCCO4qW6M/
	98RMozv/bhOCsV2bnWiJ0DlhBD2ENV8t/7HFsHomfaewp5USTakR3MItos58SH4dfju2wj
	250KK5JAmG5FC7UApLq4GOGA+zpWc0U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 4/9] xenstored: don't use xenevtchn_fdopen() in stubdom
Date: Tue, 29 Jul 2025 13:01:40 +0200
Message-ID: <20250729110146.10580-5-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729110146.10580-1-jgross@suse.com>
References: <20250729110146.10580-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

When running in a stubdom environment xenevtchn_fdopen() won't work,
as any file descriptor state is lost across kexec().

Use a wrapper to replace the call of xenevtchn_fdopen() with the
really needed xenevtchn_open() when running on top of Mini-OS.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
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
index 2362216a7a..6767d29a19 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1396,7 +1396,7 @@ void domain_init(int evtfd)
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


