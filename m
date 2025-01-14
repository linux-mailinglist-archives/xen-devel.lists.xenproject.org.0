Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BFA0FFE7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 05:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870902.1281973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXYVI-0007xg-40; Tue, 14 Jan 2025 04:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870902.1281973; Tue, 14 Jan 2025 04:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXYVH-0007vf-Uf; Tue, 14 Jan 2025 04:26:11 +0000
Received: by outflank-mailman (input) for mailman id 870902;
 Tue, 14 Jan 2025 04:26:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sZa5=UG=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tXYVG-0007T1-8n
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 04:26:10 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [2a01:111:f403:260e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad7bc3b5-d22f-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 05:26:08 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB8PR03MB6300.eurprd03.prod.outlook.com
 (2603:10a6:10:13f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Tue, 14 Jan
 2025 04:25:55 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%3]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 04:25:55 +0000
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
X-Inumbo-ID: ad7bc3b5-d22f-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCP3yA6RQOZYd19qQA5DtwPrQ4XZP/OI+bYfOMOJlJaIP6XqeGqeFxRmz/vte+zDF4BsWI+QHZ6mBU0nbjUlbvopZlEXnEosnCrO0ugLUaiZV+B00X2R1PPu4iEI0O0DPCZOLgOAoiHANBeV6t4aWcKgGsT1z5a6Mf2+NZ6/aCruajnbT/utTUxsCw5w5Q9JX9PpU1shrA4jQcAoPAxFbtnyGxnR6732aYgBmtweMtaAFJ9bIxL7g/K4F3YI710RcQPI4TwhRq/PhBefffDuvOOfW1XqZQ1u+8POsUVtwRhf7NqGWoyHftzrWivqFDEPVYbqb2uocBwUYl5Ltzi6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0nv7W8vVhr0JkTF84nve4JbMYGweEVnfzqPpaJwAmg=;
 b=xbuowyeRzTedra9cx1Sa7+YNMp3Kx9DZLXzZla7KK+dX8hMlNDBeecQ6qgHAfbDASw9dWwnWCfxZLnL7uu0aktbk3lbNtqrNPXG0mBkW69pz85yGutvtQ8vm2GAgb/wkBPZQJ88lKnhl5U2LuMbqf+qPkk+BwiFi8+r81Z2fvNjXfewjZtull3fYGReuc2Eit4JVH/BEqv/QcTm+sz/TZy3oja0IModRhGJ0by5/B/gZqogTpGIISDYMEcFJf0J3OqOe+3xCmG9hwbeBtumGeXegXr8K7p0n+OWzwcC/2B/F0/RB5R/rrXbWhSv3Ue0jgWomMDqiHpr5OsnF1v9Z3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0nv7W8vVhr0JkTF84nve4JbMYGweEVnfzqPpaJwAmg=;
 b=QXw5SkjuIeISF0CFCghjMlzH+R/m2yjTv2yG322fr11BEsFM8mfsiQYotH7gXeQeEKfuOZcPaQE0zH+Zrv1BndbGLbt0IyIadRVC20n+2DbXx6KtnwXmUNQK0KLrC5V9fQ4b3Nfc2d9VFUgxKkgB+6pExBU8V+C32MyqIlxZzkWFHf4oHlxo9lSHSd/4QgYmyKwwtkc1XRxo4ZYWK0viO39VK6yGYWL+R1dETmeerQ49V18eB3uir0V5tdb7G8J4p4+gRyfTgo6Y/u7WEZURYH25fHL406uocWVCzOFPLQYGpPeZfuHWKs5DT3b2tioDd1XezoCq473I9/52ALblnw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v4 0/4]  Add/enable stack protector
