Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E70378B36F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 16:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591537.924062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadUN-0001fL-Mb; Mon, 28 Aug 2023 14:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591537.924062; Mon, 28 Aug 2023 14:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadUN-0001VO-IW; Mon, 28 Aug 2023 14:45:11 +0000
Received: by outflank-mailman (input) for mailman id 591537;
 Mon, 28 Aug 2023 13:36:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qacPy-0004gK-Kc
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:36:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a904a21b-45a5-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 15:20:30 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A7A354EE073D;
 Mon, 28 Aug 2023 15:20:29 +0200 (CEST)
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
X-Inumbo-ID: a904a21b-45a5-11ee-9b0c-b553b5be7939
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
Subject: [XEN PATCH 05/13] automation/eclair: add deviation for usercopy.c
Date: Mon, 28 Aug 2023 15:20:02 +0200
Message-Id: <4039623dc4341758f383ec49228c1e55e5862b0f.1693228255.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693228255.git.simone.ballarin@bugseng.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen/arch/x86/usercopy.c includes itself, so it is not supposed to
comply with Directive 4.10:
"Precautions shall be taken in order to prevent the contents of a
header file being included more than once"

This patch adds a deviation for the file.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/rules.rst                             | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 2681a4cff5..a7d4f29b43 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -96,6 +96,10 @@ conform to the directive."
 -config=MC3R1.D4.10,reports+={safe, "first_area(text(^ \\* In this case, no inclusion guards apply and the caller is responsible.*\\*/$, begin-1))"}
 -doc_end
 
+-doc_begin="xen/arch/x86/usercopy.c includes itself: it is not supposed to comply with the directive"
+-config=MC3R1.D4.10,reports+={deliberate, "all_area(all_loc(file("^xen/arch/x86/usercopy\\.c$")))"}
+-doc_end
+
 #
 # Series 5.
 #
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 4b1a7b02b6..45e13d0302 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -62,6 +62,8 @@ maintainers if you want to suggest a change.
      - Files that are intended to be included more than once do not need to
        conform to the directive. Files that explicitly avoid inclusion guards
        under specific circumstances do not need to conform the directive.
+       xen/arch/x86/usercopy.c includes itself: it is not supposed to comply
+       with the directive.
 
    * - `Dir 4.11 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_11.c>`_
      - Required
-- 
2.34.1


