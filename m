Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7089B1E409
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 10:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074087.1436775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukI54-0000Ph-AD; Fri, 08 Aug 2025 08:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074087.1436775; Fri, 08 Aug 2025 08:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukI54-0000NP-7b; Fri, 08 Aug 2025 08:04:02 +0000
Received: by outflank-mailman (input) for mailman id 1074087;
 Fri, 08 Aug 2025 08:04:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mRAb=2U=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ukI52-0000NJ-JT
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 08:04:00 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2415::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ceabe82-742e-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 10:03:59 +0200 (CEST)
Received: from SJ0PR13CA0207.namprd13.prod.outlook.com (2603:10b6:a03:2c3::32)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 08:03:54 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::86) by SJ0PR13CA0207.outlook.office365.com
 (2603:10b6:a03:2c3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.8 via Frontend Transport; Fri, 8
 Aug 2025 08:03:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 08:03:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 03:03:52 -0500
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 03:03:50 -0500
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
X-Inumbo-ID: 3ceabe82-742e-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXSrTRhPELm82XuCircHYQQZeyRAr5oWH/QT8NcSterq1oPBo5LX1IKmAKyPLEcGR1dYnGIv2AoFWcqtWJQzld/YuSKmMMekHmDRJJC3Fc4m+zE3/hty3FPNXoRZqB376V8EL2fI1j1ggzyTEAQUKHCKWLR4v9RkcXd8c1Jj9wi8x3tMOK4C+wLtZMZcELcrQuT++up2c0BrpkFJuKgjXTQi4guBPLgesJ9vazxbTZ2uYez83oFRG0oKIr8uFzJFHiMGDqastk79HoltnSYnH62frU5gWmNJAiHgKle/kPoewNaZBaF8bztgvnsJHxJcI+klKJ41r8a/bi39u0bJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbkZOn+6Yp13WyrcBqTHgOEVpIDCAULsuben0T5moQM=;
 b=tU/mDtnJ7BP6R3HHkHfQh/vqDv79j45cVIXiTY1NGFk2Hb4SccLQO8bTUzqPzWxjy6oUl1SIEfEx9GTnnNAHIiPXKgZ5Oyb+U4gAyuVrUyV9gaQxdWKTU0lwLiz9TNveQnTfusw/rpXH4vUHlgL1/p6keTim7vy8wtxtiCRVTla9Wr60iEBZJrzDkme4EMXJsmIziJhSs6XcPtyBPMqXMC9IfgLQ9jRWt7mq5EkWPNGb0SxdPt2yxxEoQFZDyK/ukMU65DY72jo/qTdrxBoTKqsxDmxenpTuyyojcR1aetB4DVKZNpKmfZS8C+bCQ61K/Z7Qw2bVuw2eVWsIxMMgZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbkZOn+6Yp13WyrcBqTHgOEVpIDCAULsuben0T5moQM=;
 b=OkFPMZ/R9MIaa93NglELlL4hV1GWSAKLIh9ry+pdho4sCattCHqxSOWV0UDjLijecvYQSSAKYSqkFfNavcxASsml51fxEuR/7SOylA14VAjmmW+rC++036yBfLN+6i7Pyq36C234cMXoEcjYT4mneedCXDrDtkK9ZhbfjvUh6qo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v11 0/5] Support hiding capability when its initialization fails
Date: Fri, 8 Aug 2025 16:03:32 +0800
Message-ID: <20250808080337.28609-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB05.amd.com
 (10.181.40.146)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|MN2PR12MB4061:EE_