Thread-Topic: [PATCH v4 0/4]  Add/enable stack protector
Thread-Index: AQHbZjxnT1sWh5IhbkWxtBQPTP3DXA==
Date: Tue, 14 Jan 2025 04:25:55 +0000
Message-ID: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB8PR03MB6300:EE_
x-ms-office365-filtering-correlation-id: 84d0eeb4-ce40-449e-2aef-08dd345389ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?QALWUg29LEbZ6hJgfrDdWYYN6rmnpA4uKmmTqxuAcm+XBZ6/aAGGk17To1?=
 =?iso-8859-1?Q?UWaXvXi3cEDoA48UGNqGejzPZkqaeS9/8WFzUSurLzmK+FxWXzGQNl4EiD?=
 =?iso-8859-1?Q?RJRnjwYt7WcY5eAEkfKoTT/OgCqLbq0S14O6M4H5mgsWbjXsVMPtshY6hh?=
 =?iso-8859-1?Q?BtDzNb57Wa9YlsK8gKVOC5ThGgPRzw3H99ln3g+00IT3WZl7og9tKg8nDS?=
 =?iso-8859-1?Q?xOrWGyIq2z+x+3EApCL3OC7q9+y1GP3oLpSn6iQSavux9aw9LLNGVYovHJ?=
 =?iso-8859-1?Q?v6sMKvXepp2AKbehIMaYgNCaBUtrYrd3plJ2br9UpZOeH8SWRSvdYOiRM6?=
 =?iso-8859-1?Q?ph6WUItZhFHK5HrvKZSKb8iT6Z1znWsZcMmKDrag89I80LCWabDnoLfYN/?=
 =?iso-8859-1?Q?2PrecPPdvrqxxUXrP8dd4PxN7nwX2lKo98MsemWqtv3/aGyl5djU1p7t0Z?=
 =?iso-8859-1?Q?dP63770l/vF8JykxN/JIDK+vZcktK4wB4ES3vZjWXOR96TuaUSe0Xh0HzG?=
 =?iso-8859-1?Q?NJlRS0xqq0r0YgKBJSBz37tzI5pyAnDOu+F6fNJ6+qfrcnkjDpgXMzGytr?=
 =?iso-8859-1?Q?4oki1oeKTvSa3DxsteA7hRZv6zSyJKIZf8pcTnoZO0GWSr/wVPEbisEd7w?=
 =?iso-8859-1?Q?NFOhx+7CU2ZsPXE+b4jE1PRb+rFIdkLCcUmg+oxtmmqv9jYWhxparro2xJ?=
 =?iso-8859-1?Q?rDYhyLvy/yU7nvFNWafbVY3HeXW+C+uBlJAc1dA+b9q35/etTHpk/B56qX?=
 =?iso-8859-1?Q?iozNWESLGIPWpMxP34NL/BN57lg/67364j5jSy4A3oVhCsW/hSXYcyyrbI?=
 =?iso-8859-1?Q?g5pMWT1rOp8PU00+GkDtKUvCRCqJC5ujWTK4tl56AahjfUrC28wQ9GXT5d?=
 =?iso-8859-1?Q?eIQurj27LA3HEDrdnj2QYOwm45UgzHnTjvGo2JJgS6Z6hGdUtld2WXAowy?=
 =?iso-8859-1?Q?G8xWhbucwCj7Cat6oSMSfA7TlKfaMeXubL2fgqHgD+FldCLaATmDzPQT+0?=
 =?iso-8859-1?Q?IvFxACh+SE1Y5y47wRmkCzCJsWeQwIewqFy9G//zqrGt+7khSlGhH0vamd?=
 =?iso-8859-1?Q?l0ub0xXcPWxkWxsGb1a9KyaTS/eeMGo4nEOJk4B/ybWJiskefi1mrSLG+h?=
 =?iso-8859-1?Q?kaPOKmjvbAUDTgUW6sFsvzu3xdw6iTUa1ZtgiEOa5K1ysrXxSGnOFRwWeZ?=
 =?iso-8859-1?Q?bG5lKMFM2/RkNotUpIjYURITKEqIMroeuQAKXWdEOf/+en04WgGwyX0NY5?=
 =?iso-8859-1?Q?SOooUog6PvDxAUEfgI2aYogfUyszyUbhoKefMb0QaevEKLMA0A8kb2UtVJ?=
 =?iso-8859-1?Q?9MOHH+XQWljJPGvW7Nru/x2oR0z4Crjia9cXvK1ICmOhEepxxZtm3U+AW+?=
 =?iso-8859-1?Q?UObrTrMlXCQjVTO3Y7JlGVaTacGmXJ9fBOsgpXJiNssVC1VpkJC7C3LDrX?=
 =?iso-8859-1?Q?uC82EBEdVWLzOKqh1ihIiqQOUrmH5S6dReHHyukGoegl3msEe9zd9uPseN?=
 =?iso-8859-1?Q?FoJ34u2knbwWmAUng2bSj/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?E+OUDI0NEbRb70cRV1yvgELS0JEo6fULvxVL1Umn5+NyxNB0fjlGhL5zIf?=
 =?iso-8859-1?Q?Zw9NM5TZiUh1jv6SOHrLptHk+Rix8UTHE3mYOR+MPO6ijBV9Tdyl5wvTA+?=
 =?iso-8859-1?Q?FelVbCU0xBGgdG3c0fdHDhWA9vO9Q2Vgdf4whkMtwXaGfIzJCn69EPS0JP?=
 =?iso-8859-1?Q?Wh+MSOyGJGPTsMnD7tXx+q2wBORE1xxTGrbev16HjdxJn8sZHFuaON7asu?=
 =?iso-8859-1?Q?5XELpkt97QfxlpstHAvm1dkLB0chBek6inZqrLoCRFIL5zoyZJ8JPyBj3A?=
 =?iso-8859-1?Q?tbImKsUsMnx1vKFxTVLZ4fXTbiH6Lrnh9X05IRxq4PK4pCgWkRM4DWiqf0?=
 =?iso-8859-1?Q?9Abwum2Vru3hFJnntDNmOjKZGGsugsHnePR50+j5dIaDF1e87FNPLY9UGP?=
 =?iso-8859-1?Q?WF3SYKOXj6IgNCXxyXQbDKycE3oonUTWt/Q70XjMLFa4Z1arxUKJvFTxx5?=
 =?iso-8859-1?Q?U5rwwLMEa/XkXeUolX7ff5KZ8e0mOR6yfWs5Anmmq189OgIPeOXZCeTPof?=
 =?iso-8859-1?Q?MOHyETksZ8deka02IrcBMuSsAl93Dw2KdF5KoMUhjDmHBio2N+iI8TpbcC?=
 =?iso-8859-1?Q?6aIM3CM03P+FJnB5/RtsGKvYLfp3eHHJJtAJQehgRBeajbSnNkjQ8X5l/m?=
 =?iso-8859-1?Q?Odyh9bl0JBFaPLxq6B7l+dy1hcScMOBWl66JLyZyInjJMmpGiT9GjTJGiB?=
 =?iso-8859-1?Q?QJD295cjf3R8aKMHb1Q/5gzvMzflrqTxTyYaXnOP6ZEjZ43xZv/Q4c16p5?=
 =?iso-8859-1?Q?AizRAZSIN7fKgqnf1rgXu5vF8JYsllXx9eWs9/Tb0N4f36bt1lGvhPpO4H?=
 =?iso-8859-1?Q?qlRxHVZkeSgg95J9cbqJPuK0/0Fpv2iCiIvEwHuwuvFufiIaRqLPltouga?=
 =?iso-8859-1?Q?hzW2Y25gnNlnqTsEiLDzyUTDKnQL6rk8eJFCZsCDOmaHhpKSUUX/yBkfGT?=
 =?iso-8859-1?Q?nOLnmcAe5zie99DbyHIpqgsS4F7LthfvLzJfaTfd9rDm7AopmymtnzUDL6?=
 =?iso-8859-1?Q?+R0/lGOzP79Su5uaWsvTdTK+is9pxowC7QCEInWNmqsHbd6U49CALJ7lPJ?=
 =?iso-8859-1?Q?NlJZHae5zIjJUPUDZAbyAlbY98p4409EVvkZBjIKbCs7N3CDd/skRugbEA?=
 =?iso-8859-1?Q?Xj87l0r0cIdNqjdK6jdPbMTdez4ImHz96lEQDWK2env6vObk9lPnIP3VUX?=
 =?iso-8859-1?Q?689V8sEIBHXm94flvyPXFREKWyfuZPUWcoZTwT5tB1e+fHRc6YbNjDP4XI?=
 =?iso-8859-1?Q?r3ffgQad/QIWbT05CJ+At/zGV5w34KeBKDjg8/HQjORoT67YRa9+osvNwp?=
 =?iso-8859-1?Q?fhv2gfeEieLJmWfEqNvw9OJfGbcMKutoZcSK7OWw9x3eql7oMZU3c/w6hD?=
 =?iso-8859-1?Q?gnPHC9Or52QBHiZOEZG4D0Bez1yd3AlOneekjvSMjXXKjIexbF6rigS6tH?=
 =?iso-8859-1?Q?o0sVGO8gAOnjckP8JprDjcbey+xauveLRZhBlVaEKqWc53+XSjSEo56f54?=
 =?iso-8859-1?Q?BcEyv7mir9hdOrnBTN9UC872/YKUJOMJHNATyYcuSqx49SxEMCslKunE3s?=
 =?iso-8859-1?Q?Jmcd5HJKlobaYix4yYUvAjfaWIdHMzcCkp3sg5CiGU4IMpZahx1fMm/GdM?=
 =?iso-8859-1?Q?T/fTY2eoDxYqlNCabkIZk7HUNn+CD/JRSkzFjIox2+4KuGf/v6H74BLQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d0eeb4-ce40-449e-2aef-08dd345389ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 04:25:55.6860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ConcDrQK26gT9YPfN+8afmSBi83WAdbur3CuhXD4Hu7wSWRJwmOKI9mF3SQeBfiOzn+XmsmrukDTYLwHPudBplOzHnPJscoIKjrFE4Hzrqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6300

