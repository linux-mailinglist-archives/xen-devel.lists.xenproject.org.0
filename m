Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A737DDEC6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626344.976562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7vE-0008Ht-68; Wed, 01 Nov 2023 09:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626344.976562; Wed, 01 Nov 2023 09:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7vE-0008Ea-2w; Wed, 01 Nov 2023 09:54:00 +0000
Received: by outflank-mailman (input) for mailman id 626344;
 Wed, 01 Nov 2023 09:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7dR-0005E0-Le
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:35:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03512e42-789a-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:35:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB8441F74A;
 Wed,  1 Nov 2023 09:35:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE2A013460;
 Wed,  1 Nov 2023 09:35:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bDcDLegbQmWICQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:35:36 +0000
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
X-Inumbo-ID: 03512e42-789a-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQ78E8HS1n1N0QHhM7YQ5dj02t//jI6MdPWceDYsOps=;
	b=bRBS1tJphNVYmRRl0SOjs91AtWymp4pqnQCJ30/2/NVHfu3Lgtvw+JpmtY9ru98KiKakm4
	k0nJ51OVMJVOLzGKgGJLYh8SXHXjzTuGNmV86Wi8aL2L5kyvZ1d4dftflG52FncrrGIXDY
	MvEMVXLzAGyVpbvFFIRb6MncRWeYvKg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 23/29] tools/xenstored: split domain_init()
Date: Wed,  1 Nov 2023 10:33:19 +0100
Message-Id: <20231101093325.30302-24-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today domain_init() is called either just before calling dom0_init()
in case no live update is being performed, or it is called after
reading the global state from read_state_global(), as the event
channel fd is needed.

Split up domain_init() into a preparation part which can be called
unconditionally, and in a part setting up the event channel handle.

Note that there is no chance that chk_domain_generation() can be
called now before xc_handle has been setup, so there is no need for
the related special case anymore.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c   |  2 ++
 tools/xenstored/domain.c | 12 ++++++------
 tools/xenstored/domain.h |  1 +
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index bb4612455d..42a848e098 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2972,6 +2972,8 @@ int main(int argc, char *argv[])
 
 	init_pipe(reopen_log_pipe);
 
+	domain_static_init();
+
 	/* Listen to hypervisor. */
 	if (!no_domain_init && !live_update) {
 		domain_init(-1);
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 58b0942043..fa17f68618 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1224,10 +1224,8 @@ static int domeq_fn(const void *key1, const void *key2)
 	return *(const unsigned int *)key1 == *(const unsigned int *)key2;
 }
 
-void domain_init(int evtfd)
+void domain_static_init(void)
 {
-	int rc;
-
 	/* Start with a random rather low domain count for the hashtable. */
 	domhash = create_hashtable(NULL, "domains", domhash_fn, domeq_fn, 0);
 	if (!domhash)
@@ -1258,6 +1256,11 @@ void domain_init(int evtfd)
 	xengnttab_set_max_grants(*xgt_handle, DOMID_FIRST_RESERVED);
 
 	talloc_set_destructor(xgt_handle, close_xgt_handle);
+}
+
+void domain_init(int evtfd)
+{
+	int rc;
 
 	if (evtfd < 0)
 		xce_handle = xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
@@ -1291,9 +1294,6 @@ static bool chk_domain_generation(unsigned int domid, uint64_t gen)
 {
 	struct domain *d;
 
-	if (!xc_handle && domid == dom0_domid)
-		return true;
-
 	d = find_domain_struct(domid);
 
 	return d && d->generation <= gen;
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index 7625dca8cd..6c00540311 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -82,6 +82,7 @@ int do_get_domain_path(const void *ctx, struct connection *conn,
 int do_reset_watches(const void *ctx, struct connection *conn,
 		     struct buffered_data *in);
 
+void domain_static_init(void);
 void domain_init(int evtfd);
 void dom0_init(void);
 void domain_deinit(void);
-- 
2.35.3


