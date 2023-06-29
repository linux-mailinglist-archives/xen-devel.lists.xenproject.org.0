Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A207428D5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 16:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556885.869734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsyQ-0003AQ-8b; Thu, 29 Jun 2023 14:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556885.869734; Thu, 29 Jun 2023 14:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsyQ-00037J-4w; Thu, 29 Jun 2023 14:50:18 +0000
Received: by outflank-mailman (input) for mailman id 556885;
 Thu, 29 Jun 2023 14:50:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1sCV=CR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qEsyO-0001nU-TW
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 14:50:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e89::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 418f6a98-168c-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 16:50:16 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 14:50:10 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 14:50:10 +0000
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
X-Inumbo-ID: 418f6a98-168c-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxtD9twjzSBPEocj4WSdYesoXNYvZaV4d/ElLhDL6txQ6NeOn5nFPRTRWnd3JYcDks6YLYejOvy4E4bc1zIqPfpg45Yt61ORTqmYA00uZB+gMerNfzIK7m2gP4xZhgvwJOLYmua+CL9OGILazCng2t5J/ldMlMy8OzwNFWHu/CkKg9prfb/sicwk904WbfuO8oKAO7P+IjM4gkEsiIAYLgYPjb3VCzYwZ3j69F8TM5MZ8sSRNZQOR7YaE7zMMlRBQxhKs0v4YNv6EW9b8VffwJAiAgDA0snfjZGIQmL+ph7j7Yx4i0pAiHy2WDXIuG6fXAJiayQsqKkG8KUParRYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Loo+qs6XJRmOHCZbPNunV+AJLrO6xIy3XitFqvjL3fQ=;
 b=AfkvocdyXT2A5rcMCBn2j5QVwp+3Q6+jB8RinhJFzpreOGdqxsdgrj1qfA091aKpcUQVgwVeb8dQ0GZt2S4MLYoBjzVY2ERHd3QYyUJkJwCf5qXqWmfSH9JEKh41mabp9w49aaznNQnWdN3s3j2kNJQrR8wmVV3IBcyD2XxBD+DCbugOJ7JSEhvYnEc3fSAjpEeL6ZQZtE4ZM9itdLa0DcxvRMA0fuDXRMPcMSCxCMRBNidztLRUYhCWt0Au+NhEOXQqoqfgy7bvbIiJDZpNx1zG3WJx/6ApuyLN6Nr5CuONSfwGdA2OSp+6tJYS/WlouESTvJoTF6Pwxfn3esTRhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Loo+qs6XJRmOHCZbPNunV+AJLrO6xIy3XitFqvjL3fQ=;
 b=rI4cbBK19sl/zOAKLFT0x3n+nTYM/z/uS53laMOQgB81+Ydgx0BXNFJCcdot+0R86/FrpmcrkUAerBlC+fScQR2U7yWGhlctxOxGzXDR5TgUdGiVeA3hrHD51SLULxOlWpnOaBFKkplhVlw6qx+8k0ACwb27qplCNdWT6/sm6vY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6ec57ca4-be55-598d-ce30-a2f86150dfea@amd.com>
