Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743FB1F4FF0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 10:08:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jivlG-0004ke-TD; Wed, 10 Jun 2020 08:07:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRJ8=7X=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jivlF-0004kZ-Rs
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 08:07:02 +0000
X-Inumbo-ID: 5c089cee-aaf1-11ea-bca7-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c089cee-aaf1-11ea-bca7-bc764e2007e4;
 Wed, 10 Jun 2020 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kIm7OYgJZVD9wHJTyYfatv91ze+TX+8dUe5pnyCAn8=;
 b=Uji7wSiq4/pXBNBPUdN4xxSfcM1K9t0zA0rmkvSGh5fy/A6r2GW+BS4mSjjzbfzSman5jFzvXi39LO0IjebxbnTe/gww5/e7HY+5fkoHfnYbnSZZGFJaBNc0eNVLsSjbAQBOQTtFu2Y4bqvV7BmQQx35O0Ij4HmfO0fwNzxEoVY=
Received: from AM5PR0402CA0001.eurprd04.prod.outlook.com
 (2603:10a6:203:90::11) by DB6PR0801MB1768.eurprd08.prod.outlook.com
 (2603:10a6:4:3b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Wed, 10 Jun
 2020 08:06:58 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::46) by AM5PR0402CA0001.outlook.office365.com
 (2603:10a6:203:90::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Wed, 10 Jun 2020 08:06:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 08:06:58 +0000
Received: ("Tessian outbound fb809da9b456:v59");
 Wed, 10 Jun 2020 08:06:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0250bfaa650948a8
X-CR-MTA-TID: 64aa7808
Received: from 08c4edaddc9d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8751D276-0F09-44D5-8DF4-141C2C8DF1EB.1; 
 Wed, 10 Jun 2020 08:06:53 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 08c4edaddc9d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Jun 2020 08:06:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fc1QfHCwuGjdKKmrfeVyiAX6lp5RP5M7ZpkOeZXmXHR7/fn0OwrPNY5Jj2yBzpbw0CioyC1+I5RDe0d+KZrop8+isS6WmRGKQslUAdSNcraoD+vkfdOID0gawG4oR7qhL95U3aRZYtGJIO4K4uquVdGSCPK3JRAF3SzGimapt36xyQr1eE/xIUtkhhtYH9FQHUSSbiRWScVZWZHEo+2g8XyzTm28Az70/SSCRTR7OdDT3rNE1JqnjxvZlMPLVbp5ZiiZiw+h6Gf0/yBi4FYf0T8QbJgu2oFvKivG6piBFqCkQCNl66Q1kYcJag4sIv06eKmM48h5B43FUAK8eDC92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kIm7OYgJZVD9wHJTyYfatv91ze+TX+8dUe5pnyCAn8=;
 b=H8KybL/GuIY2FEHwTs79I+V7LDfSz1qmqWtHdNJ5d7tq83xocU4H+9inrzwMKTirFQZ29Kx+OC64XUPbUR3KADAp+RoLACkd4DYyXb44bXMF2JkOIZ+He5CkCTGmKL3PjUiHUktB2nNhQE1E2NhbYD6b37BHPHxkh32oGPmB6jukIPrgJ6+ttxIMQrvobZr9h0uCOpPRwjwtpX39zl6lWZpFMmo5riszhwNk8Gv054bGm8seGRp8tAI8KK2+C2b92UpjWDCycmzeHpu2YePXhMSQ7+ixAvbHYweBgZAqrcbzuwu+9rFNSXref2vwFBFUlLAIOdNZzn6OH7OEGyXztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kIm7OYgJZVD9wHJTyYfatv91ze+TX+8dUe5pnyCAn8=;
 b=Uji7wSiq4/pXBNBPUdN4xxSfcM1K9t0zA0rmkvSGh5fy/A6r2GW+BS4mSjjzbfzSman5jFzvXi39LO0IjebxbnTe/gww5/e7HY+5fkoHfnYbnSZZGFJaBNc0eNVLsSjbAQBOQTtFu2Y4bqvV7BmQQx35O0Ij4HmfO0fwNzxEoVY=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB5009.eurprd08.prod.outlook.com (2603:10a6:208:160::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 08:06:51 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::b572:771:2750:14ed]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::b572:771:2750:14ed%5]) with mapi id 15.20.3088.019; Wed, 10 Jun 2020
 08:06:50 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEAgAAP9wCAAAJxgIAAEuGAgAAfEwCAAGmFAIAAh2UAgABV34CAAFCtAIAAAUSAgAADZQCAAAGKgIAAJpOAgABE7QCABAZcAIAAQRIAgAA9oACAAXYtAIAAD3sAgAAFaoCAABUzgIAAB/uAgAAD1ICAAPCKAA==
