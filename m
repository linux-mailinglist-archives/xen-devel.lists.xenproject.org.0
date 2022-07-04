Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C915650FF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 11:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360078.589457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IV3-0002q2-44; Mon, 04 Jul 2022 09:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360078.589457; Mon, 04 Jul 2022 09:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IV3-0002np-0m; Mon, 04 Jul 2022 09:36:13 +0000
Received: by outflank-mailman (input) for mailman id 360078;
 Mon, 04 Jul 2022 09:36:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8IV1-0002mF-E4
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 09:36:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcb95ee5-fb7c-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 11:36:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5429.eurprd04.prod.outlook.com (2603:10a6:20b:99::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 09:36:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 09:36:04 +0000
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
X-Inumbo-ID: bcb95ee5-fb7c-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5uh3582hsd6UgvryAW0EODJoZ4f64+YiFTEan0951kcvh7JKAxlJY3S8HxNULLVzpbm5w8AtPPx+Y4rPbOqi4XbIdOZjDc/EYUsEcO3LufBdp2UnzTbkU1Aa5odpDtXqQ5uTXw6uLLMhT5p8knQhXuhsjaCjQ1J04nNxLN76Qi3vGgwoCcIEcvm/hxuLbF84D9hkyYF0mBCWL9wQO/FWKjY8HpHaUYnzXU7CTUFZ9Y5BFZEUJPZG0z64+N7FHcXBD4YV96197807xlAb4UZLKOVAaUhXPRkCIQBC3MtaiICcFBwnRibQijjW00znLuBsMGR63TsCoOxZjY+YuezMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6xKKvrTzkKsrHUsM0iN5okDsgdVIju65ZhH96dTARc=;
 b=czAOAoE3XX6gRVsunHpa0U36uY8qh0vcjEVBfBt/3XKjyB+lXXjjPuV2G7XAFnePLqr1cGUVpPy6tzCFe2EGJ7YOtfdFieFC4UD611veDYDahx1G2Z5eAI8DDRzpd0w46vTjYm/OsnJOA2yhPxUdSu9DvJaLlIAejH22AfAEJupgF3apC0s+IM0dArCIPEqyJl+dGStijNZjxaMcjhmd67P4GmzTJoE4RjF7A8PjabpaZBEO4eCKTR+BxN3bFThZ9HZNhvyOiQSM1DCJ9SPO977nvDENCAdWcciBXTiM9M4mOj5Gz8VTRqrNtYAUbi3DfPcym4TXxygRQdiiH3B1qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6xKKvrTzkKsrHUsM0iN5okDsgdVIju65ZhH96dTARc=;
 b=OTiUPavXpbxKCMN5rvUMjEsL47BhLyhKDMJOuysrmYLYbytUjq768WrM49PPNl3ppZkxAJDOyVWW1MoCk1W+pU7xsoEBNL7mwn+EYg7U9RBrv9pcDGPT03veOX1+COA+oBCldN6pNy5s3KSG15oRyIRgqASnw9MTdQRhstsoSD6uLImbzUoHhATxXmPY8s26/Ot3j3eSvFG8sTBqxQtyGGTvtt7Xir3+o8t9ddFTCehSVDUvU2cHRD1J8sILP/JZJRiX3kw1WlQmGOQig4Cu3xGLhcGqUXI0RLOAd1FtJLhBPNiFYez4X4TxqiuU18IHiIuSKg4MfKEtXFmkTRK3Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2e011db-5fb1-046e-ae10-577e06e5813d@suse.com>
Date: Mon, 4 Jul 2022 11:36:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/10] drivers/char: Add support for Xue USB3 debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Connor Davis <davisc@ainfosec.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
 <87c73737fe8ec6d9fe31c844b72b6c979b90c25d.1654612169.git-series.marmarek@invisiblethingslab.com>
 <9c7c11f5-be1e-f0ef-0659-48026675ec1a@suse.com> <YrM5g3dLRJHTIVYt@mail-itl>
 <8322303f-021a-b520-d2ad-cf8310573df5@suse.com> <YsGIzXKPr+j05TC4@mail-itl>
 <c4ecb784-e6d9-6d77-67ec-1dec78dbde0d@suse.com> <YsKyZ22TVnc+r8ag@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YsKyZ22TVnc+r8ag@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa6655ce-19e8-4456-e601-08da5da09d36
