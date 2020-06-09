Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376921F3F50
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 17:29:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jigB4-0003Gf-1l; Tue, 09 Jun 2020 15:28:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmWh=7W=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jigB2-0003Ga-1n
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 15:28:36 +0000
X-Inumbo-ID: e1432528-aa65-11ea-8496-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::62c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1432528-aa65-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 15:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rwg75vUC0/I6nbKYzO5i8itbwS3p9Nh1ik91B+RMI8M=;
 b=NYAoMP7Wm6OrGah1BQ4w3KkX2emVojUruxL+X/aGFRO384f8HsP6v658o3BNH1GKueZGTjnECTb9L3qn7HbqxdIO899l8eMzckFeNT66E70z/H6RhKViufwxYKIQEyfboLBPnkXE8Kx29hx/ltuZp/qrdEGSSd6++qGjvEf3Rr0=
Received: from AM6PR08CA0021.eurprd08.prod.outlook.com (2603:10a6:20b:b2::33)
 by VI1PR0802MB2143.eurprd08.prod.outlook.com (2603:10a6:800:9a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 15:28:32 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::b7) by AM6PR08CA0021.outlook.office365.com
 (2603:10a6:20b:b2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Tue, 9 Jun 2020 15:28:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 15:28:31 +0000
Received: ("Tessian outbound fb809da9b456:v59");
 Tue, 09 Jun 2020 15:28:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c4c5c455c9f8000
X-CR-MTA-TID: 64aa7808
Received: from 616bde8469d5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D4C091B4-5752-4DB6-9002-37CCDA29871D.1; 
 Tue, 09 Jun 2020 15:28:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 616bde8469d5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Jun 2020 15:28:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCo3ymVjfOF2d0pByAIQLYYsXfs0gYpARM2sSSD4b5/mYH2t4Y6jiBra1pZxeN2mqX2Fws8ggQnWgyKOWuVqEjakWl1CjZLyCnKjXjznsY2m6C8ftqfZIMWW1t37pWOcA0r2UcMkdtEmwZAfx2pZw854+vL0WtE5ughbP2rXJBvdB7vgmzgL0NdaUJCNyxNiRDUjdmGX5PUoNzz4gfu7fZnTitVxZaSzneUpNL7uXC5N+3dcNLJCDLyPTPb4pz9zunndulpYAHkLTdWaaLiRN7UekIfU7mspZDqCxKIhWyZnQuyXQn/P1r4KMbM1RvJc/v9z4h5J3gKeaEH3CLD8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rwg75vUC0/I6nbKYzO5i8itbwS3p9Nh1ik91B+RMI8M=;
 b=YTzcIxNMgpj9ZMTS5DnXsmPd+bl05jq9Q7eK4lwsilsD+MelJE6fN13iwjkEZUHha5Rpk8CQJJaWytBCJY4fLXYSRroaeMi1FNObRvecw5brLfD+gCmLGdr6gQKOE+8npCwutrFI2iPFiZ/12LKaBluqgBNQM1SFqASZu/InUU1JfVpDrR7wk40zL6Ix+oIhRcjJcsUq7araguoP5gHLMShC81ph1wQr8hD+QXK/AmNRY1ZiBbhMPByRlAej9Akmk++nJ922S6IyIpjwXn+dReyKmdntIUCmnZ60DY5ZHxnpy8RLn5Vl11nVZaR3IfEFcJnvVQ2XrtK/FL/+m4gKbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rwg75vUC0/I6nbKYzO5i8itbwS3p9Nh1ik91B+RMI8M=;
 b=NYAoMP7Wm6OrGah1BQ4w3KkX2emVojUruxL+X/aGFRO384f8HsP6v658o3BNH1GKueZGTjnECTb9L3qn7HbqxdIO899l8eMzckFeNT66E70z/H6RhKViufwxYKIQEyfboLBPnkXE8Kx29hx/ltuZp/qrdEGSSd6++qGjvEf3Rr0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3163.eurprd08.prod.outlook.com (2603:10a6:5:1e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Tue, 9 Jun
 2020 15:28:25 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 15:28:25 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: CodeWiz2280 <codewiz2280@gmail.com>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEAgAAP9wCAAAJxgIAAEuGAgAAfEwCAAGmFAIAAh2UAgABV34CAAFCtAIAAAUSAgAADZQCAAAGKgIAAJpOAgABE7QCABAZcAIAAQRIAgAA9oACAAXYtAIAAD3sA
Date: Tue, 9 Jun 2020 15:28:24 +0000
Message-ID: <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
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
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
 <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
 <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
In-Reply-To: <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: de72ca91-debd-4022-09d6-08d80c89c47f
x-ms-traffictypediagnostic: DB7PR08MB3163:|VI1PR0802MB2143:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB214358D46DF7A1965A4061779D820@VI1PR0802MB2143.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: HYDB47nZf4vO3b4lhbzLz3L6xSRAYS/B6A1v7+gVX1WqCBXggbienBpCTzky9KOZJ0KKS/K6ILloMjacFHyTFeQv9mQN7mF2SGJ9LEUSK6yUBdRR9CAmlW89w3vpTT5FxZLoD+DyitK1/oTf96dO47niJ6p3Ny/JjIHep6IXGz2pWrnAHkSUZ+Zr24FFSLvuZ9F8AOydQK/x7E2HKffdIpAC+yp1JhmJmrX65RplASsGsAMP/aLFFaMqWBDqEn8+Khjr1vIwPc1GksUzAt5agBwvi4hZVgxZK15058NDkxNaVHyqKwJSkTf94sEf5DGnqs35K/R+9kW2//s6p+3tbA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(5660300002)(2616005)(8676002)(71200400001)(66946007)(8936002)(76116006)(2906002)(64756008)(36756003)(91956017)(66476007)(53546011)(66556008)(6512007)(66446008)(4326008)(54906003)(478600001)(6506007)(6916009)(6486002)(7116003)(3480700007)(83380400001)(316002)(26005)(86362001)(33656002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Q60wZDVrI5JpFEK8WCG3BCQY6Ke17dO0/qiS6y39KcQinygZlSUxGRlqbASS36NZwts2ULkiWh5SufHaOKGiG1cotrL/clVDPLK76EzALnnmz3uQCXuO9jsHx2oXj9+mmluTJji3L9k/G4btFz7FGQ0SLHWHvM9QnaCBVSzzHOFGrpl2U5fd4TiH0fL9A0nKfbm7I6xC/SEvFJvQEvbeJehPBCc2ra98zotUN83p7/MZ/BesL1MpA9daid6QTzS6hsKu7ClwSzQT12hS2grRTqVbJoMBu5BfoN/CBa9B6zwhHOR3UHv+ICdxLhEUZnkZIW4ZxsHH6bOvebfnaubYH0HE3COO5ViKo5AzarYoQ/7ctC3yhLaBvlNuQdHZrkpuePcdfifQVxLORPxnUcEuTVlIJo9aWeU5J6/ucGEoe7r8Nn+tl47Hf+y4wuq/Cg6EW4tLDHyHcdS4r0Db9poI+iKcKv9NunVsHhttzWIUwJE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FACC76E876B9E24099E5C90F8810B955@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3163
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(4326008)(70586007)(6486002)(83380400001)(70206006)(47076004)(36906005)(82310400002)(8936002)(54906003)(316002)(86362001)(82740400003)(5660300002)(3480700007)(81166007)(36756003)(356005)(478600001)(2616005)(7116003)(26005)(186003)(53546011)(6506007)(8676002)(336012)(6512007)(6862004)(2906002)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 169dd153-347d-4c5c-4479-08d80c89c068
X-Forefront-PRVS: 042957ACD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8P4NEfwCm1tW0kiXEOJ6MtRhOm5HHkavz5DclxfuQvixxjM9qTwnAKNKWU6pl/6hag767X0meNcRD6k/ejM5U4h3k8mYBjV2eDBDTfer0Fz7NLh3+Q9wRqF4EBHxZNfZt1a0UpqeAcnVv8Q1e4pWzpxhkZqtrOe4PZ1s7dcJaObo0ge/RFpvZ/nQXQ/YccY8YTDlzOv0cBcyZ83qw+zznQgY22xghTAPThf418tAmTHGrWKM8Y9orGkpzkFcV+KCjt3toHGwKcq5evxq/TlOLjQYMHz9XymdRwxaLLwjlV7ufAgdB1WN669imm4qMRHFzXuCVLWfz+4Q59irDD8sAaOn0c8ZrdwiennFFVmDDZMNULz9DXXhehBFMpDK4vfhwkWLT6BgAeR/R8YiSh9oqA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 15:28:31.8178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de72ca91-debd-4022-09d6-08d80c89c47f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2143
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

> On 9 Jun 2020, at 15:33, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>=20
> There does appear to be a secondary (CIC) controller that can forward
> events to the GIC-400 and EDMA controllers for the keystone 2 family.
> Admittedly, i'm not sure how it is being used with regards to the
> peripherals.  I only see mention of the GIC-400 parent for the devices
> in the device tree.  Maybe Bertrand has a better idea on whether any
> peripherals go through the CIC first?  I see that gic_interrupt ()
> fires once in Xen, which calls doIRQ to push out the virtual interrupt
> to the dom0 kernel.  The dom0 kernel then handles the interrupt and
> returns, but gic_interrupt() never fires again in Xen.

I do not remember of any CIC but the behaviour definitely look like an inte=
rrupt acknowledge problem.

Could you try the following:
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -667,6 +667,9 @@ static void gicv2_guest_irq_end(struct irq_desc *desc)
     /* Lower the priority of the IRQ */
     gicv2_eoi_irq(desc);
     /* Deactivation happens in maintenance interrupt / via GICV */
+
+    /* Test for Keystone2 */
+    gicv2_dir_irq(desc);
 }

I think the problem I had was related to the vgic not deactivating properly=
 the interrupt.
This might make the interrupt fire indefinitely !!

Regards
Bertrand

>=20
> On Mon, Jun 8, 2020 at 12:13 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>=20
>>=20
>>=20
>> On Mon, 8 Jun 2020, CodeWiz2280 wrote:
>>> It actually shows only 1 interrupt for any of the devices in that list
>>> (e.g. spi, ttyS0, ethernet) so you're probably right on the money with
>>> it being an interrupt acknowledge issue.  Any help you can provide is
>>> greatly appreciated.
>>>=20
>>> On Mon, Jun 8, 2020 at 4:40 AM Bertrand Marquis
>>> <Bertrand.Marquis@arm.com> wrote:
>>>>=20
>>>>=20
>>>>=20
>>>>> On 5 Jun 2020, at 20:12, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>>>>>=20
>>>>> On Fri, Jun 5, 2020 at 11:05 AM CodeWiz2280 <codewiz2280@gmail.com> w=
rote:
>>>>>>=20
>>>>>> On Fri, Jun 5, 2020 at 8:47 AM Bertrand Marquis
>>>>>> <Bertrand.Marquis@arm.com> wrote:
>>>>>>>=20
>>>>>>>=20
>>>>>>>=20
>>>>>>>> On 5 Jun 2020, at 13:42, CodeWiz2280 <codewiz2280@gmail.com> wrote=
:
>>>>>>>>=20
>>>>>>>> On Fri, Jun 5, 2020 at 8:30 AM Julien Grall <julien@xen.org> wrote=
:
>>>>>>>>>=20
>>>>>>>>> Hi,
>>>>>>>>>=20
>>>>>>>>> On 05/06/2020 13:25, CodeWiz2280 wrote:
>>>>>>>>>> The Keystone uses the netcp driver, which has interrupts from 40=
-79
>>>>>>>>>> listed in the device tree (arch/arm/boot/keystone-k2e-netcp.dtsi=
).
>>>>>>>>>> I'm using the same device tree between my non-xen standalone ker=
nel
>>>>>>>>>> and my dom0 kernel booted by xen.  In the standalone (non-xen) k=
ernel
>>>>>>>>>> the ethernet works fine, but I don't see any of its interrupts i=
n the
>>>>>>>>>> output of /proc/iomem.  I'm not seeing them in /proc/iomem when
>>>>>>>>>> running dom0 under Xen either.  When booting with Xen I get this
>>>>>>>>>> behavior where the ifconfig output shows 1 RX message and 1 TX
>>>>>>>>>> message, and then nothing else.
>>>>>>>>>=20
>>>>>>>>> I am not sure whether this is a typo in the e-mail. /proc/iomem i=
s
>>>>>>>>> listing the list of the MMIO regions. You want to use /proc/inter=
rupts.
>>>>>>>>>=20
>>>>>>>>> Can you confirm which path you are dumping?
>>>>>>>> Yes, that was a typo.  Sorry about that.  I meant that I am dumpin=
g
>>>>>>>> /proc/interrupts and do not
>>>>>>>> see them under the non-xen kernel or xen booted dom0.
>>>>>>>=20
>>>>>>> Could you post both /proc/interrupts content ?
>>>>>>=20
>>>>>> Standalone non-xen kernel (Ethernet works)
>>>>>> # cat /proc/interrupts
>>>>>>          CPU0       CPU1       CPU2       CPU3
>>>>>> 17:          0          0          0          0     GICv2  29 Level
>>>>>> arch_timer
>>>>>> 18:       9856       1202        457        650     GICv2  30 Level
>>>>>> arch_timer
>>>>>> 21:          0          0          0          0     GICv2 142 Edge
>>>>>> timer-keystone
>>>>>> 22:          0          0          0          0     GICv2  52 Edge  =
    arm-pmu
>>>>>> 23:          0          0          0          0     GICv2  53 Edge  =
    arm-pmu
>>>>>> 24:          0          0          0          0     GICv2  54 Edge  =
    arm-pmu
>>>>>> 25:          0          0          0          0     GICv2  55 Edge  =
    arm-pmu
>>>>>> 26:          0          0          0          0     GICv2  36 Edge
>>>>>> 26202a0.keystone_irq
>>>>>> 27:       1435          0          0          0     GICv2 309 Edge  =
    ttyS0
>>>>>> 29:          0          0          0          0     GICv2 315 Edge
>>>>>> 2530000.i2c
>>>>>> 30:          1          0          0          0     GICv2 318 Edge
>>>>>> 2530400.i2c
>>>>>> 31:          0          0          0          0     GICv2 321 Edge
>>>>>> 2530800.i2c
>>>>>> 32:         69          0          0          0     GICv2 324 Edge
>>>>>> 21000400.spi
>>>>>> 33:          0          0          0          0     GICv2 328 Edge
>>>>>> 21000600.spi
>>>>>> 34:          0          0          0          0     GICv2 332 Edge
>>>>>> 21000800.spi
>>>>>> 70:          0          0          0          0     GICv2 417 Edge
>>>>>> ks-pcie-error-irq
>>>>>> 79:          0          0          0          0   PCI-MSI   0 Edge
>>>>>> PCIe PME, aerdrv
>>>>>> 88:         57          0          0          0     GICv2  80 Level
>>>>>> hwqueue-528
>>>>>> 89:         57          0          0          0     GICv2  81 Level
>>>>>> hwqueue-529
>>>>>> 90:         47          0          0          0     GICv2  82 Level
>>>>>> hwqueue-530
>>>>>> 91:         41          0          0          0     GICv2  83 Level
>>>>>> hwqueue-531
>>>>>> IPI0:          0          0          0          0  CPU wakeup interr=
upts
>>>>>> IPI1:          0          0          0          0  Timer broadcast i=
nterrupts
>>>>>> IPI2:        730        988       1058        937  Rescheduling inte=
rrupts
>>>>>> IPI3:          2          3          4          6  Function call int=
errupts
>>>>>> IPI4:          0          0          0          0  CPU stop interrup=
ts
>>>>>> IPI5:          0          0          0          0  IRQ work interrup=
ts
>>>>>> IPI6:          0          0          0          0  completion interr=
upts
>>>>>>=20
>>>>>> Xen dom0 (Ethernet stops)
>>>>>> # cat /proc/interrupts
>>>>>>          CPU0
>>>>>> 18:      10380     GIC-0  27 Level     arch_timer
>>>>>> 19:          0     GIC-0 142 Edge      timer-keystone
>>>>>> 20:         88     GIC-0  16 Level     events
>>>>>> 21:          0   xen-dyn     Edge    -event     xenbus
>>>>>> 22:          0     GIC-0  36 Edge      26202a0.keystone_irq
>>>>>> 23:          1     GIC-0 312 Edge      ttyS0
>>>>>> 25:          1     GIC-0 318 Edge
>>>>>> 27:          1     GIC-0 324 Edge      21000400.spi
>>>>>> 28:          0     GIC-0 328 Edge      21000600.spi
>>>>>> 29:          0     GIC-0 332 Edge      21000800.spi
>>>>>> 65:          0     GIC-0 417 Edge      ks-pcie-error-irq
>>>>>> 74:          0   PCI-MSI   0 Edge      PCIe PME, aerdrv
>>>>>> 83:          1     GIC-0  80 Level     hwqueue-528
>>>>>> 84:          1     GIC-0  81 Level     hwqueue-529
>>>>>> 85:          1     GIC-0  82 Level     hwqueue-530
>>>>>> 86:          1     GIC-0  83 Level     hwqueue-531
>>>>>> 115:         87   xen-dyn     Edge    -virq      hvc_console
>>>>>> IPI0:          0  CPU wakeup interrupts
>>>>>> IPI1:          0  Timer broadcast interrupts
>>>>>> IPI2:          0  Rescheduling interrupts
>>>>>> IPI3:          0  Function call interrupts
>>>>>> IPI4:          0  CPU stop interrupts
>>>>>> IPI5:          0  IRQ work interrupts
>>>>>> IPI6:          0  completion interrupts
>>>>>> Err:          0
>>>>> After getting a chance to look at this a little more, I believe the
>>>>> TX/RX interrupts for the ethernets map like this:
>>>>>=20
>>>>> eth0 Rx  - hwqueue-528
>>>>> eth1 Rx - hwqueue-529
>>>>> eth0 Tx  - hwqueue-530
>>>>> eth1 Tx - hwqueue-531
>>>>>>=20
>>>>> The interrupt counts in the standlone working kernel seem to roughly
>>>>> correspond to the counts of Tx/Rx messages in ifconfig.  Going on
>>>>> that, its clear that only 1 interrupt has been received for Tx and 1
>>>>> for Rx in the Xen Dom0 equivalent.  Any thoughts on this?
>>>>=20
>>>> This definitely look like an interrupt acknowledgement issue.
>>>> This could be caused by 2 things I remember of:
>>>> - front vs level interrupts
>>>> - a problem with forwarded interrupt acknowledgement.
>>>> I think there was something related to that where the vcpu ack was not=
 properly
>>>> handled on a keystone and I had to change the way the interrupt was ac=
ked for
>>>> forwarded hardware interrupts.
>>=20
>> Is there maybe some sort of secondary interrupt controller (secondary in
>> addition to the GIC) or interrupt "concentrator" on KeyStone?
>>=20
>> Or is it just a small deviation from normal GIC behavior?