Date: Thu, 29 Jun 2023 15:50:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 27/52] xen/mpu: introduce setup_mm_mappings
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-28-Penny.Zheng@arm.com>
 <ba80b734-fb18-49ee-a5b6-1c69ae5a811b@amd.com>
 <3e77ef15-4a34-8246-bf48-d87557690b48@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <3e77ef15-4a34-8246-bf48-d87557690b48@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH7PR12MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a8dad4-cdb2-43aa-f956-08db78b02351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O0extngMnFEZvQ3LuIMbjkPe7YNuJMqLubinBXmG2eIUaGf1WvfNKp7rBZStp5q+k7tg7jOpRDcocW+XHazp5GAMICW4FwZyteE5GerLBtH9WYC0J49vVJJ8YBHytYHl2o4/dfQ4qz0091upSzDwHL0YNHyRRX780IMrclw7z2SPO5TNEA66LCgCFNWT0pKQaTMv8q9sljNS2bk+guGxjPkpVEnTLhzeRvI8JKd7Sd+EoF1aZ8XIsD+iLZbj4tg7TNkiTANFbjvF3MwXhRJ9XUI4QVlYIjnpndvuTBO6FuG34nS5fUKqXugvmeq5VOY1kpmzx+OExZ1ATAoUJmHPUv0iEowvUthf57jz/m+NLQXSUdIvpLDSUZeovD6whnLoTRZ8zsxD+xHOGUwUHGYiIFV1osETlCGA7lkDkP6PzSgSEJBuenrODTlidtxD2Va7WXLjDBxIvF4L9NvCtBfFkoiH6OsBZLP25Mq5Joye1gKx8ffMDWydYR7UBQGv38OY2NdOwHQQW3EcWD3E+NjOr+czeMRHwdo9en1SGc20wKhiC69lAUzFOVGlwpfKaMvMWfuErT+6YGR+2q6Jbh15YgQNWhUgN72l8eosF20tEz7M0VViALRUsznEGobNNdmH5CNgxFj00K8hLq+VQGBLrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199021)(26005)(4326008)(66476007)(66556008)(8936002)(6506007)(110136005)(2616005)(478600001)(54906003)(186003)(2906002)(6666004)(53546011)(6486002)(83380400001)(36756003)(66946007)(5660300002)(38100700002)(31696002)(8676002)(316002)(41300700001)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q09xUHlPNXVORS9IUllOTXFwTUROeXJLUGxLRTNqVlBwSTRDODdBbk9naTYv?=
 =?utf-8?B?MUdrcWp5RnpzZ0VVWmpiYzJsYzg4cVg1TFhmZzBjWHJDRVd3R0tGTTdmZVE3?=
 =?utf-8?B?cGliT01xUTU1UzA0YUtqdXV2UXEra3dSZUR4YjhuZGVjMFpTT1h2MjVuMXR3?=
 =?utf-8?B?QXZlbTZPUVR0dmNPQlVPcGhyd1Bwb3BjYWVYaUhFQVFJNkdTNXVUbGp0anRS?=
 =?utf-8?B?TkUwbmJWbU5rV3BTVlJkdTI4WlNoUG5qTzZPLytRcE1PQmRhOU11YWhmQ3dH?=
 =?utf-8?B?ZDNFaWpCaUM3a1dlSTRKY2JuMGliRXFCRkNUNU5PdlR5WVRQUDI2MUNwMmVP?=
 =?utf-8?B?OS82ay9ad0tqZnRKQ2hINGRsN2x3OFcyMmZpR3ZlUFl4blo3RnVKR3doajJk?=
 =?utf-8?B?ZExCNkZqcjUxY3lCdEdWQVpNNWhEaGVGSldvWDlsOHRKRlZ4OEI5NHVwTVlC?=
 =?utf-8?B?a241VkVSYmVzUnpRRHV3elpXUWcrSGxlYlZaa0JhTHliTFBXN2orMnpITCtT?=
 =?utf-8?B?dlhUZStzRXdkdlBvd2hSOVhWbkdvK3BzdGNBb3ErSi81U3VQYU14Nk90YnZV?=
 =?utf-8?B?UzdRTFMwdHBBZGxmL2JJSmVwMTFwVjh2YVhIOVpHeU9JWlNidTM0dVBmOXRy?=
 =?utf-8?B?TWQxRlpWSHhsMHBWWFh3R1RMZlQzL0x0ejV2RkIxVytJL1RxSTNTajBIMWVW?=
 =?utf-8?B?cy9XR2hrSmhsU0cwYzNRcGdCaDIxVEpRWUdxYllmczJlWDhUK1JxdUR2aEdm?=
 =?utf-8?B?SE9BUlZjdFFDK1ZPTHN4UGZxc1FJVHVaVXhPQmkwT0puK1Z5VmJRaE15TWFK?=
 =?utf-8?B?K1IzWUQ4ekZjT1MrL0lrcVIyK1IvQkVHczVnRG1ybjVybTVXR1Y4aFIvWnVj?=
 =?utf-8?B?Y1NEY0JEU1krL1F0L1h6YVpTam5XLzV6WmRpWEQvNEtCZUR4d3ZUeEYyQk5y?=
 =?utf-8?B?R2RxUVlXeGF1RmhlZzBGSkFBMHZNSU9scG81cFB1YXR0bjdMeGwvTXFTWHpV?=
 =?utf-8?B?aWVYMkRabVBwaUNrQkR3SU1RVWZ3eW5JSGZXTTR6L0l4OHp1L1dkWEFCZkNM?=
 =?utf-8?B?Z0xBY3NwR0paWjZvSmFZTm43c1Rya0t4QnQxUnVTRFVzNlVwTGh1UkRLbWRK?=
 =?utf-8?B?Zm9aSHgxeFJpMFlsUVFuT2hTd3JFeDhXL3lYK1VpTFhuUmIwdmJ3bjBYR0F3?=
 =?utf-8?B?WG9Ebmxua296dVZiNlhlWTREN0xGaGNVbzRqZ0t0UHhPWnNsQkVGRjVZNDk2?=
 =?utf-8?B?elJhSU8yYVFScVBzeGs0UWdzQkhQQVVpUFh2RUw2TEtpMSt0bXR5V1k2NWNu?=
 =?utf-8?B?MEFMMEtmOTFxaWVMbjFTakxIRmlTT3BKL1JpTjliZXpCb3E1TWFvbkF0aVB2?=
 =?utf-8?B?Wm1LbEwvcDMvblRBK0FEMC9IUWVKVTBhTEpLWlpobUpIdlhyR2prdUZOdEFM?=
 =?utf-8?B?WjdlSHJEMmVBL3EvdXZVNDJlSEN0dDhFOWpEM2luOWY2VEFZNk1kTHdTUVUw?=
 =?utf-8?B?RTV1MlUzK3dzR1Vxcmk0d1VUTnIwZ3BsSWVzUFRIZHhzcWlUWndxLzMyZkQ2?=
 =?utf-8?B?QXJrZUMrTTljbTJ2UDR5Rk1GMWthcnVZZllKcFhtaFdkZktDZmo0bEpFdWwv?=
 =?utf-8?B?c3NXa0ZBV0w5eklYckRhc0UyYzU0ZzRWUVRjazJ2T0l3Y0xEb3k5ZmxtQ0ZH?=
 =?utf-8?B?anhoL21LL2FoSUZSUDNKUkVxVjdZb0Q4MWluT05NV1IydDBsdy9NK1RycDAx?=
 =?utf-8?B?aUJPVXZ1L1pLVlJoU0FQak1LamFTdk5CKzhGaE1yQUxGdzZrWStDNU82cXVr?=
 =?utf-8?B?eW9rc3pEdDBIbzJmZ2hSeHNnZTNSQ3FkUDNTbkxtQ3RWLzl0bGlFS05jYTFp?=
 =?utf-8?B?ektqQVRpa3c1VVIrUDRkTnN1SUlBTzRpdmlWWlIvTlNCWk9Cc2t2Vjh3QmxI?=
 =?utf-8?B?NnI0c2dlRy94VjVkVDNFcktQYU1DWDVkS0pUT3R6RVhLejYxbk82NkhUZEpx?=
 =?utf-8?B?UDU0cFUyNmVrWlBuYjhhZFphZDQxeUZScmZTVHhlcjV6NmQxdUtocGV0Y2l3?=
 =?utf-8?B?VzVpZ05hdmJnQzFhOVMrNVRpRTNRL1pVSy9uclc1bjNwS291Zm11Sk5GdVZC?=
 =?utf-8?Q?AleGxgped9rAWASmrcU+NGOim?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a8dad4-cdb2-43aa-f956-08db78b02351
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:50:10.7173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vauymD/VNpx39VTCwiLXXugwmYWZF94TrZSvqKlEKNBWE1dw/A5TgCG5MMdb8AyC5VQjOxtYrmnLEU9wBB8KeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6418


