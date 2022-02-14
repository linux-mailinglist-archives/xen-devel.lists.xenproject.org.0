Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6FF4B55DF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 17:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272515.467393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJe1Z-0001ZO-ME; Mon, 14 Feb 2022 16:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272515.467393; Mon, 14 Feb 2022 16:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJe1Z-0001X4-J2; Mon, 14 Feb 2022 16:16:25 +0000
Received: by outflank-mailman (input) for mailman id 272515;
 Mon, 14 Feb 2022 16:16:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJe1X-0001Ww-MC
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 16:16:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72fdf581-8db1-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 17:16:22 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-WqMDYmapNruKcnVUGsD8Ew-1; Mon, 14 Feb 2022 17:16:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3024.eurprd04.prod.outlook.com (2603:10a6:802:d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 16:16:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 16:16:19 +0000
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
X-Inumbo-ID: 72fdf581-8db1-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644855381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xszT0i6/P2FB+LJwvdUspE1ZMOlAsz+hUdCvxvLt+E4=;
	b=abpBsh6YST9Sn3O+JHaNiyegb1z0rAgDtVQhszlGua74eewGeiL0wor1N29zYvYZ+11Uwq
	PoQqLUeanxEE2jfOKHK7UMRGKllEkicyM4QTMGe+upbwfUeZMdAKvgMppbh2Q8XVkNeRYZ
	dCYjs35KW4e+W7wd50x9TDNePMwY/lI=
X-MC-Unique: WqMDYmapNruKcnVUGsD8Ew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huvZy9v7JSIxPNnaq1b01CGzZjaiMxu8G1+B+LkrsCdW0rA6wqJBokrNLNz8oIkhbed8ereJimIs+htPyMjW2ija1PEvgFhOrziJ+ladwee9GPQaY05eB3LGJBqCAtEkgfO6hvbE+Q7d38cqwUOW23bG5ww2mrgijZsU0QlGVne7gBaRBZuh5bYh/lwEWBBaMOG0qpk6+N8qI4w9a49ONcXa7QoFwKGywIu5rDgyWv3/zAQACwJiIFDyv5pD90M187YP8xY/s5QiAOkMkCe7O/aH7mcU8Kmy8iDWQuolbHLJgBOA2GQ6MRH9RPf7O7xRrSu9HGJWWDzxBjPAxZrgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvZ1Hsbafmn8mdBKKTMNfbLt7J6kHZgqQ5YFa+tjGqs=;
 b=QpwhI+xPmzZn9rGkKBbmKeSsS8qSvSFOTmZUJc3wzB9Bc7+76NcccTr9pZwx+iouCcm20AMV3aeHiNTcNZ3K6X6G4ue8XvNfEJ32JhHCNXxhJRvQT7DpVG2iutO4mj1gSLwtyrwX5osfPEt2hjQHaNN7xUjZNNuIll1vpeGJMEXubI1hpUZ+NHLmikteyUsnWgu5se8oEv0f/ImA55AX78aIPA1MiGqknjDP004Qkkqzv9TcNfhRObh0ZXUt9rSEpVSJzc3w+LPBXB5La7JqKNRlgC17gpzc60P5ofDVTj6X3y5fnnhXp3kfUCGVYwtL3eJOMV7XkO3z4/RV3IsSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a50ad1c-7366-46d3-7cd3-f1d88ac31b89@suse.com>
Date: Mon, 14 Feb 2022 17:16:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 3/7] x86/altcall: Optimise away endbr64 instruction
 where possible
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-4-andrew.cooper3@citrix.com>
 <5d53c6f9-8d1a-3d48-6ea6-14a484d578a0@suse.com>
 <cc4cf340-f02f-a547-08a0-1261bb506bcf@citrix.com>
 <adbd9ee8-46c5-9696-c3eb-3e18b2d60684@suse.com>
 <c053423d-e06f-b349-34bc-9509dc44bcd7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c053423d-e06f-b349-34bc-9509dc44bcd7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0318.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c63022f-9255-4f9a-8af4-08d9efd55577
