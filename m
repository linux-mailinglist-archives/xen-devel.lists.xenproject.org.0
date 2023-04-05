Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9306D74F8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 09:04:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518248.804612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxCA-0005nt-Ja; Wed, 05 Apr 2023 07:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518248.804612; Wed, 05 Apr 2023 07:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxCA-0005jc-Dv; Wed, 05 Apr 2023 07:04:38 +0000
Received: by outflank-mailman (input) for mailman id 518248;
 Wed, 05 Apr 2023 07:04:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wAG=74=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pjxC9-0002UC-5c
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 07:04:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 200ce63f-d380-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 09:04:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7340C20592;
 Wed,  5 Apr 2023 07:04:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D6E213A31;
 Wed,  5 Apr 2023 07:04:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TNk3DYQdLWTWEwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Apr 2023 07:04:36 +0000
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
X-Inumbo-ID: 200ce63f-d380-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680678276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FVX/N0LxAMOywC2jlDscHABd/v4BQEj8zV+MLHaj68=;
	b=kkFJhyYeVvEhEobwXdCyZzLJpbdI1PB+Q0ceqAJQc3IV+ScoJrBQheTkPhfSOhU8j3Zi3j
	3ilgCE1AnCRHhreOXN4+uAJwR+yzepxIshlSbqaD/7DaYRvHBtTmzKm2pa5Bk8NRtaU9Sq
	BdXYeOhCOuCgRFvcGQSoWQSQhTyy5rs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 08/13] tools/xenstore: add accounting trace support
Date: Wed,  5 Apr 2023 09:03:44 +0200
Message-Id: <20230405070349.25293-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230405070349.25293-1-jgross@suse.com>
References: <20230405070349.25293-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new trace switch "acc" and the related trace calls.

The "acc" switch is off per default.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c   |  2 +-
 tools/xenstore/xenstored_core.h   |  1 +
 tools/xenstore/xenstored_domain.c | 10 ++++++++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 67aa7c1578..bd816ce709 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2746,7 +2746,7 @@ static void set_quota(const char *arg, bool soft)
 
 /* Sorted by bit values of TRACE_* flags. Flag is (1u << index). */
 const char *const trace_switches[] = {
-	"obj", "io", "wrl",
+	"obj", "io", "wrl", "acc",
 	NULL
 };
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 1f811f38cb..3e0734a6c6 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -302,6 +302,7 @@ extern unsigned int trace_flags;
 #define TRACE_OBJ	0x00000001
 #define TRACE_IO	0x00000002
 #define TRACE_WRL	0x00000004
+#define TRACE_ACC	0x00000008
 extern const char *const trace_switches[];
 int set_trace_switch(const char *arg);
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 22836ae881..1caa60bb14 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -540,6 +540,12 @@ static struct domain *find_domain_by_domid(unsigned int domid)
 	return (d && d->introduced) ? d : NULL;
 }
 
+#define trace_acc(...)				\
+do {						\
+	if (trace_flags & TRACE_ACC)		\
+		trace("acc: " __VA_ARGS__);	\
+} while (0)
+
 int acc_fix_domains(struct list_head *head, bool chk_quota, bool update)
 {
 	struct changed_domain *cd;
@@ -603,6 +609,8 @@ static int acc_add_changed_dom(const void *ctx, struct list_head *head,
 		return 0;
 
 	errno = 0;
+	trace_acc("local change domid %u: what=%u %d add %d\n", domid, what,
+		  cd->acc[what], val);
 	cd->acc[what] += val;
 
 	return cd->acc[what];
@@ -1114,6 +1122,8 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
 		return domain_acc_add_valid(d, what, ret);
 	}
 
+	trace_acc("global change domid %u: what=%u %u add %d\n", domid, what,
+		  d->acc[what], add);
 	d->acc[what] = domain_acc_add_valid(d, what, add);
 
 	return d->acc[what];
-- 
2.35.3


