Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAFA209B28
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 10:15:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joN1h-0002Bc-OC; Thu, 25 Jun 2020 08:14:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zt3l=AG=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1joN1g-0002BW-DW
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 08:14:28 +0000
X-Inumbo-ID: e2aeaef2-b6bb-11ea-8184-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2aeaef2-b6bb-11ea-8184-12813bfff9fa;
 Thu, 25 Jun 2020 08:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr/XeToECV2dwSWdbXEo2mKcFRRFHdG64R4BebP1dMY=;
 b=Lzj11QbhbeiZT53IzxpoFv6BER1AbKq08WIQ9VdkT8bGueLpU7kiNkZ5DfblDorIL2Mqgidt0yT8rcfq0feq0/Ni++QhQJhivNDBKvLzOF1MeYrk78q8AEJ128qDTdG2nsEvMKOnKSsCBZhDZH7YHGO+WeOy6Srs6cuMJQNCMFY=
Received: from DB3PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:8::32) by
 VI1PR08MB4111.eurprd08.prod.outlook.com (2603:10a6:803:ed::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21; Thu, 25 Jun 2020 08:14:24 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::f1) by DB3PR08CA0019.outlook.office365.com
 (2603:10a6:8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Thu, 25 Jun 2020 08:14:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 08:14:24 +0000
Received: ("Tessian outbound da41658aa5d4:v59");
 Thu, 25 Jun 2020 08:14:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f13a4b04593570c9
X-CR-MTA-TID: 64aa7808
Received: from 64c281aa9bed.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D2F03F1F-506D-4B09-8437-49D1247F77EE.1; 
 Thu, 25 Jun 2020 08:14:18 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64c281aa9bed.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Jun 2020 08:14:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3IKsqnmiI2nXiSz3Lhg+V8eq842aMiHJ6+HBahRPtS1WjEG7BhAMwZb5KZWGWmeNF9DTVGHYzX3BpYT/UE+EgQ0gyPB48LUgt6xcZ9oVYknVgYUuRk3KVcvd8CbibwnPiqdaMsPP2tnjkt1fnR+pFlOe5cqC0/SK8XV6n5aSPlYvC2LAXNkwUvXOjxrM5wE2prInBxqaaZw1R993X413i00C5ld7q+3S2LTRLgnJ+K2Tvj/Q5Kt1RyEbc4xdl7YSFBOFmLIPRS6ku1H8Y+Sgq5npjJC1AMgsj+aAJLcetFd5YdST2MTJz8gGIJJo9ES5hkymSLbyARdpPq+5B7vPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr/XeToECV2dwSWdbXEo2mKcFRRFHdG64R4BebP1dMY=;
 b=jSsGbzTwb4xrtSOLYU9VaDSnVr3HQQ5FWgi9UhUL6c2Il00Tp1AC18qqcwBS9+ZAaUSK1xF0VecTFOz5IkXcSMwtp2WZd1JV62F/pd6DgDewZ4y0PZGxxc7owaju+Ob5H1oTChmbP+MmTdP4ynTWjrvRbOaG/GdRFyR6j9yexhFSJrFCGedisKxjtR4OgExzBfuGFuPdQ/MuwwEiiGDXBmNvTbgcEU6sUjo1qFXRGfXDf8aXz078bkbKSNYSrR0tQPrJo32o1oNJ6hJbeRMvEX9/uE7jWFEYaRLyMQRw7iXMYvPI45UUa2//+UJ1Lcu1p4Kzk/bOt5yeuECTvY+b4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr/XeToECV2dwSWdbXEo2mKcFRRFHdG64R4BebP1dMY=;
 b=Lzj11QbhbeiZT53IzxpoFv6BER1AbKq08WIQ9VdkT8bGueLpU7kiNkZ5DfblDorIL2Mqgidt0yT8rcfq0feq0/Ni++QhQJhivNDBKvLzOF1MeYrk78q8AEJ128qDTdG2nsEvMKOnKSsCBZhDZH7YHGO+WeOy6Srs6cuMJQNCMFY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3849.eurprd08.prod.outlook.com (2603:10a6:10:79::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 08:14:16 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3131.023; Thu, 25 Jun 2020
 08:14:16 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Proposal: rename xen.git#master (to #trunk, perhaps)
Thread-Topic: Proposal: rename xen.git#master (to #trunk, perhaps)
Thread-Index: AQHWSkKdIKK1EWuhmkmnd7oeEQV+hajoCCEAgAD0lIA=
Date: Thu, 25 Jun 2020 08:14:16 +0000
Message-ID: <C3C3755A-860E-42A0-83F2-D0CE9D3F2840@arm.com>
References: <24307.31637.214096.240023@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2006241033210.8121@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006241033210.8121@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ccc7c216-6c5b-4836-e0e5-08d818dfc55f
x-ms-traffictypediagnostic: DB7PR08MB3849:|VI1PR08MB4111:
X-Microsoft-Antispam-PRVS: <VI1PR08MB4111745600BDB997B0E21BB09D920@VI1PR08MB4111.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WZOIAy7f3W6zlzcgKP1bWocpG66GI1GFNYtusBpLMBRQuEHoui4AbHaNESKfooBT72+26b32NpUDwKYRiIKH3yC9rEpOJzJQX53hmUkb3teraNGWnFr4SfMBulD/G7CTCSkX+u3P1MJWnI/SSN0gFvEoQXkuHnZvNQfxL8HogKmUKDfTmk8O3vd92Vw3cfX/4A3VsfaHCWLtRgoL2hjp51cLppW/AV2bSZrQnCXwriMHACzWUWt9usXA8NR7OLVaweEAu5lm6xIbmQqhfb8fyXrL5GEjTc2pqPfwnbfn8MzsTGyZykxv4hY6IvVH60arnVVeRb0FrtC/Y46u5tz90K9scHcPx+gsrS6yjXt91ulxEsicAvZOyzYS96yHzzmoWNSNPFdmT5GHTWVpilydMA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(86362001)(6486002)(5660300002)(6916009)(26005)(8936002)(33656002)(54906003)(36756003)(91956017)(66446008)(71200400001)(186003)(64756008)(66946007)(4326008)(76116006)(66556008)(66476007)(316002)(478600001)(53546011)(2616005)(966005)(2906002)(6506007)(8676002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: mE8N5tmnBaTZYCPH5HGPznavJ+M7/YxT4NCo5+2djwFNRYvqoNn/Efii/+djcUyNBPnNTOPZFH6TnRYp9J0z/fxwp5wNzhSmIS1KAcqS9I04uYe8ATlvof2n/85x2Us83ykEZqpkMwQyRmu9edAB5zAjGdkBYRlt1+qithLn5MvpT4NEKeXxvK+X5lllCwW0TnXUI3atKMoFstFiXDTBsRwkuMiDaQy1WNyPKs/XTUyoFuhoNN3GXWQZDB7CMA4o40yhItwFk8HkvFmX0HWLsEgK8KhcsusyDZPJpOQt2uf54C+PMUhBrtp7JbBlTfiSyALQAvgvxB32TVcvDyV1xJqCIESE0ND3E7UymrfdkypYFHVxQNo2wghi+zhB2vBfESaEEYNOPyf6dpElX2Zr6WmDW6fl92bk3ItbRnDeOvwkHk4jZn+JKntuOVU68p2BNp9B1Bat+KdvoPHCNtMFFw3DlezImxhD4OmaUTPj45o=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <80823069153A3F438DC0F68A531D57E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3849
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(70586007)(36756003)(5660300002)(2906002)(70206006)(478600001)(33656002)(6862004)(6512007)(6486002)(4326008)(186003)(86362001)(26005)(336012)(82740400003)(81166007)(47076004)(356005)(2616005)(316002)(82310400002)(6506007)(53546011)(966005)(8936002)(8676002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d1abd0e9-ccaf-4d82-247e-08d818dfc0a4
X-Forefront-PRVS: 0445A82F82
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x9kVtMVERHdr2n4T3lNquK0j4oMYxGVLFy0GRACoo7CuLkOXd+KRQTky8sq+2yBNEZrjlTPfwqwDB/bNnE2KCm6VxZLl7O1JxHtEXhOwp/O6cLG4E/FGK+9zUwRMBz1m2E5EEACzwTiimjeiT5GAuPWWwLCIOC/dXp8HGAFMpKGXScK2dfchA58tbvDZVYIp2wlR/t2w1ZNHaHBk7JIdpUQlGGalmMauPSaJygBNlvy0oF5LgVmSox0T2cWfCto1tBe8+0HPeXxUJc8GWnzjt9pDi31nf7h5HwJheEcDuecof/RXzDYNGN7/GeQfYNBteDKtguWmvtsYe2i4An76oKytWanH30OAykQ6V4QytSg9NaBGAVsWJ2urTLpEbUlJPOKBL4sdYEymYEcYW38ZQlP25idV5Pn9Lvr4pMGAkXIs4z+tyztZ6XRO8fMgKW+jYOfokMTxTyvf2AJ4k1rEhRTrbfe0b+E6LoTx5RTzST0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 08:14:24.1013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc7c216-6c5b-4836-e0e5-08d818dfc55f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4111
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
Cc: Ian Jackson <ian.jackson@citrix.com>, nd <nd@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 24 Jun 2020, at 18:38, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Wed, 24 Jun 2020, Ian Jackson wrote:
>> I think it would be a good idea to rename this branch name.  This name
>> has unfortunate associations[1], even if it can be argued[2] that the
>> etymology is not as bad as in some uses of the word.
>>=20
>> This is relativity straightforward on a technical level and will
>> involve a minimum of inconvenience.  Since only osstest ever pushes to
>> xen.git#master, we could easily make a new branch name and also keep
>> #master for compatibility as long as we like.
>>=20
>> The effects[1] would be:
>>=20
>> Users who did "git clone https://xenbits.xen.org/git-http/xen.git""
>> would find themselves on a branch called "trunk" which tracked
>> "origin/trunk", by default.  (Some users with old versions of git
>> using old protocols would still end up on "master".)
>>=20
>> Everyone who currently tracks "master" would be able to switch to
>> tracking "trunk" at their leisure.
>>=20
>> Presumably at some future point (a year or two from now, say) we would
>> abolish the name "master".
>>=20
>> Comments ?  In particular, comments on:
>>=20
>> 1. What the new branch name should be called.  Suggestions I have seen
>> include "trunk" and "main".  I suggest "trunk" because this was used
>> by SVN, CVS, RCS, CSSC (and therefore probably SCCS) for this same
>> purpose.
>=20
> Github seems to be about to make a similar change. I wonder if we should
> wait just a couple of weeks to see what name they are going to choose.
>=20
> https://www.theregister.com/2020/06/15/github_replaces_master_with_main/
>=20
>=20
> Of course I don't particulalry care one way or the other, but it would
> be good if we end up using the same name as everybody else. It is not
> that we have to choose the name Github is going to choose, but their
> user base is massive -- whatever they are going to pick is very likely
> going to stick.

+1 to stefano
Whatever choice is made here it would be better to follow standards to prev=
ent
user from being lost. And github is definitely a bit actor :-)

Bertrand

>=20
>=20
>=20
>> 2. Do we want to set a time now when the old name will be removed ?
>> I think 12 months would be good but I am open to arguments.
>>=20
>> In any case in my capacity as osstest maintainer I plan to do
>> something like this.  The starting point is rather different.  There
>> will have to be an announcement about that, but I thought I would see
>> what people thought about xen.git before pressing ahead there.
>>=20
>> Thanks,
>> Ian.
>>=20
>> [1] It seems that for a significant number of people the word reminds
>> them of human slavery.  This seems undesirable if we can easily avoid
>> it, if we can.
>>=20
>> [2] The precise etymology of "master" in this context is unclear.  It
>> appears to have come from BitKeeper originally.  In any case the
>> etymology is less important than the connotations.


