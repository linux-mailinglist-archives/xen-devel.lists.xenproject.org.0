Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3596924D7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 18:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493491.763413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQXYy-00028e-Pi; Fri, 10 Feb 2023 17:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493491.763413; Fri, 10 Feb 2023 17:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQXYy-00025N-MG; Fri, 10 Feb 2023 17:51:56 +0000
Received: by outflank-mailman (input) for mailman id 493491;
 Fri, 10 Feb 2023 17:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WxDD=6G=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pQXYw-00025H-Df
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 17:51:54 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e88::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 988f046b-a96b-11ed-933c-83870f6b2ba8;
 Fri, 10 Feb 2023 18:51:52 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 17:51:47 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 17:51:47 +0000
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
X-Inumbo-ID: 988f046b-a96b-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMBvu7xyG5b9I/8eUrUb5eBsHwQbu1ofm6kEW93z3fNaF3hnUqG+qEBOqsyFmsW5d7kptof/4tuu+7aEIrs7GaJoQEbXCBNw52SIg+ecmJzP1IcBmPOqxjpMUHNMU8+ypH1VdSz42oDbmomuQYACqsw9Bg8JpYW9J96FbfxhvImVnW8AEZLy99jvOZXmaXBsq7Ckjz58PBa8Iz/FEWszDXd0XWphUBGDjRHpqMXRjSo9nPbhLhwPCuBR4uM5Z3nKca/PW92sVXfbymCpvZT0NHvo/8tAPyCjSem+2X1q19WPhHq1VyPKzq1sN9o9xOAn0KVF9Ia2eT+xLhD7R2v0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9dJaofF2mMFAjIJachcFyElqYhc42IHerTfIkQO7vY=;
 b=Nj7ZNU9RF1pJmPX7lh1HdMajdX7BW8GiyHQi0YqGVlrjk+1Qvr95OMG4yRAT7OZDafggyWPbhnbnol/10e42J7itbA88aN/wkgzqqO3JhWhpu/9jw1tbV8oSYLkrEAuWWMIW1cxiEy9O4Vg4/vvPoLn3koUwjnN4MkbYWYcwr8flgVc1aJpHQDEo8cs7/PXl3qizPWSz3H3IRKk0LpCBZTlTxzj9AYCmg29CA71l7mF4ZiT6kfCACmuIoV2oYKJIAaznuaW7fiBXhjbSeXM0urwIHIjoOXSeY9n2S6qPG0RQxbkRioUn2CW32rLUTPSmRfJlNYp8ULRfaL5dIxz+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9dJaofF2mMFAjIJachcFyElqYhc42IHerTfIkQO7vY=;
 b=t20UsrUhd4e3o0AcF2yxUahe6p+5uwLHP5h3Y+gQkvfEd82whPQaTFrRCWwiodg8gqB2DvPy84ypHJf9PCShvLHxMv6AokesIfh4unehYNYebUQUzMtMxTluX3f/0ge+6p5Pzanf15gjW69En3Gl+I4QU1vs+Xzsc1yFCwf2n6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3b3c3846-5464-4914-3b28-f451f7e70c9a@amd.com>
