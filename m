Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39792AA7D71
	for <lists+xen-devel@lfdr.de>; Sat,  3 May 2025 01:49:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975207.1362844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uB08U-0007Cp-H6; Fri, 02 May 2025 23:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975207.1362844; Fri, 02 May 2025 23:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uB08U-00079t-Dd; Fri, 02 May 2025 23:49:42 +0000
Received: by outflank-mailman (input) for mailman id 975207;
 Fri, 02 May 2025 23:49:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3DVg=XS=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uB08T-00079n-AE
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 23:49:41 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2009::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b0fdf08-27b0-11f0-9eb4-5ba50f476ded;
 Sat, 03 May 2025 01:49:38 +0200 (CEST)
Received: from BL1P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::23)
 by LV3PR12MB9259.namprd12.prod.outlook.com (2603:10b6:408:1b0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Fri, 2 May
 2025 23:49:31 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::fe) by BL1P222CA0018.outlook.office365.com
 (2603:10b6:208:2c7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Fri,
 2 May 2025 23:49:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 23:49:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 18:49:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 18:49:30 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 2 May 2025 18:49:29 -0500
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
X-Inumbo-ID: 1b0fdf08-27b0-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkKXhpd6QDp6EpsEbtVQjnoPzptoKDrTIvSsU+lWIenUtWQ2qrcuNDeon79jFpRyNgZT3K8y91311viuHlLy5eiYOtlqSSHfZpxbie/GMxv0BlLzVGfrcWvVpxqrleJ2KRygIGJPeFANna2lQuTHXCDk+l+zhvnZxiQ0xViCOHTzVPIi+gEtVJF/Z47C20++gajCwfOAhPHBnomYJ6FIdekxl3aj8HoVd8qRw8Ss7MJYoLeUKt3/OwpYwKGxAra+OHa2iKOfdHw+L8GTxPXcLDolsn14qIfBj88KN6SGbQ+388H0O6M8F82bNZz1usL9yrijIz6a55C1ICQTtaguLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3GXvT/dRldNl7HSwbI9tZbjBB2dQtt28Sk8QVn76Nk=;
 b=CEuKYzEkHcrWmG1khtMq6Bxf86Zv+HdegoGZexev3xgCc0RDl+gB8XmhKWx1TI57wyRMurk4ilDYNPtRHDO7+u4x3hi0IutLolVkydvYhvId9ABFtEhQlqPz93I/zwwPdsvtvdPRb3YPTkAcpiILfeLuM/KFc6bpGBlVSyG5QCuctM19MKJCXrNi4BFB+4CnTBFmdAJUBUEAdFV4tcCYMhMlWWhCB7firwi/YX/guSP1JhcxHxRbbdHNyZKs3m6LNlLgeGcKag/qZV1Tv67840wXwD216mjQrhApjKnhfcRASlI4SAtBIKkm927GN9JGWhkdl14oK0ZjQYSU+/Danw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3GXvT/dRldNl7HSwbI9tZbjBB2dQtt28Sk8QVn76Nk=;
 b=Zit6XrL+0QxnVZ6tHByBmslMxMcRyS3mstvKqCF1X3H2yEtFr+I6DTr+4P8aWxFf5mpVuAbaSNuSJJsMEhNF3ec9IfYfnf5l4Qfyoh2d9om5F2MJaFQsVW7YxecPFmZOPgLBFrkc2Dac3/DBFM4K3UHq14kowwcv0tCEVuk0LsY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Victor Lira <victorm.lira@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v2 1/2] x86: x86_emulate: address violations of MISRA C Rule 19.1
