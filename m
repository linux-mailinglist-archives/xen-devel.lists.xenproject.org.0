Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APeFHgQDeWkdugEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 19:25:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90DE98FB4
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 19:25:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215146.1525403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vknjt-0004UM-CW; Tue, 27 Jan 2026 18:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215146.1525403; Tue, 27 Jan 2026 18:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vknjt-0004RW-9S; Tue, 27 Jan 2026 18:24:33 +0000
Received: by outflank-mailman (input) for mailman id 1215146;
 Tue, 27 Jan 2026 18:24:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yvtj=AA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vknjr-0004RP-Rq
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 18:24:32 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68aa1d4c-fbad-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 19:24:26 +0100 (CET)
Received: from SJ0PR03CA0061.namprd03.prod.outlook.com (2603:10b6:a03:331::6)
 by SN7PR12MB8102.namprd12.prod.outlook.com (2603:10b6:806:359::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 18:24:21 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::21) by SJ0PR03CA0061.outlook.office365.com
 (2603:10b6:a03:331::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 27 Jan 2026 18:24:19 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 18:24:19 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 27 Jan
 2026 12:24:17 -0600
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
X-Inumbo-ID: 68aa1d4c-fbad-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEUyAdg37CmUcARjLa3U14+XYvct/XIMbH+DwE4z8tGqQ8FvRw0Fe4MUHZoTsTQ+xzjDQ9GR7SvbHBJR3GeWy4Xxd0yJPrnxIq5AcoyVqWIRhJsEMjjJu9sG2z7rGAHIFiAYFdz9O8GCxg2I8xwfdV8SIHUq1rh0B28QmscM2QVZyWv1l5rmWpNf4DbMDD+v25BDNmQk8QtK9WhNxprDkkzvM1pBobi1MG4i0xVp08onwpmo5lejEDHvLrv4D4NOGg7PCdQLAnMedGOacy+iEQIAUlZ6nG+hULVdYMgFDatCBBU+4QdPgLKDt6ST/fM/+U08LrZtiBc17B8EjVtLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IML5BFKvjfdck5Q0nv/+mI7U0qt095NbOXoMVGFN7dM=;
 b=GpQA4ldnhmnZX49GxZI30J9W0g1GTRZ/qEeUxL4Foec18cGNtZLewCZrnXlYhT2wPMaHkv5rtbOu1zXiA4XbFJQNHIMgLew2aNC80mv5NTjHei5os34y13pVx7mkb5pqxvdLp41eQld22IlItebots40RAzt4TFcJWMTwq6Fx5kVJSpcwu2lvBBBuz9fOECdzSDAKw5hdDYU0qOiLYuKJIPDVhTdAyzlTaxzTurYMeRMOQ0SBoo2yphdjc3dvQ55RTbr1ZsuzsH5BRoGZF6CeYfI9nn1wQcFBn5RlQaeu0ARAfevZ9Unv5DR32SBLdKKM4OmaCzz6FQ+SAAtmLmfBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IML5BFKvjfdck5Q0nv/+mI7U0qt095NbOXoMVGFN7dM=;
 b=w8anWturB9F97bjYufypLkLDqbXgl+yclulJyflY68y7vcGRYrVu97EyrwDQjHHcQo+jLuibrx7qTWzL5Mlgtdfiu6vZon6YmJwfmfCXp2UrgJHnmc9yDe26702ldYGXI9DjzK9wSg7iormWUIP+f/HBREBVmaX+9CeDTvZeOho=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH] CODING_STYLE: Establish a policy with regards to copyright notices
