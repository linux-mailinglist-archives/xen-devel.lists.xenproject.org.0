Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B04CFA347C6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 16:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887825.1297280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tibHx-0008LU-9R; Thu, 13 Feb 2025 15:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887825.1297280; Thu, 13 Feb 2025 15:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tibHx-0008J1-6K; Thu, 13 Feb 2025 15:38:05 +0000
Received: by outflank-mailman (input) for mailman id 887825;
 Thu, 13 Feb 2025 15:38:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bb01=VE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tibHw-000853-9r
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 15:38:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2614::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82e65865-ea20-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 16:38:02 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB7030.eurprd03.prod.outlook.com
 (2603:10a6:20b:295::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Thu, 13 Feb
 2025 15:37:54 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 15:37:54 +0000
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
X-Inumbo-ID: 82e65865-ea20-11ef-abfc-e33de0ed8607
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccNGH4/kCG5F8ffMOIjScwrhcB7BO/2hBQxgcGZIMVmTG6gU2IUa/2V0VqpSIRpD+ZGKMtYSf+8sOA0QiHxfxQux5wphK0D8xex0ftthgMOPn0mEOQVrefPuoZfWL9lqbs3fzjhNZgrOz50bW/RhuQpOm++/Vhnp4nX1U3O1cfaqqN5jaMWXvypySbjkM3QkN8MqsLsSqDK5d6tSYLf8P4KRoflxOqRn8020MSYn3Xy4tBs5rN33dbpoFSDB/SwNFyeuOy3u2t2VxbyWrwwirOARNyhtLY41O4YBfjAbeLf5kS2yYbt4Y9kgDwWlZIAFa7DI3MVlK6YkWIP9Nohh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feXeKd2sh9t+/pds9tJODtekUG6iJL9IArA7tNh/eoU=;
 b=H/yBveTfh9rvT4PRgba/dzOBE16WZpa7SA9WvwfYSjXnfB72UvlC1Kn/TZGzzLfU64JrBxrxFp2uGHAFe/gxT/Cu657BFFZQQQFhaKt9rGak6MouFE7JQCFZ8HDg/kspjYRgznZfPXQpHoAUX93qAT4MqwE8N4k4KMl5Q1XkZXvXobJzRxZAfb7O3WahfV9+Exl2Au2pfzkwIquoAMM+aoYmOqTcvJfCMiTHbTGuR3et6kRp6lKJSLcUXGxUJ73ObF314u3XqR62Pe5bxbkEUqO9IwZ2ohGE65G522OZpn2AlPxbA5y5kJ43d49BDEFx/2WzDP6C/eQz9D37AQn0dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feXeKd2sh9t+/pds9tJODtekUG6iJL9IArA7tNh/eoU=;
 b=uYiSWfOY4HlVKk6H5oRh6fNmnUzJfouknX4+1sl2ZndhrP7GAhUOG36/pETjh+iSlAuLgKgd3G5fIzUtHKxsjeKCwY+AitSX57edTIAZIuts3fGCFX37Gkyre9P4kjOMOl37NwIY1H3yqZdrOpqDdQHmXe2zayicd8e+GztW45AE6uRK9P8xmnS1lJKvUUnseh/QHGARncv4OhfVbdWgvp2jRFpoOei3GwKqfxI7WNO0AdnEzD9TC/NpUKNg1CB+gLfcp+0MYy9FN1ZDv/FuUoxCY3Npy3IDRJ833cfvP8Sj25LgBG6ywte4fOKsSFoy+v3E+7m2HJBcJ3rAQhk7Tw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/2] xen: arm64: Set IL to 1 when injecting exceptions
