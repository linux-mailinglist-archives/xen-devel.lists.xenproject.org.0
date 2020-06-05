Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F5D1EF846
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 14:48:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhBlP-0006uA-Bl; Fri, 05 Jun 2020 12:47:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r6m=7S=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jhBlN-0006u5-LN
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 12:47:57 +0000
X-Inumbo-ID: c7304f6e-a72a-11ea-ba62-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::605])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7304f6e-a72a-11ea-ba62-bc764e2007e4;
 Fri, 05 Jun 2020 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mteM1wNltbXTw5kY/XIrXv2xFQSiYbFD/2Hznhk6rPY=;
 b=eStDKL9+9e0UVGIuGZiIfkuyk4fqTngiISf/FULrW0+fvy/erukWZWO2b9KIGtFVXNbObser6bYn7izTJFKccBpQHiKrZadGRXyZHov4mNUT69FwQY8dWGBtLP+3LgqisVHp1uSTmXVQkAjnrrPWxeCQvl+VPwCjeuMHNDwZK3I=
Received: from DB6PR0601CA0016.eurprd06.prod.outlook.com (2603:10a6:4:7b::26)
 by VI1PR08MB3677.eurprd08.prod.outlook.com (2603:10a6:803:7f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 12:47:54 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::6c) by DB6PR0601CA0016.outlook.office365.com
 (2603:10a6:4:7b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Fri, 5 Jun 2020 12:47:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 12:47:53 +0000
Received: ("Tessian outbound 3e82c366635e:v59");
 Fri, 05 Jun 2020 12:47:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51fbe6779753dcb4
X-CR-MTA-TID: 64aa7808
Received: from 0fa81f2ceb15.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B6F749F8-E2BB-4989-BA02-08061816C785.1; 
 Fri, 05 Jun 2020 12:47:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0fa81f2ceb15.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Jun 2020 12:47:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSmk2dKhLsCYElS9Bn4uLEwRd9u8iNz4xCtpODzblBe19kWWSRcQYeePNoP9nuApKreHtwZSoJZMAnSa5eurkTboADCFNeOl+PYnVv0aaCPm0Oiqljeh6+bgcJWX8ghZMUrsJwdOw39MGEpRHSrb1wF3F6zPWdqcWTdqmfSL+2wRWW6v/NsoiOYwf9TR3JGJzsiBdVYoZJ0HN+0dvkAFTTh/T7Rh6qQRTX6QuGBBqnXH7i+5NJLc8/xrPFzPFJ/V/Yl2opAWIbwmJ73+oRZZrv34Cx2s0kWqPBvNjg9Nf2Gd5KCoBVYq+6CPeA5OzXDXNKjvNg3mAozF99opIykUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mteM1wNltbXTw5kY/XIrXv2xFQSiYbFD/2Hznhk6rPY=;
 b=EsJWRhVKAcyCqM5dygUQTFD1sQM354LTmi5kigDrMn39v58f5hcFyTY7kzV8SfeBwlTeFgtDUDXo+xn8qcyhTFazDoVS0ejLp27iOVSfSfbCvayJXMgqC/tZGnaDWHabnmuSU3+Sj/jhaGXhAokPnRdD2g9x92LTetPz8Jl74NLhts7AOg4V/G6yGm0zvqoMUYf90ft9Aza/VKDiMcokwxAtSu6u0pWs9ohWWEineClNvBd/0/pVnSu0+NB9H9Lhm/75MpZOspMLr0AENNBc5xonOqj26czoiSQnGtntmKs68q7BzLiCSUtF9H5hwkZT4JH5oGNcTNrhesXkXZmzlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mteM1wNltbXTw5kY/XIrXv2xFQSiYbFD/2Hznhk6rPY=;
 b=eStDKL9+9e0UVGIuGZiIfkuyk4fqTngiISf/FULrW0+fvy/erukWZWO2b9KIGtFVXNbObser6bYn7izTJFKccBpQHiKrZadGRXyZHov4mNUT69FwQY8dWGBtLP+3LgqisVHp1uSTmXVQkAjnrrPWxeCQvl+VPwCjeuMHNDwZK3I=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3868.eurprd08.prod.outlook.com (2603:10a6:10:32::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Fri, 5 Jun
 2020 12:47:46 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 12:47:46 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: CodeWiz2280 <codewiz2280@gmail.com>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEAgAAP9wCAAAJxgIAAEuGAgAAfEwCAAGmFAIAAh2UAgABV34CAAFCtAIAAAUSAgAADZQCAAAGKgA==
Date: Fri, 5 Jun 2020 12:47:46 +0000
Message-ID: <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
 <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
 <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
 <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
 <8C39F9D0-8351-4671-9A39-D5D4BFF02BD6@arm.com>
 <3ff17aa9-0aae-d598-40ce-4e90d4e50cc7@xen.org>
 <00E14EAD-BD23-4A3A-872E-0C47C26B7B41@arm.com>
 <c2466674-a56e-08a4-7f3f-2438d5565953@xen.org>
 <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
 <da23ecc8-60f0-8a26-58d5-ea692dcf0102@xen.org>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
In-Reply-To: <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c1e1e56e-fd8f-486e-0aed-08d8094eaa28
x-ms-traffictypediagnostic: DB7PR08MB3868:|VI1PR08MB3677:
X-Microsoft-Antispam-PRVS: <VI1PR08MB36770E746ECDFEDDCDA1987B9D860@VI1PR08MB3677.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
x-forefront-prvs: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: CEA0K4L8rLGpgex7wKHPW1A8zdY/8RBOf9NoAHL3akQ5DujtK9AuAYZA9Rp+aVMe3OwIKmPz0nHmxLviEgo7mo05dKBFBA9nszjeR4R0ZsUL/L0taW7pPfJai8S5n96Thzt5OgHaesXX7YZQrcI1yFeIlNIK9knXcO9fgnzPv5peJduyXllI0vg33r4x9fhMfBh9qUGpdKA/hJ/TPOME9ngMxqZirQRbwFQ3/xQzSxU2EfxlIPqYBlzcikXD2Q2novG3xBksLPmCVLz11VCzRDGdSVvRmga1WAWICLKi9KBLPH1u9mDYSvCw8LQpM2NYKRMgNUVxSLKJw3QhgjIaNA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(54906003)(6486002)(71200400001)(5660300002)(2906002)(2616005)(3480700007)(316002)(36756003)(86362001)(6916009)(33656002)(66946007)(26005)(83380400001)(66476007)(4326008)(66556008)(186003)(76116006)(66446008)(64756008)(8676002)(8936002)(91956017)(7116003)(53546011)(6506007)(6512007)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: HsTh1RVkVD4WD7/2XVo4sj2WpF98m60yOqK937Min+Tt598yhrnrjmJUTuzXi8+r+1iAo9/ITGUd5oU9g7DLJDji2XttJESQqufvmfKDtVxVT0xsHKUQ596RtF7GBZuD5ndlXhtkQUfu2WlS6Asrsn6CTEMqmcrIhmezx3RHE35M6venlaHJ9DqWpITPlkgqDk7wm2AoV3XGHPYbb7Ksega/fo9+QGAdo5aftFI8d8EPJDiEf0NA7iR94Lun9GTDYTDA81R2LcFptKJxO40ZeUa9cFv/f9fDD2Ym9I6/VUtuteeHymNcCsOjJfQju55tX4YyjCoAcxV/YwxmVzaFK0opnjWJrTB5xbH5SZXuL9E6UvH8ljHx5/NDnsZ26L68FfuVJDdD761O1j9FBjTKEYLZltvQk4CJ69xXF5Zl9IuVErZpoE4bFHUDHHNsT2WhYtMkGNjJjnOvdoXmilhoDMjhSRBNDXEDSt5kaeyadRl/UU/dUmn25v90s/JH1UBD
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A8A27425B774E5429B8DDBF26CB587A8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3868
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966005)(70206006)(186003)(2906002)(81166007)(82740400003)(6512007)(36756003)(316002)(53546011)(6486002)(47076004)(336012)(356005)(86362001)(5660300002)(33656002)(6506007)(82310400002)(478600001)(54906003)(8936002)(70586007)(8676002)(6862004)(26005)(3480700007)(4326008)(2616005)(83380400001)(7116003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 39f7cb6f-8904-4bc2-beff-08d8094ea5bd
X-Forefront-PRVS: 0425A67DEF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UrR5iBxtppLF/tYBRRzdK8dXmcXGNnkqmi/+HnInPsUx+yi7MiahM2H+v1/V7Y44vZfckUiMqeJIlF2uYj5YKcVmbL3i3Tl7Ysh2EkhRO/LmSbgPmUgmwXHz0rvmOqldAfZ01PixPX5rRG/bamsr5qV1gBKPd8VwPKTAB4jA4nRd7x1HvYzjGcQpaM/eBJ290QNcJiiYKPHKvbg+USSsvYZFytgmI75G4RdlSmBlaw1wedwFOx6hygwyj8u1hBVVsboPBXZE4D0ZxySjaOnFuV7h3egvn57e19FZHH/aTwBQfAzk6vAzXlhxbtRWgHe+tfIecUgX51uvMZYms+ev92OSY4VSId53II/jzFxvXtdM182soT8kVo8UprqGBio1e1bhkkRZpvF8JMhNJV8Qxw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 12:47:53.9705 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e1e56e-fd8f-486e-0aed-08d8094eaa28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3677
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



> On 5 Jun 2020, at 13:42, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>=20
> On Fri, Jun 5, 2020 at 8:30 AM Julien Grall <julien@xen.org> wrote:
>>=20
>> Hi,
>>=20
>> On 05/06/2020 13:25, CodeWiz2280 wrote:
>>> The Keystone uses the netcp driver, which has interrupts from 40-79
>>> listed in the device tree (arch/arm/boot/keystone-k2e-netcp.dtsi).
>>> I'm using the same device tree between my non-xen standalone kernel
>>> and my dom0 kernel booted by xen.  In the standalone (non-xen) kernel
>>> the ethernet works fine, but I don't see any of its interrupts in the
>>> output of /proc/iomem.  I'm not seeing them in /proc/iomem when
>>> running dom0 under Xen either.  When booting with Xen I get this
>>> behavior where the ifconfig output shows 1 RX message and 1 TX
>>> message, and then nothing else.
>>=20
>> I am not sure whether this is a typo in the e-mail. /proc/iomem is
>> listing the list of the MMIO regions. You want to use /proc/interrupts.
>>=20
>> Can you confirm which path you are dumping?
> Yes, that was a typo.  Sorry about that.  I meant that I am dumping
> /proc/interrupts and do not
> see them under the non-xen kernel or xen booted dom0.

Could you post both /proc/interrupts content ?

Cheers
Bertrand


