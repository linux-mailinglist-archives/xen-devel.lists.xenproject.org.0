Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE094C2AEF4
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 11:11:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155281.1484786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFrWy-0004M5-4J; Mon, 03 Nov 2025 10:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155281.1484786; Mon, 03 Nov 2025 10:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFrWy-0004JU-1H; Mon, 03 Nov 2025 10:11:20 +0000
Received: by outflank-mailman (input) for mailman id 1155281;
 Mon, 03 Nov 2025 10:11:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MwQE=5L=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vFrWw-0004JO-IE
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 10:11:18 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e7d9a74-b89d-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 11:11:15 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS2PR03MB9224.eurprd03.prod.outlook.com (2603:10a6:20b:5fe::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 10:11:10 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::d976:7403:c89d:4677]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::d976:7403:c89d:4677%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 10:11:10 +0000
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
X-Inumbo-ID: 6e7d9a74-b89d-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UP8QXwtNsrJJOA2AMs7tgu7YP5Lg9/VS0duCbfti/U3KHZQtAwWGhN0p+BKDvCBX6R+FsFXalMYe6sjXSPqm8cevFEEyxfuA4EP+r7ojOW62xrWEROEUPA+YBt2Noa/x1Mj+o+0Ac/JwSyG4Kwqc/qT8ryhI9jzrD+WmhSCJqKqrx/D+9yLkgm8dhsZoVwSA6E+wJtkmGz6TAJazA+9lfwDmvpq6dKdRysGjUIgFnrwA6LGHPhWr28BT4WAMI8dW4dD78YV07BmvKLPwUoir6CeePr/RKId1/PEVe5jWc8k6kxu0tlf6LGUnF5+z13NNnfjcnEe7puNqJfNXdCEn3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEBXxe5Boj0saBa99VfCm7OJSQT//pjU4KKrjePIzjk=;
 b=NWs6Ojaidi8HPnoGdrQeEDP1u2wracFG1u7oIc58P2QqEY7nUyh36oOGa5q6g+k0/+PwPn1VCx92Jku8H7UuzleEsPAVKfz69I2i6w2j8M8ap+AFjLLfHpeB6xSncJvmzsomr7ILzqyYtR0zGbBYvVEa3AyxKPHc5kPzNNPXbWMNxkRFd7KPTA5mdl5XpETQvtFeAQ8W9YQKLWoXv9FkqNuSR4orT9ktQaiOZCm7Ss2VIeHL2p7o8coZrimCcLJSFjGlDD32fRzBrYmGK2v0ueOAOdkreNnaRnmCFh614DTCbc9Kq/KlAJhknBtRBwgoLCv2NYKk1Kkd255ykJSuew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEBXxe5Boj0saBa99VfCm7OJSQT//pjU4KKrjePIzjk=;
 b=eoOc8FmIOOkJV8Dq6Bt+O7JpaMHLz2Mz3dViSk2Q/wbzSYuyM+Nl2y59+W1VSw8qWKa/bwFVyB+AtfdgHMRC1jT4lJW+L3mXlUDK9vEXpgoZnzZY4avYqjtXAsT0HGQIarmEDbsdhVFWzIgHh6MSeazgIMqNzbwxtU1e8NGTLI+fNZZVXZOB8LQvU0zApM5vREzXVd9IfyTp/4EaZE+9zxyMUiML0mOmH4hz/1b5oGg6PS7pYTlrWItI8/q4Eu/k0xNnOqBz1yhrlnN71ak4jUj/yzQXnt5ymuxPFzZKXf+YJeXp60z47xdzn/Yi8Vnt1yfnydjlQCd3Gh+M+QJ1jQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH] misra: address Rule 11.3 in spin_unlock_common()
Thread-Topic: [PATCH] misra: address Rule 11.3 in spin_unlock_common()
Thread-Index: AQHcTKotzXBEqxBVDUKBYcHGEivA9g==
Date: Mon, 3 Nov 2025 10:11:09 +0000
Message-ID:
 <812bf5574cb44727c561e0ebc3a54848823ed490.1762163173.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS2PR03MB9224:EE_
