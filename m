Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA046A45F7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:22:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502720.774636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfKH-0006Ry-7o; Mon, 27 Feb 2023 15:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502720.774636; Mon, 27 Feb 2023 15:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfKH-0006OZ-3Q; Mon, 27 Feb 2023 15:22:05 +0000
Received: by outflank-mailman (input) for mailman id 502720;
 Mon, 27 Feb 2023 15:22:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hCNV=6X=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pWfKF-0006OR-Bn
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:22:03 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a03b385-b6b2-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 16:21:59 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY8PR12MB8364.namprd12.prod.outlook.com (2603:10b6:930:7f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 15:21:56 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%5]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 15:21:55 +0000
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
X-Inumbo-ID: 7a03b385-b6b2-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U934M+V+ZqHi5s4LT3yfweRqqeL5ALftYdTwoeVrquDSR9YKTwB4EGuhvzTld6muwl1JjHGLRwNd8qq3UGEoswpyMolWxWieWrKh4gvZ/BOFiof2UX5OG27d8j6a7DBPg6NveWVaFjyVGMJlkHt9GsEBQICvWf4nQEXgZFzKI3ceZKtsEV7EIgu5CI130j0LksdlvgvQjZYtjSMzuWt23FgkPQZxwvcUSm5qXRVpHH2yhLfN+rlNxP0opHSZpfjGzhltZoa7E67jEk+Qf1Y4He4Eg/tbHQfLIFBYFi+BYJR01voNE5WL5jJIl/IqUct/lO2Wt3wcZ3Sm7v6R+rHZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaofaRcuDmWk446/aa0nRbDHDcPSmYOANyw8eJroMBQ=;
 b=dvYVUSVkvTJdQmXrSUD52+3IHeii6WTGQMslsiwdnHT1nS0EClQdPLi+ccAdAozemMwrop1tmRFFVGQ93gpW6HoCXLCp+K3NRyLyTRfEbFj4XSr1QIbJ+ra2StHjhMVA3/ZQ7GpQNRs3Wsf0oGTx4B7AQd++z7mxVnX/OybsGjT2N1tMk7ei7Kf2JZcui/OPX9DX2N91fh97nEuGA9P9RJGRG3M8fmEVtDejfxvDPe5eOU+8H16sX9TFvDQ5YlEqw016I9Q9/4mB7gYi56LWiAWwBR2W/KwvLpPhqlMhTeYsBMgVyqXN45Jp6Aiq8dUdQX0MdT3FbPVzbA5DnZ79IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaofaRcuDmWk446/aa0nRbDHDcPSmYOANyw8eJroMBQ=;
 b=XRgfP03ZCbD7khm1dJnVyXbcihQGREDfBPeiyTRPg3A/IGJJXR69KCR75bQW7ogvLybX94Is9WAFxYjdE5t1X+dnvz107483q0odYgTV4kYqgWAOAJjFL+UAaF5+c65eRE/fwYMtXclYptrAa3vVJ5iyRBLwnUM1X2K4DksKLwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6450eb68-f953-9921-50f2-d873dfc7e761@amd.com>
