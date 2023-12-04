Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD4803CDF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 19:24:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647272.1010222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rADbE-0003VQ-QE; Mon, 04 Dec 2023 18:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647272.1010222; Mon, 04 Dec 2023 18:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rADbE-0003Tb-NV; Mon, 04 Dec 2023 18:23:20 +0000
Received: by outflank-mailman (input) for mailman id 647272;
 Mon, 04 Dec 2023 18:23:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjtD=HP=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rADbD-0003TC-Oq
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 18:23:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 326ebb05-92d2-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 19:23:18 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id B836C4EE0C8A;
 Mon,  4 Dec 2023 19:23:16 +0100 (CET)
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
X-Inumbo-ID: 326ebb05-92d2-11ee-98e5-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] docs/misra: deviate deliberately unused labels
Date: Mon,  4 Dec 2023 19:23:11 +0100
Message-Id: <669f63d14926f6335a081711de5a34ef04c61717.1701714146.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The labels marked with __maybe_unused are either used only
in certain build configurations or deliberately unused.
See the justification in docs/misra/deviations.rst.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index c9e3a90801aa..f18ed6345e67 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -37,6 +37,10 @@ removed by the compiler, the resulting slowdown is negligible."
 -config=MC3R1.R2.2,reports+={disapplied,"any()"}
 -doc_end
 
+-doc_begin="Some labels are unused in certain build configurations, or are deliberately marked as unused, so that the compiler is entitled to remove them."
+-config=MC3R1.R2.6,reports+={deliberate, "any_area(text(^.*__maybe_unused.*$))"}
+-doc_end
+
 #
 # Series 3.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 160513b997ae..9979ddae7c7d 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -73,6 +73,14 @@ Deviations related to MISRA C:2012 Rules:
        resulting slowdown is negligible.
      - Project-wide deviation, tagged as `disapplied` for ECLAIR.
 
+   * - R2.6
+     - Labels deliberately marked as unused trough the pseudo-attribute
+       `__maybe_unused` are either the result of them not being in certain build
+       configurations, or as a deliberate practice (e.g., `unimplemented_insn`).
+       Given that the compiler is then entitled to remove them, the presence of
+       such labels poses no risks.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R3.1
      - Comments starting with '/\*' and containing hyperlinks are safe as they
        are not instances of commented-out code.
-- 
2.34.1


