Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D08A6CA3
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 15:40:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706979.1104426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwj2q-00047p-Qr; Tue, 16 Apr 2024 13:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706979.1104426; Tue, 16 Apr 2024 13:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwj2q-00045M-Nn; Tue, 16 Apr 2024 13:40:20 +0000
Received: by outflank-mailman (input) for mailman id 706979;
 Tue, 16 Apr 2024 13:40:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f57D=LV=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rwj2o-00045E-MV
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 13:40:18 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2608::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc5f90f4-fbf6-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 15:40:17 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8552.eurprd04.prod.outlook.com (2603:10a6:10:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 13:40:15 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 13:40:15 +0000
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
X-Inumbo-ID: dc5f90f4-fbf6-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obEbx5VnY+hv/9FscL0VVeeIys38LGQopWmn/zxPPcij68N2ShZb6hH73zMYIDb5iEDEGZQSIx6BXMh0v/RPCyw49xxPgVPRHbOeAAWZ93q7jp4I4bibmKiAld53mlIg5SRJ2pstbAKx1bXOVfPlG4deEjQ09h8q0HB53bklYj1hHm0rG6hLpjnzr9k1NaGN+n2zDsx1nqo0VaZXrJMywMxq8rDzO3xs/LBNKnJBgAQiSRKWqp52DI82JFfst7P//Rf7z7IwGjNRfDn0M0IN+wzYyGdRsQjBsNmxf+jEYWhrt53sZ8lFofEGRpoveS1xps33vM9vvCh+fQFKj/E3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zo5YjZtryzvZsmso8G6AV+EUVkcMaHBpmCwG+0FAoE4=;
 b=VTVBX/dpv9Fx86SSbPYMcDaZQnjAerUvKwKZazpQXABww5T4VlfCE3c1TvbDO4o+8KQjLLZLUFOzVOBfsGd+SS99pv9p+BHK8msk6wOfm2E+jrnsXUE308HfE9r2MSP13MvU9qK36EVezDQ4j+xVWBxy6jx1eSnokhP5wZE18f0mrBOOBSFoYobujHZDW5Gqj+uo8TK3CgSP5v+mvTf5kkZFHQqkxv+8HNheHmb+exA5jpPE0KYEx6z35XZ6GnTCLU3dJSyaddkND4ib6Oy9FSzzqaCOREgbotSHoaf3XFHf8/1ieKIMAeSvpeQ5G2cOD3CC3uXvxxqpMZ0V6EXKlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zo5YjZtryzvZsmso8G6AV+EUVkcMaHBpmCwG+0FAoE4=;
 b=CSFNWiVGx9FKiRQ7mE/dUK4RNDV9QkJI5YaindpLGwVou8fzxOOCYmXnusLgl+Hr7imsG2B2uRB95TKM9iMQYLdx3qE7UAVL2FoAEhZ7WHRq3IiXT7X5suZidkQmGb4NcDDWWIXkH8Qk+/B9rHArlLIdqpAIPZ09dndNLMfLnLU=
From: Peng Fan <peng.fan@nxp.com>
To: John Ernberg <john.ernberg@actia.se>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] xen/arm: imx8qm: Re-license file to GPL-2.0-only
Thread-Topic: [PATCH] xen/arm: imx8qm: Re-license file to GPL-2.0-only
Thread-Index: AQHakANs0o7CMXmy6E6n0UqJT/8QvbFq5xeQ
Date: Tue, 16 Apr 2024 13:40:15 +0000
Message-ID:
 <DU0PR04MB9417D2CBEAE4D002596B9F4B88082@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240416133844.2544452-1-john.ernberg@actia.se>
