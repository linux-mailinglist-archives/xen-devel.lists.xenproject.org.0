Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA62B21678
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077934.1438938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZAL-0003v2-H9; Mon, 11 Aug 2025 20:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077934.1438938; Mon, 11 Aug 2025 20:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZAL-0003sV-ER; Mon, 11 Aug 2025 20:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1077934;
 Mon, 11 Aug 2025 20:30:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UdnH=2X=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ulZAJ-0003sP-M7
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:30:43 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c9c72b4-76f2-11f0-a327-13f23c93f187;
 Mon, 11 Aug 2025 22:30:41 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB8715.eurprd03.prod.outlook.com (2603:10a6:20b:560::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 20:30:38 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 20:30:38 +0000
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
X-Inumbo-ID: 0c9c72b4-76f2-11f0-a327-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BANJcxz5aAfGEXgfBCAqTbXRzD7M8OQCut5nv6zqvNxL50Zm7uQg+Uha4zAcUYO4XF842T6dSdtgQgp+lO71FlAYosskq0nB7yAEfPb0UEsCiwEf2JxnQtwQngbn2mpD6mBW/rlpaVyRwPDSRnqOW93HwiQ/vNtusnsSlL9XP2D2mypzgQMR5a3KtGz//ik1YDPXDrNVlmDUCxf+3z0tMQvcv9SdVwSShNDPhlvpMrY0qQG9lLn54D1CwSjUG/VIvosrdBdlLsYd/WucviPR6pLoC3A2k+S2801h5shtlU/OG+fcPujRG/yxBm3CKI6g5F9cRhdZ+wdyp7ucAeNPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydHtDDK2/6QzpFnO38JKm8UgV+eHTHOoPYYCb7Oj8qQ=;
 b=L8DK40UFJwnPueQInSE1sHttByzghXwiaRMoBmV+vnuS2bCCPYNAI0uW8g8mBtzexqLkSWPq7e6ZR2xgwecpyylgtGcFBtfDXdhi/cGC5t19zhq6DNWIxRgRNsBr2MuttJ5uDdq6Q8T/85APaGXQMUe73bw4FMczPwoUhh+vZ1NH+8P2uiqVp+/rDxMOXfE91RgNBQIVuEJFgRJsLlTLcO0VItvE0ItrqfFgL5TDTK+14YbWKhyamPKeCE/4cq0ajLtAqXSkaZfuUcCv68ehaz7//ReLmtB0KTuUFi6HbA0B2/44frUQdIzFGzp+3Zl0uj+3Y114tbSeXUswsUvjLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydHtDDK2/6QzpFnO38JKm8UgV+eHTHOoPYYCb7Oj8qQ=;
 b=Z4NRRx98GtNOWY2v/wDea3DXqVSfVJegUNAgIBHzQ5d0zdiCtrdJbdteqfw9Km5smBVn2aM6NdCilsOrXrbYBGeRMP1dnogt7hqwQMEK724iTSw99EiAU43QMBU3DusaqJQvdT56C61WxMfvkwSKw51zgFoIqT+3ScjQAXrgER5OSeKOfUicxKwiGBzPa6qtaSHNFGAEVpQoJkwWAmIcAUALQPoJRni0PWtp5TmDjbhXhDdWkRY+gqFmaREF2C8OK/NOOF0+C774D5z4WTOKHwCcV5NwoYCeONucgOJjRrai6gl60hAuw3TQMbGLzFzNIAejO7RVmVnHDG93Smat3g==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
Thread-Topic: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
Thread-Index: AQHcCv7M4bE5kwDncUeSEAS4rjYqyA==
Date: Mon, 11 Aug 2025 20:30:37 +0000
Message-ID:
 <7cd71ed21383c189fedb3250ddde54a593f7f98b.1754944131.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB8715:EE_
x-ms-office365-filtering-correlation-id: eb81a858-98f1-48a3-57e6-08ddd915eee5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0E2jmdPTSHLQQDvf51V1lJyv/wqPJuTKCAvxJKTRdiiJwlzfiQ4otWkxsi?=
 =?iso-8859-1?Q?I7PHCK3FOJUxygPXR2MOI4hOH5fqRAHls4t+RI04TZF9RheQPP291Cwotu?=
 =?iso-8859-1?Q?ttM+lSWHMfjpgCKhm0/4BR4VH4GCam6v4Kcc1HtJyXgy/Y7/L0UwuQs3xP?=
 =?iso-8859-1?Q?9Gzca2nTljRvQSqTXt7PoRLQupTartbMXDhodAQrK93DILT9VnpsuuuXY5?=
 =?iso-8859-1?Q?OyqEiCoQdl7hTMvjNNIXzVTrmyR/jkY+Xa47MKd+iWe5IYhGkxoS8Sjd5a?=
 =?iso-8859-1?Q?z4lNs18YE4W/pIVpwGhP1DMLjJSvt+KdR2+7DbGX9f+N0i5FSMOZwUb0Ta?=
 =?iso-8859-1?Q?at19IhH1NOjVeItoTYfHx+yIgyvwNVRk9mi405/3/PzFv/cMc3IORm4k2K?=
 =?iso-8859-1?Q?hsr6k2Zw8mRXI00ohQdyKcJGOf3zE7/0xqvC3TUiUdQe5+mnz8caPJY069?=
 =?iso-8859-1?Q?EzFXt5YmuBiNhtpdz520mhjOUi/627DtjMTne38Obk+KpxYIBCP05ylDzg?=
 =?iso-8859-1?Q?9Tpb5zAg134XgyX2aq/fKiOK7lLT6cFNW1d3xOODEMOWlU4usl3/bCEDUQ?=
 =?iso-8859-1?Q?rims/+VLu2feM7oWpdcSsgBOZYmGvcg60VKK7hVC5lPE2QxW2uPa0Zo1DD?=
 =?iso-8859-1?Q?k/GiCZCymoQN5OW0x0ZJKA/D2doIFGgnmV4JcE2/+CSpwpxXIZ+x5yydul?=
 =?iso-8859-1?Q?4iy1x6zw3PfY5FHKRhCez7zASHunzoLejOoPEh1tSXRVxqqrvSGLrShE8Z?=
 =?iso-8859-1?Q?UFiHUmiYo1a4bm7j8lV4Kw2LqtQmBN2e5YAuoJ7TJTRXON8kilPU2g5grA?=
 =?iso-8859-1?Q?maJ9242kYhHItcj8E1en6RnKKx11oz3Zx75wp6DDBb3RS8KMA39M3szvJ4?=
 =?iso-8859-1?Q?oZ9YWyrC+7lJvRNnQ+GCyNWNktH8f3fWgkt5jR7+pQenktBvNeDT9IsctV?=
 =?iso-8859-1?Q?XimNVnfNPKA7yHRr5O561Kr0vyfyOmRk1xN4tIgKqvFy7z1JQMXywPEAFj?=
 =?iso-8859-1?Q?KCxSdaBykRMCWdeFB5Da7twrJ1jyHQgEB2Z2BmDL7gvMIkOa1i5bc+FBbJ?=
 =?iso-8859-1?Q?oIBqyEsRJ6JG/aQjMBlwnIkoARJnqCcUhf7KXKHsESk/4k3fgq0dD9gdH/?=
 =?iso-8859-1?Q?HB7zlv60W0Uz9dWjHWt/IONLWa5r+/jY8jCpPa8tmtIT/UEdYq3KAwRhnL?=
 =?iso-8859-1?Q?1WmErXaIuatdSJTA8DopgzCof+Ty+BDC29g/dt7nAlVPVc44wJLiyeg4ft?=
 =?iso-8859-1?Q?zUyxgoOSvdJD9qd/AlIyKpqOhj88MZLlkTkr1mK6d7wf+7+2+l1TFfYhky?=
 =?iso-8859-1?Q?y1Fs7op6qeJ0E9+oulHq0PkroBJOy5DN7vLEk2m7WQjxV5e4YgWGub7JVZ?=
 =?iso-8859-1?Q?mzxNEc3YeZhH8NmA2hJ5v9//wYtJMvaJhXjsmI31pr6/JiwYBt5gRLmAhq?=
 =?iso-8859-1?Q?fDjkOOJHkAUAwPHDdtWiTqbE2k7IUW+1+w2/xOasSuv7/Bm6ut/rGA1sMt?=
 =?iso-8859-1?Q?sEXdh1NAusofiUKapoIr3F4niW/MZ7YLXk8071uts/iQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?l64kitwKuLoBExqQojU9Rx9XADhqTxqKomlIRMAe6MJdS28kDMiR+RCD27?=
 =?iso-8859-1?Q?iP/ElzadImfnpzlQTfiEBcQaAqQIRG7Me8yxIEvOnnzmM5qKICbBHRvktr?=
 =?iso-8859-1?Q?Bf6ieCZZqL1tFwyN6p9jV8TV0kuRYlbnfJoLY650YEUqq90ShzvObaqtnc?=
 =?iso-8859-1?Q?Rextqd7QhG6hoj1NtZnLrTdE7Ug+LI0nI6bjK/gJFYjNcztMVv8qh2ZwpZ?=
 =?iso-8859-1?Q?mo1MIOcNS95PA4k1MM2qsvOLhMof3Od0JkkTUgjx6Ueb6b9ZDF+vx7sTpT?=
 =?iso-8859-1?Q?oo2oaBM5JPT0oBb8XOjvP5qHrWTO5l3581wppImQ69n3FJZbFswszEmIvW?=
 =?iso-8859-1?Q?p88SGr7Bn96+lLuMYYN7W8L1Ez7qd6RU2jTHjISYoMl2f18PFxmisNw+oa?=
 =?iso-8859-1?Q?DCp8ls1yOqIVZZbMFcoihBwbYHwb3boXsKDwJT+mZ/AZ9sS2sTfb8PNgp1?=
 =?iso-8859-1?Q?ueUnqFfyT5kNGPuBnkYVAeSqB1KzghNd4gkLLn20bj2PwyYhMU4YbpOPpi?=
 =?iso-8859-1?Q?Z+77zkKeHy+jdAIaHrKx8v5sIRhxqLRnu13QtaN2ZX44TsfdwsXM+Osd3M?=
 =?iso-8859-1?Q?K3Ir80vGxcAYMQKkOzHM3aNU81ryIhBpDHYgmt9k2shUt3MiFQ0hdaUnkW?=
 =?iso-8859-1?Q?KNjEn1ai1D7jSfu8+WnYzPAPtR7wTIu7WRM7xQIGd/CclOGrStZqol4E1x?=
 =?iso-8859-1?Q?QDE7TGE/UD+TaqyzxIl6WGeah6x1b1q7dnJLofQGx2JcK+ar64drBjZ0AN?=
 =?iso-8859-1?Q?GDaxOIMxWLLQo/6SJMq1VgxI1WUoqfv9aHTBIuXBqsbZIfhtSvH+B53OJC?=
 =?iso-8859-1?Q?5S0zoF9MyG1ujOZMNSNy9tkUZwKMw0CuNzA6moxNqVbflzIMsMYDhjukyZ?=
 =?iso-8859-1?Q?meJxXkZ34ZY6hMxJKXPSB8NdoIT7TJTynoznpe6depix6v2brTl5W67emr?=
 =?iso-8859-1?Q?k3tC4xKky9f7zKW+86pIyBouz0JdhA3oV89TAcVfnyWPKYztmghLRBj4h+?=
 =?iso-8859-1?Q?kasXm9dXAW0q7y0DivlyBRI4PRgJFbBgHPZEgBRBCJPnIiyWducJt7W8nC?=
 =?iso-8859-1?Q?3gnsFWnjN8GgsD73fCBBeKr74tOjySg2xGdPe1HI7MT9Za9A5Cjb8xYNDM?=
 =?iso-8859-1?Q?O9JVBUwVVOLOo7XpJzanaV1opbjl0VSy1Q7tMlvka6lb32aNkFYXJNuh3d?=
 =?iso-8859-1?Q?fnjunPBxlA5wuKiBiHyUB3yVY1jx1t7mxj9OvNR5yqJTFx50wVFdqo4yzK?=
 =?iso-8859-1?Q?zKaKsDxmmH2FQ7j56/klrlnUjI4nXGzH0aRGLwIuwgbNnwSByfXh3pYZch?=
 =?iso-8859-1?Q?6zpJrGUboV4gaBqNCf6kcKMFEuO7QdGehS5Mqq2el8DmltEdAZynE36DGr?=
 =?iso-8859-1?Q?HYf7OstUzlVYYBjP3Teff+rucZcnaHhLqqMnrTPPnY1QUDyZlMZ3IrB0gE?=
 =?iso-8859-1?Q?UTjpezAKPPHZZz/wbneQ2kftlB+4UadyGN6bvUWvKgZ55ZJXj0z2Qd7bbr?=
 =?iso-8859-1?Q?BPEDPNJWhCvIYaL7wV7b/cjB+XKZxQy5YlFX8B/emYHRPYBSmjYNtVC/H3?=
 =?iso-8859-1?Q?h9QslyvVo2BPJDl7ZO+sXpDgWUE75wxO/Uao0MIDXaujIGiUDmelReEF6F?=
 =?iso-8859-1?Q?At/21oerkuALF+TfO2FMdBBVt+892OshBlIqJ/79q+stkDqJ20R1DHCw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb81a858-98f1-48a3-57e6-08ddd915eee5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 20:30:38.1670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /HTkxpHOi1sSLlKGqSlB4VPlHwgynkDleEpy7Dkds/D0GrB3yNIY/mFB5tEX82Cp1RvDftBaQWEMNShW7b4QyRwnmB8/ZlsQ3d2a0voZaLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8715

MISRA Rule 16.4: Every switch statement shall have a default label.
The default clause must contain either a statement or a comment
prior to its terminating break statement.

However, there is a documented rule that apply to the Xen in
'docs/misra/rules.rst':
Switch statements with integer types as controlling expression
should have a default label:
 - if the switch is expected to handle all possible cases
  explicitly, then a default label shall be added to handle
  unexpected error conditions, using BUG(), ASSERT(), WARN(),
  domain_crash(), or other appropriate methods;

These changes add `ASSERT_UNREACHABLE()` macro to the default clause of
switch statements that already explicitly handle all possible cases. This
ensures compliance with MISRA, avoids undefined behavior in unreachable
paths, and helps detect errors during development.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/arch/arm/decode.c      |  3 +++
 xen/arch/arm/guest_walk.c  |  4 ++++
 xen/common/grant_table.c   | 10 ++++++++--
 xen/drivers/char/console.c |  3 +++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 2537dbebc1..cb64137b3b 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -178,6 +178,9 @@ static int decode_thumb(register_t pc, struct hsr_dabt =
*dabt)
         case 3: /* Signed byte */
             update_dabt(dabt, reg, 0, true);
             break;
+        default:
+            ASSERT_UNREACHABLE();
+            break;
         }
