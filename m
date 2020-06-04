Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DBE1EDF00
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 10:03:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgkpq-0002mM-E7; Thu, 04 Jun 2020 08:02:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmK+=7R=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jgkpo-0002mH-J9
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 08:02:44 +0000
X-Inumbo-ID: c4986c1a-a639-11ea-9dbe-bc764e2007e4
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::625])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4986c1a-a639-11ea-9dbe-bc764e2007e4;
 Thu, 04 Jun 2020 08:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moBe8p8eAcPFKrm34g8hl0lNqeABwxW8qltbFSjliJM=;
 b=n5q5il/NCe1hcUd2N7vF+AoMCrnlpywiYHiOx0rzld8DxGepJLykJ3Sz8dDhOw+rJXrQYbYJsWP5uhm+mQAYMoBWQRUO8sfYy4SIAV7UWqdcKGJzvRfx1exeCxYSOVC4e2sLc6Pj9buoQKZBZc8LyN/5zlZ/YtbHOzB3o7CbWho=
Received: from DB3PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:8:1::15) by
 AM0PR08MB3764.eurprd08.prod.outlook.com (2603:10a6:208:ff::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18; Thu, 4 Jun 2020 08:02:41 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::b0) by DB3PR06CA0002.outlook.office365.com
 (2603:10a6:8:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Thu, 4 Jun 2020 08:02:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Thu, 4 Jun 2020 08:02:41 +0000
Received: ("Tessian outbound d078647f4174:v57");
 Thu, 04 Jun 2020 08:02:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a9b7b248646322a6
X-CR-MTA-TID: 64aa7808
Received: from 1355224e9e85.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7EC93A50-16AD-49EF-825A-954974912EE3.1; 
 Thu, 04 Jun 2020 08:02:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1355224e9e85.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 Jun 2020 08:02:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fu95l64+BGAY4SbzCIfNuHNH55B0v0bUQjYib06pvL8yhFMnhOUUafeSab5rt+UR9NUaJ52WLySV1lV8Y1ugvGDvSBm2YJUm0WcgsBphNKqEHVCz0wegbEJaPoOirXl1nV+905+TDYtahtx82kzr3jzqoENn+Jm1fF1sxFZqRnv0/eXKqtFd505pCzv+950CmXYc87aC757Nb4KcEOF1j2Dbu0TFUdZYIHAwopWwonCFWw+SvUUS+rsGu7mrL5pUM3uKUNhwlO8ZRuMXtIQF1l7zlS01PMHd5I2U+4dOVKuy93ZwG6q1zQjNqJTCOcFAjx29wsXMyUonIjp+00MLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moBe8p8eAcPFKrm34g8hl0lNqeABwxW8qltbFSjliJM=;
 b=X9n7ASBHtdnraXOabO7KlWw5Hb08YWsLN0adf/bDKiLX5IEu4FtBac5DFF1uSoXOwHE7tveuGy5qZLEd/rFHIV/mI9cjyuUqCGFGMWV6P05YhBgxqRr0MG7fvSKiQQEXAzWkR4bf6KxNjSot8/79ah/d3KOSubnhS4N2DqNCU0ZWNHvbf29Jjzm3lzpr6LrJ58YLYLkLWS0ULUzzBIXsbkp1PBkL0Yprz275qTHz+S3Y8/WUwesAqQPQmCYUvajTzjkmIKvaqqNF/iLRfS61P3Q1CxBbvw6beoeDtNLQVvmOQVzLLO/MYIZRQIw/PLgWpJiOfLjYdqAQvXeDXg9NfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moBe8p8eAcPFKrm34g8hl0lNqeABwxW8qltbFSjliJM=;
 b=n5q5il/NCe1hcUd2N7vF+AoMCrnlpywiYHiOx0rzld8DxGepJLykJ3Sz8dDhOw+rJXrQYbYJsWP5uhm+mQAYMoBWQRUO8sfYy4SIAV7UWqdcKGJzvRfx1exeCxYSOVC4e2sLc6Pj9buoQKZBZc8LyN/5zlZ/YtbHOzB3o7CbWho=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3052.eurprd08.prod.outlook.com (2603:10a6:5:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 4 Jun
 2020 08:02:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3066.019; Thu, 4 Jun 2020
 08:02:33 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: CodeWiz2280 <codewiz2280@gmail.com>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEA
Date: Thu, 4 Jun 2020 08:02:33 +0000
Message-ID: <8C39F9D0-8351-4671-9A39-D5D4BFF02BD6@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
 <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
 <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
 <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
In-Reply-To: <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b8a2ba95-0f71-4cc8-5dd0-08d8085da810
x-ms-traffictypediagnostic: DB7PR08MB3052:|AM0PR08MB3764:
X-Microsoft-Antispam-PRVS: <AM0PR08MB37644BA8F0EA1B55401AB7739D890@AM0PR08MB3764.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04244E0DC5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MYQ1cNRKIwRA1JIwOYL0qsJwtm4Rl4wUCW4nhEam5OaC7XG36NNWmwH04WI5xGyNgGyVF6LWqVyPC4cOeLy9hOOGZj1cJLDeykdWvSaWyTtx8ftaaGI3gO3Na6KDqUfLHsOh0sZbNc+p7EteHdwpKT1GK4/BgyNU61KZDO1SMwJlGcl0Z2Jk3ZKW5dDRL69HiTDvgf75jRe8pLS1Sga1WD7R4ZGun2dy2hM6gMiDL7i47iFl0v8CubtD04+H9y+q9WIcACHf6CRjUJS/CuvDoypr2ZQ0NebKmANYkCr9uAZj3eMnVmrIEAn/L23HRdb5
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(76116006)(91956017)(66476007)(7116003)(26005)(316002)(66556008)(36756003)(71200400001)(33656002)(66946007)(3480700007)(64756008)(478600001)(6506007)(4326008)(54906003)(8936002)(2616005)(5660300002)(66446008)(53546011)(83380400001)(186003)(8676002)(6486002)(86362001)(6916009)(2906002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ybTSivK4YnL1mMVTevgunokPYwOvl3eKNUSp9EdvHyCIDPwQwjrVVutMnttKBnoCGTJGo8PzA3S4yiwve1pWxidOc84e5ElwwspaDFklJqxZeG/AgPL+6mLj5NpvdUXhOmkbC787QH2wldVVGnxBBS7XVJ18F/qzioP21sJl+Z+uhJxLIYrMrJ8QSXQRtkeQ2n41VWDVaGYF33z/Sp96VEqNYJkn05PtBqh5DeejNXPmxqeU7MgCyW8ugi2VHD7OFbKVCM9LNa2zqR/ZZhIO4nmLWk8gZufcXoa4VfUoL6s2T6STY5eR7tjwNcAvqzch7GcUPg31L+fv4sIEzhsK5TcMXX2nrnxJ251csnkijujBpUWfryIJwyAwSZ7MIvq/lgegqMNDIE3JNiW2ip95C+EiOBxmy5muIHscS/2w3oC2UjUtg4w7Lp2kjbPB/V2EkmH7WPdRXQu/MIZ6ld1Bg1esc63IEXvf3y4NHLY+Vkez0RT1Nx9bPkwngZB6FGZ5
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <90A25ABBFC7FF24E91EB0EEA65AE3526@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3052
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966005)(478600001)(186003)(336012)(2906002)(8936002)(26005)(36756003)(70206006)(83380400001)(316002)(3480700007)(8676002)(6512007)(82740400003)(47076004)(4326008)(54906003)(7116003)(33656002)(6862004)(6486002)(5660300002)(6506007)(2616005)(53546011)(86362001)(81166007)(356005)(82310400002)(70586007);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b2c72dca-47f8-4ef4-2c5f-08d8085da323
X-Forefront-PRVS: 04244E0DC5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F1LMXB9p50IIgWGmqCL1EaCUtF39OFaxNK60FqxNkrNYkIGuqVsML+VW8uvh2uKfZeFDI7FMHBRRZeZN8FhgfDuTtoweNfAi8cMUgqSGzpa3mpOmqcjSgmkI8vXzD/To3+UP9BI4JRK6wkAIYNg9LOjPHCT1ImByfNUO8OyiWtFmdy/rX7ghDjHVT20Sjo8/Vh0wO8jRjvqkeG2dxmTqbFSBdR4IQJ4UhFga4a/o1e0+I4zk7SHGDoIQys/7FqEbkewUcCI1BSgAVRtMVArGQxrLM4S43huYish3pJ6XlYGfW9u3aIPj69TSSlxGsdklSWGA1lxL/sRh5GeRncZVTfq5r+M5CPD7vxRgrkJtcLknjEelZatMoQjLNI3zNR17mj6lYvJjEs2o+KrHWikfyQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2020 08:02:41.7480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a2ba95-0f71-4cc8-5dd0-08d8085da810
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3764
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

> On 3 Jun 2020, at 19:09, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 03/06/2020 18:13, CodeWiz2280 wrote:
>> Hi Julien,
>=20
> Hello,
>=20
> In general, we avoid top post on xen-devel, instead we reply inline. I be=
lieve gmail should allow you to do it :).
>=20
>> The offset is already applied to the memory nodes in the device tree, me=
aning a direct Linux boot from uboot would have only the 36-bit addresses i=
n the device tree (0x8_0000_0000 and 0x8_8000_0000).  Linux would start exe=
cuting from a 32-bit address space however and then switch over to the alia=
sed 36-bit addresses in the device tree as discussed below by early_paging_=
init().
>> I had to add the 32-bit memory node 0x8000_0000 in uboot in place of the=
 0x8_0000_0000 node otherwise Xen would detect the 32-bit processor and pan=
ic on "Unable to detect the first memory bank" in domain_build.c.=20
>=20
> So for 32-bit Xen requires to have the first bank below 4GB. This is beca=
use you can't boot from a physical address above 32-bit.
>=20
> Obviously, this check wouldn't work on your platform because all your mem=
ory will be above 4GB.

I think that the Keystone board has low memory accessible at 2 different ad=
dress (one low and one high).

I would here suggest to have a dtb with 2 regions (one under 4GB and one ov=
er) and remove from the region over 4G the area already addressed by the re=
gion under 4GB.

Does that make sense ?

Cheers
Bertrand

>=20
>> If I leave only the 36-bit addresses in the device tree and skip past th=
e panic check in domain_build.c, then I could not get the dom0 kernel to bo=
ot at all.  I believe I would only see "Serial input to DOM0" and nothing e=
lse at that point.
>=20
> Which would make sense per above.
>=20
>> Yes, leaving LPAE support on for the kernel is preferred.
>=20
> Ok, so the solution I suggested below should work. Unfortunately, I don't=
 have time to work on it. Although, I would be more than happy to answers q=
uestions and reviewing the patches.
>=20
> Would you be willing to have a try to implement it?
>=20
> Cheers,
>=20
> --=20
> Julien Grall


