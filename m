Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B734B724C93
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 21:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544172.849744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6c3t-0005J6-Nb; Tue, 06 Jun 2023 19:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544172.849744; Tue, 06 Jun 2023 19:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6c3t-0005Fn-Jq; Tue, 06 Jun 2023 19:09:45 +0000
Received: by outflank-mailman (input) for mailman id 544172;
 Tue, 06 Jun 2023 19:09:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNFn=B2=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q6c3r-0005Fd-RQ
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 19:09:43 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b04e08b7-049d-11ee-b232-6b7b168915f2;
 Tue, 06 Jun 2023 21:09:42 +0200 (CEST)
Received: from MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 by BN9PR12MB5113.namprd12.prod.outlook.com (2603:10b6:408:136::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 19:09:38 +0000
Received: from MN2PR12MB4408.namprd12.prod.outlook.com
 ([fe80::61d6:7feb:e8e8:bc4]) by MN2PR12MB4408.namprd12.prod.outlook.com
 ([fe80::61d6:7feb:e8e8:bc4%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 19:09:38 +0000
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
X-Inumbo-ID: b04e08b7-049d-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmyFKrqckVjAetdczLC02ZC5lBek5/9BhGfF6m10DgTdytRYMtSvAuMVbDdFflWAZbyFhvX7hgAM1YWoo510ra1U+5jNcgG0+OnBuBLZ6k28cCqr417odulyWByYpNIF0jGuBefLvquJZjZr1Dnyzlh86QJaG3D+f5t9W8rDOmV80kjvXmrJ2VM8lHv9GWWLXF+Fj6OMbh87KKoFDVd270S00alKJYgx9o0QKv0hiubKwij5B3RuSslYuV2rVlx2uzTzhv8ikq1sSKdCBOhrLfnKf/om3v435nivCNA6TayrIu2kQEPa8JrPsUuMcDIYZ0A8Y6on1WQkBMAmUvwMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRCCUnj7US0D9q0dJGoxlMNei8MnZGvl67+RcMEadJA=;
 b=gIZWQZBOs/w/LC0h5GCroiBMoDq7bCTAzmqWPIXfLilVNCJRn5D9ilzBazfr/Ys1GmFokzaHQGxD58LD7bHFrtjhnJnB5+7VKt/RSlOpoen8CNIPz5e6QRQUfujcLRxnocZ21xj9dvFwwnMdJ+BLe7qgsSdY0e984SvGeefCgG/hpxGtpUEdFZswi3tEhgf5YgikTKkF11U+vBIVuhFdk604dq2wR3xWwr86nJxYF6x65QXUDDpOQDW1704H4wwXnydPDWzp8ekhkuovoA3EUb2F/x+8mFAwDfQjDN7vkNS7BtOZE4kgJem2UjMRjC3P9ffL2ScHpMzY9B+GOZxVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRCCUnj7US0D9q0dJGoxlMNei8MnZGvl67+RcMEadJA=;
 b=QSPXNYcubZ/QrCNuN58/1R63grTcU1PgsGQbWR37hHal7Z5zgW5PfSZIiFTMmFneJUei75Jj5O2cRSwJaTJBwNydu4s8ZM3x5YT7C75dYUM/ACQlCWFz0D95Cm2G9FU3IdfNjWbZpVxdVLNQmaOhOqm046cj8yjEY2KomP+YGwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <308f68a8-9eb5-87d3-aaf0-61a6af33fd33@amd.com>
Date: Tue, 6 Jun 2023 12:09:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v7 04/19] common/device_tree: change
 __unflatten_device_tree() type
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-5-vikram.garhwal@amd.com>
 <ad9c88a0-bbbb-1ef7-0104-d201468897e0@xen.org>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <ad9c88a0-bbbb-1ef7-0104-d201468897e0@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0191.namprd05.prod.outlook.com
 (2603:10b6:a03:330::16) To MN2PR12MB4408.namprd12.prod.outlook.com
 (2603:10b6:208:26c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:EE_|BN9PR12MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f23599-98e6-462d-b806-08db66c19303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M+8Ma4fDQn4JIcf6ke2XeMQ8dlJlnv6hTyJCavFTD/TIDGAJbaCBnuuLhw97Cj/XjZzeY2xDJGxGgswqUE5GhdgeQRJZeJ9x05cZB1cwxBE4zB3h3CRrgL3o6PBirFYFGOUP8C3335Zd6QAIVS4Rfh5RoJS70MmOlmHA10pbeR4nTUuO3sw4QP2EbZyatEMgw5sjZaHlczxSOTH1eaQUNo+pf7AlEftQf7uHqgbaBwXv+bK8Xqs5QAvttj0m+XvAh7M5Z0wa30C1HGhZfFIIKLHT5JAG63q56K6pfEqTY1LRDdtGpWuAUPZXhw4+FNt3WCFgjSM8os8KXluREzQw385IIQgWzXPEkvf7fChx2kn6QtcOH7etoQmGmxcT3rSXjjnEpvKstk0hYfxvpr71YJ+lqiEHmy+SGVjbJxyDHZoApVyOsJaBHm5g084QlGoGOAE59UGsT29y1engDQSiEid3TZl6EsrYD+GuDcs8KVfuMpuZNdyTXLFL5HsMRafRG5PxfTKdKQn79j8VwTYLHmjfPjSShCqhZ5DTCx8QDEpl8ZcvrRzf6lWDZYVfmY0pEkQCNMgDk1IavzTLCGEdEKBuxf0kFG/IqrlFjWI56VbPOO784E3k85CsGCESwPIvEan4eaBl6a6QThXzIikfzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(44832011)(6506007)(26005)(53546011)(6512007)(31686004)(83380400001)(86362001)(2906002)(36756003)(186003)(31696002)(316002)(8676002)(2616005)(5660300002)(8936002)(41300700001)(38100700002)(6666004)(66556008)(66476007)(66946007)(4326008)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDNPenRCZkY1Yjl2UVJlNDFYUFUzM2QzYU9WTVFabm5OK2h0VkJUN3dYa3Br?=
 =?utf-8?B?RmJWZWpHVzMxWS9wa3BueGh3dDI5eTUvOGwwUTZYbGZCeTMvUTdocWRhNzNT?=
 =?utf-8?B?VndGMkV5MUtyYTBHMzhGUVp2T1lQdTNIYVZKVXcwRUZSNDgrcHhINEFqaEE2?=
 =?utf-8?B?Ty9EVFpFblZaclVtbHlnUmJ0alJYTmdtdUpsMVRSbWdtZU5TZGhVbVlqVUpq?=
 =?utf-8?B?UHY3azd2QS9GV2F0Y0NaR3c2V1IxTDJaUEJKVGVIVmJ6eFNvcEt1Z3BQMzAw?=
 =?utf-8?B?OU9MYzZPUHFKZFlsd2pDM0VocFIvTEJRYkRXcmdoNkJCcUxzVEF2dElacUkv?=
 =?utf-8?B?QnkyUHFwWENYV0xQRmFZUlZ3YjdqZy9XLzFWTWRtNWtsZlY2WmFBVU96RUk2?=
 =?utf-8?B?c2EydHlnQ0ttUjVKTzUraWRGa1c5RXZPbThEL0c0REduSUk4ZUppK09HcjR0?=
 =?utf-8?B?VmFldjE4ZXVMblMwYit1dlFiMkF3RG1NVUg3YWZRc1VxRExpMkZsaWs3RGFW?=
 =?utf-8?B?UFRHOUZDUEdDdDN1Yk4xRUtNYklzbVJxSndvL1pBemZ6SmtGWmVTR0pIdHJG?=
 =?utf-8?B?Z0ZvNTJoTGdjdHFTVFpmRS8vSk1mMGtHUTFTM1JWRWdNYTFFWFd1Vy95NDF2?=
 =?utf-8?B?V0Q4NyszckdQMTZ2N3VWZXNLOEU1OWRpczJMcWtUdGM5R1kyQWJieUd6c00x?=
 =?utf-8?B?KzJyZ2tjL3piaG1HdHJDZDdNYWNJS1ZsdnRTZ2hSakdXNFBuc1poQTRrQWw2?=
 =?utf-8?B?b0h6RG1COXdFWFdkOTc5ZFV0T053OFJVTjZvdVpVNGgrSkFJVTc1K1h6cVVk?=
 =?utf-8?B?OG13Q2pROEZ4RkljQ2hSZURmNjVYYXhVdytTL2hPbDR5YzJrb3V4ZXdlalpW?=
 =?utf-8?B?YXJEZ3dLUGY2emRYVXFJOWlqbndZMkpGTkVKRFpHdWlrUnZwSzJta3V3Z3NT?=
 =?utf-8?B?N1l6cStqd3hoNENXTmlyQ3F4L2lPbUtYTWZwMmN4WEU3T0NZUDNBN1czUWVv?=
 =?utf-8?B?L1VJOUJWeUxwem9pMko5aitEU1U0SEdEUXQ2bUN4T0NjVkZjYjdFV3JzeWhW?=
 =?utf-8?B?MVM1OXVsMjFEeUJja3JTVXFmSlhLQUV6SDJwRmlKM0d0a3pYRDY5NW1JYnhY?=
 =?utf-8?B?Qkp3MHpCSUVOcHZ2OTRGZ3I3Q3VIZG1kc2hJd3hQWXYxRC9kV21OUWtjTE5R?=
 =?utf-8?B?U3dGZTdWS21CcjVBZUJPdlc0K2hESUVYSzc5YUNqa0tHYVk4OXNxbnpraEho?=
 =?utf-8?B?bzN2TDBLanZydFg1VUZtcndIeVNTc0wyWDVzRTNjN0NRdHpaYUhHclBVWXNP?=
 =?utf-8?B?MVRBb21qQ1B6UDN2cDhuaHV4MHQ1RTlhOWpGSFNzQmY4enN2UVBoNlBraFo5?=
 =?utf-8?B?OERPTHh3T0E4UTIrcS9lVDFVMUJVQ3JiVmlVZC9kb2RLZi9xS1VaL0l0L1RJ?=
 =?utf-8?B?eWxJQ25zbUU4UFVHMGlEVExHaUZwdUtMYzdRV3IzdWJkRlQyZkdETW5RRzM2?=
 =?utf-8?B?eHpVR0JlSTR0ampqeURyWEdzNUtlWjBJazRmMnM0N1JLaFFXdTM0TVZnODFm?=
 =?utf-8?B?YzdLOXR2NHVMbUt4c2ZoLzExQWZXVGkvY2xuSlh1ZDczNWwvSnNHRHFYZURB?=
 =?utf-8?B?RHlJVml2TXhtYXdxdjFic1VkbDdvQkF6QmYvSG5OcGxLRDVpaHpQMDZyQ255?=
 =?utf-8?B?SU5nSmVmS2U0aEoyK3lSS1cxZTBEclVjMjgzQUtyM3ArUVJCcFN6US9mOHVU?=
 =?utf-8?B?a2RqNkszK0RsNXRqazUxeUhNaXhvMWx3cFB0VS9uNXZXdnZFQUxzVnNKVE9v?=
 =?utf-8?B?NGdNRE5saW5vNFZhU1JUVmVreVBwUUtrb0RwZ044aXJqUytsZFQweWR3U0tX?=
 =?utf-8?B?UEJUTnBueityS0xMcktvZFI4Q2R3NDFYb2lTNy9MREJEVTVzak4yamNISlh5?=
 =?utf-8?B?M0JlcTVhc0oxUVpsNWNLeVV4ZGNzS3R2VWZ4NjYyc2djZW95MklLOUx2Ukkw?=
 =?utf-8?B?Rmd2UG1kS3VFNEtxV2M5K3liUDczd1hsRWV0dE5CTnAzUTdNQ2xSQ1drU1Bs?=
 =?utf-8?B?UzRuUlJ5Vk5ZRkJWNHRmNGF4WEJvUUVwTTNsRlpsN040Yk5GSnFPNm9pZ2FW?=
 =?utf-8?Q?8r478GP0bOfcf45l6rj5Gbvwu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f23599-98e6-462d-b806-08db66c19303
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 19:09:38.6182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQ4dcU/yfnUf/YMs/YrWgbN4ENaMLzxh6Cl0dmvftjpiz3Bz1fyVl8ExCyRfOqnpwQ9KnQg35MG56tsJMwDUnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5113

Hi Julien,
Will update the commit message regarding why we need to export this for 
dtbo programming.

On 6/5/23 12:04 PM, Julien Grall wrote:
> Hi,
>
> Title:
>
> 'type' is a bit confusing here. How about "Export 
> __unflatten_device_tre()"?
>
> On 02/06/2023 01:48, Vikram Garhwal wrote:
>> Following changes are done to __unflatten_device_tree():
>>      1. __unflatten_device_tree() is renamed to unflatten_device_tree().
>>      2. Remove __init and static function type.
>
> As there is no external caller yet, please explain why you want to 
> export the function.
>
> Cheers,
>
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>>   xen/common/device_tree.c      | 9 ++++-----
>>   xen/include/xen/device_tree.h | 5 +++++
>>   2 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index bbdab07596..16b4b4e946 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -2083,7 +2083,7 @@ static unsigned long unflatten_dt_node(const 
>> void *fdt,
>>   }
>>     /**
>> - * __unflatten_device_tree - create tree of device_nodes from flat blob
>> + * unflatten_device_tree - create tree of device_nodes from flat blob
>>    *
>>    * unflattens a device-tree, creating the
>>    * tree of struct device_node. It also fills the "name" and "type"
>> @@ -2092,8 +2092,7 @@ static unsigned long unflatten_dt_node(const 
>> void *fdt,
>>    * @fdt: The fdt to expand
>>    * @mynodes: The device_node tree created by the call
>>    */
>> -static int __init __unflatten_device_tree(const void *fdt,
>> -                                          struct dt_device_node 
>> **mynodes)
>> +int unflatten_device_tree(const void *fdt, struct dt_device_node 
>> **mynodes)
>>   {
>>       unsigned long start, mem, size;
>>       struct dt_device_node **allnextp = mynodes;
>> @@ -2230,10 +2229,10 @@ dt_find_interrupt_controller(const struct 
>> dt_device_match *matches)
>>     void __init dt_unflatten_host_device_tree(void)
>>   {
>> -    int error = __unflatten_device_tree(device_tree_flattened, 
>> &dt_host);
>> +    int error = unflatten_device_tree(device_tree_flattened, &dt_host);
>>         if ( error )
>> -        panic("__unflatten_device_tree failed with error %d\n", error);
>> +        panic("unflatten_device_tree failed with error %d\n", error);
>>         dt_alias_scan();
>
> This function doesn't seem to be called in the case of the overlay 
> device-tree. Does this mean that it will never contain any alias?
>
>>   }
>> diff --git a/xen/include/xen/device_tree.h 
>> b/xen/include/xen/device_tree.h
>> index c2eada7489..2c35c0d391 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -178,6 +178,11 @@ int device_tree_for_each_node(const void *fdt, 
>> int node,
>>    */
>>   void dt_unflatten_host_device_tree(void);
>>   +/**
>> + * unflatten any device tree.
>
> Most of the exported function in device_tre.h have documentation. Can 
> you do the same here?
>
>> + */
>> +int unflatten_device_tree(const void *fdt, struct dt_device_node 
>> **mynodes);
>
> NIT: From an external interface perspective, do we actually need to 
> pass an extra pointer? Can't we instead, return the pointer?
>
>> +
>>   /**
>>    * IRQ translation callback
>>    * TODO: For the moment we assume that we only have ONE
>
> Cheers,
>


