Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8ED7E39D9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 11:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628725.980486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JP6-0004X7-77; Tue, 07 Nov 2023 10:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628725.980486; Tue, 07 Nov 2023 10:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JP6-0004UU-3y; Tue, 07 Nov 2023 10:33:52 +0000
Received: by outflank-mailman (input) for mailman id 628725;
 Tue, 07 Nov 2023 10:33:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raD6=GU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0JP4-0004MO-M7
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 10:33:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23b98da4-7d59-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 11:33:50 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 077654EE0C81;
 Tue,  7 Nov 2023 11:33:47 +0100 (CET)
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
X-Inumbo-ID: 23b98da4-7d59-11ee-98da-6d05b1d4d9a1
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
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [RFC PATCH 0/4] address MISRA C:2012 Rule 15.2
Date: Tue,  7 Nov 2023 11:33:41 +0100
Message-Id: <cover.1699295113.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is aimed at presenting some strategies that can be used to deal with
violations of Rule 15.2:
"The goto statement shall jump to a label declared later in the same function".

The rule's rationale is about possible developer confusion, therefore it could
be argued that there is no substantial gain in complying with it, given the
torough review process in place.

Nonetheless, the proposed resolution strategies are the following:
- use a loop instead of a goto (see patch 1 and 3)
- make the jump due to the goto forward, rather than backward (see patch 2)
- unconditionally allow certain constructs, such as "goto retry", whose presence
  in the codebase typically signifies that all other reasonable approaches (e.g,
  loops, forward jumps) have been considered and deemed inferior in terms of
  code readability.
  
The latter strategy may be postponed until all goto-s with a certain label have
been examined. An alternative strategy could be to allow certain files
(most notably those under x86/x86_emulate) to have backward jumps, and resolve
the remaining violations.

Any feedback on this matter is welcome.

Nicola Vetrini (4):
  xen/vsprintf: replace backwards jump with loop
  x86/dom0: make goto jump forward
  xen/arm: GICv3: address MISRA C:2012 Rule 15.2
  automation/eclair: add deviation for certain backwards goto

 .../eclair_analysis/ECLAIR/deviations.ecl     | 10 +++
 docs/misra/deviations.rst                     | 10 +++
 xen/arch/arm/gic-v3-its.c                     | 81 ++++++++++---------
 xen/arch/x86/dom0_build.c                     | 14 ++--
 xen/common/vsprintf.c                         | 20 +++--
 5 files changed, 81 insertions(+), 54 deletions(-)

-- 
2.34.1

