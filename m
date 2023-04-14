Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842186E2A0C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 20:29:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521202.809615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnO9y-0005eG-Ld; Fri, 14 Apr 2023 18:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521202.809615; Fri, 14 Apr 2023 18:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnO9y-0005b6-Hs; Fri, 14 Apr 2023 18:28:34 +0000
Received: by outflank-mailman (input) for mailman id 521202;
 Fri, 14 Apr 2023 18:28:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YiN8=AF=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pnO9w-0005aB-T4
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 18:28:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26b7787b-daf2-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 20:28:29 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by IA1PR12MB7517.namprd12.prod.outlook.com (2603:10b6:208:41a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 18:28:26 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea%6]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 18:28:26 +0000
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
X-Inumbo-ID: 26b7787b-daf2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4Xy9O8E6hhy2D0uaBVXt7J8cZ2Bb/9Nq5h2iHodmEFzwrtekUEBJOAOzedJwSK/8Kg+lW3a8TlaFEFp12mfnJ2oxnmtri7BJ74DD+fgffj5nmy4c2FLwaiNgbKztcxsW+JVY+4+/9LIQxv8cipTeMuNiiP46DlMwNl26RVMy6vGQ4PaTDxaVd8ygOlLe87ONwwzWxVmUiaRjBLtRZVFiAdzM5Utun9A2ujVBgP2egB35lRao+k56krcx6w53HDRw49qjKSJGbtuaHkI3I1C2PXh4LsdPH5GrIMADFXO4VdZCpmQZhsAaRxHAklAWWQ5VFje+yUOJhwO+0gdSFuU3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=te2Eu0q5BWGrhHL/LWGAvbwYJB5zeA7tVLv/8x4nflg=;
 b=kJQIXVgbQPhykXGOB0LzIupgoFF3NAuPyRMTKk28cXwXrHwnXQM1Rc0G3OpMko6J4JoI3zJ29V7k1j9BIY8FSxM/irAL2/IiBGG/68nLgolXMWcsc0dQfNAaye15xWiy+/bSQpLS3SWuabNnDxTNOwDDKeAmEaSGmxXtPxdAsBpJSsfbhQggkCTWiOBK4dDfpGa3CbvtDZZ93d0Rtn6F6quOKU9GLEJkchJAdCOcGsG49sv8+Yy6fTIw7OcP3RC6tB4DD1wMtkZjp3Sg0dD4fRaVKR2vsTxmF+dbJWxZP56ZmqsSiZxsOlRAU2ZzSgVXVN2UNh0PgCuGYXGsMarxAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=te2Eu0q5BWGrhHL/LWGAvbwYJB5zeA7tVLv/8x4nflg=;
 b=OlIeY2VtgxXr27kZTih79qRSxWKapLumebisiWaTq56UwFnuwNcUal30/c32B/FcFw1kD7buGtpDm6IUL08KyHDzWZXlrdxicD7AjMgpzTdOiyfWAvKp5yRrAGCKlwPlR58uuESzzK/HlNifCvK35PBreFIW+g2MqfZ6Qtpm92o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <81b7b4ab-1765-67dc-0d0e-8fcf8a8f41d1@amd.com>
