Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29796E29B5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 19:52:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521181.809565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnNZy-0008RM-OI; Fri, 14 Apr 2023 17:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521181.809565; Fri, 14 Apr 2023 17:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnNZy-0008PQ-Ka; Fri, 14 Apr 2023 17:51:22 +0000
Received: by outflank-mailman (input) for mailman id 521181;
 Fri, 14 Apr 2023 17:51:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YiN8=AF=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pnNZw-0008PK-TZ
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 17:51:20 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe59::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5459c84-daec-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 19:51:19 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by CY5PR12MB6551.namprd12.prod.outlook.com (2603:10b6:930:41::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 17:51:05 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea%6]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 17:51:04 +0000
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
X-Inumbo-ID: f5459c84-daec-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABqetQ6EY57DXnmcLwCkl4K0btJxstAwaJ0qNF+Bc1F3qZxraUKtkcgD/ptDpJeO+XX0vZQmaICMF0jDfiyjqHYwH0lTf4Ks4qW6nd9iM1Ge7Mw2MN5NgD25z0joOaQP5d0HYK2QQup/7rI4E2k5vfeDYOg45KREeEoBVUiLol8EcM6sWVPKKs7AJx1IxLCBTHqb2ZLscXP9RPgNlIqE8u6Cp/UvCKepyXcLdRIoDc3nLdhvZyY2DrdN/dco/4lNGVGYPt3kVWrc91Bnav+/r8N8qX6bb4XCNaJ8iwrr7N2PdlN1kN2Nr/1WRfGMSDbbioMAvhTYRaX9DGAINm6w3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqWe/9nIBPcNRaEVaF8DD9CU4ey90w+PK361ATYjsSo=;
 b=AJhlCgC1N4a2aeMCAm/v1oXxuFsCjsttoPYusXD9PIuJaQwDCxG3bqPLMhAIbacHHbuHqWmuvm/B1M/9WXNzKWWlLcFeUBadtSuD4ET6RNSohDNXaaGeP+gCXn8qZPDBkVjMqu8WxQpWwr7ceU4mrWl+9NB7eaP1n1FrfEvsfj4ZeVSwnoecNxaprJ4nc31IdrwS4qQR7YVI+FfKNT9QRgQYKRLlG69IwPOQXLADhCbwRaNc/cEpqsxOobeyUYjQOcG0NRPvqKaRJeme9bo1o8eD1ISMyuPMQn6vbUMot4U1jhPq55u28RVVV4vcUbaVPgEN36xOAOieMqxwCAWewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqWe/9nIBPcNRaEVaF8DD9CU4ey90w+PK361ATYjsSo=;
 b=LhnejioaQtRRk7BQvGLII60UG46A2JzzIzQiRC6JANmPElPl3tOC65Djl2lvnFBad1l+gDnKupbcBpexVApwViHG2N6Wg6p4mLvbes7rwMXkdV1QwTum4OtpzbOsETB66rQxMVyvecuOpjx8zeAyQ4BcUZgkQ3st4brONxo69D4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e8405b8d-40a9-3df4-90e7-89ec7195449c@amd.com>
