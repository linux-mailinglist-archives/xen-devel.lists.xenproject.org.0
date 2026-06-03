Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6g5pKM1EIGpuzgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:14:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA5B639015
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:14:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=citrix.com (policy=reject)
Received: from list by lists.xenproject.org with outflank-mailman.1326793.1592129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnIK-0000F7-2E; Wed, 03 Jun 2026 15:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326793.1592129; Wed, 03 Jun 2026 15:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnIJ-0000C8-TX; Wed, 03 Jun 2026 15:14:11 +0000
Received: by outflank-mailman (input) for mailman id 1326793;
 Wed, 03 Jun 2026 15:14:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUnII-0000C2-46
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:14:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUnIH-007eE2-DG
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:14:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2044be-bab6-0a2a0a5309dd-0a2a4506d0d8-2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:14:09 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2044c0-7371-0a2a45060019-a0658308a554-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:14:09 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 03B2B43469ED;
 Wed,  3 Jun 2026 11:13:00 -0400 (EDT)
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
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] xen/mm: Reset PFN_ORDER for offlined buddy heads
Date: Wed,  3 Jun 2026 16:11:42 +0100
Message-Id: <cover.1780499500.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780499649-7FB7DD75-BF5CEB94/0/0
X-purgate-type: clean
X-purgate-size: 1065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,gitlab.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BA5B639015

This series fixes an inconsistency in the PFN_ORDER annotation for
pages that are offlined when they are the head of a free buddy.

When reserve_offlined_page() splits a buddy and moves offlined
sub-pages to the offlined lists, the former buddy head would be
left annotated with its original order even though it is now a
single page. While this does not cause functional regressions,
it is misleading.

You can pull this series with the regression test environment to run it:
$ git pull git@gitlab.com:bernhardkaindl/xen.git offline-head-order-v2
$ make -C tools/tests/native TARGETS=offline-head-order test

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Bernhard Kaindl (2):
  xen/mm: reset PFN_ORDER for offlined buddy heads
  tools/tests/native: Add test for offlined buddy head PFN_ORDER

 tools/tests/native/offline-head-order.c | 74 +++++++++++++++++++++++++
 xen/common/page_alloc.c                 |  6 ++
 2 files changed, 80 insertions(+)
 create mode 100644 tools/tests/native/offline-head-order.c

-- 
2.39.5


