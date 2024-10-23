Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30989ACAC4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 15:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824606.1238761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3b7y-0006j9-10; Wed, 23 Oct 2024 13:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824606.1238761; Wed, 23 Oct 2024 13:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3b7x-0006gR-UK; Wed, 23 Oct 2024 13:10:17 +0000
Received: by outflank-mailman (input) for mailman id 824606;
 Wed, 23 Oct 2024 13:10:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W0hE=RT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t3b7w-0006ft-4v
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 13:10:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24630b65-9140-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 15:10:14 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0E0F91FDA2;
 Wed, 23 Oct 2024 13:10:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0DA013A63;
 Wed, 23 Oct 2024 13:10:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7ep2LbX1GGe+dwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 23 Oct 2024 13:10:13 +0000
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
X-Inumbo-ID: 24630b65-9140-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729689014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/jCtUub5rdGQ3ibE045xPBxKzrjJrpwGC8ELjHDU+0=;
	b=hvrpHxok67YrGN7ETYvPX5Zde5uMbuVhY1TdYwk8wWkpWdkPS49o5F4gGX3QFtxU1x3Tf9
	ogp14Jhdz/tsljAUDoX6eKJt3pJ40XQsnySdG0F2BU7FDRfxgtFtxUCQxp9MmO+fMMt5tI
	YNYv1yrH3nSb/KRm+Ocv18ZUkP745iM=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=hvrpHxok
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729689014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/jCtUub5rdGQ3ibE045xPBxKzrjJrpwGC8ELjHDU+0=;
	b=hvrpHxok67YrGN7ETYvPX5Zde5uMbuVhY1TdYwk8wWkpWdkPS49o5F4gGX3QFtxU1x3Tf9
	ogp14Jhdz/tsljAUDoX6eKJt3pJ40XQsnySdG0F2BU7FDRfxgtFtxUCQxp9MmO+fMMt5tI
	YNYv1yrH3nSb/KRm+Ocv18ZUkP745iM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/6] xen: add a domain unique id to each domain
Date: Wed, 23 Oct 2024 15:10:00 +0200
Message-ID: <20241023131005.32144-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023131005.32144-1-jgross@suse.com>
References: <20241023131005.32144-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0E0F91FDA2
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Xenstore is referencing domains by their domid, but reuse of a domid
can lead to the situation that Xenstore can't tell whether a domain
with that domid has been deleted and created again without Xenstore
noticing the domain is a new one now.

Add a global domain creation unique id which is updated when creating
a new domain, and store that value in struct domain of the new domain.
The global unique id is initialized with the system time and updates
are done via the xorshift algorithm which is used for pseudo random
number generation, too (see https://en.wikipedia.org/wiki/Xorshift).

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V1:
- make unique_id local to function (Jan Beulich)
- add lock (Julien Grall)
- add comment (Julien Grall)
---
 xen/common/domain.c     | 20 ++++++++++++++++++++
 xen/include/xen/sched.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 92263a4fbd..3948640fb0 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -562,6 +562,25 @@ static void _domain_destroy(struct domain *d)
     free_domain_struct(d);
 }
 
+static uint64_t get_unique_id(void)
+{
+    static uint64_t unique_id;
+    static DEFINE_SPINLOCK(lock);
+    uint64_t x = unique_id ? : NOW();
+
+    spin_lock(&lock);
+
+    /* Pseudo-randomize id in order to avoid consumers relying on sequence. */
+    x ^= x << 13;
+    x ^= x >> 7;
+    x ^= x << 17;
+    unique_id = x;
+
+    spin_unlock(&lock);
+
+    return x;
+}
+
 static int sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
@@ -654,6 +673,7 @@ struct domain *domain_create(domid_t domid,
 
     /* Sort out our idea of is_system_domain(). */
     d->domain_id = domid;
+    d->unique_id = get_unique_id();
 
     /* Holding CDF_* internal flags. */
     d->cdf = flags;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 90666576c2..1dd8a425f9 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -370,6 +370,9 @@ struct domain
     domid_t          domain_id;
 
     unsigned int     max_vcpus;
+
+    uint64_t         unique_id;       /* Unique domain identifier */
+
     struct vcpu    **vcpu;
 
     shared_info_t   *shared_info;     /* shared data area */
-- 
2.43.0


