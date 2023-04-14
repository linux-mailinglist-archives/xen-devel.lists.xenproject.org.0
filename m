Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2EB6E29C8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 20:05:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521190.809585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnNms-0002E4-9Q; Fri, 14 Apr 2023 18:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521190.809585; Fri, 14 Apr 2023 18:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnNms-0002CJ-5b; Fri, 14 Apr 2023 18:04:42 +0000
Received: by outflank-mailman (input) for mailman id 521190;
 Fri, 14 Apr 2023 18:04:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YiN8=AF=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pnNmq-0002CC-MX
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 18:04:40 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d11371bf-daee-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 20:04:38 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by IA0PR12MB8862.namprd12.prod.outlook.com (2603:10b6:208:48e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Fri, 14 Apr
 2023 18:04:34 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea%6]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 18:04:34 +0000
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
X-Inumbo-ID: d11371bf-daee-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyACCJCGPRTYKyehYTXnmb2My8kw1SLu2n8wbD9MOx28aw4fCo1r9SNV2UuuQk+A/2yBWhi/FO7LX2+cThRgnnnUfjd1tWg34MlEdpYc4jAgnIXd0qTJO7hu6XZhqLQziRJ6lxXbFE+gz7ZGfzPWkPL17UaURvQd2G1qiNwACvnNI2t5vv/fX1X6qFRZND0IEDq8bww+9ZTumwdiG+imFRFQ3ahTKurFt8i62AA7fN9ZA3+s0FhU8PbErszzTvmBHiQdZuTe+nCUXQRJSFBclv4kxT09gU/CZgQ4NrywXGeWL8aOjGftmMmCyMrGTKHgpqxoOhMbupTri9/zsC9HbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gj6MQrbDZkzu73BonYZ+DEwZMjhrF0TKWRr5HB+2lwo=;
 b=BmqeWhn12GAuZ14ValTxq5wKmwc6orlWGOLzUz6yaywQzq/squmHb7LSFMUUhll6pxcYJFn/NE5pfDPls8ZnxwIyP2kmzlnER7Mjf87LhvQlmXqt5Mq3QmfuCQoj6RQKkO1NXnP6I3dbNF4oGy1l7p0hkENIRmuxJDp/oZ9VN3+oyyADyZ2n+vqiKqzgmT8ia7Xpzt7GF+CsSDczoRYA0zCR4Wcz3fPCJxaV/7aCvTNdNR9vcs9TjjApe/lu+APOzB9/NBnSgocQPpHeHTcqtjkDxvLLFAn/nwpA7iiifxZ0vWc9pim1pbBzSqUCQQPSI7DxDQlaszAQ5KBNsJQPEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gj6MQrbDZkzu73BonYZ+DEwZMjhrF0TKWRr5HB+2lwo=;
 b=3rXt6Zg8A32qAIT+6zPMRjYimhJVPVCHw5Vcu1m4KlvyCuccX75SZXDbNMAWrKCGbPTfbTjTJHM8Wkc7Gvdtl32tWH9VA4LBr+5TA4uUA5Sqypo1Oll5phU5JEAGFMtYpnqPz5AVdyWk6IGADzmhbMXXaD4CP84S9WcPblJ5NQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e7a2790b-31eb-a933-af6e-e01e0d4dd5ac@amd.com>