Date: Fri, 14 Apr 2023 11:28:23 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN][PATCH v5 02/17] common/device_tree: change
 __unflatten_device_tree()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-3-vikram.garhwal@amd.com>
 <869d014a-d325-6592-d51e-e3638ba04076@xen.org>
 <e8405b8d-40a9-3df4-90e7-89ec7195449c@amd.com>
 <1198aebe-caa7-fefe-8c09-db7a14ec7c34@xen.org>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <1198aebe-caa7-fefe-8c09-db7a14ec7c34@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0063.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::40) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|IA1PR12MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: be032754-80f5-49ee-529e-08db3d16093f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	niYEMMWwMNa4YMkGG49TFKV0lyedNo771oL1UoFmVm9YtYITpV9IZl/5YzVr1x+0TaKx4H0AFFDVIhscSmaZ5mMqBC4s+2hVvaMrY1k2zRfWVARrxItks9KfPJVqMBbkWFhdT4Nv3FcUgGfCch53L9csgioHT68LCgZ1h02d1yOO1AnxZPdgVzsOXbK0r+u72mcrDZcDF2mWeVOxWDKvSkQPSZslsGHC0wM6ZDHWVEZ5D9Not6RJU15HQSPtff+0rHFBb1DgLDbNEgsnJ6OX+gLKIsmRNaVvjX7sFANNRMKBZaZttMa1K3muGf4d8OzG7MDlDlLr38H50CllNFB7ZxNn0v91IZq3oUekoiwNVQ9AIaT9neJ1qDMpYAY5MF8OZI6tSDQQwpqWwX1L88iHxBdsaUQ51aue08rXnerrPoXzEdelfov2ntpyAIWqZZn923DbovpP94GpXcQlqACVOBBY5+88jHJzB8Y/issUuMwS9N6mOzMDZiE2vPaM1fRAUEBQgnYzcABrzJZLySCtJSLDnsWrjAsVMkjY2oU1EpcAvC5O5B+zToYyJvjQJF+NrwYzKM4Xz5hZaS/fbT2Virk1LY6DzhLrXcn0yFzzb0OcVabmnJmMIPFb3ezg7v6cEOsOg9xpsnhjzMTHSTkJRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(6666004)(5660300002)(6486002)(66556008)(2906002)(66476007)(36756003)(4326008)(66946007)(44832011)(86362001)(38100700002)(41300700001)(8676002)(316002)(8936002)(31696002)(478600001)(53546011)(26005)(6512007)(6506007)(31686004)(2616005)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmIwVnVFbjdxTXJISmNOYlJXVld6Tnd0Z1VOaTNjV0hkOFJNRHdyOTZUcUJC?=
 =?utf-8?B?RGQ4dW5UUXdwMWVhSUFCTmkxNGRTOGJjTnNaMkhGNDM3dHJDOFlPMk9YbVIx?=
 =?utf-8?B?Qm1ldVQwTFJKeEplbVl3bUFpcnN5b0M5Z2NsMXBCeU9aT3VBcVdEVVJhaWRV?=
 =?utf-8?B?N1g2QTJnNmx0d1dRcnhHay8yMVF6V1dLUXk4bjcyQkZvSWozR1UwMlNWb0xC?=
 =?utf-8?B?RnltR1V0c0E1WXNvVmVOcUpoS2JzQUVyVHUxa2hqNG9PejNhZmwzNXRyNjdD?=
 =?utf-8?B?NFlyY3djOWY3eDUwQTVtVUUyNkoyajFaRUJTcUowT1F6T1BCZ3dWRkJMQk41?=
 =?utf-8?B?Um40YW5LeldWbHd0ZkVRZHdCSVg5SGZhRDU5TWx0YjRrd1VBT1NYZjNFZTVy?=
 =?utf-8?B?SERWMTdselp0UnErNGJ5cDdXNzNUeXAwNjlZbmQ4L0hMUWtkUGZpOTIxVmMx?=
 =?utf-8?B?VGIvcDhzaXZHd2ZURUljM1AwYnh6MmlwNUlqVnZMYXpQcGNHcDdUT3psRy92?=
 =?utf-8?B?RkJjVFUrZnlpMnJMOHY4Ni9aR1ZXQUMyZStINzh1UmsxRFRLVW1PNlNRam9n?=
 =?utf-8?B?dXB6N0RTRlNHZnQ0eWRuZzBackxpMjgwdU5DWHgySzhEc2pNT21qNVByV2dO?=
 =?utf-8?B?ZnlyZUdINlpHLzRGNlhsUHRmUG1FTWhKS05VaVBKUkFBblBCNEU2MmJZSmNn?=
 =?utf-8?B?ZEcrOEw3aE16YVQxLy9XTVNlYXpqMHRydHF2ZGNtdFJWeVRiQUZZUXFuSk5p?=
 =?utf-8?B?ZUh5UWxWNDE3YTViMGVhSXF3UUs5VUNTY210R1cvQmxvTFY1eDFOeTFMVGY4?=
 =?utf-8?B?VTZRVTBMVThRTXJqWVVXeUk3YjFYbWxxWFlkdllwTTVwV3FEMnJHajFBNTZO?=
 =?utf-8?B?NW1pNWdtcVRzSWliZ2g3RWJGZW1lV044UHlQOFFTQVVjREt4eEozUEhaQzVp?=
 =?utf-8?B?Rk5IZmRhS1ZPbkt5YlNKR1hIZnBSbTNjYzB4UEh6VUozUkRMRW5ZRlJ5emY0?=
 =?utf-8?B?U3BVYzhIcnNsRlZoUW1LVEtuNlJIaTBuK2QzdVR0TnBkSGVPM3g0NHZiN0ZP?=
 =?utf-8?B?U1hiRWNpNVIzaXp4MW5jM01DM0s2Ymdudk1lN0JiNlYzbzZKMVF1U0RiKy9w?=
 =?utf-8?B?L0xtMmozOTVubEwzZUdKcDU5RWsybTRHck1hSU5odnhCRWd2UjdneURiNzhp?=
 =?utf-8?B?bnBBS3FFUVd0aDVNT0hqdUVFeG5aTDN4VkdjYmNyb0YycUhWSktYaUdHRkpW?=
 =?utf-8?B?S2s4OG52aWxQZTZpVlZHeTJlaWRlSjVrTExhaTVTUDVLTVVnZktmTlkxcXow?=
 =?utf-8?B?cEpwaHhiY0ZPb0VLblZCbUxETndwM2Z6VS9CZmR5TEtCYlVhV01kNi9IZUda?=
 =?utf-8?B?NXd0cUhoVHp5bUdZYXRBbE55T3Z0U2pscjJlSmFJWlVaVE90Z2lkY0gyczRY?=
 =?utf-8?B?aERiWncyaFRtQ2laWVFORTY2M2ErOTRLclBHMjY1VHdWWFB0eTJOTTB1WEVB?=
 =?utf-8?B?R01RelpPSG1zeW8zQnpvSDhTRXIwdHdVejl6dFhZaVJzcXlLYmZWWm10NG9V?=
 =?utf-8?B?YU42aW1KYUhmQjFYU283SnlyRDA2Q3hRL2NGb0xyWlBVNnhGaWVvd1hCSTQ3?=
 =?utf-8?B?N3NPR3gwOHB6cnV6R2l3K21aaFpCNU55NlhFSkhkNksrd2ZTcnhzNTVmejNO?=
 =?utf-8?B?Y1BicEo1OGUrWi9pTk1tTzVXZ3dNQzBxd2JXbHVidXdNZnMyRE5oQlFwV3FG?=
 =?utf-8?B?QXZROFk2ei96MXQwQnloKzBTTUdsZFNmMTd5VkdIa0VpbnkvQWZXQktJQmkw?=
 =?utf-8?B?UnVsMkdaS1lOaTU2Tm5rOTRJV1BodWJUZnNIUkptNm1vdXdvY3RWbEdCVllw?=
 =?utf-8?B?NTlCZy8vZ0IxeWgya0J3Mmc1UnRaSVhRaGw5bnQrMVBpNjhqV0lFUkYwcjhT?=
 =?utf-8?B?d3RMVmJYbzBLVElxZlN4ZjFhL0FOOGRraWxkd0IvQ1FxODNpQW9SQjMwZGVC?=
 =?utf-8?B?Ri9hN0ZCazA4aWhMeCtLMjAzOGhJRkVpSHA3OTFubk9maE4rWnBJVy85S0p1?=
 =?utf-8?B?Tm5IQ2ZjMnBIVGFrRXlkSlZHS1JNbFdWbzBVcGY5VnZrYmtrNWQvSi9iTnNw?=
 =?utf-8?Q?Omc0PZEMWvIFVrghesSeiEW2V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be032754-80f5-49ee-529e-08db3d16093f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 18:28:25.8283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60ZsMNeywH+AHE4n8fRUH/paPNxwMIN4g1j9f1vk7d7U1G/t01MmGIaARGMynNBcGWJeaBrA1vroMME/xySyYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7517

