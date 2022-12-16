Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7E664E9C4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 11:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464363.722739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p68Hs-0002YN-J6; Fri, 16 Dec 2022 10:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464363.722739; Fri, 16 Dec 2022 10:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p68Hs-0002Vs-FI; Fri, 16 Dec 2022 10:49:56 +0000
Received: by outflank-mailman (input) for mailman id 464363;
 Fri, 16 Dec 2022 10:49:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtZB=4O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p68Hq-00020N-VG
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 10:49:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eb50e4e-7d2f-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 11:49:53 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Fri, 16 Dec
 2022 10:49:48 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5880.018; Fri, 16 Dec 2022
 10:49:48 +0000
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
X-Inumbo-ID: 5eb50e4e-7d2f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPN5gsqZ234Tb/xd+5xhfrkoH9tkxOPNrWBPi7JetoGpXDxJMD6pjhC7H4sNl/ijDCx4/MJvwaGzkraKr1uT1gCIS0aQEGrwlmZCbEdL0sQZ6gzFHPbkPAs5v6QAvw1DEu8V+VckFNWgOinSydOLg39wjKZydmW8TN5K+mg4EjdUZraMPioNMWChodA3dzoaXGESYYO8znch1gP0GSDXAPhCJp1b402mA/F2xTE6isgiCeNKzT93u8N6zXN3mNdHu5R3gRwCAM3ICxh9MOWicc+VXFNdD5FSQLhnzmybdU7lY/xT0a9IFVFXPVm3Lj08cxgMnBcq/E9g1G4RJ3rsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8CHa+UHSPef6p9ZK91LClSezTyxzVEQ7UDVSErmdKg=;
 b=Ccpa8KEDtFiWXPZ78cfnREIGPpIIXicEuckKw7jFT5imjFKS2+pAPP59IKjLtZwO+VvaLWvOc3p9Hy+EorULY8A5s0d2SyszBIN71QpFuwjfhC85Mau0i0k4/MQ4ZWZJYCFqurtczV3g1n4HbiB9RStlMl93OuCak+xe0y2h4flC8WQaA5xuhnf6Zcllcc8Vpnc8CNMFl91LctY6FZQyAbqmTCHwwPiumm3dAB8LhFBQBe3BrEoLDAmYJIW/y2vCBBMMgrJgz8yVkqQFfpCjnhfZPaqRmtoWFLOKl5DvhJ6DnL47uP8Ph5rY2uHBdK6KRgw9NonRIln+xiwQwjgh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8CHa+UHSPef6p9ZK91LClSezTyxzVEQ7UDVSErmdKg=;
 b=eOjSfdZnw1VPFMCLQXtP1yhqhtGtBdOt6w+NN/yVyy1LRWheNWw0xVSQRC/+Ne8oedREloafN/hFXFhhT5dBNBao0ltk25s4PTS0j0C9zRAV6qPiOTXKQcdcqeiyYJ/YdAAt2nQxxef2PV908GXYf8Lx+ZNypZmlyEgAbta55yk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <1739c415-d1e6-efad-774e-5a49c9f28a09@amd.com>