Date: Tue, 27 Jan 2026 19:24:01 +0100
Message-ID: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|SN7PR12MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: cecabb38-6dae-4c7b-8e60-08de5dd149b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/SgSgePDeHWcMJers+hznzLutC69jNnEpRtWu9FCYrxhk9ev61Ca/8t/l/5I?=
 =?us-ascii?Q?s6VkSBHNdNvFaggqXCmdqdPnEoEHp7yMqaMZYc+dcms4JdsofR2vnoerGwqc?=
 =?us-ascii?Q?GNaJg4N6lgP4K46M4XQH8q25zIiBH+YvKvz641RkUnhJt74ZygbIYkzzBIkP?=
 =?us-ascii?Q?tpqbGclXFCzgqhtcyRJHxwcYyMOnWpOsSY4MYZFBZypgUO524QsvIL4WLTn6?=
 =?us-ascii?Q?bDZgSaPOXH/zs3OM5Rzoo/aYK5x0VrJB2UXZDSAYTvpgspcrPBEtsYTTtaMx?=
 =?us-ascii?Q?MwewUw64Y8JSvgZ1ORx2esaZqhr2+tmINymnXHjwTNAmL+XkHvC5Gs1WQ0Ui?=
 =?us-ascii?Q?dC93a1+/9Rr47DCThD9gSYM/3m8B+Omp7x4Ik4banKlTALWuRg0xJQ1nIv0k?=
 =?us-ascii?Q?pMPyClKVx4HsU66b3MBQtWGXqeVRznguISCA8VFkWnRRLZIvTkve+j5zV4MZ?=
 =?us-ascii?Q?GE6JKWDcl2b79tbTTjAmzBCfOQUfZmsBmOOP8oNHeirRicBowag/8WsQtmDr?=
 =?us-ascii?Q?+/JMXAeHcR5Guv51BebnFKnwWp57xsf8zIFEBswtGZp6oRRCfbj9Ih1Ig+3t?=
 =?us-ascii?Q?8gcKQxjJGmZ6y3SR10gw+1x42ueF4cWbsvoMIESX1EXoDK378kAeCAOIqXrB?=
 =?us-ascii?Q?0AKqkADebotC23zunA+agibCxvfQjBvsGVQQcOzAF0AUifBOmjrTZ/Q1NR36?=
 =?us-ascii?Q?oMZv66FemkKjYNcFbiue/AKwPUgjc9CumCUM4bbJEWMUZAYBg5rd/8KNaNV6?=
 =?us-ascii?Q?eogfh1gfzifNMGebpNhbc6yFoVzFwHOGpPpl3EeJjytz1T248g162z4WGVrE?=
 =?us-ascii?Q?o7JuxR1DG6igKtbwnzbJrvCei+r0EZW1sRLpa57aFvXhYhiqzNze8Vv1oBTC?=
 =?us-ascii?Q?E8LmRH3jOVnPimdfS26lXQmWISUj4mRacr0GxyVV82WWdijIRyZauUA0M7sM?=
 =?us-ascii?Q?9FON1sYaWxgqEJiOQgvVhY7se2DVKRMPDRfbSPJuW+tIfdoX/WxUYxsq9sdy?=
 =?us-ascii?Q?3MHD+w3QaGwtzopgFRl9jK8dYRjhqiSMkN7c8EKeVKO/9xR62QKlUGFDCGop?=
 =?us-ascii?Q?f32gun+yLocGxaDF6i3Ov5dLVJAgQ4snTl1FPARwwNWm4v5EAi7eSPxfTzgi?=
 =?us-ascii?Q?JUzDp59Cx8R2gjPLM2EghMPj0HhCSU98t2c4M9gZJ1CLCAx0Lfa+R2hNm/6d?=
 =?us-ascii?Q?CfKiZJcLSD2YZQcwC76dTNmkm+9DA7MHzHeom1W8IMEYDvv+DTJbQtVyZGaL?=
 =?us-ascii?Q?lMPdWxQ8VUCfIHj2o9K+VQ/QAVOan0MjLcHPlRGR0boRxtcjnv+wJkfATFq7?=
 =?us-ascii?Q?abhLoTrs9n27oRobcd/QAY6758l8AXqhUPJDHWXeKSjo/t0w6gmz9LCH01Fv?=
 =?us-ascii?Q?DmagJMfWmUXWrrPF1zhraWCtJ/5hMNYch4Xhof7bYjhezaTwkHq0DSXDl9xu?=
 =?us-ascii?Q?yZHlvU//sk1jF7Dw2lS1VTez/YpK37d8k8KJINsVPkfGRR2fE5HclVbqY23P?=
 =?us-ascii?Q?t0ICHJH/FIjjFnDeAeSiT85K9C1KAtUuZA+MrflzjGhhKksO3jgJTcuN21nM?=
 =?us-ascii?Q?mV9KCg4PW6A2OPSzQL6M0s4kUhUohYFcgqyPh72payzF8gLGpdh9T+nAVvax?=
 =?us-ascii?Q?G5EMpPD8/lrc3QgdsLcnOsk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 18:24:19.7963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cecabb38-6dae-4c7b-8e60-08de5dd149b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[llvm.org:url,amd.com:email,amd.com:dkim,amd.com:mid,lwn.net:url];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B90DE98FB4
