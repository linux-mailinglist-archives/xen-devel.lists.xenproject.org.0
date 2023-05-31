Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6EE718B39
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 22:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541969.845279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4SUQ-00076x-Vh; Wed, 31 May 2023 20:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541969.845279; Wed, 31 May 2023 20:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4SUQ-00073e-Ro; Wed, 31 May 2023 20:32:14 +0000
Received: by outflank-mailman (input) for mailman id 541969;
 Wed, 31 May 2023 20:32:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LP7+=BU=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4SUP-00073Y-Ea
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 20:32:13 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 373023d8-fff2-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 22:32:10 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by CH2PR12MB4037.namprd12.prod.outlook.com (2603:10b6:610:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 20:32:04 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::246d:4776:b460:9277]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::246d:4776:b460:9277%5]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 20:32:04 +0000
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
X-Inumbo-ID: 373023d8-fff2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3PImYiGzkXjfUBlaarJR69Fpjsz+2+nQQYUU8e4oBmm/L37lB6I1AKIjdPrI6DCc+CK342d1gnKdRAYawBgALEQtco0qOBaopm1K+CvufeegN8UpEgMH7J/DtkYYCBCApT8Bjl9JMT0nphNr2IryoiUJ2HCub1cWFVCoTXwr4HNX1nFRNXgYCDmefOuuz2Amlxgt0LX6DrZFlk3xSOHBRAczIp/bvvP7waESEfNp5B5zFChKP2IEp5KzCIvZTrp4TOykdjzxaoRG5PHfrxnExrlmFlbfXW9eAnpyCWXCnNNGu6FhVhPxPEJ7MCtONTYwbjpB6bO31wuP5To4TVCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oO0AMN45eB6SUi2xKnMcHd4wNF11b/l4mcCntD3psbo=;
 b=AlQIgDi4SIo8FRmZ5/ZIrcC6GQ2HYvDQC9Cb7SR5MZOYDVatwONZCv+Egp0U5aXXPfb55581ZPLLDShydL5/RUtbpuObxygDvoaB52Gl5kU7YgTP05ip2MbBw3sqxLerR97TGUeX4HNKwn/zf+40c1Dp+fSseJ0traXG9AcBPgLGS8Ad083d9e+6RQpmAy0FiAuVU793CuDeMqGTOp71Irf2DgIFeH0IE/qqj4CEiUw5NHIujhmUaSq9ne8E0Fe39w+VwZMSpDgflYATHQ+M6pn8UNvY0GFqYnYFrxHLq8C1PriLIfTOGUHXGnvcFr40eDDzvI+iRRCcgRB+ERT4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO0AMN45eB6SUi2xKnMcHd4wNF11b/l4mcCntD3psbo=;
 b=1JnBHLg4lX5YA2CosixGDaRgDblLFaLNekXZhKkEN4Jqyhck5cbYiUbfszyXrrLzRkNFv1SjU5LvB7YSqm7RetnepEmtzY8jTeSedgzPiUHTPHLRYyJhfwYF571MV8RR0gFThn0TabVosTCiLM+vNvaI0DX0Rol0wy7E1BoIQ9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f854bfc4-1f3c-19df-ba22-89c8859cfe6d@amd.com>
Date: Wed, 31 May 2023 13:32:01 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v6 02/19] common/device_tree: handle memory
 allocation failure in __unflatten_device_tree()
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-3-vikram.garhwal@amd.com>
 <57937e19-e038-b36a-73aa-c2a95de7e525@amd.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <57937e19-e038-b36a-73aa-c2a95de7e525@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:a03:338::34) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|CH2PR12MB4037:EE_
