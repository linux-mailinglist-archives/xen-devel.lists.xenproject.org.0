Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5328A70B711
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 09:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537780.837290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q10Jj-0006gY-TH; Mon, 22 May 2023 07:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537780.837290; Mon, 22 May 2023 07:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q10Jj-0006et-PT; Mon, 22 May 2023 07:50:55 +0000
Received: by outflank-mailman (input) for mailman id 537780;
 Mon, 22 May 2023 07:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q10Ji-0006en-MO
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 07:50:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fd1856a-f875-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 09:50:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7198.eurprd04.prod.outlook.com (2603:10a6:800:126::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 07:50:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 07:50:50 +0000
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
X-Inumbo-ID: 5fd1856a-f875-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eY0voXm2Dofmia7GeueNl11ivS6rDJ1Vky3pnsHXKX1YjgHpVU9NMTWEUn6WZwkKzN2FOfqX0o59ZeI9UXW+JQiBiyTMDi/gxaZmRXX49It9xC8OVl6i0EUjY63SYExCU1YnLZdsaVOvJYGRW0ZyfOM878TGCRlAPgzh0SOe7Md0yGMmwgiI19Na9Y5uLwqaCRNpTGzhkdgeKKwY/bFx9jCzgTFefxrpSi2pscZC1/H9wS7BnScvEbUSOdihR49+b6Md2GSpBUbHuWTXEkv3uHet2XjCYTiweQ302OG/+OGFz9owAADM4G870ugoSUy8s42VUwWp8ybqAE9mjpHZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3a09+NcwZlsRC0FzSblUFOnpkhP1QbMO8h39Tfq+F4=;
 b=VQcsbsROlbUlKEjZgPF5P6PF2FckjYz27x5a2xYkSSw8OiGhXHdFsBZY9dHuNK6J7x96uB6dYzm7QVhZUZw0QVsqd2I2YGLuKGzlXfhaOMI2MjCTaPhY743Iy7j23Q8oM35a8yG8PR0uMLxmAhDT+f/9win1Zn+/9MC5Qcq1QgE+chHQDKjCTNwT1YKGRro21ubRQD/Y1WGoApaEaFiRp+LPIhhA4+D16b/xFEtpKLBR5ANlWFlvRKW0sqm4Uk41kWKVQmCcuzHSeRFryyKadwGXbIz0X7yxPYe6AiYhHeXg+Ppvi1qynyNvQXXg1OV8/L+Ymq1TnUtSAL3l2rw/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3a09+NcwZlsRC0FzSblUFOnpkhP1QbMO8h39Tfq+F4=;
 b=bwmgkNmI6diMkXpHlBzgeXvYTdJfRXh96n/Hf8KWlMV9ZICv+s1iv6DSvVshWBOq+RiBlNyiiG8X5yYxvl8E07tIJifJ4pDv9iGwBw+mLkB4AyYGDKf16dix1/3xvpQZ35JYKISEw0qK56d1CX9H7NjxYzmDw5FvbjIiuwe5kNq7M7WQV9abUK8KVTpVppRgn/uXygKZg4y9t9eYJOUacLyT842MiS1uPstgshZ0INtohiDpercS0j2HBPhdKCmP8My/EkE81mCAwCdDIDWyt7VEOSXabGgZo5QcsK8vewyfpz0hhfopicJspq7M2N2mSxVZp/vurRbd7Za5+SMGdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a21f2917-052a-ddb5-3de5-1ea58cb55252@suse.com>
Date: Mon, 22 May 2023 09:50:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 01/12] xen/arm: enable SVE extension for Xen
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-2-luca.fancellu@arm.com>
 <1fb3c4a2-8bc7-45e4-7ccf-803157f1b3b1@xen.org>
 <86D7B5C8-2671-4359-A48D-E7D52B06565C@arm.com>
 <2f14dad9-25f5-7ac7-4ff5-d756e6f55718@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2f14dad9-25f5-7ac7-4ff5-d756e6f55718@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e65663-92cd-4686-65d1-08db5a9942b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EvFNCzUaGC9v32KWcmgZZH2HVXoVzHmuzRWJb9GG8cImfH8Y7uazdq3mJFZE6/ruO/y5rFuLc8N0Fd+yduPZxOFmcru+qqOlUD4EJ4gz0MGdIP14kXz8drzyPGoiVQoNhU+/JDKHZWVitcGOIhYrSID5KY811rERpIw9yErjPid0sr39Ym3aL/M2bge6TnIvwA6WANSbJ3l7yf2qcnzrpxxxk4izS/63jBXmHNpXAc3TIdVB3YShInIC/BI+SiGiHS+uvZgxNItVv79S4hMxAO9fzn8+nPuKnJEarwU8AG4/XJljBmG89mJUzMb0c8oB3E73KQrSMF8Zi1cemQaEdk/TuM73OzTAn++VtMdo32Pvkau6eglmT0CKXw7fXvK1vkQQ28VYTP0/fx2Dy8yxk/MRyczt9j/L+pJZszqmv0MRtS9AX0VCGoaBhTtJPjt4S9BhzS/b2QnJuS7tMyraxzUbQi7q/AexqJip5BIb8pCCSu/GxO9N9CWluJ0eQTilJnAxe7+/FpwQHzKFzuk7XiaVGiMr3gkCu3DvxdMOwtV+t2lmVSkXew4X4IiZ+ABeznqiutcFhBZUEY8GUfb4xaNb5yziyPBhIawGy77qY6VM72WbhgUZA1LBI38Cl2pY0dKLTwm9vyeVfSKXmvBmig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(346002)(376002)(451199021)(8676002)(8936002)(5660300002)(186003)(26005)(53546011)(6512007)(6506007)(83380400001)(86362001)(2616005)(31696002)(38100700002)(41300700001)(6486002)(66476007)(66556008)(66946007)(316002)(36756003)(4326008)(478600001)(110136005)(54906003)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck91azJjVXNuYUljZWxzMjBrU2hpaUpJN3VsL1JUcm5GQXpteEFudkdWQ0pG?=
 =?utf-8?B?dU40LzNvdmxYNDI3SWpieGx3YWZKWngvNFFZM3FIcnVTNFJBSWdQY2lIM3pi?=
 =?utf-8?B?ZnFWcm1LUVU3dHFSbDhlMHBXZkovOHNrdnJSZDhNditLanpzUjJidFYxeWNH?=
 =?utf-8?B?YXpyT1VTbEVqY2ExQTB2a0FyUzBKV0RjNnh4Z0NzM2V5R2hvUldJM1paTGZx?=
 =?utf-8?B?YVZWRi9yeWlVcUJpVmFYeWNVWmJybEswWTVIclFQdEE0Vml3Y3dmQ1IxYU9K?=
 =?utf-8?B?VlovMWdFWFROWXUwWWhsVDMwandseVkzaWtkQkJ3RzIraENWNk5DQkNZbkJG?=
 =?utf-8?B?YXNSZk5CejB4Qk5EeUpkdnZ4cHQ2ZVhHWTcvRmIraXI1ZS8vc0c1clJNZDRO?=
 =?utf-8?B?OTY5RUVrVGVkTGNHZjRNWUp4MU5sWlBEY3huVWV3ZGJ4dnUzZzdJRVF2Z2Rh?=
 =?utf-8?B?RFh6OSt1OTJwb0NSUTJDT3Y5TndKa3AreXBQenduamNxbGEzaUpPZnNhY0pF?=
 =?utf-8?B?WXZSYTJEbkhXYy8xbDFRVzRkaTZ2bGlWMDNKakNXdTkwRnliL091S1lRa0xq?=
 =?utf-8?B?RmZwNkpXTVZPc2JJTzlCNWZsOCtZMEwxUWl3YlJ5T245anlXeTBzTXpoUHhO?=
 =?utf-8?B?Zk1RV3hzdldxTHRWSVl6OUhxSitzNU5BYTFhaU0zN0hDOURub3phK2VWRURR?=
 =?utf-8?B?U0ZZdEN4enZDR2NUY2xtN2R0TUJOeDU0dExkeWRZOHFIYTRtenBMT0ZYUmZD?=
 =?utf-8?B?UVc4R3BKKy9zeVNMaUozZW8rN01EWjFwbXgvSFVuVUt2OFZJcEZGZVpDQ0hM?=
 =?utf-8?B?KzNXWTZaMksrMXIzR09HeXVJSFZlbjVwSkZNUWx4NXppa3RwUEJCQmFOZUxD?=
 =?utf-8?B?NklXUTFsUVdMeFI0LzZBZDgxWUpVMlpXdmR4RHZwSy9TdGVVaE5Mc29HeUZ2?=
 =?utf-8?B?VFh2NFlTR1BxSkFCUWpibnZ6UXVqcWNTeGlNclpETTRGdHd6TFE4cWZGVm5B?=
 =?utf-8?B?OFluT1c5bFIvVjBjUkN5dlI3ZkNKSitDWHI5RmRLVDQyaGsxRE91YUtvTEVO?=
 =?utf-8?B?Q2hXVFZrWk5iT0liTGVzcGhjUVZhZTdiOWFrSEhFT2ZaMTk5Q0UyWDVkLzEz?=
 =?utf-8?B?SVNjMkFUNGRFY3pxUGdrRFcxNmdUZHVvdjlZQ0ZJdlRNTzlCbGZydVVyeEhP?=
 =?utf-8?B?Vi9uNHU3MnRpN0FFUWphSTJNZzA0MktQS2M4aUhmemZtYkNmRkVPQlVjaXdu?=
 =?utf-8?B?SDlGL283enMzbVRIWmQ0NVVWZDZIUzlKeUlWdlU2aDVCU0RaNjBod3lLYlE3?=
 =?utf-8?B?ZkxMcE9GTmJkN2JvVnEwRkRYRUxIRGN5SisydjQ2UGM1b1poTzY4azZhd2JO?=
 =?utf-8?B?V3JhSkhQMHdhQlptZFZ2MzhTZldPWVJCSU1Mb2JyM2R5YnFvcGIxZnJBUU41?=
 =?utf-8?B?aCt0UWQ4YmVrZnRtQTlGT1kwZjlLeU41STh2YkhRV1J2VnNDTHJsSXRQUlc2?=
 =?utf-8?B?TmhYVE9lOXBQa1g2UnIza0ZBQlFTVnQrblNDVHhGdXhQaXNFVFpZbzdVeTRK?=
 =?utf-8?B?d3hYYWFpMzRSSGpjS1lZK0RQczRMVzl1dk5NWWFNMFFTUjJ1UTFLTXh5WDBn?=
 =?utf-8?B?d2VXamRrcWgyYUNVbkZjUC9VRVEreTFSb3A5YStEZ2cxSW5EanVnSEc5dkZi?=
 =?utf-8?B?anBYbWFySkMyQm1TQmR6OEpDRDVRMWRlcXE1OW5lZnU4RUdIZTYrZDZzeGtX?=
 =?utf-8?B?azVsR1cvRkh2NzdVVmwvOE5KSjlReXJFcTliMkd3U3hablZRNUtwQ3d4Mm0z?=
 =?utf-8?B?Ym1mZno2eEVRaTFJc3V0MVhGeXdIYVFQdGo4R2pLQXRXNEdYOHFjNlZKcUgv?=
 =?utf-8?B?YnNmeU4waWpDclFvYml1SmNoZUp5WFlLMGN0SVpGcklRc1J3Q3NPK1hYWGUy?=
 =?utf-8?B?ek0vaDNNYXY5MlpySjBlNWt1aFlxamJMdWRYUGFLald5aGtETVVSa3NFZTYy?=
 =?utf-8?B?RlJxRlcxNVhMNzIyS0VhMXZZTDZuUVhLYW1KL1lFQnBnbldrZkJTQ3o4MW5F?=
 =?utf-8?B?d0Z3aFB0VlpPQlBtSEhjWmJLMU13YUpxa0dQSjh5cHJSc3I2TzJKT1Zzb2Ju?=
 =?utf-8?Q?eADb8Qy7u+SRTsWwNlJjSHLXb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e65663-92cd-4686-65d1-08db5a9942b8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 07:50:50.0749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzGSaeNVJmH6Ja9/4U8N7qrUvhRvxOPsXZHWqZBwVhZiycpnr9+IxV2zUegvgEwlJdUADopSOyfKrKG4pvkCwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7198

