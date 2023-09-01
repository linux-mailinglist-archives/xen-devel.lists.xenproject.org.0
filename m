Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2EE78F894
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 08:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594407.927719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbxfW-0001TI-Gl; Fri, 01 Sep 2023 06:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594407.927719; Fri, 01 Sep 2023 06:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbxfW-0001Q6-Ch; Fri, 01 Sep 2023 06:30:10 +0000
Received: by outflank-mailman (input) for mailman id 594407;
 Fri, 01 Sep 2023 06:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbxfU-0001Jn-6b
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 06:30:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd7b8e07-4890-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 08:30:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7165.eurprd04.prod.outlook.com (2603:10a6:800:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 1 Sep
 2023 06:30:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 06:30:02 +0000
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
X-Inumbo-ID: fd7b8e07-4890-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cF3y+/DFlmiC5k5IvSmD7cxRnmPmJuCs02S8rVTeFgO4aw0koXbp1mYZEYKXxXxVg8pUq/yPYpGCl/DVYbDsE8S5d8eJdlIMwIav1zIe7Ib0vW7uvqTI8FPtZtzFeUCwRy6Xg9WzTXpaDtRyYZ5FR+I8Bs5TABjbxCTREsToueHM8RGPYDc1ZHwO5vE5axZDWZ4tJsY2VOutzlss4lj920D6PfFtoTVsPUmynv5WxcrVtiWEQYtjY9/VIQFcxpJ6aThJOVM3B8Zv9YRXVCrQ5OSCy+p3Rljc2fZuwTkaU1ml43x6ebhfdP/0PoKGfB4Vz5x5A2Qm0MgoT6Hnh4HB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iLRMKdSo3X5O8szupheY/zd2SQEXJ8qgqh3EYQfQpA=;
 b=lBo+dEyAPJYML87AHyrlXB76093V49Y46Wom3HbngjojxeNtoHQU5j9AnUgdTWxZ0UhUfcfCzAX39rcgKZIsDaXMmqMcwIfRtt9KY1IngJa3TCjgm0dh729whzxnt6g+2C7SNu997yL3TdYTIUEGg5gnzilLisE0RJZ25hefMGKzyZfPlANB1mXAikKbknNTpjz9dN2DPWVUOrjdmf5gi60ZGHucpPwG5F9MwNRDIddEzLLcgDG1f5HOug3QNlwakk9DMKC50zupB0KTpeIvrxfuouSaib3BERK9CAxrLG/VT92VufehTRHm+71lnYOPSYQUwD9zi7LquZGeqeOA2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iLRMKdSo3X5O8szupheY/zd2SQEXJ8qgqh3EYQfQpA=;
 b=uXz0vOXWvr7mQOP6cvkS1gVn4vgwMz5fp/xSTkFYM8U+Olvx845JSji5DDl/aIzH+O7eWqXaQsm012w0De3PLP5FPM+yr5GnA8LZKAgMx28rIERGTbuNiWqqHtrud+rrp9iMeBDSnTkQFbSnTlPUlJrSxz9hlAxhF5NHR6Xw2yTO07urBPGf0tyjOLlueR38/9JfioSjDde8hINSr0k3nVjbRdRA0adSyYiaP5so+cjh5yMVDslBD/Sp0utQw/B+M9k8eVwQvxpdSF9cbAYIsoXdRHcPdRha2uz3LsO+fD1R9s1ne+M2BhesBZi5ugTWDY7LKyXagd5Okn6dSw5xsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <879889d0-0f2d-2d06-e7b3-ec629f87672e@suse.com>
Date: Fri, 1 Sep 2023 08:29:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 4/8] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <583ed0d715aa70e777e7aa62a287acafc52d5a24.1692816595.git.sanastasio@raptorengineering.com>
 <11f73889-2059-1d6d-6498-1f1907afabaa@suse.com>
 <3b05ad4d-20e8-72f1-3f43-1c4e618c6ba4@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3b05ad4d-20e8-72f1-3f43-1c4e618c6ba4@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 245586f4-0711-45b7-c0c7-08dbaab4df7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nbExx14frCTskKQlZDn8ky8eZwNxYCfDKn2ljcEhaYk55JHUxLCLJopUODdaTbZ6Y+n5xgr9vGA8fvECdy2iBvwD+qcDH5zO/tV2mjbXba6WS5G78BiggHEGyH4FenaCo8NaXD19uXKmAKvFBIE2Q805R3k3T6cA1bAbuEE4E5tXsQIi+Nzzjypz3ceX0OjfEOXTyICFmFofinxWQpI5QWYRP+y0w52epKS1QL8iOfxsc2GZJkJDlu3Z0UBKAA4QA5ZNKeaXvYObt4ImbUteDrFE0GXOCTuJzGEJzeZoHlEN6BfKdNAHu5CZLaytwpDbIINm/PXSuSCFg+YWEL9/ZKxWKaKxDGxR6wZt81CnoJI6paOab184DYJnxzgQeOHCBfAnH1wTk5nwmat8fbhd2jWg96HuuMYsyWvQVVUiCHGlfYOUMoMRd1/Vx4RbnxU+YYMHrHF1zdPlYv4M4j/CslthPYOtWHQ5p5RXAtagDHCl9k+YDbblJaQdy1jJOi77/+O7KnXsv7crb0dxiZxkFB4llCwoan8U7iDkKat9VOz4dH2GDFCO2KmY0OL2mpQ4rxSNszrmHYEURPYSW4z6qQAyjO9q7Y3vc/SAvb49OQcDSTqz2/c/xY4e1N2PXY7BAdWrFTsQnUrQQQhrJwSHbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(396003)(39850400004)(136003)(1800799009)(186009)(451199024)(478600001)(31686004)(83380400001)(2616005)(26005)(6512007)(86362001)(6506007)(6486002)(53546011)(6666004)(31696002)(2906002)(4326008)(5660300002)(8676002)(6916009)(316002)(8936002)(66476007)(66556008)(41300700001)(66946007)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEFyOU1CVUgxaExVMUN1aXdzYzFKZ0ZtMVJEcUY5bzRBRTIydkIvZlhrU1Mz?=
 =?utf-8?B?ZVlnbndySSsrZ2Uyc0ZGNU1uTVpvaVp6ZmhmaVM5QmVYcDdTSWtEK0xlMmlD?=
 =?utf-8?B?RDNMS1dsVmZuWk1tNUU4RlBndDY2VGF1OHdKVlBIZVVIbTYwS1BTWE1YOVBV?=
 =?utf-8?B?TzZuRHZFeHRZSDBZT2c1ei9mMmFaZ1I2dkVFdll6dWFyM0pxL1VyTjJRaDlY?=
 =?utf-8?B?S25xd2Y3WTBGMU5JRTdtNDQwbS84eGhGZUdKb2hCbFYwMG4xRStxZ09kU0Js?=
 =?utf-8?B?RFBBK2JxNXVyT3BIL0xWZW5mbVBCNDBGTjBHcWg1ZktSWVo1SW16WkhDdFox?=
 =?utf-8?B?M1gwcngrdm5hNlFEU09SblRlZXZmY0s1amM1V0VqRy9CS1Q0U3Q3TjFWQ1lK?=
 =?utf-8?B?N0w0TXd6OVBXUXJYamFmZnJJZi9NemNPVFMyVGtxSitZTGo0SUF2TVZYTFBO?=
 =?utf-8?B?NDNkTGxSdEJvaVFRVVVrb3EvR3krZkRIUjNiUkh5NmMxRE1NSXFmVVpFb2xr?=
 =?utf-8?B?em0wM2FzY0k1NzhBOEV3Q3hQSXk3NTM1YXBVRGcyWGhaNVFFUzZsSldYZjR6?=
 =?utf-8?B?TmJxK0EyRmx4cXROWGdkaGRNYS9CU0dRa3ZpV2hrd1RHd09ZSmxSMkRJYi9W?=
 =?utf-8?B?M09Rc1JxNU11dTV6RHZkRmpHSUlyTGpmVG5nSi8raENDVk5nWXRKSUlBcWNr?=
 =?utf-8?B?MmkzOHhsNWxlTkVzckJPV25JbS94dmYzOStqaEZ6VktucWpSZ29mYUhrU2hz?=
 =?utf-8?B?SU1vMm1sVDQwSDMvbUsxdVlBSG5YSlVvaU9td3piTXRBdThQSGVmemxnbHln?=
 =?utf-8?B?TzFuNXBIMVh5ajQ2WjZmcnB3NHkvZENsY3Q2UStiQ3ptYVorMlpWWVp1ZW5h?=
 =?utf-8?B?K0VUY3BTampBeWVBdnRRWWR3blYycnpyZmFpNXR3Ui93U2VkazZtTUZ2WmdG?=
 =?utf-8?B?Y08rK2sxNWJjbnZFSmxKSWVqaXZ2c3N1OFhJZldYWEFDSEJ0ZWs2WmhkWm5i?=
 =?utf-8?B?Y3p6R1NCbnJsYnAwaVdmcElMRE04WDRFRTh0OFhSWDZsQUlUMXhFUzlhMklp?=
 =?utf-8?B?bVZKZ1dpbUs2emRDTE1wKzVDc1F3UWlWWXpHOW5hdFNLNFRNYk1LTy9xakV4?=
 =?utf-8?B?b0VCZXNYNWhCS09NZlZsOXNrUnB6Y09wOUhZbDFFMzJGNWRnR3pmMSs0dzV6?=
 =?utf-8?B?eGVobFJTQWFHRGJ3bHZ2SGZMczBZSm9hV2FDM0l2M0JEcVY4eHR1cTA3Uzd0?=
 =?utf-8?B?S1hiZHAvOGlSbG4vV1R0a0dDMThQMTBYalg4TDdzVlREa3plbGx3N0lVWTF6?=
 =?utf-8?B?T0M2UVhYUHhheVNYcE8zQkEyTDdrT3FIcE1jSnNiNFY1NEJOeitBcno2QzZC?=
 =?utf-8?B?M2c0alpzRE9JMEpQOW9vM2pib0lQcWZQSFk3TVpoQXdoZVkwNmhNbzBYdm1K?=
 =?utf-8?B?NkU1aWtaSzJQaHJZeDR0SnJLaGdlMVZVYm12ZVpXTWw4ZDMrVmFQVm1aV1M5?=
 =?utf-8?B?UUZWcGd2VVNueU9EWjlYRlB2Nk9UakJ3R2ZPTzd0Y2FpeUo2UVFXRDIxdG5s?=
 =?utf-8?B?OWZtR3M4bXVXeFRVVncvRjhEZTFWQ2l1bnFEK2RNaStaOGtCdENzT2ZocC81?=
 =?utf-8?B?Y3ZxSitxQzh5OEsyaU1VZG92a3RVWHZEOEd4ZG9PQ3piYXdlaTFLR1NJd3ZH?=
 =?utf-8?B?RTFJMlhNdkpyd01EbUtDOFJtcVVFNkhIT3JPNjdrVUtocE96ZlU0em1FRVh1?=
 =?utf-8?B?UnQ1SlVobm9zK0IxUlNJSCs5UTVsTEpGYWxuR0ZSd1NNeFpXV05UZEJITTVE?=
 =?utf-8?B?a3doRk5SMzA2enhMYzNwSHNJSDFvamRQeEJDQlU2VTdEK0ZLUHdVWWFXaElx?=
 =?utf-8?B?MVZBSGlOWnBBZ1EwMS9GVlRqSVRBTEN5MVpmQm8yVk5na3oxQk1WOEhWZXRP?=
 =?utf-8?B?Z09vUWxFd21UWnllcnl2RVNSVHhBbnMxbStyK0UvUmZhWWZFQTRwbVFqSVZV?=
 =?utf-8?B?U0xlZlVYYm1sVFZlUmlVYW1lUVpLRTAybmNRWlRQbDYrZ0loOXZ1Mk4zYzl4?=
 =?utf-8?B?b1c0MzRCVDEvejFoaGtiVWUxZXRjM3Yvb2tuczBrSUhRTGZoS3p0WU5jUnl6?=
 =?utf-8?Q?JRONbAbqmcI0vIqJwZ6KzfPyf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245586f4-0711-45b7-c0c7-08dbaab4df7b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 06:30:02.5610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9E33/5PpEjxBuorBCsp7BehWJ4nn2TlJcRV1NsXkVvv7twaAbdfw/DT7bV0i96B4lP4kxpqZKG33wW7+C/jbVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7165

