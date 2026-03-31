Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uInZAvsoy2n8EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31DF363337
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268255.1557655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHH-0003Ny-DG; Tue, 31 Mar 2026 01:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268255.1557655; Tue, 31 Mar 2026 01:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHG-0002tW-6s; Tue, 31 Mar 2026 01:52:22 +0000
Received: by outflank-mailman (input) for mailman id 1268255;
 Tue, 31 Mar 2026 01:52:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OHB-0002Ae-0K
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OHA-00Cy7w-BP
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:16 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28a5-bab6-0a2a0a5309dd-0a2a4507d1a6-24
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:16 +0200
Received: from [52.101.65.103]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28cf-fd74-0a2a45070019-3465416768bc-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:16 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:14 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:13 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLieqmKsNjs/eto8Klfg31n31NUajU1jOfMddziYiCUbYppEgu76tRTJNKTN2b6xg85kWId6IL3YYkraoU6eyQ2sducOyideKmkaEvrq18lZ4UC9JPxKrz9Z7dx5mQofAy2kwkcnEYD25yLS/BqeMluqU7sL61pKKDwle2mlmg1oaAValWo80l5ltDcELvYqc1Izjpl7TIJ1FwMzUWufzd3I6T6fOIk3n8sjoQjbIQBImgGvdSb0d3BwHkQasVnuNcMsdN4NLomFZ+k9HgaqyJXNhhFKy7yGCwybWhkwW0ca9eFmrPT5wrXqZtVdYMX75saJ6AaNrlYgGZ4AbOG2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lj+Sg5LBkxi+H913KrrxXSn48z00gNy3tUlieV05i7o=;
 b=s6Yk8LggsmyxaHFNXeBnmYR2YmLr6nkdq79KY7jEdumisY3zL/PQXq0xQjBsMDYviRoZyuqNta3LShgeZXuL9DK8FLFl6jw/B1Ps9JgyJhSXruMbvfyN1FEUN2NETHeKsOl9gvJtIa19IYNH6fW/HT/wtCoJ5/NyyT54ISe0w9l8D59+ng2Ypvt8wIVYfCWa6vhhO5iSb3uJWw8j7sJ8Iejp5swkCyyQ2kpD+SU7xhnkX5qF51LcuO413TpnOCzPLgyYIljEei+/h8Pd75HNWEzzQoyaHckR2GR95UpWtKJEa7E9gM+Av8d+EkiTNmEwlv3SONuxT8npLLJ5gP6Igg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lj+Sg5LBkxi+H913KrrxXSn48z00gNy3tUlieV05i7o=;
 b=rZ3WCSx7wV1rnlZAjuz4w5yBfpIXOPq3GBPJKFB09HlUgZJZ+zFGtoA5Q1a2S0CB8/cjLkD5iNxhWw1h1zPrgo1eYhykjHMrdsC7FGC5HdpljdVNMEGXtNRl47JjqvhQTG8ni2FK537po9KEb+Gp7S5uHLyED72WkoNzkkt0RGhz4Bd90dag3UZyVBsCCGw0cSV8Xj6d8+xWAx9lJtM/40iqapSl/vRty10Q5GiE2RsiQyDjUVCnENJ8H3yw7jb3SmneKodrdPTGrRcpiiSgEl04nLnHeZL08WIK/4bD6JdqXAthutCRlctulFxZKfdyU/tr3/8I8xIBoMrxWsXozQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v3 16/23] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree node
 in libxl
Thread-Topic: [PATCH v3 16/23] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree
 node in libxl
Thread-Index: AQHcwLD+lzo9LgbX1UGwfRiRzfrENQ==
Date: Tue, 31 Mar 2026 01:52:13 +0000
Message-ID:
 <58c7eb798749c8c78935f5a8fc9e0aeff81760bb.1774918270.git.milan_djokic@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|GVXPR03MB11035:EE_
