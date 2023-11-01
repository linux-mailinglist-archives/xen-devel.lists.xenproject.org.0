Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E578A7DDEAE
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:48:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626301.976461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7pS-0000Dr-6f; Wed, 01 Nov 2023 09:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626301.976461; Wed, 01 Nov 2023 09:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7pS-0000BZ-42; Wed, 01 Nov 2023 09:48:02 +0000
Received: by outflank-mailman (input) for mailman id 626301;
 Wed, 01 Nov 2023 09:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7cz-0005E0-Rx
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:35:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2b8dac9-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:35:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1BEF41F74A;
 Wed,  1 Nov 2023 09:35:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6B9F13460;
 Wed,  1 Nov 2023 09:35:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2gIaN8wbQmVWCQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:35:08 +0000
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
X-Inumbo-ID: f2b8dac9-7899-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o4iqEXJmoZDlxNSf/ct8F3oPFJck5Vf1mV174DKFLFU=;
	b=JaUKC/pD88b+g7Gk2mtt3578hhevWGZfzX6lK5PKnGXKiMDCkBBilbdONSiYaiIO+5usvx
	mDm9HmwQZT4nqefgY+Uf2HImlIzzF1jNNWS61voEn1uEUHy4oPsWDtQi7uRGkJkqeSDTPo
	SvCWT0/421lnsVsxbbQSEJofdRm4PYs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 18/29] tools/xenstored: rename xenbus_evtchn()
Date: Wed,  1 Nov 2023 10:33:14 +0100
Message-Id: <20231101093325.30302-19-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the xenbus_evtchn() function to get_xenbus_evtchn() in order to
avoid two externally visible symbols with the same name when Xenstore-
stubdom is being built with a Mini-OS with CONFIG_XENBUS set.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