Both GCC and Clang support -fstack-protector feature, which add stack
canaries to functions where stack corruption is possible. This series
makes possible to use this feature in Xen. I tested this on ARM64 and
it is working as intended. Tested both with GCC and Clang.

It is hard to enable this feature on x86, as GCC stores stack canary
in %fs:40 by default, but Xen can't use %fs for various reasons. It is
possibly to change stack canary location new newer GCC versions, but
attempt to do this uncovered a whole host problems with GNU ld.
So, this series focus mostly on ARM.

Changes in v4:

 - Added patch to CHANGELOG.md
 - Removed stack-protector.h because we dropped support for
   Xen's built-in RNG code and rely only on own implementation
 - Changes in individual patches are covered in their respect commit
 messages

Changes in v3:

 - Removed patch for riscv
 - Changes in individual patches are covered in their respect commit
 messages

Changes in v2:

 - Patch "xen: common: add ability to enable stack protector" was
   divided into two patches.
 - Rebase onto Andrew's patch that removes -fno-stack-protector-all
 - Tested on RISC-V thanks to Oleksii Kurochko
 - Changes in individual patches covered in their respect commit
 messages


Volodymyr Babchuk (4):
  common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
  xen: common: add ability to enable stack protector
  xen: arm: enable stack protector feature
  CHANGELOG.md: Mention stack-protector feature

 CHANGELOG.md                         |  1 +
 Config.mk                            |  2 +-
 stubdom/Makefile                     |  2 ++
 tools/firmware/Rules.mk              |  2 ++
 tools/tests/x86_emulator/testcase.mk |  2 +-
 xen/Makefile                         |  6 ++++
 xen/arch/arm/Kconfig                 |  1 +
 xen/arch/arm/arm64/head.S            |  3 ++
 xen/arch/x86/boot/Makefile           |  1 +
 xen/common/Kconfig                   | 15 ++++++++
 xen/common/Makefile                  |  1 +
 xen/common/stack-protector.c         | 51 ++++++++++++++++++++++++++++
 12 files changed, 85 insertions(+), 2 deletions(-)
 create mode 100644 xen/common/stack-protector.c

--=20
2.47.1

