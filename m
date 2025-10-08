Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF8BC8F78
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 14:14:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140556.1475419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6pXB-0006w6-OE; Thu, 09 Oct 2025 12:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140556.1475419; Thu, 09 Oct 2025 12:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6pXB-0006tu-LH; Thu, 09 Oct 2025 12:14:13 +0000
Received: by outflank-mailman (input) for mailman id 1140556;
 Thu, 09 Oct 2025 12:14:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQ7T=4S=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v6pXA-0006bm-Je
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 12:14:12 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76661473-a509-11f0-9d15-b5c5bf9af7f9;
 Thu, 09 Oct 2025 14:14:12 +0200 (CEST)
Received: from MN2PR11CA0012.namprd11.prod.outlook.com (2603:10b6:208:23b::17)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 12:14:08 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::63) by MN2PR11CA0012.outlook.office365.com
 (2603:10b6:208:23b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 12:14:07 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 12:14:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 9 Oct
 2025 05:14:06 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Oct
 2025 07:14:06 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Oct 2025 05:14:05 -0700
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
X-Inumbo-ID: 76661473-a509-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGG6Fc1sVoYwmqUaNP45YlprB0P8YzgTcxzqNokFiE4XXAvi3LIzWLNU1Y/GZX/ZjzZCh+dnMQiqVRl9wx8WQcvlPFn0nsSJYsCVCzqd0ST7I5POaZoNGje/5IqdPqdvKXovR9QvzeAxPDETY8eYV96IkGRFGYSQciGGZeLpWbP0DD98352Mf5yzr+pcjbFbB2ZQRnesE36fX3fMLhrQ9T1F/WQVo8ryudgTQWnyRwEV1UlIMunasjlJ83dZLwzmXKT3ch5qeTMHjMSwq3AlkekhxY4/tIxNnh3ot9Fi5/cTtVp2B6tts1Q49cIPWKoFUrW+k0oOmIvMoMr3P064cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxYjME8O6SksfkkDnzpm+6F/u6iqKZeg+GHZLWETZzc=;
 b=CGhlFJLi1Xkv1GV8dP6+L4szEFlNBniZdh59cnE+daygXThGOYN07o2f2SlV5Aj+fSyUxJPlhH+DJdMq+9HGVuRrUNIgko0HmiijFZ/mCmo17qe71j/AihcSQHt+X1aBxLEI/4oiiluITT/v5ZXJh6hfe1X47FwxduNHUhS2nh3v43wWfYx2Pq34Ppj1zF7P1kHhx+ZyDUfhRE0Ra7tQadTxPOUrah9OX9MJ8Vx7xdLsIZq1/8iAthvgMFPaAwaWJoGHgyCe3wGfwaLO8hr4TgTmbmEFnFG8jVizCVD33c1AS3vBsm+HimBnHrggveb9XW7ZAf18fzI930fIOf+1OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxYjME8O6SksfkkDnzpm+6F/u6iqKZeg+GHZLWETZzc=;
 b=ntUPokmcsSphWYUYgt1LvoFu+0qsZiJ11Eg+5zxxC362XzxqAdjRPRprWt8TJiEKg3U0XI3XQ/UcRy3osjR36al0wILfF6DEwowJyPNGqqSlHfVlZqZP54FwEZb79XU55qx/1COBtC+SjvRoLf39Q89gQj99lMAGnQKHByND1eQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] MAINTAINERS: Add myself as an AMD SVM & IOMMU reviewer
