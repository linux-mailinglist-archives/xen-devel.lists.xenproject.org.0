Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE3078B374
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 16:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591532.924033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadUM-00013S-9c; Mon, 28 Aug 2023 14:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591532.924033; Mon, 28 Aug 2023 14:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadUM-00011g-6k; Mon, 28 Aug 2023 14:45:10 +0000
Received: by outflank-mailman (input) for mailman id 591532;
 Mon, 28 Aug 2023 13:36:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qacPu-0004gK-UA
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:36:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7ca1d81-45a5-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 15:20:28 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 943794EE073A;
 Mon, 28 Aug 2023 15:20:27 +0200 (CEST)
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
X-Inumbo-ID: a7ca1d81-45a5-11ee-9b0c-b553b5be7939
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
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 01/13] misra: add deviation for headers that explicitly avoid guards
Date: Mon, 28 Aug 2023 15:19:58 +0200
Message-Id: <9b8165105c28f8e684844f56814726498e34c46e.1693228255.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693228255.git.simone.ballarin@bugseng.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some headers, under specific circumstances (documented in a comment at
the beginning of the file), explicitly avoid inclusion guards: the caller
is responsible for including them correctly.

These files are not supposed to comply with Directive 4.10:
"Precautions shall be taken in order to prevent the contents of a header
file being included more than once"

This patch adds a deviation for all headers that contain the following
in a comment text:
"In this case, no inclusion guards apply and the caller is responsible"

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/rules.rst                             | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d8170106b4..5f068377fa 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -91,6 +91,10 @@ conform to the directive."
 -config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
 -doc_end
 
+-doc_begin="Some headers, under specific circumstances, explicitly avoid inclusion guards."
+-config=MC3R1.D4.10,reports+={safe, "first_area(text(^ \\* In this case, no inclusion guards apply and the caller is responsible.*\\*/$, begin-1))"}
+-doc_end
+
 #
 # Series 5.
 #
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index db30632b93..4b1a7b02b6 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -60,7 +60,8 @@ maintainers if you want to suggest a change.
      - Precautions shall be taken in order to prevent the contents of a
        header file being included more than once
      - Files that are intended to be included more than once do not need to
-       conform to the directive
+       conform to the directive. Files that explicitly avoid inclusion guards
+       under specific circumstances do not need to conform the directive.
 
    * - `Dir 4.11 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_11.c>`_
      - Required
-- 
2.34.1


