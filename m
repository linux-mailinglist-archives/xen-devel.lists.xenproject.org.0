Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC181823E57
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661237.1030985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJkU-0001Le-5X; Thu, 04 Jan 2024 09:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661237.1030985; Thu, 04 Jan 2024 09:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJkU-0001Gb-1a; Thu, 04 Jan 2024 09:10:46 +0000
Received: by outflank-mailman (input) for mailman id 661237;
 Thu, 04 Jan 2024 09:10:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJdM-00085z-DL
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:03:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d428195-aae0-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:03:23 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 46D4F21EE1;
 Thu,  4 Jan 2024 09:03:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D5F213722;
 Thu,  4 Jan 2024 09:03:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UID0BVt0lmVOWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:03:23 +0000
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
X-Inumbo-ID: 1d428195-aae0-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704359003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PRwkEgUlvhygA2ICPfUBXzv+stFJ1TKHPnwBlk1TeGM=;
	b=QVOpiHqAsreGoPLztZ/HrswmhEh1C1Zswv9NFUuJkfyIfyX6LSJvfuQ2yrKNknn7wa7MN9
	cAaqTt42rwbzJkhGyqvVNyfwef/+HNfPxOQ1grfNR61UBZKeewnAXOjymmLsc9BQRiBuF9
	QQU8K26TLOUwpcYJoRMbWUueXGz5ABE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704359003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PRwkEgUlvhygA2ICPfUBXzv+stFJ1TKHPnwBlk1TeGM=;
	b=QVOpiHqAsreGoPLztZ/HrswmhEh1C1Zswv9NFUuJkfyIfyX6LSJvfuQ2yrKNknn7wa7MN9
	cAaqTt42rwbzJkhGyqvVNyfwef/+HNfPxOQ1grfNR61UBZKeewnAXOjymmLsc9BQRiBuF9
	QQU8K26TLOUwpcYJoRMbWUueXGz5ABE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 26/33] tools/xenstored: get own domid in stubdom case
Date: Thu,  4 Jan 2024 10:00:48 +0100
Message-Id: <20240104090055.27323-27-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ****
X-Spam-Score: 4.20
X-Spamd-Result: default: False [4.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Obtain the own domid when running as stubdom.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- replacement of V1 patch (Andrew Cooper)
V3:
- rename called function to get_domid() (Julien Grall)
- change stub_domid type to domid_t (Julien Grall)
---
 tools/xenstored/core.c   | 1 +
 tools/xenstored/core.h   | 1 +
 tools/xenstored/minios.c | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 8ff1faccef..edb2ab97b8 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2559,6 +2559,7 @@ static struct option options[] = {
 int dom0_domid = 0;
 int dom0_event = 0;
 int priv_domid = 0;
+domid_t stub_domid = DOMID_INVALID;
 
 static unsigned int get_optval_uint(const char *arg)
 {
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index ddc345050c..a20c7ee3a0 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -363,6 +363,7 @@ do {						\
 extern int dom0_domid;
 extern int dom0_event;
 extern int priv_domid;
+extern domid_t stub_domid;
 extern bool keep_orphans;
 
 extern struct pollfd *fds;
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index 5d59cc90cc..38a51e671a 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -20,6 +20,7 @@
 #include "core.h"
 #include "utils.h"
 #include <xen/grant_table.h>
+#include <mini-os/lib.h>
 
 void finish_daemonize(void)
 {
@@ -48,6 +49,9 @@ void unmap_xenbus(void *interface)
 
 void early_init(bool live_update, bool dofork, const char *pidfile)
 {
+	stub_domid = get_domid();
+	if (stub_domid == DOMID_INVALID)
+		barf("could not get own domid");
 }
 
 void late_init(bool live_update)
-- 
2.35.3


