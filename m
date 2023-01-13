Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E953666929F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:13:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476910.739346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGG7Z-0003bh-Bt; Fri, 13 Jan 2023 09:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476910.739346; Fri, 13 Jan 2023 09:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGG7Z-0003ZM-8l; Fri, 13 Jan 2023 09:13:09 +0000
Received: by outflank-mailman (input) for mailman id 476910;
 Fri, 13 Jan 2023 09:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGG7X-0003Z0-Ev
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:13:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d889a5a-9322-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 10:13:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8743.eurprd04.prod.outlook.com (2603:10a6:10:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 09:13:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 09:13:03 +0000
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
X-Inumbo-ID: 7d889a5a-9322-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQkOv7g1o2Zy40OpLBtVVK06i2rZOkRXp46QkgrUVOFkE4dMOzFnSO8/LZnMan+mM7FUasG67Pl2k1Ct0FNtSRHcD4aI8FToaKhJjtPGK7xCdrorF1wib3oxg2ce8pHQ9KvuPV6+BedS/oT59LJorYo88xC3nRPO91hg0pvsMRmodu8apCSi5C0jDElw4XGQ48L5nyTQno1Uwe7vsI+aXsp4zftdV62uGhs+k0WwlAxj4y+JJ+ZTGhWxyupv6ICqbTqA8RKmYJcM932kUXHVDdPSuFOUvW4E6GVtor2zgyXBkdxJUEDXZSrNKoZH6+0E0eyvTsG0axV1Qhr/KNbB4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqMdE8TRkZlwe7RW6FFwmS0gNI30pCf2CvesE5gndbc=;
 b=EpNjBIpiaHcmp02V5NpvW4AJdg0+UvBc54leTRsNvC2ijt9D/6f11dTnNPX7aoChTiOIVh7JkrbTpLRq3Zz7l7fKAFot7BKVHlD7U/0dhXGuIXqMpSH72VM6YP51g7+i1k3H/cj1sl+xzrYq32B9l2ZHt3Mum/Tnl0xO0iGdXpG2550uatbzwqDKaaPDql1224xqDPkJ7NRvbh5b6QM2bjzYf3BKbpB2o3JIH5D/Smb3Mr4moGihwD9FNbtk9/I9ty+xisQfWxkUqfxOpAA5lc2NbFiaX1lm1pXT8GxZuRKUYIAJSTogzPCvTGFf6PS8KCDy1OONxPQ5agYBsz6Zmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqMdE8TRkZlwe7RW6FFwmS0gNI30pCf2CvesE5gndbc=;
 b=C1pWcBHviAzQxhhQWHuRancXfrzEh2SWBXSgsD86XdSiJWcbvPiJNl3V+korMFDBe5nz9E0kfl8gNSuePg9cMg9GMb8IPXbFMrqE8GQo7JI4PCdgO5vCSdzVlKAkaXoVmqMheBExgIo3zcFhkfchcYNRGnl+rIe+HdTxC6XIHkCSX7cxII412Ockh6FNBwi4EhIqMLgoiH4JF8QxdAbxLoxpOmGacd7+X9tWur8T5utfd6R4Qi0ScDqQeapgJM6GwmELcazBCEHF6xjDxQqFBRQMlbLt4SAhiJIdyvnSwO5ywiqd4YBNAK8LxTLJjEFLP7HRU8bIROxoGcpm0S0w8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4144bf32-1eaf-b85c-7a0a-b734d6267a77@suse.com>
Date: Fri, 13 Jan 2023 10:13:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/8] x86/iommu: call pi_update_irte through an
 hvm_function callback
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-7-burzalodowa@gmail.com>
 <aa20eb4d-7b18-9bbf-718f-2fe5fa896713@suse.com>
 <6c5a4c07-e942-a683-8579-a0f9d5971c7b@suse.com>
 <e16daaf6-5f6a-d0a3-802c-0bfc0b6876a7@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e16daaf6-5f6a-d0a3-802c-0bfc0b6876a7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: fca0c8c2-de8a-4587-6b42-08daf546600c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5fgGFoiQ3X1Ora452ZqyVYXWd2e39IsHaQhkbbMSkoOVQhmVtnSdjvQlHXRn7gFIRN01YNUiTOHVA5UB4TP6OTnaeeIa5Gl93XlIG6TrN6rLQefuETv5s+f7DXvQlED4Snxaa+k+xOCb7GqX9M1qB2jH1rIObURDOZjYkppsgavwqMEr5jflro8PWyEMt3dJ2LsXAqUsj4Z5JIEjUVasnRs0Yk5S2MHVTsW7RuYG2hrcv96QV/BSm7lcunRPnWMZUYA9BGGyq6d/lUZAuHScsHq9uBXQ+LhgYyvW9lBye4KMMUhMLFnidB4BCAkZrp9kP5ytzFGi+t5qSxzbKcaTRMrSzVxS2ys/sacOd0pdfMdQbKfL2K+wI3WsmJWF+6ixzSknYfeLD6L+reUUhJagp8vIPFWdW3drrwe7ZQ1WBvdvQT0rxChAXiN4z0XStZ1lMJopzFqoxTdAeEkWLAmNcS9ZBodi9TmP/MpMKz2Z1/PQR53tFT3+8MEpuxkAM8ATr2xjO6j9gh3DmSCAFokCFSS4TzM07jJ/zjscvGck8q2RWCkdaL/qQFjDPnQex2kDSYZZ1gm4LG/XOUd6T9IwPAqZn+1yAj7lH57qM+GnGTQfMwJC8koo5owb9wkK4E5FOTQpVwKCzuIvKBVAi7WSChpZgugdIP4t28DBuV2Uh6VewQz34uAmzZVc/o6TM3XBrplWwaful/006tfIs+Vxo4yr6tgYv3OYL55rX+T69xE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(5660300002)(316002)(36756003)(54906003)(2906002)(2616005)(38100700002)(83380400001)(6486002)(26005)(86362001)(31696002)(53546011)(6506007)(6512007)(186003)(478600001)(66476007)(66946007)(66556008)(31686004)(8936002)(4326008)(6916009)(8676002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWk1WU1qdEh2V3pSZ25DQm51Vkd0SXhOUHFYYTdYM05Idm9nWnliMmNkakxh?=
 =?utf-8?B?bDU2U2Q3QURlNU1vOGNRQ3hkS09CVE5Ld2E2SHBaUVAzejZmNnEvREUvNDBW?=
 =?utf-8?B?dlRYZTJVZkMzZUtJY1JGM1plVVp2Ri9ySjdKeGNOMGNZcHlydVdVWkNabnJy?=
 =?utf-8?B?ZTdEaVJvQ0lSVm10ZEQ2Kzl4aTJuK2EyeERZNUlhSFg3UGtaQXRmWWVFSTNy?=
 =?utf-8?B?VCtsWDF5cFkxc3djc0lpeVl4dkZibEV5cUQ5TWE1am5RcnUwcmNVM3RIN21Y?=
 =?utf-8?B?VGdpeFZ6UVdwUTNkTjlVdHMyOE9iN3NiZS8xeTdDTWhiam1HRTJtZ2JrcWI1?=
 =?utf-8?B?cTU3RlZsaDdFcE01ZDkzdnZUZjNnNWwwNUxyOUYrdmFDZTRNZEZuendwNS9v?=
 =?utf-8?B?ZHFLR3VwdHRQdmdCbzJRalZnWXh3UDdkM3phNG1ZZHN4V2tSaER2VUd2dlJK?=
 =?utf-8?B?ZzRDWDZoT1k3SldJTXN1YTBPY0l4U2FsSEl0ZkdvcElBbThrYlZqaUxZbnY4?=
 =?utf-8?B?M3FBcXpaV0VTSWxkNGJVeTU4SmppS3gyUGkzMU90NG9MM0xYQ1FPNGZkeUxa?=
 =?utf-8?B?d3hFTHNEcUVPVG5GNmpSdlZ2UlBqbFZMNmhLc0o0RjNpaGlTeHFmS29aVzRP?=
 =?utf-8?B?cHhZMmpPTHlYc01GTDFtSWFxUGUwKzJ6Z0lmaDl5TTlpNUppV1A3b05LcGds?=
 =?utf-8?B?a04rQU5QVjFLVmM5MkJZUUxPZlM5LzhCczA5QkpHZE5BcldMWEZzdzEvVS8y?=
 =?utf-8?B?aldwcHo3ZzcrR0ZiSE1haS9hOEdseDhOTldCWlZQNVZnSm83TWJvZFMrM2M5?=
 =?utf-8?B?dTBxemdHb1hJMXB0UFNXclZZcDRMT0hmZFpKNVRtcFJsUXdacllUdTFLMkU3?=
 =?utf-8?B?RzZtZmNKMXdsR3Y2ZDBwVkhGS2svT3B3UFBRcnVqajkzd0VmamtCeXRoWUNS?=
 =?utf-8?B?SXlhN2VKVXUrdjA2WE91YlE1YXhwTVlpRWltY3U3NWlROFJQRkN5OUZHc3JV?=
 =?utf-8?B?QktVSzlUck03WXBPVHZTMGFMREozQ1k2aHNub2hUSnFOSklhVmhoUjhVUlhT?=
 =?utf-8?B?ZDEzYTh1ZS9YenNSOVhmeTExek91Z3lpcGREbFZhQUQvSDBHYmt1L3g1Njhy?=
 =?utf-8?B?ZW9PT3lWRjA0ZFhqTEtOK1p1WDY1OVlBZHFXYkNBcHEzRE53R3d1K1pESzgy?=
 =?utf-8?B?WEszcmlDdnZ1ZnZrb3kvcTZaVDYrWjhUV2dmcHdtcklxdlhHZHMvLzMwSzJZ?=
 =?utf-8?B?U1hZK0tjV05MTU40OWNIbkI5b1RpakNOQzdIWktBVzlTRExvaDlueTR5Nk1B?=
 =?utf-8?B?UTZwTkZzcGJ1YTFjNTArTWxCNHhLRFZPczJZTTh0SWJ1TnRkN3V1dVJDemdV?=
 =?utf-8?B?OS9RNjBINm5rZlYxaC9EckJSZ0p6azYrK04rWDB4L0tQYjFiaHVJbkFHaGlu?=
 =?utf-8?B?cXJUZVRJTE4wbmNSNkFLZHFueHFrZlliSGlJY1NGMXkxaHIyYnQzOWM1TFVm?=
 =?utf-8?B?amZXSW93bTg4c1BYdkJ6QmR4UkFtYUtHOENSc1NnYngwVEJMaHZ5T25taWk1?=
 =?utf-8?B?T2xJTTJrRVluaGpIWEVPVXV6b2I1alkwS05lSitrR0VHUmMzUWR6WldFNmlI?=
 =?utf-8?B?c0U5dWZJNmpMeTYxdkRmMGFZbHRzcHllOE14MzJHT1d1OWFGMjVXOWhDU2Jm?=
 =?utf-8?B?ZHZWT0MxKzFpeWdJL05vQ0p0OS8yM1hmMHVGTisvbTNhZ0xUdThsRitlcWVW?=
 =?utf-8?B?THd1cGpkSGJ4dWpibWdvTFNqMXZ0Uk12WS9GOVZHUkJqa3E3OEdqU2I0Vk9j?=
 =?utf-8?B?bXZEeVhTcjV5VHFNZHBnL3lqUXJvNlRQY0x4Q3NVY3hPV0hYYjhsYVFVeTBq?=
 =?utf-8?B?RW5nNzlrL2lLRklDV29CTWdESHFEeWdkZHJhbnA1MjNURVJ2MGFiMXVhSnVi?=
 =?utf-8?B?U0hVSlIxaGNQVk9TSUtwSW1aN1AvaHZld01ubWU0eDM2V29IZmJFUGF1M0dU?=
 =?utf-8?B?U0pNTEFOalhqbTZLVlpTaWcwMnpHbTY5aElXSTI3TnVsNlJzTFZGZGdReEVQ?=
 =?utf-8?B?SlZEVEYzSXl3L3JOUnZ4T24rdVJYb0x6SHdCQjQrS0M5dTlwVkFEVUVaTE5Q?=
 =?utf-8?Q?Y77805CaiRJQ8wC25rThL+l0x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca0c8c2-de8a-4587-6b42-08daf546600c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:13:03.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRjpHAZr4ok9SOz3sC30aCuMc2lZgKlM26DnkFHy46/KdJ0lXkNF432kxb8dmtPewJVAg97sAvVPVASp8iX1Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8743

On 13.01.2023 08:44, Xenia Ragiadakou wrote:
> 
> On 1/12/23 14:37, Jan Beulich wrote:
>> On 12.01.2023 13:16, Jan Beulich wrote:
>>> On 04.01.2023 09:45, Xenia Ragiadakou wrote:
>>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>>> @@ -2143,6 +2143,14 @@ static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
>>>>       return pi_test_pir(vec, &v->arch.hvm.vmx.pi_desc);
>>>>   }
>>>>   
>>>> +static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>>>> +                                       const struct pirq *pirq, uint8_t gvec)
>>>> +{
>>>> +    const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
>>>> +
>>>> +    return pi_update_irte(pi_desc, pirq, gvec);
>>>> +}
>>>
>>> This being the only caller of pi_update_irte(), I don't see the point in
>>> having the extra wrapper. Adjust pi_update_irte() such that it can be
>>> used as the intended hook directly. Plus perhaps prefix it with vtd_.
>>
>> Plus move it to vtd/x86/hvm.c (!HVM builds shouldn't need it), albeit I
>> realize this could be done independent of your work. In principle the
>> function shouldn't be VT-d specific (and could hence live in x86/hvm.c),
>> as msi_msg_write_remap_rte() is already available as IOMMU hook anyway,
>> provided struct pi_desc turns out compatible with what's going to be
>> needed for AMD.
> 
> Since the posted interrupt descriptor is vmx specific while 
> msi_msg_write_remap_rte is iommu specific, can I propose the following:
> 
> - Keep the name as is (i.e vmx_pi_update_irte) and keep its definition 
> in xen/arch/x86/hvm/vmx/vmx.c
> 
> - Open code pi_update_irte() inside the body of vmx_pi_update_irte() but 
> replace intel-specific msi_msg_write_remap_rte() with generic 
> iommu_update_ire_from_msi().
> 
> Does this approach make sense?

Why not - decouples one place of the assumed "CPU vendor" == "IOMMU vendor".

Jan

