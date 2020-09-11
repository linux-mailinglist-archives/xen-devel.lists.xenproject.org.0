Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6982660C3
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 15:56:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGjXP-0006Qs-AK; Fri, 11 Sep 2020 13:56:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G+bd=CU=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kGjXN-0006Qi-Cl
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 13:56:25 +0000
X-Inumbo-ID: 566b34c6-5d3b-42fa-8fc9-a4debd92650d
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [40.107.12.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 566b34c6-5d3b-42fa-8fc9-a4debd92650d;
 Fri, 11 Sep 2020 13:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igFvcvHjoRQO/H099S1THXaZ/rjMd3bUM4ExXZACgg0=;
 b=zJiWtPM4K4cf/zNCZPGJNIGlTfItkZeRwokDSoVR2QE4aeHd9PrrSAXc3gnZ7XHTYVL1rT4/SAgUpvhg6hBVNoZu/D/9GoVvLsAp2xDhhF75C6WLJB3C1f7EGckxKWKxW8jROAy5F+5Hp7vdyw7AYF7IkRVyO2B3zZcQrRqVi2w=
Received: from AM7PR03CA0024.eurprd03.prod.outlook.com (2603:10a6:20b:130::34)
 by PR2PR08MB5228.eurprd08.prod.outlook.com (2603:10a6:101:21::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Fri, 11 Sep
 2020 13:56:21 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::32) by AM7PR03CA0024.outlook.office365.com
 (2603:10a6:20b:130::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Fri, 11 Sep 2020 13:56:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 13:56:21 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Fri, 11 Sep 2020 13:56:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82d49c6ddefa5c85
X-CR-MTA-TID: 64aa7808
Received: from 8f8e840437b0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CD27406D-29AF-4218-8870-5B474DFCC36B.1; 
 Fri, 11 Sep 2020 13:56:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f8e840437b0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Sep 2020 13:56:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lB2plxlV8oXnLQvZgY0HSdk9M+6I3EyKVFCTd+dT+rCoDnPaOAZe4L/nGz777QF0elQhn6x2eBKyIad9ZhS07GGlpykgORIn6vFuN1yBc5MbNPvK0f7FLDyBLBqJnBJgR3/rftais2P8qejfw0bbTmYFig7OrOyQzmlwDh2FkDzxezf6n77u/ExAP4+UphH+xPLWCzZsVifgA6zlamZ49QKOwVxGfk0kt6SP/NNlSqF54HXPk3dSYzCTN8PSWk/7Z+dhT5SDo/siTkEBZv7tIa3cPYpOU6c95CUEv4KyMpwkgUBSTn4mcArITuJwa3voGwgSOgON7kttZ9OjV+uhiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igFvcvHjoRQO/H099S1THXaZ/rjMd3bUM4ExXZACgg0=;
 b=KfoYhCjTNAOIrhU6T6sQ7Xu9BZOzEB6QnxcvGUY01TUucc90F+ig5qTegbGlVBrKzmL/Jbp7iHM+OHmqDjKQOtzj2tF11LsAQLfKyKjeAyox0BrwcG228OyRSk2zN2FHE2X/GWPNoSERc/5Bd3mAth87olTzZrP8kezshdP/NwZXILKS96jUJPJMx9ZgcmdrixBHBCiARCyy+XZ473e3x/eHJb0bHLAWkNilfLuEDCaoCgFSLZruaDjObk1XgfuGgRP3/STcMokLq1HaKpu5+3+0Ip05emmLbMB4O96jVvauYL856MBpsHSqlrVttI5S4srcHYQ4fM2crRQV+Weeig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igFvcvHjoRQO/H099S1THXaZ/rjMd3bUM4ExXZACgg0=;
 b=zJiWtPM4K4cf/zNCZPGJNIGlTfItkZeRwokDSoVR2QE4aeHd9PrrSAXc3gnZ7XHTYVL1rT4/SAgUpvhg6hBVNoZu/D/9GoVvLsAp2xDhhF75C6WLJB3C1f7EGckxKWKxW8jROAy5F+5Hp7vdyw7AYF7IkRVyO2B3zZcQrRqVi2w=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2565.eurprd08.prod.outlook.com (2603:10a6:4:a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 13:56:11 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 13:56:11 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson
 <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, Anthony Perard
 <anthony.perard@citrix.com>
Subject: Re: preparations for 4.13.2 and 4.12.4
Thread-Topic: preparations for 4.13.2 and 4.12.4
Thread-Index: AQHWiD10WcdFT9qIdEquGSa2/T2AM6ljb4MAgAAFNoCAAAFogA==
Date: Fri, 11 Sep 2020 13:56:11 +0000
Message-ID: <675ED3A7-6C02-42FC-8CD9-717610143A82@arm.com>
References: <427c2293-366d-2ab3-cfbb-b41db35bd8b6@suse.com>
 <A526A238-AEE2-4A8D-960C-AA15E75786C0@arm.com>
 <78572a41-a84b-0c1a-0f17-4e4b484fc6cd@xen.org>
In-Reply-To: <78572a41-a84b-0c1a-0f17-4e4b484fc6cd@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1ab78a52-06dd-4770-8c44-08d8565a76e6
x-ms-traffictypediagnostic: DB6PR0802MB2565:|PR2PR08MB5228:
X-Microsoft-Antispam-PRVS: <PR2PR08MB5228644558BEFE3B5ED354559D240@PR2PR08MB5228.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2cYiE0IzU4KU4AGBhKDKtwHwIMyCyNGtPMvjyjK9Tq4XX5cpTYhn4tgmWH4JyrKb3dnJcPnFf8t89a5bAgxIhCdTQgctFCKwMNh1CdT8T4n/2UvODzvkTgjjfzJErD3Wt9vUYJ0BtUfrrB0N4r0ICn/QoVFQQSwYR4GeNW+QTw/Ygg8zDYRXaX4Z5ubfp03+SNOw32dDuL1rI83uMimB7OEDBPTm1yPtBA7feIm932Dw5i3tTbpNNq7rt8+eoFCYFztVq1MfWA8n2tQB9ps+lCrzc/lNkPLgBrr4Zr+H7FO9QD8DDPCGe7QdS2A6vLMv
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(6506007)(83380400001)(71200400001)(2616005)(33656002)(6512007)(54906003)(53546011)(91956017)(26005)(2906002)(8676002)(76116006)(86362001)(5660300002)(64756008)(478600001)(6916009)(186003)(66476007)(36756003)(8936002)(4326008)(66946007)(66446008)(66556008)(6486002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: XHxigHXWp60g3opH19ZaPIWWTi4H9uD6DEVf499FDxaNKAyn8+vpxus9BkCWQGvgQ5M9GbmpUalwOmL7V+vAhBRY0S+FFD0EmARqfKvdqfAYDQ6zGvCQx31X3/3gZ4Q9JqvcISb/asCavFGlFqzaJbQJuR2PgjDWbV5lCbZBHYfmwifx7JgiXHvlvDmDDZjZePcQqtibVszWaKJRxSHZw2Crvn3AZXl2EYT3R3Lq0XCG7cKKLp3D++xvvJOHzhTcCbNxjHFWuhuBhDBZwg8NewJgVeACZL9LRCBmubLgGR8nsNGuoa2URYCWvQiwao7SGTOQchQsDOebiDkJAe/kJ2kpbbTQDenB9qmk9yB3v2olF/EeuWsmU9qu672twnBtepjGBwxqV5JhNxieJhFtLK4AcaXeVptHv8HkQrCmKcUy8ZndyljzvU1o/3Y/kpF0OzcrQeO/5R9ZOd6zE8OFkLlk73RJi3MfSe7GnxOkw27KzWQfKoj6V48FvoRbAbQTFAzo0z9FlrVMVwoqxiDLFQNNSybuyN5d/rsSwOJswxT1lMAkB+zgyEsGQa+QfvB/kogyahFpre/Xqg4nhDd1p/mqZK+A5W0JnDucQjUdB4vM8qQdOQjB9mPDVc4U21Wzz2Hp+8fev9tZB73esJJW6Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <57ECA72BDCB88C40A719D085057B5CF8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2565
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1376d832-224c-4267-e658-08d8565a70c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6IGsFas6pG/KsEUnhFjN9tGyKZQleCzuOTtzVbfbCxPsL40iIOmISeKl9s0RC7/M3slCs+PB6sn9sLK3KxmtqurtrCZvvYqmjZTswJRowoudm/AcFDzv4taq6iR/aSUashS+Fe85muzLC6RlNzUnVkkwKe1MI0b0Rmw31Iuvb36BxiYi8Ko/JAS2MnGVwheXqZtxRGrSSHG1NPQUY87jKDr3MawCKP0xuupeUpf2otIUqkB+msOVT1fZ59sY5lThZhsU9E6Dy5Yxantoji9CUcmIylAI747/m/k4dtHVASazRAYC1B2CqkqrY5R7XKsdivXovRIAr05x7MdXBA6bMZhqm7A/uyrCEIboaCB/X7K/rZ5V7pOl6/011hRZRAp3KYLQtmADUKO0TYQSBRqzWQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966005)(6862004)(336012)(8936002)(47076004)(83380400001)(6486002)(478600001)(107886003)(36756003)(81166007)(33656002)(82310400003)(82740400003)(356005)(86362001)(2616005)(6506007)(6512007)(70206006)(54906003)(70586007)(2906002)(4326008)(26005)(8676002)(186003)(36906005)(53546011)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 13:56:21.4201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab78a52-06dd-4770-8c44-08d8565a76e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB5228
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



> On 11 Sep 2020, at 14:51, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 11/09/2020 14:32, Bertrand Marquis wrote:
>>> On 11 Sep 2020, at 14:11, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> All,
>>>=20
>>> the releases are about due, but will of course want to wait for the
>>> XSA fixes going public on the 22nd. Please point out backports
>>> you find missing from the respective staging branches, but which
>>> you consider relevant. (Ian, Julien, Stefano: I notice there once
>>> again haven't been any tools or Arm side backports at all so far
>>> since the most recent stable releases from these branches. But
>>> maybe there simply aren't any.)
>>>=20
>>> One that I have queued already, but which first need to at least
>>> pass the push gate to master, are
>>>=20
>>> 8efa46516c5f hvmloader: indicate ACPI tables with "ACPI data" type in e=
820
>>> e5a1b6f0d207 x86/mm: do not mark IO regions as Xen heap
>>> b4e41b1750d5 b4e41b1750d5 [4.14 only]
>>>=20
>>> On the Arm side I'd also like to ask for
>>>=20
>>> 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics =
helpers
>> +1
>> Could those fixes also be considered:
>> 3b418b3326 arm: Add Neoverse N1 processor identification
>> 858c0be8c2 xen/arm: Enable CPU Erratum 1165522 for Neoverse
>> 1814a626fb xen/arm: Update silicon-errata.txt with the Neovers AT erratu=
m
> The processor is quite new so may I ask why we would want to backport on =
older Xen?

4.14 at least would be good as it is the current stable and N1SDP is suppor=
t in Yocto which is based on 4.14.
Older versions where because the BSP in Yocto was initially done on Dunfell=
 Yocto release which was based on 4.12.
But as the official one will be on next Yocto release this would be ok to c=
onsider only 4.14 here.

>=20
>> 968bb86d04 xen/arm: Missing N1/A76/A75 FP registers in vCPU context swit=
ch
>=20
> I would consider this one because 4.12 as already errata for A76, so it i=
s meant to work with it.
>=20
>> f4c1a541fa xen/arm: Throw messages for unknown FP/SIMD implement ID
>=20
> This is technically not a bug fix and there are many ways for older Xen t=
o not work on newer/recent processors. So I wouldn't consider this as a bac=
kport.

Ok.

Bertrand

> Cheers,
>=20
> --=20
> Julien Grall


