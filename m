Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8392D5F9C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49450.87455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNrB-00032l-Ke; Thu, 10 Dec 2020 15:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49450.87455; Thu, 10 Dec 2020 15:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNrB-00032M-H8; Thu, 10 Dec 2020 15:27:49 +0000
Received: by outflank-mailman (input) for mailman id 49450;
 Thu, 10 Dec 2020 15:27:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knNr9-00032H-Uv
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:27:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cd3bed9-5327-46c3-8bd6-ecc6e7a0d0dc;
 Thu, 10 Dec 2020 15:27:46 +0000 (UTC)
Received: from AM5PR0601CA0054.eurprd06.prod.outlook.com (2603:10a6:206::19)
 by DB6PR0802MB2294.eurprd08.prod.outlook.com (2603:10a6:4:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.23; Thu, 10 Dec
 2020 15:27:44 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::99) by AM5PR0601CA0054.outlook.office365.com
 (2603:10a6:206::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 15:27:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:27:43 +0000
Received: ("Tessian outbound fc5cc0046d61:v71");
 Thu, 10 Dec 2020 15:27:43 +0000
Received: from 763f2b5106d1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78C7A1DA-BB31-4478-BC48-562FDF37E16D.1; 
 Thu, 10 Dec 2020 15:27:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 763f2b5106d1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 15:27:27 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4776.eurprd08.prod.outlook.com (2603:10a6:10:f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 10 Dec
 2020 15:27:26 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 15:27:26 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8cd3bed9-5327-46c3-8bd6-ecc6e7a0d0dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYBVTzjMcojE4MWVJoJYd5WdYRou82iBM+RCkOA8L5c=;
 b=HCp7dbHTtTzX7PYJQydQNsDlEiCaxyqehnglYOtIPdRSlrakv6Lcm0MWKmgPNn7HMcsnzIZ95Me1ZQS//Wk4aHNR8pBUPO1O5isiR7KqhUUMI890X9N+sD1LFVBT5XxrUv+xxyg/ARuFaMiJE7Wd9KFm/RVHuuWQmlrJkPDX1Ws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cfcc2bcd73248e60
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqfAQO4d5+305dxTH3URFgPHp9hCLDvrroTcGJfDoEBRpo3BPkulyTDXKAeogQgCXeFd58LqeD4NabSogd4tX1ty6ORotxIBp6Z0vV6z5hU+MDAw5gAIk1G5EhPt+JWaTW+2rNzVzYkrrDcoapEDKxRIQPgMvHU07DEkmwSYL0ScW/UBzQDD+x3h9v1MbR0CqY9982pVKTFz+gZWitdoXDSdChRKyQaQS/V93iMRwV3lqN+SKOHcQGMlaBpL0cFn7wUJUQ4el7zBGUNtOIIx2+ZOJIO+ok9mz7rlRr65fWtm2UBsKtivsbMzgR917zNYLjXX1s+F0IntFzAX4h+vYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYBVTzjMcojE4MWVJoJYd5WdYRou82iBM+RCkOA8L5c=;
 b=RAPq6MCWWi9jseLMWuUdVBIcqf6Mu8aD1XL8/ONY8CrsWwNxYDN9biEgM2bix7kjTysbvaAfqX8x0IFAbNaW0apEog9CGlu2WKKbTtGILHqRU+6uRRvq3cUmgFn/AjC9NU71E86hgUHmBYekj48EHSPDWoFj4frIN05FCokhWKFxRMaa7gfpVuBZGU1t6DvZOTfZ2Z6Ptehr9FScJ0saFJK9EBaRBPKd0AoCrXqvNYcdnNn4RE/7OMeEvUgulGYkyf96NGGNIH6GYkJk1R8/D4TfqWzcAE+tz1nm6wVRNxCTj1m4TcjP5uPV1pUl7CY417hY1UoXGxs+BeuJ8/Tvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYBVTzjMcojE4MWVJoJYd5WdYRou82iBM+RCkOA8L5c=;
 b=HCp7dbHTtTzX7PYJQydQNsDlEiCaxyqehnglYOtIPdRSlrakv6Lcm0MWKmgPNn7HMcsnzIZ95Me1ZQS//Wk4aHNR8pBUPO1O5isiR7KqhUUMI890X9N+sD1LFVBT5XxrUv+xxyg/ARuFaMiJE7Wd9KFm/RVHuuWQmlrJkPDX1Ws=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 6/7] xen/arm: Add CP10 exception support to handle MVFR
Thread-Topic: [PATCH v3 6/7] xen/arm: Add CP10 exception support to handle
 MVFR
Thread-Index: AQHWzklxLeD2qzBVf0meNxRIV80xoKnvZdMAgAEPhoA=
Date: Thu, 10 Dec 2020 15:27:25 +0000
Message-ID: <45F93E3E-210D-4432-BEAF-0304F0018DF4@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <a72a378cd1d4e5c6670980cf4d201d457abe5abc.1607524536.git.bertrand.marquis@arm.com>
 <e06cde1e-2833-4335-9456-04aae3f6d287@xen.org>
In-Reply-To: <e06cde1e-2833-4335-9456-04aae3f6d287@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: efb7f69f-d397-4585-d654-08d89d2023d8
x-ms-traffictypediagnostic: DBBPR08MB4776:|DB6PR0802MB2294:
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2294C5BF23D2BD2D9B12DF699DCB0@DB6PR0802MB2294.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Wcie9QjVGegedn26zSFiL5a6OOqH5R7WOnHGpeOYFlMXeXCpaxQHAlivEvfelWiIOHamx8TEA7Tg3trqP6mHgkJF+om9UwkMUgt5Q1L2nJmOgqK/5u2Qzpys6w6J44tDLkarFaaKAqE7OGdFoMKG4kR0vHAYUPaMAFcp+4RfratOZdZJmpJ5V4KmmZgwQfogATj+OulNEniYL1j0HVGvcsM+xEk+5RUENC7D0y+7PoJHjPhLOzGeXqmouXhfUXR0DQaVXGAvluS8QoHfoxeEIcZZCqOV5OmxwhkbM8S6TVTmVDAwFD58yb+Mq5gFmalkGqbzPazJeEZ75tfLYKX5X43pCCYqbjeTAas747OFZSQV6Pu9A8Iq5mBIc6Y77tBo
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(66946007)(66556008)(8936002)(66446008)(2906002)(76116006)(66476007)(8676002)(6916009)(91956017)(6506007)(53546011)(4326008)(64756008)(71200400001)(33656002)(5660300002)(54906003)(316002)(478600001)(6486002)(2616005)(26005)(86362001)(83380400001)(6512007)(186003)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?RoGlo1OU7rpMT41UpCj23zMGGksQOpLiflMd1+BeeEVteO1FxFICmayoiKX4?=
 =?us-ascii?Q?oLlTlfTVxfn8ngl0yJvWbIvehxHEed46n/zE68uOuxGEZpn+9Ezw6IjMwtXd?=
 =?us-ascii?Q?xJYGKMSzGHdH/kGVTwRnLWx/XLqc8/wr+NJ++uPvNfZ5zD1FJY2GKjPZ/0uE?=
 =?us-ascii?Q?4ppLy1uYWAYtzRp02Y7hc/bLmTybFr4Fwi1nbWxsZhtwArSzaiIniu0rS6u2?=
 =?us-ascii?Q?omHRD6pT5Ho7YI8ZVeWJYx9ZSfQaA7CJ8Va9+qsihXLLGy6K3zrFRcHmnKGY?=
 =?us-ascii?Q?av41uUtrf0Mj+HFh7EXrh6JBnZtOlb/Is/NluuerKjxH03UCBnO4DyLDsUCN?=
 =?us-ascii?Q?X07J0wY7JCZfhZwJhYZyqK1cdrnRZ+OZ89A4y8elZJpWbVYf3dcoOSN2o4Yo?=
 =?us-ascii?Q?CPXRuImy1k66SM2Sw1DRy+Jw3g4gvBKkek164DuyyJrEp9p/ry7J9TTmgOZv?=
 =?us-ascii?Q?X59Al9p52zBJs9ljgfHK0MTvuV1sv1kjM1CYA0Al8TiI8mU27rO2vnJqDQ5E?=
 =?us-ascii?Q?aKetvR4ujVbVEqO3qr7mrAEza1v1JvZNC8ho/EeOx/tjHE+K1sueC/4volZF?=
 =?us-ascii?Q?OCDxmddIS5RYprUv+bzvF+LxuIb3z27li6U+ExNpGaIDUwtWmIuG8wzlEs8d?=
 =?us-ascii?Q?1oMR3/kblHAerK4lYhfOlUnQ1UG+XHzRpI1ONKmV6CC85Tkj4R+VT+9sng8p?=
 =?us-ascii?Q?sOHsT8/hEHY47vLBtnvBfcudA02f1NJxoV484bHGQKLKoAgp16WJVDpBzZDs?=
 =?us-ascii?Q?bc8ea9J84RTtsoCZcHCzty5rbwJ+mMUTQIdsN54oeMnbYUbbBtvPK+vyYlvV?=
 =?us-ascii?Q?vK9odqB2sNtK9u4v+r4IdOC7t8VAn+QFDhlQfoCt/W00vMD38B2PEzNkvfmZ?=
 =?us-ascii?Q?MlomquUXiTkMjaUt+1mauNeP7rZocjlqQHZZZ0lwtu8VpwB2GBaMfPoZZBVU?=
 =?us-ascii?Q?dnWIDCG8jSzl+qIM8vcuETft6+iG5gCwcaiNMf+M7vmapnCWKRPufDN3MWKH?=
 =?us-ascii?Q?IA1S?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <05DEA66479194A4DA08AEC86DB92295B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4776
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c31e61b3-3c55-4bb7-482e-08d89d20193c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mVWVsjnSyrIyc18RnZs8PKc/dPSw0NOdrTTD2BZRqI1BL49YWuUzhri8jTnBhPtBh2vI9VXJAlpBHnjq7V2aRRCj7Y0E8zfVtqUdLZiqw4llJgflcClTqQoGvnI7IsTjfK9NonvYfsrb9gCm2hLODd61CaEAnIbPrAH4c4pZ1uaBD1rteLIQR8n3PTU+UaQkxVJe9Fc+6B+InODi4Fa7G1MlX4nGqnWdv1ae0MhjpLcCJu/Ugb/YJeZ48QWYt0XtvLkA4Ktf37V7MLaDepceVc5S0CgvzoTG2XhlqkwdkVMdmXw7AeZunYPV6khjTLLdKDwxx/5rbyZos5NfUS210Shr4y/pIuHuUrTHmvpNDDMMqFvhOIY3xxT85DNHw0fDgH3POS0xck3p/7CgaNASgw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966005)(47076004)(86362001)(336012)(26005)(53546011)(186003)(83380400001)(6512007)(2906002)(8676002)(82740400003)(316002)(2616005)(36756003)(70206006)(8936002)(6862004)(81166007)(6506007)(6486002)(478600001)(107886003)(4326008)(33656002)(54906003)(356005)(82310400003)(70586007)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:27:43.7583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efb7f69f-d397-4585-d654-08d89d2023d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2294

Hi Julien

> On 9 Dec 2020, at 23:15, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 09/12/2020 16:30, Bertrand Marquis wrote:
>> Add support for cp10 exceptions decoding to be able to emulate the
>> values for MVFR0, MVFR1 and MVFR2 when TID3 bit of HSR is activated.
>> This is required for aarch32 guests accessing MVFR registers using
>> vmrs and vmsr instructions.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in V2: Rebase
>> Changes in V3:
>>   Add case for MVFR2, fix typo VMFR <-> MVFR.
>> ---
>>  xen/arch/arm/traps.c             |  5 ++++
>>  xen/arch/arm/vcpreg.c            | 39 +++++++++++++++++++++++++++++++-
>>  xen/include/asm-arm/perfc_defn.h |  1 +
>>  xen/include/asm-arm/traps.h      |  1 +
>>  4 files changed, 45 insertions(+), 1 deletion(-)
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 22bd1bd4c6..28d9d64558 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -2097,6 +2097,11 @@ void do_trap_guest_sync(struct cpu_user_regs *reg=
s)
>>          perfc_incr(trap_cp14_dbg);
>>          do_cp14_dbg(regs, hsr);
>>          break;
>> +    case HSR_EC_CP10:
>> +        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
>> +        perfc_incr(trap_cp10);
>> +        do_cp10(regs, hsr);
>> +        break;
>>      case HSR_EC_CP:
>>          GUEST_BUG_ON(!psr_mode_is_32bit(regs));
>>          perfc_incr(trap_cp);
>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>> index d371a1c38c..da4e22a467 100644
>> --- a/xen/arch/arm/vcpreg.c
>> +++ b/xen/arch/arm/vcpreg.c
>> @@ -319,7 +319,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const un=
ion hsr hsr)
>>      GENERATE_TID3_INFO(ID_ISAR4, isa32, 4)
>>      GENERATE_TID3_INFO(ID_ISAR5, isa32, 5)
>>      GENERATE_TID3_INFO(ID_ISAR6, isa32, 6)
>> -    /* MVFR registers are in cp10 no cp15 */
>> +    /* MVFR registers are in cp10 not cp15 */
>=20
> The code was originally added in the previous patch. Please either introd=
uce the comment here or fold it in the previous patch.

