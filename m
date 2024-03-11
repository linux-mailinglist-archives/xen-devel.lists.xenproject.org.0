Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37659877FBF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 13:13:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691462.1077439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjeWD-0004tB-CZ; Mon, 11 Mar 2024 12:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691462.1077439; Mon, 11 Mar 2024 12:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjeWD-0004rL-8q; Mon, 11 Mar 2024 12:12:37 +0000
Received: by outflank-mailman (input) for mailman id 691462;
 Mon, 11 Mar 2024 12:12:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tNCb=KR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rjeWC-0004rD-7L
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 12:12:36 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3e60ad2-dfa0-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 13:12:35 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SJ2PR12MB8830.namprd12.prod.outlook.com (2603:10b6:a03:4d0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.34; Mon, 11 Mar
 2024 12:12:30 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::32a0:32b6:d5af:9ad0]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::32a0:32b6:d5af:9ad0%5]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 12:12:30 +0000
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
X-Inumbo-ID: a3e60ad2-dfa0-11ee-afdc-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXP74RcxFOYoZ5WsbxL1BFHjDdD+rxQYaYqwVevU2A3NFoOJ1kJWmSQA7YTFOKUWGjRH7cRYwDCQlkEzPaKUF4mZswy23MBcw1JI0WBiTQsnG1KX73/Nal6lY0iHuSgnd5pY0OdGbWRA3TC16wcdFn9TBbabkAfBK1O5ycJN6XHwFWn7kQZ64P/I7aLUwBb8q31aiZFAn9QA4esXr8vzvy04H//0Ttkqae4cPMZqrGA1SrrMO8Gk1BIHxyoLiG3ucDP68zKXVV2g8eVU+H//+O1yi1LFH75rIXhx5ChR0zufZbCq8MZlY+Ap+LslO7Lxl7a65FPPiT4PlhSuYnh51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7elGRJ+5uZHqWxZOechfI8xXAJnZFubshb8angl6ins=;
 b=lfwOX9+vjuea2dQ0uEUo4wXcfBS6jdhOTxJhdZ7p6F4GLyCs9QGZWb3leIeeM/Qfs9cV4IksKUPLHALUbXfQ/SIril7dqGI96vb1p1qWvgRmkQCJSOBkWGkvkXeD+g0SAsq8jWPWK/2uGuz3vymnPuNKFh32y1EaWWQYorgFU64yS2icdlaUMW5Hoyu36wOEBUnQDUEaaVV9h/abHHBF79+OLdJVln1n2Lg3AcUUCNP7AdpBqYStkdUUD2GwOf826VNugNJgqTdT+5ZWu5ncJbCQywUzvqSXkj4KAdfbu7VUFF2YMX5q7edXHFDi9emj06uaux8CWQZUfeHf+i5oQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7elGRJ+5uZHqWxZOechfI8xXAJnZFubshb8angl6ins=;
 b=KrrysTpowxWnF9pUAfbry/GRCUBTumpD6FMokSoqfHYXWOTlvW8nXPvcnRZV31pM7TjdzV+35gZtL7RAAx+Fv9eqvKHW2HieNclRqhTn5CLAbMhPy0YnrcUVyxioWWsAppUbvJ69Iq8nkRZBjKl3rHTTr+c6Wk08DfWUkzGA+QM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bca6fc44-af57-4b64-9b97-7193e6b1b5e1@amd.com>
Date: Mon, 11 Mar 2024 12:12:24 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/15] xen/arm: make consider_modules() available for
 xen relocation
