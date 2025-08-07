Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92B1B1DD0F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073349.1436395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P3-0002bc-TZ; Thu, 07 Aug 2025 18:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073349.1436395; Thu, 07 Aug 2025 18:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P3-0002RO-Ed; Thu, 07 Aug 2025 18:31:49 +0000
Received: by outflank-mailman (input) for mailman id 1073349;
 Thu, 07 Aug 2025 16:59:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xm-00076W-2t
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:34 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e40cd520-73af-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:59:33 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:27 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:27 +0000
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
X-Inumbo-ID: e40cd520-73af-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3wGOBocLUc0jh22l40lhfG64O4w3l8ZNMZ86q+QwqZfOmiSv5oNFndsNkpTaOopquM0UGT7Hlcl3bVsurckYag/qWze5y+Sg1IDjRmBZE/XIlLAitx8CZacUby3Om6quPwym8daI+C6Ez7CCI78OWrPgZENN4oF8J2Wpd4AucS1EaFIxj9q8+YGfuwsJt48KlXLiDvAFKzoCnoVyX78BWfjhY/WMsL+qYVPJV+VlOC83iv7GFgw+Fyvb6rxwFa8epHtR7WdRu2R+2vJCEdMtmCKFgvkTjqFACoJWd4B2KuLZ8zR0btCLlp9gU0OQ4Ho754bF8aQ32Pl5dmu4nu+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/gacka5WP3MqeEz6IZtMxNW7sie3Uk4dQVfMgpBOEY=;
 b=Jz/37zBwNp5z/Vr22nNOvY264IP25SyArL3CGZ5NE4trQEj0gmoa8q6Nd6aeB7utuisYj7+h7xSUUlcCSFGLrFEK1vcTFwyuMrDuTYwH5arsLf4csG6DYz1TMv7xk+GXljvFb+PrKiqF9nl1WdGjs5PJknHxy5nyPTUJUbcgHvalCSFBsiFHh6lVIFzkDxDYZO2ZjvgC+yKwpG1TIFssKkYcu1zLlT3iaeIoxeiwneXsBB/SxOh8Z9bo89MvDNYS//bIb1LX4lMeYrF1GG9d0k8UXYb6RGgaRMUPRkQ6JGP6tr1VJJCgpUn171llN5lITxuAi+KovuAQdyIeTGtuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/gacka5WP3MqeEz6IZtMxNW7sie3Uk4dQVfMgpBOEY=;
 b=kDTDClQyu/U2QalD01181yrPJtrY3JVo1pt39y77EYjr7WiqQWMqdM/2lkM0Fh0nEmv6ndpFPkk3cBMily/Ly/MPK6H42t37A20yccLhqop29/OpTgZTi/BmDSUYwoqDk9LOruTh+15U0aWGo1fEG8CcrsUyQnnw5dzsypY93tgHQ8ONK/Yp87aXTlx5J9+9AsV6KKec7Muzjybnf2zsp/IMPgk9wIxBaY+yCdX/BEzsBgJqYHwMSOLTNR7M94Z31bKmvBkaCe0vWSpuw+YyeqlJ3HX/KtcPUGERh+I1pP3f/AsDK4FbEueFfCP0VgxP2jdTX0UdTW5XJqX//5Jr5Q==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH 12/20] xen/arm: vsmmuv3: Add support for event queue and
 global error
Thread-Topic: [PATCH 12/20] xen/arm: vsmmuv3: Add support for event queue and
 global error
Thread-Index: AQHcB7yi7AssCwTYaUG/iDk08I6dEw==
Date: Thu, 7 Aug 2025 16:59:27 +0000
Message-ID:
 <c3328f9245e6d928412ddefbce61b86b1176b5a6.1754580688.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AS8PR03MB7336:EE_
