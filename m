Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CCCA2708C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 12:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881349.1291489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHKV-0007nt-9g; Tue, 04 Feb 2025 11:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881349.1291489; Tue, 04 Feb 2025 11:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHKV-0007l4-6T; Tue, 04 Feb 2025 11:42:59 +0000
Received: by outflank-mailman (input) for mailman id 881349;
 Tue, 04 Feb 2025 11:42:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ljwx=U3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tfHCq-0001MV-79
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 11:35:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12b9572c-e2ec-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 12:35:02 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 52CD0210FB;
 Tue,  4 Feb 2025 11:35:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A84C1393E;
 Tue,  4 Feb 2025 11:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id b67wCGb7oWf6LAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 04 Feb 2025 11:35:02 +0000
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
X-Inumbo-ID: 12b9572c-e2ec-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738668902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBhBlO+itbvBLHIPM4oErzYEWzlr9/4zHcSqtxBR1Ww=;
	b=uzsvKMi/YWzuHwLVOXXHwprVjZ9I2mh/lWTQmHi1Pdz+DSnnvCBnBBsNnu+gO7ZbBRAQSx
	cTtUTVSGEaVyYz/DF6vuOBwaanFlvhGgfhKM/i+E8/J66whx0rjwD3ZZ7JfzOkW18P3TDF
	iRQvDO+w5n/0egMLjPIHo2VDcotWB/Q=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="uzsvKMi/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738668902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBhBlO+itbvBLHIPM4oErzYEWzlr9/4zHcSqtxBR1Ww=;
	b=uzsvKMi/YWzuHwLVOXXHwprVjZ9I2mh/lWTQmHi1Pdz+DSnnvCBnBBsNnu+gO7ZbBRAQSx
	cTtUTVSGEaVyYz/DF6vuOBwaanFlvhGgfhKM/i+E8/J66whx0rjwD3ZZ7JfzOkW18P3TDF
	iRQvDO+w5n/0egMLjPIHo2VDcotWB/Q=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v8 9/9] tools/xenstored: use xenmanage_poll_changed_domain()
Date: Tue,  4 Feb 2025 12:34:07 +0100
Message-ID: <20250204113407.16839-10-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204113407.16839-1-jgross@suse.com>
References: <20250204113407.16839-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 52CD0210FB
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Instead of checking each known domain after having received a
VIRQ_DOM_EXC event, use the new xenmanage_poll_changed_domain()
function for directly getting the domid of a domain having changed
its state.

A test doing "xl shutdown" of 1000 guests has shown to reduce the
consumed cpu time of xenstored by 6% with this change applied.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V8:
- new patch
---
 tools/xenstored/domain.c | 64 +++++++++++++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 18 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 63df24030e..ad16a00ce3 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -621,30 +621,24 @@ static int destroy_domain(void *_domain)
 	return 0;
 }
 
-static int check_domain(const void *k, void *v, void *arg)
+static int do_check_domain(struct domain *domain, bool *notify,
+			   unsigned int state, uint64_t unique_id)
 {
-	unsigned int state;
 	struct connection *conn;
-	int dom_invalid;
-	struct domain *domain = v;
-	bool *notify = arg;
-	uint64_t unique_id;
 
-	dom_invalid = xenmanage_get_domain_info(xm_handle, domain->domid,
-						&state, &unique_id);
-	if (!dom_invalid) {
+	if (unique_id) {
 		if (!domain->unique_id)
 			domain->unique_id = unique_id;
 		else if (domain->unique_id != unique_id)
-			dom_invalid = 1;
+			unique_id = 0;
 	}
 
 	if (!domain->introduced) {
-		if (dom_invalid)
+		if (!unique_id)
 			talloc_free(domain);
 		return 0;
 	}
-	if (!dom_invalid) {
+	if (unique_id) {
 		if ((state & XENMANAGE_GETDOMSTATE_STATE_SHUTDOWN)
 		    && !domain->shutdown) {
 			domain->shutdown = true;
@@ -667,6 +661,21 @@ static int check_domain(const void *k, void *v, void *arg)
 	return 0;
 }
 
+static int check_domain(const void *k, void *v, void *arg)
+{
+	struct domain *domain = v;
+	unsigned int state;
+	uint64_t unique_id;
+
+	if (xenmanage_get_domain_info(xm_handle, domain->domid, &state,
+				      &unique_id)) {
+		unique_id = 0;
+		state = 0;
+	}
+
+	return do_check_domain(domain, arg, state, unique_id);
+}
+
 void check_domains(void)
 {
 	bool notify = false;
@@ -678,6 +687,30 @@ void check_domains(void)
 		fire_special_watches("@releaseDomain");
 }
 
+static struct domain *find_domain_struct(unsigned int domid)
+{
+	return hashtable_search(domhash, &domid);
+}
+
+static void do_check_domains(void)
+{
+	unsigned int domid;
+	unsigned int state;
+	uint64_t unique_id;
+	struct domain *domain;
+	bool notify = false;
+
+	while (!xenmanage_poll_changed_domain(xm_handle, &domid, &state,
+					      &unique_id)) {
+		domain = find_domain_struct(domid);
+		if (domain)
+			do_check_domain(domain, &notify, state, unique_id);
+	}
+
+	if (notify)
+		fire_special_watches("@releaseDomain");
+}
+
 /* We scan all domains rather than use the information given here. */
 void handle_event(void)
 {
@@ -687,7 +720,7 @@ void handle_event(void)
 		barf_perror("Failed to read from event fd");
 
 	if (port == virq_port)
-		check_domains();
+		do_check_domains();
 
 	if (xenevtchn_unmask(xce_handle, port) == -1)
 		barf_perror("Failed to write to event fd");
@@ -698,11 +731,6 @@ static char *talloc_domain_path(const void *context, unsigned int domid)
 	return talloc_asprintf(context, "/local/domain/%u", domid);
 }
 
-static struct domain *find_domain_struct(unsigned int domid)
-{
-	return hashtable_search(domhash, &domid);
-}
-
 int domain_get_quota(const void *ctx, struct connection *conn,
 		     unsigned int domid)
 {
-- 
2.43.0


