Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6011B60F063
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 08:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430890.683145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onwUX-0007kP-Dx; Thu, 27 Oct 2022 06:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430890.683145; Thu, 27 Oct 2022 06:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onwUX-0007id-AX; Thu, 27 Oct 2022 06:35:49 +0000
Received: by outflank-mailman (input) for mailman id 430890;
 Thu, 27 Oct 2022 06:35:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a7vm=24=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onwUV-0007iX-O7
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 06:35:48 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20074.outbound.protection.outlook.com [40.107.2.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9598d4be-55c1-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 08:35:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9061.eurprd04.prod.outlook.com (2603:10a6:20b:444::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 06:35:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Thu, 27 Oct 2022
 06:35:42 +0000
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
X-Inumbo-ID: 9598d4be-55c1-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWAMJ3VgCbgSmDwcsuReobEZVHQ5xIXdWAwVhEA6Yy6V1sU5RpGQDwBlbUA84w+jIyrpYdy16m4v4x8WjsSEtFteSwdZt5SzmKKm9w2uxi1PaJdUpjKoINCviJFGKP6eqP7q3jKP7ruzwdD8Lq6XuJitgb3jKyvq8ctQW42lLWCr0/y79l1Twl1/nScwIfbAkiQch3e1513KQARiDL9NWPNcnCe7HLfWcpl4tu+J+Ytj55EcN/zjp1NMJz+DqYee/sQbJs/yODMNhgNi50EDlkz9TMgi27VEwTt33fQropRrbbDMQEMrslBEra1Imzac2mKTf6HtD34BhJ1j/6LkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Co1ILXLOErZgoj60Ktgf30vDbgp6ceXC7gQe8CJC1c4=;
 b=CbNabWe/zyO4KyIZzV80Fp8Bv0bFkROt0/KBvYypMIQn4JfVyVWa6biiCBqkhOG91HHhjlyHR07PLkEH6MpdPwQcF7zhJEtNBdngVwcGTBqo8R8ihKCVmWS7VdwdbaT2chKu3NnWbEUBeXNI84M3KI3evAAE/D4CXwU+qk6Ew0nwDAFAjKZmtCX44ronrzcIOUvcmKaOEJoEdb7fPPjydwXFJDEkPKvp9xZaGnLrLW1wKlp/xIsW81dBMp/aqCidjnLFlioKUnISv1cxet1L9H1CLj6hQoLaWmuqhdw+dzpG+3A09s2ZiAP1BHfP+0oFBVtCLusZ/uwK6SsHrGZBpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Co1ILXLOErZgoj60Ktgf30vDbgp6ceXC7gQe8CJC1c4=;
 b=RsTe1DitORih++ekjQ27m0EBbb/AfF2gA0wwOsrCsnzuu94b1w72rMv7ZoA1cuCIbct/TZBaL39GIj25NJ3ug8NcNhPG8ySLCwAjnSLkL4Q4Knw2CzAFLJnbdEqXYbJ/CLPYata0Rng70ffysVNHzUlvr02WmrADaQWoHDlmK+9WupjNBWCRbMDnFnTa5mN2fKxP6ZuP61XV1DOJoOO0LeVK1TKdTcT3VB0RhHQyvy7P2jDIt0OdNZO1Z8tgWw+IkQ8T9ha4sC2g4TOxI6FhwDb3Hno9gxky8YdX0Gm3sJy6IZpu8tC5PxuLJbZOuKv+ZVdtrOhxLiFwOzTP5p4s/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6afcce03-a9f4-cf06-48ea-777357ea080d@suse.com>
Date: Thu, 27 Oct 2022 08:35:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for-4.17 v2 5/5] vpci: refuse BAR writes only if the BAR
 is mapped
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, xen-devel@lists.xenproject.org
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <20221025144418.66800-6-roger.pau@citrix.com>
 <666377e8-fe58-bc9f-70ff-2e21d93c691f@suse.com>
 <Y1k88uhbSNdMvsa+@Air-de-Roger>
 <045428b7-9c4d-cbf6-3ca9-157c516399a9@suse.com>
 <Y1lZxldTIWawfpnO@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y1lZxldTIWawfpnO@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: d17d4f2f-21a3-4386-a07d-08dab7e578ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uv9jSBLVtSxXYd1QHI13m3qSYeP3R4dXl6KAUBWkA1nTF0iTjUuK/JGz6WJKs5K3mQU6X5K0xJnes8isFOCHVvGj2IVUKbC6MXI2e5o5QPrCwi1b42HxfoAeIf33TaX86BafsrzNC3rxHwl7vrw8FcYqt/WxMBidDYfOA55QaYgv65iZzQhXSl3MSz8Kg1S5deCOhyeWLbFdpMuSMittIZb0vlfB5rqLy9ASl/eGASq3Ydsa8XkFVRsZh9uIYqFGEikHm7+GzB61urHkCuBy7NK4V3hTaah1K4262jvXIvkgiATfdK3pEuN3cbdyreVGHXxux9H2wk8FjxiOVMtDV8iXx4KDtZZLrdpgSjKnY+x2W+OIYVyHthLItj8IreTEDXf7Jpax6+oO30qUaM+sNn66LOg+bYVHnws1piZIQ6zGjs98rD8ID0uJ9o8zUJe/VqXpUm9aTaVxwFKa8i+sP+0K4ctk5Q81VjkThVT9iuKPU3GHxGyrgG+ehMKunkWT5fiZyROGAtElguCqx1IQabhvZcDjYEBPgDp1qn3P0YRKdTsxJANJCKoRz2iNpvx/HiTbhATkdUJ6ydXHyYWTXQ3A1qz6g/wHyGaJVsBrCI5FLnj1lvwB/70vqjNXt1RJOzD6GRtAC+MLPDDDcTkF569iNOrhWHWSiP3vxPQKfKc5Dv4t8Tx4kNqOIWbmtdbaifm763GEB0VlPoWAvPOQmE536GmU1OOHnDDGxvhf137eBeHP6GUSVS9KbD3RP4Fvxzzu1HPT49NdyOBLLm4ouyEAYMXhzs7p/E4RN5oSzhQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199015)(31686004)(6486002)(478600001)(6916009)(8936002)(31696002)(83380400001)(86362001)(38100700002)(316002)(66946007)(4326008)(41300700001)(8676002)(66476007)(66556008)(2906002)(186003)(2616005)(6512007)(26005)(5660300002)(53546011)(36756003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDdnY0Z2cmMyekpBSGxKNTN2R3JiYnAreW5McEZWdURnRks2NmU5ODJueVQ5?=
 =?utf-8?B?Q3VuMytmN0o5VzQ4Z1U5elAxb3B6M25jaGlzbHRCTUtyTUNUS0NhM1hRSVV5?=
 =?utf-8?B?eER5UjBCZm9JbXdmZTZXcUJvU094NVRFakZ2WXNEeXdLMmxmYzJCbngxeG5h?=
 =?utf-8?B?ZExVY1YrTTAvcS9kOTl3cFU1dzRtTU1PQlY1UTVMa2FwQWJkZ0FrOEV4M2RT?=
 =?utf-8?B?VndFMHYvbjFMWUpxblFWbHZsclloOHZDLzh0LzVDVjBxQTR3L2hSOS9mcDhZ?=
 =?utf-8?B?endoTUsrOVFrK1hlSmp5UXlQeXlQd1hyZ0ZOVWlJaTY5Uy9Mb016dlplUmNU?=
 =?utf-8?B?RVFoY0xZUDFTRWNhSHVKbGVPdHByaWY3a1BqQjJWMThtVUpaN3dSRmNrMU1W?=
 =?utf-8?B?MWRrN3ZYTjNBMVBzZWUzdUFiT2p3SFAxSVdhdFNObllhVkpyN05tV2JpZmJz?=
 =?utf-8?B?NSs4dTdHaXVoem1LcWlvQTVLYlpCWTZRcHhxZFNkOUFUSXgza3lQblNtUFYy?=
 =?utf-8?B?bzNGZTUzejUvOXMxc2tkYkNLTXpxa0ZWNjdrN1BqTjl3OExMSXhwTGYwLzB0?=
 =?utf-8?B?cmUrWWl2ZWw3TE0wdzVjOEZLbEpsRTBhdTl6WTFBeHN2Y1RBTnFjcmxaMkpF?=
 =?utf-8?B?dS9jT0RVb0pvWEFCZTNWbGlNSzZkUkpMWTZCS20yMnEyRCtSUk1aNEVsZkRS?=
 =?utf-8?B?MWVhejR0RVRqa0ZBR21iVDByelk3OEtKQzM2V1B4bnFHWXA1M05EamJubEVC?=
 =?utf-8?B?TWVPakJjM0FmcXltZDEweHZ2bzJxWkI4MU42SnJ1THNYckNhSzN5Z1dtZkpi?=
 =?utf-8?B?c3dMaE1XOTRIeEx2Z0VsaFlxcEJoNDhpNit0di95R0tzMVlFSWluWG8rRmQy?=
 =?utf-8?B?bjlIVFpQWVBzT1dmZzU1cEpjTUhrY2VpUkdZcjJqaDBFcWNsRWNhbXhwMk9h?=
 =?utf-8?B?NlpvQkhnaUhKbmhVRFUrdERhelFaeEd0YytyakwxU1JScXpEZlB2TW5QK01B?=
 =?utf-8?B?cFQ3dTh5blhyaTRleWR2R2RlSmtZWjdOdHFpc01Pd1Q3cVZneVg3V0JyOHJG?=
 =?utf-8?B?cnorbmNOOTNtVm9ScjRUNXFzUGFEVlNiMEFyZzJQS2M2cmtXYml6WjdJS1hX?=
 =?utf-8?B?WVpFbjRVTS9LTjlraFlqRnArSzhFVmREd1U1TlpFa2lOaTE4UG5BZ1RlQ2ZK?=
 =?utf-8?B?VUx3UDFQSElLOGU5Vko2TUU3RFluem50Y1A0N09veFUyVEhpa2hZWmtVdVJm?=
 =?utf-8?B?U0RCVWNNVkpkbkhvT2NIcWkzSzZQY0V5SU5Pc0NES3I0cXQxc0F1R0Rzb2V1?=
 =?utf-8?B?bDJ3bzl0aGc5Q2FIZGc1bjJjOXAzbFpQRnZ3YTdjSHpTNzNjMXc5RS9sdElR?=
 =?utf-8?B?UWNld3FEaTJQZ05yK1o2SlhDMHk3dWJ3N3dFUnlmR01uN3RhcVFwZjJjRjV6?=
 =?utf-8?B?UGRCN2dDOE5raGJGUC9rY3dWWVdFSG4wM3hqbzI5VVRXdndtNTM5bkQ1Wjlh?=
 =?utf-8?B?bEZVVWFuTGxSeG96K3I0TVgvWklHVjZqOHA2RHJIMGIyOEorVGdNb3p3Umgr?=
 =?utf-8?B?VExpUTRvV09LYTZUeGNqN0E0dkd0enMxNGxKellvWDFPNkJDaElKTC9PeFk0?=
 =?utf-8?B?TnFIbVBJMXU5aW0zWlNtaVgwQW9pTDZBdnFhR2ZvdWRCVGlxTUVWaW5kOUtq?=
 =?utf-8?B?UUNWeXZYU0RaK2xjSWR2elRQSXNxOTNEZ0JGN3cyZHRRTzdUYTFveW16Y050?=
 =?utf-8?B?MTVCYU16YXlFZXlCU1RDOE1EV1p1RXZMRjhjQzRZUGlta1B6MlMxTTZSSEds?=
 =?utf-8?B?cFZ1SmpBb0JKYk1yR1lyc2RmWmM4Mi9HM0NWemt6M2t0eDBKQWlnR2dKSHFo?=
 =?utf-8?B?NGtlMTlQODZlRTQ0ZG96SlplVk1UdXhoZFozM0plSXR0anZ2c3Z0VmFTQ3NS?=
 =?utf-8?B?MHdhMHB1cWU4UlZjQlFOL2lWc2VCUFlJZ3FrN0VGWDEvZEQxb0xRMVdjRVJ2?=
 =?utf-8?B?c1dtSVByclVWbUNSSlM1Q0JldmpPZzhmU3QyZGFnSWhNYzBVWlVGb2FOb2J6?=
 =?utf-8?B?Smxld3ppVFc5MHRJZ2ZUdjl0c1RKSU83cG1hYXQzZG4yaXJXNGNlYnF4N1R6?=
 =?utf-8?Q?eNd9y0lNoWGguRZ//Ru5YWXQR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17d4f2f-21a3-4386-a07d-08dab7e578ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 06:35:42.7634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Tmjkj2mAJ3AHdlGFDm+sqCqlKpfesfRQuCKPLa9d813v6Iywo3kmP0LBq2jcI7IoQb4SxAO+t9YpafNlaOBsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9061

On 26.10.2022 18:01, Roger Pau Monné wrote:
> On Wed, Oct 26, 2022 at 04:06:40PM +0200, Jan Beulich wrote:
>> On 26.10.2022 15:58, Roger Pau Monné wrote:
>>> On Wed, Oct 26, 2022 at 02:47:43PM +0200, Jan Beulich wrote:
>>>> On 25.10.2022 16:44, Roger Pau Monne wrote:
>>>>> @@ -388,12 +391,12 @@ static void cf_check bar_write(
>>>>>      else
>>>>>          val &= PCI_BASE_ADDRESS_MEM_MASK;
>>>>>  
>>>>> -    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>>>>> +    if ( bar->enabled )
>>>>
>>>> In 3 of the 4 cases you use header->bars_mapped as replacement. Since it's
>>>> not clear to me why you don't here, could you explain this to me? (I'm
>>>> therefore undecided whether this is merely a cosmetic [consistency] issue.)
>>>
>>> No, it's intended to use bar->enabled here rather than
>>> header->bars_mapped.
>>>
>>> It's possible to have header->bars_mapped == true, but bar->enabled ==
>>> false if memory decoding is enabled, but this BAR specifically has
>>> failed to be mapped in the guest p2m, which means dom0 is safe to move
>>> it for what Xen cares (ie: it won't mess with p2m mappings because
>>> there are none for the BAR).
>>>
>>> We could be more strict and use header->bars_mapped, but I don't think
>>> there's a need for it.
>>>
>>> What about adding a comment with:
>>>
>>> /*
>>>  * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
>>>  * writes as long as the BAR is not mapped into the p2m.
>>>  */
>>>
>>> Otherwise I can switch to using header->bars_mapped if you think
>>> that's clearer.
>>
>> It's not so much a matter of being clearer, but a matter of consistency:
>> Why does the same consideration not apply in rom_write()? In fact both
>> uses there are (already before the change) combined with further
>> conditions (checking header->rom_enabled and new_enabled). If the
>> inconsistency is on purpose (and perhaps necessary), I'd like to first
>> understand why that is before deciding what to do about it. A comment
>> like you suggest it _may_ be the route to go.
> 
> ROM register is more complex to handle, because the same register
> that's used to store the address also contains the bit that can
> trigger whether it's mapped into the guest p2m or not
> (PCI_ROM_ADDRESS_ENABLE).  So ROM BAR writes with the ROM BAR mapped
> and the PCI_ROM_ADDRESS_ENABLE bit also set in the to be written value
> will be rejected, because we only allow to first disable the ROM and
> then change the address (which is likely to not play well with OSes,
> but so far I haven't been able to test ROM BAR register usage on PVH).
> 
> I do think for consistency it would be better to use rom->enabled in
> the first conditional of rom_write() check, so it would be:
> 
>     if ( rom->enabled && new_enabled )
>     {
>         gprintk(XENLOG_WARNING,
>                 "%pp: ignored ROM BAR write while mapped\n",
>                 &pdev->sbdf);
>         return;
>     }
> 
> So that we also allow changing the address of ROM BARs even with
> memory decoding and PCI_ROM_ADDRESS_ENABLE as long as the ROM BAR is
> not mapped in the p2m.
> 
> Would you be fine with the comment in the previous email added and
> rom_write() adjusted as suggested above?

Yes, that would look better to me. The comment then probably also wants
duplicating (or pointing at from) here.

Jan

