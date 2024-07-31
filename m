Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B033942ED7
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 14:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768564.1179400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8eW-0007gi-1d; Wed, 31 Jul 2024 12:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768564.1179400; Wed, 31 Jul 2024 12:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8eV-0007e2-V8; Wed, 31 Jul 2024 12:41:59 +0000
Received: by outflank-mailman (input) for mailman id 768564;
 Wed, 31 Jul 2024 12:41:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ap7E=O7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sZ8eU-0007du-Pz
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 12:41:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4607791d-4f3a-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 14:41:57 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 619684EE0760;
 Wed, 31 Jul 2024 14:41:56 +0200 (CEST)
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
X-Inumbo-ID: 4607791d-4f3a-11ef-bc01-fd08da9f4363
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
Subject: [XEN PATCH] automation/eclair_analysis: add Rule 18.6 to the clean guidelines
Date: Wed, 31 Jul 2024 14:41:52 +0200
Message-Id: <c4dddc9468224e037f42ef77eb8407ba9a71207e.1722429655.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 18.6 states: "The address of an object with automatic
storage shall not be copied to another object that persists after
the first object has ceased to exist."

The rule is set as monitored and tagged clean, in order to block
the CI on any violations that may arise, allowing the presence
of cautions (currently there are no violations).

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/monitored.ecl | 1 +
 automation/eclair_analysis/ECLAIR/tagging.ecl   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
index 9ffaebbdc378..8a7e3f3ceaa9 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -32,6 +32,7 @@
 -enable=MC3R1.R17.4
 -enable=MC3R1.R17.5
 -enable=MC3R1.R17.6
+-enable=MC3R1.R18.6
 -enable=MC3R1.R19.1
 -enable=MC3R1.R20.12
 -enable=MC3R1.R20.13
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index b829655ca0bc..e7b32773e60e 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -67,6 +67,7 @@ MC3R1.R17.3||
 MC3R1.R17.4||
 MC3R1.R17.5||
 MC3R1.R17.6||
+MC3R1.R18.6||
 MC3R1.R18.8||
 MC3R1.R20.2||
 MC3R1.R20.3||
-- 
2.34.1