Date: Fri, 16 Dec 2022 10:49:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v1 3/9] xen/arm: Always use 'u64' instead of 'paddr_t' for
 address and size in DT
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-4-ayan.kumar.halder@amd.com>
 <c63310d5-e699-3f6c-15a9-eec314cb179c@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c63310d5-e699-3f6c-15a9-eec314cb179c@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0271.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS7PR12MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d62ff26-6849-4e84-7b8d-08dadf534074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NZiNhEiv8FcU5TL4bb+9F9qtBVSGbKQJsYjIay7meFXUb00HPQenx7L5lLU7wVImfsMf6zAnS0yQqfkf2gAl5EafQksgIb8nS+JJzrptu/XyqEcJD5CRbhQMO5w1oU/TKNKfz95q8e3f7uUHkIp7Ezo+GYKG7wSJAAVJ/wIMX8Z38r64roFaHdVulknUH0F+8RMRlXTSCvtC2JSA5H0phj+Twxa/ZBq4VhNRX3+USiiwXa85UHdhBlqMXdOadSmuwgjB4oANEVhSLVd2MJqbrTzfdvbAvtPWq6+xWmS+yjvP6HU3oSoKnhhZDwz2AWIZfSZCu9ZrH8GKFKdSPti54Oo/eAsrVE/+QgtI7obNTl/HL6BEsMj/wWxA1yqHU+YaskGpPrYHP240ysEAUYASAreGvp/K23vda58UD5m8TXGS3GrZheuF6OITUAe4MjxxKBWWe3GIhOFcVlwgMR5Z17WoqdAolIt8R06PDPAKm1wk8U0qf6Q6NQxcn2ZY8R09BP0rNVrT94ibpdS9H97fWe0dlVV8hI+/UBne6LzDcuzp5fGF58dXwY0hPBQhjAzM/XilpoyVv3SDUhJsaaxbfZeTSA/2sQz+IRyIooU6U/OwjXlFS0z/KWLSGFlWyhG8AZ1Otjq5ppfLYM+jdxrrrARyF//h2JRxL+QzEZUF+K/qWj3krPMVUtG2+7oXSNYzJIlggit4td+i/2ZEBbqr6yDFJ4yOIrFkld8GFMZzdfQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199015)(31686004)(2906002)(5660300002)(110136005)(316002)(8936002)(4326008)(8676002)(66476007)(66556008)(66946007)(36756003)(41300700001)(478600001)(6486002)(31696002)(186003)(26005)(6506007)(6512007)(53546011)(2616005)(38100700002)(83380400001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWc3M1dadzFUcm51bkZ4aEszM2VmU29kRUZiNnB5My8rOXpZZWh4R0pGbXVN?=
 =?utf-8?B?TCt1V1M1OXBvejFtVkRoREhlYS9rRi9oQWVhUUFaZyszeERadXBuV1pRenI1?=
 =?utf-8?B?NXN6dEtqZFBQUXhjMDgwVmFoRCs3U0MwTGpRRVgvMGx3dE11aEtHazhCYWFV?=
 =?utf-8?B?SzRpMFo0T3E0WTdwSnZORndiRXRZSjNBVzFKZzI4eE1rSUlDU2I1YmZhWklR?=
 =?utf-8?B?elVFRElwTzJUMVUxZUVweHpFdFNHUDFwUjU1RHhkVE9vZFNzbDRwQ051bi8z?=
 =?utf-8?B?WElqd2FqR3ViMDl6L21sSHZmdVNUUCtSS25CWDhxTHBHeGphcmpLdEJsRkJX?=
 =?utf-8?B?SzdYNjhhS3JJUFJod0ZVNHJMakJ2SURXWmF6M0sxaHZIRkErTGtaZXlFakFT?=
 =?utf-8?B?TVg2S0llVzErczZiTUV3WHdFU3EvUEpvV3JneWlKRFR4Yjd1Y2QrbFZRZTZE?=
 =?utf-8?B?N1FiSHl0c1d1UU5wK2Fzb3hRMXkvSnhha0RXeGljcnJENnFraWcwWEJpbXNJ?=
 =?utf-8?B?V0Q2S2wwU2Y2WXpDWjNQNU9UNUQ4emwwZXEvVGYyQXlZMW9kcnZnS0I2T2g2?=
 =?utf-8?B?ejkzWStPTnRJZktIWHlWVDJZM2RGWi82VGc5clg1ZWU0NXhhMWdQdGorQnlW?=
 =?utf-8?B?LzVTRHhvWDJRRDhqc2hUOWFzSVRhMHV3cU9Kb25KWXpjV25HRGxSd0xZRWtX?=
 =?utf-8?B?K0NSaGNGcWVXRHk4NlZCSTVIc1U4c3lwMGJmOGZlR2o2eklCMHNVWHduRnRl?=
 =?utf-8?B?Zi9mWFdYUnIyQVJRWW1GUTRoNVBlejJCZFoxeFJESFJjZUlpUjVyM0hkeFdm?=
 =?utf-8?B?cGdVVzUyTGkyQ2FvYnJIcWpWT1BEVXFVL25pK1hHT1hUOEpHSzEvaFVtTWxo?=
 =?utf-8?B?Y3lNeGM0ODZRVTdIVWRTdnFSYTlVRVowNnJFY0l5YzFsdFRDbENsYmgydWVk?=
 =?utf-8?B?VXRuYSsrRmhCdXIwLzF5eVNtc25hekh0LzhGMTVETDdGR296YnU5T20reFN0?=
 =?utf-8?B?NGJUa2RRNFUxbFZOWFgyRXBPb2Y1THpvNTdHdVlmektHV253K2E2NDRXN0pS?=
 =?utf-8?B?SFRQSEFCQURDZVVHNUUzQ3h5MitsTHY1U01DRFhtbW8zRzlOOWZpRWwrb3Bn?=
 =?utf-8?B?U2tkRE5ZbEdWWTQxRSt5M2hLTCtINUt1cW9aYkYvbjdzd2FWVkQrZnBJcGpI?=
 =?utf-8?B?eE5Ea3JISW5nT29QZ1hxNG9YT2F6eUtTL0Nnd0ZhYkNUamNpV3hWL05URDh1?=
 =?utf-8?B?dHpFMnRqeE5yZTc3a01TaGU5V01JR1BQbERjWGt0OURiVGF3K0oyR1NjdEdv?=
 =?utf-8?B?dStUenlXMk9wSDdrdnpPUzdhbDlvK3hrbXFyQUZzWGFjS3RqU3ZaOWpqczI5?=
 =?utf-8?B?ZW5VeURuMWpxYWJXYTJjM2pEdExteFlJaEFhckdNbkIrWCtuT2orQUdwam9S?=
 =?utf-8?B?am1jNHhsOEZ5dXBQakxhMXdZM2gremlwMGx1WkNkZGZ3bEl1K0xOL2hsaXhD?=
 =?utf-8?B?S2NaSk15Y1lvOVNlQzkvbVVmZlR3ZExIUjY4ZGpjdUhUb0hJdlNDelFGZ2Ir?=
 =?utf-8?B?M1NpNVdJTWlNOXdLMjF5bEpOeW5QNjB0a2ZCRXRuZmlycE1BZldJQ3N1bkly?=
 =?utf-8?B?RDBGTURqTmE3Znlwa0NYYUtucGNSSGhXaTJoa1I2N2ZlZnBzd1NrSmNXa3BD?=
 =?utf-8?B?WE93OUFjdVZvWkhTOHNXc1U2enB2MTlwU0RwSGNsZkk2RnFTWmdtMGd2Yjlz?=
 =?utf-8?B?MWlvaFpIK0tjSnQ0blZtNHRGMUxySXdKQVUrLzlVUjN3Smo2enMzOEQwUDFy?=
 =?utf-8?B?aUd3MFgxVUFKb0tSeFpnSjJvREdNUjl3bzRkNXAyeVpsUG5qRWh3NWJLa3py?=
 =?utf-8?B?SENQcjRXYXZhTjJBajhXTGkxSVcvK2FqTExNbjU1UzRjSFZibXdFZkM4SEZ0?=
 =?utf-8?B?bGg5Rk1FbjNiKzlTTVVpWklKSXlla1VLVXN2M3hTN0dNMGkrMkxlVjUydVZj?=
 =?utf-8?B?dUV6cENMbVFBeXdUZ3pwSlhleWk4bmIvbEg4a2tHaUNPOFlCcENoSjRHM0tI?=
 =?utf-8?B?bHg2ZFNnVml3NUh5NGlWL1dHYzdsNXJubkh1UjhkQ1NxajNrRnI3TURQMWU0?=
 =?utf-8?Q?0piwNPks36XmFcrMo/djsL04Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d62ff26-6849-4e84-7b8d-08dadf534074
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 10:49:48.5345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+KR3S/iz2epUXsVdv5zDlY6PceLNTyGF2joXOViCtkQbCSvCHRfnsGRWj9Wu2LJz2qgDts+GdihfBgE3wrrhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5744