Date: Wed, 10 Jun 2020 08:06:50 +0000
Message-ID: <32FA85C2-7685-49D2-875B-9FA1C138C92A@arm.com>
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
In-Reply-To: <6033f9cecbf10f50f4a713ce52105426@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ddc80b5-908b-420b-d251-08d80d153f8f
x-ms-traffictypediagnostic: AM0PR08MB5009:|DB6PR0801MB1768:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB17680AA22110D1BE34E5A8A69D830@DB6PR0801MB1768.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: gWlZJ9omZsA06eJrPHezk8+ptFZ7w+4FQocg8lA1YIOlCIKOjvlwH4p/LDmsviQn4QWDlvZkks/OiRLkEnF3EG7Hz8up67App+0se4ECnufEcKwD4pXyQUXZuL9hqBCJb88qrTBo981YyDNeI9Ts9YtpIRB9a9Pua1qCQ/Ztkex9o/kqBN7iEo/LsLeIBhQUYZDCplp8xT3I5B0O6PwgyrADNnF8JVwUM+gVBhIyjluipDMjM4g7XKNWi3eBGWMsu6ONU4hHdJnRtEQRkRSVHGhOAwox0Dz50W7M2SPbZFd57y9p2gUFreev/41WbyurEoEHtpHWWYLYSWWjp39Rjg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3682.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(6486002)(5660300002)(64756008)(66556008)(66446008)(2906002)(53546011)(6506007)(76116006)(33656002)(478600001)(36756003)(4326008)(66946007)(66476007)(186003)(6916009)(3480700007)(91956017)(26005)(8936002)(316002)(86362001)(6512007)(8676002)(54906003)(7116003)(2616005)(83380400001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 4xC9Y96g9FM1gjIUvpiXSi5yDxsCKO8WKvAmrsLyKenEUCtbafcVUknQ/vMRIFeDqNCP4qlNQhjvCwEppiO9SeEVgOyVk9J8ZsiNKog+E+bmI9iRHr4H9zbrRuI0mIkuVrAOnSsm8RVVp18WZN2PJnwNeq1LvCqf5qIwmFZUE/DWiL1q7db0sHvUMwXs7HNU1zJwpiSkTnw1xx0WD8++0c+L1w9NX9/FXDL9Bhoe20KwqiOGFyvoQHkK5KWrT5KHxneSkIPqdLOOL7S4l2Q9KzDbqzM3KgkT5fO68+h+TJtYLRETCFqNNIFT/g/IZiHXrZiWCAxJNsWdhFSjfCs4DQQ2GfRkneVhKX7zx5f6g5ezH05uZu+nqqS/TX6e3P3vrx/R5niufYHh7vUr63OgvDSB1mJcumI1ppPKViG5dxRSkPHK7FRatFdpyiOVn7PeYwXDdEO5BiBoc8e4Q5cyjKxQjl2j/B/5Goem0N4kUhE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DA0311145AD52C40A2B640E40AE3007E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5009
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966005)(26005)(186003)(82740400003)(3480700007)(81166007)(8676002)(47076004)(4326008)(356005)(7116003)(8936002)(478600001)(86362001)(83380400001)(2906002)(36906005)(316002)(82310400002)(6506007)(6862004)(70206006)(5660300002)(336012)(70586007)(6512007)(54906003)(2616005)(6486002)(33656002)(53546011)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7b025cdf-801b-4b4b-cd6c-08d80d153b17
X-Forefront-PRVS: 0430FA5CB7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m/s24uxI07p4jZdewxC5+2HyLKAdQezj1KYOI3GI4/1OQRt5lRVuQ5f7gbSY5fy/XVfSg7YNgqz3/8WExgl/FGcn0nKr743yyiSINSGG6xgIjxOaKDP1FkDjvGA1vY5BobQYBPNPG0coSV15lnGBS+PatzWslLClTV8G2rmrMMjjiTESptYmuhw3O/5dk/5iIyWR0TiwU91kPk1tXsseQC504YQuiiYzuQf9NTvSzhgTqTTZ1XyRUQkGc6k2ziVpXyYbo7Xurd4jTmr99xgCklRIbktFsXEk/HrkhmVGdm70cLnCs4PJkzRA1Kmiy/LDJDWLhB6wd5zcLF9TzLcj/Bj25UQP+hSI5gj6LTywdVuamVw9BNxZrrkSxvq+xgqVdo8op3OOW6i7c++Sw6/QZw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 08:06:58.4239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddc80b5-908b-420b-d251-08d80d153f8f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1768
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 CodeWiz2280 <codewiz2280@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

