Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6D9CA1D09
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 23:25:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177154.1501540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQvHB-0000Ya-1x; Wed, 03 Dec 2025 22:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177154.1501540; Wed, 03 Dec 2025 22:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQvHA-0000WJ-VS; Wed, 03 Dec 2025 22:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1177154;
 Wed, 03 Dec 2025 22:24:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Ymo=6J=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vQvH8-0000WD-VE
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 22:24:43 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc39d759-d096-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 23:24:41 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by GV1PR03MB10606.eurprd03.prod.outlook.com (2603:10a6:150:20b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 22:24:37 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 22:24:37 +0000
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
X-Inumbo-ID: dc39d759-d096-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvrhbRmi8BUoz1kZo+v9ojTrgh/0P2GvmZ2KNuF1xqMczteUe1403mupyrNb2I785T52+L4uYhbIZhfK8GGG5uS3b3tBimel838Uvp2wXRp/apeZzBr3ZWNPcivRcnKk+TDAPxAHrNDofW4OfLWLGZ/NQp0lDho1IUavKCXgzgeXKl9f6if4co6+yMIiswdjS4hz8kt5+ReytbMc0T8F9Gk3IsDy07RYFx5cJo0pFWstvrvFnWVCNc95Wu4zYl/RW/jtalk03kmeWBiOZYW0P1x8z6LZnYoxIeU80YaHRc0iJ3i1HsA+9wN27+I/Ke7gwkKDQlCVaDOZBL9So2muYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPtGcHBEXFQVmoPyWWG8r+gWneBTvEfW3Fjt1tGU0Ws=;
 b=XoJZ8uoT6ddshkID9euPlo+EA62KrrAKOBUhWFCduplTSjvS1+852ckihDkg/g81gz0kjtiZ0YjeLxQ0QP5e3+ybw/Csiek60rU3LTv1UuVJREwoznQkY/145V5DsV+xZSk3br3BguszzhjkhsP43Qo73ip+Cz8IRgVXvUhDFEMOiBSfPBdfQueQTW8aP6HldB1BL2DUyi7Wb3QP0nTp7N/0uRcoTmKbFd6jJAD3RaZJxYIaoqiSYr2OA9V/3ZidvW/Y771lg0rXmKLg5cvy3ygXWFLjQpdX6Quz1z2zAcdr0oIeZDl4IDVAO6UqDlSFlrdXnsX6XkoWGBCHdJ6zeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPtGcHBEXFQVmoPyWWG8r+gWneBTvEfW3Fjt1tGU0Ws=;
 b=GldP2znvorlN+AsaBly4cRoomCwPpQZoARbv5oYZefWJwAtrOtdKtuxYsxxupM7surB+b5AapOfHiPZzrKTEy4A5RY8dy5J0z/lwFbgUPLZE/+xxgGosraZth4A8DHgYhs0B5MSFG5TjhKmxGtfqJmPhspkk1WB631LZLj240zcMWviht5EmsIsrv/UNBzG2PJ+UyskZqsbejOUySfKMhbum2TsHtFO8Llm9BeuyaEnOcKsqlTlijE64rQo0DBt4o5UTDkKRaWQxeKlPMm5e22O2f6KMe9tSL1D74BgrSiMmwhJX640eC6fEh3gHJZk7qpRkaQEyyaZcNWruxtoKTw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jason Andryuk <jason.andryuk@amd.com>, Victor
 Lira <victorm.lira@amd.com>
Subject: [XEN][PATCH] coverage: add extended coverage capabilities
Thread-Topic: [XEN][PATCH] coverage: add extended coverage capabilities
Thread-Index: AQHcZKObyWzDLx/m00qdJ3PE7ZDmIg==
Date: Wed, 3 Dec 2025 22:24:37 +0000
Message-ID: <20251203222436.660044-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|GV1PR03MB10606:EE_
x-ms-office365-filtering-correlation-id: 0582e1fa-738e-436a-0c1f-08de32babe76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3vn12UxetgzKw22yIJOq0cPhimBqKdbSCG6y5KTEKehBGZJ8HWEchzmx4w?=
 =?iso-8859-1?Q?lfHmxD8MODPKmNLSx4KVTN0J5RWyoYxPEk4LfpveRCdrF5EDJJFRZ2S88s?=
 =?iso-8859-1?Q?WrKtJxz7ZMsuc3iDgDfRT9D7iPY7LFQnpt1PFuW0NIKdKo66Ouf2LY1BYa?=
 =?iso-8859-1?Q?aAz5m7Rfk6guqUwpRNuvOmKUbt+i8T4y9qRIsvy3sH1lPCbZtypl9qsZG+?=
 =?iso-8859-1?Q?H18agnlZj5n9HVPr3eVRDvVZbtXXZbCOZM+PP5oOtKrngs4GL6aYu+T+42?=
 =?iso-8859-1?Q?/F48MgCbIkkA+8UNHZ74WFm7Cc+JLiKaDDPHIvrg2Z6tSHp1WWegDm9Pm1?=
 =?iso-8859-1?Q?TO7/V2Hm2ABcgOR9+T4/cHtSCdl9BQ3xMuRRtqxf0hC80yLadHrArlQ3GR?=
 =?iso-8859-1?Q?ZPgMHSOvBXZex5UUv0haGECKIum0Ji4VDHb6B7lPc/+WOuzdS5oREOLgo6?=
 =?iso-8859-1?Q?rubDt3rB+Muna4BBlXDars1BJln1UQD+A7jtX9JuLfa7ziS+8TIQ7JijAg?=
 =?iso-8859-1?Q?sd0tKj6EKkIXh7HR/KJa+u9HHWuZMW+7y83gNV+6vwDvA8qOn7nQIyOLUH?=
 =?iso-8859-1?Q?yJndaIgKwawrTcXU45pGsZZPyKMMVGE8FDGAXgf+mWydx0dpPh/rBGhTeT?=
 =?iso-8859-1?Q?XI+/ZOncUvmUpO8/EeO/GqA5D30/vN81O1YS15TgWqBTlTjTt+sWToqw6g?=
 =?iso-8859-1?Q?PPHph4eVMntIewfeyHEwLHQc/hPymNzvI2LGDDKd+rD1dmWGo2jo9bVj1+?=
 =?iso-8859-1?Q?FaalavBHfzMeuxklrN7TnRrp/lM/YVw9flZgjgYcjmrCPwDYJwUFNTg87Z?=
 =?iso-8859-1?Q?bXYWPyQMsLLQr0cUXstaZsnuWVutV0iKXQaKU5pMkQ+Ec6DCZVzPFjsYcA?=
 =?iso-8859-1?Q?FLwhyQlnLo8/wJA60jh3qRAwA5duNQ9dCUNSBizhCqXlaSD8Yrvh+pCwGP?=
 =?iso-8859-1?Q?cyDzssePXDDd4F84Obh6cEfH2q9Gqcj3VWpd8XaAVa3eDOZyRKFVRd7C2/?=
 =?iso-8859-1?Q?IUraPEnV6M3MEMunzgvalITegKjCthQPi4i3pVObdko7GWFc3LfTYx4X3f?=
 =?iso-8859-1?Q?24MBHjwiBymrTXAkkF9zGwEd63r12ItX+wA8/Izh13XzkxK/WyFiH+8/X7?=
 =?iso-8859-1?Q?eG4BV6xO3jCPOVixDQV2fzHy4SV099UwTBvV0HM2Yzqar0FlQHlBdZ8ash?=
 =?iso-8859-1?Q?ncdP7Z59A7O0LNdQOCuvjt8ZyfXy+oOZvRF/S8SE167eC0oNbYcBQ3XMbx?=
 =?iso-8859-1?Q?B12zCSXenkpzLPqUFmqsiXN8FFmR97ZHP7dGLZxBVWfROxkwDFSOmBeL3R?=
 =?iso-8859-1?Q?dIv94MUrPCwhrKldIm3nCBWIDNroqdRDcQk7ca1FtySLBTUhzGebdSVSeP?=
 =?iso-8859-1?Q?yzV63AgkY9uGeGQM001pal31VA6TJwkHla7yQTSwhpFmqGBWPcQNDr1S1l?=
 =?iso-8859-1?Q?XEJMWaCiEDpdle9T4KGTgwd4UXIC6G5mwUeRnw/WVGbG1zv6VlfOtkcoBf?=
 =?iso-8859-1?Q?NE9MUXSq2IjE1S7HBbmo2RfVgR0qzZZXkpFyCMsaDhQ68a89cjd+NUYhtK?=
 =?iso-8859-1?Q?Cy7wjyrrH68wRkH48OMIFSMihQqb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?f7L8dtTDLienWA9ceCJn8WkKCaAPV2MkBZ64AZ3OHmB1bCEZ2yVOBebWaT?=
 =?iso-8859-1?Q?ae/w5F9leZWHg3H7ZdposAvepEktdo6kbrbmtwKNGSjQxuDK3LalA7Ffm2?=
 =?iso-8859-1?Q?aiUb9UkOv2AMW/Jn8Wnm6w7a12dcPj1qMLusYfe8zvzrN3bD096ctTLCnv?=
 =?iso-8859-1?Q?7ZaJKZrHlyILfaDabIQbxJG9G7d3HJ+R04ehbH0/oZrwS158t3y/CBemhU?=
 =?iso-8859-1?Q?1eDq2dhNjo/6n9KdZxogv5OqI50KzpDaJnB8ahe7aDbhJ4ydNMm8luOYo/?=
 =?iso-8859-1?Q?I28yCZI8Z6dqi2gbTM94vmpeDb2MqI5/WzKV5zk9R7pqrRTro07KCi9GjQ?=
 =?iso-8859-1?Q?2WaHhbFG+s8uy6I7T6ZtPguKXDKxVuJ/3Afcii7SGrSb/IfVsEbDTbokM8?=
 =?iso-8859-1?Q?0QJhYZ+FKR6RsyVtFoxTdUobmMV0zzP8+DBupq+D9fapsCHqnMtTsjVejT?=
 =?iso-8859-1?Q?aFjI6wMlQdiY7nM4W8uL2F6EXpdtf+qD12aQctAsTydZbQn1NwJ1pARFbx?=
 =?iso-8859-1?Q?TkNMbW83sTC72AToP4y19gvZ/GAPHO8HtPR153XE/pnaWsO2s5MW5VMKMu?=
 =?iso-8859-1?Q?g+WBr3wBsP+w8feKy6de6p2tXhjEZZebVUbrhjDmvE3gjodeP3l1nsUGD0?=
 =?iso-8859-1?Q?vtK/ycKNWYg1N3MTfTZyXGfWICOv4eSBhRd3nRteMgd7mM4JQbSSJRWOIc?=
 =?iso-8859-1?Q?r+qZmwsJrg/HRyxlDriuga1fBH8YGNzFp2+bkpygiwdcfDVoyU//S/FB/Z?=
 =?iso-8859-1?Q?pdpKXpaAN3cSUtLx4yEgDdtbn8V7Gf13C8lDaLpTn4YYqM8lJdkMIgFxzp?=
 =?iso-8859-1?Q?gr7xZbqNawo9gbeSOFGrCNrnazQWmYX4R2gETbhqJircED/tuXZ/hrdWdz?=
 =?iso-8859-1?Q?odVKa6K2lq8X92sZ7FOTKlaT9Yjts56sbkzmGLbrApHDPiRVHMkWPZ9Kko?=
 =?iso-8859-1?Q?Js+PX/5Po46FfkrnM3v6/ccqc5Xn5vQ7lHAfCkxGNAv5ueASofHQVqxg4z?=
 =?iso-8859-1?Q?VpsV/ujKnjJ+9lV5pqarGGTBQiXx2ew63VVDyEk3aiPCIsh39IdOUcvSU0?=
 =?iso-8859-1?Q?mC3hiYHp9cr7l4CGJ9oC66yZ6svri7QfDt1dwa6wZ79qEqu8+QhxhGD7cB?=
 =?iso-8859-1?Q?eM8uMdTw2EiFRqlhAEIQcvv0qXoQUiR+NJL8l3UNGCt2j0UOt1M5TLxrJS?=
 =?iso-8859-1?Q?aax52j2p3IRz8oe5TPF41XGO82kg1/vpQq3TzbQLj25cwdaZYdbm2gZMWI?=
 =?iso-8859-1?Q?1BSwFOVf+etQW/qzRwImiIFyX1nrzVXuoOO4KRjc+drvy9Dis8T2qJGDwe?=
 =?iso-8859-1?Q?tjJAVmQTyIsFWXIPYhS1ZQ0Ly7AhcY8+tO6ncC3morjvkZoQZx143szpI6?=
 =?iso-8859-1?Q?DI7OFTLg2eNZpXFt952uFM/PuvLVC2TlzkcVT4IWEDG+i3cVYYHc5UqcxW?=
 =?iso-8859-1?Q?HD70Gwg5bLcgqE27/D8avhlWgiyipx9S6CyvGHK8QsIKr+Adzy812Kp7K6?=
 =?iso-8859-1?Q?O2SO4l+zUSA7FuJIySUJsy6YjqCefjqerJHP2Nfr8SQaLIqcTTCsrxTyxm?=
 =?iso-8859-1?Q?ITX7/SZtdew4bG5UixanckY0ozq14hruY9s8zFjBXVacgQq0AcxUkUazqZ?=
 =?iso-8859-1?Q?RC60RVd8JhhJtVIBcs7Vq/Ob3ujww5tSHUT8zn+wsIYpSj/qrxd3ZYuw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0582e1fa-738e-436a-0c1f-08de32babe76
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 22:24:37.2698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ov1uSgA8q27e5A6iVFYKkZoPC0EFBizltqThuiB4Y7fiTrPs5PwiBvxoTzgAIOSKYZ8Mkht1pwEiLhk6rxelH1fo2BiL5/eoGBV+l1ZOTX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10606

From: Grygorii Strashko <grygorii_strashko@epam.com>

Added CONFIG_COVERAGE_EXTENDED to enable coverage for .init and lib code.
When enabled - Xen .init data will not be freed.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/Kconfig.debug          | 10 ++++++++++
 xen/Rules.mk               | 13 +++++++++++++
 xen/arch/arm/setup.c       |  2 ++
 xen/arch/x86/setup.c       |  4 ++++
 xen/common/libelf/Makefile |  4 +++-
 xen/common/libfdt/Makefile |  4 +++-
 6 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d900d926c555..3e04e1a3992b 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -44,6 +44,16 @@ config COVERAGE
=20
 	  If unsure, say N here.
=20
+config COVERAGE_EXTENDED
+    bool "Extended Code coverage support"
+    depends on COVERAGE
+    default y
+    help
+      Enable Extended code coverage support which include .init and libs c=
ode.
+      The .init sections are not freed in this case.
+
+      If unsure, say N here.
+
 config CONDITION_COVERAGE
 	bool "Condition coverage support"
 	depends on COVERAGE && CC_HAS_MCDC
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 2b28d1ac3c18..6d66a2332fb0 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -145,11 +145,18 @@ endif
 # Ensure that profile/coverage data is updated atomically
 $(call cc-option-add,cov-cflags-$(CONFIG_COVERAGE),CC,-fprofile-update=3Da=
tomic)
=20
+ifeq ($(CONFIG_COVERAGE_EXTENDED),y)
+$(nocov-y) $(extra-y): \
+    cov-cflags-y :=3D
+
+$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y): _c_flags +=3D $(cov-cflags-y)
+else
 # Reset cov-cflags-y in cases where an objects has another one as prerequi=
