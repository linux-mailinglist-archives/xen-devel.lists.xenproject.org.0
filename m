Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8D474221
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 13:10:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246679.425408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6dW-0007ti-IZ; Tue, 14 Dec 2021 12:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246679.425408; Tue, 14 Dec 2021 12:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6dW-0007rq-El; Tue, 14 Dec 2021 12:10:26 +0000
Received: by outflank-mailman (input) for mailman id 246679;
 Tue, 14 Dec 2021 12:10:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWHN=Q7=renesas.com=yoshihiro.shimoda.uh@srs-se1.protection.inumbo.net>)
 id 1mx6dU-0007rZ-Bd
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 12:10:24 +0000
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072f.outbound.protection.outlook.com
 [2a01:111:f403:700c::72f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0697a37-5cd6-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 13:10:23 +0100 (CET)
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3436.jpnprd01.prod.outlook.com (2603:1096:404:d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 12:10:19 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 12:10:19 +0000
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
X-Inumbo-ID: d0697a37-5cd6-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kklKdxGrR/xCu6BFPjEvEtFLUrExvC38rU7E1tQLCjeVGrUJmVLVQd4P4ByBd+mLj/zdkW6W/npoFpCBALmymYcTwSDsKdd/ncbDWlKNcvIOEoDbfBEkFu3xFvz+kDjwVPCGPrWo/Z04r26ItyLwGOG3Md7nl0uRQFVL1/JAjBMindEVp2zkEfeIK9v1QAZZvKu/8x9656Lvn/LvTMpDeMTAf3/pmcrD0swVT+cRm21mU+RHpKcl1cnJkTjFmse6Z7kUyeceECCMxkMN3PXceoH6OZ3+tY6OdeksTyO5QhPhJV3S3DzZzWSEPennBwK05lcLSI8h2l6TXHGcIrk+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhKJ0r7Rd+YA5xfqq6WK9bWNw2l9thUfp+oHM3bRvaw=;
 b=eurSncho5h66VNL3v2OnHMgoUvWaMvRNLZ9ERgNIeKy92zHxb4o2X/kF1vnagnlYROOJKQm7762tb2lM1utoLW+CZBHFoceU9WZ9w4Q6A/eMlzi6TIua/SngElAk9DnffGLh0kID41520dv9oj+OwoJbffWGponPNXneVegrFa4ep16ZMSWS85ieFRcISwZ54zK6XQ7MX7WuoYYglyNHhFhnAVycEJW70awO6GOc35x98VYkqlXaXFTLw4xSs5zd2SPgZfUwpNQZqESs5LTqK8ePT2ym19rRPmr24AxzNYubDgtLjm6R1BBFJ+9WCSHlOQPDJLXtQh3d4uBcXQKsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhKJ0r7Rd+YA5xfqq6WK9bWNw2l9thUfp+oHM3bRvaw=;
 b=gIkgD4pa9jxQ8B8mDe8Sw1POi979AQA9phBtt2jlILv/TQNnuVU7AZipUr5NvC6DUuzw3TtkzEBUbpV2NnjgbdzVSje6E4cbMDAxiAf3qT/7NPFESENP8II8+8wzRnWUojoXY49sOJqxpg6GCM8p9ed0jADoFwr/xEMSHnnaW7o=
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: RE: [PATCH 07/10] iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4)
 support
Thread-Topic: [PATCH 07/10] iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4)
 support
Thread-Index: AQHX47d8fbMLgxHqOUqKrUFepan2+Kwx+dWw
Date: Tue, 14 Dec 2021 12:10:19 +0000
Message-ID:
 <TY2PR01MB36922C89869ADAAF34A75F35D8759@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-8-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638035505-16931-8-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 053f85eb-a995-4402-1593-08d9befab29c