Date: Fri, 10 Feb 2023 17:51:41 +0000
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
 <1e5d905c-0511-ed80-c899-e679d955775d@amd.com>
 <5eb92203-2d99-7dfc-4f01-d92b7a23c3e5@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <5eb92203-2d99-7dfc-4f01-d92b7a23c3e5@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0303.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::20) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e33f90-d99e-4ce1-248f-08db0b8f7abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sknLyqt5Twd5XBPv1ei0HafzWuXDWR8433amWeMVlwTq8Clys68CgJ0AfnEp002dxbyRlWOGZIaK0rcL+PPOvFRUX0yF5gGOcgMXIC8VsgAxE+ybwv40BQd5qC+coRC/76cMHR0oABCyL8jEOcCSRXdY0n/kyg4pnSFyuo+xQxodJZ+qhzrYs/c93g3vNOfPqHls3vdDv8INEvjCeVChy+7bM1ds/xgK4oB8bZKfXJ0yPB/6ob4Qxe/LcAs5ndUT/w6qCf58nLDpPL2d/9iUmFH+l/HOggZ9pOLVKyMl0xC7gP/rs9Swn/y/RiWf/cYAVMRWrTarI+0yYE9Vi2/WOj/j5WfnQoboWQxxAL3qW58i9HfUILgc97UXsz74h/CYNIo4CuCDeIYUHTCAamcvlAzo17R3WmC/iVNDvUmX8KO5spxfJKOWizCg7bOhfaZQlO6UJSN1ocvc9fvJjG1n05kQSwPWL2liH/slV6IzqxcprQZ1l+jTI+hQTD5+G4chskKMTil8giTVMdoMqzIVVXSfhyxUhN5PcUauq/aFzGA8FZgFuaXNSsMo2TDp9kN+PZ6nu2i+p0YFpCYR5PgMTcWtILRW3tM/NiXQDmpRBp8wy4TjwKgq3hS/cY2xPfZXXeFvMys5IJ/b2TyNoN9W+NpXsh4tmsYGamHnugAPTP+k/tk9CwUc9nzJDXqCIzp2FvlTr09AmfBkuYn9fKhZprOmXTPVqAakeaeQbbdmdPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199018)(38100700002)(6512007)(26005)(2616005)(83380400001)(186003)(36756003)(66946007)(110136005)(316002)(4326008)(66556008)(66476007)(478600001)(6486002)(31696002)(6506007)(6666004)(53546011)(8936002)(31686004)(8676002)(5660300002)(41300700001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWQxZlFrblRreHZoK1FFNTZyT05qZUZwSnNuWTlPb2hhc2E2YlFvT0dNV2J6?=
 =?utf-8?B?K1dQTjhPZWdmTEIrU09jOGg1WDRmaTM5aFlabHp2MjlTWGhkRnNMMkI3WjN4?=
 =?utf-8?B?NWhhSWJpbWQ3bXNVOXhDR3RHYUlwa082dFRydWhWQm0wTElvYjdZZVJjYURR?=
 =?utf-8?B?Mk1MWFA2VmdTc1VkVlB5Q2drRUM3VG91OTlXb3ZhMmhTVW45THhjRUpKbkxr?=
 =?utf-8?B?MHBHRVRpOFdzUmRubllwMGxYR05nWVViUW5HNmVUYzBGRGJ4M0VvNklUYVVX?=
 =?utf-8?B?NnJFK3F1L1VzRzhnNDZwbDJWaWRVR2pQL2JybFR6dFVsbVNTdWhCT3ZyR3lr?=
 =?utf-8?B?TlVOYWlMNXRwSXJrMitiVlVLd28xNStHcUU0ZEdpOXhPSXN1czNyR0xTQXk5?=
 =?utf-8?B?QWNEdHQyd3VyRnVTdlBqOEFYRWlEMDVKSUI3cHFDU2YyY1ZMSzhyM0pQbHBk?=
 =?utf-8?B?Q1hjYkltTFR5bkhVVDN3NHk1SzROUzZQSHVFTy9tcDBNNlhOakwrZlFad0Jq?=
 =?utf-8?B?VnluUHptQzh6eGgrNlhBNXQ0UUZYK3RsMnd4T0p1VEt5a2RjN1FjOWo4QlV2?=
 =?utf-8?B?MzlWR3FHMmhhZUlMeEdBUmxNUjd5THRURlBJdGw0WDJWbUtrNWxnUndMaE42?=
 =?utf-8?B?TGhUd3hEZis2VDY2bllPOERXZ2s0eHNMcnVpMEVxTXF2Qm01b0xnWVpxNXpV?=
 =?utf-8?B?eEJBNERtUGpteG9kZTZTRy9KTis5VmJORFRZUUZHZTZVazF3WDgrRDI0Mlo2?=
 =?utf-8?B?M2pkeEtUZGcwU2tzM1JrbTJYS0p1UzBJYmtCTEpsVUFQeTlDSjlXak5xeXB0?=
 =?utf-8?B?bXNaeG1CS1M2eURpSEhkWXNSRlBCMjVna014OFpPMUhWcXZHcmxLZmdyODZQ?=
 =?utf-8?B?WE5sRGVUd1dSZE4wTWR3OWJYYnhTSDBPOC85WXRRVFFIYkozd3VQeitEZXlr?=
 =?utf-8?B?d2t6UGxGOU1FSFd2ck9LN1lkWFI4aldaUXY1cG1XZm5MQVRuSkxQNitTQThT?=
 =?utf-8?B?T1Y1RjRzMUwwa1dPVEh1czE5Z0JTV3k3MzZaRUFzZi9YSjk1UnhFV0JlRTg5?=
 =?utf-8?B?QVNjclUzLzV6TnFMcDZ0QS95Z1Q1NmhKeWR6azNoY1VKV1Y4YUl4UERXYk1D?=
 =?utf-8?B?YThQL1JMZmZDSkVLUm5aQjB3VkszY1NmSTBDbGxCbVFtdy9mZjFNbk1pYjB1?=
 =?utf-8?B?ZlNzcXVLUWRkUTdoV3M0cVFOS05NTHlGcEZ2ei9XUmY4V3h2Mi9SRXU2MnFn?=
 =?utf-8?B?UnBFWUdnTTQvQXNqczBraWxpbVcreWFKRTFSV1JLWlZNcGdRTzl1OGN0SUV1?=
 =?utf-8?B?emM5RzRoTmVDVlVVZ2w3VFUvNFV2L09RMGd2cGo3UHhQMmFEZElrZkFMbFIw?=
 =?utf-8?B?TVlsb05XTmZNQkhiOGJwUjdTVWE5anBQWHdnU2VqcnN5VmJWaUU3Tm5qT0xJ?=
 =?utf-8?B?MmN4WlhKVU1FTUMza29Ic1VCOUs1VFUvbTNJdzBOVTk2a2grRDlDUE14anl2?=
 =?utf-8?B?RC9pUWdTOXZWL3BQUWxQY2FxdG4xeG9wL2lSdzV1clJ6T0pmOXp5UWprSnJT?=
 =?utf-8?B?RUdibk4yUnFwUE9Gc3I3alM2c1BKc3p4cXVUeVhlTVE5VldDSEcyNDZlWVB6?=
 =?utf-8?B?eHc3eEdlNFdDdklvZG5EWVI1eHB3ZFdYSjd4RUZUaVVTb3VlcWFGcEtSRmMx?=
 =?utf-8?B?elV1NkprUzhMVmVHc1RiZ3BKUDdNVDd6T1NMZTdCSzNaRDZPQS92Y1lYQ0Ex?=
 =?utf-8?B?eWdRaElXaE1jVC90b0dpa2FxYmdGQ1NkR25Lbjc5ajRNRjJWTW1RWDdtcURt?=
 =?utf-8?B?aVFINDFwdlFXVjhabVQ1am4rY09jSmNzZG94Ni9hcmlWMGREWTRkK1Rjc0lk?=
 =?utf-8?B?dE1KTVNkdlZ6ejY1MFljOGhuTTJCTzdOaVkrTTZHMTkveEp5Y2xOT2x3bDlr?=
 =?utf-8?B?WGplcnJTcGx3RVUyVEtNcmlNbkZWRDVocEVuYmVHSnZJbWFremo2NC91R09R?=
 =?utf-8?B?aXlWNE1BVnZ1WjhnS3Y5Z3ZYQnY3SzBFaEJOdmJzMjU0UGlZdDBROTZWb1dK?=
 =?utf-8?B?dzZid2JzQnJJbE1oUUFIN29JOW1IQm82M1FlUFkrOFhhYmtybVNRQ1hjOFg1?=
 =?utf-8?Q?wN7z1rA+eyGBlHc9vYei2Zuqm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e33f90-d99e-4ce1-248f-08db0b8f7abb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 17:51:47.3183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMp9tS5x7ZgNTBpANs8BVS/28z8ZVR0MU7/I8UUJEzm6F+4Z2pqiWt6qXIIRZmvAwZstb5HcM6RJBsupebwSpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824


On 10/02/2023 16:19, Julien Grall wrote:
> Hi,

Hi Julien,

I need some inputs.

>
> On 10/02/2023 15:39, Ayan Kumar Halder wrote:
>>
>> On 09/02/2023 11:45, Julien Grall wrote:
>>> Hi,
>> Hi Julien,
>>>
>>> On 07/02/2023 15:34, Ayan Kumar Halder wrote:
>>>>
>>>> On 20/01/2023 11:06, Julien Grall wrote:
>>>>> Hi Ayan,
>>>> Hi Julien,
>>>>>
>>>>> On 17/01/2023 17:43, Ayan Kumar Halder wrote:
>>>>>> VTCR.T0SZ should be set as 0x20 to support 32bit IPA.
>>>>>> Refer ARM DDI 0487I.a ID081822, G8-9824, G8.2.171, VTCR,
>>>>>> "Virtualization Translation Control Register" for the bit 
>>>>>> descriptions.
>>>>>>
>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>> ---
>>>>>> Changes from -
>>>>>>
>>>>>> v1 - New patch.
>>>>>>
>>>>>>   xen/arch/arm/p2m.c | 10 +++++++---
>>>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>>>>> index 948f199d84..cfdea55e71 100644
>>>>>> --- a/xen/arch/arm/p2m.c
>>>>>> +++ b/xen/arch/arm/p2m.c
>>>>>> @@ -2266,13 +2266,17 @@ void __init setup_virt_paging(void)
>>>>>>       register_t val = 
>>>>>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>>>>>     #ifdef CONFIG_ARM_32
>>>>>> -    if ( p2m_ipa_bits < 40 )
>>>>>> +    if ( p2m_ipa_bits < PADDR_BITS )
>>>>>>           panic("P2M: Not able to support %u-bit IPA at the 
>>>>>> moment\n",
>>>>>>                 p2m_ipa_bits);
>>>>>>   -    printk("P2M: 40-bit IPA\n");
>>>>>> -    p2m_ipa_bits = 40;
>>>>>> +    printk("P2M: %u-bit IPA\n",PADDR_BITS);
>>>>>> +    p2m_ipa_bits = PADDR_BITS;
>>>>>> +#ifdef CONFIG_ARM_PA_32
>>>>>> +    val |= VTCR_T0SZ(0x20); /* 32 bit IPA */
>>>>>> +#else
>>>>>>       val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>>>>>> +#endif
>>>>>
>>>>> I am wondering whether this is right time to switch to an array 
>>>>> like the arm64 code? This would allow to use 32-bit IPA also when 
>>>>> Xen support 64-bit physical address.
>>>>
>>>> In AArch64, we use ID_AA64MMFR0_EL1.PARange to determine the 
>>>> physical address range supported at runtime. This is then used as 
>>>> an index into pa_range_info[] to determine t0sz, root_order, etc.
>>>
>>> It is using both the ID_AA64MMFR0_EL1 but also p2m_ipa_bits to 
>>> decide the size.
>> Ack.
>>>
>>>>
>>>> However, for AArch32 I do not see an equivalent register (similar 
>>>> to ID_AA64MMFR0_EL1) or any register to determine the physical 
>>>> address range. Thus, I will prefer to keep the code as it is unless 
>>>> you suggest any alternative.
>>>
>>> I looked at the Arm Arm and indeed it doesn't look like there are 
>>> equivalent for ID_AA64MMFR0_EL1.PARange.
>>>
>>> However, my point was less about reading the system register but 
>>> more about the fact we could have the code a bit more generic and 
>>> avoid the assumption that PADDR_BITS is only modified when 
>>> CONFIG_ARM_PA_32 is set.
>>
>> I had a rework at the patch. Please let me know if the following 
>> looks better.
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index 948f199d84..bc3bdf5f3e 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -2266,14 +2266,35 @@ void __init setup_virt_paging(void)
>>       register_t val = 
>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>
>>   #ifdef CONFIG_ARM_32
>> -    if ( p2m_ipa_bits < 40 )
>> +    static const struct {
>> +        unsigned int pabits; /* Physical Address Size */
>> +        unsigned int t0sz;   /* Desired T0SZ */
>> +        unsigned int sl0;    /* Desired SL0 */
>
> Hmmm... Why don't you include the root order? In fact...
>
>> +    } pa_range_info[] __initconst = {
>> +        [0] = { 32,     32,     1 },
>> +        [1] = { 40,     24,     1 },
>
> ... looking at the ARMv7 specification (see B3-1345 in ARM DDI 
> 0406C.d), the root page-table is only concatenated for 40-bits.
Sorry, I could not follow how you inferred this. Can you paste the 
relevant snippet ?
>
>> +    };
>> +    int i = 0;
>> +
>> +    if ( p2m_ipa_bits < PADDR_BITS )
>> +        panic("P2M: Not able to support %u-bit IPA at the moment\n",
>> +              p2m_ipa_bits);
>
> This check seems unnecessary now.

We still need this check as arm_smmu_device_cfg_probe() invokes 
p2m_restrict_ipa_bits(size).

And referARM IHI 0062D.cID070116 (SMMU arch version 2.0 Specification), 
the IPA address size can be

 0.

    0b0000 32-bit.

 1.

    0b0001 36-bit.

10.

    0b0010 40-bit.

11.

    0b0011 42-bit.

100.

    0b0100 44-bit.

101.

    0b0101 48-bit.

So if p2m_ipa_bits = 36 bits and PADDR_BITS = 40, then we want to panic.

- Ayan

>
>> +
>> +    printk("P2M: %u-bit IPA\n",PADDR_BITS);
>> +    p2m_ipa_bits = PADDR_BITS;
>> +
>> +    for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
>> +        if ( p2m_ipa_bits == pa_range_info[i].pabits )
>> +            break;
>> +
>> +    if ( i == ARRAY_SIZE(pa_range_info) )
>>           panic("P2M: Not able to support %u-bit IPA at the moment\n",
>>                 p2m_ipa_bits);
>>
>> -    printk("P2M: 40-bit IPA\n");
>> -    p2m_ipa_bits = 40;
>> -    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>> -    val |= VTCR_SL0(0x1); /* P2M starts at first level */
>> +    val |= VTCR_T0SZ(pa_range_info[i].t0sz);
>> +    val |= VTCR_SL0(pa_range_info[i].sl0);
>> +
>
> I think you can share a lot of code between arm64 and arm32. A diff 
> below (not tested):
>
> diff --git a/xen/arch/arm/include/asm/p2m.h 
> b/xen/arch/arm/include/asm/p2m.h
> index 91df922e1c9f..05f26780a29d 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -14,16 +14,10 @@
>  /* Holds the bit size of IPAs in p2m tables.  */
>  extern unsigned int p2m_ipa_bits;
>
> -#ifdef CONFIG_ARM_64
>  extern unsigned int p2m_root_order;
>  extern unsigned int p2m_root_level;
>  #define P2M_ROOT_ORDER    p2m_root_order
>  #define P2M_ROOT_LEVEL p2m_root_level
> -#else
> -/* First level P2M is always 2 consecutive pages */
> -#define P2M_ROOT_ORDER    1
> -#define P2M_ROOT_LEVEL 1
> -#endif
>
>  struct domain;
>
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 948f199d848f..6fda0b92230a 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -2264,17 +2264,6 @@ void __init setup_virt_paging(void)
>  {
>      /* Setup Stage 2 address translation */
>      register_t val = 
> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
> -
> -#ifdef CONFIG_ARM_32
> -    if ( p2m_ipa_bits < 40 )
> -        panic("P2M: Not able to support %u-bit IPA at the moment\n",
> -              p2m_ipa_bits);
> -
> -    printk("P2M: 40-bit IPA\n");
> -    p2m_ipa_bits = 40;
> -    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
> -    val |= VTCR_SL0(0x1); /* P2M starts at first level */
> -#else /* CONFIG_ARM_64 */
>      static const struct {
>          unsigned int pabits; /* Physical Address Size */
>          unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
> @@ -2286,29 +2275,26 @@ void __init setup_virt_paging(void)
>          [0] = { 32,      32/*32*/,  0,          1 },
>          [1] = { 36,      28/*28*/,  0,          1 },
>          [2] = { 40,      24/*24*/,  1,          1 },
> +#ifdef CONFIG_ARM_64
>          [3] = { 42,      22/*22*/,  3,          1 },
>          [4] = { 44,      20/*20*/,  0,          2 },
>          [5] = { 48,      16/*16*/,  0,          2 },
>          [6] = { 52,      12/*12*/,  4,          2 },
>          [7] = { 0 }  /* Invalid */
> +#endif
>      };
>
>      unsigned int i;
>      unsigned int pa_range = 0x10; /* Larger than any possible value */
>
> +#ifdef CONFIG_ARM_64
>      /*
>       * Restrict "p2m_ipa_bits" if needed. As P2M table is always 
> configured
>       * with IPA bits == PA bits, compare against "pabits".
>       */
>      if ( pa_range_info[system_cpuinfo.mm64.pa_range].pabits < 
> p2m_ipa_bits )
>          p2m_ipa_bits = 
> pa_range_info[system_cpuinfo.mm64.pa_range].pabits;
> -
> -    /*
> -     * cpu info sanitization made sure we support 16bits VMID only if 
> all
> -     * cores are supporting it.
> -     */
> -    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
> -        max_vmid = MAX_VMID_16_BIT;
> +#endif
>
>      /* Choose suitable "pa_range" according to the resulted 
> "p2m_ipa_bits". */
>      for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
> @@ -2324,12 +2310,22 @@ void __init setup_virt_paging(void)
>      if ( pa_range >= ARRAY_SIZE(pa_range_info) || 
> !pa_range_info[pa_range].pabits )
>          panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", 
> pa_range);
>
> -    val |= VTCR_PS(pa_range);
> -    val |= VTCR_TG0_4K;
> +#ifdef CONFIG_ARM_64
> +    /*
> +     * cpu info sanitization made sure we support 16bits VMID only if 
> all
> +     * cores are supporting it.
> +     */
> +    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
> +        max_vmid = MAX_VMID_16_BIT;
>
>      /* Set the VS bit only if 16 bit VMID is supported. */
>      if ( MAX_VMID == MAX_VMID_16_BIT )
>          val |= VTCR_VS;
> +#endif
> +
> +    val |= VTCR_PS(pa_range);
> +    val |= VTCR_TG0_4K;
> +
>      val |= VTCR_SL0(pa_range_info[pa_range].sl0);
>      val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
>
> @@ -2341,7 +2337,7 @@ void __init setup_virt_paging(void)
>             p2m_ipa_bits,
>             pa_range_info[pa_range].pabits,
>             ( MAX_VMID == MAX_VMID_16_BIT ) ? 16 : 8);
> -#endif
> +
>      printk("P2M: %d levels with order-%d root, VTCR 0x%"PRIregister"\n",
>             4 - P2M_ROOT_LEVEL, P2M_ROOT_ORDER, val);
>
> Cheers,
>

