Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF57374F4B
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 08:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123350.232651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leXKO-0001Me-AL; Thu, 06 May 2021 06:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123350.232651; Thu, 06 May 2021 06:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leXKO-0001K7-6A; Thu, 06 May 2021 06:17:40 +0000
Received: by outflank-mailman (input) for mailman id 123350;
 Thu, 06 May 2021 06:17:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EnkQ=KB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leXKM-0001Jw-Kj
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 06:17:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 463ef56e-ad5b-4eb3-97af-e84ba5c3b088;
 Thu, 06 May 2021 06:17:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-pyIp8JIMOuSLpZMIhmiWQg-1; Thu, 06 May 2021 08:17:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Thu, 6 May
 2021 06:17:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 06:17:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0116.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 06:17:32 +0000
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
X-Inumbo-ID: 463ef56e-ad5b-4eb3-97af-e84ba5c3b088
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1620281856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UlHoQFkYAd6QQQK+p8KDmXW/sb6uT2XuuteBhUJFrcg=;
	b=jeEhpKLWKQDRI0aPbCB58D/MwFY1c2rK3eJyjvI80e0HpFvTme+YQUdo7dJeb+rpDsVmHe
	JuLaPywrRsuD+dDjrqYPjxVS3MimwcjSCenauwcjv2fsLpbsSp6REeKq4jNRg49K4TSFjq
	tjKbbVOpLO6ulk4p6s4ui+J5W5IEPAo=
X-MC-Unique: pyIp8JIMOuSLpZMIhmiWQg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PE9g0dZr2Xie90mSXZGORy8yhbmdRHBv70p3uIxR7ODH79LzdeO6fd2HtwnSyAK/BP6kH7Vr4b+U6trgBx1rE0n5sW02J/bDnv4gENTOQR4iVG7IOCCJHzOZuGLxmtkJ07BsCHi5ElaUO0gXjqRe2dmR8AXjJQHbHqXhS/nz6Uz3qGUj1NRODQ9J142uKB14djyI7bnT5lD+PNwd/PRk1MRGwbR2w2yTfhzU3z4ETqyHMYuT0z65veKCXft50nWYkfHhn9t8ICAph1z3gc5qUsxwM2uxhUyeb13bw2ewf+YM0ulIzRYzU6b8gYLp2D5ee6wcUMU1zgCTyKnVxbhDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pniEuLjovCExY280Ez4B6hLD5bMfEtcXyVRIojq+2UU=;
 b=ThFLws4F+oikzlgGrzg9lj776TOmwLoh62c1tVF/RsqAs+of1QtrXhpoH4kGVbg/f3eaY3iCClLv2MnnGftS4PvM2nIisH3spUlE3S9OotfbbibTCsj7++SU7263C+4GaXJ7sgEL13qPFmYZxh75/x02ET7SjQCTBVZ0pxzngkPoM3/wMKFdGOjN2wxzoza9GET9tSLQU0STbBVRBpPlQ+bSzkN0lzBFylnLYdjsBlb6dsejzqaQaOHj2blwctMVlQv7pVebCOOyflby6+ca3H+gtRbAQfmHGVDlOFMSNG8V7yvSRBZSHSOdoBY5N/sJOf2xs5r0faM64O2EEUM3Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 5/5] x86/cpuid: Fix handling of xsave dynamic leaves
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-6-andrew.cooper3@citrix.com>
 <5e6511ca-83bd-8a43-202e-949b4d19b1ab@suse.com>
 <1279476a-f99d-59a4-7fed-1aee37dbe204@citrix.com>
 <d951dc24-e613-8a1d-13ea-b1e439048165@suse.com>
 <7ce89520-7cca-6c9f-f229-37515116d74c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2948dca5-2c1f-8ce0-e647-1a2ff4e85436@suse.com>
