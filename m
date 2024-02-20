Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E3B85BFC4
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 16:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683591.1063186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcRwu-00037c-V7; Tue, 20 Feb 2024 15:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683591.1063186; Tue, 20 Feb 2024 15:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcRwu-00035A-Qn; Tue, 20 Feb 2024 15:22:24 +0000
Received: by outflank-mailman (input) for mailman id 683591;
 Tue, 20 Feb 2024 15:22:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7zC=J5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rcRws-000352-M8
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 15:22:22 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d69375db-d003-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 16:22:21 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by BY5PR12MB4324.namprd12.prod.outlook.com (2603:10b6:a03:209::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Tue, 20 Feb
 2024 15:22:14 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::22eb:b0b:62c0:f3e5]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::22eb:b0b:62c0:f3e5%6]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 15:22:14 +0000
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
X-Inumbo-ID: d69375db-d003-11ee-8a52-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXfWUbgO0hHS0YdZa1OnXX2Z/3j+kvse4ByVQ+X0yqMKCwQG5b3x0OkTTiOGQmNLI0qwljVOPwK7P0lbtvJNk7cBhSizAjJhk9iulYB2v5YKIDLnyRgYRr78+CSDuW4uzu6VgSjxBv6m65qpvpqPf+POJRroni2DdZ+mmbU+4AcNrBN4aLVAdVTPPah9C4BK6fX9pvFQ+JFr1QrNQJGMGHIKzFzqAA+O27N34F0gPPUrgC16wJQW86/L3DWOZc1sGXl0A1fAIpCioGyvj+M9v9QkNr0PnXdRxwfZNrEO7GTdNw77sHuAVLuTNnCv+k+0BOtuRugP+BSeH2362HtY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cT26UHKv7tMDiRIIHmrwq2RY7bBETYsV5OnSwpm1rxI=;
 b=NcQOuR5rkAmRjB/W8r7umRJFMRkbqxR7W78forBZ5BHg7kZANQsdazkV2zI+5WKypw2Tt+u7s1EN248XHU3JJ6N8Qa+DRGs27ADmmGAt1PCJ64YobEz8/Wfxs4i2XOfc+SScUm1DOsJ7KVkMONtT5PfIiLqZDKrYp0zZLJj6iwJnu4Zu3z5B/7yiuvWmZB4LsHv0DgpaXlomNuezrAMTaclHysjbEahdVS69I1Ag/uPA3EUYaGaJO8LN+q4Viv0jE5j93cxPbjtQLDbKE+eABQ/bek60Q8Zw0j3/HK9Cl1qL0rUJu2sGBNEByNR0u49AQ82NhWrQMHmbWKp1SfEobw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cT26UHKv7tMDiRIIHmrwq2RY7bBETYsV5OnSwpm1rxI=;
 b=jGLjxqGYJHUWMjlrpASYghlkpr/K/Ip6Bcxtl2HAprap0ql9e3iuo1haRmIZqN/SMhQxRfpGBBK6RX+IXb9Too+8Bdi/YPpkkal3SnWhBCpVHqQjH/vlDgJfsbP8dnxJcv35h/pN4dmIhFfF+BQ4wPPGeNC7EtsSCD/UgKmpu9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5f526deb-7376-4c34-85d1-d22b1b14d90e@amd.com>
