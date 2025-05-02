Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1C4AA7D25
	for <lists+xen-devel@lfdr.de>; Sat,  3 May 2025 01:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975165.1362814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAzvx-00047J-U2; Fri, 02 May 2025 23:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975165.1362814; Fri, 02 May 2025 23:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAzvx-00044p-Qm; Fri, 02 May 2025 23:36:45 +0000
Received: by outflank-mailman (input) for mailman id 975165;
 Fri, 02 May 2025 23:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3DVg=XS=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uAzvv-00044g-Sz
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 23:36:44 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2412::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4934c938-27ae-11f0-9ffb-bf95429c2676;
 Sat, 03 May 2025 01:36:37 +0200 (CEST)
Received: from CH5P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::6)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 23:36:31 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::b0) by CH5P220CA0011.outlook.office365.com
 (2603:10b6:610:1ef::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.24 via Frontend Transport; Fri,
 2 May 2025 23:36:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 23:36:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 18:36:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 18:36:30 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 2 May 2025 18:36:29 -0500
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
X-Inumbo-ID: 4934c938-27ae-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNQC7lzdHXfn8QCHXpSMeqlimZ08VRbiuND9Qj5mIa4G2zQwBurhl1NLWA3e+bQidoyyHyZLrfGc93SNhTOKw6MxmoGtjlgwINJ8xmhA7BCtFLQ2U01hjJMZfQM5SpBsZfJgCWq+Vv/8bf+SHCDX6hTsWUIckGxu80BVY2ZA2TOB+bcTdepvdtA44q6GWp4k8aRCQIFhhe/1ySvK/XPsDQYmQTHBItP/p5FmW2MfWFVOzy68f15HDTZ3qGsqnz5CAzfkh+4oNKbhxj5TgTYh9W6SFy0hsma2qIXlq0ZR8+hKZA5m+Tb28WUfUOcewiavaEl04XtTUTb0EozYgFnjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDhSAjxu89amv5bVNg7tPY7ct3hZuS2WDDY759go5Ck=;
 b=iWVNv9kIE2gaIwf2GjT2ViPazFFR4yc2iZnjJdFnvfDoWfDW+dVF7b/QR3aLlaUs3YCmI2rEgQ1d3ThnPgswJ+qrLPNxZqBjqwQtdCJnjOetqUw44lqzkCBWnUq2t4OMRega4udzLYDaWSEHpxUV1T5nCJ3xCULehp17s1fZUN4acFaZ6D2HJ6Ky4rueGDeK3JqFcxVvgBJoLSVv6CKeD8FYpl/aSRswelrLoeFseebRKzdLJ13WJ/v90EZ/kGrmGC1w5p4UcBtCRIUOtMwESlkPE7sxJgcsl4yd2zCUx3CEpJZuQG+vzm7YLT8DuJz0p6D4eeDwCITK/Y9O1dw3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDhSAjxu89amv5bVNg7tPY7ct3hZuS2WDDY759go5Ck=;
 b=2HOFNf8epZweSP/qHlF9OqQ4ExLUQZdqweyf1IryhNIpG9CESyJmII2Rig44xI71mwKHhlUEIBuf0yzV3VCAjw5c4HCietPULxvluXq1tIgE8UiUzd+4NP+HH2Cuvpix4U3R+DIFO1Mp4UuhRS2SX+YApbPSYhwXDRqZHTy3F+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 2/2] automation/eclair: tag Rule 19.1 as clean
