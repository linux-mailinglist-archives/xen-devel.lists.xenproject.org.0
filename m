Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ACC6C36B2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 17:15:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512840.793139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peee6-00009v-KR; Tue, 21 Mar 2023 16:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512840.793139; Tue, 21 Mar 2023 16:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peee6-00007N-Gs; Tue, 21 Mar 2023 16:15:34 +0000
Received: by outflank-mailman (input) for mailman id 512840;
 Tue, 21 Mar 2023 16:15:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1peee4-0008Dx-7G
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 16:15:32 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 985af3d3-c803-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 17:15:29 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW6PR12MB8661.namprd12.prod.outlook.com (2603:10b6:303:23f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 16:15:25 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 16:15:25 +0000
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
X-Inumbo-ID: 985af3d3-c803-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0/ITNYdkhTwfke+3LqWRsJtjkWyVy5EW9qt0wgu6/YSzRTxEA55AIu03xS5hR2YnunATN6Onv2qX1zXiIE350JDAyBsLgau5UqR0WZMqbHsPVxJmK5CwbdCmcEXqpLFFqA78NTtPbI8eUfWNJOp28RlJ6FTv7lxAFRQfDjmX+O+QCRvmvvu/PvfoPArQyKEMa09bCBhC3LrBi9S8gGZ+wQO0zwnQ+kAxy7cembP3nrgG7uqXKatESuJCPH1u6m2gDQtpKqxfft/NQrWFuPSCIjyh5mA/qoceS1B88SWcLG0rHrX6e2UfBeoEc7x/qiWQKCryp/Om2Pu6hv8Iv0trQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHtSISLH68EpiASz9hiF8dzGhW5nKhvNYPavTHkzq9Y=;
 b=kPHxI1zNY+g1wJb+tQucAMnEc1adv1s2lzhI8fr2sCsQ4A51mpURCu1A/IDqGlKQ96sZXo3SA/REsRSYkcNDctL5De/CTlgVwX3vCEU6lfmt6mtxb0QZ9ajDuIvgugv/s3Jfg1RxMKO7mYXaKquCzKDylL4MzKg1tXXkzWxOranMBexCKYTs3gROfLDGAfwG3G1FafpiJMv+fVyVuk3vaGXFRgpPqUo+T5E93pbrqX4FTlttY3ibgTuDGhG+Qtj7Lww89uwn2rt74G/o6UjLIW+cc+ZokJOmRHTSMY9uBmSXKaovt6XR8VwjonkbQNgBm7Tc2lzGX/ZmIzl096Z7+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHtSISLH68EpiASz9hiF8dzGhW5nKhvNYPavTHkzq9Y=;
 b=05CR6GgsCWZeIR851uo+c4XZ7L/eRbeXuU5aq/my6gX2+0Hwo7VLo2Uck4AMesgH4AmcEUnp+4kD5tXSCHFDu2Xq4B9utMqE0WB8Tppaczlj2vNKUC84+TXhsKPpVa0be4rqloly91yj00oYAKO2HFbu5poKbyxRssOtEHiHZ+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e268e11b-8e93-c506-668b-c5c004b3aa06@amd.com>
Date: Tue, 21 Mar 2023 16:15:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [XEN v4 07/11] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-8-ayan.kumar.halder@amd.com>
 <7d90ad7a-5daf-915c-2055-a27ca50d8581@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <7d90ad7a-5daf-915c-2055-a27ca50d8581@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0616.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW6PR12MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: 068f88f8-0fcd-4a54-ff8e-08db2a277acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MQ3PNFepoW3IzKLYDBhYSka0Vtm5IRNp3PfbJB/TEXBDlI0380jjkwgbm4yghJNd8NCvZvv109NkfnIsGAfefp9vHOj9nws/VEf+37y4daiLsc/BYwx+a4PUaa92O9+kwnQYSrk7WA1dufhfWiqDipaYMsBWRZ/YhEoIFYMT4BBR38DfIGN9TOdhpQQUPrDBSHv+MTkpvmnXkXVori+lcTPsQ750AURHRdz1rllUs5Em+Rwu3BpKc508wyGSRb5mWaDqalnwMMBZnMZA+LdcwZbN4TU+al/ShHWyx+Uzfryuu8gH+NkN7YRbOy6LFKF1TCyCiTszajHmAoHKuE4IqPKqr9mptyaYC7hX09daeDhl3Cc2o8k7YpYCkDjqsdMhGcZGGnTSaolL+NNtlDZC3wgz6dbDG+CSSTgt1Jd2g/zXPFhQ3HWttBJXJQZ58yBdb2S68Wx3IIWudYLFXgbIoVRUaaAk/4WzifVrEaVRZNRkGZ9p51k2RqY22ugb4sVbMk2xvMAJgYOVkM3Q57RnG4Zq3K+cYQ9YEvECjl4YU01OLjfK7CynCNumQcm+sTcqPHN9v1Wu5o5jVCS2tRmXu9NdugziThrUY/c0cW2JjZHym7mOF5tseU/xm0jq2daXSUcBpjK+MOzo15Iv3L7SYObeiDkL45t2dfpXu82uf3gW1bGHlFxkc9CBfp26r6IAqwLfTS8/65Fepn1mG2584OvVlsx23K3DsSAtTAO6k08=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199018)(31686004)(83380400001)(6636002)(2616005)(316002)(110136005)(6512007)(6486002)(53546011)(26005)(5660300002)(186003)(6506007)(6666004)(478600001)(7416002)(66946007)(31696002)(4326008)(38100700002)(2906002)(66556008)(8936002)(66476007)(8676002)(36756003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDA1S0hVS0VERm02S0taS3pjenNZenBhaE5OWkVtTy8vR0lzZTlMU3FNclhT?=
 =?utf-8?B?RlRrellHYmkxcjVRZVp2QjY2K3V6YUpBWityeGJaWFZZTkhDSUU0N3NHU0NW?=
 =?utf-8?B?cngvM21IZGM5U2VmakozTjdXL09WLzN2S1dRaE1mck9TUHhya09SY3BpVFV2?=
 =?utf-8?B?VE1UUlFpbTRrZDV2WHdTNnZZU1RvWE1FZ1RSeTFMSHpTSEkyaVhRc2Y1MmFw?=
 =?utf-8?B?QmUwYmF3YVhKVzhEN1Y2dzlvODNlYzd6cW5pMVJNUHZIWVhmUnJEZU9TWG1K?=
 =?utf-8?B?NUZRRHgwSjBUR2dmL3k0OE1PRFBLWEFHaVpsOHdSWUxTNGJnRUxpQ2dLcjUy?=
 =?utf-8?B?WGUrL04wMUN4eXg1b0pXK2xtdGJ6TWFrY3dHRyszU1VBMlJ0ZzZ0N0Z2TkxN?=
 =?utf-8?B?eG9aRHVLRXBOTVh5bllvUHd4ZzRKYlFDUVVZMm5TZWpIRVFsZUhjeC85RG5P?=
 =?utf-8?B?WEphYS9FY2owdUgzT2drd0RTMVU2QjZHL0l3NEJOOUkxVE9idGxQeS93eHJH?=
 =?utf-8?B?UHExQVpodXd2U2JCdlZIdzRXL0RsVU1lUmExVDJYMElncjN3bzNHNDZHUXpE?=
 =?utf-8?B?R1J3RlA1SmxyR3ZrYlU0dUJ3dFdlVU5ESG1tU1VIbVB5VnZNT09kdWdxRzVv?=
 =?utf-8?B?amVBaWFWNDBDZU9QeURwVWNrcERSelZ2UHlSQVRadFZPR0pRUkVCb2l1MG8x?=
 =?utf-8?B?WFg2WndmWlU4YzRRbXNwVW5YOTVURC82SG5meVZlMFc5WlBacVhQOVl5VGZr?=
 =?utf-8?B?bVMvdEQvUjUxTmUvWC80Qm52d0F5c0o0TjhDOVNIQ3hqRVBjY29uZUR0S1Zz?=
 =?utf-8?B?NTdNRGlJcFl6M05OL2x6a0kvMlc2L1dSZVRkbHNIcGdGeHpZNm9ZVmc3ZU8v?=
 =?utf-8?B?NXlmR0NlM3lRa00zZGswRWZLYzhheXV3WGNndEJMNnlWWngrNWsyUVZnSE8v?=
 =?utf-8?B?WGR2aEZkV0lLbXliT2JkeHAvQmZwRHYzQ2VWUTZXcnJhYUZaVnhDYmppbTlr?=
 =?utf-8?B?aUFNS1gyN3laRlJTN2t6WlpHWDd5UzFkemdDN3pGcEo0dEd4THBTbnpKcWtR?=
 =?utf-8?B?M3FIUE9rcWZ2TWtLMm12UEZHRXdDcnpnSGsvcUZmVnJhdU51aVUwWjlKcHhi?=
 =?utf-8?B?bzBJL1lpbzFvUjdUcEtIYWJLK0I5Ym54bmw4RE5vUnhneVJHaEw5NHpMaDUv?=
 =?utf-8?B?VGcwSW1waEtBdlQ2ZUNUYS9yckx5a095b2phM1N6dHdKa1l1NmhoeUt4T2Vs?=
 =?utf-8?B?TlJpeTUxMkwwUGdDNWVCTFV5d0M4OC85VCtrc045TEppYlVUM3NEZHdZWlQ2?=
 =?utf-8?B?c2YrOHcrNXNBbHcxanM3V3hEWDJWZHhONzhnWkN1VCs4U2o4b0hVc2FwQ0RW?=
 =?utf-8?B?T3Z0elJOQ2l5T3lDbEJRWERIU09MTmcvaEVlNmZzRGZsTzY4c2lGRVNpbXc5?=
 =?utf-8?B?ZFV2L0Y5eCt6UTY4VUZibno3RHBzek0rMVhHYmJGZUlrOTRKS0ZwRVh3aTlH?=
 =?utf-8?B?ZjRsVTlpUWdEVzRLays0YitjM2x5MVh3QzErU05VRTRhRjJXUFBSdVk4elBl?=
 =?utf-8?B?MlgyZk0xUFFlUUxYOCtTTUZWbnZqRTRyZHJTaXFaNER1MTZNUENvaHZoejZE?=
 =?utf-8?B?VEhNL1BveHVhYlo4bzhBRk43THdoZmlJUnpLRDM3dE9UQzhMSGNnN1EyNU4y?=
 =?utf-8?B?d01RZG1NV3VPYXp1d2EzQXBxNTI2VEFMV1dXN3VxL29tRVVxcUJlMUZVK3FB?=
 =?utf-8?B?MjN4R29lb3NjRW1kUFBtNW9HRFlLR3l1OHVNZlZacjd1S005NXhxVUdqNzls?=
 =?utf-8?B?ZFo2VjZGMVVxT3krZTFXcVh2RTV2WEkwSkF4M3NMT0JwSlNoY3FOZVZhRGRl?=
 =?utf-8?B?aXpWaWxQc0N5ZUJLY0x4TS9FbUh4b2EzMjZWaTduMUtxb1NubjhXNmlQUDU2?=
 =?utf-8?B?TDhMNWcwM3JpenpoWU05L3ErWXVrZjBycWs4TzJMUmx0OGl6UHZDeG4zOUxM?=
 =?utf-8?B?ZDZoZVJGNW1DRlZHSGNKdnV4UmtUTm5MdDdkWXhURjVKWmJPaUk0dEN5SkZa?=
 =?utf-8?B?Q3BIMTNIRS94Smd1b0NTRUtvTmVyOXZ1SmU3a0NoL29sb09tN29CTVBYYmIv?=
 =?utf-8?Q?5/dcM46Kf9BZSBcYYbL5dhbJV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068f88f8-0fcd-4a54-ff8e-08db2a277acf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 16:15:25.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTerexqoXW/hFaMaS1veLhrBNSgyE1u+aYIMuJa72+9wzbPVneuGFPVzkQWaDzFQzQWrlMlbkHNqHFNeRZxnZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8661

Hi Jan,

On 21/03/2023 14:22, Jan Beulich wrote:
> On 21.03.2023 15:03, Ayan Kumar Halder wrote:
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -1,6 +1,12 @@
>>   config 64BIT
>>   	bool
>>   
>> +config PHYS_ADDR_T_32
>> +	bool
>> +
>> +config PHYS_ADDR_T_64
>> +	bool
> Do we really need both?
I was thinking the same. I am assuming that in future we may have

PHYS_ADDR_T_16, PHYS_ADDR_T_128. So, I am hoping that defining them explicitly might help.
Also, the user cannot select these configs directly.

However, I am open to defining only one of them if it makes sense.

> If so, what guards against both being selected
> at the same time?
At present, we rely on "select".
>
> Them being put in common code I consider it an at least latent issue
> that you add "select"s ...
>
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -9,6 +9,7 @@ config ARM_64
>>   	select 64BIT
>>   	select ARM_EFI
>>   	select HAS_FAST_MULTIPLY
>> +	select PHYS_ADDR_T_64
>>   
>>   config ARM
>>   	def_bool y
>> @@ -19,13 +20,48 @@ config ARM
>>   	select HAS_PMAP
>>   	select IOMMU_FORCE_PT_SHARE
>>   
>> +menu "Architecture Features"
>> +
>> +choice
>> +	prompt "Physical address space size" if ARM_32
>> +	default ARM_PA_BITS_48 if ARM_64
>> +	default ARM_PA_BITS_40 if ARM_32
>> +	help
>> +	  User can choose to represent the width of physical address. This can
>> +	  sometimes help in optimizing the size of image when user chooses a
>> +	  smaller size to represent physical address.
>> +
>> +config ARM_PA_BITS_32
>> +	bool "32-bit"
>> +	help
>> +	  On platforms where any physical address can be represented within 32 bits
>> +	  , user should choose this option. This will help is reduced size of the
>> +	  binary.
>> +	select PHYS_ADDR_T_32
>> +	depends on ARM_32
>> +
>> +config ARM_PA_BITS_40
>> +	bool "40-bit"
>> +	select PHYS_ADDR_T_64
>> +	depends on ARM_32
>> +
>> +config ARM_PA_BITS_48
>> +	bool "40-bit"
>> +	select PHYS_ADDR_T_64
>> +	depends on ARM_48
>> +endchoice
> ... only for Arm. You get away with this only because ...
>
>> --- a/xen/arch/arm/include/asm/types.h
>> +++ b/xen/arch/arm/include/asm/types.h
>> @@ -34,9 +34,15 @@ typedef signed long long s64;
>>   typedef unsigned long long u64;
>>   typedef u32 vaddr_t;
>>   #define PRIvaddr PRIx32in
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
> ... you tweak things here, when we're in the process of moving stuff
> out of asm/types.h.

Are you suggesting not to add anything to asm/types.h ? IOW, the above 
snippet should

be added to xen/include/xen/types.h.

> (Using "unsigned long" for a 32-bit paddr_t is of
> course suspicious as well - this ought to be uint32_t.)

The problem with using uint32_t for paddr_t is that there are instances 
where the paddr_t is modified with PAGE_MASK or PAGE_ALIGN.

For eg , handle_passthrough_prop()

             printk(XENLOG_ERR "Unable to permit to dom%d access to"
                    " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
                    kinfo->d->domain_id,
                    mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);

And in xen/include/xen/page-size.h,

#define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
#define PAGE_MASK           (~(PAGE_SIZE-1))

Thus, the resulting types are unsigned long. This cannot be printed 
using %u for PRIpaddr.

I remember some discussion (or comment) that the physical addresses 
should be represented using 'unsigned long'.

- Ayan


>
> Jan

