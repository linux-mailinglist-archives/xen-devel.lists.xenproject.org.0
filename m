Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAUXIsaKGWoJxggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 14:47:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ED66026C1
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 14:47:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321934.1588360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwbE-00087u-Go; Fri, 29 May 2026 12:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321934.1588360; Fri, 29 May 2026 12:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwbE-00085p-Du; Fri, 29 May 2026 12:46:04 +0000
Received: by outflank-mailman (input) for mailman id 1321934;
 Fri, 29 May 2026 12:46:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wSwbD-00085h-KL
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 12:46:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSwbC-00B91t-Bm
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:46:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198a7b-5cb7-0a2a0a5109dd-0a2a4506aff6-44
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:46:02 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198a89-7371-0a2a45060019-a0658308925a-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:46:02 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 13F78439EC2B;
 Fri, 29 May 2026 08:44:56 -0400 (EDT)
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
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tim Deegan <tim@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/7] xen/mm: Normalize per-domain page counters, >16 TiB per domain
Date: Fri, 29 May 2026 13:43:54 +0100
Message-Id: <cover.1780058608.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780058762-85B6DD75-BD203A51/0/0
X-purgate-type: clean
X-purgate-size: 2730
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:mid,citrix.com:email,xen.org:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.980];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 18ED66026C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Summary of a comment by Jan Beulich motivating this submission:
> Considering that systems (and hence guests) only ever get larger, we
> should consider to normalize per-domain page counters to unsigned long.

This series enables supporting guests >16 TiB in the future
once the system support for machines >16 TiB is implemented.

1. xen/mm: Normalize common per-domain page counters to unsigned long
2. x86/mm: Normalize X86 per-domain page counters to unsigned long
3. xen/mm: Static memory: Widen assign_pages(nr) to unsigned long
4. xen/mm: Static memory: Widen domstatic plumbing to unsigned long
5. xen/mm: device-tree: Widen static page counts to unsigned long
6. xen/arch/x86/dom0_build.c: Extend the upper limit for Dom0's max_pages
7. tools/libs/stat/xenstat.c: Extend the "no maximum" sentinel for max_pages

This series is based on the NUMA claim sets v7 series:
https://lists.xen.org/archives/html/xen-devel/2026-05/msg00363.html

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Bernhard Kaindl (7):
  xen/mm: Normalize common per-domain page counters to unsigned long
  x86/mm: Normalize X86 per-domain page counters to unsigned long
  xen/mm: Static memory: Widen assign_pages(nr) to unsigned long
  xen/mm: Static memory: Widen domstatic plumbing to unsigned long
  xen/mm: device-tree: Widen static page counts to unsigned long
  xen/arch/x86/dom0_build.c: Extend the upper limit for Dom0's max_pages
  tools/libs/stat/xenstat.c: Extend the "no maximum" sentinel for
    max_pages

 tools/libs/stat/xenstat.c               |  2 +-
 xen/arch/arm/include/asm/p2m.h          |  2 +-
 xen/arch/x86/dom0_build.c               |  2 +-
 xen/arch/x86/include/asm/domain.h       |  6 ++--
 xen/arch/x86/include/asm/hap.h          |  4 +--
 xen/arch/x86/include/asm/paging.h       |  2 +-
 xen/arch/x86/include/asm/shadow.h       |  2 +-
 xen/arch/x86/mm/hap/hap.c               | 19 ++++++-----
 xen/arch/x86/mm/p2m-pod.c               |  2 +-
 xen/arch/x86/mm/paging.c                |  9 +++---
 xen/arch/x86/mm/shadow/common.c         | 42 ++++++++++++-------------
 xen/common/device-tree/dom0less-build.c |  2 +-
 xen/common/device-tree/static-memory.c  |  9 +-----
 xen/common/device-tree/static-shmem.c   |  9 +++---
 xen/common/grant_table.c                |  2 +-
 xen/common/keyhandler.c                 |  8 ++---
 xen/common/numa.c                       |  2 +-
 xen/common/page_alloc.c                 | 20 ++++++------
 xen/include/xen/mm.h                    |  4 +--
 xen/include/xen/sched.h                 | 16 +++++-----
 20 files changed, 77 insertions(+), 87 deletions(-)

-- 
2.39.5


