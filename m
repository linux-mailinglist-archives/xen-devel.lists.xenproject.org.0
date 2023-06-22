Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9DB73988D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 09:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553308.863793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCF8r-0007Ex-PK; Thu, 22 Jun 2023 07:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553308.863793; Thu, 22 Jun 2023 07:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCF8r-0007Cg-MS; Thu, 22 Jun 2023 07:54:09 +0000
Received: by outflank-mailman (input) for mailman id 553308;
 Thu, 22 Jun 2023 07:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCF8p-0007Ca-Ra
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 07:54:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f69331e1-10d1-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 09:54:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8699.eurprd04.prod.outlook.com (2603:10a6:20b:43e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 07:54:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 07:54:03 +0000
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
X-Inumbo-ID: f69331e1-10d1-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZHqKk+aWjPFR8k35AvoSShCkc7/E21WaswJJs7RumIrqxTNYCXrfa85lrE2Ba3K+wR1cqjABX0ltZikkhewnYkShF8Vlfjx8kRda2DpuXeJuwAl+eBOdTVtE4YJtgWKOxc9pn9STm6ZklLJD09Kt4JQCPkVePRXv7XZRGCoUGHh70YO9b0TVas3ZGyBdqzO2iDs2eVQP10OkKdDsrO8dMJ8pwwrF8fia8i/SCCar2sv0P0lzXlkL1Wh7L4SLum3/9n7mv1lKDaYxB2mq1AbDVVd1vTZ0JvboZYIa15kuwZMRwN/uwMC3k133Zc3P6Re4jruHxqhFpucHbtFl1c0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQs6amXBglCol8jpG9+QLdsd21Le4O76ajg1DPwKOwM=;
 b=KWyFKeFZgIk/s7l4rTbsvQvGxe0ouOBFaWThzxJL+dzRtBkJgFBrf9XhY/nmkIio9qMb1eefvueIxrx2ZFOMqlcDPGPI+/8ta2TrC9qnHXSGgawQgbjK1RVI6f6vItEnuqgNr7oH8HX0jRiU0fivccA6C4MyLc1EMHHmKxHDPHF+2tvRWOfaNtO796YywyuWu8cgFPmMRttT5010m52wblz66obIGMIPjue2uAGzsyrWRmF9vRP9r8uOr84GrzIhXIsM8BZg+JD/spATrc1w+XgzU0wMyO3nXlmKluXyYKQyZZyBRPR3PtjiM/tS9AZW7ZDsXHUxKhypvfOqJvkc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQs6amXBglCol8jpG9+QLdsd21Le4O76ajg1DPwKOwM=;
 b=tLLttRWqrUYJX8knbf2kJCGJGHmvEqnGdy25YB3CKWm1p/evUcR4MhFumqAbTV/tShLfEGhh/rrIbo8ZQyIJxCWvC6MobfedB/lALgxmTcvVqoSaf9PBXQa2feOJv+LBCh4eCxLugIz5ZlUTQmw2e/YLb3Dv6TEhZ7FAyj+ox6fzGfwN3BN9fjeDlbmB+C1ZNZfNRw7vnPPY230KJ6I0M1LiYKKykhpdAb6zQh44dIXzeYkvJBgfzedcT48aKBZziMKFXcchDQiQfinwcYrwEegtE2XFU8FqGdnrEI/G8xjPKYWLdGdq3cBxsYWQdcDTVb97a+S+Z4V/Km3X7koMlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <32c42471-9e93-58d8-9973-38fce5dcc4d3@suse.com>
Date: Thu, 22 Jun 2023 09:54:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] x86/boot: Clear XD_DISABLE from the early boot
 path
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
 <20230615153157.444-2-alejandro.vallejo@cloud.com>
 <b254f8ce-e894-ffc1-c7e2-af69f8ee3529@citrix.com>
 <6493289f.7b0a0220.7f086.11fd@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6493289f.7b0a0220.7f086.11fd@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: 762ea20d-7277-4568-5dc1-08db72f5d8e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XLtk5QepmL1ax+kRBlXKlbMslMFQHKMa8BVn0ZGanUmNGppkovbUvIw5F3mVu7YA6LKF0B0yu8/c+AQnJAoERx3reSw1Jq1HdYDviuK4R6k4uIBzm360BcKAfFbA2Oxz9M3L/Tmf15Mbcon6gjU+5tcKw8w0vquUykn0yiBUh4kLKjDi1EWjzCFD9UQRrfDsylsvKSP9wvzen/JXmtcqx2qb9vN1DhschO3bfVx3cEvOgif8Ra4FIOAgb71UT7BIRMOJ1vTws5YRUyAbDXXCB6olmgW6pzPeegBmFDEkGtRa5rztTLOu4SV6HzavWk5DlykSiftIuSVVHK7sQvR6gcL+qaN7oaz+9QcXyNLr8p0gJoc10F5IFF5uCjlGiZ86Nns+LinnwtWuMq4GGfuDO3+xIDumtsoRGiWeLx5RHgyL2qka7lyNq0ADXVJs1VdX7lbiuXsvUNpdEEIu0oCuMEV1ooMMgOtlppT9Fabg/EnrQciDrOTjR/yoakUoLGEWoNbfHvduXOvm9TBP+DmhTmuMDfcjOLSysvo56FhBMxCad96gnKljP2n4tYNDVOCRsqhL4M7ZQDQMPDTdVJa8XRFYh4mFPxjX6oP1WgD8S8ElP23XfF0WhdjzJZr7janlAg3DC2itm2OmqALzGXBh3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199021)(6486002)(6512007)(54906003)(83380400001)(478600001)(26005)(186003)(6506007)(2616005)(53546011)(86362001)(5660300002)(66476007)(36756003)(38100700002)(316002)(2906002)(66946007)(31696002)(8676002)(8936002)(66556008)(4326008)(41300700001)(6916009)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zjcva0NiaWV4R1ErR3pmYWZzZEJGcDJFUWhwNWZJTm1nVUJIdG1MV1UwS1U0?=
 =?utf-8?B?T2tJYlFxcmNNbFJGVVZ1WW5qTjl2SUJLRDYwZkx4cDBLYUZVWkdlRHFPaUp2?=
 =?utf-8?B?VUJWMTlYVXV5VUpzM1JjK2JxYTFCdjdyOEs1TVVzVzFLc1lZU05lWlQxVmRB?=
 =?utf-8?B?RjU1RGk1aUc5dEpFV042aWNqMU50aGhhZ0h3dmhiS2JuVnRUV2ZGRStmMnhH?=
 =?utf-8?B?THkyTEg1MldxSmQrRFNYRHQvWVExVFRsbG91UWtzU3ZnQzdEbVVJQ0hXQ0x3?=
 =?utf-8?B?L2xhVDE4djloc3prWnliLzNucWl2RU5pTE5kYllyL2hQck1saHBVZTF1SEQz?=
 =?utf-8?B?MzdBSENiL2JEY01NY2pBenpFRHQxbWZ6L2N0ZlBOWHc2N2MyZjJDWG1sd2ln?=
 =?utf-8?B?MjdGQkkwY1ZURUpPVmIvdFlRUjd1TE84eWFoQVNRRk13MGl4aHZYYS9FZzFC?=
 =?utf-8?B?Q09PbWpEVHZhYWtZdS85QjIzQm9IZDNqL0RLNmcyQ3ltVWx6Z3lreG9Heml0?=
 =?utf-8?B?L0tEdGtFNVhFTXdwTVgwWlBIVzhaRXh5b3VVTG82VUFBVHEzUnFrSDhSNUI0?=
 =?utf-8?B?U1I3VmV0VVloWXJHSERKdm9IR0pncm5JMHhMYmRNaHB0cTc2S2g4bFIrcER2?=
 =?utf-8?B?NC9ZTHZ1aVBEL3V1c2JkNnJ6N05oSU1qOGpFVkpxRHNrbXpLaFVCRjhOeHdj?=
 =?utf-8?B?bmN5bU1VR2l5d3g5NG9zS0JlUEVpbGljdmhBMkFLeGtkQ2NOajR6U1JUbzlz?=
 =?utf-8?B?dXQwL0RtMUxtbXAvWUtuRUN4V2loemhqMXZsQWJ6ZE81dmxkZjBoR3k3VVFT?=
 =?utf-8?B?NExES1hQNnZVbVJVZmdUT0dQeE5FTG4xUUV2RXhMd1pjMG1zMU9vSnhmNmE1?=
 =?utf-8?B?N2FkTG4vRHdRRUpuRFlLY0xTSUVhUlhBdFVXQnB4U0Z5clpudG9NTVVndFJF?=
 =?utf-8?B?UHZqMDNYUi8ySWxzVEg2WmVDNkJrbnBKTjNqTHA1SERWaHhZK0lRMU9KRnFT?=
 =?utf-8?B?TEpqbDRhcnZsdnZwVkRFdmQ2K2cyVVVUSFhFMnNPOXJ3Wk43clVRSDZnUFdy?=
 =?utf-8?B?aHQ5bTFmelp5SkV2MGtLODBaYkpVUW9TTllWblRaS1JoZ25JY1RWTUVMMmxJ?=
 =?utf-8?B?M0NUdU54SXpWcWxmSWl4YUVlOW5pWHU3N1FzUjBRenVnbkhSblVJUGxXc0Er?=
 =?utf-8?B?OWZ5Nzc3MWlBbVh5ZENWWGdSZ0kzWUlicXhuaFcvbzdmejdaL0VjalVRK2lj?=
 =?utf-8?B?VzJMUjY1UmRkU09kQ3NENGFoSUVDYkVzUXpHZi80dzZjMGpvSUJyYUFNd0Fz?=
 =?utf-8?B?anJZYndZTzJsWGVlVTBuNVdOdk43bmhQaFJyUmhkSmU2V2hkMCszckxjUVZN?=
 =?utf-8?B?Zm9pcGxxZ1BDbjhHcEJiSmpNcmxNQjY3c2c4eEg5TXY3S21ZcnYzVUhGcENF?=
 =?utf-8?B?MVBuY08vdjIrZDRvWFJueHlIMXcwaW92OTZzWUNseWNGZnRYRmkyQXU5K0Z2?=
 =?utf-8?B?VHF5enBIdXJUbEpEZHlTZWNxR3YxNEFhY0RqRHQ4aWtkdFc1b1hUVFlwNWNV?=
 =?utf-8?B?Uit1aHVNN0N5dFVtRHBNS0hTdEdmRkl0SlpONXROd3NiR0VmTlFReXk4MFRa?=
 =?utf-8?B?Uk9FaE5oVWJZeWtvN1ZlZmNIbmJBclRSb2VvdVcwWU56allJbTZvbG9UNVRP?=
 =?utf-8?B?NDRnckNCTzZYOVZtQkdjQmlNRHVyN25KN3BmdHhRY2wwQUJvOGU4cGxLQXBE?=
 =?utf-8?B?ZkdBcjJGbWxZem1uV3VKR1pEbWQ3MzFuQnhvYXZoQitLNWxCdG5VbnE1OWFK?=
 =?utf-8?B?aWl6SjhraEFRODhJNWJ1eHJIMUxCQjRnWVNxWUZibXlvN2FKeUpjbXVndERv?=
 =?utf-8?B?bFFWNEhkVHdPRVZwbmtWTkdQZ0VSSUpmNnFoUGlwKzcrcFhhaG9wUDNBd1Fa?=
 =?utf-8?B?QWJLVkJVRzhHN0pKcVVnb2NGbnJjQUovZFlmMVpyK3RtQjRhR0F0b1E2U0ZQ?=
 =?utf-8?B?Y1lsNFZiNDNlMzFreHF1TTQrU1lzdW5MZEo0Tm8vb2dENXhRT1daRytWWVpF?=
 =?utf-8?B?V1ZSeS9mdWN1S0ZUL0t1TWZ5SWs2Q25DWk1UeHpRUzlNdU5RQlA3OHgzVFhD?=
 =?utf-8?Q?5rQB89+tGtATL1WjopfOwBIFq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762ea20d-7277-4568-5dc1-08db72f5d8e6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 07:54:03.5965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VA+Zw63gZg33ptMULeeG6S3j4C4oI/D6Foy4sKQCu3Xa9YE5wzISnIhH8xt6hpXqJmICI5XEzvoi39E/54UFNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8699

