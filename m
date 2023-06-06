Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AED0724E26
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 22:30:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544231.849855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6dJ9-0002Pb-PT; Tue, 06 Jun 2023 20:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544231.849855; Tue, 06 Jun 2023 20:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6dJ9-0002MG-Mc; Tue, 06 Jun 2023 20:29:35 +0000
Received: by outflank-mailman (input) for mailman id 544231;
 Tue, 06 Jun 2023 20:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNFn=B2=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q6dJ7-0002MA-ON
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 20:29:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d52fb317-04a8-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 22:29:29 +0200 (CEST)
Received: from MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 by BL0PR12MB4963.namprd12.prod.outlook.com (2603:10b6:208:17d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 20:29:24 +0000
Received: from MN2PR12MB4408.namprd12.prod.outlook.com
 ([fe80::61d6:7feb:e8e8:bc4]) by MN2PR12MB4408.namprd12.prod.outlook.com
 ([fe80::61d6:7feb:e8e8:bc4%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 20:29:23 +0000
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
X-Inumbo-ID: d52fb317-04a8-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RByOfWuDcO60Mg+g9cAgp9AJg33go+rxhoYPHl+AEY4E7FuAyXjRTMZPCk8oBYttHhi1AuzEEeNvb7XlrKfSYR9LtyR4xX2Fotm7Pyl18Pc+sOdC+U4Jhw2ZkNjHPQlt0HLgismTlxJuWolauRDzo7zspVbJw06wFOApQAb6+chPiZVTQI9eVvBbXLdl0YWy6ZBJB17y0PidSgajX7zUxdWdAapWg7MVU99fESh2Bl1attYYz1LTj5JrgSfRtWTtjXvCOmOTRr7Xq8vMgq/zb69WHIU57GKN3Ov9DAtJ0MMpkcBQcSxib7zntOSrhpKp8KuuWAotegzijxjXm2RGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUtqmPhMdCgIo+SwNL8lNC0TyJD4G8ISM6axJOzb6ac=;
 b=Fj7uVqsEJ8m8oDTkq53IrS6c7P5778nokqRVt0WhtmNY2sIE+9K7bxJVLQu5dDevXqpYosoTd5QI888VlVV0PY5tDajbaapbupb+XdChp71YD+sYNbFsMJz8TqISWxCojQZwIOTzV3YJQVs1Z38qXRMeQ11E2e+JO4GcDCpWo08xuKPpgUtZjkVkFDPQ/yEtnX6Z5qmZOHrfF7mAK45fxd1qKq2RFGzAaY9xoUpRlDoQZErgNnodzSrcjuOi1tvOLBDSDZhTRUbMOLAH03IAzSk6vLWTcMz5j7DH7NeUwlEX1aY4JO31c0637a1b4ZQRzjNTkiAjf8BDSn1oacou4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUtqmPhMdCgIo+SwNL8lNC0TyJD4G8ISM6axJOzb6ac=;
 b=SWvG8efCxy5S275v5nHTYwYYN45Kc8m6KAlg4MFS2zvZ30Pk9GZxmk7/0cQj4ingZN1NW61AAbgyRRRxzZV1u3GJ2rG3DlQUT1Ei2jutQr4JAryXV/jGBTvULRkuEmPWBXc7O14xYNDEnZj7v9ODlCX+8oGn1ddbMkvuKb5+ZPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <007122c9-1ab2-dd5e-bed4-64333113e55a@amd.com>
Date: Tue, 6 Jun 2023 13:29:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v7 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com,
 Luca.Fancellu@arm.com, Henry.Wang@arm.com
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-9-vikram.garhwal@amd.com>
 <d6a40e00-e2e3-81d9-b596-45dcfb2becd6@xen.org>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <d6a40e00-e2e3-81d9-b596-45dcfb2becd6@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0053.namprd11.prod.outlook.com
 (2603:10b6:a03:80::30) To MN2PR12MB4408.namprd12.prod.outlook.com
 (2603:10b6:208:26c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:EE_|BL0PR12MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca353af-99f9-4397-3eb2-08db66ccb734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YDTUGei3jAVJ72LLVCFq3E/AeiVsLoG/CLIO7SdNKUaP5RwPWZeYSBpBy9OeOvGwZKGpPipXfweE/v0l0hu6cx4/A+eVKfAElZhS+UfQuW5uVRcYRRx56+wMggQTTUFe57XojjbosGWH3D8YtQ9hCC6+qO56dLCj1DqWORWd2Kiozxd/2rOF7f1SqJOqQ/FdB0nsmYQs2BjqpddHXMZ8MMUPmaHt7JB5NUa83EwLowulMUXHLzRPPQMNRysRyaXWsGnejoWYeZtgdL57ugJXA05UGggvZqRbH1vTc/u36GWUazmKj9YirnZgb8FgLmIL9KwJNA/qbfQ8480pDJqkKQC48w35XN9Bzuh+rHM4TFvErMd5mfQiuGZUygDARA9Dj+xBVme3CavWlREGZmVr8pt30vIgvjWFJpWk1QnZAzCl/oWFHzclAnXBP14RcGUZxSNnNfEp8FHFci+Z5UOvh+PFuRgt0KLXMyHfxsJuROvUzFJB00lrpm471WDLifPAkeZhjj50fNp2H1nHNN9uS6vi6tpLCZGGaWSrMRrF2Qqx2hQf7mifxG4bLweTbznXF7Kv53W1tUuC65IBb2LEKUiMTUfl64nNAgDB8cgVGScAiDtdG19FKsO8hM3w2R6Dt9R4S3Xgb3qFdDXmdMWNz9e47bZG6BPcXZiUUgo+iPQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(41300700001)(478600001)(316002)(44832011)(5660300002)(66556008)(2906002)(66946007)(4326008)(8676002)(66476007)(31686004)(8936002)(6486002)(86362001)(31696002)(36756003)(2616005)(38100700002)(186003)(53546011)(6506007)(83380400001)(26005)(6512007)(37363002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXo2M3Y2eWxqK3RtL0dzZ3ZUNjZVYXp0bjI1d0Rrdy9FdWV2UFA5aGU1ZERM?=
 =?utf-8?B?bjErNCt4TzMvWnNJZUhXdDFmZ2pKZjZzNG5XejJqei8yMFk3SXpqc0xiVSsr?=
 =?utf-8?B?SElzdEpOS1BQNFhjdGQrQXFnbHJXa3BxdkFtbDFESUJzV2tNSUpmMWhZMmFs?=
 =?utf-8?B?RmV6ZnRNNlk2amZRQmx0NEhESEZkcGgzVGFhVENaWDRVem1XRlNjd3NOSDRk?=
 =?utf-8?B?WEFpL2taRnRuZklmUUdXV1VCSkEwVWt1ZmM3NVRKK1BkZzNRMzZXamZtOEtX?=
 =?utf-8?B?cjRpeDNmMVN0MDBhclhTRkQ4VStwZkhOMVdGalVpZTlEU29YNFpRVnNjZlNS?=
 =?utf-8?B?K3NKODl3a2tQd0prVGc3Q0g0RGROa3ZaejRkc1NCMGFVQXFFYWwwWE5MMW9H?=
 =?utf-8?B?eHBEL0h3eXF3cHNyQjJQV0pTU1BWcGNVZ1ZGdllyM29sOWxqdG95T0c1YkJn?=
 =?utf-8?B?SmNSMExvdDkzYldyUDFYc2xpaG1CT05UT2xTN1N1MG5DZXFCMmhRczE2d09y?=
 =?utf-8?B?aXA0Q294VnhzS3pPMG5KR2FINU1jamhNcXhvN0Z5ZzNWeGsvMXpVM1ZtY1N3?=
 =?utf-8?B?ZEx2VE8veEw2ZS8rZHBXY2EvbHpyN1d1ZGI5Ynl4RzRRUlVmSW1SVVIzMmhM?=
 =?utf-8?B?MkduOXpmdk5yMGlBMlN2cnU4UHR5K3lnV0x6bExGYmRSckYrOUw4SytwSFhX?=
 =?utf-8?B?U3h1bUg3ZDJNVmh3akJOUnB5U3FYNld5UVBRa3RhYUphUUs2U1lnWVFtRDY2?=
 =?utf-8?B?NTkzcS9MaGR2bUxLMnlrSFZWNjNnOGxqUE5COHRzK3FKZTZuQmhBdkVxUXNU?=
 =?utf-8?B?emtsTzFuTmMrRmRQbSs0YmtLdGxqZWk5NlBIc2hGWjZJZkZCNGZ6NHpZY3Vv?=
 =?utf-8?B?dUdDdFJCaDhzSWEzV1E1L2llT0VXdUE2bTRTcmR0QkZ1SUVtbEUvTHQ5SFox?=
 =?utf-8?B?WlU2UWdGUDVKUTdzaWZFeUliRm1KckdnVlZqMHdWTmxyTUVaOW4yZWJ4eENk?=
 =?utf-8?B?dnNRRndxeGRZaFBzeEJIYzN3ZmtJczl1M2Z0dmc5NytFL3JybkQ4UENWSmha?=
 =?utf-8?B?b0g0OFN2V0w4WldqYXNZQXFuc2s5YlFLMHhKNlBzYVpmV1B1MitFSG9yeWFI?=
 =?utf-8?B?R3VBc0s5RkJWMzUrTVFxUkpDV1FESnZWRjVCdmd3QkNoVGhPNGNpYW05eEMz?=
 =?utf-8?B?czVGcVYvbnhURUJMaXhrd1FjdW1lR2tKMTV0YURYZWlHN3YzL0ZNT2FTb3pI?=
 =?utf-8?B?UHpUenBiSldnME9SNkdRWVBCU3dTUEQ2K0pMelJ1UkwxQTdpeGRTb0YxWmFi?=
 =?utf-8?B?WGxNYjFSQ2w0UnVmYnpWTi9CazV6YkUyb3ZlaVlOOWUxVGkwWHpIaWxyZUZH?=
 =?utf-8?B?MVl3ZS9hZHRaNXdTVmhuellaemZ3NUsyc3VtRFBLaWVxclhaLzQrVDZIZDR4?=
 =?utf-8?B?eS91aWR5VUtBbDNHWklUaTEzUHh6UDdKYzhrZklVTTdrOXpmVkY5Y05nQUxU?=
 =?utf-8?B?S1pHSDg2RXZGaXRzNUdUNSt0RnhKZlA2VlVxalRDM1BxY3ZTZU15TVpxM2lG?=
 =?utf-8?B?VVVhckZxN0d5amhIdTBYVGJVYjFvSS95cHRKd3ZJcHlxVGx2MEVXUEx3SlMr?=
 =?utf-8?B?NVY4ZmVpRzhFUi9BUm1iTko2cjJkRkdIeWlaUlM1R1NIVThUVG9lTUYyWjFV?=
 =?utf-8?B?bnhqVjdWUTVXZDJVdXhHanJ1ZDRlLzlWYVZkUmRQcmViWVZNWHFHdmc5VTJs?=
 =?utf-8?B?cTg2MCtsZG4yankvOXJFN2tFUGF3cnBwYzlBcVFld3NuVWJtZTJ1eERUOE1Z?=
 =?utf-8?B?dmdTU2lESDJOWEErVlAzV2luRDBiUjE5WUM3djl4cU92bVRDVEVXWmY2UmNL?=
 =?utf-8?B?RkxTRDNDMy9UaFZ6ck9VVVJscEhKWE5pY0c4UnpuaUZEYVI0bDFubEV0ekpn?=
 =?utf-8?B?eFFjNm9VMjNNRWtVbUhOMEVlSnVIK3JzSVhYOGFyUG0vYjdjYkNrVExwR240?=
 =?utf-8?B?UE9udkpybGY3clVIL2xMTTNmY0NkUFl2YjBOdGF2UFd5eVZpMXRwWmNVaEZi?=
 =?utf-8?B?azBFN2NidmRMMjBxbVJmZmJFVXZVa1RpN3pEVUVlRi91cDVsV0ZuZTgvUUhY?=
 =?utf-8?Q?m01swbt8IHfN7b+OzNo/JKCGY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca353af-99f9-4397-3eb2-08db66ccb734
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:29:23.7698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9udkDcXsi3A/dKCu7pkGKisJSlq7sC3cx4IssaZOxk0ofohIWA/XohAXcSL/2aO7LT4BsOEgYYs79Vox28neA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4963

Hi,

On 6/5/23 12:12 PM, Julien Grall wrote:
> Hi,
>
> On 02/06/2023 01:48, Vikram Garhwal wrote:
>> Add device_tree_find_node_by_path() to find a matching node with path 
>> for a
>
> AFAICT, the only difference in name between the new function and the 
> existing one is "device_tree" vs "dt". The latter is just a shorthand 
> of "device tree", so it feels to me the name are a bit too similar.
>
> From my understanding, the main difference between the two functions 
> are that the current one is starting from root whereas the current one 
> is starting from a given node. So how about 
> "dt_find_node_by_path_from()"?
Thank you for the suggestion. This name was added in v3 as Luca Fancellu 
suggested to rename this function to "device_tree_find_node_by_path". I 
am okay with renaming it to dt_find_node_by_path_from().

Luca, Michal and Henry: Does the dt_find_node_by_path_from() name works 
for you?

Regards,
Vikram
>
>> dt_device_node.
>>
>> Reason behind this function:
>>      Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>>      device_tree_flattened) is created and updated with overlay 
>> nodes. This
>>      updated fdt is further unflattened to a dt_host_new. Next, we 
>> need to find
>>      the overlay nodes in dt_host_new, find the overlay node's parent 
>> in dt_host
>>      and add the nodes as child under their parent in the dt_host. 
>> Thus we need
>>      this function to search for node in different unflattened device 
>> trees.
>>
>> Also, make dt_find_node_by_path() static inline.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>>
>> ---
>> Changes from v6:
>>      Rename "dt_node" to "from"
>> ---
>>   xen/common/device_tree.c      |  6 ++++--
>>   xen/include/xen/device_tree.h | 18 ++++++++++++++++--
>>   2 files changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index 16b4b4e946..c5250a1644 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -358,11 +358,13 @@ struct dt_device_node 
>> *dt_find_node_by_type(struct dt_device_node *from,
>>       return np;
>>   }
>>   -struct dt_device_node *dt_find_node_by_path(const char *path)
>> +struct dt_device_node *
>> +                    device_tree_find_node_by_path(struct 
>> dt_device_node *from,
>> +                                                  const char *path)
>>   {
>>       struct dt_device_node *np;
>>   -    dt_for_each_device_node(dt_host, np)
>> +    dt_for_each_device_node(from, np)
>>           if ( np->full_name && (dt_node_cmp(np->full_name, path) == 
>> 0) )
>>               break;
>>   diff --git a/xen/include/xen/device_tree.h 
>> b/xen/include/xen/device_tree.h
>> index 2c35c0d391..e239f7de26 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -561,13 +561,27 @@ struct dt_device_node 
>> *dt_find_node_by_type(struct dt_device_node *from,
>>   struct dt_device_node *dt_find_node_by_alias(const char *alias);
>>     /**
>> - * dt_find_node_by_path - Find a node matching a full DT path
>> + * device_tree_find_node_by_path - Generic function to find a node 
>> matching the
>> + * full DT path for any given unflatten device tree
>> + * @from: The device tree node to start searching from
>>    * @path: The full path to match
>>    *
>>    * Returns a node pointer.
>>    */
>> -struct dt_device_node *dt_find_node_by_path(const char *path);
>> +struct dt_device_node *
>> +                    device_tree_find_node_by_path(struct 
>> dt_device_node *from,
>> +                                                  const char *path);
>
> The indentation looks slightly odd. In general, if the return type is 
> on its own line, then the function name is not indented on the new line.
Will fix the indention.
>
>>   +/**
>> + * dt_find_node_by_path - Find a node matching a full DT path in 
>> dt_host
>> + * @path: The full path to match
>> + *
>> + * Returns a node pointer.
>> + */
>> +static inline struct dt_device_node *dt_find_node_by_path(const char 
>> *path)
>> +{
>> +    return device_tree_find_node_by_path(dt_host, path);
>> +}
>>     /**
>>    * dt_find_node_by_gpath - Same as dt_find_node_by_path but 
>> retrieve the
>
> Cheers,
>


