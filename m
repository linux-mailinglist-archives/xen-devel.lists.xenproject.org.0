Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65560692276
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 16:41:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493446.763369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQVVZ-0001Zr-Co; Fri, 10 Feb 2023 15:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493446.763369; Fri, 10 Feb 2023 15:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQVVZ-0001XJ-9r; Fri, 10 Feb 2023 15:40:17 +0000
Received: by outflank-mailman (input) for mailman id 493446;
 Fri, 10 Feb 2023 15:40:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WxDD=6G=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pQVVY-0001X9-4S
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 15:40:16 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 346f5cbf-a959-11ed-933c-83870f6b2ba8;
 Fri, 10 Feb 2023 16:40:13 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW6PR12MB7085.namprd12.prod.outlook.com (2603:10b6:303:238::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 15:40:07 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 15:40:06 +0000
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
X-Inumbo-ID: 346f5cbf-a959-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZohWWnnXwrxto3WWnm0VQhGtPHVBG+yMlHtX+fLbBIjZX0jq8/Q2nlQ4NWjSt7J3ejtPeuQilNGRAKqTSY33lPz3JEYU2K3HkFljgoq5hSDNdmwtQHxrhIpgsISSxk0vak3He1RqCMUXsnw1D9Hx5y1CWd1w/qOr+sq4xOlhahHgId5Kq1WIvvdBXRkUrFp/XkWQ54RVeoq8Jd+wrIsa+7jaFZ3LdeT0ZorYRLKeOZihVNMZlgYXGqZoeXCPfIS50aBSUkqPb1lH/t2YH5r1XmgvDeeXwAu2ngJeTI6ppAqQE0XHls3dyZ7kaB1PknSQpUk5PZUqjXzGk9kfy0Ckug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXC1ckvMjQ/POezF4mf58NIim0l8n17FtbycQXtWOFE=;
 b=EUUd4JVWEWrdb8lA1+b2IJqm/BgQC06xKNxfyA2jtG0TT2jTOIsrKZtDMFQjye/58RvhPiKD4Tm6tjI3BYc1PIqqrTlOdTlL5BQSxgaLPgv1bQLA+KBUgmrd3XCnSAdMfjfnOiJOL5QZ/bBOHB/ho44PM+Zw2lqtIz/9+GpF8eJgKlkdikth2z9TJbrrOV0zjllWm+TqGAgQ2NYBS5En435ypjC7kEEUeLb8UK4Z4CwRgag67liwpNwfNbSwgIKzU2mgqVpeGiH/RWizn3m74jFrz9r6VBCsK/iV5KmnmlvWiB05uQH/Mg5OwP4sc8XA3oQkASVpg6jgpnFw2LagmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXC1ckvMjQ/POezF4mf58NIim0l8n17FtbycQXtWOFE=;
 b=WxSYLWm/vXrvBxQlehkkXzfndVGOAT0ZI2OxRNc1KWare66e85lYrfcnzrSqA3oBSeYZZLWmLQSJmDlIZZMyvI60OMG9fUSz58SFAZ0yW7kgPfaKbkkeQ4Q5hsY/4/kbMV8WhsEtFlLTZHn1+GyQ4RCY9Y4W+RVGaLncQu/Cb8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <1e5d905c-0511-ed80-c899-e679d955775d@amd.com>
Date: Fri, 10 Feb 2023 15:39:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 11/11] xen/arm: p2m: Enable support for 32bit IPA
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-12-ayan.kumar.halder@amd.com>
 <ae501ac3-af2d-c4cb-3ea9-04dd946cdc51@xen.org>
 <eb4d4da7-0251-6efc-1311-6b236fdca6c4@amd.com>
 <3655dce9-f795-3d37-3236-d95d74c865ff@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <3655dce9-f795-3d37-3236-d95d74c865ff@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0267.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::7) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW6PR12MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 06675983-a5bb-465a-1ef1-08db0b7d15af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uXN4XT1TH49dHM8d5CNMRlT9ttTPei281ZIf+0EYFpWe8H28iayIfHGk2/wUvhdIEMlbf5a+VaHLIiGu0/6ROQzz9kA0QCloday5RzOugPPaBObm5x1q+K2/8PXvZ+D1ZBFSQCzzSnYlYIy8MOdrZeDTD9zqbLeVVOK5hoR4oZGt1JjT7ExAaNsr0o2x5KDmgx4VQqTE9IguKkLlGMACnt0mTPmka2ksxpZBjc74mZpNSWXQvaYaAZ3Ovx7zMcfz1/WtIQtCywbJqGe3qijauY0C93nM1nRsWtjk5Vc5+fTDKwyltOwksXpYhMCkex20KYb7CmNiyJ6y1EGDUUjec72EB2kGx8Q7FWy+C98E6ds8TdN4+iB3e09JGziz/MtV6wFsKlQm1JPQkEDt7Oaj4TH+5f1XT4JcNKGJnRtpbLmUWTKZzmZc7xH8Pl8WIjjHT1oEXPn5QLXUFl1cmUf3V6LC1UqgMW3BIPlhsmMg/od9bzx5iYkz+q6ICAen27Uwa1shz3xURNYGIg0kETZ6z6PWSdomOeHy4KtpMum4lqovMVBWO+MelBhZCDn5Abt9MA2Ss1ndX+tbk/OwvSh1ZcIGuzWqb0W5EwjEqBbJbhYzvz4eQWxSxKmEvAYdrz03zGIs+kA3m/TaNYHpdtBAL62ffWsfwvGkHuXu6e4J5vPSpJhUdFJhNwgh2Il9QuqjZ1yC4MCJDsycyBBCYLmlIhD9gmwu2JktmGTjH+wZVVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199018)(6666004)(41300700001)(6506007)(8676002)(4326008)(66556008)(66946007)(66476007)(83380400001)(31696002)(38100700002)(36756003)(2616005)(53546011)(5660300002)(8936002)(26005)(186003)(6486002)(478600001)(110136005)(316002)(6512007)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjFBbmJMeFBlZllxejdTRWMwTmNtUVJhWnRyemgzVTk4dEdpdDh4b3dkUlVZ?=
 =?utf-8?B?NG1uVWdMcmNxUmZzRUlYeTBnUkJoYzVqeVNwR1BlTjZsRUF1c2VqSXhKZW5i?=
 =?utf-8?B?TFNYS1FqSFoyZzdDVzhFR1poaWNtUmdtcTFqRlg3dEVVWS94ZSs4d2dESDZO?=
 =?utf-8?B?RHBqNmdld2JSck90dXNqN29LR0tJd2UvdTVNTWVkNFpCT082ZFVhTjNMdmdo?=
 =?utf-8?B?Nis5NDI0eDNsOGtIc3AzNmdBVkQwelRRcklpbDJMK0I4WWRzRTB6UXlOTG0v?=
 =?utf-8?B?K01ZcTNUcWxDc2lTZmVBc1VHc3JjZzRmanUzcHlTZzYrTjBTcGY3OFFKNmJX?=
 =?utf-8?B?djcyeVM4bTIzNGtpS3FhVCt3cG1JeGpubTRZaFlLMzBEeW5zNXZ6NE5KYkxz?=
 =?utf-8?B?ZFB0TWt5WnRlMmlTVE5Gc1dPWHRRMW1JTDZqNzYxN3lEQlA2SXdPTE1jZFBC?=
 =?utf-8?B?cTZBWmlRNzRXU01ldjdBMUF6UHhXNlJSSzJuSlBvSFdQNzRMbXY3aU4vcFBB?=
 =?utf-8?B?R0pRbTU5ZjZPcDVJYVV6TnRrNTdPREQ2aENTUWdRWDhvUUdlTHZ0dWl2aUFC?=
 =?utf-8?B?RDJkZCtRTnM0MlZWVmhHdnQwa1BFZGova2duWVBHaEY0YjFNTEYxV2lIdWpZ?=
 =?utf-8?B?UVBEb0V3cjVaSTBaeTBmcCtnV01rNENJRnIyVEJkYTBReDdxWEpXU040QVZy?=
 =?utf-8?B?QUdPUWNTcGIwY3VRYUxrcW13TUJOcFBZSXBtN2FveFhKWW9DZWFOUXptOXdE?=
 =?utf-8?B?YWIwMkhZcGhsYmkwU0h6Uzc4VXRML3JadkNvY0ljd3BvZ3JNVXhJTkN0RGl5?=
 =?utf-8?B?dnJPNUtBTW9rdHBNRDlKMStscFdMSWo3dGRxR1NKT3o5c0g0UkNwajQ1Q1ll?=
 =?utf-8?B?RXN4Mm1MT3ZxQU84akZoUlBkRmhuWUp1ZS9mejJabzlWQXVUdHBoSFByRWlZ?=
 =?utf-8?B?OXBsODZqYURMVEhFVW1wRXJ1cXdYUitMaGo0bEk0SGpKSE1YYWg5Q1NuWVFa?=
 =?utf-8?B?TzMwRjRENWh0RFh1djhZL2dMTkZKekxmZ3FWcGo4RjlUa2RaVHJpTmxDUmov?=
 =?utf-8?B?N3ljWU9kOU1hcjRPNGZzZ3hWOGl4dDRia2lZL3l1NVljRWJkRDNWWFpkVkJY?=
 =?utf-8?B?eDJNUEE5dW0vVnE1Yzl1RlZ3R2ZXWVQwVEdUekZMZk9zVGFMMG5vSkJGSzJM?=
 =?utf-8?B?aE5UQ1QrWjBUTzM2V3c1cmdrL1NLTjM2cHc3bnBiZzBLTGcxNjhETndqT1NN?=
 =?utf-8?B?M1FXOU5jTWNlV1g5M3QxdVF1UTR3OEVyNjQzV0F5TzhZTllQMnRtQzgvYWtD?=
 =?utf-8?B?bUgyb1lEdGt2ejhNTTJ6WTZ4UTNVK055QjB5MnovWS8xSnF1L01mYTFzdC9n?=
 =?utf-8?B?d2laVzkvRVlaVHlUYXVWTFlwSTdjaVk3M2ZNSURXTk13NjdTb1kycmxSYXJR?=
 =?utf-8?B?RnVPRU9uaFlMWHIwSFNKRkpQYUI5ZHZOSDVzK1d6NkRRSGwvdjZ4bjdRRHRq?=
 =?utf-8?B?U0EyYUt4b1g5cVRCVzJFT3dyWU1jdnpsY3RLZFNIWU8wZkxxb1VaenlSOXBF?=
 =?utf-8?B?WWtzd0h1eXRhcVFDM0RyMTVaQzc5ZnZJb0FFdzhJWVR3azRXMEgzSFZ2M0Rw?=
 =?utf-8?B?eHYzdCtwMHdaQUJjOEh5WDVOV29ySHRXZWorWE1rMzIrMFVoRGFNcmJ1Rm5N?=
 =?utf-8?B?RFI0YzdnWDZDUEdZaGh1UG9KRkhqR1l1MUs2QWlwZVhzOFE2dHIxY3diaHl1?=
 =?utf-8?B?TU5GSncyeWtKOTdMdFpZUkZSVW9wMlFmc2E5ZXpxZGJhdy9NejRNNHNtZXR5?=
 =?utf-8?B?dS81UHFWNUR4SmhpNG5CVG04UmpZRWpSSUs4UlI4ZGd6VWRucDk2MHBFM3Fp?=
 =?utf-8?B?UE5tUVJpQUNjMjRIR1l5UGJtT3FRamVWa0p0ZytNVTZ2TlB1d0JOOExZL2JD?=
 =?utf-8?B?ZHVTMk1CS1RlS1hUbGplQzRqMVNsTS9QNTR3Z2lPZXlGR0U4Y0M4aEZEWERq?=
 =?utf-8?B?b0Q4bGR3YStOYjcvc3N4WUtqakx5SEJRSmZKRnZTM2ZzamI2Zkx4K2RzSnVV?=
 =?utf-8?B?eHU2MTN0S2hWNk10UXVXVUh3bU5CckhiZnZVUkpyckRuMVVacWMxSHNwcVNZ?=
 =?utf-8?Q?EE7oQNjubRGAtNd+3+6IPIn/n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06675983-a5bb-465a-1ef1-08db0b7d15af
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 15:40:06.8485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcBP/LHhn3vLBrMP8gw9tuLubj+CAVR8asEG+2kIXm7b1a97p3XLbnKtGGrq4r4NyYY06uOBwc7UTLKbTjoDwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7085


