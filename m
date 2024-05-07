Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEFF8BE513
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 16:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718144.1120716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4LPO-0007l7-QE; Tue, 07 May 2024 14:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718144.1120716; Tue, 07 May 2024 14:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4LPO-0007j1-ME; Tue, 07 May 2024 14:03:06 +0000
Received: by outflank-mailman (input) for mailman id 718144;
 Tue, 07 May 2024 14:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r/6G=MK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s4LPN-0007iv-Qo
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 14:03:05 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85abfdc8-0c7a-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 16:03:04 +0200 (CEST)
Received: from BY3PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:217::27)
 by DS0PR12MB8564.namprd12.prod.outlook.com (2603:10b6:8:167::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 14:01:58 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::3e) by BY3PR04CA0022.outlook.office365.com
 (2603:10b6:a03:217::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43 via Frontend
 Transport; Tue, 7 May 2024 14:01:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 14:01:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 09:01:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 09:01:53 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 7 May 2024 09:01:52 -0500
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
X-Inumbo-ID: 85abfdc8-0c7a-11ef-909c-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9XS40Nziemi3exM6yV8MzXHJ4iyXhq5E6+selPat4WlKxvB+B77Rw8+Id3voaLBcTGDavxV+CSH/JQExMdULPVFCkx3GR2llLXW0giqoaH07mFBXqLgDr4Sw04uZVPI+7cm0FNQ7IMEpeLf+NcXkuCATErZ9rW+9uuEjZSoXCB4EeNz12rqxQxFW+2W64tEjxFrnO+PZ9Y3aYekFQnJECzrogl3uAR0Dzm1OBD37+KdXK5tjcov0XGtZ1ZmukSlLVk4MZypyFvaouN7MSiQz4VBhhyDhC51KCt1szUfeRi//K/RnkGKp28A9zEEv2FSYbR0gRuNKR9wq2IDgRzhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kNXQpdsUYcRt+L3wFhEZg3RZIrnIi2H4upecjFXPRw=;
 b=afLBeSPjNsV11Kd2WogOUqDXam2Mt/UBD/+vGBeZaN1tgdXckFxYI7CVFKfjcjLZVxHHnOXO7Jc8CbmdEEfpDlXrjVNH7ZJOlWkKzti7OFaKKw88MnIdqR4GgoiPuC22Zc6L5ifrkVIzrNGvb8XfUZTDd4VMJPGpS/6BVc7fYqfmM6Wh4A+Dm6NZyXIMIJgnSxQR5l+9oQgDmIyD+pRmIUIGezAOtMFwi/rcD6t07UcaZN85qgxdZ3cDblkily5HNOWAp/1GSMF8kTBOYIUAyE8m/f1y1M7mEjcj5balPAOXOL3dj+8+n9p4K0L9GP/+6vdNdoUHTZdEQJEeiBzCqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kNXQpdsUYcRt+L3wFhEZg3RZIrnIi2H4upecjFXPRw=;
 b=cWzj3y3igJ4h/bLNc+dZlSzKrghWC+w6Kjt/5p7pc/k+Pp6CHKzdQgljAsI27YdtRaCr2IsDO7Svnd3sGfiDgaYL7KGTOATgfTj9aIrg6nsj4zxLLOzpU++4oGtOZHb4DhX2Z31S2+ZDgXkIw8UyK9Ojzg0zJIMItoUf4/JKtbA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2a33e7b2-c958-4a63-a9ea-40e9940b4253@amd.com>
Date: Tue, 7 May 2024 16:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] xen/arm: Lookup bootinfo shm bank during the mapping
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-2-luca.fancellu@arm.com>
 <28322f07-99fc-4428-bcf2-b8c2af04d38b@amd.com>
 <882A5390-64AC-4FB6-AA53-4CE466CF9062@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <882A5390-64AC-4FB6-AA53-4CE466CF9062@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|DS0PR12MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: d80d82e4-05a5-4f7d-0aef-08dc6e9e409d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjAwcklWbStjeWRUaHd2SWpGZGc3Q2ZyZHpubWxQQmdMU3FTT0xVMFBKUVBl?=
 =?utf-8?B?aE5hdDFyb1JPR2l1S2hIT3BnSlZlcnNhN0Zlb1l1K2p5OFhmTWQ4NE9oV3Vx?=
 =?utf-8?B?NUtIRC81dmtxbTdNM1FYRDBqbWJMOXFjSlZIbHJVM3YvQktLenFXRDREYmFL?=
 =?utf-8?B?RWJNMENpc3hIbTRHVk94VzlCYnpabHpzalJjbzBDNXJTUlFIcitOK251S2V1?=
 =?utf-8?B?Ymc2blpWYnFiK0FlT244UzBVWkV0dXkxVjhSNklHTC9KVTBIc0RZRGJlbVdW?=
 =?utf-8?B?TG5CTnZ2c0dmR01XSUxkYVo1bkdiSHlkS3lZMlZHZDZMTlhtWUVIdjI3bURR?=
 =?utf-8?B?YVgvRWNCcDBqb2lCN2FqRnNaMVUxOUpyNnFuOFZoaFNLd2JEYVlrVFlQVC9G?=
 =?utf-8?B?ZXFaQXE4eGdvZFA5SWhaeWRXdlFWWHZ1RnRTM1JjUHVaWFJNTHRHby9DNm8z?=
 =?utf-8?B?Q29VbTYreEVIU3VTK0duZzZjR1M0Q2lOejcvNmpDWkRSb1UyaUJMRXRkN0FJ?=
 =?utf-8?B?RnZiUFRWOEpVVVFYcmZwbE1iWmVXSlJXOFE0eUhydG5PTGpkaHNCaWRsWlI5?=
 =?utf-8?B?S1Uyb1NWV2tHZkVHQ0p3R1Btb3RVbDFsdDRHOFMydXd0eExXc0RuMHVPdTFa?=
 =?utf-8?B?Yk01emJTbENxOU5ORjZtaXpIbVdFcithY3d1UE1iYk1XWWozbGtrSGtKUUdD?=
 =?utf-8?B?TTFScHdJY1Q2c01pMzNpMTV6WGpycW1vSzZ5NGhaZFlwOEx4K2RXY2VGeDFj?=
 =?utf-8?B?dWZyMnNtbGtoQ2RLNWt3eHB4Vi9mVlhNUXloV0M0cjYydng5STBvNHBsQkR0?=
 =?utf-8?B?WUhCOFRnemN3QmtTSWV1Yk9aZ2pLUGd1Z3dSOUp5eVZLeDdXZkt6SVlBN3hC?=
 =?utf-8?B?VUtsTzRDc3RGTFAwZE8vUjdmamd1ek96bmJpVzZsTGUzOS8yYjA2aWdFbVdU?=
 =?utf-8?B?cDdwRzJORzNXQjFiRWxGM3IyWVgrdHBUaWRCbE5HaUpLaGpEbEk3OEFCV2hp?=
 =?utf-8?B?Rm9WUDltUUxoYmMrQnc1NGxhTTJNaEg1MS9heC90SGJMajZhRVEzQTV0SHZU?=
 =?utf-8?B?b2pVZFZtSjYxZkI1QmRBTC9vc2lvUlZCaG8wMXZMNk1ORmRHNStocXRudWpO?=
 =?utf-8?B?ejRZSGtZVmNkSmh3Uzhqd3Z5MHA0WXpwR01FN3QyUThaS2wwR0FtY1ZPWGhv?=
 =?utf-8?B?TWpiOEFlekg4eHFlakRqNStMQlBpSkxldzZlOVRpdEJHUHR4Ymc5SDRjSkJN?=
 =?utf-8?B?WG8yUmg3azFyZnlXMGJBM01SWDdnR2tzOGNtc2lUZDVZQ2pFRkgzOFVKeEI0?=
 =?utf-8?B?OUJqVmR3WSs1UURoWUt2dEtqTW93VnR3aTJFWElxcmhXMzZPQXlIS2FCQUw5?=
 =?utf-8?B?ZEtFSHhITnl0QUs3QVdYWmhzdWhRQ3Y5b3MxQ0hEZG8vYWN4WVpvVm9iZzNG?=
 =?utf-8?B?VXIrS09jdlFLYm9nMFE3WVg3eTZpc2g0Q0ZmUWZtRURDRUtmZTFreHR4ZDMv?=
 =?utf-8?B?c2RReURudzBuUW5RZFlQQ29LSlBtdTlJdzZDN2Y4VnhlTCtranZDclRHVkYr?=
 =?utf-8?B?NXlyeEpqeVkyWnV5bkZ2R0w1bGhvNkFIcllvSmhzaXBzQ09nbXYwVmJwd0F0?=
 =?utf-8?B?ZHQvRTBBOWpQNEpmMmxtMjBBLytDYmNoN3k4VGFZWEJESFY4SDBGRllQWVVY?=
 =?utf-8?B?Vm15akZSVHcrdVhxYytMTE1DdFUwY2N3MGlpcWdWa09lOHpyckExakROMjl0?=
 =?utf-8?B?K09qRXV6cE9ES09xUm54aGdqZDdFV0p5K29QczRtRFBvNHdLcEFQU3lyMWND?=
 =?utf-8?Q?xHOwmu2iam6ziCaiJPgkDkvCgOneDGmpEfxTk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 14:01:54.6439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d80d82e4-05a5-4f7d-0aef-08dc6e9e409d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8564



