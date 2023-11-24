Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650AF7F764B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 15:23:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640773.999488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6X5K-0007YZ-NP; Fri, 24 Nov 2023 14:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640773.999488; Fri, 24 Nov 2023 14:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6X5K-0007Vx-Kg; Fri, 24 Nov 2023 14:23:10 +0000
Received: by outflank-mailman (input) for mailman id 640773;
 Fri, 24 Nov 2023 14:23:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuqv=HF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r6X5J-0007Ua-7M
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 14:23:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcaddc75-8ad4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 15:23:07 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.237.167])
 by support.bugseng.com (Postfix) with ESMTPSA id 3C4794EE073C;
 Fri, 24 Nov 2023 15:23:06 +0100 (CET)
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
X-Inumbo-ID: fcaddc75-8ad4-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation/eclair: tag files as "adopted" and "out of scope"
Date: Fri, 24 Nov 2023 15:22:59 +0100
Message-Id: <548e2f7e5794ec35997d615282f0f4dc6f6250a8.1700835046.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag arm64/efibind.h as "adopted":
it is used to build the efi stub, which is a separate entry point
for Xen when booted from EFI firmware.

Tag common/coverage/* as "out-of-scope":
it is code to support gcov, hence it is part of the testing machinery.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/out_of_scope.ecl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
index e1ec4a607c..3bd385ecf9 100644
--- a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
+++ b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
@@ -84,6 +84,7 @@
 -doc_begin="Files imported from the gnu-efi package"
 -file_tag+={adopted,"^xen/include/efi/.*$"}
 -file_tag+={adopted,"^xen/arch/x86/include/asm/x86_64/efibind\\.h$"}
+-file_tag+={adopted,"^xen/arch/arm/include/asm/arm64/efibind\\.h$"}
 -doc_end
 
 -doc_begin="Build tools are out of scope."
@@ -104,6 +105,10 @@
 -file_tag+={out_of_scope,"^xen/include/xen/xxhash\\.h$"}
 -doc_end
 
+-doc_begin="Out of scope code to support gcov."
+-file_tag+={out_of_scope, "^xen/common/coverage/.*$"}
+-doc_end
+
 -doc_begin="Headers under xen/include/public/ are the description of the public
 hypercall ABI so the community is extremely conservative in making changes
 there, because the interface is maintained for backward compatibility: ignore
-- 
2.34.1