Thread-Topic: [PATCH v2 0/2] xen: arm64: Set IL to 1 when injecting exceptions
Thread-Index: AQHbfi0/Dl9MXK7n90qWbfS8kxOotA==
Date: Thu, 13 Feb 2025 15:37:54 +0000
Message-ID: <20250213153748.2869989-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB7030:EE_
x-ms-office365-filtering-correlation-id: 2c5fab36-cfe7-4fbb-0d74-08dd4c44620f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?60dxh9zDiqgOQSEG/9wHxWzeL95c13DJ7yg0s1O8ecL/Q3KllSJ73+pnKI?=
 =?iso-8859-1?Q?ChLjDlXhk6qE41+xzR4oByN6xBRxndBLCkpSQAgJoF8nu1lZ9TmcvgTOpu?=
 =?iso-8859-1?Q?zLm9RYvuk318JZLDSqks/k5Ra51Tm62w+6iL8IdA9U0p59wwWtxrtKGUrq?=
 =?iso-8859-1?Q?WCYGe2Yy9TDRQH8lbFbOYoJqVaIasTDnm8q2QwAaS++rXqMbtp+qUbv6VW?=
 =?iso-8859-1?Q?QT/snrQZymS/VzV1RQ74GiOUwQtzgDl/BeBmvWPxTSoWwsRR8GQzx6Ke48?=
 =?iso-8859-1?Q?O+i6f+PKo2uqV6lNwFPV9Wp8QLPIE7jYyY1bEy6soOrZoUGvZGox06uoap?=
 =?iso-8859-1?Q?WEJ1Lr1Q+LqA3L9+loKkzsSzZMTO22VY/c4e9Ws+zlUJsFn8LFim8WuZ/I?=
 =?iso-8859-1?Q?gCbbZ/aG5gTt95czGro+NN4cFBgCqT+87j6kYQT/uSIz9ySbMVPhIBwEhb?=
 =?iso-8859-1?Q?scPDblY+fNcspXcmJxSmodJ/UnqUeFTfDhXB8i5pbkbH+snEjjjTglHh1x?=
 =?iso-8859-1?Q?bOqvmV9DlsG80R2vBoyjSfnZ/Lzw4J/NkLNFnRfHztElBVnVy9sdoTyx+9?=
 =?iso-8859-1?Q?SfI/kS4t5GNSdCYII29sBL/Zs6MONToYh4BPrLEifGsRBUx81X68Wdgvtf?=
 =?iso-8859-1?Q?x4M/1b8W+pe6nAMG0x9nk8wGZvuZdSGXsvXrmdCTrN6DewRcsjC1/KfJ9t?=
 =?iso-8859-1?Q?Go4VXPdT0wJt7bLZH8AdLbNCPob9AZ6yGe5cHmF6lkHpdTXVPI3Yh6nysc?=
 =?iso-8859-1?Q?RnoddrDupLCVkqlVdJu1QA3wl0cdw23EmTHG7iIqLNlijRpatSqWBveeRk?=
 =?iso-8859-1?Q?e/XddP4XBbYNDQJLRsPJmHVXH2tDqSehNKHEwNk2eNQjmIzImu/Ig/g55a?=
 =?iso-8859-1?Q?kU60Tiv85GsWXjvGLTkaWl0BdSU9Ld0CJNbTInydq5ts++//E/+bKyP6y9?=
 =?iso-8859-1?Q?8V7DxCBvA97tzet5+RQbFoWY+LwfsMI2yGnyRKHAtYUJelrNpAI+4Eyk68?=
 =?iso-8859-1?Q?dKlavlD1RxsO9mAqx408+YGl6bZC7AnUvYKwilHz9stjAIYaS8qMvIKzqs?=
 =?iso-8859-1?Q?m2NsPtMczdr8udEQzHK8IHhGPBWhsa6tkO3322StND+C2H1fozEb800yjy?=
 =?iso-8859-1?Q?ukCsGFxY6rYjXI0kGm/aJ5U64uydck2Ylhtvge/bLW7QQrByIqGXM9X7k/?=
 =?iso-8859-1?Q?HKgCZigFY26eqMHblkHijDpSI6+0+l5GkuTZ9HE65Pusl/saDRUPLnRuTP?=
 =?iso-8859-1?Q?qshvr4fz7lkqlb86F/JHHaVZSZ380zsOf/gSa3rpK7yRHQqftnxlbm6hjb?=
 =?iso-8859-1?Q?KWk2tACqeKpKZ1v6bTEGeci+vww3COUFH5yVscmcm+HtFD3mwBZ7YTkcxu?=
 =?iso-8859-1?Q?LXO+8Wqmc5zoY+FN9aOaq8oKKY6AK5uJcaY8hxQyB7cp8x//pGPRwKMMPi?=
 =?iso-8859-1?Q?UTNQ8hcMY79Ywn2/mu++T8uYw+34iPF1XVv3iNkzdEdH0E9CLrA+Vcgu8c?=
 =?iso-8859-1?Q?wpVWgmv9iyYm1YtB2EYdw5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MrCBSt+OhOmdv6CLQY2O2aXdztnJCQeollAjcIOK5NNILxvJFjAlbbqQWU?=
 =?iso-8859-1?Q?VTHVr+h6UlmWGmfB7wRzx0sOX8qryO8eSUfFaVjqnHahap4MCN7sIAk9OP?=
 =?iso-8859-1?Q?eu+UX2q2OhyNbRFW8werJ3PizurkW7L4d164LuVNerLBI4flsz20ywWF9C?=
 =?iso-8859-1?Q?n6o5Mljp7KAVV+mu30av+zPxvFfHvunqCmhmRSLnohSPYzXrhx/G6f7bNQ?=
 =?iso-8859-1?Q?HOnfHOtRc/fADUcuu8eCRyZr+i3e9hmd+GDwjw+ZieEwGjQP2u/CfwjNwJ?=
 =?iso-8859-1?Q?DRPYOWfeV+zZgJUdnaPWxTZExyE/WDjUzYOXEnZSNlrNkUSY1apw18qm+J?=
 =?iso-8859-1?Q?gG868pZ7DtaBnm1p/0HQCgXVqJr/Yl27lUius8XNQnBk0hxBBNPTTmnbHU?=
 =?iso-8859-1?Q?mwuGjoj6LOcLtNA1aYoluRTNpKZ6ZVET3h1VrTYuMezXf5ilVnG3QbwOI1?=
 =?iso-8859-1?Q?VWrMmTonnHjkEr1LldLGcTkxM96prXgPBP74cHNScoDppPB8GxS93yNKon?=
 =?iso-8859-1?Q?t8kqiB06cPOUr62OJTFNihFwsYFFYLPUI1xV2HUpm/lAETluI0cynB03c7?=
 =?iso-8859-1?Q?2QHpgUaBw90NY1imuhWn2WXhKtQCYN58dz3pNqvcy9tFHNrHpnv8xpnby4?=
 =?iso-8859-1?Q?6Mut6KNPr6PqBNeQWjtkjZqFgJod7YTeWZ/OX/LxLOSUBdH557SOTwItIL?=
 =?iso-8859-1?Q?txLYA3Dun4YlGgh84RB2ntBOWf3aF699G93S+EVUFJKSiOPfyFzOSvbSC2?=
 =?iso-8859-1?Q?xShnDCdppMj8YZn6a/fGlCFUIdBLSs5s+KfOnpAR3/H/RXBsVbdSRPiwzg?=
 =?iso-8859-1?Q?WgbTnjDfmhbRbr8tBTlfNM0KUNDJo6USy+eSTS8OQj/YWJfsjbUW9T9yU7?=
 =?iso-8859-1?Q?NxN7WKLRKk5nU6xQ1AA2RRfbm35XPGNaXsryWztJQB9zZc9pOn/GTlBTA0?=
 =?iso-8859-1?Q?+y+vsgg8ZSqWEF4arLqYCBfazSgPCJ5t02IDpi61Eco0SUMrVC8NbeMih+?=
 =?iso-8859-1?Q?NV+NoyUP5FpvV/NzKSh6yuOKyz3/cWGa/AJuO3q5oqBoQvQOq9FyMm2LSg?=
 =?iso-8859-1?Q?yJb+Gg+lQCu2niq61wnRKQYMwUmTI2LTTGE7dQePMgGW7lKA3a8D/YBC/G?=
 =?iso-8859-1?Q?2dc1juXI3dN+b6vySV9JMKCuHy+EuKV+Yn/NApbcBKE/onYgUWmDcL5jxK?=
 =?iso-8859-1?Q?eFBSUl0Dta9ZKrwzlqm8rIo/pabf9VIgJWuxrcFgzHTX0jSezwbB2jjmQQ?=
 =?iso-8859-1?Q?tebEo/x6hdHjfxPCpRvoF1JS7grZoFVObtVE8G6gYwqCHzgxO9y95tGnQ5?=
 =?iso-8859-1?Q?rydZ+5BpdOTsjFNzZt82dY5BtVqPNkLXse/0+kv9/wVOjFb0ypTCYbef0m?=
 =?iso-8859-1?Q?CKFU9RAUnrNEz4ZHDzprb8r52JhhBTdsXD/EqBGu1DrTqZUFJP1BmqgkIN?=
 =?iso-8859-1?Q?IaJaV9LBmVx5ERQT9M3TpmxfJCmH4c8hjvutIattGGV4c+hYe37hky6EPL?=
 =?iso-8859-1?Q?prUGvLyIeaFBJZjt4AVPs90wf8KadmbtibS7xMHHuFLR2vqtBLf3QztlHE?=
 =?iso-8859-1?Q?lFeKFYT3V5geQcbyz/Z5OaEOVjQ1kMpSU8m9PsJZW2Aphs24MiHODkxqt8?=
 =?iso-8859-1?Q?BvEedfkpSw+uGE/VixP+WScLJngYbOV3wVRdvpZrUJbQkBNzJQYg0Zsg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5fab36-cfe7-4fbb-0d74-08dd4c44620f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 15:37:54.2621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JF8ke9Pu8FvennoBqcBddh108SYpV4s0WRjyAgft6nGAWASK27MjjU7zkgIxAFWqL3IaQEQK3exOtp1BOREe/gLwdErbtyMzXExk+m98vmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7030

Internal discussion on "Is ESR=3D0x0 a valid exception syndrome?" led
to realization that:

1. It is not valid exception syndrome

2. Xen theoretically may inject an exception with ESR=3D0x0

Further discussion in the ML showed that Xen also may inject
non-standard Data or Instuction Abort exception.

Following two patches address both issues.

Volodymyr Babchuk (2):
  arch: arm64: always set IL=3D1 when injecting undefined exception
  arch: arm64: always set IL=3D1 when injecting an abort exception

 xen/arch/arm/arm64/vsysreg.c           | 10 ++---
 xen/arch/arm/include/asm/arm64/traps.h |  2 +-
 xen/arch/arm/include/asm/p2m.h         |  3 +-
 xen/arch/arm/include/asm/traps.h       |  2 +-
 xen/arch/arm/p2m.c                     |  5 +--
 xen/arch/arm/traps.c                   | 53 ++++++++++++--------------
 xen/arch/arm/vcpreg.c                  | 26 ++++++-------
 xen/arch/arm/vsmc.c                    |  6 +--
 8 files changed, 49 insertions(+), 58 deletions(-)

--=20
2.47.1

