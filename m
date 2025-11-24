Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD02DC82AB2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 23:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171537.1496566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNf9y-0006cm-D0; Mon, 24 Nov 2025 22:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171537.1496566; Mon, 24 Nov 2025 22:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNf9y-0006Wh-84; Mon, 24 Nov 2025 22:35:50 +0000
Received: by outflank-mailman (input) for mailman id 1171537;
 Mon, 24 Nov 2025 22:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvF/=6A=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vNf9x-0006MK-5U
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 22:35:49 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebf6fccd-c985-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 23:35:48 +0100 (CET)
Received: from BYAPR02CA0010.namprd02.prod.outlook.com (2603:10b6:a02:ee::23)
 by IA1PR12MB9737.namprd12.prod.outlook.com (2603:10b6:208:465::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Mon, 24 Nov
 2025 22:35:43 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::4) by BYAPR02CA0010.outlook.office365.com
 (2603:10b6:a02:ee::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 22:35:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 22:35:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 24 Nov
 2025 16:35:41 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 24 Nov
 2025 14:35:41 -0800
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 24 Nov 2025 14:35:41 -0800
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
X-Inumbo-ID: ebf6fccd-c985-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CenVZ4UmQYW6KO3cqjnZkmQOSbxGegoaBgy/5l9g3c/Ov4nAODVMVdU1yIdYlg2+SNR760MHZnoC05LfOcSgjvosebaQR30O2UXPMh1c3ytMbtQbRQqZd/dLvSvwyi2OTv0wm8B2hbiUExrzrF8yt8uC+m8aAjODHPzMBwk2BwGiLDhv+8DiZnDBPjUo/z3uzs5tgip0o4VFGhnltE8VJJWdU4QbkT1tB6NW2wug7KoDJrkd84umU2SgXCfBVbEZGm6m1osxuc6VSLKNLUvGvRDm0SBISlk2ZvcLEAP+eeVv6MmvkwCRNPJiQ9AqZuT/SR4RJv7szHJIZOACKsbSfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0V4XtSB4FPS0jb0XMxjmyRGmxM1LCYoYZuuHWV8i4w=;
 b=qxzhIk4cuCErrwa/gdplQTPScAHpIUpykfbBtdX4UlmRFJYkqypPrwInPwH1omdO66w8lO7CmuduHI3LEj6Uq+NImkmnuX1qcN1vlzTHZrMuNK/p9uPuGlk9S4pgSLQ0v6U+QhKRRAViXxSnTPayT5uMExeOyMl/bqQigNLn2cuCm9vQWdZ+EDmo1u/sBMM8F08RW2XO73hFcNqSUTrQXsjsbomZ9WdBeHboNsGzZya8KWR1Uwa/Aq+vxO+etGadIQIDMLGycWvZD7CiJof/Ta4VCNNJgwcJru+ziq7euBl989OKGecM8EqAHvZ4bvjS3NUckQlMDsaSVi+v0Tmx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0V4XtSB4FPS0jb0XMxjmyRGmxM1LCYoYZuuHWV8i4w=;
 b=lc/TyFA1nfAbeQiOjgbMqzFNAzs/R00s9eM8/+9BcuTkS0W6pAielpfTKAgrl84nVQ8+w5n4zWHwVdb8fIE/PdQAeLsS54T2nbMfjcxM7NA6uNWCYMWvQ102p5kcIQjGWUyr7bIkZs9588dmBlWV90fvFbEGfS0fXOVEdnoq1JM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [XEN][PATCH 2/2] xenstored: Add newline to error message
Date: Mon, 24 Nov 2025 17:35:33 -0500
Message-ID: <20251124223533.31613-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251124223533.31613-1-jason.andryuk@amd.com>
References: <20251124223533.31613-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|IA1PR12MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a11be7-de1d-4ff9-fb57-08de2ba9cd0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Jebo6iXKgO2GYoSQ75rR9HY3f4BHEwLDx0sGZJOeXTodG+wfl+wJt/5wyN5?=
 =?us-ascii?Q?4SS9GptkgmKUYlqQiX+I7KVSoUxpnyzPsxBVgpdVSZb5QK7dNnQ1dmjwyBba?=
 =?us-ascii?Q?ogKe7yZltnePPQ4SyCaJNU/cfuE7NTdG7tyfMCPFEVAIuLv/4IfXNdo9jZ2l?=
 =?us-ascii?Q?Hcz8YniZiiTNUliYkuRLfkSdYL2426osSfyHc8DjHjoaouanbP0L5yVb+lST?=
 =?us-ascii?Q?Swj26fqg2QRPOwajy7a8Hzd9OCR2DQaf1jT0rE+s8bjGhD+fpakH2rMhQcRX?=
 =?us-ascii?Q?+pmUiSCJ1E4l9e+r1qcAbyd6ubkrGPfQekvonv7+lI6D05Uma/lIYwa8mD2H?=
 =?us-ascii?Q?3sEmG36HQzX0V8OVU9lovPTbicGOM0muIEy2/92PU6oLwysrulixRLN1Azrc?=
 =?us-ascii?Q?TbYhU8LefGlotjCFVDa47A0wXNr5DSWY57DYBcVwT2YJC9J0yLY1OrHiC1tM?=
 =?us-ascii?Q?8ODU0mPYzl1LExLD9rvuFNKSRYkMIEqiaosvOUvJNg5uug0V/bkrgK7/O+P0?=
 =?us-ascii?Q?IZ4z0tyKXbx2HCYkgqdjHT4qpuHX84tZooysfut7wN4NIHMPalbVVIIbIdO8?=
 =?us-ascii?Q?0zAMZVMq15CQv4TUIyAuh5KtvfHS8F3PJQExxjkxGaQGx1oWpmAUahWuV1DK?=
 =?us-ascii?Q?k3udXWClCti36cmRxkyE/vC3j9jKa/vHpYhJ2YS6OMXx/U0SAvKHptMXcPJ0?=
 =?us-ascii?Q?gNhKmGvdrQVd30gUfqMyc558C0Pkp1kSs0pOiemIXHIKlPlPPupmIJIkoA8y?=
 =?us-ascii?Q?QwKXry+7LUwnTkMFjKCikPNniEK5Qev6ZjzbijgoiZD6eoz+6zmNPyP5jcpT?=
 =?us-ascii?Q?YFMSCnfNtrGv3i4HYdapgEzOLSb3yfeEZT5MvLyW9Zm2slpe/f8a6lwqz2gu?=
 =?us-ascii?Q?M+tyuYnhQlvohcnQn8lvflpgjHISX/jVazXjKAwAFyDIDZ1hY5J+gcgwzW87?=
 =?us-ascii?Q?r0B7GLN8o+Prfblnuh2BANgb4OJO/c3ZnMIfsJyrhm3MZ9n24swS1MDZgmP1?=
 =?us-ascii?Q?9W8PrUzMbzWUobIhxSekyjuaay/Vd00R0zwLvBkU78EMUoaSB0XSWDnMLCld?=
 =?us-ascii?Q?0Z42N3BIryeiIyFCw6Fz25mYyz7gsb4oAb7qo1uDqn7tb/7NTiTTHjflobcQ?=
 =?us-ascii?Q?tFmNiH+xCROqatUSleR3MkiKq7IMwU5rjzJ8qjxmK5xJXNOkT7O/Iqq3s4cn?=
 =?us-ascii?Q?idZxZpyCR/q44uZh1D2ydD/HfCqgLV11I4rI4mDwACp5zlT3dpF8cGSjaxmr?=
 =?us-ascii?Q?HFZZb+nyp3t3ct+THWJOIlha3FLzdAfCGXaDWr5Bcd5eEfhamtVAPdbk8v7l?=
 =?us-ascii?Q?EMmiuoqn25p8+Jz7kK3PdPo6wBI12uaH1z/wJR3tbJjI0d2HDkdQoRtF7SGa?=
 =?us-ascii?Q?raQTrz1Ff2oDIijS5g0SMKD/0vrEgqFaEUtn6aJTBF1jjePFshgKCFSCN289?=
 =?us-ascii?Q?AICUBQYOZa5wJsfTUjQCleRwfID6zJrmwoALF0ubJtndVan+1Xaab+N8Rczz?=
 =?us-ascii?Q?PFmnwCyK9qJRzPuvepOsuHd6mwUqjzo/Wv1fWpV3pYq6VYmH+kw+1HIdGTs2?=
 =?us-ascii?Q?I7HIWDIN9ST8ZvE+8Mk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 22:35:42.1438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a11be7-de1d-4ff9-fb57-08de2ba9cd0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9737

Unlike barf(), xprintf() does not add a newline.  Add one.

Fixes: e5b0a9405571 ("tools/xenstored: Auto-introduce domains")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index d504e9994b..10ac1c1a8f 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1333,7 +1333,7 @@ static bool init_domain(unsigned int domid)
 
 	domain = introduce_domain(NULL, domid, port, false);
 	if (!domain) {
-		xprintf("Could not initialize dom%u", domid);
+		xprintf("Could not initialize dom%u\n", domid);
 		return false;
 	}
 
-- 
2.51.1