Date: Fri, 14 Apr 2023 10:51:02 -0700
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
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <869d014a-d325-6592-d51e-e3638ba04076@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::25) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|CY5PR12MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aaf64ef-2b85-4f80-48b3-08db3d10d184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/TLKPjs+l451swX29auLPr892nkKcm6sOXr85PmeukLjRXpnMXkayNf9GOIu2+8BdtZTDlUppR0tz84cdgQZAh1uohhMgNSH0jzSrYQ/eBRjeFeyEezIQil5qsfepTIyghG8StIEz0tkfd13LImELuDQriqlTB1Z9Ymw2WS9Sjk32exyPFGCML2f3OZKoLeraMFd4/FJHuOCHqUMesmwO9/MhRdgN/8iastrentqnA/0TLb/I8WF6Bz6zJTEB0QmbuTg2hlX712jK/l6fd+sQqx2QfJMwA4kD37Svo2GS+ecA2EVEktz+hs/xlkFMyyXPuiRjZ+qZS3xg+Cpt6M8ZG5ihus9dOuYHfV4mr6WL5IXkwE3qFnXRGCEoh0RAUaQR1ZTKFY9JUeXkp9AY0FLSf/IvhwnEDwA94buYQ0UBbapGJdDadMzfomusiOP+M5qkAuoWpl2ebFptd90rU4+ZGxFo09zhT7YbVeog4IsHjezCndPyu+RRXicUPaZDxjUmfkFqLPJwVDsM7Z62b6Px4NpfEEK6+vADq9e2Y1WQTN3cRgnPq1/Szet6geuN+dFw1FwX8T95arRSoWXCJzyFmNEHijv4Pe8f7q3fqTxjHcc+AzNO7h879TIdlr8r1GgmwyETwQlNoaJE/9wBP+zRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199021)(41300700001)(4326008)(66476007)(2616005)(66556008)(66946007)(36756003)(186003)(2906002)(44832011)(5660300002)(83380400001)(8936002)(8676002)(86362001)(31696002)(478600001)(6486002)(31686004)(6512007)(53546011)(6506007)(26005)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnpCSjFaRitScHdrUVBHdk53dkhHcksxKzFtaWVXNXlBR09yK1piUGx6Vlhu?=
 =?utf-8?B?Y0U3WUZMRTlRMWRVT1V1a1RIdWx0eTlWU242VEI3bzlLWll0OVk4T2FXTzVU?=
 =?utf-8?B?dFpXWCtvZzI4TTV5K1RCMnp0Z1RtejVYaVl2eU10YitEMFNoSSs0Y3lHRHVK?=
 =?utf-8?B?U3FmZWFidEd5ODFOWWVRMmhNQTJSaE9vZTkreENHU21rblVvQUpqeDFNeTlz?=
 =?utf-8?B?S0tUOXNucEkwT3RESHNTRDNhYnNqd2ltSXJiYktsc2JJYkNQUjdmZFhkS0Rl?=
 =?utf-8?B?V3ErcVROYnIrK0RtNVJXZDdIWWh2WTVpU3J5UHFCS3RMRUVzL2lBL0ROeEFO?=
 =?utf-8?B?SjRTNjM2N2VoenJtUUxsWDlTZEk0LzNyRUVyaWN6bmhmSnJTZ2pseVpQNzdm?=
 =?utf-8?B?NFB3SXpOS3Yzc0wyN00ra2VlUTh6OGhRQUR3UW9XeUJ5WnJJRFBPR1h5a0l1?=
 =?utf-8?B?c0ZXN1lpazdvaHZqaTlWS0VzenVhck5nL0pWTTB2czBMM3JHWmFWY1FZNUp3?=
 =?utf-8?B?NUE2SDZyQTZjQThVekU4bzVJVmpWZCtuR0JQQ1BnOVluV21TL0lrTnhSelNO?=
 =?utf-8?B?YTRqVk9WY01nZDB1bzlqNXlFLzBsaHhKY1J1OGs4OElYdDNDTittRm5HTTMx?=
 =?utf-8?B?eUNIbUJlK2huUVlsY05uKzdyL1dkd0pnQkpiazY4T3c5Q3ZCWExyZDRuQjdP?=
 =?utf-8?B?VEowcWdiR0ZPcDFLT2pubWVCMnBKTTdBVFdpUHdCc0JUNm05R2J4a0JFclVp?=
 =?utf-8?B?R212NGVqR1ZJU1FPVUhYcG1YRGlHRXJVcDFFS3BITEVsdTFqZFRocVcwWTV0?=
 =?utf-8?B?UWZuSnFxQ3pHSVd4R1RROFJYVFB5WTZ2TXVpU2pNS2kwUnNQU2ExK3lCbDhy?=
 =?utf-8?B?YlRCdVh0VThKanFaWmVlNmFhTUpxZTdWeWpRNXJlbXQ2dGd2M1VKLyszSldO?=
 =?utf-8?B?RHFySzZsVHB4UHRNVFBuQ3JuM3FaS2d6MTh6cFA2WEF4RTAyNjJRV3VJZDEw?=
 =?utf-8?B?RTIvWEsrL0FUbU5XNWNldHllMkdzVnhiTTh4YUZWNUtHNkVDOGNTRldtazND?=
 =?utf-8?B?MXM2Wm1lOWsvQ1g1Z29YanlVZGkrVEdhdVlmUWxpUEVDcFpPa2UvR05zUTBL?=
 =?utf-8?B?aHdmeDJzUWFuMTFVb3k1TS9hOEVkUks1NVdHcjBCRmtVcjVscG1EVUZYTTZ6?=
 =?utf-8?B?TjQvOWxORlI2R3MvT2NKSUpTUGFSWWdlZEJ0RG0yRktxbXFPVlpHeUhvYm4w?=
 =?utf-8?B?MTE4SVB0ckZlOUxEL0JibHkzNG9kWGtaVmd0aHVhakExTE81UWZDVzBkbUhw?=
 =?utf-8?B?SGtZUEMwZ1Y0bnl0aFpYOGd0SjRCTVhYbHFnRTJPelYvMTh5cVYvYjg2Y2hj?=
 =?utf-8?B?V3VjY0NtNmdxd05BOFE3cWtBR1pQdGdreFIvU2RtY2VsQkxxa01HeWdRU2lj?=
 =?utf-8?B?bnB5RzJxWVdTa2VQbVIzd0FLc2Nkditpb1RBYlJhdjhZemlRaHNSM1ZXUXgx?=
 =?utf-8?B?c3lqTUxBUVZZazB1K0RuUTB2UnFDalYxR25nNGFzamFsWU14Q1k2aHB3Z2xr?=
 =?utf-8?B?TUNRcURQcDd3UkxGaHhCWDZRMHVEcElWOTRBcStmbStEREpUUFRBR0VUdXZh?=
 =?utf-8?B?Z21TbnY4UGFSdHlJZ1ZGay9wd3g2emZ0ajhGbnJUbjBSdnhabHRVOEh1S3Vp?=
 =?utf-8?B?aDBYcFBibU9TTmRSL0xpUkRNK29WcVYvZDBBQXptVEtrYWZrQU5xaHJwUkhJ?=
 =?utf-8?B?VkFyYVJVdkRYdWc1UEtsNElyblhRNGJZZ1VISlVua3dlNUNZd0dXcUNCUUxu?=
 =?utf-8?B?Nmg0MHV0L2dXUzF5RGZ3ZzU3ZmtNTzNNNml6aS9jRWdQUVRKQVR2eUk2ME5v?=
 =?utf-8?B?MnY5WFhETzIydGdmWUZZYWFXc1Y4SEI4Y0tyM0xTUnZCQ3BscmhXZUV2bzZ0?=
 =?utf-8?B?dGpUZ3BHeHJ3VUZTb3V5aEtUN0QvWmROS3pZaWRyVmlLZWdIZVRoUG02enk0?=
 =?utf-8?B?dUlEbnBpZEZabmplbmkwOWRWQ2J6dUZ4S210NXNKOVJySHZQVHlKb3JvY2Fy?=
 =?utf-8?B?NTgybVk1QjZtdEVaUDBuNmliTEoyaUFlWkhJYndRNm9aSW5iclhobmphb0pO?=
 =?utf-8?Q?qN6WwSe3LqeF/wWwi6Y4NS0nf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aaf64ef-2b85-4f80-48b3-08db3d10d184
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 17:51:04.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tgAUSelpVTgVzOdHzNY08chY0c/yUzlhCUJohAVRsik0Zxx8b5bsN0OvBfotx1ATLwPfsVlLVus4yKWWtStEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6551