Date: Fri, 14 Apr 2023 11:04:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN][PATCH v5 06/17] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-7-vikram.garhwal@amd.com>
 <9211242e-102c-4468-c35b-c88f8e31b274@amd.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <9211242e-102c-4468-c35b-c88f8e31b274@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29)
 To MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|IA0PR12MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0a3844-1544-4632-5129-08db3d12b3c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yceAmFE7yzqfm9XQ4Ot8LInf3UDDKEoHUXmSveEfpeSLC6xIEoQjY5ykFa4A84hsdxVIqxgpfnUj/bkbo94w2uPNnAOh1p8NaKmofRCfJu2crNh540MXcdDO+CHEc7xERtor00Hxwq6vRlAKTpM3tc4ZYmb2f6mLv1xXbNta+6sEdQPyOFSI88nUBlPtCfnphPRGN1H6MUAZxb2LErTQOwMzLYslhjp8p24BibqMPn4HVxA+BCuZqLi0+Jaz1EAIJnTQLmvlq0xz+GlqCDFBjOqRerqrNl2CQnumGu4lVOIXPx9FRLbKpntepUabSJ+MufC8saWsHvg9j2WQ6yXysiGd8lMXH+ZWaZw0SSn7cNc3JF0smucRl9ghX7b6+Qv8ejuhguzXflnCgNhbjtNuCrmj/vu0DeaGTN4ykzOvISrc1kb+mB8MW4EAxen00wykeTyUC4VLF3YOyXb3g3LvA3vkTTNgfFz5+Z3uOOZ4uTn0G2m2q0e99DJtKz8rcBiymfG4AxUZnJIJYcdvNBDLhOHTw585Rc6Om3c7URtO62Tqfo8+slG4mURCJ6dqhfmQdbHl0p5uUskTnC8SF0EmH/Vgwiddudqw/RdUqNCOX7UU8thbRZDwFOpZIirQUAPg7zQZ4au6v6Fe1sJke2F+iR8+xeOTV2mUs5kfZRbBeAA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(451199021)(31686004)(86362001)(31696002)(2906002)(36756003)(6666004)(53546011)(186003)(83380400001)(2616005)(6512007)(26005)(6506007)(66556008)(6486002)(478600001)(66946007)(44832011)(66476007)(38100700002)(4326008)(8676002)(41300700001)(316002)(8936002)(5660300002)(37363002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzE4SXF6OEV6TXVKbUcyTnJtT2ZnL21aTjF4a1Vid3lneVJUWENiMkY5TUU5?=
 =?utf-8?B?QUY5a2lBTG9jOXdnSnMyanBMVDJ1WGdTM2swSlZpYUNpeElzYzlvK3FZQWx2?=
 =?utf-8?B?UDFCT3R3OC9mUW01VDlxY29KdTh4Q0F1NEIzbzUzYmM4bFJnVWpPeHNybVBK?=
 =?utf-8?B?bUx3MWpMaDY1WDFxRzhNVTkvZ3FLWnJER1V3cjY4YTd6aHlsdnJHelBQc2pY?=
 =?utf-8?B?dVFSbGtDdk5vNkNIMXF2UGN2UTJtM3FaaDVuTVRRa1paQWxIOE5iL3BKTzNE?=
 =?utf-8?B?M08yM2w2TWNSSU5IZXcyZEQ0N2ZmWUExclV3dWgzVmVWOTljSGltSHh6SFRG?=
 =?utf-8?B?NWFQQVlvWVhsd3hyM3l0elE3bTZOb0haVFNVaWZqWmI2ZEsxTTZpaEFpazY4?=
 =?utf-8?B?eExTVFdJQml6cUlwc3hNV0QwZS9ZbGdQYWhQd2xSOHN3ZG5ocm14ZzlBdlhP?=
 =?utf-8?B?NzNUZDZ5Tlh6bGt4Qk5DcVRzanpza1NtZlZXZGtRUlFYTkF0ZHAreVNwVGJ0?=
 =?utf-8?B?TXU1RTg5NCsraXExNU9abU1scVJZSmVFdlc1OHJiN3NDMVQzZ1pRcndDN1R5?=
 =?utf-8?B?OTFHV0c5NlN0N1JSOE5kc3NrOTA2SldEOS9FVCtxOTFrMk9QeGRTNit6ak9E?=
 =?utf-8?B?QkhneTRHa3FtdWhrcGZ3MVNndVNsMlkwSkhuemljQ2VNemplQjBUZ2d2OGpK?=
 =?utf-8?B?RlQ5dW5VVExQNXNxVW5PQ0pmbUsyYnB3MldxV1YrelpPV09MRXpOVndOU014?=
 =?utf-8?B?Q25VQUFGTFlxSWFzdStYSHpVVDBUNHlGR25uVkhVVXhpSHNGK0kwTzEvR2lz?=
 =?utf-8?B?Q3dCUlVLLzJIK3J4WE92TnZJZDZ4S3h0blBIVFVuZ1hVRXhSMlBLa3YxR01i?=
 =?utf-8?B?b2VkL1VUc25ERmFKcm1hTlJjU0twaG5rR2Z4Q3FYNklpVUJGNkovTmxMbm8y?=
 =?utf-8?B?Z0ZlZE8rVVNIc3pkYTFHMms1NGg2OE01c1Q4NDIxVkhHN0YrRGloZkl5V0hK?=
 =?utf-8?B?UnE5TXFheWJ2ODRwSXdid3VOU1FyWVdXQ0NidDIxanpWZWgwUDNISWg2WjJs?=
 =?utf-8?B?ZDBPaUFudWZ2VCtaRUFVNk9KeHVQeENVcEdhVThnSzdmeC9KMkpKdFN5cGsw?=
 =?utf-8?B?R1E4UE85aHROZWliTUE4c0JVbXVZSWJGa3VIUXZsN0ZkZk9tc2p6SGxUV3ZF?=
 =?utf-8?B?UW15QXFRKzgveHFSNExlTHl3NFMxOS9hR1Y5dlBmL0VNYWEzM0I2cW41ZXB3?=
 =?utf-8?B?c3JvOGNJU0JTT2lWSmRVOTFUU09PUHNZOWZsZWM3NmVqaFZLRWJYb3lwUzV1?=
 =?utf-8?B?QllGWTkyS24rYWN6REZHNHVoVWQ5STRmNjFTNWliejNhamJ1cm9JYTlRUUNy?=
 =?utf-8?B?TVQ5akppNXdoZjBrSHIwYmNzbDlkK1poaVZxYVJ5bHdMV0NTam1MNnBtUk9D?=
 =?utf-8?B?YXFtbnV5YlJQOVlmMGlEaFA0VGtHMGVHYjdrd1ZCcjNvU3VMZkFoUFVIZ3ZC?=
 =?utf-8?B?S3pEZG8zdTB4Z3FseFBCZjg3NzRqRit2YnVsUE1tT0dlcXkxdDBIQkJseEpr?=
 =?utf-8?B?VkE5SVVTdlltTHZqYUFGbzNnZUtnN3gray9sMC9WM1BGN0sySGJGbjFnWkNJ?=
 =?utf-8?B?dDU0VENDeHVuRHRwckVyUDl2dkdmM1NSa1lmckMzTkc0M0ZGV1ZzeWlCREMy?=
 =?utf-8?B?T0w5OEdRcjdwcTVhMkIyVWd6b0NJTU95amRuV1BrQTNoR3ZPVTJKbVV5Q2Fi?=
 =?utf-8?B?S1VpQzRrUTdSL2lraExuZjFMQnFXTnZmWVlzaVJMMmZyMHNzVGYwL0ZSaWhH?=
 =?utf-8?B?dng1VWlSWjZidnpUdisxRGNaL3IwemNWWXNNdmljQUZIS0tHVjliaUc1NXk1?=
 =?utf-8?B?WWVOb0huVHdjK2Q1ZDdrM2tEdkVXNHlPdlY3MzBlT3k0MTFhSlkxRVdUVjZ0?=
 =?utf-8?B?KzRONmJuRFBlWkZuVFZsL2xvdElNZmVKVlBhWWtwWmxsQk90UVVLVzVJY3d0?=
 =?utf-8?B?Tm9VWVRFWk8za090UDdIL0ZQT1J0c29LcHMvWGNBa0dxZVVkS3p5ZWJtSGxP?=
 =?utf-8?B?aGtXZUF2aERKbnBHTDFKSmZHRVBBNGgyM0padnVVT0JnVmYrNFJpRlpQL3pZ?=
 =?utf-8?Q?VpaJw/j6uzzY+AaKNprdygaNv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0a3844-1544-4632-5129-08db3d12b3c6
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 18:04:33.9701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oem9AvBT4zsnxNs1J1BFDcXb2Ol4rAB64yhQXltqR89WlKL/ungGGS8JY3RLHIc8dDVjc6iHKHiF/UqrZQ1A7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8862

Hi Michal,

On 4/13/23 6:40 AM, Michal Orzel wrote:
> Hi Vikram,
>
> On 11/04/2023 21:16, Vikram Garhwal wrote:
>>
>> Add device_tree_find_node_by_path() to find a matching node with path for a
>> dt_device_node.
>>
>> Reason behind this function:
>>      Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>>      device_tree_flattened) is created and updated with overlay nodes. This
>>      updated fdt is further unflattened to a dt_host_new. Next, we need to find
>>      the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
>>      and add the nodes as child under their parent in the dt_host. Thus we need
>>      this function to search for node in different unflattened device trees.
> You do not mention making dt_find_node_by_path() static inline.
Will add a comment about it in v6.
>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   xen/common/device_tree.c      |  5 +++--
>>   xen/include/xen/device_tree.h | 17 +++++++++++++++--
>>   2 files changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index bf847b2584..507b4ac5b6 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -358,11 +358,12 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
>>       return np;
>>   }
>>
>> -struct dt_device_node *dt_find_node_by_path(const char *path)
>> +struct dt_device_node *device_tree_find_node_by_path(struct dt_device_node *dt,
>> +                                                     const char *path)
>>   {
>>       struct dt_device_node *np;
>>
>> -    dt_for_each_device_node(dt_host, np)
>> +    dt_for_each_device_node(dt, np)
>>           if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
>>               break;
>>
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
>> index 58ac12abe3..998f972ebc 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -534,13 +534,26 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
>>   struct dt_device_node *dt_find_node_by_alias(const char *alias);
>>
>>   /**
>> - * dt_find_node_by_path - Find a node matching a full DT path
>> + * device_tree_find_node_by_path - Generic function to find a node matching the
>> + * full DT path for any given unflatten device tree
>> + * @dt_node: The device tree to search
> This should be @dt to match the parameter. Also, shouldn't the description say:
> "the node to start searching from"
> or
> "device tree root node"
>
> FWICS, you expect to pass a root node as dt node. However, in device_tree_find_node_by_path()
> you do not check if a provided node is a root node or not (e.g. no parent). Is this intended?
Yeah, intent was to write a generic function where we can search from 
middle of a device_tree as long as we have the start node from where to 
search.

But yeah so far for dynamic programming it's been called for a root 
nodes only.
>
> ~Michal


