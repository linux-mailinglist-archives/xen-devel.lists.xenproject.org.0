Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67243FB732
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:47:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175115.319107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKhch-0001Xp-FW; Mon, 30 Aug 2021 13:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175115.319107; Mon, 30 Aug 2021 13:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKhch-0001Vf-BT; Mon, 30 Aug 2021 13:46:51 +0000
Received: by outflank-mailman (input) for mailman id 175115;
 Mon, 30 Aug 2021 13:46:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKhcf-0001VZ-Gu
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:46:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b85d5884-0998-11ec-ac8f-12813bfff9fa;
 Mon, 30 Aug 2021 13:46:48 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-MXQ15mMNOuqS97pH7G1s3w-1; Mon, 30 Aug 2021 15:46:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 13:46:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:46:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 13:46:44 +0000
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
X-Inumbo-ID: b85d5884-0998-11ec-ac8f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630331207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8XsJq5znX1alfF1QVv2aA5Et7/PZa2fUuK3jKBKwtJM=;
	b=YJD9vV6uGNeLg1lLMNgIB0+VQQp/uAaG4rXdkpgxDThpOQbJaOOwhI1K3n60bLAF/1Duze
	yofCwQMFpu1/Ve41J3WMQV1SHkmjDg3NeRlAVllAJZM4yov7VkllJJcNREvBqF55lXmoG9
	vA6jqx1qwGiZYxuvZVxFkI5+V5KIdSU=
X-MC-Unique: MXQ15mMNOuqS97pH7G1s3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkX4fISPPj1/RwsuEAjIH3UcYzII40JBz65HjuEzL436RrSlbqrnTDMCFc+4WrRtkYjFrLXNOvERWALWxtFRKcuQcqQc635zHT40fPDCCAkWq+4jQvl/l8KEAXPrmM1SdV/hSnlZyuXWcoGTPz5KYh1E8J9ONjizAWCsTojuVUoxCqKCjFrINMKeJLxv3KaipW2uE8FEWqvPZKBs6z456e02TqkX9x6cxcUvPsmd22CVPoBMNDalBuCD4o5tZoftTTAn8bGYDDIxuggoCRWIkIfkBEUhUKyf6zshc2ThbOikf0w4w5vLJmAMDu80Qfm0zp4XxV8VpBMnniYwfWjhmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XsJq5znX1alfF1QVv2aA5Et7/PZa2fUuK3jKBKwtJM=;
 b=SpzAIxSLIM9Wj1GqIDwMHTgjPww6F6DLEph1NfPYhPPHuXS/XI0V7/M0zCvXpD2vMwcwqe6s2blyyO8xRSppoep/MZBvnsu1H3r3X527W/4YCaXRM42RFEmCeCU52ECQxVAeex5b3KiRXx/+dxbazAsE47boN1GQiqKJ8OwnlS/rbmTHPV841KSWgWBS589DvLY3c7rTkcIY29NnCxaGgy/CKuy1TdmDuTwTZYwZJOq3KLKiThp0X3zb85MjewyN8PWzzNu5yi2yc0FC1agTBRXDWXnszrxf3Sn2Mi8WF76Tw9GMCLMOsks0KsMzMygmaDLQiPacbTqYoc/KTJMRwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 5/7] xsm: decouple xsm header inclusion selection
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-6-dpsmith@apertussolutions.com>
 <2e4471d4-7d0a-757f-1291-de6e93d1d6f6@suse.com>
 <ba39f827-3fea-faed-9fde-105d03d3b417@apertussolutions.com>
 <c40d6fd3-ac7d-c824-32d9-678c7fd09068@suse.com>
 <3c45195e-82af-b543-d00c-40555dad28a5@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <757e852c-5553-1d1f-96a9-10eba5a31c72@suse.com>
