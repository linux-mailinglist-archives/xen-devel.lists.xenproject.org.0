Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4593C88FD0A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 11:30:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698872.1091072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpn0y-0006qr-3u; Thu, 28 Mar 2024 10:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698872.1091072; Thu, 28 Mar 2024 10:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpn0y-0006nd-16; Thu, 28 Mar 2024 10:29:44 +0000
Received: by outflank-mailman (input) for mailman id 698872;
 Thu, 28 Mar 2024 10:29:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cj01=LC=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rpn0w-0006lq-RE
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 10:29:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1599ba3e-ecee-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 11:29:40 +0100 (CET)
Received: from beta.bugseng.com (unknown [176.206.12.122])
 by support.bugseng.com (Postfix) with ESMTPSA id A54C04EE0737;
 Thu, 28 Mar 2024 11:29:39 +0100 (CET)
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
X-Inumbo-ID: 1599ba3e-ecee-11ee-afe3-a90da7624cb6
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v3 0/2] xen: address violations of MISRA C Rule 17.1
Date: Thu, 28 Mar 2024 11:29:33 +0100
Message-Id: <cover.1711621080.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "The features of `<stdarg.h>' shall not be used".

The Xen community wants to avoid using variadic functions except for
specific circumstances where it feels appropriate by strict code review.

Functions hypercall_create_continuation and hypercall_xlat_continuation
are internal helpers made to break long running hypercalls into multiple
calls. They take a variable number of arguments depending on the original
hypercall they are trying to continue. Add SAF deviations for the aforementioned
functions.

Add deviation for printf()-like functions.

---
Changes in v3:
- use regexes to exempt all .*printk and .*printf functions, instead
  of manually listing them one by one;
- rebase: change SAF-3-safe in SAF-4-safe.
Changes in v2:
- replace "related to console output" with "printf()-like functions";
- replace "special hypercalls" with "internal helpers".

Simone Ballarin (2):
  MISRA C:2012 Rule 17.1 states: The features of `<stdarg.h>' shall not
    be used
  MISRA C Rule 20.7 states: "The features of `<stdarg.h>' shall not be
    used"

 automation/eclair_analysis/ECLAIR/deviations.ecl | 13 +++++++++++++
 docs/misra/deviations.rst                        |  5 +++++
 docs/misra/safe.json                             |  8 ++++++++
 xen/arch/arm/domain.c                            |  1 +
 xen/arch/x86/hypercall.c                         |  2 ++
 5 files changed, 29 insertions(+)

-- 
2.34.1


