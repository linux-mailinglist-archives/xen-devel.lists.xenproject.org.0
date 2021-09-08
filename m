Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B85403A4D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 15:05:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181983.329377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxFt-0004aQ-3E; Wed, 08 Sep 2021 13:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181983.329377; Wed, 08 Sep 2021 13:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxFs-0004Y5-Vz; Wed, 08 Sep 2021 13:04:44 +0000
Received: by outflank-mailman (input) for mailman id 181983;
 Wed, 08 Sep 2021 13:04:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTps=N6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mNxFr-0004Xt-Sv
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 13:04:43 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c989046-50a8-4166-8785-446a842621e3;
 Wed, 08 Sep 2021 13:04:43 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2982B2218A;
 Wed,  8 Sep 2021 13:04:42 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EAF4E13A8B;
 Wed,  8 Sep 2021 13:04:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id NiHqN+m0OGG4HwAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 08 Sep 2021 13:04:41 +0000
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
X-Inumbo-ID: 0c989046-50a8-4166-8785-446a842621e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631106282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fASvCnULJeUIRs9+t4Wk0OtjCFkWaouH82TpoiiwbKE=;
	b=I/u0pmQjYKnoOStNBLNJaroYMBAMzjdeULBS1z3Yzb+oU7l/hu30+gaGjCCizTj1wIjshq
	6B7n7my7lDK1zSUXA6q4VqWE6579/zWMud9i3DTMcaFvFjx5s9rWTeij6U6FC3ghnByDGT
	TBaWSlb3DD9GoMCEyedi7x6tJZKELSA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2] xen/sched: fix sched_move_domain() for domain without vcpus
Date: Wed,  8 Sep 2021 15:04:40 +0200
Message-Id: <20210908130440.24605-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case a domain is created with a cpupool other than Pool-0 specified
it will be moved to that cpupool before any vcpus are allocated.

This will lead to a NULL pointer dereference in sched_move_domain().

Fix that by tolerating vcpus not being allocated yet.

Fixes: 70fadc41635b9b6 ("xen/cpupool: support moving domain between cpupools with different granularity")
Reported-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- Only test for vcpu[0] not being present (Jan Beulich)
---
 xen/common/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8d178baf3d..8f4b1ca10d 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -651,7 +651,7 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
     struct scheduler *old_ops = dom_scheduler(d);
     void *old_domdata;
     unsigned int gran = cpupool_get_granularity(c);
-    unsigned int n_units = DIV_ROUND_UP(d->max_vcpus, gran);
+    unsigned int n_units = d->vcpu[0] ? DIV_ROUND_UP(d->max_vcpus, gran) : 0;
     int ret = 0;
 
     for_each_vcpu ( d, v )
-- 
2.26.2


