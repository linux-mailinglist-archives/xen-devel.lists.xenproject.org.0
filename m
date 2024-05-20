Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D949F8C9FFE
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 17:47:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726225.1130488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s95Do-00008d-My; Mon, 20 May 2024 15:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726225.1130488; Mon, 20 May 2024 15:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s95Do-00006I-JQ; Mon, 20 May 2024 15:46:44 +0000
Received: by outflank-mailman (input) for mailman id 726225;
 Mon, 20 May 2024 15:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nMKL=MX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s95Dm-00006C-TE
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 15:46:42 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2626d5e6-16c0-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 17:46:40 +0200 (CEST)
Received: from PH7PR10CA0002.namprd10.prod.outlook.com (2603:10b6:510:23d::28)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 15:46:35 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::b6) by PH7PR10CA0002.outlook.office365.com
 (2603:10b6:510:23d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Mon, 20 May 2024 15:46:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 15:46:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 10:46:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 10:46:32 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 10:46:31 -0500
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
X-Inumbo-ID: 2626d5e6-16c0-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDJksvdHtqPzvIHxXHhZBYm6XqBcEuG853wPl74kKEZnyBZ+qKvArv9rBrffAZvfBoa1vvescD/Tgq3wBmUXnkZCemC19+voYbPasrXx37YRsVz0zwKLDAUmUCAjDfmT0KFd0afP1ZNULwRzSJbVI++xtarQ+0QaNh73JI04hG9F1iq/XHCE7noru5xj9Tza/ayg1AfyHWI9Psb+xZG3ohpdF3T0Mp3T/uWyFMvwgaXtjiZRwr60KddXhJhoM1sf6AOmSCbMSlGgg44vZ9lJ1Q95tG+JgtlFtCmzXKHwuaB0oSQCdhpS//pcEy/5k4GaCA+wo+uhxhon7G2B0UAxqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pGhMeX1ES8SvaJ9i2ibwt+ui1KvMWBcqi0tw9y4FOE=;
 b=e8wjAbK0fhSZwsWkl+Q3JHFv0etSa1DzoAgvXTLgCpDe9G2hb6rQ8DegkU/+wDj9po9n8E6MH7EMkPK7SLvv91sQ4J26gM8XC1iix8v6bBMKgnPrr+AuR554nVWaOyHsS3aAAN0JgHdcgv4xyF88xv1QFT7xO0OHwSEr56P9Su1HUGPMgYJTPzB0Hl+EiLBoOrCPIjBymphn8r2TwDeGi8zvinemCnf5vX/OP2VJRKQ0D2v8M1q2NNrHLJ56O7MRMPIXJi10ZmvHJeKAqbv1OCg20/V6/lssYff0f0im/BYPPArk/hSgPsrzFS0dsfHeTD15AF5fWLtdwv/Nw5/bxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pGhMeX1ES8SvaJ9i2ibwt+ui1KvMWBcqi0tw9y4FOE=;
 b=KMpwdg9QPIxyaMXM0VP95T4mbDWR7q5kvzilpM1dFub2qeCpdLi+U3am8CWxZxAaufOnm5DEq1n1a2ekawnx/AKAmxJsMFaHeU8gnZ0QAvbtR39uk8GYmlJgZYHMzrDAOEihBLZJjG0K7q1C0Bqi+pjtL03jMx9++5YeLM24BWg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f0342d7a-1275-4a28-9688-326f07334a71@amd.com>
Date: Mon, 20 May 2024 17:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/arm/static-shmem: Static-shmem should be
 direct-mapped for direct-mapped domains
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>, "Luca
 Fancellu" <Luca.Fancellu@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
 <20240517032156.1490515-2-xin.wang2@amd.com>
 <ee20798f-a459-492a-a7a1-308472878fe1@amd.com>
 <86c91b57-68b4-4271-87ec-b80525ed3373@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <86c91b57-68b4-4271-87ec-b80525ed3373@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f036d56-2020-4dec-46c4-08dc78e406aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFhvaDdRcDVYSGRkRkRTdnZOYXh1NTZQMTN5em1aNmQ4VFZ0TllONUZQcTlI?=
 =?utf-8?B?KzArY0w0Uk1adzhRZW9IcUNndEJPU1Y5anMvTTVhMFgvVGZnTnY3MnNtQkFV?=
 =?utf-8?B?cjB0Z3pPaElxNjhmRGtSTTBFdGF6NTh0RmJVN3ZIU1Eyc2VjVVZtY3l2cWVG?=
 =?utf-8?B?TlFFemxHTWVTWmRMcDEyRUcxVGR1d3BsQ0xoWEU0cyt6K1p0S2h5UXk0Y0s1?=
 =?utf-8?B?M080dWdyMVZWbzZTdUdjaVR2Y29KSkRzMmFRL29hNS8xZjlMQXNMUkJXcFlU?=
 =?utf-8?B?UWVGMStPMVFvNk9CTEpYMXNWSzdHLzRDMU1uakp5KzBFdzhpMm9qa0ZGUld1?=
 =?utf-8?B?bUdQOEowYnhrVG4zb2MwekJCanlsVjg4M0pGcE5CNW94enc4RmZINFQzbHhk?=
 =?utf-8?B?QjcvUGM1VVBMcFlEZTAzQ0p6c3RNQUFxSUttZ2hlcENjdkI1Z3BJT0N1dmV3?=
 =?utf-8?B?MzZOZ0QvWGFmUytvWW9idGJJZFNsWXhlbm96VjlObWU4NWw4N040cWtGVDhN?=
 =?utf-8?B?YURmZkRJZEtMQVhyWnB4WXRlY3ZTRzh4OEdEczZITlMwUTBVZFVBSUtPamJ2?=
 =?utf-8?B?eTBaNFFKMVZOcGFrNFM2ZEs2TzhSd0FiUktEQnBMRzJnRlVoMk9xb0RrQ1RB?=
 =?utf-8?B?V2FwSjJqQ1AyMGw2a1ppUzBtV01OZ1FYRFZMSHhaRlFYVk1FVkN4R3ZuWUFK?=
 =?utf-8?B?RE9GMkN3UTdUbUVWdUFUSVdsWWhsRUVrYTFzMko2NUJFaWtNV3hGYWkwa0s2?=
 =?utf-8?B?MTZkeWhYR3crRytjcXIxOGFzd0JVU0Vkc1BUR1lPYkEzeS8zNC9BMXB0OEVt?=
 =?utf-8?B?a0FvN0txMGw2NzB3OFVZWDhkZ2p1c0dLdlc4aEFxQzlHVlFVUDZPR3RXNGs2?=
 =?utf-8?B?Y2ovc1NvdUZaZUs3Q2IwZnRzUDdBY3JRNXE4MWxTdFhTK3REWHZrZ3pyRTkx?=
 =?utf-8?B?S1VkLytWNE1tUXlFdEluMFZLZW9OZForcFJydHVuU0EyZmhhTTd6VmJiamM0?=
 =?utf-8?B?M3liRUpFV3RkcDJacGxKVll6TE9aTXoxeWFBY09SQlZOR3pJQkF5aTZOUksr?=
 =?utf-8?B?dGNqd1ZpZHUzZHFieUdwQ0JqYjJYYlhaaUFZc0dJV3JOc0RQdzRwVWtvRnM4?=
 =?utf-8?B?d09kNDljVVlvdk1vS2lHN0o3cGpvRWt5MHROanNGaCtVR255NStEMkdqcDdP?=
 =?utf-8?B?b1NFUkdvcVBUSWVsNlRmR2FEcVlQbEREc2h5UGZ4ZE45WW5aa0pqdlErZm9a?=
 =?utf-8?B?emlVS0pzRGl1Q0R0ZlVPQStSVS95SHg4UXRNSGh3ZlNEWVV0LzFLN0xoWnZX?=
 =?utf-8?B?dVpiamQ3M2JkM2JEYzl2TVZmOENiTDg0SkFCdjZTeXhlbjNldGNLcWY0bDhL?=
 =?utf-8?B?bUZPbGZVQTBURnk4L0ZrSFE5ck1Kczk1TERQVDhVVFhXM2tKTmlCSmw4MVMv?=
 =?utf-8?B?RWdkVkpYL1ZPbzViUXhuUFJ2bVByeHMzVGE0SnZpTHJpZmRDSWMwaDZ3eTRN?=
 =?utf-8?B?a1lGSEpDMDFaSitWRU9tN1pEWGVleTFtcFNpTUU1RWRnREVSaUZlM1o2ZWQr?=
 =?utf-8?B?TlRpWUwrZXo2dXdkVnBLV1IxajNCbjVTQ0tEbXE5Z25aTHFCakp2K29VMjhC?=
 =?utf-8?B?clh3b2JoM1dsSzRVVDMzR2NhUGJ1ZklWL2w1RG9ndGhrQTNtNHFWaEEyN1Y5?=
 =?utf-8?B?SHJ3SmQ2ai96TnNYZnFaSHpqQitUcUpub0hIZzRNWjRQVmNBMk5PTGRTOFR5?=
 =?utf-8?B?NTZoYzNuaTZDNlB2VnlXdkNmYkhRS3Fjb1VMZFBnU05mem43SjdUdldEalg5?=
 =?utf-8?B?NlZEcWkvcmtsREE0UkxvOVpTa1lLZVptWFlVZlpSS0t1bG9lVlVzQ29zVVR1?=
 =?utf-8?Q?GfoiKsBClQ3IK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 15:46:33.8373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f036d56-2020-4dec-46c4-08dc78e406aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523

Hi Henry,

On 20/05/2024 16:52, Henry Wang wrote:
> Hi Michal, Luca,
> 
> On 5/20/2024 7:24 PM, Michal Orzel wrote:
>> Hi Henry,
>>
>> +CC: Luca
>>
>> On 17/05/2024 05:21, Henry Wang wrote:
>>> To make things easier, add restriction that static shared memory
>>> should also be direct-mapped for direct-mapped domains. Check the
>>> host physical address to be matched with guest physical address when
>>> parsing the device tree. Document this restriction in the doc.
>> I'm ok with this restriction.
>>
>> @Luca, do you have any use case preventing us from making this restriction?
>>
>> This patch clashes with Luca series so depending on which goes first,
> 
> I agree that there will be some conflicts between the two series. To 
> avoid back and forth, if Luca's series goes in first, would it be ok for 
> you if I place the same check from this patch in 
> handle_shared_mem_bank() like below?
> 
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 9c3a83042d..2d23fa4917 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -219,6 +219,13 @@ static int __init handle_shared_mem_bank(struct 
> domain *d, paddr_t gbase,
>       pbase = shm_bank->start;
>       psize = shm_bank->size;
> 
> +    if ( is_domain_direct_mapped(d) && (pbase != gbase) )
> +    {
> +        printk("%pd: physical address 0x%"PRIpaddr" and guest address 
> 0x%"PRIpaddr" are not direct-mapped.\n",
> +               d, pbase, gbase);
> +        return -EINVAL;
> +    }
> +
>       printk("%pd: SHMEM map from %s: mphys 0x%"PRIpaddr" -> gphys 
> 0x%"PRIpaddr", size 0x%"PRIpaddr"\n",
>              d, bank_from_heap ? "Xen heap" : "Host", pbase, gbase, psize);
> 
>> Acked-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thanks. I will take the tag if you are ok with above diff (for the case 
> if this series goes in later than Luca's).
I would move this check to process_shm() right after "gbase = dt_read_paddr" setting.
This would be the most natural placement for such a check.

~Michal

