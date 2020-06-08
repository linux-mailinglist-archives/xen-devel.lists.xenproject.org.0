Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1951F1496
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 10:41:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiDKa-0003qT-BS; Mon, 08 Jun 2020 08:40:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmCK=7V=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jiDKZ-0003qO-5S
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 08:40:31 +0000
X-Inumbo-ID: b4ffba2e-a963-11ea-9b55-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.41]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4ffba2e-a963-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 08:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6oH/QvHYohphmH+LEG8BW35Xiym72qUOfYXpfuc0Sg=;
 b=id4KVna2WqipGYHNEHuAVIyesFc+idynzKZt66IgiGsiBdYZhD8eVOz0OI6JQCYqHePYth/hjI3F92rHqFk6SVWYSjF5fS01ak1cnolDsuX88ynDmkdxSQIegPL+a6ySUG2w8w2u4ADQV0W2L4MlnGg+uKPtDHeJ2NHYWwNNpsA=
Received: from DB6P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::20) by
 HE1PR0802MB2186.eurprd08.prod.outlook.com (2603:10a6:3:c2::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.20; Mon, 8 Jun 2020 08:40:27 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::67) by DB6P191CA0010.outlook.office365.com
 (2603:10a6:6:28::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Mon, 8 Jun 2020 08:40:27 +0000
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
 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 08:40:26 +0000
Received: ("Tessian outbound 8bb15bb571b3:v59");
 Mon, 08 Jun 2020 08:40:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eb059dd617992ed6
X-CR-MTA-TID: 64aa7808
Received: from b61c26d23a4b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 26FE9581-A805-4952-AE61-C9F37C883AF5.1; 
 Mon, 08 Jun 2020 08:40:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b61c26d23a4b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 08 Jun 2020 08:40:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNGywbNaYzJNnD9SNEtqugmYZSeFeuWD8A2ypbqzsDwcAxBPFMYIBYw90qxlPaO0RB9ki8WpzbWbpuzvESshzr1/tRA67kru4Url0OdbfCNFGzoK6MioaoRa+RN+AjpobW6XmLEnT8VpdUrA3v7qSwHwlPrXIq3074ZMUmdtmHVsSl8TAW9WykQ0Y/GzHphYGBzJr4P4ehRpsUb0e0ToTccOXebYiBjZXWmw78UZVB8DG0ZkP5RMQI2AJxa5tVbJVUZiVMJPlFgJgjb7rB6n6r8vUIigYNWStmJcMQZWlt2EjPTFCQTPK46UBd+3EdQ2eDc0HZBQJ31uvDC6W2rBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6oH/QvHYohphmH+LEG8BW35Xiym72qUOfYXpfuc0Sg=;
 b=aaZsVxrumIFaKPRkhaREfwrsBnsNjS7p0SlG+bcoqOqx4R9nCuyYeI8/iDj8G6Y8z3F4E/d2b4zPR60m2DwV2qaErRVKWTk1lXDC/BS+4RjsRkouqKiND7+sQdwAQrdZuDsVjQ1MvGHtg4BCjHSlrJTYNefhtIPeU8428V+MwPk4rBoUq4FboZvN0u/OEWpcE2GM0cqVLa51/1VePm/LxWxN5u1Z0LraWY6MJhBzOKWSN1Z0y6xqkOGlae451PiyTLrbXWWRy5EC1cAJfs4+kMUk77+WS1LYsUbh9Qca1BAtA+XSNH7rf8bxssvO0Ncwf13tLD7/uDqZzApozQ1tkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6oH/QvHYohphmH+LEG8BW35Xiym72qUOfYXpfuc0Sg=;
 b=id4KVna2WqipGYHNEHuAVIyesFc+idynzKZt66IgiGsiBdYZhD8eVOz0OI6JQCYqHePYth/hjI3F92rHqFk6SVWYSjF5fS01ak1cnolDsuX88ynDmkdxSQIegPL+a6ySUG2w8w2u4ADQV0W2L4MlnGg+uKPtDHeJ2NHYWwNNpsA=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3097.eurprd08.prod.outlook.com (2603:10a6:5:1d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Mon, 8 Jun
 2020 08:40:19 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 08:40:19 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: CodeWiz2280 <codewiz2280@gmail.com>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEAgAAP9wCAAAJxgIAAEuGAgAAfEwCAAGmFAIAAh2UAgABV34CAAFCtAIAAAUSAgAADZQCAAAGKgIAAJpOAgABE7QCABAZcAA==
Date: Mon, 8 Jun 2020 08:40:19 +0000
Message-ID: <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
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
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
In-Reply-To: <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 19b34e7a-bfb7-4cd9-109b-08d80b8797c4
x-ms-traffictypediagnostic: DB7PR08MB3097:|HE1PR0802MB2186:
X-Microsoft-Antispam-PRVS: <HE1PR0802MB21866BC2B79F2827D692A4569D850@HE1PR0802MB2186.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
x-forefront-prvs: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bPGJlO9jCo514WZqlqjKWaQjNc3cj6RidyNOC/DGJdK6xHk/IVAZfoHo7Nu2Yg9fiiqaezCeoOT1eK04AECgPn9HE6KH2QzBrRVGm+Ne+LBSlPbJO0JNgNW1nJCo5rzVXIHFPtviC53uufi14pH6RV/RY33zwpTYNEsdxAhQrXx8G0kcLgxEfVYFA1GWyffPuRQaAoI61UpZVF7Z36XQD+fAr8a7fv62Yc1N2jyWQiTo8AyRg8r0wok68s5ScHIq5Uph9p3rq1EBRv4U1KNqrjJHMjHS4lQKuvWSnaFs/1qK+V7PUIetw/zvglVM+KgeNWOpYak0XDPJhM5lYhJHrg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(478600001)(4326008)(8676002)(91956017)(8936002)(66556008)(66446008)(64756008)(76116006)(6916009)(66476007)(5660300002)(86362001)(7116003)(66946007)(6512007)(36756003)(26005)(316002)(3480700007)(2906002)(83380400001)(2616005)(71200400001)(54906003)(33656002)(186003)(53546011)(6506007)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: T357c1R+W78RDF1lMDYpNrTM4WJmH1JMOvWiYqC9yj12O7y7G9MqnlOfLCPi6ofaoXIDiN45vQwdjRTyklZr4MO9JMwqzl5QZwFHI/plfrbhxtjI5uFgBq/ra/r6XL523g4Zzg0jS9cOxdI6ZtRCpQhfzqXHPSdZx76ae4Fe3U9wywMC9axhbFbd8hicIHA+8NChJWpSXIurq0d6/juotwQ5YLHnWHfEoMZkn+7XqHaDXCzuGb9xRvF0gIvRvGOUiaBG//NPe8GdZWuAe4q4LyJ+GFp33et9MoLNjdD2UFlqfkyBZwwuJPDR7rGd4E2wuyXj8t5vugwPEPC4O5V/Z5Za6k9uxTVUfcQwDe5NNXm/VxYhfqMda0IlXpHIZ9xHP9aZu+9DXkGkyJwSDCh9WHlTlFT0VhCzPZuEfkrTJ/P/0Uaw7ryu2BvD00KD0WS529hodGz3VvYlfR53vEMqB5OjD1ZalvsChg74leEDzOs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2EC637D63A78AB4A8797A4F5BE462C08@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3097
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966005)(6486002)(2906002)(186003)(26005)(8936002)(86362001)(82310400002)(53546011)(83380400001)(478600001)(82740400003)(3480700007)(6512007)(6506007)(54906003)(81166007)(356005)(4326008)(47076004)(5660300002)(316002)(7116003)(70586007)(36756003)(336012)(33656002)(6862004)(8676002)(70206006)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 54a4b105-672f-4574-4f8e-08d80b879352
X-Forefront-PRVS: 042857DBB5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gX0X5YINgY+bNbu+BEPjVe6WBdmuH2MeYT36SBVIYtoOYI4nZkNqtT/oQYe2m9WlAi6rJ92FDIa563bFOFbv7TQYe4KCaDdF7gIHedBuIY8TfkaJoAcctCTxdC+epazboyOtPP+DJBgC0TAAt4VuLV4uVgB/fPnxvVrKKVoR8Z7jR/bnyIEWFg/XSUQ4s/HyD4Uy0DKxUQ7H4DuLuP/6TK+4WUzhBvFVpCxSqxFLQai/KVM1uZLdiyWK7Ptz4T8ISxQkvYHHHdMb3I6JAE4M2/kfHIsUF+ANvRygqm1eJ/SDi/5Cx1Uki3b64WZgdePR3lMvpFm0TVmzrWD3Gf4xKkmZChTyyyLscKCg577ZyPWvBtxT2zY+FFnp0KIKB7UiTQ1iiCbLjnRkdVy/sXOWAg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 08:40:26.7554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b34e7a-bfb7-4cd9-109b-08d80b8797c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2186
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



> On 5 Jun 2020, at 20:12, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>=20
> On Fri, Jun 5, 2020 at 11:05 AM CodeWiz2280 <codewiz2280@gmail.com> wrote=
:
>>=20
>> On Fri, Jun 5, 2020 at 8:47 AM Bertrand Marquis
>> <Bertrand.Marquis@arm.com> wrote:
>>>=20
>>>=20
>>>=20
>>>> On 5 Jun 2020, at 13:42, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>>>>=20
>>>> On Fri, Jun 5, 2020 at 8:30 AM Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>> Hi,
>>>>>=20
>>>>> On 05/06/2020 13:25, CodeWiz2280 wrote:
>>>>>> The Keystone uses the netcp driver, which has interrupts from 40-79
>>>>>> listed in the device tree (arch/arm/boot/keystone-k2e-netcp.dtsi).
>>>>>> I'm using the same device tree between my non-xen standalone kernel
>>>>>> and my dom0 kernel booted by xen.  In the standalone (non-xen) kerne=
l
>>>>>> the ethernet works fine, but I don't see any of its interrupts in th=
e
>>>>>> output of /proc/iomem.  I'm not seeing them in /proc/iomem when
>>>>>> running dom0 under Xen either.  When booting with Xen I get this
>>>>>> behavior where the ifconfig output shows 1 RX message and 1 TX
>>>>>> message, and then nothing else.
>>>>>=20
>>>>> I am not sure whether this is a typo in the e-mail. /proc/iomem is
>>>>> listing the list of the MMIO regions. You want to use /proc/interrupt=
s.
>>>>>=20
>>>>> Can you confirm which path you are dumping?
>>>> Yes, that was a typo.  Sorry about that.  I meant that I am dumping
>>>> /proc/interrupts and do not
>>>> see them under the non-xen kernel or xen booted dom0.
>>>=20
>>> Could you post both /proc/interrupts content ?
>>=20
>> Standalone non-xen kernel (Ethernet works)
>> # cat /proc/interrupts
>>           CPU0       CPU1       CPU2       CPU3
>> 17:          0          0          0          0     GICv2  29 Level
>>  arch_timer
>> 18:       9856       1202        457        650     GICv2  30 Level
>>  arch_timer
>> 21:          0          0          0          0     GICv2 142 Edge
>>  timer-keystone
>> 22:          0          0          0          0     GICv2  52 Edge      =
arm-pmu
>> 23:          0          0          0          0     GICv2  53 Edge      =
arm-pmu
>> 24:          0          0          0          0     GICv2  54 Edge      =
arm-pmu
>> 25:          0          0          0          0     GICv2  55 Edge      =
arm-pmu
>> 26:          0          0          0          0     GICv2  36 Edge
>>  26202a0.keystone_irq
>> 27:       1435          0          0          0     GICv2 309 Edge      =
ttyS0
>> 29:          0          0          0          0     GICv2 315 Edge
>>  2530000.i2c
>> 30:          1          0          0          0     GICv2 318 Edge
>>  2530400.i2c
>> 31:          0          0          0          0     GICv2 321 Edge
>>  2530800.i2c
>> 32:         69          0          0          0     GICv2 324 Edge
>>  21000400.spi
>> 33:          0          0          0          0     GICv2 328 Edge
>>  21000600.spi
>> 34:          0          0          0          0     GICv2 332 Edge
>>  21000800.spi
>> 70:          0          0          0          0     GICv2 417 Edge
>>  ks-pcie-error-irq
>> 79:          0          0          0          0   PCI-MSI   0 Edge
>>  PCIe PME, aerdrv
>> 88:         57          0          0          0     GICv2  80 Level
>>  hwqueue-528
>> 89:         57          0          0          0     GICv2  81 Level
>>  hwqueue-529
>> 90:         47          0          0          0     GICv2  82 Level
>>  hwqueue-530
>> 91:         41          0          0          0     GICv2  83 Level
>>  hwqueue-531
>> IPI0:          0          0          0          0  CPU wakeup interrupts
>> IPI1:          0          0          0          0  Timer broadcast inter=
rupts
>> IPI2:        730        988       1058        937  Rescheduling interrup=
ts
>> IPI3:          2          3          4          6  Function call interru=
pts
>> IPI4:          0          0          0          0  CPU stop interrupts
>> IPI5:          0          0          0          0  IRQ work interrupts
>> IPI6:          0          0          0          0  completion interrupts
>>=20
>> Xen dom0 (Ethernet stops)
>> # cat /proc/interrupts
>>           CPU0
>> 18:      10380     GIC-0  27 Level     arch_timer
>> 19:          0     GIC-0 142 Edge      timer-keystone
>> 20:         88     GIC-0  16 Level     events
>> 21:          0   xen-dyn     Edge    -event     xenbus
>> 22:          0     GIC-0  36 Edge      26202a0.keystone_irq
>> 23:          1     GIC-0 312 Edge      ttyS0
>> 25:          1     GIC-0 318 Edge
>> 27:          1     GIC-0 324 Edge      21000400.spi
>> 28:          0     GIC-0 328 Edge      21000600.spi
>> 29:          0     GIC-0 332 Edge      21000800.spi
>> 65:          0     GIC-0 417 Edge      ks-pcie-error-irq
>> 74:          0   PCI-MSI   0 Edge      PCIe PME, aerdrv
>> 83:          1     GIC-0  80 Level     hwqueue-528
>> 84:          1     GIC-0  81 Level     hwqueue-529
>> 85:          1     GIC-0  82 Level     hwqueue-530
>> 86:          1     GIC-0  83 Level     hwqueue-531
>> 115:         87   xen-dyn     Edge    -virq      hvc_console
>> IPI0:          0  CPU wakeup interrupts
>> IPI1:          0  Timer broadcast interrupts
>> IPI2:          0  Rescheduling interrupts
>> IPI3:          0  Function call interrupts
>> IPI4:          0  CPU stop interrupts
>> IPI5:          0  IRQ work interrupts
>> IPI6:          0  completion interrupts
>> Err:          0
> After getting a chance to look at this a little more, I believe the
> TX/RX interrupts for the ethernets map like this:
>=20
> eth0 Rx  - hwqueue-528
> eth1 Rx - hwqueue-529
> eth0 Tx  - hwqueue-530
> eth1 Tx - hwqueue-531
>>=20
> The interrupt counts in the standlone working kernel seem to roughly
> correspond to the counts of Tx/Rx messages in ifconfig.  Going on
> that, its clear that only 1 interrupt has been received for Tx and 1
> for Rx in the Xen Dom0 equivalent.  Any thoughts on this?

This definitely look like an interrupt acknowledgement issue.
This could be caused by 2 things I remember of:
- front vs level interrupts
- a problem with forwarded interrupt acknowledgement.=20
I think there was something related to that where the vcpu ack was not prop=
erly
handled on a keystone and I had to change the way the interrupt was acked f=
or
forwarded hardware interrupts.

I will try to get more info on that one as I have no access to the code any=
more.

Regards
Bertrand






