Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26677934D84
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 14:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760472.1170324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQdA-0005wy-RW; Thu, 18 Jul 2024 12:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760472.1170324; Thu, 18 Jul 2024 12:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQdA-0005v2-NP; Thu, 18 Jul 2024 12:53:08 +0000
Received: by outflank-mailman (input) for mailman id 760472;
 Thu, 18 Jul 2024 12:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TiGH=OS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sUQd9-0005uw-G9
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 12:53:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc0c68b-4504-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 14:53:05 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 536541F399;
 Thu, 18 Jul 2024 12:53:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13B0B136F7;
 Thu, 18 Jul 2024 12:53:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XPBeAy8QmWYVeQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 18 Jul 2024 12:53:03 +0000
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
X-Inumbo-ID: acc0c68b-4504-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721307184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AdT5XI7daN7y0jcY4YymDW2f9yIOYl50ejWQ2o+Dr7M=;
	b=P10sI0a0W6vGu8A3hp9Sheg8whyOHHJ1KTjvLiV3tTNqWv2bcrkBqxliEG4pC9R2lIClqK
	yv5mVB5dheeKiTqUkMlx4lKuWarQPenU9/sCL5C/CX/QbkEzLWQxaAbu2pUOjL4MjUnb4a
	yBD0I9JizvVfgxRWTV0VUCCbYvJQqPo=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=gqJGIM1d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721307183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AdT5XI7daN7y0jcY4YymDW2f9yIOYl50ejWQ2o+Dr7M=;
	b=gqJGIM1dcxMuvO1dL9jE06ULkedA15AbgQt0skiVioPoy4rJYPaQcQgzVDWFjb7Z49mb1K
	BWGWO4MLQKenQMYgtCDM5HfEq1s6cnINumEuFAFp3xqqRWyj+cE0lIDMmgktsZGyWbqwTL
	kPRxJqHtIOH27ENvobX9tBkYvjLUHjQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: drop CPU POOLS section
Date: Thu, 18 Jul 2024 14:52:51 +0200
Message-ID: <20240718125251.27163-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 536541F399
X-Spam-Flag: NO
X-Spam-Score: 0.99
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.99 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Level: 
X-Spamd-Bar: /

The CPU POOLS sections in MAINTAINERS can be dropped, as the SCHEDULING
section has the same maintainers and it is covering the CPU POOLS files
as well.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b0c894527..37aacba2f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -284,12 +284,6 @@ S:	Supported
 F:	.gitlab-ci.yml
 F:	automation/
 
-CPU POOLS
-M:	Juergen Gross <jgross@suse.com>
-M:	Dario Faggioli <dfaggioli@suse.com>
-S:	Supported
-F:	xen/common/sched/*cpupool.c
-
 DEVICE TREE
 M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Julien Grall <julien@xen.org>
-- 
2.43.0


