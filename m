Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFCB900CBF
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 22:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736619.1142731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFfxp-0001W6-Dm; Fri, 07 Jun 2024 20:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736619.1142731; Fri, 07 Jun 2024 20:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFfxp-0001UW-AN; Fri, 07 Jun 2024 20:13:29 +0000
Received: by outflank-mailman (input) for mailman id 736619;
 Fri, 07 Jun 2024 20:13:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppZm=NJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sFfxo-0001UQ-DP
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 20:13:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6698be71-250a-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 22:13:27 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 00CB64EE0742;
 Fri,  7 Jun 2024 22:13:25 +0200 (CEST)
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
X-Inumbo-ID: 6698be71-250a-11ef-90a2-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [XEN PATCH for-4.19 v2 2/3] automation/eclair_analysis: address remaining violations of MISRA C Rule 20.12
Date: Fri,  7 Jun 2024 22:13:17 +0200
Message-Id: <4ea119f84e075ebcdfe2669527826c269a454d0e.1717790683.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717790683.git.nicola.vetrini@bugseng.com>
References: <cover.1717790683.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DEFINE macro in asm-offsets.c (for all architectures) still generates
violations despite the file(s) being excluded from compliance, due to the
fact that in its expansion it sometimes refers entities in non-excluded files.
These corner cases are deviated by the configuration.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 447c1e6661d1..e2653f77eb2c 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -483,6 +483,12 @@ leads to a violation of the Rule are deviated."
 -config=MC3R1.R20.12,macros+={deliberate, "name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
 -doc_end

+-doc_begin="The macro DEFINE is defined and used in excluded files asm-offsets.c.
+This may still cause violations if entities outside these files are referred to
+in the expansion."
+-config=MC3R1.R20.12,macros+={deliberate, "name(DEFINE)&&loc(file(asm_offsets))"}
+-doc_end
+
 #
 # Series 21.
 #
--
2.34.1