Date: Tue, 20 Feb 2024 15:22:09 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v5 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
 <20240220121743.3680715-2-ayan.kumar.halder@amd.com>
 <e3a8ce5d-841e-4ff1-8d23-48de822972ef@suse.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <e3a8ce5d-841e-4ff1-8d23-48de822972ef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P250CA0009.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::14) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|BY5PR12MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce0d645-b553-4183-3100-08dc3227b78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iD2n98dwVvdhdcNyhimFPdGnxRIgZLQ43jut9y1fv6j8ZtQxXnHWBpsDKzzHddiR6rdUQnWfwra+HA3fvqKljJOLfjs4aX64ICN9HGa9FS7IOZc/vpbs7O7IZ62tX8yTIU3gFb0H2Fqxa687z/EAxLg/enoIEw14mNUQAq9S7eHrdtOoHjLwLzg4FcJUm1EYv08ouFG5+RIRB0Y4r0D+wfVoc9BeDMZfkWT5n5GbJdKWNwlAyr/5YdAzHZmYXzIIoEgBSqeXQPne8KjQ9iJUO6WWCJlsJ+cFp6FjNus4DpA+QkCp62AFETfnoMvVLfSB0HbV6yLTL9dlpfgUoDPovahkjmdX/RCbmI4k+bFd3Xv+BS9qUtHDkl1Kpb0ZiP0+E/Ke/NSRTW/06YjqAUoof7SprEReGB6spOqYnFyhsWA2kjEoDnrSUQ8hMLL5CEHM6/eqlKUx5KwTKeKY7wDRhgmbQou19Ey3WreJ7A5TY9vZPddrehvUoXlcy/E6HSpwwiPWCDglJp5DebYsajE1e4Jg8gut1qFBJBVra7edWN4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDZERnovNTV1UzVrb051TllnTkJpNGJVR2tJUklNQmRuN3FuQWtUaHZ2Qkd2?=
 =?utf-8?B?cGhKNmxSTUlacnFmS2xqczZ5N3VlYzk4N0l6Z2dlZ3Jvd08zT3p2R0VXbDZx?=
 =?utf-8?B?dDQ1RWwxQXdEQ3p3by81Rng3RmxBR2s2MXJ6eHlhb2N2bFFRL2RIZThacW1i?=
 =?utf-8?B?aTVHYXRVMEE2RjVaNFQ0UHgzdzVpS0ExTERvYnBPRTFmVmpOMm83M3NCSE1u?=
 =?utf-8?B?UDdmK2F5K2l4VDRZMjZ3dTdqNVNUUjk0SXB0TzJMSUpzSTJ0MEtGUWZWMnhT?=
 =?utf-8?B?T21YZVZySnp6OEkrUWtXL3dhQU9salZ0QUFZNjB1TFVUSFhUbE50N084WmxQ?=
 =?utf-8?B?dXVybG1NaUVxL3BmZXlRdHpUQjJIamN6ZlJaUURleVBEUjBIVHU0Qk9YWmVO?=
 =?utf-8?B?N3daWjhvelJieWR6dUwxZHZZWmI2YURvNENRUU1aN1ZtWXo0em1KVTBPZlFH?=
 =?utf-8?B?aVhEWXQvUmdKQWdKZDhiR1hQUmdCWEs5Z1RqenBZRjZSakF4bTlubDl6N1Mr?=
 =?utf-8?B?ZFpCVHZuWmRmWkNBWHZqRW5JV1dTMkpvRDljTGEyc1FuaEU1ZHZCN0l2VW13?=
 =?utf-8?B?ZCtVZkZETjM5a1RLWnc2VTlvdUlWRnNVaDFxRkplMzZzR1RvSWpWMk9WRW5j?=
 =?utf-8?B?TStQZHMvRVY3NGlsTURSaENmNFhJcmo4QnFpMTVzaUdDR2lnclNqWVJGc3ln?=
 =?utf-8?B?bzZhSFUxTWxhTDkzcU01RmQvZlVXZ3dNSWdyUG8wMklPMTFSdlZTYkp5dVVC?=
 =?utf-8?B?aHJrL0o5bllqa29NTzk2VE9vT05zalRxY2djenVUdEw4eTM3YUtxT1dyWDNz?=
 =?utf-8?B?UlVubnZuOGc2UzdtY09RdGJJQ2NWampjR3NvTE5uckxCOENHd1hLcVc5VXN5?=
 =?utf-8?B?V3llYlI3WVkyb04xWjk1dExiTWN1S3VUdkZCMGg3a242T2RIamxKcFkvc0dT?=
 =?utf-8?B?T2VLYUI5OExWT3Jmb0lCb25ObmRBVlora0NleGhtMmsxRWVlcGVuNWNKZ0RK?=
 =?utf-8?B?bGZLelhrek5BblFoVUgrOCthS2MxT1dIM2FyNUZxdGRpMTMzZHRZaWNzRnhm?=
 =?utf-8?B?TFJ3ZTkrOHNJRjVEUk9DZlVUOVFPaUNWQzZMTSs1Y0JDWWo2N3MrN1U1bU93?=
 =?utf-8?B?dEI3MUtkaE05VExYTVRxa0Y2ODJMSGF0U3ZKNFNpZEVaR2dxQTFQbEl1SnFP?=
 =?utf-8?B?c1Z1MlBjZDhhRmUzU1VrRlRaQzRXZ0lOU2hnZ3ZxUk1UZTFSeWh4WjRsZTF3?=
 =?utf-8?B?SUlJbUhEY3pBMERHaVQ1bjZ4cE1ZNjdyVkN6MlEraEVENGhFa2djNGdiTFFj?=
 =?utf-8?B?QkN4SXBGTCtBM25DZUpXUG00dDVaQzFLUU5GM202dVFIOThxaERjUVMwQ2lM?=
 =?utf-8?B?dzVPY2w3Z1ZRUG1ScFpjV0dqVGlNazQ3cWpwZEJkeGh1ZlhScGlQUEdWSWlU?=
 =?utf-8?B?bnVjTkFVNldPUzRTa2lOSVMvTjNjQUg1SXR2cDdRSitGcmhkZ0FOOWZSWldt?=
 =?utf-8?B?cUVXMmlFcDd5ZmdLSkNQeVFxb01oaVNLMkxHeC9hZVU5bkhnMzZPY3dJN0xa?=
 =?utf-8?B?OER2Q3ZXbUR1QUdvRDdjei9CMitSRmttcW1pTjJTdFFLTmY2ZmRPeDJ1ZXBu?=
 =?utf-8?B?U0tFNklxRWpEUGhoWklYU0RRVkpNVmh0cGgxNDFvVDRpSms0czcyTnE1MFZQ?=
 =?utf-8?B?NWFrZlZ4cFFpRWVuY2ZpczJRS01DdUpvM09veG9hN3llVkRLdy9DV0tnTG5H?=
 =?utf-8?B?RUJ6ejFUZDBJc3ZtVzhGejhFdnQ2NnBQMzhlWWNOUVhVM01LQ25zTkg1Mysr?=
 =?utf-8?B?blpLaHBKVXM2V1ZiellXV1djOGhwNnZOcnp1SzZ1T01rZkNMSFB5akFZTzV6?=
 =?utf-8?B?a3kvb3VPUVdLVGdPMlo5ckIrOCs5SEsyamVtV3hKQm1rV1AyVU1kb09zdnFm?=
 =?utf-8?B?UWZYYmsvR2xhSGVEblcySjJBeXZYbUJwWStlRUx4RUpLeTFlMkd5MllUenkr?=
 =?utf-8?B?Q2tPTks3Mm5SYVZmYlEzMEpHSUd2aHRVSktWTTAyQytCT2VNQytBTGcxSDNt?=
 =?utf-8?B?WWdwR2l0RmNaMGFFTjEvaG5WUjZaYnV5MDhJTFZiRkt4WXdtUnFCOW1vbGRC?=
 =?utf-8?Q?JJBXykXGn4JsoPjA6+l3wWQBF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce0d645-b553-4183-3100-08dc3227b78a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 15:22:14.5305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mlsgQpsJOPqWBlmbjbT6jHIcSU6GAZDshaISLSwVPuzj3vPtuiHD9lmsdzxUfWbbRpquRBz99borctS/30PeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4324

