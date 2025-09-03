Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AEBB423C4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:31:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108464.1458622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoVq-00036s-Uc; Wed, 03 Sep 2025 14:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108464.1458622; Wed, 03 Sep 2025 14:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoVq-00033J-PJ; Wed, 03 Sep 2025 14:31:02 +0000
Received: by outflank-mailman (input) for mailman id 1108464;
 Wed, 03 Sep 2025 14:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoV4-0006B7-J8
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:30:14 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8087419a-88d2-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 16:30:13 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB7844.eurprd03.prod.outlook.com (2603:10a6:20b:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 14:30:09 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:30:09 +0000
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
X-Inumbo-ID: 8087419a-88d2-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPVIcZMwCcxDkz+QtG7QO2rD1Upd9K6ycftXoXiNcVEMqggAhJJUVbh7swQjaH98IN3XY0/eZvtIwr8ZOrYmOKlnIp543DvXS+mqA0ee1aegjbbhEBJjvSTOZrgqA97VxNqCxqWmopI4dU5s0HbtWLasuOx6RHFFXesu7YDJ8pZqGgLo+WrTe0NiqDh0eIe3slkYaPqMrgOfHAAz0a08TYLQdOgHcHo+rnydTmcY+6GgDbMFMUnRax01OWq9HGQkzdaKLp+pXo4j5EhrAqIFbYrNPInDUTszzBdjU9Kt1i8gOsANbsjRPQQXlHrId+4gSPe7yJcV80/Ksi+WdQTb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4P7Skptts/tLyCoYlyO9TM/LWsioRSC96rqr3DpuzSM=;
 b=viePGEdrb8D1Rf/2lhRxeUkhx9lSLgF9HyyraOeUJk0T4idjY1Ro0N2AZs87ZCcpnaaKiIikzF19cfbDJ8EI6eG3yxk6+kbkaAyL/3bPOSY8hCBBQvaWk5+Ldi2JiqkE2DgUZE+iWtnawZINyq8vHO8S02Amgvljldyt9FKwdqXiOPQlmuKAuGwF2KSYgoCgIbHSW2qLJtzf8Wm3DFQ0uQHPnr3UobRecw5Px/MWmKs9gUH2jWHbNddiM4v64J4WmaT/GRXmBymnHPkvrQra1j3+R9dvapGw7PtcOEEgbscIFC/3iJu0QWHtv3kw84ER1faR4uDuPaVzV38X2s9EHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4P7Skptts/tLyCoYlyO9TM/LWsioRSC96rqr3DpuzSM=;
 b=mXHFcBTG35DzxebPLlsc2u9dHg0nf6bF+eqSAwKZf93FYqhqMlkvfcoYUnrPtHtoGObtrUAfHAqT42fFsJsgM1uWTtPsigT3CoYTgd83uuawWpgCU2J3RvsH3JLDNp5GEYxwVbf/1PLQSyomf8d/J60wR4O/YJsyIzco4SDoR/MLMgXDMQ2/WHr3+BOhNdjTZUhLodoqjSr0S6Rz5bGR8Ud88/gojSjGVcTecyA+qP5k6gR13QxWZ63Yx/U1Z66TQ0yVkrIEloTCzhZC/LnFEiAnSgi58sfLH0E9W++W9MSEvZoGf2xPi/UkaFqg3slipNdhxWZqSMUXmq41OLDs4Q==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow
 eSPI processing
Thread-Topic: [PATCH v6 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHcHN8/Ah6J9SF+q06s1wKlnTLbDw==
Date: Wed, 3 Sep 2025 14:30:08 +0000
Message-ID:
 <c32133f6b25155a72d8ea91e1183d65d9083c7fb.1756908472.git.leonid_komarianskyi@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB7844:EE_
x-ms-office365-filtering-correlation-id: 68a09ed4-ac28-4344-5fa8-08ddeaf662df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?st8ESvCyLsCIovEquwVuIHiiIVxTiSt8VtRMlQSRf/fZ1uAGPFxfu8wr7b?=
 =?iso-8859-1?Q?FuUv0Do5j9ov6XZKGAxuTZBN/3JPNEhIG7xNKr4BKgE/ZFZ2JSi4HA8HhF?=
 =?iso-8859-1?Q?tuoM09jgRwuREK88VmQCBTtiQ+dANeXgSan0JPhOe4XVm9Fg29SVNXEqmo?=
 =?iso-8859-1?Q?R7bD//UCz5E75LWRJFlv+gYlObfQLQ/imf7F3uTzH2R/XaIk/PKlXPyPme?=
 =?iso-8859-1?Q?H7jwWblD7p0aH30AmbVRPt94Cb9hdZAsEds16C/z1WrBpWfFHPa/jLedTu?=
 =?iso-8859-1?Q?Xcb33NgvFiPavynkybSDADlVkeC32ecoacotu6+WJtYQ4InZFgUIwSyNi+?=
 =?iso-8859-1?Q?k8hh+CgN5W9AAFd1bkucKq2nDz33p8M4D3+1Lh552IKsdrjsA5SK6FTziv?=
 =?iso-8859-1?Q?2Q0WaZ3HI5dHdo/+SUGypkcsFkb8oP/omQ6mCt0nTAa+gBhPuLF/rli0Pz?=
 =?iso-8859-1?Q?1ukzX1l42ufUdQbOVd1R20I+Ot8XJMPzB6FkAjPifJPcZA9o/Ef6QxH45B?=
 =?iso-8859-1?Q?/icpbIzFTliuVo/sEbdETtan9BOAmNjKJvLbEt+ILCV30rsOAjAxCxEMoa?=
 =?iso-8859-1?Q?HQPPlBCMyo/IoE9taayDkPRa9OczQ66uw7Oa4Vqo8bk8OoDFSYCPGdxB/i?=
 =?iso-8859-1?Q?hxvkDECMBLSk6Q/9FxPUs1uG0qpwbWFIAJY1fj+j72O0MzWSm4md0JroeQ?=
 =?iso-8859-1?Q?nv9tHFyrzWFQ23XqwEBXmKDYg3W6o+fs/Pf2Fcnh1cVzWCaiNk7PtFI8CE?=
 =?iso-8859-1?Q?+kNv1MalVJBcaM8/p5rxr+umvDcEd8ZzsVxqOSeGvZnjXXyR7BHyjOk+DC?=
 =?iso-8859-1?Q?AAQlbn7vfGAr4N0VgguSOVeKkuCop26JRI0AMNahy2Z+kiPiXM4DmQEudz?=
 =?iso-8859-1?Q?zjQsUR8kgS2AlSlmcMnZYzP/rCKhL5kNh/bGkFPuzzbpWr72AwwdKOf3VY?=
 =?iso-8859-1?Q?+0jZeyjJ12GCFZA6BJmV+Bp+4fVPe05y6AkpBzhtnQ706qjGUEzf3RfsrQ?=
 =?iso-8859-1?Q?BOF0QCsduKpYRNayQzLvosDyQXxvVNOvTofqBI2PMrRLs1kMR/K3vFYb+S?=
 =?iso-8859-1?Q?BaayG38okNy76qPHcGbcCFQAY8A/rys2bFoKod872obJYr94NULWjvQQ3G?=
 =?iso-8859-1?Q?unCKH3+fA23oRoG3OTztwfgML6v8ew5m5cOhdpP6zAzRenXXZM22JxCTTe?=
 =?iso-8859-1?Q?h6+wgfQq9a4iQci21W7ajvnYHKUwaAvOWUXryFc7fCM0MpWezdTXV4175x?=
 =?iso-8859-1?Q?qXba8cgqv1yG/SApUk2GlRcdK41i9wI7wivh4GlmjlxNlYJ9Z168x14VrG?=
 =?iso-8859-1?Q?vdmXSLXgto2D1CRAjLHPowFRxkJa37IoYDXGhtzP/oIx4+Ca7XHSpAfB70?=
 =?iso-8859-1?Q?naZ1R/GNIX3ynlvJOZL61ie5eKCL9PiIaH8BTqhnmWjfU+7aRrA7hDlhVi?=
 =?iso-8859-1?Q?aPRMB1aY184Aj7fOsMauXbBhq5+sUNny7s1WqGXwz6Us2vMoiEOqfacrJS?=
 =?iso-8859-1?Q?g45mDKV5Je5R8X+Yfr2XOQAduRYmt40zNPzoY/Laj77g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sEj5OMdAwtFzc0nMDDNJJYQPxudFScmu8DAi7Bt5LAmLPVCsfLf9IFPV3/?=
 =?iso-8859-1?Q?LF+D7IlXyjGlfo575epHLegtClnZh1PVd2JAI1bEHZxz+8JQFsi/RUmEJ1?=
 =?iso-8859-1?Q?gmx07wyHdwd0DSKpS+6seq27hY8Uhl5ofJsbyK2eMVAfn4M9HrPRDvRofx?=
 =?iso-8859-1?Q?/wi9r3hodygXvLOHck8Mm7jlZkqL1KRp7bSVThstifNzqMsp+TykOjNsY3?=
 =?iso-8859-1?Q?Zfw+qyHDZXWxp5ZZpwFcXlNoan57B1BpBznaNrfhEaOZoLuE3OXvS9JA2h?=
 =?iso-8859-1?Q?WKArIJucrp/7p777yZu42Bn4cpzWjFJGCeatzE2gS8KvCLzJO2HBaoHZjX?=
 =?iso-8859-1?Q?2r5yFjIwkE98Wjvlh2uH0Yge6lgqv1ZzTA47/W3Cvk8lvmBWa4kZ3FboL6?=
 =?iso-8859-1?Q?bZvnGm70F9TVnXgHCiefliw+30Q4FY2HyTN6AVaQp+83W1FaQApPiuH0yY?=
 =?iso-8859-1?Q?r2IExj4DZOr1zjoLQFfvcUaBdffvOtALKtU9SjrkEQt/Nd2rbSCHlzrb5N?=
 =?iso-8859-1?Q?WXlD725dREZHFM33x5OPmNv0YetrT4ajrH8yllV+BCsTHH5hOhVUwkRKAP?=
 =?iso-8859-1?Q?47agjwJx0qv/yfW7Xqhe071Desa1XK4IqrD57jX341KcU7MgCjDQbvPK58?=
 =?iso-8859-1?Q?9NB9WFTwGogokNDrLt5MJloITn99L2Tt2WZvnW3iHI34FRdy48La6rE100?=
 =?iso-8859-1?Q?lAloMFJlYpR8tYbhBxbds9Zdr+pnCUBY3nsFaGpxcqRKNOzQy/ZbTGaHBa?=
 =?iso-8859-1?Q?p6soaVTiAQB4nFJQvIF+f4MT8hn5cxFJBuB4wsG0yhdQmbPLGGOZGKEgi3?=
 =?iso-8859-1?Q?H0eb+I2fhWMO6W7UUIDMBm29HzlXdwNbU5rvGPAhr7polF3+J01u1262Ld?=
 =?iso-8859-1?Q?xs9RTPEpiluqNASGzIUnZmPh1huEIkoQW5DHf3n766ln/gAi1/05cPAPdN?=
 =?iso-8859-1?Q?xXw0PXswh02H4oSh/r98JR6CmeuFQP3TIZ6mN8Nmgvj7ZZewfbnR1xi4s5?=
 =?iso-8859-1?Q?R8IWHVEl9eOpz/8XjRj9wpOp/kkjLC0YS0cC0knqLQrkjcAFOVPtcEizbZ?=
 =?iso-8859-1?Q?GmDdZlOwuJWK0V1l3qmiidblzBST5PYRD3dP1zyRpBcI5s0zE0J/kvMMfZ?=
 =?iso-8859-1?Q?BTBliRlDWwcq8yyPJKHtPHhcoHGn4HCX6EUUhxicagu1g60271BoerOc9Z?=
 =?iso-8859-1?Q?JCKRPNezbMQ4eq+8HzrADFTe4mW2XRJfmpBhFAWNWxIqraE7zt2yOEF72N?=
 =?iso-8859-1?Q?Pwtw9z6iUQoHkpphgtKfIWSyZ9Z2tKiHKT7RDn18ng28XGjGdY21NkrncC?=
 =?iso-8859-1?Q?exwi6BniYglImV/sTW5gV13hD/tv+OkOY5p/AeMiBufEfX2jQxIHz7X15x?=
 =?iso-8859-1?Q?YSUEB+Heo7uxOMy1oSbeby3XNyZMQ/ie4RDraNmxa7JNhIOvzwM7RjM3t7?=
 =?iso-8859-1?Q?4MfjBsX1iL0r42eB3RpY1IT3tPbG76mI5moOMwrm6Nj8n7DTmqNB1yq3op?=
 =?iso-8859-1?Q?zONg1S2X0RalcyV6GR9Z/IbjnjLbqyrP5gu2oXAzvIh7SF4/CzKZzwNQPv?=
 =?iso-8859-1?Q?I3txsqRwnSSw3CO4Pv0kFdJ9eOxkjFfMTsGsYExi8najwKAB9DQS0sWguj?=
 =?iso-8859-1?Q?VISTn+nxuOt9S/P15ya6CTRBAcf+KDm9CUGCWxDcjwuBMtBBqIVDdrk9+O?=
 =?iso-8859-1?Q?MqGOmMokCoP4l9CS8iI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a09ed4-ac28-4344-5fa8-08ddeaf662df
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:30:08.2475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vf+0nB5AmsWlXOVFgboKJQ3brR+I2l1MdmAZ8buAMx3xS9iU8gp6Wd6a57h2ifDrMl9/eHhVMBLk/qoMDVVCu4qzGj4P+wRRNGXVGJfv1ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7844

To properly deactivate physical eSPI routed to a domain and allow them to
be retriggered after the initial trigger, the LR needs to be updated. The
current implementation ignores interrupts outside the range specified by
the mask 0x3FF, which only covers IRQ numbers up to 1023. To enable
processing of eSPI interrupts, this patch updates the mask to 0x1FFF.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V6:
- updated mask to 0x1fff to avoid confusion
- updated commit message
- removed reviewed-by as new changes requires additional confirmation
  from reviewers

Changes in V5:
- no changes

Changes in V4:
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- no changes

Changes in V2:
- remove unnecessary CONFIG_GICV3_ESPI ifdef guard
---
 xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 3370b4cd52..c373b94d19 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -211,7 +211,7 @@
 #define ICH_LR_VIRTUAL_SHIFT         0
 #define ICH_LR_CPUID_MASK            0x7
 #define ICH_LR_CPUID_SHIFT           10
-#define ICH_LR_PHYSICAL_MASK         0x3ff
+#define ICH_LR_PHYSICAL_MASK         0x1fff
 #define ICH_LR_PHYSICAL_SHIFT        32
 #define ICH_LR_STATE_MASK            0x3
 #define ICH_LR_STATE_SHIFT           62
--=20
2.34.1

