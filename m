Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A049AFC7F7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 12:10:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036330.1408586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ5HC-0005oc-L1; Tue, 08 Jul 2025 10:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036330.1408586; Tue, 08 Jul 2025 10:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ5HC-0005mn-IC; Tue, 08 Jul 2025 10:10:14 +0000
Received: by outflank-mailman (input) for mailman id 1036330;
 Tue, 08 Jul 2025 10:10:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6R6=ZV=alex0.net=me@srs-se1.protection.inumbo.net>)
 id 1uZ5HA-0005mh-Nj
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 10:10:12 +0000
Received: from outbound.st.icloud.com
 (p-east2-cluster5-host7-snip4-9.eps.apple.com [57.103.79.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b90f0e01-5be3-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 12:10:07 +0200 (CEST)
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
 by outbound.st.icloud.com (Postfix) with ESMTPS id 1FFA11800BF0;
 Tue,  8 Jul 2025 10:10:05 +0000 (UTC)
Received: from personal-unclass (st-asmtp-me-k8s.p00.prod.me.com
 [17.42.251.67])
 by outbound.st.icloud.com (Postfix) with ESMTPSA id 0CA7918002A9;
 Tue,  8 Jul 2025 10:10:01 +0000 (UTC)
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
X-Inumbo-ID: b90f0e01-5be3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex0.net; s=sig1;
	bh=DX3etFGTu25f/iDa1r4MdVGbHdmW9qxL6IE5FDD4IRI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=QsBWq3tDftHorSetMIRuF+ptluneNwrkiD0wqFBkp1b1bXHFogMYrY+iZSFhgsrT0
	 AzjtJH+fpjjbM7S2J/+boOs33k68WcBf5msV80FBFvhWwKtHOYKGOUeRxfSJSCaMF9
	 24ZFhtRMofHDzODn4diek2p1Cx5WBSm5YeyxEMzxa7jLFYBDT59YNxmO5FWL1x8ieE
	 6Vs4TD+y/XXqPT+M9tzF5MhAHqkIvZlzIFT7NgUdFRJHUx3jlDc9R+zdbSSP/ZiJOQ
	 aDJBvg24LAdtiyUyrTzQEg5nd+k5GdOORIq6Qqmu6ydy7ggSlxXxxmFl31Cb1wA5Nh
	 C21haW2uyDElQ==
From: Alex XZ Cypher Zero <me@alex0.net>
To: xen-devel@lists.xenproject.org
Cc: Alex XZ Cypher Zero <me@alex0.net>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/idle: Implement support for Meteor Lake
Date: Tue,  8 Jul 2025 11:09:44 +0100
Message-ID: <4f6cad808ae9ada51e873a411d774dafad4a49cd.1751969384.git.me@alex0.net>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA4MyBTYWx0ZWRfX2vs/Fdu+5J6i
 COS7KDtmc+cN1QQR3FDvrVuqv1ft92qcs1lPVG0NiVTnwgpqB8Le1QQ3lMnwJe2vTayo18Lk/LG
 TWbal+1SQP6G/ESrUYwauEuOnB29vrikZ+X4ulFnUe6Xkc0Djpnam74k9ps9al/rVvvB1ff8MWE
 Hv3ormSfZjFq2cyhJw82UVLURIToMO6UbPc03qNd4q17FWH7c56jVonBzyWS7NyHbF+XbPKlfBa
 cN+DDCG5F75eeT9FbyiELnn/HLGP/NaAmFAtsUFeXup3MyccK+cSRRCTFixkQXcoAwqYAEFJM=
X-Proofpoint-GUID: PIo9OZrGcl7BC5v-lJvR5A08lH9wikbt
X-Proofpoint-ORIG-GUID: PIo9OZrGcl7BC5v-lJvR5A08lH9wikbt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1030 mlxlogscore=530
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2507080083

Adds support for Meteor Lake C-states, following the reference implementation in Linux.

Signed-off-by: Alex XZ Cypher Zero <me@alex0.net>
---
 xen/arch/x86/cpu/mwait-idle.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 5e98011bfd..1e90806c70 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -678,6 +678,28 @@ static struct cpuidle_state __read_mostly adl_l_cstates[] = {
 	{}
 };
 
+static struct cpuidle_state __read_mostly mtl_l_cstates[] = {
+	{
+		.name = "C1E",
+		.flags = MWAIT2flg(0x01),
+		.exit_latency = 1,
+		.target_residency = 1,
+	},
+	{
+		.name = "C6",
+		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 140,
+		.target_residency = 420
+	},
+	{
+		.name = "C10",
+		.flags = MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 310,
+		.target_residency = 930
+	},
+	{}
+};
+
 static struct cpuidle_state __read_mostly spr_cstates[] = {
 	{
 		.name = "C1",
@@ -1083,6 +1105,10 @@ static struct idle_cpu __read_mostly idle_cpu_adl_l = {
 	.state_table = adl_l_cstates,
 };
 
+static struct idle_cpu __read_mostly idle_cpu_mtl_l = {
+	.state_table = mtl_l_cstates,
+};
+
 static struct idle_cpu __read_mostly idle_cpu_spr = {
 	.state_table = spr_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
@@ -1148,6 +1174,7 @@ static const struct x86_cpu_id intel_idle_ids[] __initconstrel = {
 	ICPU(ICELAKE_D,			icx),
 	ICPU(ALDERLAKE,			adl),
 	ICPU(ALDERLAKE_L,		adl_l),
+	ICPU(METEORLAKE_L,		mtl_l),
 	ICPU(SAPPHIRERAPIDS_X,		spr),
 	ICPU(ATOM_GOLDMONT,		bxt),
 	ICPU(ATOM_GOLDMONT_PLUS,	bxt),
-- 
2.50.0