=20
         break;
diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index 09fe486598..9199a29602 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -167,6 +167,10 @@ static bool guest_walk_sd(const struct vcpu *v,
             *perms |=3D GV2M_EXEC;
=20
         break;
+
+        default:
+            ASSERT_UNREACHABLE();
+            break;
     }
=20
     return true;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1..60fc47f0c8 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -330,9 +330,12 @@ shared_entry_header(struct grant_table *t, grant_ref_t=
 ref)
         /* Returned values should be independent of speculative execution =
*/
         block_speculation();
         return &shared_entry_v2(t, ref).hdr;
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
     }
=20
-    ASSERT_UNREACHABLE();
     block_speculation();
=20
     return NULL;
@@ -727,10 +730,13 @@ static unsigned int nr_grant_entries(struct grant_tab=
le *gt)
         /* Make sure we return a value independently of speculative execut=
ion */
         block_speculation();
         return f2e(nr_grant_frames(gt), 2);
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
 #undef f2e
     }
=20
-    ASSERT_UNREACHABLE();
     block_speculation();
=20
     return 0;
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 9bd5b4825d..608616f2af 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -889,6 +889,9 @@ static int cf_check parse_console_timestamps(const char=
 *s)
         opt_con_timestamp_mode =3D TSM_DATE;
         con_timestamp_mode_upd(param_2_parfs(parse_console_timestamps));
         return 0;
+    default:
+        ASSERT_UNREACHABLE();
+        break;
     }
     if ( *s =3D=3D '\0' || /* Compat for old booleanparam() */
          !strcmp(s, "date") )
--=20
2.43.0