site
 $(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
     cov-cflags-y :=3D
=20
 $(non-init-objects): _c_flags +=3D $(cov-cflags-y)
+endif
=20
 ifeq ($(CONFIG_UBSAN),y)
 # Any -fno-sanitize=3D options need to come after any -fsanitize=3D option=
s
@@ -260,6 +267,7 @@ $(obj)/%.o: $(src)/%.S FORCE
=20
=20
 quiet_cmd_obj_init_o =3D INIT_O  $@
+ifneq ($(CONFIG_COVERAGE_EXTENDED),y)
 define cmd_obj_init_o
     $(OBJDUMP) -h $< | while read idx name sz rest; do \
         case "$$name" in \
@@ -272,6 +280,11 @@ define cmd_obj_init_o
     done || exit $$?; \
     $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=
=3D.init.$(s)) $< $@
 endef
+else
+define cmd_obj_init_o
+    $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=
=3D.init.$(s)) $< $@
+endef
+endif
=20
 $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): $(obj)/%.init.o: $(ob=
j)/%.o FORCE
 	$(call if_changed,obj_init_o)
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7ad870e382c2..900585eb7099 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -68,10 +68,12 @@ static __used void noreturn init_done(void)
 {
     int rc;
=20
+#if !defined(CONFIG_COVERAGE_EXTENDED)
     /* Must be done past setting system_state. */
     unregister_init_virtual_region();
=20
     free_init_memory();
+#endif
=20
     /*
      * We have finished booting. Mark the section .data.ro_after_init
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 872a8c63f94a..05810fa67787 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -845,6 +845,7 @@ static void noreturn init_done(void)
=20
     domain_unpause_by_systemcontroller(dom0);
=20
+#if !defined(CONFIG_COVERAGE_EXTENDED)
     /* MUST be done prior to removing .init data. */
     unregister_init_virtual_region();
=20
@@ -867,6 +868,9 @@ static void noreturn init_done(void)
     destroy_xen_mappings(start, end);
     init_xenheap_pages(__pa(start), __pa(end));
     printk("Freed %lukB init memory\n", (end - start) >> 10);
+#else
+    (void) end, (void) start, (void)va;
+#endif
=20
     /* Mark .rodata/ro_after_init as RO.  Maybe reform the superpage. */
     modify_xen_mappings((unsigned long)&__2M_rodata_start,
diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
index 917d12b006f7..337a3a8e1b35 100644
--- a/xen/common/libelf/Makefile
+++ b/xen/common/libelf/Makefile
@@ -1,5 +1,7 @@
 obj-bin-y :=3D libelf.o
-nocov-y +=3D libelf.o
+ifneq ($(CONFIG_COVERAGE_EXTENDED),y)
+	nocov-y +=3D libelf.o
+endif
 libelf-objs :=3D libelf-tools.o libelf-loader.o libelf-dominfo.o
=20
 SECTIONS :=3D text data $(SPECIAL_DATA_SECTIONS)
diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 6ce679f98f47..8c62563ccdbc 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -5,7 +5,9 @@ SECTIONS :=3D text data $(SPECIAL_DATA_SECTIONS)
 # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during run=
time.
 ifneq ($(CONFIG_OVERLAY_DTB),y)
 OBJCOPYFLAGS :=3D $(foreach s,$(SECTIONS),--rename-section .$(s)=3D.init.$=
(s))
-nocov-y +=3D libfdt.o
+ifneq ($(CONFIG_COVERAGE_EXTENDED),y)
+	nocov-y +=3D libfdt.o
+endif
 endif
=20
 obj-y +=3D libfdt.o
--=20
2.34.1

