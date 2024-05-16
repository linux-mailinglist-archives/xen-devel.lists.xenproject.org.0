Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B94F8C7733
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 15:06:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723301.1128026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ao7-0005EW-9k; Thu, 16 May 2024 13:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723301.1128026; Thu, 16 May 2024 13:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ao7-0005BY-61; Thu, 16 May 2024 13:06:03 +0000
Received: by outflank-mailman (input) for mailman id 723301;
 Thu, 16 May 2024 13:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0yDT=MT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s7ao5-0005BS-1q
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:06:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 097353e9-1385-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 15:05:59 +0200 (CEST)
Received: from MN2PR14CA0028.namprd14.prod.outlook.com (2603:10b6:208:23e::33)
 by CY8PR12MB7171.namprd12.prod.outlook.com (2603:10b6:930:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 13:05:54 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::3e) by MN2PR14CA0028.outlook.office365.com
 (2603:10b6:208:23e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Thu, 16 May 2024 13:05:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 13:05:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 08:05:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 08:05:53 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 08:05:52 -0500
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
X-Inumbo-ID: 097353e9-1385-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bzn55rLE3VRLhvFEvkH+Rj19/RNE7YAbRG39fS+Dv/vdRmkaugZVqY8IBb6zYjc1COi+p40iWXzSy84AxJ9GBsq6imgmJO2upb1WM6otM4XM1c0BB33nM1tS114Gdu4loKp+1ByVzWyeo0W9CLjdvYipXU18owKG/BWg/YK6nFrWbcLr9SQhboe4iHobEtqxpOGiTEVu/gxmjZeVlysatFrohiMpgsZU6oeNsuZEo4+rlaeNZtEvntCs7277rlDnSIgZ2+MlLq+ATmMOpHR+qchXxrbTVTXfzlaHWYklky9OiA0mkZ5Ga3beh/Ag6YsY0JtFp62gJsqxWwYzB2q2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UnRlEiOLmIelgMslq7Jt2mZlLO6gUYQq8cE7ygBmek=;
 b=AMJnZHSkK3K5d82D921q39CA/1J6j5NdyMa50W8PEV9Dpgqcr9amQ5ZFqQtScmxNEUodHyue4kYh1EkkXgbRrNPo7qbQ8rGaCVYU39nG2Zme0mDqZ6cXw2O20vJD0AISHafK4bVW/x2AfNq7FuWt9fSvUdnS+mIHaSzi+CN3OZPnK8ZVHl336S4Hv0WGRgLwcFUUt8RyZg+PT+zo4aHRFosCG60upxwooPcmpoWqgR5S8UeXOvww3sc5wlEnyyK0pVG2e7AyJUj0zb0BvtqZ7uUj82B4A2YtlXeyy9PlBHqyEr4svnQ4NEUUZwaRk3mtcIBZoVhd1DsB+DD46qkT/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UnRlEiOLmIelgMslq7Jt2mZlLO6gUYQq8cE7ygBmek=;
 b=mzXEEqwedK2lJQl7nH2i/GaBpdHk7iRLFoMgS4vt0fT/JiXpQmLnAtrizBhjjq9SjsEjWPJ+9VLXXKThLAM+o/XjXO7+Emw9PpwvkLpJDdSjQawxfQYZXklC6S0jtixxGiNdikmireS85c3+Q95LqSEbcu89nKzJKvZAoUvmyPc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d5de1a67-fb91-43b3-b7d3-e5162f479a11@amd.com>
Date: Thu, 16 May 2024 15:05:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] xen/arm: Lookup bootinfo shm bank during the
 mapping
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
 <20240515142626.3480640-2-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240515142626.3480640-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|CY8PR12MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: baa0abef-b24c-48b4-6059-08dc75a8eb3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVE5K1ZkWHZnVmJZanhvTkk1TFpJSjllU2hRTTNVUlZXUHN0S21LbkRhODBG?=
 =?utf-8?B?YmJiSXBYWEorU0taVGRKRnhacHE2VjMxYUhXTXJEKythUHQ5b2JEYW4vVXVi?=
 =?utf-8?B?ZktXK2tkWWdUU1ZGb0hRbW8wZWIwWVpHbmMwNGw5bGdpMnpLR2IzbS94dENl?=
 =?utf-8?B?WFVvMitEenA1clUxYmJySUN3N0pCTTF0THVrdG1FMEFROGY5akxKemk5R3pM?=
 =?utf-8?B?WTRPVkxnc29GQkJkN0dhaUN2NHNZdlhONFdEWEIxYVI3c0xRMXBabHhGbzRa?=
 =?utf-8?B?STlXRmE1aDJVVnVLUkl2Q0Q0SnlPc2tiMVU3MnlnUzBPUTB2SVBOYWVidGta?=
 =?utf-8?B?TDRwVzFlY3NOSWg2dm9pNmxPczlCUDB3UEhOdE0wTmxCdkRrWnRROHg0OFAv?=
 =?utf-8?B?eVlmLzdpUG1QcmF0K1Q0ZURuY3hXcmpqekpNMFV5ckhVTW0xTnhxVmFSZ25U?=
 =?utf-8?B?Z2pvUkZLT3pTUCtESHZGZG1LUzd3VWw0dDdLR0IzaUc1VWNIVjQ0VnlSandB?=
 =?utf-8?B?Tkt1bDY0YndWWE8weXVNamhMNVU5MlVzd2dxb0luZzJFNkNMQllGMk4xaFlt?=
 =?utf-8?B?aUplZDU5VGUrajAvdHRNSDM2YmsrdHNsVXR6bmRXTXBFR0lwV3RWY1RUUFY3?=
 =?utf-8?B?bzdtK3NhK2RkM2Fhd0JaejRJVEhOTGgrYWlwNVllaEVWQmw3RnhnRk1oakpk?=
 =?utf-8?B?YkhVU1FSOTYvNHgySnRDTzRkTnNRQzJJWEZTUkVkMytmN1ZRY3RXSnNSZkQx?=
 =?utf-8?B?cVcvNTlnTE1XcVJkSGtPRGNPRjJ3Q3hzKzB5YVlETHVkREg5Znp3bmM5K1Nv?=
 =?utf-8?B?YXpOZ2Q1RGUvRVVYUzFnTDYvSGx1S3pYdG9uRmZEekViS1V4NjdOL2d5QzhT?=
 =?utf-8?B?L29FZWEvRFJheEtYL25xbUNsT2ZzV3JFeFl6SG5Bcis1eTQ0ODBUQjZmN3Vk?=
 =?utf-8?B?YURna2c5d3JpcWF0UWErVXJ0TURuZ2prV2kyWVVCTUxQdnNReHFEWmFnQkJN?=
 =?utf-8?B?TVNrOVNYcVlsbzBMdk9VSDBIeFZLdGJkd0VPTzRSZ1k5MkdCL3pmMVlsRndp?=
 =?utf-8?B?Q0ZabzZsYzdHUnZuRzFkVWt2cHpqc28yVWg3dDF1T2pmam5BeUdYUC9ocm02?=
 =?utf-8?B?UWYyRk41MlBGM3drbEhQL1FqL1oySXQ1WEIzS0g3dHJ4MVptODU3UmN5WnIz?=
 =?utf-8?B?QzZTSEp5a0QyM1gvNkw3YmxxR3FhRldvaXF5MEZabC8zR1pJa24xUUtzbmtS?=
 =?utf-8?B?YndtUmZ6Vjh2Y2I0TFhwWEZJRFo5WERzOGpGK3ZRUWlpMHFPdm81TmlUVG1I?=
 =?utf-8?B?cUp2WlpQYWR2VjVrZUE1aFNFUThBRFA1U2JERWJuQi9iaFkvQXN4ZU9SdHI2?=
 =?utf-8?B?eVR4NURuSCs0elJNWS9BQWt2eFMzNXJ3Y0VNVk1HWTQvUjkwWkFGUitBZWs2?=
 =?utf-8?B?UkJ0anlxYWlkMnZQZFdqbVUvS2VPV1BqY3F0d2ExWmxIaWhBR1IwOUNlUkw0?=
 =?utf-8?B?MWhISjBTRGlGVCtDU0dxd1N4UmloR3RCQzZOcUxKaWgzMnc2ODZRUS9UeGs4?=
 =?utf-8?B?VVhVUUNVdTZUVmJoWUl2QWVTTlJ3VkoreTJObFB1U0FLdWF4N2pOTG5seVRz?=
 =?utf-8?B?SDlDTnJ6bGl1ZjZ3cW1HVXZqZkFvY0kvK0xlMTArZDRidDE5bzFtdkZlWVlQ?=
 =?utf-8?B?OHdaVDMxemp2dWt5NnE3Rk1mTG8rRnZyN0s4ZjFBMDl1bHpXby9GZUZaYlFM?=
 =?utf-8?B?aHBNaCtEd1FyckdEN0w1Q2dwZXI2NFBNaEV5T2lLOHZmRFQxYUhDZmJIZXhl?=
 =?utf-8?B?elJCVDRnNlQ4SmM1VGU1VlhSdnZvTU9JaWV4cm1WZlliN1lOVDBMZWswc1JH?=
 =?utf-8?Q?3TcpEDjYfwqif?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 13:05:54.1210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baa0abef-b24c-48b4-6059-08dc75a8eb3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7171

