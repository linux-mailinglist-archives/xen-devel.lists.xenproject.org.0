Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489FDB1D7F6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:33:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072932.1435921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoY-0003IU-45; Thu, 07 Aug 2025 12:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072932.1435921; Thu, 07 Aug 2025 12:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzoX-0003GA-UX; Thu, 07 Aug 2025 12:33:45 +0000
Received: by outflank-mailman (input) for mailman id 1072932;
 Thu, 07 Aug 2025 12:33:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGIa=2T=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1ujzoV-0001m4-AQ
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:33:43 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c056e485-738a-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 14:33:41 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU5PR03MB10563.eurprd03.prod.outlook.com (2603:10a6:10:51b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 12:33:33 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:33:33 +0000
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
X-Inumbo-ID: c056e485-738a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xC2vDWUaHfALOwlGbT5KRcevEK5nLtjSGsWbvPRbtZe0KmeUftXqL3lN8Km4KxKK398FVhIxIvypUbz8U+6TwLOCVfLL2xbeBx1c2Js2fNUmwvvlMDcqRVYkZ2tMvhRsaf2nB5yCiOVnq3shIxH3xz8z8KSQ2w6zslUceYPLTyffGVvk2EIoR+6BVbCP5bS6gD7PETyuODxeJz++9OUq5tqEBxR237ub7NgC2RFa654AxOGfGMJI4fb01nkh6yX3jhU0tV11yujeeta3GdKt4mmCjs3IouMz7Fbjfb3kC9tqaQDSeYspboq3olyhHTH6D8kWH6iBT3LGwrQTsG0M/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLe33G49P2ADolQsI1kIjFccVLeZ82OqzdLsO4esClk=;
 b=qOgmZYlvRzrfWjZI1jDX55JPVa4QIj/VN25Y8LhgxHfyL2GLUA13oe8YKfFwF6E6+eA+zAhQZ6d9OfPNIuTZk+fc7GkyBGXAQuTQQDMewRCtFByeGZQUI9P93FcO53KVvdSLS+qaqBpNH++nNGCAK11CqSKtSAUrC9I92L632bw6zSmdrPhRsHo/m+TvqPh98najv7aoyDG/9X6LZsidQgP/scOrsb8uQVYSLOWonqk6sVoaHDzk/Cj2G04LcT8w7NhO4kRRptU7/VHkTkSYef+HEshq664R+Ekt45b2lqAW+wL1nLewam6vyhoQlO4fowibCnaWXR9izuPl65HXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLe33G49P2ADolQsI1kIjFccVLeZ82OqzdLsO4esClk=;
 b=ble5tXSV0uR/1V6H0hSKSjIMs/yxdV7h0F99/W2IUa5sXkM1BtPX7byL4uaKii0Nk+FQ4qt2+nfUzUk6gz4+yQ1Ec4yEhIfJ71k3ysL81W68NQF9hmponyIj65vvYKF3V2okvKpKrXVl3Ubu/6eQohIo9h4XPCMsfQblTCk9t8xzZrTIPtVmkmQwZ9SQ/99eSSYJwFZHFGSdG6y1Ao9020uLzlnSE/ala9+q5/MfJCyCSY+PyF0BjSW4Yx/8VZxmTFhtxmaJ7QALDas8DOkJA1e5dIYAH6ZVSyui9li59gkAih20hT2dOiN+vElCPfc9w/8ihnuqWNoHjiEaEbA7xw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 07/10] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow
 eSPI processing
Thread-Topic: [PATCH v2 07/10] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHcB5d8lU0HcDjyxEOVNNx+lAhf9w==
Date: Thu, 7 Aug 2025 12:33:32 +0000
Message-ID:
 <c712d9187bb0a19ded1a8b28d2f9ba93815708a9.1754568795.git.leonid_komarianskyi@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU5PR03MB10563:EE_
