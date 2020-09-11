Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E2266247
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 17:37:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGl6V-000782-Jr; Fri, 11 Sep 2020 15:36:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G+bd=CU=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kGl6U-00077x-Pl
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 15:36:47 +0000
X-Inumbo-ID: ad9bee74-ccbb-45bb-8d94-02daa44878e5
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad9bee74-ccbb-45bb-8d94-02daa44878e5;
 Fri, 11 Sep 2020 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLvLCAlXL9ZX93RsMUrYjWGT/J2ZyHcQKOxE2P1Tl2s=;
 b=dEApE8EFsyrj6LfW+H+gXfYn9SXaE+cy728xI2VsgnPD7s30NghNr5cdHDfi2MEYqjJUPz1prd57v41gXhjqhlw54DrzxkrmD9wbJs1DYso8Rmxz+xF3jvu+0a6jFIha7utDGq9rS1C444Zi82zBlPKOPxbf6GrvGYW6ayCHWiM=
Received: from AM6P191CA0093.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::34)
 by AM0PR08MB3586.eurprd08.prod.outlook.com (2603:10a6:208:e1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Fri, 11 Sep
 2020 15:36:43 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::86) by AM6P191CA0093.outlook.office365.com
 (2603:10a6:209:8a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Fri, 11 Sep 2020 15:36:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 15:36:42 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Fri, 11 Sep 2020 15:36:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 293636186949057c
X-CR-MTA-TID: 64aa7808
Received: from 514465f62fc8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 33CEE8B5-543B-4580-ABE8-37FEABE0AFBA.1; 
 Fri, 11 Sep 2020 15:36:05 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 514465f62fc8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Sep 2020 15:36:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3qU5+cWVbORhH+CrEtGGT3/P+ZX4Z7cNIwg5MVtgQ/98pjQu8i+qN0y5foCEYB766kGoQt//OOsnxdd7mv8o2QlIxci7nYhuEz+VVjxbtBl0af0Tufu0XKIvtpLHUKKpbEVZAQAEkNtD1TeNVH035kjEHwCuTKTYvFnCyYhsJLy0rYgubZQKaRQixHuiV8Z1UfC+2wRqRHhFOriCXq+tjVuS0ATHEW1DaHZwkmcVzGa7FanUEy3fzAE5w/YMbhn6YINvj2IpM8PS3IvUa1OX3KRmFsqGJe+35lvlU9omjLDx0Bl+U1vKV4I+IWayiNd9ZJ58W+XnW58fxgGPkUXyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLvLCAlXL9ZX93RsMUrYjWGT/J2ZyHcQKOxE2P1Tl2s=;
 b=EoHvOSEPJlEeRgztc1hGWlPKq0vxiqjM2o0HT2d68lU3omlQeMRGquDN8gQvvTNZs4W+e1BTjkg2iqUPbqnDQBNF6ImRMEILihgbYnFdLmGaA06kiSx83FNVmGnRSqvR3wKdhX7kWsek0rZtyyFFk+1vDkATDyDlnBMnM1I26Vo0YFXyE2RgZK5J57Mb3jWPBFk4EsZnmU18Ex4Z/qjJzqgp6GPE7IL53IRZLoWYp5VKVJ0N+Ibt89OviPaPf7xTptNB5S2f/sk2e/sDBXt0FP3FBJisAv8jXLX1bEINfvh58eTvxHj29gKaoIihovZ6aZP8oKifQpzd7Qu9uR04uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLvLCAlXL9ZX93RsMUrYjWGT/J2ZyHcQKOxE2P1Tl2s=;
 b=dEApE8EFsyrj6LfW+H+gXfYn9SXaE+cy728xI2VsgnPD7s30NghNr5cdHDfi2MEYqjJUPz1prd57v41gXhjqhlw54DrzxkrmD9wbJs1DYso8Rmxz+xF3jvu+0a6jFIha7utDGq9rS1C444Zi82zBlPKOPxbf6GrvGYW6ayCHWiM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1912.eurprd08.prod.outlook.com (2603:10a6:4:73::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Fri, 11 Sep
 2020 15:36:03 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 15:36:03 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson
 <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, Anthony Perard
 <anthony.perard@citrix.com>
Subject: Re: preparations for 4.13.2 and 4.12.4
Thread-Topic: preparations for 4.13.2 and 4.12.4
Thread-Index: AQHWiD10WcdFT9qIdEquGSa2/T2AM6ljb4MAgAAFNoCAAAFogIAACDSAgAATsgA=
Date: Fri, 11 Sep 2020 15:36:03 +0000
Message-ID: <73F288D0-AE3E-4535-824D-710BDFE6ACB4@arm.com>
References: <427c2293-366d-2ab3-cfbb-b41db35bd8b6@suse.com>
 <A526A238-AEE2-4A8D-960C-AA15E75786C0@arm.com>
 <78572a41-a84b-0c1a-0f17-4e4b484fc6cd@xen.org>
 <675ED3A7-6C02-42FC-8CD9-717610143A82@arm.com>
 <658b29f5-d68e-613b-5d53-c92eff1fde22@xen.org>
In-Reply-To: <658b29f5-d68e-613b-5d53-c92eff1fde22@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1d8e229a-2974-48eb-9570-08d856687c08
x-ms-traffictypediagnostic: DB6PR0801MB1912:|AM0PR08MB3586:
X-Microsoft-Antispam-PRVS: <AM0PR08MB358612402B1959B8732B39E99D240@AM0PR08MB3586.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: asMV+2b6NdZbRjoRrvqkiegPvDuPmDbTYl0s+obMn4OefE7Yeu2d3n2puxNDncwV7SbQaMxdrrXJa3lfqKC+Dj3Ijv0CDDUpdRDLj0maL+L+9SQwQ/77lb+Qb82sKZKUIXeUhnz6bAqS0yH4AvN1SX//sjvkEcL84uCfW6HuGWGa9YeSrGNdfgxtWIp8NzGm1QcRRdoc+HwwB/nYJqZJyQG862Pu+bgBbCARkAUX+6ZoZbchtvplOQAvEcYf3mNnIGhaksxD8DHN1vE2p1/D/x3pS1cG8lkBesCe57i+TmN64okaDfICO3h9v6dfiJKBfeulSnqYB9+cZsASrYj5dQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(6916009)(6486002)(4326008)(8676002)(36756003)(86362001)(71200400001)(83380400001)(6506007)(76116006)(54906003)(91956017)(53546011)(8936002)(26005)(5660300002)(66446008)(33656002)(64756008)(478600001)(66556008)(2906002)(186003)(66946007)(2616005)(66476007)(6512007)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: NZ+YAzN0PhmjxLZ3KT9Gs8H7VfUEAQhpKw/8q5nsUh5nad6tAbjbqfkKLWJwxUMgHI97w2mTwjzzchAI58S/+PphpCh1XMBSvSYxsyEjk34A11eeqyQI3N3wh+itI0waLB67o2uvy8q+giiYAHide0W02zqW+DhUPAEhkqsZblgJpOO/ttnzc0avfigkdkX1cHcUCYSdnOkcHNOqQE/05XWGJ4RDZwTbrQGRzvPT+w4im66my+VSydTiNlkDmTzdNDII9F+yo+r3UB5mUKXmLGl9B22hoOFz4y/3cf6uodu9gHWXnnRdgS9/cycEB4GRIc+dYn9fBom9kyUb91qQM6FYNYl9Mt1/kfsQocdZdgdDIWgFeC3YGa4loCiHV8zk6eubijmIr3OFg/jyLMNv6G5/IfW9OjSSjBmBmO0QKk+LVdn3TRKZxSx9+tM/aOdbHqgJjnkoND7OYC4IQbY7ocPdcVK41fWPdoQr0oDbY7emUSNheOeCN+g3GaVBB42L4Gdv6YlAkgaCozDP2B6rHe8x8Qw6kVCrrTAhAMgmGTbB0blM6cjkikRUWcNL585zQy28GTWQVk2neIMnVb+6hjq9WlzCxPNdJvUnkPBeVRV2Ie79AK/EznefJYjQGtj/WeSHSNg7RiG1zDoshl8v7w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <992E137B1FDC2944801C274837B08CB2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1912
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 840bc2ae-78a8-4738-356f-08d856686469
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LnHtlTI6RdJR2FnFjdTDtdgLDMgl2TB8CuF3auuDoQsxq6DDM18cz7CeseK/01FOYJKNvCZSpuXEYW9w8b+Wk8kEaPumAHZrU7kBut+RH3LCf/A8SUtOyrzeRPZpXP/YBO5CPGonzmObERU0vKR1x+CZ/Tj3+j3edO8puBrJFvbkIS89e33kt6Nn7ezPB0w+zY3UtVLLDpVINNetlC/s8zR14QcYD+msZ6Ren1ATehGz+9giWMddlrT5nLP6HpNyuN0psqxbMPnn/2W5YSqhZm5CUSTu3XZWUOxOLQZ9uZOArONBpKdCxRLyxio8u+JjAlf8Fu+hPJ+JLQu4AXZE31yIdbYOS/fuhP+xPVkBKvkdB28gwI5jyyf8dRNe2xQtIUslDZFcRJZAdo3Q73omRw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966005)(478600001)(83380400001)(36756003)(33656002)(47076004)(6862004)(26005)(82310400003)(81166007)(316002)(36906005)(5660300002)(356005)(186003)(336012)(107886003)(2906002)(8676002)(6506007)(82740400003)(53546011)(4326008)(6486002)(70206006)(54906003)(8936002)(6512007)(2616005)(86362001)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 15:36:42.9840 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8e229a-2974-48eb-9570-08d856687c08
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3586
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



> On 11 Sep 2020, at 15:25, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 11/09/2020 14:56, Bertrand Marquis wrote:
>>> On 11 Sep 2020, at 14:51, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 11/09/2020 14:32, Bertrand Marquis wrote:
>>>>> On 11 Sep 2020, at 14:11, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>=20
>>>>> All,
>>>>>=20
>>>>> the releases are about due, but will of course want to wait for the
>>>>> XSA fixes going public on the 22nd. Please point out backports
>>>>> you find missing from the respective staging branches, but which
>>>>> you consider relevant. (Ian, Julien, Stefano: I notice there once
>>>>> again haven't been any tools or Arm side backports at all so far
>>>>> since the most recent stable releases from these branches. But
>>>>> maybe there simply aren't any.)
>>>>>=20
>>>>> One that I have queued already, but which first need to at least
>>>>> pass the push gate to master, are
>>>>>=20
>>>>> 8efa46516c5f hvmloader: indicate ACPI tables with "ACPI data" type in=
 e820
>>>>> e5a1b6f0d207 x86/mm: do not mark IO regions as Xen heap
>>>>> b4e41b1750d5 b4e41b1750d5 [4.14 only]
>>>>>=20
>>>>> On the Arm side I'd also like to ask for
>>>>>=20
>>>>> 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomic=
s helpers
>>>> +1
>>>> Could those fixes also be considered:
>>>> 3b418b3326 arm: Add Neoverse N1 processor identification
>>>> 858c0be8c2 xen/arm: Enable CPU Erratum 1165522 for Neoverse
>>>> 1814a626fb xen/arm: Update silicon-errata.txt with the Neovers AT erra=
tum
>>> The processor is quite new so may I ask why we would want to backport o=
n older Xen?
>> 4.14 at least would be good as it is the current stable and N1SDP is sup=
port in Yocto which is based on 4.14.
> While I understand external project are often based on stable release, I =
don't want to always backport errata. Some of them are quite involved and t=
his is a risk for others.
>=20
> In this case, the erratum has already been implemented for other processo=
rs. So the risk is minimal.
>=20
>> But as the official one will be on next Yocto release this would be ok t=
o consider only 4.14 here.
>=20
> 4.14 only would be my preference.

This is ok for me if we have all those only in 4.14 (errata and FP/SIMD).

Cheers
Bertrand


