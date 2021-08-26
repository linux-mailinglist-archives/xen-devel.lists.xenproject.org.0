Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C383F8334
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172774.315279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJA0C-0008Fn-8l; Thu, 26 Aug 2021 07:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172774.315279; Thu, 26 Aug 2021 07:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJA0C-0008Dx-4D; Thu, 26 Aug 2021 07:40:44 +0000
Received: by outflank-mailman (input) for mailman id 172774;
 Thu, 26 Aug 2021 07:40:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJA0A-0008Do-Pj
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:40:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e990d9f4-0640-11ec-a9d3-12813bfff9fa;
 Thu, 26 Aug 2021 07:40:41 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-pW52T81NNGKDI-F5BLu9Sw-1;
 Thu, 26 Aug 2021 09:40:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 07:40:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 07:40:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0027.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Thu, 26 Aug 2021 07:40:36 +0000
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
X-Inumbo-ID: e990d9f4-0640-11ec-a9d3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629963640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/mkoJkS2nsAPIogrUG5cpu9oBCL7sD7bqU7z4PnbtgM=;
	b=KkKUFUFJGakmbrs8EZiIMNZH3OD8BiABKX+m5jo4ICaOkZFKZvTlt+6wlx85xFbEW0rqk/
	9zymB9UPFLSf318h56DspjvzWpogBpiC5kZ/RKhc2TPVRamrtfvZVoFT/w1uMy25y5oijb
	eMsY+lmoxSYkP7Jc1SIjiNm5S5p0880=
X-MC-Unique: pW52T81NNGKDI-F5BLu9Sw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idSHL73UXfGoXJ9tNFJPbx0jWjs7dQJX8Zmm7TGaSJ0qvY0fUhuOGV7dFRU520Pq7BuamGQ6UhDLIrrBaRqlhZeWxkoV6MnEcOUjPhXQQYnqmr8r7Z0NoWxMbWZSUic5t8qB9ExVBl7k02ReKAvTihZ/mFj4zU1nhJV981TURz6aqxsMhMzHVuGTl20IhEjcXnxB153auYMqOTobTuOQn5VJKLyX18sD017AmimVufcLaOWm6PuS0t8fu0XMGl/RJn4QemgSTnZoFoLtFy8bjOrAXEildACHEYP5x9FFUo3IhDpr7hEXWYus8FVWUWMiHqz4GHVYWnT9St4HG03HcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2f1ZJz7UGKiKdVtixzxUoCAeaTNNvJ3KIXZkRUv1yE=;
 b=E+SCvxcHCjIha4fLWaYbXAsRHGjSu2qPV56Tiov/J3xxgGRrB8/6r8JGDQqjYIc4xvkPfsDWz5vY1LtQcH7I/dGuL1+Sz//t4fufys+Z/NodF6z1LTVNf1IS32fSkAZztX7nXmHdqdJuF/E0QyQY31lVaCaUsJFB959o3baKstdEHSzweSQklqjdX3EXEFk1fc1pJ61YK2MDWCSqdpQHmQTPeIhod3wFkeXNovMoEFQ8+S4Fqw2tUMbno9XV7bNmhXef/Erm9FuzON/lYkSUS/1FMo1g2dgqAUcVodG2Kv933rwaEpu6OjABYGpp1jPMSr4RXIEIu1MrVsCTSSJXfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/xstate: reset cached register values on resume
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
 <45de5185-b514-8c52-6922-4c587818c698@citrix.com>
 <3125583f-b965-7746-d833-c197857cd7d7@citrix.com>
 <15fb708e-e03d-bc4a-a0bd-72b81d26c6da@suse.com>
 <930a3c79-ddf3-2b95-495d-8d4f229c9fb9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <853d0d22-734e-b3ef-dff5-2763c88630eb@suse.com>
