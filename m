Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96718CA081
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 18:10:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726248.1130508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s95aK-0004gs-P0; Mon, 20 May 2024 16:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726248.1130508; Mon, 20 May 2024 16:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s95aK-0004eY-M3; Mon, 20 May 2024 16:10:00 +0000
Received: by outflank-mailman (input) for mailman id 726248;
 Mon, 20 May 2024 16:09:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nMKL=MX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s95aI-0004d5-FJ
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 16:09:58 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63e3bd2a-16c3-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 18:09:55 +0200 (CEST)
Received: from SN4PR0501CA0061.namprd05.prod.outlook.com
 (2603:10b6:803:41::38) by DM4PR12MB5820.namprd12.prod.outlook.com
 (2603:10b6:8:64::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 16:09:49 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:803:41:cafe::ca) by SN4PR0501CA0061.outlook.office365.com
 (2603:10b6:803:41::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16 via Frontend
 Transport; Mon, 20 May 2024 16:09:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 16:09:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 11:09:47 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 11:09:46 -0500
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
X-Inumbo-ID: 63e3bd2a-16c3-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHHn9PNBiNqi7zYGh8JcwBswzHaehcZ6FjN/ES+J8EjtQjg9H9f24LTmdVJrMpCpgO7QyuC9489ebn5oy7CnI8wYUB7tLuNjDrfyYoE12bXJKpGdw5fAlmElFGxqhFvxigjLsqhLrE+qOnW+z89VzG8vT22NOao6v9PQ1hTbCSptubWwJfA7CZi7xZY3zL3ND1ueCm+wBN/lp3x7Z1Grjp0zSBA0w+UiQV/KHoCmVu6pFvVZP0AgO/K2Sqar13b6j/AuMvtRxc0Zdl1Au1cz7AK41oV+NCbDLKDqlVR13Wr45y2m2xlIZwHZW8U1Xq8lS0JD77o6x28VtEoX38MDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r01wKV+EZkO49GWXKN3y+QUk+8tw/NOThTl1UerYC4A=;
 b=Vg9f40DSenIaDkFK4KSC4P+Pz4OayEsXFFPVR5vMCQpVHUl1lzdHGG8ysHWIW+/ljIrYd5F8sRcsRKkma05P7AMfBYR3w2y8zHKC50ZHGBRpBDF/zppGBlD6Yf5cKU4kn9aQ0l9wKVEHf6rJQbj+NCNivYkKX9MHGL28Rd+TSPR/ZdENCKjJPdB3iTtmSkWpCsMSm1A4eFPGU1ubuqdrxGTJnp0+q7WdQP/HRKEB89LAeeGlQXlZsdShPYprDqu7KTLPSL/ZeN/FRJEzG6n0la1dAD1iWhzIgdY8Eoq9Re6/ONy5ukNJkAGzk3u/qOoJ/NzcTw7gekX6eEuqLUlC0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r01wKV+EZkO49GWXKN3y+QUk+8tw/NOThTl1UerYC4A=;
 b=PMalGxU51FY3exVmKX2V3ZdNkBS0SyW1qtmiOL18a3TqrYUblix7WInD9a9EoekaDuQSBFaBp2Dou7bUajTFr/BbBkdCXaZ8J2ZMgZ7S5uhMtv4v3+vdOUKVtCunhndHvFcdYvt4AOUpAWqEgB/vvjGGbKnoZLvw2n8a+KainMQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <93336435-309d-4aa5-9977-9ce0d4725811@amd.com>
Date: Mon, 20 May 2024 18:09:45 +0200
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
 <f0342d7a-1275-4a28-9688-326f07334a71@amd.com>
 <c0b59ccd-b3b0-4495-bbb4-2855fa2d7d16@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <c0b59ccd-b3b0-4495-bbb4-2855fa2d7d16@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|DM4PR12MB5820:EE_
X-MS-Office365-Filtering-Correlation-Id: ed22a0d3-4903-4078-ec9c-08dc78e7461d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGZRT3lPaWxxYUU2YjNvN1IzTERqN3VOblduclNBTEpuZzQyZ1hKMnVab29C?=
 =?utf-8?B?K1FiWFdnVzJ6Qkd1UUpSdXc0SzVrSndiRE1WSzhlZVYydWI0dDdkOEpMcmVR?=
 =?utf-8?B?SkhqT0RlaEcyY3BwYmhCMVpZbUxpeDNZMGhDU1NQZ2NvMEhaOW9FaW1jblRa?=
 =?utf-8?B?S0xjUHArTGZVeEptaGtVSFlrMHhhRVdsakg3bzd2MEFBRjY4STNpMTJMcHZV?=
 =?utf-8?B?L3JFSkNSL1dJLzJFSDJ5R1NWdURrYlRqbkZVM0NPeTJERVhEdWQ0R0NLVjE4?=
 =?utf-8?B?L3FOUGRkcGp2VFhvcDFKWFNlTWNrTGpxaVo4NnlHTXY0UVJBd1RMb1hGVzV1?=
 =?utf-8?B?VnliNnlnM0F0NHlCZVVkOEtGL04vMzd0cXExSjk2cUI0RUhvRGNON29GdFd3?=
 =?utf-8?B?VGZ3R0swZ2EyZjBDTVZsL1dCZkNuNzFXSHh1Wm9UWkxWdHRQanhOcU9DeWR1?=
 =?utf-8?B?R1k1WHRnSDUzN0ZMdXpiZ3RieTlPdThndU1MNUhwWkZHUGU4WFJtZHU1QWZ3?=
 =?utf-8?B?bXpDMWdoekgrOHBDVkx4VzNtV0JJZks3dU4vczEweE8xYWNqMFg2Z2dvUWxN?=
 =?utf-8?B?YXlkTnBNd2ZTUnVIaEFuaVlJRDZRdlBTa2VEMjBNeTBzS0pjMTdDa1kxY09w?=
 =?utf-8?B?TkRYMGFSMzhlREgyOGpkSmVlRXdlRjZYbCs4MHpnNVUyaVp6eU5USVI4N0RY?=
 =?utf-8?B?T1YwUFZDZ2p3eElYMzFJZkJVVzR3Q0VqdVZkbExEYXBINU5tMXVXVnV5bVFX?=
 =?utf-8?B?WDJ2K1pBSzdPS3lnMVVQT0N5clBtRHBXeXZFWXpwS3ZaSUVnUjVpUkZ0QTdR?=
 =?utf-8?B?OGNnTDhqUTB4amhEN2VnYUgwUlo2SjlFVGNXbzkzVmlZM3dIdW41TGptODd0?=
 =?utf-8?B?cTVpcUF2MnpwSWhFYmVUT3FyQjZvSXAzbWtPZXFseFZvVGVhR2ZLRnNLWndI?=
 =?utf-8?B?d1VHUlFMNDZuSjhjMysyaE9weFNsNDhia2hYWWFPY2hZWWJOemtDUkdXRE40?=
 =?utf-8?B?TEhaSUxLU3puemRzeDA5VllSUTZ6VkJOMVU3VVZLWWllODJSQml6RWJEUFJq?=
 =?utf-8?B?SzRZUkFoMmV0MTNWNWc2aTA0bVgrbjhMMnhocXJucGd2Mm9rNFlEUlg1eDdT?=
 =?utf-8?B?cmthOXlPT0NLeHBQTzI3aktXQ1F1eE5mN1VSbDRXOSt6RUhwTUd5dmRGMTk3?=
 =?utf-8?B?UWVlY1BRUmd4aHRQczRmbVFLTmxMdkp3OW1IU09yNDI5ckpnQVVhSGRpK0dj?=
 =?utf-8?B?V1piVmxFU2E1dUt2a3ZkVkdiMGhWYnJTSDBqcW9yeWRpQSt4dVJ0Q254K3lC?=
 =?utf-8?B?djUyVWI4MkF6MlIxbkFiSlpZckQ4SU5pWEtRNnJpdTZpbkhzMUxIakFtYnU2?=
 =?utf-8?B?dHNtZ0ZOd2x1NlJoSjFnUEhMb21za2JrSU0ySWtWNlQvRThhYVFTNURlMHh0?=
 =?utf-8?B?M3YrTjdVYldudTNhODV0WXUwQmR1UURwN3BhaHNjaVBONklNdllNNXBQeU1x?=
 =?utf-8?B?YzlVczROQkp0cTE1ZmZDaVhrL0RXazdpZHFpUWtjVFBkZCtVWXRKQ3M4QXpY?=
 =?utf-8?B?Nng1U3ZLR3p5dWJSZWNOYVFOMzNUa3pXT1RPbTZ4WlY1aG04eXNrN01ZYksv?=
 =?utf-8?B?OHJLUTBLTitwRDdiRlQ1Z2l0cDZSdFBIWWxreGZBVmNPUjJzWTU3dEpta1Nx?=
 =?utf-8?B?ZndjdlZBNEQ4cDl3WWU3NHc2blZ6ejNFQ2xnQy9OZ0luR0tiMGxCVzM1Ry9G?=
 =?utf-8?B?YjlJaGpNZE5jRjl2NzNqNmZ4KzVKSE9TNmxrTTNDUnhmRFhGOVRiV2dOVmJW?=
 =?utf-8?B?WmpLU1V1MnJKdlpReXFHT01oWmxETW1ZZEFlSW5VQzJMZG53RnV5ZFBhRHJD?=
 =?utf-8?Q?6N/qJaKlQKk8V?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 16:09:48.8131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed22a0d3-4903-4078-ec9c-08dc78e7461d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5820



On 20/05/2024 17:51, Henry Wang wrote:
> Hi Michal,
> 
> On 5/20/2024 11:46 PM, Michal Orzel wrote:
>> Hi Henry,
>>
>> On 20/05/2024 16:52, Henry Wang wrote:
>>> Hi Michal, Luca,
>>>
>>> On 5/20/2024 7:24 PM, Michal Orzel wrote:
>>>> Hi Henry,
>>>>
>>>> +CC: Luca
>>>>
>>>> On 17/05/2024 05:21, Henry Wang wrote:
>>>>> To make things easier, add restriction that static shared memory
>>>>> should also be direct-mapped for direct-mapped domains. Check the
>>>>> host physical address to be matched with guest physical address when
>>>>> parsing the device tree. Document this restriction in the doc.
>>>> I'm ok with this restriction.
>>>>
>>>> @Luca, do you have any use case preventing us from making this restriction?
>>>>
>>>> This patch clashes with Luca series so depending on which goes first,
>>> I agree that there will be some conflicts between the two series. To
>>> avoid back and forth, if Luca's series goes in first, would it be ok for
>>> you if I place the same check from this patch in
>>> handle_shared_mem_bank() like below?
>>>
>>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>>> index 9c3a83042d..2d23fa4917 100644
>>> --- a/xen/arch/arm/static-shmem.c
>>> +++ b/xen/arch/arm/static-shmem.c
>>> @@ -219,6 +219,13 @@ static int __init handle_shared_mem_bank(struct
>>> domain *d, paddr_t gbase,
>>>        pbase = shm_bank->start;
>>>        psize = shm_bank->size;
>>>
>>> +    if ( is_domain_direct_mapped(d) && (pbase != gbase) )
>>> +    {
>>> +        printk("%pd: physical address 0x%"PRIpaddr" and guest address
>>> 0x%"PRIpaddr" are not direct-mapped.\n",
>>> +               d, pbase, gbase);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>>        printk("%pd: SHMEM map from %s: mphys 0x%"PRIpaddr" -> gphys
>>> 0x%"PRIpaddr", size 0x%"PRIpaddr"\n",
>>>               d, bank_from_heap ? "Xen heap" : "Host", pbase, gbase, psize);
>>>
>>>> Acked-by: Michal Orzel <michal.orzel@amd.com>
>>> Thanks. I will take the tag if you are ok with above diff (for the case
>>> if this series goes in later than Luca's).
>> I would move this check to process_shm() right after "gbase = dt_read_paddr" setting.
>> This would be the most natural placement for such a check.
> 
> That sounds good. Thanks! IIUC we only need to add the check for the 
> pbase != INVALID_PADDR case correct?
Yes, but at the same time I wonder whether we should also return error if a user omits pbase
for direct mapped domain.

~Michal