On 21.06.2023 18:43, Alejandro Vallejo wrote:
> Sure, to everything before this
> 
>>> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
>>> index 168cd58f36..46b0cd8dbb 100644
>>> --- a/xen/arch/x86/cpu/intel.c
>>> +++ b/xen/arch/x86/cpu/intel.c
>>> @@ -305,23 +305,23 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
>>>  		c->x86_cache_alignment = 128;
>>>  
>>>  	/* Unmask CPUID levels and NX if masked: */
>>> -	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>>> -
>>> -	disable = misc_enable & (MSR_IA32_MISC_ENABLE_LIMIT_CPUID |
>>> -				 MSR_IA32_MISC_ENABLE_XD_DISABLE);
>>> -	if (disable) {
>>> -		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
>>> -		bootsym(trampoline_misc_enable_off) |= disable;
>>> -		bootsym(trampoline_efer) |= EFER_NXE;
>>> -	}
>>> +	if (rdmsr_safe(MSR_IA32_MISC_ENABLE, misc_enable) == 0) {
>>
>> There's no need to change rdmsrl() to rdmsr_safe(),
> I thought we established before some hypervisors might not implement it. In
> that case this function would crash. More gracefully than a triple fault,
> sure, but still not a very friendly thing to do.

Yet then in early boot code you also don't (and can't) recover from getting
#GP(0), in case that might really happen.

Jan