X-MS-TrafficTypeDiagnostic: AM6PR04MB5429:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fz3rabsYcddCgt/xt7AngJUcXxlT7SpMNh4Zcrnvcy+/kQ0p14+wg4hGUSmH6gkOHnzOMwVsDzCSaVvenz+JfdXXpuVVt2D9Y4OYlpjSGFy2gos/L7WEZyxnHZGW5RGwxHiptMlkqJa/3ICnlE1+lqqVWgmk25qcONhLoOr1zSefVcHvJtEd4xsseP5/URlYSV6WhPJ6oHTMyVaHhJF4eEFTnwkGeq9sv3PXuwffLE4Bn4G0SChLRbN50+2L9oLVKYvmgdWcQqgkNuQR3PaDjKGwmBFJzQgbtgtLo47U7R9y5OkQMsjBM6zs/LpGZucIFsfGTpVaPl0pdScWA3ao3KM14n7qOM8UMQS2/FtG89O/qawdzY8vZnhz2BWqv9ZhzOpRK0TRr8QXOZ7CQz2PkUyIQr4WeIp9r36Jb67ljQsMUvmnc8pbNTo8S6gLIu44Wpz7WvP5vvKBbcTOySAjleZb/QUwoKSbA3LwF5TKfEqprVwziaZ+Q0RnaYU6mcDxW9Sq6gxMMua3hyww3QFP64UL8/XDZlaypvtlvi6OJhPPpRRg3IVSJWmzVOCWUlUAHEcDA7d59v6PUoObgR/TJBHcjowZiWBEbk+pBUNN0q+gP9lrEHub8JgIwCVnXb2i4T5EC4pHHEIDIaBC69I7YLD5oN5zj6bWWmd2GTe9fkWU8sEZphE4R+LB9nlnJUfZu4JPfrH6zvSUzbUYBhJiYleu2DU8KBFKu0b5gRE8966cHFrKYQXGNEhITYZB2te0uCpOzUbNoL/558oFV6wPNUwniA/9OZTls4wbH9VolMM5dTa9HVI/P+zrSaGqyUUqIppj+ETOMQN1kmmjJ4YIzL0xSCP48xx5fD8H9dPP3xA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(366004)(39860400002)(376002)(346002)(38100700002)(66556008)(66476007)(8676002)(4326008)(54906003)(66946007)(86362001)(316002)(31696002)(6916009)(36756003)(5660300002)(6512007)(31686004)(2616005)(6486002)(41300700001)(2906002)(478600001)(8936002)(6506007)(53546011)(26005)(66574015)(7416002)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmtwNHJVdXpGdFZyQ2d5Z1ZnZTlzdENHRzdleE5ZZmpjcXVieDBoeGhUZWt1?=
 =?utf-8?B?SGNzczVhRjJKYmNDOFNhc1BvNGdqd3p2aHRlTGZ6dE9YcU5qMUpIaWtZUnUz?=
 =?utf-8?B?TTQzVitOSFQveFQ2bGdoYzgrc0xIRHBvRlEwaXRIcHJKQlcyQzFYdTVPMlhF?=
 =?utf-8?B?MEE0OTFSYUFVek1UQUtxOEZqeGlsWDFYUTRjbjBMVm1DZGhFM2xVM2R1TURp?=
 =?utf-8?B?RnprNVZCMGUyRDE1ZGs3ZEhQVGhGWHhxVTBuVW5mZFZBY2dIeVduZ0VZNm50?=
 =?utf-8?B?MVVzQWpkNSs2bGZyQnJZOURYMWdSQVJMWW1iTTlraUk3bEhpWmVmOGJITDBR?=
 =?utf-8?B?eGcydkNqWEVEMlIvUy84Vnc4NEozMTNJOTkzbDVtUDdIeFhSTmZiUExFYTlZ?=
 =?utf-8?B?QXQ2cUozQlVwM0M5MDdmUUxiK240ajVlZm9pRThqQk5jNExQM2NtbUk5YWJ4?=
 =?utf-8?B?U2NmMDd5UlVodTNGazZSY3EwOWtDeG1zTjd0bWhvT1ZWYkNEU0szY2ZkR0Uw?=
 =?utf-8?B?OFVWMzhtUVkreHpQODQ1N1ZIbDBITVh3b3ZZT280YzgyckE4bmFyTnNsRzRZ?=
 =?utf-8?B?WGJ3dVZjQS94YmZsMlpYTzR2SGJZb08zRUxoa3BiL21oR0lzVFBlWTBhTHN3?=
 =?utf-8?B?L1BGcTE1ZU8xY2pDcURObjFmeHF6U00vSEg0VksrTGl4NjJsQW4vNnpXdU5X?=
 =?utf-8?B?SWgwWlgzRVZsTWpqS1hEL1BSNGZ6TzJkVWk5RTJyUnNuNlNIYm1RWWYrdm9W?=
 =?utf-8?B?cUFqaEZhbXJOTThLb29OUU4zWDhiREg4Z2NGWTVzT2R2VUIvNGpvY1AxWXZt?=
 =?utf-8?B?WjVKbm9hS2d0Z2tEVVFiNHBzNEp2N1VFUWd0REdqNzMxSGtJSTNTVDJ1dXB5?=
 =?utf-8?B?QmlyZC9DNHNhRmxlL3BXY2R2SnY0OXBneEY3NVloYmxjN3RxQlFIMnpyWW1w?=
 =?utf-8?B?WDdPOWpNeDRycy9lUlR6eFloTjUrQ2JFbyt2MEFGRFppRGVrOVFPT1oycGl3?=
 =?utf-8?B?aG5jdEJkTDA1d0xtb0VKbi9sSTU3MVRFMXppdkNBVW1vdHN4Sk5IaFBRUndU?=
 =?utf-8?B?ay84QmQrejJ6Qm9POEtINXJyQXg2YmlKUG5SVUNqYlJkR3gzYitQbXJUVzJ5?=
 =?utf-8?B?Zkw2NXplYzBQelI3MnFuZHMwQUUzSEN1SWs5QTNLL0tWeHh5N25melQzbFlZ?=
 =?utf-8?B?YVVMcGNSaDNJenRCRS9UTjhWVGFUdGt6a3U1Q29XOFdDWDJyUnBjZFVvaDdH?=
 =?utf-8?B?MFIzWkxQRTBWTFcyTklzUHJYZGgybU5VZHRhSWl4U2ZWYUljSHc0Vm5UandH?=
 =?utf-8?B?OGJZanR4YUQrcS9EZEJ6OVpNZmdpSVNJWVVSQzM3UHIrM2Ryb3lob2JkeHBr?=
 =?utf-8?B?UlVkU2x2ZUtZUWpQV0FRRzI3SFBiYlAwcEw3NUhIOG1rcm8rZDZVUmZtY1Av?=
 =?utf-8?B?UUQ5Tlc3M1dqaTFzbUNyQVd6YmFDUlNjcnBBQTJoSGU3QUQvRmUwK3g3cnNM?=
 =?utf-8?B?S1ZlODMraFA0MVpMU0lCSVNhL1BUaW5WM3lreklyK1A2Vkt1cXl1bUJvYW4v?=
 =?utf-8?B?UytNZ1RxQUR3OFhrWFpJTno0YXJsdFA0RUZzRlVibkkwSUkrajZ0MmtIVWtp?=
 =?utf-8?B?aHBobTdxLzdTTEFwUXNhRWFNQmlrVVU5c0tDTUs5eGlPT2NSdkl5M0RyL0do?=
 =?utf-8?B?R1NFWVRFK3p6RC9oMzZoUlNaV1BVVEd0eVUrWEhUZzJ1VDlpRUFiVE1ad1p4?=
 =?utf-8?B?RUY5VXE5Y2RjbStpUkxlK295RDZsbUtRclhxa2ZRY0QySTNEdVF5ek8wYUVP?=
 =?utf-8?B?Q2ozbXd6aTNCUlBSb2cxOTg0VjNxQ1pDK2xPTWhxc1orblpNTHVZOFdaN0hm?=
 =?utf-8?B?NjczTGpYUDh1cTVVN1ZoMkNYaXVWUTdRc3JHcUowMUMzWlNFRGgvY29TS3U5?=
 =?utf-8?B?RmdoeWVmR2FNbnFNM2lnbWwvM0dlUlo4clNTbnVIR05rS05qWWtWM0JhUEkv?=
 =?utf-8?B?UU5vNXJCQXArQkdwcVAzTDA1WU51SFZCUkM3cDY4b05rWjdGUDhseG0rb0tW?=
 =?utf-8?B?eDIyRko1ZXUrTVFPYUttbmVhdDE0NjUxOGUwbDhNNFlob3FkMC8yZ0tEbXc5?=
 =?utf-8?Q?82LPkKQT5vq0SbH8o7mm/Vb1U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6655ce-19e8-4456-e601-08da5da09d36
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 09:36:04.1523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuoipukn2SSfAFjFZ79DYKu5cSfDkrqJBN8iVnaLTdL/+dBmb5D5Lcy2tabGNBjw3mLivIxCq+vvfWlMUhGiCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5429

