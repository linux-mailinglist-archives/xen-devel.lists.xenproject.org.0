Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DCC1F501D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 10:14:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jivs2-0005bE-Or; Wed, 10 Jun 2020 08:14:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRJ8=7X=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jivs1-0005b3-Fj
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 08:14:01 +0000
X-Inumbo-ID: 56e14a1c-aaf2-11ea-b3eb-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56e14a1c-aaf2-11ea-b3eb-12813bfff9fa;
 Wed, 10 Jun 2020 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzIcmhenhRSN4zxT1i+VqFR3Lcopy3/vdFMgYVbXbVI=;
 b=jmXwZQM+SFVdxsFzYXX4xawWLPG9slOH+v9Q1twR8BZ1sRu2D7GnH8pb6+Qu+SNCzFFCHI8tenLsT5rDmBcbxq9B4jfHmXpFfddcyJD3ZdTKPda1oFWIVh4TycsR8A5I1a4omEMi0FnzRviYKHnZ7qcWX/BfQU/jBVsd6HU80K4=
Received: from AM6P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::21)
 by AM6PR08MB4102.eurprd08.prod.outlook.com (2603:10a6:20b:ab::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 08:13:59 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::f) by AM6P192CA0008.outlook.office365.com
 (2603:10a6:209:83::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Wed, 10 Jun 2020 08:13:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 08:13:58 +0000
Received: ("Tessian outbound 56dbe829191e:v59");
 Wed, 10 Jun 2020 08:13:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13f49898e248673b
X-CR-MTA-TID: 64aa7808
Received: from 19e0cbef05e9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 984AA417-89DE-422D-8740-4BFB35305A90.1; 
 Wed, 10 Jun 2020 08:13:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19e0cbef05e9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Jun 2020 08:13:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1APJhB3lZOgxK/tZlmhOCWI8ntrc9cVlP7OYgIf6fO7BkwlYGfgmV0LRawBPf4Rj/ftNtHdSmVa9ShyF/RDA/CZaVFcl88T2k5X3MTk8Nl8PB6/yNEF2Qb83cgKzH1NdqLqqp1S3kaCbVLyeaGWz09t9BPsCy9cIPI9BEDlsdy7VYYEPCm0R15eniLiSJ4lCcb3tbGO3uSnvzpN3h5s+YNXp4pZH6K6iUzJ8MAEXDwvtLVoQKP1yH7Cz8L5SJQZAYHW5pJkLXRY6Exal9SmfA2qNBv6lCyXvzl+6xi/GKkD4jOP226Gm3uxdgP2eB1vWTP/aWkKMFjSvEWlTUGvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzIcmhenhRSN4zxT1i+VqFR3Lcopy3/vdFMgYVbXbVI=;
 b=h8vhlpSgqwVBXj0HuPeJa8EchqHT8WmDL+dJfFThUt2vYu77KxF7JU0Qai5CsSUd37zOiqx2aXbIFAc05y86glrwMbSaBhfNrnkyR+V0RXlpvXeno4Uch/RVspLAyX5Tr+bNac0wu6Nc4faZuiKYI38muYJRLt4tfwTB2C77eFRsINyuO/IrZWjqDHg3q0pA+p4gRh9Q3gKXUw4Hc2GrHl5b2s6EspJsz+iu00MfqMV2JReFTX96nCf8Ga/+rRB4zuTHWhMfahVz9c/+qNgWIVD2U2IqcXPLrotI1PhoCVr/G0OEMFdIROtJjJtQYlUUzJWoY3AK1PMECvOFe1L8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzIcmhenhRSN4zxT1i+VqFR3Lcopy3/vdFMgYVbXbVI=;
 b=jmXwZQM+SFVdxsFzYXX4xawWLPG9slOH+v9Q1twR8BZ1sRu2D7GnH8pb6+Qu+SNCzFFCHI8tenLsT5rDmBcbxq9B4jfHmXpFfddcyJD3ZdTKPda1oFWIVh4TycsR8A5I1a4omEMi0FnzRviYKHnZ7qcWX/BfQU/jBVsd6HU80K4=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB5027.eurprd08.prod.outlook.com (2603:10a6:208:15c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.23; Wed, 10 Jun
 2020 08:13:50 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::b572:771:2750:14ed]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::b572:771:2750:14ed%5]) with mapi id 15.20.3088.019; Wed, 10 Jun 2020
 08:13:50 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: CodeWiz2280 <codewiz2280@gmail.com>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEAgAAP9wCAAAJxgIAAEuGAgAAfEwCAAGmFAIAAh2UAgABV34CAAFCtAIAAAUSAgAADZQCAAAGKgIAAJpOAgABE7QCABAZcAIAAQRIAgAA9oACAAXYtAIAAD3sAgAAFaoCAABUzgIAAB/uAgAAD1ICAACeSgIAAyuwA
