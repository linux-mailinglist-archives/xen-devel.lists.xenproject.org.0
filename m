Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA637423B9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 12:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556719.869444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoYB-0000ZT-BI; Thu, 29 Jun 2023 10:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556719.869444; Thu, 29 Jun 2023 10:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoYB-0000WQ-8P; Thu, 29 Jun 2023 10:06:55 +0000
Received: by outflank-mailman (input) for mailman id 556719;
 Thu, 29 Jun 2023 10:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHn5=CR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qEoYA-0000WK-D8
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 10:06:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aafe1878-1664-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 12:06:51 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.43.188.44])
 by support.bugseng.com (Postfix) with ESMTPSA id 246A34EE0738;
 Thu, 29 Jun 2023 12:06:47 +0200 (CEST)
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
X-Inumbo-ID: aafe1878-1664-11ee-8611-37d641c3527e
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
	bertrand.marquis@arm.com,
	julien@xen.org,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 0/3] fix violations of MISRA C:2012 Rule 3.1
Date: Thu, 29 Jun 2023 12:06:14 +0200
Message-Id: <cover.1688032865.git.nicola.vetrini@bugseng.com>
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
2. replacing the nested '//' character sequence with ARM asm comments
   or similar constructs that do not violate the rule.

Thanks,
  Nicola

Nicola Vetrini (3):
  xen/arch/arm: fix violations of MISRA C:2012 Rule 3.1
  xen/drivers/passthrough/arm/smmu-v3.c: fix violations of MISRA C:2012
    Rule 3.1
  xen: fix violations of MISRA C:2012 Rule 3.1

 xen/arch/arm/include/asm/arm32/flushtlb.h | 8 ++++----
 xen/arch/arm/include/asm/arm64/flushtlb.h | 8 ++++----
 xen/common/xmalloc_tlsf.c                 | 4 +---
 xen/drivers/passthrough/arm/smmu-v3.c     | 8 ++++----
 xen/include/xen/atomic.h                  | 2 +-
 5 files changed, 14 insertions(+), 16 deletions(-)

--
2.34.1