Date: Mon, 27 Feb 2023 15:21:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [XEN v3 6/9] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-7-ayan.kumar.halder@amd.com>
 <f8e156f3-933c-03c4-1146-980acc669130@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <f8e156f3-933c-03c4-1146-980acc669130@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0253.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::6) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY8PR12MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 94751b0a-c6e9-4c55-d854-08db18d65bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EDGp5IswmIgsw2kQHvYSPHN+v6FYsEuQY25qR2pejMtM0vXbo0VtH/3L5cip/0PPz+CN4QX+A5UI1BYuYL1R0YLaUf934BV39JKs498lClcFlGq6m2ws3oOfP0lazJ5ZnWOo1sr7p/eHPJsqxVBwBpVciMJ4d91hS6DQIRdUWjMYHzIW+0DbmJnCq+9piV5uxgTMP48YVB+Z6i29vWHxUIoFn5JNHKI4hloR9HMBRbm2RBmc/wymV+Oe5xNWMYikseFYabWil8DKAzfH8vWtwVJmp6uewKZFrjdnKS4babCYMpfFHQ1MQ0/Jk0OWFJKiaWXKZJUD5h98IcDiKTDv5Nxorf5ZnxTKWmEFcvy/Bbxf+ks9ASOIMGjSMow7mzY6RHZCECYtKI66OhKZ4PrDdP6j6iApuVtxYgzzmOe1I2IifleUujQqyQrmsS3A1+7rnH4OmC476v48t+f4L0TAo6YYex4VXrE8lFt0fdsIv/o00Xd9d+yUTKI9JG8aH0S69ATt/PDOBur/5d1IBt/LU3HZgQwql8BwZC3m4phXe9QFDNW+b71M4STyS/tbdRoZAzKM0L3nOLwZ8NT2cBAipiVr5EGmqKxf3oHfDOPl1CI39mjL0L0YnF+BOHgTY5pL4voBzPNX4rYUkV6aGj5gTDOtHdJojoohhQ5XUjSeFfr6yBMmK4+EWwURAuS+mBVjKQhQ0LdAxHnLPGuasRGTfzQ8+oEGaR+lZR8n8fYvfvw3/qUIkAP4x0z9WEZGxtsn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199018)(4326008)(41300700001)(66476007)(83380400001)(66556008)(66946007)(8676002)(38100700002)(36756003)(2906002)(31696002)(7416002)(5660300002)(8936002)(30864003)(2616005)(6486002)(478600001)(110136005)(6506007)(31686004)(6512007)(6666004)(316002)(186003)(53546011)(26005)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzQ4NzBDSitEdVNTQ0FST0NrZ3MzR3RlczBSRzNsL1RYd0lXOFFhNWJ4L3Jy?=
 =?utf-8?B?eXhEVFJzc3VRcjhQNlcxemtIbzA1ZkhmVEIydkEzQ2xoTm16SUxZM01zbWZm?=
 =?utf-8?B?N21mOVdvN0JXUDQ3aGpUeVAvV2trQ3FMOEUrelpKc0RrRW1CNU45R3FhNTF3?=
 =?utf-8?B?Ly8vanYwaTErMENRTGM2aFVUdTJXQU5va2JCZFhBWWNqUk5xZlBHbVRIWEpt?=
 =?utf-8?B?NWE2NjB5NHNUSGV1aUFXNWtLajNFemNHanE3eU41MDU5SjhDOWtRWU1mMUZ1?=
 =?utf-8?B?MHNqRzlKSlg3SWNIK3pvYWNjdSs1ZjF3K3VMVWZ3ZFphZW9PWEFrSEFyamFw?=
 =?utf-8?B?S1I4eVNOVkRKTVVobkhEcmlRb09tUlRzcWdaaWtxQ1dFKzRBaFR0MVZlRVNq?=
 =?utf-8?B?bmJBR0xNMDExODEvbGJ0MENPQkF0UDFiWnppK3hmbGVpNC9CQkJDTzI0QTRr?=
 =?utf-8?B?ajlLS3BwVEc0RzkyZzBBRmFSamxBTWNKbFdFK0JWS0MvbFRZd3Zjb0RqNFVk?=
 =?utf-8?B?dDFOUUE0MDA3dS92UHJpYUxCODR0WWNDd2FpMUQ2NlRkYWlOSVdrNDg5NXBU?=
 =?utf-8?B?RzJMZ3EreUM1RGJjTjBiOEwrYzE3Q3oxTHRCYWNNdHFnc25FTjdpdlNiVmpE?=
 =?utf-8?B?MXF5OXVscG9RemltS2dZTW5hRWRNUXppR0dvM1dqRWNDT2RaamFPOG1DWE9T?=
 =?utf-8?B?eHdVTzBGaWZsRVgremVVMVIyczg4ZW5uN0d5S01OSTFFMno5ZEd3TjdZTVMr?=
 =?utf-8?B?Nlh5ZlUxeXhNWUUvUko2TEtEZURLbjMyMkllVzlwL0xJOHROMzFjMTZaa05j?=
 =?utf-8?B?NUxMZVlKRVIrOERxSTAvOTIwK29PR0JId0xLTk9lekIzQ2hjYitvM3JXSVNG?=
 =?utf-8?B?QzJEbzVVTitobUl1Z01hR2lGRFJqN1hZSlQ3czlHamhqVTJBWVFnZVRhMWVG?=
 =?utf-8?B?a2xBZXVMMWsrcStSZnVycmZjaG5VRHBSUUxYWDhGbXZZWm1XYjZkQlI0ckpJ?=
 =?utf-8?B?YVF0ZC9GTWJOMzJZajAwNG9iaFdoYUdSSEt6aTFxV2JURmZQUFlXWGw1YnVX?=
 =?utf-8?B?T3F2TVRacy9jRll4NWxiajI5ZU1SN1VDRmlreGxXY3cwSzJjRHVTUmliM0hF?=
 =?utf-8?B?N0hzQU1pLzFWTlNIbHB5d0tUNHlqL2lMK2dyWlVIZmxrbWw2bE90bnYvcStU?=
 =?utf-8?B?NmlOdThweHF4Ykdva3VWYlM0eFdOWlNNczdHaE9jNkFoZktiN3RrQTRUZFBE?=
 =?utf-8?B?TjZ0S3JPcHIzNEVxM0ZNc3ZkSzBNMnVqUkszTnBxTE0vell5Y1F3QnRXU0oy?=
 =?utf-8?B?Q3FuTGhYcmZ2eFRPMTloQkR4YVdJcjJBR2I1YjhzRC9mTFJzYWhZVHE0TEl2?=
 =?utf-8?B?UWkwcUVLM1JPbGNmL1lZU2RTQVdwV3h6NEs2NC9mYStBV1MwaDl3cmtNa09U?=
 =?utf-8?B?K2FCd0NweXhRcUtSd2V4ZFBMamtZN2JFbk5MbDFZSCtXeDNwYURRaG5QSUdT?=
 =?utf-8?B?RmlkYldyTVdPNVJtcGlwV3ZrUW9aTXlsVzBWSUV4WHRqMFZmQ0F2Z3VGcTBM?=
 =?utf-8?B?OEpLR0dOS1VldFRQbVZjQlUyY2YzQ3lRTENUb0l0YkgxaStvNzdFcFg1b3Vp?=
 =?utf-8?B?eXpmenNSb3RFRkNBZWo3azNQdFhYVi90bnNJZEJYeXJnMUNOczVrTWFubWVP?=
 =?utf-8?B?Z2VmOEE4MGhyKzZCL1lUWVA3T0lDUFFjNGQxT0ZoWDFBeGRseFlvZDlaR3BJ?=
 =?utf-8?B?ZU9Db1pTckplVFhnUGZLWHVZWnJYMUNnOWNFZC9TUkFNQk9yVks3N3h2MGgr?=
 =?utf-8?B?ajk4c3NkVGQ4c2ZCbmFnRmR3M0hYZ0d2SkNKeW1Oc3FBVDVnYjk2ZWFTVWtM?=
 =?utf-8?B?UENaWHJ3NUdlU0FpRUc0L20zRS9QYnJMZjBuNWRMV1RxeUNUQmY2MlFCTUtX?=
 =?utf-8?B?L0xveFhqV2JVdnJZODR6d1phdTJKbjNyc0pac0hjT1VxSmg4TmZoSUpMSGM1?=
 =?utf-8?B?cGdrVVgxK1B1VHRzMkxIdloycmJKVjBqei9xTGNCNHJQOTZnaWUyR0pyeDlq?=
 =?utf-8?B?M3c5cjJiQXE1eUgyc29ycXVwKzIyWWw5MFJ3cXRLWFRxSGJaUUkwbkQzNStJ?=
 =?utf-8?Q?NUaRd//KhIZvknLMZKR2AStX3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94751b0a-c6e9-4c55-d854-08db18d65bf4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:21:55.1491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnKUw7kICozLG6+Yv47/4kTmLyHJGKKuz+RRNrXXiU4XsFUf9gVivbIbJIw5n83idI3q/Y437UpaLdGdpgkjyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8364


