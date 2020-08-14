Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C316B2446F4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 11:26:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Vy1-0001eV-Du; Fri, 14 Aug 2020 09:25:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruf4=BY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k6Vxz-0001eQ-9S
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 09:25:39 +0000
X-Inumbo-ID: 3bc65698-c006-44c0-82dc-4c287ba2733f
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bc65698-c006-44c0-82dc-4c287ba2733f;
 Fri, 14 Aug 2020 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0F4pmcY/hxE+m5bXgcbHZzEj8pVOYrwyMna2AAOXzQ=;
 b=r2TyKsE+IsAV5UfXCTc7FrIvHHj2YSrksJYu4HU4JvsIJMYveDSz9FOREkwkBbb4Ny4daVf7sEhHlEYHVBVVW35QbbQ0N7dozqKhCjpNx8CTGHPsAz7qkplTjnI7ObpkPCZr17ACY/VZ+hlqrxXS3VTQwSlqZD87G87Od+CTZCc=
Received: from AM6PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:20b:92::25)
 by AM8PR08MB5555.eurprd08.prod.outlook.com (2603:10a6:20b:1d9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 09:25:35 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::5e) by AM6PR04CA0012.outlook.office365.com
 (2603:10a6:20b:92::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Fri, 14 Aug 2020 09:25:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 09:25:35 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Fri, 14 Aug 2020 09:25:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ec7d6a6d73bb8ab
X-CR-MTA-TID: 64aa7808
Received: from f56fc63a98cb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 99067C3F-8853-4663-96EF-9F00CB0B7F9D.1; 
 Fri, 14 Aug 2020 09:25:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f56fc63a98cb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Aug 2020 09:25:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGHk6dQqnrQDVWxrewnJ3vQx4o3SEFePIoshY9OGvRV/H/YJeQrsNK3LvLKywEjaE+yUnnIvfRXW/v1cxAazYH8dPf+bYSbXS4kZWBt4omip+g8cCyRGEYS8P/gbANrwn2q6OHyT91Tv/2nf58d71WC6tY7R1pKOHTp2XqBy0bMMVNS/ThnQ595m35cQC1edCVrM2opqP/WnCnDzETKVhFuTKo0JtaZrHGqlY8xPFlZGWh+9oT6ZA+wmymMlc8IHqeAkv/tTfJUQ8SARwMrJSg/8QrU1G+5aIiOkyuk/wi6x8umrGOJX+TLChVFV0utjMtmQq1Np8qZ9kSCaoyoGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0F4pmcY/hxE+m5bXgcbHZzEj8pVOYrwyMna2AAOXzQ=;
 b=B+GGpWLbvgCQ7irhDvdQjcLrlZevxwhXmnX49O2FaKPl2FQ2JEYqrV4dryATdlXSshObFmlHibFPQHvLzF2g/qghPWyoPGBxs8lIx3l+ZIp9eDu+t2SYhr3Uh37dfxkBIzhbv9IeO+0ICfCDU7w3TejdTNIsHXPDXE8Lgpw7rNUeYLniUOo4hJp+vG15qiNWG4O54jTqop0v1H6L1hxnZOK/AKIQunbjo2qRrycBPKHoIXtbZDJqWaaYTZrIuUTOV+7ctQ4x5Vo8XCYQLAXWzelILetRfdYaWsZtf8kwL2zKpNfQ6UXpnxRzarIY2WsZkm8boVZi9f3BUzDnhrzUUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0F4pmcY/hxE+m5bXgcbHZzEj8pVOYrwyMna2AAOXzQ=;
 b=r2TyKsE+IsAV5UfXCTc7FrIvHHj2YSrksJYu4HU4JvsIJMYveDSz9FOREkwkBbb4Ny4daVf7sEhHlEYHVBVVW35QbbQ0N7dozqKhCjpNx8CTGHPsAz7qkplTjnI7ObpkPCZr17ACY/VZ+hlqrxXS3VTQwSlqZD87G87Od+CTZCc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3162.eurprd08.prod.outlook.com (2603:10a6:5:23::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Fri, 14 Aug
 2020 09:25:14 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3261.026; Fri, 14 Aug 2020
 09:25:14 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH v2] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWZPcpcJdIAbXhcEqLxJ7JubPXUKkdZ+eAgAC8aQCAAMFpAIAAcn6AgAHoeQCAADumgIAAAacAgABIKQCAAI2WAIAVG/WA
Date: Fri, 14 Aug 2020 09:25:14 +0000
Message-ID: <3230CBBC-0C63-44DA-A767-14977890547C@arm.com>
References: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
 <8d2d7f03-450c-d50c-630b-8608c6d42bb9@suse.com>
 <FCAB700B-4617-4323-BE1E-B80DDA1806C1@arm.com>
 <1b046f2c-05c8-9276-a91e-fd55ec098bed@suse.com>
 <alpine.DEB.2.21.2007291356060.1767@sstabellini-ThinkPad-T480s>
 <1a8bbcc7-9d0c-9669-db7b-e837af279027@suse.com>
 <73c8ade5-36a3-cc13-80b6-bda89e175cbb@xen.org>
 <6066b507-f956-8e7a-89f3-b21428b66d65@suse.com>
 <E39531EE-0265-4387-813D-22A57CD3F67B@arm.com>
 <alpine.DEB.2.21.2007310935350.1767@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007310935350.1767@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f68396e7-64d0-486f-450a-08d84033ffda
x-ms-traffictypediagnostic: DB7PR08MB3162:|AM8PR08MB5555:
X-Microsoft-Antispam-PRVS: <AM8PR08MB55554F9CA835F3C8AFD7B1A29D400@AM8PR08MB5555.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bq3AWtDd/VU4MCGmOCVlcT/aL98x6zC+nALm5NzK8Gaq80xn5N8b3CFE2lV3zH2fZGR3jvbSNMg/VZcXjKPU7+wnxOe+rSMUfWiK0w5OqPpAXFa/TLMm9ctf7vnxLNOBz1IVMOHM9snb54ujX0LJp7v635yEUL0mJz7obyLaNcfSSvJtBhW9ZuhmbTpKiJcbVl4df33/GkVIyCGsOZM06/sLOqXlCzzhazPv1jM7bF8TXKuIWsUOehU0AJvVOaOVmTqbLHlyqRpXSd21VRjGswplRnkAUXXa1IJMyFaMTnsmqMhZa42PbVHAG4V4TBbu0ZxLg3fFBc4Wpn+w1hPZYoTHj7RvjAeG3cqkDpvcIGyhx1m2IxOdspEwDpPe7EvfEiV6KxvX9nmhM/aaO+arTQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(2906002)(64756008)(76116006)(91956017)(66556008)(66476007)(7416002)(5660300002)(6916009)(36756003)(8936002)(66946007)(66446008)(6486002)(8676002)(33656002)(53546011)(6506007)(54906003)(83380400001)(2616005)(316002)(478600001)(186003)(71200400001)(26005)(6512007)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: RzBxGBPpiUvxVf2kvBMDdFI5tJtO6iZOrJvEVp3AnP/zrOmkvDnPfQ9nG3r+7zkEaEf3yMPUSh+nsHeZMdqrCwBq2nbSMl8cT5M/zRJYCAu2vUa1ZAEBUCdiHsCPxKfMtFqMUXt8Qlfpw2b9cAGlx2WhhGhmxyVMbw0PYpuWHtqPrn4WPsXnomNFDortNPmwdvVVoeF7P9dn/vv2f+kYcetNHHXa3A3qXkdp8+cohUejHvGNNliL4BHWTI/6H1v5ajlD9mcyHGiCpFSlKSQfnaGuEUuR+oWFSwEV70bNwAb50Xr069En0+02n6su9vabdZB2kze+MK09u8WK+ojfNa5+tXkLvbPwAS7lkrRxG0Em82EMc/VDsvT/IgK8QlL/Adnaj+vGVt4DfGAaSxU3qxMX6ga64RP3qLj4PgXG8Oh+7uIy95ptPHbvb2MsC3bClAzp7plMUaf5qdm957MApDC9a8pE6M09ip6eJXSw6dJ+bWsTAVbMzSG0z0bNJLZuHhfbRBAMJUICHvGInchoz/u10vnPFSmUQS6+Xyf+LG6onqK8b9iY4NED12od1T0Cjo/zM3yyd2Ku7jEWzt/2/AJYAf0AxL+oXZsdITlth8b+7HOJIxJ3gbSzmFCUItLSt3X9ZjiEO1qFyZBiEI6XtQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D0BB7D7EFFB6DD4084D833E6DC037102@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3162
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: bf1270c5-bd99-4477-691f-08d84033f35a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c/iU1SRMNOOeTRxnA302xFXjAaRDUvtBWoLRhJ5ACHL8NVDT51fXEERYbJFgbiDaXLv8yih6tz4TiVAodmKz35AmQVgAqQn+I4SvMjCBo/jT5TucOzzTeKwsl8jurj8WnmIPUitz/vAHPuEnA6pJP1WCG0PEXdU8w/OllYnG/5uNrxAtv2r+n2W/NZsj1dRBxtOhWDk0a87+h4wZv/A7Uq0dPguGHfE1eh6VVlxarcmV3t7z7PP/znCeYGZDeUbpIFm7seI32QCtUmThXE/6A90ZpqGrehzYFAPepI5GDhYwbwPgGONYgX01NduJ92Av6oao8Fpl5UDChHmKheSeKpdipnlZwiqTaGgA6OiR19zVuw9GwxUgupAmrWd/Dn1MsO3X0gDwJLUUBj8HUCk5pSbSHaz0DH8EVHcVQDe8z3T5hU8mzTNKdISq8qQeOkejgpKT85clv1Y9qrloyuGCdyb6ZYam2xAfaQUa3UTN1SQ=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966005)(82310400002)(47076004)(5660300002)(33656002)(4326008)(36906005)(82740400003)(356005)(6486002)(6862004)(70586007)(316002)(2616005)(81166007)(54906003)(2906002)(6506007)(186003)(478600001)(70206006)(36756003)(107886003)(53546011)(336012)(83380400001)(26005)(8936002)(86362001)(8676002)(6512007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 09:25:35.1790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f68396e7-64d0-486f-450a-08d84033ffda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5555
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 1 Aug 2020, at 00:03, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Fri, 31 Jul 2020, Bertrand Marquis wrote:
>>> On 31 Jul 2020, at 12:18, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 31.07.2020 12:12, Julien Grall wrote:
>>>> On 31/07/2020 07:39, Jan Beulich wrote:
>>>>> We're fixing other issues without breaking the ABI. Where's the
>>>>> problem of backporting the kernel side change (which I anticipate
>>>>> to not be overly involved)?
>>>> This means you can't take advantage of the runstage on existing Linux=
=20
>>>> without any modification.
>>>>=20
>>>>> If the plan remains to be to make an ABI breaking change,
>>>>=20
>>>> For a theoritical PoV, this is a ABI breakage. However, I fail to see=
=20
>>>> how the restrictions added would affect OSes at least on Arm.
>>>=20
>>> "OSes" covering what? Just Linux?
>>>=20
>>>> In particular, you can't change the VA -> PA on Arm without going=20
>>>> through an invalid mapping. So I wouldn't expect this to happen for th=
e=20
>>>> runstate.
>>>>=20
>>>> The only part that *may* be an issue is if the guest is registering th=
e=20
>>>> runstate with an initially invalid VA. Although, I have yet to see tha=
t=20
>>>> in practice. Maybe you know?
>>>=20
>>> I'm unaware of any such use, but this means close to nothing.
>>>=20
>>>>> then I
>>>>> think this will need an explicit vote.
>>>>=20
>>>> I was under the impression that the two Arm maintainers (Stefano and I=
)=20
>>>> already agreed with the approach here. Therefore, given the ABI breaka=
ge=20
>>>> is only affecting Arm, why would we need a vote?
>>>=20
>>> The problem here is of conceptual nature: You're planning to
>>> make the behavior of a common hypercall diverge between
>>> architectures, and in a retroactive fashion. Imo that's nothing
>>> we should do even for new hypercalls, if _at all_ avoidable. If
>>> we allow this here, we'll have a precedent that people later
>>> may (and based on my experience will, sooner or later) reference,
>>> to get their own change justified.
>=20
> Please let's avoid "slippery slope" arguments
> (https://en.wikipedia.org/wiki/Slippery_slope)
>=20
> We shouldn't consider this instance as the first in a long series of bad
> decisions on hypercall compatibility. Each new case, if there will be
> any, will have to be considered based on its own merits. Also, let's
> keep in mind that there have been no other cases in the last 8 years. (I
> would like to repeat my support for hypercall ABI compatibility.)
>=20
>=20
> I would also kindly ask not to put the discussion on a "conceptual"
> level: there is no way to fix all guests and also keep compatibility.
> From a conceptual point of view, it is already game over :-)
>=20
>=20
>> After a discussion with Jan, he is proposing to have a guest config sett=
ing to
>> turn on or off the translation of the address during the hypercall and a=
dd a
>> global Xen command line parameter to set the global default behaviour.=20
>> With this was done on arm could be done on x86 and the current behaviour
>> would be kept by default but possible to modify by configuration.
>>=20
>> @Jan: please correct me if i said something wrong
>> @others: what is your view on this solution ?
>=20
> Having options to turn on or off the new behavior could be good-to-have
> if we find a guest that actually requires the old behavior. Today we
> don't know of any such cases. We have strong reasons to believe that
> there aren't any on ARM (see Julien's explanation in regards to the
> temporary invalid mappings.) In fact, it is one of the factors that led
> us to think this patch is the right approach.
>=20
> That said, I am also OK with adding such a parameter now, but we need to
> choose the default value carefully.

This would also mean keeping support in the code for old and new behaviour
which might make the code bigger and more complex.

>=20
>=20
> We need the new behavior as default on ARM because we need the fix to
> work for all guests. I don't think we want to explain how you always
> need to set config_foobar otherwise things don't work. It has to work
> out of the box.
>=20
> It would be nice if we had the same default on x86 too, although I
> understand if Jan and Andrew don't want to make the same change on x86,
> at least initially.

So you mean here adding a parameter but only on Arm ?
Should it be a command line parameter ? a configuration parameter ? both ?

It seems that with this patch i touched some kind of sensible area.
Should i just abandon it and see later to work on adding a new hypercall us=
ing
a physical address as parameter ?

Cheers
Bertrand