X-MS-TrafficTypeDiagnostic: VI1PR04MB3024:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3024E90B261AAF79CDD4B442B3339@VI1PR04MB3024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7hXM3pIcLCQsHB75BLohA7kNda2hBvJFCM6xQntAcFgxK3Gn9YusKL82aWSA9L7W1RnkJImq1GZ30TaejGMg39BDgg+X5XgOqjohuxdHzEy0hnJjpIiP1qKfiJkxKfABVnSJc4i42UKo0OorzEyIJeT70HCzbZ8ojbbE/rpPsxrr12cRvRuK3W+0k2GivLtDzej6Nn5J32D3Wx82I/Gq45n8z+9JU6qW0oVEJ2Z5iwYXtbFKpDXgI/1lL1JeRiMenKO6VgrJP+PXXj46405hdoH0sChsFlAAM+OyXM48Duvh+/k6WT4OMMtTHJt7QM/FQmD0YxJd6wmGsA+3iWcjK9SMzKSdnxKHv4m1NEkHJ+GmYuyFzxV+7DXhm7re83x1SwYuNu81MXZN16SKOwLVsvkjikqRIg1VB645VaBQ/9fDUGKlBaxHtD9tM+5uNvpXDY4BT9e7WzvFcbOPhdAMv0SCpifTO+Q7wz+ghmfvQPCEf873Nz7nqqI1oEwk+m93uymqKS1qRtcFM1IyVdU1ay/bHpzUhOHDBzkzX56BzEYzJRkCMzl4Nh9I2BEm8V9hxu+krvUelrD2Mebdu7A3Cq7hjpN9aZ57jzmLCz6Jsx6RlaQDqIQ42sCeGP8Z4UbLw9nU/ZL+8jhC8gUcxUYy6AvtP3xR+jMOFZmIOfcvAsXTAGu6/CjbQORPmQYkKJxjZnls3tBxet/BBg82zgjhxvhyQZi39bPr8vFCieHKrmY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(2906002)(6916009)(316002)(54906003)(38100700002)(8676002)(4326008)(66476007)(66946007)(66556008)(5660300002)(508600001)(6486002)(86362001)(6512007)(8936002)(31696002)(2616005)(31686004)(83380400001)(36756003)(26005)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MbcNliTgYaZkUIH0fplZkp6UsfuB6sfIlIEetsM5ABgoje9fnjW5nLiF6LgB?=
 =?us-ascii?Q?V5X0C+V8uljpBguoserIUit6z6TXnHeEfPP5ipZaKUoMPEVYedfR3Ibvzu7c?=
 =?us-ascii?Q?kO8iUYSeWUwJevsv1F7RqOs7v6Sui/k5uM90ihPUbe0WRkC1Glqle9kui+SV?=
 =?us-ascii?Q?kvhVRlv4X3Vpxe6erzE7SEryDKvcjdsBg35BjmBy7o3PGACshos88TgOfWvf?=
 =?us-ascii?Q?m+xcPn2FrHITVjuUy4az4626/LmAxQjoArRQjRSSoV+82eICANbyW50I5+qA?=
 =?us-ascii?Q?WGmwXDc9xcJg5Y8kCVRMHJ2iw2qaLy2Cr9bG2UxAvh7M2P3ymE1OAcrPMTDO?=
 =?us-ascii?Q?5r9kLhEijkg6qvpwQPLIqCFCXJ4yPONV0Mx+QuZEbp9XtsUgnMESBGvmpruk?=
 =?us-ascii?Q?hsmNk57QeC4yS1s2fnKcj5JgPyDH8jjFg0wZLBLwiM03IJ7tjD8PubbTMVUd?=
 =?us-ascii?Q?ioyBdogcAGWZVolm8OBxv6O6NERWtFSxjVLodAp6HgcUolqfIJZv2Atscyhy?=
 =?us-ascii?Q?3T/1QGWyiVWPRroUf/veKsGgxr6Ra1Mm9q6yaSu71iAJNCrA2+WILx/xFYlN?=
 =?us-ascii?Q?e1mqB3lwBruKVbEqBQWNLD7Dl/0z1RFbkgNbV9XcQFEtd64aJ9UWMbglJBme?=
 =?us-ascii?Q?U3gwXM1LkxGKIggEG+KL2hFq3taZVJ+7gh5taIY0BPAKvyH4HlAFhlU/U8Dq?=
 =?us-ascii?Q?ReyPDR46JxXEI5VZgdssz96XUP3KusAGU6fLyAoXap+SK8yTA5a1OiR85XYt?=
 =?us-ascii?Q?3EjwQUVoaiUoGhimZIqLCVHFTQE6RItiQeu6gAZFn1T1sgcXGrBewCGxzZZ3?=
 =?us-ascii?Q?e8amKk6EbzlhMhQMboEp0X6OVpraR1Rgbktz29TwZmmJ7pW/tE15WzZ9FXRg?=
 =?us-ascii?Q?DJbjqiBEdUlCQyIo43LT6B9ZMpHnK+zW4NUCMwdpI159E/Ak+WT+9uGu2qY/?=
 =?us-ascii?Q?4ba3J1q3eFHIf8yLoJRYSywS6oaBlibOIrajEklo5xe5iLGpvGADrm2TnDIa?=
 =?us-ascii?Q?sKWaJcUoUTvMW2X5ow78ewjn2sTniboPEsVTkV9WFI5i2Nz3SLijdVNfXeht?=
 =?us-ascii?Q?9GfwnZG3dA46CElzuWobBqbRBbZRYI8RWw5CIk/pYRtJ/6gdoeHVZuIQ4HPw?=
 =?us-ascii?Q?KDDVl1nSrHk/j0es1nALHfIBz3CBo8pGVRl0NFwSo6/nRHHyaVp6mJQslvyr?=
 =?us-ascii?Q?eD00kv9Gsn636jZZLYJuKhipMsk+ykXx8n0TO81vbq0CwlqhoSxoDP72p3my?=
 =?us-ascii?Q?43kA0pf7fbRA3yV5+CZDlRaDnoQQDSZA0GinsKRlIvfek6JslaehtS2B6WsX?=
 =?us-ascii?Q?XuQv1pn5bRe/oszJJVmPXH863NatJDC+I8lr/JOxgPlzKDtFm3Ob5zFwF/2A?=
 =?us-ascii?Q?A8iXgz/9u48ICOb1iYWuzy8BclDkCt/T3CGlN8VDhAuhTBsIvDEYsCNWMosa?=
 =?us-ascii?Q?KSbi9mUpmk2ka6CRviTQ/xj1QoBFMJIP/3IO6upGWtMwukd13f6NxdLyf7MK?=
 =?us-ascii?Q?hlPvukD2peA0YjI+p+qa8qmMzUK2Qu0iXqqNIf0EkaguE+21ukcJLElzI57E?=
 =?us-ascii?Q?l/BTCo0E7MC15BQO/cxModbJRECQdDE6w1h2aOwgsmqsXY5L12mSmUejRjRn?=
 =?us-ascii?Q?EzfjvSe3fqjrLLCevPFvCKE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c63022f-9255-4f9a-8af4-08d9efd55577
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 16:16:19.1855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83TAtqv8eYc2lLDYpNfjPyMGQMCRn2CpAmaaId5UbDlVv54kHyfICJ9AN/iyMgAlTRazLGSqBXf70XeFvGfAhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3024

