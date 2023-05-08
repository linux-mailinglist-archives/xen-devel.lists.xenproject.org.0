Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAD36FAEEB
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 13:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531415.827088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzMB-0007UE-TV; Mon, 08 May 2023 11:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531415.827088; Mon, 08 May 2023 11:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzMB-0007S0-Ne; Mon, 08 May 2023 11:48:43 +0000
Received: by outflank-mailman (input) for mailman id 531415;
 Mon, 08 May 2023 11:48:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOTd=A5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pvzMA-0004FA-BZ
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 11:48:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 474ba90e-ed96-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 13:48:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 687D81FE43;
 Mon,  8 May 2023 11:48:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2AD791346B;
 Mon,  8 May 2023 11:48:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IpQiCZnhWGRJNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 May 2023 11:48:41 +0000
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
X-Inumbo-ID: 474ba90e-ed96-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683546521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HoO5vhLxJfHeUF6CaN4B5hMFR55WKl59O7dl7jFaRfo=;
	b=Yz3s02wIMFCTIEwsPY87/4US/J/9IK8jK5QOI19zTpnkV5jTVuuwlHFacpPhig//JplOeA
	+2UgwIzGy6D00Eh2C19Udvu9LoX0bkWQNaQTzkRujwPMJtb9i02aAOWU/pDNJYz/eQvoih
	xIWnQ1eZcXqhAgqu+4Ug8dc78QTZ33I=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 08/14] tools/xenstore: add accounting trace support
Date: Mon,  8 May 2023 13:47:48 +0200
Message-Id: <20230508114754.31514-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230508114754.31514-1-jgross@suse.com>
References: <20230508114754.31514-1-jgross@suse.com>
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
index e7f86f9487..15654730a6 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2750,7 +2750,7 @@ static void set_quota(const char *arg, bool soft)
 
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
index a35ed97fd7..03825ca24b 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -538,6 +538,12 @@ static struct domain *find_domain_by_domid(unsigned int domid)
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
@@ -601,6 +607,8 @@ static int acc_add_changed_dom(const void *ctx, struct list_head *head,
 		return 0;
 
 	errno = 0;
+	trace_acc("local change domid %u: what=%u %d add %d\n", domid, what,
+		  cd->acc[what], val);
 	cd->acc[what] += val;
 
 	return cd->acc[what];
@@ -1112,6 +1120,8 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
 		return domain_acc_add_valid(d, what, ret);
 	}
 
+	trace_acc("global change domid %u: what=%u %u add %d\n", domid, what,
+		  d->acc[what], add);
 	d->acc[what] = domain_acc_add_valid(d, what, add);
 
 	return d->acc[what];
-- 
2.35.3