Hi,
Julien & Michal, thanks for comments.

On 4/13/23 3:03 AM, Julien Grall wrote:
> Hi,
>
> On 11/04/2023 20:16, Vikram Garhwal wrote:
>> Following changes are done to __unflatten_device_tree():
>>      1. __unflatten_device_tree() is renamed to unflatten_device_tree().
>>      2. Remove static function type.
>>      3. Add handling of memory allocation. This will be useful in 
>> dynamic node
>>          programming when we unflatten the dt during runtime memory 
>> allocation
>>          can fail.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   xen/common/device_tree.c      | 10 ++++++----
>>   xen/include/xen/device_tree.h |  5 +++++
>>   2 files changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index aed38ff63c..bf847b2584 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -2047,7 +2047,7 @@ static unsigned long unflatten_dt_node(const 
>> void *fdt,
>>   }
>>     /**
>> - * __unflatten_device_tree - create tree of device_nodes from flat blob
>> + * unflatten_device_tree - create tree of device_nodes from flat blob
>>    *
>>    * unflattens a device-tree, creating the
>>    * tree of struct device_node. It also fills the "name" and "type"
>> @@ -2056,8 +2056,7 @@ static unsigned long unflatten_dt_node(const 
>> void *fdt,
>>    * @fdt: The fdt to expand
>>    * @mynodes: The device_node tree created by the call
>>    */
>> -static void __unflatten_device_tree(const void *fdt,
>> -                                    struct dt_device_node **mynodes)
>> +void unflatten_device_tree(const void *fdt, struct dt_device_node 
>> **mynodes)
>>   {
>>       unsigned long start, mem, size;
>>       struct dt_device_node **allnextp = mynodes;
>> @@ -2079,6 +2078,9 @@ static void __unflatten_device_tree(const void 
>> *fdt,
>>       /* Allocate memory for the expanded device tree */
>>       mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct 
>> dt_device_node));
>>   +    if ( !mem )
>> +        panic("Cannot allocate memory for unflatten device tree\n");
>
> After your series, unflatten_device_tree() will be called after boot, 
> so we should not unconditionally called panic(). Instead, 
> unflatten_device_tree() should return an error and let the caller 
> decide what to do.
Looks like i misunderstood v4 comments. Will change it to propagate an 
error in case of failure here to the handle_add_overlay_nodes() caller 
and that will further forward to error to toolstack.
>
> I suggest to read misc/xen-error-handling.txt to understand when to 
> use panic()/BUG() & co. For...
>
>
>> +
>>       ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
>>         dt_dprintk("  unflattening %lx...\n", mem);
>> @@ -2179,7 +2181,7 @@ dt_find_interrupt_controller(const struct 
>> dt_device_match *matches)
>>     void __init dt_unflatten_host_device_tree(void)
>>   {
>> -    __unflatten_device_tree(device_tree_flattened, &dt_host);
>> +    unflatten_device_tree(device_tree_flattened, &dt_host);
>
> ... this caller this should be a panic() (this is OK here because it 
> is boot code).
>
> But for your new caller, you should properly report the error back the 
> toolstack.
Understood, will change it in next version.
>
> Also, unflatten_dt_node() (called by __unflatten_device_tree()) seems 
> to have some failure cases. Can you explain why they are not properly 
> propagated in your case? Are you trusting the device-tree to always be 
> valid?
for dynamic_programming, while adding node(check patch: [XEN][PATCH v5 
14/17] xen/arm: Implement device tree node addition functionalities), 
fdt_overlay_apply() is called before unflatten_device_tree() is called. 
fdt_overlay_apply() will catch the invalid device-tree overlay nodes.

Regards,
Vikram
>
> Cheers,
>


