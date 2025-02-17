Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6688A379EE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 03:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889655.1298748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjrCJ-0002mO-6n; Mon, 17 Feb 2025 02:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889655.1298748; Mon, 17 Feb 2025 02:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjrCJ-0002k9-2e; Mon, 17 Feb 2025 02:49:27 +0000
Received: by outflank-mailman (input) for mailman id 889655;
 Mon, 17 Feb 2025 02:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGlc=VI=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tjrCH-0001oi-86
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 02:49:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061c.outbound.protection.outlook.com
 [2a01:111:f403:260e::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca54cdd2-ecd9-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 03:49:21 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9534.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Mon, 17 Feb
 2025 02:49:17 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 02:49:17 +0000
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
X-Inumbo-ID: ca54cdd2-ecd9-11ef-9aa6-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyKA8lnoeY0vhCCxljZgp5JZg9OlD/T9g9HRMpZk9g2qP/HkFLrgSWKq6QFdA6SCWwq1Dpi8zoOBuXoWe6rzEQhqoqDwVz89Y2zNvj3mAEuO7PjBwPiLC5CExBer87vfGYaxtMhUzHw//lFIutSMC66/jR50sknTs6sMCs/bvxHSsTbclGGN3X39+gcifrw97MvOhOIqAXd62itRLs8saD5kyEDEEcpYtmRqGAV+G0rkG2JiB/wZecJhlpA2da2emfNC561HrEZUpYYT8XwapxskB4Lo/WvPQrl18fNfu0nXSj3UkGX5s1hHDJy8eCCQ8wx+9pIHXLDv5wvWrJZrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPQWEWjJWgqQ5ilMuiG6MAnVTekf3gFSc1AqZ/HDA7M=;
 b=ZSpHfytx42BsxwwEkFZb2L4K6RO1quYP7AmjUM/igqZjD7/z17XQoDP2Db7yqzc5qgx+hOSueb7AL2oiA/+a8t8rh8apujBbNPKr8I9xR/IhlKzYWG+HgLAEsuTuO0Jz3VyGVcyBExnT93hRLqnAxz3AzTpStbIAYpu0yYIm1QfUXD3x9/a4POjvvnvhldnKlJgns+e5v3OmQeT87PDOIJXW37Hyk73wn1SFfcjo66RvxfJi/CtIM9zC47NBR0V3rlfSN6bj3t9Gxj6Y/gXrjxbjLuZdyk+oM51HCZ9EiaMYxkWvheogRv0EF/9sD5ICXJhV8Q/gNYGQp1WVq81f5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPQWEWjJWgqQ5ilMuiG6MAnVTekf3gFSc1AqZ/HDA7M=;
 b=cWoqZbNWOEzJVf/rq5ZtQ1ZjrlRfV+ofsnGLg+roYYQ2vweDe7uR9X7RGlSNO+K+mAnMS/VzLTqYmK9SUu+PMZvYdNnpn1DjYGQwiJpIDDi9CUKfs6H/VRXbebBxgPNRdwjY3/WpfYHQYWMwDNWpAHFhK4zAO5liwp1Qwy3EGuuTNpkKSJk22/pJRoHgkv9M0N7/bv7+erpTNVHfbymowuy1Vq+3PhLftmygsYAVx6+zRwlA2yIkVCyhV/taUcHN62K0XFZ232wyRBk18NHBYeHHBwjJS+oWhbEe7Af5fu2oV72Gw2czn6v1WgW4fyZVenz+/leOHBNEm3eIDOvGMQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v6 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
Thread-Topic: [PATCH v6 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
Thread-Index: AQHbgOaJJQf0pUwpaUCZ/8SlkQXdFw==
Date: Mon, 17 Feb 2025 02:49:16 +0000
Message-ID: <20250217024848.3059635-2-volodymyr_babchuk@epam.com>
References: <20250217024848.3059635-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250217024848.3059635-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9534:EE_
x-ms-office365-filtering-correlation-id: 08725b4c-7896-429f-38b1-08dd4efdabc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YdgYpa6xYmtknD3POrvTk4L3wEprD+aplE5NJmVskkDSOG/3bkQ7jLxAP3?=
 =?iso-8859-1?Q?FvGfOUa6ubH75dVjQngJy3VbQDc4yxUFkc/Zwr2v/GR13yLbG8ozlZW8i9?=
 =?iso-8859-1?Q?a9fbd7OWCseETHx5I1FkbwVSVow7R/VUPcBIh3ymdOmTxXBdDD3w0A42Qu?=
 =?iso-8859-1?Q?Cany/ndeQKS8mvYoub+2/U1LK2GTXXmbZxNNKtKfLoSDvfWkSzmTipSy+3?=
 =?iso-8859-1?Q?u6EXMhpnTmRGKMIjc2vzZH+B5zzkw/fEC1yiCtYaY00jX+BLKMtLxxCddG?=
 =?iso-8859-1?Q?uG+2ZEpYBTjC/h8krFSYx2W9XG+5heLrnsZpSQmyWKVhNdsVGVReeXlN8q?=
 =?iso-8859-1?Q?4YCcbfb3bWl1kfKMFZMwyp7MI0jFc9cchzv5xIc47Rdq/PsOnFCmW/l/u0?=
 =?iso-8859-1?Q?dalCr+/sbxALsoDJ1C9tLQgCoWMdIllvJXgXGv2qGWKXGbr+CqZozOyrrw?=
 =?iso-8859-1?Q?qlM7jp/vgYJILds2JSjsp1gR1ok8YpDYRiv3oSswAPTcs3eECiYaE1Zdsh?=
 =?iso-8859-1?Q?ZhPA4+QsX/B5h10hE8oWDcGPm2XDKkchcY2XW3f+a0YUDZyOdHnSLcxPsJ?=
 =?iso-8859-1?Q?M/+YRWDESqvTpzqpaDdVeYlyu37CBXSm6Gj+jDVh2/LcDe6VktqhmoHdjR?=
 =?iso-8859-1?Q?wl1Z0ASzoZc2pbMn4+2kkoiSxGBLkTc5KNaZpDCXQrSL+d0CGwkbbLkVqB?=
 =?iso-8859-1?Q?3mLBIqO/pIMXQVulnMwU1IMgbq2cwgHhXuFzDxmSMKVpSayE4vKvLnpl8P?=
 =?iso-8859-1?Q?wvlTajGEXEtNjU/8Arx4zepzJ9DhwzFUwPdR2u2298nMgUSotTjbPqSMcx?=
 =?iso-8859-1?Q?4oUKSX08n79Y7ucj7UHx/0bnkUhxKB+/695ADrUi+Ed9osX+sHqrUxu3ZT?=
 =?iso-8859-1?Q?fg2hx5G4h0DKqN1qa58IWqITKNdpdVrl7agWa4gxNLLJSeY4xVp4HyoROo?=
 =?iso-8859-1?Q?lf8+fHJf6S2cMz75wBvZTIyDZm26LRU8ck2FhN6wsF49MKumErlL4jubLN?=
 =?iso-8859-1?Q?ET3UApWUGarM4Hq45WdpGapvt2r7KnVbxLnPs1egLlrofvlDzDB8+TMsXx?=
 =?iso-8859-1?Q?/sbZmSyI9q672HoLQblgsVvaSrSXLZm7WI9wqAALHDqyT/WqoAJXyR2wnO?=
 =?iso-8859-1?Q?fS417kmwrc73apq5ND7Azq0UUJLnV0Wpgy2kHNFTVdyfa6cI3D+Sj/Hphj?=
 =?iso-8859-1?Q?u6gCfCo/P9j5yvbYI5GtV7Vz2AME5x5rLmimEQSTIRAdsdMPaPS+YeK5ZX?=
 =?iso-8859-1?Q?rpy4K7KVjOsYZBUv7ViTu/3wfifYyvcvNyxAJQjiOGhm3GaXJ4W5k/tW1W?=
 =?iso-8859-1?Q?TqHpxhetUx4Uo3BVhVLsNyMM2/aeiTpcPN/W1qxdM6AgMYEspkrrs76GtK?=
 =?iso-8859-1?Q?apjep4BC2xS+3lyKHoE9UZDeAZ1G/QL3T5fYdE3M4n4wc0WLnCRDHgY6bb?=
 =?iso-8859-1?Q?NrCgB0gpMRLpB4fu0ZW8x01vsgE015p+eQdSdw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+77McI7e3FNDOBgQs0v+gf9jOILjAXorUSycZZgmrz4bH8i3hVLv1wBmWi?=
 =?iso-8859-1?Q?saQKMLzvo2LiGQdcLE5/p0DaYxdEMKCHa6H0BlZcxtWlNP2RGiOYUdo07C?=
 =?iso-8859-1?Q?1nfAJDYoe4rB5uPuFNqHxbEl6V8HhUcju8ocOOcF5JMaRTqwK/PTmkzlLn?=
 =?iso-8859-1?Q?7g0dlHNvHn8ZB+jJR1skiMp7Jo8r0nCKFHo3jIJRuiCw4DtSlT66dNQFSH?=
 =?iso-8859-1?Q?ebXOWYkQVQV61OrXwoq9D8AVTpkgvhINvNBoW+nE8mY1rV3kYsZ3/Ul4fh?=
 =?iso-8859-1?Q?oYzpphSk6ecF4PapNeSoDvNNqP5uYAxXDY8C3Fj54bFNaYLcDSbxUUonf+?=
 =?iso-8859-1?Q?/sqcFcSusTBuTfc1ttK9asxZy95o4YAyxNpX4uX5Ev4GYuOzdfqkAiFU9Y?=
 =?iso-8859-1?Q?LnRk5Oo75atmF3hOmyU8LIfcyLeH/byCR9mv3AlEbd5bUcZvVWlmBBPTg7?=
 =?iso-8859-1?Q?Tr4i7G8JtCo5eO/llDCFwtv1sbcqoCLSiSo7szLpJX3vP3C4yjgKNP5EX/?=
 =?iso-8859-1?Q?3Q1L5yYsuTNOKkqG1Z8UabDnMxPQAweAPLhqIDKoJCu3USHeONITddXrxr?=
 =?iso-8859-1?Q?4TCQYxh2mO5CsUSVXopIAybWcBrpgfyzhWyaGbb2aFkbUSsvZKYBWVIFov?=
 =?iso-8859-1?Q?YA6qBVHlPON4aB76mlmZqJLH21wmXU9F1TXCDf3vigPzoL3JsbQCDW4mt9?=
 =?iso-8859-1?Q?3/hU2lNDA/FeMQJMTevG2ZhxGeayxWsUhIza9cn5faEJDQBKjKy9Qtk/Pa?=
 =?iso-8859-1?Q?yoGcl4IYag4ESIN7SvXGoWykOyWKk5wUqUg+Nhgu2xIUgwmb+zGQTMpy6q?=
 =?iso-8859-1?Q?xG3iMe7tiWOca1ElnV2mCnm8OqOocnGTQoqLldklzEp7KUKXP8hz2xsJwL?=
 =?iso-8859-1?Q?vr1BGekfgyaymkbyMhY1aoQG9hwu8DO5SYTxgmzxoLGfL9+8lOvGP8Qzc0?=
 =?iso-8859-1?Q?77uL+FrmMAw9isVbQl2X6pw5rWNdSLmdkieuEhlHmk3b+/CtfRW39dms66?=
 =?iso-8859-1?Q?dK20a9cVk7FXHDwE/+BlUADYqBAkdQaF9lEi61wLmBYaGvjUQngLS480ni?=
 =?iso-8859-1?Q?fsWYn6efOXc5ubuHrTGcHcWB1ufNf0RxEuD57rIqZCv5FJJD42iTRG8txG?=
 =?iso-8859-1?Q?TBryilAwgSr42QAU9/SZhIHP8ubByXJ92o94l3qCOinv/OPxU5mNKWlEzj?=
 =?iso-8859-1?Q?rcJVNTR7UIRqMqSso4yrKNCGau4iXlfGTSld3zqhnQs8omLkkqe+b6fDFa?=
 =?iso-8859-1?Q?HbMr1bNeMf/cqFzV5+mU6HAbhylYJikcGmLEbJo4TN9EJY45fsgrUklXJU?=
 =?iso-8859-1?Q?AJmsv6Z1nI+juTopHCfGV6BhJuMgiW5rRx/uXbMeHj6P/blFnUOKhwucXP?=
 =?iso-8859-1?Q?8Ruz9kjzvA1WM5ajQNMCRunNbfoBoGUBN17/OSnixCEVcg8Anr6tBFOgc+?=
 =?iso-8859-1?Q?9LEgtNPsqU32X+It78wUshNB6/Kyn4MyKw5LFdu27yh9Rb9BBP9jGz2gCG?=
 =?iso-8859-1?Q?Z0kfd/2DZxy3NtABHSBr5MZkUYXV6xcy2G8tEQVxrXxRIeJJQTkmFLbmmo?=
 =?iso-8859-1?Q?JIKqRF5yG5wTK2V/5KbwQSJE/M9Rtvih1y1gvUCV37+h+Bj9/zJM006Io8?=
 =?iso-8859-1?Q?e8HITk7ZNoWcAhAE9rHWEtT3P+ksEWkB/NLRWwn/0/4nSGP4EeQcsWig?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08725b4c-7896-429f-38b1-08dd4efdabc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 02:49:16.8178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CEvS3qT8G7J4Kmfc3FOHGIPjGEFXjgHbzd85ncIs5LgIpqXkbPTu5GR3hnQ+HoZz4Jn5XS0cYBcn9yXrc2h64DLvuFF23WGN2i1ljLAGA5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9534

This patch is preparation for making stack protector
configurable. First step is to remove -fno-stack-protector flag from
EMBEDDED_EXTRA_CFLAGS so separate components (Hypervisor in this case)
can enable/disable this feature by themselves.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 Config.mk                            | 2 +-
 stubdom/Makefile                     | 2 ++
 tools/firmware/Rules.mk              | 2 ++
 tools/tests/x86_emulator/testcase.mk | 2 +-
 xen/Makefile                         | 2 ++
 xen/arch/x86/boot/Makefile           | 1 +
 6 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index 1eb6ed04fe..4dd4b50fdf 100644
--- a/Config.mk
+++ b/Config.mk
@@ -198,7 +198,7 @@ endif
 APPEND_LDFLAGS +=3D $(foreach i, $(APPEND_LIB), -L$(i))
 APPEND_CFLAGS +=3D $(foreach i, $(APPEND_INCLUDES), -I$(i))
=20
-EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie -fno-stack-protector
+EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie
 EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions -fno-asynchronous-unwind-tables
=20
 XEN_EXTFILES_URL ?=3D https://xenbits.xen.org/xen-extfiles
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 2a81af28a1..9edcef6e99 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -14,6 +14,8 @@ export debug=3Dy
 # Moved from config/StdGNU.mk
 CFLAGS +=3D -O1 -fno-omit-frame-pointer
=20
+CFLAGS +=3D -fno-stack-protector
+
 ifeq (,$(findstring clean,$(MAKECMDGOALS)))
   ifeq ($(wildcard $(MINI_OS)/Config.mk),)
     $(error Please run 'make mini-os-dir' in top-level directory)
diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index d3482c9ec4..be2692695d 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -11,6 +11,8 @@ ifneq ($(debug),y)
 CFLAGS +=3D -DNDEBUG
 endif
=20
+CFLAGS +=3D -fno-stack-protector
+
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
=20
 $(call cc-option-add,CFLAGS,CC,-fcf-protection=3Dnone)
diff --git a/tools/tests/x86_emulator/testcase.mk b/tools/tests/x86_emulato=
r/testcase.mk
index fc95e24589..7875b95d7c 100644
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -4,7 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
=20
-CFLAGS +=3D -fno-builtin -g0 $($(TESTCASE)-cflags)
+CFLAGS +=3D -fno-builtin -fno-stack-protector -g0 $($(TESTCASE)-cflags)
=20
 LDFLAGS_DIRECT +=3D $(shell { $(LD) -v --warn-rwx-segments; } >/dev/null 2=
>&1 && echo --no-warn-rwx-segments)
=20
diff --git a/xen/Makefile b/xen/Makefile
index 65b460e2b4..a0c774ab7d 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -435,6 +435,8 @@ else
 CFLAGS_UBSAN :=3D
 endif
=20
+CFLAGS +=3D -fno-stack-protector
+
 ifeq ($(CONFIG_LTO),y)
 CFLAGS +=3D -flto
 LDFLAGS-$(CONFIG_CC_IS_CLANG) +=3D -plugin LLVMgold.so
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index d457876659..ff0d61d7ac 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -17,6 +17,7 @@ obj32 :=3D $(addprefix $(obj)/,$(obj32))
 CFLAGS_x86_32 :=3D $(subst -m64,-m32 -march=3Di686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 +=3D -Werror -fno-builtin -g0 -msoft-float -mregparm=3D3
+CFLAGS_x86_32 +=3D -fno-stack-protector
 CFLAGS_x86_32 +=3D -nostdinc -include $(filter %/include/xen/config.h,$(XE=
N_CFLAGS))
 CFLAGS_x86_32 +=3D $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
=20
--=20
2.47.1

