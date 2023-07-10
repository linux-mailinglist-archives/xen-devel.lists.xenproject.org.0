Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F73F74CDC9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560944.877114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksE-0002kI-Fg; Mon, 10 Jul 2023 06:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560944.877114; Mon, 10 Jul 2023 06:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksE-0002hm-BX; Mon, 10 Jul 2023 06:59:54 +0000
Received: by outflank-mailman (input) for mailman id 560944;
 Mon, 10 Jul 2023 06:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIksC-0002bQ-Ip
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 06:59:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d4881e2-1eef-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 08:59:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4AE4E1F38D;
 Mon, 10 Jul 2023 06:59:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B5811361C;
 Mon, 10 Jul 2023 06:59:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PTQrBWasq2RZYgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 06:59:50 +0000
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
X-Inumbo-ID: 5d4881e2-1eef-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F4puyu1BswEV6Vw6vcv/7pys51yNvY/2hWRwamK9TBg=;
	b=ZW0LiOn712hAR3YKocaUBKvsk/ejYT0Jl2kcJDehsSDOWx9Wcqt5XrXp14g3sAS7yVxbu7
	w5RpdHQAhHzyhXXiSts9x5Slg9hwZLMr0WY8Ln6+YR/EITM/rBenronzdudvwYBfJUlltt
	sqRE3A6b3q4gJN2THAWy5t8ViV5Fa68=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 00/18] tools/xenstore: drop TDB
Date: Mon, 10 Jul 2023 08:59:29 +0200
Message-Id: <20230710065947.4201-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using TDB for storing the Xenstore nodes is adding more complexity
instead of removing it. With keeping the data in memory only, the main
reason for using TDB has disappeared.

This series is replacing TDB with a hashlist referencing directly
individually allocated Xenstore nodes.

This in turn allows to use references of the stored nodes instead of
copying them in case only read access is needed. Some simple tests
using the test-xenstore utility have shown no single test being slower
with this series applied, but some tests experienced up to 10% better
performance.

Changes in V2:
- addressed comments
- split former patch 9 into 2 patches
- added patches 13-18

Juergen Gross (18):
  tools/xenstore: explicitly specify create or modify for tdb_store()
  tools/xenstore: replace key in struct node with data base name
  tools/xenstore: let transaction_prepend() return the name for access
  tools/xenstore: rename do_tdb_delete() and change parameter type
  tools/xenstore: rename do_tdb_write() and change parameter type
  tools/xenstore: switch get_acc_data() to use name instead of key
  tools/xenstore: add wrapper for tdb_fetch()
  tools/xenstore: make hashtable key and value parameters const
  tools/xenstore: let hashtable_add() fail in case of existing entry
  tools/xenstore: add hashtable_replace() function
  tools/xenstore: drop use of tdb
  tools/xenstore: remove tdb code
  tools/xenstore: let db_delete() return void
  tools/xenstore: move copying of node data out of db_fetch()
  tools/xenstore: rework struct xs_tdb_record_hdr
  tools/xenstore: don't use struct node_perms in struct node
  tools/xenstore: use struct node_hdr in struct node
  tools/xenstore: add nocopy flag to node read functions

 tools/xenstore/Makefile.common         |    2 +-
 tools/xenstore/hashtable.c             |   60 +-
 tools/xenstore/hashtable.h             |   20 +-
 tools/xenstore/tdb.c                   | 1748 ------------------------
 tools/xenstore/tdb.h                   |  132 --
 tools/xenstore/utils.h                 |    9 -
 tools/xenstore/xenstored_core.c        |  498 ++++---
 tools/xenstore/xenstored_core.h        |   81 +-
 tools/xenstore/xenstored_domain.c      |   20 +-
 tools/xenstore/xenstored_transaction.c |   95 +-
 tools/xenstore/xenstored_transaction.h |    5 +-
 tools/xenstore/xenstored_watch.c       |   11 +-
 12 files changed, 427 insertions(+), 2254 deletions(-)
 delete mode 100644 tools/xenstore/tdb.c
 delete mode 100644 tools/xenstore/tdb.h

-- 
2.35.3


