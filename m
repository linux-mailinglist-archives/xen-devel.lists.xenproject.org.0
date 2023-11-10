Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343547E7DC0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630580.983593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UHg-0008Ni-7d; Fri, 10 Nov 2023 16:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630580.983593; Fri, 10 Nov 2023 16:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UHg-0008Lg-4W; Fri, 10 Nov 2023 16:23:04 +0000
Received: by outflank-mailman (input) for mailman id 630580;
 Fri, 10 Nov 2023 16:23:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U5D-0004cS-RJ
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:10:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f34dd96-7fe3-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:10:10 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC087219B4;
 Fri, 10 Nov 2023 16:10:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C169613398;
 Fri, 10 Nov 2023 16:10:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gH/kLeFVTmVeCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:10:09 +0000
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
X-Inumbo-ID: 9f34dd96-7fe3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAZKhBAd6GT93Obj94j3yjFdAss/Va3cfRb6VorS53Y=;
	b=pYmsLvxEBdeltPTcFGkEkHv24YTfJNEAC2lyvak5KOpvB+amuNQODE61RgjMGa5hJAVA74
	J97NxeTvPXhfG4VWOqCZp+twRFdYig+Tg6zQVK824PZ0iMqke+MmeT4bxQtr55fEnJadUm
	JwVDVfdGnY33teaiWL2DvaMT9AYyNkU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 22/29] tools/xenstored: get own domid in stubdom case
Date: Fri, 10 Nov 2023 17:07:57 +0100
Message-Id: <20231110160804.29021-23-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtain the own domid from the Xenstore special grant entry when running
as stubdom.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- replacement of V1 patch (ANdrew Cooper)
---
 tools/xenstored/core.c   | 1 +
 tools/xenstored/core.h   | 1 +
 tools/xenstored/minios.c | 5 +++++
 3 files changed, 7 insertions(+)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 0c14823fb0..8e271e31f9 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2738,6 +2738,7 @@ static struct option options[] = {
 int dom0_domid = 0;
 int dom0_event = 0;
 int priv_domid = 0;
+int stub_domid = -1;
 
 static unsigned int get_optval_uint(const char *arg)
 {
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index d0ac587f8f..3c28007d11 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -361,6 +361,7 @@ do {						\
 extern int dom0_domid;
 extern int dom0_event;
 extern int priv_domid;
+extern int stub_domid;
 extern bool keep_orphans;
 
 extern unsigned int timeout_watch_event_msec;
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index 0cdec3ae51..202d70387a 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -19,6 +19,8 @@
 #include <sys/mman.h>
 #include "core.h"
 #include <xen/grant_table.h>
+#include <mini-os/events.h>
+#include <mini-os/gnttab.h>
 
 void write_pidfile(const char *pidfile)
 {
@@ -56,4 +58,7 @@ void unmap_xenbus(void *interface)
 
 void early_init(void)
 {
+	stub_domid = evtchn_get_domid();
+	if (stub_domid == DOMID_INVALID)
+		barf("could not get own domid");
 }
-- 
2.35.3


