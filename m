Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D25474704F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 14:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558295.872247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGejc-0001LY-NS; Tue, 04 Jul 2023 12:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558295.872247; Tue, 04 Jul 2023 12:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGejc-0001Ip-JY; Tue, 04 Jul 2023 12:02:20 +0000
Received: by outflank-mailman (input) for mailman id 558295;
 Tue, 04 Jul 2023 12:02:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gy6C=CW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qGejb-0001Ij-Iy
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 12:02:19 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20625.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e5d9f8f-1a62-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 14:02:17 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH0PR12MB5387.namprd12.prod.outlook.com (2603:10b6:610:d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 12:02:13 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 12:02:13 +0000
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
X-Inumbo-ID: 9e5d9f8f-1a62-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGapxe+CO/Kfftf7VWxL3CdTSEndXG9G5UA1KYinWRzecHX4AjKumsVXKflgMFyc6ftRGl80Uivz6H4LeEtDbWasICcINPD3Y2iFNeDyCLmf3gG7xqFtxNfG35budMUdiWADaxJ2QkJ1J5spclPcm9P+xeeXtFn5fA+VevDM4EPmsC2EKksjiRzcgakv/R7s+d8rcqjGIuSilZAKhtBP3VjiUshMr1KEIaeoOrLG9JGJGQhnbjBXh5iZiu6ZZGyq9nY8otjIcE8ZNWU0DcbXqi+mPL7mLLYOTyTY3JXVKsVyM/vhtKO6OmBgVXANRa0CNaMELAJuWhFtEP3L4kB/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jt+agSvOonh8mMnbln3QX+xOm8kA9R3IxbLKvceeA7M=;
 b=jAkGT+Trfgjn9OLbDk/5/tze/3YjILYDi8GU2WB/ExvlJCBINeAA7xgZUrFfyvR3nvGmgXPKJRq4D14gvZWdSoQok/57Jb1e04FdBzLG9inrR3jndavyWTal4OO89Pn4cl4TGtrumdtn5+KI3J+uaEUixe6iLgiY1qcVaZogNOBcA0obTUZ7cGzG4UEucASquYKZ8VhFoT5Y+9aISp1yH5YZicCIaqmWE7647zfMOTMLXbdP6EDay20vZ3jAxtnECNt8U4mzV5HDFX6o4LZMSpaxbOD39wUqZcur7gC4A+7a1d6xFKXtl8afII+SwwVEGQ0uem3i9LmR4Y9OAB7Aww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jt+agSvOonh8mMnbln3QX+xOm8kA9R3IxbLKvceeA7M=;
 b=k7BQp/Da4GGXcq5/3KlQsG3AU2uV3FPY/JScOVXkYhrTZpNfOpwYtQ/9JgqTynncnphYA1AWL8mOluFZt4ZPVpXE4MVxD1A/VDGlgEUbK7qYTDfYSB8Su9r5FUb8zvwEMtP4rYCLZjp39MkI0v+Hd593De+0u9jI4/arZkQVhuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <682fdfab-b755-e580-7688-3dc0c0e3779e@amd.com>
Date: Tue, 4 Jul 2023 13:02:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 03/52] xen/arm: add an option to define Xen start
 address for Armv8-R
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-4-Penny.Zheng@arm.com>
 <cb7e3d34-bbb8-e5df-f87b-0fcac4b65378@amd.com>
 <77c64929-514a-ea67-cf8b-176c895ff971@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <77c64929-514a-ea67-cf8b-176c895ff971@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0485.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH0PR12MB5387:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca65eec-d225-4998-0420-08db7c8680bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ms4YYq8DdLb63WUx7brLgGWpQ224KPpmz7XyWADpAO0B+Q7VRkmcB8eHUI+hTaUiCVS4eVm019NAigPZwhyBjQXAAstdFMD9LDnrV8YFBWDjmCoAQWlf3GjXzfkVS7vIBkiqvP9endfdJz9bUuKxr9DsQAyGRGW1t0JadSht9Eg/OJT3wV3VlS5BCA09oBPj+X0i+Z1YQiDl98KARX1u1xUAdsgEFtCStRBprSxarQGa2DEAJeXyRGH3q4Q4jEWgAcUNEvLTrPcWw2kTksgPEwsRPvOpuZqALYd0oEU3QXXYCN15w64gxaRj5UKY6bmsB9gFn+KGy3Rge0kY7iT5m8kDu1Y8+5Cu1AYG4W1PIzfly0ZivzMIrw2R0bXCkHY46Tmi3pm/LL6JH3LY36HsT0a/uWv+byFu6ssYBvYrIQvyhddJGeAKHT8I0DyO+HqfGQsImT/zjpCwTHd2RLHXKFEvXemUzjlLHfixjysrLwrhX3lt7t/SievoCkndDLb76pVt1i+l2TDWdpiPGH97ITuI6RRlqRixo76yysFC3xFzSY1Sh9eXtfZokxmMT4G4JBftpRNynLKQpP4ST3yQQ0vM+14jXBTmosbsJdoa+Vu4kgyGD2uO/IYUx5iwe2a+xqV1cap/9ocm72M4K3jOWnVOPu9pRG5Bujm1UsmFmN4sdkLBH6XVCv90LeK8Q10R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199021)(6506007)(6512007)(53546011)(66476007)(316002)(66556008)(38100700002)(66946007)(4326008)(2616005)(83380400001)(186003)(26005)(478600001)(54906003)(110136005)(2906002)(31686004)(8676002)(8936002)(36756003)(31696002)(5660300002)(6486002)(966005)(41300700001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWJxMTZLU2RXMmRoWHFBY3dGOGZTdjlMV2E1cDVadDlSWWN4MXQ4MHJsL0ZY?=
 =?utf-8?B?d1FGZTZrQ3VHd3ZwcG41QVBPNVRJWWdDamVjUjkxL2lhTWJqU3ozWG55bVVK?=
 =?utf-8?B?eU9mTHVjVFNwV3ZPdlVqN2JlNGc0UEJXZFVHRTZLbXJXVU9FQ2g1czJkTHo5?=
 =?utf-8?B?WnNuRnhXK2h5SkJLbmZQV1U3MzJDcExnWWdDeDdFWUREdElGN2w5MG1XNGcv?=
 =?utf-8?B?T20rY0ZOaFNueWYvbWkxZmR5c0hxaDNDdDJZZUZPYldaWnF3VldTRjRQLy9u?=
 =?utf-8?B?WUcwNTJRbFFCRkNEYXFmNHRud2xtNFZsL2FOajU0R2wycEtZcHc2R2w1bkxH?=
 =?utf-8?B?c3o5NDlSYXN4ZnYrT2cyYUhBWk1LcllCbk8wakdRZEdJeEhxVTZVQlRNUjhs?=
 =?utf-8?B?Z0paSkV2a1lmQUdWUWVUWkF6bCtwQ3RNa2psWmZPam5TZWVpL3Jxbjl2bzFH?=
 =?utf-8?B?YkVFZ2luUEtRM3AzcFc4MGc2Q0VFdisxaEtmYThsWGliQnMwMVc0M3hsSUw1?=
 =?utf-8?B?L1pTc0RnbmkrRERTK2pLbk4rRVhteWFKYkppaEFtWCtDRkU5SExuRzNnMHBE?=
 =?utf-8?B?T2g2eFpvZGcxdEdDRVE2bzR1Y1g4Rks2NENvU3VJZ3lJVWJueCtLTnJRbkJS?=
 =?utf-8?B?UFcxNGphVnBHeDhYYlY1czF3K09uekwxVlVGUDNnS2JJVkhxNVZ5NHhzNG92?=
 =?utf-8?B?NDhpL2lYak5ZbVNXRTFwYnZSTENXNVJwTit5UndmVFphZDdLSnNoTzY5L1Z4?=
 =?utf-8?B?N1ZNUElyWVdtVWRuaHlvUW8waHlDTXhkSFpwdGlSVE1nZGR4MEh4eDB0bE1t?=
 =?utf-8?B?Y0RRanZIbUx5V3lSeXIyTFMyNnRlZHZFK2x3aE5sNWZlTGlmckFoOW95TTM1?=
 =?utf-8?B?eldXNDk0bmRkamU5SDJoTTYydUFoVEFrRkdDK2d1OS8zTW5sRWMwanZSekVy?=
 =?utf-8?B?Z01tem1DL0ErOEVEOUhnZWVqMnJ4Q2NzQnoxUUgzM05BblYwQUZEam5uTEVQ?=
 =?utf-8?B?NWhYUVNSSVQxQjAyMkFhM1NDRW1TQVBsY1B1RU1oWnBndXNaa1RwNnpVUGJj?=
 =?utf-8?B?dEZBNVJPKzBueml6S1MvcmVxa1lwQTBXelNFVnBFQktCQnU2V2p0QllDMTVC?=
 =?utf-8?B?NTJOaVdnY0FhMjRvSE1hZXAzQVhmWUxMYXk0N0hnWGNpQUMvT0hIQ0lRSHRL?=
 =?utf-8?B?U2tVNVFQUVVmRWpvMm1yK0xndkdTckFFTU9VZjVtOXNidkk5eTZoeEs0TzZk?=
 =?utf-8?B?T1pyVG1ud1hINHM4NC8vdzliWjRGTjhnVFNvSklhZllCTU9MOGVLV0pNQVBa?=
 =?utf-8?B?Z1BmaTBhTlNKQnFJdFJ3QjBaZDJubzVweU5ScCtwSWJmYk9henVwQ2lCWlM4?=
 =?utf-8?B?MlF1eCttc1JQMXA0eGx5MGNENGFKSUNoaWlZQ2xQdjI3VnJUQTJTQW54L2dn?=
 =?utf-8?B?aU9iRHdvTUtmQkw5VWM1d2UwelJzMmJzL2JyZ1A3SG5xRnhJMmpCNTAwM3Nj?=
 =?utf-8?B?NXhFaXRGczJVQ1hoaXZnYW5FVVZrVlhwbk5VaXY2L3JVSUwwRjVueGkwRFJl?=
 =?utf-8?B?MEJSM0xGYTRsRjRSdit6NUV1NFVoQWtqcWZIeWJTdG53bk1HZlVuMHJWUGl6?=
 =?utf-8?B?alNvVlZWT2J1OUNVd1ZhM2M5RHdzZW92Z1BPMFdTcXMzd3lpMHpURi9zbXJ3?=
 =?utf-8?B?NWVITmpDR1lnaXlCb2grZ2RNNllmdnk2c0kyZk9OaDZrQmIvb2wyUlAvbUdx?=
 =?utf-8?B?VWx3Uk9ZMHNuYzBTbk5XWjlhS25YWHZiZXJnVk9GdnBSYlZ5QWpHcTRQN2Qv?=
 =?utf-8?B?SkI5ZnJsdHoyM21Kdk9pTlJqOU5IUURxSCthRlVwelc1K1JxdU5uZW15T3VK?=
 =?utf-8?B?S2FOVHdJc1JzaFBWSDI3VDZtZWtiSkJNQzhUOTk4V1AwQVh6VWVTcVdUdi9h?=
 =?utf-8?B?NTMrZHZkWCtHTTc2ZWRsRGhjbHdCYjJrdmpleUhJa0c1RWVlMVB6blVkaGFM?=
 =?utf-8?B?Sm1mME5Ba0ZxNjB4RklUUUFsc1NJQlpKaXNNbm4rMWd6SFJ0enRtdFpaNXVZ?=
 =?utf-8?B?TTZlQlJuUmkzUUxRaVEwV2g3eWhSLzlTU3hjYjRpSlRvQTRTaU14VjgvR0wr?=
 =?utf-8?Q?2MDHa8VOmqbcUSTOTt/j+iDkF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca65eec-d225-4998-0420-08db7c8680bf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 12:02:13.2517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: en5PWDRw2Jp1xouxjhetM12t511DZkSj5ZH+dZd+zMBHn4vCeqI3wa8Nq92MmY5KZ7wSaLUN14UaSVfQoat3bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5387


On 04/07/2023 12:47, Julien Grall wrote:
>
>
> On 04/07/2023 11:36, Ayan Kumar Halder wrote:
>> Hi Penny,
>
> Hi Ayan,
Hi Julien,
>
>> On 26/06/2023 04:33, Penny Zheng wrote:
>>> CAUTION: This message has originated from an External Source. Please 
>>> use proper judgment and caution when opening attachments, clicking 
>>> links, or responding to this email.
>>>
>>>
>>> From: Wei Chen <wei.chen@arm.com>
>>>
>>> On Armv8-A, Xen has a fixed virtual start address (link address
>>> too) for all Armv8-A platforms. In an MMU based system, Xen can
>>> map its loaded address to this virtual start address. So, on
>>> Armv8-A platforms, the Xen start address does not need to be
>>> configurable. But on Armv8-R platforms, there is no MMU to map
>>> loaded address to a fixed virtual address and different platforms
>>> will have very different address space layout. So Xen cannot use
>>> a fixed physical address on MPU based system and need to have it
>>> configurable.
>>>
>>> In this patch we introduce one Kconfig option for users to define
>>> the default Xen start address for Armv8-R. Users can enter the
>>> address in config time, or select the tailored platform config
>>> file from arch/arm/configs.
>>>
>>> And as we introduced Armv8-R to Xen, that means the existed Arm64
>>> MMU based platforms should not be listed in Armv8-R platform
>>> list, so we add !HAS_MPU dependency for these platforms.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>> v1 -> v2:
>>> 1. Remove the platform header fvp_baser.h.
>>> 2. Remove the default start address for fvp_baser64.
>>> 3. Remove the description of default address from commit log.
>>> 4. Change HAS_MPU to ARM_V8R for Xen start address dependency.
>>>     No matter Arm-v8r board has MPU or not, it always need to
>>>     specify the start address.
>>> ---
>>> v3:
>>> 1. Remove unrelated change of "CONFIG_FVP_BASER"
>>> 2. Change ARM_V8R to HAS_MPU for Xen start address dependency
>>> ---
>>>   xen/arch/arm/Kconfig           | 8 ++++++++
>>>   xen/arch/arm/platforms/Kconfig | 8 +++++---
>>>   2 files changed, 13 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 70fdc2ba63..ff17345cdb 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -181,6 +181,14 @@ config TEE
>>>            This option enables generic TEE mediators support. It 
>>> allows guests
>>>            to access real TEE via one of TEE mediators implemented 
>>> in XEN.
>>>
>>> +config XEN_START_ADDRESS
>>> +       hex "Xen start address: keep default to use platform defined 
>>> address"
>>> +       default 0
>>> +       depends on HAS_MPU
>>> +       help
>>> +         This option allows to set the customized address at which 
>>> Xen will be
>>> +         linked on MPU systems. This address must be aligned to a 
>>> page size.
>>> +
>>>   source "arch/arm/tee/Kconfig"
>>>
>>>   config STATIC_SHM
>>> diff --git a/xen/arch/arm/platforms/Kconfig 
>>> b/xen/arch/arm/platforms/Kconfig
>>> index c93a6b2756..75af48b5f9 100644
>>> --- a/xen/arch/arm/platforms/Kconfig
>>> +++ b/xen/arch/arm/platforms/Kconfig
>>> @@ -1,6 +1,7 @@
>>>   choice
>>>          prompt "Platform Support"
>>>          default ALL_PLAT
>>> +       default NO_PLAT if HAS_MPU
>>
>> I am a bit concerned about this as we will be introducing R52 
>> specific platform in xen/arch/arm/platforms/
>>
>> (For eg 
>> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/platforms/amd-versal-net.c 
>> )
>>
>> Thus, we will have to remove this line at that time.
>>
>> Can you remove this line, please if it does not cause any issue ?
>
> From my understanding of the discussion at Xen Summit, most of the 
> platform specific code would be moved to something similar to 
> bootwrapper.

Yes, but I think bootwrappers are now deprecated.

At least 
git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/boot-wrapper-aarch64.git 
does not seem to be active and 
https://github.com/artagnon/boot-wrapper-aarch64 looks archived.

>
> So do you still actually need to have code in Xen for setting up the 
> timer?

I think we can ignore it for now.

Just for information, we are using the platform specific code to achieve 
the following :-

1. Set up the timer and CNTFRQ

2. Set up the secondary boot address and start the secondary cores.

- Ayan

>
> Cheers,
>

