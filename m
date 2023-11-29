Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67407FDB29
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 16:24:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643996.1004622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQm-0002uP-Qt; Wed, 29 Nov 2023 15:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643996.1004622; Wed, 29 Nov 2023 15:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQm-0002pY-DT; Wed, 29 Nov 2023 15:24:52 +0000
Received: by outflank-mailman (input) for mailman id 643996;
 Wed, 29 Nov 2023 15:24:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQo/=HK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8MQk-0001PY-Kl
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 15:24:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fca78b7-8ecb-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 16:24:50 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.152])
 by support.bugseng.com (Postfix) with ESMTPSA id 3806E4EE0C81;
 Wed, 29 Nov 2023 16:24:49 +0100 (CET)
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
X-Inumbo-ID: 6fca78b7-8ecb-11ee-98e3-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 7/7] xen/page_alloc: deviate first_valid_mfn for MISRA C Rule 8.4
Date: Wed, 29 Nov 2023 16:24:25 +0100
Message-Id: <1ee69d2f0b9e9a704bf869e2b2700f88a8069343.1701270983.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701270983.git.nicola.vetrini@bugseng.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
The preferred way to deviate is to use asmlinkage, but this modification is only
the consequence of NUMA on ARM (and possibly PPC) being a work in progress.
As stated in the comment above the textual deviation, first_valid_mfn will
likely then become static and there would be no need for the comment anymore.
This works towards having the analysis for this rule clean (i.e. no violations);
the interest in having a clean rule is that then it could be used to signal
newly introduced violations by making the analysis job fail.
---
 xen/common/page_alloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 9b5df74fddab..794d7689b179 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -258,6 +258,7 @@ static PAGE_LIST_HEAD(page_broken_list);
  * first_valid_mfn is exported because it is use in ARM specific NUMA
  * helpers. See comment in arch/arm/include/asm/numa.h.
  */
+/* SAF-1-safe */
 mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
 
 struct bootmem_region {
-- 
2.34.1