x-ms-office365-filtering-correlation-id: b1438cd1-490e-4317-20fc-08ddd5d3c4f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?sB9i6tNRNSbKJIUi30JQywHae/uQhrH+iJqg5KH00mrwC8F/Is4uO56llR?=
 =?iso-8859-1?Q?tYWfu6PXaOsaJZoyeKCE/d0PK/+bRsi8NqI49cBMPUX7MaLNUfT4WnRuEB?=
 =?iso-8859-1?Q?1FX6YB6DjhEs2eNGmKLBxlBE4kzrayMhm5POshmmItYxM85o3YltPs0PS0?=
 =?iso-8859-1?Q?GMQux0l1ev64jW/riWmWJ7UPZdr43ZSd+eF4QCoBSH6Cpz4XZ92m7V4Dfe?=
 =?iso-8859-1?Q?lFPtSObR3I3G8Gzk/x6QnHcZ4cY+Rtr+vLpBntQ3apJw7tfWlHYagtpWUd?=
 =?iso-8859-1?Q?2mhJSFoigpli6Nyf+Io/hBHOv3+6hETFpUIkxcbhlZeGngiRmYRFPT2/sn?=
 =?iso-8859-1?Q?3MZ5W0kKzwIF9NcJQXit+T+e4KDT5nu4UQmPya9DIR4I8ZryylZD9jGOBx?=
 =?iso-8859-1?Q?hS0LFZqi4Er32/hiBHwpqCRiMOkRn/5WXodUoaDteT+8JQue93vfwXc8HL?=
 =?iso-8859-1?Q?DZNjsuVXzWzGYhQpNbalMSBpIy47VOWnC4wZ1uS3Pm/NPUqraM+8KPEhsY?=
 =?iso-8859-1?Q?9BNXU6UDypfc2ZvlU9Q0wChJIF/KTRZxYKWuiONbssuHvILd0yFGfJckAz?=
 =?iso-8859-1?Q?XwicuQ1w99XFnWOuiOC/ojXnDL7bwGaKgFAZyc8pmTQpjZhRIDI6S0sfuj?=
 =?iso-8859-1?Q?aDtwym+f1/nl56X6n0aeQs902lBecA+o7hgRYAE2gMEazlvDhSL2sec5Mi?=
 =?iso-8859-1?Q?h4nrP296GbtssMm12vUnC99gHufSierQc1sUgXCerQ2f+T34Mi1fFfhnqx?=
 =?iso-8859-1?Q?GkpRyDxqE249NGUq8yDW/08DAJjAsO601/I/y0HKhBLX9U2CxeCmP4TbQP?=
 =?iso-8859-1?Q?REO3GUCgnT1gyD2L/jM9ltyT3LDVX7mtIVkoK9f2JIvYXI98E0ITJfww/x?=
 =?iso-8859-1?Q?3G7KYuroR/RwzGFKSqPo6Lz1JWA5cHgONNppHFX8ccSn9P3zJNcbwtUeu3?=
 =?iso-8859-1?Q?7LsUJt/GxTHOHtOQ7dW6PE6Wpv+eOdRXXve9KF2pS3K89m4SwIT67kCCVf?=
 =?iso-8859-1?Q?pMEvUDQOIPv4LFtMv5GBULfUYy31oseEDpFVAnW4yldgaR9WigdO26lVBx?=
 =?iso-8859-1?Q?+NnJCWmu52D5OAUQTLscqTERJN5nwqfoFvdwPpKxv5i9fxgLa17o+kHsqj?=
 =?iso-8859-1?Q?SxM2XMthPXT3TXpWCn4ix6Nnyx6ZdAHYmNNzWfhXN/GRlgC2Qjr0H/RoN0?=
 =?iso-8859-1?Q?MlMsKVeUBHdfl1xkk2B72zFWSCRX8JX8KB59QrS0MK6tMilt+HU3d7BtbR?=
 =?iso-8859-1?Q?77s5s6S00LxxHAEnrLW9z8TKi6d1A7MNidiPzsTX36aPSzbVofFmH1oySN?=
 =?iso-8859-1?Q?VFcWRNikZW/+SdrJ/jZXYHPCGltQizxeqg2mbdgiJa72AmIwm7o3rC0NgP?=
 =?iso-8859-1?Q?o9h/AUdm3CBWlii7mFnqtxxbXGehCxv+MtCJFlvObxSl5UdKCUX1zrfSR5?=
 =?iso-8859-1?Q?Z8RXkBFAWZN4PM2xOCKEldT6Tt8rahvskrNjDUAq6NByq93P0kIGh0z8ie?=
 =?iso-8859-1?Q?B6aqqtTkS/KaD5WxnZbfu6FJXdZ7n8BiRq7izVQlFWcA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4o1euG+ESNVW9Y8tStXAJ1hKNLJRja4pq70t9s9J867d/bB1Je9ZSRhw/4?=
 =?iso-8859-1?Q?DxdCwzvSrERFkkulFfGZvGLjCmH+l07uBgHv9GJlfZstadxY56TeYGvfku?=
 =?iso-8859-1?Q?MqCgiuEr2c5oYWNjZ6OyWpozxdJahVMeJMcg/n0BNCCS/2HbbJvfLDr8R8?=
 =?iso-8859-1?Q?ivyPT3TSnecvzVvgzDEVDrmiIsYYAK0Nnrqq4rp8Ut15M8AVfZRktnFo3p?=
 =?iso-8859-1?Q?YMsSITsYhrQDJ9zCW88183hiskoxsQPmMCUMB3hNFvzcFUHlgubkQREIFf?=
 =?iso-8859-1?Q?i2jBlkDdt6FVEIikjC32r0crRzBwBbTPLHlkw2SImsMz1u0pkL+IGo89o2?=
 =?iso-8859-1?Q?DbWuX293dJG9zD7Ffc8QkNkFD2uiP7leqSmhMtf06buyc4O1AtRqQkPaZW?=
 =?iso-8859-1?Q?OB4f59yV2LCr6j++ZWOfuQQ2+NTHwWS7JwpuQW0N5Km/SUbaxwt1fnuTPA?=
 =?iso-8859-1?Q?SyemzKj0vFUhR+VwoainvoRt4P4n4kLkF2c4AahJdk5eQnTWZhSaYtgrkP?=
 =?iso-8859-1?Q?vWFwxjAE6xIhUGGFzD1qDvfcUwBduycBqxeeb0GEzDjnUcTYJqFhhPKvSM?=
 =?iso-8859-1?Q?rfWxUz+FQHgY26KLacmdQlieXDpWGRBJpJrMoei7NC2lvDJgc7/aXJE6rE?=
 =?iso-8859-1?Q?8+pIYuYDHp9Xa2VWtEBv2HxCvcMxbxmY2NjPzrDQpHOGpjB0lwAX3Ms7WC?=
 =?iso-8859-1?Q?GPu1tjOkxMMOwqIaXng8hDy1iUEUe7DdAQFhcLrAjX7fvBioXHB1wQW0sR?=
 =?iso-8859-1?Q?aZpNMfRb2jq9drKUPWkmB1+1EPrVXKmgCHn8XvAtMli1hPWqBAeibkDpCU?=
 =?iso-8859-1?Q?w6HRSWmDZbIX8tmGk2/hjjaXujY7Vjzk5CKz5iBnDy13b9F5OBp2jerQgM?=
 =?iso-8859-1?Q?MMKcMufATGTz4K9Un50mImt0+KRKIoYB+s3Fi9WYUR+WFQ8dskx7xpXwBg?=
 =?iso-8859-1?Q?820LSocvWQgwKuxgeIF1B/kimg6fSDKJnbHX9ww3xojFAZ7GYdHQkxyQ5B?=
 =?iso-8859-1?Q?sTJETJW+6bMSU/hpfo9LiDB9dl8kYVH7qIfJDAtnq9yrRPNxUYiWBcTYGe?=
 =?iso-8859-1?Q?0HXSfNRYWnuJ5a/9ZfZTRNtBP1TBrfgObmpl2h29nrNtsY1k3wJmSyEgtE?=
 =?iso-8859-1?Q?xUGkiaa47stBtpu2PUAXhOX/+skt5TGDivU2qFgZouKyz5QKVokP+urFfc?=
 =?iso-8859-1?Q?xL1vvf4fTusqHhWwplP6hL4GLIkJpuShPJcX5YDL3rr2d4VW6G4Sdlai/x?=
 =?iso-8859-1?Q?/dLOzoKJlOILYYS2k0U98izSnHqxBb7uWhPLzqRGm66xADunSJ/Ew4NoBu?=
 =?iso-8859-1?Q?SBsqtTWLsqiWArmgoN61F0Nt+tXm6PtnqpnqrIQ+WCM/maoucZ/DNDLqOS?=
 =?iso-8859-1?Q?yG2HxTmBflJRJXdwykwvWFxPCambrTT+fLiSxSt6K3LHKfsUFoy1zzT2wX?=
 =?iso-8859-1?Q?9Bj5Mdzhy9xobcPyCGb87or5+09ZVzzgPnnxAO8IvvNcRiXfd3XCQiDKYu?=
 =?iso-8859-1?Q?+q9pWOzI4DohozswMv0R1MItHvUZvL0qyeTve91tmpdDhspLrZDEeaFsj8?=
 =?iso-8859-1?Q?GWL4s1cZyP7XHunzIQKTw8T6NMPepYBVQdh3PSs8p1D+BSo2qFCgin1uCN?=
 =?iso-8859-1?Q?V90smjJ388/+YsgFpzHobrNJL74HaN1s9JD4rZ08jsJycT1fCGqkw7wQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1438cd1-490e-4317-20fc-08ddd5d3c4f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:27.5265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+70L6W+xs4zd0dzWlWrNdtvFUx4lrFc2kZ8jMI2RQE0MMywET6rIAzHdgArD8QvWlexJvLOCD8LO9Mqzw8lkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

