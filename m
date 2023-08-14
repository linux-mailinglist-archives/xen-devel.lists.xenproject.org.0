Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E0177B2E1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583308.913450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIE-0001s1-9Z; Mon, 14 Aug 2023 07:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583308.913450; Mon, 14 Aug 2023 07:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIE-0001op-5z; Mon, 14 Aug 2023 07:47:14 +0000
Received: by outflank-mailman (input) for mailman id 583308;
 Mon, 14 Aug 2023 07:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVSIC-0001Z5-Vc
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:47:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6822fa9-3a76-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:47:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 45FFB21985;
 Mon, 14 Aug 2023 07:47:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED650138EE;
 Mon, 14 Aug 2023 07:47:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Kt2FOP3b2WSbQQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 07:47:09 +0000
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
X-Inumbo-ID: c6822fa9-3a76-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691999230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3RsN8HoNcUzlEfb0weiWS8CSZC021emYD0YUNvn1dus=;
	b=QWHgKOBH7lOLmMIS/QlK7i61UJ53fL097cMFG5UMIDW8D+Mw3P5ApJdq0NIhX9qa4rWrUt
	x3cpthDzoNfrft2R3qZJNVJsVGmXDUd0jJGAxkwOwFS6mKHo1TRkdICxZD9JoknVBQ14fm
	qzk0w6sPOCcs02TdfRqwFht3T/Rh7K8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v4 00/19] tools/xenstore: drop TDB
Date: Mon, 14 Aug 2023 09:46:48 +0200
Message-Id: <20230814074707.27696-1-jgross@suse.com>
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

Changes in V4:
- addressed comments
- patches 1-7 already applied
- dropped patch 15 of v3
- add patches 18+19

Changes in V3:
- addressed comments
- add patches 14+15
- replace patch 18 of v2 with patches 20-25

Changes in V2:
- addressed comments
- split former patch 9 into 2 patches
- added patches 13-18

