Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A907614EC7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435051.688088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optlD-0006CK-1L; Tue, 01 Nov 2022 16:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435051.688088; Tue, 01 Nov 2022 16:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optlC-0006AH-UC; Tue, 01 Nov 2022 16:05:06 +0000
Received: by outflank-mailman (input) for mailman id 435051;
 Tue, 01 Nov 2022 16:05:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optlB-0003Iv-3U
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:05:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f272fb8f-59fe-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 17:05:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 32067225A4;
 Tue,  1 Nov 2022 16:05:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09D721346F;
 Tue,  1 Nov 2022 16:05:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wBs4AbBDYWNscgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:05:04 +0000
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
X-Inumbo-ID: f272fb8f-59fe-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667318704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLiRR0HBtiamzqwHIKj4WOLeWu1RXT2UzX7ss3KrLTA=;
	b=nuqhTHY6cfBGrDX1oNGxGEioxVSe59cEhTzjpZyRyj647EtN9moepmFnXlUcFvwV3zbSPr
	8pLi6DXUvjiycifxvRsy39jxSf0Xs7dOjvL3wAbaHVGUgX9IEdr5jeTpuYXgyWyXvrrmZF
	61S8l7QC8vFF5r34cLi0tTppF8/n3oU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 07/12] tools/xenstore: add accounting trace support
Date: Tue,  1 Nov 2022 17:04:17 +0100
Message-Id: <20221101160422.7212-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101160422.7212-1-jgross@suse.com>
References: <20221101160422.7212-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new trace switch "acc" and the related trace calls.

The "acc" switch is off per default.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c   |  2 +-
 tools/xenstore/xenstored_core.h   |  1 +
 tools/xenstore/xenstored_domain.c | 10 ++++++++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 7bd83a0eaf..be3c2aba77 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2737,7 +2737,7 @@ static void set_quota(const char *arg, bool soft)
 
 /* Sorted by bit values of TRACE_* flags. Flag is (1u << index). */
 const char *trace_switches[] = {
-	"obj", "io", "wrl",
+	"obj", "io", "wrl", "acc",
 	NULL
 };
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 8223a49354..e17bd4c268 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -294,6 +294,7 @@ extern unsigned int trace_flags;
 #define TRACE_OBJ	0x00000001
 #define TRACE_IO	0x00000002
 #define TRACE_WRL	0x00000004
+#define TRACE_ACC	0x00000008
 extern const char *trace_switches[];
 int set_trace_switch(const char *arg);
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index cb2a78b597..2420fbff31 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -546,6 +546,12 @@ static struct domain *find_domain_by_domid(unsigned int domid)
 	return (d && d->introduced) ? d : NULL;
 }
 
+#define trace_acc(...)				\
+do {						\
+	if (trace_flags & TRACE_ACC)		\
+		trace("acc: " __VA_ARGS__);	\
+} while (0)
+
 int acc_fix_domains(struct list_head *head, bool update)
 {
 	struct changed_domain *cd;
@@ -609,6 +615,8 @@ static int acc_add_changed_dom(const void *ctx, struct list_head *head,
 		return 0;
 
 	errno = 0;
+	trace_acc("local change domid %u: what=%u %d add %d\n", domid, what,
+		  cd->acc[what], val);
 	cd->acc[what] += val;
 
 	return cd->acc[what];
@@ -1111,6 +1119,8 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
 		return domain_acc_add_chk(d, what, ret, domid);
 	}
 
+	trace_acc("global change domid %u: what=%u %u add %d\n", domid, what,
+		  d->acc[what], add);
 	d->acc[what] = domain_acc_add_chk(d, what, add, domid);
 
 	return d->acc[what];
-- 
2.35.3