On 11/02/2023 10:01, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

I need some clarification.

>
> On 08/02/2023 12:05, Ayan Kumar Halder wrote:
>> Some Arm based hardware platforms which does not support LPAE
>> (eg Cortex-R52), uses 32 bit physical addresses.
>> Also, users may choose to use 32 bits to represent physical addresses
>> for optimization.
>>
>> To support the above use cases, we have introduced arch independent
>> configs to choose if the physical address can be represented using
>> 32 bits (PHYS_ADDR_32) or 64 bits (PHYS_ADDR_64).
>> For now only ARM_32 provides support to enable 32 bit physical
>> addressing.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from -
>> v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations 
>> required to support 32bit paddr".
>>
>> v2 - 1. Introduced Kconfig choice. ARM_64 can select PHYS_ADDR_64 
>> only whereas
>> ARM_32 can select PHYS_ADDR_32 or PHYS_ADDR_64.
>> 2. For CONFIG_ARM_PA_32, paddr_t is defined as 'unsigned long'.
>>
>> (Jan,Julien please let me know if I understood your suggestion about 
>> Kconfig correctly).
>>
>>   xen/arch/Kconfig                     | 12 +++++++++++
>>   xen/arch/arm/Kconfig                 | 31 ++++++++++++++++++++++++++++
>>   xen/arch/arm/include/asm/page-bits.h |  2 ++
>>   xen/arch/arm/include/asm/types.h     |  6 ++++++
>>   4 files changed, 51 insertions(+)
>>
>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>> index 7028f7b74f..1eff312b51 100644
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -1,6 +1,18 @@
>>   config 64BIT
>>       bool
>>   +config PHYS_ADDR_32
>> +    bool
>> +    help
>> +      Select this option if the physical addresses can be 
>> represented by
>> +      32 bits.
>> +
>> +config PHYS_ADDR_64
>> +    bool
>> +    help
>> +      Select this option if the physical addresses can be represented
>> +      64 bits.
>> +
> So you likely don't want to allow the user to select them directly 
> (IOW remove the help section). However, I don't see any code using it. 
> Did you actually intended to use PHYS_ADDR_{32, 64} in the code?
>
>>   config NR_CPUS
>>       int "Maximum number of CPUs"
>>       range 1 4095
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 239d3aed3c..0955891e86 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -18,6 +18,37 @@ config ARM
>>       select HAS_PDX
>>       select HAS_PMAP
>>       select IOMMU_FORCE_PT_SHARE
>> +    choice
>
> I think this is a bit odd that this choice is part of CONFIG_ARM. It 
> would be better it is separate. You can do that by removing one 
> indentation.
>
>> +        bool "Representative width for any physical address (default 
>> 64bit)"
>> +        optional
>> +        ---help---
>> +          You may want to specify the width to represent the physical
>> +          address space.
>> +          By default, the physical addresses are represented using
>> +          64 bits.
>> +
>> +          However in certain platforms, the physical addresses may be
>> +          represented using 32 bits.
>> +          Also, the user may decide that the physical addresses can be
>> +          represented using 32 bits for a given SoC. In those cases,
>> +          user may want to enable 32 bit physical address for
>> +          optimization.
>> +          For now, we have enabled this choice for ARM_32 only.
>> +
>> +        config ARM_PA_64
>> +            select PHYS_ADDR_64
>> +            bool "Select 64 bits to represent physical address"
>> +            ---help---
>> +              Use 64 bits to represent physical address.
>> +
>> +        config ARM_PA_32
>> +            select PHYS_ADDR_32
>> +            depends on ARM_32
>> +            bool "Select 32 bits to represent physical address"
>> +            ---help---
>> +              Use 32 bits to represent physical address.
>
> As I wrote in v2, I think this is a bit odd to ask the user what would 
> be the width of paddr_t. It is also not scalable if we decide in the 
> future to define different PADDR_BITS (i.e. 48, 40, 36, 32).
>
> So it would be better to allow the user to define PADDR_BITS that can 
> then be translated by Xen to which ever paddr_t is suitable.
>
> Something like:
>
> choice
>    prompt: "Physical address space size" if ARM_32
>    default ARM_PA_48 if ARM_64
>    default AMR_PA_40 if ARM_32
>    help
>      ...
>
> config ARM_PA_BITS_32
>    bool "32-bit"
>    help
>        XXX Add help here to explain the benefits of using 32-bit.
>
>    select PHYS_ADDR_T_32
>    depends on ARM_32
>
> config ARM_PA_BITS_40
>    bool "40-bit"
>    select PHYS_ADDR_T_64
>    depends on ARM_32
>
> config ARM_PA_BITS_48
>    bool "40-bit"
>    select PHYS_ADDR_T_64
>    depends on ARM_48
> endchoice
>
> config PADDR_BITS
>    int
>    default 32 if ARM_PA_BITS_32
>    default 40 if ARM_PA_BITS_40
>    default 48 if ARM_PA_BITS_48
>
> With this approach, there would be no structural change in the Kconfig 
> if we wanted to support 32/40-bit on Arm64.
>
>> +
>> +    endchoice
>>     config ARCH_DEFCONFIG
>>       string
>> diff --git a/xen/arch/arm/include/asm/page-bits.h 
>> b/xen/arch/arm/include/asm/page-bits.h
>> index 5d6477e599..8f4dcebcfd 100644
>> --- a/xen/arch/arm/include/asm/page-bits.h
>> +++ b/xen/arch/arm/include/asm/page-bits.h
>> @@ -5,6 +5,8 @@
>>     #ifdef CONFIG_ARM_64
>>   #define PADDR_BITS              48
>> +#elif CONFIG_ARM_PA_32
>> +#define PADDR_BITS              32
>>   #else
>>   #define PADDR_BITS              40
>>   #endif
>
> With what I suggested above. This would be replaced with:
>
> #define PADDR_BITS CONFIG_PADDR_BITS
>
>> diff --git a/xen/arch/arm/include/asm/types.h 
>> b/xen/arch/arm/include/asm/types.h
>> index e218ed77bd..26144bc87e 100644
>> --- a/xen/arch/arm/include/asm/types.h
>> +++ b/xen/arch/arm/include/asm/types.h
>> @@ -34,9 +34,15 @@ typedef signed long long s64;
>>   typedef unsigned long long u64;
>>   typedef u32 vaddr_t;
>>   #define PRIvaddr PRIx32
>> +#if defined(CONFIG_ARM_PA_32)
>
> And this could be replaced with
> #ifdef CONFIG_PHY_ADDR_T_32
>
> I would also consider to add the following in mm.c
>
> BUILD_BUG_ON((sizeof(paddr_t) * 8) < PADDR_BITS);
>
> This is to make sure that the PADDR_BITS will always fit in paddr_t.
>
>> +typedef unsigned long paddr_t;
>> +#define INVALID_PADDR (~0UL)
>> +#define PRIpaddr "08lx"
>> +#else
>>   typedef u64 paddr_t;
>>   #define INVALID_PADDR (~0ULL)
>>   #define PRIpaddr "016llx"
>> +#endif
>>   typedef u32 register_t;
>>   #define PRIregister "08x"
>>   #elif defined (CONFIG_ARM_64)
>
> Cheers,