Date: Mon, 30 Aug 2021 15:46:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <3c45195e-82af-b543-d00c-40555dad28a5@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28e62c9f-a4a1-45dc-27c7-08d96bbc9ac1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26087D2216783C35AD4C1F42B3CB9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZGxdEhCjxhqlBzNZ7Ig8emmphY02DWQs73Le4GRYld1EOAxujQza6Ug40FaYeEKBwPRlgmHCwnR4aNthoE36LlluO55dBZXuyoP4RDELy6VWhR7jh6r8NC3dd9Hpi7k1MKQcRHZvYfafEEwJ+Di7tNdlOxsM7GjouJlo+3cqKrWWiFPvjm+NlxPu9jXmRK1Paamj0PZCnDeob0q50Bi1GmrviESrI6YrCVlhAiVqQbv5R7YQCwwNHHi/k+Bm9uQmTBBKTg/s0zhp3Cl3icrwwOLcgsnPF/Lk65374vYLFHPfPkm0wwgLfZ/Jr/GgANvHgBCOCYQM9wI1x6LS1PGRJPUQr5C5wqjQtmkargthBAOc6KCulU0n+eWgUax+mkmnWX55V5TBMMyRhR0475/+LsnYBT9h288FGtHLgkOPUbIGShyDj4PLrRQk6C9/flsCVBGycm8ipBt+IlX6mQdcmIASvTeZ7tKLk+XJZR+8ykMPehmkBqZlS0oWpC4/8+OFUDprMzHNHQx3AVzJVmRXJCeMNid+UZX2tMgZcM+9jvcFNHa+B4+oaRY1ERkfCxPAozw868RWZU26AnvJe4YkxHTsb40wDc64imie3+qrf0mTBFtbrDqD4xnYj85MVsDQ8HQ9HNEeVZ18sFOenjet5mqBte5TzQ12TC1NWVB7X4OmH0ZVwaPPymAN0Ih5wCrsBf4dBBiFOqWvu3OReL8yAjaaXWDtJgUKkCJJKbm4cG3bgZfHvfHQzwodDKMWWBcM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(316002)(6486002)(508600001)(186003)(66946007)(66556008)(66476007)(31696002)(5660300002)(31686004)(2616005)(26005)(4326008)(8676002)(8936002)(86362001)(53546011)(956004)(38100700002)(2906002)(36756003)(6916009)(16576012)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2plY0NNRGF5V1pES2lqSnU3aUZSL2VFT2R6NTdDWEdDUWl2M1RiZHBDYjhG?=
 =?utf-8?B?cmZoVFU3cENKZkx5UmlMQUtPTHRjcitnSjdkalhmdHEwYTc3ZnU5NVVaNFNj?=
 =?utf-8?B?WXlGeUQwQnd3SThleUxkbWJtT2NtSXRnYTdvclErc0ZHdTh4V2Zud2lLd0Q0?=
 =?utf-8?B?TFV3K3kxNVA1U0VsdjNpY2Y4MHljOWEzN1JoK1dDWHNTOWwwbFNoUUZIV1Zz?=
 =?utf-8?B?c1QwN2RUYlUyZkh2OHplakh4a2p5M0w1QVNnaVRrWFRnT0JPMHdGaStJN1Zl?=
 =?utf-8?B?Um9VdjZGTXNINEtCb2s1R2tkTEFWWHdrcDBvRkZySytja2N3aktLSG9PZXFo?=
 =?utf-8?B?MkJPM2FkdlpKNUxWMDVuK0dIckhZcExTdVR4clFqVDIzcVcxZWFaWTRBeC9D?=
 =?utf-8?B?U0hYUEV1VHBjalFVSjJ2Vkw5MXFpSVIyZ0R4ME5oL1VheDU0Ymo1QW9zVGxX?=
 =?utf-8?B?NWNxcEtWc0p5QkxJMGhZMFdSd0RsdkhjZ3JmWDBkTlM1ZDVBOUNwTU5BVWZX?=
 =?utf-8?B?NjFZV29lckpiWGJIeGVtQmZrMGkvODZSVk9QWFRqUlM2SkU4bEtpQ3VYVHk1?=
 =?utf-8?B?elRlR1l0TFNQa3R6UTBBbHh3ME9IN2Riby9kQ2lOTVBHZ3ZLMEcwYkZFMjVN?=
 =?utf-8?B?VEY2Si9NbVV5dWloMEZlNkttN1QrWUhsNU85WEM0MFdoMVRJYkU1OXNJSXVs?=
 =?utf-8?B?eFNXdU1iNS9sN1F2TnQwVjhzM0NwWm9LYk4zRVJpRkIxSUdncC9YaFpkVFNJ?=
 =?utf-8?B?NFo4UDAzRTFFRVc0dDUxUlcyMzZoVUpXbXdDTGFKbTN3UEp4RS9ad1g5Yitr?=
 =?utf-8?B?dE1ZUnlvbzRzeHg4ZUJITmVlR0xHRWJFTTIrcmRXUDJqQ2F5d0g5bGpXcVVP?=
 =?utf-8?B?VVFVT1ozOFBOOWYzWmtIV2xKTTk5WjNkeXJFSXdreGlCa2U3VDBLZUFSOTRZ?=
 =?utf-8?B?ejlUdkJPdm5uMVVqSHJ1Qmk3d0ltSU5PaDViL2xmM1piazVDTHVUVmlTcCsw?=
 =?utf-8?B?Skk0eStMYm1KTzNEb0VPSjJ6ajU2dGZGZVhBV05Rek9TTGV1bE04U0RNMlhQ?=
 =?utf-8?B?L2U2Ym9oaDVwNkYxWFRjSW9WN2JOZGlISG1ybFVVTFN5aGdFMFhoZzBpZzJi?=
 =?utf-8?B?NEIvSGUxeDdzTE4yOHU5WERqRHpndmpWY3NTb0NSSUhHUzBYOEZEMW9yWmJj?=
 =?utf-8?B?V0ZXSW1zR3VoTkJQUGVWUWpoRmFDazVoZXlVTHlzN0R6b2RvOXdnbmZiNGFP?=
 =?utf-8?B?cVhTaVRVYmRHeHJ5dGNRS3B5cUVYZkxyMEtkd255SGxBMkxNT1F2MmdXZ3Fq?=
 =?utf-8?B?WTRWRmNaTHJlaTdBY3psMGEwOGJYTjJBS3FQdjFnWUg3d0FMSHhoYndhWWxx?=
 =?utf-8?B?ZXNrUC9FbUZxajlSb0Fza1dRdmlqZXpqMmRUMnQrc2dOL3RUa0pReTM4VFdU?=
 =?utf-8?B?YWZTeFdObWE5eW8rQ3B5SG1yeVhVNVpGUnVWbk1jTVlUcnBSQVFxWXk3cnRh?=
 =?utf-8?B?UXhUeU9CcEJiU0lUa1RjVVMwWVl2OVpJdzZnZUljdVEwc1ZKVkJ2V3J5bll5?=
 =?utf-8?B?d2FUNERCWFR5MW5SeTlDVUovVGxoeXl2UjZWUjM4RmxUWWttdUN5SW1pRVor?=
 =?utf-8?B?Y0JOdVBBaWE2ekhpOUx3djZ1WnhDa0FQUnZxcndROEZNdlpXNjU5Uk9vdVJ5?=
 =?utf-8?B?YllUa3ByRHFJQ3JwWVQ4akdXZHNvZTdKMkh6NEduMFBKYXRBR2xWQ0JhQTZk?=
 =?utf-8?Q?4LxAvYB+CDzegUGsaWNXGwq+jaP0cnQL+IJ0atL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e62c9f-a4a1-45dc-27c7-08d96bbc9ac1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:46:44.4699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImL0vGVDHs5A8Rf3CMuD8wPD+SUQP/oZGBsK99fs8hsfc3WjWBTVQrXEvWre9vH7ncoLGOhac6ejbsb+QVBszA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 30.08.2021 15:41, Daniel P. Smith wrote:
