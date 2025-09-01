Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF1B3E085
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 12:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104377.1455442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut20v-0005nn-GI; Mon, 01 Sep 2025 10:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104377.1455442; Mon, 01 Sep 2025 10:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut20v-0005lP-D5; Mon, 01 Sep 2025 10:43:53 +0000
Received: by outflank-mailman (input) for mailman id 1104377;
 Mon, 01 Sep 2025 10:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5RBY=3M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ut20t-0005lF-I2
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 10:43:51 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:2418::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a9cf831-8720-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 12:43:49 +0200 (CEST)
Received: from SJ0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:a03:331::18)
 by IA0PR12MB8838.namprd12.prod.outlook.com (2603:10b6:208:483::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 10:43:44 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::75) by SJ0PR03CA0073.outlook.office365.com
 (2603:10b6:a03:331::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 10:43:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 10:43:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 05:43:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 05:43:42 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 1 Sep 2025 05:43:41 -0500
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
X-Inumbo-ID: 8a9cf831-8720-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oj7sykvF0xLMBJ26mQMmafupPJXedVk8RG08m8szZap3CGSh5IDK5iQjTQLQubz6/yU4rqW7y5y0tNr+zPyALliOhfcQrnTxxE26I0cUGqkUHYPHHo4Q5pPmOkwx3j+JgZBbYAoykmttPx97gfGBrGbQQ8mhoG9nIzTll9eEHuvTEGrGJVg4NH3rKxclK1PEhHtFruve0vx0L9mLp3Pv7LBT2RFx5zH2uzKv60Nt46WoDUaOfL7P2xscXVvfeWkbn0wMQoFhY8qCNS/z1K5nmf4QDrB+HRnEmvzf2PfyZ8lRoI6UXWVuCXPwXexaJN/sHLah3otn1XabLvKXg8Cqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tx7ZavVeNdWWSvvu3rYjzhhUoflye+ydUcxwgk7J/DQ=;
 b=SaH+3qc4Lqo5Fm7o64e3DfTVABchOoLZ9HlYAxNX0cfS4oKg72ysFJvabyYT5Aze5IoqbSl+DSKr1lCR4GB0VWW50VtHg3KuNrWwEFdbLZN1YSIAQY0pE7a2p8YR0R3KvDcLjS7yEYjUKco8U6kj+YJsBLqkjHdlRiRbgt0IDCJb1Xz2HzOSx+ScxQaosc7jSC17Z9qHNDnjjRPSUVeErWyJY2xXSriZXzRr/vDhG1W1LULiz+TR6xzvmPcr5APO/1HEi2G+4Kz7TWpUPtSFUmBEvZp8WEEFty2Q140y8xC1HS/ccHYahQZJmdjOCNo5GEfz4XVmm+o12qcluUSQuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tx7ZavVeNdWWSvvu3rYjzhhUoflye+ydUcxwgk7J/DQ=;
 b=P73NeK+OmK5/DzkQiITW6gygAzi5BfimA8LgBJvkQqvzk13IS2oZjE/wFP56M5XjmebD2Z6wwzqRe5HlCv940/tZ6cW3Yr5ATuO2fqIyJ8RfNaW/0MP4umD44Ln+Ifp518YbmXgFtJJJT5W8sMS0e1MvzqCsNQ0MzoSCJ2FoG5g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86: Fix AMD_SVM and INTEL_VMX dependency
Date: Mon, 1 Sep 2025 12:43:28 +0200
Message-ID: <20250901104329.25693-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|IA0PR12MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: dc221514-e384-43ee-1149-08dde9446c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h/Y/hzhTgqDm/ptyQRlmWIa/GW+t0xK0xvi81euE8EeMPmEZbWcy5EKUVhiU?=
 =?us-ascii?Q?biECAfoeiGBkjBJZ1UiV6E62Vsh9wwcdK0xh4ZUMcb0tLgpPxEW6qdlBiWxf?=
 =?us-ascii?Q?nQiFIh11CaL4vtZl8+EWB5l4av0T8AktF9rx+efwM+2wvfi0Xe9zF00/sDP8?=
 =?us-ascii?Q?rreARD9fMw6/d/Ppusw4Sj5ESDwiwK39PGn3U2ik+15C29dlw7ei728djQTU?=
 =?us-ascii?Q?Gybs1EWjoVc0AEVT5g7CoU9Z5w2MsbY6joMYcs+lEaWU+dy3LhZY9EnGgi3j?=
 =?us-ascii?Q?tTbhLP3bC3LVPGJriWjDVPjqfrS6XsnLY0ceAI0g+rLgLrjWriyX3WMj3yxe?=
 =?us-ascii?Q?86xhxeUCdA+gj1IQsMds1wwQyRKdaQHqz0oX8BFJukAvuXo6nK13M/D2M4zH?=
 =?us-ascii?Q?NL5lpEPGuQ/C4JdRAmHD71GWykqufXokocsSXfLNy4oTqKhsMwJUhaNJHDf2?=
 =?us-ascii?Q?06Bx4mxon7YspPJx4qh6z5kXNYidQbxf/Z1n8/eAIy0J+Uac1kwLfK5oXtpf?=
 =?us-ascii?Q?K3SrqNLXaY/3TDxw/H8B5XMrkterfjrkF8+fUQijnrXLW7570XOK5jw+XiJz?=
 =?us-ascii?Q?zf3+awJnx93fBChKJx0SX6vT96ap8GEkPBV8/qTb82LKQNRgxsEA4+iXdYHb?=
 =?us-ascii?Q?DSA0jS6iq+vMnCDpPAJKxekmmtVGvAh+4kcA+AzgqXjcDJktDh6Uizm1NGIQ?=
 =?us-ascii?Q?QxDXVy4ORKV+pGF0EO5sYLpTLZPhF3fe/jHetsR8YI3oSE1Zpi52IIF+i3Wr?=
 =?us-ascii?Q?VKbIwKodh24y49f368OUyEF+YoriP9DDT2trIgtYi5fTG9s0oOlIqz4yqVjW?=
 =?us-ascii?Q?FNmaHkZMsNWmFMT2bwA8EEhCQp1nGAn7zC3m/iZlOXHAG26HdpXcmCb3IIN5?=
 =?us-ascii?Q?BnAdbO81+rn+ZwchJL2JEIs1Nd3dNsGvkGOkhUL6j9QSEVyp/pTABQ96igqX?=
 =?us-ascii?Q?Aiwwz50RD7X9hKlEYTdbRDoU0lhNQ2egmpXwHZTpXIgdLvxWdHEEQCGQbBCI?=
 =?us-ascii?Q?w3Fzzt813y6+sAv5B/1uT0QJqrGmLENlYOhE17Yxc7X1k8KijJFc+uT2j+us?=
 =?us-ascii?Q?le3Q/xNMiHnURbNNPRc9kiDXaXShZESHtObqbr9rlXFPZuJ/bmiHgtfOqRlO?=
 =?us-ascii?Q?6fZuD09nn/jzV5gT2rrZieEEZ5glfgoLLS25bN5ahfrAJypmrNuT415UESbk?=
 =?us-ascii?Q?+SxTxM+pta39Wg5LoJ76tYdrWpA2jNrr0RLzNB+vNS1/hYJY3HgrUB0DhxIO?=
 =?us-ascii?Q?qONhR94amq551VaBZaFuhLsA0Lx/TqshGxdndutVs86A4Ye5XRMPlv9lFozI?=
 =?us-ascii?Q?zb24/z1L0DxU6wRxcdnCg6FrWlziAgKu+uYTRGyfUqx3vZexYRh1cHvWanp2?=
 =?us-ascii?Q?hGPYMo9FvkT/U97xnMrAeIC0EXgYbwzeUhcd49OigIxOsZTUuamlUhQrMPAb?=
 =?us-ascii?Q?DBEGlRuMLx7Wy9+W8IHZ7OUNjaymep0bWNFD2TLT3Nbxan4Vk4MQCi7MCedv?=
 =?us-ascii?Q?1eYCxpwI5EJB+YUobJflWaSsW6+OSeux99fN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 10:43:43.7745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc221514-e384-43ee-1149-08dde9446c37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8838

Commit e3ed540f2e9f was meant to make AMD_SVM dependent on AMD and
INTEL_VMX on INTEL. Such dependency should be done using 'depends on'
and not 'if' next to prompt that deals only with the visibility of the
given Kconfig option. This makes it impossible to e.g. disable INTEL_VMX
when INTEL is disabled (option is hidden).

Fixes: e3ed540f2e9f ("x86/hvm: add HVM-specific Kconfig")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/x86/hvm/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index b903764bda0d..c85889ea8642 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -16,7 +16,8 @@ menuconfig HVM
 if HVM
 
 config AMD_SVM
-	bool "AMD-V" if AMD && EXPERT
+	bool "AMD-V" if EXPERT
+	depends on AMD
 	default y
 	help
 	  Enables virtual machine extensions on platforms that implement the
@@ -25,7 +26,8 @@ config AMD_SVM
 	  If in doubt, say Y.
 
 config INTEL_VMX
-	bool "Intel VT-x" if INTEL && EXPERT
+	bool "Intel VT-x" if EXPERT
+	depends on INTEL
 	default y
 	select ARCH_VCPU_IOREQ_COMPLETION
 	help
-- 
2.43.0


