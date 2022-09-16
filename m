Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B055BA68D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 07:59:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407783.650394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ4MZ-0000S1-TC; Fri, 16 Sep 2022 05:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407783.650394; Fri, 16 Sep 2022 05:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ4MZ-0000Pj-QA; Fri, 16 Sep 2022 05:58:07 +0000
Received: by outflank-mailman (input) for mailman id 407783;
 Fri, 16 Sep 2022 05:58:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCzl=ZT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oZ4MX-0000Pd-EI
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 05:58:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60041.outbound.protection.outlook.com [40.107.6.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86b722b1-3584-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 07:58:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7493.eurprd04.prod.outlook.com (2603:10a6:20b:293::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 05:58:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 05:58:01 +0000
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
X-Inumbo-ID: 86b722b1-3584-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alwNkLk8Xuv5SakcKwcrOe6z2XET3Fljfl2A9Atju+pEX5ZClyE9pNkS8HfxfSVXcvyqDX6nAmNPs80l8nbw5tmz6cEsnlS2pIhl6DpqctWHROkSIbXj5gJ4KrEexPIzQBGFz1KWvZRFmloaDBtoELMBcfERqRKEaC0ZcpAeTiwkrlO/2/7l9nSuJGxSQnFaop4V6MqJgB9GcQTds/OVCmCyPOnRtdH+SHkZbqlypSQjWsJ2bWQSDrsRRSze1Al1PruCb8KwxGOaTnfpYlKZmZMaPy+xutSItQgrC70XOWJVv3RzTYSkyofbGFPXO6E5g4dy/7KS0Gr0Af2I3vWPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67A3P69kv1ZBb0fhpT24bmWX6p7laKPIKjOQsCMuCao=;
 b=ZXWq8E7iNHtundmTyWNS9J73QGJp3VVGaL+ptb+5RjIkgj4FU1BLjF81t/5BrxN+cSNt2Ycrk2ZoY9t52e58eKvQran9Hzm7kBveV8WSc11/CHC6OtYFmzy7PWEgihTytcwUDBSAAzdcF2/M8iIdv/VyYP/e+VT3lYBqZrr8jsfFVuXlzsd3psQnldhf4A/5w9Aszyx9ThZ4J5xtrJFll4i3SYerAnBPjTaNODZ6GazZVXIr7SaKhoTLgCmsSuW5EJJ6ONKFRPpkLcCwIEmiK8hklJqZVwXjcLRWA5FEZe6pLyCOcpB/vXIe7p2Ws5Vy0ZoSwDymZCSjjcYdtkX0iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67A3P69kv1ZBb0fhpT24bmWX6p7laKPIKjOQsCMuCao=;
 b=3GDwhtvX8WqydwNp9DNbIzK1nUkWSxw4KroQI9Bkl9V8vCwKZBNWQLQZXy1RTa2zmOCjDCC1BaabU+0J318LdDLDam6iXCKRUktm7dhcBttGT/g+2vye852VjeddEibeZdZK+4C/NvVTx6XzpLswfKx+tYnHdrEufgCE2GjQaQ+nXsYKimBI8mFh1mhvCMO6ove19Ifqga+p4GEn3dIlcsQhq/q7251SNb6im+tr4n3UsrDndBh/O+hZ7YaBc0RClpZOvGGUHqtpyT04PV1eO/1nN3DbqvF4Rz0BxZno7gpt2SWndQJsj1dPOhxJpNM4jLlgJfyuOOHjJNe58K5lIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2697981f-8ae2-d3e7-1a6a-046927a66246@suse.com>
Date: Fri, 16 Sep 2022 07:57:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Console output stops on dbgp=xhci
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
 <YyJOWDWYVpShtAU9@mail-itl>
 <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
 <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com>
 <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
 <7adee56c-607e-7d3f-8aa6-1ee5b2fdd133@suse.com>
 <CABfawh=y_ACt-YAOOxiLVQoHGJZ_K8Axt4TyXMAaRpT9cYmJyA@mail.gmail.com>
 <6bd99d37-f9e6-647a-6e2d-d774fcd597a3@suse.com>
 <CABfawh=si40W3foBq_W0nZ_NVXxPyeT02c0+L9k70LwsP=jjsA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawh=si40W3foBq_W0nZ_NVXxPyeT02c0+L9k70LwsP=jjsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0090.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 40cc1c55-1648-47d2-033a-08da97a869ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FGdiWJ7wOq4dxDUlCW2b+XAAqV2i/Aiw8U8Pb2vMFpBndiqE2dAkTXoJhi850MCQHIh5OjhMUagf80aye4Ffhmh2n8tXXI1CZLavBZ1Vcod2WM2PzVEk6Zc+pZzbUvG8QKS4TppOsP7wycyw13V8gILJ5l3h3jeMJGqyCi+acUQUfRNiUv4qTBCTm7EJCJ48GiK+qP6CUExnttfJOQgx8W+BfZSZEVRvwm3rT8TBbzOcT9VaG+j6ca48vHPWJOgHjGvy8RvIotMCOSQdGMzxF8RD4iaEgz2t+Wn2dHrHEmn32Dh+LQKGzTx8F4PzgKXTqsXmkkjgd9THSB9os6JMsBZKVGww41SJaMEOqrFGX/Iaye8uG7dGgvwBYQI0PFp8M/S8LvDYo/5Erp1Gt6bx0Y8y4fUXX3d0f+xsTPL455XYm2TEHEwrZy2ItX73DEP+P6Hp77ZXf0DXWYQEGu72NXlepL/iLswRqzfXH7jP8j4aOQ9nhyxXt8bVOdqk7ENg2Hur9yhOR5V9vjiQKgjWmyC2fzrsnz+uUlx2VwkXbb2iETJJAUl2L5008AR6ekcBD/r+LZT0/d8gCSvqpJBtNzd+zRkwbyhK1HkJHdI/ysk6gPZcYYICkFbiv5A/yH1m83mxgZWcA5oPKpiOb3wCAw5ey3VjTZCxV7qxulZlvUvSCS+s7PteW47krF+IT0GBC6ySYQL+ChMqXX33CHYR42OYfwLlqln6bbTzL+eIeQzwpYmrBVrFnpuaeaZURnyCLNJT6SClQuh4gmv++wmhFi/wC1E0iCKXGHBYkfbwkUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(316002)(36756003)(6916009)(31686004)(86362001)(31696002)(2906002)(5660300002)(66946007)(38100700002)(8936002)(66556008)(66476007)(478600001)(41300700001)(54906003)(8676002)(4326008)(53546011)(6506007)(186003)(26005)(6512007)(6486002)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVVkSXJiUGx5dit3SURrYWVNcE5VN08vb0o2UG96L0hkMGpJQXhvc0laeUY0?=
 =?utf-8?B?eERvQzVWeFFkTVVaQVkvWHVoQjh6ZUUwNzlFTDJpVnhzVEZ5WjBmMDFKTEVH?=
 =?utf-8?B?bVdLMDV2WXo5c3BqTGFVNkhMV0VnYlJweFd6U3k3cVY5REFuM0Z4QkZwcmtl?=
 =?utf-8?B?K2ZTbndzT3I5QVkwbjdtRWRvUnBmdTVtQW9BZ1hlc2xrOVRyUFovdW9rM0Zt?=
 =?utf-8?B?b2lSOGVpVitDeExRR3cvZDJQRFVmS0x5RWJKWlBMcjRLZUdpUmxQL0JyRUZE?=
 =?utf-8?B?ZW9jVHNNa3ZFUzFRY0tFUlBobzR6Ymt1enhIZ2c3RnpWcjE0VGVsWlo3ZWg2?=
 =?utf-8?B?WmJhMmR3RjhoMlVtOW9mNFUzbmo4Y29raUNKTXkrWkR1YWZqQmpoVkNBTVh5?=
 =?utf-8?B?dDViOEpUSTI5UFZNWnZ5TnBoUEc3QytDLzkrYjRiTFBNSHFYOE11ZnExTzBk?=
 =?utf-8?B?cnZNVEVCdXpnc1BUeVhoMVo5NzRwc3JuT05YaVRxYWZCUHFjcTg4RkEvT2Vz?=
 =?utf-8?B?UmdkMzlIRmhYVk85ajl6MFFNWU02S2lOT29kMzdCb3o0TVcxQWRzcUtCcHR6?=
 =?utf-8?B?cGNla3QvaThiRDMxKzIxRmZvYjFPaGJES0NOMFUyKzcyK1k5NkRJdk9ZMFNj?=
 =?utf-8?B?Umd3QS80UC9RbTV4aDNsTXpHZmlEU09pSm9yMTVXNmtpRkV3ZTdXV1k0Mnc5?=
 =?utf-8?B?NHl5MkFjUXM4RUZPMDdlbFNSbG92c0NMcGZDWHp3NVM2VkVRS2tDLzhRVVhi?=
 =?utf-8?B?WVNtUW42M3VPSDExVzNOcUtBOXU2L0V3Y2JHL3oxUEZDaGRaVWJ6eVhWYkho?=
 =?utf-8?B?dzNIdEJEYzFxVXZYMnBCZ0Y1UkhXemFJamRCZVVIb24zMGh4MDFYM1cyYjdW?=
 =?utf-8?B?VzNhbnVwVUhITmNDU1FjallTOW8ybGlZT0xQTFFVZXBxL3N1QmQ3Q1RRRFR2?=
 =?utf-8?B?SEUzNU9YVFFOY0tsQ3JWRTVkTzBMNnRGMlE3cGRkS2hUeFJqbFFyUmtkN0dm?=
 =?utf-8?B?RzRWdlhiWFU0UnZzN3QwbENzcmYzZ3FkYTZCTEpsK3FwZmFVR2VTU2tKK05B?=
 =?utf-8?B?Y05sbG5MODZ5UVRjcVo1NEwzWHl1MjRwTmpSZVNxbzRPQ21DcVUwb0UvWjJr?=
 =?utf-8?B?dUhoUDR0dC9rNUo1QlRxS0tMK1pxWmJ0OGlQWWthRWU0YUNhbkZlZWEvM0p2?=
 =?utf-8?B?ckNTRDFPTkhXRWRvYUIzVHB6NGMvaWQwVUQ2VWhuVjNCNGJRYnhEeEhvSUVo?=
 =?utf-8?B?S0tGZTMzSHNSdWg1eFREQ3pnT2lYcjRNYTVvZ0VrV2VWR09oYTUxN3hMbXRp?=
 =?utf-8?B?UnF3cGRhYUEySlIzM3g5Qit3Q0svVm5zbVVUWGMrcGJzQ0Z2RXhnSFFVeEw4?=
 =?utf-8?B?dW00RFBzWmlUQ05JbFgwcG1Nc0E1TXpaNU0ySmJzc0NFWFRWTHNOV0U3RVRH?=
 =?utf-8?B?ZnkxNG9hellWa1lrcksyajQraVpGcEU0WDhWb0MvcmJkTHBVWjJ5enFBd0E4?=
 =?utf-8?B?dGtPMDJnNjNTc2NYcmxKdGk3QmZyWDFoSmVKcysrU2hPSWZ3b3hUc0ZjcFZl?=
 =?utf-8?B?RENkMmxCNFJRZ25xQkdJcS90WXM0NUNydHcxZGlzNFRGUmQ1NlRQMmdZYlVD?=
 =?utf-8?B?TkRMNm1IOXVLdytDKzZ6ZkhMK3FjSjJzRzhkaHFwUWNBUUEvMksxbjdmM3p6?=
 =?utf-8?B?djhabVN0aXZ0TUxvSE02N1paTTEvbkdJMlhucUsrSFJxRUUycmhCS2dKRWJF?=
 =?utf-8?B?TE1JQTdmVGZGS05hVFlzai81aWtLcWVjUFFTLzNqMnR5UnpmNy8xeWVGZzZL?=
 =?utf-8?B?ZUt4RE1tcmtRVWRoNktUK3pDNjZnRVFSSThqMmRsR05ySUo0ZGxRRk1HQUNz?=
 =?utf-8?B?OXR0WmRYeGRsdC81bzEwY1FBbHlLbTk1c0szL0N5MUkxaE1hdkx4d3JSSUcy?=
 =?utf-8?B?SzlxL3krQXFzdnQyUWlPdjFjZ2o5WW5WcEczRUVxSXI1amdRK0E0clFNZllV?=
 =?utf-8?B?RWpTblVHQWtmbUFXTmxwU0VaeG9HZkVvTkkxNjZyZ2NPYTdvNlJuTzFxSHRw?=
 =?utf-8?B?d3dWUnpSSXk1VnBHNGNjZUZvQm9nandzMXpCbERodHpTMjRUUmlXVWlxQ2xx?=
 =?utf-8?Q?i2Hs3AX6Ewmm/UeX2sV3vAdWa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cc1c55-1648-47d2-033a-08da97a869ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 05:58:01.1780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nf0AHExedJuXATR1tGoEFXIjH8w4kE82zQZrOTCWrSyuFrUYvFKwcuJvE+O99WyFOmMFnym1Q0C/XaSIO44uXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7493

On 15.09.2022 18:48, Tamas K Lengyel wrote:
> On Thu, Sep 15, 2022 at 10:39 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.09.2022 16:16, Tamas K Lengyel wrote:
>>> On Thu, Sep 15, 2022 at 10:10 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 15.09.2022 16:05, Tamas K Lengyel wrote:
>>>>> On Thu, Sep 15, 2022 at 3:56 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> On 15.09.2022 02:41, Tamas K Lengyel wrote:
>>>>>>>>> Do you have any idea what might be going on and preventing the output
>>>>>>>>> from showing over USB3 afterwards? The /dev/ttyUSB0 device is still
>>>>>>>>> present on the receiving side, just nothing is being received over it.
>>>>>>>>
>>>>>>>> There are few more patches in the series that are de facto required.
>>>>>>>> Especially those about IOMMU, otherwise it can only possibly work with
>>>>>>>> iommu=0 (which I'm not sure if even is enough).
>>>>>>>
>>>>>>> Unfortunately with iommu=0 Xen doesn't boot at all for me. I see this
>>>>>>> on the console:
>>>>>>>
>>>>>>> (XEN) Panic on CPU 0:
>>>>>>> (XEN) FATAL PAGE FAULT
>>>>>>> (XEN) [error_code=0011]
>>>>>>> (XEN) Faulting linear address: 00000000328b3a54
>>>>>>
>>>>>> Perhaps in another thread, could you post details about this? I guess
>>>>>> we want to address this independent of your XHCI issue. That's an
>>>>>> attempt to execute code outside of the Xen image - the only reason I
>>>>>> can think of for this would be an EFI boot services or runtime
>>>>>> services call, with (possibly but not necessarily) quirky EFI firmware.
>>>>>> Any other context this is appearing in would quite certainly require a
>>>>>> fix in Xen, and I don't see how "iommu=0" could affect the set of EFI
>>>>>> calls we make.
>>>>>
>>>>> This was indeed observed with a xen.efi booted directly from UEFI.
>>>>> Beside the limited boot log I get through xhci I don't have more
>>>>> insight but happy to send that (and anything else you think would be
>>>>> useful).
>>>>
>>>> And with "iommu=0" but no use of XHCI it doesn't crash? Or there you have
>>>> no way to collect the log then?
>>>>
>>>> In any event, from your description the interesting part might be the
>>>> EFI memory map. That ought to be pretty stable between boots, so you may
>>>> be able to collect that in full via "xl dmesg" in a run without "iommu=0".
>>>
>>> I see the same crash with no xhci debug use. The EFI map is:
>>>
>>> (XEN) EFI memory map:
>>> [...]
>>> (XEN)  0000031f72000-0000032a95fff type=3 attr=000000000000000f
>>
>> This is the entry covering the address, which is EfiBootServicesCode
>> with no unusual attributes. Assuming the crash was still during boot
>> (of Xen, not Dom0), do you also have at least the full stack walk
>> from the crash, to know where in Xen the call chain started?
> 
> I don't see a stack walk right now, but it looks like the path to it
> is a previous panic that wants to restart the machine:
> 
> (XEN) Panic on CPU 0:
> 
> (XEN) Couldn't enable IOMMU and iommu=required/force
> 
> (XEN) ****************************************

Okay, so there's a panic initially, and since it's unlikely that you
passed iommu=force alongside iommu=0, I'd assume it's because of the
IOMMU being needed to support running in x2APIC mode (earlier
messages would tell us). Then ...

> (XEN) Reboot in five seconds...

... this leads to the crash, which effectively tells us that this is
likely yet another system where one needs to override the reboot
method (e.g. reboot=acpi).

Jan

