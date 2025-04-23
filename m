Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5983EA99742
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 19:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965074.1355721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7eKo-0001iE-U2; Wed, 23 Apr 2025 17:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965074.1355721; Wed, 23 Apr 2025 17:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7eKo-0001gd-Ph; Wed, 23 Apr 2025 17:56:34 +0000
Received: by outflank-mailman (input) for mailman id 965074;
 Wed, 23 Apr 2025 17:56:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8j8=XJ=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1u7eKn-0001gR-53
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 17:56:33 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2413::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48a8c2ed-206c-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 19:56:30 +0200 (CEST)
Received: from DS7P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::28) by
 IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.23; Wed, 23 Apr 2025 17:56:26 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:223:cafe::2b) by DS7P220CA0029.outlook.office365.com
 (2603:10b6:8:223::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 23 Apr 2025 17:56:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 17:56:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 12:56:25 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 12:56:25 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 12:56:24 -0500
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
X-Inumbo-ID: 48a8c2ed-206c-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwtTFL9sT1dcay8mAApgdW7s35a+v5+VRUQbexzPCKe/VbMnR1u2/DbMFE8Z3a1c381kYHtB/WM4jga2rcXJ0E5uSD2cxECA54Q4Yt9HGsaPm4v87U/ip0MiF/9Dv2nGfsnYE3FySpxWn07bwwnGDfSPcqvEXeiCuam9jaN9/0VWL600UERxWbDHqLzeLf/r0lHBmxF9gMzH3c2auma5MwUTiPvrrcV5E7mJZ8GKEtDHGja7ueR2SHdMvnrQ77jABnAMEzQJ70wdOThLBW4KRq6BAGEiLRxoPY69Ey2TvIVp6OHg2g67tiVMlsnQjMEx3x5mztSmIgUMI1dzOT9I8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKFZrKOZiJ4lCI2I4BIQggJos/VogNtDwCWL86GgUSg=;
 b=ECJnzfdJb0ffifPb+MA889KZ7txkcH2ntoP3ICoaVD5iiSHWbL/TGNnjqS7UPJQFfylLl95SxSSYrcIfbnRbbUZyPhtfnlE4Ip6NCN1AK+A2UcbIoMcqmlWoLvB9XSqYlnWkbP6+sKwpqwhj6pSJlgQp9RHMP9JUtBwaToAXq+FQxT2JizgHEqNjEwBy9Y+V6Cd9v/IG+sQXXPlg//W3zVO6CfVM+mIZjKvvGjU746+DZbTMCcpFvipmY+z+sS5D7c0Zaxts/4KDeKJAMJ5zwXzloqbR6etvVN9JikuzFodrHJYl2kHWbQay8eQcIfh9906IIjZi1JXVeQQkZ7cvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKFZrKOZiJ4lCI2I4BIQggJos/VogNtDwCWL86GgUSg=;
 b=qlm+fj0ROoUdkwY0VV2OGtAAJ04Un/NWtv0DD401PDzBzX83OAxZeeUnSADHtPm66DhpO8DDDfEQ8Oj56zDKZ3knemaYtA2seiblU8svGAKT6xoiigtI9/adpeF7IArcZEsNxzWfgua4ZiYGj6g2XB18+BscCawYLlBwnMUsHCU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v1] misra: add deviation of Rule 5.5
