Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC161952C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 12:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437530.691976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oquZc-0004av-Gx; Fri, 04 Nov 2022 11:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437530.691976; Fri, 04 Nov 2022 11:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oquZc-0004Xn-Dz; Fri, 04 Nov 2022 11:09:20 +0000
Received: by outflank-mailman (input) for mailman id 437530;
 Fri, 04 Nov 2022 11:09:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNsf=3E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oquZb-0004Xh-NL
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 11:09:19 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f22210f-5c31-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 12:09:17 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS0PR12MB6485.namprd12.prod.outlook.com (2603:10b6:8:c6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.18; Fri, 4 Nov 2022 11:09:13 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 11:09:13 +0000
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
X-Inumbo-ID: 1f22210f-5c31-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/gLQRW4mMqkeKuBiXThpQpYLkdzUp9P2EaW9h2rkGZF/zuE6WwJ2RQxIW96NlXCCWCN5A3tDWzBIqHCbjEjbezBQyGPdLOGE0YEyY7Ju+SqCT+RRSQBdypW+6TCc+VhS9XsmDazCU8jCtLPGQfUXqRdkgvS7uusvn1s7AhB5QftJg43J7WkFxglyCvr5YSMCllZK6hOtA8m54qHi+YaKYTQ6DiuNGvdrftGmNieJwcLgCgwsPgfyrT9JrfTCeg3V9KDhqqduPaDdAq4z7JSWsfGFrKYDzryvvQEYkPlD9zGbVmRrxjlaE0mGKp/C/6/qi1gzjyikU/8pFYnZhm6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UnNR+16JQNIpVydsmNY5kPLX/3TQfOIaO4GB6X4sTs=;
 b=kqw+feSmxjeSGleTMz4HHxYBVV6X5EF/H1DnZniIfTPCXaDmEvmBqzwf5O/UyFYz385XSTc6cMyL7iR+Nm4pjO+YhrXVM5p+dj3UupG3XGWnfDG5vwOqmpho1AoTUtnIwVqOWdwwhA88Dz3xuOgL/Z1m+wfLXcuvhed2Z33w3dpysyOHd3NfJC4WbS+d7E4xcjPBkTspcY7LF2j8R8Uxp5xMHCtWSHU/dw5zfWS/4pG77QOSiJSA7zofseOfmLEqsQPF5yT8jVtfBesPmx9YOwXD+YUIe3uE6a8ofupnshJaNZx9XEFfcCMmi7KYSmZ9/HyCGXihS+PUOR5MbfnY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UnNR+16JQNIpVydsmNY5kPLX/3TQfOIaO4GB6X4sTs=;
 b=l8OIe0ZcKMWpz3gJwrBBlJx54fyo8reTw80Qwrk/sHO8xMhN1u6rjlMyGvwjphVW9hMXPLTArpFUbOHGHMSsOtJjbljh8BTdUWJltT6PZq4O0lwf+vH8yJvUiSLJlFb7A79O84Z5QEMRQyygJif4oUQGnd5K50tsHQejPw3Bto0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <09b11bfe-6b7b-2da7-84ed-ad7c7c89b516@amd.com>
Date: Fri, 4 Nov 2022 11:09:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 12/12] xen/Arm: GICv3: Enable GICv3 for AArch32
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-13-ayankuma@amd.com>
 <45df5e11-9697-96ca-3c89-39bdbba48637@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <45df5e11-9697-96ca-3c89-39bdbba48637@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0561.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS0PR12MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: da30c83f-e46b-4ea3-2040-08dabe550163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XbYMYfFnfK0Oxq2P3MqgpqFbP0JeU+3PY5EAblGjynZTXuDH7ZItk+U5TU7+7yu6FXEOpI9p5aDvRAtIM6UzbGuIRnSC4dWDv2RziNIQKtm4cvHdeFps88U2VvCgy4eHwRfSFY10jDRfuetjgWX0IWFqtRUMuHhRcoRkfrEz7zt26Yn/Cw+ozynbFUXmkl5f/loSA/Z84npJb9fMf6LbLWNl+aYjzYKnVCP+c/sRFZbVQ7H5Ol8wlm9dl48Eigm1Dbhdcjp70uzRZkXxYr4Wx/LldaVFnUEn0+h7yA7SW9Qg1eHK1Y69VoOZcblXZP7ZXvymTXFWU3r5ZPr8UGPQttI0JzWSJUX9mizeL6fDaJH7o5BR6fyuE+12UoQrtLpAJ2+SG1BtWJEtzUGN6dQPkwAWkx7gXyGTsMU0gzn6IIYPlcmNQWo+o+qgr+NJZhAqL7vOcecorlVsIu/y40sURLfrVL6q6GLq7B2Ep/rOIaux6Aae2sANqKlFGpwOcrTkuBxBsvY3VKS6N+KuzZ6VJ0D9EwrISraee2IzgDqK7EQg8U8pUBPEnT86VwCsCDq9QWQMNp9vSSIuJ5YZz8mcPex5YyujijaKLDhfE6kdkP5MHfwu9sqX8ewmH58194KyUgjD/l8wOBzlSHKSRibGTtN2WAx4HpWKlNO6wVGjFYIIMCoolRrvuLA9ur7f/uxi5wyeNjNXlAV5EAzABVffEmy8ZzuSVV41nFftrwUArnKpyD+4v6WRC94muqEcsnBf943HcMdv4UXPeqCySEVx1leV/EmkobDbSH0U3ONk8Dc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199015)(4326008)(5660300002)(8676002)(6666004)(31696002)(38100700002)(2906002)(66476007)(478600001)(26005)(66556008)(186003)(66946007)(6486002)(6506007)(316002)(53546011)(2616005)(6512007)(36756003)(41300700001)(31686004)(8936002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUx1ZVpHMnJ3UWtWUURjMEhDa2VSUnppSHJ3dittbG5YbVF2WVgwRlMyeXRi?=
 =?utf-8?B?Wi9Ud0VpMUtuMDIwdXNuem1tUjNuNE4yWEhTQ1daYTFCWlVndWFyQ1QwbmRu?=
 =?utf-8?B?SDk5emh2ZFNQMlBObjF2QkJRMmZuQmRyZ2tEcFdlVTFzK2ZMQUNWWFZFTGZY?=
 =?utf-8?B?Y05Qdnd4WjRzZm5IYlRqazE4aFRsVzkvajU3QnZzYWRiNXl2MnFyaVlhdkZn?=
 =?utf-8?B?UkZXZjRIRHR1OWZHRi9QU25DOUdWTVNLUWxuUFpQV3Y3c3BxQlFEa0pCb3lR?=
 =?utf-8?B?eVQ5a1RCRkk1c0VJSzJuREIwMzBHb3JXNXhxNWdCL2ROMm9seUZ5UUJaM05s?=
 =?utf-8?B?NTRYSjNMb1Z4MWNyT2NqZnQ4RTZPNkJlNE1iakprQVF4aEkyRW92Yi9FSGhF?=
 =?utf-8?B?UzlCTDNXNkFqZm5QbGJ4TTJTT0NzVk5HcGU4bXZSZXpHRWVZREZ5dHZsK0Qz?=
 =?utf-8?B?aFJ0eWh6Q29KeFBuamJ2M2tCKzhweHBSM0dHd09RT1AvU004YmkxQXZIODlh?=
 =?utf-8?B?cnRKL1hZVFF3OEpUV0U3ZXpZV0RVT05IL0pQcFlRSVdqVTJtTVJ1WDlwVkpq?=
 =?utf-8?B?WTVNT0xwZnFBZjUxRU9sMUNYemJXeDFEZlBRT09HZmY5b0J6UkRGWnh3czBN?=
 =?utf-8?B?b3J4ZERkSllRQ1dDcFB3U1ZINDI1cVJUQ2NHS0RzNnBPeFFwNkRiNzNLT2JD?=
 =?utf-8?B?NUY0MzhVOFpGOGtOcUFHR3Z1Qi9jUUtiYlNDUzJ0MVpVV2lCaHgva0dHdGFa?=
 =?utf-8?B?bTJRbVZKZ283Q3owMC9lQ3pyOGNsdllqUE84L0pMTHNQK2l3SmNBdVdkL1Yw?=
 =?utf-8?B?RW5GSjBrcTUwU2NKYmlNcUFlWThMQ3pVTVRkWE1idkV1UHBMNFcveTd0UkhW?=
 =?utf-8?B?T0lYdkw0bnhRZTBndGpkY0xCeDJ5Q242UkxQY3BwWXVjbnoyaVpUZWM3THh0?=
 =?utf-8?B?bnhobVF3ak43WjRPOGorRU5nM2QraW1RdU1obFc4K0JOVDVyeVJ1R0xmYVNV?=
 =?utf-8?B?UW5TQmpzWVh1VkdFY0hzUWZjdS9CTW84YmxlOHdVZUpBdkJUM1k0ZEFSRHpk?=
 =?utf-8?B?dmE0MnFuOURoWEFsN2dqSnZBZ3R0Y05iRXZZUWZEV09KZElMVTlrS0RGY2pH?=
 =?utf-8?B?djk5ZUR6Vk12RThCQ1FnZ0hLZmhSWW1pcXFXVTRtd3Q0QjMzd2FRV1V3UlVJ?=
 =?utf-8?B?ZjRIZFVjelpOUmJqMkkwTTRFTGhLdTVPRi9kbWtncjMwREdZb1NTVldjYmRa?=
 =?utf-8?B?MFFtbVZKL0FYTWlRTGRLSG5ES3dzWmV2b2Y0Vmg4QTVLWnA1M3MwQjFMYzU4?=
 =?utf-8?B?UlpIT3lZVjJzMkJ0dEVwRU1RdjNGOW9ZSXBqdUhjbjVKQ09JQ0t3OUdFWFE4?=
 =?utf-8?B?amhGSEFTaTQvWWlpSC9zNW5aZ3ZYV0c3ZWg0THhvbVFTZDA0WGVXSWF3S0M3?=
 =?utf-8?B?NndBYUlSa0FyYlovNWlwRlBSczdDeGUxSWF0dTlqeW55MGd2MGRDbVN1N2px?=
 =?utf-8?B?YnZ6LzMxUlZsQUYwU0FrWmNKK3ljZWpEWnFqVlI0MkE1dU5iMFZrZHpjem5x?=
 =?utf-8?B?alh5bE5kRk5vRm8yM2xjRnc4dUdsL3JIYjhsNElaTmcyWWZwbmx5Z05iUllH?=
 =?utf-8?B?TVprVk51dldWa3BENTM1L2FhVEcwUVZ2V3AzMVdZQnpqUjVvMjVqeXFZUmwv?=
 =?utf-8?B?RkdaY0Z2ZlNvM0FxV05FcFRZS21tZWptaTFvWUJXV0k4VjhWekljckZ6OVhv?=
 =?utf-8?B?UGNMV0lCbUxQai9DcG5CY0ZTMmYvMzgvMTdGKytXamozQ3ZuQ3lGa1NWbGx2?=
 =?utf-8?B?Mnd0SGFudFhjN3NEc2tBNWJFdk9ycmtNSmtZNFBhSlcwanhPWnB3LzkvT2dL?=
 =?utf-8?B?MDVrRmVRQTY2RllCS0RTc1dHQzlSb25DWXQ0MmV2dEpLZW5hdis1U1FZTGJK?=
 =?utf-8?B?NUF1anFKMlhZeFBKckJnSDJ6VURKUENrZWpoWFhnc2R5clNyZU1LRGJDMjc4?=
 =?utf-8?B?NXE0dXJPRUd6OWJ6a1BQbVN2QXIvNEdCTHdFdGNtdFhBODRLNGtGc2VVKzBG?=
 =?utf-8?B?YzVCY3RZUzk0SmlyM3FwRUxmdlR5TWF3cWFBcmdudnRLRkRSeTkyd1ZMaWZs?=
 =?utf-8?Q?ZiR0a/rKeJR6/+rX+IU+ztFmB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da30c83f-e46b-4ea3-2040-08dabe550163
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 11:09:13.3304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qbd99ZjRGkSfsj8s3adKNhjkxc42aoYty+qUBOlKclx1TNyf/YDcrCac9A3TQNjloIdhwP++L8FklxYCymYW2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6485


On 04/11/2022 09:55, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 31/10/2022 16:13, Ayan Kumar Halder wrote:
>>
>> Refer ARM DDI 0487G.b ID072021,
>> D13.2.86 -
>> ID_PFR1_EL1, AArch32 Processor Feature Register 1
>>
>> GIC, bits[31:28] == 0b0001 for GIC3.0 on Aarch32
>>
>> One can now enable GICv3 on AArch32 systems. However, ITS is not supported.
>> The reason being currently we are trying to validate GICv3 on an AArch32_v8R
>> system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
>> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE must not
>> implement LPI support."
>>
>> Updated SUPPORT.md.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>
>> Changed from :-
>> v1 - 1. Remove "ARM_64 || ARM_32" as it is always true.
>> 2. Updated SUPPORT.md.
>>
>>   SUPPORT.md                            | 6 ++++++
>>   xen/arch/arm/Kconfig                  | 4 ++--
>>   xen/arch/arm/include/asm/cpufeature.h | 1 +
>>   3 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index cf2ddfacaf..0137855c66 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -82,6 +82,12 @@ Extension to the GICv3 interrupt controller to support MSI.
>>
>>       Status: Experimental
>>
>> +### ARM/GICv3 + AArch32 ARM v8
>> +
>> +GICv3 is supported on AArch32 ARMv8 (besides AArch64)
> Looking at the CONFIG_GICV3, it can be enabled on arm32, which at the moment
> supports only ARMv7 (see __lookup_processor_type -> proc-v7.S).
> What will prevent the user from enabling GICv3 for ARMv7 based CPU?

Yes, this is my mistake.

ARMv7 does not support GICv3.

I should have introduced a new macro AArch32_v8R so that GICV3 is 
defined for it.

  config GICV3
         bool "GICv3 driver"
-       depends on ARM_64 && !NEW_VGIC
+       depends on ARM_64 || AArch32_v8R !NEW_VGIC
         default y
         ---help---

>
>> +
>> +    Status: Supported, not security supported
>> +
>>   ## Guest Type
>>
>>   ### x86/PV
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 1fe5faf847..7c3c6eb3bd 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -41,7 +41,7 @@ config ARM_EFI
>>
>>   config GICV3
>>          bool "GICv3 driver"
>> -       depends on ARM_64 && !NEW_VGIC
>> +       depends on !NEW_VGIC
>>          default y
>>          ---help---
>>
>> @@ -50,7 +50,7 @@ config GICV3
>>
>>   config HAS_ITS
>>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>> -        depends on GICV3 && !NEW_VGIC
>> +        depends on GICV3 && !NEW_VGIC && !ARM_32
>>
>>   config HVM
>>           def_bool y
>> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
>> index c86a2e7f29..c62cf6293f 100644
>> --- a/xen/arch/arm/include/asm/cpufeature.h
>> +++ b/xen/arch/arm/include/asm/cpufeature.h
>> @@ -33,6 +33,7 @@
>>   #define cpu_has_aarch32   (cpu_has_arm || cpu_has_thumb)
>>
>>   #ifdef CONFIG_ARM_32
>> +#define cpu_has_gicv3     (boot_cpu_feature32(gic) >= 1)
> What is the purpose of defining this macro if it is not used?

It is used in xen/arch/arm/gic-v3.c, gicv3_init().

- Ayan

>
>>   #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
>>   /*
>>    * On Armv7, the value 0 is used to indicate that PMUv2 is not
>> --
>> 2.17.1
>>
>>
> ~Michal

