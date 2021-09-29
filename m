Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F7041C65B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 16:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199185.353084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVaFi-0007i8-H1; Wed, 29 Sep 2021 14:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199185.353084; Wed, 29 Sep 2021 14:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVaFi-0007g1-DH; Wed, 29 Sep 2021 14:08:06 +0000
Received: by outflank-mailman (input) for mailman id 199185;
 Wed, 29 Sep 2021 14:08:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVaFh-0007fv-4p
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 14:08:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8b3ae3a-212e-11ec-bd03-12813bfff9fa;
 Wed, 29 Sep 2021 14:08:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-P3TJ84vJOou3NOP7P4kGgQ-1; Wed, 29 Sep 2021 16:08:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 29 Sep
 2021 14:07:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 14:07:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0010.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 14:07:57 +0000
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
X-Inumbo-ID: a8b3ae3a-212e-11ec-bd03-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632924482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ViM8jzRzCOTzWSnpTwG5LntelwydUcoBntssLsOKEvY=;
	b=LhX0yxXckvejhOJwDW3yCXa03Y7B1EkeQUamc3QwoUUYd1sfqoJnXXCasHkjSUAvw7t6Sn
	tEsWRl14aIdbo4YCWcIPO7RdVAWhOPaEFq8sACz2L7wPH0/6SG/okmyE0S2E0bPtMrgluh
	JgyJZFh9XtrIsKplR8afffYyZRGACJA=
X-MC-Unique: P3TJ84vJOou3NOP7P4kGgQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZumrToqLkUlg1Bmp3scytRGpSmGWkrsmRSSFsFvkFnf+8/Vawi4F1/SFMdJN7hTeaTOrh6TFCXkjU5fAgzHaMyz38USM1Q8JRx2vEbz7tTgNurKrvzI+wA4ylOY/lnfnY+Mh3DmUaw+5QfXPxixUlR7Ab0zunNvGHwErvqVUBhZ6DjOQ5xJwfxG6Vbhv4uHiHr6y6bdnGebmgEOyEVneXM+/ZeFOCeomYLfKH5Oyikk1RmjzZZPleYhi9FY0Bc3g4OYn1f054/lfFyYFB7TdUDe/Um3vWKRlDO5sSWFqKX6ABIN83ZyKQtz2YEUiK9+EU+s7GP+TiY32j2UO+eZgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=t0yf6sfhCUwuD0kmdu4FIfuByO8IeAI67Hnzb1aLonA=;
 b=mQifHXtb20WrSIt7aFvoJK5CM3LCWYYRVH2Uvw1gKPtiQOTHO5EUAk6oLHIzfkmQP3SO3wlqraY2UjGnkbnjCiKkZxfwuVLzdWT+LUGiLI0h89m2qc/IpKp1XVb1+l0o9bY4TKyD0N/xEpjyBlstMsNq2Ewep3xgE0Oq5nzy4i2+ePiAEa4ucz1AUHXOtyHi/isQJjQHlZ4eM+6qwNUGwPhnOx99SYtMC/p5D1ErGhhnWLkDFiAvJRPuUt8ibq5EXWRk6KtU43EdFNDnfpJFFDyRMAS2r2eaABwXt8rhrqPUAZzfjHVsOR1vSj2CUbvwLUHHTbpOkdRSFwTaGs0/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@arm.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-11-andr2000@gmail.com>
 <6a760126-ba6e-bdf7-97a3-205d75d3d99f@arm.com>
 <66cc2b43-eedf-5d58-bf93-5047ecf9ac7b@suse.com>
 <71d8eda6-49f8-691c-1e6b-711ce9f99d50@arm.com>
 <600cc603-5e6c-b430-def3-74a9b596daa0@epam.com>
 <8f5f9b93-2b13-30dc-372b-10326130b71d@epam.com>
 <4bde7d37-6b11-675e-79c1-e6e413fc97f9@suse.com>
 <7402aa24-e203-795b-0ca7-69e55c6b3f4b@epam.com>
 <38d64660-bf9f-98a5-9aef-5a3c39804f7f@suse.com>
 <26c228b1-eb4d-1984-4f24-30dcd24e1cb5@epam.com>
 <548561a6-f878-cacc-cda2-30508a43072d@suse.com>
 <5dad2004-f507-3610-cdec-cbf26f77cd5a@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3f9850d7-9d48-de59-56b7-fe3202f1764e@suse.com>