Date: Wed, 23 Apr 2025 10:54:28 -0700
Message-ID: <48c7830931a98b2bf70ef1509f309b262b9e5792.1745427770.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|IA0PR12MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c9434c-7e0a-4183-c8c0-08dd82902ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHRCQzR0bk1kUFhiVDI4RWR0SlNlN0dNY0ZJMzZYOWpjQnNkR2ZzUVFUajRE?=
 =?utf-8?B?cFNTOXVIQkx5RkdKaFo0a29WZFVOMUZYaVlXaklyL1VlUFpEb2VPa0p6YnFs?=
 =?utf-8?B?czBIbUF2Ni9YT0x1aEQrMU5QRTU2eE1vOEV0TDZ3dFYvQWdjM0owQjZlWlpx?=
 =?utf-8?B?aGxzdFBKcnpWVW9ldnpnN09MRU1TRC9RaFNSdGJZOXo4WnVoSlJyWTl1Yjg3?=
 =?utf-8?B?OHQ3cW9sbG00czB5cWttTDAzQnRWdGxmbXo0RlJSMmE3dUdtYnpwT0xOZVNH?=
 =?utf-8?B?N1hJTXgrbjZmKzBOc0lzOFhYNG1UaXZseUZ0WklxNmpZYlE3bHhweHpDdkNr?=
 =?utf-8?B?azdVMFdxZXp2cVZBdzlab2ovT042aGJmMXhvbVZFTmFUdlQxRS8wTGdjVTRR?=
 =?utf-8?B?VlpzYm1QT3BTTkxUY2x5TWdmdzFoYWM3ajJ0L1FyS3VhVURvekI5Sy84Y2U3?=
 =?utf-8?B?dTB0Ung0aFNvRFZ6SnZqMWRUZjN4K0JPNjJvaWxxM0lYZ3pCSnFJRk12SytX?=
 =?utf-8?B?ZnN2eGhPM2RjNDZXUWdvQnV1RzJTZFhsVER2YVJiZ1ROanJnMnk2NUJhSUF3?=
 =?utf-8?B?eVhoY3BNVjQzV2krZDJTNFV2eElEQVJ0Vk80aWtQOFlmYVVkZzlDQlFPZEda?=
 =?utf-8?B?TlVZYzlCcDBkSE1NWjF4VzZibTdrSFArSUpURUhxR1V5ZitJVFBBcUE5WUxx?=
 =?utf-8?B?OUFhQTlkTHZwNmlBRzczMWluRlgwZXRjcnlmeldBMFZSckFsUmZRclRWSzFv?=
 =?utf-8?B?RWlwZHpMaHpZeElIYkZqczhBQ3hKSG9RN3hrSTZrdDlnbnBYUlZaNEw5eCtq?=
 =?utf-8?B?VVBFWnVscjNaSTVsVXZwR2tUZDhPT0lVQkdWV3BIUDdZbWkvYjVJQVFBZHp0?=
 =?utf-8?B?UmJKWmxGekQyVkdkd0NaSWpXUDlmQU9Ya0w1enBuazNDcnRqZVBITTIreHkx?=
 =?utf-8?B?OWhSOUdxNFRrUjNZVDZxeGFRTmpQZi82OTQzbUduYUhOZ3R2SC9JNXpkWTFt?=
 =?utf-8?B?QzdyVjNqOEV4MkV6Y2MrYi9uSTBVQ1FhOHB1T2Z0RmJhVGxNN1Y2WEd0OVNS?=
 =?utf-8?B?S01Ldzkrd1FEa0JXS0Y3K0pHRTA2VjBzdCs4ZzlCcmhlY00vRmZKYmNiTGVG?=
 =?utf-8?B?NUtEOThSZjlXdnpaU3VCVDBpZ0dCUEZDU0VHR3U3UXdaRGVKSHY3QjcyNXNS?=
 =?utf-8?B?Z1haTU5jdEJhMmdhMVB5dmxIdVc0WmRBUHBhUzIzK3Fpem10NnNHZlBuOXcx?=
 =?utf-8?B?cE5LdzRnMHc1WkxxLzY5NnZxOHZYcGdqYWdQTUY5ckpBQU9MN015eFVTKzhv?=
 =?utf-8?B?RDFGZjlIZkJMQTdFZG5mT3VDeU9acmk1bElqcUVJMnE3cXRmSklWVGdERGp4?=
 =?utf-8?B?MmNWZlBIRXFReFoydVFicno1UEQ1MGhabUIvUGdndnZkZ1gyS01KVERhbWdE?=
 =?utf-8?B?RWU1aksxeGVlUWlUUjIwMGgycTE1ZUVOcmY5dFhyOW9CWGZDSEVKaVhWV0JM?=
 =?utf-8?B?UzFPNmd3RzIzQk9sZ2IwcTJleHo2NHIzTStYS1p0ZVovQTRQUlJvckJwdjg2?=
 =?utf-8?B?VS9rL1VSUllCUmkwdFlvemZqRnRBTlVqT1ZCeEVFaWVCMWl5NGRmcW9sa3RE?=
 =?utf-8?B?czV4L0hzakwxVzZFOUVBSGpTN3pHRWM0U2hYa3dQalNWNjUrS3ZpSFNqMEVl?=
 =?utf-8?B?NWFxY2tlcVRQektOUFBKQlRwMmxrNVR2OVVmZ2ZQaWRJWHcyZDJyNFhFQjZI?=
 =?utf-8?B?ZCsvc1ZvVngrQXlMWElEcitvSXBlNS9BT2pUK2NRNkx4eWpwQ0lkRlptZ3Z4?=
 =?utf-8?B?dis0dDRoempWVWs0elIvUW8rS0YxTHl2czUvelhBTHpBRUNDQnRnck4yalVL?=
 =?utf-8?B?UUpaNjYwbnJhWE05VFVkMHFXV1dvRDVDZTIzNHFvUU1mQkNxMEVhek5NZE5p?=
 =?utf-8?B?a09BMWdselZQenhneFQyMzVqTW9HOEROZDVkUU5JV0t1Q0x1RlQ3aitIbmhK?=
 =?utf-8?B?dC9BK1BncEFhUHdqcUNoZFZZeUhEVGNnVDBGNWxXWVFYMC9tb1psS1BwRGUx?=
 =?utf-8?Q?Ehw7bp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 17:56:25.8893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c9434c-7e0a-4183-c8c0-08dd82902ab1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8374

From: Federico Serafini <federico.serafini@bugseng.com>

MISRA C Rule 5.5 states that:
"Identifiers shall be distinct from macro names".

A common pattern in Xen is to have a function-like macro that acts as a
"wrapper" for the function to be called:
before calling the function, the macro adds additional checks or
increase/decrease the number of parameters depending on the
configuration.

Update ECLAIR configuration and deviations.rst.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
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
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
 docs/misra/deviations.rst                        | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index ffa23b53b7..303b06203a 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -114,6 +114,14 @@ it defines would (in the common case) be already defined. Peer reviewed by the c
 -config=MC3A2.R5.5,reports+={deliberate, "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
 -doc_end

+-doc_begin="Clashes between function-like macros and function names are
+deliberate since a common pattern in Xen is to have a function-like macro
+that acts as a \"wrapper\" for the function to be called:
+before calling the function, the macro adds additional checks or
+increase/decrease the number of parameters depending on the configuration."
+-config=MC3A2.R5.5,reports+={deliberate, "all_area(macro(function_like())||decl(kind(function)))"}
+-doc_end
+
 -doc_begin="The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 88328eaa8a..cfdd1a9838 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -130,6 +130,14 @@ Deviations related to MISRA C:2012 Rules:
        memmove.
      - Tagged as `deliberate` for ECLAIR.

+   * - R5.5
+     - Clashes between function-like macros and function names are
+       deliberate since a common pattern in Xen is to have a function-like
+       macro that acts as a "wrapper" for the function to be called:
+       before calling the function, the macro adds additional checks or
+       increase/decrease the number of parameters depending on the configuration.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on the
        type of guest to service.
--
2.47.0

