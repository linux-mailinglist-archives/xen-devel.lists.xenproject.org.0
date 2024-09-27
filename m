Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F95988C56
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2024 00:13:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806555.1217939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suJCe-0000lx-9O; Fri, 27 Sep 2024 22:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806555.1217939; Fri, 27 Sep 2024 22:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suJCe-0000jl-6o; Fri, 27 Sep 2024 22:12:44 +0000
Received: by outflank-mailman (input) for mailman id 806555;
 Fri, 27 Sep 2024 22:12:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KsRj=QZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1suJCd-0000jf-8F
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 22:12:43 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2416::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b8ee5d0-7d1d-11ef-99a2-01e77a169b0f;
 Sat, 28 Sep 2024 00:12:40 +0200 (CEST)
Received: from BN9PR03CA0857.namprd03.prod.outlook.com (2603:10b6:408:13d::22)
 by LV8PR12MB9335.namprd12.prod.outlook.com (2603:10b6:408:1fc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 22:12:35 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:13d:cafe::ad) by BN9PR03CA0857.outlook.office365.com
 (2603:10b6:408:13d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Fri, 27 Sep 2024 22:12:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.0 via Frontend Transport; Fri, 27 Sep 2024 22:12:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 17:12:34 -0500
Received: from [172.18.112.153] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 27 Sep 2024 17:12:34 -0500
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
X-Inumbo-ID: 9b8ee5d0-7d1d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cd+J7QlTLW2RHcGsD5DBitMyqx/t889Cu8SHA4C8SBdMpFqcA+ONKratCZOSAi/rDLgB9yAg1W33rW8QwjAHu2aQZn5RLkFc/iEzZEXj1PkBEVVHeufcn8+d8pv9O+KWbB4ztr7Iq5xeAuCVkyFUQ+7FiMnCfKfSowPXyR7cLxGtpv7bk3PV7HoXyBoV0noBJq6wtknONSzj+LCT+XG0WHaQQ6QOnF7x4VpgIl/99ddqEWpJ2GR+p8Pq5s1Zi7PYCEvi2fn9hNewKCv2zcPxocfT/26ZUfyBy/aHRq+wXpdUnWoZDwEtdjHyxK2wJwjiqoL5kbZIuC2xxeiebLa5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s40uRk3UtBizo0GptK6ek3Ty2ez5G/xN4ICAoAukDEE=;
 b=gDYev7QqHdnuYiCeAcm8jJ9g+TceQfEeYhc3Ur3/nGqqxrGxFMogRLj4p6i8KxdodcJ5lQw3yn7tpKA6Jj21wBOeIWf6YGQkXUgYsg4mBgr198kFl4e1lipLBaWBbMKHz3W8+2miGavKl/76abMlDucTwnDlntQ/gfEokdoldbfJqEWzy+6zQ4U/sNnvIwpSipeaX9HG0x58ei9vzUp3IEMiSMrIJ0X/JYJQiAt2AOvon2ikvpUVYbKIAawM9WUUTYLUXIxYdPsuMbX8t3NYsxwLPIipba1cuLoEkvZJCKm2TPu1Kq5GPNBH2PSGshhwgE5DDt5MlTmZsD8nk6l/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s40uRk3UtBizo0GptK6ek3Ty2ez5G/xN4ICAoAukDEE=;
 b=TutK6RzGFFecmwWorqd9NXfh1yHlezm/lRzVAA6zfCf1vKoGj6mlwu4nNFn4C+meKVfGrA7lgDwnypUHoDKz8uHplfc022d38bvsyxyOoVwoaegAXqvXpuGVJcOOcSOthXF7v/f1TZUWJTV9UKoceXF2Zn8ipxV8foS3Jkpw8dI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <81185a7e-9fe5-4e97-8e67-11cac946f263@amd.com>
Date: Fri, 27 Sep 2024 18:12:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/pvh: Avoid absolute symbol references in
 .head.text
To: Ard Biesheuvel <ardb+git@google.com>, <linux-kernel@vger.kernel.org>
CC: Ard Biesheuvel <ardb@kernel.org>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, <x86@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240926104113.80146-7-ardb+git@google.com>
 <20240926104113.80146-12-ardb+git@google.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240926104113.80146-12-ardb+git@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|LV8PR12MB9335:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ecbf3a2-78d7-4bd7-a6c9-08dcdf417db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N21nbjFSRkNhbFo2RmdFbDZWSUxoN3N2Wk1ubGU1WWZxQmRRSHpmZnFoeXB2?=
 =?utf-8?B?UXV6K2FxQXZJdmtjUHR6L2hadkpaZ2kzbVRhU2JsbzRZcnJIaHQ0ZHFiQld1?=
 =?utf-8?B?YXZJcU5DZndrTmhYbXVPVWVHRkRQY2VlbGwzSmxENTUvMDdHWVpRMk51bTFR?=
 =?utf-8?B?YTBiYjFHZzk3VHdxWEtGYWZQTng4ang4Wm9yM2RaVjY1d3pjRi9JWXZmV2pW?=
 =?utf-8?B?QlBsK2JSQythcDNML2t6UU8wckJVWDh6a2RCVTRYR0Q4TVltcHhKYy81b2FE?=
 =?utf-8?B?b3hCQjZscVhLbXFOdlVYOEdLckErRUVFV1g1RGxINDY0WEk5bDJvTnBQS2FH?=
 =?utf-8?B?SnpXZXVCUXU0dC9oMlIrK1hQWTlxWEZieFhhbCs1L3NieitIYmdUblAxZEdX?=
 =?utf-8?B?bXNMLzdrQTErdzcxUll0cW9iSWJOVmtXSWFLbjNseFZqOXc0VE8rcW1PWWhw?=
 =?utf-8?B?eG1FVkNUUDF4YlUrUkNvZ25kcVJtdjVNcFkyU0pjLzdRWEV6NTBQL3Q2QVl5?=
 =?utf-8?B?YWVFWDJVZ3Z3SGVwVXZRN2hyYUFuNktvRWtJa3Z0WEZCc0Q5aFlLWFdDUXVj?=
 =?utf-8?B?dkMrdHpESGRBNkZ4dmdneEU4M1htMVZiZURkTHZFMnFVbXlCNUNVb3J3MHNr?=
 =?utf-8?B?NktsU0VCeHhEWGhseHg1TzdjVi9oUkhZcWh3R25WT0QzVVl5SWp1UktqWDJ2?=
 =?utf-8?B?SWEwUTRDRTF1akQwaHlmZ3dLb0FkUGkySXhWWjV6eTlUZTNRWjd1OWpWNElZ?=
 =?utf-8?B?cUhVbkdUZG9wNFNkZFdDQ3NRdWRzZWhjZXMydGw5MWlpZ21HL3V1OVdnUXRP?=
 =?utf-8?B?T3JmZENMeVJTSzZaSVhuNE5IeXhVZ3cvQ1RLQ1pPUnEvekdFZ2hjcmd0Q2VU?=
 =?utf-8?B?SGZZQm13SnpNT1g5T2M1N2dIUFNvS3BjK1BKMUNTbDJ6K1FpN3ZWOGxjeEtF?=
 =?utf-8?B?TCs4ejVQNkxKWThzbjVZRk1WcXJOaXcrR2xuSWF0YzFyck5FMWxIUnExK0ZP?=
 =?utf-8?B?emJYVkhQZFJXRnZYTmFmZW5oTlRPY21GSnN0cTdtbCt4VGQwMytyWkhqdVVl?=
 =?utf-8?B?U3F2RUJuRU41YWp6U09DbDdHU3ZRL0t3N2FSbmVERnZsTWNlRjI5ZG9TK08v?=
 =?utf-8?B?eVozQjlJMjlyWU5sbHVIMXlmWDRWOGRKajB5NFQzSFlKc3VhR0ZnRThxWEc4?=
 =?utf-8?B?Mlg5NTY5VlBFZkZzRUc5dmtxck9NYWtieSs3Ny9wWXpNMjJDcFVITFRMRFVS?=
 =?utf-8?B?Unh0clJ2YXpGbC9JUGpYa1RKQXpuaENzSjZvL3dORzdMenhxRjVWOGpmbjJv?=
 =?utf-8?B?U3JmVnhFMG52cE9Nc01YNDd3ZDhMUzR0TDM0cjY5dDNCVmNKd1AzNkxTNXNC?=
 =?utf-8?B?ZXZ6enFiaDM4R252SHZKeUQ5YUFkS0djZWxhUW00dS93MXI1eXZMRnlQU1VE?=
 =?utf-8?B?V3o1Yyt0MCs5WkZZYVluNERJRlVrdHBRT1BTcHp5Zk52RFRRZnRnUkxHQlZC?=
 =?utf-8?B?TlRwUlp2ek1RTmZOM0hXbUl2V0ZTei9mT1JaaHpKSlJkSWJLSWdTa3NRd0RG?=
 =?utf-8?B?SDlQUU9CSGdqWUJReTlLTE1XTVV5TnowZFFDbG43UFVxeVVHdUY3R2s3SkVY?=
 =?utf-8?B?L1BNa3d0d2dHT0NhcElKdjM3TGVGOWhpSm1rbkJLckUwMjBSYzFGeExhSjAx?=
 =?utf-8?B?NTVLRUt1RFZGdVlHbmlDY3B1L0ZtUUtoYzYzb3l4NUV0ZzloTit4V1pwUjVm?=
 =?utf-8?B?dG0vaGNPVnFxNyt1bGtTcDdPUnhnTEtrZFUraVFuMlZjTVdDSzZHNW9ZVGpR?=
 =?utf-8?B?eUhiSDF6YTVnSG1lT1ZhdmlVNVFYakpVSytGelczZEFpc0xKaGNwNURjcDdJ?=
 =?utf-8?B?OUhYdmVxVXZ6M2tBazlnYkJKakxiVmF2ZkpQK2FpNWVONG1qeitrZUtFL1JJ?=
 =?utf-8?Q?RLDljXrcU1OST30hmhMgrxYdjmg2Jf2C?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 22:12:35.4329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecbf3a2-78d7-4bd7-a6c9-08dcdf417db9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9335

On 2024-09-26 06:41, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The .head.text section contains code that may execute from a different
> address than it was linked at. This is fragile, given that the x86 ABI
> can refer to global symbols via absolute or relative references, and the
> toolchain assumes that these are interchangeable, which they are not in
> this particular case.
> 
> For this reason, all absolute symbol references are being removed from
> code that is emitted into .head.text. Subsequently, build time
> validation may be added that ensures that no absolute ELF relocations
> exist at all in that ELF section.
> 
> In the case of the PVH code, the absolute references are in 32-bit code,
> which get emitted with R_X86_64_32 relocations, and these are even more
> problematic going forward, as it prevents running the linker in PIE
> mode.
> 
> So update the 64-bit code to avoid _pa(), and to only rely on relative
> symbol references: these are always 32-bits wide, even in 64-bit code,
> and are resolved by the linker at build time.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

