Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DF5642AC7
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453850.711472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Cu3-00071x-8U; Mon, 05 Dec 2022 14:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453850.711472; Mon, 05 Dec 2022 14:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Cu3-00070C-5b; Mon, 05 Dec 2022 14:57:07 +0000
Received: by outflank-mailman (input) for mailman id 453850;
 Mon, 05 Dec 2022 14:57:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUwf=4D=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p2Cu1-000706-9s
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:57:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1443a2c2-74ad-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 15:57:03 +0100 (CET)
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB9PR08MB8436.eurprd08.prod.outlook.com (2603:10a6:10:3d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 14:56:57 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 14:56:57 +0000
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
X-Inumbo-ID: 1443a2c2-74ad-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgkjERc0l+YVl6XGccxBtdokAkNOJGrI6LohibqJnqCiopjcIYkOeyp/OB0jvoSMe+sydOEBu1Xyi7hWcehyLqWlmv03jeitk4n4JaSTRS8tcxmo7E9rFjlCVkQfpLoSp5RCjXlBeS8G/T0FABiPxiy8vjeYOxj050mxBhYT59rZ1llkfY0jQMyJ3azppU6f6xIb0ukt6kgUA4v5RggYuYfW7EB1wefuQrZfayXK4E7JLBbOVK5WBCb9OfRrnNL6C7DsivS9arQHZTkWw1vSV9qjTHQr8B/xLKcbNW1drOJUayExBw3aNVXw6tczaXn9hdD4U0jt77KnbZ2I9VeLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLlUycEOhuBw36JwxjaJ1vE3H+TJfqAPzhtJXhPlg5Y=;
 b=jCPb968p6K9xFQNMU9KSbBt8iaveRJm+98yuGF8/O34qYlkPk9udfylFAiYSwmZIz/4yQKRm2nFJTaZ1XQDLaYkXIp0Dqpq0o7Zr7DDIBw8fj6EcVEC9SemZPf4YC0j00DONItKfb1MH0rkaCM1vjOAfkWD4vI2+d07slzSw+8e257KFn1zYtRaa/j5iJPUEoNZP7N3jPgNyNzPNyIzaPP84XGg8Vlp+W01BptEogaZXzPio84g5u4emiFp0Pj0DyLVKhkZq/0eTtCg+cOs9AV+zT3Ilm5mKMXOlddLkHHWDAVI2yjijrEf/OpBcRpoIRev2yLOtABZNWvP9Fj5xnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLlUycEOhuBw36JwxjaJ1vE3H+TJfqAPzhtJXhPlg5Y=;
 b=Om47yCpD0W5eYJkoP1XYEKzYzUawyKTHJ/GhgIieVZx2+fovlfCofmMkxL8SvdnIBn2mH4QHq4ZzWL4YCfpCHVTwO9mty6EtsLH16YmxoW0FwTErgPsJVXHXbNcj2AXXoDhMjV+QjpyLf2Xif4gKj6tVRS2y1q5cgzTQ0eh1XeE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 08/21] xen/arm: vsmmuv3: Add support for registers
 emulation
Thread-Topic: [RFC PATCH 08/21] xen/arm: vsmmuv3: Add support for registers
 emulation
Thread-Index: AQHZBZ9FZaLvsMLqiEuR+y6v1y6G4a5crcqAgAK6j4A=
Date: Mon, 5 Dec 2022 14:56:57 +0000
Message-ID: <E2B0312C-36B1-4AA4-8713-7C0CE650D7A9@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <89018b50b5b0c2c4a406c5a8779b7fd33d59d1e4.1669888522.git.rahul.singh@arm.com>
 <1479c5e5-2073-aa58-7078-581d73f493f6@xen.org>