X-MS-Office365-Filtering-Correlation-Id: e54924e0-061e-44c1-bc4b-08db62161837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EMwlazHoRmMBEjx+gDvj3IXyz+AOJP6pzIdmaP/xarAn/y4Zf5G+hEWgRXJmnvWq/GtE/EL4Z0PU0j7BBY/bx0LeHMeG1IKcMiIYGEJi3KQGqzwxbKR+aIT87YaZKGe+RpqTa7UR/KS9C/Ufl5SHTwn2b2t6EM5hb/Hg9K2hHqXMcaF5x/8Pm1aalq+w5gR59aAcOJOHzXrAfdZy8lRDrDzcu0Ml6rmrmI/aNNVre0Je2Al7Pb7Y2Aj5NR5xkpVVtXKkwriyHQmuGEOaNLSna7TAoG4wygKIJV/Ph8p0RdYeMp99UY/dR3J8DNzrX3KDDbK/C0u1VtEPweoHt7sUxOYCjRfFvZrt6VRh88R5hZnaB4zgozytbOJJ9OKzuTFhGQojTzq6m5At1gR3nViAgE9qdVxlxn2XVpU2AtEiTD2xxhi3gh0vemruOLgGR4QzD7VV3AUpK7/6cuyOar/aGRZmHnDfCYps9Q/eUQYivS0VyPx+nvDK5is2Es6BzG10fMGUd7oPGvG7UrlibGyAYndcZ1d+LQHAefBtufapqDN6t3JtcifrVMTan/KuRKpqkd1siZscNGL86PYIhdVFzH6+Crtnl/RvbUeIsiZ1qAVQj7OlMQE6bu7IpuoryqBAe4+mTAAcNaInCWbR7+ClDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199021)(8936002)(8676002)(4326008)(66556008)(2906002)(66946007)(66476007)(5660300002)(31686004)(41300700001)(44832011)(316002)(478600001)(6486002)(966005)(6666004)(6506007)(6512007)(53546011)(186003)(26005)(36756003)(83380400001)(86362001)(2616005)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1lhQmNoWWV2Z0R3Nnl2dzZnNHBRUzVON2pHamJaUitvd0lrNURXcGQ1Y1pO?=
 =?utf-8?B?K3pNSUtyTzlzT2pybEdzbTNGaXVydGxjRlYwZk9Xc0hvZDZTcHpIN0hXOEJn?=
 =?utf-8?B?bnZIa3M5cnJ6MzRRd0tMWVJWL2NCQW5HbjdrWHFpQXE3bzlueVBnUGVWaXVa?=
 =?utf-8?B?S1lZMHZWclZ6OEVOQnZXMFBZVGlxWHNvSHg0bGZVeFNsU09NVTZnTEl0R0No?=
 =?utf-8?B?YldIN1g2SHhWeFM4ZjFjWWZSNXlOZ3FLTis5Vks0ekZ4eHgvOFJWZi9vN0Iy?=
 =?utf-8?B?M1NQM2lmK2ZpUUhrejF0dTdRWlhaN3FyM0NXVUdOZ3RpNFJIeUFsL0NZbW5W?=
 =?utf-8?B?TFZQWE5yU0ZWVFJWWlRMWENkT3NHY2NnazNvMzVlTWNiOUROZVFrRzJHRTBP?=
 =?utf-8?B?dW00cmg1UVI5bFlBUlc1NUZmdktKWGNuc3NnbWxRVm5CVDgyeElBZlc1TjlR?=
 =?utf-8?B?KytQaGRhQzM4K3pwZGZ4TGRFSDdXVlVBbllTVGV5MXo5cDlKV3ExV0h6d1Nj?=
 =?utf-8?B?aHhtZXo2Wld5SWJoUFQzYTBIa3EzRDV4SEFtZUJEc0wyM0tmRmhXRkR6d3N1?=
 =?utf-8?B?OUw1RCt5T05DQTM5NXFldmkzZm1Ea0dJbXFTOTc2cURKOHNOSTlxeitFeDRD?=
 =?utf-8?B?R2llRHc4Y29xb3dyZ2xTNFRsNG8rcmVLWG41WTZ3M2RzbThaY1h2QVpwclYy?=
 =?utf-8?B?VGNYTHp5WDRqVytKTVJ5TFlvYWFQWDJzZHg2M2JvR1lQTWpwOVFUU2hlc2hx?=
 =?utf-8?B?QXV0ZkdLNnNkWUVmRFIrckFQWU9SdzBXNG9QeVNLdjZ4cWdtRkw0aWM2VUhB?=
 =?utf-8?B?TzV5MWZwUXhNampSRTdyTlg2SGwrb2k0ZGx2cHZzWGpSSUZCUjBNalFrTTQ3?=
 =?utf-8?B?VWZyOVd2Q3VHbWVIZEE0bDU1amN0L0lleU1ZQWV3KzlNWUcxWEJTSmlXZ1Bm?=
 =?utf-8?B?VkQ5akt4K1ZSOVdSdTlPSXFwMjFyOHcxNnF0eUxwbCtudi85YWFhdlNuUmNE?=
 =?utf-8?B?MHdOSnBQekVCaHJjdllyMWdFM0hZKzFwd1BTSXRlLy84TDVxMlVyZ0l4YUdL?=
 =?utf-8?B?aDVjRGU1T3hvNkRuVW1yTTVGRUZ6end0d0t1eURTVGhRRU4yMWJjWW55dVNC?=
 =?utf-8?B?Y2VjanQ0dkpRQVVhTVVqdFE0NzhlWE1DSS84VHI3YmtZandUNFQrNjRXUlFW?=
 =?utf-8?B?UXNLOGpUZU4yY2tKRWVIS3JNVHJyZnFsc0JKcSswbWhCcGUvc05NSU4zT29v?=
 =?utf-8?B?VUNOV2Q1WVhqMnNQb3NKdlVLdzZldi9tYlMxWjY3UHc4SGlrK25aaDBSRUcw?=
 =?utf-8?B?ZVZYcGxLbDU0VHF0Slp5YXozMGJqaXJpbm9ybkxwYXBXeCs5VEs5VUwrbjZT?=
 =?utf-8?B?b3lZYXJNcUg5NjUxcEhKdktrYlBtVnZaUmhoR0E1aVZZU2NWdXhCTGd5TU1n?=
 =?utf-8?B?c3NwWWhIaVZvemJEYnByR0ZLQUNGdUlnR3BwQ3lmaUFBNTBzVWR2N3ptNnI5?=
 =?utf-8?B?b2xoUTJUd0IzZVdIV1FMUEpUSGxGaWZLek94YUZVUFlKdUxBRU5kNk5IYm9z?=
 =?utf-8?B?eEJ3V08rRGF6QlhSVTZmRGZaODdYUXQ4dHlTY3AyUmVNeFlWcXo1NVM0MVJJ?=
 =?utf-8?B?SEp4ZDU3c1dRZEF6dUtncHVDa2Z1TklocFJVUmpkdWV4U3hkUHJQZDlWVy9u?=
 =?utf-8?B?U3Q0eXlqdUZKVXVDWEZKREUxcXlPaWFmN2JRRGpTNFRLUElBakJOckRsR0JU?=
 =?utf-8?B?TFU0OTZVdEJsNk5uaXZ2SVB2MTlGUHVhOEoxbXIzcVBML0liMnNONTFUMWVF?=
 =?utf-8?B?Vm43aVpNY2ZnZ2NjSWI3WUpEV2hPaVl6OXc1YjdQWDFQNGZyVGZqbk5JTmFh?=
 =?utf-8?B?R2VUOVROZGtZdkxXeVhmSDZRZE1XRktCRmZsME92MGtlRTJ0WkdjaXNnUzFq?=
 =?utf-8?B?RU9KZGpFOGIxNHMrbUNlL1pkY2xyVGh2eEc1NFlmVGMxYm9nOUs5eUlpeCt2?=
 =?utf-8?B?OTg2Y2VTamhCMlorRXgrNVJ2b21qY2M4bVdXWEczWjluUXNoK2VmclRUdmJV?=
 =?utf-8?B?SEVNQXJYdGYxTEZRUk9NdnV5L0R6UlNNKy9JM214eEc1ekRJcVo2YWV0UEcw?=
 =?utf-8?Q?XUT9Kn6FRnw2yrFnhmFhGjUMI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54924e0-061e-44c1-bc4b-08db62161837
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 20:32:04.0826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsKjGTf5lO5+ilWUUrr9yY//0Od2Wqc0/a9MDzkaewY2DyxJ+mippWTu/Fi/e5oBejW+jTn+VO5Y3er4EVVMHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4037