x-ms-office365-filtering-correlation-id: f96cacb5-b1a4-4579-8fdf-08de1ac14f9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5yDqOmsrls3W3pkAxOkKvI7G7V0dP8FL6gonjphDv/X75CuZMzDFLUuMPJ?=
 =?iso-8859-1?Q?xkucoinwVO2RLrC9XHc0Hhi8pZe0kx1qjZDFP8XaWzEBvmYfPtwT13GNR5?=
 =?iso-8859-1?Q?4p1LULaFlRz5wqe6gdsqxqXNRLS+DvZBkYJbQfUdeuK361Gzp0cffk5J0e?=
 =?iso-8859-1?Q?1Bx5nEa8fNa7vE7tET9RGVPBs8Ayjzm5xl11mi2KYfIGyMazZIxCMyFRBb?=
 =?iso-8859-1?Q?xM+Bp3ovroskUbcVAOF3em4D7P4T1M+tSORKUcvsom5Nsrt/XXfzHqzQys?=
 =?iso-8859-1?Q?dbWKcbmOooa40iVaugzPKN9nQ/G2aNSg2JAw+dcf171mmbjVGOLd4B8HG1?=
 =?iso-8859-1?Q?kt9yZ5Mdbg+FpdXExNkDDyip/pnvYl8mHp4LZzQRCE7T7iJXXS1n/JWG9t?=
 =?iso-8859-1?Q?q/sb4c6qbMDLpSuEabmItHPuFkwBV1Qp+xEgbCl1sNq6B3fcgmPzoNIwKU?=
 =?iso-8859-1?Q?ijXUkw16nbs/Fv/jODGbq1UYteXfoMpFufhg38F7x6UCuDXyscTVqdEVGR?=
 =?iso-8859-1?Q?jkRXrCvmQcPFP+Ey+tChm2R+7Yj9mtqpQFw6XnWHFM3UOYh5QxnTunw8An?=
 =?iso-8859-1?Q?IJc76W2YHZ+HQGlOyEwfymWFcGbn7kCuZCds0owNy4AIoJ7krbtZROTbKB?=
 =?iso-8859-1?Q?cCplXJHSWQGoqMPq3tdQKdifWAHYjOom+4ULFNHpUxqOiGBKEvfhvtAwkO?=
 =?iso-8859-1?Q?+Y4SYujHiyox61J7gZEcKcFRYJTlmHJkHeecgx49e6H3j9xyB9c/kqSSIr?=
 =?iso-8859-1?Q?q027Z0weSVVibawXzFRhBrfeNFyfsxDLegNTqzfjFIwFa0DYvfF6pfCWyr?=
 =?iso-8859-1?Q?QJeoGkvdTfdIGtcnWGwptOZWwkJNgc317cz+SKBQfa2N04qrZa+LEKlYJp?=
 =?iso-8859-1?Q?mQgDSkqPjulv618Y6P/oasWt3tkf9ZFhcTcdxCw6jQOUg5qRZpjqZ/COW5?=
 =?iso-8859-1?Q?jL+soST0n7TOuFrJsb92H3DfRsCo+0R6Q0dqhZoNzIhBD8kppBzU5g7u9x?=
 =?iso-8859-1?Q?Qk7cqD5e0nvb+gsjBSVesoYwfowAxQWUzIwgAsboJ+UM9t2q8xMB1AeIYX?=
 =?iso-8859-1?Q?EkF3yltJ30/AVAr7y7V3vRJU3PBM0wf7E3c4HfAyqAMqQUQ3ziu0PKlDCP?=
 =?iso-8859-1?Q?k67NcujMCQpbCHTXjEN9THW89zRlPKmqnp/2qRJJ5FRiqYMwkWIBme3L2o?=
 =?iso-8859-1?Q?1HYgiqUOmcSrHvnfBP202KYN7C4u33neRXYj+YOoNcWDXHU91O5idfuX2j?=
 =?iso-8859-1?Q?4Ln1/4aH1/bgi/zcyoJ0h0oJ/x+hanGH+8Zo8GJPZ1wT74MUmAyXUpd9Pw?=
 =?iso-8859-1?Q?jeaP/qthiscyUBjdGdwFOcoOTlyNtk2/oTI/93yQgIPOZK+ZSpGGBEsajg?=
 =?iso-8859-1?Q?7uv4Ce14z/489GPDpUtNaIkt7TKNl864j7719S5W5gTKen7b10RjhAsPIN?=
 =?iso-8859-1?Q?eGK0vCDaaTYvlxoCoWkfvmZPQptRSHLSUoKjpFjkHTCRw0RuuzFseFGJe7?=
 =?iso-8859-1?Q?dk+rRIwEXCbFJ6w/hvq27Ph7iDeWvcG9x2jRIHJzG07xQF1Ngys0rzbhLw?=
 =?iso-8859-1?Q?D1f1txdQ3C38q6G/lriLvh1nWm9B?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ibKSWxTMXEkdmW0Kxv1f2PTOAg5sW2maNDAlFFUWdGYaMkZS6AaB3CH41K?=
 =?iso-8859-1?Q?jsVe/o79/XU0BJm9T8c1jhCB49sKt8DcN2wOg5lp/oXm0Iu8UbqMJXbnyl?=
 =?iso-8859-1?Q?E4k38SqEplirqUFX4pKdiwsyUcfUAKLxzMxNu6kx7ccOP8zzhB9pT9+5ZA?=
 =?iso-8859-1?Q?FFJUhmuokWd+pLiwPVhNQzBTSbPJfuAvsig9eGgHJZHMmi041ewSi93Eaz?=
 =?iso-8859-1?Q?VYj6uuqGftRj2po37WG7R7PAKr93WptOHeJ3SeZri+RGkvTKmTfm7XzArY?=
 =?iso-8859-1?Q?OUOCCLaOgdM+LSDdU4vUXVtDBL8BldWiNwlz/gP8/xBsXqyrRaun8G57tn?=
 =?iso-8859-1?Q?GBPJfX3yb360QeNBDD7OWzdhIgAcNUTjaroI4CErYVRRrB54TvLKphUPjv?=
 =?iso-8859-1?Q?+2m5ke8PyD2ob/IOspELWM8H6pjl9Cw4Rb+3p/SiidhFmm5x2TjWGVSigR?=
 =?iso-8859-1?Q?Tup3WpZ9vETRzJyJ6QT23igNx1vwqZQZB3f5ybLIQBz7YNObrqe2RFuMja?=
 =?iso-8859-1?Q?eyejClFWFK17m0PlU/ZslpQUpEWfUqHZohag546CtwIf0fYOKt/7gbvcPB?=
 =?iso-8859-1?Q?rRLpvmSN/P/R+fAAB8gXT9rvRJF34TiYduTt8fKg9ytiF8NZpsDSKHRYx/?=
 =?iso-8859-1?Q?Bh392EWoO9J7yeAzZYXNDnDZKPxNo41FxbNwrKdcSCYCgwkPPSh95gcLEY?=
 =?iso-8859-1?Q?3d8bKN1yLBJ+Ovhph5vLchUDGud7jdIOB4GmqbNtMD4w08FvObO8m6ARlI?=
 =?iso-8859-1?Q?M2822jc42gxoQ+e5zZg8z8hhtMqQhgQBL6hbPhiQF3InzSsjKk+6YWOgm1?=
 =?iso-8859-1?Q?rzQDtPv/T23v3/Np9bdOhTUknpFNyF657vC1WlSE5tN1ShpdEVOqNeRqe3?=
 =?iso-8859-1?Q?paMLRSuUKkxLZv3n4YeVhFTg2EKAxt1AuA31Zu5FHgn9NByv5+Kijry3aK?=
 =?iso-8859-1?Q?k/uQ1YkJOlt9Y/ICKrWvCjtz30+vo2hwgl09OEttoR2IDWpR0GWknN0Kxx?=
 =?iso-8859-1?Q?ox4P84NpYYtd9g2aEhOnQf2vhxCkFGH4q8t4skZo9Zvp/7jA1NxhcUGmeE?=
 =?iso-8859-1?Q?J/UjYg3kYae4x3pKJcNLUuPc0BBC+3i0M2XCxYwgEQKSQXBahI3pkcGqat?=
 =?iso-8859-1?Q?QejmDiDePC8EqnPe5jtq7kKUiwoS0DrqLs7ZknCzeGG3zV0FPNCPBIOtRg?=
 =?iso-8859-1?Q?0TavNANBQi+iCvhj01X18F6Msm+DQeA6Afb87mrMkah+02JAbu4ca4eM3M?=
 =?iso-8859-1?Q?ACgiTZ0weEXWSMu4vMlIAyQry68gv+xDDaMUMYyvlIMDhdWhW6FLAAGcip?=
 =?iso-8859-1?Q?22Nk4U98fFwN/k1ccjNeGKrUgDyU8SdiPUO/6s8fz5BG0/zE/8cQ+cYPJ9?=
 =?iso-8859-1?Q?iHug/sAREgXP/kyZ7iuwQQ93NPKhhUGEiPp6SK1XR0oz0q/1ob33DrMJnJ?=
 =?iso-8859-1?Q?xdceearBPi2Uuz7GhC5ot2jkvzKYo8bQcvRh3TPotsp7UTiGwta79JExu8?=
 =?iso-8859-1?Q?Capt8AevCRarHkdzODxISxmjQhiYd9kqvcMl24j9PS5n4DO2Ro+9Ygm6mT?=
 =?iso-8859-1?Q?35czJ6brqSwARoyhPpDvR1k/3+XRU5DeJmIxBNzk4KCLj9+IXvscRXMzs5?=
 =?iso-8859-1?Q?W1QQGK5vvLKE5tPIRl1RdE7w5k0WrYH43SnOg9GEqTE5f3zSOMzhiCCw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96cacb5-b1a4-4579-8fdf-08de1ac14f9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 10:11:09.9664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ArE1IYK63kRnUoluVPuuuUfBxMoes/H0LSKqH3dFFqRpFddKgOJt4wqXdMHe/G4Vw7nNKbq7zj2xutX97KTXeLQ1SdnNQ4SV4m3nmULXjQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9224