On 31.08.2023 22:06, Shawn Anastasio wrote:
> On 8/29/23 8:59 AM, Jan Beulich wrote:
>> On 23.08.2023 22:07, Shawn Anastasio wrote:
>>> +{                                                                              \
>>> +    unsigned long old;                                                         \
>>> +    unsigned int *p = (unsigned int *)_p;                                      \
>>> +    asm volatile (                                                             \
>>> +    prefix                                                                     \
>>> +"1: lwarx %0,0,%3,0\n"                                                         \
>>> +    #op "%I2 %0,%0,%2\n"                                                       \
>>> +    "stwcx. %0,0,%3\n"                                                         \
>>> +    "bne- 1b\n"                                                                \
>>> +    : "=&r" (old), "+m" (*p)                                                   \
>>> +    : "rK" (mask), "r" (p)                                                     \
>>> +    : "cc", "memory");                                                         \
>>
>> The asm() body wants indenting by another four blanks (more instances below).
>>
> 
> If I were to match the style used in the previous patch's atomic.h, the
> body should be indented to line up with the opening ( of the asm
> statement, right?

Depends on whether the ( is to remain the last token on its line. If so, ...

> I'll go ahead and do that for consistency's sake
> unless you think it would be better to just leave it as-is with an extra
> 4 spaces of indentation.

... this style of indentation would want using. Either is fine, in case you
have a specific preference.

>>> +/* Based on linux/include/asm-generic/bitops/ffz.h */
>>> +/*
>>> + * ffz - find first zero in word.
>>> + * @word: The word to search
>>> + *
>>> + * Undefined if no zero exists, so code should check against ~0UL first.
>>> + */
>>> +#define ffz(x)  __ffs(~(x))
>>> +
>>> +/**
>>> + * hweightN - returns the hamming weight of a N-bit word
>>> + * @x: the word to weigh
>>> + *
>>> + * The Hamming Weight of a number is the total number of bits set in it.
>>> + */
>>> +#define hweight64(x) generic_hweight64(x)
>>> +#define hweight32(x) generic_hweight32(x)
>>> +#define hweight16(x) generic_hweight16(x)
>>> +#define hweight8(x) generic_hweight8(x)
>>
>> Not using popcnt{b,w,d}, e.g. via a compiler builtin?
>>
> 
> Excellent point. It looks like gcc's __builtin_popcount* family of
> builtins will do what we want here. I suppose the other architectures in
> Xen don't do this because they target toolchains old enough to not have
> these builtins?

Well, on x86 a patch introducing its use is actually pending ("x86: use
POPCNT for hweight<N>() when available").

>>> +    tmp = (*p) & (~0UL >> (BITS_PER_LONG - size));
>>> +    if (tmp == 0UL)        /* Are any bits set? */
>>> +        return result + size;    /* Nope. */
>>> +found:
>>
>> Labels indented by at least one blank please. (More elsewhere.)
> 
> I wasn't aware of this style convention -- so a single blank before the
> label would be correct?

Yes. (There are cases where deeper indentation is neater, but this isn't
one of them.)

Jan

