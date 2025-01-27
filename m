Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB550A1DB12
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 18:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878139.1288316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSgm-0003Fz-UJ; Mon, 27 Jan 2025 17:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878139.1288316; Mon, 27 Jan 2025 17:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSgm-0003Dz-R2; Mon, 27 Jan 2025 17:14:20 +0000
Received: by outflank-mailman (input) for mailman id 878139;
 Mon, 27 Jan 2025 17:14:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEBS=UT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tcSgl-0003Dt-OM
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 17:14:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2009::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 228af298-dcd2-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 18:14:16 +0100 (CET)
Received: from BY5PR17CA0012.namprd17.prod.outlook.com (2603:10b6:a03:1b8::25)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 17:14:10 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::76) by BY5PR17CA0012.outlook.office365.com
 (2603:10b6:a03:1b8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Mon,
 27 Jan 2025 17:14:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 27 Jan 2025 17:14:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 11:14:08 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 27 Jan 2025 11:14:07 -0600
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
X-Inumbo-ID: 228af298-dcd2-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjlTPU5Bn0thS9IcsYLUMI6Xv9a9mF6+EY0topdREtc45t4k9V5yx6J2bJGGauwrwzv/uXPvWTSx1LfPyhoXN/hlOWBhEqxnmjURXYgsm15viaEzXhQC9yo5YNVksQz1enDE81E7nHv3bdw2OqGWV/O1LEayuhd8xL5egSCaGtut8SfMdsHHOj62xkGp6AOIJv+HQq+WLJaTCXMbX3nDk8rz2w9e1WsATefc56kcDRhrRcpnv8sC2sPSLsn+miD2zPHtxw6qS0W8sfIXPWkY1cKw3sBJGP5GEWPBi8c9gMQYCvY7fb7YL3Z9GVx5nDSBBjMT5wnJhcxbWS3CqHN1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXis3nhLG8AF4MFQxXJYh6zaHOKEM8fpkYY5dwAURtI=;
 b=i/YBB5izRS98UM6hdexl1kzLIsmG7BZk8VTQ+NUhqF03FIwfn+n7Z36MTAcaOTZTGXuMZIljBE7Wd+SoUjR+xf51GF/OxnPjNFQxwHpC/t2So93lCjTi0JCqlXsieAX/4y2C4nZEOFEOponAyzd/UtlbkM+QlYOaedpo3FKUYZOpTA0dEK09xt3cJDN8WOxiJELMKQ5BFyYvtmaLiLO6UemVtwlYkl22ovAUS0Q3c0GvTCdHEIUUyW2k8GFGKN4VKgc8f1G/SHCqti/2cPeZ8sMkf0OnmuDL4f1wCrUc8xoJRf9mZMtoasDzJ18Ntqsc+V2ofNX1AouNu9fv0zfqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXis3nhLG8AF4MFQxXJYh6zaHOKEM8fpkYY5dwAURtI=;
 b=gn9nvGnWz6oSt5MUG/Z3lDA9fpJNwwJKRT/LOy7TsY4GMtbRt3jLhE72cH/M/vuSqglQEkU7hHILjFtaNtjMj9EpT5SInJfhOmDjqDQT6MEJrtgQbgnVy7ODsQgjwBdKk+VAi8zJuIUrkMTxed+wd+AojQfWvOaVzkOPe/lU9yQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4788ed30-f182-4fd9-aad5-5faca3580e3b@amd.com>
Date: Mon, 27 Jan 2025 18:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20][PATCH 2/2] xen/arm: Fix build issue when
 CONFIG_PHYS_ADDR_T_32=y
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, <oleksii.kurochko@gmail.com>
References: <20250127104556.175641-1-michal.orzel@amd.com>
 <20250127104556.175641-3-michal.orzel@amd.com>
 <D7D0O214VJBT.18EFVF7AJACYQ@cloud.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <D7D0O214VJBT.18EFVF7AJACYQ@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|LV3PR12MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc53cc8-1468-4e53-13ae-08dd3ef60329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODFNV0F6bGlFbERnbDUrbzQ2TFFvSFhOVVlDU2lVRWdDeXg0TVlOUXNpNTBj?=
 =?utf-8?B?ckpsU0p0N044dGU3WlFTRmVrTXpaVjMxc05OZnd3Tmd5blJwOTdNa2tWMXhP?=
 =?utf-8?B?WFJlR0lpODRNMGFnclNscEJFUFViaG1vVDR3NytxWG1YdjlGbm9kY0JscnJw?=
 =?utf-8?B?dTFFTURqVnZFUWVLLyt5U3BvUDRidWlKaWp1YWVINVVqTklnVzgvc1lTdXQw?=
 =?utf-8?B?RWE4ZGltZ201OEY3ZnBPaGFlY2M1ZEV2Q2JPdW15VmtycHhwYk1RQlBpRHl1?=
 =?utf-8?B?WFZ5bW4vQmlONGFTektjb2MxblhrNktGWUxtcW9Fa0Y3YUU3MHl2QTVNamh6?=
 =?utf-8?B?R0tKVjZZaTRRM1FhWVBNSzlmUUpDOThlZmlnZ3VXR3FlZldwRUZRaVpZT0NN?=
 =?utf-8?B?RUkweXBQR2pZZHQ4NEJxT015MmM4R2s0eCttTlF0eUo0L0YvN1Z2UE9tVjJn?=
 =?utf-8?B?c2ZGQldNUEI1cElPK1RYTTlUZnNxcXcrWXc2aENwUkRBa2FkNzQ1RHZad3dG?=
 =?utf-8?B?Z3VHME1vNFl0c3ZrWnZ3dWJyRVRGV08zVllVMForOVdnVzRSNmNzR0xJMzN6?=
 =?utf-8?B?MkRlTkVxdmU1VUFEaVVGdjQxcDUyZk5PaE9BVGFiZ2FpY0hsNldWaEtkaEY2?=
 =?utf-8?B?RDhCWWljSDdrMDRmQkRqWm95enRVaTdGNkxadFcxNlROektkVDBsVVpoNFND?=
 =?utf-8?B?dFIzamphcVF6Y0tOV1k0YXozR3ArMTlFNGdkdWJzYTA3QmpQdmdQT0xpNWcv?=
 =?utf-8?B?dmZBcno0ajlRajgrMHQzUHhKUmRsdjgrTEJNSHNYVk1POFlGNFZNL0c3SnRX?=
 =?utf-8?B?VExsU3JyYXdsNk9kNVd3aXBnZVR0VGdDMmdJU05BTm9BU285ZWYxeGd0SVg1?=
 =?utf-8?B?YVJ1ODF4U0xKRUFEVGIzeXNhQVJpWXlaSzZueDArWDZZQWJZTTZLNG5UVXJW?=
 =?utf-8?B?SXYvVVJ1VVZCNnY1NmpyT2xiQXhWays1ODRtaVJXWjhKc1E2VCtMdVQyRktF?=
 =?utf-8?B?Z2N0bERHVGFTb3phUjZIWVpsQWVRQ3g1RzRTVS9BTGNuMUJNZU9tTEpsVkww?=
 =?utf-8?B?bC9ZazRxK0xaMUxMTDRqZld4NkhkcTVrbzVaUW5QTll6cXhzaCtoKzE5Vk1J?=
 =?utf-8?B?bHhSaGxWUGk0OGc1dHptUW03eXRNOStUWmplS1kwZGE0SnFuS2VhT21oMlAr?=
 =?utf-8?B?OVpobnlwR0lzcERYR1pnZzVWZ2tLMEc0M0o3NE9UYk9rS0gyT0JOb1VYSU90?=
 =?utf-8?B?R2lRTVdiM0VuQnVwZUE2aFp1aU5rOG9tUmJjb2hvaGRIRWVZOXF4U1JTOUlp?=
 =?utf-8?B?MlJpUnBnTjh6dU9IMUhMK0F3MVJKSExsbDhLd0lITkdrZW9uQmJ1VjFWT21T?=
 =?utf-8?B?UVJyVE1GaXBtbDIyZ1gzdG9WRjlNRjA1K0lNckI1cVZldWVud2UrVW9IYXdv?=
 =?utf-8?B?c2tsOUxDVjdIdnVPMmJjbXhYODRTL2dkR09CeU5FU3RSR3pxWHlIa1ZGMUlX?=
 =?utf-8?B?QlBXUkovMGRlWVJuTFh3bFRJMGRaZExWSWp6UjVHSndDSGkxVHhlZURPNU1K?=
 =?utf-8?B?M0lBRnF4RXhPREYvYU1HbGlrN0F2MzhlZ3N0L2I0b3VuVFZKWkhXT3N4amlh?=
 =?utf-8?B?WXFLSWxQTm5ET3owaUkzNHltbVgrdlYybTZvclVwejB2RTk5akUrZFREbmZP?=
 =?utf-8?B?QjJ4c1VEcEdSUC9lYWptWEJIK2lyQ0RieEVIeVBTVWVLN21MY3VIRWtOYnlh?=
 =?utf-8?B?NDlwZ0IwSmVJcC9tNHd3RlhaYUx4a0hKWXdocWtIMzc3TG5GVENuK2NTRElK?=
 =?utf-8?B?T3drb2YxVG1vVFdQUWRDamhXZ3JCR3pyZ1lOaGEvd3lDbFhzeVBqOFp0TVZp?=
 =?utf-8?B?RkNJMWVxQ29WS3lsdEtxTXZzUytNRjhJVi9YdWYvSXRCOVpqZURzT0JqREt4?=
 =?utf-8?B?ZEtEalFzUE05Z1NVVWFGU0MxMHk2cEFXSnRDRVRMeHZ2SjltRVBsUUtKWVF2?=
 =?utf-8?Q?dAL/iAEXAzg5eKYOfVL9AxxtQsaQ0g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 17:14:09.1597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc53cc8-1468-4e53-13ae-08dd3ef60329
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265



