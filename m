Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 284CD1F41B6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 19:06:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jihhV-0005x1-Gf; Tue, 09 Jun 2020 17:06:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmWh=7W=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jihhU-0005wY-By
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 17:06:12 +0000
X-Inumbo-ID: 816c8cee-aa73-11ea-b343-12813bfff9fa
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.64]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 816c8cee-aa73-11ea-b343-12813bfff9fa;
 Tue, 09 Jun 2020 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROTFjDWmhBnCCOeV+iChPmj7xKuwbzclHrRQGgb0oYw=;
 b=eLADmza/xm1LTqcx0kXCqSVpAzsNFtMkdXlIGDbb4mDJ5tKfjJuFN8iCuB+gwTZRkQ8fkyyCbcbe6aEZxxyLAiTeh/6cCnSa46DQEJnn8WGfnWYIRw9whWk0VGaTL/koF58bQVFGmzEkwbeNew/lKo+ocMfkqvA6Nys0AR00zBc=
Received: from AM5PR0201CA0008.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::18) by AM0PR08MB4594.eurprd08.prod.outlook.com
 (2603:10a6:208:104::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 17:06:04 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::cd) by AM5PR0201CA0008.outlook.office365.com
 (2603:10a6:203:3d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Tue, 9 Jun 2020 17:06:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 17:06:04 +0000
Received: ("Tessian outbound 56dbe829191e:v59");
 Tue, 09 Jun 2020 17:06:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9faed8c8a8867f4d
X-CR-MTA-TID: 64aa7808
Received: from c5cd79efab43.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A514B9B1-D4F9-4203-BA81-20C74E043B22.1; 
 Tue, 09 Jun 2020 17:05:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5cd79efab43.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Jun 2020 17:05:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrtuHnSH4c3Lar1juExLlnQovkdFhuu57nSWqb5g2W3W5W6o/6k/MujHIA5g1Ce1i1Y1j2JBXBzhMBOuVKL2g04a3O9AAit1I4uCXsDbDgXtVkEwZeBqNgxzx/vdFXXiHv6BlurUXPVtHqhmyyMlRzcZ2vE3ywVliFfeVgs/0cNnt4X5waZCueXlQISgtvUDloA2iyu7pKW3Sx/+fhMECE4xSWspd8PWhW9lCTLEtN1Cpb0J3D/duUiGkV6iqJxwMlManyN8qADY1u1ldzJI8A6QUjynEoMwo8h6Q5sgqBtBig8oJLz/xfYRhlWyU8Y82jx8j1Xrdae1NT03VXp6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROTFjDWmhBnCCOeV+iChPmj7xKuwbzclHrRQGgb0oYw=;
 b=eofFkdSiCdL+HVMwQ9RJAwA7QQSUYJ9X+5iAsldDd8r0/2aDAHMjSmqz1OL8rHKErNVIjUKioY6n5VNsdYtz9fTAtPpC7gFXDWQgnMY7oQ6iVCn9GCyyqspaaGAWYmok9QfVojv30mHet4nhF8qmbzbxGKNzdusb9CQbsiwhbKjGLyTRzimQLzZzkkbjFWdFw1L4bAECNLZIqy8QUDHTSVA0qzEpStNMTr4vvTklL+ZKpOS7KFIrkgjDqBkCrpmga5tZlIR1YvEfPCif2TUuCXVNu9T+2XGzFMPcufjS3cErCVKFUygT3yqhnbgAE2Mv7hXEHyuk+Yf6pdlNvlCPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROTFjDWmhBnCCOeV+iChPmj7xKuwbzclHrRQGgb0oYw=;
 b=eLADmza/xm1LTqcx0kXCqSVpAzsNFtMkdXlIGDbb4mDJ5tKfjJuFN8iCuB+gwTZRkQ8fkyyCbcbe6aEZxxyLAiTeh/6cCnSa46DQEJnn8WGfnWYIRw9whWk0VGaTL/koF58bQVFGmzEkwbeNew/lKo+ocMfkqvA6Nys0AR00zBc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3594.eurprd08.prod.outlook.com (2603:10a6:10:4e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.23; Tue, 9 Jun
 2020 17:05:57 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 17:05:57 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: CodeWiz2280 <codewiz2280@gmail.com>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEAgAAP9wCAAAJxgIAAEuGAgAAfEwCAAGmFAIAAh2UAgABV34CAAFCtAIAAAUSAgAADZQCAAAGKgIAAJpOAgABE7QCABAZcAIAAQRIAgAA9oACAAXYtAIAAD3sAgAAFaoCAAAL0gIAAEuIA
Date: Tue, 9 Jun 2020 17:05:56 +0000
Message-ID: <06E3B839-BF8B-432D-89F7-3BBD464E4701@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
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
 <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
 <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
 <CALYbLDguWyVifXiCSGO8TdkvGO95YnYrLxXqnS5P_EBwk53O0w@mail.gmail.com>
In-Reply-To: <CALYbLDguWyVifXiCSGO8TdkvGO95YnYrLxXqnS5P_EBwk53O0w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6d2364ef-0fcb-4bc2-ba29-08d80c9764c3
x-ms-traffictypediagnostic: DB7PR08MB3594:|AM0PR08MB4594:
X-Microsoft-Antispam-PRVS: <AM0PR08MB459425964FA7EA1705CC68FF9D820@AM0PR08MB4594.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: I7SLrvIoixpSJUmPXpyk7V9G2MElHIVY92BZRbsYTJszXchgbT+StglzPoG5Gibz7hrrdQfG4nHn2PE25qaTsHOrsmkPRoMPAa6fw4bqj+VlgByHKkmln31u+A1ulISkLOJKRlXH101OI9HzGCu8oXRZz4tzm+t4fu+pJ2OHmC5K5daO6HFM5YJGL+vr4vylZnerWa+VmAP7dX8FpttzqZ1rpw/QwQl4SKqgkJ7lf5KzQIs2nl6yaBU/9qig+WXcAhCfN/89ob/nsFD3UssT/T3ePkJWhJtAcE+ZNYN06TFph+KWEzsqjlC15pRk8v6TucOQuYU2DRMxWFX3lRn76Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39850400004)(316002)(91956017)(76116006)(66556008)(71200400001)(53546011)(66946007)(66476007)(5660300002)(54906003)(66446008)(6506007)(3480700007)(4326008)(83380400001)(33656002)(2616005)(186003)(26005)(64756008)(8936002)(2906002)(36756003)(8676002)(6512007)(7116003)(6916009)(478600001)(6486002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: roolbyQNigRBYKpMjcadps/zOg3Af8B+1BdG1HxZZrAQzWKmYCkrZUxuVC29Ceac0030JG6p/V9OqlERBHNGTo8PFJIqzXAc70ftXJE6fFMtencuUyufEKKYIxM64bEHnlGsSU8tgAXUIcRupw2PpI1uPa8IAusUUfJm9e8N8m68ATCw/K3hrqmdRmmuL7vyaMGP6kuWCjf/7RU+shJQNUKKCrUFw5iehd6E7YpN9fm4N+DZYWR84hAEV4ZWTpr3ZOzsABfaJNvsL+5CWY34vFl73M5ojkS7vLJ+vopbG3t4H9WSeCEdX8uc+LDiHbQRwsQVlbI77TjabsRmuked1FfL/kTVIch6Y57/imWxHEAcdVYx7EmQoHStHn0AaH9w0Q9afiq9PpxGJVQ3ZgTKCPDzzckP63KBoabZEXM9qtEgIyCbBBlAvPDab4ScE2o/yA5BfcZf44PlWBfHuRv6jxAbV5qajO4MmbWpLqxDkNE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FEBC952EEFA01A44A564C06402EE0234@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3594
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(5660300002)(7116003)(6512007)(4326008)(33656002)(6486002)(2906002)(86362001)(6862004)(70586007)(36756003)(70206006)(478600001)(336012)(47076004)(36906005)(316002)(8676002)(83380400001)(82310400002)(6506007)(8936002)(81166007)(186003)(3480700007)(356005)(26005)(54906003)(82740400003)(53546011)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: cf06f19a-0b8d-477e-3a75-08d80c976078
X-Forefront-PRVS: 042957ACD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lJMdgxD10C0b2yxVs3Q0V0n5XFt5Z7oL+jVVIsG02FZI2rkCNPwfTVYO2VWwBT6YO1xqPo6S8PeyL8xZ+tNXdjFhM3hCgwjy2k4aPhwHeEmkBGnW7240Z5y9lbF4vNpUZdpGmjyae8sOkdGmC8vxMwReCybXqHoERU98jTQWyNIJIbG0lDNHdIpntrGZtOMXgya7n0IeoXlVP5hBli67bvmxsxHB9OxIFjDc6skoVp+6trReRCm3PAWWuaexXmOgaiDCYMnPGAPL3qbXt5IUtcpjjw4s8Cpf2hTvdiQBaW69vcV5YpD8hdtmJI344cFUnXGpgnbAgcyCXmEOFeWIFhZR3+nEgaSvBGtboB9K1KXEhPaeRPHqzqCPQIjl3N/dO8JV/UZ6zHb85byqp4HbTg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 17:06:04.2429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2364ef-0fcb-4bc2-ba29-08d80c9764c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4594
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



> On 9 Jun 2020, at 16:58, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>=20
> On Tue, Jun 9, 2020 at 11:47 AM Julien Grall <julien@xen.org> wrote:
>>=20
>>=20
>>=20
>> On 09/06/2020 16:28, Bertrand Marquis wrote:
>>> Hi,
>>>=20
>>>> On 9 Jun 2020, at 15:33, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>>>>=20
>>>> There does appear to be a secondary (CIC) controller that can forward
>>>> events to the GIC-400 and EDMA controllers for the keystone 2 family.
>>>> Admittedly, i'm not sure how it is being used with regards to the
>>>> peripherals.  I only see mention of the GIC-400 parent for the devices
>>>> in the device tree.  Maybe Bertrand has a better idea on whether any
>>>> peripherals go through the CIC first?  I see that gic_interrupt ()
>>>> fires once in Xen, which calls doIRQ to push out the virtual interrupt
>>>> to the dom0 kernel.  The dom0 kernel then handles the interrupt and
>>>> returns, but gic_interrupt() never fires again in Xen.
>>>=20
>>> I do not remember of any CIC but the behaviour definitely look like an =
interrupt acknowledge problem.
>>>=20
>>> Could you try the following:
>>> --- a/xen/arch/arm/gic-v2.c
>>> +++ b/xen/arch/arm/gic-v2.c
>>> @@ -667,6 +667,9 @@ static void gicv2_guest_irq_end(struct irq_desc *de=
sc)
>>>      /* Lower the priority of the IRQ */
>>>      gicv2_eoi_irq(desc);
>>>      /* Deactivation happens in maintenance interrupt / via GICV */
>>> +
>>> +    /* Test for Keystone2 */
>>> +    gicv2_dir_irq(desc);
>>>  }
>>>=20
>>> I think the problem I had was related to the vgic not deactivating prop=
erly the interrupt.
>>=20
> This seemed to help with the edge triggered interrupts, e.g. UART

So the missing ack is definitely the issue.

>=20
>> Are you suggesting the guest EOI is not properly forwarded to the
>> hardware when LR.HW is set? If so, this could possibly be workaround in
>> Xen by raising a maintenance interrupt every time a guest EOI an interru=
pt.
>>=20
>>> This might make the interrupt fire indefinitely !!
>>=20
>> Most likely with level interrupt ;).
>>=20
> This is what's happening with the Ethernet driver which is level
> triggered.  I had to temporarily disable it
> to check the patch with the UART driver, otherwise the system would
> hang processing the interrupt
> repeatedly.

This is quite logic yes.
The way forward, as mentioned by Julien, will be to use a maintenance inter=
rupt when the interrupt has been handled by the guest so that Xen can do th=
e deactivation of the corresponding interrupt.
This will add some overhead but there is probably no other solution.

Cheers
Bertrand


