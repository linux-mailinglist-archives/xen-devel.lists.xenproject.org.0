Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03B6724C8A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 21:08:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544166.849734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6c2S-0004ls-Ba; Tue, 06 Jun 2023 19:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544166.849734; Tue, 06 Jun 2023 19:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6c2S-0004in-8L; Tue, 06 Jun 2023 19:08:16 +0000
Received: by outflank-mailman (input) for mailman id 544166;
 Tue, 06 Jun 2023 19:08:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNFn=B2=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q6c2R-0004ih-14
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 19:08:15 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b2ea073-049d-11ee-b232-6b7b168915f2;
 Tue, 06 Jun 2023 21:08:13 +0200 (CEST)
Received: from MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 by SJ2PR12MB7917.namprd12.prod.outlook.com (2603:10b6:a03:4cc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 19:08:08 +0000
Received: from MN2PR12MB4408.namprd12.prod.outlook.com
 ([fe80::61d6:7feb:e8e8:bc4]) by MN2PR12MB4408.namprd12.prod.outlook.com
 ([fe80::61d6:7feb:e8e8:bc4%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 19:08:08 +0000
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
X-Inumbo-ID: 7b2ea073-049d-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqynDioXzhMBQcZnCuw4HgvQ8/6Ju0SYsp0b+rFGTZ2IHLFImT5pEmgNcWDuwrtAzCrld2IcmC9xesMKVNbR/CgcatPz375FrC6vMlIx5Bve6mulIUDK2yztR9pWo3jOsaFaTl0qV5zgZDj3Un13HxHemiWMBZkNatHentprKgWnyNn3tMMok11hDBqlibdzuByQQE1luPKVLmYMFj2QsmeJ7RnWVt0QYM2UbxtfjmSfyML0pBFU0QNhyWj596Xbs0HsVGaHAlbA+m7QFc2CSxyGAFIe4g6RS43m4DA6kXb14tPTHYuwFP425GcVatxJbzYqzLJFQ3Sq2UWQoYmO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elbq9BM8aMXeGiCqJfyYwlMljiOFmcpGL/tOAUT+CEw=;
 b=UuzkMnnVz3SXEn/6omNLwJDoc+sElSu3VGxYX0LW306bdSoYO52P/o96lZF3MDYQJISS/EDdKQEGU9ZQAsplmCPPVmJwlCUwRcU91/b4uVgdJ1FbspBXQ1+/lpcDazKV6BFv9uzniqYCmZ4TCFLMBCjt/GUQRPeE3DJIMmmaIDkIHIas+kjDKp4jX3DjPmg0YoQGXVDncKViaNAKC/ngQplDpLPQzAIY3KeyC3dEnKYI4Le3E+/on8rFrtrj2JJo6M57qT4s48F6nme2nhkkQ0dL6k6VMI9NwN72KbcbA04kQzKEfRrZ/N095FwPjfNqNiJcYwxaK1mVIkzayM8Tjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elbq9BM8aMXeGiCqJfyYwlMljiOFmcpGL/tOAUT+CEw=;
 b=dfsfmkwIOWaEZ1ZWI8dBC+NrvC2N1UHDreKc3GvNKwVwYhjVSTpqQXAxhQcKxHh7kyUpTrVrjBRJ1xtQiIMRRT2W8uB+iCqjUVnqXJ0uPr/dnhJc/1/cWadNiX6IcR35dED0n7XLpP8XYjaULowKouQG3ZqLeBLni5Vf0nwghqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a097b7ae-7c98-b07b-299a-3c613a8075c7@amd.com>
Date: Tue, 6 Jun 2023 12:08:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v7 02/19] common/device_tree.c:
 unflatten_device_tree() propagate errors
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, jbeulich@suse.com, Julien Grall <julien@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-3-vikram.garhwal@amd.com>
 <4a24e070-18d8-8f48-465a-10a0108a7cc2@amd.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <4a24e070-18d8-8f48-465a-10a0108a7cc2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To MN2PR12MB4408.namprd12.prod.outlook.com
 (2603:10b6:208:26c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:EE_|SJ2PR12MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f4db1b-d200-45ce-3f20-08db66c15d61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fc+sI9dTlUy9wnt7Zg1Fn8AHQ1G8k0hOFBJVppY1gCzBUi7tyy16bBC6mGJhjaNsAsT/J/JTJcA2WIoR+VfPyctknFQvIqNx85nYobcm85qHrFqGUbrmzixv8ulXkvpd+xHSgrtKw+RNLhakKOkGgyj1ElIxHajgVc85IhkY4zZDmS4SNtCDJ62+vdchAFxzjqC1qp9wHN100YaSKfhyNqpIPK7blyfxw53xYZRprTPLZZ3I+KCagMJc0w/IB1Lgru9Ul5dxXGryqxYP1IpSRuh+qfEoQb0bQv+0nGj7cu0stEyoLuWUMqTLPWy0ZStiD8KfeySE/e4ur6tIP63q7fqMe4vEB9ZjQ5slPlvAzU34xaQ4a2iyen3JooBJXKeVg3mcAIY5i5c1YBVWfecV/o3ir2pTRfjgM27YkSsKZEDh6KR8vSxlNhOYTriANkJbvhYeOGkMVLJPtXkGC7+BYzIwwj3BnXo4iZMZ19NUlP/zoirFHy9vH1bLFCKEZAxMh62jAVVWIdvWpisQCU9HzaHn/kL0siU+t+hQi56dexs3t8//EZp91PJihz+OBb25SHsX9nCYGPyoW5aJ873LcwOWTxbjJd1UFTUgYy4aoF4+6z8JXA5s/0F69VLu2NNzYdbwuJnj9Ya6Vhuhm6SAuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199021)(53546011)(26005)(6506007)(31686004)(6512007)(186003)(2616005)(83380400001)(6666004)(36756003)(2906002)(6486002)(8676002)(8936002)(44832011)(478600001)(31696002)(38100700002)(5660300002)(86362001)(4326008)(316002)(41300700001)(66556008)(66946007)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnIxNEFkVXFsVVkwZVBNWmRFVm9KdUlCU1NFelpYVVIwMUFrM2g3T1lUVGxq?=
 =?utf-8?B?NGlWZjNGemtqeGN4aU14emxLK2UzNDJacFlXbDhldXdpNktJUkxmRkRWV0FD?=
 =?utf-8?B?ejYrMGxFamJ0VUV5cHdDNy9lK1ZycXBMMUpCMTFkaEV2bm5hWk5iU1JtOU4z?=
 =?utf-8?B?K2Z1NXR1d0libWtpYnFBZ05XS3M5YlVLMDNSdnlMZWY2amdUR2JjUjcrR2tF?=
 =?utf-8?B?d3gxaUdEY1R5UnBvS0g5UXcxYlFCbVFEZEljeFpRUlkzSjl0MmtaenZpdVY5?=
 =?utf-8?B?cFhtWG0zU3c0ejRjVkRlTEEwK2JFR0RlWHNRNjJLOXJpVk5Oa01tMkZzaTMr?=
 =?utf-8?B?N0g5YmhXZThZckVYTUVWZ3FLU3pVYWxpK1Fnc3FMNjFUaXUwVTdWaWZUek4v?=
 =?utf-8?B?Z0hKSUFkRGR0L1pPbi9iZktaa3lYb0xmdDdyTkRTZmt4aGg3aTFjSWVMNTYx?=
 =?utf-8?B?aER1VjhjNVNHdTJjWU1sUXJ5L1pWZDlnRzE0S0l3d0JyQ212WEdpV2xhTWwv?=
 =?utf-8?B?MUJId2hzZkpSRThBbDRyTFJENUliNXBpV3k4THhkUytKZEcwTzhpVmJQTWJ3?=
 =?utf-8?B?bmxhakl5MDl6ZWNaR3ZHS1czamljcldmdDRsNjhUS0hJUHBjUjhwbWh4TjVS?=
 =?utf-8?B?NnhMeXdKSWF0M1cvUER2ZnBNbks1azVVbERGd3NJMjZtOCtqUkNuci84bWw4?=
 =?utf-8?B?WjBkTFhhZXo5aThwMnE1a3dtczZqSlV5VTErZXZoQklWNGE4ZjZWYzljLzBD?=
 =?utf-8?B?dFdWWFM0S3k1VDVxVElTeWZZU294VkdGSzJQcXlKa3pnaUo2Z1lVem1BZThX?=
 =?utf-8?B?SmhOZ0VEYlZEWk5lRDdraFpMbmJIcVh6V2QxNTIrM05yVzd3OFcvS0s1VFFG?=
 =?utf-8?B?QWdhVWJYUnRJQ2dDY1FwWTlMeHBzMCtja0pmNENZWUZiVDR5WVhvaVNveUZL?=
 =?utf-8?B?QjRHSng4R1FpRXVPc1BXN1RyYXcyZllXQXExeml0RmoyV2NTUUNwenFnZEIr?=
 =?utf-8?B?ckZxOEM1WHFpbkpGQVgvZSt0YUdYSjB5VGorRmNtbUd6YWtpWDZVMFNjUW4w?=
 =?utf-8?B?a21vTHdPZVJTcndQUjQ4TTRmdGI0blgwTUpLUTY4d01nd3gwRERNK3lxYnZY?=
 =?utf-8?B?TC9vTXNEOWd2ZTg5WENrMjBLVFYvSTZhRVVQbEJnZUxGZG9DSTduL3NUNmtJ?=
 =?utf-8?B?RTBPYVUyZ211REFaeVU2ck11aS8zbFN4ZWFld1hFZWNrczRBYmx5OHN1amxB?=
 =?utf-8?B?ekNyakdVcEhSKzZ1NGZROFZyV2Y1L0s0aURYZ2taZVQ5MGVyeVZvUUlFK2w2?=
 =?utf-8?B?ODZPOW5FbUptUHQvcXZvTytyL3dnYUs4eVltOGlEclNiMm9QN1FJUE42N2hP?=
 =?utf-8?B?VDVpdWN0TGZCenc2ZGRaYlF5UkMyUkpBYTJTZFExZUZlUVMwYW90RXB2K0ZY?=
 =?utf-8?B?SnVmN0tXZlVCTUl6YzArZ1RWOFR0bkdJNlovUVhjYTh6SzBQNmMwS1ltUGRL?=
 =?utf-8?B?eW5lYTZpZ0VoNVNpdmNJeldLZ3M3eHhBVi9sUUdqYXJPVWRlSk9Va2xKeGFw?=
 =?utf-8?B?RWFQdVBoNFczNXRCVlRSWVd3UzVYQWdROSt6VGM2K0JEZnlFTkVVU0NhLzJJ?=
 =?utf-8?B?OExDNEMxZU1uVlM5bGRya0tLaGliMGZoRDljRU9zWUlrTVpXckx0eS8vRDFw?=
 =?utf-8?B?VnplZ3NHUnpieTB5dTI4ZHJZaWYvZVB5WnJOcDY0dUdNMnJuNEV6V3pidks3?=
 =?utf-8?B?bytkQXRZdC9HUHcyOXNURHhEZ1E1ZXk1ajlZYU9FUEg0NDZCZllQMDIySkRT?=
 =?utf-8?B?dDc0ZVdoZXZHZ28wK3daUU41Q1d4dGlyMEIra0dGaENkQU1qTmYwMFY5d0VG?=
 =?utf-8?B?QlFHTmhkb1lSdGZXOC9BYkRFMEtBWWJoNmk5Qm1BNzhNMjJZdENmbENLN2hz?=
 =?utf-8?B?Smk4SEkyUmtzbXBzWTQ4RmY5SXBXUk1BTU5BUWg0dXdXbDArck9qM1V5a1c3?=
 =?utf-8?B?Zkk5NStXN3VaSEhSU2dkL1BSbFNGSVorNzBYNkZYd0k1S01PWmdnOFNZWG1h?=
 =?utf-8?B?aTdMMlFiVnhIM1FWR0t2VVdOSlVYd0lDaStYTmZzanlHSTU5cWN1cE5CYVdP?=
 =?utf-8?Q?sK9lVbuq6uE0lbDyvAsRgbv5z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f4db1b-d200-45ce-3f20-08db66c15d61
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 19:08:08.7023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaNYWCtHqKVFg9aH9lyDU61zzH3/f8XUvLN9AevE9F54ukZjIdDrhElFnEkcOM9UVTsmJJdTJbo6tQ7KQ2Rbjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7917

Hi Michal,

On 6/2/23 12:14 AM, Michal Orzel wrote:
> Title: s/unflatten_device_tree/__unflatten_device_tree/ or you mean to propagate
> errors from unflatten_dt_node?
>
> On 02/06/2023 02:48, Vikram Garhwal wrote:
>> This will be useful in dynamic node programming when new dt nodes are unflattend
>> during runtime. Invalid device tree node related errors should be propagated
>> back to the caller.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>>   xen/common/device_tree.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index dfdb10e488..117ccccb09 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -2108,6 +2108,9 @@ static int __init __unflatten_device_tree(const void *fdt,
>>       /* First pass, scan for size */
>>       start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
>>       size = unflatten_dt_node(fdt, 0, &start, NULL, NULL, 0);
>> +    if ( !size )
>> +        return -EINVAL;
>> +
>>       size = (size | 3) + 1;
>>   
>>       dt_dprintk("  size is %#lx allocating...\n", size);
>> @@ -2125,11 +2128,19 @@ static int __init __unflatten_device_tree(const void *fdt,
>>       start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
>>       unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
>>       if ( be32_to_cpup((__be32 *)start) != FDT_END )
>> -        printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
>> +    {
>> +        printk(XENLOG_ERR "Weird tag at end of tree: %08x\n",
>>                     *((u32 *)start));
>> +        return -EINVAL;
> What about memory that we allocated? Shouldn't it be freed in case of these two errors?
> For now it is called from boot so we do panic but later in this series this could result
> in a memory leak. Am I correct?
Yeah, that's correct. Let me add the memory free handling in v8.

>> +    }
>> +
>>       if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeef )
>> -        printk(XENLOG_WARNING "End of tree marker overwritten: %08x\n",
>> +    {
>> +        printk(XENLOG_ERR "End of tree marker overwritten: %08x\n",
>>                     be32_to_cpu(((__be32 *)mem)[size / 4]));
>> +        return -EINVAL;
>> +    }
>> +
>>       *allnextp = NULL;
>>   
>>       dt_dprintk(" <- unflatten_device_tree()\n");
> ~Michal


