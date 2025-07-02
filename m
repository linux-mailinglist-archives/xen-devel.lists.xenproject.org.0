Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9E4AF0DB6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030447.1404173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsi3-0005w4-Qe; Wed, 02 Jul 2025 08:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030447.1404173; Wed, 02 Jul 2025 08:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsi3-0005ix-FE; Wed, 02 Jul 2025 08:20:51 +0000
Received: by outflank-mailman (input) for mailman id 1030447;
 Wed, 02 Jul 2025 08:20:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsas-00082X-Kv
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d1a0bc4-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:25 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C56B71F454;
 Wed,  2 Jul 2025 08:13:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C03113A24;
 Wed,  2 Jul 2025 08:13:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JdiDJCTqZGgUSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:24 +0000
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
X-Inumbo-ID: 6d1a0bc4-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VnYHbx1b6eDsCfttQs09iHQOMBpidE1KzK0WuvNpBs=;
	b=vL3SEcPq59eEcqZuqsFbJBUOR5FdYogFa5pKE5Q3JhCLZT6VYIOVWy2XzUwcj5+h0hp7gJ
	L0aVBwHLe4I7kyICD42dTKnl8fJHxO1nUgIB07+XPsnMHlMgfVdvhtIVjMOPLXeg6T3l+E
	AZVGYxfTux4fGdvcAC8saU/udBlJL6Y=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VnYHbx1b6eDsCfttQs09iHQOMBpidE1KzK0WuvNpBs=;
	b=vL3SEcPq59eEcqZuqsFbJBUOR5FdYogFa5pKE5Q3JhCLZT6VYIOVWy2XzUwcj5+h0hp7gJ
	L0aVBwHLe4I7kyICD42dTKnl8fJHxO1nUgIB07+XPsnMHlMgfVdvhtIVjMOPLXeg6T3l+E
	AZVGYxfTux4fGdvcAC8saU/udBlJL6Y=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 2/9] tools/xenstore: perform kexec for stubdom live update
Date: Wed,  2 Jul 2025 10:12:58 +0200
Message-ID: <20250702081305.14440-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081305.14440-1-jgross@suse.com>
References: <20250702081305.14440-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email]
X-Spam-Level: 

For the final step of live-update in stubdom, call kexec().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/lu_minios.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tools/xenstored/lu_minios.c b/tools/xenstored/lu_minios.c
index b14a0b29d5..b8ca631610 100644
--- a/tools/xenstored/lu_minios.c
+++ b/tools/xenstored/lu_minios.c
@@ -8,13 +8,44 @@
 #include <stdlib.h>
 #include <syslog.h>
 
+#include <mini-os/kexec.h>
+
 #include "talloc.h"
 #include "lu.h"
+#include "core.h"
 
 #ifndef NO_LIVE_UPDATE
 char *lu_exec(const void *ctx, int argc, char **argv)
 {
-	return "NYI";
+	int i;
+	int ret;
+	char *errbuf;
+	char *cmdline;
+
+	if (!lu_status->kernel)
+		return "No new kernel";
+
+	cmdline = talloc_strdup(ctx, "");
+	if (!cmdline)
+		return "Allocation failure";
+	for (i = 1; argv[i]; i++) {
+		if (i > 1) {
+			cmdline = talloc_append_string(ctx, cmdline, " ");
+			if (!cmdline)
+				return "Allocation failure";
+		}
+		cmdline = talloc_append_string(ctx, cmdline, argv[i]);
+		if (!cmdline)
+			return "Allocation failure";
+	}
+
+	ret = kexec(lu_status->kernel, lu_status->kernel_size, cmdline);
+
+	errbuf = talloc_asprintf(ctx, "kexec() returned %d", ret);
+	if (!errbuf)
+		errbuf = "kexec() returned";
+
+	return errbuf;
 }
 
 static const char *lu_binary_alloc(const void *ctx, struct connection *conn,
-- 
2.43.0