x-ms-office365-filtering-correlation-id: 96c066e4-3f3c-406f-a00f-08de8ec8217b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 rooekgsfGi+6/hTMqXI3v7yR8PQPe3x3rquohJcgbGpopptFds+kEcYi2RVdUfvsCB2E1MwVyMA/6Px3x3aKoVougCg/DjkuwHkGxl3SsDY0/2OuE/ozfnA219++GPyDKvvN4MJZi+vX0HB0kQS1d4gKo4AttivBIwmAUVt3+kIrYA8jfWvGumKdKzzic7TGCTghgTDLltykieBAkLaOQ8WHTAtPf/z5SgbIy5lHm7SPV+67/mX+QBIZMEK4gb/kh+xThWv/H9/aJZS36Gpsy84oN61hpP82zJTkndgOLysYVz65whnFdybiOzCQDAN2aHwhrTAfn9y97tFKC9LfI4s2JZFV7t1eKvi3ypEvqwKHIzeXQ2fasqiBNtFGA1yC1ammhqOBkY7aiHLAcHADiVF/N20iWD1x28/J2BTePm0OtGNqXyANANGI2J7ZbK4KJJaEhKuUdTKng6xqlwlwsEh9srJsGns/r5/6nkN2tA0FAysBCbtP8x/juvloUOBYEb3NSSigyMuzuZXBjam9fSZdI84eEBE4XKOy2fkAV+eTBm7TK66aEMaIbJP8Ld+ih5ISr7DdtReZ0j0UPDOxXS183IP8ABdOmwyNdAtrAH3A6V0f0GZ1RE0GiA271VCAhxfyAw/4ONTd5hiOg8ITf+JrVuPyGWfwcMl4WJJfXpani8m7Q5ljN0AJT/sFzbaxnWCiponsAmsYnNOtiYlHnS+w9eJJ1ug1ovcqz3GTAMeAN6/GbpXIgEyHrVtgpgAYRAUz3ayy3r/TGLvnGYwSWXgsbauE9DxwZVuSgzVlF8c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1jRpQicjhFRzUzMObvBfqBRSjKdqTORfkNjqOxTuWJFZkCsd0f5G/6OjVi?=
 =?iso-8859-1?Q?I0lILsG//2N7QKJ6z+V8tdSc+Z40ZQfzHt8agu3dXEKcw/xPvTmVR3gLB0?=
 =?iso-8859-1?Q?nSyZTFI67RBrAqcodxyVGhNcemcx3HBhPMR+nxWwCPmwc53BKg0vI/06QM?=
 =?iso-8859-1?Q?t0Vn5C5QAd1lXzzgQDLKunJz0ynE3VygEP1M4xoS6n1KzWjDMClVlbFA7y?=
 =?iso-8859-1?Q?nsb151PNemt/CQlYb94uPfZeL7PBDqBStgR1KZtT4WejWgMnFGkYe6cucg?=
 =?iso-8859-1?Q?zVZjXTjnqFn0j1LHClPzLkt/zxP0vmIm70Vy/6xNs8CT6v++NUZMAACV0w?=
 =?iso-8859-1?Q?LySsJfrcqv0oT9Cmfkg/jROYKZMnSG6mQ7FZFKLossnDegxmL0u5YlGQT3?=
 =?iso-8859-1?Q?ciHQE/yY6TMxw/3uSwFz49itNdqNTOW0S/1BxTPA9FLVz+Z41AXB2nJzfj?=
 =?iso-8859-1?Q?BR4prqB7W8jZg1khy/dGXRkib+/BJLjyd34wN+wwYfkdqKSBmsKawpqEV8?=
 =?iso-8859-1?Q?8ovPSnbrp38ZjRvshEyTp2Ghc3mAvkf9sYfUsQc2qoPI2IvVXLWaOFufUm?=
 =?iso-8859-1?Q?y4spFCTk/glNGmw6lwyg/OsCbF3rN8GtUZ+pnBeX2K5m8xEHmYZ76Bur8q?=
 =?iso-8859-1?Q?0WG8TO8B33UaK58jbYTUH0obMXcu06Fup66pEP6gOujWPKFzQBlt0DcnBO?=
 =?iso-8859-1?Q?uxzKaH5snC9e41Qqr5ClEVolvK7KuWZIr2/u9nMRYYhHk45jYBKoXKPIqk?=
 =?iso-8859-1?Q?pxX1oPnRfnPoOgABpYnyMqRm/yBDeRxMM3ZSMzqIH8Up7UZCAZhiyEVeZs?=
 =?iso-8859-1?Q?ojRa+4S8g0RO7LwPgpmIbO7QsPg7dAyFoVXVClpBQcde2Hjp/HwOjxin5c?=
 =?iso-8859-1?Q?1VoAQCQ3iSxaNri1A5wfDM33DBKJ7YxYJCmouVSYaIIvpl8u+BvQL195Jo?=
 =?iso-8859-1?Q?hvSg3NHgCrhBF3cUN22I7HtaUnqfSq+Rws1LDfV8X9IQIFLXvuUwbkrII7?=
 =?iso-8859-1?Q?yOj56eMwxx/VApgWvzRxZ+zv4YltKeLXmVbzmQh8yq+OVQlFAvr6ROv7Dg?=
 =?iso-8859-1?Q?xQCnGf8ruBRMQ64daol4b3C17RMqbeJOhG0OpQ+2ODF45IY6m2nheXRcBa?=
 =?iso-8859-1?Q?4Kt4qYlRNohEg6a2ZXakWGo/4/Rw2UWXV5iiJvKPJ5DdCBtP/D0UI7Z/ZL?=
 =?iso-8859-1?Q?hsL+rXz26xtNFRXEEDigYyN5D8O+wC3NJQrcCoUvuzQPhIyujLGoUXAdZY?=
 =?iso-8859-1?Q?YJreIhLWvN1s7Fjcz8gk1Axafv9TxTKwk9MBfMJ88UQgiJ3HRtGJ+fNqDW?=
 =?iso-8859-1?Q?z8TnyhOYgclmNN4KfYrbDaufOCxJ28RHlpvQI42QOdy+AhHqGiTpdRCeVa?=
 =?iso-8859-1?Q?pq8teVLH3/udApY7Q5RB6/0o1jiJq9yb5eoTIWY4R1KWT8ZrBzkeC191XC?=
 =?iso-8859-1?Q?F1rcxK2ywhz2ntfWnyv6Ysqccjwz3B5VzrXxz2mkHGeiizinaf+meOMj9A?=
 =?iso-8859-1?Q?hNH0tMaEwtCTIpQZzwblQAOmEVYem1Q2m8ooj/PAlO0seV6TthutPO5iwj?=
 =?iso-8859-1?Q?43epg/Jgs/SOeiY7i/CMEzANRTdYk8+BYd+zhPrENt+t+yKDQqtzFPpGG9?=
 =?iso-8859-1?Q?fPSY6Evj/sKZpy9h8pnG0Q597F87XxLG4fpASFtHBUZSioHciaKbaSE96x?=
 =?iso-8859-1?Q?2c6jA+FX3CbPjifETTsUyGSZQDALqS4KUC9RggooNB6cVXLh9Cgrvd+k4x?=
 =?iso-8859-1?Q?s9sVnu/B3wo2/PR5JbvWaErrQorFbE2kJ60wrwj7hzxdBPy+3qmLWDh8zG?=
 =?iso-8859-1?Q?Ex5MELtnw6xv73Fk7FPkjMFtFyA7CXI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c066e4-3f3c-406f-a00f-08de8ec8217b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:13.9170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GNmDvxidI0AnikCQil+3ETDSQkh7QqfrnOrZ8ArBMEqvAq72K7lJBAfXacUWeRKeHf5oV/RSIuxG8Pu1MjlcMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-ef75cf/1774921936-5D185303-E0EC739E/0/0
