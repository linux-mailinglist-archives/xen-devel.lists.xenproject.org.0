Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144EC7CA286
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 10:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617335.959847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJJ7-00017W-7b; Mon, 16 Oct 2023 08:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617335.959847; Mon, 16 Oct 2023 08:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJJ7-00014d-4s; Mon, 16 Oct 2023 08:50:37 +0000
Received: by outflank-mailman (input) for mailman id 617335;
 Mon, 16 Oct 2023 08:50:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsJJ5-00014W-RB
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 08:50:35 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe02::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e666b4c-6c01-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 10:50:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9419.eurprd04.prod.outlook.com (2603:10a6:10:35a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 08:50:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 08:50:24 +0000
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
X-Inumbo-ID: 0e666b4c-6c01-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j42IW7StNZqHdLx3eY3g1DEtAG6sFvk7aBTaXpt2DpDplOeTBgtHvVu/c6696UNB63Yi4LWVrLbSndadMNSSQgqDGPzmTPTLiPuJs13CiMFZaou8+TvO8VTGjUSxz8dvugf49Wivq78FYn52MGiUx1MsmZ6PTobUWt27syAeMM90+/JhDiQVZuyvnfKunBx884ZjYjZkSaYtL/aJaxEiUVPxkcq/WNa435B6UEVxePmkEtell2YInucuT2eGkvDV4gaKzVaIBUF2JXxT0525fn9xPU4PH4jdFzLzAiM0MclXMDscwl9cJgovEPhLP9els4zJgrnRyshhsKvziDYhQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfeMYfM0EO4wUn0RXHvdyqjnNa9+vIbkLHRf20MejF4=;
 b=fpZGfMXtKm7GGwSUKJRi1jBRAoKRHbxQaw8qe6XsgfUV5yUaikrQBfQ0JJnIy2uF3f+PFbJ/LB+x5kF+Ia+Z8b16Kqx0IzOXePJsvp4wGdqWoX+mxOYt9U5fiIE5ZGfzoCT7yWwtfmfS2dWhh65DEH4f3Xc0oCYMcHuG3PpDf4e7+8cbT7VU6+xXT9SGLYN2E0D0fJy0o354Qw+UigOY5OqRzfaiHTB7ujyAP8/N4KBaINWqdTp4F5ramMVXfI4/m/RYBIaA05vK9UveBqC92MnA4P8gMZZDxqwYve3Ji1S4+aXyW8T0azf/FIjvUTpBXNi+hTez6BpKIj9K3bimSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfeMYfM0EO4wUn0RXHvdyqjnNa9+vIbkLHRf20MejF4=;
 b=juEvY0Pr1HkNfws3IXbzS2yQwmTuH4Vgs/6sXC8XnXgBJwv7EXu17tY14vVdkUrgqgXHNjKEF3cwyVQ5BvJ8gws3I41SYi6KJoUUu0G/d53gb09juspyYYF2TMUBLdSNLV1Z/TuuNF4XtgqUV44oNHhqqAZSmi104oNSwGuTjX9uOpOowzX1zWBJ2NemekIT86wEXz1Qylq7E6B0hkJ+UJyLDkzzHlT7A4SbT29dFmVF7JgnSUHaWfQu3oP3ZdQY/KekFPk4Ipmi+zqMvGuh2Fuj26fFSY4N4TWAk/xs3TtPctIiLas+gR7k8Tc6rJcnL1U3IWNPtBcgxoEPoaMg4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77096f5c-5e46-3cc4-e1e5-f62f66705dd5@suse.com>
Date: Mon, 16 Oct 2023 10:50:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH WIP] xen/public: move incomplete type definitions to xen.h
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <7a880e33ff91d0c76986159e3559c56ee6894d21.1695324653.git.ehem+xen@m5p.com>
 <7aaf91c7-6330-fffc-8df6-4be4b531f456@suse.com>
 <ZQ21//HP/d2Ppdrh@mattapan.m5p.com>
 <b9966ac8-dfc6-b6c4-bf61-05a8b61f9ac3@suse.com>
 <ZRYelcEKD63xl2Uj@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRYelcEKD63xl2Uj@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: e0900336-648b-4dab-5ebd-08dbce24efbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rKqBnD17OhZ1kpWvL2uiz8uBsBj8uS+BGkAU1lwBFH1rRL9Q7EXX2ZzDmg2fPrWzB8peb8NhgYQBMDLBGgvfB2m4DqJpF1qcROrgHRZvAjfXXQcFI9Pec2zOVv4CG8lYgcTWBzmabwkjwYSv9iHaE0TWKyz4yqItJb4FhnObFNzUIGC+7PHyY+fv9+WRSP5slF71OZNwyLxNzb5idKhG71n4tURn2mz/D1jL5fgTMDhSg/LbnnRnFVpgS8SxsdcWM5CECucxVn/gwxELS3UsOas/4aCL5/SJQ6PFEbpe6zB9hD2tCals8kSD5n454wSJ5vOfcAaNILE1iahudq/YKX91Q5wa3onYYye3L2RQZZhNQvEsPOR+sz6CpNwH8u7keJjhOgOktagGKQCmFLtdt0MJhV0V7gU5flg4aoKqyXsUWYD076R7dQlcxqGNteFaDPT0AbzVt2IA1caa2oFAQ2CjVbOtO+Dc08NmHKSdUBjPZIaQV/BbjtIqDUe+1/vTf04llmETwhoYAfSRUHoJkcYIuQPuTv/ItNI60PB29OsiSVZrzFGD9lvBPceE3TNHTavDr4s7kjyOiWPfBq5h0f3QcOALSAhlu+x8TIUTWb7u64bJf4nSZoq2eZdFwj9EYMXZVUMdXkBjFmJswR8nXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(478600001)(6486002)(6666004)(66946007)(54906003)(66556008)(316002)(26005)(2616005)(53546011)(6506007)(6512007)(4326008)(8676002)(8936002)(2906002)(5660300002)(41300700001)(36756003)(31696002)(86362001)(66476007)(38100700002)(66899024)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjRpS3BFU3BCTWpvUlBycTRHaE4vS0F3WEFKWXJZTE0zOWdaZWRtMGhPM21x?=
 =?utf-8?B?elB1QlI3aWZjYVR4alVKUGFxQ3o1Q2l1dEhVTHJLQkZxN1dvS2hkWlJaalUz?=
 =?utf-8?B?eGN5NCt6WTlweVpjTjBOUUJINm9XTk8rdnNaUEFXb2UvT0NVZHM0cDkxdHMr?=
 =?utf-8?B?ZCtkVUF0MERTQktURy9remJ5dFQ0OURkcW53K1NabDFOUytiMVB3ZDhJc3Qx?=
 =?utf-8?B?aHdpQ1pRT0lOc2drL2xoMitOMkdPYVpDSnVVWHZ2c1g2Q1BsSFNlRDZEaDJU?=
 =?utf-8?B?eWdOakM2cEk2OU1VK3ZEV21OanE0a05oQ1owUWg1ZXBQMmtkbVdHK2taQnFM?=
 =?utf-8?B?Q3B4cDlFeUlyczduUXNta2I5eldhSXlDdHJLdUU5NktWeHRKZmJKb0lVQitN?=
 =?utf-8?B?YlRHR1VITlo1VE1pRjllUUdqOFBuMmRXT2NXdHVDQ1huUENQTG81SVBYRG9p?=
 =?utf-8?B?QVc4V3BhZlV0VDhMWk5Ma2RUOENWMEtFckhKOXhnNXdCd2F1a0poTWJlM0Rq?=
 =?utf-8?B?WHk2OGNZdkwyU0ZGR2RlMkNaTzc5c3hrcURDZ0xTSmx0RUloR0lSemVNWTVl?=
 =?utf-8?B?U2xqQlN5d280bWwrb2lMOG1qOVM4dkUvWThZblNDQmIweHBuTnBhNWFmNEpw?=
 =?utf-8?B?ZVhmalZWbzBBaGJDSUxKcWpoV2tEN3dna3R0TTJqWWRUNklHelpUYktMWXBV?=
 =?utf-8?B?SkhqS0RvYm9sb0JBVmJ1eU1YOEZnT1VjOC9lYUl1YngvakVLYVFwTDdjT21n?=
 =?utf-8?B?VFBZT3gxNlphL3UvSDV2R1ltU29pRXBYcE82RWR6VWIyb3dZQk5GcmFxYmRR?=
 =?utf-8?B?OXBOUm16OUJrK2xWc0Y5SDV1UlpnQ29lUzBFclVZZC81TWFTRml0V1lUMDVQ?=
 =?utf-8?B?d2syRkNhemdKTUY2MXNkb2xSbSsyM20wWnV0WmZTMnN6eUFOSmFNKzFWcnNO?=
 =?utf-8?B?eTEyQkhuWUFZTExza05TWlVLOFliRlBlZmJkTVFNTFBaR1Q1YmgvSTA1K2No?=
 =?utf-8?B?aGJyMFBReWlKbE1uSUxHYWxmUmJVMkdrR1huSTNXMHdDZ3p4RHVJVEtQSEtY?=
 =?utf-8?B?VFZsQjVjTHE4UnR3ZmFqUm5janNFajhzWXBnYUMrZTJVZmhsTmZxSktGVUts?=
 =?utf-8?B?QXZWU1NvcHFjK29GNEoyaGd0L2x3VzYwQjh1d3U4d3l4ZjE2TGEzVUt2Wnkr?=
 =?utf-8?B?Mm1ubi9CNGZOV2N4VHNYS0poam80bWFHR25mM3FCSWxHQW1SeS9LdGZNSVRp?=
 =?utf-8?B?VzZBSEZBWXZFOHFmaGFUdGZFUTZYb0NKWExYTW1QRkZDOTF2ZDZFQ2U4UXFq?=
 =?utf-8?B?TDQ0UjNiMWRseW9uYVVIZ1NLdUpmVVVSRzg3L2I2Ulk4T0taYjJXSitab1Rh?=
 =?utf-8?B?MWlyT1VqOWRITFJEdCtkTzYwajdrTWtLZVNkVklHUlByNDFFUElhY1F6TGp5?=
 =?utf-8?B?bjAxaCt2aldtNi9vY1lIbE0yT0l3WE9LOHhpdnZ3a0c2T3k0WFFGUkRXelI1?=
 =?utf-8?B?SkZVcFU5a2trR3JFUlhlc3h4Sk0yMHV0SWFFVlUzYkNVL0RQZUhMK2RzcXhO?=
 =?utf-8?B?czVoVUxGZ283cmdyMDZGZEZyMXo4VHpYNzNmK21iME1JRHh3cm5iUDZyS0NQ?=
 =?utf-8?B?SEc1SHM5MUxVWDM4WkQvQWZOT0tET3FKdndYMzI1bGNvdDZVSFEzRy9ZTW5x?=
 =?utf-8?B?ME9YMXBveW5nL1VmZjhIdUVkRWpVOVdFUjJkSCt3NzVHWnlrMEtoaCtNT1Fr?=
 =?utf-8?B?Rk00YmJtZGZrcFJMMXd6dmJyWkhUaFA1MTB3ZWNSNmZyOUVJSXNBOUIyelUz?=
 =?utf-8?B?Q3E5UG5YaEE4THo2MWNIcjFJcVZZQTk3NW1zYTEwd29FQ01pTklrT0JVQmd6?=
 =?utf-8?B?eTdVZkFtTWw3VnBqeERDWllkZHZ5QWJ4WWNoOXJJUjNkRHovQ2xIOCtTZHpN?=
 =?utf-8?B?U2dMNnF5YjBlM2dlYW5jay9wVkw0NDNSR1U0Rnc2STFxUmlXeGgrVEdjdWdR?=
 =?utf-8?B?bVVGekp0NENDVXphMmJmdzF1QjdqbUdSR2FhZXRNaGpMRlh3VmU5dEkrSjI1?=
 =?utf-8?B?d2ZiaHJtRTVFNTI2UUYvRzJMV1RKVUMrNHdvQUgycCtrS3h1cXVnOXozZ2lN?=
 =?utf-8?Q?xbL8iZEis93jhnInqftcXCZf5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0900336-648b-4dab-5ebd-08dbce24efbc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 08:50:24.0327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEBEs+SlRF8kj2xXvd8WhdGhvH5KeGNnO41CaOWPw5O8++z8A4pT1H/mga0zD4GsMKNPIM6/7GWyg/QkeoW4lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9419

