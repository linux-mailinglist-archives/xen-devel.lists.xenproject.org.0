Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2084401A49
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 13:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179627.325995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCN8-00085U-BK; Mon, 06 Sep 2021 11:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179627.325995; Mon, 06 Sep 2021 11:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCN8-000829-8L; Mon, 06 Sep 2021 11:01:06 +0000
Received: by outflank-mailman (input) for mailman id 179627;
 Mon, 06 Sep 2021 11:01:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t7g0=N4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mNCN7-000823-0l
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 11:01:05 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b655369a-290f-481c-ae76-3e0f87498c2b;
 Mon, 06 Sep 2021 11:01:04 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D415220EA;
 Mon,  6 Sep 2021 11:01:03 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3298213942;
 Mon,  6 Sep 2021 11:01:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id gFtICu/0NWFbGQAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 06 Sep 2021 11:01:03 +0000
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
X-Inumbo-ID: b655369a-290f-481c-ae76-3e0f87498c2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630926063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BrS40Tf/KPD9CQCWVNVJ4t3+lx1YVOcmmtx8WpJDnlY=;
	b=bejh5fc5k+w1U6ChtsJEM6gYGML9shAdNIMcvQWDi+PEXtdSQJBOTjexaAnNTUqHjpiSNi
	VTRoOLFZWRlX8K7yRTmMpcpyPzKYfkpiFOQt4dNDzOGWujkiLaoTiIs//4sRYDI9LHd45i
	gzOgfWigAns23QVOD9Zgar5PfP5VXfk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen/sched: fix sched_move_domain() for domain without vcpus
Date: Mon,  6 Sep 2021 13:00:57 +0200
Message-Id: <20210906110057.15384-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case a domain is created with a cpupool other than Pool-0 specified
it will be moved to that cpupool before any vcpus are allocated.

This will lead to a NULL pointer dereference in sched_move_domain().

Fix that by tolerating vcpus not being allocated yet.

Fixes: 70fadc41635b9b6 ("xen/cpupool: support moving domain between cpupools with different granularity")
Reported-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8d178baf3d..79c9100680 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -671,6 +671,10 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
 
     for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
     {
+        /* Special case for move at domain creation time. */
+        if ( !d->vcpu[unit_idx * gran] )
+            break;
+
         unit = sched_alloc_unit_mem();
         if ( unit )
         {
-- 
2.26.2


