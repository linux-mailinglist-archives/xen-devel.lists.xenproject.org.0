Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C389CBB5A21
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 01:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136235.1472940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Sxy-0007VY-8I; Thu, 02 Oct 2025 23:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136235.1472940; Thu, 02 Oct 2025 23:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Sxy-0007Tl-5I; Thu, 02 Oct 2025 23:44:06 +0000
Received: by outflank-mailman (input) for mailman id 1136235;
 Thu, 02 Oct 2025 23:44:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sc7N=4L=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v4Sxw-0007Tf-TS
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 23:44:04 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acb8bace-9fe9-11f0-9d14-b5c5bf9af7f9;
 Fri, 03 Oct 2025 01:44:02 +0200 (CEST)
Received: from BY3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:254::32)
 by MW6PR12MB8900.namprd12.prod.outlook.com (2603:10b6:303:244::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 23:43:54 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::b5) by BY3PR05CA0027.outlook.office365.com
 (2603:10b6:a03:254::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Thu,
 2 Oct 2025 23:43:53 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 2 Oct 2025 23:43:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Oct
 2025 16:43:52 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Oct
 2025 16:43:52 -0700
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Oct 2025 16:43:51 -0700
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
X-Inumbo-ID: acb8bace-9fe9-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcgUlOiOyLtzTt3fp6n3yx6/4zOzoQFxr2lC0uXBIwZHL+X4jn+ukf482a6wce20wKgBTyNqh+pgfWOuLrx+tYsYpRNTR+XQBbgqxjW/Igr/T3kHR4HRJKIXOz2CUTiceHyG8axzpnOq7oLmT67FG/5nLN5dHq1yqAQqZx5+06hZ8mp7Gd2vc1MoGogwo97x7aUyx5ZFrsLgCdCR21ZRYgrcF9v5hDBmwZWeRySj4o87z9hChALPIHdUEQx/Y90zG3s8BpzSiwFoD22LA6KKQXYDlp5j7HsvwNB4jl3ddWFLIBy1XLFFmqDtJucKofjylIED0v0ETROMU1A5/Dr+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VT6I6bq+q2hZBc8+wpQ9CAPKoLruP5nyKbZZqRECRvE=;
 b=D5rE+wtUFZbt5Qso4w1oelmYBP/iML+Y06rtD4QPk0ZkwMQderWZfa3RcIhrJLjVDYf0Yv5mrnIFRQHETk2Aq28qhURFp6B8KL0gNMGwqSZIVtP8X9Cd29yZduNYQkTQKOBcjGyBRJDacHkUDfkd6fIhdVoNM0TZ9B2BncJIHSEbUODFuxlFCe4sGlRtuwK90jGGQwFbCABb/kOGZCvTm5pa2k1VJOq3tiAa7Zp7K9Mq8l21iTyeAy+OXdpjCCGNYN7XjxCQ2Xa8JQ0XiOc+6H30ROMTgSg6RL3CqOrn4S1oco0lHhEHayF6CS8WIDy9bUXzpQE1TleYEvjXlGXlNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT6I6bq+q2hZBc8+wpQ9CAPKoLruP5nyKbZZqRECRvE=;
 b=0FvWGwCKvdvOAwwQ5tXUE/maC+oGOC68L+qWsCHPM8Ws9ayWDhzx/ZGSZmSCoduIDQzOMW3aPt0lo4T+pU3tZJw4ZtfeQs++PDAouW9vxXuQe2ztNxqEe8JXKbBp2mU5tZNH9e79EWZL9Y+5r8xZfp3vKOx2k/iiNjx46UtMMAM=
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
Subject: [PATCH] MAINTAINERS: Add myself as an AMD SVM & IOMMU reviewer
Date: Thu, 2 Oct 2025 19:42:38 -0400
Message-ID: <20251002234311.10926-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|MW6PR12MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: f190ef69-4f61-4fe2-abd0-08de020d8b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTBEVHhGRXZ1TG1JNWp5N0pXMWU0ajd6WjAyZUFFUHI2SFVHN3RyYnZvdVJs?=
 =?utf-8?B?NlJwdUNQcS92alJoVVFwbm9PMGZQS0x4VnExazM4NXZDRmlJekpCT1YrbHRM?=
 =?utf-8?B?VkRFZWZYbWFOdG0vUzN6TzdnczR2WFczMzNiWW9kNS9qSmpEdnJhcGVmc1Ru?=
 =?utf-8?B?MW82M3VsYjMxMFdNQkhTZzI5RkZBdzZKWDJWQjJTdXM2ZHJqc1RQYmh3dUVS?=
 =?utf-8?B?MXhUVHZ3MldSVWJhU0VxQjJPZVFXbm84L1RuNHdVZFJna2VjbVF3emhyRTNq?=
 =?utf-8?B?SFpJRlVJd0ZTQWd4dURhQzV6QTNEbmQxVU96WTM1cWJ3K0lWUGxYZXZIWmVy?=
 =?utf-8?B?TkwzVE9Edml0eHFZckFpWWNONFI1OEN0c2I3K1NqSTUvVUI3dUVmbFpESDVB?=
 =?utf-8?B?QzlNR3VJNlVFeXlCVG9YM3pRa0JoOHlyekRMTmRwa2xpNm1VNXpycGZORUo1?=
 =?utf-8?B?NGJmaGVHRUduMDV1dWUzTURMS2IvSXRsL09Qek8xbk9CSkVGdmpIL1dpWWl5?=
 =?utf-8?B?K3MzMEE2SlFuWkkzanBWbHNLeXErckRxNTRHN1JqbDgyTGdlSmtmRVVOUWlZ?=
 =?utf-8?B?UVhGWDlzUzZjM3ZETXY3aFlXT2NEZnZsVmVCV05Zc1hYa1k3b3hCbkJpSHE5?=
 =?utf-8?B?bEVaSnJrY3QvaXozRHdUWEtCdVZ0MDJIRUtVckVyUnozOFliakVEVUNyay9G?=
 =?utf-8?B?SHVQVk9SWjZaS2JXaU8xUjNaWVp5bndObU9jWGxlSk1HQU5YWDRuTytqWHgy?=
 =?utf-8?B?V3JWQVFRckREL0l1VEFGUElkYWZaem9iV3JreURRWGNpK3BCUHIvajIrZ1N1?=
 =?utf-8?B?NG1HdE5jc0V2d1JsbnRWYmJVd1VKMXdTdmZMdTc0S3JDNnNFWEE3M091cS9I?=
 =?utf-8?B?a05FcHppeGVRSFB6cUZnVlhHSGsyMDlyaHJXSnAvYk5MUGlHYzAybmNjamw0?=
 =?utf-8?B?bmplNG43ZGU3ZzJ6Z3hWSUw4My9xMVlyNWtwdTVzcWVaczlxeE1OYkh6aXIz?=
 =?utf-8?B?VitOMmFuTzNWTTFMTFphOHlyV2l6ZmRqRW1IVXBzdnlWUlQvNllnZGNheEpo?=
 =?utf-8?B?T1RscGp0dUdkd2pIMnExNGRlaW5Md1ZoeTdJQVlmSlczYkgxcjdCa3g2ZjVq?=
 =?utf-8?B?SGM0eU5SVjgwTzVtc004QzlvZE1XNW5MTkczUEhsSzE4V3N2UzU4TTVMUFlO?=
 =?utf-8?B?VVRZUktBZkdldm1tZUpEVDMvdS9jM2JheWNZTDdUdE4zY1JNeWkxUFZ1UGFJ?=
 =?utf-8?B?WTVlcWdZY0VtMXhsaTRGYmhua2F3RnJidWRwWUxzS3NlMkxaWHVXVWVqMm1Y?=
 =?utf-8?B?eUsyNWpzaHhGRnNsajFrQWhZVWtpRGFGVzM1Ly9VTmJSQU1SK2NUc1dGZlpp?=
 =?utf-8?B?YTMvdElYKzZraTYvb1Q0QzF1amovVWY5Wm4wSEk1YWhkSTNMSUVMa1pnRWVw?=
 =?utf-8?B?ajI1N1I0UWJvb0owbUVHSEROT1ZFK0dMSTlzNUlvRnF5STRQYlR4WGhVcENZ?=
 =?utf-8?B?aXAycmovNVJJaTM4elozZ3JmNzlEQUtjRERoMjM1ajBtWVJFU2pyMU0yeWFZ?=
 =?utf-8?B?SXV0Y2dsSS9lOVhkVG8rdEk4NTJuV3NNZHkvMFVFY1JyTHBoM2swL3AwL091?=
 =?utf-8?B?MFJFZkdYRnVwWVpxR0EvdnY2Z1RvcjBtQXpaMGsxR2MzdFg5RGlxSzNCcVdl?=
 =?utf-8?B?YnpXZGp6OTF3UlRGbTZ4Z1ZWQmNUSVl1VWhrYnJnZFhZNVVQWmVSYXZ5SE43?=
 =?utf-8?B?eEU3eVZ5K2k3V3prK3UwZWZvK2JTT0pCOXBkNUpHVS9YRVF5YjVucTRIdUlG?=
 =?utf-8?B?c0pzNENLM1pBUXl1bU5ZWVJTcHNFYnJYVnJFOWZTWHVMT2tBYldGY0pqVHQv?=
 =?utf-8?B?R3JwS2NVOVNuWE0zeFhJelpDQlpSTnlsUGpHclpJT25KcGdGcFBMSGxBdHNz?=
 =?utf-8?B?b09jWFFBYU14TGZobUlIZXRaTHlUVXJmOGRKdHo3eDVONjl0RGpQS2dGMkdV?=
 =?utf-8?B?cWN3Q0RwTG9BdjhLcnNSeVVwSlRTV1ZNVmZtYmRmNGNYWFV6ZlVaZytCMERO?=
 =?utf-8?B?TWRYTGxuNXQwbUU4aVlMNWsrUHp2akRQWm03RFVjUkdWamFNMG9EU1lUTmF1?=
 =?utf-8?Q?qgAQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 23:43:52.9332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f190ef69-4f61-4fe2-abd0-08de020d8b74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8900

Split out AMD SVM and AMD IOMMU, and add myself as a reviewer.  Jan,
Andrew and Roger are set as maintainers as they were for the X86 entry.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 MAINTAINERS | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 793561f63f..0139edd88b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -220,6 +220,23 @@ F:	xen/drivers/acpi/
 F:	xen/include/acpi/
 F:	tools/libacpi/
 
+AMD SVM
+M:	Jan Beulich <jbeulich@suse.com>
+M:	Andrew Cooper <andrew.cooper3@citrix.com>
+M:	Roger Pau Monné <roger.pau@citrix.com>
+R:	Jason Andryuk <jason.andryuk@amd.com>
+S:	Supported
+F:	xen/arch/x86/hvm/svm/
+F:	xen/arch/x86/cpu/vpmu_amd.c
+
+AMD IOMMU
+M:	Jan Beulich <jbeulich@suse.com>
+M:	Andrew Cooper <andrew.cooper3@citrix.com>
+M:	Roger Pau Monné <roger.pau@citrix.com>
+R:	Jason Andryuk <jason.andryuk@amd.com>
+S:	Supported
+F:	xen/drivers/passthrough/amd/
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