To: Henry Wang <xin.wang2@amd.com>, Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-14-carlo.nonato@minervasys.tech>
 <1439263a-c96d-48bb-bd3c-1427071ecd17@xen.org>
 <8df22d81-ce3d-4a90-8aa9-34ec66d237c6@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <8df22d81-ce3d-4a90-8aa9-34ec66d237c6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0162.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::23) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SJ2PR12MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c4f2ac-17a7-4ef4-c190-08dc41c4861d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZT3vLFTdzseovab42DdYh4je8BJ2l079b4LROtYU98je8c7etuMLmphzH9AuppiAoNuAfJqXPJ3MIk0duaL7kCr2XQ7axBig6FjjeyXZc4r49h/YR6a8OnjafBGarRG6CN+PedNVbh3qXzozWjPNxyw42fNtZuhfIfHwL+mL3pljMtlk575jZv16Q9eqw32OSyhDzbe0D+eFObnFILHCOsRtSWj9rhBBzM9c9pfadCLt5ws9x4IuuZUWRxCtrjBU2ifs+XlRk8L6IA8y5fKNiQnjAwKpn4Wy9BurkLVsYDzKClE23LyaFHo/wmasWEPNH2YjXQe0EPzFJ4NPXJ7VnEK/xu3IN0rNTj71St5tVR4XtASsVu2wujspwbWqWbG7z4YS1WKtffblLrYJGId7atRincmnRia4mtP4bnTigKsbMMWAy6FUMeYDnueBT0Du3X+5/USYULPsw1IHwOds3P5tdFYVbW0JmwuR6R154ELG8kiT3y5wFvKg/Snr8OMRsa6UoZflENx92n7H9albtK4dz8uZUnSuoIxJxNDCGhyPqeND6f2vWiSFyA1REDG/hnaVVAVrVCcqVpk57zsWDGbGu2ROSPhX86bYOJhTiscU2J+cKyFAdr49LFjf7xguL4zGf2Tg9dd027oGwsAGHY1ipJ78BZtbF6BgIfSOxjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEZjUTRRa1pLb0VlOXRMYTFNZ0pJNDUzNXpsS0FzNnNkSzJUMGtQdVNyNzZL?=
 =?utf-8?B?WFdNQVJmc2t6R2FERjVZNWtJU21zUk5nL09WenorWFJvSDlNb2ZkTVdBLzN2?=
 =?utf-8?B?OFZmeEdYVk9pUERxZStCVFFadGM2Vi9RZXBQeTc3RnJYdjZMc2NLYXFLSElK?=
 =?utf-8?B?bDBTdmxlL1VsK3owQlMrYUswdmgyTjRVVElFa3lqUmhEODM2WXZSaTRlZFRk?=
 =?utf-8?B?eVZDMWJmSDBkOENqUFk3OFFqYWsyb3RIUkQ0d3lHek5ZYkNVSHk2b2Z3UUNl?=
 =?utf-8?B?NjVkdzZ4UHZremRrTGFuR292anZRS2dRYnI5WHI4UkMza2licGIxQk9aTlAr?=
 =?utf-8?B?LzNsdU04ZG5Gdk5RblhUdmloMys0KzRsbTZ6eHF2Sk0xNGpLVlN4RGF2aXRC?=
 =?utf-8?B?T0R2VXhlTG9VZnpQaUlvK0YvYk5kMFovcUZqTUxFVDNnSGdWdTRGdWxXc2Jr?=
 =?utf-8?B?bk91aFVocGlzajVKdlNtc01lWmdJZEdUTmd4SkZueFkyWTVndWdoSkUxaFo2?=
 =?utf-8?B?djdsOXpZMUZ0ZkJEc05nNGpza0x4K1JhdUg5M1RFTUVDUGZCNDNtVXBYME9j?=
 =?utf-8?B?Nzh0SVFrYkdneFQ2YmV3dzV6UGQwUTZ0SG1RczlHMGJwQ2V6WGtOdEtnTy9o?=
 =?utf-8?B?TlgzdUpwZVo5NWRzOXV2R2xkWkpnK0Z4NkFyT05NMjVuNjFsRkxVZWJYYXcv?=
 =?utf-8?B?RzVGU1VjMkFjaXFUMGhWTHFsYzFDYUZwQXpvTkpzanZXN0tWK2VCcm1yb0hD?=
 =?utf-8?B?ZUIrUG9nekpodnFpdllNMVpGS3IxNGZkckkyeWozTGpRUWFQRG93Q2FRN0J4?=
 =?utf-8?B?T2oyMnBldFJoNDdXTU13Smk2dytjL3BJVERkWkM5Y3JBc0swcXp3aHhzUmpw?=
 =?utf-8?B?dytzWmsyKzFocVhPRVhvTUtWR0NTNkk3NXBFa0pENS81ZURuakRyZldxZHd4?=
 =?utf-8?B?bDE1WmEzUytQYSs3ZU1CZ3BDYWk3bDZyRDNvOVlkMTdxNzFrcFdITEZ6cUhZ?=
 =?utf-8?B?c2w2eXkwZmlGVnJrRnltVm1TYm1RdmkxNVFNdTZ1TXZ3WU9pTVJ6NDBGQjhD?=
 =?utf-8?B?KzZOZlZLM25jNjhtWlFYVHV4LytaUGZiNWFwZzkvdTNvbjdhY1h5YVpQQXV3?=
 =?utf-8?B?aS9DSWFLd0ZJTDNtaFVTaHNiSXl0ZFBScFFlOThENzVzTHJISWlHeXRnN0J2?=
 =?utf-8?B?djhkVHphM3E0SjV3YkQ0UmF3WnMveVlqOSt4VDZTdjlaSE1rTmdFNloxTko4?=
 =?utf-8?B?ZE5pbThZRmprRlVYOVZ6eXltVjQ2ZHFxcHBkdDIxMHJGa0JRU05oZHFhT1Zx?=
 =?utf-8?B?OXl1SjZZa0Zvb1hUektOUjI3bjB3NHNlSUVWZWNFQ2N0L2pzaDR6dGw0R2Jw?=
 =?utf-8?B?Y2dhQ042VDV6YXNkQlJoUUpaNDNkRGEzVWZWTDd0UTU1YytyRG0rZlMzYU9Y?=
 =?utf-8?B?RGJmRHhuRnZKK0NkS1hDYXlESU5BOWxUMHFQc1ZkWEdCeTdDbUNWSlcyeXZV?=
 =?utf-8?B?cVlUeG01SkZRc0NOdC92NkhlWGFqTXpxcGhxblg2aWpyR0RZLzRSMktqd0Fk?=
 =?utf-8?B?UVJhWklYSjJyQnJGMG1WTVl4ZXRHcmZERHk4N0N2MmUveXdFdjJpMFZ6NGQ4?=
 =?utf-8?B?MXYzb1ZvSlc1V1dxQTFBMnl4M1BNZ2JnTE8wN1NWcHo2S2dRWFQ0Ty96OVNC?=
 =?utf-8?B?ZGpMVmlkbmg1VFh2clNYbmdTTlpOZVdRUjNZTmxiSTdLa2VpdWZHTnFISVJq?=
 =?utf-8?B?eHJxWGNXU0JkY1g3R3JZelNtNm94a05nU2FRNkk4Z0wxSE94WEFLODlvWDVi?=
 =?utf-8?B?ZlhrSitZZVZ1aDBhTzRsbkJXWFhseVBFZDc5eTl1YnpkY0tsRUwxaUZuelRH?=
 =?utf-8?B?N3N0UTg3NlZIbUwveXU5WE0wNEJTQzRvM2luVkx2Wmdlby9vbUJDOHFOKzk5?=
 =?utf-8?B?eFQxYlFaMVFDdTR1LzVOWm5MSk90QVlvRkdjTlFvc3lyek80MzY2c3BSVVdN?=
 =?utf-8?B?UWZNb3A1a3R0SkxMUlRGOXVrL3c1SmltbVdiY0ZLSmJNcnRldkZENjNMaDZP?=
 =?utf-8?B?UnZVRzZmS2t4NWpXY0QwVXR0OTZXbktJblcxZDhzK2xxVkhhSmZPbG1lUHF2?=
 =?utf-8?Q?1ewl/J+bGSApXe9b9RjyayZEY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c4f2ac-17a7-4ef4-c190-08dc41c4861d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 12:12:30.2264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2C6PvptPf6HnsAAqeKeips5ZmahWg9aDp+s2SUOguZ0U50avWFGvMA83fc13STapU61XSBG5VVsGiNrXbj8EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8830