I have followed your approach with some modifications. Let me know if it 
makes sense.


Subject: [PATCH] xen/arm: Introduce choice to enable 64/32 bit physical
  addressing

Some Arm based hardware platforms which does not support LPAE
(eg Cortex-R52), uses 32 bit physical addresses.
Also, users may choose to use 32 bits to represent physical addresses
for optimization.

To support the above use cases, we have introduced arch independent
configs to choose if the physical address can be represented using
32 bits (PHYS_ADDR_T_32) or 64 bits (PHYS_ADDR_T_64).
For now only ARM_32 provides support to enable 32 bit physical
addressing.

When PHYS_ADDR_T_32 is defined, PADDR_BITS is set to 32.
When PHYS_ADDR_T_64 is defined with ARM_32, PADDR_BITS is set to 40.
When PHYS_ADDR_T_64 is defined with ARM_64, PADDR_BITS is set to 48.
The last two is same as the current configuration used today on Xen.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
  xen/arch/Kconfig                     |  6 ++++
  xen/arch/arm/Kconfig                 | 41 ++++++++++++++++++++++++++--
  xen/arch/arm/include/asm/page-bits.h |  6 +---
  xen/arch/arm/include/asm/types.h     |  6 ++++
  xen/arch/arm/mm.c                    |  1 +
  5 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 7028f7b74f..89096c77a4 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -1,6 +1,12 @@
  config 64BIT
     bool

