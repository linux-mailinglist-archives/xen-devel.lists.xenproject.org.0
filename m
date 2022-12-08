Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A71647261
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 16:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457223.715105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3IOj-0002Um-94; Thu, 08 Dec 2022 15:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457223.715105; Thu, 08 Dec 2022 15:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3IOj-0002Rh-6E; Thu, 08 Dec 2022 15:01:17 +0000
Received: by outflank-mailman (input) for mailman id 457223;
 Thu, 08 Dec 2022 15:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEW2=4G=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p3IOh-0002Rb-Pe
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 15:01:15 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25cfef3f-7709-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 16:01:10 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY8PR12MB7289.namprd12.prod.outlook.com (2603:10b6:930:56::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 15:01:05 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 15:01:05 +0000
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
X-Inumbo-ID: 25cfef3f-7709-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MY0bXqRJK/vkBbGo73yDj33BP7v1pkF3kfiAN86rR0eatfGG62fa3KsXpsuckpMkj3sJ1qbf3aNXZHEnGPxhTLKnX5xlKB22Bz3YEVLPaFggc6vr6h6PlB6Qhow0365/VLK0rGe0n6fa55ZPFd+90nil36jmm+8Ee8vKMDuxmf9WIHn4nrgwRXb6L6wUA9soP9Bn8m258sw3U2UfSNnBrF7n1II8Zm1QZ69k3seuyDbaW3yjCSfShkBczJPO7DR5oaew6j7xqmkfjUbeZuS/iGnHYPU+M8XqiXDMtMstS9d+a+Ip2d8uxZbBJl6Yc5/ZbIrZxU5u4rwp2KOoMMk69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trOoBB4zJ/Q2br93f+i3mHaJUxaW568hjl3j95QlG28=;
 b=ecz9EHd+Xyb+JapgX7dAvz/4TKm7mYv+eufjdst30NQ5czsZhn89Zqoz75kzvOyZABkBxksp73SD1qe4DvKDnyBzpUPvc91XzqFxtZG6iJ3akW5f/CaTv/vCyTD40McjedJXsNB0WsTiWqNr6E66SRJeUUDkYGLSpLftXCWSgi7aqBhXMgnbFJRR4y/GHOmWtea9bm02tamhU0QYl9AZKRCjtM+jj7p87RPfhEi0kNkwWa84Pulj+Q5VVHdtFDHsPZMF/bhOMKjNx9y1HVcXWf6gynAF3jI47qNTL4fOYRsJLXQN4jlRR2I+zx3zHw5RnpdrrNSuyMIu6KutI4v37A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trOoBB4zJ/Q2br93f+i3mHaJUxaW568hjl3j95QlG28=;
 b=kLmPY1uPyyMuCDr/VAHLRK6RXaN6cVWw4mSXiNHIorY5pD+ScWTNwUTjGIklo+3f2/FpYK8gebeNZfUoG0DTGfq6hmFOCmZH4qq54DQzVR1FtUsp4cLPqgFF3zDsnGUChD66QQyAG9v5/s1Jx9tFEzy+ouaY94Nr+hJ7zYCR3es=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <07f9eaad-05bd-6b51-23d4-f81664512f5f@amd.com>
Date: Thu, 8 Dec 2022 15:00:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
 <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0386.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::14) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY8PR12MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: e31e4dab-311e-4fb3-04ff-08dad92d0744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bLl2ycZ8GoL/7K2Y2q7e5usuWd/x3849Lqr6152a3Ijsh3eM0/rhapfWo5zTpHgLMYE+RqMMrgOcxrhUKeJN83vw9RvSzcQDItVQ8a3u7WZSw214PK28cAMZ4zJfnjFL6Xy/zfT8PiWGV1jXlaxyNP5EL5kL8Fux1p2Nrcf5TPP9mZ6wIikAPpSgWf81AePrVfG892tuylwnSZ10yeQwmjfjjfwkxlW0n9pp2NVtc6vI06TV1e3KYrju8Hx5IIgzFbqLDFDHApU/HYwIPoPkPi3ZMzWTP9cQklYOmxpkmvA707X7RqzIO7iZxxKKHUM0mFBI0WMm503/6amhTEostF3NltWxPCkRQlMBoKZAU5Wse0Kc82egLIXnUDvPZ0rNpgjHAcc2NAkaBRE+zgPQamrwADMdeQFPcywMOPBX46nhb+YuLRIjYvs68oknIbasAWlHIrZYLlXH4TIH+JW7YQneZE5smjyYYdL2CjV19VEK1W7ftYnfWuAzOiKYnMERgjPJErB0fiUWrVtugLUCYLw+Uo+oeMCS/AZcvVPMzGo1fDZWLk+oUEaP7fG5cKScZ8Cwakooye4ZL6egnkMVX6tVaGO5FZH2PWBCuclOQ42FPFL2GwS3xWBn8Sx20QGJShDYFcCxeJIIsEVMZLDICJ3n2wEts0fZ+dnhA4D2hIz7Izkn5H1OXnsZ+rBo1S4cUUId63g1NBzk6Yhyns8v0jBDnEdeZwOdVGLAuVACyew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199015)(4326008)(36756003)(31686004)(66946007)(8936002)(66556008)(2906002)(31696002)(41300700001)(478600001)(8676002)(38100700002)(83380400001)(110136005)(316002)(6486002)(2616005)(5660300002)(66476007)(6512007)(186003)(53546011)(26005)(6506007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFpRclFtNUY1bE9NMDlBc3FnbEJxWHlsZVlvcW03dWtDQnBBSmMxeWJXTkdt?=
 =?utf-8?B?UUhRbGNwdThLM2x3ekpTaXJZWFppalZncEMzS2NGblVNR0Nobm8rdjBrMG40?=
 =?utf-8?B?ZUJEV3grZzlhV3RxQUJLalRiMC9rQzNhL3J1Q2V3SVJGcGgrVzBWMGpXMnMz?=
 =?utf-8?B?Mi95UzZDZjNYOXA4N1BnRC9kNlg2dHZJUVo2YVh6enp1Y29rRnZYQUxSRmtz?=
 =?utf-8?B?SzJsOEYvZHgwL0xhcUluMkpHWGtPVlhyaGVOdUlFcldaSENKV3ZzSmFvZ3hs?=
 =?utf-8?B?d2JMNHYrNVpnUFNCTnpKYllrRDl4UHpHWmpqa3BDa0FLcDFlY3MyenpSSU01?=
 =?utf-8?B?OFptZFZzUm9xbndtRS9VcTIrT3IyS3ZDM28vU2JVdkpsL0pLQ0gwZlZKd1Rs?=
 =?utf-8?B?Q0NuampPbkhjaUZ6VG5GeWcxaE9zWFlsZmpXTlhUUm5mYmIyNnVpTjRGUzhh?=
 =?utf-8?B?ZmlzQTh4NlBQT25PcC9sWldxbmFUYkFwZy8vV2laTStZbUVvOGMyTFRtSWk1?=
 =?utf-8?B?OGQzc0c4NTlST3VYaU9sVjZTS1NzYzhDNzUxbHdLTnErSlQxcGVQc3U2SkE5?=
 =?utf-8?B?TWoyN1RLNmwrK1VUeUhTdEZNY3pyNmpMU2hCK3M1SWNkMkFQenZ3SDJKZ2VF?=
 =?utf-8?B?Q0VJUnpMWGt6NFA0YlptVUJGTEtlMHZnUmZzeWZsV2hYd0JtbDRDZzJsMk5y?=
 =?utf-8?B?ZGtrSjFHZE5rdHlQUzgzK09NM0pmckpUWWxFdG85RThuT0dhaitYRTB4bURR?=
 =?utf-8?B?NlRNMVQwa0oyOTMwTXducDgxd3d3cEVOTXFGWm5DVkJVNk5FdC9QcU5UeTVs?=
 =?utf-8?B?Q2Rid3FuM0Vtb294Uzl2a1BhemozY29zcVRjR0lLSkNaOU56S0V6TS9aNDFL?=
 =?utf-8?B?emJ4b0h5NXVoRG5GdzJJcGkwVHozdTBkNnczQytvNkNXRGQxZDVrallDSHpM?=
 =?utf-8?B?M3NGMnZjMHF6eEMvdkxROUlXSkxXUjFNZ05uWGx2MXl0d1hlUm1RU3N5VTMy?=
 =?utf-8?B?VXZjUHEwbHBEV1hJZERJYkw3YTViQXFLcU5UUnp3aFNuWG5CYWxVckZIaEds?=
 =?utf-8?B?OUd5UUVMRlZxN0pkRmdWU3phWE9Ra1NnMkNhZ0lPaGlEYjBBdUdUZUc3Mnln?=
 =?utf-8?B?UVNIMUNtVUgwZklwbGRndFdobys4T3dmZncrSVhxejRCeHc3ZEYzUkRqRmF3?=
 =?utf-8?B?MVBmMzZPdm1qcDhLTXRXYWt3UTI1KzlwRTJyQnZXQlBJNmVGLytsNTZvVlZ5?=
 =?utf-8?B?TldobG1HajV3N3U4eHdQSzY2S2k4SndRMkxFZHZGc2dJeEl1OW93c2FGZWV3?=
 =?utf-8?B?ZFFuSFRReDA4Q0ZpR0JlUk0wYmlBaitwamtYR3lZQTVDK3VmNGwwTzZpdTZS?=
 =?utf-8?B?MTEwRmluZjAvcE01WWZSdE04K3E1dWlYUTFVTk1NdjRwdFQ1VXBZdXhzRnh2?=
 =?utf-8?B?VTI5WXVYd005K3dDR2kveDNOeDNCV01wOUdxRUt1THg5eEhYT0x6emgrbWVi?=
 =?utf-8?B?K25jTndCdlFZZG9NVDYrZ0FBWW8xVG44bjA3d1RGODg2ZmxubDJCVzh2a1VL?=
 =?utf-8?B?OFhvc3lBTXRBWnhUNVRoUVdIZ2Z3SVhsTWVZdktucUpoODVScHd1VUxmQ2gw?=
 =?utf-8?B?ZU5nQ0drT01wYVdqWndtZ2xmZ1ZDdjVmTkF6V0R5czBLN2FuT09tMjdsRjBu?=
 =?utf-8?B?V1Vwdy9XS2NVS2tiVmI1dFByWXR5dWVuNjBoQXByVTZaL3hES2tMQk1zQ04v?=
 =?utf-8?B?clVhVVZMWmgzRFJpOGlGUXFRMFY2L0V2bFNDbGpoVG5tcXZDNTY0ZEN1ODBJ?=
 =?utf-8?B?R0dXQjQzYlU3TXVGMUpnVitMdWpSdk5ic0l0MmRVeHdRN3pmb3U1bzhFcXZh?=
 =?utf-8?B?Mm9ySWlEUmpZdmQvNWMycktibFIyZDZ4K0dkVlA4dWpRSVZpSUhaaUczbnJY?=
 =?utf-8?B?QzIxOHJlN1NiYlBuRFBUNnVzUW9Eb0ZuT00vUEUwbUdaeVB6ZTdTNHZBTWNa?=
 =?utf-8?B?WTl3bFVNZWFueXBJV0FaMkpnNzJkS1Jjd3c3Qkt4UklFbytwbHBOYlpra3h2?=
 =?utf-8?B?T2FZYW1HU0hSOUZCSkMwUWt4R01EdDd6MEp0cXM5dVhxdzVqMDVxQmhkbU90?=
 =?utf-8?Q?CNKfWewyCNIwhPLLuJRVU0xWb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e31e4dab-311e-4fb3-04ff-08dad92d0744
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 15:01:04.7968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEppDxtnU7TcnVnvLBjzQXRNBzaILwSG0+nv1YF4zwz1oyOarQ1LCvEimzssF9cdwKA7iQybOlsAJSAf0XQNyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7289


On 08/12/2022 13:51, Julien Grall wrote:
> Hi,
Hi Julien,
>
> Title extra NIT: I have seen it multiple time and so far refrain to 
> say it. Please use 'arm' rather than 'Arm'. This is for consistency in 
> the way we name the subsystem in the title.
I will take care of it henceforth.
>
> On 08/12/2022 12:49, Ayan Kumar Halder wrote:
>> Currently, kernel_uimage_probe() does not set info->zimage.start. As a
>> result, it contains the default value (ie 0). This causes,
>> kernel_zimage_place() to treat the binary (contained within uImage) as
>> position independent executable. Thus, it loads it at an incorrect 
>> address.
>>
>> The correct approach would be to read "uimage.ep" and set
>> info->zimage.start. This will ensure that the binary is loaded at the
>> correct address.
>
> In non-statically allocated setup, a user doesn't know where the 
> memory for dom0/domU will be allocated.
>
> So I think this was correct to ignore the address. In fact, I am worry 
> that...
>
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> I uncovered this issue while loading Zephyr as a dom0less domU with 
>> Xen on
>> R52 FVP. Zephyr builds with static device tree. Thus, the load 
>> address is
>> always fixed.
>>
>>   xen/arch/arm/kernel.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>> index 2556a45c38..e4e8c67669 100644
>> --- a/xen/arch/arm/kernel.c
>> +++ b/xen/arch/arm/kernel.c
>> @@ -222,6 +222,8 @@ static int __init kernel_uimage_probe(struct 
>> kernel_info *info,
>>       if ( len > size - sizeof(uimage) )
>>           return -EINVAL;
>>   +    info->zimage.start = be32_to_cpu(uimage.ep);
> ... this will now ended up to break anyone that may have set an 
> address but didn't care where it should be loaded.

Can we use a config option (STATIC_MEMORY or any option you may suggest) 
to distinguish between the two ?

Or using some magic number (eg 0xdeadbeef) for uimage.ep which will 
denote position independent ? This needs to be documented in 
docs/misc/arm/booting.txt.

Or ...

>
> I also understand your use case but now, we have contradictory 
> approaches. I am not entirely sure how we can solve it. We may have to 
> break those users (Cc some folks that may use it). But we should 
> figure out what is the alternative for them.
I am open to any alternative suggestion.
>
> If we decide to break those users, then this should be documented in 
> the commit message and in docs/misc/arm/booting.txt (which 
> interestingly didn't mention uImage).

I agree.

- Ayan

>
> Cheers,
>

