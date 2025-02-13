Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE48EA350CF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 23:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888111.1297525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tihG8-0004sQ-MC; Thu, 13 Feb 2025 22:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888111.1297525; Thu, 13 Feb 2025 22:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tihG8-0004pV-I7; Thu, 13 Feb 2025 22:00:36 +0000
Received: by outflank-mailman (input) for mailman id 888111;
 Thu, 13 Feb 2025 22:00:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bb01=VE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tihG7-0004bW-3M
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 22:00:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f403:2614::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f29a8177-ea55-11ef-9896-31a8f345e629;
 Thu, 13 Feb 2025 23:00:33 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB7069.eurprd03.prod.outlook.com
 (2603:10a6:102:e4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 22:00:29 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 22:00:29 +0000
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
X-Inumbo-ID: f29a8177-ea55-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZkWAiBjmXhnpcK/Nef475bXBvYI8iEBR/MMq5Raq40DlHT1W8jYLJGpha40/sZiD7Cw4bgLx1KJ+SeN7y53KeJAgTZ2z/XAbkhWULFwzpzjer3Mzj9QrWdwR4Zz69W3+x7tPdfBnLJSx5vR78OGXlfhSJxyWsdLVWnbYMjaY5JrUcSIDsF56qvXuIbjcAURYiqPoBPdSXa6dodYkjwvyH5MaQ1SRfhzzQ+gyP6+6WFkafyHqoVz6Y5DrlqpjrIqKBwR0JjfY1+nlPD5SFvG+hSnu1aBfoB7/K2u9F28LYkTp3a5xtR1mcXjSG8HrKm9kh5EUnGtnZG180J5wpVY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPQWEWjJWgqQ5ilMuiG6MAnVTekf3gFSc1AqZ/HDA7M=;
 b=c2cDhrXGhWOMASww+t6OhuFf9hz7/tqLlbR6Wh7LUXZzA9UlFQB1yrmpF2LUjhiVISDQ9at//BeOLZDlCbl3kljOono27BzHxpJ8iFl6yyxIa0ktCZ8lHF2Df9znLjL9pIhE9bGyUFP9xqxjg2H2gDWg7/ICy/brkYByAEjTNlwhUcz8NrC8Of6e6S5T4HnnHBFsdBSw088VP6RMmx51d+pw1+5X3vuC8lbT59ZJuCf5+4Dr5KBL3k0yftwm3wMeuYWiWwl1cdMCK/8J1MqL/B0CCBjB+65hu+J64w5lh9pn6X3ToLewE3EQ5sBop7nliBRc8w4FQciSigRnsPk1/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPQWEWjJWgqQ5ilMuiG6MAnVTekf3gFSc1AqZ/HDA7M=;
 b=XYN1r8R5vLBpFS5DglkgpGkDggqURajUXBbnvQlb4RxcZ9sOn8m225dOi+Xa26+t9VdpvX7xOJAfEZhz1SvqnAUME3iRG8qtV//mEIyDm9QksjKY6H0GQWqqiPMz+Ssw/gNOIeoiffIQjIC3icQMLJG+tQ3zDfwGTrapt3eRG+ffIbGatKhKXaYI8Xvir3CshZ0RcklP7lJteeFH9wCaD0rOtHwDoADpQ+1KciZhnkV/dEHz3eFz06tsGpkEhlnd8KCdQZDv0RDFa2j603EWcX8ZFyYEAA9MCY3caU2riDmwZI7HbhgQ6iOIaeq5Do3IwPgFFO/6x3B8HKSxYs8UIQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v5 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
Thread-Topic: [PATCH v5 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
Thread-Index: AQHbfmKwo278lWdDqEO53b/eC0p8tw==
Date: Thu, 13 Feb 2025 22:00:26 +0000
Message-ID: <20250213220021.2897526-2-volodymyr_babchuk@epam.com>
References: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB7069:EE_
x-ms-office365-filtering-correlation-id: 90536e17-6912-44b7-3ddc-08dd4c79d449
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BC0pPxhFGM59eQnVEqRt+IlqJgN06QdAuGnePImcUpGxZ4IzPMBCke+sNb?=
 =?iso-8859-1?Q?oT0O1A3DO9bktpClB4qCWe0Z2LxtqjYla9XPRdfN+lGOPHWMRskj1LfVwW?=
 =?iso-8859-1?Q?t3enmFyp9qjA6mf5C32Z5l2ZgVKTL7n/n02fN/L5Jtxcs4j3i7+UYMsVE9?=
 =?iso-8859-1?Q?P3vKuNjA9fIyZEXqfrirPuesXjGurA21E72tfMmc8A7FuNXfchkCzxzpNd?=
 =?iso-8859-1?Q?FbhiwoBRuLAEC/l8hvnpuuYM/8LugtMFtLHlWmG8zNQ0mmIUnxQTNpOZTi?=
 =?iso-8859-1?Q?4PapXDegKMyQe9bwDrJPN73YP1tWlOh0gBNtS4KuMYqgc0WHDBF0jeGNjK?=
 =?iso-8859-1?Q?pzCa2OYsxb39T294Vtxb2pQzaczA60DPCOA4rciAq6IRTNvEuNlJi3zMQJ?=
 =?iso-8859-1?Q?OPhySdGPc0fY7aaROodkR4a4UWdR2ZuHCCRvwD8BHFMnQNiTiNm0p8HhW2?=
 =?iso-8859-1?Q?uoBPq30pGNEGrqwRF5GoaQpThXhqt+KFMAVkqHl51BKMQrIfTIcv8rmesE?=
 =?iso-8859-1?Q?C3XrXz/iKzepTnhd1JXD25VKxVICb7HiHKUI9pwtU3KvjhjX1gLnvWB20J?=
 =?iso-8859-1?Q?boe/NCFvh1Qd3yn8Vt0Wzns1QOsd/tHZUpLC6OUs4xBHxsyQAxYuTJNwn/?=
 =?iso-8859-1?Q?+bNnwSKStyE6eTxR5Yd2UJksgS7rnKpfYAvmHm55H5n+oKKE5J74n5uD9b?=
 =?iso-8859-1?Q?HLe0zdyRxZ3gZIwll6vV+R1DpSxf6PI7pWa8UOBY0G0tL2ZiGuGh6NDlrq?=
 =?iso-8859-1?Q?hmEReFIufjb4PzfH1RqpwAOvvOyLqLGR+G+tFCxHX7NGHWtL+nD3oRRfzu?=
 =?iso-8859-1?Q?fgRFy5KBWXahFuGs8HnFEkNd5sQ/VRPNtaWGdyKyiIptcSN6t8sW4EAxh+?=
 =?iso-8859-1?Q?J0qzBmKr45l0RarPL6YWZC6rT0vQDqIAn4q7E2sYEPzB+MosBGWABJSzdB?=
 =?iso-8859-1?Q?wPQ2U9U7WXbSmG5OE3Kkq75ENLL4lmRHUOGANhtIUOaaFCJ3u8WYYawfTH?=
 =?iso-8859-1?Q?C0snjEV4/2TalPtm0dQqlHTci9i/ONzHBbEBOVLeiQfsZNGJ51oW6eDEeX?=
 =?iso-8859-1?Q?JZEYicXGBv6DetNYAv1CevTyPa3v7ZfV6N+4Z8fTjKqTwZFsHgSAD8hNps?=
 =?iso-8859-1?Q?Lr57edhpzNKXdos8NOgXsG8gl2BTj8KdolXitQmS5St6hWhZ3xp1iAQLfd?=
 =?iso-8859-1?Q?vhAx+QeLUUnW89oqvvU71Db2W27nl2jJ/TeH4i6bL/0hlJTAq0oAYerW9j?=
 =?iso-8859-1?Q?/OHLvUpCl9DMfl0ck8fbJfH1aBHM5QN1IJtMSFYtxjplIo+jDXS0odxZOW?=
 =?iso-8859-1?Q?gg22UbZ8FWstjTWfkrK2cBttq2hVlFEpCacJq4OhJIAv2Dbdv/B5sd1G4d?=
 =?iso-8859-1?Q?hYukwqaUk0jzO5sCrtGXEWBy3mF8MN0nKoMRb8WsDk4mNptZqfxJtoFzAO?=
 =?iso-8859-1?Q?Y7ohF00fh4rCR88EhIVWosBkJqRyuh+QDB8ybw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ahN0x5sRiWgXquYFvg/Uux5XvTY1hRjJp201z6ihXpNAhykD6QIgqbpiHg?=
 =?iso-8859-1?Q?oaoz2/DDrWO1mXuIKnqqjutX6zKvSbvJ1LuAgn4UcETvJ2c0B8BR+9DKo3?=
 =?iso-8859-1?Q?Vrp/ScyWS/XQY5Jy+jwqF05suH/0O4+20An2YDBhjGCuSnC4rm8998j/N4?=
 =?iso-8859-1?Q?QugRpu5CzGW/CkJPg5k9eumVvIZDnbxPFaUtBUjTS2dBH3c3AQbL80ijVu?=
 =?iso-8859-1?Q?AnHYKbUM0RZH9A2L2DqzWrmBpp5wew9OnvTESGBx+Hb0detvqpEtN9xJz6?=
 =?iso-8859-1?Q?o6Jx/QQtJ8RnkVTBeBhkDxX1GdoW8qx7S6V9PvTZ8+6LBcVb7Wo1Zxa4u4?=
 =?iso-8859-1?Q?mbw27gP+X5TKFDqJFkfP40FYsc8YOkyIllgB5dXrse5bqul8qR5LYeahOF?=
 =?iso-8859-1?Q?bC2FEJFrWEorwUACA+70M7oBakwNdDlqbyyHWJlqROu+GGxPMbRZ7lXbpq?=
 =?iso-8859-1?Q?n5wvRe0UiC95jfMFmzyYeOqr5Gvf4Pb8lHMKQLcOT2Bfaq6XTn6egjRCZi?=
 =?iso-8859-1?Q?fstpOoO0dOBI359g8SKSNF4Ot7cv5Rr+XUqg3L2Yy8+LrwU8Moa+U4gE+s?=
 =?iso-8859-1?Q?byyZ+5JUlFiMhtmYDiDisbJBKvGsbsQkq/+cd9SpWVyBfC2ryfWhgANsoT?=
 =?iso-8859-1?Q?RBCGFoGYmYmVLOPqjnOHNb77hklOgqBPSMbkPt2IP05BZOs3rmz8aQuz3I?=
 =?iso-8859-1?Q?V9YJ39EMfD7XfWqtwnzWScRu9Yq0ILTbp+a57FvUUBkDNfKWYHJc8q32m2?=
 =?iso-8859-1?Q?wfMQTpM+e8Uo8KmFar3zQ+HXqF5IvXXAevlTJYyCV0ZJALXoI31zHZ1wgo?=
 =?iso-8859-1?Q?v+H0Na2DrHJV3x14Ugue8eGgrKAIyVVRy7uvgsQIi47lZ7dTeUP8dTGrI4?=
 =?iso-8859-1?Q?xiA5nrlJ5bSmxHQMgN6jIjD/gSseBv1mrc5rV2tZ3TSUfnmvMlsG6Bo7jB?=
 =?iso-8859-1?Q?MqgZejokS1J2S2ovhk3onE99lVhbeNODsfCYCpKdfSvgz3cH3AY+HcEDdK?=
 =?iso-8859-1?Q?UpxnlKa6YcApOfyt+o2MySGBld6Nsmf2fAMZP2Q0iAdJJUnKKXU82pFtgm?=
 =?iso-8859-1?Q?5k1ukVn0UofqaOinWaFF02hadtEix53FaDl31e2WygZ1tmcnz1pZ8oGZ9v?=
 =?iso-8859-1?Q?3SBUnLjUaesaGtIQMvtz1oQa65bO/n3H0IlbeNtOsKHAoQzaLYqfvzPToE?=
 =?iso-8859-1?Q?YXqIi3hia+F0HXOXIEpNs0Oi5KzTFV0lMp5pyGmmWQvdWFJUxrGMk/MUl+?=
 =?iso-8859-1?Q?cd17uGQiOKtQmuKb0lqOJzVTWcJp0aKSBLYoonLcVHpi1gIOqrDtQYq52j?=
 =?iso-8859-1?Q?jhKWFU4yynTb4k/4Ejcoi71QQ790uDcA5b6RePGu8DnV521dczKxpNs+d3?=
 =?iso-8859-1?Q?0X/ISmJ7wXVQ7BiM++5g7FsYioLFCBtY5EjWgT2cutsv9w5a0NOPabpraH?=
 =?iso-8859-1?Q?Oeileok+bVVyzs+MJYYTJDJOaemxUVVtbueTT1hLwzjzrjDHyCb5idCdNe?=
 =?iso-8859-1?Q?1SjQxfPlraWra1cFCmHqdjEyow6omibZ0MrJtShOt5ic5+bpyoSzHZKsTK?=
 =?iso-8859-1?Q?SBASGK6eRtIvnVuJPo1fInHRdiqpoTu0H+ni//NM/HX7y1xNdpZLySAJbH?=
 =?iso-8859-1?Q?sBy2Y4Ldtyi34ERtlJGx4S6FaNXXKoxe4kr937aaaSPKQl6uLZVlk6Vw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90536e17-6912-44b7-3ddc-08dd4c79d449
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 22:00:26.7413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FTq0l+sjbhS/516sSNbS2kTV9n7okKmNaFX3u6CUKLegLuanCj/AfUSvNzpl9FWK21PSBam73xLdwz5CRDsNC2T3dMzY/veAb8fBA08qVko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7069

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

