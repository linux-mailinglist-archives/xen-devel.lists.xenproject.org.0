Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB28A0433
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 01:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703700.1099515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruhfR-0008OB-VU; Wed, 10 Apr 2024 23:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703700.1099515; Wed, 10 Apr 2024 23:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruhfR-0008M9-SV; Wed, 10 Apr 2024 23:47:49 +0000
Received: by outflank-mailman (input) for mailman id 703700;
 Wed, 10 Apr 2024 23:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHON=LP=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ruhfQ-0007t7-GO
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 23:47:48 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e88::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baa886fd-f794-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 01:47:46 +0200 (CEST)
Received: from CH2PR18CA0040.namprd18.prod.outlook.com (2603:10b6:610:55::20)
 by CH2PR12MB4279.namprd12.prod.outlook.com (2603:10b6:610:af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 23:47:43 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::15) by CH2PR18CA0040.outlook.office365.com
 (2603:10b6:610:55::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.21 via Frontend
 Transport; Wed, 10 Apr 2024 23:47:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 23:47:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 18:47:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 18:47:42 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 18:47:41 -0500
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
X-Inumbo-ID: baa886fd-f794-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xz0aPTC7yJsBrSTqLXwv/Z94O00NmP8HaaJnsML+69f5Whu7Vg3cerIraViOU35SCkk+5Tlyt3C2tYhKCDgxTzrDzlcUMoQeQ3H6X4uGjnz7yXK/3QX6VORd9w2nPiV1v10Sf3A/VHpJR+D2LDjOkK5rhhCj/peKraxI7meVuD8eEQ8X14KeyKhDzrD/G5apNPGgOrH84yDXzNIlylqyElLXhbZ3wbzbGe8KSo/wOXSIQQ/zzOj4ksbHYrV6i3JUDqb+s40ISBwkJExQQXU7gl3FHW5ZExMN+slawp29N2sbv/+WCo20Cvxr2JpcxwLhDeRinoIiOo7shjKMLZASrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ot1zIKwUZdXj/ZfNnzvk1/bHE2ALpacyHXmCky+ZK38=;
 b=hZ59EtBCG3qm0fLNfZ9HtUV/PS4bt9dR+1oU8OlnNRmP6UNdkkDfQJfnJggmj41aj+1NyMkdCnf9r8ydumoAWwWTNpd+P44G2p071DF25YMThdajEoUEV6cVBm4rvUbM5m0Fw0bVmcawg2YchxAEj9LTNdYk0UAkz6jAC3AICeNPZ42z1PUR6PoTO5L5DNtadJ3r643Yxp93SsnE8A4qn0lHiOmSVJ0ZfbDQxMabKs/adISm72oKceU7k1A6nHGYhUuJFXuRnrqka1AUAqmVxbxAtzBzDePnMoUHv0nsVo7KwYy3QW3aIU2aB7v+HwhHvGAqNUvL79Tp2RvEZA+aaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ot1zIKwUZdXj/ZfNnzvk1/bHE2ALpacyHXmCky+ZK38=;
 b=Pb59rVsy8Hl9SXzfopfGZ89o7cJBf4E04Sb70Ra75zyWCDvTL0ObD2OrnDKwcXP46znhhu7py011uJmg1J/LuyA0blibdCBh2OCVcPq0HCIgN47rl+fJ4uYZKNcjQ+nMImt5fgpBJATCD1P0NSTRt/D2HP520J4AaQshbvk9dt4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	<bertrand.marquis@arm.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <michal.orzel@amd.com>, <roger.pau@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>
Subject: [PATCH v2 1/4] docs: add xen_ulong_t to the documented integers sizes/alignments
Date: Wed, 10 Apr 2024 16:47:37 -0700
Message-ID: <20240410234740.994001-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|CH2PR12MB4279:EE_
X-MS-Office365-Filtering-Correlation-Id: b697effd-5984-4c12-d294-08dc59b89d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gy5hwsz4WKY/cBQVoPO+rpKWhrSDjr38t7GoJcjtVOTSPC53WGHg8l+EnEPCYtugw6eH4c739Qosq/EAdVOVrZEQZsjZLuTvFSk09E1ACozBrd682hhUxPpm8SWz0U9prtNmMmPiBjxuz9Jmf4YH92KzlEFmn9Y3y5uOI6qBZ1d6+LD1jLoWnvi4u34C17Cz9ybAUwqBtNdTQdl1CBT8Nd44eaYRVsDe+z5UIvKyRLqvfUhgCFsW99fCG/n8ahl/quInbBl7nIDXrpn/63JtP5tF023wYgDJPqrtY+5Qd5Xmi+7eJ0N4X6ySQYfOwDX0PXmFFsSXOZg6zDOsYlCPgJ0wXFqVGzs9egukvSKMlOj0gq28Qd28+y+JG7cZ+aG7Ol593x9Mr+pXcmJcU81NRndl0A9+7R1zvUzdOusyzGNNqv3Z/hHkHQYThm1UTbkDDwYLntCfjF/dLiHct7oi5X9VlqorNmSDLXKKu5d1zzMNYA7DcfDcdIQvC6QH0/yJa5SlhgvuzABqodHg+I12AarEIEhKuXdDD7eO6NxoHY2wah63Sc7pX4qdXj2+7JdZCOOYNn59Dbm+SY6aupbEfYnvO3rBfNjmk4vM0AtfW5EOmFMdlS/TnJd7B4exkXFJh/kiH67CDlALM5m/QVya12xY4yqg2my+LjiiuZ1iS6lQUiV2Gp4XXbkG4wKDOpB6oh7uyC0TIkuwcrKaSy/Nhfj1QnhI0+AV8iNB+/pW/ngjYg6pLm/djJs5XPp37XeU
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 23:47:42.7054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b697effd-5984-4c12-d294-08dc59b89d4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4279

xen_ulong_t is widely used in public headers.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---

Given that xen_ulong_t is used in public headers there could be a better
place for documenting it but this was the most straightforward to add.
---
 docs/misra/C-language-toolchain.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index 5ddfe7bdbe..7a334260e6 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -531,6 +531,17 @@ A summary table of data types, sizes and alignment is below:
      - 64 bits 
      - x86_64, ARMv8-A AArch64, RV64, PPC64
 
+   * - xen_ulong_t
+     - 32 bits
+     - 32 bits 
+     - x86_32
+
+   * - xen_ulong_t
+     - 64 bits
+     - 64 bits 
+     - x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch32, ARMv8-R
+       AArch32, ARMv7-A
+
    * - long long
      - 64-bit
      - 32-bit
-- 
2.25.1


