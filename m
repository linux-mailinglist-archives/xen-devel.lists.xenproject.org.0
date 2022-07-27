Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B329581FF6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 08:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375896.608362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGaHS-00072K-2g; Wed, 27 Jul 2022 06:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375896.608362; Wed, 27 Jul 2022 06:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGaHR-0006zo-Vs; Wed, 27 Jul 2022 06:12:25 +0000
Received: by outflank-mailman (input) for mailman id 375896;
 Wed, 27 Jul 2022 06:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGaHQ-0006zi-LD
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 06:12:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60079.outbound.protection.outlook.com [40.107.6.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 144829b2-0d73-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 08:12:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB5900.eurprd04.prod.outlook.com (2603:10a6:10:a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 06:12:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 06:12:21 +0000
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
X-Inumbo-ID: 144829b2-0d73-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrRpy3ywqCs50QKsQNxvCMJXGZtukzMYokti/pcEjEX1F2usfXsgMXq+oFP3yffq6mTqQtPreew4mfowFaY7ZNdkOPu1RmtTM9ne2VifscTQCCg7gSPoUXakaxzzHxr6JHa16PAdouYY3JXPDHyHwcnmzoxUBeN1aooM/3X5S6gHE6wS4yBI7FWxC2Uk3VtMOKinaT4DTMUMJIzCLhk7F8qzuhgZ31QjyT1JNuDQJ4gUerrOeBU/boK3bO1zVkGckJCzQkDqL95BPoZGUu5YIfyWxkGY8oxO4kGi79QiJPFTm6oXNYw513bJAB1PgDccAZUi95MBwsM4UaUU6yfctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKlc9qlkG3eQVbleKvULKXHW1GLOYmflS/AAI9cST4I=;
 b=fb5Y1KHrsiI973RcUIVhJZJ7ZaWd4Y70RdkD+DVCSdrSpxWVJJjXNzg0x5pEevna982ig0tW2A7j/gO8OC3xYsyTpb6Ej75taQzW6pKRlddd7tJUALfIkKIL7R5MzI424/L6uyIbkZrl6kUUA5dIeEsXxoW1gO29rVZ4toMjTfC4eczqU5V1SQ72Xx7wZvO9mZ6slRolq67bsRjn+XRPmR5FDLoEzVHQlv2nqJC9rOLckVRKj5aKKm7zk/2QIO6RHXIUWt4TAmEzG4s9PfUGmXy05ONJR0Wdvy578MB1XvH3rMivoHKwWQT9qkHiLw0qGk6hbg9NHxrTHK8g3c90Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKlc9qlkG3eQVbleKvULKXHW1GLOYmflS/AAI9cST4I=;
 b=UUFi66FPSTwjbW2D2MP4nl+7ZJFu5wiSp729MqITYNbaOXTS0B0us7Joi0krJ1PAw/sh99dTXIY0qI918Puh7oPGnMj00CQ/2Zj9J3xaeAdCPZ9a+7r/dnYulgNETDOuiWiQHCcFNlg0lumuZT5ww3qQ3AaJoN5gVZMetD8KfAhz7Mdv2XTe034jMiGNs6Vg53+ZBDDN4KGZJObiJtCGaMikWEzXTqQHZpcMtF1a26JvPYCqM8o4FwItLO8VUKNHtSk0H4CmjeXZ94VE7Laj32hWKWGNZKJWRqa6xYLwW8ziLmhGNhzAFqwA2ZtDOnD82u4cZDYeU8JJguli01fFmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <247dffe6-17b6-570e-7848-65c1c92be41a@suse.com>
Date: Wed, 27 Jul 2022 08:12:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/18] kconfig: allow configuration of maximum modules
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-2-dpsmith@apertussolutions.com>
 <c4ca59d6-daed-25e9-86d8-019676744eb2@xen.org>
 <78c3f88a-4f36-087d-31b1-d02bfbc8df30@apertussolutions.com>
 <04c7adfd-e978-b911-fef9-f068ec624849@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <04c7adfd-e978-b911-fef9-f068ec624849@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b24a098-f540-4ac3-02fa-08da6f96f762
X-MS-TrafficTypeDiagnostic: DB8PR04MB5900:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oa3Kjp+KBZHkZQgZIjZHIfeklFcKKOIIRzKx8FTwDDrSsjvKT9sZe3C04FCB/7VQxw6wSCmBz0aunqVxl/zSqEd9ykaFj6Ol5vTS2f/ibVzsMF+Q2JmFu7vVnNeG6iOtNhS4KGmoIyQCIDINZ+BB9f0vLkYhIQjG8yRRDrTx0rWQDZkfVhsusjs4OtVOnGmJTwsUxONt5ljZXg3qXnx1mQAw+7Xx8L9kKI8Dc9ycKm/4dNM+YuJIBobqIkgmCCfAglTEXeW0AwPO2d8YZG1d8+VXYDnPK2tFVHJ8yPSksdWWmtjgvkb9yN6lmYd/88HJeaeYSd5A1gnQPzmNv9PhaXRI3/yuEz1fMkIODySYy8NBm+v3k1mtTBl75iOf1TNTf3Gpt4j6Uw2PAQF+CiLgC0axGdG38CBVYBwcl/uZmP+DoYokUscofkXb5mXfFZ8sy9ab2FrzrTRnykDMEhaapDUUCJXgqwkq35gBY2KicpW5hXhAVnvv7b5UXBtqvDrXPaa7Nc5fdCCe/5HF/6RIGskMxFvUSKin9FueoncKWw2f1Yrf9cbDqY19E9yl42zwP6BXXr5jD28u6qFrfJFw4OSy5xRIcC7o106nAk8ZnZbfmh0UCPWufmIuhHVqLe4ZsdPnGUkYXKFrN0+1YoNiWB4NX3dr0FUx2JziN6gCxmHDsVqMXNTN+CQlrgnVFS91hMwclvZbc5/IShO872hMQf+Yes7Z2gl3h4h/N4ynM38ttLbmaA0j3Pyb578GdnAQ4eCShEkLIDK2q8qSZg/yHCizTMuR39OxHa0hDFbMNR+nWbeC92+mus/zrp9eiNdA6gpUQVILf0TZo/U9AsTBnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(396003)(366004)(376002)(136003)(6486002)(66476007)(31686004)(316002)(36756003)(478600001)(7416002)(31696002)(83380400001)(4326008)(66556008)(110136005)(8936002)(5660300002)(8676002)(66946007)(86362001)(2616005)(54906003)(41300700001)(2906002)(38100700002)(53546011)(6506007)(6512007)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVdRZlJKZUhqZWxsRDJMazNlZFZyeWlpTHpkdUZEaWw1elkvRXZFYlJHQTl2?=
 =?utf-8?B?MXR5Q0N5MjlBamt3YmJoZWlnYjlvOFljQjVrY0VxblFYRVY5ZzNkbkVZZTgw?=
 =?utf-8?B?d011U25vOUdvQU1KL3BSeXd6ZmRTY3VBOFl1WkVaZmpkVkx0dmlnRFVPaWRa?=
 =?utf-8?B?Z0FyZW1zR1c3bDdZOGN4N3NaMkc4dUZ6cmVZN2l3T1VjR0pjUkd0U2hJanBO?=
 =?utf-8?B?eE1oVWllSHBjWTJDTWJaR2JidHF3bWI0QUlacTBSdHp6Zms5TkNrQkY1NlFZ?=
 =?utf-8?B?UmxxcjdRVlBkMTNPdWlJSW5zMlRNMHR1YVR3RkNOOXM0cFllMkQ2UXhQYklI?=
 =?utf-8?B?WXlCTG43UDBDR0tpN3ZETGtodG4yOGJpS2JhRDlyQVAxZDBTZGJUeEdtWjJ0?=
 =?utf-8?B?b2dMYTJCcW8vaVNWME9Vc0REcEpCaTRFZDkwKzhTdUZWUS9CaG9yb3pPTDR1?=
 =?utf-8?B?U3NmSUs1YXp2T2hzS3VtbnFsby85ZGJRNy9XWlRVdzBhV1dMY3Jack1aQkRv?=
 =?utf-8?B?N3ZNaWREWFRuOC9sTElIbWJkTmd2VTVMTW5EODgzTjVneGFLM05VblhUMVZZ?=
 =?utf-8?B?S2VOVmdNWEtCUUpPUnNQancvaUpDNWlpQ0h4Z09uUUYzSkFrV3hXUWoxbXpP?=
 =?utf-8?B?K0UzNitUdXlWcjFObHZKZGVYMWwvTUt4cW8zTGZnNWxOWXNwQ3UrdWFQV29P?=
 =?utf-8?B?T1ZlZDhZbC8yRkJpM2NaN2tRRTVuOUdiek1PNXlyTHJwbTdPUENweVJUUFVH?=
 =?utf-8?B?eFZ2b3QwWUVjUUZVcXJ0TnJGNEZyOERxeEZBT1htWm5oY1pWU0l2WXNMVjB4?=
 =?utf-8?B?Q1F1QTE2d0JiZlZ5eVhZMWwzVWQ0NXl4Qk40U01rTFV4K1NySHIvbHdjOVNa?=
 =?utf-8?B?dTFyVGEvV2ZVZGg0WjF2ZkgweExVZkQ3ZTFzekR4YkpsOUNzS2dCTk9NU2R6?=
 =?utf-8?B?UkpWY1dwbUlsNkZ4ZDVpZEl3MTNEbWdEUXpLK28yK0VOZ2VXUU5ZUFNrL0Er?=
 =?utf-8?B?Zk5qT1d4RzVrT2pLUHJlSXcxYUdFbGtNTGttN0xLd0YzNU1oNjc0QTFIMndM?=
 =?utf-8?B?ZDdkdzNqd3JYZVArVHFOTWtiVERKQ1hRaVQwN1cxUjdkaytDSjJMTm5ITDgy?=
 =?utf-8?B?R0R2TnZIZ25va1dEVVlWWnA3enNJUksvS01PODVFNlMyVnh4MFVhQ0h2RzNR?=
 =?utf-8?B?NmY0b0M4aHoySkpzcElZelV5UTJoM3dZSFQwbEhtOG80L3Z3WlNsM2dITUxx?=
 =?utf-8?B?ZVlOUFFNdHkxU3FDcmNJYmduQlpoWDV0MHBzWTVETTJ6VFpzU09XR1d0Y0xJ?=
 =?utf-8?B?UXZBdFFEV0NWTWthM2hNcUdRcm1DNmtEM3ZpZE9qVmZaOEh1aGFBSWUzbFUw?=
 =?utf-8?B?c01DOG1tblRGVjBnRzd3QUM5bXErdXFiMlZlTTFhWDZrbmpJOWRtd1VndWRJ?=
 =?utf-8?B?NTJxUklkQzVvclZxdGprb1Q4K0hYeTVOWGF3L3preCtOcWJSaDQ5M2wyRFla?=
 =?utf-8?B?QWdZczlDZkJqSnBMQVZYb0g2TmZsYjV0MUVHZk9ZaEQxbjY3UWhBRjExVmwr?=
 =?utf-8?B?YXNITGhUQ25ZbHV0OHBXcWVFYnRJK2h1a2xsU09uR0VVSXlrYTBBZ1dwRmpw?=
 =?utf-8?B?RWxIRGtNNWZnMHBXYjlWMEF2MzZ0SGdHZldEaTdjdzRKM1FJNEdkY3JzakhR?=
 =?utf-8?B?US9KZHd2TVpZcTF3alZaMXR6L3ljSDNaV09SaVJZaDRrTnAyNkE4UEpqOUZT?=
 =?utf-8?B?S3lxV3ZZclNpbjRCcitOVTFaNkEwdk1EbldUeS9qcTBKMjQycEx0Z0dDdHQ2?=
 =?utf-8?B?b3AyY1NvZ2FWSkZZQ2pMd0RwM3F4bUUxQjJMODYyamhlQldaaXA3emtERUpu?=
 =?utf-8?B?NGJLSStoSEx3Zm4yWnBqR29YcnRRSEsrTHBwWFdCVE91a0FRNzRoQjBaR1FJ?=
 =?utf-8?B?OG5Qb2J2SjJ4QndUK2YzY2k3d1pKTG03R0JLc1liVVZEQW1HTm9teW5TZFZs?=
 =?utf-8?B?MDZpM3h5RzdEQ0VndnhpZUpwR3B2NUFEUzJJUWZkT0JJL2Y3TXBXNlhhVFRq?=
 =?utf-8?B?dGVzc1pMRHF0U3N1cWdGelpacE1kemtpaGprdmZjak9ITTYzb3pwaXdra0Jt?=
 =?utf-8?Q?Xe68DP+hs6BURaQOCcGgiBCz7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b24a098-f540-4ac3-02fa-08da6f96f762
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 06:12:21.3925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0V0M18qCwWCugb+YwiiF4UI+TSn5YIe7L7gufF/UaXX2r/A3rAEh7rgdbMzRaO7+WQgBUwG9eZ3nUJD5ww5e0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5900

On 26.07.2022 20:07, Julien Grall wrote:
> On 19/07/2022 17:36, Daniel P. Smith wrote:
>> On 7/15/22 15:16, Julien Grall wrote:
>>> On 06/07/2022 22:04, Daniel P. Smith wrote:
>>>> index 498625eae0..834b1ad16b 100644
>>>> --- a/xen/arch/x86/guest/xen/pvh-boot.c
>>>> +++ b/xen/arch/x86/guest/xen/pvh-boot.c
>>>> @@ -32,7 +32,7 @@ bool __initdata pvh_boot;
>>>>    uint32_t __initdata pvh_start_info_pa;
>>>>      static multiboot_info_t __initdata pvh_mbi;
>>>> -static module_t __initdata pvh_mbi_mods[8];
>>>> +static module_t __initdata pvh_mbi_mods[CONFIG_NR_BOOTMOD + 1];
>>>
>>> What's the +1 for?
>>
>> I should clarify in the commit message, but the value set in
>> CONFIG_NR_BOOTMOD is the max modules that Xen would accept from a
>> bootloader. Xen startup code expects to be able to append Xen itself as
>> the array. The +1 allocates an additional entry to store Xen in the
>> array should a bootloader actually pass CONFIG_NR_BOOTMOD modules to
>> Xen. There is an existing comment floating in one of these locations
>> that explained it.
> 
> This makes sense. So every use of CONFIG_NR_BOOTMOD would end up to 
> require +1. Is that correct?
> 
> If yes, then I think it would be better to require CONFIG_NR_BOOTMOD to 
> be at minimum 1. This would reduce the risk to have different array size 
> again. That said, this is x86 code, so the call is for the x86 maintainers.

I think the Kconfig setting should stand for "true" modules. Anywhere that
x86 code internally uses one extra slot this should be expressed by an
explicit "+ 1" imo.

>>>>    static const char *__initdata pvh_loader = "PVH Directboot";
>>>>      static void __init convert_pvh_info(multiboot_info_t **mbi,
>>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>>> index f08b07b8de..2aa1e28c8f 100644
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -1020,9 +1020,9 @@ void __init noreturn __start_xen(unsigned long
>>>> mbi_p)
>>>>            panic("dom0 kernel not specified. Check bootloader
>>>> configuration\n");
>>>>          /* Check that we don't have a silly number of modules. */
>>>> -    if ( mbi->mods_count > sizeof(module_map) * 8 )
>>>> +    if ( mbi->mods_count > CONFIG_NR_BOOTMODS )
>>>>        {
>>>> -        mbi->mods_count = sizeof(module_map) * 8;
>>>> +        mbi->mods_count = CONFIG_NR_BOOTMODS;
>>>>            printk("Excessive multiboot modules - using the first %u
>>>> only\n",
>>>>                   mbi->mods_count);
>>>>        }
>>>
>>> AFAIU, this check is to make sure that we will not overrun module_map in
>>> the next line:
>>>
>>> bitmap_fill(module_map, mbi->mods_count);
>>>
>>> The current definition of module_map will allow 64 modules. But you are
>>> allowing 32768. So I think you either want to keep the check or define
>>> module_map as:
>>>
>>> DECLARE_BITMAP(module_map, CONFIG_NR_BOOTMODS);
>>
>> Yes, in the RFC I had it capped to 64 and lost track of this related
>> changed when it was bumped to 32768 per the review discussion. Later in
>> the series, module_map goes away. To ensure stability at this point I
>> would be inclined to restore the 64 module clamp down check. Thoughts?
> 
> I don't know what would a sensible value for x86. I will leave this 
> question to the x86 maintainers.

I guess I'd be fine either way, as long as the code is correct.

Jan

