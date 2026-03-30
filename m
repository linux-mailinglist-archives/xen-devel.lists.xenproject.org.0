Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMClAT6iymmx+gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 18:18:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C2235E9D6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 18:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267858.1557329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FJ9-0001Em-U7; Mon, 30 Mar 2026 16:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267858.1557329; Mon, 30 Mar 2026 16:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FJ9-0001Br-Qb; Mon, 30 Mar 2026 16:17:43 +0000
Received: by outflank-mailman (input) for mailman id 1267858;
 Mon, 30 Mar 2026 16:17:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edwin.torok@citrix.com>) id 1w7FJ7-0001Bc-NH
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:17:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7FJ6-00Ey33-L7
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 18:17:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edwin.torok@citrix.com>)
 id 69caa212-e002-0a2a0a5209dd-0a2a450cba5a-36
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:17:40 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <edwin.torok@citrix.com>)
 id 69caa223-f93d-0a2a450c0019-a0658308eab6-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:17:40 +0200
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 7358541B69BC;
 Mon, 30 Mar 2026 12:17:03 -0400 (EDT)
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
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1 0/5] run unit tests in the CI
Date: Mon, 30 Mar 2026 17:17:23 +0100
Message-ID: <cover.1774886602.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774887460-6D4B6734-EA63D5D6/0/0
X-purgate-type: clean
X-purgate-size: 1662
X-Spamd-Result: default: False [3.28 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:cardoe@cardoe.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.984];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,citrix.com:mid]
X-Rspamd-Queue-Id: E3C2235E9D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the unit tests aren't run in the CI during the build.
Introduce a 'make check' rule that can run them all (in parallel if `-j`
is specified).

To make reading the CI output easier make's `-O` flag is used (which
buffers output per target, making it obvious which command failed).

TBD: what is the actual minimum version of binutils required by the
existing tests, because Ubuntu 16.04 with binutil 2.26.1 failed.
That version of Ubuntu is EoL in a few days, so it is dropped from the CI build step.
The actual containers and the xilinx-arm64 jobs are kept for now
(although these should be updated to use bionic).

A followup patch series will rearrange the unit test make rules,
so it is useful to test that all the unit tests worked both prior and
following that change on all supported platforms in the CI.

For convenience this series is also available as a git repository:
https://gitlab.com/xen-project/people/edwintorok/xen/-/tree/private/edvint/run-ci?ref_type=heads

Edwin Török (5):
  README: update minimum make to 4.1
  CI: drop Ubuntu 16.04
  tools/test: introduce a 'make check' rule
  automation/scripts/build: run unit tests in the CI
  automation/scripts/build: group command output from parallel jobs

 Makefile                        |  4 ++++
 README                          |  2 +-
 automation/gitlab-ci/build.yaml | 10 ----------
 automation/scripts/build        | 10 ++++++----
 tools/Makefile                  |  4 ++++
 tools/Rules.mk                  |  2 +-
 tools/tests/Makefile            | 20 +++++++++++++++++++-
 7 files changed, 35 insertions(+), 17 deletions(-)

-- 
2.47.3


