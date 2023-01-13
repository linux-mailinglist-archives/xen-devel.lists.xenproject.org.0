Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901A5669156
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 09:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476841.739225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFb0-000274-86; Fri, 13 Jan 2023 08:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476841.739225; Fri, 13 Jan 2023 08:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFb0-00023g-4b; Fri, 13 Jan 2023 08:39:30 +0000
Received: by outflank-mailman (input) for mailman id 476841;
 Fri, 13 Jan 2023 08:39:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGFay-00023a-Pf
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 08:39:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca1072bd-931d-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 09:39:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7719.eurprd04.prod.outlook.com (2603:10a6:20b:29a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 08:39:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 08:39:25 +0000
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
X-Inumbo-ID: ca1072bd-931d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kr0Dy+a3QHf6kFJmMHkBA8xASRoY249CXrOGs6EIjnI7RBd6RrlDQp5KLWdoMwxMvZW8+knvFYk/qz5bm83h/XHp8o5B270AkuWfiDaW63VHLemxy7HpgAZRFsBTlNOQb6V5fg6ZT1kONM4TZHlCaU0HXUP2UXvl6izTqCefnzU3Obv/Mg/HMnR91RN+rFkObKgKNdCygwX6puoL5xsmNmKjNF2kS8CftwhaO62u2+CaenRugectNVOYnZzZlTB17iMqmxA4ZrrM0BUIlYvo29yTrzSd+MiC9/u16Dtfruo1joZAuAwFL1vK86zC9NrxhkImLf0wbgViVDMp/83L4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8StdBSUm+VmJk5Ih9218PPvQ1Hl08H3FHmwUGtF2OA=;
 b=g7xthdexPrAklO2dOerTqdZBDc/nGS5deAcSMuj3E1+wFp3zWaSJLbxGqeBt5UDz4Eo80OfoLhsoLHevG4b4kptw/rHKy1euAO9Pm7V8ABmLFJiofRKrNxjY7XF/dyZyAAYED2SW8FuMY4oZvclTtN/gxrkxSB3eU9fTUEWsKRE0p92GbVsLeNqAQPyWJo17ygtoszi7OqeyagQuhNf8tfs/6KY+TRl6B7au+YLVRXV8veXSuszlaHL8j4YIRzh+yy3aAbctJcxuQ0xKtu3GXLjXrvK9AW20DlRJvAemmS2YxF5PD9O5sDP5ohQ3hWUXG1X9eg/b0J6r8KRs5NxXAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8StdBSUm+VmJk5Ih9218PPvQ1Hl08H3FHmwUGtF2OA=;
 b=ZWkgLSESwbRP5OmN2ov9qC4roB8RI9r3tHyLg3HQ6ISsxePFcWlgNcB4RtoC/RXxBzJF4J8DfPG3E9l/d4X7eJtsln6DdHsEe4Yhb1+0W+wDIDrQFhc/0NpTwRuraK5EoDxExyX2flatU3T5Qaah14ozwURXAoSi45aTI65rPERj0n3rj2PEhScS6RCTqgLGSwhsFiw96XHcHXDzQbSF0yfIla/or8qx37OuzIzujfhh8r89m5kmP8F7uKCWk7sJV8EotO2MT/8tFHVA9MZ2ySfTzaQmOg2mQELgM2nZvlbt2561OFmVCodFfy5VzUhNVaCD6T7w5eB3uwyliCNyhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <43cd6b65-0131-47a8-ce45-cc5d7ea25685@suse.com>
Date: Fri, 13 Jan 2023 09:39:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/8] x86/iommu: iommu_igfx, iommu_qinval and
 iommu_snoop are VT-d specific
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-4-burzalodowa@gmail.com>
 <f2d68a4d-b9b3-7700-961d-f6888edfb858@suse.com>
 <f4771b3d-63e8-a44b-bdaf-4e2823f43fb8@gmail.com>
 <4bc3f2f6-9bf4-5810-89e3-526470e72d85@gmail.com>
 <d4105a37-e24f-96b6-f0f3-5990768fa8f5@suse.com>
 <cf9a8caa-1ebd-b6cb-a1f8-c43fbe5ee381@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cf9a8caa-1ebd-b6cb-a1f8-c43fbe5ee381@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8c41f6-5d8e-495b-0d36-08daf541ad57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Rz71uC2uDcZrUdKuX2LHId3A0XZoXmOy7f/Jg5GonmPr9lY/FL7uMoGfP/gX0nRaTtSoG9Z3bjASUr7LRBSrW76BLuJdEPIeQwm4su0Q09Hz/a+qeyeJSvM5IfoTo0V1J5ECCx8R/JqAjzj5zMoT17BExwERuco93z14YNBMd2xyUak1piujDYO9alOb5A6tXcZxOWIZvk7cqWomIHWWKV1o3laxGbp6sjfHRyL82EYZqMDTPPJDUG4uFXoQ84LzfXZqqRVpFhpl6hF9OfJUJM6lrHFJAJu36jaLIqarJWwr3JEQ8ROgLrqVYimkyL6Nex8fWrWgXWF11tJVg6kksXY3XbTBNiitclqPBulrDVOAfl+++Svt1SobAfwJ/aI6Q/Bsaf0Cxae4t7zSmstOmOqOagFXeSLhW2I2WVpiZI8qk6Bkj2316vyW8QW5RBcgu5A4GMh3xyzczR2dPqtq/56VtvjTTIG5NcZJe3G7SYue1yjNd3E54P1HjZPqAc+1DeVH5aFsNFBY1r2jeTuxT64cfWWkdcDsPC5RyI7Eqsoc0mqGMPkSNjJzMaa1gxNiShMUPfa+8rrAkFYvVssE4PPt0WTL8CRAn93n/YILtadVhTdJMqZOaqVESxW+xViiVqKqBjyRejAZTVThRmC4KYp0RDC8JA5dFurbh0B1F2OkZmHQZ1ZDjlgyLjYy87Fwiijx4bLHlav26gEqvUVU92fQaM9at+ANIPJYg5vByk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199015)(41300700001)(66556008)(31686004)(8676002)(6916009)(66476007)(66946007)(4326008)(5660300002)(54906003)(8936002)(316002)(2906002)(86362001)(38100700002)(6486002)(36756003)(478600001)(186003)(26005)(31696002)(6506007)(53546011)(2616005)(6512007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0VnMHFQK3ZwN21aVkxodTgySm1QSXRpVWRNT2dEWDR4QXFWUVdSZ1J1THFw?=
 =?utf-8?B?aVNiVkxsblAxUndwM2pWQTB2aVJ1dmZkbFF0Z3E3d1kxWmRrTjZISGhpV01B?=
 =?utf-8?B?VEhuSDU4ZmlMWC92K0lJcjRDZTJ3VVhCNEZBNlJXd0VPemQ2Rk9TYTZjQzJW?=
 =?utf-8?B?Ri82YkwyVER1MHd6dnhQYS9FYUdWTlVvbWVUUkdpampyNkJWVjg3Y3o4bFpv?=
 =?utf-8?B?aHptZ1B3Tk1zMWl3Y1RCcFhpcnJtMHJEb2lKNDRJbnlBQ1F4ZDFldUszWVY5?=
 =?utf-8?B?c2N5c3RrSnlEQ3d0RE1VRnRPdnFYN1JLa2JTYURocmQxUmxDY1RZc3VJS3Q4?=
 =?utf-8?B?RStML2N3ekVwM3N2WVk3YUNZQTc2UDFaVnB6MEpPK0tlYlVQQWk1VlRPVVFn?=
 =?utf-8?B?V05qK3lrdWxqKzArMUxORUdpVVJuTUxVRW5tLzZJMERSeFhpTi96ZDE4bk4r?=
 =?utf-8?B?YXdEZ21INk9hS0R0NDdDM2NBVGFGeWFJMjgrYXpRL0hYYmkya0Nxb1BXY0c0?=
 =?utf-8?B?eWd3V1RvQ3A3Q1JkOTBrN0hVeTkzRGdtaTlXMzlCcDVqYWQwQjZwTGtlc29s?=
 =?utf-8?B?Sld0cTYrSXlQM3FKbGVqWCtuc3Z2Q1Zhbmg4cjdDSWVqNElaTlpBdHhGNE1r?=
 =?utf-8?B?T0tOZ2JiNUF0MWk4ZkFFTTJ0ZE45dVROMGxraWV0SXJXd1F5ZXJJR1AyZGRN?=
 =?utf-8?B?S3o4V2NBdEVNbjRremVkVk4rYXN6N3I4SnNPdXRBam9zOVRHcDhHZ1BOZDls?=
 =?utf-8?B?TXZsOG5qMlRpalRzTjlCdjNWa3VhYWRTLzhyNXhTazRYS0lzck1wcTNhNVla?=
 =?utf-8?B?WnB6Wm1tSXVRcWpSbFQzaHN4UU96b2Q3bVZDS1NlSE82cVRmUVdtMWhOdFZR?=
 =?utf-8?B?STREL3FUaXRBT0l5OHZ2RlpmTlM4MUVNWnprdWFLL01MV2VMNTc2Mk5Mb3Ir?=
 =?utf-8?B?UmpTOFFRZmZ0ckJJcWgyL014VTh2bUdVZ1ZkdVBRZ0lMRWl5QlhTRGtYeWZ1?=
 =?utf-8?B?bFZ3ckQ3TFQwei9aaVQ0VHZpVFU4NVZvZkgvNUFvVEVvS1hmdGcrdVIwUEhr?=
 =?utf-8?B?YW9Bd3ZzOHFtRS9jRkJFeW8vcmpGdWVxRnd0UjF2dmNFVWxCNUhFbGpRcTNT?=
 =?utf-8?B?ck0wdGthR2ovM3dNNGR2SzdhdXVubVpEK0ZGZFFkTkl3MFpvOE9QbDUrcVAv?=
 =?utf-8?B?RDFMbDdiclZKMWdEZXQyT3FxWG5jdDVibTRRYW1sZkVnZytrbXAraDRiUkRo?=
 =?utf-8?B?dmcwNXhoWThnTXBJM3gyakhkNml3ZmhCR2d1bXFyanZrSHR6dFRoWFp1aTBq?=
 =?utf-8?B?Sk9QbXNFd0U5Vml5eDNyZFJlWUdiNi9FTUYwZEJVRUdiOEpMakZ3U0puL21N?=
 =?utf-8?B?WE0yREtUL0dCcnRtNzd5N1hNemQrcllCZCt6MHlQOENxYTlQbWRjTDEyTjlK?=
 =?utf-8?B?VC9mOEVZUFNZdXZnaHByZHBzRnNIOHBzZ3k2OUF1SVY5TjB4SldTOG9UOVF6?=
 =?utf-8?B?b3pYdVJUd0F5QzBiSG9HNHo0aFZZVGIzYWdHbkZ6YzhYV0lJdWhlSDExWWdY?=
 =?utf-8?B?NUg1ZWxzekxMUVVta01XQmg2alh2Q3J1c2VYby9hM2dOV1lSTXdOcElXcnRU?=
 =?utf-8?B?OHV1NkZZOGwzU2hBcFh2djkzeXplb3B1eXdpQWtZOFV1N0Vxak01ak94MVNr?=
 =?utf-8?B?UXZvS21HRmcwL0J6NkZVNm1CSFR3QUlWWFFURmdSRXdwMjVmY2NEcGlpNFR6?=
 =?utf-8?B?WkFwRXdKQ2Y4blljMndJNGRuVFpSSEMydDFmZmFRVzFELzNpVlFYcFA2T3lD?=
 =?utf-8?B?enZwV01wWTVSYWlld2NvdW5DQkZSSkRPK0tQejhJZW9OZ3hDOFU2c1VJd0dG?=
 =?utf-8?B?MTVTZ1hVbjJUTkI0T0xQY1EvSDgzL21PVTRaQldIRExIQXhsVTVNRFc4SUhw?=
 =?utf-8?B?NktRV0JoUXV1TUtDemZ3TlluSjZ0UXk2dEdTNXF3Smt6VGkwSXVFZklNL2Zq?=
 =?utf-8?B?SDZXajA3ZWJnZ1NXSHoyZldOSURnNTdzbXVWeSttdCtqQjBJa1Y3K1YwZWE2?=
 =?utf-8?B?RVpQVTFYbjA1SVlrUlR2YjUxT3FLL1U3SytiWGRPbkV3M1pKUkpHUHVjQkxk?=
 =?utf-8?Q?kfBGiBu2HGu8q+kgS995o2Wtc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8c41f6-5d8e-495b-0d36-08daf541ad57
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 08:39:25.7439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0EP1tPacHCCeFYa9IiXQbOqT6aLfPpVrSjBk3iY3jLlBeprJaABBYnAzJkQvPDLMBHZuwKlSV9w6yrO00YFdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7719

On 13.01.2023 09:10, Xenia Ragiadakou wrote:
> 
> On 1/12/23 17:53, Jan Beulich wrote:
>> On 12.01.2023 16:43, Xenia Ragiadakou wrote:
>>> On 1/12/23 13:49, Xenia Ragiadakou wrote:
>>>> On 1/12/23 13:31, Jan Beulich wrote:
>>>>> On 04.01.2023 09:44, Xenia Ragiadakou wrote:
>>>>>> --- a/xen/include/xen/iommu.h
>>>>>> +++ b/xen/include/xen/iommu.h
>>>>>> @@ -74,9 +74,13 @@ extern enum __packed iommu_intremap {
>>>>>>       iommu_intremap_restricted,
>>>>>>       iommu_intremap_full,
>>>>>>    } iommu_intremap;
>>>>>> -extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>>>>>>    #else
>>>>>>    # define iommu_intremap false
>>>>>> +#endif
>>>>>> +
>>>>>> +#ifdef CONFIG_INTEL_IOMMU
>>>>>> +extern bool iommu_igfx, iommu_qinval, iommu_snoop;
>>>>>> +#else
>>>>>>    # define iommu_snoop false
>>>>>>    #endif
>>>>>
>>>>> Do these declarations really need touching? In patch 2 you didn't move
>>>>> amd_iommu_perdev_intremap's either.
>>>>
>>>> Ok, I will revert this change (as I did in v2 of patch 2) since it is
>>>> not needed.
>>>
>>> Actually, my patch was altering the current behavior by defining
>>> iommu_snoop as false when !INTEL_IOMMU.
>>>
>>> IIUC, there is no control over snoop behavior when using the AMD iommu.
>>> Hence, iommu_snoop should evaluate to true for AMD iommu.
>>> However, when using the INTEL iommu the user can disable it via the
>>> "iommu" param, right?
>>
>> That's the intended behavior, yes, but right now we allow the option
>> to also affect behavior on AMD - perhaps wrongly so, as there's one
>> use outside of VT-x and VT-d code. But of course the option is
>> documented to be there for VT-d only, so one can view it as user
>> error if it's used on a non-VT-d system.
>>
>>> If that's the case then iommu_snoop needs to be moved from vtd/iommu.c
>>> to x86/iommu.c and iommu_snoop assignment via iommu param needs to be
>>> guarded by CONFIG_INTEL_IOMMU.
>>
>> Or #define to true when !INTEL_IOMMU and keep the variable where it
>> is.
> 
> Given the current implementation, if defined to true, it will be true 
> even when !iommu_enabled.

Which is supposed to be benign; I'm about to send a patch to actually
make it benign in shadow code as well (which is the one place where I
notice it isn't right now).

Jan