On 14.02.2022 17:03, Andrew Cooper wrote:
> On 14/02/2022 13:51, Jan Beulich wrote:
>> On 14.02.2022 14:31, Andrew Cooper wrote:
>>> On 14/02/2022 13:06, Jan Beulich wrote:
>>>> On 14.02.2022 13:56, Andrew Cooper wrote:
>>>>> @@ -330,6 +333,41 @@ static void init_or_livepatch _apply_alternative=
s(struct alt_instr *start,
>>>>>          add_nops(buf + a->repl_len, total_len - a->repl_len);
>>>>>          text_poke(orig, buf, total_len);
>>>>>      }
>>>>> +
>>>>> +    /*
>>>>> +     * Clobber endbr64 instructions now that altcall has finished op=
timising
>>>>> +     * all indirect branches to direct ones.
>>>>> +     */
>>>>> +    if ( force && cpu_has_xen_ibt )
>>>>> +    {
>>>>> +        void *const *val;
>>>>> +        unsigned int clobbered =3D 0;
>>>>> +
>>>>> +        /*
>>>>> +         * This is some minor structure (ab)use.  We walk the entire=
 contents
>>>>> +         * of .init.{ro,}data.cf_clobber as if it were an array of p=
ointers.
>>>>> +         *
>>>>> +         * If the pointer points into .text, and at an endbr64 instr=
uction,
>>>>> +         * nop out the endbr64.  This causes the pointer to no longe=
r be a
>>>>> +         * legal indirect branch target under CET-IBT.  This is a
>>>>> +         * defence-in-depth measure, to reduce the options available=
 to an
>>>>> +         * adversary who has managed to hijack a function pointer.
>>>>> +         */
>>>>> +        for ( val =3D __initdata_cf_clobber_start;
>>>>> +              val < __initdata_cf_clobber_end;
>>>>> +              val++ )
>>>>> +        {
>>>>> +            void *ptr =3D *val;
>>>>> +
>>>>> +            if ( !is_kernel_text(ptr) || !is_endbr64(ptr) )
>>>>> +                continue;
>>>>> +
>>>>> +            add_nops(ptr, 4);
>>>> This literal 4 would be nice to have a #define next to where the ENDBR=
64
>>>> encoding has its central place.
>>> We don't have an encoding of ENDBR64 in a central place.
>>>
>>> The best you can probably have is
>>>
>>> #define ENDBR64_LEN 4
>>>
>>> in endbr.h ?
>> Perhaps. That's not in this series nor in staging already, so it's a lit=
tle
>> hard to check. By "central place" I really meant is_enbr64() if that's t=
he
>> only place where the encoding actually appears.
>=20
> endbr.h is the header which contains is_endbr64(), and deliberately does
> not contain the raw encoding.

Well, yes, it's intentionally the inverted encoding, but I thought
you would get the point.

>>>>> --- a/xen/arch/x86/xen.lds.S
>>>>> +++ b/xen/arch/x86/xen.lds.S
>>>>> @@ -221,6 +221,12 @@ SECTIONS
>>>>>         *(.initcall1.init)
>>>>>         __initcall_end =3D .;
>>>>> =20
>>>>> +       . =3D ALIGN(POINTER_ALIGN);
>>>>> +       __initdata_cf_clobber_start =3D .;
>>>>> +       *(.init.data.cf_clobber)
>>>>> +       *(.init.rodata.cf_clobber)
>>>>> +       __initdata_cf_clobber_end =3D .;
>>>>> +
>>>>>         *(.init.data)
>>>>>         *(.init.data.rel)
>>>>>         *(.init.data.rel.*)
>>>> With r/o data ahead and r/w data following, may I suggest to flip the
>>>> order of the two section specifiers you add?
>>> I don't follow.=C2=A0 This is all initdata which is merged together int=
o a
>>> single section.
>>>
>>> The only reason const data is split out in the first place is to appeas=
e
>>> the toolchains, not because it makes a difference.
>> It's marginal, I agree, but it would still seem more clean to me if all
>> (pseudo) r/o init data lived side by side.
>=20
> I still don't understand what you're asking.
>=20
> There is no such thing as actually read-only init data.
>=20
> Wherever the .init.rodata goes in here, it's bounded by .init.data.

Well, looking at the linker script again I notice that while r/o items
like .init.setup and .initcall*.init come first, some further ones
(.init_array etc) come quite late. Personally I'd prefer if all r/o
items sat side by side, no matter that currently we munge them all
into a single section. Then, if we decided to stop this practice, all
it would take would be to insert an output section closing and re-
opening. (Or it would have been so until now; with your addition it
wouldn't be as simple anymore anyway.)

But anyway, if at this point I still didn't get my point across, then
please leave things as you have them.

Jan


