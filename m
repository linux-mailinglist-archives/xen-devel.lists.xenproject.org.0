Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC809AD282E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 22:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010441.1388537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOjVr-0005jj-NP; Mon, 09 Jun 2025 20:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010441.1388537; Mon, 09 Jun 2025 20:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOjVr-0005hd-KN; Mon, 09 Jun 2025 20:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1010441;
 Mon, 09 Jun 2025 20:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/lO=YY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uOjVp-0005hX-UT
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 20:54:34 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2009::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f088a1b0-4573-11f0-a305-13f23c93f187;
 Mon, 09 Jun 2025 22:54:31 +0200 (CEST)
Received: from SN7P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::32)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Mon, 9 Jun
 2025 20:54:27 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:123:cafe::46) by SN7P220CA0027.outlook.office365.com
 (2603:10b6:806:123::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Mon,
 9 Jun 2025 20:54:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 20:54:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 15:54:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 15:54:25 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Jun 2025 15:54:24 -0500
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
X-Inumbo-ID: f088a1b0-4573-11f0-a305-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMdVOyI5B5XfVQleCGRWs3Rf+YmSickz3FXn5tJvW2dGXvDQSBW1sCqWYMOa37+I1u3wZI/5s8FDi9xbr0/BGVTTBLKWxQ0d4VS8qG+bzC1WxZ5OadcscM4llMEMcDoK3as9soPIH/1jLXfEbLg+9DAxpsLR4IS5H6rIfz6EWSP/7ibd689Noa1VZN/5j5UOoI5yJXROjaOI4gGHKNjEG6VrZshmf3vmwNHASQGy06E3S8TSjwSZXjtpTz4HxHpE2hNM5QbulwHvI34LMeAhM1zGpJwd7owQgUWa46QtlF9lkoGHzyGzcdp/HwmW6ueBwTE3hH+B+WvMt9XQbrLWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wbtqZhYC108wtkPXEr0Ks9WzyBY007ozYY9rvrT0qI=;
 b=wmmBKT+FeKX/Yljem4d1fUtAS5ZHVkq+Tkp12lB+YW65q2W8fy7kyErYSz3a/WqW7nWnlzY2VRxIhyIJ1cW53ZHoIZQXKhKQnB/6kq1OjLt1f2M9uKxcMIXfp3nvWbNHRc9AWdYmCdIdYYV9jPl1gluJvtc1O5CcB8XUdmDjYgmMRNsbjLIjApRgIVW27EKgj7UZ05lnlbiiuscc4ekam9+rA2uQ2OR10ABhAoD2Fi1i/+XPuZr+ApHw/vmL+rb6+2bFGj/K8dUbU26F9i54QF01WdKDgNJLd1QJtPaF6rpJmf3VCh1ZVA+EKytPznV6XmgoXR8AmsUjt1vjdc+GiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wbtqZhYC108wtkPXEr0Ks9WzyBY007ozYY9rvrT0qI=;
 b=geS0ogsVkMN8jKJ7zZYu6aSo6/rmD8oeVQIjoQtd64jVaUMjAf9xVzNNnTcRsqUU31WLiQy16mSb09ynOe/rjQvfeMYz3z/wFoYnVaZytP4EMNJ4gWoeddqEZf3AzHgSOT7+O+plkr8grRBlGTQgdxeazEsKL8DoiDkOxoNMVWM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH] xen/arm: fix build with HAS_PCI
