Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEC06EE49C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 17:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526112.817598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prKPf-0005VU-SB; Tue, 25 Apr 2023 15:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526112.817598; Tue, 25 Apr 2023 15:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prKPf-0005TQ-Or; Tue, 25 Apr 2023 15:17:03 +0000
Received: by outflank-mailman (input) for mailman id 526112;
 Tue, 25 Apr 2023 15:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZje=AQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1prKPd-0005TK-PY
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 15:17:02 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 388ac32f-e37c-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 17:16:59 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4122.namprd12.prod.outlook.com (2603:10b6:5:214::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 15:16:55 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94%6]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 15:16:55 +0000
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
X-Inumbo-ID: 388ac32f-e37c-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=De0SWQ46NhAkP38E+724XomMfKf+K4Y5Ic6upz5SV9EVzUXGZaOCgcbtMX65ZtOpoWlCpuq/Yk9PIDj5NvdCkjnlcFWVeL0TjxwYfaFij9761bRpAtQctriCTT7i5bcJ65ARoL9xrFg8VSxRQMh8rmp9+e1Q+yx4MKeA4tLtYHPoBCYbBEkgnrhZ+Lt8AG40Cr3UmSnz7tJnkv4H7QICLtdkDsjiz6SDgnxrP9ZJX2lTFlgMrjIlKmGXe0PlLL1eVodh+JH9an4H6vrJvsOpCbBCXeHr7vqaBDuJ33pgJFzrozf2eVn8luw05CdGUrobWDNUHIFCbAt7DgrQ0u55vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYGHV/hRW7GqSYNHjy07zg15yi8nYQ0nD7DMX5uMqCI=;
 b=BX+/G/msmIzqmA70coqWGof5Q3mVajR79NW0lfpvXhsVqorbaPq7KXeBoDEiFL7Gt1+MvHufay2PRH/IQweCWyjQ3ndxc2MR04ldQ8rghlkbAKkung05RzxsKDtLwOQc+3FCfHMaYd5vGbeVjw0C8qDM1JR+V2ipaDrop70ZLp54NwdWPr3tpBbepB7+cEi3V9ZEVpVrpUaUpcKxLjsxg6c4XZLsDVLYb0ZufEy3qfxUJEWkawhGGV8Kdv6S6MGTNFNYfsMWhhATxtC/egCYAbx/8cwZuozwNz9BIJOjZVWnTTUAtO+i9YAj2JO8AZxtEGX4Wv5OpxT3stojlT4dDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYGHV/hRW7GqSYNHjy07zg15yi8nYQ0nD7DMX5uMqCI=;
 b=ArWoWCS7bcR6y6LlloIg8HqOylsDWyxmcWSeT5cCPLl+o651ipEoDROYIw0JwdHJVstU+8cTaPkRtc6m7MGb2TP+h1DrJVhVMhKHo9z/EKE5QSd2znFpixZnV5eSmhKkuI3GZtxYjQUTn//McuB+BslPi6Yjhq6dn0+uJbFWZcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ad2dec59-d35f-3edd-b928-5005b47ebff7@amd.com>