On 19.05.2023 16:46, Julien Grall wrote:
> On 19/05/2023 15:26, Luca Fancellu wrote:
>>> On 18 May 2023, at 10:35, Julien Grall <julien@xen.org> wrote:
>>>> +/*
>>>> + * Arm SVE feature code
>>>> + *
>>>> + * Copyright (C) 2022 ARM Ltd.
>>>> + */
>>>> +
>>>> +#include <xen/types.h>
>>>> +#include <asm/arm64/sve.h>
>>>> +#include <asm/arm64/sysregs.h>
>>>> +#include <asm/processor.h>
>>>> +#include <asm/system.h>
>>>> +
>>>> +extern unsigned int sve_get_hw_vl(void);
>>>> +
>>>> +register_t compute_max_zcr(void)
>>>> +{
>>>> +    register_t cptr_bits = get_default_cptr_flags();
>>>> +    register_t zcr = vl_to_zcr(SVE_VL_MAX_BITS);
>>>> +    unsigned int hw_vl;
>>>> +
>>>> +    /* Remove trap for SVE resources */
>>>> +    WRITE_SYSREG(cptr_bits & ~HCPTR_CP(8), CPTR_EL2);
>>>> +    isb();
>>>> +
>>>> +    /*
>>>> +     * Set the maximum SVE vector length, doing that we will know the VL
>>>> +     * supported by the platform, calling sve_get_hw_vl()
>>>> +     */
>>>> +    WRITE_SYSREG(zcr, ZCR_EL2);
>>>
>>>  From my reading of the Arm (D19-6331, ARM DDI 0487J.a), a direct write to a system register would need to be followed by an context synchronization event (e.g. isb()) before the software can rely on the value.
>>>
>>> In this situation, AFAICT, the instruciton in sve_get_hw_vl() will use the content of ZCR_EL2. So don't we need an ISB() here?
>>
>>  From what I’ve read in the manual for ZCR_ELx:
>>
>> An indirect read of ZCR_EL2.LEN appears to occur in program order relative to a direct write of
>> the same register, without the need for explicit synchronization
>>
>> I’ve interpreted it as “there is no need to sync before write” and I’ve looked into Linux and it does not
>> Appear any synchronisation mechanism after a write to that register, but if I am wrong I can for sure
>> add an isb if you prefer.
> 
> Ah, I was reading the generic section about synchronization and didn't 
> realize there was a paragraph in the ZCR_EL2 section as well.
> 
> Reading the new section, I agree with your understanding. The isb() is 
> not necessary.

And RDVL counts as an "indirect read"? I'm pretty sure "normal" SVE insn
use is falling in that category, but RDVL might also be viewed as more
similar to MRS in this regard? While the construct CurrentVL is used in
either case, I'm still not sure this goes without saying.

Jan