Hi,

On 4/14/23 11:09 AM, Julien Grall wrote:
> Hi,
>
> On 14/04/2023 18:51, Vikram Garhwal wrote:
>> On 4/13/23 3:03 AM, Julien Grall wrote:
>>> Hi,
>>>
>>> On 11/04/2023 20:16, Vikram Garhwal wrote:
>>>> Following changes are done to __unflatten_device_tree():
>>>>      1. __unflatten_device_tree() is renamed to 
>>>> unflatten_device_tree().
>>>>      2. Remove static function type.
>>>>      3. Add handling of memory allocation. This will be useful in 
>>>> dynamic node
>>>>          programming when we unflatten the dt during runtime memory 
>>>> allocation
>>>>          can fail.
>>>>
>>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>>>> ---
>>>>   xen/common/device_tree.c      | 10 ++++++----
>>>>   xen/include/xen/device_tree.h |  5 +++++
>>>>   2 files changed, 11 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>>>> index aed38ff63c..bf847b2584 100644
>>>> --- a/xen/common/device_tree.c
>>>> +++ b/xen/common/device_tree.c
>>>> @@ -2047,7 +2047,7 @@ static unsigned long unflatten_dt_node(const 
>>>> void *fdt,
>>>>   }
>>>>     /**
>>>> - * __unflatten_device_tree - create tree of device_nodes from flat 
>>>> blob
>>>> + * unflatten_device_tree - create tree of device_nodes from flat blob
>>>>    *
>>>>    * unflattens a device-tree, creating the
>>>>    * tree of struct device_node. It also fills the "name" and "type"
>>>> @@ -2056,8 +2056,7 @@ static unsigned long unflatten_dt_node(const 
>>>> void *fdt,
>>>>    * @fdt: The fdt to expand
>>>>    * @mynodes: The device_node tree created by the call
>>>>    */
>>>> -static void __unflatten_device_tree(const void *fdt,
>>>> -                                    struct dt_device_node **mynodes)
>>>> +void unflatten_device_tree(const void *fdt, struct dt_device_node 
>>>> **mynodes)
>>>>   {
>>>>       unsigned long start, mem, size;
>>>>       struct dt_device_node **allnextp = mynodes;
>>>> @@ -2079,6 +2078,9 @@ static void __unflatten_device_tree(const 
>>>> void *fdt,
>>>>       /* Allocate memory for the expanded device tree */
>>>>       mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct 
>>>> dt_device_node));
>>>>   +    if ( !mem )
>>>> +        panic("Cannot allocate memory for unflatten device tree\n");
>>>
>>> After your series, unflatten_device_tree() will be called after 
>>> boot, so we should not unconditionally called panic(). Instead, 
>>> unflatten_device_tree() should return an error and let the caller 
>>> decide what to do.
>> Looks like i misunderstood v4 comments. Will change it to propagate 
>> an error in case of failure here to the handle_add_overlay_nodes() 
>> caller and that will further forward to error to toolstack.
>>>
>>> I suggest to read misc/xen-error-handling.txt to understand when to 
>>> use panic()/BUG() & co. For...
>>>
>>>
>>>> +
>>>>       ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
>>>>         dt_dprintk("  unflattening %lx...\n", mem);
>>>> @@ -2179,7 +2181,7 @@ dt_find_interrupt_controller(const struct 
>>>> dt_device_match *matches)
>>>>     void __init dt_unflatten_host_device_tree(void)
>>>>   {
>>>> -    __unflatten_device_tree(device_tree_flattened, &dt_host);
>>>> +    unflatten_device_tree(device_tree_flattened, &dt_host);
>>>
>>> ... this caller this should be a panic() (this is OK here because it 
>>> is boot code).
>>>
>>> But for your new caller, you should properly report the error back 
>>> the toolstack.
>> Understood, will change it in next version.
>>>
>>> Also, unflatten_dt_node() (called by __unflatten_device_tree()) 
>>> seems to have some failure cases. Can you explain why they are not 
>>> properly propagated in your case? Are you trusting the device-tree 
>>> to always be valid?
>> for dynamic_programming, while adding node(check patch: [XEN][PATCH 
>> v5 14/17] xen/arm: Implement device tree node addition 
>> functionalities), fdt_overlay_apply() is called before 
>> unflatten_device_tree() is called. fdt_overlay_apply() will catch the 
>> invalid device-tree overlay nodes.
>
> I agree that in theory fdt_overlay_apply() will catch invalid 
> device-tree. However, neither of the functions are exempts of bugs and 
> there is no code shared between the two (they are not even coming from 
> the same project).
>
> So we could end up in a situation where fdt_overlay_apply() works but 
> not unflatten_device_tree(). Therefore, I would rather prefer if the 
> latter function properly handle any errors.
>
> Note that unflatten_dt_node() already have check the validity of the 
> DT and will return. We just need to make sure they are treated as 
> error rather than been ignored.
Thanks for explanation. Will add error handling for unflatten_dt_node() 
and unflatten_device_tree() for failures.
>
> Cheers,
>