Hi Jan,

On 20/02/2024 12:33, Jan Beulich wrote:
> On 20.02.2024 13:17, Ayan Kumar Halder wrote:
>> There can be situations when the registers cannot be emulated to their full
>> functionality. This can be due to the complexity involved. In such cases, one
>> can emulate those registers as RAZ/WI for example. We call them as partial
>> emulation.
>>
>> Some registers are non-optional and as such there is nothing preventing an OS
>> from accessing them.
>> Instead of injecting undefined exception (thus crashing a guest), one may want
>> to prefer a partial emulation to let the guest running (in some cases accepting
>> the fact that it might result in unwanted behavior).
>>
>> A suitable example of this (as seen in subsequent patches) is emulation of
>> DBGDTRTX_EL0 (on Arm64) and DBGDTRTXINT(on Arm32). These non-optional
>> registers can be emulated as RAZ/WI and they can be enclosed within
>> CONFIG_PARTIAL_EMULATION.
>>
>> Further, "partial-emulation" command line option allows us to
>> enable/disable partial emulation at run time. While CONFIG_PARTIAL_EMULATION
>> enables support for partial emulation at compile time (i.e. adds code for
>> partial emulation), this option may be enabled or disabled by Yocto or other
>> build systems. However if the build system turns this option on, users
>> can use scripts like Imagebuilder to generate uboot-script which will append
>> "partial-emulation=true" to xen command line to turn on the partial emulation.
>> Thus, it helps to avoid rebuilding xen.
>>
>> By default, "CONFIG_PARTIAL_EMULATION=y" and "partial-emulation=false".
>> This is done so that Xen supports partial emulation. However, customers are
>> fully aware when they enable partial emulation. It's important to note that
>> enabling such support might result in unwanted/non-spec compliant behavior.
>>
>> Added a note in SUPPORT.md to clarify the security support for partial
>> emulation.
> There may have been prior discussion of this, but I view this as too little
> to justify ...
>
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -101,6 +101,18 @@ Extension to the GICv3 interrupt controller to support MSI.
>>   
>>       Status: Experimental
>>   
>> +### ARM/Partial Emulation
>> +
>> +Enable partial emulation of registers, otherwise considered unimplemented,
>> +that would normally trigger a fault injection.
>> +
>> +    Status: Supported, with caveats
>> +
>> +Bugs allowing the userspace to attack the guest OS will not be considered
>> +security vulnerabilities.
>> +
>> +Bugs that could compromise Xen will be considered security vulnerabilities.
> ... the odd statement regarding in-guest vulnerabilities that might be
> introduced. I see only two ways of treating this as supported: Either
> you simply refuse emulation when the access is from user space,

I am wondering how do we enforce that.

Let me try to understand this with the current implementation of partial 
emulation for system registers.

1. DBGDTRTX_EL0 :- I understand that EL0 access to this register will 
cause a trap to EL2. The reason being MDCR_EL2.TDA == 1.

In that case, if we refuse emulation then an undef exception is injected 
to the guest (this is the behavior as of today even without this patch).

So, are you saying that the undef exception is to be injected to the 
user space process. This may be possible for Arm64 guests 
(inject_undef64_exception() needs to be changed).

However for Arm32 guests, this may not be possible as the mode changes 
to PSR_MODE_UND.

Let me know if I understood you correctly.

> or you
> support that mode of emulation as much as that of kernel space accesses.

Do you mean we support partial emulation only for traps from EL1 mode ?

- Ayan

> After all "injecting undefined exception (thus crashing a guest)"
> (quoting the description) doesn't seem quite right: If you inject such
> an exception for a user space access, all that ought to happen is the
> user space process to be killed.
>
> Jan

