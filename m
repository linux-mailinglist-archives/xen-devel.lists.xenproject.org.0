Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B7DB3F654
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 09:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105725.1456572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utLCf-0006Ni-O6; Tue, 02 Sep 2025 07:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105725.1456572; Tue, 02 Sep 2025 07:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utLCf-0006Ka-Js; Tue, 02 Sep 2025 07:13:17 +0000
Received: by outflank-mailman (input) for mailman id 1105725;
 Tue, 02 Sep 2025 07:13:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvP2=3N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1utLCe-0006KU-On
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 07:13:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2418::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49ae3519-87cc-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 09:13:13 +0200 (CEST)
Received: from CH5P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::26)
 by IA0PR12MB8256.namprd12.prod.outlook.com (2603:10b6:208:407::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:13:08 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::c5) by CH5P221CA0019.outlook.office365.com
 (2603:10b6:610:1f2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 07:13:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 2 Sep 2025 07:13:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 02:13:07 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 02:13:06 -0500
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
X-Inumbo-ID: 49ae3519-87cc-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkLiALWYPvp/3guEW3yZJRJKSUdyiHBsGT9FEiEhcLahi6SGa/uo/mdP7XhpztTUbBR/ctbj0MR7sgAosuHrOENtiluwDqxANNyXqMLiOIKHivL2yRRrMCmMegSLh8Ris6wptOYjKGCUruMzA1lL4+++WkWHa0c1sA/fA4mp9vzxeLcwpDmHB1fg+idV+Km356OLFHWAlMvU6sAlH7ejmonfd/TTevoj3VJD0f/RBOE86VNzWtRceJ6agFk+asWBYyfUCwmZrvLC3LwgjNukS0dfuO9p7BcOuVFlmgycKhOTOdRhshm9ZIWbLtTBMuB0DzjLpnxfDyekU5piV6ORBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzC0ktdehDgC+okBw3AnDkzV7KrQTUdhJBzFbCOXxVg=;
 b=emmGxHTnMULwJMVeRNKLQtlhXV+PfAtqrots/5RIWcm4BPlhZ8pPRMb44R7Uo1jgvT5rfgYKikip4eBCZZtzFX9fYbzFVI8YSTsDovFdN6w1srSCqs51gE939Wf8qi89Oc8GTwDlpN1MV8CJjbO+kI8PArIhyamZHMEgvxNE8qCctH2GPHZIHekPdF0dtDU825PAhYaUY3yAsyg5uKQ8X/9emcEirldkVCodDVzT3gmTeChA8i9IrrhnR7sa+FhjzTWwT0y9vLf2YVKLLvXB1bKWQopKgTOSR8kNSDB+heKeseZyAb2nKBou2xgj3ashFv0QSfHC3XBv1Pe3svd91g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzC0ktdehDgC+okBw3AnDkzV7KrQTUdhJBzFbCOXxVg=;
 b=M4cT8ZMx4R3m1dAVmVZ1eOeASY9f7O/NqKq2jzEqonJR2YOymDNDdJ8a8AYaj4Nz4+QnYnDZ4Imo/bsQrWekxA9ImIwBNSrVVQDAY4EO4QUVdQvDUb5MxOQQUaTc8yuFY6wid2n2C48x4T7RmZJT/Zv+L2yhorq9JalbNQZ64h4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <73b47ad9-5594-4684-bdc7-7655fc686633@amd.com>
Date: Tue, 2 Sep 2025 09:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: platform: Select GICV3 dependency for RCAR4
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250901140231.1322170-1-oleksandr_tyshchenko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250901140231.1322170-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|IA0PR12MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a0fb1f-f7b4-4170-31b5-08dde9f02b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2RRaEsyU0s4ZUlBeEk2U2QzZi93Y0JTSXFRYzR2d3ZCeGRabHlNK2Fpc2Zt?=
 =?utf-8?B?cHpteXZMTnRBREZRQXExa005ZkJmcXcyQjIrMEVWa0F6bTl6NU4yYm1Vdjc2?=
 =?utf-8?B?ZjVrNDlCWG93OWtVME55U2VPbXNzVis1cjNwM3VaU3ZWQjdTSkZlQ05iMy9x?=
 =?utf-8?B?V0UrbXljN1VvZE9wMmIrV3ZodWhPZXdPSURDRkhUYWE5SVllSldRbXFYT1Jw?=
 =?utf-8?B?YmRwWDBPbkh4SXNIaldmQ3BjQStzU1kvSmtyWWt6YTVEVFdEWmtVTVZBK3Z3?=
 =?utf-8?B?YzdzZjNxTEUweEpsZXVCdmp0UXh4OS9oZ1pNOUd6K21reEtOVTZZaGR4U0NZ?=
 =?utf-8?B?WXgyeDVJQm1OWlFhazRsVWl4QWp1UnRONDFXSG5Ua1p6dVhJcFNuQlNVOXhM?=
 =?utf-8?B?S0sxdVlrNGtoYzVUTFZEbTU5dWhteWdiZC9sZFlwcHRIU3RWOU95RUhxczhX?=
 =?utf-8?B?NStyam8zb1ZVbnRNaW1ZUnVqYU1pbkgyazJUNVFUM2lid0JwaEtqb2F3NVJJ?=
 =?utf-8?B?WDFUYURHNERjYzF6SldrRUdra3RraHF4ZHkwbmg1QUp2dkxBS2RZTHdHdGk1?=
 =?utf-8?B?czh1cWZITndJMGZzYmJDdmkzaytTVkEwN2EwbUxhZHRXMlM0TFIxZGgzVUs3?=
 =?utf-8?B?aElnSWFNbGh4ckpJd25nVWE3SEc4b0lPYmdhRnprMzByQ0lROFhHOHhnK1cy?=
 =?utf-8?B?Mlh0U0p4L3p5VG11QU5rKzU2VW9Ib1lSNUNRWkFRVCtLKzRjWmt6T3VrRGYr?=
 =?utf-8?B?L045NFVqdURzcldRcnk4OHVEZXBOQ05DMGhab3VFRXp1eGtEZ2o1OFFQdFBI?=
 =?utf-8?B?aTl1TTBDeGc2RHBBcnVmSWZ3UVVXMGlIV2QzaFZkb2xqb0J6WmVnbERVT3Uw?=
 =?utf-8?B?NTM4ckVBUUc2ejY4L3BZZWcrLzZQVDdXeTRKbUZYU2N2MUF0c3RSU0JEeHdz?=
 =?utf-8?B?WHlWRWNtUUUrVkxvdkpHWHFCM1Y2TzF2MVVJNW9vUXZvMEw4UzBTcCtxbU9j?=
 =?utf-8?B?RmZteDBjdVUvcWg5aTlXdll4eEtkb0lRN25WM0hSNFVEL1JKMCtrN2hkK1dr?=
 =?utf-8?B?aGllRm5uN0dxWjZXQTZxZk1xREhWOVhTN3p5Y29hZ0FFdUhidENIQ1ZwMzU5?=
 =?utf-8?B?ODBFdDhFNkdsY2x1cFBIenRmdGxZNWRFbWxTeDFVVi8rRFA1T0JScWFNMjlL?=
 =?utf-8?B?bWw3bVZoMXZRWkMyT3h3dWZ0aTFFOXB4QlpEOEFCMk9kbDhLcE5DcVZWZTYr?=
 =?utf-8?B?cGQ5WXAvTytPZWZCUUFudmlINUt1RmxMVnQwMWpQR3dmMlczSzhlbCtHNmE5?=
 =?utf-8?B?d3FJbjFsVy9WUFJTRVhmS0lleS94S1ZlTnoyejRkU2tnZzZBQTg3allDS25O?=
 =?utf-8?B?TEhwdDZWY3Y0Vks0VDlZNGRaTE5BQUxWMDJYMkg1ZTgycXg2b2RUMWh6R21w?=
 =?utf-8?B?Rnp4VlRjRE1GejRzaTF0YkxCTkJsTk9Qd0VBTkxXQnlGam43dmx1UElhRENM?=
 =?utf-8?B?NEJueFdEbVNyb2pLM0lGY1pxQ1grWmRLdEdrK2hzWGFKemgzRXlNT2ZkS2ow?=
 =?utf-8?B?c1FiaUdqOTZ6TTN3Y0hVSGpGdExjNm9uL2dSM3dOZDZvTC9jQUFCU3dKMjF3?=
 =?utf-8?B?eitlV256Yi8xK1JkZ0phVmtocUVDbXZ3d2VLRWFFTlM1N1FTdVVMb21Md3h2?=
 =?utf-8?B?REdQWE1kWEtjR2FuRHoxYmc0RHREOUFlS0V6YWlPM3prR3VZakdHcUtXNERn?=
 =?utf-8?B?bmdVTDZiSFQ3UTB3dEVxM0JvRldQS01rSUtuc3R3a09IUmNGTDAwVENZMEZl?=
 =?utf-8?B?UW9CVGphYTQwTzhzNW16UWk5Z1RYS0ZweVRycnYyZng0cTVnSXlpVHhRVlcv?=
 =?utf-8?B?ZDd0bDRXMld0YTRobjZUUzZ3TldQVjdrU3pRMlNvS25TUGJ3VjhWMkFkdG8r?=
 =?utf-8?B?RFBxL1c0ZWd6Ynl3Q3ZNRmE1T2xQcTgvRUxqU2ZwWHh3UnYveVoxamN2Vkta?=
 =?utf-8?B?dkcwWGtML293bGJHOHdrMXpQeEd5YXRKSjVJZEVyVzJoTlFUaFJ0YXV4ZGFZ?=
 =?utf-8?Q?S+gjSm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:13:08.4345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a0fb1f-f7b4-4170-31b5-08dde9f02b55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8256



On 01/09/2025 16:02, Oleksandr Tyshchenko wrote:
> The Renesas R-Car Gen4 platform requires the GICv3 driver,
> including support for the Interrupt Translation Service (ITS).
> 
> Without explicitly selecting GICV3, it was possible to create a
> configuration with RCAR4=y and GICV3=n, leading to a build failure
> due to unmet dependencies.
> 
> GICv3 driver (GICV3) [Y/n/?] (NEW) n
> WARNING: unmet direct dependencies detected for HAS_ITS
>   Depends on [n]: GICV3 [=n] && !NEW_VGIC [=n] && !ARM_32 [=n]
>   Selected by [y]:
>   - RCAR4 [=y] && <choice> && ARM_64 [=y]
> 
> ...
> 
> arch/arm/gic-v3-its.c: In function 'gicv3_its_map_guest_device':
> arch/arm/gic-v3-its.c:729:41: error: 'struct vgic_dist' has no member named 'its_devices'
>   729 |     struct rb_node **new = &d->arch.vgic.its_devices.rb_node, *parent = NULL;
>       |                                         ^
> arch/arm/gic-v3-its.c:755:28: error: 'struct vgic_dist' has no member named 'its_devices_lock'
>   755 |     spin_lock(&d->arch.vgic.its_devices_lock);
>       |                            ^
> arch/arm/gic-v3-its.c:768:54: error: 'struct vgic_dist' has no member named 'its_devices'
>   768 |                 rb_erase(&temp->rbnode, &d->arch.vgic.its_devices);
>       |                                                      ^
> In file included from ./include/xen/sched.h:6,
>                  from ./include/xen/iocap.h:10,
>                  from arch/arm/gic-v3-its.c:13:
> 
> ...
> 
> Fix this by adding "select GICV3" to the RCAR4 Kconfig entry.
> 
> Fixes: 336fc7a19b49 ("xen/arm: platform: Add support for R-Car Gen4")
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


