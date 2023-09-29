Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7757B3806
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 18:35:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610629.950083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmGSm-0002tD-BX; Fri, 29 Sep 2023 16:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610629.950083; Fri, 29 Sep 2023 16:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmGSm-0002qa-8X; Fri, 29 Sep 2023 16:35:36 +0000
Received: by outflank-mailman (input) for mailman id 610629;
 Fri, 29 Sep 2023 16:35:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+YX=FN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qmGSk-0002qU-Fl
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 16:35:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34cf6c6d-5ee6-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 18:35:31 +0200 (CEST)
Received: from beta.station (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id 3C6854EE0739;
 Fri, 29 Sep 2023 18:35:31 +0200 (CEST)
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
X-Inumbo-ID: 34cf6c6d-5ee6-11ee-9b0d-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation/eclair: update accepted and clean guidelines
Date: Fri, 29 Sep 2023 18:35:10 +0200
Message-Id: <b163d56b606a86a8772e97cd1938c737aeef4754.1696003647.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch updates accepted and clean guidelines selectors.

Align accepted selector with docs/misra/rules.txt.
Add rule 7.3 in the clean selector for ARM.
Avoid regular expressions in all service selectors: usign them
requires escaping dots, which make selectors hard to read.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/ecl=
air_analysis/ECLAIR/tagging.ecl
index 3f589fd716..78a0bc948b 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -18,7 +18,8 @@
 #######################
=20
 -doc=3D"Accepted guidelines as reported in XEN/docs/misra/rules.rst"
--service_selector=3D{accepted_guidelines,"^(MC3R1\\.D1\\.1|MC3R1\\.D2\\.1|=
MC3R1\\.D4\\.3|MC3R1\\.D4\\.7|MC3R1\\.D4\\.10|MC3R1\\.D4\\.11|MC3R1\\.D4\\.=
14|MC3R1\\.R1\\.1|MC3R1\\.R1\\.3|MC3R1\\.R1\\.4|MC3R1\\.R2\\.1|MC3R1\\.R2\\=
.6|MC3R1\\.R2\\.2|MC3R1\\.R3\\.1|MC3R1\\.R3\\.2|MC3R1\\.R4\\.1|MC3R1\\.R4\\=
.2|MC3R1\\.R5\\.1|MC3R1\\.R5\\.2|MC3R1\\.R5\\.3|MC3R1\\.R5\\.4|MC3R1\\.R5\\=
.6|MC3R1\\.R6\\.1|MC3R1\\.R6\\.2|MC3R1\\.R7\\.1|MC3R1\\.R7\\.2|MC3R1\\.R7\\=
.3|MC3R1\\.R7\\.4|MC3R1\\.R8\\.1|MC3R1\\.R8\\.2|MC3R1\\.R8\\.3|MC3R1\\.R8\\=
.4|MC3R1\\.R8\\.5|MC3R1\\.R8\\.6|MC3R1\\.R8\\.8|MC3R1\\.R8\\.10|MC3R1\\.R8\=
\.12|MC3R1\\.R8\\.14|MC3R1\\.R9\\.1|MC3R1\\.R9\\.2|MC3R1\\.R9\\.3|MC3R1\\.R=
9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R12\\.5|MC3R1\\.R13\\.6|MC3R1\\.R13\\.1|MC3R1\=
\.R14\\.1|MC3R1\\.R16\\.7|MC3R1\\.R17\\.3|MC3R1\\.R17\\.4|MC3R1\\.R17\\.6|M=
C3R1\\.R18\\.3|MC3R1\\.R19\\.1|MC3R1\\.R20\\.7|MC3R1\\.R20\\.13|MC3R1\\.R20=
\\.14|MC3R1\\.R21\\.13|MC3R1\\.R21\\.17|MC3R1\\.R21\\.18|MC3R1\\.R21\\.19|M=
C3R1\\.R21\\.20|MC3R1\\.R21\\.21|MC3R1\\.R22\\.2|MC3R1\\.R22\\.4|MC3R1\\.R2=
2\\.5|MC3R1\\.R22\\.6)$"
+-service_selector=3D{accepted_guidelines,
+    "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.3||MC3R1.D4.7||MC3R1.D4.=
10||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.=
1||MC3R1.R2.2||MC3R1.R2.6||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||=
MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.3||MC3R1.R5.4||MC3R1.R5.6||MC3=
R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R7.4||MC3R1.=
R8.1||MC3R1.R8.2||MC3R1.R8.3||MC3R1.R8.4||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.=
8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.1||MC3R1.R9.2||MC3R1.R9.=
3||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R10.1||MC3R1.R10.2||MC3R1.R10.3||MC3R1.R10=
.4||MC3R1.R12.5||MC3R1.R13.6||MC3R1.R13.1||MC3R1.R14.1||MC3R1.R14.3||MC3R1.=
R16.7||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R18.3||MC3R1.R19.1||MC3=
R1.R20.7||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.17||MC3R1.R21=
.18||MC3R1.R21.19||MC3R1.R21.20||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC=
3R1.R22.5||MC3R1.R22.6"
 }
 -doc=3D"All reports of accepted guidelines are tagged as accepted."
 -reports+=3D{status:accepted,"service(accepted_guidelines)"}
@@ -29,17 +30,17 @@
=20
 -doc_begin=3D"Clean guidelines: new violations for these guidelines are no=
t accepted."
=20
--service_selector=3D{clean_guidelines_common,"^(MC3R1\\.D1\\.1|MC3R1\\.D2\=
\.1|MC3R1\\.D4\\.11|MC3R1\\.D4\\.14|MC3R1\\.R1\\.1|MC3R1\\.R1\\.3|MC3R1\\.R=
1\\.4|MC3R1\\.R2\\.2|MC3R1\\.R3\\.1|MC3R1\\.R3\\.2|MC3R1\\.R4\\.1|MC3R1\\.R=
5\\.1|MC3R1\\.R5\\.2|MC3R1\\.R5\\.4|MC3R1\\.R6\\.1|MC3R1\\.R6\\.2|MC3R1\\.R=
7\\.1|MC3R1\\.R8\\.1|MC3R1\\.R8\\.5|MC3R1\\.R8\\.8|MC3R1\\.R8\\.10|MC3R1\\.=
R8\\.12|MC3R1\\.R8\\.14|MC3R1\\.R9\\.2|MC3R1\\.R9\\.4|MC3R1\\.R9\\.5|MC3R1\=
\.R12\\.5|MC3R1\\.R17\\.3|MC3R1\\.R17\\.4|MC3R1\\.R17\\.6|MC3R1\\.R21\\.13|=
MC3R1\\.R21\\.19|MC3R1\\.R21\\.21|MC3R1\\.R22\\.2|MC3R1\\.R22\\.4|MC3R1\\.R=
22\\.5|MC3R1\\.R22\\.6)$"
+-service_selector=3D{clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R=
1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1=
.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R6=
.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.5||MC3R1.R8.8||MC3R1.R8.10=
||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5=
||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R21.13||MC3R1.R21.19||MC3R1.=
R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
 }
=20
 -setq=3Dtarget,getenv("XEN_TARGET_ARCH")
=20
 if(string_equal(target,"x86_64"),
-    service_selector({"additional_clean_guidelines","^(MC3R1\\.D4\\.3)$"})
+    service_selector({"additional_clean_guidelines","MC3R1.D4.3"})
 )
=20
 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","^(MC3R1\\.R5\\.3|MC3R=
1\\.R7\\.2|MC3R1\\.R8\\.6|MC3R1\\.R9\\.3)$"})
+    service_selector({"additional_clean_guidelines","MC3R1.R5.3||MC3R1.R7.=
2||MC3R1.R7.3||MC3R1.R8.6||MC3R1.R9.3"})
 )
=20
 -reports+=3D{clean:added,"service(clean_guidelines_common||additional_clea=
n_guidelines)"}
--=20
2.34.1