X-MS-Office365-Filtering-Correlation-Id: b1807d93-9d99-4fe0-4822-08ddd6521da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3dEbkNzcGdVVnl1bXNwb0ZVbEhHeHFyZjlvZ0JocHdGODZhSmdua014cXNp?=
 =?utf-8?B?RnB6QlgvcTBsTTcvUzE4MVI2eUNnV3VlL201OVJPU2lxZGhXZ3RNSnUzb1Zq?=
 =?utf-8?B?dTNHN1VMZkozNng3R1dra0FwL082Z0EwcGMyai9UdVR3aDNIaFRMR2diOEgz?=
 =?utf-8?B?MkJ3WUJJaVhGc2d1amZCVldtRW4xb3hmbTBhZFFTQ1RBNXFSK2lKYTNPMjBp?=
 =?utf-8?B?UE1IUUVqMnJidVJOS0k2cDVQRXF3RVdOUDR4VmVEYzFBMW9PNmthQWtEUE1w?=
 =?utf-8?B?UnVkT01jKzlMMEpVVlhpMWpmQ0hiVzBGN2F4S215MVBUWnU3aDltSFRCalEw?=
 =?utf-8?B?TFkyd280NUhONk9xRHhNM25wbC8yTDd6UzVTR3lqcm1kYWVZZytGb0d1NVV5?=
 =?utf-8?B?TytSM1hkLzZPKy9PNXV1T2RwY3NuUlF4SlVTenhZS0Y1bllEdDJxa3hadWQw?=
 =?utf-8?B?Q1NzL0IzTmZ1MmN1SmczaG05L0QvUG1iZVQvbk9mS3NTbWFoUE5hWkJZNlVl?=
 =?utf-8?B?WjBTYjFQRkNrWU9iaGtNckZyYkxkYm56cWR1R3R0QlJuenltV01saERrYzZS?=
 =?utf-8?B?Q2J3YnF6c1JJTkU2K2dMZ21EWmE2b1hlbUVidExJQU1uMkVpcHh5N3ZEWjJo?=
 =?utf-8?B?R2xUcHk4OWlsR3NzeUh4WkozRWdGUHZBcUQrVE12L2VIVmhMd2t5RUlvcEN1?=
 =?utf-8?B?bGZ0TkJ2c3gveDRNOWpLako5ekJ6M0pVTmJFcmIwSEFOcXBYelhZS0JiV2Y4?=
 =?utf-8?B?ckhCU1IvUG5WWUdsdnhLQlpKOCttMlJuaGNQQUNOOFpNOEs4YUlUcWdTR2Fr?=
 =?utf-8?B?UjdsWEpiRXBNeUh1dm84dm1OMmM1SFRsWFVIcmhUMkUrb05RcjJ3WUNBZWg1?=
 =?utf-8?B?SXZZL3dkUTh6WFhsVmxaSFdTaEJCUTBEL0F0anZWQXJPVk92MjFjdGlQdG5X?=
 =?utf-8?B?MUpOVmZtNGU1QmVHZG81cDlqSHZFUFgvRHNhSHFuclUvTEtQcHhiUW1XN0RI?=
 =?utf-8?B?cGV2dzJ5aDhXU1dVS0x1NGkyT09xZ2RWaTh2YU10M083cjVmL1lJaFplaFY1?=
 =?utf-8?B?WmR2NEpuRkY0STl3T0QrOWgyRllLTnZVSFpyN0hTM25hZ0RjWHBxY0hsYWlr?=
 =?utf-8?B?NHdvUkRJa0thdWVxdlllK25TMlVSRkU2MXZBZWRGcVdZN09hRkxHT0ZTRHNh?=
 =?utf-8?B?d1JNcExESDQ5OExsWDRvV2ZhWmZCR0cxUzZRNldZUFR4d3ZUTFdoblpQRTNG?=
 =?utf-8?B?K3FwdG5wZk1aK0UvU2pjakNHOTRWMTE5K2E1ZURKMS9oMHA0TldxbWxrR1Ev?=
 =?utf-8?B?bVZoRUpNTjExOUdpK3VQQnEyVDZma1QySEQ2bkR0UEFYTlhXVmcyTTZkdWRn?=
 =?utf-8?B?Rk9oZy9PbnpzM3VoU0dBejN2cTVndW9VRGpvMVd5OVM0bFlHQUpTdGxDWUcv?=
 =?utf-8?B?MUFoMS9NQmJMK3ZjVWcxWXlSVGZLN3FlbXAwMzNEUWNYVkNqemEwRXZhL1Bi?=
 =?utf-8?B?TGRzQi9ieFJzejQrVS95Ky94Y1dTQWl0eTJteFd6M080c1VIQTZ5bnFwY1Rz?=
 =?utf-8?B?a21ZL0R1Yk1ScUp1bXBWV1F0dWhlU2prNjFWaUNIYTVXMitTSkdnOFhPUWRJ?=
 =?utf-8?B?MXQ1SjBGNjRzdWYrMHhXa3JLS283OXJVamNkWU1Ra1p3b3FvcjAzeWtzN3JN?=
 =?utf-8?B?ZGNkYTZYd0pTZFlaQ2p5Z1psSE9SMVZwaHZnVzE1ZnFHd0NvaUVKUnYzZzh3?=
 =?utf-8?B?ZXpFNUlkTVFQc3pjQjBjYXEyeWpvaVBGcTZiVFNGVFlrMUtJYlo1bWFEV3Y4?=
 =?utf-8?B?ZTFwaTYrNzdVclFWalRER05OOVpwV0xIbGVCU0FmWkxZQU1TTXdGbktBUTBJ?=
 =?utf-8?B?N1lnbC90dzIvYXdqdjlEUWRCYW02dys5MTcyMnRPS3JDRmcyQy9FMkZuU3I1?=
 =?utf-8?B?SjlYbEUvaGhEaUs5U0lxYno3QkJuVnU2cktTMUNYZXBUa0lyQzV4M2x1SXg4?=
 =?utf-8?B?bFF5c0lyY1NWV3lZWkluczFMM3FWTGxoYmh4L1Y1cXNpcmpsbHJYaXlJL0NS?=
 =?utf-8?Q?XSWKeo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:03:52.8297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1807d93-9d99-4fe0-4822-08ddd6521da7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061

Hi,

This series is to
emulate extended capability list for dom0;
hide legacy and extended capability when its initialization fails;
above two parts had been merged.
remove all related registers and other resources when initializing capability fails, including patch #1, #2, #3, #4, #5.

Best regards,
Jiqian Chen.
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
---
Jiqian Chen (5):
  vpci: Use cleanup to free capability resource during deassign
  vpci: Refactor vpci_remove_register to remove matched registers
  vpci/rebar: Implement cleanup function for Rebar
  vpci/msi: Implement cleanup function for MSI
  vpci/msix: Implement cleanup function for MSI-X

 tools/tests/vpci/main.c  |  8 ++---
 xen/drivers/vpci/msi.c   | 49 ++++++++++++++++++++++++++-
 xen/drivers/vpci/msix.c  | 47 +++++++++++++++++++++++++-
 xen/drivers/vpci/rebar.c | 66 ++++++++++++++++++++++++++++++------
 xen/drivers/vpci/vpci.c  | 72 ++++++++++++++++++++++++----------------
 xen/include/xen/vpci.h   |  6 ++--
 6 files changed, 200 insertions(+), 48 deletions(-)

-- 
2.34.1