> On 9 Jun 2020, at 18:45, Marc Zyngier <maz@kernel.org> wrote:
>=20
> Hi Julien,
>=20
> On 2020-06-09 18:32, Julien Grall wrote:
>> (+ Marc)
>> On 09/06/2020 18:03, Bertrand Marquis wrote:
>>> Hi
>>>> On 9 Jun 2020, at 16:47, Julien Grall <julien@xen.org> wrote:
>>>> On 09/06/2020 16:28, Bertrand Marquis wrote:
>>>>> Hi,
>>>>>> On 9 Jun 2020, at 15:33, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>>>>>> There does appear to be a secondary (CIC) controller that can forwar=
d
>>>>>> events to the GIC-400 and EDMA controllers for the keystone 2 family=
.
>>>>>> Admittedly, i'm not sure how it is being used with regards to the
>>>>>> peripherals.  I only see mention of the GIC-400 parent for the devic=
es
>>>>>> in the device tree.  Maybe Bertrand has a better idea on whether any
>>>>>> peripherals go through the CIC first?  I see that gic_interrupt ()
>>>>>> fires once in Xen, which calls doIRQ to push out the virtual interru=
pt
>>>>>> to the dom0 kernel.  The dom0 kernel then handles the interrupt and
>>>>>> returns, but gic_interrupt() never fires again in Xen.
>>>>> I do not remember of any CIC but the behaviour definitely look like a=
n interrupt acknowledge problem.
>>>>> Could you try the following:
>>>>> --- a/xen/arch/arm/gic-v2.c
>>>>> +++ b/xen/arch/arm/gic-v2.c
>>>>> @@ -667,6 +667,9 @@ static void gicv2_guest_irq_end(struct irq_desc *=
desc)
>>>>>      /* Lower the priority of the IRQ */
>>>>>      gicv2_eoi_irq(desc);
>>>>>      /* Deactivation happens in maintenance interrupt / via GICV */
>>>>> +
>>>>> +    /* Test for Keystone2 */
>>>>> +    gicv2_dir_irq(desc);
>>>>>  }
>>>>> I think the problem I had was related to the vgic not deactivating pr=
operly the interrupt.
>>>> Are you suggesting the guest EOI is not properly forwarded to the hard=
ware when LR.HW is set? If so, this could possibly be workaround in Xen by =
raising a maintenance interrupt every time a guest EOI an interrupt.
>>> Agree the maintenance interrupt would definitely be the right solution
>> I would like to make sure we aren't missing anything in Xen first.
>> From what you said, you have encountered this issue in the past with a
>> different hypervisor. So it doesn't look like to be Xen related.
>> Was there any official statement from TI? If not, can we try to get
>> some input from them first?
>> @Marc, I know you dropped 32-bit support in KVM recently :). Although,
>=20
> Yes! Victory is mine! Freedom from the shackles of 32bit, at last! :D
>=20
>> I was wondering if you heard about any potential issue with guest EOI
>> not forwarded to the host. This is on TI Keystone (Cortex A-15).
>=20
> Not that I know of. A-15 definitely works (TC2, Tegra-K1, Calxeda Midway =
all run just fine with guest EOI), and GIC-400 is a pretty solid piece of k=
it (it is just sloooooow...).
>=20
> Thinking of it, you would see something like that if the GIC was seeing t=
he writes coming from the guest as secure instead of NS (cue the early firm=
ware on XGene that exposed the wrong side of GIC-400).
>=20
> Is there some kind of funky bridge between the CPU and the GIC?

Yes the behaviour I had was coherent with the GIC seeing the processor in s=
ecure mode and not in non secure hence making the VGIC ack non functional.
So the only way to solve this is actually to do the interrupt deactivate in=
side Xen (using a maintenance interrupt).

I remember that I also had to do something specific for the configuration o=
f edge/level and priorities to have an almost proper behaviour.
Sadly I have no access to the code anymore, so I would need to guess back w=
hat that was..

Bertrand

>=20
>        M.
> --=20
> Jazz is not dead. It just smells funny...


