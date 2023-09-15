Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17787A167D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 08:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602891.939694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh2fZ-0003gK-Od; Fri, 15 Sep 2023 06:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602891.939694; Fri, 15 Sep 2023 06:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh2fZ-0003da-Lu; Fri, 15 Sep 2023 06:51:13 +0000
Received: by outflank-mailman (input) for mailman id 602891;
 Fri, 15 Sep 2023 06:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qh2fY-0003dU-7c
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 06:51:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fd5c9b1-5394-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 08:51:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7493.eurprd04.prod.outlook.com (2603:10a6:20b:293::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 06:50:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 06:50:56 +0000
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
X-Inumbo-ID: 3fd5c9b1-5394-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7IRlLusZuCI9WYAOdBjNM1oPfgDlagg7R/fYjUVbBfniBPb8E7NLE67jMIEfZxZI3m9xy4J5LjtkALDIoAGdjIYoYJm+58U2fsvK0NEz4HJI3QD/wt0bG6b6cyVz/SWuss1k5ndiA6FoANI3vYp4HmvVDdCkgQ5L+azxZXJKPkWW0Kgqax3tN0Qj+JnP8VCFjvOLCoO4vGmUstipKPhjiYMDLVO2e8m4wtGAu7RQN8oF3IS1X6ClZcuFaUb8fGzTQM1aC1hphk1SVcIDp+nchhywtWj2ih2DK119BCmOcNOwpGzYJxLs6iHakmrDO2Bd49qMSinH4XW9L/dYDMGYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKTudIb3/HgKsfEuMgzNi4MCawyeX3xweHD+dxscoRo=;
 b=bvcAQKDE5RxDyx2vyC4wbegjgs9pybUWPBd16gSsynde42YVD+fE/qJkqS3gcPo/qOUvHgIYC2hBtH93KW9rQvxgaCeNXG7mQTMlHHmvfMgEVjnxcaNbYriGkkyknw9JTKH/pelY9WSKsR4twPoAy1gJrVglSbaqJDYIVkHGHsHhBTyizEOsCx1RFKAvdp015HzPPXMIu8HWmg3J9FWmalybPRXBQKmNSPhXNzUIOo+XCIQL4rnmft5MEcw6AHFZTvC3PdVThr/8OTTzs9ej2Ipz23nruwK4k9SqEuclQPrrxeMARsBLIaVNAFo5xjo0YgiNo5tVLkKJC27R6TAM0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKTudIb3/HgKsfEuMgzNi4MCawyeX3xweHD+dxscoRo=;
 b=bahh3ggojCfsI7lWSIBiRoCL1Vm1KcKavGsQ3IP8+msREb4RjwrAmv0aG7p5u4R+6UEcjFhj/b4Dl8cqffmAJLqIblZYWz1cP66LP8kMSH1frCWu5jTaLZ8jwKOAk08QBdu7BSPftIcC8kIQjp7m895b+D72hjPOGKoFGp6wCg98q7npweWcbh/2fY8SIiLabAPqm7If+bViBlBlx4Ilhy1Ld6X1+PAd1KmWOHLymt0DvMEp1PtXSDoCxoQDZHxzyl+fJFUBdVwgGUQXnnA4o+uwRZ5A/qQ0lITnPHiFhxr+Uo3Lj698v8WdYPHoUyFHert+i1qm5U6IlV7ky+ri3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <508b6085-50ce-4f1d-1897-a2aea6c3f9d3@suse.com>
Date: Fri, 15 Sep 2023 08:50:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694543103.git.sanastasio@raptorengineering.com>
 <06892692342540b6dc1af4d530fe3c2c25cf4a2e.1694543103.git.sanastasio@raptorengineering.com>
 <60d5d841-29da-519b-057c-18c5796c8f1e@suse.com>
 <fa66a2b5-1364-48cf-dfb0-cc6c2de48bbd@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fa66a2b5-1364-48cf-dfb0-cc6c2de48bbd@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: c67e0967-9f8c-4685-58f4-08dbb5b81c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yh67OA+FZOiFWaqQqlm7BQB7EjuBGJyPnU8pL7meNkyI11/JyzgDrOwWjY3uWiOML6jETls38lVKAiIjp2DAUDUTChe4vbH+Cu8CDroA8koK6LA5fqwy2szbQ3cLJ5IsO9Rfft6q21oV0bO4ynWISsodDtzD3RvoBhTQX92ilMaEUYolZmTE5inlZJCjsokoOSKrHaQuoyzHP08ciB8OlS8LCrgiB/aryu8sXmHtExC46zv6sJOmewjC4Cl/iRCM+vqhC20Vnct7/NWeB6/45grqu/09dk1iExwWK4GCM9jMGBZYUua8xunUNV70E43PKClekW/TKN4Ze/FyBuf7UtRwdI1z8eTg4/64iAVOmCeJLB49HEXO+spqYWP7EjuofonGhtBgDTjimm6Ib+N4LKikHMic/drxIIUltzXR2ULCoxBTHu4saT9OI3r4B9jPdrbsLXfeuO1A0+fwRBx2harYwbRQLDl3Rc+D4teErkuVmh9YICiNWCQYQHWSCwCajV0f5XL2s/9kTbGdxAA1oG4xTtMIlP3RCmHzkhhfH2V6rq7GdjZjrHbIIg4UySyiqTqqxskw0ZwEDsCKAaTp08xAAKRW+lRCfvYd7B0cPHsWG+ktOEP/IB1MBGPXZGlvr53k9lgm04o8jKj6um4BqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199024)(1800799009)(186009)(53546011)(316002)(66476007)(66946007)(66556008)(6916009)(41300700001)(478600001)(2906002)(6512007)(36756003)(31686004)(26005)(86362001)(31696002)(2616005)(38100700002)(8676002)(4326008)(8936002)(5660300002)(6486002)(6506007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG44cVladTU1R3E0WHlqNDNteWhJV2RFYzZ6NGRDZ0tWM0dubWpoTC9KN2Np?=
 =?utf-8?B?WFNiQklndXZDK1pJdldURTNoKzUzcnI5T3lNL09uSGcrZFRzREt1QTlsTytO?=
 =?utf-8?B?TDYvZjB6c1Nncm42ZTRsT1JyZDJNVEVPYklWZjY2aW5yaEsrQkYxK0ozQVVQ?=
 =?utf-8?B?M3hHeTZMOUxNSTFhUlQ3Y2pTMGJtQ0QxN3RCUkwyb2NCOVRoelVObjREWVNL?=
 =?utf-8?B?a3VqZXdHWEpEWll4a09QaWs1cUJZa0szdG51dldOTGhJa2ViNjRBRVlveFZM?=
 =?utf-8?B?ZjBVNnlpRWJZNktCRHI3WGVXMi9PWHNBY2VhSlI0M3E4anNRY284dDNiZFQ5?=
 =?utf-8?B?em1NRTQvSldXUnJvejNhUzRIa29xZzZaTkJhYlJxYm9JR3NWVzg1Mk40Z3Jj?=
 =?utf-8?B?THIwbzNjejJaTVZESkhIb1VvWlpkZ0pxMGRXWjBmYWk0b3JXVnp3REtVNWxt?=
 =?utf-8?B?N2VBdEhFbDZUODR1RFlQOHhxV1pvdTJOZ1UzUzhhbVRjN2VWV0FRb1hrSTFm?=
 =?utf-8?B?amMwd1Z3cHFVcllTNWs4R3NscmpBdW4yL3Z2dGJPTUUyelpxQmpIeUFIRWxi?=
 =?utf-8?B?QW5DY0lUdnZvVW5idjR1NzNGY0tsRXRUODZvUWUyUFZrZmtuZ1VHTjFmdGUw?=
 =?utf-8?B?VzdtVVZmUHF4UWdpZmtpWGJjYnlVWHhHU2liZW9pMGx6UjFCQVF2enFVS2xo?=
 =?utf-8?B?ei9KeXlrMkRqNzRmUm5aL3lJWXRPdDBFbnFwdlFOcmN4a2ZvQ3R5NVRpWFJ6?=
 =?utf-8?B?Y0lTTkV2SGRUWVZrS2trZkdaUnVwM2dOS1NjNXdNSHUwNzF6WWM2aVYrOW5t?=
 =?utf-8?B?ZmJ3cHJoM0NUT2VXeGozd1prUVdPWXZKV2xqbC8vcFJTZUVTTHdYRkhkbGF4?=
 =?utf-8?B?Q0dSSkgwU1FIU1FjSUpjaUxPSFQwUzRoeUpFbXFnZ0I3UlJCOHgwUVRlKzAz?=
 =?utf-8?B?MFBiRUtUbnlJTmR0NkV6VjhJVkdMRXkwQkxGbEFYQzhqYmRFaXBvdjBWVkUz?=
 =?utf-8?B?R1JtMFByOUltbmNta2RjYm81ZStKaGtBNDRSUjlucUtWSFhHN292bzBvSkhY?=
 =?utf-8?B?d1NWeXh3SGpObjIwN2NQOXJWVS92NmFrSWdLOXlTODVTZE1ESmNNL3psQVRT?=
 =?utf-8?B?N2JqVWpuLzVzeVJ4QzYrdTA2NkRURDVCVVJSU2JFSzBnME9xWjd5TkFnb2M1?=
 =?utf-8?B?VDVOVkdZQ3ZxcUFBSWF2Zm9wL1JJWTIranlzQktwci9wMmFyU0xDQWN2SjFz?=
 =?utf-8?B?OHAyQVRySkRkWnM5TGI3aEFYaTZzUU52aW5GR3VLNi9qYTdhU012RGttcThm?=
 =?utf-8?B?VDl2VkFnWDllcFJ5NTR3TFV2d3ZOSndhYWlaRGNNT0Vwa2xmOTcvRUtleDF1?=
 =?utf-8?B?TU5KT2Y4NmhCRUN2dkU2a1JCT04vRFhQSVpXZCtjOUpkaVRCakpxcGpITTVZ?=
 =?utf-8?B?dXRQTFcwVTdOUk03OVRwbWQ4Ny9nT1gzdER0OWd3ZkZESksxTklOT2VMZmdP?=
 =?utf-8?B?OTM2ZHh4MzM1NWozYWIyT3MwUjR3K1BIMVM5TjE4QzNNM2JRWFd0bVRXL3pX?=
 =?utf-8?B?Wlc4NllteWd0QjJKT3ByQi9jT0tTSWtRY3Q4WnMxVE9GVHFvRDJSMUk1OEcw?=
 =?utf-8?B?d2lrS0VvNGdZMWdxV3AzektVRWlHZkpFL3d2QmtaY3BHaTVzR3VTdk12TG9Q?=
 =?utf-8?B?b1crWlV0YndUYUgrcFpsZzRTVkl5WlM2dnoxWklCaUphOEdHa0ROUkZoVEJZ?=
 =?utf-8?B?eEl5MTZwN2I2Qk9KcFRVUmQrbGJ6eUt3SldYNCs2TEEwYzFyTmczK0R1RXdV?=
 =?utf-8?B?dTkzR2JqenBwbDRzUUxpOFpGNlFrZDFraXVvRHZQcE1iajRmb0pPTHNQczNa?=
 =?utf-8?B?WFNYUmJFdktvL01oZVludXVzOFZQclV2RFpzUTMwSjh5UmVONnBWSGVwME5k?=
 =?utf-8?B?OElJNHMvczhmU09FSHVLTkNLRkxTdTYzeVZER2V0SVE4a0RDbk5sdHFEUVFI?=
 =?utf-8?B?QXRyN3FHOHQzUXd0cWZEWVh3WGRGSy85TXJqc3RwWEtaV2xiUFQ1anRFelRo?=
 =?utf-8?B?cG5WTTFPcjNocGJKeGFHUWo2d1EzWUVESWVBT290dG5tUFhaMW9aZmxWK0tN?=
 =?utf-8?Q?MbG/DJpVUCiQtayZGxzf0rG+R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c67e0967-9f8c-4685-58f4-08dbb5b81c69
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 06:50:55.9738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5jSeqYsda703ifM8gwODl5PL5XPUJ8fsnUiFglCL5q9+XWT6/tvDJ+EzPl8X6XgZVCoK7d0ux8CklyVVDFzgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7493

On 14.09.2023 20:15, Shawn Anastasio wrote:
> On 9/13/23 2:29 AM, Jan Beulich wrote:
>> On 12.09.2023 20:35, Shawn Anastasio wrote:
>>> --- a/xen/arch/ppc/include/asm/bitops.h
>>> +++ b/xen/arch/ppc/include/asm/bitops.h
>>> @@ -1,9 +1,335 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * Adapted from Linux's arch/powerpc/include/asm/bitops.h.
>>> + *
>>> + * Merged version by David Gibson <david@gibson.dropbear.id.au>.
>>> + * Based on ppc64 versions by: Dave Engebretsen, Todd Inglett, Don
>>> + * Reed, Pat McCarthy, Peter Bergner, Anton Blanchard.  They
>>> + * originally took it from the ppc32 code.
>>> + */
>>>  #ifndef _ASM_PPC_BITOPS_H
>>>  #define _ASM_PPC_BITOPS_H
>>>
>>> +#include <asm/memory.h>
>>> +
>>> +#define __set_bit(n, p)         set_bit(n, p)
>>> +#define __clear_bit(n, p)       clear_bit(n, p)
>>> +
>>> +#define BITOP_BITS_PER_WORD     32
>>> +#define BITOP_MASK(nr)          (1U << ((nr) % BITOP_BITS_PER_WORD))
>>> +#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
>>> +#define BITS_PER_BYTE           8
>>> +
>>>  /* PPC bit number conversion */
>>> -#define PPC_BITLSHIFT(be)	(BITS_PER_LONG - 1 - (be))
>>> -#define PPC_BIT(bit)		(1UL << PPC_BITLSHIFT(bit))
>>> -#define PPC_BITMASK(bs, be)	((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
>>> +#define PPC_BITLSHIFT(be)    (BITS_PER_LONG - 1 - (be))
>>> +#define PPC_BIT(bit)         (1UL << PPC_BITLSHIFT(bit))
>>> +#define PPC_BITMASK(bs, be)  ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
>>> +
>>> +/* Macro for generating the ***_bits() functions */
>>> +#define DEFINE_BITOP(fn, op, prefix)                                           \
>>> +static inline void fn(unsigned int mask,                                      \
>>> +                      volatile unsigned int *p_)                               \
>>> +{                                                                              \
>>> +    unsigned int old;                                                         \
>>> +    unsigned int *p = (unsigned int *)p_;                                      \
>>
>> What use is this, when ...
>>
>>> +    asm volatile ( prefix                                                      \
>>> +                   "1: lwarx %0,0,%3,0\n"                                      \
>>> +                   #op "%I2 %0,%0,%2\n"                                        \
>>> +                   "stwcx. %0,0,%3\n"                                          \
>>> +                   "bne- 1b\n"                                                 \
>>> +                   : "=&r" (old), "+m" (*p)                                    \
>>
>> ... the "+m" operand isn't used and ...
>>
>>> +                   : "rK" (mask), "r" (p)                                      \
>>> +                   : "cc", "memory" );                                         \
>>
>> ... there's a memory clobber anyway?
>>
> 
> I see what you're saying, and I'm not sure why it was written this way
> in Linux. That said, this is the kind of thing that I'm hesitant to
> change without knowing the rationale of the original author. If you are
> confident that the this can be dropped given that there is already a
> memory clobber, I could drop it. Otherwise I'm inclined to leave it in a
> state that matches Linux.

This being an arch-independent property, I am confident. Yet still you're
the maintainer, so if you want to keep it like this initially, that'll be
okay. If I feel bothered enough, I could always send a patch afterwards.

Jan