On 09/03/2024 06:44, Henry Wang wrote:
> Hi Julien,
Hi Julien/Henry,
>
> On 3/9/2024 6:30 AM, Julien Grall wrote:
>> (+ Ayan + Henry)
>
> (- my old email address + the new one)
>
>> Hi Carlo,
>>
>> On 29/01/2024 17:18, Carlo Nonato wrote:
>>> Cache coloring must physically relocate Xen in order to color the 
>>> hypervisor
>>> and consider_modules() is a key function that is needed to find a new
>>> available physical address.
>>>
>>> 672d67f339c0 ("xen/arm: Split MMU-specific setup_mm() and related 
>>> code out")
>>> moved consider_modules() under arm32. Move it back to setup.c and 
>>> make it
>>> non-static so that it can be used outside.
>>>
>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>> ---
>>> v6:
>>> - new patch
>>> ---
>>>   xen/arch/arm/arm32/mmu/mm.c      | 93 
>>> +-------------------------------
>>>   xen/arch/arm/include/asm/setup.h |  3 ++
>>>   xen/arch/arm/setup.c             | 92 +++++++++++++++++++++++++++++++
>>
>> Ayan, Henry, will the function consider_modules() be used for the MPU 
>> code?
>
> I checked all the MPU branches (the recent arm64 implementation and an 
> arm32 branch to my best knowledge), no I don't think the function will 
> be used for the MPU code. However I am not sure if Ayan has a newer 
> arm32 MPU branch on top of the latest staging or so using the 
> function, Ayan would you like to add some comments?

Yes, Henry is correct.

consider_modules() is mmu specific only.

- Ayan

>
>> If not, then I think the function should live in arm/mmu/setup.c.
>
> +1, arm/mmu/setup.c is a good place.
>
> Kind regards,
> Henry
>
>>
>> Cheers,
>>
>

