Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C574AB32
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 08:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560174.875871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHf5b-0001KH-N8; Fri, 07 Jul 2023 06:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560174.875871; Fri, 07 Jul 2023 06:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHf5b-0001Gw-Jm; Fri, 07 Jul 2023 06:37:11 +0000
Received: by outflank-mailman (input) for mailman id 560174;
 Fri, 07 Jul 2023 06:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHf5Z-0001Gq-To
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 06:37:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b219d1ba-1c90-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 08:37:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8135.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 06:37:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 06:37:06 +0000
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
X-Inumbo-ID: b219d1ba-1c90-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8oPKj1TdOZhcikhVTUdm96Ijc00FEewbmX07JXATTnQmNUcbsEetrCX2CZR8xLLH/542OpdEVPMkCUorGtmzrBBSIUNMivMhy7RoDm6TIZJAoYi0dTM1KEpDnot2vo854+a7mL7ejuUbRS3qqeyLmEeW5P2m2XvctuHnKTr0rcn9uFNNRHy6i2AtHPYhpJnu1S2zuKo0EgmMzlETUazMCDHK++Fj40Twi8UKIQjj1XOumWJOfrN/v4pAEeWxa5jRfxQVQFBwY5LqYhXij65FhjHxZbFYaUJ6Ei0C9beKHvuxGxduBG5TfmT8stLgc9lsa8F2PXw3XWL7DK4lAMdjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIWLWx8dgHcsTEVqplza6+9naUviv7sCsC3PH2iOdg4=;
 b=IDjVwUilQVGvp58yznrK3W71BhnVxLmD+ef9vpyW7jUKJ/Fs95sFA2+sqsCW+ao0uw4e5RbuP26Ppjg+Kd38S/PQGzMffyCldqCOmwl/maaPpWZXLb6/Dnei5CmjDLI5jl7srUFJh6TEKjBCKetM7HW1feqHO3HhikFQ2CqdQw9QZpFcaxLlHxehZxQxtqCScwReSVe/+hu7w46EOZw9uhY68CXqz4uF3mfvK2wdyVvzOjN6FfkVcHrrWnal50xJ5evuNQCJwgbdpMrzbSUDFaoTqQWfVNHHgk5+JoD6isyBzFlLndTXY2g8qVGFGe1DfEAZ0aE+heiZuRwX06SE4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIWLWx8dgHcsTEVqplza6+9naUviv7sCsC3PH2iOdg4=;
 b=iB1pEWhVqNsm5oKszNEmnvYhVX0pP+g1GknWBAyco2dqyAlSQPtR99te7qsMpKFjZy+dsJ2LZQBUdK99R2o1SxFgYUjvkTCN935LadVCR+L6ESq1ITBODP+2XgYnc2iEqBRqutzPuHKBYzu7YikcxPlzdThV1LxQO3wuj18HWfVgDtN0Q1Q8D2+1MSrSDn5Cqz5vf3kV0WoQSYuke2XNmxhgIfnJoXQALUAEx0iZhRcPH9aiMJ2i5wTot6h/ZjxHw1p99jjBh7Ox0JSY5oqhRcFbAQTtkPuZi41eoOJtj6ZOLyqPj2VlNvDS9tPBPf9IdFl1b18R4nHQRJeaszgyzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe73f06e-76e2-cfd8-64ca-7117a3835818@suse.com>