Date: Thu, 6 May 2021 08:17:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <7ce89520-7cca-6c9f-f229-37515116d74c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e0aac5b-bf11-476a-46dc-08d91056a2a6
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24453E1C2B90B2B5E8282E68B3589@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DJyBWlLh1otPl9orLA2ZMLYyAVIwewr2X2StKGoSzPxBWiPQzPfiY1TxQt8eELPg6rjnLJUYqV0UeqPV0laotZFn9ILPNDKT13/Brhtt4K6XJdik8ykULo3LHoKV08k1tVgHc5SHKGO+ETTepaN9TAoWtAKoNznCIYGt9Iv75QqjsDmfx1YnLtQnlvH4YJxnJncCNaDuZXMaWfCQXZCZ0azXq8A7s47Fbkz5b0v2hFhLX9Rp5NiSdPJ6GMYCIi7wqb6dBEVt9Kg1IbPWk+rmDBpCpGZLr6q2cZ7/3fW8Bc5fYP2e6xD3Y1+iEr93nQcwZxZBRLY/X7cjBgmDC0agbKMpIh+eSyxOzmncXXBpKV7qYPnbbr/bf12n2Nbp6A5pJytLIuQ/FI7Ubeg3bmRGKts1EiDDwyQlfCricQwR/5V1N+SoyTns6ypC8EcPvBpnQ31XtC5Nw9JCKxJZZukse3Fo/a/ACimX/nC0wGhET3HdeCQaplfeI5md1omWj2fUfq3w+pvFmsQ9oUvPhr6CA6dgFVLuwaEl7j/MNzb+7CGcM0WlEBjxnFJ9wmlndUMSkXkfhgZrUQHa5Rwvl8SN2M7dgHbefun4QWzGWl9tlSrVZmSVJCfisex7VENwCuKJlO/JLO7TtjCPoEi6PBvKlYm8TklDkudUZsfrkyWxy+cBKjVstkmPiIQm9hb2IrCcPIiOBJQJdhDu5u2KG2erHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(376002)(39860400002)(346002)(366004)(6666004)(186003)(66556008)(53546011)(52116002)(66946007)(36756003)(38100700002)(83380400001)(478600001)(31686004)(26005)(5660300002)(316002)(4326008)(38350700002)(6486002)(16576012)(2616005)(8936002)(16526019)(54906003)(6916009)(956004)(66476007)(8676002)(2906002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?lY1SxT3AQg1H4nmWxLXXx+CHFoFwyrkXGgt2A9Fd4GKiKmY4/poZdOA02meP?=
 =?us-ascii?Q?j27P5qUYrMmL09s66ehzHm/gdERWPmgmxaOAaAyzp1QLGej+YRhcy+tLjYTL?=
 =?us-ascii?Q?wOnwIdr5obvLULrZUl/CAQ/vhGQ6CTxRRLGIhodjPlM7e61O5l8hj2TOiT/g?=
 =?us-ascii?Q?5vfi7rdBC0OPHeuqjrkeDZFcuWeQMLcfXoDr+YRZFJWfQZZuq7/YxeokQHTi?=
 =?us-ascii?Q?OgOhgcSbCiekAwSDmuhBBIniAyfQyiCRxJlpUsaillc5q0xzM7/2i9lxlP/Q?=
 =?us-ascii?Q?d/kwbwvk3znQydQTfC7wen5JizKIoFvyo+00A6JAb5GGyyfi507GPbdXWnTL?=
 =?us-ascii?Q?pZtZF9+AUKYv2s1hyusgyfmoj2o3Bh/NbjdnazMrEvoeiJ3FjilNfFyfQiIm?=
 =?us-ascii?Q?nQ2a8GOtl/nRduYjPlm0aPVMQSGTU9gueM5gESCaXRpj+W/NT3ox4emkq3eT?=
 =?us-ascii?Q?EaQScRyzsy6tonNfu8cj30cWvdBhkgdC3BD5IyAusEo3H4eXOMAo2CotFHrF?=
 =?us-ascii?Q?gV+6YfMDVXy/QR0LCUyt3+W9Xc2OgFKrThWzqwo0qHLEoeGPpLI4c/vERuYs?=
 =?us-ascii?Q?OeJ6JkMyBRKQR084WX1TXMTKEHIOo+WMIvC2RNPYxw9ogOSYQEAopPh/ickK?=
 =?us-ascii?Q?u7llE7Prb+b5TYxPaol04li+WHFJ82y28/cwftoWYEUEMX+9mReZzScGXv65?=
 =?us-ascii?Q?+Vam4cuxJlB/TjYMhMfCDh/Mo66stbETi2yi5eN0/9Sc7dAp+XxoP1551ywY?=
 =?us-ascii?Q?bxJO/9sNpsALZZ6bxhCZLhmMqG3U8RusvLzd/ARxjq6CLAxf1f+CaehTDFX/?=
 =?us-ascii?Q?59yxKXnocv0JMrR5w0BLiV8ubJYDsgbfWxwTvk40Km/AjcdOA+Ypjem+3Rin?=
 =?us-ascii?Q?uG3Gbueexk2IPJpChc1vTuAJ0AJnMQ7u7iX0I1UiT8ldnOjL99JMbBaD9uH3?=
 =?us-ascii?Q?ZegtO9J2WeTCkx3BgWBfCZhu2Af948G8CROemjD2PpBBinP5P1e9s8GqvkFK?=
 =?us-ascii?Q?SjIcbQcMBvliFCbMgbZE9oVhqgzlE8nkH0L6c13hKsnbvTNRp8KW0C84otIn?=
 =?us-ascii?Q?CbsEfWB60uzWnWqlCkES7NZIJDl4B6Cz6jvFeWX6HqYO5IxC7sTGw5JIgimu?=
 =?us-ascii?Q?QNKZ4nvHkwtXe5rYtaNop2ouC7rE9ZrpPJjDhBl5MYse6rhzQmvsBHuWHJUG?=
 =?us-ascii?Q?yrOwerwVED+mVO8643krFE/YOZ/bJuCEuNu6wy7ed9IsWxRfRe+8/CHOU+hD?=
 =?us-ascii?Q?2f5owpZPWGWKcvkPGYz79A98tXTqQ9206iMoLJ91/0Z49Go1wjKmjfq8iDxx?=
 =?us-ascii?Q?Gxmh0qiOdGCTQf3ksrsqVdA2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0aac5b-bf11-476a-46dc-08d91056a2a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 06:17:33.2713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SM3ZSd5RNJ3Vi+OpdHblFWEECKQMYBthTGS70H3jklpZT+nQQ9THlJz08kQhQJNWR7JWTIMFL1Uv27LKj/JDcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 05.05.2021 18:59, Andrew Cooper wrote:
> On 05/05/2021 09:33, Jan Beulich wrote:
>> On 04.05.2021 16:17, Andrew Cooper wrote:
>>> On 04/05/2021 13:56, Jan Beulich wrote:
>>>> On 03.05.2021 17:39, Andrew Cooper wrote:
>>>>> +unsigned int xstate_compressed_size(uint64_t xstates)
>>>>> +{
>>>>> +    unsigned int i, size =3D XSTATE_AREA_MIN_SIZE;
>>>>> +
>>>>> +    xstates &=3D ~XSTATE_FP_SSE;
>>>>> +    for_each_set_bit ( i, &xstates, 63 )
>>>>> +    {
>>>>> +        if ( test_bit(i, &xstate_align) )
>>>>> +            size =3D ROUNDUP(size, 64);
>>>>> +
>>>>> +        size +=3D xstate_sizes[i];
>>>>> +    }
>>>>> +
>>>>> +    /* In debug builds, cross-check our calculation with hardware. *=
/
>>>>> +    if ( IS_ENABLED(CONFIG_DEBUG) )
>>>>> +    {
>>>>> +        unsigned int hwsize;
>>>>> +
>>>>> +        xstates |=3D XSTATE_FP_SSE;
>>>>> +        hwsize =3D hw_compressed_size(xstates);
>>>>> +
>>>>> +        if ( size !=3D hwsize )
>>>>> +            printk_once(XENLOG_ERR "%s(%#"PRIx64") size %#x !=3D hws=
ize %#x\n",
>>>>> +                        __func__, xstates, size, hwsize);
>>>>> +        size =3D hwsize;
>>>> To be honest, already on the earlier patch I was wondering whether
>>>> it does any good to override size here: That'll lead to different
>>>> behavior on debug vs release builds. If the log message is not
>>>> paid attention to, we'd then end up with longer term breakage.
>>> Well - our options are pass hardware size, or BUG(), because getting
>>> this wrong will cause memory corruption.
>> I'm afraid I'm lost: Neither passing hardware size nor BUG() would
>> happen in a release build, so getting this wrong does mean memory
>> corruption there. And I'm of the clear opinion that debug builds
>> shouldn't differ in behavior in such regards.
>=20
> The point of not cross-checking with hardware in release builds is to
> remove a bunch of very expensive operations from path which is hit
> several times on every fork(), so isn't exactly rare.
>=20
> But yes - the consequence of being wrong, for whatever reason, is memory
> corruption (especially as the obvious way it goes wrong is having an
> xsave_size[] of 0, so we end up under-reporting).
>=20
> So one way or another, we need to ensure that every newly exposed option
> is tested in a debug build first.=C2=A0 The integration is either complet=
e,
> or it isn't, so I don't think this terribly onerous to do.
>=20
>=20
> As for actually having a behaviour difference between debug and release,
> I'm not concerned.
>=20
> Hitting this failure means "there is definitely a serious error in Xen,
> needing fixing", but it will only be encountered the during development
> of a new feature, so is for all practical concerns, limited to
> development of the new feature in question.
>=20
> BUG() gets the point across very obviously, but is unhelpful when in
> practice the test system wont explode because the dom0 kernel won't be
> using this new state yet.
>=20
>> If there wasn't an increasing number of possible combinations I
>> would be inclined to suggest that in all builds we check during
>> boot that calculation and hardware provided values match for all
>> possible (valid) combinations.
>=20
> I was actually considering an XTF test on the matter, which would be a
> cleaning up of the one generating the example in the cover letter.
>=20
> As above, logic is only liable to be wrong during development of support
> for a new state component, which is why it is reasonable to take away
> the overhead in release builds.

Well, okay then - let's hope all bugs here are obviously exposed
during initial development, and no corner cases get missed.

>>> The BUG() option is a total pain when developing new support - the firs=
t
>>> version of this patch did use BUG(), but after hitting it 4 times in a
>>> row (caused by issues with constants elsewhere), I decided against it.
>> I can fully understand this aspect. I'm not opposed to printk_once()
>> at all. My comment was purely towards the override.
>>
>>> If we had something which was a mix between WARN_ONCE() and a proper
>>> printk() explaining what was going on, then I would have used that.=C2=
=A0
>>> Maybe it's time to introduce one...
>> I don't think there's a need here - what you have in terms of info
>> put into the log is imo sufficient.
>=20
> Well - it needs to be sufficiently obvious to people who aren't you and
> me.=C2=A0 There are also other areas in Xen which would benefit from chan=
ging
> their diagnostics to be as described.

I generally disagree: A log message of this kind needs to be detailed
enough to easily find where it originates in source. Then the source
there should have enough information. Things are different when a log
message implies an admin may be able to take some corrective action
without actually changing source code in any way. That's not the case
here afaict.

Jan


