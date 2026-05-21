Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HcGE28uD2r+HQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 18:10:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D875A8F1C
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 18:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315481.1585295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5y3-0003dR-MW; Thu, 21 May 2026 16:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315481.1585295; Thu, 21 May 2026 16:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5y3-0003c0-Je; Thu, 21 May 2026 16:09:51 +0000
Received: by outflank-mailman (input) for mailman id 1315481;
 Thu, 21 May 2026 16:09:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wQ5y3-0003bu-0c
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 16:09:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5y1-003iDW-Ny
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 18:09:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a0f2e3f-e002-0a2a0a5209dd-0a2a45089fd8-26
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:09:49 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a0f2e4c-63b5-0a2a45080019-a0658309dab6-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:09:49 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 7549A8242082;
 Thu, 21 May 2026 12:08:37 -0400 (EDT)
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
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 0/2] tools/tests/native: Native test environment for NUMA claim sets
Date: Thu, 21 May 2026 17:08:06 +0100
Message-Id: <cover.1779379609.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1779379789-BD96DDB1-79916713/0/0
X-purgate-type: clean
X-purgate-size: 4199
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,xen.org:url,gitlab.com:email]
X-Rspamd-Queue-Id: E5D875A8F1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear reviewers,

This patch series introduces a native test environment for Xen,
currently focused on the hypercall API and exercising the page
allocator APIs in native test programs. The available APIs are:

- The DOMCTL APIs in xc_domain.c, e.g. xc_domain_claim_memory().
- The XENMEM APIs in xc_domain.c, e.g. xc_domain_claim_pages().
- The SYSCTL APIs in xc_domain.c, e.g. xc_availheap().

Where needed, test cases can call Xen functions directly, and
can check the heap state e.g. to check consistency. Any issues
can be investigated directly without rebooting a Xen instance.

The second patch adds regression tests for the NUMA claim sets
v7 series, so this series depends on it.
Please help to review/ack it. It should be eligible for Xen 4.22:

[PATCH v7 0/7] xen/mm: Introduce NUMA-aware claim sets for domains
https://lists.xen.org/archives/html/xen-devel/2026-05/msg00363.html
https://patchwork.kernel.org/project/xen-devel/list/?series=1091810

For local review and test, you can pull and the claims-v7 code and the tests:

$ git pull git@gitlab.com:bernhardkaindl/xen.git claims-native-tests-v3
$ make -C tools/tests/native test cross=y # see tools/tests/native/README.rst

Thanks,
Bernhard Kaindl

Changes since v2:
- Replaced shims that mimicked sched.h and mm.h with the real Xen headers
- Updated and extended the tests for the NUMA claims v7 series
- Changed test calls to use DOMCTL, XENMEM and SYSCTL APIs in xc_domain.c

Bernhard Kaindl (2):
  tests/native: Add native Xen test environment
  tests/native: Add native tests for NUMA claim sets

 tools/tests/Makefile                          |   1 +
 tools/tests/native/.gitignore                 |   4 +
 tools/tests/native/Makefile                   | 206 +++++++++++
 tools/tests/native/README.rst                 | 166 +++++++++
 tools/tests/native/harness/common.h           | 280 +++++++++++++++
 tools/tests/native/harness/domctl-shim.h      | 228 ++++++++++++
 tools/tests/native/harness/domctl-wrapper.h   |  28 ++
 tools/tests/native/harness/memory-shim.h      | 201 +++++++++++
 tools/tests/native/harness/memory-wrapper.h   |  42 +++
 tools/tests/native/harness/mm-wrapper.h       | 118 +++++++
 tools/tests/native/harness/native.h           |  81 +++++
 tools/tests/native/harness/page-alloc-env.h   | 254 ++++++++++++++
 tools/tests/native/harness/page-alloc-shim.h  | 328 ++++++++++++++++++
 tools/tests/native/harness/sysctl-shim.h      | 155 +++++++++
 tools/tests/native/harness/sysctl-wrapper.h   |  38 ++
 tools/tests/native/harness/testcase-asserts.h | 310 +++++++++++++++++
 tools/tests/native/harness/xc-domain-env.h    |  77 ++++
 tools/tests/native/harness/xen-macros.h       | 118 +++++++
 tools/tests/native/harness/xenctrl-shim.h     | 170 +++++++++
 tools/tests/native/host-claims.c              | 248 +++++++++++++
 tools/tests/native/node-claims.c              | 230 ++++++++++++
 21 files changed, 3283 insertions(+)
 create mode 100644 tools/tests/native/.gitignore
 create mode 100644 tools/tests/native/Makefile
 create mode 100644 tools/tests/native/README.rst
 create mode 100644 tools/tests/native/harness/common.h
 create mode 100644 tools/tests/native/harness/domctl-shim.h
 create mode 100644 tools/tests/native/harness/domctl-wrapper.h
 create mode 100644 tools/tests/native/harness/memory-shim.h
 create mode 100644 tools/tests/native/harness/memory-wrapper.h
 create mode 100644 tools/tests/native/harness/mm-wrapper.h
 create mode 100644 tools/tests/native/harness/native.h
 create mode 100644 tools/tests/native/harness/page-alloc-env.h
 create mode 100644 tools/tests/native/harness/page-alloc-shim.h
 create mode 100644 tools/tests/native/harness/sysctl-shim.h
 create mode 100644 tools/tests/native/harness/sysctl-wrapper.h
 create mode 100644 tools/tests/native/harness/testcase-asserts.h
 create mode 100644 tools/tests/native/harness/xc-domain-env.h
 create mode 100644 tools/tests/native/harness/xen-macros.h
 create mode 100644 tools/tests/native/harness/xenctrl-shim.h
 create mode 100644 tools/tests/native/host-claims.c
 create mode 100644 tools/tests/native/node-claims.c

-- 
2.39.5


