Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE847CF66A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:15:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619211.963923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQzN-0000l5-S4; Thu, 19 Oct 2023 11:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619211.963923; Thu, 19 Oct 2023 11:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQzN-0000iO-P5; Thu, 19 Oct 2023 11:14:53 +0000
Received: by outflank-mailman (input) for mailman id 619211;
 Thu, 19 Oct 2023 11:14:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtQzM-0000gc-Cv
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:14:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b820a7f2-6e70-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 13:14:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7031.eurprd04.prod.outlook.com (2603:10a6:20b:116::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Thu, 19 Oct
 2023 11:14:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:14:48 +0000
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
X-Inumbo-ID: b820a7f2-6e70-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WU5CN/JNqKHeNvW0M6Uq1RV/B0qaTiLDQqwkb2aRMN5UG8bus8gYwX4PhzTUVKblQ1/S/FpzfvFmoaiMzjeckNL8zPk6BPt8EMd4OWODa7IYSZPATmI/GBRFwvYvajOBhqv/R7+zX9W1vDZXnq0xlrlKwGC56IeO/LQKbRUXQg4zZ9k2ti/DESbeAj+uwuVdYtqrqueeEMyyg9KSFHSnrgo09GGu4JJw6NSChfDblJS0JUFsISzphUKXuUDYVs54RHiPrUk5iYKkj94XFvXqg112OKSHJKTchFQMJJnhYErQm5xTf8bR4evjVCXCkype4/7k3YWn3JBoA401fv7gag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MdrXl4iI7l7+aeaOIPZKeZ80Y8hARXounR30EkZd2k=;
 b=dxyYcyh1YbvW0oV8ESWqfNzyLTgp9mTvhyfIJlmi/su/4ZW0FxnbMIvJGRRn3oJ9dFxre7TNfKcxhkqct5Nq5cQN58fZTDsoCn031a5D5ZWJPLKRWMFx36KW7SJvrmg2dZ4bpcQf3PDrcbAbBJpzNUck43LAEyoSpCxJtHVD0lO7sqWmw4DoNXwJI+F0sgcgRJstviXoIZ9s66YtnDLey4ns0HkG7K7K0EEIlDm2E3tNaCttWrfIAtF2iVvYF2aCRIBrfNACHaW+6ViaoYR0BERdeSC1J/awjKAX/Scz7ZsnI6wAucTcca/UIZ66cydsQ9F6uA0kg6cn76FHnTLDaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MdrXl4iI7l7+aeaOIPZKeZ80Y8hARXounR30EkZd2k=;
 b=NDhtD58GUdXpIb5qX/UsSsr/OB0sxN3VovWOAREGZ1eM+lgdsJmSHZp5tiVDksoL/ZbHV/NQy+LOq4ZTByb8mIhtBQk+9ZCU3L/afwBpc9WSP2vuHkaHGNIJIBaWM6wtWxMjWabA9lX65c4RMbFFwJV4vDFX4CeheBbltUsTdZE9eIaFSX6indrQcKzFfJNzKKJ+CxC+ieyqzob35pvW+ehFgrF9HdlCF70Ml3oCrMq57lO1tYrLFsmwe1v3HDdi70ijV+pf93N1aDIZSyl6KLMI2cX5yrLbiut4VGtJ0xfgy9abikeG/V35XvyawWuasgEFoQ5eF9XtNbZ4sMFr0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04fe316e-bc4f-0df8-7771-5be7ca878297@suse.com>
Date: Thu, 19 Oct 2023 13:14:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
 <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
 <9ee7b3c9-de71-4790-815c-8b2859a85465@xen.org>
 <17d9102a-da9d-d41b-6362-1ccfe21b7976@suse.com>
 <5059771d-3842-4a7c-814d-69388179b246@xen.org>
 <61c20f5d-a324-9ece-2140-4d0c775e193c@suse.com>
 <54ac0161-7302-4190-9c6e-273caa652058@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <54ac0161-7302-4190-9c6e-273caa652058@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: 879d7f91-7b1e-45d2-9964-08dbd0949ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VwYvmq2G9RVewedbHvF/Cd/XothT8N/VM4ZEGWknS5FcVfiD2uzaBGF2HPhqvhIDv9U/Wf+SJ/A/SALK48/7Ztuhpj2wBkM0xx3JSCbzGMT93VM3ynRDBE+i4ZNx8oAuh7B+EWiAjE9KkQICPhH1ZVGagC2YEuSRrF8N6Gy6oYAKIQtzJ8BzwfJy2FQUNL9wTS+nKkx8zYINbnzj8xFhv+73tpYZqMlq5Gzde/PvdA+H+68sw8yjEld1Re7Dcie650YaIc7+LH8IRHU9/PPW4nBKgw2ygdWIjxc3LDqUi1BWTut4GtvLNcnAQ8kH+Xl4R91NhmaHDPhMfKGw0jy2n/5+2PBHKDlE+IJI5x///sjRUvsspGAm/QC7wOCcg+RMHFZfsuUPFdxMW4EJancYB9N+ra56hMUR3F5z15fb10cJHSLBnfLp55Irzsu2wQHxYGWs+KWQc3zmRX1Ri6cojJWshG73L4wbb8ih74PH5Cd2SnOFWUEqo0ihANck6w9dw4T9/luvPcfl7OttRfDVji4kPzYLtcWSHKdLxzG+pFb2DVuZO8Fi745E1oJT9YXVl9rDaBDYIwY3kYWCyw8JUHBPI6XpU3zsossnr5Jp4fYYh9qeWAsVvp6TlTMCJZaIqOy52oJGWvlSUUY0BrofY89bwvt1tS5PN3g3dC/QRVI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(5660300002)(4326008)(66899024)(8676002)(8936002)(53546011)(6512007)(6506007)(36756003)(2906002)(26005)(2616005)(38100700002)(31696002)(86362001)(6916009)(478600001)(54906003)(316002)(66476007)(66556008)(66946007)(41300700001)(6486002)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YllYYmh5a1FLZnlROXZhVFQ2T0xwQklQOXJDOXQ3ekp4R1VvU0x0alc3eVE4?=
 =?utf-8?B?U3JreXRKdjNyV2lQcXRTNW1LUlRPTUplaXVnZ2M3eW5wdjlWMENCRllmc2Y2?=
 =?utf-8?B?OTJkTHo3MjdHcVdMejRod09tVjE1SDZPS3g2WUNObEpId3J1NE9JZ3ZUblI2?=
 =?utf-8?B?QlE2a2MwVEwwK0JScm1NRHNlanZoS0J4TmE4RTlVWWtIK3M2MStZd0RyVmo0?=
 =?utf-8?B?c1pBOWtWb3ducU9iaVhWd2w2MUEvTzh0WmZndlc5cnZoYmFMaHplcktYZWpX?=
 =?utf-8?B?emxXTFpGSVZ5RStTYmx0SXIwdEI5eGlNYXJVeWNMdmZYQkVuY1dMRDVYSVov?=
 =?utf-8?B?VVlEbXNmdGJJVG40azZ3MWVyWDFJa0VFOWlmd3lVR2krb21mNzR6Wi9kZ2w4?=
 =?utf-8?B?MWs4ajdocVVudXN4dkxQTDlFaHFiOVMzOXg4ckZDckt3YTlpb0NJR2Z3TFJS?=
 =?utf-8?B?Nno5U0Q0cVZpMUJlSTNORzU5cUNlNitMbVMrUjBTNk9weWlaOW56WU02YmVy?=
 =?utf-8?B?cnNMWmd4RnFHUEpPMTloTXcvQVc0STdwK2FpRW5ucmJHQjFKNE1sQnliRXdP?=
 =?utf-8?B?UHhUdDZaUlA4Yzh5cEhXWTY0bVlCRmRvZFFtRGdNcEdkeTdpTXBaY2o2RCt4?=
 =?utf-8?B?REQ0SGNUa1VhU2FWMWJXS2ptSVAyU1YzZXdLOUlsVEo5THhLdEYweW5TRjYz?=
 =?utf-8?B?di9sTWtGYUxEWW1CSjVrTzlNaXcxTnUydTNDcHRxUjdBcEFTYzk1dE0wQzk3?=
 =?utf-8?B?c0N3dWl6bUQ5S0R4emE4RGdMZjZHL0tZL1JjSU1zaHU3enQydkhoUmQ2Mkgz?=
 =?utf-8?B?TURRYXlUWXg4MTByeGk5a2ZBR2Jqd0grWlRJbzB0OWc2VnIzclcwa3ZCejJm?=
 =?utf-8?B?aWYwOGxhNEVHWXFVZGg3cGowam1UQVFaM1NMeWRNWm9mZ2hPdDZsNjFaUDZp?=
 =?utf-8?B?dkt6QVdMWVBaQyszU3RSTklvemhocjNuNmRwVldGN3BRMWI0V2I0N09nbThP?=
 =?utf-8?B?dW84OTc1cGxRQVVFaTRTdUVKU2ZsbTg4YWttKzlJNGdFL0F2ZVRsdmFhdGJu?=
 =?utf-8?B?SVREWmxKamdqdXcyMFVudDBzZnBrVkFCc1NXbDdBUGEyMTIraVBPNS9XNEZU?=
 =?utf-8?B?ZzVFbWxpMzVRbGxKUS9GaEc2OWlIWlJTK1B0MWtEalc1MkJrWWxLU3l6aGJJ?=
 =?utf-8?B?WWN2alhOemVrNERUbmM4OHFycytuYjd1WnJiNVMwaHh6MDNkTHZQWVBxMEJo?=
 =?utf-8?B?TiswQk1qWVRsRi9EYy9IanN3WWI3OEU0Rkx1NzV1RXljMEg3QWdHdnRhMGpQ?=
 =?utf-8?B?d1JkQnlPbUtIcmMwdHFvWmpWZkorL0lSLzBtdml4V282ODAwYVNqWVVoYW5Q?=
 =?utf-8?B?Ky9qQlNWeWV2bVdUb3VqTzJXUUVoaFFGbjhCNm5XUUlsWkcrMlg3T1A1ZDA2?=
 =?utf-8?B?V2Y2alpoUER2WTlUa2VwWTNGSE5FY2ExUlhueGluVTNRcHlqTHZKZzdjR3JG?=
 =?utf-8?B?dndPbnRSZTZPQ0xHS3VIb3dtK0FmNEFoanBRSjYwbUNKTGh0RFZ6Zm1WaUF3?=
 =?utf-8?B?Rk5jVzhiRWMvMTFWNU0xcVFwQ2FmWEw2S0RtVTRiNy9IWTlyVE8rNmJwd2Jm?=
 =?utf-8?B?czgrQWt0L0pRaXQ3S1hHQlUzQVFlbDI0b1NXcFdmVnNmblowTzUyeXZ3dnhn?=
 =?utf-8?B?WnNLQ1JTUUkwNGtDR2VwSkNSUHRqWGtPYllhUkcxWU9aL1ZBZWdQZm81R2Fm?=
 =?utf-8?B?S2pnRXdzN1UrUHg5VVVQTDU4ejlSRjVKbDRwMVdPcllPMHVBMmlDZUZsMU1Y?=
 =?utf-8?B?U2RHU0U4a2VyWkhBS0hXdjZCZ2NtV0FWNXRpUHVmZkpKYndhcS9DVE1FenhE?=
 =?utf-8?B?OTU5aUlkUzloV2gxVW5lSmpLcnpobGxoZkhaRlZDUjV4bkZsNlpXb092dyt2?=
 =?utf-8?B?WXV2Vi9sSmliaUswalJqd3JORVNQWktLTlE5QXFBSEM3eExYMHlsV1lqTWNE?=
 =?utf-8?B?cUtIakNPaHBEeUZibENuVlNJdUhGdkQ5MWdtcTcxODlGeTRFMHBodDFzNzJ0?=
 =?utf-8?B?UDkvSW1WYVo0Skt3bHl5bnBhYXBkZldETEVXNWMrZ2VqWSszWXh5c0RPQnNO?=
 =?utf-8?Q?fZeT6xNoGfzcNRP5UW8u3MsKZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879d7f91-7b1e-45d2-9964-08dbd0949ba0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:14:48.8852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DyLEKYSO4Mudp/iHKK3kYva+eLC6F8Nmj/kJFdv3UvgO6K4dP1sBx9pSn/vt3v7sNX1J2W4zvJ/SMi9KYj67Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7031

On 19.10.2023 13:07, Julien Grall wrote:
> 
> 
> On 19/10/2023 12:01, Jan Beulich wrote:
>> On 19.10.2023 12:57, Julien Grall wrote:
>>> On 19/10/2023 11:53, Jan Beulich wrote:
>>>> On 19.10.2023 12:42, Julien Grall wrote:
>>>>> On 19/10/2023 10:14, Jan Beulich wrote:
>>>>>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/xen/include/asm-generic/device.h
>>>>>>> @@ -0,0 +1,65 @@
>>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>>> +#ifndef __ASM_GENERIC_DEVICE_H__
>>>>>>> +#define __ASM_GENERIC_DEVICE_H__
>>>>>>> +
>>>>>>> +struct dt_device_node;
>>>>>>> +
>>>>>>> +enum device_type
>>>>>>> +{
>>>>>>> +    DEV_DT,
>>>>>>> +    DEV_PCI,
>>>>>>> +};
>>>>>>
>>>>>> Are both of these really generic?
>>>>>
>>>>> I think can be re-used for RISC-V to have an abstract view a device.
>>>>> This is for instance used in the IOMMU code where both PCI and platform
>>>>> (here called DT) can be assigned to a domain. The driver will need to
>>>>> know the difference, but the common layer doesn't need to.
>>>>
>>>> Question to me is whether DT and PCI can be considered "common", which
>>>> is a prereq for being used here.
>>>
>>> I think it can. See more below.
>>>
>>>>
>>>>>>> +struct device {
>>>>>>> +    enum device_type type;
>>>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>>>> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
>>>>>>> +#endif
>>>>>>> +};
>>>>>>> +
>>>>>>> +enum device_class
>>>>>>> +{
>>>>>>> +    DEVICE_SERIAL,
>>>>>>> +    DEVICE_IOMMU,
>>>>>>> +    DEVICE_GIC,
>>>>>>
>>>>>> This one certainly is Arm-specific.
>>>>>
>>>>> This could be renamed to DEVICE_IC (or INTERRUPT_CONTROLLER)
>>>>>
>>>>>>
>>>>>>> +    DEVICE_PCI_HOSTBRIDGE,
>>>>>>
>>>>>> And this one's PCI-specific.
>>>>>
>>>>> Are you suggesting to #ifdef it? If so, I don't exactly see the value here.
>>>>
>>>> What to do with it is secondary to me. I was questioning its presence here.
>>>>
>>>>>> Overall same question as before: Are you expecting that RISC-V is going to
>>>>>> get away without a customized header? I wouldn't think so.
>>>>>
>>>>> I think it can be useful. Most likely you will have multiple drivers for
>>>>> a class and you may want to initialize certain device class early than
>>>>> others. See how it is used in device_init().
>>>>
>>>> I'm afraid I don't see how your reply relates to the question of such a
>>>> fallback header being sensible to have, or whether instead RISC-V will
>>>> need its own private header anyway.
>>>
>>> My point is that RISC-V will most likely duplicate what Arm did (they
>>> are already copying the dom0less code). So the header would end up to be
>>> duplicated. This is not ideal and therefore we want to share the header.
>>>
>>> I don't particularly care whether it lives in asm-generic or somewhere.
>>> I just want to avoid the duplication.
>>
>> Avoiding duplication is one goal, which I certainly appreciate. The header
>> as presented here is, however, only a subset of Arm's if I'm not mistaken.
>> If moving all of Arm's code here, I then wonder whether that really can
>> count as "generic".
> 
>  From previous discussion, I recalled that we seemed to agree that if 
> applies for most the architecture, then it should be considered common.

Hmm, not my recollection - a certain amount of "does this make sense from
an abstract perspective" should also be applied.

>> Avoiding duplication could e.g. be achieved by making RISC-V symlink Arm's
>> header.
> 
> Ewwwwww. Removing the fact I dislike it, I can see some issues with this 
> approach in term of review. Who is responsible to review for any changes 
> here? Surely, we don't only want to the Arm folks to review.

That could be achieved by an F: entry in the RISC-V section of ./MAINTAINERS.

Jan