x-ms-traffictypediagnostic: TY2PR01MB3436:EE_
x-microsoft-antispam-prvs:
 <TY2PR01MB3436A28DEAE87B45ECE420D6D8759@TY2PR01MB3436.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Se5YEEwEkllTPo778YAiJiyQNvOzawUBHBwWT4m9JN+bfyBrnrxoSeCtIgdLV6r0rERRk4swpa+j8+aRWMK8qIGo+hSNRmB47z09CbR4R9BIq4FeNkfvaiZCKGMsq7sDgQB+6Ha5ub2JPkKmhOCiyifxLWZ5Aiod4dtaoq7fIZngJO5GPm/dp0qiOyfWmtHQJqm0J6ppF/YVEtqcgN5Dz1n+bXNhZ19Jspqm3Pc7Td7ndZS/T9TpwB3+AziWpRjB9+Mq0Lxh7YjyCiy37JyrS0xN4UaTE2K9Dr8ttqQ3OmcBCU6hEADXjDsfkLMEhIE4eBFGTYywarEn0UEP/pP6AnSneQVPp9+eF3JFzzVjtkDpjfucwmvOLaFqkBymi8gIMFsSYKTScW6dK9HTS/vwSzKkxtP9LHZFVRcDOz67teq1Ws34kTaFFcBNkCileeJ1weL4TM5+/wIf/qrdJufdXkpXFvKK8We3ryP8opFtv5cdpLTqyCnfTLa92rpkmKA2M0fj05gWqfL3LxDbwdi29Y5krWVh1AhUjlEkNdtPrTuB7T0YZxCrrvZz3H+pAamJiLAL3FIH8afOJaUgPYnE4CfryaKcmr0u0MRnbuBWCsaQthoNM/zAlasdXOyci0R2k/DRGgUxLRcxUx85dqBL8wDMA+tFJ11Zq8dw0R0QV6hQUDgaWfb8kluqInWdkXQFSjg9wUcDZGzkKuSgPycZXomON/Vk6dN6Li5wTP1cKdpzPF/JKuV0oTi78yt3q8hTNAFcwacKY+r0CPCnXIIVCn9uanZrgY7TGZeOtBAw4kqDf++wkNdnFoJ9qLzxVM33DgtPLZ9+y9SkNnAUI1HbJg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(54906003)(110136005)(6506007)(38100700002)(508600001)(186003)(8676002)(5660300002)(55016003)(64756008)(71200400001)(66476007)(66556008)(66946007)(38070700005)(76116006)(66446008)(7416002)(122000001)(52536014)(4326008)(86362001)(7696005)(4744005)(2906002)(8936002)(966005)(33656002)(26005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tKO5+fKtU1R0A7nlMyzz6SYjsLH1uBTC7UkK7Jb45kNj/hZtJwVmHc1dBBX1?=
 =?us-ascii?Q?I+nstpnLjHZjGA8II2HSirvHeM6I3EEhvI9n5yFiBIRlJHnC6U50pYp+wNqs?=
 =?us-ascii?Q?xs6hZQWbacj/kmwk4wTQOmOwSi6mJV8eLREk1zcQp0pCX7rm9Dz7iMol+S/P?=
 =?us-ascii?Q?tb0rFogjgCv19vmfSx3cjYG5iv2MU3WJqq3FYB4fsMdAZUcmdRtat8hKdAmi?=
 =?us-ascii?Q?CVFu9MU0G/XwpDM3+Kw5mCQwmDQzwLEYNnoErhBoZztwmzvazzPbIGGvbHYI?=
 =?us-ascii?Q?2vuRJ4PeIuRFlTnv33qXdeMW5p+umXGDF/7PibdsUYEXSCivkOdEH4CvQPBQ?=
 =?us-ascii?Q?JC9njCMKfV9UXJ2sOWVd8KOzj3pGNEC9QHmIsS5rz82Kiye2veNjkeSdM32o?=
 =?us-ascii?Q?lLbaXn+ASv+GTHtXP51/wYmRST9oIM6L1ZPl+saynAATddcWjSzGDwpvvDhk?=
 =?us-ascii?Q?CLCMrNhyHzVXwUCy7SuGsAxjy9tRYuCGUMnTmfUmEcbmUM8EMyH1ARFufW9l?=
 =?us-ascii?Q?vW39nCAbHDD54stghVMewl7E6R+gSNLyQRIMyz7a95HIeAWSQyFFmU/ngVMi?=
 =?us-ascii?Q?weJyPkPXwltMAZLNSATrNOsqy/uf/8JoW4DiQXIpbs2SEw6SafF+XAIje9io?=
 =?us-ascii?Q?UVJqLFLSAylgR2qBDaoEui5Nx+iWiMEf7SjGXTTnDOKaQL1tq4um9WIzUEuZ?=
 =?us-ascii?Q?hwfWz2yc/mmF4720R8Tv8jXxDkqA7ctfmmJiFvlEYYfBHnTEmzIvawJNWv0h?=
 =?us-ascii?Q?dhZIyMW0cJ34pKDNLFxFecHGAQiqDxdK8fCdAC8h/AV7tOuDC5snYHry19Qi?=
 =?us-ascii?Q?xqD9rHi124lOX1WcMPSmxx34nmtiVuTmQnL8R4O+QnlfPV236wRisquB3PaA?=
 =?us-ascii?Q?CFbPZ04Sk56qLUkbWf6KKz9QRMVvfKyvO4fhfLPCQaX001svYF6g5WIav1e7?=
 =?us-ascii?Q?TlUR4o0BI9Kyi7TO8nYJytVD+XKAexmJJcoZaF1FfHR3tcveMRKAxwUG8d5p?=
 =?us-ascii?Q?cPGlqJp5tzHgMgl6N2vfW81F/CRFoKhn/AGK6jWso0SviWWJ8mo3uu1Dcabm?=
 =?us-ascii?Q?ClZF1k+3xON1dcGJE1rLJo59xOK1hdzzfYCk8cOMpLm7hjnR1Pl3cx6wWWn4?=
 =?us-ascii?Q?WeFNilSOCLq3JnZbx7O+WkGlw2ibW1RCN0xqvITqxviMttJNyV6ByFIsjMmh?=
 =?us-ascii?Q?R4Gfom/AOp7jx9QqkFA/ldTkRiONbB7eOHsnjB2WRltVDrb6L/CWt+MqW4WQ?=
 =?us-ascii?Q?hx04IYGHEM1RrNGKz1+atn49nBzzah6DQI7pjHbY8EnN72AmM6bsRQ8pLRjc?=
 =?us-ascii?Q?2u5UyIyf6QGgZK555uYoQ7ZLyaumf0eAHvQl46qd9esb2s2gfV5gj6ueq67m?=
 =?us-ascii?Q?JKwTNbxuzgS2VTZyi8DAuffwtERukHMCuMrNsw0Q2ybyhP4FQNjYK/fvBL4e?=
 =?us-ascii?Q?SMgcPl8CdSbIWF+86E9jOHVZY0VAnOi+H1SdTPJgdhC6SSx499hgXQmT6dXp?=
 =?us-ascii?Q?KNxSsN4DZLFn/wrXFn0Akaof2i4k/t15DU5HBZi5uVRXKOsQE9dOnJ3IB/rM?=
 =?us-ascii?Q?OAmL60VDovb2+948OmIWVqgeFs6gBpxW/s620PH8L2esY5K7ovoGuQD9oY3u?=
 =?us-ascii?Q?1I67f5SMD9ya67+Kqh1Q96fSbsElMSRt3WjT7Cyuzl6i4BNByrIVe8/rFl3g?=
 =?us-ascii?Q?bPG0bjpbs2Vi/dwJFZ3fj8Th1Rw9KX/HH3KbXeTTS56zAbjiAoge9YW1ctAv?=
 =?us-ascii?Q?fHyJ4K2cdg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 053f85eb-a995-4402-1593-08d9befab29c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 12:10:19.6891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /M7NuwcRaTrBRXObsGesU5HUvdYOjoeD2KBKz6wM+aTalaGwWxfuT0PTI63Lh6TZJOGBuVDo1jyYGWFDfObWfNYvNDyCBKOZvvMKZcBLKQm8gbzGWlHEXg0J8amKnyXq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3436

Hello Oleksandr-san,

Thank you for the patch!

> From: Oleksandr Tyshchenko, Sent: Sunday, November 28, 2021 2:52 AM
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Based on the following commit from the Renesas BSP:
> 7003b9f732cffdc778fceb4bffb05ebb4540f726
> located at:
> https://github.com/renesas-rcar/linux-bsp/tree/v5.10.41/rcar-5.1.3.rc5

I would like to reuse an upstream-based patch instead of this BSP patch.
Linux upstream doesn't support the IPMMU-VMSA driver for R-Car S4 yet,
but I believe the following patch can be helpful for R-Car S4:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/iommu/ipmmu-vmsa.c?h=3Dv5.16-rc1&id=3D7a62ced8ebd0e1b692c9dc4781a8d4=
ddb0f74792
I have a plan to modify the Linux IPMMU-VMSA driver for R-Car S4 in the fut=
ure.
- The ipmmu_features_r8a779a0 is replaced with ipmmu_features_rcar_gen4.

I'll review further patches (8/10 through 10/10) tomorrow or later.

Best regards,
Yoshihiro Shimoda