Hi Luca,

On 15/05/2024 16:26, Luca Fancellu wrote:
> 
> 
> The current static shared memory code is using bootinfo banks when it
> needs to find the number of borrowers, so every time assign_shared_memory
> is called, the bank is searched in the bootinfo.shmem structure.
> 
> There is nothing wrong with it, however the bank can be used also to
> retrieve the start address and size and also to pass less argument to
s/argument/arguments

> assign_shared_memory. When retrieving the information from the bootinfo
> bank, it's also possible to move the checks on alignment to
> process_shm_node in the early stages.
> 
> So create a new function find_shm_bank_by_id() which takes a
> 'struct shared_meminfo' structure and the shared memory ID, to look for a
> bank with a matching ID, take the physical host address and size from the
> bank, pass the bank to assign_shared_memory() removing the now unnecessary
> arguments and finally remove the acquire_nr_borrower_domain() function
> since now the information can be extracted from the passed bank.
> Move the "xen,shm-id" parsing early in process_shm to bail out quickly in
> case of errors (unlikely), as said above, move the checks on alignment
> to process_shm_node.
> 
> Drawback of this change is that now the bootinfo are used also when the
> bank doesn't need to be allocated, however it will be convinient later
s/convinient/convenient

> to use it as an argument for assign_shared_memory when dealing with
> the use case where the Host physical address is not supplied by the user.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v2 changes:
>  - fix typo commit msg, renamed find_shm() to find_shm_bank_by_id(),
>    swap region size check different from zero and size alignment, remove
>    not necessary BUGON(). (Michal)
> ---
>  xen/arch/arm/static-shmem.c | 101 +++++++++++++++++++-----------------
>  1 file changed, 54 insertions(+), 47 deletions(-)
> 
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 78881dd1d3f7..0afc86c43f85 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -19,29 +19,22 @@ static void __init __maybe_unused build_assertions(void)
>                   offsetof(struct shared_meminfo, bank)));
>  }
> 
> -static int __init acquire_nr_borrower_domain(struct domain *d,
> -                                             paddr_t pbase, paddr_t psize,
> -                                             unsigned long *nr_borrowers)
> +static const struct membank __init *
> +find_shm_bank_by_id(const struct membanks *shmem, const char *shm_id)
>  {
> -    const struct membanks *shmem = bootinfo_get_shmem();
>      unsigned int bank;
> 
> -    /* Iterate reserved memory to find requested shm bank. */
>      for ( bank = 0 ; bank < shmem->nr_banks; bank++ )
>      {
> -        paddr_t bank_start = shmem->bank[bank].start;
> -        paddr_t bank_size = shmem->bank[bank].size;
> -
> -        if ( (pbase == bank_start) && (psize == bank_size) )
> +        if ( strncmp(shm_id, shmem->bank[bank].shmem_extra->shm_id,
Does it really need to be strncmp? You validated it a few times already.

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

