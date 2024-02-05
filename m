Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DBF84981E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675813.1051356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwad-0006P9-Qw; Mon, 05 Feb 2024 10:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675813.1051356; Mon, 05 Feb 2024 10:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwad-0006M0-Mv; Mon, 05 Feb 2024 10:52:39 +0000
Received: by outflank-mailman (input) for mailman id 675813;
 Mon, 05 Feb 2024 10:52:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwac-00064Q-28
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:52:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac30caae-c414-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 11:52:36 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1279222100;
 Mon,  5 Feb 2024 10:52:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDF5C132DD;
 Mon,  5 Feb 2024 10:52:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CPKmLPO9wGXuNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:52:35 +0000
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
X-Inumbo-ID: ac30caae-c414-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707130356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeNBiDTNS7TMepXj/jHm53gvlyAKdRYh91nCqLjvqLA=;
	b=ihzYIvnwhErawe9X0SPXCpAAKCwJ5kImARwcHVfOvAYWrMKt8N3m6pcy/ylnYFzPUrDUc8
	fJGFWcsoYkpqv6UQQY1e5LpK/jgZ2kC2Qu+nfUerL6NaPTNOnbNDa4C6iZVz5ImDz+3pTK
	kuZqJjCB6DEJ06yHzi/BIfO2Uy+VYvI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707130356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeNBiDTNS7TMepXj/jHm53gvlyAKdRYh91nCqLjvqLA=;
	b=ihzYIvnwhErawe9X0SPXCpAAKCwJ5kImARwcHVfOvAYWrMKt8N3m6pcy/ylnYFzPUrDUc8
	fJGFWcsoYkpqv6UQQY1e5LpK/jgZ2kC2Qu+nfUerL6NaPTNOnbNDa4C6iZVz5ImDz+3pTK
	kuZqJjCB6DEJ06yHzi/BIfO2Uy+VYvI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 27/32] tools/xenstored: split domain_init()
Date: Mon,  5 Feb 2024 11:49:56 +0100
Message-Id: <20240205105001.24171-28-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,xen.org,citrix.com,gmail.com,amazon.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

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
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V3:
- rename new function to domain_early_init() (Julien Grall)
---
 tools/xenstored/core.c   |  2 ++
 tools/xenstored/domain.c | 12 ++++++------
 tools/xenstored/domain.h |  1 +
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 9eb3cdf446..3bf2ec7734 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2742,6 +2742,8 @@ int main(int argc, char *argv[])
 
 	talloc_enable_null_tracking();
 
+	domain_early_init();
+
 	/* Listen to hypervisor. */
 	if (!live_update) {
 		domain_init(-1);
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index af80a8221d..621b415088 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1224,10 +1224,8 @@ static int domeq_fn(const void *key1, const void *key2)
 	return *(const unsigned int *)key1 == *(const unsigned int *)key2;
 }
 
-void domain_init(int evtfd)
+void domain_early_init(void)
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
index 7625dca8cd..224c4c23e2 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -82,6 +82,7 @@ int do_get_domain_path(const void *ctx, struct connection *conn,
 int do_reset_watches(const void *ctx, struct connection *conn,
 		     struct buffered_data *in);
 
+void domain_early_init(void);
 void domain_init(int evtfd);
 void dom0_init(void);
 void domain_deinit(void);
-- 
2.35.3


