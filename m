Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726609737CD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 14:43:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795514.1204904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so0DR-0004Qq-Th; Tue, 10 Sep 2024 12:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795514.1204904; Tue, 10 Sep 2024 12:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so0DR-0004OK-QN; Tue, 10 Sep 2024 12:43:29 +0000
Received: by outflank-mailman (input) for mailman id 795514;
 Tue, 10 Sep 2024 12:43:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0jq=QI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1so0DP-0004OA-Gg
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 12:43:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 453a6440-6f72-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 14:43:25 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id AA34A4EE07A8;
 Tue, 10 Sep 2024 14:43:23 +0200 (CEST)
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
X-Inumbo-ID: 453a6440-6f72-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725972204; bh=zfH4JuPiui7pMPoI9vQtOmlaZUhwRqgB07OFHm8U3eQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Z61tPtxPNWO5X3FLae6ddurObQeGovpKSbvL45V+wgWooogxnos025EjiLfapOr9z
	 qGOBojDyf/qO9yfe+mTOyRGaLdMm4jzAKSvQK2hgnUkzNgMlWSfgUQu7Us74EIrD35
	 Sp8Y2kZtcVcd6COQoeBofe2/uAy1WVNMjrw4cSqCtxwsMP11sbeBhbYOf4cmCyw6Qa
	 6qJjjeCTDXU+WSwYLtQlgpy8OXM+IAD8KrqUf1Hik5bdVQ6l36B9EPoaz5BYZLOsR6
	 +lEtkymlnWOYRl5nCn+eMv763yMa8RqDr1uDlKmzB7H7LcyC57/HHJWtihRCGsI4ua
	 49UBr1qsT3kgQ==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH] automation/eclair_analysis: address violation of Rule 20.7
Date: Tue, 10 Sep 2024 14:43:21 +0200
Message-ID: <a2fb434d56dc668c27b51d03be0fab703583c18d.1725972157.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA Rule 20.7 states:
"Expressions resulting from the expansion of macro parameters
shall be enclosed in parentheses".

The files imported from the gnu-efi package are already deviated, yet
the macro NextMemoryDescriptor is used in non-excluded code, so a further
deviation is needed to exclude also any expansion of the macro.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index ed80ac795851..3241f96cd612 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -566,7 +566,7 @@ of the IS_ENABLED or STATIC_IF/STATIC_IF_NOT macros, so it always receives a lit
 not in scope for compliance are allowed, as that is imported code."
 -file_tag+={gnu_efi_include, "^xen/include/efi/.*$"}
 -file_tag+={acpi_cpu_idle, "^xen/arch/x86/acpi/cpu_idle\\.c$"}
--config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(file(gnu_efi_include)))"}
+-config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(file(gnu_efi_include)||any_exp(macro(^NextMemoryDescriptor$))))"}
 -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(file(acpi_cpu_idle)))"}
 -doc_end
 
-- 
2.43.0


