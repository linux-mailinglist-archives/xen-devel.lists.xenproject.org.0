Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80FA4920B4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 08:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258377.444874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9jMk-0008MQ-Rt; Tue, 18 Jan 2022 07:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258377.444874; Tue, 18 Jan 2022 07:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9jMk-0008Ka-Ol; Tue, 18 Jan 2022 07:57:18 +0000
Received: by outflank-mailman (input) for mailman id 258377;
 Tue, 18 Jan 2022 07:57:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9jMi-0008KU-OQ
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 07:57:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f79ee6b-7834-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 08:57:14 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-MZAkpkg_M_GltIV2JW7djA-1; Tue, 18 Jan 2022 08:57:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.13; Tue, 18 Jan
 2022 07:57:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 07:57:10 +0000
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
X-Inumbo-ID: 3f79ee6b-7834-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642492634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NsErlAkpuYlNAZok3ODQP+FNUM8+lKcGyfyK4sa2Udg=;
	b=eApHuvLq4Qs2PIkBOa2ejTgz78T7uMdxrU6LIxmMDFcaXTbItTmx2OSGKSHPN8Mhy+QHHq
	76+No/rqdqO0r1oVwWt91Uk9F1LWn6FV8sziT4DcESrodztqaiqUFD4690j/8BWMFd7nkZ
	eG8SyXbupve6M27IY8LsEIemKcqus4I=
X-MC-Unique: MZAkpkg_M_GltIV2JW7djA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTuCB9HRAnJXlUEDsY0DG0h2zbLV45O/dvth1W3UXLFo4ggBmReBwrg0RxmBa5/zYE5HOPUDUL59qjN7Tgzf3iesx7mTmQsrAzEl7nw9KM9J1t9BLT3EAcKnLjeehhH1CqHAX/OiUUC2lVyU1fiEWMER2OMG+GYRBebgl040wIc8bH3PXdjYgUJXCCbRIXsysVxOJVDCTFmI73eGdyXSa+5DJAcuSehFBO/uYGoCtFKkAKSfmEa8za4oqYrfwMha8HhtbDo8gf1Rl9pMX/VgiXjIUlsZvEpMNw0xpJ0tP1NMJkM7qoHDCBlV8P7ugWu0jDCzTrgUwFKWWDWEvucc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIs5Oyn/us1ATLGHw0TuZHph47YdgDQJxfIkbWG/fFY=;
 b=YE1X1VyadONk1lYnjYlhuDhUMCWQGCguijMy+unKltFJlSVxr0WGzVkwltWlQMG6qP9ep4bmWjkwBbe+yn+KPoZNSGFF35JQnaFPLbEij9+O6eAdsjWKlUez0otzC0fVJPfXnDhdCdsQdBBScictpwVGeWWFlJADAMdoMAFxwkVhhVDaljknkx6dikeK8KXYGXxamA8Dubi98KgEIHpqyrSMMIGN5myxVQWYEU5z81xSt1Jx4e/IiNlPLkraSsTnjlCTcu5M14yJs5NGwADrX4bwbOPxvS/iM0aYhbs+KodhIBedGxYxpC3DtGQUjmTNUW/i7gOpqY1mCbDmIJ6w8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69b41772-6dde-38fa-f17c-367deef58888@suse.com>
