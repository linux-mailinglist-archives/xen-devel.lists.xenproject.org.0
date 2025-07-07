Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279C8AFBBBB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 21:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035759.1408112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYrYa-00067n-HQ; Mon, 07 Jul 2025 19:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035759.1408112; Mon, 07 Jul 2025 19:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYrYa-00066J-ET; Mon, 07 Jul 2025 19:31:16 +0000
Received: by outflank-mailman (input) for mailman id 1035759;
 Mon, 07 Jul 2025 19:31:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XE4V=ZU=alex0.net=me@srs-se1.protection.inumbo.net>)
 id 1uYrYY-00066C-Qb
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 19:31:14 +0000
Received: from outbound.st.icloud.com
 (p-east2-cluster3-host1-snip4-8.eps.apple.com [57.103.77.219])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeaf1e6f-5b68-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 21:31:09 +0200 (CEST)
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
 by outbound.st.icloud.com (Postfix) with ESMTPS id 1AAE9180163E;
 Mon,  7 Jul 2025 19:31:05 +0000 (UTC)
Received: from personal-unclass (st-asmtp-me-k8s.p00.prod.me.com
 [17.42.251.67])
 by outbound.st.icloud.com (Postfix) with ESMTPSA id 967BD1801634;
 Mon,  7 Jul 2025 19:31:03 +0000 (UTC)
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
X-Inumbo-ID: eeaf1e6f-5b68-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex0.net; s=sig1;
	bh=gq9qWmqCI+kCv7euHM1RYMlz55WOBgouinwYBY9EJoY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=k7FRnlLpl8tJyvjfL1rf2zQRkd9vzFLzbjynqu4YY/GUj2Bx73G6NGsH+lG94vMt2
	 bvTyAmXFakRKJpfDRy4JJyv6e8DHXDG5VQyvDtt6F2cerlu+ZFCHqzOCp1nbALXHtU
	 riPSVD753sOvXseoOVyA1DmZiPSG9UsxUxz08UrLDEf2XJKOZeCOZwjGfXFs2yzxXU
	 RmwrwtzsA5ycRUptaq5v3Z0RwoZPY6Shg+IcBLfEDtBjozjj+XZk7Ah3CoKn/L1LvG
	 jSWFDo0yTLlfcE/azkapcIG5czY+fcDGXP9fEdjzfCQJrnDP7D3lK8xobqsa5od+H0
	 QPmrSxVsWtamQ==
From: Alex XZ Cypher Zero <me@alex0.net>
To: xen-devel@lists.xenproject.org
Cc: Alex XZ Cypher Zero <me@alex0.net>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/idle: Implement support for Meteor Lake
Date: Mon,  7 Jul 2025 20:30:39 +0100
Message-ID: <2a647ec92d9a66164029c5f8f3c7c8e8f1e06f18.1751916639.git.me@alex0.net>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDEzMSBTYWx0ZWRfX85Eq5y0O4Ome
 GKNnoMZK465SG8PRwnyyF4kxk7jXvdeCYsemZY3ig9b5x9Fil0SYLaH/+8lb5SwDP2oP3liAvBj
 Pi/XWYGVvrIfczA1kxxpkqgU8Eu8OvsVPWdb5wA5+dLPFDXwqSjLjjVN++MRJYiTmYgJdwEMeRN
 VpmSDXstyq4/QaxPIwygNF4nVHxz2MugPGSNS9j1KIVxsl8DorKhhHDR5NJ9iSu2n5EZgb12Nnu
 zRUSjcOwu0mGpDMLksRxteqBo2Ymd+LYuUBjO1sehioy8yBRCMl99VVF4UQAcsyO+CtjOYJO8=
X-Proofpoint-GUID: OT4x8hoO_Pps7CvILGmHAEPDXS0Iyo57
X-Proofpoint-ORIG-GUID: OT4x8hoO_Pps7CvILGmHAEPDXS0Iyo57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=775 suspectscore=0 mlxscore=0 clxscore=1030 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2507070131

Adds support for Meteor Lake C-states. As the spec is identical to Alder Lake as per the Intel specs, I've reused the Alder Lake codepath.

Signed-off-by: Alex XZ Cypher Zero <me@alex0.net>
---
 xen/arch/x86/cpu/mwait-idle.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 5e98011bfd..c8bf58b150 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1148,6 +1148,8 @@ static const struct x86_cpu_id intel_idle_ids[] __initconstrel = {
 	ICPU(ICELAKE_D,			icx),
 	ICPU(ALDERLAKE,			adl),
 	ICPU(ALDERLAKE_L,		adl_l),
+	ICPU(METEORLAKE,		adl),
+	ICPU(METEORLAKE_L,		adl_l)
 	ICPU(SAPPHIRERAPIDS_X,		spr),
 	ICPU(ATOM_GOLDMONT,		bxt),
 	ICPU(ATOM_GOLDMONT_PLUS,	bxt),
@@ -1386,6 +1388,8 @@ static void __init mwait_idle_state_table_update(void)
 		break;
 	case INTEL_FAM6_ALDERLAKE:
 	case INTEL_FAM6_ALDERLAKE_L:
+	case INTEL_FAM6_METEORLAKE:
+	case INTEL_FAM6_METEORLAKE_L:
 		adl_idle_state_table_update();
 		break;
 	}
-- 
2.50.0


