Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0BA88686F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 09:47:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696713.1087849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnaYQ-000895-Ld; Fri, 22 Mar 2024 08:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696713.1087849; Fri, 22 Mar 2024 08:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnaYQ-00086y-J3; Fri, 22 Mar 2024 08:47:10 +0000
Received: by outflank-mailman (input) for mailman id 696713;
 Fri, 22 Mar 2024 08:47:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3jC2=K4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rnaYP-00086n-3u
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 08:47:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4183ac8-e828-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 09:47:08 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.dsl.teletu.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 2F06C4EE0742;
 Fri, 22 Mar 2024 09:47:07 +0100 (CET)
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
X-Inumbo-ID: c4183ac8-e828-11ee-afe0-a90da7624cb6
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 0/2] xen: address violations of MISRA C Rule 17.1
Date: Fri, 22 Mar 2024 09:46:16 +0100
Message-Id: <cover.1711096695.git.simone.ballarin@bugseng.com>
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
Changes in v2:
- replace "related to console output" with "printf()-like functions";
- replace "special hypercalls" with "internal helpers".

Simone Ballarin (2):
  automation/eclair: add deviation for MISRA C:2012 Rule 17.1
  xen: address violations of MISRA C Rule 17.1

 .../eclair_analysis/ECLAIR/deviations.ecl     | 26 +++++++++++++++++++
 docs/misra/deviations.rst                     |  5 ++++
 docs/misra/safe.json                          |  8 ++++++
 xen/arch/arm/domain.c                         |  1 +
 xen/arch/x86/hypercall.c                      |  2 ++
 5 files changed, 42 insertions(+)

-- 
2.34.1