Date: Fri, 7 Jul 2023 08:37:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 4/5] x86/x86_emulate: change parameter name from 's'
 to 'state'
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1688049494.git.federico.serafini@bugseng.com>
 <8c8bc96b96a1111a4651f970f506d304809ea40d.1688049495.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2306291230500.3936094@ubuntu-linux-20-04-desktop>
 <e7af3c85-92ec-7d0f-0e63-3a1e5d65877e@suse.com>
 <alpine.DEB.2.22.394.2307051544340.761183@ubuntu-linux-20-04-desktop>
 <c2a52a88-a8bf-3e14-f3f5-616177c3d807@suse.com>
 <alpine.DEB.2.22.394.2307061450530.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307061450530.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f9c49c-a8d1-4cea-06c1-08db7eb494f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PR0VKHgfkQV4Eomgr3PL5Q4ngYqE9dfMJ21TWLTo+oKx4fGq4tUYM90YP+VHbdCgUbxM+bUs35R4lPBB2ZyidadqFznCa/U+pKWdBhG6o+zvQWgx2R6kGYWu1eNMrE0UUV7madsYWJFfWjSTmyGh4JH8RtTTzf05Fynasif/W0uEn1y2RYx09KX0qiCeT++Dn8IIMrLgfZUJ7ck9V4LZgydfqm9cJl0OUkbNW7i7cSqY4fhjkg0d27GNez2NzhXmiTHoDqL937A21lYELQGxlzJ9O/Zml4G6sjeqi7p3cvROEfWDRYlTBj5Ap6fR1vrUHlJklr982A6ZiJwmoq45tVdFcgbzB21svLGtD4l6tq3ZcptHdzJOzGyoRrm4XCe0ndGV+STWXHE6x9Lw23J+z5nSFrvkOF0rP00vU44Vi5c8M06DKG6gAYODgOlLjfNlbk6pIja2N5oE5WiQVj4h0ntnj8zKKtfi85VVmsYI9DR9bM0I4erYNU5/+KR6OCP0ffFxoHOJ64qCMmYMjVW2eWw+OxX5k2aP47w7bXOgPfT4s8OOWvko7hiUIuw88uT3V+qePjqrsJhLUnhsoOJ1OT6wDyagQkyGFnQ9XinMiR/v9V/qHZHedNk+YWqHbALac+QuiaUcf/MUZ2rVsu9vtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199021)(6916009)(66946007)(4326008)(66476007)(66556008)(38100700002)(2616005)(186003)(6666004)(31696002)(6486002)(54906003)(36756003)(53546011)(478600001)(86362001)(6506007)(6512007)(7416002)(26005)(8676002)(31686004)(8936002)(5660300002)(316002)(2906002)(83380400001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2I5NDBnY09EakF3RVVCMFovNVBkUmgrbkRPNnpKNFI0bmY5Si9qMG9CQmVJ?=
 =?utf-8?B?eGJOUWtiU015aHgvdzFqT25qRnNIMWhZZ2NuUENXb1hFaHFicjRCNVYwN1RC?=
 =?utf-8?B?YVlwSjRleW53MTBBTWZzUGFtMEFZeWtYUVhJNVpJcU82c1hPL0cwb1Zuc3VS?=
 =?utf-8?B?bk0zdG56MEc5SU1pZ1gvK0JCYnNodkZ5RjJyZW1pZ0dyV2ExVnhnMUVZVko4?=
 =?utf-8?B?M2NNQXliaDdmNWsvUUtZczBPblZ4WndSZHE1SEd2dmRWYXlxSnY2K0tzN0wx?=
 =?utf-8?B?NlZsemFla2VIaTZMdlhDR3BNQWpNN2x5QzRDenJ0RDl0aVFKbFFDdzhNYStF?=
 =?utf-8?B?Y0k2RnNJKzFoTXBQQldtdk9mZzVWaHFmUUhySnNibzI1VjNRZzNMR3ViVXZ2?=
 =?utf-8?B?cGRTaDU2K1BXL1lSRzlza2NpODE2K2FadVBUQzIydDRMS2E5OE03UFJzQ3VM?=
 =?utf-8?B?cG9JRGl1UEFoMVJqdmE4d1p2Zi9yWk5Jd1RDdWkrOUpWTGFqdTN5RzRoZFFy?=
 =?utf-8?B?K2xyZ0FhTGkxSVY4bmVpSzkvQzl5TTZ4aFFiVEJlZXN4YTZJRm5OS0ZOTkcv?=
 =?utf-8?B?YUJJQjhZbFF6TmNGcXFkYWo0WmJoS0dOQy9ZWmduMDBwQi9QOHJjR2tRMU53?=
 =?utf-8?B?NEtGNnIyK0Zjd3o0VHZ1cWVTZzI4WVgvM1hMWXladVRvVHVLVU5EOWdvNTVS?=
 =?utf-8?B?ZHU2cWlqVkVzc1NTdmNlY0Fva3lwQzhRVHQvaTdnNlY4MHBIQkcwa3R0S09h?=
 =?utf-8?B?UXV5cEV6V1R5QXgyMjgrMmdyOGJ3T0pIQWkzTnVzTjBVVWpMTm1TQWl3OFRG?=
 =?utf-8?B?dm5hNkR1Q2x4UWNEU0daR3hRVldKTXpwWmJtNWZENkRlYm15MjZjK1B3ZFEy?=
 =?utf-8?B?ZjFMY2thbW9nRk8reUo3U1RHUUVDRXpybkdyaXpwaFdVK0pBOHRJdklsMHRE?=
 =?utf-8?B?QmRUVTFXV0lTbGVkR3hXelc3dEl0alNPTUdta3NqM2MxTjJrd3h6RlB2L0Js?=
 =?utf-8?B?WEZ1a1VDbWNaa2E3ZzBIZ0JISVhlQ2p6YjhtbmIvYWJmcWJ0aUJ3ejdQbzdK?=
 =?utf-8?B?ZTVJeDZ2U0hLdk5sb2RCMmUxNkRUcE12bjVuKzgzNWNuVFAvY0RxaGRDcFZK?=
 =?utf-8?B?UzVEcG4rSlhkU05ManlldkoyS2x2OGN2dnhZSHp1Y080Mk55SG5tNGJTbXU3?=
 =?utf-8?B?Mk9hbDY1RjJlOTh0L1gxb21VeVYyK3hNOWloWERoMEJpWGJVQUJPd3JQWkRG?=
 =?utf-8?B?N2dtMThjMnlIOFhZTlRBZWFTVzAzV0RtZzJnMGpMaVpuZUtjVkFYSFA0ekdU?=
 =?utf-8?B?SEErVkhYendmVDgzb1dHVXpBN2JOSG9SSEdnMmlBak94S2l6aVlnVWlnM28x?=
 =?utf-8?B?b0M1L25pQTJqeXg2a2lwZVkvVG9HdEl1OGIwU1FlbVBEdzNkd0ZIbmhzZ1JT?=
 =?utf-8?B?ZldsY1A1VTVyaHdzbHF1bWRIWEFPbmlJa29YZWo1Mjloajk2V2RwSGNPNGFk?=
 =?utf-8?B?eEF2WTRMeGhwd3JTMFdiTVFqZGFwZWQvVytBRHk3VFV2akFJdXVSUmVVdVJw?=
 =?utf-8?B?QUJyRllxMXZlY2h5ZGxHN2wySkxIdGc1WVhmck1qMk9IWjFFZ2VVTlF5VUo2?=
 =?utf-8?B?eGc3OGxjYlFzcGhJdXd1bWtkTXNJTUc5bHlJQjN2Tld6OTNRVzR2N2k4djRM?=
 =?utf-8?B?bG1Na2dsYzB4d0luNDBoUGV3eFRINVdudXlGQVc3cUtrSUliVVIyYk9rcXpM?=
 =?utf-8?B?OXUvMHdUemRBakgvbjByQXRyREVaTEQ4cGEyS1k0aE9qY1Q2UGFUL05EMVk1?=
 =?utf-8?B?M2FEMXdWRk5ESFN5aUZxT2VxMU1XMU91ZndFeXZ6YXMvQUlPTU1HaVZ0TzVR?=
 =?utf-8?B?dHJSa2V4THFYOFhFaTVRWWR6L3dEMkk1T0RKOXNWWE9hWENtaEZhbnU4cmhB?=
 =?utf-8?B?RWRpdU9xazJzYUtWOGpxVjV2dGhEN3p5ckJ4SkNxMDFXU2Jjdzd3WHhrRU1G?=
 =?utf-8?B?YmdHVnlFZ0h0ZmtDZUw2ZkxOWjRDTE5XRzVReGRtMEw1cDhhdk9pQUZObGpj?=
 =?utf-8?B?QUEzOU5BclNicUxGN2szSHhicCtaa1psYm11RkRxdkxrdkluVGVhRWUzZ1JB?=
 =?utf-8?Q?SYIUQ5Q9Njy60Tm2I5VfQjUPs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f9c49c-a8d1-4cea-06c1-08db7eb494f9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 06:37:06.2789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAyJx5jDjM5+txuBjQaVQ8LMZCZdGUOnXR9DKtGF06c8wouwKaBMiij36PZE+TGByvgm6vm49UpESvLwHfrfPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8135

On 07.07.2023 00:05, Stefano Stabellini wrote:
> On Thu, 6 Jul 2023, Jan Beulich wrote:
>> On 06.07.2023 00:49, Stefano Stabellini wrote:
>>> On Tue, 4 Jul 2023, Jan Beulich wrote:
>>>> On 29.06.2023 21:31, Stefano Stabellini wrote:
>>>>> On Thu, 29 Jun 2023, Federico Serafini wrote:
>>>>>> Change parameter name from 's' to 'state' in function definitions in
>>>>>> order to:
>>>>>> 1) keep consistency with the parameter names used in the corresponding
>>>>>>    declarations;
>>>>>> 2) keep consistency with parameter names used within x86_emulate.h;
>>>>>> 3) fix violations of MISRA C:2012 Rule 8.3.
>>>>>>
>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>>
>>>>> You could use x86emul: as tag in the title. I'll let Jan choose the tag
>>>>> he prefers.
>>>>
>>>> x86emul: or x86/emul: is what we commonly use. That said, I don't like
>>>> this change. The files touched are pretty new, and it was deliberate
>>>> that I used s, not state, for the names. This is shorthand much like
>>>> (globally) we use v (instead of vcpu) and d (instead of domain).
>>>
>>> Are you suggesting that the functions changed in this patch should be
>>> adapted in the other direction instead?  Meaning that the declaration is
>>> changed to match the definition instead of the opposite?
>>>
>>> If so, are you referring to all the functions changed in this patch? Or
>>> only some?
>>
>> All of the files touched here are ones which were recently introduced,
>> and which are deliberately the way they are. This "deliberately" really
>> goes as far as declarations and definitions disagreeing in names: For
>> the former, what matters are adjacent declarations in the header. For
>> the latter what matters is code readability. I'm sorry, I think the
>> Misra rule simply gets in the way of the original intentions here (and
>> I continue to disagree with there being any confusion from name
>> mismatches between declarations and definitions, the more that in the
>> case here it would be easy to avoid by simply omitting names in
>> declarations, but that is violating yet another rule I don't fully
>> agree with either, as voiced when discussing it).
>>
>> My preferred course of action here would be to simply drop the patch.
>> The least bad adjustment, if one is absolutely necessary, would be to
>> change the declarations, but then in a way that all adjacent ones
>> remain consistent (which may in turn require some _other_ definitions
>> to change). The mid- to long-term goal certainly is to use "s" more
>> where "state" may be used right now.
> 
> 
> If we drop this patch then we have the problem that Eclair and other
> scanners will detect these as violations. Also this source file would
> not be consistent with the rest of the codebase causing issues in the
> future. Any patch updating this file would trigger new MISRA C
> violations in the scanners.
> 
> So I don't think we can drop this patch but we could add deviations. I
> think your suggestion of "changing the declaration in a way that all
> adjacent ones remain consistent" is better, but let me also provide this
> option.
> 
> Basically, we would keep these declarations/definitions as is, and add
> a one-line in-code comment for each deviation. Such as:
> 
> /* SAF-2-safe R8.3 */
> bool cf_check
> x86_insn_is_mem_write(const struct x86_emulate_state *state,
>                       const struct x86_emulate_ctxt *ctxt);
> 
> Your suggestion of changing the declaration is better in my opinion. Do
> you agree?

Yes. I'm not really happy with any of the options resulting from us following
the various involved rules (also in particular 8.2), but this looks to be the
least bad of them.

Jan