Date: Fri, 2 May 2025 16:35:35 -0700
Message-ID: <20250502233535.3532279-2-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250502233535.3532279-1-victorm.lira@amd.com>
References: <20250502233535.3532279-1-victorm.lira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f599af-784a-4bc4-670f-08dd89d22ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Diw+Dxtka0iLHxYdFFyct5MSiSRWEd6iTV5auNfkTZjnILn1e9TBwuJ+Af7a?=
 =?us-ascii?Q?lrBVZEufRl4nwhbN93Hjdca0J5gYnYjAXkHobuProdcS5CpOIh+z2ecHh8zr?=
 =?us-ascii?Q?UYVbHM6ZY5vLtlUlq6fQ0NOI8ZxpEyFlezsPXRlhnAq1FH31pCCS36EAAHRb?=
 =?us-ascii?Q?pkCGTkVlozMWPwM24zRkBQzRSs7uX6VCf74OFpTLfY4VokptDjEMhem9d6Fi?=
 =?us-ascii?Q?drG4jIeV0v0afQyHusikQzqZGiwG5B1jUi4MpYAeSqdBcEUXrcOM23qEvWdz?=
 =?us-ascii?Q?52WEoDbnRmS8ciuOZYJkCc4RRsNGS14Vn7FBJX82x/kvmWvVZabkQ2MWXfn9?=
 =?us-ascii?Q?2+ecgxLxx4cFyeRQap0gUw+TFPupXqTExrW2zQz3n+OIFpWV2/B7BHbJw2MA?=
 =?us-ascii?Q?D+2Qfm5ExSD0dfd9TZE5LuxS4OHgDIIq+FTmV0egfSxl1BSYOFS0MrJMP24v?=
 =?us-ascii?Q?2bvDD4AOyddWtTiuNMBjqwilDJqLn6np+7wxjMDr9aP0rGslgWfNBisU4gY3?=
 =?us-ascii?Q?cT344q+8ehz6sW3qx355F5vDLZzUu1cKUzTCUaNLL3gCmLaxayYT/W9RowXr?=
 =?us-ascii?Q?4nrJIwAXCiu2ixekqlvgB/aPw81C3orj301DSa7e8U9sSZ5G9hj0XVjbzg5s?=
 =?us-ascii?Q?fynfpEQ/786bALGFBMzj65P34xZiKyKgPCvbzF+H8JPZCatcx3IcYWOwgerO?=
 =?us-ascii?Q?tHhAvFWOpOGTto+aXXpdfdMnAqerdWCpEPxpdVvJV1j5LPtGd0HU5K5yE2HB?=
 =?us-ascii?Q?j5xA6ZW9HxDAnpvA4ES0ywQS8+98+NbSp9g6Ke1xG+QFlYTIs8vtSu4qHNU4?=
 =?us-ascii?Q?KdmXeoTIUydt+TCKZfFK1FQkrMF/0TAbcA+HILLihxhe13FVakow48lIR6wX?=
 =?us-ascii?Q?RvTnFRarlPdiMT0YkHJOumpfIjOdta0qo7YeEhRfOpf+tHCGEFg7E/MA4Ntw?=
 =?us-ascii?Q?arcXZZqDzguijHBnN8eiNH3Mg+Q90ojtTLs3i3QnJPdAE0z7MaRU2XbMX0Pt?=
 =?us-ascii?Q?9isDBIJ8+5Jx8B0E4nh7DCdP9AxrXJ9UbFPYrQ6PGN99oUk5hy3UG06AvBeq?=
 =?us-ascii?Q?NGOl7fXHxJHMK8LKb4mWt79g04McnYVXKOnjvydpzFkw4ZAp1w9rSXB/BTi9?=
 =?us-ascii?Q?cJbsMCeDtzdA8Z1HtiQQx75tDemPueIgqOCdXdH1vTwY4ev31w0Z/2pMXoDT?=
 =?us-ascii?Q?+6IcmfuW/OugqDsYLfkvIKS3JOHDjn35NgiyuOZpqzpFoZwV4w3E12ZP6VZV?=
 =?us-ascii?Q?CO5uGeqUtA/z1CoDWCCaFjywZdevrX4Br81lkadDpHBt9xhIzDP6WPZdEcJw?=
 =?us-ascii?Q?wCdX3mgLZsirwPNM1ZIAd0D3iPKmiUkCfINKpixXshJ2FQBIuREItUK3891S?=
 =?us-ascii?Q?3/xOZN9p4LcNGTlUryALzDPgVuJyLLZehZkQkGfpfrrXmWe4o9ZtiZ3MRxyz?=
 =?us-ascii?Q?S915CLS+acv1IdiGmRmsJ7PLqVeSTdEiyWm44kZ5seXHV62ei+fAy8VwQetY?=
 =?us-ascii?Q?o7lu4q+vLIhejgO3+8lcLekLAz3Nf+t0ROFw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 23:36:31.1748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f599af-784a-4bc4-670f-08dd89d22ae7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458

From: Federico Serafini <federico.serafini@bugseng.com>=0D

Tag MISRA C Rule 19.1 as clean to avoid regressions.=0D
=0D
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>=0D
Signed-off-by: Victor Lira <victorm.lira@amd.com>=0D
Acked-by: Stefano Stabellini <sstabellini@kernel.org>=0D
---=0D
Cc: Andrew Cooper <andrew.cooper3@citrix.com>=0D
Cc: Anthony PERARD <anthony.perard@vates.tech>=0D
Cc: Michal Orzel <michal.orzel@amd.com>=0D
Cc: Jan Beulich <jbeulich@suse.com>=0D
Cc: Julien Grall <julien@xen.org>=0D
Cc: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=0D
Cc: Stefano Stabellini <sstabellini@kernel.org>=0D
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>=0D
Cc: Federico Serafini <federico.serafini@bugseng.com>=0D
Cc: Bertrand Marquis <bertrand.marquis@arm.com>=0D
---=0D
 automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/ecl=
air_analysis/ECLAIR/tagging.ecl=0D
index 1d078d8905..dab3c51faa 100644=0D
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl=0D
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl=0D
@@ -78,6 +78,7 @@ MC3A2.R17.5||=0D
 MC3A2.R17.6||=0D
 MC3A2.R18.6||=0D
 MC3A2.R18.8||=0D
+MC3A2.R19.1||=0D
 MC3A2.R20.2||=0D
 MC3A2.R20.3||=0D
 MC3A2.R20.4||=0D
--=0D
2.25.1=0D

