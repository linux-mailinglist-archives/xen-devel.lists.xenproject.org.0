Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19638CA02E
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 17:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726235.1130497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s95If-00023k-BX; Mon, 20 May 2024 15:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726235.1130497; Mon, 20 May 2024 15:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s95If-00021Y-8r; Mon, 20 May 2024 15:51:45 +0000
Received: by outflank-mailman (input) for mailman id 726235;
 Mon, 20 May 2024 15:51:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jwTB=MX=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s95Id-00021S-LU
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 15:51:43 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d92632f7-16c0-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 17:51:41 +0200 (CEST)
Received: from MW4PR04CA0270.namprd04.prod.outlook.com (2603:10b6:303:88::35)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 15:51:36 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::82) by MW4PR04CA0270.outlook.office365.com
 (2603:10b6:303:88::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.33 via Frontend
 Transport; Mon, 20 May 2024 15:51:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 15:51:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 10:51:34 -0500
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 10:51:32 -0500
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
X-Inumbo-ID: d92632f7-16c0-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMqax1w0bLnuSwUCJfyquMm+MLFBlK+mXlytLO4AcotDdllcDP/iW6IYOkfqqyBjvT+26Fx2thsb4wP5osTcD37MUnD6a6/Gj2ZOVixAIINJSMvAwIHad6p29Yl6VkPSXGgZEjjw2LAubsnx3C2C55wn96joGm2UsoOcIP1Nb5dst0z01Y8m0rVhYY6bzr+dxSVXLzyB1h/61QPwnbTv9d0ShdoE7miM/cxuIHwnXEYPN+p6ueX7qwQ9WZ76JP2dDbtM071R4S/GHfC3hPkNmPoVAF0Vy6GdnpWJaDOff/x4kRGZISIQXx6YhEPH8PB8bt7xbZJFkci146wH/zV9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyUrQ23iDzW2/ijRs7j6gY/PKXIw77SJywLxUp/9efU=;
 b=Fg06qe4JB0XRKLf7W+VaZi9e2BtPvXF1Eut4Awd2J9dLlxKGb6xXGwLvLO/h96x11uAFMwzSjcSBKCZiNZzvGYVn5OC+GN2Igq6CN4ImTqqt9Dss+K4Nd2lAqSfPUMXNWgLwGDhOe042ILL8tmk4bFnc2Panpw+EHGNV4GlceF7EM8iuIOp356Te9tbJbkQHrBcyFMcIXBEZnRxtWw4MW914klF8vFWafeNgIKUvNm6UAP4G8xxXA23nkGDu8KYKsvU68Pmny/eGsXFvrLFFabhPYz7vYzQ/EAd2kFZqHioqTc73T1e9xudhfm3Z2F2bQKlDfjec88nryisJv2tcqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyUrQ23iDzW2/ijRs7j6gY/PKXIw77SJywLxUp/9efU=;
 b=VrNmVOcsLV7V3qUo8BaPZr995xH13rGj0zzisybW1oh7dnBDij+nfx4SWTAPTvvotGoQcinMQdbEHQr6DMtqGmCH9suHqGFUSO8RB3lbFvqfi1tSjgkqNK8kPC1Zt3KtiWQHnRfSuqVquG/2XCBNwiYtgE4UeoW0r+mbFyNAkto=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c0b59ccd-b3b0-4495-bbb4-2855fa2d7d16@amd.com>
Date: Mon, 20 May 2024 23:51:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/arm/static-shmem: Static-shmem should be
 direct-mapped for direct-mapped domains
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>,
	Luca Fancellu <Luca.Fancellu@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
 <20240517032156.1490515-2-xin.wang2@amd.com>
 <ee20798f-a459-492a-a7a1-308472878fe1@amd.com>
 <86c91b57-68b4-4271-87ec-b80525ed3373@amd.com>
 <f0342d7a-1275-4a28-9688-326f07334a71@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <f0342d7a-1275-4a28-9688-326f07334a71@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|SN7PR12MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7cabfd-d623-4f75-dbe9-08dc78e4ba82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1FhemM1cm0rWDUvUGpEZ1UyMlc2aGNsN1o3S21DbE9EQ1JvNG03RGR4QjVK?=
 =?utf-8?B?ZXVGdVVyYlRqL1UwYXZYMHhXVWxUTVpkUWxHdXZMbU9sRGFSUzJSRFV1YW9s?=
 =?utf-8?B?bXQxMklhYTZOVGRzSVVVaVNuRXFZNGg3Nm82SGdKMGZiZHJFdXB5bnkwcmds?=
 =?utf-8?B?RGdEYzhRTGRGeDRjdXQxWUdoU0ZOSU0rRE1lN3ZCK0V1eVpIUE5iQ2RvUTFD?=
 =?utf-8?B?am9FL1RmNkpBZE9oZ05hWlk0Q00xMERycXRxK2pmQmc1eXZRRGhKclBoZGcv?=
 =?utf-8?B?KzRjTHFNTTBia1l6RTR2bDU5STdaUHo0aDJIdjkvUG5wMms0bnBIa0R3TWw1?=
 =?utf-8?B?TDRXaGJ4WDJWTC83aEZsc0h2dFY5VThzeXFlcEUvOFoyRCtJOFFkbEUrY2Ez?=
 =?utf-8?B?VG8wS3FBMG1vM1JZaG42R1ZuM1lkaDNNOUJhbUdtT1AvWFRPU0ZMVms5MzJl?=
 =?utf-8?B?TldrRytBcWhMNTJjZ2x5WmVjcXRlcGw4MlkxcFBaRHBobnNKVFZPUkp1OS9I?=
 =?utf-8?B?anVlQlp0bnFTTmtGTnRpdGpVWlhYZm5IMG0zVk1BQjNYZnk2VmRxcFdjTzRC?=
 =?utf-8?B?NHM5Uzl6SUVwSjFDcnhDZGZQOUFMM1UzQ3ZRSmNsZnUyYmExeFlub0JoOHVQ?=
 =?utf-8?B?RVkvdVMyazVNc0xlbkdJTzd3KzRud1ZNczVzeUtUQXVNSmJSa2VPRUlMMDg4?=
 =?utf-8?B?Q0dyZlBNOGkyNXlsSnpwdHQ2KzlFVHZPMFVDNml6T2o5dXRreHp0TVE5QlFV?=
 =?utf-8?B?YWF5cVRycHVVc2hoNjBwYVBGRTRIaWxVeFJRUUpWVHpRVWQ2RzhRZWRLTmZl?=
 =?utf-8?B?NUV5eENuUDhvTDRnckx0RGtVNGtWWUIyUm1lNGc0b2pCMFNtK3RJdVRTaXJL?=
 =?utf-8?B?SU9STjF4Um5Rc1d0WUxDV1BhaWx2QmxGSS9vdUtxS2NYQlh1L0d3UlY3M1RX?=
 =?utf-8?B?K3RVOUVMMWQvMEd1L29CMEpCUUlUVC9MeFBuNUFqbHdIVC9Yd2tUWHluQXFq?=
 =?utf-8?B?bUxoeTRCWHU5bTVqd3MyUUs0K1VzZVlwNzZxMjJSci9PcEpVWTVPRG82MlRI?=
 =?utf-8?B?OGxoUWNlYjYwV1hneHVpMXFXcDdvRU5LQk9rSnNoQ081Wk1GbEpLYjdOaVJa?=
 =?utf-8?B?M2N6elFpaTBRVzVyTjR2MHJxOFQ0VzNGR2owc2dEVjhMWmF1cmxhL2ttMVlp?=
 =?utf-8?B?ZUVGQm02ejN0YWJ1SjViVGdjaGZGakZVcGNxNnMzRlV5L3MwYnUwejVhMFgv?=
 =?utf-8?B?bkI1blBLTUlxaEQ2N05IM3F5Q08xM21idE90UGlWU0R3LzFkNFMwdTM3d3o4?=
 =?utf-8?B?UHdySHBualJVR0d6cDVRZTAzTWh5bWFtMXBNVjJlNWVseVhLYndvcGovZWJH?=
 =?utf-8?B?M1ZiWHlsVE9ISVBtZXgyOHlyMkt5OTZqVEFqSEtKejRMeUFaWjBSRGpueWVM?=
 =?utf-8?B?WVc2WU4xc21wc0NRVDZOaUhzOTFENHZSdUJIYld1U2NNVG5RSWtTNEsvNkZw?=
 =?utf-8?B?WVc3WUtHbmI5cDN2WHF0WXhzRDNyZDJQMjRFYXJJTVBZSi9Wb0JCMkxxbWxN?=
 =?utf-8?B?YWhmTlBYMWN6Q2ZhWC9RSGF5Y0hsVXpMYTkwSDhLelJtRWFPMmFwQ25GVEIy?=
 =?utf-8?B?b0h3UEhvWWtrWTl3NWZVYjJMV1VyelhpWVVFVi96N2xFL05BR2txb092a1VG?=
 =?utf-8?B?czNQSUpuMDNMV2EvaUhjcmhrdXdpV0l1bzNlY010R3lDZmpvL29peEdodThx?=
 =?utf-8?B?dHdvMGkySnhzK2wxV3RKb2ErNTNDR0hyd1NscGFNUzE4cURuYnV5MmxoeGVM?=
 =?utf-8?B?WUk2c2ptZnZUTHc5UUpMS09RYUFJQ0xrNjVIZW5YU3hLNTVvQWJXU09WeEVJ?=
 =?utf-8?Q?8nbHs+e6Unina?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 15:51:35.5376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7cabfd-d623-4f75-dbe9-08dc78e4ba82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603

Hi Michal,

On 5/20/2024 11:46 PM, Michal Orzel wrote:
> Hi Henry,
>
> On 20/05/2024 16:52, Henry Wang wrote:
>> Hi Michal, Luca,
>>
>> On 5/20/2024 7:24 PM, Michal Orzel wrote:
>>> Hi Henry,
>>>
>>> +CC: Luca
>>>
>>> On 17/05/2024 05:21, Henry Wang wrote:
>>>> To make things easier, add restriction that static shared memory
>>>> should also be direct-mapped for direct-mapped domains. Check the
>>>> host physical address to be matched with guest physical address when
>>>> parsing the device tree. Document this restriction in the doc.
>>> I'm ok with this restriction.
>>>
>>> @Luca, do you have any use case preventing us from making this restriction?
>>>
>>> This patch clashes with Luca series so depending on which goes first,
>> I agree that there will be some conflicts between the two series. To
>> avoid back and forth, if Luca's series goes in first, would it be ok for
>> you if I place the same check from this patch in
>> handle_shared_mem_bank() like below?
>>
>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>> index 9c3a83042d..2d23fa4917 100644
>> --- a/xen/arch/arm/static-shmem.c
>> +++ b/xen/arch/arm/static-shmem.c
>> @@ -219,6 +219,13 @@ static int __init handle_shared_mem_bank(struct
>> domain *d, paddr_t gbase,
>>        pbase = shm_bank->start;
>>        psize = shm_bank->size;
>>
>> +    if ( is_domain_direct_mapped(d) && (pbase != gbase) )
>> +    {
>> +        printk("%pd: physical address 0x%"PRIpaddr" and guest address
>> 0x%"PRIpaddr" are not direct-mapped.\n",
>> +               d, pbase, gbase);
>> +        return -EINVAL;
>> +    }
>> +
>>        printk("%pd: SHMEM map from %s: mphys 0x%"PRIpaddr" -> gphys
>> 0x%"PRIpaddr", size 0x%"PRIpaddr"\n",
>>               d, bank_from_heap ? "Xen heap" : "Host", pbase, gbase, psize);
>>
>>> Acked-by: Michal Orzel <michal.orzel@amd.com>
>> Thanks. I will take the tag if you are ok with above diff (for the case
>> if this series goes in later than Luca's).
> I would move this check to process_shm() right after "gbase = dt_read_paddr" setting.
> This would be the most natural placement for such a check.

That sounds good. Thanks! IIUC we only need to add the check for the 
pbase != INVALID_PADDR case correct?

Kind regards,
Henry

> ~Michal


