Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52936A99744
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 19:57:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965075.1355728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7eKp-0001pa-9e; Wed, 23 Apr 2025 17:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965075.1355728; Wed, 23 Apr 2025 17:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7eKp-0001kI-4s; Wed, 23 Apr 2025 17:56:35 +0000
Received: by outflank-mailman (input) for mailman id 965075;
 Wed, 23 Apr 2025 17:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8j8=XJ=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1u7eKn-0001gW-PB
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 17:56:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2418::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49271543-206c-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 19:56:31 +0200 (CEST)
Received: from DS7P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::11) by
 DM4PR12MB6086.namprd12.prod.outlook.com (2603:10b6:8:b2::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.23; Wed, 23 Apr 2025 17:56:27 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:223:cafe::90) by DS7P220CA0017.outlook.office365.com
 (2603:10b6:8:223::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 23 Apr 2025 17:56:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 17:56:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 12:56:26 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 12:56:25 -0500
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
X-Inumbo-ID: 49271543-206c-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMeC8EMm93CB3j9yZAx1ZNAN05KRa1QXO+7aKPec/5DblUkqhYPufz92XAlmShLmqe0edrlxpyg+NN7U7HRYpGEe1ZsycXLpJSMXzpfXFRZy2VQsCgUCfl0bZNbXId0y3NdIJprrjxhjpUxXxbyr150K5AVGXB5noR/zRJDqUgDmy18ATBZBWHdhY8IXH6yjT26MzpZ87JGyU766/7pd8fg37Fwgdlj1hKRkvlLUI86e0h79DfgTV9tKO0vA2ZI92uD2SW096Up/G/HjeyclOl9mghFJhL8zVB1KjuQZvvN0wSfRsxXCu/4uDoH17UGOeWQv8gLN6YLGrJfVZQjmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFJyvJXjhiq9kjUtLsOyrZHJ+xeH+8MdMFEtKtz54do=;
 b=Ct1+GduZNDXvE1rDmQnhnR/0LtR45wjE2bI4h4Ehw+H3UwpqSabWHmpcTMeJAUhzMArjoZLtkJysFZ+4n0jozqILf0chQdiBL1KPkOcQdhtKGk7lb2cvbA48Xekb+mtnHvCT4u2/95IiNccfVkl9ZjPvfYol30kp9qVWkRKIZUAsZ7DDKV5TmSaw0PE6HHJDrwcmgR3qq6T/Shd6LyKJMcKvKLu8bmPOb3qmg+vWNF+T7BokUo/ASuAV80s5/MZNXfDdtG+tb7KIgLZVBLB0G3SfAxrruy2XfVf4fcM6egWJVicjGiNhd6w7pdk6xeRkaRV3faN61aSzKKUl6LNxhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFJyvJXjhiq9kjUtLsOyrZHJ+xeH+8MdMFEtKtz54do=;
 b=yMyRG/BwkYgVpkGyM+P/VpPq22nQy01dljIgcgmPyRTfEeDtjY2+s4rTFn7Is4RoOLoX2KseDLPOPYqe+fLAQeHYesGzorQTDXIldnSYkoilWh8LCLk/4opG6FxKci2QoiSt7vIxJePZ/+rBUglorQ8ft+S4wrQuZnQF7pjFBPw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Victor Lira <victorm.lira@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v1] misra: add deviation of Rule 10.1 for unary minus