In-Reply-To: <20240416133844.2544452-1-john.ernberg@actia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DU2PR04MB8552:EE_
x-ms-office365-filtering-correlation-id: da83ba33-da59-4062-9df6-08dc5e1abfb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Mmiyj8XUMWu1vZ1Copn+74SQcnXyG4HGgLvaXxBPSZJU18m33sb0gs5LtE2TE5QxP3aLAQ3rV0QzDtSKyTWlkvVhu/coYMQdcq8VVLn9LoQDI1qkhTSUar6lHl040+KAq7w6MhcTPLsPn7NzlwhIi+hGh1prdTznlmWtQ5XNUifO1dmBnGMpqpKOsq0eyN0+t8GfQT9gU2QlFXKNdWjIhI5l8XebLlrEFe5An9o+ZXMAXfhmmXlKImdei+3erxi76J1dChuBw6zZa7ait1mF3jdfYKeSNCJlgQa5nqDQhabgnJvdzadRtZ8xCEXN1bg4Lro9A/VZURDWZNqNvVAbnN2n/Q+aWMUwjXT4TphubS83ILPR9J27qwFSFPVaUTCKwvffcMao2Yj9lUiq8Rcr1c/FlGJYx/paDNHlhO15svv+13k8bS7ztqeont8p46HSEhdJZzjXwBTaxT4WabH87L6aTakQQbi2iE4NolOojKwafBBC2phO1Hija6yveyS0wvQy2IoJQfYqnUr57ANwhpJ6+WThiPUgTNZuGjGfANaPJZ2juzWcUG3Vbv9LvpRjkG8oyo2oby5qobfnEVprd/gsKQgwCRk+MMDxhwoSxP+tJHjLacp1XK811cl3odlj6jsV5Pt62OTQH9btq9hXsstHuApgMvg5CYqxe+9rbF0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7p9TCA4W+vLiiLICwIHOiKdDAxOOFptmYahsNtt8L0PcHfHNUXPHSXeV3/x8?=
 =?us-ascii?Q?nsxcMwiOmQy6apmZYZnmLSK6Ox2cV5FakDDcyxw6rOSBZKkDh/gXYLMIloxh?=
 =?us-ascii?Q?XhCBEOTlBiEivQMQmvi9aI/7pWpsv5Dz9vy6XCLjEMNllvAiKSPhG3i5JLWB?=
 =?us-ascii?Q?2nWujxd9mcdBw7YCyiz/cA1e8ljtQ4mWHqwy59CM48A6qJ5+sGSPxSNgdNxZ?=
 =?us-ascii?Q?jQ8/JJFsdY1zuyc0xQmxoMbPKJgpkKKS70oH3OiDGyT0feM+7GiUW6KN5QAz?=
 =?us-ascii?Q?tDxem08yQvz3nnHp0Xu+MmTNbrea7k/nWCcYqfu6B1pmWvn3Yb6iVgS1Doqz?=
 =?us-ascii?Q?8CUjQtYRLcS1U8hIJSy7zRGuYZ3SPu7rL5qqnjh9j/r3M6x8HaZREzJPRnkl?=
 =?us-ascii?Q?jEpzzTR8DGmMbM4rBBLPJVK6CjNUQAt6VWbRAcpBtZGOvYSa/AjAlETMeYaU?=
 =?us-ascii?Q?TBPamA/stTlTLk/wqXhDs7iq7ROu3+YyJYiutnDUBAqn1PozcAePeHdIVzU6?=
 =?us-ascii?Q?395jHtHcIc3lQD9BuXFLT/b3Et2zcnlvrlXKFRlOWv7VlqLPUhjsqa455suU?=
 =?us-ascii?Q?1Ug7b0mpeQgWm13C3QpkHODqatqeXtkm5Zmpy09vE4R1GPN2X6enM8AqZCgB?=
 =?us-ascii?Q?mm9gMv5hEtXrcJOsxbq8RtDWwzTTGlZG6mFBTgWhG7ZMEeA3Cyqlwu/DUqZc?=
 =?us-ascii?Q?P/JYMbf6PIGA1JjNrla9USl2hL+ZmNlrgNRpNNys8Xxt0vuiLRAvAO+WWvIr?=
 =?us-ascii?Q?OKelGAiajZQWlT0JB6tgU78VXX+0EUxb+5n/Uen3tvMInPOJhVcWODJNq3fJ?=
 =?us-ascii?Q?uAxBRQFgAnkTTzucCXqOXQrkDmZE1ZSyvKrDkEUGfHioc7x9ntU0k0A6wyCj?=
 =?us-ascii?Q?sngDUfjod/ctxxo/izLf95VP+QEx0a+Kncw5wBhigdFDs6GFWjZ7VTySLSae?=
 =?us-ascii?Q?U6ZnW/yCby7lYZ6s5TQWgpxKCGuG7atrwVFgU6iOpmpxaW+Qqia/LjEdkhKc?=
 =?us-ascii?Q?x/fOVkhPDzzpbSYL3GA2xiipEyYx9eLhOk7Tb/sRT1/G96qdcUaOUHIHKa+H?=
 =?us-ascii?Q?tN1DWw1rEXYjQv5oNik0nXQPxEzZgJXGeFjo2X72WoHeSgBdRidkeicwQLFi?=
 =?us-ascii?Q?oJc5z2MOu4euP3vP1eFnDzYKXAO56SdPR/KRGC+dES+37BENQeCqslARMPJE?=
 =?us-ascii?Q?ptkdjzfBbBfBAwkfWsLCA0m+HsI0npkYK7ZzFu5D8EeNRRREsSwXAwvF/5Ja?=
 =?us-ascii?Q?Tuq82J5dQp/tfFfS9E10viK/os95p1o7gfJk1QsWbjd4ukTo4iBS7uuCckVZ?=
 =?us-ascii?Q?Y697zOwWzf2A9CzMoHeovWZo7R0EuOvuPgRn2a2kcgqri0Ogq57cH7ksvUwv?=
 =?us-ascii?Q?d3hGEaJKYCMNCG5TQCwOFGFrK3ZCU5Dl8JZQVG4FmvhjR17AujqSzYPYLuSq?=
 =?us-ascii?Q?mreXXqVaGlSseibWGMzsWecJ56fR3oXL48HCOSL4bFZLVlLxb69ZbEpOKV1k?=
 =?us-ascii?Q?nhQHgqkaGSeMT0cc6lvolIcWGpIUFlV7qtDHt7sI9OoA2gKw1mPdxLpMX0v/?=
 =?us-ascii?Q?2hdYI9ATpggdvoSiFk8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da83ba33-da59-4062-9df6-08dc5e1abfb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 13:40:15.8523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TaWH+/dgU2YzV8C+xLD4p0TNTet1YEj6oZ56L5p3ZZz5xlyie1oACkX7ff5BNcacmOEaOKdaMoVH0c8lJn6k3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8552