X-purgate-type: clean
X-purgate-size: 2704
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B31DF363337
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

libxl will create an Emulated SMMUv3 device tree node in the device
tree to enable the guest OS to discover the virtual SMMUv3 during guest
boot.

Emulated SMMUv3 device tree node will only be created when
"viommu=3Dsmmuv3" is set in xl domain configuration.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/libs/light/libxl_arm.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index a248793588..eb879473f5 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -901,6 +901,36 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *=
fdt,
     return 0;
 }
=20
+static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
+                             const struct arch_info *ainfo,
+                             struct xc_dom_image *dom)
+{
+    int res;
+    const char *name =3D GCSPRINTF("iommu@%llx", GUEST_VSMMUV3_BASE);
+
+    res =3D fdt_begin_node(fdt, name);
+    if (res) return res;
+
+    res =3D fdt_property_compat(gc, fdt, 1, "arm,smmu-v3");
+    if (res) return res;
+
+    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+                            GUEST_ROOT_SIZE_CELLS, 1, GUEST_VSMMUV3_BASE,
+                            GUEST_VSMMUV3_SIZE);
+    if (res) return res;
+
+    res =3D fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_VSMMUV3);
+    if (res) return res;
+
+    res =3D fdt_property_cell(fdt, "#iommu-cells", 1);
+    if (res) return res;
+
+    res =3D fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 static int make_vpci_node(libxl__gc *gc, void *fdt,
                           const struct arch_info *ainfo,
                           struct xc_dom_image *dom)
@@ -942,6 +972,10 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
         GUEST_VPCI_PREFETCH_MEM_SIZE);
     if (res) return res;
=20
+    res =3D fdt_property_values(gc, fdt, "iommu-map", 4, 0,
+                              GUEST_PHANDLE_VSMMUV3, 0, 0x10000);
+    if (res) return res;
+
     res =3D fdt_end_node(fdt);
     if (res) return res;
=20
@@ -1408,6 +1442,9 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
=20
+        if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3)
+            FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
+
         for (i =3D 0; i < d_config->num_disks; i++) {
             libxl_device_disk *disk =3D &d_config->disks[i];
=20
--=20
2.43.0