> On 8/30/21 9:24 AM, Jan Beulich wrote:
>> On 27.08.2021 16:06, Daniel P. Smith wrote:
>>> On 8/26/21 4:13 AM, Jan Beulich wrote:
>>>> On 05.08.2021 16:06, Daniel P. Smith wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/include/xsm/xsm-core.h
>>>>> @@ -0,0 +1,273 @@
>>>>> +/*
>>>>> + *  This file contains the XSM hook definitions for Xen.
>>>>> + *
>>>>> + *  This work is based on the LSM implementation in Linux 2.6.13.4.
>>>>> + *
>>>>> + *  Author:  George Coker, <gscoker@alpha.ncsc.mil>
>>>>> + *
>>>>> + *  Contributors: Michael LeMay, <mdlemay@epoch.ncsc.mil>
>>>>> + *
>>>>> + *  This program is free software; you can redistribute it and/or modify
>>>>> + *  it under the terms of the GNU General Public License version 2,
>>>>> + *  as published by the Free Software Foundation.
>>>>> + */
>>>>> +
>>>>> +#ifndef __XSM_CORE_H__
>>>>> +#define __XSM_CORE_H__
>>>>> +
>>>>> +#include <xen/sched.h>
>>>>> +#include <xen/multiboot.h>
>>>>
>>>> I was going to ask to invert the order (as we try to arrange #include-s
>>>> alphabetically), but it looks like multiboot.h isn't fit for this.
>>>
>>> So my understanding is to leave this as is.
>>
>> Yes, unfortunately.
>>
>>>>> +typedef void xsm_op_t;
>>>>> +DEFINE_XEN_GUEST_HANDLE(xsm_op_t);
>>>>
>>>> Just FTR - I consider this dubious. If void is meant, I don't see why
>>>> a void handle can't be used.
>>>
>>> Unless I am misunderstanding what you are calling for, I am afraid this
>>> will trickle further that what intended to be addressed in this patch
>>> set. If disagree and would like to provide me a suggest that stays
>>> bounded, I would gladly incorporate.
>>
>> All I'm asking is to remove this pointless typedef and handle definition,
>> seeing that you're doing a major rework anyway. I'm afraid I don't see
>> how this would collide with the purpose of the overall series (albeit I
>> may also have misunderstood your reply, as the 2nd half of the first
>> sentence makes me struggle some with trying to parse it).
> 
> If I drop the typedef and start changing everywhere xsm_op_t is
> referenced to void, this now adds hypercall.h to the files I am now
> touching.
> 
> In the end it is not about whether the change is big or small, but that
> more and more unrelated small changes/clean ups keep getting requested.
> There has to be a cut-off point to limit the scope of changes down to
> the purpose of the patch set, which is to unravel and simplify the XSM
> hooks. And this is being done so, so that the the XSM-Roles work can be
> introduced to bring a more solid definition to the the default access
> control system, which itself is needed to bring in hyperlaunch.

Well, yes, you effectively suffer from XSM not having been actively
maintained for a number of years. As said in the original reply, I'd
prefer my ack to cover all the suggested changes, but I didn't mean
to insist. If this particular one goes too far for your taste, so be
it.

Jan