On 07/05/2024 15:44, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
> Thanks for your review.
> 
>> On 6 May 2024, at 14:24, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
>> On 23/04/2024 10:25, Luca Fancellu wrote:
>>>
>>>
>>> The current static shared memory code is using bootinfo banks when it
>>> needs to find the number of borrower, so every time assign_shared_memory
>> s/borrower/borrowers
> 
> Will fix
> 
>>
>>> is called, the bank is searched in the bootinfo.shmem structure.
>>>
>>> There is nothing wrong with it, however the bank can be used also to
>>> retrieve the start address and size and also to pass less argument to
>>> assign_shared_memory. When retrieving the information from the bootinfo
>>> bank, it's also possible to move the checks on alignment to
>>> process_shm_node in the early stages.
>> Is this change really required for what you want to achieve? At the moment the alignment checks
>> are done before first use, which requires these values to be aligned. FDT processing part does not need it.
> 
> That’s true, but it would separate better the parsing part, in the end what is the point of failing later if, for example,
> some value are passed but not aligned?
> 
>>
>>>
>>> So create a new function find_shm() which takes a 'struct shared_meminfo'
>> Can we name it find_shm_bank() or find_shm_bank_by_id()?
>> I agree that it's better to use a unique ID rather than matching by address/size
> 
> Yes either names are good for me, I would use find_shm_bank_by_id
> 
>>
>>> structure and the shared memory ID, to look for a bank with a matching ID,
>>> take the physical host address and size from the bank, pass the bank to
>>> assign_shared_memory() removing the now unnecessary arguments and finally
>>> remove the acquire_nr_borrower_domain() function since now the information
>>> can be extracted from the passed bank.
>>> Move the "xen,shm-id" parsing early in process_shm to bail out quickly in
>>> case of errors (unlikely), as said above, move the checks on alignment
>>> to process_shm_node.
>>>
>>> Drawback of this change is that now the bootinfo are used also when the
>>> bank doesn't need to be allocated, however it will be convinient later
>>> to use it as an argument for assign_shared_memory when dealing with
>>> the use case where the Host physical address is not supplied by the user.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> xen/arch/arm/static-shmem.c | 105 ++++++++++++++++++++----------------
>>> 1 file changed, 58 insertions(+), 47 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>>> index 09f474ec6050..f6cf74e58a83 100644
>>> --- a/xen/arch/arm/static-shmem.c
>>> +++ b/xen/arch/arm/static-shmem.c
>>> @@ -19,29 +19,24 @@ static void __init __maybe_unused build_assertions(void)
>>>                  offsetof(struct shared_meminfo, bank)));
>>> }
>>>
>>> -static int __init acquire_nr_borrower_domain(struct domain *d,
>>> -                                             paddr_t pbase, paddr_t psize,
>>> -                                             unsigned long *nr_borrowers)
>>> +static const struct membank __init *find_shm(const struct membanks *shmem,
>>> +                                             const char *shm_id)
>>> {
>>> -    const struct membanks *shmem = bootinfo_get_shmem();
>>>     unsigned int bank;
>>>
>>> -    /* Iterate reserved memory to find requested shm bank. */
>>> +    BUG_ON(!shmem || !shm_id);
>> Is it really necessary? For example, before calling find_shm(), strlen is used on shm_id
> 
> So, I guess I did that to have more robust code, in case someone changes the code in the
> future and perhaps removes something we rely on. If you object to them I will remove though,
> here and the other related points below.
> 
>>
>>> +
>>>     for ( bank = 0 ; bank < shmem->nr_banks; bank++ )
>>>     {
>>> -        paddr_t bank_start = shmem->bank[bank].start;
>>> -        paddr_t bank_size = shmem->bank[bank].size;
>>> -
>>> -        if ( (pbase == bank_start) && (psize == bank_size) )
>>> +        if ( strncmp(shm_id, shmem->bank[bank].shmem_extra->shm_id,
>>> +                     MAX_SHM_ID_LENGTH) == 0 )
>> Why not strcmp? AFAICS it's been validated many times already
>>
>>>             break;
>>>     }
>>>
>>>     if ( bank == shmem->nr_banks )
>>> -        return -ENOENT;
>>> -
>>> -    *nr_borrowers = shmem->bank[bank].shmem_extra->nr_shm_borrowers;
>>> +        return NULL;
>>>
>>> -    return 0;
>>> +    return &shmem->bank[bank];
>>> }
>>>
>>> /*
>>> @@ -103,14 +98,20 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>>>     return smfn;
>>> }
>>>
>>> -static int __init assign_shared_memory(struct domain *d,
>>> -                                       paddr_t pbase, paddr_t psize,
>>> -                                       paddr_t gbase)
>>> +static int __init assign_shared_memory(struct domain *d, paddr_t gbase,
>>> +                                       const struct membank *shm_bank)
>>> {
>>>     mfn_t smfn;
>>>     int ret = 0;
>>>     unsigned long nr_pages, nr_borrowers, i;
>>>     struct page_info *page;
>>> +    paddr_t pbase, psize;
>>> +
>>> +    BUG_ON(!shm_bank || !shm_bank->shmem_extra);
>> Is it really necessary? Isn't shm_bank already validated? It's not very common to have NULL checks in internal functions.
>>
> 
> [...]
> 
>>>
>>> @@ -440,6 +431,26 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
>>>     device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
>>>     size = dt_next_cell(size_cells, &cell);
>>>
>>> +    if ( !IS_ALIGNED(paddr, PAGE_SIZE) )
>>> +    {
>>> +        printk("fdt: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
>>> +               paddr);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if ( !IS_ALIGNED(gaddr, PAGE_SIZE) )
>>> +    {
>>> +        printk("fdt: guest address 0x%"PRIpaddr" is not suitably aligned.\n",
>>> +               gaddr);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if ( !IS_ALIGNED(size, PAGE_SIZE) )
>> What sense does it make to check for size being aligned before checking for size being 0? It would pass this check.
> 
> Yes, but in the end we are doing that to print a different error message, so it would pass
> for 0 and it’s totally fine, but in the end it will fail afterwards. I don’t see functional disruptions
> having this one before the other, what is the concern here?
It does not cause the functional disruption. It is more about code readability and writing cleaner code.
It makes more sense to first check for size being 0 rather than whether it's page aligned, since the latter can
pass if former is true and thus not making much sense.

~Michal