In-Reply-To: <1479c5e5-2073-aa58-7078-581d73f493f6@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7158:EE_|DB9PR08MB8436:EE_
x-ms-office365-filtering-correlation-id: 68679cc6-7312-47f5-fa18-08dad6d0f4ea
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 goZZ66DNKkdm5g0ztZw7TAY9TH29artsBU8oIcM1pXwkADqaySOV0Gk2VIDG9SseaoBliAipLD2k+0zqCta9HWSo8/T7g6Ce0sAsvzmWZjDeg7YOLHBLB/y6qh1lnrIGwQbzWl4Pr8SqwJK0/OnRB6jPlb8q8Ck77LZG1D8g02E9LqFwhIgB+qHB4ZjQSD7g7mK18fqND0bHg/2woRJ1lhtcCgpsVT4YrT0bZxBzkCwZ+mmvdSpAmLjKNwMeDStOh7iFqoT6wCNfJ2ZHJw3ur6SNN14WfFFAKNmXlCJMftWtH0jnhTWKeGnvLhLYybe2tlGxjylrCiQCXRSfr+HjMOV7oBJg5FnrvlrteYcYZWrZLEtr8Qp4tDqsjJGr/KDVpGWAidY4b1pRubJ1DzH27RrHLHbkwno9GkweRai9LUZ7VJC6ciK28wsAK3Y8gEqG/tuQVNdIH+1zY3y+Ejki5IaYZ/IAPHxzJroYXZ3mccFTazDCW1GEfZf6fN/wr7KgK5AIYprP1KueDQkqPgIECnBHRb0i4nxcWteVFrtNRaB6or+k1S633N5GXfup4nuC24RlLm6KMTH6KAL1wRKUxN02b/92aacEwmQ6yFFXwSpNyillZodc4NwFoAsNRNcQ49GoJDs3ArtkiVP53vOSKRlUafiareNTnoSB5witvjV2nmnqJ8jOKkDI0slpTyxZdJ1OE+ZR0WLf2AoiLdzXQpsI6SLgbRqqCmc7uQAtyCw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199015)(38070700005)(4744005)(38100700002)(66446008)(122000001)(316002)(64756008)(5660300002)(76116006)(8676002)(66946007)(66476007)(26005)(91956017)(66556008)(6512007)(4326008)(6916009)(54906003)(2906002)(186003)(36756003)(86362001)(6506007)(6486002)(8936002)(33656002)(2616005)(53546011)(478600001)(41300700001)(71200400001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Se9+oTWlS63c+CAdns8kJtXxCzayX+t8uycwUM7wFqdIYiPXpNoG/kVCrfpr?=
 =?us-ascii?Q?uvWE28KMrSOhDh98bx5OjW9xla7vH9oBNbIalV2EaUv98T0Bo9IqofKMD88m?=
 =?us-ascii?Q?vpZdI/G+lu9eLQuzHDc9d7orDKt7qDxhbBI5jvYPi9M+yLSi/DthaAag5Wla?=
 =?us-ascii?Q?CDj9FmXkzmmgOq3zyGTI9RbRfHgb6kLch+fheJ7Ykt+i4Sisq9wEb9Y9GzCh?=
 =?us-ascii?Q?15ZGvrpDz7IZPsbt1i2E1fABs66a4ZhBjZClpvGYSp82RDE/HP021agCzuw4?=
 =?us-ascii?Q?kX5AB16SI1mCxFw8GHYUOmCWx8ovAxbLFcjnP6OwHhCrNd3gN6CP3t47Vddc?=
 =?us-ascii?Q?nK1yD1FvDaPEx9kIs6UyEqw98S0R/BfkLjZbfHG8uri2hzqHFgXmXlEiKPEs?=
 =?us-ascii?Q?L+tSvGsj2X96DqaBB6eeA0zgVBXHRCml80VXviX0x77WM2oGwsFINoUjd6Je?=
 =?us-ascii?Q?p4NjD+HPq0TpfFHLtOIa6vRGlqtR2lL8AQXVVf2t6ep1wFiUWnBabYM3dMs9?=
 =?us-ascii?Q?6QNJqqH7vrlnKJ6mIQymr4UFyh9bWd+zA82eVnDsI51s5+wEWTtmEHwYoRA5?=
 =?us-ascii?Q?DoXUkYaRQbius8nBADjNcT5tO9fTrRuDHyphXOQQWwZkBthxdVxvzQwst41q?=
 =?us-ascii?Q?6AvBNZyX9QojdT+wSixe2KR5TxFS4Z//1LPA1pfioIa98emLRW4I4yL2NiCs?=
 =?us-ascii?Q?b3+U9cfPVGsCZnvtUopNmn/7wjNt3Zc9bzi24w3aSgrRepSLTWYS2x96xVYw?=
 =?us-ascii?Q?wryi/G680f45bWlUssZStMW4wgvnlJ/XJ4foYzIKqClh26lwKzdt5p7PAXhD?=
 =?us-ascii?Q?DIWrgfCCDz/IiLTp6uEEgSM5FzJ1FJP0b7BLXeHE5hzdzluzfTxyUF0T+bfZ?=
 =?us-ascii?Q?fvLIG2Dn61IGUTxWCvHH7dUFSHBsc2LNLGxmOjSbM3tq5rugKe3k1lW6UPla?=
 =?us-ascii?Q?8h3SC/M1ZB5a7Atd6ZHI5Skinc4vtUfpjAfjAWLY05/ZdAzMJOpyG1Zv0lr6?=
 =?us-ascii?Q?jy+NRtoceE8GjVgDmVTY5Zlef+CYSkvadwC9SOcBI/1mwX+sh5EPSYEP/tR0?=
 =?us-ascii?Q?TwVc9pVQwRX5q4KSh5LgCUL4q/DviyR4g2zz5vgglFpG6TJQKXRgcHjOcvp/?=
 =?us-ascii?Q?rahipWG5gXk7eMa5M5CC7D66xdIUFkrOdtpW9JZpglgKronTrnJJwEL4baJy?=
 =?us-ascii?Q?PXENOVAV6xfh3ppCezSHo9slnjb87YpQMkpgcKP976bZxCSq6UUyNRT3k0dP?=
 =?us-ascii?Q?EzfXtjnr5sAJ2QgPNgbnnmvTq1cQgHgM6wzyXCTPFZj83/Q+aqR8jVS4yaKr?=
 =?us-ascii?Q?I4BnH9MhmYNqAcmyxLwfl2LVV7jlrU999y9fPpF7faZatJpUBGhFEGvOIqe6?=
 =?us-ascii?Q?QTHOEpmkiZLwcSQKg8TqNZ9kgd+eyx6PElx0BqOTudaC2sVnXJbnb+7baDoH?=
 =?us-ascii?Q?A8VrhAImrPmddf8IkqFWiefvumRsVvWyumkGk7zKBZLtDZi3zSfMRTbqnJ0Q?=
 =?us-ascii?Q?50DRgWJ6odMOvOB20zkpF8jgk3UgSRuzJt5ZMGG39+pDFghoWtKwJkVGOB2g?=
 =?us-ascii?Q?drzkQ6uWl+A6onL+WSgkYRhM0pAluQVdvmp4BMcA?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1F8885D1A58D5E4A9A54C59D4A381544@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7158.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68679cc6-7312-47f5-fa18-08dad6d0f4ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 14:56:57.6303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8U5wqTxBd/gDBLw6j6ygsltix52z+9vOu/Uhf5C9olZdcvVr4jWxTb7YDcrrlkvttOueVZd3+AAX1jCwnIPvxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8436

Hi Julien,

> On 3 Dec 2022, at 9:16 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> I have only skimmed through the patch so far.
>=20
> On 01/12/2022 16:02, Rahul Singh wrote:
>>  static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>>                                register_t r, void *priv)
>>  {
>> +    struct virt_smmu *smmu =3D priv;
>> +    uint64_t reg;
>> +    uint32_t reg32;
>> +
>> +    switch ( info->gpa & 0xffff )
>> +    {
>> +    case VREG32(ARM_SMMU_CR0):
>=20
>=20
> Shouldn't this code (and all the other register emulations) be protected =
for concurrent access in some way?

Yes, I agree I will add the lock for register emulations in next v2.
>=20
>=20
>> +        reg32 =3D smmu->cr[0];
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->cr[0] =3D reg32;
>> +        smmu->cr0ack =3D reg32 & ~CR0_RESERVED;
>=20
> Looking at the use. I think it doesn't look necessary to have a copy of c=
r0 with just the reserved bit(s) unset. Instead, it would be better to clea=
r the bit(s) when reading it.

Ack.=20
=20
Regards,
Rahul=

