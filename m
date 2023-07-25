Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A545E761BD5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569735.890738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJ7l-0005ch-DS; Tue, 25 Jul 2023 14:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569735.890738; Tue, 25 Jul 2023 14:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJ7l-0005Zz-AD; Tue, 25 Jul 2023 14:34:53 +0000
Received: by outflank-mailman (input) for mailman id 569735;
 Tue, 25 Jul 2023 14:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOJ7k-0005Zs-68
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:34:52 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe13::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68fec8a1-2af8-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 16:34:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9268.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 14:34:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 14:34:48 +0000
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
X-Inumbo-ID: 68fec8a1-2af8-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmlhtxogpAw2ROvQ3YCBUNAp84P70j99XnTeVpRT7Z26Sa0XNnevRh7FpardI1FhVThW6SUZPA7bcI2qUXSXCm9mMPCE81Win5bHnv6Ej2biJ/Zr8X33CwUg64DsmziXUmYXL2yoY+Ooi7KWhcF0Ifapt8n1BBYN2qCY6fLiwlgTx4UrI4Mmxe72epKAAwuo7xODNMoUQVo5yqsFGn+hcdoOeS1KE84DjMbaP/rkNvEOhGfMfrWshoi1v5xZ5m07GfwECo8C8KQctjkeawo1CVyYkMJpnvhEYAnUhgPvXqWTAvPX1ALbC929TVPhFA3iEQJbQw6gyKrd5xw3o3YxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Z+R0u3M+pfsqdCUJfT0yTLEC8qgayggXAilMH2IVvg=;
 b=cvDP/K7WSX7ZUvgjB/2ou7qSU/uLgtOz8+ZYekw916sBBBBS0e3EI5BBdTnYpLvMwM225wYCQwJumNo0jUeJa2h73vAFUCrBYkEwlQdLxYda+vLXnJ+lgAedhWj1+okdp+8zYL78MVB77SZwUe2+IeeW5ZknVk+xa7wc/P8Z1YdcAmxNVnXBVaGchlUaFzQCHwYYNlWQBR0oxvseXdoWgWu06weTt0AonsWYs0Cvp2AeIuTpEkYJMhGK7xUx6SEu+8bD8Tt/JisyEjWwH5jCPG2HJOUXOshhp4k+qfxeN4Vt/Cm2hgVfxxnf/ba7Jiie/fl3anRbdxu7e5dPAbDK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Z+R0u3M+pfsqdCUJfT0yTLEC8qgayggXAilMH2IVvg=;
 b=rtZTWJAviCrRZ+vpZdz/1TcIvMmr5IeiERT95qC3uOfPllCJeaijvqyamjda3fBu3cTk1YMKkMxGmt0JLTxy9s9BTTzLm3faLDnqwADu3RfSQgZJuXM5McQlfARPcTcy/+BsqE7Q8GiLmH0a80/i++KycDAd7G0URPemJ3jGIJwz88sICMln3bDcB6RfiiA7ZmDq2fHTGAZwItGE9wlGLJJAALNU2//PZAqs1xc9yNeKVbb6ykNVTJhlm5HMs0VgO/M+uXbmpeutVlRw/rTLZKc3Ypm6dO9hJI7uiIA0Y19ofIlmJaFiYSy0V8fucw8//d+D4rm73KmwCLVjSqaAjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58b1901c-f5ee-8617-a5f8-0666c4ef51e6@suse.com>
