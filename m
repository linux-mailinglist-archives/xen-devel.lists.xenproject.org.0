Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F4E7754CD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 10:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580760.909171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTeFo-0003V8-Pj; Wed, 09 Aug 2023 08:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580760.909171; Wed, 09 Aug 2023 08:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTeFo-0003S8-MH; Wed, 09 Aug 2023 08:09:16 +0000
Received: by outflank-mailman (input) for mailman id 580760;
 Wed, 09 Aug 2023 08:09:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ohew=D2=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qTeFn-0003RD-07
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 08:09:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 071effee-368c-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 10:09:13 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 65B284EE073F;
 Wed,  9 Aug 2023 10:09:13 +0200 (CEST)
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
X-Inumbo-ID: 071effee-368c-11ee-b280-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/3] automation/eclair: update clean guidelines
Date: Wed,  9 Aug 2023 10:07:59 +0200
Message-Id: <89e4ad4c56c083391b24b9da55212e888c5f3beb.1691568344.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691568344.git.simone.ballarin@bugseng.com>
References: <cover.1691568344.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch splits the former list in two separate selectors
clean_guidelines_common and additional_clean_guidelines.

clean_guidelines_common contains the guidelines that are clean
in both the analyzed builds, instead additional_clean_guidelines
is popolated depending on the current one.

The following clean guidelines have been added:
- MC3R1.R1.1;
- MC3R1.R1.3;
- MC3R1.R3.1;
- MC3R1.R4.1;
- MC3R1.R17.4;
- MC3R1.R22.6;
- MC3R1.D4.3 (just x86_64);
- MC3R1.R5.3 (just arm64);
- MC3R1.R7.2 (just arm64);
- MC3R1.R8.6 (just arm64);
- MC3R1.R9.3 (just arm64).

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index ef2e56e186..3f589fd716 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -28,7 +28,20 @@
 ####################
 
 -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
--service_selector={clean_guidelines,"^(MC3R1\\.D1\\.1|MC3R1\\.D2\\.1|MC3R1\\.D4\\.11|MC3R1\\.D4\\.14|MC3R1\\.R1\\.4|MC3R1\\.R2\\.2|MC3R1\\.R3\\.2|MC3R1\\.R5\\.1|MC3R1\\.R5\\.2|MC3R1\\.R5\\.4|MC3R1\\.R6\\.1|MC3R1\\.R6\\.2|MC3R1\\.R7\\.1|MC3R1\\.R8\\.1|MC3R1\\.R8\\.5|MC3R1\\.R8\\.8|MC3R1\\.R8\\.10|MC3R1\\.R8\\.12|MC3R1\\.R8\\.14|MC3R1\\.R9\\.2|MC3R1\\.R9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R12\\.5|MC3R1\\.R17\\.3|MC3R1\\.R17\\.6|MC3R1\\.R21\\.13|MC3R1\\.R21\\.19|MC3R1\\.R21\\.21|MC3R1\\.R22\\.2|MC3R1\\.R22\\.4|MC3R1\\.R22\\.5)$"
+
+-service_selector={clean_guidelines_common,"^(MC3R1\\.D1\\.1|MC3R1\\.D2\\.1|MC3R1\\.D4\\.11|MC3R1\\.D4\\.14|MC3R1\\.R1\\.1|MC3R1\\.R1\\.3|MC3R1\\.R1\\.4|MC3R1\\.R2\\.2|MC3R1\\.R3\\.1|MC3R1\\.R3\\.2|MC3R1\\.R4\\.1|MC3R1\\.R5\\.1|MC3R1\\.R5\\.2|MC3R1\\.R5\\.4|MC3R1\\.R6\\.1|MC3R1\\.R6\\.2|MC3R1\\.R7\\.1|MC3R1\\.R8\\.1|MC3R1\\.R8\\.5|MC3R1\\.R8\\.8|MC3R1\\.R8\\.10|MC3R1\\.R8\\.12|MC3R1\\.R8\\.14|MC3R1\\.R9\\.2|MC3R1\\.R9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R12\\.5|MC3R1\\.R17\\.3|MC3R1\\.R17\\.4|MC3R1\\.R17\\.6|MC3R1\\.R21\\.13|MC3R1\\.R21\\.19|MC3R1\\.R21\\.21|MC3R1\\.R22\\.2|MC3R1\\.R22\\.4|MC3R1\\.R22\\.5|MC3R1\\.R22\\.6)$"
 }
--reports+={clean:added,"service(clean_guidelines)"}
+
+-setq=target,getenv("XEN_TARGET_ARCH")
+
+if(string_equal(target,"x86_64"),
+    service_selector({"additional_clean_guidelines","^(MC3R1\\.D4\\.3)$"})
+)
+
+if(string_equal(target,"arm64"),
+    service_selector({"additional_clean_guidelines","^(MC3R1\\.R5\\.3|MC3R1\\.R7\\.2|MC3R1\\.R8\\.6|MC3R1\\.R9\\.3)$"})
+)
+
+-reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
+
 -doc_end
-- 
2.34.1


