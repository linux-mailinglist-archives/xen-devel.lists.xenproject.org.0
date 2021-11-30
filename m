Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2714636BC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 15:32:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235170.408024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4BB-0000QA-Bj; Tue, 30 Nov 2021 14:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235170.408024; Tue, 30 Nov 2021 14:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4BB-0000NZ-7d; Tue, 30 Nov 2021 14:32:21 +0000
Received: by outflank-mailman (input) for mailman id 235170;
 Tue, 30 Nov 2021 14:32:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms4BA-0000NT-LB
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 14:32:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52b44532-51ea-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 15:32:19 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-pJ2Q0jgfPmWouT3p0Z29ZA-1; Tue, 30 Nov 2021 15:32:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3536.eurprd04.prod.outlook.com (2603:10a6:803:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 14:32:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 14:32:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0050.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Tue, 30 Nov 2021 14:32:13 +0000
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
X-Inumbo-ID: 52b44532-51ea-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638282739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Eh1hyrdDMjaLgpfpzMMQiQVSTk20RvNhR2YLQhhyZ4=;
	b=D/5XzMoDuMrlw3Azh1J+VUM5E4V7z/FTauHFOV+g0yR1nc2dZDMbTUemtaVHl3rI2RKk/5
	uOHTbo3+uz/r8HHALm4yU8vn0hF3mPpL6Evx2iTbhrbgJPtq7crO8t1BGcgbMyUqbK8mQ/
	FSHLWMdjwgClBFADO7yP0Xjx7fmqxss=
X-MC-Unique: pJ2Q0jgfPmWouT3p0Z29ZA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJAgj44so7XVDOfzkjjKsI2aJpz+ZrTjUQg++dgcTT6JAmvgBmh3Q1xSqbEsdE2ZJKHSV8qUJbjI3SFaeO3u/2nblfbScSXexwm3RN9lvY6W+DXb5/ldkKwgC4uZG7kqz7u4SLKc6blYsKkBiwABMK/uPLLrQqVIrB0mz+OScLH/5mnsy+djjB5nFFOZNcj07XJDUoLG0lBOOzeuxlvyj/wIWpra63BqaZRFWqAYbdI/Hie3DjdScZXy1AGw8Ntsk0pGS1JPh9bM+bEz3azq9Dy2OZlaEfvFVLJQ6W1LmEms0VLFlq7SndrdZk665X6nlcS3zQvzLlwZyiwVzTemOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GwfV8SGRNg330Ub69KlfEGgjMgge+Hn3k/kjrimdK8=;
 b=J3eoz7Dfo1AE8a1PaJ7ezGXXnyrqnxQFgFKUDZI1WCQVwqqa8i3w119BpREqQibneM8b8dzwPMj3uK8zWd+YHbkP5EwYMrAke+fl2NKz9yhwWZ8/U/Efbq9Dk8rutCtSYcI87WS3gfkOEroWm8OAkbshY9+xdH7nc6Zm42Re6FF2V4b1LzHGcUD1xFO0NTnYzOxxPP6lo8rMRJyDaKEN+cKaAkempBLqDAWP7DYBIMae4mt5gDgfCeOkQDne0UzrwB3WcO6W43g+2sBHRq7sRgCo2UJOJAEYlj3Ch0QV1mJZ3g1sQlNqCuPPDy3m2f8sxAhYTbr+EGabeOMhUWH0cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f651c62e-65ee-1d82-843b-0c453c38f7b5@suse.com>
Date: Tue, 30 Nov 2021 15:32:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/HVM: convert most remaining hvm_funcs hook
 invocations to alt-call
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9fd8ba19-9744-fa50-1afb-15fae8955cac@suse.com>
 <17b42cc5-1979-f977-7c2e-a59fc97f87ea@srcf.net>
 <30b2711a-de67-ca15-e8a8-a4c8b962e620@suse.com>
 <34c9551c-4e60-8472-15ce-fa14076cf393@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <34c9551c-4e60-8472-15ce-fa14076cf393@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0050.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7b11619-cbe2-4923-418d-08d9b40e33fc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3536:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB353610EEDB7BBD6580366BDBB3679@VI1PR0402MB3536.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uJvLdadteOBYpaEGrIJ09rxiZIktPWjK/ZP1OgIYNOsrYWzjFWjwFIrY+xt3l3YN9x+4sPPSJ+pGRV8QA/qZ7VgmweD9UvsV9XaKG041f0lsJF0NQg3Dk2es55dr4VN/YrtPgQIBGOF1b4wwB58Lq81clFR6KY/QSpqzrK3LMn9YkZYKQSZ4genC5IDoDaHGuTfIQrGr1Qqk2oE84aVSZE1wqq1teevoqNfcHlVwVilnj64dKZ38l+E8P59LgZSDuuNSKkxhE1uY7bskoUTg4YYP/9OGmggQXqFVan3ai/CywZt+dt2+TaeYg9Wfxy9KzQVF87B4LT1ZNiG8usUSNj2fbYf76HTID0Gp8n5iQyT6XbUk1KRP63fzwam3HMOnd9LRe7HvG2aeyETrFvdce40G7VPFDtITDa4kRsHypCAj3IjV/DMVORWJM0Fb2GsOws/mGQAVwX9Ndrn/4aMgIhT/6wbLKbP3IqgSKKFz2H3fI8+5+P8zZpHTb52rxJJakOl2RYB3sHdKl1W1ic8DvzHxvm+FCu7JZUv7Nrpik/J9szWq+eXBeFfndCQSXlbTVYWLWATfZF2wD0uFWTVLIGe67mjEvSyxKPIUe4tKh/efa1n0wCYJ3n9FihMVDeCLZ1UeVWcPRCvN68u7X73Pt1cggYKTOVP1PrjREDeg9Uz4rRFvTavBZFwLItF33HwjgA74K1hJoA4c0ScWb/4djrbW1TYUC90YF67okP5ku5gn50szQX4pe15vrG8akMPQsK9l1GCXaM/BqZ/gULZ2t4toXD0yQfozd1eXgMNbF3Cu3npYqxpaF/RMWtmYEmPT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(86362001)(5660300002)(66556008)(26005)(2616005)(38100700002)(36756003)(66946007)(966005)(31686004)(186003)(66476007)(6486002)(316002)(956004)(8936002)(8676002)(53546011)(4326008)(6916009)(2906002)(16576012)(54906003)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mOMxAaLD6wdAn0Y7KrjUnh9GsXyMrknhfb072mhZRQ4fbeXDbWzrDKDZXySc?=
 =?us-ascii?Q?gHpVLCZu6E/sbNqcnHa89I+V7yuCtwVYR7Pah78dwyz3+tRZMDYQvBrp3kZU?=
 =?us-ascii?Q?ijFc9H6IIu0mG1YwJaWfZd8sfKz89abrU7HWSQMcRjjWw/N7GBArmm+6fe8h?=
 =?us-ascii?Q?tC6qk8TfvvlBWZ2n1XMDLDFwpw8uK/tf7vBRHYZkJ9dJOKC+IgycUnSZzlfN?=
 =?us-ascii?Q?dsPeK6x24k8eIF7F+4p4heSVeFc1Ra4oFrRx4s59D309cl1edKIl0dp6ERHs?=
 =?us-ascii?Q?TcSyh+xFi98DCozGfL4YyRF7O5wPgE0De7xlDB6UMN1xLN8AHbyyTRiDXlka?=
 =?us-ascii?Q?fWeECFqlXBY2yf5y7JABZhL3n/rRWlsrQT4hA5TpmZKaKleLHBOBKqth8NIs?=
 =?us-ascii?Q?+Bgu+6yuf6a7kHAdK8tijfYw+BiDp4ApHkKpCx6JfVR3rhz51v0hTRR8L+ax?=
 =?us-ascii?Q?BoW9gUS65tHo6r+eV6T0gnN6P7rVkl3M4CZtsOJKzN828hB0dNUsQMDgozn+?=
 =?us-ascii?Q?0/Ef4Nr+uNOoQez6Nkq3k1k2uFNcEIjx9RSsnnaHU+3hXrTbHpBP53RhlBp8?=
 =?us-ascii?Q?8nHgNp5IF9DiLw91fHExWDHwNJc0IVmNjJPcO1c7TETfyNs8qYyThuyxrZhK?=
 =?us-ascii?Q?kWJsZBhprOTu8GksqXrDGpKxkIysfmz1x/VOcX1BA9TZJbstsH4q7Fktt4D7?=
 =?us-ascii?Q?YHJcDeotWu/uofHIuUIGJ2bPfoTywV5e8fT6JgeMvuQXcyXw5RPYIZyxUNrd?=
 =?us-ascii?Q?/ZzjV15LdNG/4AK95SwXcmtgGq5L8sv6i5y9BFpZbSW3Dbwd2uKIZ4dl867w?=
 =?us-ascii?Q?ync0QKDwrjlvrQiBOsdgZUAdD92jfVkVPIPorzJxH2szkrXBSwWomRprAhVb?=
 =?us-ascii?Q?AdFFljZ7U+dApeuJ1WZqDYur7OT5LqbW0QYTHDJqplZd1EmYU0J0dEFovbRb?=
 =?us-ascii?Q?ctEeDk96/uXR0XJiyJRHFWfzWx1Ni/j0Sfgp+Sj15ntUB8pMBhtdVu4Cih1/?=
 =?us-ascii?Q?VgWx1/c5UxNahvXAfEG+JpPsgH4tXIiVD7Zy+tl6qPW2vtii7aHj7DK0aeC4?=
 =?us-ascii?Q?vyhfXYK0nNXpG4tAz9s4acm4n9n3nt6ZYzKi3Q+HzfqGhvMLNTNnmoB+h6HY?=
 =?us-ascii?Q?iGgjKz3uAt3ow222k+LANMfzKQkKR3vqioA+GasxwlMD903uy/Wzf6JN8C4l?=
 =?us-ascii?Q?C6STQQ9vtiGUMrLbirNDTd7G0Hh5FBUDsBFQrD/eM8tMtAuGQhOlZxj0TjK6?=
 =?us-ascii?Q?jLpjAgvSc+L0Vpd0ZZByoDfFkb8+wFg+dj2vWJ//GWkrKrrAHXxVPbSb3X27?=
 =?us-ascii?Q?LRaGD4DR3l3jZAXSb1ugTvMDYt0pRcxjfMMfKoQQNnhdziSO0Ge7I7+06yJn?=
 =?us-ascii?Q?uGn0oEAVQGC6TLF4aYIM8upJpRFml6/Ki2XUWQ/WkWc+M/7POmvHEmgpkSEP?=
 =?us-ascii?Q?2aUeRz1BVyCSfY9Ms+8mbBT5v2ylP2NcWoFBIN+PJf69Irpgf6ZMBc4AClvY?=
 =?us-ascii?Q?REtnJRthV5Z0DZ2pwo2i++qYScQy8/KzILQSE5hySq0YNONBErW43yo6I1jV?=
 =?us-ascii?Q?8p1KQqnW7RoXXu/9gXD599L4Slkb+GBh/ktZq76eoxJ73Stqs/DQpxGoY6SG?=
 =?us-ascii?Q?QvvTrtXb7XgVeyJ7NUFarTc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b11619-cbe2-4923-418d-08d9b40e33fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 14:32:14.5826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TC7oSJU4+ohYyvBSAthSRhrF0rvi0X0De3Mzi+0IPbDu5weTzQutReqM2rEZhnWeMZ8y6XwH6MlN1PXSC7ipdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3536

On 30.11.2021 15:25, Andrew Cooper wrote:
> On 30/11/2021 14:03, Jan Beulich wrote:
>> On 30.11.2021 14:48, Andrew Cooper wrote:
>>> On 29/11/2021 09:04, Jan Beulich wrote:
>>>> The aim being to have as few indirect calls as possible (see [1]),
>>>> whereas during initial conversion performance was the main aspect and
>>>> hence rarely used hooks didn't get converted. Apparently one use of
>>>> get_interrupt_shadow() was missed at the time.
>>>>
>>>> While I've intentionally left alone the cpu_{up,down}() etc hooks for
>>>> not being guest reachable, the nhvm_hap_walk_L1_p2m() one can't
>>>> currently be converted as the framework supports only up to 6 argument=
s.
>>>> Down the road the three booleans perhaps want folding into a single
>>>> parameter/argument.
>>> To use __initdata_cf_clobber, all hooks need to use altcall().
>> Right, but that's not going to be sufficient: The data members then also
>> need to move elsewhere, aiui.
>=20
> Nope.=C2=A0 It is safe for data members to stay.

But then it can't be in .init.data, can it?

>>> There is also an open question on how to cope with things such as the
>>> TSC scaling hooks, which are only conditionally set in {vmx,svm}_hvm_fu=
ncs.
>> Why's that an open question? The requirement is that the pointers be
>> set before the 2nd pass of alternatives patching (it's really just
>> one: setup()). That's already the case, or else the hook couldn't be
>> invoked via altcall. And that's also not the only hook getting set
>> dynamically.
>=20
> This was in reference to cf_clobber, not altcall().
>=20
> If the conditional hooks aren't added into {vmx,svm}_hvm_funcs, then the
> clobbering loop can't find them.

Oh, I see. Which simple means the clobbering loop shouldn't run
meaningfully earlier than the 2nd pass of patching.

>>> =C2=A0 However...
>>>
>>>> [1] https://lists.xen.org/archives/html/xen-devel/2021-11/msg01822.htm=
l
>>>> ---
>>>> Another candidate for dropping the conditional would be
>>>> .enable_msr_interception(), but this would then want the wrapper to al=
so
>>>> return void (hence perhaps better done separately).
>>> I think that's a side effect of Intel support being added first, and
>>> then an incomplete attempt to add AMD support.
>>>
>>> Seeing as support isn't disappearing, I'd be in favour of reducing it t=
o
>>> void.=C2=A0 The sole caller already doesn't check the return value.
>>>
>>>
>>> If I do a prep series sorting out nhvm_hap_walk_L1_p2m() and
>>> enable_msr_interception(), would you be happy rebasing this patch and
>>> adjusting every caller, including cpu_up/down() ?
>> Sure. I don't think cleaning up enable_msr_interception() is a prereq
>> though. The potential for doing so was merely an observation while
>> going through the hook uses.
>=20
> Yeah, I suppose that one can be a followup.
>=20
>> With it not being sufficient to convert the remaining hook invocations
>> and with the patch already being quite large, I wonder though whether
>> it wouldn't make sense to make further conversions the subject of a
>> fresh patch. I could commit this one then with your R-b (and further
>> acks, once they have trickled in) once the tree is fully open again.
>=20
> Honestly, this is legitimately "tree-wide".=C2=A0 While the patch is alre=
ady
> large, 3 extra hooks (on top of a fix for nhvm_hap_walk_L1_p2m()) is
> mechanical, and probably easier than two patches.

Okay, I'll wait for your change then and re-base on top.

Jan