Date: Wed, 8 Oct 2025 16:11:05 -0400
Message-ID: <20251008201106.36204-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 367260eb-4f31-4a43-4d97-08de072d589c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWlIL2dxVE9abVM0a0k3Zy9IeGsweDIxQkIzQ2FOSWJCbkNndUhzaXhYbXNQ?=
 =?utf-8?B?a2NibTh5ZXl4bmhCNDhyMUpWaGJrd3JIRWlpWXhRT3JMd3JpcmRBanJPeXJp?=
 =?utf-8?B?T3VLSlo1OFU2VE9Qd2ttNU9RU1ZKUWpEQ2RKWW1JbzZ0WnFTaGZZOFU0ZWUx?=
 =?utf-8?B?eXFtc2FKRDRncGpTZmo3blp2Unpxclg1ZXNId1ZsWUl2VG1IVUF4aWRXU1o0?=
 =?utf-8?B?YUx6d213SzhBRVZZejNTS3c4alN6ZWhiME1aL0tOWDZudUowd1lFUnV4dlhk?=
 =?utf-8?B?SmZmaURKanRpbzIwYUFRVERzL09QdDVJenc0eXVLQkd2MUw0SmszNjB1c0Vu?=
 =?utf-8?B?N3lLeFJnTlNwa2ZOam1Nb0wzV3VLR1lTV2dJaFRLOFpQaER1T2hqbXRFU1px?=
 =?utf-8?B?L0lhWVEwcmp3VjVjblJ6bmJtcW80ZjY4OUF0N1ZkL2psdXNaOVFOZG9POWVH?=
 =?utf-8?B?aTBJSUFFOGNQemRoejhNWFZpY2RZYkdGS1p4WGk1VStTMUZBdkRRQzdhMThT?=
 =?utf-8?B?MmtERHNUYUdacGRPb2RSaUR0OVBqQ2l1OGMwd3BYWDcvL3ZJZTlTbG9LaDZL?=
 =?utf-8?B?VVYwUlRnRHpKcDhCbXhINDhFQ0JPT0R4MllkS3FkK1N4SERQbnNOZkJSREVU?=
 =?utf-8?B?VHI3bFovMGlxWXRmd0puUWpYRHRkSWJ0VDVNMms2dkY5dEUwQWQwSG9uYnNj?=
 =?utf-8?B?YVVIc0NSazB0Wm1lNzlVcHI4bXRIWll5VkxNZ1pqTWlVcjg2Qm9URTRYRlFs?=
 =?utf-8?B?eG51bDB0VFhDODZsQzU1UzZZN1hTbForRW10MTVVVEZBVlVDVHRxb0czeURo?=
 =?utf-8?B?QWRzVmhuZTRlKzhvbEF4ZTZSbGE0dXVVbCtEZDZLbEhGU21kRncrcVhncXQ5?=
 =?utf-8?B?Ylp2TVZ4T1R0UmMzQWFMdThXRjFXcjZGS0lWMUZTZ1hpZlkxdmpZTVA1TE9v?=
 =?utf-8?B?eVlIU21nNy9QeXp6Y2dYRzVFRGIwOVRqanRyM2dETXNUWkM0V0hLZlFHemNy?=
 =?utf-8?B?SEROdHVhRDBmMUhtN0FhdTdXN2d2ZEQ5VU9yU0RrdGYxcWhGWnF4dUZLaXF3?=
 =?utf-8?B?K3huTFNScVRaZndsaEhjTXQycmhhM0ZjSS9Zd1pySDJ1dEYyOWM5ZW1QRHR6?=
 =?utf-8?B?OSs1NkxRY1F1MzlrQzU2b3ZsMzdRamYxdHp4dEpQeUlQU3M0cWl0cGx1Mlo4?=
 =?utf-8?B?SGMyN1VydVJwdkxmZ1JzTzFyY3dmNVczQktFVmJURDY3eVVXTnV3OU5uRXR3?=
 =?utf-8?B?YW5ENzJ6T3cySU4wczdRT2xYRzZaN2FoSzN0N0VtMTAzWlRmRzNGSEptTGVy?=
 =?utf-8?B?YWhBMzRPcHFmTnJXWWhPTzBKT0FCcnl6eE5KeTg3a2lpbWpIR1M2cnFvdTRa?=
 =?utf-8?B?TWtYbGRRdHkreURpYnZHOHFWUmhHOXQ2R24wOFBnWkNyOUYzck9HWStJSitp?=
 =?utf-8?B?b1JVb3NIZmVneWRmc0RPb0tMeENmNGMyYUEyaVZSWHhCb0orNitVQ2h1TWNO?=
 =?utf-8?B?aHJoNEE3aDFZYTlHRmhSSTA2ZkVRWXpBVXRhdmpWV1lsbnd5emZ5MmhwVStt?=
 =?utf-8?B?RmJvNkc3ZFNlUnhicDlwMkpJbjRWOFRjbmFqWUI3QkV5VENQb252OHYxMElr?=
 =?utf-8?B?Y3g4MndERjhCc1ZmVGxFcTFINkpidWY0M09rbEl5cnRoaStBaVZILy85UzBD?=
 =?utf-8?B?QmxXeFdndVFaVVFVTXJKMzJqbU95aGRmQ1RKOUR5QmVKS0tYYlgzTXR2RGQ0?=
 =?utf-8?B?SUFvd1luM2xvTWFDMTJMR2N5dURqS0V2ajVwbnZCaTBnK0oxSEtaNTlFZ0Rn?=
 =?utf-8?B?RXo1bU9XeDlRMHJEZWRDN3VTdVdWdm8zTGE5YkZxWW0yeEtHeU1XVlF6Ly96?=
 =?utf-8?B?dXlMYmlMQ2wvc2FqTmtJOTlLWWFGUzRrMHFadG1vVGswd25vUDcvOFlBSklW?=
 =?utf-8?B?ZUtvdXZtN1Jjb3IyVW1TOU54Nm1PdDBTUk9OelQxbnp0elQzNGFvYUxMVnNI?=
 =?utf-8?B?Tmx2Uk1ZeW9ZSHN0b0FsbjVkM1VaQ3ZvaDk0TnhQUnN0LzU5Ly9jUUozKzBH?=
 =?utf-8?B?L3pBSUNISjRWbEZPdCs2RnptdXRlcU12NndNb1Flc3dUczdTR2J6YTNGRytW?=
 =?utf-8?Q?wRZo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 12:14:07.4326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 367260eb-4f31-4a43-4d97-08de072d589c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

