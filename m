Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73979735107
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 11:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550919.860143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBcf-0006X4-Mp; Mon, 19 Jun 2023 09:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550919.860143; Mon, 19 Jun 2023 09:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBcf-0006Ub-JL; Mon, 19 Jun 2023 09:56:33 +0000
Received: by outflank-mailman (input) for mailman id 550919;
 Mon, 19 Jun 2023 09:56:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BTp=CH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qBBce-0006UR-6d
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 09:56:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90673fba-0e87-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 11:56:30 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.44.138.43])
 by support.bugseng.com (Postfix) with ESMTPSA id 9AC0C4EE0741;
 Mon, 19 Jun 2023 11:56:26 +0200 (CEST)
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
X-Inumbo-ID: 90673fba-0e87-11ee-b234-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 0/3] fix violations of MISRA C:2012 Rule 3.1
Date: Mon, 19 Jun 2023 11:56:10 +0200
Message-Id: <cover.1687167502.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series is about the violations present in the Xen sources of
Rule 3.1 from MISRA C:2012, whose headline states:
"The character sequences '/*' and '//' shall not be used within a comment".

In the context of the effort to bring xen into compliance w.r.t.
MISRA C:2012, and Rule 3.1 being already approved for the project (as
evidenced by `docs/misra/rules.rst'), these violations need to be fixed.

Most of the violations are due to the presence of links to webpages within
C-style comment blocks, such as:

xen/arch/arm/include/asm/smccc.h:37.1-41.3
/*
 * This file provides common defines for ARM SMC Calling Convention as
 * specified in
 * http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
*/

In this case, I propose to deviate all of these occurrences with a
project deviation to be captured by a tool configuration
(not included in any patch from this series).

There are, however, a few other violations that do not fall under this
category, which are the focus of the following set of patches. They either:

1. remove the nested '//' character sequence within a block comment;
2. remove the surrounding comment.

Thanks,
  Nicola

Nicola Vetrini (3):
  xen/arch/arm: fix violations of MISRA C:2012 Rule 3.1
  xen/drivers/passthrough/arm/smmu-v3.c: fix violations of MISRA C:2012
    Rule 3.1
  xen: fix violations of MISRA C:2012 Rule 3.1

 xen/arch/arm/include/asm/arm32/flushtlb.h | 8 ++++----
 xen/arch/arm/include/asm/arm64/flushtlb.h | 8 ++++----
 xen/common/xmalloc_tlsf.c                 | 3 ---
 xen/drivers/passthrough/arm/smmu-v3.c     | 4 ++--
 xen/include/xen/atomic.h                  | 2 +-
 5 files changed, 11 insertions(+), 14 deletions(-)

-- 
2.34.1


