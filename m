Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BFC8CB44A
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 21:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727064.1131463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9VFm-00072C-SK; Tue, 21 May 2024 19:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727064.1131463; Tue, 21 May 2024 19:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9VFm-0006zz-PE; Tue, 21 May 2024 19:34:30 +0000
Received: by outflank-mailman (input) for mailman id 727064;
 Tue, 21 May 2024 19:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y4Qq=MY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s9VFl-0006zc-6H
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 19:34:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 224a2c1b-17a9-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 21:34:27 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id 2414F4EE0738;
 Tue, 21 May 2024 21:34:25 +0200 (CEST)
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
X-Inumbo-ID: 224a2c1b-17a9-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH] automation/eclair_analysis: add already clean rules to the analysis
Date: Tue, 21 May 2024 21:34:21 +0200
Message-Id: <b54857c4bd0ac6e29042a55c0692178bb54ac307.1716319970.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some MISRA C rules already have no violations in Xen, so they can be
set as clean.

Reorder the rules in tagging.ecl according to version ordering
(i.e. sort -V) and split the configuration on multiple lines for
readability.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 .../eclair_analysis/ECLAIR/monitored.ecl      | 17 ++++
 automation/eclair_analysis/ECLAIR/tagging.ecl | 78 ++++++++++++++++++-
 2 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
index 9da709dc889c..4daecb0c838f 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -79,4 +79,21 @@
 -enable=MC3R1.R9.3
 -enable=MC3R1.R9.4
 -enable=MC3R1.R9.5
+-enable=MC3R1.R18.8
+-enable=MC3R1.R20.2
+-enable=MC3R1.R20.3
+-enable=MC3R1.R20.6
+-enable=MC3R1.R20.11
+-enable=MC3R1.R21.3
+-enable=MC3R1.R21.4
+-enable=MC3R1.R21.5
+-enable=MC3R1.R21.7
+-enable=MC3R1.R21.8
+-enable=MC3R1.R21.12
+-enable=MC3R1.R22.1
+-enable=MC3R1.R22.3
+-enable=MC3R1.R22.7
+-enable=MC3R1.R22.8
+-enable=MC3R1.R22.9
+-enable=MC3R1.R22.10
 -doc_end
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index b7a9f75b275b..a354ff322e03 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -19,7 +19,83 @@
 
 -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
 
--service_selector={clean_guidelines_common, "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R10.2||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.10||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R21.9||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
+-service_selector={clean_guidelines_common,
+"MC3R1.D1.1||
+MC3R1.D2.1||
+MC3R1.D4.1||
+MC3R1.D4.11||
+MC3R1.D4.14||
+MC3R1.R1.1||
+MC3R1.R1.3||
+MC3R1.R1.4||
+MC3R1.R2.2||
+MC3R1.R2.6||
+MC3R1.R3.1||
+MC3R1.R3.2||
+MC3R1.R4.1||
+MC3R1.R4.2||
+MC3R1.R5.1||
+MC3R1.R5.2||
+MC3R1.R5.4||
+MC3R1.R5.6||
+MC3R1.R6.1||
+MC3R1.R6.2||
+MC3R1.R7.1||
+MC3R1.R7.2||
+MC3R1.R7.4||
+MC3R1.R8.1||
+MC3R1.R8.2||
+MC3R1.R8.5||
+MC3R1.R8.6||
+MC3R1.R8.8||
+MC3R1.R8.10||
+MC3R1.R8.12||
+MC3R1.R8.14||
+MC3R1.R9.2||
+MC3R1.R9.3||
+MC3R1.R9.4||
+MC3R1.R9.5||
+MC3R1.R10.2||
+MC3R1.R11.7||
+MC3R1.R11.9||
+MC3R1.R12.5||
+MC3R1.R14.1||
+MC3R1.R16.7||
+MC3R1.R17.1||
+MC3R1.R17.3||
+MC3R1.R17.4||
+MC3R1.R17.5||
+MC3R1.R17.6||
+MC3R1.R18.8||
+MC3R1.R20.2||
+MC3R1.R20.3||
+MC3R1.R20.4||
+MC3R1.R20.6||
+MC3R1.R20.9||
+MC3R1.R20.11||
+MC3R1.R20.13||
+MC3R1.R20.14||
+MC3R1.R21.3||
+MC3R1.R21.4||
+MC3R1.R21.5||
+MC3R1.R21.7||
+MC3R1.R21.8||
+MC3R1.R21.9||
+MC3R1.R21.10||
+MC3R1.R21.12||
+MC3R1.R21.13||
+MC3R1.R21.19||
+MC3R1.R21.21||
+MC3R1.R22.1||
+MC3R1.R22.2||
+MC3R1.R22.3||
+MC3R1.R22.4||
+MC3R1.R22.5||
+MC3R1.R22.6||
+MC3R1.R22.7||
+MC3R1.R22.8||
+MC3R1.R22.9||
+MC3R1.R22.10"
 }
 
 -setq=target,getenv("XEN_TARGET_ARCH")
-- 
2.34.1