Date: Tue, 25 Apr 2023 16:16:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v5 05/10] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-6-ayan.kumar.halder@amd.com>
 <ca8fd34c-3755-161d-38c1-651cf08ef589@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ca8fd34c-3755-161d-38c1-651cf08ef589@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::18) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4122:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f0eefc6-38bf-4612-82b0-08db45a01b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5rD2bhCwI5UEpXNN0DJnU2WB83VVgTP1GBetjR/bd5pAqTu4tT/DdqejRIKTxVpb2PHD3EC6/DXkOhOC1IDX7NIvbFvKChJqxYHpnCMssTdlQvLel98ixkLPyG0PEhXIBMTPmXKwrISwFbK1b9D3OGX7SlreMGQjUqOk4o5VDKVYxoUoboAhvmD34XiUc2QfJatzcoNYaRUwIsbEGxjdWRw2idA3RnId1+tlXeyZ9C+6tXm4Fa95U/ZyjwqWGHJc5E9mMn8AgwaZ4osxP3CIBGUld0M1plbp0zw4ZsJi9XyJ0JLx5yNZHSJg0rCv9Ii3spy+l0pobb467iofkqUrp0w8F5wYkwVoMXIEIXV6GjmiSQV9BxMg6m1ekzc2l/gnK3BDH0B6MkvG0akGELZ+Y4qRHovlsx+vPIgO+ydcGuNktWU/BJBriqwCjGFpaPKzQRtOZ2fEgq3FwiPpbsSF0Tt5a/X1L7PFp4jHB9SpD6BCm69qEwBp/G5CgO6iEAi+nWz4RTqtNaRQmtZY2gJyNfCUN6pwLJTuNhdsXYb/wpkzucoJDZYkvciWaSQ4EaI+f/29eCSAB8UxKTULUTL0An99PNhm84qrN2vrqbDBfmRydWru5ik9uazLhn6952S046TeOwcPPc8AtoguULSPloI9TfmEAQ3Ph6lUpy2ANhk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199021)(6486002)(2906002)(6512007)(6506007)(2616005)(6666004)(186003)(53546011)(66946007)(66476007)(8936002)(8676002)(66556008)(41300700001)(4326008)(316002)(26005)(478600001)(7416002)(5660300002)(110136005)(38100700002)(36756003)(31696002)(83380400001)(31686004)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1RscVFqQjBLVHB3bGhjdllGRHcyeXB5SGZDRGxmRlN0ZWZ3ZjhzU0dUMmNs?=
 =?utf-8?B?RFA0OTJWa0hIZGEyN0VlRUl5TFRKd2IzYzA4WjlpOTR6ZE9odmkzdHBBSUNB?=
 =?utf-8?B?WUxCbUlVV2hiMFBNYkVVSkhuK0VvTkxVbVFqalAyQWd1b1NkL0ZrQ3JuaGM4?=
 =?utf-8?B?Vm9BUjlSMGlhbGRJamNTKzQydVpnZ2pHMHdnNUJCR2dubHp0YUk3aEJLUEVN?=
 =?utf-8?B?d1lyYmI2akQxdi9hcWl4M0k4OVFUV3JoSk52TUJBb3l6RDNjVk54K2c0ekxl?=
 =?utf-8?B?NWRvcGJaQks4M1FQWC9Cbi95QzR2a3A4VW5qN0l5S0g3SVlFK2ZYR0l1MDcy?=
 =?utf-8?B?WnZ0aFZESWdlWStYTkNNU0lzR0puT2pHbk1OcnRCdERzNmxzazJrVFlZMHd5?=
 =?utf-8?B?SFNIbUFleUNRY21kdkEweXUvbXNxWjVYUFp2OTk4aGRFOXExNVFDeDR4QjdB?=
 =?utf-8?B?TU01eCt2MHFOR0djOFM3YlNDMTFNOWl5UUxITkROSFBaMnFsdWwvdVplV0ZP?=
 =?utf-8?B?RktpbVc3eE04Y1lGSlplcTFyaS9IRUtqdGE4SGxOMVN1U290ZmtNeHF0Nkhv?=
 =?utf-8?B?Uk5aZWRxL0V6UnJtbzFCZksvZDdDV1Naa2JNWkhTYkVyZERFcGRtVEZ5SGFB?=
 =?utf-8?B?Vnpqa0lyQUFwRk9ZSEZrL0k5MEpmbUg0QzBHQ05ScFphS2tvYkJPYUtSVm5y?=
 =?utf-8?B?ZkZ1NHY4MVVNbSs2VWtBRDZ2S3hHOVBxMVV0WUFaL0ZUM1cvcEhIVnFWdlhJ?=
 =?utf-8?B?ZmJFVUdadFBlUFR4anI0SG9tOVZscFMycWJQYk1HU3JkL1JBa05iRWVGZ0d0?=
 =?utf-8?B?R3dHUVhKSkhISUwxVktqSW9UclBObGhiMWViZXhHeUdaVzRodUczdDV5MTl4?=
 =?utf-8?B?RzhjSEx6T3VJZk80SXcxcFJZa1ZxdGpjQnNOVzlsYXlkaVk0THorWTY2a2hW?=
 =?utf-8?B?VVBKeUF1MkhUUVM2UHNFVDlzZXpmSGM4eEZsZStmRDlWNDQxaUw1ZzQ1WWk5?=
 =?utf-8?B?Yjh2RCtQUjAwekhEblFwUEp5WjB6U2pMYVJ4eXNnTVZEMkhMMkhLVmpYYXVX?=
 =?utf-8?B?RTVqQlZhM0svblJ4M21iRjFUNjVGS2lsQnJnN2src2w1VXIzdCtqOGtRRVpK?=
 =?utf-8?B?RkphNUY0cWxYS2hWbG55Z1hHakU4Tk9nOXVsVmV0K2F6cHpBMEY5aEFjSXRm?=
 =?utf-8?B?ZW1RWmt1dnIrRzR0UkliMkJqRXZlQm4rU05OWE5RL3FNSDlic3cvZ0JaWG56?=
 =?utf-8?B?aFNEOC9ZOXNQcStJUndJTzkxQW5nakFsSm5kWGxFQUwzcWJFcEVmZE81ZDQx?=
 =?utf-8?B?dEtlV1l5MUFZT2tmRk1WUUpqT29CUkFFY1YzbkxEWHcxUGlwT2xRcXBtM244?=
 =?utf-8?B?WFZDRjExTk95R0xlS3o2S3cxKzBrbmEwWk85elo1R1AwbW15WG0zS2VoV2dY?=
 =?utf-8?B?aGwrUHUvNVRlZG1CL2d4bmxpRHprTzBRbk1xU2E5TmptdSt5anpKOTByVlV1?=
 =?utf-8?B?RnRKOGFWSGVIS0g1TmViL09ML2VTWEpVWk84K1U1cnRROEs5RzBUUytNZE9j?=
 =?utf-8?B?Z2NTWTMyVmJtUTIrVUZlMS9vTXJPNDBYYVlxTU1NYmN2bTdzODc2eEt4clVP?=
 =?utf-8?B?R1F3TEJ5ZElpZVJhcTcxL0xFcDZzYm9hMGU1N1dsZTJZa0ZjQXNUZndveVc3?=
 =?utf-8?B?eTJkbkErVmt4alZvRFFGbkRZbS9tRy9QZ2prL0NXYk5yVXBqWDMwcmRROVpk?=
 =?utf-8?B?VHJvbTBRejZNVTJROHd6V3piWVpWRmw2L0cwcGUxUmgwU3owdjJDajVZcWdr?=
 =?utf-8?B?UGJTbUk1NmpNMUhxRjJ1UWJGZlZCeG9KaSsyK1ZZMVFWZkdTNDVuY1NzV1lt?=
 =?utf-8?B?SUcrdEgrLzFLYmRlSW9UU0R0bytaaHo3Vk4xemRLbHJ0L0NEOVVyMEJqZHFx?=
 =?utf-8?B?R3R3bHlSQ0tVV1dQeDRSc1VwMXMvRkxkR2FCcDl0bG5FL2JVQzg3ZmUzTVZ4?=
 =?utf-8?B?a3BmekkyVG1OSldzUXpQQ2RuZFZtdFFqNTR5ZDF4TlVHSC95RG5peE4ydTNB?=
 =?utf-8?B?bFpyYnBiMVFWR1ovU2pNR0dHVnZuVzNxUzJkUU1XelRNUUVXeHJRZmluc0lU?=
 =?utf-8?Q?Hjxxh3I6kwEJWsM+GuBALbgi1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0eefc6-38bf-4612-82b0-08db45a01b21
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 15:16:55.8198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6Oq6Df2FsOD2dgVoKwCgXj49K+QXJReRXVcXOLzyq8ogBwR08ihsrZtSshyFEGXnSMrhh4jxcNbUtfi4y4hWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4122