Date: Wed, 10 Jun 2020 08:13:50 +0000
Message-ID: <BBAA9FD6-8582-4663-9DED-CE20B608D299@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
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
 <03607739-A4FF-486A-899A-F5F36870225A@arm.com>
 <2ec6255c-9d28-92e7-bd0a-59edb9fc078a@xen.org>
 <6033f9cecbf10f50f4a713ce52105426@kernel.org>
 <CALYbLDgw8puOr+G8MOn+QVaj9kGX848gj5p=V6k8nR8wA-0_UA@mail.gmail.com>
In-Reply-To: <CALYbLDgw8puOr+G8MOn+QVaj9kGX848gj5p=V6k8nR8wA-0_UA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a2315132-de59-4645-491f-08d80d163a1c
x-ms-traffictypediagnostic: AM0PR08MB5027:|AM6PR08MB4102:
X-Microsoft-Antispam-PRVS: <AM6PR08MB41028A3CE7C6378E99ED2F1E9D830@AM6PR08MB4102.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: AnMjGlN7hkkol54XoUjVY/U4WP+pEsbEbeui3DKRzD3ROQVSy86X8BJBDAto4erK9M+0r/T/eFeZeUlCj3KL3Us0h+fKj6UhS1Zq08nXcZ7HjYRIfQtWy+unGtK3a4ucUSWJ2Wf6HYUqEkxLtWa+S+cG62OORxi7iHgttIV0SZkK9cr+7ksLYvIx6amwnxnW2kssFRPjE6cvpS08l4NxGWB/R+9c7tdTY5lLM7HhQBhIIIejj+uksPZzv7ySDOCxFqdDGobGf04SY7+tH7f641lekkEFLNJJozw4h+jNepExCujOdu+R//AnSZyZHgl9RQLfZcAHU2fRUDC84GunFQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3682.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(33656002)(3480700007)(26005)(36756003)(91956017)(6512007)(316002)(54906003)(6506007)(6486002)(2616005)(478600001)(83380400001)(5660300002)(8676002)(66946007)(2906002)(66556008)(6916009)(8936002)(76116006)(64756008)(186003)(66446008)(66476007)(53546011)(7116003)(86362001)(71200400001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: iyH+ecw6QfdKJL1LjhT2F3tpVzsixgsllWaHjYMWEXTuHXApM8UwldZE8CNImclzUElJJIhRmkCE2FpqXSu6rODjCvzYFVGvb2O0LNtOPMMc6pbAtS5RZ3ACS9VOFZ4DEqlLWrW4HIWgb490oJj4ou3tot51SZz0Bw7dqgLcj0XOW9U791D2EQZ1oU8kEwtFLhqG2UbFR98xNXzti/q37+brZgNImKlhxo7tpVcHxGIAqsNDmdmftMNrJN/QMSyTurpVpzObLBWv6Y4ezyEoQQ+fUd6wpZYp8eqIVd/NvA3Aj0Td2IJ1hLqCV5RYe3kho7TdPoLCMY954qnBTMBX80z4LW7zYgqdVI2qHQRfYsUhf27zW3jnrB+heqW87xcunQJ0WE8Luroix5SdlPtQB+azA8seKmCVrnbJrENgVYt+NiuIeeel0fbhamQH4eRCqyX4mYOoyTkx5EOFwCq2My7QpwIOCWXWdT2lf8GsyyA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6DE6681C948CAC4EBC5804755209258D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5027
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(186003)(26005)(53546011)(336012)(6486002)(2906002)(6506007)(82310400002)(8676002)(6862004)(86362001)(3480700007)(7116003)(8936002)(4326008)(2616005)(83380400001)(6512007)(36906005)(81166007)(356005)(82740400003)(5660300002)(478600001)(54906003)(33656002)(70586007)(316002)(70206006)(36756003)(47076004);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0ca646ed-ee15-4dda-bcb4-08d80d16355f
X-Forefront-PRVS: 0430FA5CB7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YZRKJG8NlyDTUCJz/lDpLOV4d9Z/kisLx5Gbwwp31MLprYm5K7wVS2NPZxIQT/S5T5tcsJlTvh7/Ri9sJLRD1B/orcJ2YPLL6k3RAZyYE0j2SDsjvhzs7fuTboj9F/bK8vg0UGPHbXcpN1F7Dkm5JfKHiGV5w9xCWziturTUNws3XGeLsPOQiNFpYY/ywXn1DrLhZ7htOkDLnPVhrPimbKcXghE9sInZagDjM+Tg8XffOnP/WCvBEK1rigwin6h/NoQXg7WR1rXqcyoLj+zDy6ciFW0wfIpc9JXdQ+2Uwo5aFNf+oKzSQvOP1kHnauv8wBw/DvfQHw6gAOvmIda9uo9sUFG0N0K6i3khoSm+2X8yVj/s24orBs9UhZ4xfoCAOtjDjuh+Xl5c8Y8SA0H1qA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 08:13:58.7526 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2315132-de59-4645-491f-08d80d163a1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4102
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