Date: Tue, 18 Jan 2022 08:57:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-4-andrew.cooper3@citrix.com>
 <5f2c932b-8e30-b636-76f9-d4b27a9f477b@suse.com>
 <cf0b4480-ac1d-ce21-4829-9e02a01590f2@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cf0b4480-ac1d-ce21-4829-9e02a01590f2@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0083.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5e5db48-b995-43d9-e629-08d9da58217d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB44450FB53C67BBA5DDCB1AFCB3589@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xGZeDWS24wfYzf+TPfi+lNNGKvQpmh0w478RR2LEGPXNE4ViZ47+nCNEm2A7KzH/JnspMpdcL3j2oxU1y+iBy7JnLrQoj9/o9k5/KpBX0WQmTsQBdE9NHc1Wrv37tHYmypqMknmvP7rEIYCjuARXTe3zBR0XYnfqXPOdemjA0ZdQD/0a10uclohD9AQf+CYZkzztu31DZXp8/x6E8G3uFo2vVyl4YMrklyAQsom35R4EIyCgEzI0OTa1+FQKJ9AFfbPClJQkHLwP1Mo43DFCnNW7UB4fkvRwq9+5QSozh/QgUeqDePQbCGLVxft9copkcWNP/PxP9dXasgL/w/Jeb0GbMiJBsfC76QbfC2YnAMhRWZkXTscIu1YJkXoLix7IwSZRvCOVN2oEOUcgrOWWHJK3U5gO8+ovDGFu2HjYAlJTxvJAiYJEeLqns32aRV6bm3JjP3rlzMy4CkyYwEp+QJbRyU0uJTb7M6ndgd9eW24RpxEhbzQoxlD0T9+ciQcJsv2pCWi20nDNyXcA4LSzhJxLvdqGtPnk1swOosgxjsBDh28LrYDXIgv3CL3zQrYK0S/BLDzVHzQOwaivaDMNpUlu4JltEIwDY5xxwkhqw3mwizfmvLwNabxbH7IZlzo811Egfz0OfT1RgTOgx/2grc0YKNd2E7/ZZN2x59yQGCTfWNaqkmdge+BnMlOylobwMsSdOq6o4wl+tkYeadxrGk6z/oYKHV2MOYj/cecvrHE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(66556008)(6512007)(5660300002)(66476007)(31686004)(110136005)(4326008)(36756003)(8676002)(6506007)(26005)(66946007)(186003)(53546011)(2906002)(8936002)(83380400001)(31696002)(6486002)(54906003)(316002)(86362001)(38100700002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1yqPlXNoSDrs6mv51LLAzg3vjbBb6i5/psvldkE7VX0P3TjegUA4PfvPCpUR?=
 =?us-ascii?Q?oY5fbdfZ0TRr6dJn6VvbtlfjikSghAwiRfyQdtjPsBgXW5aOIEcAvzS039Hm?=
 =?us-ascii?Q?Rk3k81m5wAcjn44PIH6Ps27DDxwNY17oEa7I5TYWoVnzFUJ5xWgkDlh8iaJ4?=
 =?us-ascii?Q?fZHz/ewEE9EZ9z0gR/xKziI6bkX9myEk+kUVE2NiTJbW94tC/aT6SWP6wuky?=
 =?us-ascii?Q?N7ndniuSSohxBp0VfoyDFzR6mskDpdvGCvMqcvVVD0nzlFxQoX+M7AEvhNqv?=
 =?us-ascii?Q?pH4A4MoLRjHt+z/GC+zzFhwhDsStv4CVwu8NZBuEewzGef18l3z/C9x/WPYG?=
 =?us-ascii?Q?8DC/kl1dG8vzHlSXH5vZR/dCDwzqzDxcuNfhw5+xtpsr/OngZrUQ7X9k6Cqx?=
 =?us-ascii?Q?9Fo93AYQWqzhwSlgF0Fz0xC5dboaa6A/jyajxIB6qhNSjg0LVE/BC014o36m?=
 =?us-ascii?Q?lrV8OERvdJkNBk6+WcoZOszw29Kx+ZIvTQyH8xAZOqnF93MXePYWnOj550Tw?=
 =?us-ascii?Q?P6KPmtM+QsUlUwJPW2Nkb+kBwEuxDzmGNw/uAF/9y62LEhIVCC8cmdyAiwK0?=
 =?us-ascii?Q?kl4Sm+XSE8GT3Xankx9jYhsV9LMpxwgs0rf7EMLtdjuJLRbNbVM9SadjVzr3?=
 =?us-ascii?Q?vp85ZhzLBWqTv1tIweAoguHtXkILBUWHWvxPMf4UGP/oKPQuA+KIS/OTd2gY?=
 =?us-ascii?Q?nkzBwFlCGeime2B0MxoY8DkxJJeQ9+Klwa/d0xIgfi6B+4/aviB1Joa0GIzj?=
 =?us-ascii?Q?RG5V7wXuKhg4BZQVszPtW5PRbEto1Wfdx67moNYhhoMQvXqYyNdgay75ti2l?=
 =?us-ascii?Q?riaw9VNg1Vfk/OXsPCTrsOVVZTxg8ndrPQCkwSUJBZh++sCUb/FJuMPlMkdf?=
 =?us-ascii?Q?dOXNqGW02REsxUaiij4MIR88NpTvUkMbWJqD1WyH0JBmzOq8LsVMjJinXecf?=
 =?us-ascii?Q?C2rslOGU6yyUiPVMCxJX0W6N3jIDYr9d+0nTpQndVR0XSln9F+Mdxwel3Wh9?=
 =?us-ascii?Q?bwGxLnUUUsWx6ynBn5/Ns2B7pG+z6o/iGSnu89i+jrcsLHTUNzdZzudII/xU?=
 =?us-ascii?Q?ehAzg/bRfJbR4hxaG9oVopg4vQVq+oLbyy13ZnvUXvB/AN3nqm3PhXw/lTzE?=
 =?us-ascii?Q?FgkutnsgASweoy0ZPQp2WNDtq/yU6andgyFiKurJSsZs+jNDYiaf00z8wo8h?=
 =?us-ascii?Q?q+a57ohcydnkkkSeFFdO73ahf8c8ja+hLjI/UBoH3B3DEUPvLaACCKFBj+Yq?=
 =?us-ascii?Q?du2N4fWW72i+kYSqyEcubZ68DOgy2RUmw4lU8XXcrLEVGJWu9Y6jAlm0gfwU?=
 =?us-ascii?Q?uTOyGIuLrp2e1yoW2oS9101DmV+I4VvSvDRELnfGMnAMo24I6hM8D+HidzO0?=
 =?us-ascii?Q?g9MyDuFI6DdBIIR+CLAbrjxnmyryWqXObGqw3An9bUc6j2+xaAMn2tVJuqQy?=
 =?us-ascii?Q?NfPNocsfASJfVddyTOiFNWZKnROKGwXsty9e4Rn3SY8YXf9zgUFYl1iIKwfP?=
 =?us-ascii?Q?/053pz6C5rxkBfoqD5ZVD177uSHXptwEo7i+7ufPRxwOIWQ6wP1CCcwx7qFL?=
 =?us-ascii?Q?WYMbaOWqSC4EqLDkwz8UzpgiZqBTtor9ZG6e1cihT7v44TAAQhoKlVT2AA/U?=
 =?us-ascii?Q?lMVia33T/CeObk8rgIcnXhk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e5db48-b995-43d9-e629-08d9da58217d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 07:57:10.6470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxUFGHwVDxbadyyqaD7768Evydrz9PCjnZx7ZhdHz5d8gDDeTlR7WeFLs3Ceo3qgAiyetEAl8yaNZu+MKEUYBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

On 17.01.2022 18:23, Andrew Cooper wrote:
> On 17/01/2022 11:51, Jan Beulich wrote:
>> On 13.01.2022 17:38, Andrew Cooper wrote:
>>> @@ -119,12 +125,11 @@ UNLIKELY_END(realmode)
>>>          SAVE_ALL
>>> =20
>>>          /*
>>> -         * PV variant needed here as no guest code has executed (so
>>> -         * MSR_SPEC_CTRL can't have changed value), and NMIs/MCEs are =
liable
>>> -         * to hit (in which case the HVM variant might corrupt things)=
.
>>> +         * SPEC_CTRL_ENTRY notes
>>> +         *
>>> +         * If we end up here, no guest code has executed.  We still ha=
ve Xen's
>>> +         * choice of MSR_SPEC_CTRL in context, and the RSB is safe.
>>>           */
>>> -        SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=3Dregs/cpuinfo Clob: acd =
*/
>>> -        /* WARNING! `ret`, `call *`, `jmp *` not safe before this poin=
t. */
>> Is "no guest code has executed" actually enough here? If VM entry failed
>> due to a later MSR-load-list entry, SPEC_CTRL could have changed value
>> already, couldn't it?
>=20
> No, it can't.
>=20
> See the very start of SDM Chapter 25 "VMEntries" for the distinction
> between early and late entry failures.=C2=A0 (i.e. those which cause
> execution to continue beyond VMLAUNCH/VMRESUME, and those which cause
> execution to continue from the vmexit handler.)
>=20
> Early failures are conditions such as `pop %ss; vmlaunch`, and bad host
> state in the VMCS.
>=20
> Everything pertaining to guest state is late failure, so by the time we
> get to processing the MSR load/save list, we're definitely not taking
> this path.

I see. This still means that the answer to my 1st question is "yes". In
which case I'd like to ask to extend the comment to include "no MSRs
have been loaded from the load list" or something equivalent, despite
realizing that such an amendment would have helped already before your
change.

Jan