On 04.07.2022 11:27, Marek Marczykowski-Górecki wrote:
> On Mon, Jul 04, 2022 at 08:05:06AM +0200, Jan Beulich wrote:
>> On 03.07.2022 14:17, Marek Marczykowski-Górecki wrote:
>>> On Thu, Jun 23, 2022 at 11:29:31AM +0200, Jan Beulich wrote:
>>>> On 22.06.2022 17:47, Marek Marczykowski-Górecki wrote:
>>>>> On Wed, Jun 15, 2022 at 04:25:54PM +0200, Jan Beulich wrote:
>>>>>> On 07.06.2022 16:30, Marek Marczykowski-Górecki wrote:
>>>>>>> +    memset(xue, 0, sizeof(*xue));
>>>>>>> +
>>>>>>> +    xue->dbc_ctx = &ctx;
>>>>>>> +    xue->dbc_erst = &erst;
>>>>>>> +    xue->dbc_ering.trb = evt_trb;
>>>>>>> +    xue->dbc_oring.trb = out_trb;
>>>>>>> +    xue->dbc_iring.trb = in_trb;
>>>>>>> +    xue->dbc_owork.buf = wrk_buf;
>>>>>>> +    xue->dbc_str = str_buf;
>>>>>>
>>>>>> Especially the page-sized entities want allocating dynamically here, as
>>>>>> they won't be needed without the command line option requesting the use
>>>>>> of this driver.
>>>>>
>>>>> Are you okay with changing this only in patch 9, where I restructure those
>>>>> buffers anyway?
>>>>
>>>> I'm afraid I'll need to make it to patch 9 to answer this question. If
>>>> suitable dealt with later, I don't see a fundamental problem, as long
>>>> as it's clear then that I will request that this patch be committed in
>>>> a batch with that later one, not in isolation.
>>>
>>> This turns out to be rather problematic. xue_uart_init() is called
>>> really early (as it should, to get console as early as possible). It's
>>> before even boot allocator is functioning, so I can't use alloc_boot_pages().
>>> Are there any other options for memory allocations at this point?
>>
>> No "neat" ones. Stealing directly from E820 could be an option, but
>> would of course be heavily x86-centric.
>>
>>> We are talking about 58 pages. It isn't much, but isn't exactly nothing
>>> either. Maybe there is way to keep the memory allocated statically as it
>>> is now, but return it to the allocator is xue is _not_ enabled?
>>
>> Well, yes, treating them like .init.data would seem to be the least bad
>> alternative then, at least for now. Down the road we may want to generalize
>> what's needed here, as there are other full-page or larger memory areas
>> which are used only under certain conditions. We may e.g. want to introduce
>> an approach similar to Linux'es .brk section (recently renamed to .brk..bss
>> iirc). If a non-generalized approach ends up looking too ugly, I'd be okay
>> with keeping things as they're now, just with a respective justification
>> added to the patch description.
> 
> Looking at it, I see another issue - Xen uses superpages, so I'd either
> need to:
>  - reserve the whole superpage to be able to release it later (waste 6
>    pages if xue is used), or
>  - shatter superpage when releasing unused xue buffers

That's part of the reason for my desire to generalize this.

> First one is probably less bad. But maybe, instead of doing all this,
> add xue to the menuconfig (make the prompt visible) with appropriate
> note about wasting 58 pages when built-in but not enabled. What do you
> think?

I don't mind it being done this way for now.

Jan