On 27/01/2025 18:03, Alejandro Vallejo wrote:
> 
> 
> Hi,
> 
> On Mon Jan 27, 2025 at 10:45 AM GMT, Michal Orzel wrote:
>> On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is observed:
>> arch/arm/platforms/vexpress.c: In function 'vexpress_smp_init':
>> arch/arm/platforms/vexpress.c:102:12: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'long long unsigned int' [-Werror=format=]
>>   102 |     printk("Set SYS_FLAGS to %"PRIpaddr" (%p)\n",
>>
>> When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long.
>> Commit 96f35de69e59 dropped __virt_to_maddr() which used paddr_t as a
>> return type. Without a cast, the expression type is unsigned long long
>> which causes the issue. Fix it.
>>
>> Fixes: 96f35de69e59 ("x86+Arm: drop (rename) __virt_to_maddr() / __maddr_to_virt()")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  xen/arch/arm/include/asm/mm.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
>> index f91ff088f6b1..a0d8e5afe977 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -263,7 +263,7 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
>>
>>  #define virt_to_maddr(va) ({                                        \
>>      vaddr_t va_ = (vaddr_t)(va);                                    \
>> -    (va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK); \
>> +    (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
>>  })
>>
>>  #ifdef CONFIG_ARM_32
> 
> Out of curiosity, why not make va_to_par() and __va_to_par() return paddr_t
> rather than uint64_t? Then this cast would be unnecessary and the expression
> end up as unsigned long.
> 
> That would also cover any other uses outside this macro.
> 
> Unless I'm missing something else...
va_to_par() returns uint64_t because PAR_EL1 on Arm64 or PAR on Arm32 system registers are both 64bit.
So, it would not make sense (also it would be confusing) for va_to_par() to return already casted value.
The function ends with _par so it should reflect the register size as the name suggests. Macro is there
to cast this value as it also takes into account PADDR_MASK and PAGE_MASK.

~Michal


