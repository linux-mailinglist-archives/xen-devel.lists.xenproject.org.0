Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1401993FE73
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 21:41:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767125.1177708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYWEl-0005xw-Ej; Mon, 29 Jul 2024 19:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767125.1177708; Mon, 29 Jul 2024 19:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYWEl-0005um-Bc; Mon, 29 Jul 2024 19:40:51 +0000
Received: by outflank-mailman (input) for mailman id 767125;
 Mon, 29 Jul 2024 19:40:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lVSF=O5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sYWEk-0005ug-Ac
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 19:40:50 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72258ca8-4de2-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 21:40:46 +0200 (CEST)
Received: from CH2PR18CA0058.namprd18.prod.outlook.com (2603:10b6:610:55::38)
 by CYXPR12MB9425.namprd12.prod.outlook.com (2603:10b6:930:dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 19:40:41 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::62) by CH2PR18CA0058.outlook.office365.com
 (2603:10b6:610:55::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Mon, 29 Jul 2024 19:40:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 19:40:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 14:40:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 14:40:39 -0500
Received: from [172.28.183.80] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 29 Jul 2024 14:40:38 -0500
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
X-Inumbo-ID: 72258ca8-4de2-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuIpwuky7k0urVYn0m/HT2uSSrNcWXbtabZrvZVonA2GXgdCSHekZ/UJqJPgy8+TOrOwY06+nyZnlc+4Kk4XuuBHre/O/w3gcRnli2wyEaJlLwF05gR9i+lxEL7uwPzvj7H9D3iWMII/R2vzd6Jkccx6Nm5pOWufd2Nk8CDMWPONEjdcIyvmHtLMFyHvO6gapnP9FRmZd34Bb904rGAB9OTAmTifwttV6lO1oQXaMZzTRSCT9WB4emPbndPgNy9UIW8lljIHgZnFXtwOlv/C//kXre1LPx1pGAS/jtXNJ3Klt0+51Es9sCEfzetKHh7594CgoeqUdzNb+VO40alVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aABjyKaClT8pPIpFqzEgIwi5aX84o/quFhqE1As6tU=;
 b=QDjik1R97qvlNdecYYS075KNI/+/JO9q8PxxGqpO/MsLNgc1FR6qINZLWD6/LlHVnocszkAbAyAw/PzbVTLDX0JX70PGQdus8iv0uXsGtAauqgWqbAGp2KM1NPi4ukgpMylMFqOAW/PGtKDolsbg0m0UJ87EgZ0z7I2F7Xr3qcRkwyPBoz/olpfTp3skZz/I11wRfIg3ACjxDi3Ni3WK+Do/up7W4kbgLMIE2Vh4jgIArqPGTJIarD4nFK3jH8LjeW8Gfu1M3DaZQlscRu+dLVPEIcp7TZVP7fNxDan9nALRU3Cgw9ZGvS7w0ouW9l2JxiBsrq9Ih6fDxR8yY2j8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aABjyKaClT8pPIpFqzEgIwi5aX84o/quFhqE1As6tU=;
 b=AjNyOnGG1FKjKc1VvZnkJs/AGYKpj0oPeZ7IolO3ijEjVuLxiKdvieVwhtp9ChrBiV5jzZ26gTk1C8LfV3+3Bc6boL0XoxeexEo/cSQwD1u40ITsqSXZ2gHj23OhaLQ1YmXJknd8mUGXRfTe3iUFbV25rySRKUz7Hp56XrJcoWk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1cf7f9d4-9df8-423b-a033-8c93acb3cfce@amd.com>
Date: Mon, 29 Jul 2024 15:40:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm: stack check instrumentation
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-4-stewart.hildebrand@amd.com>
 <e49e00d0-0986-4382-a8c9-1934417eaffc@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <e49e00d0-0986-4382-a8c9-1934417eaffc@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|CYXPR12MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 006187d2-e916-4a02-a532-08dcb00653f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0s4bmhwd0F0cG1oTFNKL1RHNWhuZ2lrQXVSN2hFamt1bjNBVThPN1JFNGFU?=
 =?utf-8?B?c01EbktYY1Q0bFhCVkYrS1B1eXJvUDkzNHlybjRMWXk4NTI3RkJrRm9qNnR0?=
 =?utf-8?B?akVidjV3YW9nT21SSXA2YW9iUWpnT25OZDZnZVJwZVd5OE9yczY5dTAvMTBX?=
 =?utf-8?B?SkRtWnRmaWxES21WUENrS1cvNHl5emg1ZWRkWGhzWUMwSE45SjdqaDVhK3RJ?=
 =?utf-8?B?eUdMK09GNDBVekhrVVVXMVZta0FIL21yRXBEY0JMNUVyWlh1RTUzeUVXSDhW?=
 =?utf-8?B?TExUMjJrbk5ZVWV2WWJFazFRcXFnY1JPSE9pY2kzYk43eDZ0Q0lOUmlXRENZ?=
 =?utf-8?B?YThRVU53R0JudlZ3ZTY0YWRhL1V4b016Rk5CTFhKaVJCQndxS0poOXBtN1cy?=
 =?utf-8?B?Y1liOUxUQWcvQkpxTE5qTTVhd1FVVkh6SDNUUDFTRHJXc1NRdklLeTh0SVRD?=
 =?utf-8?B?a2FWVUtnQnBHSUQzS0E3TlFhWSt2WmlPYXNFbXQ5aDJVTFJXM242bzRFa2JK?=
 =?utf-8?B?TGQ3Y0xlbXlRdEl3N1lJMksrVW8yVDI2QXhHTzVqNkNqZUFUNk5UVFRkeVNJ?=
 =?utf-8?B?RCs1aVJnRm4wTjBGZ0dJaTJ6YVREVHhyUlh1amxzYkFTT2U4WFNZaWhZRjla?=
 =?utf-8?B?enI2K3FvWEt6SjVIRENIOG9iUXZXeEEycUtJRkFLUnVpWkMxb3JrNFpjTDJW?=
 =?utf-8?B?RDB5OWFuM0hzUG41Q0RuSXc3ZXpua1Y1NDR4OStLakc1SCtCanRjYUFaSEVZ?=
 =?utf-8?B?Nk9oSGl5czFrcitsZ0FpUXpiekYrLzVNQWt1b0pnTTNIaTBJM3lrYlBaYjFa?=
 =?utf-8?B?Nm9xU0R4QVJVRW1PcHY5a3VoV0REOTNWb0VkSFg2UHFuS0FTVEMxb2daUjFi?=
 =?utf-8?B?WkxKZ0Fwenl1RGZxU3hCYjk2MkdYVVdQdGxTZlBJZjNhK1FpbHVrdXJ5OVlr?=
 =?utf-8?B?NGNEdzVmRlpsTUMxTXZ2UzdMWWF2MG1JRW91RjNyV1kxY2dqMzl2Qk85Y2VN?=
 =?utf-8?B?aE9TbzRNbkVSY2tTUjFlcENRemNPNTNYNm1ZbjIzNUdPZWFLVHVNZE1vamFs?=
 =?utf-8?B?OUpaTVdNTkJhUUY3a25lVnZobkRqOVJsb05hSU43WHRpaXZLUklwR0tHaFJ4?=
 =?utf-8?B?djFEUGd4Y2lta0QxMk1OQitkRld6TzA4cEVzQ1FGYXpkSFkvQkNrWWRWb3pr?=
 =?utf-8?B?UnFQR3ZLa2E0aFJCdlFFMENGNXdnRWF4WWcrVEdlRy9TcnEyNm9wYXNDZ2cr?=
 =?utf-8?B?NC83c0N1OGlYZDNaZTBrdlJ3OXd1ZzZKYVB0b2dQaHZONVg3bGhXMy9rQ0Uz?=
 =?utf-8?B?V2VKL1FPckQ2V3B6QVhZZGhRYnUwN0cxbkM2VmUwcTI4VkRrWEJPd294YXQv?=
 =?utf-8?B?Y3h4N0c3S21CQ2hUejE4NzVRRDcva2pqdUVpNWdseHB5UUtCYTNGN1doeXZx?=
 =?utf-8?B?SHJvbVNza2YzWjltVndiMzhkTWNXaldSQTdDL1F1VCtTUkVzRXd6b1NPbmpw?=
 =?utf-8?B?emNLZGxyTnRuNHoxQ0NRU1YwV2lOa1VGUlZ2YlYra1JKTUxlb1RvdFFNbmFK?=
 =?utf-8?B?b3NHdDFURzF4ak9uZTdIa256bWZmUEc2RjJpK1o0VFZRZmtjRUhmak1tS2Qv?=
 =?utf-8?B?UUVLMzJqZzlQSkdyaEpDUVM4OWlVQzhOaTU1aHJ0WkRNUjVROEFtemNIeEx3?=
 =?utf-8?B?eVNkWnlVNDRaSE5iMjdTM2JQTUg0M3AzWWtVT2RyZDV0SmNVaFpHaFkyQU1Z?=
 =?utf-8?B?M3VPaTFjTE5QL0ZkVFBoVXU1TFhFcUxORTl3N2hHRCtDdzNqUGU5YXhRMzlO?=
 =?utf-8?B?VVVMRFR5NTN1UDlGVkZZVVl5dUVZcVpGVW5ZU2hFeGpoZGxQVWVzdFZtU2Zl?=
 =?utf-8?B?ZTA4WlBmSStWZFBha2VtRnlGSm9jUE81aEw4bVd4OW9WcUdtSWtRV1ZqUjQ0?=
 =?utf-8?Q?8/ujjAvcD4mbMu9tP3SVPdm9XAhsTCWi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 19:40:40.3886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 006187d2-e916-4a02-a532-08dcb00653f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9425

On 7/29/24 14:50, Julien Grall wrote:
> Hi again,
> 
> On 29/07/2024 15:24, Stewart Hildebrand wrote:
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index aac6c599f878..b4890eec7ec4 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -2325,6 +2325,51 @@ void asmlinkage leave_hypervisor_to_guest(void)
>>           arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 0, NULL);
>>   }
>>   +#ifdef CONFIG_DEBUG
>> +DEFINE_PER_CPU(unsigned int, stack_check_nesting);
>> +DEFINE_PER_CPU(unsigned char *, stack_base);
> 
> While looking at the code, I just realized that this should be equivalent to current->arch.base.

current->arch.stack

That's true only after the idle vcpu stacks have been allocated.

> So do we actually need stack_base?

This is a way to enable stack instrumentation much earlier during boot
when we are still using the static boot stack.

