Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FFF7B9BE6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 10:46:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612884.953027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoJzT-0001pJ-Q8; Thu, 05 Oct 2023 08:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612884.953027; Thu, 05 Oct 2023 08:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoJzT-0001nd-NM; Thu, 05 Oct 2023 08:45:51 +0000
Received: by outflank-mailman (input) for mailman id 612884;
 Thu, 05 Oct 2023 08:45:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XA9v=FT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qoJzR-0001nQ-UX
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 08:45:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94798b20-635b-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 10:45:48 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C149D4EE0737;
 Thu,  5 Oct 2023 10:45:46 +0200 (CEST)
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
X-Inumbo-ID: 94798b20-635b-11ee-98d3-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 0/2] address violations of MISRA C:2012 Rule 11.9
Date: Thu,  5 Oct 2023 10:45:18 +0200
Message-Id: <cover.1696494834.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 11.9 forbids the usage of '0' as a null pointer constant, therefore uses of
this pattern have been amended. One exception, recorded in rules.rst, is in
__ACCESS_ONCE to do a scalar type check.

The series only touches common headers, therefore it should be safe to include
in the for-4.19 branch.

Nicola Vetrini (2):
  xen: introduce a deviation for Rule 11.9
  xen/spinlock: fix use of 0 as a null pointer constant

 .../eclair_analysis/ECLAIR/deviations.ecl     | 23 +++++++------------
 docs/misra/rules.rst                          |  3 ++-
 xen/include/xen/compiler.h                    |  5 +++-
 xen/include/xen/kernel.h                      |  2 +-
 xen/include/xen/spinlock.h                    |  2 +-
 5 files changed, 16 insertions(+), 19 deletions(-)

--
2.34.1