Split out AMD SVM and AMD IOMMU, and add myself as a reviewer.  Jan,
Andrew and Roger are set as maintainers as they were for the X86 entry.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v2:
Alphabetize entries
Add Roger's A-b
---
 MAINTAINERS | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 793561f63f..bc134ef9ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -220,6 +220,23 @@ F:	xen/drivers/acpi/
 F:	xen/include/acpi/
 F:	tools/libacpi/
 
+AMD IOMMU
+M:	Jan Beulich <jbeulich@suse.com>
+M:	Andrew Cooper <andrew.cooper3@citrix.com>
+M:	Roger Pau Monné <roger.pau@citrix.com>
+R:	Jason Andryuk <jason.andryuk@amd.com>
+S:	Supported
+F:	xen/drivers/passthrough/amd/
+
+AMD SVM
+M:	Jan Beulich <jbeulich@suse.com>
+M:	Andrew Cooper <andrew.cooper3@citrix.com>
+M:	Roger Pau Monné <roger.pau@citrix.com>
+R:	Jason Andryuk <jason.andryuk@amd.com>
+S:	Supported
+F:	xen/arch/x86/hvm/svm/
+F:	xen/arch/x86/cpu/vpmu_amd.c
+
 ARGO
 M:	Christopher Clark <christopher.w.clark@gmail.com>
 R:	Daniel P. Smith <dpsmith@apertussolutions.com>
@@ -601,7 +618,8 @@ M:	Roger Pau Monné <roger.pau@citrix.com>
 S:	Supported
 L:	xen-devel@lists.xenproject.org
 F:	xen/arch/x86/
-F:	xen/drivers/passthrough/amd/
+X:	xen/arch/x86/hvm/svm/
+X:	xen/arch/x86/cpu/vpmu_amd.c
 F:	xen/drivers/passthrough/vtd/
 F:	xen/include/public/arch-x86/
 F:	xen/include/xen/lib/x86/
-- 
2.51.0


