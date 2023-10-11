Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F07D7C5449
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 14:47:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615478.956720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYc3-0005rB-MS; Wed, 11 Oct 2023 12:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615478.956720; Wed, 11 Oct 2023 12:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYc3-0005p6-JJ; Wed, 11 Oct 2023 12:46:55 +0000
Received: by outflank-mailman (input) for mailman id 615478;
 Wed, 11 Oct 2023 12:46:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJaT=FZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqYc2-0005p0-Ao
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 12:46:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40499a5c-6834-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 14:46:52 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id F22C64EE0744;
 Wed, 11 Oct 2023 14:46:49 +0200 (CEST)
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
X-Inumbo-ID: 40499a5c-6834-11ee-9b0d-b553b5be7939
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
Subject: [XEN PATCH][for-4.19 v2 0/1] address violations of MISRA C:2012 Rule 11.9
Date: Wed, 11 Oct 2023 14:46:45 +0200
Message-Id: <cover.1696948320.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 11.9 forbids the usage of '0' as a null pointer constant, therefore uses of
this pattern have been amended. One exception, recorded in deviations.rst, is in
__ACCESS_ONCE to do a scalar type check.

Changes in v2:
- dropped patch 2, as it has already been committed to [1]
- rebased against [2] to insert the deviation record in the newly created
  deviations.rst

[1] https://gitlab.com/xen-project/people/andyhhp/xen/-/commits/for-next
[2] https://marc.info/?l=xen-devel&m=169686613720371&w=2

Nicola Vetrini (1):
  xen: introduce a deviation for Rule 11.9

 automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
 docs/misra/deviations.rst                        | 5 +++++
 xen/include/xen/compiler.h                       | 5 ++++-
 xen/include/xen/kernel.h                         | 2 +-
 4 files changed, 19 insertions(+), 2 deletions(-)

--
2.34.1