Date: Fri, 2 May 2025 16:49:13 -0700
Message-ID: <20250502234917.3533514-1-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <68d30d0b-1f85-4480-a2e1-0c9c5effb49b@amd.com>
References: <68d30d0b-1f85-4480-a2e1-0c9c5effb49b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|LV3PR12MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f47872-da3c-432b-4986-08dd89d3fbc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnNaNVlSejdXTFNIQ1lXSW5mUjJFODR2dkYwSW82d1ZvSGpRSithUHd0MUJu?=
 =?utf-8?B?bUpyZ0VpQ09NNDM0V056YUpRWjVPdEJJWjNsdHVPTThIMDhUN0NGOUJwbzdw?=
 =?utf-8?B?Q3k4RSs0MW1kVUVvMGV3MG1CY21GWGtCeWtVb1haQzB4RmNkTFJtZWxJRHI5?=
 =?utf-8?B?VUcvWURMaCsxMFZjbHBkMmdOM0diZFdCcDNGcmlNWE1RS3laYVU1T0hHMyt2?=
 =?utf-8?B?VStJYVZCNWVQQitTMHV4V2RWaytiWXpPRE5YdTFlNFk0MnhUTXlKQVpoOVMx?=
 =?utf-8?B?OFB2MHVGYWtkTStWN010ODRNTFVPNWpMV25vWEJNcGl1czNxNDExRVdrRjFl?=
 =?utf-8?B?ekViRmk0a3FweUVkajRLdjJxK3RGSGFZQ0l3ZHVwcTZGODJqOXEraWh0Tnlo?=
 =?utf-8?B?THJZYkxaQ2FaS0JtVVg5NUtrT0R0bHp6dE1MOFphcndTTnBFMFMrMDVwOWV1?=
 =?utf-8?B?dmIxYk9DQ2JHK091clVEdHBxNnBPMS92NGdGU2l1dEo1bTVsL0wxMm5WU3h0?=
 =?utf-8?B?Z1JzcTV0aHhqUmpBRFZRNkduM2lMbEFRVWZhendEanlnYlZyWEVFYVBzeHBN?=
 =?utf-8?B?aU1laVU1UUkrOWs2OHdYc082eHA4UGF3UjRWYW1DMnUvcmJSZmRHeXJiOEwr?=
 =?utf-8?B?L2R3L3ZCZERqV3lSMlNveFhWZE55Sk4yVkw0eWxQTFNqYlJNaXRDWWNzd0Qx?=
 =?utf-8?B?TCtkV3F1WmRONm5QZ002eXlVWTZOZnJiTFRQdTZNaytueFdNZUpGN2d0VDVU?=
 =?utf-8?B?Um10R096dG1OeEtpeS93NHd4KzhJcm1RdEVwYi9CM1hHUmFaR3Q2WHQ1dUp5?=
 =?utf-8?B?MEI0VnNMQVhrem05dERNWXNkemZadFVEck5JUDVCNFlBTmJjN2pVTE51NzZ4?=
 =?utf-8?B?ZVA3aHRNSHZyMXFxODNBNHhOcitGR0hlYnczeG1ORVpFZTZOV2xzRWFNYUE4?=
 =?utf-8?B?YnZNQWFaL3VWWTRBYnhwYWZQQnJSbS9TR1B3KzRGbEkzZkdyRzJDQjljN0t5?=
 =?utf-8?B?MzFqMlNKcit0T1FwSGhrQ2FXOU50d1YyRytFdTIrcVFQWjZBTjNRWDdMR3lF?=
 =?utf-8?B?dnl2MzFyajRMM21ZUFZUWThDNVlndC9WVTZLSHZZSy9NWHhhYlMzVnRGYUE0?=
 =?utf-8?B?UWY0dUlwR3VKZW43VkxQT3p2eVZRdG9nb2ZEZ21TaDhhTTg2TEdNV3p1bkhL?=
 =?utf-8?B?WndKcWhOT3hIU0lMcEQ0MThjVFlxb0RkTmVyUmt6KzNCUHYwVFRHTnFwa2Vs?=
 =?utf-8?B?NFpIVncwakViOVlFZGN1M29kN01JVWNOSmNzbkV6R1hsNVVETVEwbHZ0Ty9U?=
 =?utf-8?B?V1RUUWNIVExCZDlQZ0Z2U3VCM3lFMktnSlJVaVZ4emhieFhMWGRWMVMrMFFR?=
 =?utf-8?B?VmtIWnNDYldFU1hJRTBjYWdRTTJ4a3VhanQwU3JzWDJOMGxqNlBPRGVRS2l6?=
 =?utf-8?B?WjVOZlEvTWUxbWZQVzU3VTZaUktPRkFkU25XUCtkbVFZdi9nSmw1UXl4YXdK?=
 =?utf-8?B?OHl0a3pBaERsdUFQQkd1WjBlVkhnRkRYMXJvOVQ1VVh2Y0lQT0pTNzBYZnhT?=
 =?utf-8?B?d1RsRDltTDVvcXV4MXJWd0ZJbDdXNGhoZnJHeHExb2lCS3lNZUtnMHQ3am9w?=
 =?utf-8?B?WjA0andnbXh2TFFOZjJqZXFUMmFRZzVIbTBJaTVTMTJ6dWJzY3dJRi9zTHZV?=
 =?utf-8?B?UWFHZUU1UG5BM0RwMWttMlIzdndJOHRpbDE4eVVxY0crNTMzMG1RS1dKczNV?=
 =?utf-8?B?UEVHa253RzZEbVVGT2Z6QjlLbVhLcncxZHZ5OVk3QzNqNmkrWVBpTllKdEtR?=
 =?utf-8?B?akp2KzQvM3dOZVV2QXgvQlovNTd5KzEzdWVzVUpDS053cHVuSGYwQ0JUMDhi?=
 =?utf-8?B?SGdFRE5sbWlBdS9IK21oTjRINVBxWTVyUkxFUnlPTlJlNkkraExYa3drTVVF?=
 =?utf-8?B?cGZ3L0ZUSkhORlg0cy9KeGVQaU9hcmZaRVppNzVMVjlzTzFHSHFFUU9WWUov?=
 =?utf-8?B?OWtzMjJOQzgvck9pMnkySWZMako2YVpCWXpiVlpldTZhTmhQZ0xNY3dxUzhx?=
 =?utf-8?Q?R2Vv01?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 23:49:31.1207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f47872-da3c-432b-4986-08dd89d3fbc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9259

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

Rule 19.1 states: "An object shall not be assigned or copied
to an overlapping object". In the function like macro "get_rep_prefix",
one member of a union is assigned the value of another member. Reading from one
member and writing to the other violates the rule, while not causing Undefined
Behavior due to their relative sizes. Instead, use casts combined with exactly
overlapping accesses to address violations.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Changes in v2:
- Use casts combined with exactly overlapping accesses to address
  violations
- fix commit message
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
 xen/arch/x86/x86_emulate/x86_emulate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 8e14ebb35b..d678855238 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -527,8 +527,8 @@ static inline void put_loop_count(
         if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
         {                                                               \
             _regs.r(cx) = 0;                                            \
-            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
-            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
+            if ( extend_si ) _regs.r(si) = (uint32_t)_regs.r(si);        \
+            if ( extend_di ) _regs.r(di) = (uint32_t)_regs.r(di);        \
         }                                                               \
         goto complete_insn;                                             \
     }                                                                   \
@@ -2029,7 +2029,7 @@ x86_emulate(
         switch ( op_bytes )
         {
         case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
-        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
+        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.r(ax); break; /* cwde */
         case 8: _regs.r(ax) = (int32_t)_regs.r(ax); break; /* cdqe */
         }
         break;
--
2.25.1