Date: Wed, 29 Sep 2021 16:07:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <5dad2004-f507-3610-cdec-cbf26f77cd5a@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0010.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2a77296-3a58-41d5-2b05-08d983528a67
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33898FD7F0686861C405FDF6B3A99@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l9R6Wq8E5fnmVSU8Z5BDOdkKG3xQRMUpPEsKyysqlu5tZCITOO6e2PKDkHDzp5WZUP8jAjeCS89k7FpkWVEB/4LHWa/zeHi3VtMbHRGYCHfwi3+v4Y+qKTCBz2wSmtmfsFnbn7q5TJhrCYX+4t24ZUp7JUj4f18xRfGvyO3nXs1sb5bDRmaRGvNzigVsUzhooH1U+9vs3yHlVeW7vlWLW9FUKlkvPAyD7X2JCOUB0ZNnMjR1BehPr9ohZoWHVNgNpniDrgzn53t9Q6ur6F8XvUF+t7tDLutBUM/xfQXQF4klZbhwTloLANMIZUNvhw/DnHekHWW5fIjcD57K4aPHJJdHGiaH9PxrI3zS5JjcqAGUyPdiEvMz6MvzYxceUNPDhaRr7vLHMLvRI/9+zSACs7h6wHTUov1fbVspqic7SMEdc7aPOMQh2ovD/WTuelycGf4h00sKjEXQBjgmZfoDsqp0hLqumIeKRGszpnQEHz2qqxN6+avX+iMEfdjKPwHAkb+CNKdbbNahDlPRh+3i0gsn7MmdxP8kng5g5Zb1HfZY6hbo3KVwwI5eOh3cbmWH1IyHYtJrCRyJ+8RrCJY3IOayPTA6xZbLWRvISdIClWwsCjQUFa57IfWUF9/hPAKWTlGGZSgev2OCIB7bpGt24wx2NOiurAqgYPnXg2zXVBhcIDxmWOyfMKeCb6H8iiRz6DLvh5uhbYZKclOXppbn7EGt3/5MqTB9v/jnl1693KI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(2906002)(36756003)(16576012)(31686004)(66556008)(956004)(86362001)(53546011)(4326008)(7416002)(2616005)(54906003)(508600001)(66946007)(6916009)(31696002)(66476007)(316002)(8936002)(5660300002)(38100700002)(8676002)(83380400001)(6486002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q15VEFBOiKd3ag2LBI0epg92R8WGtfKkAcDRlPQ5WwhUBxBl+zB7UcFveZaX?=
 =?us-ascii?Q?gX8fJeIdCHZdfpUF2vPC+gs+dBoIBnylw2vyr0GIAoBnhzhv/PlKo2/LcH+V?=
 =?us-ascii?Q?TVmuj25iR+iwxM2fpwrIgr5gUluy2iga6+73++Sku6u2e8NQCv7fFfFm4AOg?=
 =?us-ascii?Q?bFOfhkck5xZDPS/x9hJ2WV5MuEVkoFwyaGrr0ogtc8AVGA9Bw/m+Av4efYN4?=
 =?us-ascii?Q?MMjmG1w+ITeCBjmB/mOP5Rt8UEuwmOiVQR9yUs5EPP4Gwu59SSK6cX8KF1Ws?=
 =?us-ascii?Q?mqCj/mbySuxAm/aG01D0UfGc3RJD+mpPExOkGomEAnc66zzl1tKA/WjY1iNj?=
 =?us-ascii?Q?WZO2cu9EmNLyNiq8j+2xV9+bujcHzCa+1o2S+DH7XCeB+O0XdjnrSDZC4K4i?=
 =?us-ascii?Q?2/DVzRpmEL6P0FS1ODrT4NL0sz6ytjnGcOmoo2eAJvbajlxIPL+hPJAO3BtO?=
 =?us-ascii?Q?dtJPWZy3l+fjRGWFPn1WxOv3iTJ2rF6/Li9zyp9MWITyyWprKuvyeHymc4+V?=
 =?us-ascii?Q?qyK73FZ3Pc0kkp50GkvnvUqdnOTgICcDZoC9Cd08a95qmoFCWR1ERX7W8kI0?=
 =?us-ascii?Q?bWgO/bPhaEOYN2G1gSC2UKPL29nLJxBdeR/fkcJNs9Yzd9IixldiaPE5tMJs?=
 =?us-ascii?Q?+E0AcrPxhaqOdvulnlwz6Kh0/IA25g7ByiqsHumENPtIWZn/nbRA/8EAeXuT?=
 =?us-ascii?Q?e3ycKBHnKasplPzGFafeyutF5HO3ef7qDLYxFD2wEbhdJeVxOaXKJxJ/IDe6?=
 =?us-ascii?Q?sT0c/x64123WnTTJb9ZVeBNaeesKWDyeg2OH8JM5l11DZ8wqmJkiAbJTDFUL?=
 =?us-ascii?Q?C8q/ZnI3JxQ+VgI6Exs9ef/u/9hv9D/9Dgtm3UgEqxGE0oT+HYpsZs2Us8N/?=
 =?us-ascii?Q?VDp6DPBpNlFYt5iJ2J9U5pAOoMQobIpXTCVlHq7UX78Yqcr3a5RIMXo8va/g?=
 =?us-ascii?Q?/1VywGRyvp0+rNzmNfmxSaeyeKibJ7Z7HFUmbCs/VJ8c1rK9mk4NaQ66AnYB?=
 =?us-ascii?Q?SrML8dQpUCwy16Yk+21FutnqaPEqqYrOKURFM79LQATDXGFclDaqRXQUQU/2?=
 =?us-ascii?Q?SBU4gWOOD8lPJBriaI6kCw0EewblU2GIDIHt4alOVjPckvB0v9SJ+SXWRGRg?=
 =?us-ascii?Q?aZiC27mSj1dkcVnEpusHEHhRlfS8kdB/o1XDHl3zFBrJhjXfv6WB9+/aDn8x?=
 =?us-ascii?Q?IiagHXXIFQYzc3VkbtWq7Rlhrj7Ky4u1t60JSMblDC3pWNyaH0cb3kYTrW1i?=
 =?us-ascii?Q?A8wjQKeWTfS8tmgVZvtZyQnv6Wng/14ac/CrnwumgXaPfr89sCt9RlQ+jZGE?=
 =?us-ascii?Q?DXx6ae4cO7Del0fwsgjAdsH0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a77296-3a58-41d5-2b05-08d983528a67
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 14:07:58.3279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJwTrk8a2W7X0x/ZBDUHyN/w/1BOcmNUcVIKDZSkUKVgVMf8gjt0vT3sdISF7BEGcLz85LGl4pBAOD4ZsYpPRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 29.09.2021 15:49, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 29.09.21 16:23, Jan Beulich wrote:
>> On 29.09.2021 15:16, Oleksandr Andrushchenko wrote:
>>> On 29.09.21 15:54, Jan Beulich wrote:
>>>> On 29.09.2021 13:56, Oleksandr Andrushchenko wrote:
>>>>> On 29.09.21 12:09, Jan Beulich wrote:
>>>>>> On 29.09.2021 11:03, Oleksandr Andrushchenko wrote:
>>>>>>> Sorry for top posting, but this is a general question on this patch=
/functionality.
>>>>>>>
>>>>>>> Do you see we need to gate all this with CONFIG_HAS_VPCI_GUEST_SUPP=
ORT
>>>>>>> as this renders in somewhat dead code for x86 for now? I do think t=
his still
>>>>>>> needs to be in the common code though.
>>>>>> I agree it wants to live in common code, but I'd still like the code=
 to
>>>>>> not bloat x86 binaries. Hence yes, I think there want to be
>>>>>> "if ( !IS_ENABLED() )" early bailout paths or, whenever this isn't
>>>>>> possible without breaking the build, respective #ifdef-s.
>>>>> Then it needs to be defined as (xen/drivers/Kconfig):
>>>>>
>>>>> config HAS_VPCI_GUEST_SUPPORT
>>>>>    =C2=A0=C2=A0=C2=A0 # vPCI guest support is only enabled for Arm no=
w
>>>>>    =C2=A0=C2=A0=C2=A0 def_bool y if ARM
>>>>>    =C2=A0=C2=A0=C2=A0 depends on HAS_VPCI
>>>>>
>>>>> Because it needs to be defined as "y" for Arm with vPCI support.
>>>>>
>>>>> Otherwise it breaks the PCI passthrough feature, e.g. it compiles,
>>>>>
>>>>> but the resulting binary behaves wrong.
>>>>>
>>>>> Do you see this as an acceptable solution?
>>>> Like all (or at least the majority) of other HAS_*, it ought to be
>>>> "select"-ed (by arm/Kconfig). Is there a reason this isn't possible?
>>>> (I don't mind the "depends on", as long as it's clear that it exists
>>>> solely to allow kconfig to warn about bogus "select"s.)
>>> There is yet no Kconfig exists (even for Arm) that enables HAS_VPCI,
>>>
>>> thus I can't do that at the moment even if I want to. Yes, this can be =
deferred
>>>
>>> to the later stage when we enable VPCI for Arm, bit this config option =
is still
>>>
>>> considered as "common code" as the functionality being added
>>>
>>> to the common code is just gated with CONFIG_HAS_VPCI_GUEST_SUPPORT.
>>>
>>> With this defined now and not later the code seems to be complete and m=
ore clean
>>>
>>> as it is seen what is this configuration option and how it is enabled a=
nd used in the
>>>
>>> code.
>>>
>>> So, I see no problem if it is defined in this Kconfig and evaluates to =
"n" for x86
>>>
>>> and eventually will be "y" for Arm when it enables HAS_VPCI.
>> I'm afraid I don't view this as a reply reflecting that you have
>> understood what I'm asking for. The primary request is for there to
>> not be "def_bool y" but just "bool" accompanied by a "select" in
>> Arm's Kconfig. If HAS_VPCI doesn't exist as an option yet, simply
>> omit the (questionable) "depends on".
> I understood that, but was trying to make sure we don't miss
> this option while enabling vPCI on Arm, but ok, I'll have the following:
> config HAS_VPCI
>  =C2=A0=C2=A0=C2=A0 bool
>=20
> config HAS_VPCI_GUEST_SUPPORT
>  =C2=A0=C2=A0=C2=A0 bool
>  =C2=A0=C2=A0=C2=A0 depends on HAS_VPCI
> and select it for Arm xen/arch/arm/Kconfig

Btw you could also have

config HAS_VPCI
     bool

config HAS_VPCI_GUEST_SUPPORT
     bool
     select HAS_VPCI

which would require arm/Kconfig to only select the latter, while
x86/Kconfig would only select the former.

>> PS: The more replies I get from you, the more annoying I find the
>> insertion of blank lines between every two lines of text. Blank
>> lines are usually used to separate paragraphs. If it is your mail
>> program which inserts these, can you please try to do something
>> about this? Thanks.
>>
> I first thought that this is how Thunderbird started showing
> my replies and was also curious about the distance between the lines
> which seemed to be as double-line, but I couldn't delete or edit
> those. I thought this is only visible to me...
> It came out that this was because of some Thunderbird settings which
> made my replies with those double-liners. Hope it is fixed now.

Indeed, thanks - I did not remove any blank lines from context above.

Jan