Event queue is used to send the events to guest when there is an events/
faults. Add support for event queue to send events to guest.

Global error in SMMUv3 hw will be updated in smmu_gerror and
smmu_gerrorn register. Add support for global error registers to send
global error to guest.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.h  |  20 +++
 xen/drivers/passthrough/arm/vsmmu-v3.c | 169 ++++++++++++++++++++++++-
 xen/include/public/arch-arm.h          |   5 +-
 3 files changed, 186 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index 3e3a6cd080..820271a413 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -354,6 +354,26 @@
=20
 #define EVTQ_0_ID			GENMASK_ULL(7, 0)
=20
+#define EVT_ID_BAD_STREAMID		0x02
+#define EVT_ID_BAD_STE		    	0x04
+#define EVT_ID_TRANSLATION_FAULT	0x10
+#define EVT_ID_ADDR_SIZE_FAULT		0x11
+#define EVT_ID_ACCESS_FAULT		0x12
+#define EVT_ID_PERMISSION_FAULT		0x13
+
+#define EVTQ_0_SSV			(1UL << 11)
+#define EVTQ_0_SSID			GENMASK_ULL(31, 12)
+#define EVTQ_0_SID			GENMASK_ULL(63, 32)
+#define EVTQ_1_STAG			GENMASK_ULL(15, 0)
+#define EVTQ_1_STALL			(1UL << 31)
+#define EVTQ_1_PnU			(1UL << 33)
+#define EVTQ_1_InD			(1UL << 34)
+#define EVTQ_1_RnW			(1UL << 35)
+#define EVTQ_1_S2			(1UL << 39)
+#define EVTQ_1_CLASS			GENMASK_ULL(41, 40)
+#define EVTQ_1_TT_READ			(1UL << 44)
+#define EVTQ_2_ADDR			GENMASK_ULL(63, 0)
+#define EVTQ_3_IPA			GENMASK_ULL(51, 12)
 /* PRI queue */
 #define PRIQ_ENT_SZ_SHIFT		4
 #define PRIQ_ENT_DWORDS			((1 << PRIQ_ENT_SZ_SHIFT) >> 3)
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 3b073b9dac..7a6c18df53 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -44,6 +44,7 @@ extern const struct viommu_desc __read_mostly *cur_viommu=
;
=20
 /* Helper Macros */
 #define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