Right i will fold it back in previous patch.

Regards
Bertrand

>=20
>>        HSR_CPREG32_TID3_RESERVED_CASE:
>>          /* Handle all reserved registers as RAZ */
>> @@ -638,6 +638,43 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const =
union hsr hsr)
>>      inject_undef_exception(regs, hsr);
>>  }
>>  +void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
>> +{
>> +    const struct hsr_cp32 cp32 =3D hsr.cp32;
>> +    int regidx =3D cp32.reg;
>> +
>> +    if ( !check_conditional_instr(regs, hsr) )
>> +    {
>> +        advance_pc(regs, hsr);
>> +        return;
>> +    }
>> +
>> +    switch ( hsr.bits & HSR_CP32_REGS_MASK )
>> +    {
>> +    /*
>> +     * HSR.TID3 is trapping access to MVFR register used to identify th=
e
>> +     * VFP/Simd using VMRS/VMSR instructions.
>> +     * Exception encoding is using MRC/MCR standard with the reg field =
in Crn
>> +     * as are declared MVFR0 and MVFR1 in cpregs.h
>> +     */
>> +    GENERATE_TID3_INFO(MVFR0, mvfr, 0)
>> +    GENERATE_TID3_INFO(MVFR1, mvfr, 1)
>> +    GENERATE_TID3_INFO(MVFR2, mvfr, 2)
>> +
>> +    default:
>> +        gdprintk(XENLOG_ERR,
>> +                 "%s p10, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n"=
,
>> +                 cp32.read ? "mrc" : "mcr",
>> +                 cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs=
->pc);
>> +        gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#x\n",
>> +                 hsr.bits & HSR_CP32_REGS_MASK);
>> +        inject_undef_exception(regs, hsr);
>> +        return;
>> +    }
>> +
>> +    advance_pc(regs, hsr);
>> +}
>> +
>>  void do_cp(struct cpu_user_regs *regs, const union hsr hsr)
>>  {
>>      const struct hsr_cp cp =3D hsr.cp;
>> diff --git a/xen/include/asm-arm/perfc_defn.h b/xen/include/asm-arm/perf=
c_defn.h
>> index 6a83185163..31f071222b 100644
>> --- a/xen/include/asm-arm/perfc_defn.h
>> +++ b/xen/include/asm-arm/perfc_defn.h
>> @@ -11,6 +11,7 @@ PERFCOUNTER(trap_cp15_64,  "trap: cp15 64-bit access")
>>  PERFCOUNTER(trap_cp14_32,  "trap: cp14 32-bit access")
>>  PERFCOUNTER(trap_cp14_64,  "trap: cp14 64-bit access")
>>  PERFCOUNTER(trap_cp14_dbg, "trap: cp14 dbg access")
>> +PERFCOUNTER(trap_cp10,     "trap: cp10 access")
>>  PERFCOUNTER(trap_cp,       "trap: cp access")
>>  PERFCOUNTER(trap_smc32,    "trap: 32-bit smc")
>>  PERFCOUNTER(trap_hvc32,    "trap: 32-bit hvc")
>> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
>> index 997c37884e..c4a3d0fb1b 100644
>> --- a/xen/include/asm-arm/traps.h
>> +++ b/xen/include/asm-arm/traps.h
>> @@ -62,6 +62,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const unio=
n hsr hsr);
>>  void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr);
>>  void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr);
>>  void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr);
>> +void do_cp10(struct cpu_user_regs *regs, const union hsr hsr);
>>  void do_cp(struct cpu_user_regs *regs, const union hsr hsr);
>>    /* SMCCC handling */
>=20
> --=20
> Julien Grall