> Subject: [PATCH] xen/arm: imx8qm: Re-license file to GPL-2.0-only
>
> New contributions are recommended to be under GPL-2.0-only [1], since thi=
s
> code piece originally came from the NXP tree the original license was ret=
ained.
>
> However, as discussed both Peng [2] and I [3] are ok with GPL-2.0.-only a=
s a
> license. Change the license.
>
> Cc: Peng Fan <peng.fan@nxp.com>
> Link:
> https://lore.ke/
> rnel.org%2Fxen-devel%2F084b9ed5-1585-4802-b504-
> 6ccd2f262542%40xen.org%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C
> 0620114718b349f6acaf08dc5e1a914c%7C686ea1d3bc2b4c6fa92cd99c5c30
> 1635%7C0%7C0%7C638488715401364850%7CUnknown%7CTWFpbGZsb3d
> 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
> 3D%7C0%7C%7C%7C&sdata=3DkiZCfwbHB4ovpKwpcDSsC%2BqlHp2rHWOF9CP
> Z9vr9WQ0%3D&reserved=3D0 [1]
> Link:
> https://lore.ke/
> rnel.org%2Fxen-
> devel%2FDU0PR04MB9417A835B5D04517CC11500788082%40DU0PR04MB
> 9417.eurprd04.prod.outlook.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.c
> om%7C0620114718b349f6acaf08dc5e1a914c%7C686ea1d3bc2b4c6fa92cd9
> 9c5c301635%7C0%7C0%7C638488715401382481%7CUnknown%7CTWFpb
> GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> 6Mn0%3D%7C0%7C%7C%7C&sdata=3DSgqvF8j1qcbrRxWlibrZOt%2F5V2kcjJQI1
> pUSLcphjoo%3D&reserved=3D0 [2]
> Link:
> https://lore.ke/
> rnel.org%2Fxen-devel%2Fe3785d8a-9b16-4b74-9453-
> b0166bdbb171%40actia.se%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7
> C0620114718b349f6acaf08dc5e1a914c%7C686ea1d3bc2b4c6fa92cd99c5c3
> 01635%7C0%7C0%7C638488715401397178%7CUnknown%7CTWFpbGZsb3
> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%7C0%7C%7C%7C&sdata=3DINhtc4gq0P5UYCo9xLaM%2BA2Fuzzm2qIFb0s
> ec1oSGaU%3D&reserved=3D0 [3]
> Signed-off-by: John Ernberg <john.ernberg@actia.se>

Acked-by: Peng Fan <peng.fan@nxp.com>
> ---
>  xen/arch/arm/platforms/imx8qm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/platforms/imx8qm.c
> b/xen/arch/arm/platforms/imx8qm.c index 3600a073e8..9dac6af425 100644
> --- a/xen/arch/arm/platforms/imx8qm.c
> +++ b/xen/arch/arm/platforms/imx8qm.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * xen/arch/arm/platforms/imx8qm.c
>   *
> --
> 2.44.0