Juergen Gross (19):
  tools/xenstore: make hashtable key parameter const
  tools/xenstore: let hashtable_add() fail in case of existing entry
  tools/xenstore: add hashtable_replace() function
  tools/xenstore: drop use of tdb
  tools/xenstore: remove tdb code
  tools/xenstore: let db_delete() return void
  tools/xenstore: change talloc_free() to take a const pointer
  tools/xenstore: move copying of node data out of db_fetch()
  tools/xenstore: rework struct xs_tdb_record_hdr
  tools/xenstore: don't use struct node_perms in struct node
  tools/xenstore: use struct node_hdr in struct node
  tools/xenstore: alloc new memory in domain_adjust_node_perms()
  tools/xenstore: introduce read_node_const()
  tools/xenstore: merge get_spec_node() into get_node_canonicalized()
  tools/xenstore: merge is_valid_nodename() into canonicalize()
  tools/xenstore: rework get_node()
  tools/xenstore: introduce get_node_const()
  tools/config: add XEN_RUN_STORED to config.h
  tools/xenstore: move xenstored sources into dedicated directory

 .gitignore                                    |    2 +-
 MAINTAINERS                                   |    1 +
 configure                                     |    5 +
 m4/paths.m4                                   |    1 +
 stubdom/Makefile                              |    4 +-
 tools/Makefile                                |    1 +
 tools/config.h.in                             |    3 +
 tools/configure                               |    5 +
 tools/libs/store/Makefile                     |    1 -
 tools/xenstore/Makefile                       |   30 +-
 tools/xenstore/Makefile.common                |   31 -
 tools/xenstore/tdb.c                          | 1748 -----------------
 tools/xenstore/tdb.h                          |  132 --
 tools/xenstored/Makefile                      |   48 +
 tools/xenstored/Makefile.common               |   29 +
 tools/{xenstore => xenstored}/README          |    0
 .../control.c}                                |    8 +-
 .../control.h}                                |    0
 .../xenstored_core.c => xenstored/core.c}     |  643 +++---
 .../xenstored_core.h => xenstored/core.h}     |   77 +-
 .../xenstored_domain.c => xenstored/domain.c} |   44 +-
 .../xenstored_domain.h => xenstored/domain.h} |    8 +-
 tools/{xenstore => xenstored}/hashtable.c     |   60 +-
 tools/{xenstore => xenstored}/hashtable.h     |   24 +-
 tools/{xenstore => xenstored}/list.h          |    0
 .../xenstored_lu.c => xenstored/lu.c}         |    8 +-
 .../xenstored_lu.h => xenstored/lu.h}         |    0
 .../lu_daemon.c}                              |    4 +-
 .../lu_minios.c}                              |    2 +-
 .../xenstored_minios.c => xenstored/minios.c} |    2 +-
 .../xenstored_osdep.h => xenstored/osdep.h}   |    0
 .../xenstored_posix.c => xenstored/posix.c}   |    4 +-
 tools/{xenstore => xenstored}/talloc.c        |   10 +-
 tools/{xenstore => xenstored}/talloc.h        |    4 +-
 .../{xenstore => xenstored}/talloc_guide.txt  |    0
 .../transaction.c}                            |   57 +-
 .../transaction.h}                            |    2 +-
 tools/{xenstore => xenstored}/utils.c         |    0
 tools/{xenstore => xenstored}/utils.h         |    9 -
 .../xenstored_watch.c => xenstored/watch.c}   |   45 +-
 .../xenstored_watch.h => xenstored/watch.h}   |    5 +-
 .../include => xenstored}/xenstore_state.h    |    0
 42 files changed, 666 insertions(+), 2391 deletions(-)
 delete mode 100644 tools/xenstore/Makefile.common
 delete mode 100644 tools/xenstore/tdb.c
 delete mode 100644 tools/xenstore/tdb.h
 create mode 100644 tools/xenstored/Makefile
 create mode 100644 tools/xenstored/Makefile.common
 rename tools/{xenstore => xenstored}/README (100%)
 rename tools/{xenstore/xenstored_control.c => xenstored/control.c} (98%)
 rename tools/{xenstore/xenstored_control.h => xenstored/control.h} (100%)
 rename tools/{xenstore/xenstored_core.c => xenstored/core.c} (88%)
 rename tools/{xenstore/xenstored_core.h => xenstored/core.h} (88%)
 rename tools/{xenstore/xenstored_domain.c => xenstored/domain.c} (98%)
 rename tools/{xenstore/xenstored_domain.h => xenstored/domain.h} (95%)
 rename tools/{xenstore => xenstored}/hashtable.c (89%)
 rename tools/{xenstore => xenstored}/hashtable.h (89%)
 rename tools/{xenstore => xenstored}/list.h (100%)
 rename tools/{xenstore/xenstored_lu.c => xenstored/lu.c} (98%)
 rename tools/{xenstore/xenstored_lu.h => xenstored/lu.h} (100%)
 rename tools/{xenstore/xenstored_lu_daemon.c => xenstored/lu_daemon.c} (97%)
 rename tools/{xenstore/xenstored_lu_minios.c => xenstored/lu_minios.c} (98%)
 rename tools/{xenstore/xenstored_minios.c => xenstored/minios.c} (97%)
 rename tools/{xenstore/xenstored_osdep.h => xenstored/osdep.h} (100%)
 rename tools/{xenstore/xenstored_posix.c => xenstored/posix.c} (98%)
 rename tools/{xenstore => xenstored}/talloc.c (99%)
 rename tools/{xenstore => xenstored}/talloc.h (98%)
 rename tools/{xenstore => xenstored}/talloc_guide.txt (100%)
 rename tools/{xenstore/xenstored_transaction.c => xenstored/transaction.c} (93%)
 rename tools/{xenstore/xenstored_transaction.h => xenstored/transaction.h} (98%)
 rename tools/{xenstore => xenstored}/utils.c (100%)
 rename tools/{xenstore => xenstored}/utils.h (89%)
 rename tools/{xenstore/xenstored_watch.c => xenstored/watch.c} (90%)
 rename tools/{xenstore/xenstored_watch.h => xenstored/watch.h} (93%)
 rename tools/{xenstore/include => xenstored}/xenstore_state.h (100%)

-- 
2.35.3