On 09/02/2023 11:45, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 07/02/2023 15:34, Ayan Kumar Halder wrote:
>>
>> On 20/01/2023 11:06, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 17/01/2023 17:43, Ayan Kumar Halder wrote:
>>>> VTCR.T0SZ should be set as 0x20 to support 32bit IPA.
>>>> Refer ARM DDI 0487I.a ID081822, G8-9824, G8.2.171, VTCR,
>>>> "Virtualization Translation Control Register" for the bit 
>>>> descriptions.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>> Changes from -
>>>>
>>>> v1 - New patch.
>>>>
>>>>   xen/arch/arm/p2m.c | 10 +++++++---
>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>>> index 948f199d84..cfdea55e71 100644
>>>> --- a/xen/arch/arm/p2m.c
>>>> +++ b/xen/arch/arm/p2m.c
>>>> @@ -2266,13 +2266,17 @@ void __init setup_virt_paging(void)
>>>>       register_t val = 
>>>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>>>     #ifdef CONFIG_ARM_32
>>>> -    if ( p2m_ipa_bits < 40 )
>>>> +    if ( p2m_ipa_bits < PADDR_BITS )
>>>>           panic("P2M: Not able to support %u-bit IPA at the moment\n",
>>>>                 p2m_ipa_bits);
>>>>   -    printk("P2M: 40-bit IPA\n");
>>>> -    p2m_ipa_bits = 40;
>>>> +    printk("P2M: %u-bit IPA\n",PADDR_BITS);
>>>> +    p2m_ipa_bits = PADDR_BITS;
>>>> +#ifdef CONFIG_ARM_PA_32
>>>> +    val |= VTCR_T0SZ(0x20); /* 32 bit IPA */
>>>> +#else
>>>>       val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>>>> +#endif
>>>
>>> I am wondering whether this is right time to switch to an array like 
>>> the arm64 code? This would allow to use 32-bit IPA also when Xen 
>>> support 64-bit physical address.
>>
>> In AArch64, we use ID_AA64MMFR0_EL1.PARange to determine the physical 
>> address range supported at runtime. This is then used as an index 
>> into pa_range_info[] to determine t0sz, root_order, etc.
>
> It is using both the ID_AA64MMFR0_EL1 but also p2m_ipa_bits to decide 
> the size.
Ack.
>
>>
>> However, for AArch32 I do not see an equivalent register (similar to 
>> ID_AA64MMFR0_EL1) or any register to determine the physical address 
>> range. Thus, I will prefer to keep the code as it is unless you 
>> suggest any alternative.
>
> I looked at the Arm Arm and indeed it doesn't look like there are 
> equivalent for ID_AA64MMFR0_EL1.PARange.
>
> However, my point was less about reading the system register but more 
> about the fact we could have the code a bit more generic and avoid the 
> assumption that PADDR_BITS is only modified when CONFIG_ARM_PA_32 is set.