+config PHYS_ADDR_T_32
+   bool
+
+config PHYS_ADDR_T_64
+   bool
+
  config NR_CPUS
     int "Maximum number of CPUs"
     range 1 4095
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..b23ee56376 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -2,6 +2,7 @@ config ARM_32
     def_bool y
     depends on "$(ARCH)" = "arm32"
     select ARCH_MAP_DOMAIN_PAGE
+   select PHYS_ADDR_T_64

  config ARM_64
     def_bool y
@@ -9,6 +10,7 @@ config ARM_64
     select 64BIT
     select ARM_EFI
     select HAS_FAST_MULTIPLY
+   select PHYS_ADDR_T_64

  config ARM
     def_bool y
@@ -19,13 +21,48 @@ config ARM
     select HAS_PMAP
     select IOMMU_FORCE_PT_SHARE

+menu "Architecture Features"
+
+choice
+   prompt "Physical address space size" if ARM_32
+   default ARM_PA_BITS_48 if ARM_64
+   default ARM_PA_BITS_40 if ARM_32
+   help
+     User can choose to represent the width of physical address. This can
+     sometimes help in optimizing the size of image when user chooses a
+     smaller size to present physical address.
+
+config ARM_PA_BITS_32
+   bool "32-bit"
+   help
+     On platforms where any physical address can be represented within 
32 bits
+     , user should choose this option. This will help is reduced size 
of the
+     binary.
+   select PHYS_ADDR_T_32
+   depends on ARM_32
+
+config ARM_PA_BITS_40
+   bool "40-bit"
+   depends on ARM_32
+
+config ARM_PA_BITS_48
+   bool "40-bit"
+   depends on ARM_48
+endchoice
+
+config PADDR_BITS
+   int
+   default 32 if ARM_PA_BITS_32 || PHYS_ADDR_T_32
+   default 40 if ARM_PA_BITS_40 || (PHYS_ADDR_T_64 && ARM_32)

