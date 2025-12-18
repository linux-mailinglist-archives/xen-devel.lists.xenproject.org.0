Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F043CCC266
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 14:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189661.1510379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWEXX-0004Dj-9U; Thu, 18 Dec 2025 13:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189661.1510379; Thu, 18 Dec 2025 13:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWEXX-0004AS-5J; Thu, 18 Dec 2025 13:59:35 +0000
Received: by outflank-mailman (input) for mailman id 1189661;
 Thu, 18 Dec 2025 13:59:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ars1=6Y=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vWEXV-0004AG-An
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 13:59:33 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6db321f-dc19-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 14:59:32 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB4PR03MB8636.eurprd03.prod.outlook.com (2603:10a6:10:384::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 13:59:27 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 13:59:27 +0000
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
X-Inumbo-ID: c6db321f-dc19-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZCfTHm9wqbsP5SBNBHhvHBD5yy40yun3e/CWlKtvb2JueXQbHCy5uv2Fb6xbTNjTTfxbJzx6iM3b7FPuUsj+PCf8YsnA3ZkKzhRvqYokDvgt2fLXH/9DcudXFi1oTQQKiW0dx8deujKG/Ppmklo3GWYpoQ0Ft3+T4JX8g1pSJoH7kY//aS4CEB9g7r2XKrf/fGXHPZBIQsJuJXcDqHoSdUHqUO9SBM3bwxm1lpsO9EyGJiXQxSEU0O06l6TNAL19UDsu8WSDhena2J7qt+6IaRuhlzEzwQJjNdOqoLeWTyqjDWbDi1xMVMneQZBzSoE/YrN2dT7fm8Wkihsum6NWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFm3M+mMByM2ZZw/2CH2vq5yIGQgqFJh9XCbD62b1P0=;
 b=vHxt4Y/39hnjlqxtzgjAS4318wt5EPO5VHWYtDq8gMG5+0uNYzo6i3/Mkjb4zY6C8CpIXg+xu4IlmK/fJzj9lleu4zoqjkzUoI7SqKCHw6WDFv8+cIBD5vpmzTnGhbXaJWWiIjCBOncQWwds6nv0SLcFy6EWYqlDpOuw+BbFZB9nhCnkKYt1O+DQ/euVt9i6g6fSTCW986DSDzeSFzTSFXih8aAfD2abGrDfxUDimXRyc8r6xGfM2TwyibZZ420pGBfFZ038F7r44d8bivzzyGMdmsfE1U8rm1yOlZgh2eZ14eDt+dvTPb8rtCplVMKhZsgXgs8IH+Wui+5R44SNaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFm3M+mMByM2ZZw/2CH2vq5yIGQgqFJh9XCbD62b1P0=;
 b=bWCIl4y+4mV4mISdg2a0Wloo32+kiXucu/itwFpS9svgrkOaqK7ClHbtSHl1qHiThIH5y2+fngVGiDDYeWAJADUUFfa9qeHRWdAkc3CPssheJ86ZNeeKoeKKD1x9wKkQRmCJAoLA4aeew55GKw/mAiZY1m5v4pf6HIwju6rkoCdBnbR9uSzWWbxJir32Hd2tqHIZSr9NZv8PvCWwwtzCuufmeSlOr/csOOzjP6bEoVq95SJTogTDm/zMKaH4G10Pz1L4xUSdOfgdij4vzutck5Tib+IwwpHYaUt2vnKIDDyPeS6orln3p9EmEqx11DBubjdmeG6YE2awpCPJWylUPA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>, Alejandro
 Vallejo <alejandro.garciavallejo@amd.com>
Subject: [XEN][PATCH v5] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
Thread-Topic: [XEN][PATCH v5] xen/x86: guest_access: optimize raw_x_guest()
 for PV and HVM combinations
Thread-Index: AQHccCaGGjfW0AbI9km2iXEE38VlUA==
Date: Thu, 18 Dec 2025 13:59:27 +0000
Message-ID: <20251218135926.188059-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|DB4PR03MB8636:EE_
x-ms-office365-filtering-correlation-id: e50bfec5-e808-47dc-d340-08de3e3da897
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/VtG53qQn73qXu8ta7aOlIBoxcpDzXK7dTyhovK739U+DAhALWnNWE+v91?=
 =?iso-8859-1?Q?Bw3aSKcu/u31GSIqfRp2xUhDw0O5SC6GQ2Urs2a0oDlVSl0IMXDb451Bc7?=
 =?iso-8859-1?Q?U5eVY1SOWMP/2TzFf55xfDT8riQudjQxbbQqJWvoyf8sic1U6tFuEpVUnj?=
 =?iso-8859-1?Q?B+Gmyphd8Ryml/5XD1WCJfArECMOuvmkTed6bvWWEstoXJ6MR6Eu92iIsS?=
 =?iso-8859-1?Q?EwWtQu+717Z39ml1XdFIqXQ6JT1AYGVTroElUFsCAIaP+i9X0USWthyfUv?=
 =?iso-8859-1?Q?GMWvaXrTNyeZRYXX+YtZ2fBF78EJIAC9RiIfdefs+cFEWcqcWlsiNIS4zp?=
 =?iso-8859-1?Q?kV/gGn1hTD9dmSfLrBKPL+Ws1xL8XxIGz2D0nPcl1w7bI9GWj7yoTfpleO?=
 =?iso-8859-1?Q?4y5i8QksI/hRezDpnFyM8lwMH8LbAqa24p8qXE9w0SDgh3sidDXOv2sarL?=
 =?iso-8859-1?Q?5QKqArIgT45jMDe4yc7UyZ4bxDKUNDlIuyFxRmcF3GvRDXa3EAuksprHlS?=
 =?iso-8859-1?Q?s411DiftnMBeLah5FAI7VjyZiZdS5KBaNdTHmw4ocGeXHtv7JrBoBvguNV?=
 =?iso-8859-1?Q?vHdE71caKO2JbS1g/MLI4K5tyk5S5TT48jj1cdiQAcCcTkJpHjY/9EqYy7?=
 =?iso-8859-1?Q?dGBBZ14BFd+mdIpB7SmXq8ongj4fpEqnnhz7xTdecek993MjpjY7eJhxvm?=
 =?iso-8859-1?Q?FIMyU3mzOuhqxwY0YwXORazm4pNpnQNX65AOD5dVPWVM5Y/BwMQhEaxTvd?=
 =?iso-8859-1?Q?EQMYQ9SeC+Bc8ZIwk5YSoqluvUHve8G65t2DUV3twEM3PPJani9EVm7zeo?=
 =?iso-8859-1?Q?WltzBB3G5u5frK+KkPC1/lWDwj95EJONdZPIHFU4i4ibEWPIsRAkuHE3Qv?=
 =?iso-8859-1?Q?oNHIVwFmyE61fFrK4UYA8g/cBz7WPZ58rKiA+Y/pS32DyxgkhheO8r648t?=
 =?iso-8859-1?Q?Ol5/0UdFnMbn5q0ESGB2iwHy24X10rlIjRCVLoE2+S273RwBL/IPH6mx4n?=
 =?iso-8859-1?Q?1eeKZemCcs7Pwywy5zGQ/NpwR1XK6kmISB/CRn/UAnteGnhOq+vqU4UpiG?=
 =?iso-8859-1?Q?Ap2PaA3PQh9DvOV1zTfl9IPJ1FRJzoIwaEh1V9+gO+7EIJwfNVoPbrYMGf?=
 =?iso-8859-1?Q?ufEfvtNUy2tMyVyMkyPUVRifEBvNDq+cywlrd+VGYUer2zFEDaQbObPiYM?=
 =?iso-8859-1?Q?4vefdiqwFqEbQUu4EorCEVyjAlvYHnLmbzQ8/yjDh3uNZr/Yy7cudKE8uf?=
 =?iso-8859-1?Q?8lkoHHLqK+UGDzvaSH95lvW4i3frHYF1d5uWZmqyeQ+0zIRll/uZSIA9Vm?=
 =?iso-8859-1?Q?lf1HmtG3PJOhSTHGHoEzOUi6F5jX7rKXVjz8uNDEtWbWvsXTNMmfULovxq?=
 =?iso-8859-1?Q?O0sjPqvaoA9mNxwf0GsD6l9Y18s93hp3LMEJjIPylaAz/vLcrwULJk8AXp?=
 =?iso-8859-1?Q?gTccTMVHVzKcdWrVu9vED2QJuKA0kFdXCRrSLBvZxMzGbX2ERxoHRMWXco?=
 =?iso-8859-1?Q?enDTLTPtDDBfV+GcwFbAjhe8xGUY8XzZ6zgNN5SRc9kUDOFLRWs0N8Ig1A?=
 =?iso-8859-1?Q?XQvzlSGbfeOnfKrqZUSVdYWgsm8k?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yrpQM1DwLjpDV1oNFWChzGRDT3viba33gHmxCndE26f6gCk4DreyrQCMAa?=
 =?iso-8859-1?Q?U34q33UCAI/G3sA1A2IxoIE6VFAlTUm4Tjqva/X7mxMM19q6IOLgXgvOeE?=
 =?iso-8859-1?Q?ggiZsoPDur9q9iK9HOpLjIPy/zBCTh+kDo+qUCyJ9MddwTwYH59n5+gMQ6?=
 =?iso-8859-1?Q?tOwnmI5yAz1rSOnP+LrOmEUfpDWWdoeT+/EIHYBAN4J+9EP7Uk+kxRfsb0?=
 =?iso-8859-1?Q?MYYPwKFPF2v66sbJMJ0RBk3LHvOFyH4Sem2N1ayZdSpyMU21y0pwcuoi3T?=
 =?iso-8859-1?Q?yurZtrxn8JMaeiFkJYmrFecC0BDnMqH3OUFxOhs4cL/jzpe+ykscxJ2REn?=
 =?iso-8859-1?Q?WGmZX/1y67XZzleAeDR/eDPIWaSlnTbfh6nTOhsQXP1hA6zebtohf/Jdit?=
 =?iso-8859-1?Q?c2ovoZZYAlCkBA7xyUSGLJH857mmi/hNTdV/YhDQnZE5xZsyjb0PyjHUFR?=
 =?iso-8859-1?Q?N+KzXL3edimEeBuafgNq7e+0pgAIcIIXLd4TaQx+HTUDMQ5ZZ7kQuM08Uo?=
 =?iso-8859-1?Q?EtiRpLodzModrgxOKgehpJn/MxJDjKP411W4JZ4iwv2JAelAE9976/86hW?=
 =?iso-8859-1?Q?nBWLcPmny6za2MTkCHrsNVx0EuW0GqYoXwXVk/60IIpkcLKHyc935XnDC8?=
 =?iso-8859-1?Q?DNiVu7bT5FO5J6S7RGXfqk67Cbtl/eSivy/tNHbNDmzk10nPjY7XCoA1/Q?=
 =?iso-8859-1?Q?++HDIwvnTCNyvqlhWPl1JkQlobQw/S5ifhnsmRDrvP8lYlo5+D015DwSSC?=
 =?iso-8859-1?Q?kGjVvR/ll4+TM1jKo10oZWdhm/12aLiszqLdVhthT+BcDmO1565iqr+5MX?=
 =?iso-8859-1?Q?WiULF1kxXP0IKV+I0CmRzW/pNwYpWKin5PHD41WkXgd292yfXlOWTon7NV?=
 =?iso-8859-1?Q?iyVaIadrY8PgSTpzcMJLgtjywdT39+TT7vIzmBMFxBsXMuKZRG86/cmG9A?=
 =?iso-8859-1?Q?WNpf+z5HhIOxOasSstqVbBwGP2IOTReTO6/moKEGInpbv3g2g7JFoZtxvt?=
 =?iso-8859-1?Q?+WM8pG5HW6pPTom7sEbL7vJ57CffOtH/pij528DArJ/yNKscnpmHhWYi6d?=
 =?iso-8859-1?Q?hj0enP9qHwZvFsaUuYqbiayPxnsxLuC3KFQXpB9BozaTajcu8PSdWDpqF2?=
 =?iso-8859-1?Q?iJpOt2Klgn/7NohwCOrWcoHDqI7ktV+IDpLVbggifpmLbE3dHRfJxTY3DK?=
 =?iso-8859-1?Q?Aw3AuX6itV0NeY4uwxEzmTue+pgeatAl6N0T29lNDS43ux9vJF6Kkhjdqp?=
 =?iso-8859-1?Q?m0X3Rup2CSQN/bC30PitERGt7pvob/+Otazt/dbynUZs45hBVn1NpGH3HN?=
 =?iso-8859-1?Q?Dko94OMSOw+X52Gsip8HThcxgNiWzb7CPj/Dr/fdKetUw7jbJkLXVf/dkv?=
 =?iso-8859-1?Q?GWx8bOpoBjZwhYKqeEI7XpkcCT5eTcbl86C/YDcgF2r6O3raAosAgKO2ZN?=
 =?iso-8859-1?Q?91DEGwWnaCz6iSRKezjgXr3M5VOqiCbkqpFv7z56hzkJexZG62YHLQNCFt?=
 =?iso-8859-1?Q?Bo0CAVvg6QWYwekrxgsrOGkEVV3G9YGTsRKDag/FIjo2LUzwFOGlcl3e+2?=
 =?iso-8859-1?Q?JefHuxwP2v9aVVZIlfc1nbS3iddjsgR/DgNwChN+6QBos9rHCgSKW+eUqs?=
 =?iso-8859-1?Q?etaYrh1lpKN0sarV0IiMiIlqUB260s9BJWIu2Xd0KHfOZLhRq70MuHIA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50bfec5-e808-47dc-d340-08de3e3da897
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 13:59:27.4913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9Lc2Db+fkzDk5bxBjcdyMr+3QWtv236AVpepJ7z5GcZvL+JzQRkSCmKCG/+n+pI1SksiG1sSWKrfGWjEn3mi1LVw4rXN8Ed26rOENAufW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8636

From: Grygorii Strashko <grygorii_strashko@epam.com>

Xen uses below pattern for raw_x_guest() functions:

define raw_copy_to_guest(dst, src, len)        \
    (is_hvm_vcpu(current) ?                     \
     copy_to_user_hvm((dst), (src), (len)) :    \
     copy_to_guest_pv(dst, src, len))

This pattern works depending on CONFIG_PV/CONFIG_HVM as:
- PV=3Dy and HVM=3Dy
  Proper guest access function is selected depending on domain type.
- PV=3Dy and HVM=3Dn
  Only PV domains are possible. is_hvm_domain/vcpu() will constify to "fals=
e"
  and compiler will optimize code and skip HVM specific part.
- PV=3Dn and HVM=3Dy
  Only HVM domains are possible. is_hvm_domain/vcpu() will not be constifie=
d.
  No PV specific code will be optimized by compiler.
- PV=3Dn and HVM=3Dn
  No guests should possible. The code will still follow PV path.

Rework raw_x_guest() code to use static inline functions which account for
above PV/HVM possible configurations with main intention to optimize code
for (PV=3Dn and HVM=3Dy) case.

For the case (PV=3Dn and HVM=3Dn) return "len" value indicating a failure (=
no
guests should be possible in this case, which means no access to guest
memory should ever happen).

The measured (bloat-o-meter) improvement for (PV=3Dn and HVM=3Dy) case is a=
bout -11K.

[teddy.astie@vates.tech: Suggested to use static inline functions vs
macro combinations]
Suggested-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v5:
- rebase
- drop moving usercopy.c as it is not needed since commit 7370966d1cb7=20
  ("x86: move / split usercopy.c to / into arch-specific library")

changes in v4:
- move usercopy.c into arch/x86/pv/
- rework to always dynamically check for HVM vcpu(domain) by using is_hvm_v=
cpu()
  as requested by Jan Beulich

changes in v3:
- add raw_use_hvm_access() wrapper

changes in v2:
- use static inline functions instead of macro combinations

 xen/arch/x86/include/asm/guest_access.h | 78 ++++++++++++++++++-------
 1 file changed, 58 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/include/asm/guest_access.h b/xen/arch/x86/include=
/asm/guest_access.h
index 69716c8b41bb..f0e56b112e14 100644
--- a/xen/arch/x86/include/asm/guest_access.h
+++ b/xen/arch/x86/include/asm/guest_access.h
@@ -13,26 +13,64 @@
 #include <asm/hvm/guest_access.h>
=20
 /* Raw access functions: no type checking. */
-#define raw_copy_to_guest(dst, src, len)        \
-    (is_hvm_vcpu(current) ?                     \
-     copy_to_user_hvm((dst), (src), (len)) :    \
-     copy_to_guest_pv(dst, src, len))
-#define raw_copy_from_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
-     copy_from_user_hvm((dst), (src), (len)) :  \
-     copy_from_guest_pv(dst, src, len))
-#define raw_clear_guest(dst,  len)              \
-    (is_hvm_vcpu(current) ?                     \
-     clear_user_hvm((dst), (len)) :             \
-     clear_guest_pv(dst, len))
-#define __raw_copy_to_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
-     copy_to_user_hvm((dst), (src), (len)) :    \
-     __copy_to_guest_pv(dst, src, len))
-#define __raw_copy_from_guest(dst, src, len)    \
-    (is_hvm_vcpu(current) ?                     \
-     copy_from_user_hvm((dst), (src), (len)) :  \
-     __copy_from_guest_pv(dst, src, len))
+static inline unsigned int raw_copy_to_guest(void *dst, const void *src,
+                                             unsigned int len)
+{
+    if ( is_hvm_vcpu(current) )
+        return copy_to_user_hvm(dst, src, len);
+
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return len;
+
+    return copy_to_guest_pv(dst, src, len);
+}
+
+static inline unsigned int raw_copy_from_guest(void *dst, const void *src,
+                                               unsigned int len)
+{
+    if ( is_hvm_vcpu(current) )
+        return copy_from_user_hvm(dst, src, len);
+
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return len;
+
+    return copy_from_guest_pv(dst, src, len);
+}
+
+static inline unsigned int raw_clear_guest(void *dst, unsigned int len)
+{
+    if ( is_hvm_vcpu(current) )
+        return clear_user_hvm(dst, len);
+
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return len;
+
+    return clear_guest_pv(dst, len);
+}
+
+static inline unsigned int __raw_copy_to_guest(void *dst, const void *src,
+                                               unsigned int len)
+{
+    if ( is_hvm_vcpu(current) )
+        return copy_to_user_hvm(dst, src, len);
+
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return len;
+
+    return __copy_to_guest_pv(dst, src, len);
+}
+
+static inline unsigned int __raw_copy_from_guest(void *dst, const void *sr=
c,
+                                                 unsigned int len)
+{
+    if ( is_hvm_vcpu(current) )
+        return copy_from_user_hvm(dst, src, len);
+
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return len;
+
+    return __copy_from_guest_pv(dst, src, len);
+}
=20
 /*
  * Pre-validate a guest handle.
--=20
2.34.1