On 24/04/2023 13:08, Michal Orzel wrote:
> Hi Ayan,

Hi Michal,

A clarification.

>
> On 13/04/2023 19:37, Ayan Kumar Halder wrote:
>>
>> Some Arm based hardware platforms which does not support LPAE
>> (eg Cortex-R52), uses 32 bit physical addresses.
>> Also, users may choose to use 32 bits to represent physical addresses
>> for optimization.
>>
>> To support the above use cases, we have introduced arch independent
>> configs to choose if the physical address can be represented using
>> 32 bits (PHYS_ADDR_T_32) or 64 bits (!PHYS_ADDR_T_32).
>> For now only ARM_32 provides support to enable 32 bit physical
>> addressing.
>>
>> When PHYS_ADDR_T_32 is defined, PADDR_BITS is set to 32.
>> When PHYS_ADDR_T_32 is not defined for ARM_32, PADDR_BITS is set to 40.
>> When PHYS_ADDR_T_32 is not defined for ARM_64, PADDR_BITS is set to 48.
>> The last two are same as the current configuration used today on Xen.
>>
>> PADDR_BITS is also set to 48 when ARM_64 is defined. The reason being
>> the choice to select ARM_PA_BITS_32/ARM_PA_BITS_40/ARM_PA_BITS_48 is
>> currently allowed when ARM_32 is defined.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>> v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
>>
>> v2 - 1. Introduced Kconfig choice. ARM_64 can select PHYS_ADDR_64 only whereas
>> ARM_32 can select PHYS_ADDR_32 or PHYS_ADDR_64.
>> 2. For CONFIG_ARM_PA_32, paddr_t is defined as 'unsigned long'.
>>
>> v3 - 1. Allow user to define PADDR_BITS by selecting different config options
>> ARM_PA_BITS_32, ARM_PA_BITS_40 and ARM_PA_BITS_48.
>> 2. Add the choice under "Architecture Features".
>>
>> v4 - 1. Removed PHYS_ADDR_T_64 as !PHYS_ADDR_T_32 means PHYS_ADDR_T_32.
>>
>>   xen/arch/Kconfig                     |  3 +++
>>   xen/arch/arm/Kconfig                 | 37 ++++++++++++++++++++++++++--
>>   xen/arch/arm/include/asm/page-bits.h |  6 +----
>>   xen/arch/arm/include/asm/types.h     |  6 +++++
>>   xen/arch/arm/mm.c                    |  5 ++++
>>   5 files changed, 50 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>> index 7028f7b74f..67ba38f32f 100644
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -1,6 +1,9 @@
>>   config 64BIT
>>          bool
>>
>> +config PHYS_ADDR_T_32
>> +       bool
>> +
>>   config NR_CPUS
>>          int "Maximum number of CPUs"
>>          range 1 4095
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 239d3aed3c..3f6e13e475 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -19,13 +19,46 @@ config ARM
>>          select HAS_PMAP
>>          select IOMMU_FORCE_PT_SHARE
>>
>> +menu "Architecture Features"
>> +
>> +choice
>> +       prompt "Physical address space size" if ARM_32
> Why is it protected by ARM_32 but in the next line you add something protected by ARM_64?
> This basically means that for arm64, ARM_PA_BITS_XXX is never defined.