Date: Mon, 9 Jun 2025 16:54:21 -0400
Message-ID: <20250609205422.180717-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: e7fc7de6-8366-4ef2-8270-08dda797d1ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alVEUnQyYXN1YnRYS3hFb1lrRUE4WVdIOU9lRTBwbFFGdVF2Mk5MWmd1SHpj?=
 =?utf-8?B?OGlWK3pWL2RvcDhkSy9DK05WZGlHTm4zaU1jRVB4WkMrcGx4RDN3M2NHN0ZU?=
 =?utf-8?B?YlRtd2NCTWhHVVh1S0dCS1ZUSFBoQWZ1WVI1alVXL0JjNC92OTVMT1AycTVG?=
 =?utf-8?B?N2t4bGkyYi9NRWxONlJYdFRFYzZGY1htVDF5SnJlZ3phN05aUXFYMFBoeHRK?=
 =?utf-8?B?WFZtYjNET29YaTlkM0NydDNMa1BacTV3QmI4TzV4NVVzeGxOaUVvMVJvcGVO?=
 =?utf-8?B?VTlyQWRqVFByU3JRMDJEcm8vNjVhdnI1Y0FUVHpvKzlUdWFGU05GdHpibzZr?=
 =?utf-8?B?UkJCUENvekFOQ0FNdkNvN0xVWGI3WVJidnBJTkUrQjMrR0tzMWJwdG1FM21U?=
 =?utf-8?B?UGZPOVpVb2lMUjFYeFRINHMvRWtRL0paWVhrNXErbUpUK2ZJVEtIWjUvT0RQ?=
 =?utf-8?B?MUhlTE02SlpJVVR4cW02T1E2MWpyMzIyaVFiWkhJZFlGQ1lNUWY0TEtBVEk1?=
 =?utf-8?B?cTR3MWF2L0E1MC9nVnBHOU9IVjZNRGZSbTdDQi9RWWUwYi82M1hIb3FYK0R0?=
 =?utf-8?B?M2VoR3g5WVBRVnAwWXhtb0hOK290SGJYVjd6L2pLK25HQVBBNW5Db2RCQld5?=
 =?utf-8?B?N3FBNnB1V1dTNUdyZHJ2azltRzhnblNsSGEreENLT0N5bDJmNUEyYWpYbnZW?=
 =?utf-8?B?TlM0L2ZXN0J0WlI2eHBEeHBKYW15SGZnc0lsRzc1Z09yVnBwd2ljRUI4Uks3?=
 =?utf-8?B?eERLKzNBQW1iMGxSTmRJL2RibG5uejVUWlVsOG9tRFFVSTFBcDhxR2RwL3dx?=
 =?utf-8?B?Y1FQT3FQLzc4MnorWmJWWnNoVnN5aXdUTVQ3bnFtWTdJZTJidTRITWVtM3Np?=
 =?utf-8?B?cHBsZHJ1aHFrNFRXcTBqVFdhZ0I1QXVHVklkWkRNUVFzZkNQMGwrT3RPK2xK?=
 =?utf-8?B?K2tVeHlvN2FpTlNDWUVRYVc3ZmVyc0ZWeDFkbWVvWFFNSDcxU0VJUWgxQkxM?=
 =?utf-8?B?dVZwTlBVeDlnNUZPbGh5SzRaVENNMTFoT1ZheGluOUlMR01DNTl4RDFheUx4?=
 =?utf-8?B?cms3dzFhOXk3Y2FRYzNWNWtaclNhaS9QaU02WE9nMXEyb1R2UlpWUjk0QStO?=
 =?utf-8?B?OUhickI1cU1pMU1iRTZFbXJBQ21zMEtTanhHUFhrVFBuTTVNbDZsRXB4K2RU?=
 =?utf-8?B?amVJYWRlRnN5Z0tTRmtLQkhJSFN3ZXU5VUI4UDNLeWxpUG5Sc2hiaHgySUYz?=
 =?utf-8?B?QTE1elhNQk5WaHptZ2tXeEt6VTRza1M2dTFYNVlZeWcyemVqZlY1bU40Tm5q?=
 =?utf-8?B?TkFMOWRJN0s5RmdrMUJXRW1HQlBTTURWcGhXanlnUjhEVENMenpJa2UySDRH?=
 =?utf-8?B?UUNyWmFYK3kzdUZMZWMxYk5pMmFZY1pXWlVMQzJJeDlVWVhPN1VjSThuNG9V?=
 =?utf-8?B?TTFocEJlaDJ5RkFZTGpnTGJvSGFlTDkwWFIvMGZ3bDl0OGJyYmk5Tlo4ZHF4?=
 =?utf-8?B?YnlmdDJXTVNWazM2YUxwRjRkZFBrSFZBNTEyNVBrWTl6SWlTenM4OTZqUkVa?=
 =?utf-8?B?eDlMTGNockhTUXQvQkRGaWwrQkZyL0h2c2JNdnBrTUNaSkVhSXRTRkMrS1dW?=
 =?utf-8?B?alc4Y0NBV0gvb0VEV2J3MnNyZ1lOYnlvVGk2TWVHWWZUaEJMZ0JTd3VtRlJQ?=
 =?utf-8?B?SzFkbjg5NFNSNG9zcnp1b1NjdjVZM2pCNkRKNTRzS0VYby8zR2RYY2MwbTdG?=
 =?utf-8?B?dUpDbG9KRFVRWDRPTU5kc2VWQlNUTmRJc0J6c2tLNVhodHNGNW40eDNBYUhn?=
 =?utf-8?B?S2dXNmNLandWNFRTUDNGK05vQ2JqL2Q5c2xlUDFJSUh2UWJGcDBuTFJHbEFj?=
 =?utf-8?B?Zm9ZckhLcCtFL1JjUEtreVNsbTJtUVB0ZUYxME9EZ2Vyd05rR3JERlBWdVJR?=
 =?utf-8?B?dzJUZEdmTGl6SkJDN1JXRVp1dVNISE1uNG1Ec3BBazdUK0wwYnBmS0VmM1Az?=
 =?utf-8?B?ZXViWWdveFhKRkwySHRMWVZiVExBQ2hzWm13MWpFMnhuRC84bzlGaVA5WWpi?=
 =?utf-8?Q?QaD57+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 20:54:25.9628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fc7de6-8366-4ef2-8270-08dda797d1ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091

In file included from ./include/xen/pci.h:72,
                 from drivers/pci/pci.c:8:
./arch/arm/include/asm/pci.h:131:50: error: ‘struct rangeset’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
  131 | static inline int pci_sanitize_bar_memory(struct rangeset *r)
      |                                                  ^~~~~~~~
cc1: all warnings being treated as errors

Fixes: 4acab25a9300 ("x86/vpci: fix handling of BAR overlaps with non-hole regions")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/arm/include/asm/pci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 1605ec660d0b..1bbb9d780193 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -17,6 +17,8 @@
 
 #ifdef CONFIG_HAS_PCI
 
+#include <xen/rangeset.h>
+
 #include <asm/p2m.h>
 
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)

base-commit: 86a12671c5d33063b6f958bdcca7c9d14cd5aac8
-- 
2.49.0