Hi Michal,

On 5/5/23 2:38 AM, Michal Orzel wrote:
> On 03/05/2023 01:36, Vikram Garhwal wrote:
>>
>> Change __unflatten_device_tree() return type to integer so it can propagate
>> memory allocation failure. Add panic() in dt_unflatten_host_device_tree() for
>> memory allocation failure during boot.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> I think we are missing a Fixes tag.
Like the below line?
Fixes: fb97eb6 ("xen/arm: Create a hierarchical device tree")

Original patch for your reference: 
https://github.com/xen-project/xen/commit/fb97eb614acfbcc812098bbbe5dde99271fe0a0d

Regards,
Vikram

>> ---
>>   xen/common/device_tree.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index 5f7ae45304..fc38a0b3dd 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -2056,8 +2056,8 @@ static unsigned long unflatten_dt_node(const void *fdt,
>>    * @fdt: The fdt to expand
>>    * @mynodes: The device_node tree created by the call
>>    */
>> -static void __init __unflatten_device_tree(const void *fdt,
>> -                                           struct dt_device_node **mynodes)
>> +static int __init __unflatten_device_tree(const void *fdt,
>> +                                          struct dt_device_node **mynodes)
>>   {
>>       unsigned long start, mem, size;
>>       struct dt_device_node **allnextp = mynodes;
>> @@ -2078,6 +2078,8 @@ static void __init __unflatten_device_tree(const void *fdt,
>>
>>       /* Allocate memory for the expanded device tree */
>>       mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
>> +    if ( !mem )
>> +        return -ENOMEM;
>>
>>       ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
>>
>> @@ -2095,6 +2097,8 @@ static void __init __unflatten_device_tree(const void *fdt,
>>       *allnextp = NULL;
>>
>>       dt_dprintk(" <- unflatten_device_tree()\n");
>> +
>> +    return 0;
>>   }
>>
>>   static void dt_alias_add(struct dt_alias_prop *ap,
>> @@ -2179,7 +2183,10 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
>>
>>   void __init dt_unflatten_host_device_tree(void)
>>   {
>> -    __unflatten_device_tree(device_tree_flattened, &dt_host);
>> +    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
> NIT: there should be a blank line between definitions and rest of the code
>
>> +    if ( error )
>> +        panic("__unflatten_device_tree failed with error %d\n", error);
>> +
>>       dt_alias_scan();
>>   }
>>
>> --
>> 2.17.1
>>
>>
> FWICS, patches 2 and 4 are not strictly related to DTBO and are fixing issues
> and propagating errors which is always good. Therefore by moving them to the start
> of the series, they could be merged right away reducing the number of patches to review.
> At the moment, they can't be because patch 3 placed in-between is strictly related to the series.
>
> @julien?
>
> ~Michal
>


