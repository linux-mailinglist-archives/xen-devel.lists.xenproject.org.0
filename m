Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26273206E38
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 09:51:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo0BJ-0005cJ-4r; Wed, 24 Jun 2020 07:50:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tlWx=AF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jo0BH-0005cE-SW
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 07:50:52 +0000
X-Inumbo-ID: 6bfb708c-b5ef-11ea-8496-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.89]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bfb708c-b5ef-11ea-8496-bc764e2007e4;
 Wed, 24 Jun 2020 07:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAGZhfwWxrbZVNblOko23k/JqL0LSOXxaHHpeax+ZM4=;
 b=kpwSs6VDo19CwtteemfI9+r68tGoI4wseJpflo73ngX/p6OAcnkiKmNbkP0N4L04UzHknf4KvhD+ovzPGXI8o191JG7RVPUdclI52B5VNlvXAIQi55cz6PJ0jizpLoMf+UmmWH4ZcZ8AOv2Ik51WgdtXhlKMIn+8teVmYRyDC50=
Received: from AM6PR10CA0094.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::35)
 by DB6PR0801MB1943.eurprd08.prod.outlook.com (2603:10a6:4:74::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 07:50:48 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::69) by AM6PR10CA0094.outlook.office365.com
 (2603:10a6:209:8c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Wed, 24 Jun 2020 07:50:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 07:50:47 +0000
Received: ("Tessian outbound 217a52b9caed:v59");
 Wed, 24 Jun 2020 07:50:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 399724d274a5de18
X-CR-MTA-TID: 64aa7808
Received: from 3ace6fa6619b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8D2ED595-65AD-455C-8476-478651044171.1; 
 Wed, 24 Jun 2020 07:50:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ace6fa6619b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Jun 2020 07:50:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adsJCG6A7MNkAE4cxbtKOeuBO0x5tVNDVCnJN6/iHdklsSajqwuPd3bDbCve3Tapg6fOCn/iLYZtYJ8drXVfAASxm0mPO1BtBR1oknBeHnzjb426LH9ufOsi0/tcenlGrnUSCgn93OVJ97N7zdlvGZdMJPYgzznrD8z/NbgC5PEyIHJ8JrnYssvD3XWQNW3hT8pehHb9587g/wgwDSVUJqrxcHI3+Xi4xq7Q/ccQ3d4/mGqhewb5Kg6Y4hLUXNrvB5Qg4jPg8mOczX2RGiQ7doCr2OL8BlFxyugQ0lwtyI20tclqbYFg894CvuS8QcjGlo8yUVKSzGrvQsNDJehtIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAGZhfwWxrbZVNblOko23k/JqL0LSOXxaHHpeax+ZM4=;
 b=hp4Qx43sxyG6bRr+zCmFpkrUcxQ0HRMvn/CHZWj5eFSsz49BFiK457JTHLweekA2FikivMMVeBP9nNYCmNjmEDbiRVW1JcwNdxqApzhwc98qImNliCj/LG2ktgfxuNFKctsFssNV/wWPap6InGHOXt96WZzmzGjtD7LPWYsD8ZI/Qi82aV3R7g+nfEGHWDfrmLZdNPoaE52kix99bJMmr1UN6Jnd5bjzqmoiJpCjE8dzWugxFkTld2lplWhHA7MoZ/Auyq9HAVfChT0/gl4sDqy+OEOwiq6NFYLTN6RCjqwoRka2fs0+MviMR0Kc+XlsH5hPPDhmXpg0YIj6/4Yl4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAGZhfwWxrbZVNblOko23k/JqL0LSOXxaHHpeax+ZM4=;
 b=kpwSs6VDo19CwtteemfI9+r68tGoI4wseJpflo73ngX/p6OAcnkiKmNbkP0N4L04UzHknf4KvhD+ovzPGXI8o191JG7RVPUdclI52B5VNlvXAIQi55cz6PJ0jizpLoMf+UmmWH4ZcZ8AOv2Ik51WgdtXhlKMIn+8teVmYRyDC50=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3913.eurprd08.prod.outlook.com (2603:10a6:10:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 24 Jun
 2020 07:50:39 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 07:50:38 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: CodeWiz2280 <codewiz2280@gmail.com>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEAgAAP9wCAAAJxgIAAEuGAgAAfEwCAAGmFAIAAh2UAgABV34CAAFCtAIAAAUSAgAADZQCAAAGKgIAAJpOAgABE7QCABAZcAIAAQRIAgAA9oACAAXYtAIAAD3sAgAAFaoCAABUzgIAAB/uAgAAD1ICAAdWTgIAHsRIAgADZKACAAKhTgIAAArOAgAFVYICAAENqAIAAVYQAgAk7HYCAALhoAA==
Date: Wed, 24 Jun 2020 07:50:38 +0000
Message-ID: <30ACA5A7-089F-45E2-9A9B-A6BC4EBBC78B@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
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
 <4bab90465acfddae5868ce2311bd9889@kernel.org>
 <CALYbLDjNF5s2SXkunjJNv4x9jQAcDfoMBWp3WFHBkjnNdfT3Sg@mail.gmail.com>
 <bd3fade765bf21342a4ce6b952a5ca00@kernel.org>
 <CALYbLDhbRO=FeK21FLTMbt=eMciTW4hhjJUVhpmPUJ0D1ELeqA@mail.gmail.com>
 <alpine.DEB.2.21.2006171134350.14005@sstabellini-ThinkPad-T480s>
 <CALYbLDjX=aDTT0oazOkSDthd_p1H2ygunbdur935+2HYpF5Pow@mail.gmail.com>
 <CALYbLDj9SCmxPZN1Tn6+YntkFyD69iKo2AGq=tG2Cnx4o=PBtg@mail.gmail.com>
In-Reply-To: <CALYbLDj9SCmxPZN1Tn6+YntkFyD69iKo2AGq=tG2Cnx4o=PBtg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a3dd94ab-b70f-4887-ac4c-08d818134e8c
x-ms-traffictypediagnostic: DB7PR08MB3913:|DB6PR0801MB1943:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1943250E4B339D0E6ED4DF979D950@DB6PR0801MB1943.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uHX+B4gNNcr9nvm3jTSFWUBPjYz2mTUeoMHTxpwuAH6FlQ8ZQZlTeRSU8xjEISJqxr65gTsX9Kt33+fneJTJNg8UpspSiTe+c0oyj8WmE5O/OwDwtyWN5n1Ve0S5sWlGZ5X57r7VH+Ue9oBokgY63TzZZn9bE9BBiIan1bc1kLkAOzfPvyzfBC2i+sacFjh96rTeQoUF0Kef2z3Knsz4sdgTZf1cuW4440W46KFD5LhQo+/+0d586kNh5BTPLOEdcr7aejIzFb5IXZAUJq+kgdPbijCGMd9wpzDURIl+Bp4lDBzLP6uM9MmrH8lEpwi0Mvj9DrUdnastzF3l1L52shsec3I1o/qOetZhWEy71DjEudRXzW6WiQhWd58ivl7/fZRvGxi1RgS2X+j08J+1cQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(66446008)(66476007)(64756008)(66556008)(186003)(7116003)(33656002)(6486002)(36756003)(2906002)(71200400001)(54906003)(2616005)(91956017)(76116006)(3480700007)(66946007)(316002)(6512007)(86362001)(8676002)(5660300002)(83380400001)(966005)(26005)(6506007)(53546011)(6916009)(478600001)(8936002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: QI8AUmen+XPTPw3fGHacv7nzn2E1H/ng2czuRneTr9QQ30hxVkZiQ7Uroul8aGqd28eMnCI7Hl/OgHXpwzIRuOpMxoxcZQBagYTOs+DZ4h/XLAz3jG4sgN4+0yKU1pFFdllEhLt1fhEoXgf4vgjvsjKlAe+0iN5K+oAj2k6kocH1JUQ/Evut2z4NslJOHC5mwz0j+26Fxc5U4Qrgop0ISZPVz4iL2RFNU9oYcH5AutRfDJ8qvgl3w5C4MEyi0HpgijGBdOROFtT0wsup6HJTeyYXqGfRb8HroYgezU/TsB0FtggBKUqgaoICLBv2pm1fdfQqxr05p06nLc2L2IxjQOKvLKqs+Wvy93mnYBYOVZAWKkTKOczdMXc2lcsy9UAV8mPistQ+bQgljWNyHIF68xM0ljfQzDBw57tjD+RRADVQ7oofZxY/frh7lTIVHX9WAhP1xIslexjbpsbg8WIAWW/RP+N25HPmkR6pHkNJpWQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7B01395B3708C94CA289C3AC8B445C30@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3913
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(136003)(396003)(39850400004)(376002)(46966005)(82740400003)(54906003)(2906002)(966005)(336012)(6862004)(5660300002)(6512007)(70206006)(70586007)(33656002)(83380400001)(3480700007)(4326008)(8676002)(6486002)(36756003)(86362001)(186003)(26005)(6506007)(47076004)(478600001)(53546011)(7116003)(316002)(82310400002)(2616005)(81166007)(8936002)(356005)(36906005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: cef31353-286d-4a50-b06e-08d818134981
X-Forefront-PRVS: 0444EB1997
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cLQEQ8BdQsD2iwHpKi9uz2oEFtNbFiFtFuRXtJZEpqAakfAzK7JDddgkOqESN0mA5tTK8fmWK2Yq5sRi3BXgyvVng4onStZH5H0FeGVAnKSk9uYx1+k54Nns+eSvqK5i+59liephZo3bnBMdtggMqqskUhIn77zPTOWQPVl5H1v4jzCB0Djmpu7t2w3Cbanzbt3vjZDrIu1knpEDb6Y/G3PsNnVk0TFlw7MLEYKvmITqj8G67lZjpuCtwGmJs6/uv6ZL4EkHBhTMCnjXg54XE5D4Qn2ZPCftaYaffn6GuxoXao+REMJ6JlmsKzlAy360Uld5flGTUeQRYmZG4lcuUq8T5HcbNpRqJecAWeKUxvGYm/R/DujA+iBtWBRaknmo/tYd12SwYA3l+iCPBM7CG1GlPj479sokTCUVm7im3qBNQGA5A5d4m0Czh1qFekReby/i0I0qdQRQ143tIzHplii3YwVfhTdt6S+XL+4Iwsk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 07:50:47.3102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3dd94ab-b70f-4887-ac4c-08d818134e8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1943
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
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 23 Jun 2020, at 21:50, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>=20
> Is it possible to passthrough PCI devices to domU on the 32-bit arm
> keystone?  Any info is appreciated.
>=20
> I found some old information online that "gic-v2m" is required.  I'm
> not sure if the GIC-400 on the K2E supports "gic_v2m".  Based on the
> fact that there is no "gic-v2m-frame" tag in the K2E device tree i'm
> guessing that it does not.
>=20
> If it is possible, is there a good example for arm that I can follow?

There is no PCI passthrough support on Arm for now in Xen.

This is something I am working on and I will present something on this subj=
ect at the Xen summit.
But we are not targeting arm32 for now.

The only thing possible for now is to have PCI devices handled by Dom0 and =
using xen virtual drivers to pass the functionalities (ethernet, block or o=
thers).

Regards
Bertrand

>=20
> On Wed, Jun 17, 2020 at 7:52 PM CodeWiz2280 <codewiz2280@gmail.com> wrote=
:
>>=20
>> On Wed, Jun 17, 2020 at 2:46 PM Stefano Stabellini
>> <sstabellini@kernel.org> wrote:
>>>=20
>>> On Wed, 17 Jun 2020, CodeWiz2280 wrote:
>>>> On Tue, Jun 16, 2020 at 2:23 PM Marc Zyngier <maz@kernel.org> wrote:
>>>>>=20
>>>>> On 2020-06-16 19:13, CodeWiz2280 wrote:
>>>>>> On Tue, Jun 16, 2020 at 4:11 AM Marc Zyngier <maz@kernel.org> wrote:
>>>>>>>=20
>>>>>>> On 2020-06-15 20:14, CodeWiz2280 wrote:
>>>>>>>=20
>>>>>>> [...]
>>>>>>>=20
>>>>>>>> Also, the latest linux kernel still has the X-Gene storm distribut=
or
>>>>>>>> address as "0x78010000" in the device tree, which is what the Xen =
code
>>>>>>>> considers a match with the old firmware.  What were the addresses =
for
>>>>>>>> the device tree supposed to be changed to?
>>>>>>>=20
>>>>>>> We usually don't care, as the GIC address is provided by the
>>>>>>> bootloader,
>>>>>>> whether via DT or ACPI (this is certainly what happens on Mustang).
>>>>>>> Whatever is still in the kernel tree is just as dead as the platfor=
m
>>>>>>> it
>>>>>>> describes.
>>>>>>>=20
>>>>>>>> Is my understanding
>>>>>>>> correct that there is a different base address required to access =
the
>>>>>>>> "non-secure" region instead of the "secure" 0x78010000 region?  I'=
m
>>>>>>>> trying to see if there are corresponding different addresses for t=
he
>>>>>>>> keystone K2E, but haven't found them yet in the manuals.
>>>>>>>=20
>>>>>>> There is no such address. Think of the NS bit as an *address space*
>>>>>>> identifier.
>>>>>>>=20
>>>>>>> The only reason XGene presents the NS part of the GIC at a differen=
t
>>>>>>> address is because XGene is broken enough not to have EL3, hence no
>>>>>>> secure mode. To wire the GIC (and other standard ARM IPs) to the co=
re,
>>>>>>> the designers simply used the CPU NS signal as an address bit.
>>>>>>>=20
>>>>>>> On your platform, the NS bit does exist. I strongly suppose that it
>>>>>>> isn't wired to the GIC. Please talk to your SoC vendor for whether =
iot
>>>>>>> is possible to work around this.
>>>>>>>=20
>>>>>> I do have a question about this out to TI, but at least this method
>>>>>> gives me something to work with in the meantime.  I was just looking
>>>>>> to confirm that there wouldn't be any other undesirable side effects
>>>>>> with Dom0 or DomU when using it.  Was there an actual FPGA for the
>>>>>> X-Gene that needed to be updated which controlled the GIC access?  O=
r
>>>>>> by firmware do you mean the boot loader (e.g. uboot).  Thanks for th=
e
>>>>>> support so far to all.
>>>>>=20
>>>>> As I said, the specific case of XGene was just a matter of picking th=
e
>>>>> right address, as the NS bit is used as an address bit on this platfo=
rm.
>>>>> This was possible because this machine doesn't have any form of
>>>>> security. So no HW was changed, no FPGA reprogrammed. Only a firmware
>>>>> table was fixed to point to the right spot. Not even u-boot or EFI wa=
s
>>>>> changed.
>>>> Ok, thank you for clarifying.  I have one more question if you don't
>>>> mind.  I'm aware that dom0 can share physical memory with dom1 via
>>>> grant tables.
>>>> However, is it possible to reserve a chunk of contiguous physical
>>>> memory and directly allocate it only to dom1?
>>>> For example, if I wanted dom1 to have access to 8MB of contiguous
>>>> memory at 0x8200_0000 (in addition to whatever virtual memory Xen
>>>> gives it).
>>>> How would one go about doing this on ARM?  Is there something in the
>>>> guest config or device tree that can be set?  Thanks for you help.
>>>=20
>>> There isn't a "proper" way to do it, only a workaround.
>>>=20
>>> It is possible to do it by using the iomem option, which is meant for
>>> device MMIO regions.
>>>=20
>>> We have patches in the Xilinx Xen tree (not upstream) to allow for
>>> specifying the cacheability that you want for the iomem mapping so that
>>> you can map it as normal memory. This is the latest branch:
>>>=20
>>> https://github.com/Xilinx/xen.git xilinx/release-2020.1
>>>=20
>>> The relevant commits are the ones from:
>>> https://github.com/Xilinx/xen/commit/a5c76ac1c5dc14d3e9ccedc5c1e7dd2ddc=
1397b6
>>> to:
>>> https://github.com/Xilinx/xen/commit/b4b7e91c1524f9cf530b81b7ba95df2bf5=
0c78e4
>>>=20
>>> You might want to make sure that the page is not used by the normal
>>> memory allocator. This document explains how to something along those
>>> lines:
>>>=20
>>> https://github.com/Xilinx/xen/commit/35f72d9130448272e07466bd73cc30406f=
33135e
>>=20
>> Thank you.  I appreciate it.


