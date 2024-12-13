Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BE29F11FD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856794.1269328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8T7-00011h-CE; Fri, 13 Dec 2024 16:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856794.1269328; Fri, 13 Dec 2024 16:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8T7-0000z1-6x; Fri, 13 Dec 2024 16:24:45 +0000
Received: by outflank-mailman (input) for mailman id 856794;
 Fri, 13 Dec 2024 16:24:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tM8T5-0000xX-NZ
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:24:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c187d92a-b96e-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 17:24:41 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 579D7210F3;
 Fri, 13 Dec 2024 16:24:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 076D5137CF;
 Fri, 13 Dec 2024 16:24:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7JlcAMlfXGfeSgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Dec 2024 16:24:41 +0000
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
X-Inumbo-ID: c187d92a-b96e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734107081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGgbqx71ndv5sBTrCP7+ufVgCN8ZAPJccnfCSLfUpqw=;
	b=eM6rf3u27YOalVv5txi5KAH1V1xP8mlB20hvM1oxCyDIN0kYx5pTxBrAule9uaED4jc39z
	aTRosPlMWFhLaZmZAfFrQRQhHu2OqEwPulNW345n2s4TTurBYyt1KzWU7B63IzoS316Aw4
	6orjGc+vx5dhO9pKzK9j6rKvmKw0Xtc=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734107081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGgbqx71ndv5sBTrCP7+ufVgCN8ZAPJccnfCSLfUpqw=;
	b=eM6rf3u27YOalVv5txi5KAH1V1xP8mlB20hvM1oxCyDIN0kYx5pTxBrAule9uaED4jc39z
	aTRosPlMWFhLaZmZAfFrQRQhHu2OqEwPulNW345n2s4TTurBYyt1KzWU7B63IzoS316Aw4
	6orjGc+vx5dhO9pKzK9j6rKvmKw0Xtc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v3 3/7] xen: add a domain unique id to each domain
Date: Fri, 13 Dec 2024 17:24:17 +0100
Message-ID: <20241213162421.16782-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213162421.16782-1-jgross@suse.com>
References: <20241213162421.16782-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

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
Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
V1:
- make unique_id local to function (Jan Beulich)
- add lock (Julien Grall)
- add comment (Julien Grall)
V2:
- move reading unique_id into locked section (Julien Grall)
- add comment (Alejandro Vallejo)
---
 xen/common/domain.c     | 27 +++++++++++++++++++++++++++
 xen/include/xen/sched.h |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 92263a4fbd..e33a0a5a21 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -562,6 +562,32 @@ static void _domain_destroy(struct domain *d)
     free_domain_struct(d);
 }
 
+static uint64_t get_unique_id(void)
+{
+    static uint64_t unique_id;
+    static DEFINE_SPINLOCK(lock);
+    uint64_t x;
+
+    spin_lock(&lock);
+
+    x = unique_id ? : NOW();
+
+    /*
+     * Pseudo-randomize id in order to avoid consumers relying on sequence.
+     * Randomization algorithm has a period of 2^64 - 1.
+     * Unique id is not repeatable between resets and each id has the same
+     * lifetime as the domain it is associated with.
+     */
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
@@ -654,6 +680,7 @@ struct domain *domain_create(domid_t domid,
 
     /* Sort out our idea of is_system_domain(). */
     d->domain_id = domid;
+    d->unique_id = get_unique_id();
 
     /* Holding CDF_* internal flags. */
     d->cdf = flags;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 76e39378b3..711668e028 100644
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