X-Rspamd-Action: no action

This patch modifies CODING_STYLE to severely discourage use of copyright
notices when their presence is not legally mandatory.

Copyright notices are redundant on commit, misleading from the time the file
receives contributions from anyone not represented by such notice, and actively
harmful for attribution by the time the original code is long gone. They are
plain wrong when added on code motion.... the list goes on.

All attribution worth keeping is version-controlled through Signed-off-by,
Co-authored and the like, DCO and the cumulative contents of git history.
License banners have already been superseded by the contents of licenses/ and
SPDX tags.

Other FOSS projects have already moved away from explicit copyright notices
where possible, and severely discourage their use when not.

Apache and LLVM take active issue with copyrighted contributions and Chromium
takes issues with copyrighted contributions not attributed to the project. Some
Linux subsystem maintainers already frown upon copyright notices too, even if
it hasn't reached the point of being a mandated requirement yet.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
The actual changes are almost verbatim from the LLVM guideline, but it's not
exact. Wording can be adjusted as needed. I care about the core of the proposal.
Saying "please, drop the notice" on contributions where it's clearly not a
legal requirement, or have the contributor state that it is a legal requirement
and why. For fairness sake for all contributors to the project.

I'd prefer taking the Apache approach for new contributions, but I want
some discussions to happen first.

Thoughts?

Relevant examples:

  - LLVM: They banned copyright notices, unless part of a vendored
    components.
    - Links:
      - https://llvm.org/docs/DeveloperPolicy.html#embedded-copyright-or-contributed-by-statements
    - Relevant quote:
        The LLVM project does not accept contributions that include
        in-source copyright notices except where such notices are
        part of a larger external project being added as a vendored
        dependency.

  - Apache: They banned optional copyright notices and relegated
            mandatory notices to a NOTICES file that also contains an
            Apache copyright notice. See links.
    - Links:
       - https://www.apache.org/legal/src-headers.html
       - https://infra.apache.org/licensing-howto.html#mod-notice
    - Relevant quote:
        If the source file is submitted with a copyright notice included
        in it, the copyright owner (or owner's agent) must either:
          * remove such notices, or
          * move them to the NOTICE file associated with each applicable
            project release, or
          * provide written permission for the ASF to make such removal
            or relocation of the notices.

  - btrfs: They are highly discouraged.
    - Links:
      - https://lore.kernel.org/20220909101521.GS32411@twin.jikos.cz/
      - https://lwn.net/ml/linux-fsdevel/20221026074145.2be5ca09@gandalf.local.home/
      - https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/Developer's_FAQ.html#Copyright_notices_in_files.2C_SPDX
      - https://lwn.net/Articles/912355/
    - Relevant quote:
      Let's say it's OK for substantial amount of code. What if somebody
      moves existing code that he did not write to a new file and adds
      a copyright notice? We got stuck there, both sides have different
      answer. I see it at minimum as unfair to the original code authors
      if not completely wrong because it could appear as "stealing"
      ownership.

There's more cases of other projects taking similar stances.
---
 CODING_STYLE | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index aae5a47ac2..97f80245ed 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -24,6 +24,24 @@ license, e.g.:
 
 See LICENSES/ for a list of licenses and SPDX tags currently used.
 
+Copyright notices
+-----------------
+
+Copyright for the code in the Xen Project is held by the respective
+contributors. Because you (or your company) retain ownership of the code you
+contribute, you know it may only be used under the terms of the open source
+license you contributed it under: the license for your contributions cannot be
+changed in the future without your approval.
+
+The Xen Project does not accept contributions that include in-source copyright
+notices except in the following cases:
+  * where a committed file already contains it.
+  * where a committed file is renamed.
+  * where such notices are on files from an external project being imported.
+
+The best way to track contributions is through revision control history. See DCO
+under CONTRIBUTING for existing mechanisms of attribution.
+
 MISRA C
 -------
 

base-commit: 02bbdda863697096b63e83c2c0a37aa167045476
-- 
2.43.0


