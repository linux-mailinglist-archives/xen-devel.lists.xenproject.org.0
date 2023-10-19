Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5877B7CF605
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619184.963843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQmo-0002LW-UU; Thu, 19 Oct 2023 11:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619184.963843; Thu, 19 Oct 2023 11:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQmo-0002IA-Qy; Thu, 19 Oct 2023 11:01:54 +0000
Received: by outflank-mailman (input) for mailman id 619184;
 Thu, 19 Oct 2023 11:01:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtQmn-0002I4-05
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:01:53 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe12::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e75e2286-6e6e-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 13:01:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7085.eurprd04.prod.outlook.com (2603:10a6:800:122::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 11:01:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:01:46 +0000
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
X-Inumbo-ID: e75e2286-6e6e-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RF+vqA8kPqhkbitlWYfH4Qs++Bu1MJGcTGU2jS9Bimxg1br2s+SJE9pRvefT/13oCyyGpOy8WsuiBgPi5cbbltutovFEZc8J0o/dhAhlZonoztrcno6yE6K3h3RqH1qNdlo7vR8Wk3tN1Jxd5txNKNdb5mMN3qLMUT4IdRiiTZlGwell8P/oMgfSufuyU9Mck48u4t+8422SYG0YzOdsByGXVInF+AbvYSg77hflaaG4SwEXLBCD6PE2GNYZTXVDL5hzO8xrZyG1+GLwaCP6FRQAb+v8AXAFVe8Bc7GJOx4o9t4lJv64Ep2XdEt4NTIxS1RHpuhT9cyypWYIoyDP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w97+z41buHZbfnL74K1t9B50FSpjptFsJX91bsO5OAI=;
 b=OAseBJEZWX4zeUIJ5Q4zYxO5CiVVbvwRQov8osgJfTmRkFa5g+lm+9sXmmMvj13CN2MswhCRy08/QsiW7TW3b8igpCKr4BgRaj54E/mjJYJeTSOVNIpT5eGvWHS5lpX8A7qWCGJWXWLt4qhfAqOz4lcrPGzAAcbCMNB022BwZx372rCNxbKphSOAvbcQ1xwI50/9S5vQhA7GIlFHZ2YrUpnC4qtglWkkqeC/3z8XvfJsLTjk4lpFQtPdw4SVIwQkI393kH13KFAN2vYlNyubiuL4KXDhCPejOL6L9Ziq1l+kC+cdbFEdGQpfiN+u5bGcXwt9leyhMfv+HwAFG6ACSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w97+z41buHZbfnL74K1t9B50FSpjptFsJX91bsO5OAI=;
 b=iqCr1SeLENT7xLX3N+HAHEPBQc8NYkMFRrowLThUDTYYVdgnzUMBDzx2Ig9MUgzl4LfMTylU+0yKd5g5YFs27l/TXwGChi96u1awhZkXxKHB+LD34x4oktg5VBnuaEVGwUK+m43Q6lPMf6UQp8yDT9ZrH9F/PtAJ1rCTOm6CtsG9IlLXqA0CCzs6hL65CzZs6gYnvaMiK6YGgLSOEALkffMz4VI/30U+NHZzcO+XfGa1Py69b9wqXn37214ebzLcjUA8RjusnNgffhal3t2ofPHYaZUK+ZEWG+BbPzWCY6jIe5vbWPSn1AHg9FhaKqwm3mJbKxjxTj/uMwwEsBfsOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61c20f5d-a324-9ece-2140-4d0c775e193c@suse.com>
Date: Thu, 19 Oct 2023 13:01:44 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5059771d-3842-4a7c-814d-69388179b246@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 90504d1e-3623-4839-2426-08dbd092c93e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e0HE6KjTbU+4D88Zd1vqpbzpdGEFZA+DlBo/B4e8F3aiaD1hAdm6Xvwau8vqcajEsnktYWFXxejFFc8tDS1lA5v5U9LXW7k8OtJy9yekn/sY1ioQMU6W4UCt1LCE8ZNTcnJm1js+Sn/7X4r+4GO17DYtnIOPEyzEfJUB0IxbEbBehZJfeTdKJnKkXB7ZaaxYMQnbEgylXH/4BzH211vqvnUu1fS8G9Xfuz2fp7wLTui+gPNGf8nqQUwo1eU1bPQ4EKFhuVG5sd4hvakRhC/i1fvwj5VMHB9r8BkGjg2xlotWVjG1lPXNi8Rtdls2y9CzrsoZI7IbTPYpno9M04Jnxk8X3LXNl+PxIYjcSsgPsfzXzYG1A+d70UZFgDOYZDzTCASiVuTHt9GHexgdFK8hH0kHP6te/njKv+RU0Fmrf2mK5aIpM0ekTef8inz4Tvrm36G9ROYrtSHhgOGhg51fVGi0XTcTsvvqn/jsnHx77BUOvsAm/D6b2TxkzeiH86Rz8xrZ1r8SZwkbrdJMCplOGnMaXx0V6iaqFIR6S2azhObRVC2pL05siBdITc6dSAfYE9KCbTeTa7qd2NYMnKYDLInryqoDPhOmECfgvsGuclVMGkwkhcaUM+73+jUb17wWqLlsAXXZWAXtOCO8v3hfD0DJZ41TSE4txLmwzsvVcfc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(396003)(136003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6512007)(31686004)(2616005)(6506007)(53546011)(26005)(66899024)(478600001)(6486002)(5660300002)(41300700001)(36756003)(38100700002)(8936002)(31696002)(2906002)(8676002)(4326008)(86362001)(54906003)(66476007)(66556008)(66946007)(6916009)(316002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXFpeTVDanl6cG1WQlN4bG9Nbm96NjZYL0QvNTJwS0FJSW1NMWRxR00vTjJK?=
 =?utf-8?B?cW5aNTFBYzNKUExpZlhTOFl6czgwMEtWdUc4S01JNEVpSzNnSHFUU2NJMXJI?=
 =?utf-8?B?VVBBRzl0R2YzMllZUmdBd0lVRFRVbXAveHREL0J2aWIrN0dBOEErQ29iUjNW?=
 =?utf-8?B?WHZhUUFLOFpqaUJNcTBoamdSSXlRQUZsS1lGWFpQMlVWNTIySFFTSklqVVF0?=
 =?utf-8?B?T3RSZWRhdTg0YnRoYnVOdnlKbS9uQmlibVBGZnRWVy9nWjdUOS82YXdvWlRF?=
 =?utf-8?B?TGpUTUh2SWRtR3psdkovMHpjWlpUSUk2TzZwQXMvcWlyb2lMQnBPb3FEdlJo?=
 =?utf-8?B?R2s5STlGbW1GeU1NVTB2dml5NXhHaGNRTUJlNE80L0FjbkZuSHowdG5QeXRx?=
 =?utf-8?B?UUMzV3dTSGZhdmtKeFNyZmM3RmtLeDVRVnhRVWhZYVNaWHBueUxZbm80b2xS?=
 =?utf-8?B?Rlc3Z2UxR3F2Qm9NNy9xZlp4RDkrRk14NTBNV1F1R25wNHlnMkozY0p6UVVl?=
 =?utf-8?B?OWhUVWJsZUowa1B5RzNlenFXSTdKdWdyVDJkUkdwaFR3MU55dHljWi9ONVdB?=
 =?utf-8?B?d1FmQ1VabGtGSVZVOTE4K24xUVpGc3NLRDQ3U1Z3bjhPZ2l6ZjQ4V09Fd2JO?=
 =?utf-8?B?NHAvMmdxT085cFVKbks1QmFKSUIvOHNkUE5Yc21mRVFMNFh1NnE2Yi9zM21l?=
 =?utf-8?B?djFERmdMNG10emFSUlBwYnpQbi9yUmNHc3U5MTJpL2pyM2pCVWw3NGQzOUxj?=
 =?utf-8?B?RTZCOTY5emZaVkVmYnl4T2dwNThuUHpZSHZOQW1vMDIwVDA3SEI2ZXRYYTlX?=
 =?utf-8?B?a01zeHdUMWs3YUVocS9TUCt1RXR1K29aL2RqMWVlNWY2Y1VCVXp1SkJUZUZL?=
 =?utf-8?B?QjJMdHZhNzhLVEFLZWJVUEJTaVEyWWNyaEJ6WUliYWlqRER2SFI0Z0xEZFJV?=
 =?utf-8?B?S25aQkxyQk5IaVNyam53NVBRZTZVaUNQNVV4S0x6bVlxc29GYnBjTmlTUTh0?=
 =?utf-8?B?K0w0ZUJaZU1GUTN3NkwzbEkycDVVY1NwWkxnMXF0SmwrYkVvZEF3YjVEZTZz?=
 =?utf-8?B?aVoybHJ1SzR5dlJIQWRoQXh2ajg2NHJDNU4zSFpRREdkNnB4NkxJeDlzT0NM?=
 =?utf-8?B?ZFhDV25ZRVV1Z0t0Wm10VUJSb0hIandZeHUrTmpaVFdpRCtNQjFZaExCSEwz?=
 =?utf-8?B?V2VZSmYvRjNaVzFJUDJjdHpSQmp0RTZBNUtxMnhESkxiRVFIWmlZZkpiRlJN?=
 =?utf-8?B?elVlT1hyZUYzSjRBR3lCSDFocW9pZkxzM1FyT2FncC8zVVZZbjhuWDZzQ1ND?=
 =?utf-8?B?VDkwNkcyN1lBbTdaakN3bW54YjdPT0UzdXFmK1BhT3U1TnNRQllwKzVjbmN6?=
 =?utf-8?B?Vm1vLzI3VWE1Ky9zZ2d6b3czVTYwY2tFZ3RaNFNjMjlIRm1nRTFCZ2ROOG9C?=
 =?utf-8?B?Y1NncTd6TzNwdjA3ZGY3cTNXOEo3dWtWSDFIN1ZkYmFINStYQ3dhSFRRL0c0?=
 =?utf-8?B?ZE9uMlNub1JHcmovakVUQURSQjZXYmIzZFh2ZEhpbGlid2ZsMGVrUW9Pa2tU?=
 =?utf-8?B?c1JGMUo4b0xnRW9oODFsNzN0L09qckI3TS9vZGV0K0FDRndoOU9nanRMMVpv?=
 =?utf-8?B?MzdBcUFkWll0REs4SW1ySElDdE4rR2RVaTdZOS96dmRTc2kzUmErSU9yZGVV?=
 =?utf-8?B?NEdJT3ZWTnhsMHFpVU1vbmNtRUhFWFg5Yi90K2ZzUzBDOVArQUgrWGJzRmVD?=
 =?utf-8?B?UExLd0hjalFPdTNlZVBFbHhtazQ4NGxQSDFpUjV3UWF5eDlEa3Z6eDRIanhE?=
 =?utf-8?B?VUxzZGpOalpXbFo4VGQ4UUxWVEZ1R2x4b3hIeGpraFpBYTB2YnNnbXZ0cThz?=
 =?utf-8?B?THpaR2U4SUdPOXlYUlR3QnNDRXJhMHR1aUxkbzlhT3h3SUlqcUthQUgvZnE0?=
 =?utf-8?B?RnFJbGhNOXhESk1CK2xlSnZobW5PT3hCNDcvYnFPQnhQZTFNbHhVL25ReGNI?=
 =?utf-8?B?VHBKUi9JaDM2UWFLM1BPTURTeG1LN0NEdkhNdzhad2hnMkszcEVtdFliazZP?=
 =?utf-8?B?MTdBUE8vSGhnamNQdlF1NG03ZWthTm9VbUljaWNwVWYyQzZJc01ja0NUSDV3?=
 =?utf-8?Q?hUEH3V+bbxixq/XshJ+RZ0nuA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90504d1e-3623-4839-2426-08dbd092c93e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:01:46.4224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LK67Yuh3PGBttvkF0z9yIcB+Jb9M7O8CEx2B5HnRbD1o+yXbLp9MbSOZotnWwl/jlQThYYHHDy7vTHRKOBjZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7085

On 19.10.2023 12:57, Julien Grall wrote:
> On 19/10/2023 11:53, Jan Beulich wrote:
>> On 19.10.2023 12:42, Julien Grall wrote:
>>> On 19/10/2023 10:14, Jan Beulich wrote:
>>>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/include/asm-generic/device.h
>>>>> @@ -0,0 +1,65 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +#ifndef __ASM_GENERIC_DEVICE_H__
>>>>> +#define __ASM_GENERIC_DEVICE_H__
>>>>> +
>>>>> +struct dt_device_node;
>>>>> +
>>>>> +enum device_type
>>>>> +{
>>>>> +    DEV_DT,
>>>>> +    DEV_PCI,
>>>>> +};
>>>>
>>>> Are both of these really generic?
>>>
>>> I think can be re-used for RISC-V to have an abstract view a device.
>>> This is for instance used in the IOMMU code where both PCI and platform
>>> (here called DT) can be assigned to a domain. The driver will need to
>>> know the difference, but the common layer doesn't need to.
>>
>> Question to me is whether DT and PCI can be considered "common", which
>> is a prereq for being used here.
> 
> I think it can. See more below.
> 
>>
>>>>> +struct device {
>>>>> +    enum device_type type;
>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
>>>>> +#endif
>>>>> +};
>>>>> +
>>>>> +enum device_class
>>>>> +{
>>>>> +    DEVICE_SERIAL,
>>>>> +    DEVICE_IOMMU,
>>>>> +    DEVICE_GIC,
>>>>
>>>> This one certainly is Arm-specific.
>>>
>>> This could be renamed to DEVICE_IC (or INTERRUPT_CONTROLLER)
>>>
>>>>
>>>>> +    DEVICE_PCI_HOSTBRIDGE,
>>>>
>>>> And this one's PCI-specific.
>>>
>>> Are you suggesting to #ifdef it? If so, I don't exactly see the value here.
>>
>> What to do with it is secondary to me. I was questioning its presence here.
>>
>>>> Overall same question as before: Are you expecting that RISC-V is going to
>>>> get away without a customized header? I wouldn't think so.
>>>
>>> I think it can be useful. Most likely you will have multiple drivers for
>>> a class and you may want to initialize certain device class early than
>>> others. See how it is used in device_init().
>>
>> I'm afraid I don't see how your reply relates to the question of such a
>> fallback header being sensible to have, or whether instead RISC-V will
>> need its own private header anyway.
> 
> My point is that RISC-V will most likely duplicate what Arm did (they 
> are already copying the dom0less code). So the header would end up to be 
> duplicated. This is not ideal and therefore we want to share the header.
> 
> I don't particularly care whether it lives in asm-generic or somewhere. 
> I just want to avoid the duplication.

Avoiding duplication is one goal, which I certainly appreciate. The header
as presented here is, however, only a subset of Arm's if I'm not mistaken.
If moving all of Arm's code here, I then wonder whether that really can
count as "generic".

Avoiding duplication could e.g. be achieved by making RISC-V symlink Arm's
header.

Jan