Date: Thu, 26 Aug 2021 09:40:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <930a3c79-ddf3-2b95-495d-8d4f229c9fb9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb831be6-a215-4ee5-7265-08d96864cba2
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB647866247D4AEDCBE4A257C4B3C79@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5MYuMGNyskQB9U+qUNREr8w2uzTDb4ZGCcaeeGaybUbNjgjCdej3Oiv/C5ELVAN+aUoRcbPg5kbTVOWenPA16dwpu8yCUEZqnpWXniabUECgnkI2ltaje4HAY+QYheAVBAX1Laq7pqVJM2WtvNdiY8cqu621r5jEoJtI9rcSuFIo8IzLv5DX/aD/uGpcIIX3nRcQCIfKAHUeZMUGx1+dtyJV5yFLckT1cXtZzOAhb0pfkWDB7nTOdZUb2yGSYpok9n5JEjE+5RrQioNaHDPVDawgPgUFUuKkkq6HCZcELC7m2WiFHb6M1+TgUU3YrbAblknD001JzXbgcnRDdUOg8WViu6h0GPp1k3rTATHDW8P7j1LVyZTU6QVfbHJr/ivy8qHIpTRNTwn/H7lrRpaE5+6hjDJfmwsX9C9zeHIrja8DflG2zbpls+xww3e5/K5hlRDI9MTUBz354iyK2X9N7lmPGKxUF6VvRHlRKPYYHxTnYoLXZiGyi27tVq55Bt216y8Oy7SWvD11S8nqsuZLoMq693yKnTTpBfLS9aokijnEoZA8FZlapG6Dkh4NInK4xOSjH9oveK6CBrvjtyxk+MsFQ/C34I9xJUciyQjR/1+G5ZzQ1BIPgFXhVPbi3tbbAJQWFRUTFkazV/5f2umTEISgwhqyc5vmHMt4S0umtIFeRaiBTCBvA0bO3MJdN9zQHr3xPIBTEu3P6MWs3OmVJCpDVevFL0Jhd7tHUMs1e3c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(366004)(136003)(346002)(39840400004)(36756003)(66574015)(478600001)(956004)(2616005)(38100700002)(2906002)(16576012)(316002)(186003)(5660300002)(26005)(83380400001)(6916009)(8676002)(66556008)(66476007)(54906003)(4326008)(86362001)(31686004)(31696002)(8936002)(6486002)(66946007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dKIqtQL5lg7wni/6zlXcCPLboqfUh938IVyzene3NPYRlHbfrsdgHLwtuorQ?=
 =?us-ascii?Q?h/jeWM7+VFhuxxQV//m5DeRlPyhxoAopMV2Xn/TEc3jubafZST9GUiXGT38/?=
 =?us-ascii?Q?9C+oAQxoOCGvTjeAtaNRpOVIGWn7NcMjCOkXTaxHRtW3pUGb3tMF9+O1jJmD?=
 =?us-ascii?Q?F14XKipDbaVJHWt2K/1HUJ5QkUzIhJCCIUl25H+PTxmldgVr1Qd34S2adWXj?=
 =?us-ascii?Q?9XGlfmukwwV1eo/bZ3mpkMG++j4XL3AQCT5jI3OKO3JhbtME2pukNZEngRcz?=
 =?us-ascii?Q?slQEgN6aIPgx3vqhH6kNLZP3Sb6SC8yF5jUNSpa+MKS37/MiYKCocfMZplPP?=
 =?us-ascii?Q?IB27NKyyTZhKMznLmeTATMtgb02xnYsdmpFcdX6d2XLBOyHEYCE1+IR0or1C?=
 =?us-ascii?Q?r0pBIFziB8bLRkLZ8CiePHI0iCwk/dSCT9SZln9zECRHPl5sQVI/RkfgHSe6?=
 =?us-ascii?Q?hyTEIjSk2CtVms0ujf2cqu5Ksy+WCAdlt+y0MMw1y7qQ8MszbWUL8LFVddS2?=
 =?us-ascii?Q?mrzhMTIr4U/XOtyfOI+ESPhgjCFUw529sEBGZOgaO8Hf1+97s0hgBFvlxrDN?=
 =?us-ascii?Q?0fOCkOrL27LUH9QgEm9GIBZboHYF4LOZ+BRSWDoTflfHxbNYB6Lhif/Nu3vX?=
 =?us-ascii?Q?bOqoNU4c5Eh2Xujh/hcbpMjrNj3/DbeSVyuHxsZgxC82U+RBPAPeBukkwUYx?=
 =?us-ascii?Q?jejzAX174yEOx94l//WG9f+Z5MGga6Mr/FarAgGzTS/DWhXEtsdnCmDKP1vX?=
 =?us-ascii?Q?TX05OEb8Xqqwz60dommtWb5sEJYFqNORFTzwgL7uLspz/y25XqDErLxvSEkA?=
 =?us-ascii?Q?ddu4r+Kf6EAf4sQRM4qSFGUEn5Vq597QJM1i/lOJ9fn0D+l+ahgOFgAGfPmq?=
 =?us-ascii?Q?RpXnGF2QbovI0NUGIDhkv5I+RCbNrDG50TX6rEyV+TkRGBFj6+GpetJTQ+Wo?=
 =?us-ascii?Q?cjvHxbxBoutJuFMI5fIKjFY/B2R80oITk5r3sXOCsROgKyG7tMjlnhTpgmvR?=
 =?us-ascii?Q?z824pN47tumyFUQsWBRkkw9D0DccRpOSLv2eANYybzvJBfeglEBuwFP1+qU+?=
 =?us-ascii?Q?mSNOL7egEItP2Vncm1eO33LBCWpKqA4KFWQCkW5/d9HiKXX+e5miKzwFOKe5?=
 =?us-ascii?Q?MeYLqY4nmshiD/xTsLfaWOSLoSECxT9tSw7EmmXUNlM+UOLQL6aACjL0+7KT?=
 =?us-ascii?Q?xRGAZYdRF3nxeU3SEfy3zREVbbQo7d02BHLe0IqF8zmCOz/49Xl3ziQ9uDBy?=
 =?us-ascii?Q?W9z/6ZspWjD2pNoQM+3C7Srsm14+uiXKBwv0E+SpAbGq2XzKdmNe1IqG4ZEs?=
 =?us-ascii?Q?W30cGtytV9s9ez5VYhCWMsQq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb831be6-a215-4ee5-7265-08d96864cba2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:40:37.3234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LV2BnlDyQ++8gsKhnlAifjTqfwxWUZ0tvPazUms7WjRnzG4prCm+W8WN04WhtAMpRzoupYWSw9zeX+UDRmJC9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

On 25.08.2021 18:49, Andrew Cooper wrote:
> On 25/08/2021 16:02, Jan Beulich wrote:
>> On 24.08.2021 23:11, Andrew Cooper wrote:
>>> On 18/08/2021 13:44, Andrew Cooper wrote:
>>>> On 18/08/2021 12:30, Marek Marczykowski-G=C3=B3recki wrote:
>>>>> set_xcr0() and set_msr_xss() use cached value to avoid setting the
>>>>> register to the same value over and over. But suspend/resume implicit=
ly
>>>>> reset the registers and since percpu areas are not deallocated on
>>>>> suspend anymore, the cache gets stale.
>>>>> Reset the cache on resume, to ensure the next write will really hit t=
he
>>>>> hardware. Choose value 0, as it will never be a legitimate write to
>>>>> those registers - and so, will force write (and cache update).
>>>>>
>>>>> Note the cache is used io get_xcr0() and get_msr_xss() too, but:
>>>>> - set_xcr0() is called few lines below in xstate_init(), so it will
>>>>>   update the cache with appropriate value
>>>>> - get_msr_xss() is not used anywhere - and thus not before any
>>>>>   set_msr_xss() that will fill the cache
>>>>>
>>>>> Fixes: aca2a985a55a "xen: don't free percpu areas during suspend"
>>>>> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
>>>> I'd prefer to do this differently.=C2=A0 As I said in the thread, ther=
e are
>>>> other registers such as MSR_TSC_AUX which fall into the same category,
>>>> and I'd like to make something which works systematically.
>>> Ok - after some searching, I think we have problems with:
>>>
>>> cpu/common.c:47:DEFINE_PER_CPU(struct cpuidmasks, cpuidmasks);
>> Don't we have a problem here even during initial boot? I can't see
>> the per-CPU variable to get filled by what the registers hold.
>=20
> No, I don't think so, but it is a roundabout route.

So where do you see it getting filled?

>>  If
>> the register started out non-zero (the default on AMD iirc, as it's
>> not really masks there) but the first value to be written was zero,
>> we'd skip the write.
>=20
> There is cpuidmask_defaults which does get filled from the MSRs on boot.
>=20
> AMD are real CPUID settings, while Intel is an and-mask.=C2=A0 i.e. they'=
re
> both non-zero (unless someone does something silly with the command line
> arguments, and I don't expect Xen to be happy booting if the leaves all
> read 0).

Surely not all of them together, but I don't think it's completely
unreasonable for one (say the XSAVE one, if e.g. XSAVE is to be turned
off altogether for guests) to be all zero.

> Each early_init_*() has an explicit ctxt_switch_levelling(NULL) call
> which, given non-zero content in cpuidmask_defaults should latch each
> one appropriately in the the per-cpu variable.

Well, as you say - provided the individual fields are all non-zero.

>>> cpu/common.c:120:static DEFINE_PER_CPU(uint64_t, msr_misc_features);
>> Almost the same here - we only initialize the variable on the BSP
>> afaics.
>=20
> No - way way way worse, I think.
>=20
> For all APs, we write 0 or MSR_MISC_FEATURES_CPUID_FAULTING into
> MSR_INTEL_MISC_FEATURES_ENABLES, which amongst other things turns off
> Fast String Enable.

Urgh, indeed. Prior to 6e2fdc0f8902 there was a read-modify-write
operation. With the introduction of the cache variable this went
away, while the cache gets filled for BSP only.

Jan