Currently, I intentend to support 32-bit physical address configuration 
for ARM_32 only. So in case of ARM_32, user will have a choice between 
32-bit and 40-bit PA.

So, if it is ok with you, can I remove the below line and "config 
ARM_PA_BITS_48 ..." ?

Then ...

>
>> +       default ARM_PA_BITS_48 if ARM_64
>> +       default ARM_PA_BITS_40 if ARM_32
>> +       help
>> +         User can choose to represent the width of physical address. This can
>> +         sometimes help in optimizing the size of image when user chooses a
>> +         smaller size to represent physical address.
>> +
>> +config ARM_PA_BITS_32
>> +       bool "32-bit"
>> +       help
>> +         On platforms where any physical address can be represented within 32 bits,
>> +         user should choose this option. This will help is reduced size of the
>> +         binary.
>> +       select PHYS_ADDR_T_32
>> +       depends on ARM_32
>> +
>> +config ARM_PA_BITS_40
>> +       bool "40-bit"
>> +       depends on ARM_32
>> +
>> +config ARM_PA_BITS_48
>> +       bool "40-bit"
> 40-bit? I think this should be 48-bit.
>
>> +       depends on ARM_48
> What is ARM_48? Shouldn't it be ARM_64?
> And if so, why bother defining it given everything here is protected by ARM_32.
>
>> +endchoice
>> +
>> +config PADDR_BITS
>> +       int
>> +       default 32 if ARM_PA_BITS_32
>> +       default 40 if ARM_PA_BITS_40
>> +       default 48 if ARM_PA_BITS_48 || ARM_64