x-ms-office365-filtering-correlation-id: 2ed7666f-aa19-407d-4661-08ddd5ae9f89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1vPB055a0Jn//lyLdjbq3S9C6HDJdOYtBs4TW0FXliu1O8jxUyaypMuo+V?=
 =?iso-8859-1?Q?bWbp7aCydgNAOq3CgbCFvBJCKK6RQhmlFQraWDveM9F0dv8aDzo901vNYJ?=
 =?iso-8859-1?Q?TyJHUwLg3LNMLursAF45+S6tB271Kwiw+ffuVmPi8XquhHbqnprSiXMmLV?=
 =?iso-8859-1?Q?MUiveAM1JHZR6QsVvPq2pRWF2F/lXcZc+Qfo9iKHqrayQpOjb2m1zrm2QA?=
 =?iso-8859-1?Q?RpIwcbK2sA7nlCzdigXkEyUn3Vj13QCSLBD4SmxOTdqt2D596pNZ6SzWM5?=
 =?iso-8859-1?Q?KT+B7OLiHck1+j4J3XQ7oBDKieymruNxxc/T1SqM6rbRZgG+0eWgwmstLN?=
 =?iso-8859-1?Q?Frn0+4I8TH7Pa5yZ55/+7EifEoOsMjItxmPjD7sZD5M7n0lixT/+Xqxtpa?=
 =?iso-8859-1?Q?KO5g/KosLg0VosH5/Yq91nY7pEocVQajDgkkVe+JwIpmvN/Xf45ht5mrku?=
 =?iso-8859-1?Q?Ln+R1Z0iqMkS69FhC1gIhIsbPwnFNPqScrEh8Bgf50QRyTUnbcLBTXFgDu?=
 =?iso-8859-1?Q?4dZMkQ20zh8HY5ITeKpEwUhkApY2w6lBMTydtAvNpAFK7WNFeJ26kQkx6s?=
 =?iso-8859-1?Q?Egtfrzzzk2qaUV4JtFb5tkaefFVhmLO4VhlyVOBVZCp+BN3yKjkeyaYFpO?=
 =?iso-8859-1?Q?vCJCMPfayMUgKqeyKXIp43tWxn5OpusveVV4M+C6OoW9wyNhune3PgPLNe?=
 =?iso-8859-1?Q?YQygqTASivPWAB1Ly1gUt98ZKUv/p7ovOlSJ/CSKI5iqyLqaXSiof1Vz7b?=
 =?iso-8859-1?Q?RtNXDpn5RiZm/mG8cCjrJpZYj8fTIKaCokfeedHtc9BLwqkT0eyRhLxLvf?=
 =?iso-8859-1?Q?sC2EfTonuqQlPLvXTN1jW6ohkFfO5FUKyiihwH/Ppr3mJTfjOfdQ4LcKsO?=
 =?iso-8859-1?Q?xiPZPZiOlek9CtS2JAJsB2WJYkk9cXcsIgD8SX7XUBYr7mI6depsFy40hl?=
 =?iso-8859-1?Q?YxQb8Tuyd+mDiphy/mSF3AC0z3HUMd+mlR6uAbpis8ebgjzA7fgWugwc+M?=
 =?iso-8859-1?Q?lZQppcQCqog+z9D3Fo/epfuEa+xlfe34EtgldnVzsGONf8d/QhltDyHDkS?=
 =?iso-8859-1?Q?UCPNsQHpo47COYLT/SFT45+gZy7cFCpMy2uzEtWWfCPIKg41QX30i2VDBs?=
 =?iso-8859-1?Q?gQ+Irvg3EsGl9hiuABaR/Pnq2GnlX4PmC3qu9IQq2+KsG2f34wIJoE7aiT?=
 =?iso-8859-1?Q?uj2RsHTlD/f9KSFrXa6dMEEYimxmMGWK75CNLhLK41UKSY52/ezz20cs4N?=
 =?iso-8859-1?Q?PbISVp2brtbWQKUO1Z8NzXggDup9topOPHKXW0eVc1FtlB09/tlpkR1+VZ?=
 =?iso-8859-1?Q?clSGU5WZarUe1Un9mAtkARgTNYZ+uNvGsDweZsUs7tgcmCPr9n0AHyss5i?=
 =?iso-8859-1?Q?MalIak8DgS4TjAaUx/qT23SmuF7WVQt2bBTDg5uhgZfl71cRUp0DLEjmNN?=
 =?iso-8859-1?Q?DCm0Yo5DnBnYbu4EwV45yq27JJa3z9gWA7iD6HPeDQwrQ1ha11BfAboFa9?=
 =?iso-8859-1?Q?9LvK9pLgNw3oYhBUmSz4GV2f4LQLNzZdIHYCYpn0gNow=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?z2jz0QWRQePtZuj/9PrF+Jz0ddXH+W33xyuLKvv8+P2Nbn85EMYLs+V7OK?=
 =?iso-8859-1?Q?+CAM6AeAMVS8QqwJtijQqA3uXIMmo1PctlYf5CR3EEP2NEt+EvvUIAfpn1?=
 =?iso-8859-1?Q?Ka1TO/yyJvAvnZDM3bfHSn6idB4fVipyaDEmOfRffbo70ngp+W28Vf3Kzd?=
 =?iso-8859-1?Q?gZelEfIyaVHxUaMdXi9XarNAHaJrOBInow0xK+e/S45i+LkLs+fBmn1os9?=
 =?iso-8859-1?Q?QVY6AzTyHr0/wHyO9fqdPgkzLlJloEYjE5+j2ksPkegciR6q+R0feNipo+?=
 =?iso-8859-1?Q?ecBxs9uCxu3G4DVfyN3WfpMzTlFhHvFdYcK6zjdL07CO7G2BJCkihrV3Q2?=
 =?iso-8859-1?Q?7TeM+IWlz9RyUlk3KrMIXNX0LXCOof46B4wKWi/SFzDZi3OdybJAUILlXu?=
 =?iso-8859-1?Q?MjlfVFoLp8DzD14RmfZKWy6MkerIiFAOnXAo2cXXyRYuJQaqTlCbJLg7Hr?=
 =?iso-8859-1?Q?DhScauX/Sf+U12obYZK1bNWjcDED4cPd7J88GBJ8YQFUd2tgYn2rzLD1Dh?=
 =?iso-8859-1?Q?F72bbeICyA2ECupG4Sn357aYIR/V0gBjyZ3M2D2VjbnFilZ9XA/+D8K5pS?=
 =?iso-8859-1?Q?VIIqhsnWke9Ex3yvPIJaYdrYmIIMdI6ftccNhku+tjlxaZW0sockIGa/ZU?=
 =?iso-8859-1?Q?Wi8HHlYdcaBnIER9hLBUhxyHGTvkZqzm9kQBlyfizgiAvdaDX7b8wgQNLj?=
 =?iso-8859-1?Q?OHzAP+/1F5btg0+J0t4sNTYa2B30VuA3NG22o0PxIaSRUs/ulg/FkFm1s/?=
 =?iso-8859-1?Q?bB4UgRG50ag8NH5oMIp0PSrIcHXZ7tK3ngi1fZqij/kUMgC8w4pKJEhryC?=
 =?iso-8859-1?Q?TAcx004jVswAj7ZqOZ3K1oTgjUBgLJmWBkPrsMyIb0R2x6MkHDxkmDyuHc?=
 =?iso-8859-1?Q?jzjXHb8+ogzJlCKB7KNVEMRoWwcRsIbfhCAhX5uaandxwwZO0OSfQyww1L?=
 =?iso-8859-1?Q?P9AFR6nv/Lf3qaxwsTP8eybbJSGStdja0wb31J57BWVlYXLk8O4Fp+lI/z?=
 =?iso-8859-1?Q?fAvmsiVpE8VZVBoLc8z4rdttdocwqLFYIV2f6LmjdoUgGselTVxSeR9KcX?=
 =?iso-8859-1?Q?HEjdgniAi3qxh0Qc+KgojpVOh81rnm/Tw1D3cGkFRLdyWHeNnRwtFLuLL2?=
 =?iso-8859-1?Q?ZTSzC2F7uyIuqyeTgwdnYt81Ok7ZxYaFdbEQxVTX20Ae2v9cEFisjJZieG?=
 =?iso-8859-1?Q?CASrwtWMz7dT96Ft8KoadaSiUhOMDm20Fj1tReRRHQEvGihe0gJfTtaQ9j?=
 =?iso-8859-1?Q?6lH5PPAAgLVRwhsn8HjeQvWClwalLSIAm1QezMYqB41HkRICvu3TlcF3RF?=
 =?iso-8859-1?Q?ADopuB6TpMCasA1fEbRKOsfbeEFWKddvdTnasDzcjTH9+IC5eWYK2fK918?=
 =?iso-8859-1?Q?311iwcN4FoM+iUyVBW7a2NaP9cGy/sKolvkIUQR+jHHsJjTaUiVa4qW5Fm?=
 =?iso-8859-1?Q?e0k1AhCFUvzKwFO5vj82Inj/asyAmbRLoU4K/ta7qWjchvppD87/5J53nk?=
 =?iso-8859-1?Q?S9wnJD7D67JbADiJoUTn6qIDkzRG6K2hadWURuaNvHK9JuTmkIRr4vTK5+?=
 =?iso-8859-1?Q?lgkVnwEpCGzAadZPmbvUJEQNqdBCgYFlP1zjqMnDLNvYRhyMClkYq14gtG?=
 =?iso-8859-1?Q?hS2ktl8WzMe2qk3/DGbyA6cisYkmDCvXd9mmcCpIKrkWUX7SrHMU55y4e8?=
 =?iso-8859-1?Q?f+Rn8CmVinXHexoQjo0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed7666f-aa19-407d-4661-08ddd5ae9f89
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 12:33:32.4744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xvu65t43ew4Vnh45BdgZlmSKUPLu9z3E3oQNdX08QRoFlaW/vTzwUOIhJrGGPw38QPzxc2l8AohBx7ABrFn7cx8GqY2/xfCYFicBTx80HqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10563

To properly deactivate guest interrupts and allow them to be retriggered
after the initial trigger, the LR needs to be updated. The current
implementation ignores interrupts outside the range specified by the mask
0x3FF, which only covers IRQ numbers up to 1023. To enable processing of
eSPI interrupts, this patch updates the mask to 0x13FF.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- remove unnecessary CONFIG_GICV3_ESPI ifdef guard
---
 xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 7f769b38e3..4f27708a70 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -206,7 +206,7 @@
 #define ICH_LR_VIRTUAL_SHIFT         0
 #define ICH_LR_CPUID_MASK            0x7
 #define ICH_LR_CPUID_SHIFT           10
-#define ICH_LR_PHYSICAL_MASK         0x3ff
+#define ICH_LR_PHYSICAL_MASK         0x13ff
 #define ICH_LR_PHYSICAL_SHIFT        32
 #define ICH_LR_STATE_MASK            0x3
 #define ICH_LR_STATE_SHIFT           62
--=20
2.34.1