Date: Wed, 23 Apr 2025 10:54:29 -0700
Message-ID: <7c7b7a09e9d5ac1cc6f93fecacd8065fb6f25324.1745427770.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|DM4PR12MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f1df750-ae0d-4503-884f-08dd82902b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHRzY2pZejZGb3ByeFVHU09ncnMycDJYTFRiUGI2cE02U3FmclZoQjFhbzVy?=
 =?utf-8?B?dGR5SXk2emozYXk5Z3MzZlZ1Z0hvTE9BSUNhckZGc0l2Y2xkU2NTSElDZVZD?=
 =?utf-8?B?andLQnV0eitNUkFXamdxNmVockpkYmxtQnJLc0pJNG02MW80NDdZd1NGdG5G?=
 =?utf-8?B?eFBkYVBjTmg0TmFUSVQ2NU5wMHFObjlRSmVlM0VTeTVQcFF6NVVac2xaTnBN?=
 =?utf-8?B?aTdTMGwvSHQvQ2IyaTJtL2UzYzBkcm53eHNGUm01TXdFRGNGTTRUdFEwaHRP?=
 =?utf-8?B?ZkRFUmVPbDhncWNzSk5mZWVwdnB4bDVzekhBTGRTOGNtVEtxbzBJSDRQaFFv?=
 =?utf-8?B?RFFnaDF0MWx3Z3BjekUwM3Q0dEEvb1BlZ3oydXh5TXp2THhWUzJUR05rdnUz?=
 =?utf-8?B?Z1ZSTmpITTVlTERoSXBqb1RVbWt0enQvRmpqQXQrU3p0ZVhrTkhoYVFUQmo4?=
 =?utf-8?B?WTQ3UGxPVklBQlJ4NExGaThBME9ueXBDYWlaNjhEemlrQWIyOW5EbjVueVZN?=
 =?utf-8?B?bEdBRHJnTk15Y3NYKzJFbyt4ZXZYZW94eGQ3MGI1R2Y2MUNXZXE1MEwvRy9E?=
 =?utf-8?B?QzNOQ1dTUWRydWZpMnpkbGJZNGowNENSMkVpbjY2OVoyZFlTVTVTcWVIa20v?=
 =?utf-8?B?TkdtbEJrSmRpeWlKbXB5Y0FkdzBWcXFDR2xncHRrajdIRUlqaU1IUTFTaWdi?=
 =?utf-8?B?eFl4UGdvR0lCRURUZnZKeHlZM1pLZy8xdjFJdlhoTzc0SmdYS0JsZHVSR2dD?=
 =?utf-8?B?Z0lJdk4xc3NLcUxiRXppOXBBWENGbkJnd1dWSGFNaGZHWFVTbytUK0YwOUFY?=
 =?utf-8?B?NytweW9mSmxyMzdtaTBzcWhLM1A3RDc1L2hSL0gvQVl1TTUzVDJjTmRvRnhR?=
 =?utf-8?B?Mmx4VnlQaEpoeko4cjJzVWwxRS9rRFl1cFF1M2RrK2VuT1RhTzdOWmxNanl0?=
 =?utf-8?B?Z0dNamsyOXg1aGZHbnpkN3VxVWgyS0oyQWR2c0N1dHNUWXhQRGRkTjR2K0Nw?=
 =?utf-8?B?Z2NVWnozaG5VUTUrSk55UloxWVR1NXk0U3dNRjF4cnVMa3k3aFMxaHlla1k2?=
 =?utf-8?B?US81Mmcvek9XV2JkejZYWm1tUDNZd3Y3UlVHR0p2Snl5cjR4RGdINjJ0Kzhj?=
 =?utf-8?B?c1NHcHUzaUo3Y0hlb0VPM0ZVK2N1ZVdaRHlTQ29KWm03dmp4b0psZkZJeGFk?=
 =?utf-8?B?ei9GUFdaOXFlZEVSUklSaXNqUzA2SDhjUWRHTGtBWWh6U3VhejJ0Wmdxdmly?=
 =?utf-8?B?N3F1ZG83bW1aMFNHREV4ZWgyN1IwSVRlSVpDV3pNVjhFTXFmRGkwMXZ0cHNJ?=
 =?utf-8?B?SXlzN0NWUHRDb2ZQK29ueDVmNE95a1F1SWlOSVFtV3o4Y1luTE5XT3dZZUQz?=
 =?utf-8?B?ZTFCUmFKS2lxMUdCMTZ2aWFhRkVmWUZlYzNZbEFTSzBRWFNNNkdxZllaT2da?=
 =?utf-8?B?WUNyQ1o3T1VtejFFSVZaVWJUc1ZHQTdXWHdFZm1MMXZRRU5sdnBiOTNkUWpw?=
 =?utf-8?B?ZnlwL09KWXp6cW56SGNlKzJ1Y0tyc2xmRDV0Sk5rZlJlVWdTaElUeXlPdU5a?=
 =?utf-8?B?ZTUxb1ZGeWJqS0VROHVFb2tyMkZHNUhJdXRhdTZLZG9namExOVNmOWFpRTNz?=
 =?utf-8?B?RGY1Z3ZrTElhdHRGbGloY29uQnZJMTQ1eUsxME9MUU9KOEYxRFd1TUxmWUFH?=
 =?utf-8?B?L2k4bFUrUkhycDVIMlFkc01vK3FnakhQTjREeURZYnV6TjhrZCtpcUcrQWFp?=
 =?utf-8?B?V0hGbHN4dGNzTG5IWmR3ZzhLeU5LOUVzQVZ2QjdQNzVITFhNMHhUL1h2Nk9M?=
 =?utf-8?B?THFUMWc1Z3V3ZndGM1pzc3gyS2g3bTNxbHZibTFLWXZweEM5dnZOT1l5T05z?=
 =?utf-8?B?dGptYjh2Q3E1NUR0eml4VnJXQ0svRnhLQjQ2ZTFtRy9nMmFMN0prUGo2QjBF?=
 =?utf-8?B?RTRTVEtya2xOM2xzbmQzbnVvMURrMng1Vk1udkY3L3M4MjJmKzA4NlgrdVd5?=
 =?utf-8?B?Ui94WXZoa2NRSHAvengrb281R3hTU0s2bnkwWEJuOGZUV2xYQTNGTERtUHdB?=
 =?utf-8?Q?SC/dfI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 17:56:26.7174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1df750-ae0d-4503-884f-08dd82902b32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6086

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

MISRA C Rule 10.1 states:
"Operands shall not be of an inappropriate essential type"

The unary minus operator applied to an unsigned quantity has
a semantics (wrap around) that is well-known to all Xen developers.
Thus, this operation is deemed safe.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Changes v1:
- add rule title to commit message
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 303b06203a..2cfce850bd 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -347,6 +347,12 @@ constant expressions are required.\""
   "any()"}
 -doc_end

+-doc_begin="Unary minus operations on non-negative integers have a semantics (wrap around) that is well-known to all Xen developers."
+-config=MC3A2.R10.1,etypes+={safe,
+  "stmt(node(unary_operator)&&operator(minus))",
+  "src_expr(definitely_in(0..))"}
+-doc_end
+
 #
 # Series 11
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index cfdd1a9838..c5897e31c5 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -321,6 +321,12 @@ Deviations related to MISRA C:2012 Rules:
        If no bits are set, 0 is returned.
      - Tagged as `safe` for ECLAIR.

+   * - R10.1
+     - Applying the unary minus operator to an unsigned quantity has a
+       semantics (wrap around) that is well-known to all Xen developers.
+       For this reason, the operation is safe.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.1
      - The conversion from a function pointer to unsigned long or (void \*) does
        not lose any information, provided that the target type has enough bits
--
2.47.0

