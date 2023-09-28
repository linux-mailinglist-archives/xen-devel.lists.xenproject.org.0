Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130A17B204D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 17:01:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609905.949068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlsVP-0002yq-Ol; Thu, 28 Sep 2023 15:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609905.949068; Thu, 28 Sep 2023 15:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlsVP-0002wN-LV; Thu, 28 Sep 2023 15:00:43 +0000
Received: by outflank-mailman (input) for mailman id 609905;
 Thu, 28 Sep 2023 15:00:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlsVO-0002wH-3h
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 15:00:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca38682f-5e0f-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 17:00:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB10068.eurprd04.prod.outlook.com (2603:10a6:10:4c9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 15:00:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 15:00:37 +0000
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
X-Inumbo-ID: ca38682f-5e0f-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzawOOYAw5tOORaheSmlxe1CKqIrUWvEg0LDo4Wg+cY+nDGggLm9Aeu2mny+zUtlNGVmJjuiP+02CM+O6xbJkScpRxIRxdbOOTrkMg5zYukvislIrQycFNJlSf1ioHT2Zxrc9npk4Yr0wY5tpWJCHrgEFDnWxS5ZWPqAp9eM55qqzxFzTwHHCDqAbilccHDlHTdyF2KQwwaSN9inZZPdRqEeaFe8964fm79T4cfPgFYr3hYegHC6wRGGv8cd3guy0RNCvD0+c4JE1/NXVlpU4SkcTl1Q4G3S5CnYmES1+Uu/3tzmLLisNA/nqdsbiGoqOcssT8jWpCtJ8cp9phyPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uazprJvSM6VJ27kxIQM/wKdKzmFdmrYVeDRBRicwxmE=;
 b=fxmFQqnN3i4s9ddB53OKY+INUXtsr16MUXiITMgFnDQLnkEE2V5e9M2KnJcFPP2NQys5lSUQ7vkOjWARboRB0YpSxrAE0lbk/DwTkhucbXKIkvHA577zAB22eA/1agAcMA1dVrpPeYj6zM4llG3ljCqx6W9TQsb0joAH3x8096RHO43X+FSXpVN88zmuVtEFz9ai1nfS1mdaqS9YOqGYMF/l5Qp+klYikOp8MotVtj4CWQovYTmMzzi20MeF0qiaoLWqSX3dPWYTnCnd953yO3W7HYHCArelnwGsb8SsioJM2NwUChP/uMl7VclQmtoRuMrrD4BFikrwRl6mIFRx8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uazprJvSM6VJ27kxIQM/wKdKzmFdmrYVeDRBRicwxmE=;
 b=G/X1+u8UKqqL4BkSawfZgvZ9I+z7PiBhUb0D/8RybSo7LbPEoYaZGxyEHwKSAJ2oseYI8sHYb6+lxELF/3ouyVKyulWEiv4lgxkF5cJb6pfFnoKy5O3Cey4HU2pZgRX/GIOhoTOhtuUnJ0x1BqGEsJiFb6djoTc0NMCfiVf7jr2o/aCe+2+WjC2REz0kiU59B5zwlaDYG4hQO/j+SlvZUX5j/1B47aDX8OpAjKjrbmM78O0TzK5vlAXNy1CthNCYhNaRQZuwyYRkINmld4vNA9HkvattreHymiUSb8T2RDCZdKVemoBwOFDtZRDh/F39w35LiI4YVa+hKaZ0TiPuTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com>
Date: Thu, 28 Sep 2023 17:00:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <b62205a1-885b-ea4e-3ce2-7ad58cfc938d@suse.com>
 <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com>
 <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com>
 <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB10068:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afc9661-afff-40a3-9600-08dbc033ac61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gqnZUtqRur2scKeAOEF6UzR2G6mis3axK+/JyHVs21EYoguJxuz9IpvtAlY4B98J0GRT5k/id+GKbCkH8oOhkUulK+eboFq/3mVnWyv4Pa3VbA7eIvMrkhsKEAtnERHxA8888okiHEBdZF6c7T58S0MIX/RV58pDCYzA4+z8cwQkjmoankiaUJ4HO3towS5OTay0CheWhjbOgC+BUIBIJSne4hCQC0gO597wCnxcbyR5e1JJigo+sRv65O49oJMz3JIUVQNnahsmqCakdPnboTvfE5UCrbVr9zXhsQjQZyd4jAx1Yfsg168Wi/bgI+HrQqtIAjL8ku0LzsQLyds+QmpDw7QlD9iBKJw04xW2U4Q3gB9uUoPzbhomeK68qj5G51K6l3vcrvPwqsRHvlgcBCzwIm5UJkSdQiLrHkSyt3DTT08usidJ2MU5wEzYBN7C1ijXPTXCeVNFhTRu60eYEJaHP8hvrX8Lmn5kKjPjqEdEUdLXkZfD9FaHtrIyeHyo1PsyaM2MIj2TEBTRyq+XoxQGDJryJegiS8cR7Zto1r2E5vFNoeN7H98pd+V1pR4zVfGKiWcSIlB31Snp0XssSxdbhwI4oP7taTCJqxezYcWHa6l1lJdrifc9XhDcpy6I0AnXItU5n3HgiccTJGwBkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(26005)(38100700002)(478600001)(6666004)(36756003)(6486002)(86362001)(31696002)(83380400001)(53546011)(5660300002)(2616005)(6506007)(6512007)(316002)(66946007)(66556008)(66476007)(6916009)(54906003)(2906002)(31686004)(7416002)(41300700001)(8936002)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTRYRzFmcmI2RHlONnJVNUVWMHVZOU4wNWlLMDZXSGNSQTJ6V0RHWk8zZElx?=
 =?utf-8?B?d2Y4SXE5aGxMZ21uM083SmVZRXBrUktNZlBQQ0tlVTFJU2MyS05CNk1JRzUw?=
 =?utf-8?B?QVJwQVArQ3IzNUxQc0I5ZUFDVUtOVGI0eWJQYitVSGRFR3FWWEJBY3ZMK0lp?=
 =?utf-8?B?ODN3bDNseXQ5MGs5VUFXbW1YbFAvZVNKK01TZEpXTGF1eVBiaU9CWWJHL3Vv?=
 =?utf-8?B?RnJZQ3JaRVRzOVhJTS9hK3RXUlptVlJkR1psbTRmdExreHhvbCtnZUFGaytq?=
 =?utf-8?B?c0ZMWEFJSSt2c1J3M2h5R1FzWmpqdUh6VjlKekdmSDlhc04xekdqY0FZQlpq?=
 =?utf-8?B?WW1BYW11dUFoYVpmK1Y3S3BhQ2RiQmdxWUplcjFGQXlsWmdzdGxJczQ0d3NX?=
 =?utf-8?B?aDZjNUQvMGRWU0lyRDlGSlJRTWgzbTB2eEpKRUErd2dabGhJd25rdU54T2FN?=
 =?utf-8?B?Kys1UjcyckRRbjA5OGViSmQzUzBEem9WSS9zOHlLUGJhMXhqMk1kOUkzRjFw?=
 =?utf-8?B?T2lNN0RCaUFFS1ZCSjM3Y2ZRK2gvbjZnRlVuMWs2dm1vMTBaeXFFS3dCRzJh?=
 =?utf-8?B?QTlwTEVwZUs3S2llV3pqWElHVDBBTWhoamlmeUxkTXdQN1JBemxRQVNGS3RE?=
 =?utf-8?B?VmRBRnZCTFQyWlY1TWtETm5WSWI1R3pFT3BLWDlVVVEva0lOYXpzcGljMER2?=
 =?utf-8?B?YUV5bzh5TjArTnErNks1Y29OaWJldWkwdllqRWkzVE00NFJ5bEZodW5jdlJ4?=
 =?utf-8?B?Wnd6MnVlOVZBUjByZE1lQWZJWUVJVnRTK0VKZzA1K2phRnVZT29TWkx4aHpV?=
 =?utf-8?B?YXEyT3RxVzYwcUFDSDIrUWZIWWtqTTN2bjFpZEtHYmFiSWlTZS9MMFJpaC9k?=
 =?utf-8?B?TFFwd21GVWp0NThRLy9qWG5HU0UyMk1FTUo1TVhuRU5KS1RJaGdnYlE1R2hU?=
 =?utf-8?B?Rm1QdE1oanN1QzNoSFJxdXM3ckJLRU55YzczMElJNXV0dGVFb3ZsNTNKeG56?=
 =?utf-8?B?RkVlbFFPbkQxa1B3S3JvTU5ET2xzMDFzT1FFeUEzRkVCQjRkbjR6RVpmZzR4?=
 =?utf-8?B?MXZWT2pWbEYxN0wwSWtjN0IwaG1rdnFldHo3TXZ0Y3hod3ErWFEzRUFiMU9a?=
 =?utf-8?B?RTE5SU9vcXVNQU9mR3hQbFZHNHBCYW5hT2J3WlpEU3VSL1lac243NDd6TDVp?=
 =?utf-8?B?RkgrdjRkaW10ZGZPNllmVFl3RjVvSTVQUGI5Ym8zbU9sWXE5Z3hKT3RwWUtR?=
 =?utf-8?B?ZmRhOFdkRHVTbDZTMkMxekdEY1E5M090UlljRFZodE81WG11cWo2aVo1amlM?=
 =?utf-8?B?ZmhFU3RHYVBFWUFwNHVQSjBkWGoycmFhVElrcG9QV1ZLVnFBWFRXQno4TStF?=
 =?utf-8?B?QnBqWk0zbTVPM3ZwSzRQaGJUaDNKQTJZQURObmlkTmw2OFA1S0t3OUNKYkEv?=
 =?utf-8?B?ckxzMXhldzNSMFFaVyt6MkM2aVcrajQ1UGp6QU12UzI3azhvcWZvYVdoeHN4?=
 =?utf-8?B?WW4zVTJVK3Z0VzNWM0lra1pJOUlVZFZVTUJ4ZlBQTWdaNmxsSTArMTlnUjJt?=
 =?utf-8?B?K3JMbWExbmlUazkzalRYbFVVZXBkdWhDbmNmN01ZVUI3V2g4cnJ0VjVyUmVC?=
 =?utf-8?B?emtVZnhxcFpOekw5RVAvYTA2aTZtc3JUTmFVL1pwRkNZVlB4eHBXZmd6VzVN?=
 =?utf-8?B?d05YUzZCRDJWQ1pjNUp4R1ZJNWxjbjRWYVFCWTljOC9rL3MzbVdQUmZtSzZQ?=
 =?utf-8?B?VXZCaitQSFpzeTAxRXlDQVlZV2ljVGlCQXRLb0l4OWd6NFV2Y2wxcTNmMi9P?=
 =?utf-8?B?MTdLQWRZbFQrd0Q3b2ovRkhDMThMWFRhT2R3RngrOFpQNkZhdUNuM24wMHdB?=
 =?utf-8?B?ZmpJS3NDRk1tTWhWY3V0TWNZUkNScmdqOVpZYTEwM2o2eDhCQUdaVzVVMWg3?=
 =?utf-8?B?d2xGL3JCYWVUQnJ5cm1kK3NVZ3VUY0E4TFQ0bG8yMk1RdDFYVHU4NGJUY2hm?=
 =?utf-8?B?ZDgvTDByN3lmOFdvT3lGbEhvY2JVU1hLTndTUlZkdm41bWJtTEJOVmdxN1Fh?=
 =?utf-8?B?UlhYaWZKcU9OR25VT25zeGRDdS9hQmZrOWt0Q3JCdlhqVzc2Qk1tNWJWeHV3?=
 =?utf-8?Q?KH5cLqHtSlnQNDRIOw4OkyMen?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afc9661-afff-40a3-9600-08dbc033ac61
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 15:00:37.2165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UKCCz4PBzCQvg0oTeqhniBLDqtTd/1lLGidWN/VRhlColoU6k+1+I1g/kpt+mvoHGYwLzUSp+2UJJM8o1Gq+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10068

On 28.09.2023 15:17, Simone Ballarin wrote:
> On 28/09/23 14:51, Jan Beulich wrote:
>> On 28.09.2023 14:46, Simone Ballarin wrote:
>>> On 13/09/23 10:02, Jan Beulich wrote:
>>>> On 12.09.2023 11:36, Simone Ballarin wrote:
>>>>> Add or move inclusion guards to address violations of
>>>>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
>>>>> to prevent the contents of a header file being included more than
>>>>> once").
>>>>>
>>>>> Inclusion guards must appear at the beginning of the headers
>>>>> (comments are permitted anywhere) and the #if directive cannot
>>>>> be used for other checks.
>>>>>
>>>>> Simone Ballarin (10):
>>>>>     misra: add deviation for headers that explicitly avoid guards
>>>>>     misra: modify deviations for empty and generated headers
>>>>>     misra: add deviations for direct inclusion guards
>>>>>     xen/arm: address violations of MISRA C:2012 Directive 4.10
>>>>>     xen/x86: address violations of MISRA C:2012 Directive 4.10
>>>>>     x86/EFI: address violations of MISRA C:2012 Directive 4.10
>>>>>     xen/common: address violations of MISRA C:2012 Directive 4.10
>>>>>     xen/efi: address violations of MISRA C:2012 Directive 4.10
>>>>>     xen: address violations of MISRA C:2012 Directive 4.10
>>>>>     x86/asm: address violations of MISRA C:2012 Directive 4.10
>>>>
>>>> Just to mention it here again for the entire series, seeing that despite
>>>> my earlier comments to this effect a few R-b have arrived: If private
>>>> headers need to gain guards (for, imo, no real reason), we first need to
>>>> settle on a naming scheme for these guards, such that guards used in
>>>> private headers aren't at risk of colliding with ones used headers
>>>> living in one of the usual include directories. IOW imo fair parts of
>>>> this series may need redoing.
>>>>
>>>> Jan
>>>>
>>>
>>> My proposal is:
>>> - the relative path from "xen/arch" for files in this directory
>>>     (i.e. X86_X86_X86_MMCONFIG_H for "xen/arch/x86/x86_64/mmconfig.h";
>>
>> X86_X86_64_MMCONFIG_H that is?
>>
>> Yet then this scheme won't hold for xen/arch/include/asm/... ? It's also
>> not clear whether you're deliberately omitting leading/trailing underscores
>> here, which may be a way to distinguish private from global headers.
> 
> Each name that begins with a double or single underscore (__, _) 
> followed by an uppercase letter is reserved. Using a reserved identifier 
> is an undefined-b.
> 
> I would be better to avoid them.

I'm with you about avoiding them, except that we use such all over the
place. Taking this together with ...

>>> - for the others, the entire path.
>>
>> What exactly is "entire" here?
> 
> Let me try again.
> 
> If we are inside xen/arch the relative path starting from this directory:
>    | xen/arch/x86/include/asm/compat.h
>    X86_INCLUDE_ASM_COMPAT_H
> 
> For xen/include, the current convention.
> Maybe, in a future patch, we can consider removing the leading _.
> 
> For the others, the relative path after xen:
>    | xen/common/efi/efi.h
>    COMMON_EFI_EFI_H

... this you're effectively suggesting to change all existing guards.
That's an option, but likely not a preferred one. Personally I'd prefer
if in particular the headers in xen/include/ and in xen/arch/*include/
didn't needlessly include _INCLUDE_ in their guard names.

I'm really curious what others think.

Jan