default 48 if ARM_64

- Ayan

> This reads as if on arm32 we could have 48-bit PA space which is not true (LPAE is 40 bit unless I missed something).
> You could get rid of || ARM_64 if the choice wasn't protected by ARM_32 and fixing ARM_48 to ARM_64.
>
>> +
>>   config ARCH_DEFCONFIG
>>          string
>>          default "arch/arm/configs/arm32_defconfig" if ARM_32
>>          default "arch/arm/configs/arm64_defconfig" if ARM_64
>>
>> -menu "Architecture Features"
>> -
>>   source "arch/Kconfig"
>>
>>   config ACPI
>> diff --git a/xen/arch/arm/include/asm/page-bits.h b/xen/arch/arm/include/asm/page-bits.h
>> index 5d6477e599..deb381ceeb 100644
>> --- a/xen/arch/arm/include/asm/page-bits.h
>> +++ b/xen/arch/arm/include/asm/page-bits.h
>> @@ -3,10 +3,6 @@
>>
>>   #define PAGE_SHIFT              12
>>
>> -#ifdef CONFIG_ARM_64
>> -#define PADDR_BITS              48
>> -#else
>> -#define PADDR_BITS              40
>> -#endif
>> +#define PADDR_BITS              CONFIG_PADDR_BITS
>>
>>   #endif /* __ARM_PAGE_SHIFT_H__ */
>> diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
>> index e218ed77bd..e3cfbbb060 100644
>> --- a/xen/arch/arm/include/asm/types.h
>> +++ b/xen/arch/arm/include/asm/types.h
>> @@ -34,9 +34,15 @@ typedef signed long long s64;
>>   typedef unsigned long long u64;
>>   typedef u32 vaddr_t;
>>   #define PRIvaddr PRIx32
>> +#if defined(CONFIG_PHYS_ADDR_T_32)
>> +typedef unsigned long paddr_t;
>> +#define INVALID_PADDR (~0UL)
>> +#define PRIpaddr "08lx"
>> +#else
>>   typedef u64 paddr_t;
>>   #define INVALID_PADDR (~0ULL)
>>   #define PRIpaddr "016llx"
>> +#endif
>>   typedef u32 register_t;
>>   #define PRIregister "08x"
>>   #elif defined (CONFIG_ARM_64)
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index b99806af99..6dc37be97e 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -690,6 +690,11 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>>       const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
>>       int rc;
>>
>> +    /*
>> +     * The size of paddr_t should be sufficient for the complete range of
>> +     * physical address.
>> +     */
>> +    BUILD_BUG_ON((sizeof(paddr_t) * 8) < PADDR_BITS);
> Just FYI, there is a macro BITS_PER_BYTE defined in bitops.h that you could use instead of 8.
> Although I'm not sure if this would be better :)
>
>>       BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
>>
>>       if ( frametable_size > FRAMETABLE_SIZE )
>> --
>> 2.17.1
>>
>>
> ~Michal

