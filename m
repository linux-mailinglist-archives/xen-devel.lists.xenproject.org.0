Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D31FAA94
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 09:57:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl6ST-0001fX-SZ; Tue, 16 Jun 2020 07:56:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfkc=75=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jl6SS-0001fS-8m
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 07:56:36 +0000
X-Inumbo-ID: e59aa394-afa6-11ea-bb8b-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e59aa394-afa6-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0Q5tkCE0pj0ucWbcV/dZjTLWhRBR8Y1d9il8nUHDoA=;
 b=ib7vBZStZsAmXZHS2MuBNcjQ/aI05Ng0dgCIXor8lOnz7QVJHk9Mp0yG/m/maqq/rkTSXXYsnLDz6QF1P+JKaYUz/yhrL4pOyscsjwetkLYtR3ZadKgUTSu0aMl4E9g3xQDrTP0OAh2nWxibIUVqdW0H57siJP8oR6cX3cP8PWY=
Received: from DB6PR0501CA0020.eurprd05.prod.outlook.com (2603:10a6:4:8f::30)
 by DB6PR0802MB2152.eurprd08.prod.outlook.com (2603:10a6:4:83::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Tue, 16 Jun
 2020 07:56:32 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::13) by DB6PR0501CA0020.outlook.office365.com
 (2603:10a6:4:8f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Tue, 16 Jun 2020 07:56:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Tue, 16 Jun 2020 07:56:31 +0000
Received: ("Tessian outbound 79611f28bf50:v59");
 Tue, 16 Jun 2020 07:56:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce21aba53b16ad50
X-CR-MTA-TID: 64aa7808
Received: from 853d4a4e57f0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FF135FD7-B10A-46AF-86C1-26802F7EF362.1; 
 Tue, 16 Jun 2020 07:56:26 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 853d4a4e57f0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Jun 2020 07:56:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=No708oeQx5aVJdK2VoGxlQ5TuTAF9BFsSwZTGQKdLENIZh5a9tAeXBvhMqIsjYsV3QggpJOVi6CrJPIj5KSqqkkMQ/BQnvA2mlpiRVBWp2RIA+jdhuSGW4qs8q43J8EZTh3xSfP8+H9ZhYN2wOB12cAvV7HvuSvh7s8KMM0jk63bFm04ZSEaarock+jkHni9VmgT6xMrkXWWOkSpTzUys4On/UVdcq7Ih1LJpvsXYTpvEjo5fdbTEssTk2hVTNco/3aVnS4IRVqu3SOC4IvWhjV4uWYm/P6y44Pmi5HGU6cJspdgUveMVcV9bbcVUrnUe/YVAMmfhfyFkVxfbOcxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0Q5tkCE0pj0ucWbcV/dZjTLWhRBR8Y1d9il8nUHDoA=;
 b=nl5G+xa473vxW/iCarKs0yzglRmZM0FdF+zjjR3S7Kd8an0/VL/zApvPRVH/JdHMuv0E3FSpC0OnuG10LC3P64yyyazcdhjQPKOguI+3T7mJmhIqYGEXQYzp1nQg2FDaQQSbiiaJIqLbpA+gfC8zY2DIOiZhuvH+JaxQ3DK9YN4d/SJo5nxIhrZkEt/RN9a13jvK+Kx3217F8Ncfg+X/ZdLTmW5wuUY+BUh00IriYiUtQQE4n4v053oLE2rt2an3b1sQf3XDttYv+QFNhYxkQzmvF5bQ6qCZVlrD/OH76ggJJ2ky1v7hZBKa8kFgLb0HaB5g4RBTnVvF+JQKFvnWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0Q5tkCE0pj0ucWbcV/dZjTLWhRBR8Y1d9il8nUHDoA=;
 b=ib7vBZStZsAmXZHS2MuBNcjQ/aI05Ng0dgCIXor8lOnz7QVJHk9Mp0yG/m/maqq/rkTSXXYsnLDz6QF1P+JKaYUz/yhrL4pOyscsjwetkLYtR3ZadKgUTSu0aMl4E9g3xQDrTP0OAh2nWxibIUVqdW0H57siJP8oR6cX3cP8PWY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3179.eurprd08.prod.outlook.com (2603:10a6:5:25::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23; Tue, 16 Jun
 2020 07:56:23 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 07:56:23 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEAgAAP9wCAAAJxgIAAEuGAgAAfEwCAAGmFAIAAh2UAgABV34CAAFCtAIAAAUSAgAADZQCAAAGKgIAAJpOAgABE7QCABAZcAIAAQRIAgAA9oACAAXYtAIAAD3sAgAAFaoCAABUzgIAAB/uAgAAD1ICAAdWTgIAHsRIAgAAmsACAAK5FAA==
Date: Tue, 16 Jun 2020 07:56:23 +0000
Message-ID: <0A1E5483-1D34-4CA4-9161-09E2F47B3D5C@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
 <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
 <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
 <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
 <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
 <03607739-A4FF-486A-899A-F5F36870225A@arm.com>
 <2ec6255c-9d28-92e7-bd0a-59edb9fc078a@xen.org>
 <6033f9cecbf10f50f4a713ce52105426@kernel.org>
 <CAJ=z9a1k606A+sA467eY8iPuHnptMUFzxEFithpe=JKHogjt0g@mail.gmail.com>
 <CALYbLDjF8_eoNB_pSfbD73LkC3Ppyxpi0MxHgtS5y_wc-TVfzQ@mail.gmail.com>
 <alpine.DEB.2.21.2006151426160.9074@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006151426160.9074@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c12478de-6dae-4a6b-a316-08d811cac887
x-ms-traffictypediagnostic: DB7PR08MB3179:|DB6PR0802MB2152:
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2152B5C4954C639F531CDF229D9D0@DB6PR0802MB2152.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04362AC73B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ByQgBN9z8APk4AKoN4Gq40ZtE5YoRBm6F5+PE2Bn3ZthCtOIZFIbDRg6P7PmvDWrYGra3ZITq5qzqYqgYOOjH4haV3lNstJGJv7/VQYu5rAaQHyTuJVRx+Mwgf0vsV05ETU4FBl4GeGzfH60vDMSom6Fu6/2ehH/XBFhEIq8H+ttIB2akqRjhhQR5RgeoVW0HK5DlYWsGxbBZJPg872MI2A2f5/qaE35MJJZz/IuoILgK1PW53ZxEdLbPjh/jVz0vdyhgMNgcy9dR5nmUs/4XiebuCWmbqTelFRhu7u+ZtYXs1/2ugtFaMNIgtAwXADM0Xnad7IxID6Ts7uXJVoyHw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(66446008)(64756008)(71200400001)(83380400001)(91956017)(26005)(478600001)(6486002)(86362001)(33656002)(2906002)(316002)(66476007)(3480700007)(76116006)(66556008)(8676002)(2616005)(5660300002)(6916009)(8936002)(54906003)(53546011)(6512007)(6506007)(186003)(36756003)(66946007)(4326008)(7116003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: tafEKj7hNBQwVko2UNKFWgmhlJwQmOcon/eo/x0fA/s3nx4kLVGg0isYnrqO00HijGWivE5AyUSsRVEbm4ui0KayZZvIzFeuYWLoU3U6npOE8wqqqHl6nsGR6Hm30PCK97pRITQpFGAYLqBFuNP033Dk7KejbSFqASid1rrDBX25MvQdEW3bjWUoLJBUBFIE3iU5ILBXEwW4Z3+bwZ+0XDMHF3HL/sK3D+CCsUXHph+nr6J6wJqeW8k5osaRikniAiMs4PLlaxHso173vBrsCMWGSBvEu7QBtZZj/lePj7gBv0LLgJ6Hgtr3o1qt89QqGBXJc+l3DlXNXtqivNNS5g+C89ou01Yv0eWUgzXue4yBeZFg4eEZFGmfP4ipNalBB0QwqJH/OUOcixXthOLDiZ6Af39RcDh++AsFPe7PqAS7GvgltYxjWB5Fi71nL05KNU3tm7D4jYfAfbLk9sgrKhul6CE5SWpN5q1Fi07J6e8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <74294602DB3DA949A7977FE5B9978340@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3179
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966005)(478600001)(7116003)(26005)(186003)(2906002)(70206006)(36756003)(5660300002)(70586007)(4326008)(6512007)(82740400003)(6862004)(3480700007)(8936002)(82310400002)(356005)(336012)(33656002)(54906003)(81166007)(2616005)(86362001)(8676002)(47076004)(316002)(53546011)(83380400001)(6486002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6aa98f8c-be6f-4524-2e26-08d811cac372
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s70H4iDyFKRDsHVGpyQdRGMcOBb3RahioMbUYt4KhHyMEXi4dJ0+pYgfe6V8MRgYlSF0OGNEXEje4beaIKRMiEf6MB/xp8oZzSuVjTpxUZqg/eUb39oFS7nSbybKgYMjiTQJDPKdr/WA3+jpxM1yxOGAiK1V8/805BtT+7HJ1tOi93xfDWUrhpWBrBzFQnIxl12DMpFXCPy3JrIU0k83nTlIto6HtpMjvXbkl4Sa4914Efbwl4QMBJtvh3l7oTlzlGTV6o/MMW/rdD9NyZquiLjiUqkOBiW6at4HPnDB0IQTg7qRDUiLjlP1hScfRTOlZIYjtvNqTbmm5prXz4w3Rr2EV9rMTFpXaN83b6t8pAKhBSxVu4bX2B+BbMmngdZSN46r4u2YeEmXkQRJwi8EMQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2020 07:56:31.8243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c12478de-6dae-4a6b-a316-08d811cac887
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2152
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
Cc: Marc Zyngier <maz@kernel.org>, nd <nd@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 CodeWiz2280 <codewiz2280@gmail.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 15 Jun 2020, at 22:32, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 15 Jun 2020, CodeWiz2280 wrote:
>> On Wed, Jun 10, 2020 at 5:46 PM Julien Grall <julien.grall.oss@gmail.com=
> wrote:
>>>=20
>>> Hi Marc,
>>>=20
>>> On Tue, 9 Jun 2020 at 18:45, Marc Zyngier <maz@kernel.org> wrote:
>>>>> I was wondering if you heard about any potential issue with guest EOI
>>>>> not forwarded to the host. This is on TI Keystone (Cortex A-15).
>>>>=20
>>>> Not that I know of. A-15 definitely works (TC2, Tegra-K1, Calxeda Midw=
ay
>>>> all run just fine with guest EOI), and GIC-400 is a pretty solid piece
>>>> of kit (it is just sloooooow...).
>>>>=20
>>>> Thinking of it, you would see something like that if the GIC was seein=
g
>>>> the writes coming from the guest as secure instead of NS (cue the earl=
y
>>>> firmware on XGene that exposed the wrong side of GIC-400).
>>>=20
>>> Ah, I remember that one.  We used to carry an hack in Xen [1] for
>>> X-Gene. Thankfully they fixed the firmware!
>>>=20
>>> If it is a similar issue, then the firmware path would definitely be
>>> my preference.
>>>=20
>>> Thank you for the input!
>>=20
>> Thank you all for the information.  If I pull the changes to use the
>> maintenance interrupt for the X-Gene back into the latest build of Xen
>> then my issue with the Edge and Level interrupts is resolved.  My
>> ethernet and other devices work fine again for the Keystone in dom0.
>> Are there any concerns over operating this way, meaning with the
>> maintenance interrupt workaround rather than the EOI?  Is this safe?
>=20
> It should be fine, a small impact on performance, that's all.

Agree, this is safe but you will have an overhead (one context switch back =
to Xen on interrupt ack in Dom0 in your case).

>=20
>=20
>> Also, the latest linux kernel still has the X-Gene storm distributor
>> address as "0x78010000" in the device tree, which is what the Xen code
>> considers a match with the old firmware.  What were the addresses for
>> the device tree supposed to be changed to?  Is my understanding
>> correct that there is a different base address required to access the
>> "non-secure" region instead of the "secure" 0x78010000 region?  I'm
>> trying to see if there are corresponding different addresses for the
>> keystone K2E, but haven't found them yet in the manuals.
>=20
> I went through the old emails archive but couldn't find a mention of the
> other address, sorry.

I think there is no other address as even though there would be one the Sec=
ure status reported by the core would still say that you are running in sec=
ure mode.
I would really suggest to try to contact directly TI on that part to get an=
 official answer from them as they might have a workaround.

Cheers
Bertrand




