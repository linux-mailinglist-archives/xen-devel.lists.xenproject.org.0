Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4258ABC6F
	for <lists+xen-devel@lfdr.de>; Sat, 20 Apr 2024 18:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709414.1108588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryDbx-0005RW-1g; Sat, 20 Apr 2024 16:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709414.1108588; Sat, 20 Apr 2024 16:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryDbw-0005Pb-VA; Sat, 20 Apr 2024 16:30:44 +0000
Received: by outflank-mailman (input) for mailman id 709414;
 Sat, 20 Apr 2024 16:30:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m9lK=LZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ryDbw-0005PV-9S
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2024 16:30:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 547f1920-ff33-11ee-9e3a-7da7ca7a9ce9;
 Sat, 20 Apr 2024 18:30:42 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id 35E064EE0739;
 Sat, 20 Apr 2024 18:30:40 +0200 (CEST)
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
X-Inumbo-ID: 547f1920-ff33-11ee-9e3a-7da7ca7a9ce9
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [XEN PATCH v3] automation/eclair_analysis: substitute deprecated service STD.emptrecd
Date: Sat, 20 Apr 2024 18:30:36 +0200
Message-Id: <717082cdacbcb1876920d0491e3e026dc9bd9631.1713630559.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ECLAIR service STD.emptrecd (which checks for empty structures) is being
deprecated; hence, as a preventive measure, STD.anonstct (which checks for
structures with no named members, an UB in C99) is used here; the latter being
a more general case than the previous one, this change does not affect the
analysis. This new service is already supported by the current version of
ECLAIR.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v3:
- Provide a better description
---
 automation/eclair_analysis/ECLAIR/toolchain.ecl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
index 71a1e2cce029..86e9a79b5231 100644
--- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
+++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
@@ -44,8 +44,8 @@
 -doc_end
 
 -doc_begin="See Section \"6.19 Structures with No Members\" of "GCC_MANUAL"."
--config=STD.emptrecd,behavior+={c99,GCC_ARM64,specified}
--config=STD.emptrecd,behavior+={c99,GCC_X86_64,specified}
+-config=STD.anonstct,behavior+={c99,GCC_ARM64,specified}
+-config=STD.anonstct,behavior+={c99,GCC_X86_64,specified}
 -doc_end
 
 -doc_begin="See Section \"6.18 Arrays of Length Zero\" of "GCC_MANUAL"."
-- 
2.34.1