Date: Tue, 25 Jul 2023 16:34:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] mm/pdx: Standardize region validation wrt pdx
 compression
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-7-alejandro.vallejo@cloud.com>
 <1eb58b83-87ee-d738-08b0-948a8b48773a@xen.org>
 <64be6c1c.7b0a0220.49ba9.0e38@mx.google.com>
 <79ecab0a-cb91-cc95-fd31-c76ec287fa9b@xen.org>
 <0d28d9cd-8cb3-6d03-94d3-e07a4dab9e95@suse.com>
 <dc76516e-2334-798a-216e-5ad983fea2f9@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dc76516e-2334-798a-216e-5ad983fea2f9@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: 221928d2-b146-488d-8ca1-08db8d1c4c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0U/Rb0aBAL8Q+LayBWjweqckxeYqASYmOdtKQPmrxyPY9uy/ccGjD4VleKpL2+EPwfUEUEBpE2YTbcGWYFI3It+iOeIuszTnKMyWRW4yHm+DTdYzXxK4rH/EQq2g6c5sE7A1nbbQUi76fiMExExs0vdFloNpUPUfRdXljWGWvJwIj0kmTvAsRfI+Y5v7cGQ6SSn48/W/cMDkL3kyYMhoYAjEz5cnYwCKNSLZw0Ycu/YzbyN4SWPmKphLDelaVIxaA+tBoRRpdM7TvIot2RisIH05Kw+ZXxw6Xe/HW+x/6qIF3lQ3ZTlfcd0bwHttw11g3uRiPzkFOBXLT65OUDh1/GMivscs6iBggw9fSOVBM8eRxu/mKAf7ft6Oq0rkK65Vi+s6Im1Ue6hs8P84VF7OizzsCEklyaO0WebcLQ0PHb9vh0cX5F8S30mE/UzSTJlkmHGXj1NIU6rTeH5Eck0Dtz3PacxrbtL8/mlN9XNcik6OAZpZB9sXEpP5CU7BgLmdQqHAXq3n6RLnzvye0zE4YReJZIHQZ034TNtlIyISdMWAgxqckuYBA5xzdFrdkpjMlnRl+CiMIAmP3szBjq8Yzj9goGIznHds1J7Dzkv/w9WCRL17iqMeQIR3FzVEw0scxC+Ma157NmcGO8nph7IBDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(31686004)(36756003)(31696002)(86362001)(2906002)(186003)(83380400001)(53546011)(6506007)(26005)(6512007)(6666004)(6486002)(38100700002)(54906003)(478600001)(8936002)(66556008)(8676002)(4326008)(66476007)(2616005)(316002)(6916009)(5660300002)(66946007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHB0QlM4dnVLQ0RiM2orb0xGNkhHYVEyeE1oSjdXTkJ4T1BhZloxUFFucXpY?=
 =?utf-8?B?QVp4MXZndk9CVDU4MEJ1SG51OWVrd3g3bEloUi9vRVdTdklEME9zZVlMemFU?=
 =?utf-8?B?bGsrNEIyd29HWVBsSlIrcUVMOXQwT3Z5b3R4cCtIRjFiamgzY1ZkMy83eUVt?=
 =?utf-8?B?cXJjU2N0UVFvSERDNVIzUUNGNDlZbFkzdGlJbCt0aGk0enR4VHMvNjdhL2hG?=
 =?utf-8?B?NnZCSmN1dnB3ZkYySjlmaU9FZEUyRlQzVHB3MXpOcGY0THk3NVo1Q1d4OVRY?=
 =?utf-8?B?QUpzMiswTG13Zko2b0ZudGQ1T2VlcDZnQU5BMmhWa3JTQ0N5bFdIR2s0enMw?=
 =?utf-8?B?blhaZjNjYUhNNzhibUZEYmlLTFZxYzB1T2JyRHdzeTB1dEdhc0ZUZE9UUHgz?=
 =?utf-8?B?c0YrL0tKdmpSMlQxWko1RU53Zm5MRXovR2F0TXd3K09vZUNyRXV3c3RHZTkw?=
 =?utf-8?B?MUpLMDZYODMySHpBMWI1dHlVU2xFSXlZcEVkdTBDWXVldUdSNUZhREdVREo0?=
 =?utf-8?B?L3ZXRDFkSFFGM1FlUGh4WUpKWkNXSWg3TWhYTjBIWHFxT0JxRWJPbU5iS2Ev?=
 =?utf-8?B?cnVVRGxnMVJyOUpqRU4zZjlaSW5qeHhBLy91ck5DUytuK2FkUk8vcmIrQU9D?=
 =?utf-8?B?UFkxL2Q5S2RYdTA3VkZtaUdhdDllSjlTeFkxemZlTXlYTUdsSGRpNk40RW9j?=
 =?utf-8?B?ZUJZUE5abC9kTDZvSkJ6Nys2VFc0dHhoQnMwQ01qZDM4aXFweU9SSDRqeTUr?=
 =?utf-8?B?cTFCMXQ2MWpuaGF1Ukp2VU5lbzMzTDhBZFN4SW04WEoyMHZtTWFXQWFlVkd3?=
 =?utf-8?B?R1FoV1M5VlBrMjFROTBxeE5xdUxGeUNVd1VLSXZRVkx6R0VodGcwNEVqcVla?=
 =?utf-8?B?QjFVcmlBSks4L053T282VTJNTUp4V3plVEtoaHdITlArMFFzcDJtVndaUWdT?=
 =?utf-8?B?YjNpSExRVHRJTlRITFhtL3FkaW93NVBVcTIwSGxBSHZPdW5OdnUzb1lCcmJj?=
 =?utf-8?B?VjV0cE14c2NZWVN2ZytsWmVheGZuNDVCVTVkdUQ5alFsOFVhbjhna1BKN01o?=
 =?utf-8?B?Y09zcnkyZis1MldERERDTmd4L29NNVExVUs2ekpRQ1hiY3k1eXBUenAwUFR4?=
 =?utf-8?B?M1JEa1JlaHBFbjkwSUR4YnJLbkhiQU12L3h3SFJvQ2JDN20xMWlWS3F5Z0Fp?=
 =?utf-8?B?NkUwdEZ0V0k3THZ0Z3dqK2tBQXhPUlE4WExEQjRMKzZCY0k2dHVUWmRVWC96?=
 =?utf-8?B?cWZBem11aURkdE01VEoxUkpKeThPanRiOVo4alYvcTlkZTRHVzNxOFFqRWxl?=
 =?utf-8?B?VVFpVUw0dGVkL1lreWI0RzZmWExjOEpIV2ZwelMzcndXalk3bjhQMU5uS3lz?=
 =?utf-8?B?L1V4MmJzdm91UkwyTFRrVUhGUm1vZHBZdVdVUktpSVRHK010OVlRNE1RUTBp?=
 =?utf-8?B?bzFBMVM1UzNnaWFxQ0kzSjJXL0FORm5TZXdRVFFxNk5ZaHU1Ym5YZDF5MmFE?=
 =?utf-8?B?K0pQM0N5WmlvMWRxMFQ1UTQ4WldpWDFGUkFyWGdNOG9aRkdxLzkvYU5DaUpw?=
 =?utf-8?B?T0JDTWNmWDVqVktKUnMvYUl3cnNuNWx0OUZRSDhJc0YrRTFVZmp2K3ErRkJ5?=
 =?utf-8?B?L1Mrb1BoN2tuYVdWWmQrYTZ6Q2NCRGxLMjNzbTJURW9jMWxtWGRCZ3E5d1FQ?=
 =?utf-8?B?OEFHNXNyeTF4WEZ4emhKMXZrRy9zZ1M4RHVibExWZ1k3eFVJK2VHTnRRWXRB?=
 =?utf-8?B?N2djeUVJRU5SYjVFM2xjMUdLb0xNVmZMRkdwdGdQSUNIaHNkUm5hVFRVOXdt?=
 =?utf-8?B?Vk9lTFBaTHgxZWo2aXFJY1YwNmVOVzJXZWFBYzl5bXBjUEphT3d6c2JhNjJL?=
 =?utf-8?B?b3JLeGRCUVFEdXd5ZHdOcTU4SUxFbEttTVhHaTJyZm5CeHM4ZnVYQzcwZDYv?=
 =?utf-8?B?eHVxdndWSEFnZDdoSkdydVVoY1RCZ2N5bEQ2S3Z3R1c4dEFpazRPVGhNeEFr?=
 =?utf-8?B?MFRQeG9hN1FrM3RJS2J0bVdJQkkyekMwWFZuMlFJVVpiakpkUkhLODFpcTgz?=
 =?utf-8?B?MTFMeDVDSG9sdmlveFRqd1M5dWJYNDFYQ0d3ZWQyb0Z3Z0FJYitobjYyOHlu?=
 =?utf-8?Q?COdCcUF9UyTze/ggPQ2OSt515?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221928d2-b146-488d-8ca1-08db8d1c4c0a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 14:34:47.9177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYOmad0YKucVi43d4O6EcgkBxXo//b7J7CbWORYkTMLe8/mkvJp4kcyiHzLGWI30Mp9A8hyELj+xksHA2zuubg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9268

On 25.07.2023 16:27, Julien Grall wrote:
> Hi,
> 
> On 25/07/2023 07:51, Jan Beulich wrote:
>> On 24.07.2023 20:20, Julien Grall wrote:
>>> On 24/07/2023 13:18, Alejandro Vallejo wrote:
>>>> On Fri, Jul 21, 2023 at 06:05:51PM +0100, Julien Grall wrote:
>>>>> Hi Alejandro,
>>>>>
>>>>> On 17/07/2023 17:03, Alejandro Vallejo wrote:
>>>>>> +bool pdx_is_region_compressible(unsigned long smfn, unsigned long emfn)
>>>>>
>>>>> For newer interface, I would rather prefer if we use start + size. It is
>>>>> easier to reason (you don't have to wonder whether 'emfn' is inclusive or
>>>>> not) and avoid issue in the case you are trying to handle a region right at
>>>>> the end of the address space as emfn would be 0 in the non-inclusive case
>>>>> (not much a concern for MFNs as the last one should be invalid, but it makes
>>>>> harder to reason).
>>>> I could agree on this, but every single caller is based on (smfn, emfn),
>>>> so it needlessly forces every caller to perform conversions where the
>>>> callee can do it just once.
>>>
>>> That's indeed one way to see it. The problem is that...
>>>
>>>> That said, I think your point makes sense and
>>>> it ought to be done. Probably as as part of a bigger refactor where
>>>> (smfn, emfn)-based functions are turned into (base, len) variants.
>>>
>>> ... clean-up tends to be put in the back-burner and we just continue to
>>> add new use. This makes the task to remove every use a lot more
>>> difficult. So there is a point when one has to say no more.
>>>
>>> Therefore, I would strongly prefer if each callers are doing the
>>> computation. The rest can be removed leisurely.
>>>
>>> Let see what the opinion of the other maintainers.
>>
>> I think [a,b] ranges are fine to pass, and may even be preferable over
>> passing a size. I'm specifically using that term that you also used:
>> "size" (or "length") is ambiguous when talking about page granular
>> items - is it in bytes or number of pages?
> 
> I was referring to the number of pages. I don't think it make sense to 
> have it in bytes given the start is a frame.
> 
>> Especially in the former
>> case calculations at the call sites would be quite a bit more cumbersome.
>> I could agree with (mfn,nr) tuples
> 
> Ok. So your objection of my proposal is just about the name, right? If 
> so, I didn't put too much thought behind the naming when I sent my 
> original e-mail. I am open to any.

Something like "nr" would be fine with me, for example.

> , but as said I think inclusive
>> ranges are also fine to use (and would be less of a problem at the call
>> sites here, afaics).
> 
> The problem with range is that it can lead to confusion on whether the 
> end is inclusive or exclusive. We had one bug recently in the Arm PCI 
> code because of that.

It's a matter of properly writing it down, I would say.

> So I would like to get rid of any use of range in new functions.

Hmm, seems to need further input from other maintainers / committers
then.

Jan

