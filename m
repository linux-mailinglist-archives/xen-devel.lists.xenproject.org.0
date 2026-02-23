Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJwWHYconGm7AAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:14:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311D1174A80
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:14:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238753.1540275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxI-0002y2-9P; Mon, 23 Feb 2026 10:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238753.1540275; Mon, 23 Feb 2026 10:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxI-0002wX-6g; Mon, 23 Feb 2026 10:14:20 +0000
Received: by outflank-mailman (input) for mailman id 1238753;
 Mon, 23 Feb 2026 10:14:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwo=A3=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuSxH-0002wR-5s
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:14:19 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68a48beb-10a0-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 11:14:16 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id D543941202E0;
 Mon, 23 Feb 2026 05:13:56 -0500 (EST)
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
X-Inumbo-ID: 68a48beb-10a0-11f1-9ccf-f158ae23cfc8
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH 0/7] Factor out common build rules and helpers in tools/tests
Date: Mon, 23 Feb 2026 10:14:04 +0000
Message-ID: <cover.1771840831.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.14 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,gitlab.com:url]
X-Rspamd-Queue-Id: 311D1174A80
X-Rspamd-Action: no action

There are a lot of duplicate rules and code in tools/tests.
To simplify writing new tests move common build rules into a
`tools/tests/Rules.mk`, and helper macros/functions into `common/{tests,guests}.{c,h}`.

This also ensures that CFLAGS are applied consistently across all tests (e.g. one test failed
to build now due to an unused variable error).

Guest creation also needs to test for the presence of PV, HVM HAP or HVM shadow support
in Xen and create a guest accordingly. This can be shared.

After these changes the per-test Makefile only contains entries specific
to the test (its name, dependencies, etc.) and avoids having to
copy&paste boilerplate code.

`tools/tests/x86_emulator` remains unchanged, because the Makefile
contains a lot of conditional build logic specific to that test.

An upcoming patch series will introduce new tests using the simplified
Makefile and shared helpers.

For convenience this is also available at:
https://gitlab.com/xen-project/people/edwintorok/xen/-/compare/staging...private%2Fedvint%2Fmigration-tests2?from_project_id=2336572
https://gitlab.com/xen-project/people/edwintorok/xen/-/pipelines/2342318716

Edwin Török (7):
  tools/tests/*/Makefile: factor out common PHONY rules into Rules.mk
  tools/tests/vpci/main.c: drop unused variables
  tools/tests/*/Makefile: factor out build rules
  tools/tests: factor out common helpers
  tools/tests/common: ensure error messages have a newline
  tools/tests/tsx: move guest creation to common area
  tools/tests: print more debug info

 tools/tests/Rules.mk                          | 60 +++++++++++++
 tools/tests/common/guests.c                   | 89 +++++++++++++++++++
 tools/tests/common/guests.h                   | 11 +++
 tools/tests/common/tests.c                    | 15 ++++
 tools/tests/common/tests.h                    | 18 ++++
 tools/tests/cpu-policy/Makefile               | 41 ++-------
 tools/tests/cpu-policy/test-cpu-policy.c      |  7 +-
 tools/tests/domid/Makefile                    | 37 ++------
 tools/tests/domid/test-domid.c                | 11 +--
 tools/tests/mem-claim/Makefile                | 31 +------
 tools/tests/mem-claim/test-mem-claim.c        |  9 +-
 tools/tests/paging-mempool/Makefile           | 31 +------
 .../paging-mempool/test-paging-mempool.c      |  9 +-
 tools/tests/pdx/Makefile                      | 37 +-------
 tools/tests/pdx/test-pdx.c                    |  3 +-
 tools/tests/rangeset/Makefile                 | 36 +-------
 tools/tests/rangeset/test-rangeset.c          |  3 +-
 tools/tests/resource/Makefile                 | 35 +-------
 tools/tests/resource/test-resource.c          |  9 +-
 tools/tests/tsx/Makefile                      | 35 +-------
 tools/tests/tsx/test-tsx.c                    | 88 +++---------------
 tools/tests/vpci/.gitignore                   |  1 +
 tools/tests/vpci/Makefile                     | 36 ++------
 tools/tests/vpci/main.c                       |  6 +-
 tools/tests/xenstore/Makefile                 | 37 +-------
 tools/tests/xenstore/test-xenstore.c          |  4 +-
 26 files changed, 261 insertions(+), 438 deletions(-)
 create mode 100644 tools/tests/Rules.mk
 create mode 100644 tools/tests/common/guests.c
 create mode 100644 tools/tests/common/guests.h
 create mode 100644 tools/tests/common/tests.c
 create mode 100644 tools/tests/common/tests.h
 create mode 100644 tools/tests/vpci/.gitignore

-- 
2.47.3