> On 9 Jun 2020, at 21:07, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>=20
> On Tue, Jun 9, 2020 at 1:45 PM Marc Zyngier <maz@kernel.org> wrote:
>>=20
>> Hi Julien,
>>=20
>> On 2020-06-09 18:32, Julien Grall wrote:
>>> (+ Marc)
>>>=20
>>> On 09/06/2020 18:03, Bertrand Marquis wrote:
>>>> Hi
>>>>=20
>>>>> On 9 Jun 2020, at 16:47, Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> On 09/06/2020 16:28, Bertrand Marquis wrote:
>>>>>> Hi,
>>>>>>> On 9 Jun 2020, at 15:33, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>>>>>>>=20
>>>>>>> There does appear to be a secondary (CIC) controller that can
>>>>>>> forward
>>>>>>> events to the GIC-400 and EDMA controllers for the keystone 2
>>>>>>> family.
>>>>>>> Admittedly, i'm not sure how it is being used with regards to the
>>>>>>> peripherals.  I only see mention of the GIC-400 parent for the
>>>>>>> devices
>>>>>>> in the device tree.  Maybe Bertrand has a better idea on whether
>>>>>>> any
>>>>>>> peripherals go through the CIC first?  I see that gic_interrupt ()
>>>>>>> fires once in Xen, which calls doIRQ to push out the virtual
>>>>>>> interrupt
>>>>>>> to the dom0 kernel.  The dom0 kernel then handles the interrupt and
>>>>>>> returns, but gic_interrupt() never fires again in Xen.
>>>>>> I do not remember of any CIC but the behaviour definitely look like
>>>>>> an interrupt acknowledge problem.
>>>>>> Could you try the following:
>>>>>> --- a/xen/arch/arm/gic-v2.c
>>>>>> +++ b/xen/arch/arm/gic-v2.c
>>>>>> @@ -667,6 +667,9 @@ static void gicv2_guest_irq_end(struct irq_desc
>>>>>> *desc)
>>>>>>      /* Lower the priority of the IRQ */
>>>>>>      gicv2_eoi_irq(desc);
>>>>>>      /* Deactivation happens in maintenance interrupt / via GICV */
>>>>>> +
>>>>>> +    /* Test for Keystone2 */
>>>>>> +    gicv2_dir_irq(desc);
>>>>>>  }
>>>>>> I think the problem I had was related to the vgic not deactivating
>>>>>> properly the interrupt.
>>>>>=20
>>>>> Are you suggesting the guest EOI is not properly forwarded to the
>>>>> hardware when LR.HW is set? If so, this could possibly be workaround
>>>>> in Xen by raising a maintenance interrupt every time a guest EOI an
>>>>> interrupt.
>>>>=20
>>>> Agree the maintenance interrupt would definitely be the right solution
>>> I would like to make sure we aren't missing anything in Xen first.
>>> From what you said, you have encountered this issue in the past with a
>>> different hypervisor. So it doesn't look like to be Xen related.
>>>=20
>>> Was there any official statement from TI? If not, can we try to get
>>> some input from them first?
> Thank you all for your support so far, its really appreciated.  Is
> there a quick patch that I can try with this maintenance interrupt to
> get the level interrupts working as well? I can pose the question to
> TI but would like to close the loop and make sure there are no other
> issues that pop out first.

If you can that would be good to ask TI because I did work on the Keystone2=
 a while ago and they might have a firmware solution for that.

Bertrand

>>>=20
>>> @Marc, I know you dropped 32-bit support in KVM recently :). Although,
>>=20
>> Yes! Victory is mine! Freedom from the shackles of 32bit, at last! :D
>>=20
>>> I was wondering if you heard about any potential issue with guest EOI
>>> not forwarded to the host. This is on TI Keystone (Cortex A-15).
>>=20
>> Not that I know of. A-15 definitely works (TC2, Tegra-K1, Calxeda Midway
>> all run just fine with guest EOI), and GIC-400 is a pretty solid piece
>> of kit (it is just sloooooow...).
>>=20
>> Thinking of it, you would see something like that if the GIC was seeing
>> the writes coming from the guest as secure instead of NS (cue the early
>> firmware on XGene that exposed the wrong side of GIC-400).
>>=20
>> Is there some kind of funky bridge between the CPU and the GIC?
>>=20
>>         M.
>> --
>> Jazz is not dead. It just smells funny...