On 29.09.2023 02:47, Elliott Mitchell wrote:
> On Mon, Sep 25, 2023 at 08:27:31AM +0200, Jan Beulich wrote:
>> On 22.09.2023 17:42, Elliott Mitchell wrote:
>>> On Fri, Sep 22, 2023 at 10:21:21AM +0200, Jan Beulich wrote:
>>>> On 21.09.2023 18:18, Elliott Mitchell wrote:
>>>>>  As such these incomplete definitions should be
>>>>> in xen.h next to their hypercalls, rather than spread all over.
>>>>
>>>> Perhaps s/incomplete definitions/forward declarations/.
>>>>
>>>> There's a downside to the movement, though: You now introduce items
>>>> into the namespace which may be entirely unused. The two contradicting
>>>> goals need weighing as to their usefulness.
>>>
>>> For the case which this is part of, they're not 100% unused.
>>>
>>>>> trap_info_t is particularly notable since even though the hypercall is
>>>>> x86-only, the wrapper is likely to be visible to generic source code.
>>>>
>>>> Why would it be?
>>>
>>> Related to converting ARM to using inline assembly-language wrappers
>>> instead of the current declarations+small assembly wrapper function.
>>>
>>> The first step is you split the Linux header
>>> arch/x86/include/asm/xen/hypercall.h.  The upper portion (the x86
>>> inline assembly language) remains in arch/x86/include, all the
>>> HYPERVISOR_*() wrappers go into include/xen/$somewhere.  Several months
>>> ago I sent a candidate header to implement _hypercall#() for ARM.
>>>
>>> Problem is:
>>> static inline int
>>> HYPERVISOR_set_trap_table(struct trap_info *table)
>>> {
>>>         return _hypercall1(int, set_trap_table, table);
>>> }
>>> Without without `struct trap_info;` somewhere, this fails.
>>>
>>> Now, this isn't used on ARM, but this is tricky to guess.  Someone
>>> setting this up won't know whether any given function is absent due to
>>> being legacy and unlikely to ever be on non-x86.  Versus simply not /yet/
>>> being available on non-x86 (vPCI).
>>>
>>> Perhaps xen/include/public/xen.h should only conditionally #define some
>>> of the __HYPERVISOR_* constants.  Likely there should be a way to force
>>> all the hypercall numbers to be available (for linting).  Yet as the
>>> current Linux header hints, perhaps there should be a way to disable the
>>> PV constants even on x86.
>>
>> Downstream consumers of the public headers are free to adjust them to their
>> needs. The upstream form wants to remain sufficiently generic, which to me
>> includes not exposing types which aren't relevant for a particular arch.
> 
> Problem with not exposing the type is you instead get inconsistency,
> which can be worse than pollution of the namespace.  There is the case
> I'm bring up here which makes sharing headers difficult.
> 
> What if some project was developed to run on Xen/ARM.  Such a project
> might create a "trap_info" structure for something unrelated to the
> Xen/x86 one, they might similarly create a "trap_info_t" type definition.
> If such a hypothetical project later tried to port to Xen/x86, the
> inconsistency would be painful to deal with.

Well, that's owing to the fact that trap_info itself doesn't respect name
space rules. It should have been xen_trap_info.

> So might consistency be a rather more important virtue?

I don't think so.

Jan

