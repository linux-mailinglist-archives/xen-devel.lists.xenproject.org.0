Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403DFA06201
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 17:37:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867681.1279253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVZ3c-0005gO-U3; Wed, 08 Jan 2025 16:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867681.1279253; Wed, 08 Jan 2025 16:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVZ3c-0005dW-Qt; Wed, 08 Jan 2025 16:37:24 +0000
Received: by outflank-mailman (input) for mailman id 867681;
 Wed, 08 Jan 2025 16:37:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XghG=UA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tVZ3b-0005dP-F6
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 16:37:23 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20604.outbound.protection.outlook.com
 [2a01:111:f403:2406::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4170185-cdde-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 17:37:20 +0100 (CET)
Received: from BN9PR03CA0042.namprd03.prod.outlook.com (2603:10b6:408:fb::17)
 by PH7PR12MB6636.namprd12.prod.outlook.com (2603:10b6:510:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 16:37:17 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:fb:cafe::65) by BN9PR03CA0042.outlook.office365.com
 (2603:10b6:408:fb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Wed,
 8 Jan 2025 16:37:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 16:37:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 10:37:16 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 10:37:16 -0600
Received: from [172.23.250.255] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 8 Jan 2025 10:37:14 -0600
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
X-Inumbo-ID: d4170185-cdde-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPGrycQ72unRdRqrnMPHMr1LiqZoMupcBqhgaQzYP8rIo4gTHlIYtg4epI1mRrauQL63aMPlYth4gOLDx4AnC2Lb/jzJ5xEZdezzbdRsdZzxZoxifnZRGD0HBBn3NKv8xwDyu4NqIFKZnKfwSLFglauAgUZ8rl8NcV30zb9sb15kDmwpaJWDwAuLf9vOkPD5HSbiUlE409BqDuPh5Cq8NP75NqoExERtaj+xWLXRCcEqT1J7/KCuKxMTJs7FyNRYIWk9q8/tqN1KMdRbRIB8E/i1CYcR2fpmfA1bG8cVfc7tPRkd9bokTOzePbnrzORQPCrtiK+zSIlob5hKTmMq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOV7vJX6x1hozKkg/dOu45A7NJuT7TfIV8E/f3DEJJo=;
 b=QaWQGIYoNV0zi3D29TuJF2hZGMRcvC6dDsJBIgFxiPTn82DeChJfYRr1O9YwTSbLmsxPBx/BssERSt7BCyJ4mRjoFEBJYkYiDlunwudC1B0KqpjgxITK29I2UlzBJnJ2JHa7GN0Tie2oARy1ZBhSQmgXr96zd3ZuXR+FeDUOuuIhvGgAhMWFhxU8BAIQH8FacBJJRXpqS5+OfbLchH5rlCgG6AHjmZjnvMd7V1oic6sZoT5OriNI2dvuKY+oKptQZ3sav3OVWHPHlpx0JgLV3qX39R2KmR7uHN0ELjVNrBIqhSJ2Gi8cbXr9wo/UKCE8HuIpNQZ+0PsfdbQrNKHnQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOV7vJX6x1hozKkg/dOu45A7NJuT7TfIV8E/f3DEJJo=;
 b=nOM0hOMG3yzUtan4f6Qboimwo0egFs33AZKy22vj3K4bhnpvILKqwYAd8DClKAUV2qkgU/+EUO+mWQ/1VEvuz53djSTJFvm338tV0qCeu50DFN4HfVaTxqaGeUUggr6S5BIDKEf/+vMcGPqCVfIdJaLnmNaDji3xo83CTcRhBzM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b762d978-3aab-4656-883e-f812ceb28a4d@amd.com>
Date: Wed, 8 Jan 2025 11:37:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: ffa: fix build with clang
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250108152317.335441-1-stewart.hildebrand@amd.com>
 <D6WT3QSKXNG4.162UPSGMQ1ZIS@cloud.com>
 <8F541FF5-C4E7-4BFA-A0F5-86D2E9FCC736@arm.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <8F541FF5-C4E7-4BFA-A0F5-86D2E9FCC736@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|PH7PR12MB6636:EE_
X-MS-Office365-Filtering-Correlation-Id: aca86b68-bef9-4fd6-25dc-08dd3002b6c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGxXKzNZMmtTQzhyRU0ra2VNNGNrS0ltc3NkS0FnLzFnNW5ycEhUUnBIbXJ6?=
 =?utf-8?B?djZKSldQUGZLOVlLUU5zc3ZMdVRkdk9uVEJxT2w5VkRuZ3lXUlNTYm5OWjl4?=
 =?utf-8?B?SHVaYUJBL05HM1NaK3p2ZXFmVStwN2lLdXN3bGZSaUtETUIrTFJYQ0ZINlFR?=
 =?utf-8?B?NEwxdzRLZkdwMjJGWThGMG5HVHNwd1FQck94bVpKcE9CY0pnaWlLcEtlTVh2?=
 =?utf-8?B?c1Z5WTU2WW9lTzAzQmNvZk5vSkk2SHhQYVBCYnNOdlRDRkJTc0ttUFhjTDJP?=
 =?utf-8?B?UzZmTm03Um1VWVQ1Q0RpOE1CTzRlbUJONnJlWTkyd2t6SHpKbmNoVWF5Zlpu?=
 =?utf-8?B?eWVWanNqbUdtMnZTVm5lTVVnZlIySGFpRGpnL3BXTTBhbldLbmRuS0R5QzdB?=
 =?utf-8?B?VjlueTFIQ01oZlJJcnNpM1VaODczSG5lMTg1bzdnTWx3YUFWT09RNzlvZ1k3?=
 =?utf-8?B?dEs1bUVESUFHcDRTdkplTVhTWWpSa0h5dlE2YktNV2lHd2FyYmM0MUc3M2Zx?=
 =?utf-8?B?eWU1Mmsrb1JXTGFlYk50SjVRZ2xNODlTT3ltMFJPRlhueGlkU0hiemJtTnJy?=
 =?utf-8?B?cFZ4aEE0WFJSTVh2Y3VrZ0cwYXhzVWdoNWlrcUtZMllXNXRGUFJJMmphd1Mv?=
 =?utf-8?B?SmZvakkrVGZUSzF0QkxFL1FzRW1JRFVvTmRpaUtta0lZUWF6R0pjMjRKWlJZ?=
 =?utf-8?B?d3JzYVFsM25lRjdNSkNyYlk4c0dQV2xZNTBHT01NWlpTUHZ3cVdSSUszemFq?=
 =?utf-8?B?K016WGJqOEx1cTRaZnN4OWEranF4ZHFCazVCZFQvU3pQTlhvaU9hYjEvTUZY?=
 =?utf-8?B?dStkT1gvV0h0NklaZ0NDSmVObTNxeEhOVytZVm16cFhVSWMvdllnaGQ2dUZT?=
 =?utf-8?B?ekhlMVVtZzlrR3JUSzU5aFVhY1grVlZQSFIyekZJK1FPNllIMVFPVjA0eUs2?=
 =?utf-8?B?VUZZZ0dSWmdMQVYwQnpPWU9pS3hHR2ZwTXUyUmtCd3EyclVIQXVkRDFiTkdG?=
 =?utf-8?B?NGNGQksxMVg3K2VTR29ZTEcydm5VTjJqL1RESGVublJDR2I3ekJJSEV3MUNF?=
 =?utf-8?B?dmNoaEl0bnBFVVI1TS9kTlh1NExxMy82WTdMMllRRjVUVy82TVl4Sk5jWnBs?=
 =?utf-8?B?TnRVWjZ1NnRjVVdsRC9KV3d0eWJobVJZMlNDKzNra1ZlTHNjNFFoVGR6NFFt?=
 =?utf-8?B?QXZQNHA5UXVqMkVRWHVVMkl6M0xGVE1TY2hyWWwzNUdXZWlsc1AwMXlEQ0N0?=
 =?utf-8?B?K1Q5aHRKKzJ1Qjh0WFl0V211aHhOYzBxdGxDVk5iTlNHVDBKZDJUOXQzbTdK?=
 =?utf-8?B?MDZlNmZSckVJWWNnTythTGQzVnZYSXdMNWxsaWhiNTByT3VCekljOTFpbS9J?=
 =?utf-8?B?U1pLYWN6Mkh3bURxVWs4WTdpZ01JQnp4REhKWERQSkM4aHhrc2xXWWgxb1RF?=
 =?utf-8?B?ZlhjaDhaZ3BXRHM3NUttN0JoS1hXaGRWUk9RSGdhRkNtdm1mN2Mwek01bTBJ?=
 =?utf-8?B?YWdEVnBMRTZSam5WdHlSMlNia1ZFUm9TMjBQSXB1SVJWV2dLU0Nxd1V6T1Iy?=
 =?utf-8?B?QW9IZWsrL1ZTTHgzZ0xLQVVySVQ1TzVCNDhNY3ZLN1hDYkxodVE5YzVWOW1v?=
 =?utf-8?B?ak1Cd0Vycm1zN2RRVGFxWG1lMXJZelNwdGZhS1A3L2VFYk9qY1pNQlNnNFBh?=
 =?utf-8?B?YmFqbEozZnJNVnBPalVnOW1sbzFmTTNGZzJHUlc3OEVwSW5UV3VwQS9vTC9t?=
 =?utf-8?B?OFJxaWVTS0w4VU9BRUs4QWlyMHhjbW92N3hkWFlCMm81WGREdmJnQ042VzZJ?=
 =?utf-8?B?QnVKMUV6Y2ViU0ltVTZOdXdDbklmZ3gxRFFWaU9wdWF0VXRiZzh4RWVLOWZs?=
 =?utf-8?B?b1JhRlVCd0IxYWdlVmd1bGR1Yk9NMU44S1ZkbjUxYXpTV0VXckY5OWY1UGxo?=
 =?utf-8?B?cllwWTlkYW1mT01iemVQMENKOWhFS25ndlRrMVhYU0ZHRHNzdnRjYlYzZ0tO?=
 =?utf-8?Q?PO0gWBBmQUBGxQ7RVyQOdD1Lz8O/u8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 16:37:17.0360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aca86b68-bef9-4fd6-25dc-08dd3002b6c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6636

On 1/8/25 11:34, Bertrand Marquis wrote:
> Hi,
> 
>> On 8 Jan 2025, at 16:45, Alejandro Vallejo <alejandro.vallejo@cloud.com> wrote:
>>
>> Hi,
>>
>> On Wed Jan 8, 2025 at 3:23 PM GMT, Stewart Hildebrand wrote:
>>> Clang 16 reports:
>>>
>>> In file included from arch/arm/tee/ffa.c:72:
>>> arch/arm/tee/ffa_private.h:329:17: error: 'used' attribute ignored on a non-definition declaration [-Werror,-Wignored-attributes]
>>> extern uint32_t __ro_after_init ffa_fw_version;
>>>                ^
>>>
>>> Remove the attribute from the header to resolve this. The attribute in
>>> ffa.c is the one the matters anyway.
>>>
>>> Fixes: 2f9f240a5e87 ("xen/arm: ffa: Fine granular call support")
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> ---
>>> It appears the variable ffa_fw_version is only used in ffa.c. Was there
>>> any rationale for exporting the symbol in 2f9f240a5e87 ("xen/arm: ffa:
>>> Fine granular call support")? If not, perhaps we ought to make it static
>>> again and remove the declaration in the header.
>>
>> The only reason I can think of is wanting to have it in the symbol table of the
>> ELF file for some reason (livepatching?). But that's far fetched at best.
>>
>>> ---
>>> xen/arch/arm/tee/ffa_private.h | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
>>> index d441c0ca5598..05368d5a88d3 100644
>>> --- a/xen/arch/arm/tee/ffa_private.h
>>> +++ b/xen/arch/arm/tee/ffa_private.h
>>> @@ -326,7 +326,7 @@ extern void *ffa_rx;
>>> extern void *ffa_tx;
>>> extern spinlock_t ffa_rx_buffer_lock;
>>> extern spinlock_t ffa_tx_buffer_lock;
>>> -extern uint32_t __ro_after_init ffa_fw_version;
>>> +extern uint32_t ffa_fw_version;
>>> extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>>>
>>> bool ffa_shm_domain_destroy(struct domain *d);
>>>
>>> base-commit: 70f5a875becc9444a959830b10a361982c31a366
>>
>> IMO, it makes sense to make it static and remove this line altogether as you
>> suggest. If it needs to be exported later on it can be adjusted as needed.
>>
> 
> Yes in fact it was made global as there was a use case at some point but this is not
> the case anymore so in fact we can completely remove this from the header and make
> it static for now.
> 
> @stewart: are you happy to push a patch doing this instead ?

Yes