+#define smmu_get_evtq_enabled(x)    FIELD_GET(CR0_EVTQEN, x)
 #define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
 #define smmu_cmd_get_sid(x)         FIELD_GET(CMDQ_PREFETCH_0_SID, x)
 #define smmu_get_ste_s1cdmax(x)     FIELD_GET(STRTAB_STE_0_S1CDMAX, x)
@@ -52,6 +53,35 @@ extern const struct viommu_desc __read_mostly *cur_viomm=
u;
 #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK,=
 \
                                     FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, =
x))
=20
+/* event queue entry */
+struct arm_smmu_evtq_ent {
+    /* Common fields */
+    uint8_t     opcode;
+    uint32_t    sid;
+
+    /* Event-specific fields */
+    union {
+        struct {
+            uint32_t ssid;
+            bool ssv;
+        } c_bad_ste_streamid;
+
+        struct {
+            bool stall;
+            uint16_t stag;
+            uint32_t ssid;
+            bool ssv;
+            bool s2;
+            uint64_t addr;
+            bool rnw;
+            bool pnu;
+            bool ind;
+            uint8_t class;
+            uint64_t addr2;
+        } f_translation;
+    };
+};
+
 /* stage-1 translation configuration */
 struct arm_vsmmu_s1_trans_cfg {
     paddr_t s1ctxptr;
@@ -82,6 +112,7 @@ struct virt_smmu {
     uint32_t    strtab_base_cfg;
     uint64_t    strtab_base;
     uint32_t    irq_ctrl;
+    uint32_t    virq;
     uint64_t    gerror_irq_cfg0;
     uint64_t    evtq_irq_cfg0;
     struct      arm_vsmmu_queue evtq, cmdq;
@@ -89,6 +120,12 @@ struct virt_smmu {
 };
=20
 /* Queue manipulation functions */
+static bool queue_full(struct arm_vsmmu_queue *q)
+{
+    return Q_IDX(q, q->prod) =3D=3D Q_IDX(q, q->cons) &&
+           Q_WRP(q, q->prod) !=3D Q_WRP(q, q->cons);
+}
+
 static bool queue_empty(struct arm_vsmmu_queue *q)
 {
     return Q_IDX(q, q->prod) =3D=3D Q_IDX(q, q->cons) &&
@@ -101,11 +138,105 @@ static void queue_inc_cons(struct arm_vsmmu_queue *q=
)
     q->cons =3D Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
 }
=20
+static void queue_inc_prod(struct arm_vsmmu_queue *q)
+{
+    u32 prod =3D (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + 1;
+    q->prod =3D Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
+}
+
 static void dump_smmu_command(uint64_t *command)
 {
     gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
              smmu_cmd_get_command(command[0]), command[0], command[1]);
 }
+
+static void arm_vsmmu_inject_irq(struct virt_smmu *smmu, bool is_gerror,
+                                uint32_t gerror_err)
+{
+    uint32_t new_gerrors, pending;
+
+    if ( is_gerror )
+    {
+        /* trigger global error irq to guest */
+        pending =3D smmu->gerror ^ smmu->gerrorn;
+        new_gerrors =3D ~pending & gerror_err;
+
+        /* only toggle non pending errors */
+        if (!new_gerrors)
+            return;
+
+        smmu->gerror ^=3D new_gerrors;
+    }
+
+    vgic_inject_irq(smmu->d, NULL, smmu->virq, true);
+}
+
+static int arm_vsmmu_write_evtq(struct virt_smmu *smmu, uint64_t *evt)
+{
+    struct arm_vsmmu_queue *q =3D &smmu->evtq;
+    struct domain *d =3D smmu->d;
+    paddr_t addr;
+    int ret;
+
+    if ( !smmu_get_evtq_enabled(smmu->cr[0]) )
+        return -EINVAL;
+
+    if ( queue_full(q) )
+        return -EINVAL;
+
+    addr =3D Q_PROD_ENT(q);
+    ret =3D access_guest_memory_by_gpa(d, addr, evt,
+                                     sizeof(*evt) * EVTQ_ENT_DWORDS, true)=
;
+    if ( ret )
+        return ret;
+
+    queue_inc_prod(q);
+
+    /* trigger eventq irq to guest */
+    if ( !queue_empty(q) )
+        arm_vsmmu_inject_irq(smmu, false, 0);
+
+    return 0;
+}
+
+void arm_vsmmu_send_event(struct virt_smmu *smmu,
+                          struct arm_smmu_evtq_ent *ent)
+{
+    uint64_t evt[EVTQ_ENT_DWORDS];
+    int ret;
+
+    memset(evt, 0, 1 << EVTQ_ENT_SZ_SHIFT);
+
+    if ( !smmu_get_evtq_enabled(smmu->cr[0]) )
+        return;
+
+    evt[0] |=3D FIELD_PREP(EVTQ_0_ID, ent->opcode);
+    evt[0] |=3D FIELD_PREP(EVTQ_0_SID, ent->sid);
+
+    switch (ent->opcode)
+    {
+    case EVT_ID_BAD_STREAMID:
+    case EVT_ID_BAD_STE:
+        evt[0] |=3D FIELD_PREP(EVTQ_0_SSID, ent->c_bad_ste_streamid.ssid);
+        evt[0] |=3D FIELD_PREP(EVTQ_0_SSV, ent->c_bad_ste_streamid.ssv);
+        break;
+    case EVT_ID_TRANSLATION_FAULT:
+    case EVT_ID_ADDR_SIZE_FAULT:
+    case EVT_ID_ACCESS_FAULT:
+    case EVT_ID_PERMISSION_FAULT:
+        break;
+    default:
+        gdprintk(XENLOG_WARNING, "vSMMUv3: event opcode is bad\n");
+        break;
+    }
+
+    ret =3D arm_vsmmu_write_evtq(smmu, evt);
+    if ( ret )
+        arm_vsmmu_inject_irq(smmu, true, GERROR_EVTQ_ABT_ERR);
+
+    return;
+}
+
 static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
                               uint64_t *ste)
 {
@@ -114,11 +245,22 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu,=
 uint32_t sid,
     uint32_t log2size;
     int strtab_size_shift;
     int ret;
+    struct arm_smmu_evtq_ent ent =3D {
+        .sid =3D sid,
+        .c_bad_ste_streamid =3D {
+            .ssid =3D 0,
+            .ssv =3D false,
+        },
+    };
=20
     log2size =3D FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_cfg=
);
=20
     if ( sid >=3D (1 << MIN(log2size, SMMU_IDR1_SIDSIZE)) )
+    {
+        ent.opcode =3D EVT_ID_BAD_STE;
+        arm_vsmmu_send_event(smmu, &ent);
         return -EINVAL;
+    }
=20
     if ( smmu->features & STRTAB_BASE_CFG_FMT_2LVL )
     {
@@ -132,7 +274,7 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, u=
int32_t sid,
         idx =3D (sid >> STRTAB_SPLIT) * STRTAB_L1_DESC_DWORDS;
         l1ptr =3D (paddr_t)(strtab_base + idx * sizeof(l1std));
=20
-        ret =3D access_guest_memory_by_ipa(d, l1ptr, &l1std,
+        ret =3D access_guest_memory_by_gpa(d, l1ptr, &l1std,
                                          sizeof(l1std), false);
         if ( ret )
         {
@@ -156,6 +298,8 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, u=
int32_t sid,
         {
             gdprintk(XENLOG_ERR, "idx=3D%d > max_l2_ste=3D%d\n",
                      idx, max_l2_ste);
+            ent.opcode =3D EVT_ID_BAD_STREAMID;
+            arm_vsmmu_send_event(smmu, &ent);
             return -EINVAL;
         }
         addr =3D l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
@@ -167,7 +311,7 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, u=
int32_t sid,
                       ~GENMASK_ULL(strtab_size_shift, 0);
         addr =3D strtab_base + sid * sizeof(*ste) * STRTAB_STE_DWORDS;
     }
-    ret =3D access_guest_memory_by_ipa(d, addr, ste, sizeof(*ste), false);
+    ret =3D access_guest_memory_by_gpa(d, addr, ste, sizeof(*ste), false);
     if ( ret )
     {
         gdprintk(XENLOG_ERR,
@@ -183,6 +327,14 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu=
, uint32_t sid,
                                 uint64_t *ste)
 {
     uint64_t val =3D ste[0];
+    struct arm_smmu_evtq_ent ent =3D {
+        .opcode =3D EVT_ID_BAD_STE,
+        .sid =3D sid,
+        .c_bad_ste_streamid =3D {
+            .ssid =3D 0,
+            .ssv =3D false,
+        },
+    };
=20
     if ( !(val & STRTAB_STE_0_V) )
         return -EAGAIN;
@@ -217,6 +369,7 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu,=
 uint32_t sid,
     return 0;
=20
 bad_ste:
+    arm_vsmmu_send_event(smmu, &ent);
     return -EINVAL;
 }
=20
@@ -271,7 +424,7 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu=
)
         int ret;
=20
         addr =3D Q_CONS_ENT(q);
-        ret =3D access_guest_memory_by_ipa(d, addr, command,
+        ret =3D access_guest_memory_by_gpa(d, addr, command,
                                          sizeof(command), false);
         if ( ret )
             return ret;
@@ -577,7 +730,8 @@ static const struct mmio_handler_ops vsmmuv3_mmio_handl=
er =3D {
     .write =3D vsmmuv3_mmio_write,
 };
=20
-static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t siz=
e)
+static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
+                               paddr_t size, uint32_t virq)
 {
     struct virt_smmu *smmu;
=20
@@ -586,6 +740,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr, paddr_t size)
         return -ENOMEM;
=20
     smmu->d =3D d;
+    smmu->virq =3D virq;
     smmu->cmdq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
     smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
     smmu->evtq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
@@ -612,14 +767,16 @@ int domain_vsmmuv3_init(struct domain *d)
=20
         list_for_each_entry(hw_iommu, &host_iommu_list, entry)
         {
-            ret =3D vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size)=
;
+            ret =3D vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size,
+                                      hw_iommu->irq);
             if ( ret )
                 return ret;
         }
     }
     else
     {
-        ret =3D vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_S=
IZE);
+        ret =3D vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_S=
IZE,
+                                  GUEST_VSMMU_SPI);
         if ( ret )
             return ret;
     }
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index d6201df06a..1b03222b77 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -521,9 +521,10 @@ typedef uint64_t xen_callback_t;
 #define GUEST_EVTCHN_PPI        31
=20
 #define GUEST_VPL011_SPI        32
+#define GUEST_VSMMU_SPI         33
=20
-#define GUEST_VIRTIO_MMIO_SPI_FIRST   33
-#define GUEST_VIRTIO_MMIO_SPI_LAST    43
+#define GUEST_VIRTIO_MMIO_SPI_FIRST   34
+#define GUEST_VIRTIO_MMIO_SPI_LAST    44
=20
 /*
  * SGI is the preferred delivery mechanism of FF-A pending notifications o=
r
--=20
2.43.0