+   default 48 if ARM_PA_BITS_48 || (PHYS_ADDR_T_64 && ARM_64)

/*

* The reason for this '||' condition is that ARM_PA_BITS_32, 
ARM_PA_BITS_40 or ARM_PA_BITS_48 aren't visible for ARM_64.

* We don't want PADDR_BITS to be undefined in ARM_64. Thus, we have 
added the || condition.

* We could also remove ARM_PA_BITS_32, ARM_PA_BITS_40, ARM_PA_BITS_48 
(from the || ), but have kept for documentation sake.

* Let me know if you want it to be removed.

*/

+
  config ARCH_DEFCONFIG
     string
     default "arch/arm/configs/arm32_defconfig" if ARM_32
     default "arch/arm/configs/arm64_defconfig" if ARM_64

-menu "Architecture Features"
-
  source "arch/Kconfig"

  config ACPI
diff --git a/xen/arch/arm/include/asm/page-bits.h 
b/xen/arch/arm/include/asm/page-bits.h
index 5d6477e599..deb381ceeb 100644
--- a/xen/arch/arm/include/asm/page-bits.h
+++ b/xen/arch/arm/include/asm/page-bits.h
@@ -3,10 +3,6 @@

  #define PAGE_SHIFT              12

-#ifdef CONFIG_ARM_64
-#define PADDR_BITS              48
-#else
-#define PADDR_BITS              40
-#endif
+#define PADDR_BITS              CONFIG_PADDR_BITS

  #endif /* __ARM_PAGE_SHIFT_H__ */
diff --git a/xen/arch/arm/include/asm/types.h 
b/xen/arch/arm/include/asm/types.h
index e218ed77bd..56d27af162 100644
--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -34,9 +34,15 @@ typedef signed long long s64;
  typedef unsigned long long u64;
  typedef u32 vaddr_t;
  #define PRIvaddr PRIx32
+#if defined(PHYS_ADDR_T_32)
+typedef unsigned long paddr_t;
+#define INVALID_PADDR (~0UL)
+#define PRIpaddr "08lx"
+#else
  typedef u64 paddr_t;
  #define INVALID_PADDR (~0ULL)
  #define PRIpaddr "016llx"
+#endif
  typedef u32 register_t;
  #define PRIregister "08x"
  #elif defined (CONFIG_ARM_64)
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b99806af99..d8b43ef38c 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -690,6 +690,7 @@ void __init setup_frametable_mappings(paddr_t ps, 
paddr_t pe)
      const unsigned long mapping_size = frametable_size < MB(32) ? 
MB(2) : MB(32);
      int rc;

+    BUILD_BUG_ON((sizeof(paddr_t) * 8) < PADDR_BITS);
      BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);

      if ( frametable_size > FRAMETABLE_SIZE )
-- 
69,1          68%
- Ayan

