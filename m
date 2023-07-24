Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977DE75F42C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568729.888555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtL4-00007e-W3; Mon, 24 Jul 2023 11:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568729.888555; Mon, 24 Jul 2023 11:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtL4-0008WI-T2; Mon, 24 Jul 2023 11:02:54 +0000
Received: by outflank-mailman (input) for mailman id 568729;
 Mon, 24 Jul 2023 11:02:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNtL2-0008WC-SC
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:02:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a159d94d-2a11-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 13:02:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F37121DA7;
 Mon, 24 Jul 2023 11:02:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1024613476;
 Mon, 24 Jul 2023 11:02:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7AeMAlpavmQeYQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 11:02:50 +0000
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
X-Inumbo-ID: a159d94d-2a11-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690196570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b9V8o+B4aeJYQ21EL9z8akw9Yu04m1vUAdm9BqqxkCo=;
	b=KrI+X1BosWkp+ferVgcLgilAM2QTMlvOtmCgLc/NSjlaSSOzo8oLVWedxMO97q9YrSGb9y
	qe5cpV6oA2w72RYGQvQZ70QVjqZmrK7eX0ORTixT46KyZprWr9s1qRSuQA5AUtr6DMXvhF
	uA63H9rLat/IwPdXnCTjDh6IRH+jHD8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 00/25] tools/xenstore: drop TDB
Date: Mon, 24 Jul 2023 13:02:22 +0200
Message-Id: <20230724110247.10520-1-jgross@suse.com>
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

Note that this series is based on top of [1].

Changes in V3:
- addressed comments
- add patches 14+15
- replace patch 18 of v2 with patches 20-25

Changes in V2:
- addressed comments
- split former patch 9 into 2 patches
- added patches 13-18

[1]: https://lists.xen.org/archives/html/xen-devel/2023-07/threads.html#01625

Juergen Gross (25):
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
  tools/xenstore: change talloc_free() to take a const pointer
  tools/xenstore: make data parameter of db_write() const
  tools/xenstore: move copying of node data out of db_fetch()
  tools/xenstore: rework struct xs_tdb_record_hdr
  tools/xenstore: don't use struct node_perms in struct node
  tools/xenstore: use struct node_hdr in struct node
  tools/xenstore: alloc new memory in domain_adjust_node_perms()
  tools/xenstore: introduce read_node_nocopy()
  tools/xenstore: merge get_spec_node() into get_node_canonicalized()
  tools/xenstore: merge is_valid_nodename() into canonicalize()
  tools/xenstore: rework get_node()
  tools/xenstore: introduce get_node_const()

 tools/xenstore/Makefile.common         |    2 +-
 tools/xenstore/hashtable.c             |   62 +-
 tools/xenstore/hashtable.h             |   20 +-
 tools/xenstore/talloc.c                |    8 +-
 tools/xenstore/talloc.h                |    4 +-
 tools/xenstore/tdb.c                   | 1748 ------------------------
 tools/xenstore/tdb.h                   |  132 --
 tools/xenstore/utils.h                 |    9 -
 tools/xenstore/xenstored_core.c        |  704 +++++-----
 tools/xenstore/xenstored_core.h        |   86 +-
 tools/xenstore/xenstored_domain.c      |   33 +-
 tools/xenstore/xenstored_transaction.c |  110 +-
 tools/xenstore/xenstored_transaction.h |    5 +-
 tools/xenstore/xenstored_watch.c       |   42 +-
 tools/xenstore/xenstored_watch.h       |    3 +-
 15 files changed, 591 insertions(+), 2377 deletions(-)
 delete mode 100644 tools/xenstore/tdb.c
 delete mode 100644 tools/xenstore/tdb.h

-- 
2.35.3