I had a rework at the patch. Please let me know if the following looks 
better.

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 948f199d84..bc3bdf5f3e 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2266,14 +2266,35 @@ void __init setup_virt_paging(void)
      register_t val = 
VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;

  #ifdef CONFIG_ARM_32
-    if ( p2m_ipa_bits < 40 )
+    static const struct {
+        unsigned int pabits; /* Physical Address Size */
+        unsigned int t0sz;   /* Desired T0SZ */
+        unsigned int sl0;    /* Desired SL0 */
+    } pa_range_info[] __initconst = {
+        [0] = { 32,     32,     1 },
+        [1] = { 40,     24,     1 },
+    };
+    int i = 0;
+
+    if ( p2m_ipa_bits < PADDR_BITS )
+        panic("P2M: Not able to support %u-bit IPA at the moment\n",
+              p2m_ipa_bits);
+
+    printk("P2M: %u-bit IPA\n",PADDR_BITS);
+    p2m_ipa_bits = PADDR_BITS;
+
+    for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
+        if ( p2m_ipa_bits == pa_range_info[i].pabits )
+            break;
+
+    if ( i == ARRAY_SIZE(pa_range_info) )
          panic("P2M: Not able to support %u-bit IPA at the moment\n",
                p2m_ipa_bits);

-    printk("P2M: 40-bit IPA\n");
-    p2m_ipa_bits = 40;
-    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
-    val |= VTCR_SL0(0x1); /* P2M starts at first level */
+    val |= VTCR_T0SZ(pa_range_info[i].t0sz);
+    val |= VTCR_SL0(pa_range_info[i].sl0);
+

- Ayan

>
> Cheers,
>