On 16/12/2022 09:57, Julien Grall wrote:
> Hi,
Hi Julien,
>
> This patch is actually a good example to demonstrate the extra amount 
> of boiler plate required to use your new boiler.
>
> On 15/12/2022 19:32, Ayan Kumar Halder wrote:
>> device_tree_get_reg(), dt_next_cell() uses u64 for address and size.
>> Thus, the caller needs to be fixed to pass u64 values and then invoke
>> translate_dt_address_size() to do the translation between u64 and 
>> paddr_t.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/bootfdt.c | 22 ++++++++++++++--------
>>   1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>> index 0085c28d74..835bb5feb9 100644
>> --- a/xen/arch/arm/bootfdt.c
>> +++ b/xen/arch/arm/bootfdt.c
>> @@ -14,6 +14,7 @@
>>   #include <xen/libfdt/libfdt.h>
>>   #include <xen/sort.h>
>>   #include <xsm/xsm.h>
>> +#include <asm/platform.h>
>>   #include <asm/setup.h>
>>     static bool __init device_tree_node_matches(const void *fdt, int 
>> node,
>> @@ -68,7 +69,7 @@ static int __init device_tree_get_meminfo(const 
>> void *fdt, int node,
>>       unsigned int i, banks;
>>       const __be32 *cell;
>>       u32 reg_cells = address_cells + size_cells;
>> -    paddr_t start, size;
>> +    u64 start, size;
>>       struct meminfo *mem = data;
>>         if ( address_cells < 1 || size_cells < 1 )
>> @@ -219,7 +220,7 @@ static void __init process_multiboot_node(const 
>> void *fdt, int node,
>>       const struct fdt_property *prop;
>>       const __be32 *cell;
>>       bootmodule_kind kind;
>> -    paddr_t start, size;
>> +    u64 start, size;
>>       int len;
>>       /* sizeof("/chosen/") + DT_MAX_NAME + '/' + DT_MAX_NAME + '/0' 
>> => 92 */
>>       char path[92];
>> @@ -379,7 +380,8 @@ static int __init process_shm_node(const void 
>> *fdt, int node,
>>   {
>>       const struct fdt_property *prop, *prop_id, *prop_role;
>>       const __be32 *cell;
>> -    paddr_t paddr, gaddr, size;
>> +    paddr_t paddr = 0, gaddr = 0, size = 0;
>
> For a first 0 is a valid address. So we should not use is as 
> initialization.
>
>> +    u64 dt_paddr, dt_gaddr, dt_size;
>>       struct meminfo *mem = &bootinfo.reserved_mem;
>>       unsigned int i;
>>       int len;
>> @@ -443,10 +445,14 @@ static int __init process_shm_node(const void 
>> *fdt, int node,
>>       }
>>         cell = (const __be32 *)prop->data;
>> -    device_tree_get_reg(&cell, address_cells, address_cells, &paddr, 
>> &gaddr);
>> -    size = dt_next_cell(size_cells, &cell);
>> +    device_tree_get_reg(&cell, address_cells, address_cells, &dt_paddr,
>> +                        &dt_gaddr);
>> +    translate_dt_address_size(&dt_paddr, &dt_gaddr, &paddr, &gaddr
> If we function return a value, then this should be checked. If not, 
> then it should be explained.
>
> In this case, it is not clear to me who is checking the conversion was 
> successful.
Sorry, I missed this. The caller should have checked for the return 
value and "return -EINVAL" for the conversion error.

I am in two minds.

I am thinking that instead of returing error from 
translate_dt_address_size(), the function can invoke panic() when it 
detects incorrect address/size.

Any errors related to incorrect address/size (ie providing 64 bit for 
PA_32) should be treated as fatal. But I do not see any precedent for 
this (ie libfdt does not panic for an error).

We could return an error from translate_dt_address_size() as we are 
doing today. It means that the errors need to be checked by all the 
callers (which adds extra code).

- Ayan

>
> Overall, I think this will increase the amount of code. So before 
> doing the modification, I think we need to agree on whether this is 
> worth it to check the device-tree values.
>
> Cheers,
>