The generic 'add_sized()' macro performs type-based pointer casts, which
violate MISRA C Rule 11.3 (cast between pointer to object type and pointer
to a different object type).
Replace the use of 'add_sized(&t->head, 1)' with the type-specific
'add_u16_sized(&t->head, 1)' in the 'spin_unlock_common()' function.

A BUILD_BUG_ON(sizeof(t->head) !=3D sizeof(uint16_t)); check is added to
ensure the field size matches expectations at build time.

On RISC-V, the atomic addition function for 16-bit values was missing,
causing build failures when called 'add_u16_sized()'. Generate a static
inline implementation of 'add_u16_sized()' for uint16_t.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2136333330
---
 xen/arch/riscv/include/asm/atomic.h | 10 ++++++++++
 xen/common/spinlock.c               |  3 ++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/a=
sm/atomic.h
index 8e0425cea0..2676061725 100644
--- a/xen/arch/riscv/include/asm/atomic.h
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -111,6 +111,16 @@ static always_inline void _add_sized(volatile void *p,
     }
 }
=20
+#define build_add_sized(name, type)                                     \
+static inline void name(volatile type *addr, unsigned long val)         \
+{                                                                       \
+    volatile type *ptr =3D addr;                                          =
\
+    write_atomic(ptr, read_atomic(ptr) + val);                          \
+}
+
+build_add_sized(add_u16_sized, uint16_t)
+#undef build_add_sized
+
 #define add_sized(p, x)                                 \
 ({                                                      \
     typeof(*(p)) x_ =3D (x);                              \
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 0389293b09..d9dc9998e6 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -367,7 +367,8 @@ static void always_inline spin_unlock_common(spinlock_t=
ickets_t *t,
     LOCK_PROFILE_REL;
     rel_lock(debug);
     arch_lock_release_barrier();
-    add_sized(&t->head, 1);
+    BUILD_BUG_ON(sizeof(t->head) !=3D sizeof(uint16_t));
+    add_u16_sized(&t->head, 1);
     arch_lock_signal();
     preempt_enable();
 }
--=20
2.43.0

