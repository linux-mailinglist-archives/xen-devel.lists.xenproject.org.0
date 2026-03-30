Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK6HFw3hymnEAwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 22:46:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16E73611D0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 22:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268102.1557482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7JUW-0003Yp-1b; Mon, 30 Mar 2026 20:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268102.1557482; Mon, 30 Mar 2026 20:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7JUV-0003Vu-UN; Mon, 30 Mar 2026 20:45:43 +0000
Received: by outflank-mailman (input) for mailman id 1268102;
 Mon, 30 Mar 2026 20:45:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edwin.torok@citrix.com>) id 1w7JUT-0003Vh-VC
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 20:45:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7JUS-000FMV-Dp
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 22:45:40 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edwin.torok@citrix.com>)
 id 69cae0b1-e002-0a2a0a5209dd-0a2a4509d484-34
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 22:45:40 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <edwin.torok@citrix.com>)
 id 69cae0f2-e484-0a2a45090019-a0658309e9ae-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 22:45:40 +0200
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 5559F816F799;
 Mon, 30 Mar 2026 16:44:52 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: marcus.granado@citrix.com,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v1 0/2] Functional and performance tests for migration
Date: Mon, 30 Mar 2026 21:45:30 +0100
Message-ID: <cover.1774903347.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1774903540-624AFA73-ED89A249/0/0
X-purgate-type: clean
X-purgate-size: 3290
X-Spamd-Result: default: False [3.28 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:marcus.granado@citrix.com,m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: F16E73611D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a test that can be run in Dom0, which constructs a minimal
guest, fills the memory with a deterministic pattern,
xc_domains_save/xc_domain_restore on 2 threads, and checks the pattern
at the end. On mismatch hexdumps of the portions that do not match are
printed.
Although the test is very simple it has already been very useful during
the development of 2 migration optimization patch sets (foreign copy and
migration compression, to be posted separately).

Of course the test is not a guarantee that migration works correctly,
there are lots of aspects that are not tested (interaction with device
emulators, more complicated memory layouts, the memory layout changing
during migration, etc.), but is a lot easier to debug when it goes wrong
than a real guest crashing (quite often even if you run 'memtest' in the
guest, it'll either crash while executing without printing where the mismatch
is -- if you corrupted the actual program, or continue undetected,
requiring many migration iterations to catch the bug).

It can also be used as a low-level performance test by specifying the
REPEAT environment variable.

Example usage from the tests/migration directory when working on
optimizations in libxenguest:
```
make -j$(nproc) -O -C ../../libs/guest && make -j$(nproc) -O && scp ../../libs/guest/libxenguest.so.4.22.0 ../../libs/guest/libxenguest.so.4.22 test-migration root@$HOST: && ssh root@$HOST env REPEAT=20 LD_LIBRARY_PATH=/root ./test-migration 2>/dev/null | grep 'Performance.*xc_domain_restore'
```
The output can be post-processed with `cut -f2 -d: |cut -f1 -ds`, and
then compared with `ministat` for example.

Currently this patchset depends on another that refactors the unit test
Makefiles. Once I've updated that patchset I'll send a rebased version
of this one.

Edwin Török (2):
  tools/tests/migration: introduce migration functional and performance
    tests
  tools/lib/call: cache up to 4 pages in hypercall bounce buffers

 tools/libs/call/buffer.c               |  28 +-
 tools/libs/call/core.c                 |   3 +-
 tools/libs/call/private.h              |   8 +-
 tools/tests/Makefile                   |   1 +
 tools/tests/common/guests.c            |   1 +
 tools/tests/migration/.gitignore       |   1 +
 tools/tests/migration/Makefile         |  70 +++
 tools/tests/migration/memory.c         |   6 +
 tools/tests/migration/memory.h         |  92 ++++
 tools/tests/migration/patterns.c       |  76 +++
 tools/tests/migration/patterns.h       |  22 +
 tools/tests/migration/test-migration.c | 713 +++++++++++++++++++++++++
 tools/tests/migration/xen_patterns.c   |  92 ++++
 tools/tests/migration/xen_patterns.h   |  14 +
 14 files changed, 1111 insertions(+), 16 deletions(-)
 create mode 100644 tools/tests/migration/.gitignore
 create mode 100644 tools/tests/migration/Makefile
 create mode 100644 tools/tests/migration/memory.c
 create mode 100644 tools/tests/migration/memory.h
 create mode 100644 tools/tests/migration/patterns.c
 create mode 100644 tools/tests/migration/patterns.h
 create mode 100644 tools/tests/migration/test-migration.c
 create mode 100644 tools/tests/migration/xen_patterns.c
 create mode 100644 tools/tests/migration/xen_patterns.h

-- 
2.47.3