On 29/06/2023 15:29, Julien Grall wrote:
> Hi,
>
> On 29/06/2023 15:05, Ayan Kumar Halder wrote:
>> On 26/06/2023 04:34, Penny Zheng wrote:
>>> CAUTION: This message has originated from an External Source. Please 
>>> use proper judgment and caution when opening attachments, clicking 
>>> links, or responding to this email.
>>>
>>>
>>> Function setup_pagetables is responsible for boot-time pagetable setup
>>> in MMU system at C world.
>>> In MPU system, as we have already built up start-of-day Xen MPU memory
>>> region mapping in assembly boot-time, here we only need to do a few
>>> memory management data initializtion, including reading the number of
>>> maximum MPU regions supported by the EL2 MPU, and setting the according
>>> bitfield for regions enabled in assembly boot-time, in bitmap 
>>> xen_mpumap_mask.
>>> This bitmap xen_mpumap_mask is responsible for recording the usage 
>>> of EL2 MPU
>>> memory regions.
>>>
>>> In order to keep only one codeflow in arm/setup.c, setup_mm_mappings
>>> , with a more generic name, is introduced to replace setup_pagetables.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>> v3:
>>> - introduce bitmap xen_mpumap_mask for dynamic allocation on MPU 
>>> regions
>>> ---
>>>   xen/arch/arm/include/asm/arm64/mpu.h     |  1 +
>>>   xen/arch/arm/include/asm/arm64/sysregs.h |  3 +++
>>>   xen/arch/arm/include/asm/mm.h            |  4 ++--
>>>   xen/arch/arm/mmu/mm.c                    |  7 +++++-
>>>   xen/arch/arm/mpu/mm.c                    | 30 
>>> ++++++++++++++++++++++++
>>>   xen/arch/arm/setup.c                     |  2 +-
>>>   6 files changed, 43 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>>> b/xen/arch/arm/include/asm/arm64/mpu.h
>>> index 6ec2c10b14..407fec66c9 100644
>>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>>> @@ -19,6 +19,7 @@
>>>    * or it needs adjustment.
>>>    */
>>>   #define REGION_UART_SEL            0x07
>>> +#define MPUIR_REGION_MASK          ((_AC(1, UL) << 8) - 1)
>>
>> May be this is simpler to read
>>
>> #define MPUIR_REGION_MASK _AC(0xFF, UL)
>>
>> Also, you can move it to xen/arch/arm/include/asm/mpu.h as it is 
>> common between R52 and R82.
>
> I would actually prefer if we use GENMASK(...).
>
> [...]
>
>>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>>> index fb6bb721b1..e06a6e5810 100644
>>> --- a/xen/arch/arm/mpu/mm.c
>>> +++ b/xen/arch/arm/mpu/mm.c
>>> @@ -20,6 +20,7 @@
>>>    */
>>>
>>>   #include <xen/init.h>
>>> +#include <xen/mm.h>
>>>   #include <xen/page-size.h>
>>>   #include <asm/arm64/mpu.h>
>>>
>>> @@ -27,6 +28,35 @@
>>>   pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
>>>        xen_mpumap[ARM_MAX_MPU_MEMORY_REGIONS];
>>>
>>> +/* Maximum number of supported MPU memory regions by the EL2 MPU. */
>>> +uint8_t __ro_after_init max_xen_mpumap;
>>> +
>>> +/*
>>> + * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory 
>>> regions.
>>> + * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
>>> + * region 1, ..., and so on.
>>> + * If a MPU memory region gets enabled, set the according bit to 1.
>>> + */
>>> +static DECLARE_BITMAP(xen_mpumap_mask, ARM_MAX_MPU_MEMORY_REGIONS);
>>> +
>>> +void __init setup_mm_mappings(unsigned long boot_phys_offset)
>>> +{
>>> +    unsigned int nr_regions = REGION_UART_SEL, i = 0;
>>> +
>>> +    /*
>>> +     * MPUIR_EL2.Region[0:7] identifies the number of regions 
>>> supported by
>>> +     * the EL2 MPU.
>>> +     */
>>> +    max_xen_mpumap = (uint8_t)(READ_SYSREG(MPUIR_EL2) & 
>>> MPUIR_REGION_MASK);
>>
>> NIT:- You may dop "& MPUIR_REGION_MASK " as the other bits are RES0
>
> From the Arm Arm (look for the definition of RES0 in the glossary):
>
> "
> To preserve forward compatibility, software:
> • Must not rely on the bit reading as 0.
> • Must use an SBZP policy to write to the bit.
> "
>
> So we should not drop "& MPUIR_REGION_MASK".

Yes, you are correct.

Penny, please disregard my NIT.

- Ayan

>
> Cheers,
>

