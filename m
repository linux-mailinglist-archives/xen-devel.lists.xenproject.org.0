Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC5B33A1D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 11:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092756.1448390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqT9Q-0006YQ-Db; Mon, 25 Aug 2025 09:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092756.1448390; Mon, 25 Aug 2025 09:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqT9Q-0006VK-9p; Mon, 25 Aug 2025 09:06:04 +0000
Received: by outflank-mailman (input) for mailman id 1092756;
 Mon, 25 Aug 2025 09:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bS3=3F=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqT9O-0006VE-RK
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 09:06:02 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5c579d1-8192-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 11:05:56 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GV1PR03MB10938.eurprd03.prod.outlook.com (2603:10a6:150:207::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 09:05:49 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 09:05:49 +0000
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
X-Inumbo-ID: b5c579d1-8192-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vm2klFRuAyEUMY1K8x+d21jqEF9cUyjYjpd95eiD3Sef/JG7TioliS2VT8XA1Q6DehBn4oU+z/9dCYpN2HN9Y1/iLbP3ceO0cZH52RaQMNu8TO+OfcTXZvdbXLDeUbwqbXA61Ug/HEw2zV2mNR/p639+ZpBHqcsF/Atgd6NW9S2NRhIrZHSP/BUFNDU702N2HnUipWdc3ZfmLHfW9yoo1vRxZJ01ziRtxBoYyqOYwYG0aTZjJaVovATev6JyLLDI1vTceFnmZKVjiRbtUgViq852BpJgjd0+WKnDVMXul23ZqP1PvAGfRj2cPGmBV5quypGQ6sn6PdGDgxKDqN9iPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p5vkLzBi6WoxV7ONWFQXqNZkOMCXQPRPXNJETtU7UQ=;
 b=zCe3m/sJGd9bFQeJRcwQfROZTknceQ5NvOQ/5O37DVp/y5er87UhDQBnFzMlIKteVbC7q02J7vQoh7QIi1prQIFG3z2cjwcWfn3SLLS/p4oKdCJmA6ChL/QeqiASNzye9sRduhU+a16/JNtM2ig7XJ6PibrR4D5L0PA4tTxZK0m1Rpllw8q1qlexviSM/KmsgCWIM432rAY5y76l1EbRBT7CTLCUOR/ABCQcWQjjpCFO4r7q7/ykPItP6ZAA3+94H1k6v7y80mI+XVcgfrFjt4QTjccLaZPHcuz+89ovCDRK533i/Xv0jeuF7e+1LGVrl7eWEU0DEQEcen3U/JzDKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p5vkLzBi6WoxV7ONWFQXqNZkOMCXQPRPXNJETtU7UQ=;
 b=EPG2BJWFzF8h9Ey4Uzz+fhRo19CEBGfQKmGDqezMQmasH9mh6vfphca7/diC8PAPZbljpkWWZILnolJSAOP8G05ZgEDiGat6gzYFLDdNOO8q2Jo+hhF/nKfppKgi9zF7We3ON7bt61j1jTGnanHCWSmBl1+lYihcad9upaeibHUrVXQ7Ftt5zbQkmBw6ge5QRCbElgByyNrRVcX6tiePQ5rD49Lw7P+uoUSeXuLfuva/bck1xTPvUweOryDWgvBYEyHyCq13tTym7Z7ZblgrvhybjLDw+/EG5in3e9eoZXekT+3WmLAwrtjpABbCPPqXvfAandcKf+RETPPgHPVCCg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH] misra: add deviation of Rule 17.7
Thread-Topic: [PATCH] misra: add deviation of Rule 17.7
Thread-Index: AQHcFZ9zsboRH18vd0iLUvum4pfwBQ==
Date: Mon, 25 Aug 2025 09:05:48 +0000
Message-ID:
 <ad15582787e675fadf92502f85041c3232749a99.1756112701.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GV1PR03MB10938:EE_
x-ms-office365-filtering-correlation-id: 9cd7e891-146a-48f5-b9e5-08dde3b695b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fQMgEk5FqDYivbOlCAwqU09II9y+fVgKmzBcH2YoCLk5LpkEK5BsQvzRz0?=
 =?iso-8859-1?Q?jcuYV6HYPhgfx8eVUkR0Bz6caUIi21KY5R6bpEqeAjLBDx3+H1MzZ7pyXP?=
 =?iso-8859-1?Q?XePIv3T3Qtrz116XWZgNRKc+Za3uQri7YD0C1JLcuFjepuEcTTV2TK6O8q?=
 =?iso-8859-1?Q?cuNWlZgcG/SR6y8XXLbX2t9/WWZVYIjJGg4C/6/A7ediJvRs280QgDnyTF?=
 =?iso-8859-1?Q?xMv+bt9BF1ty5A1nNqyUTwqJYcBDLpXX6kM4tacCNNElq/3aNG/bo8xDKN?=
 =?iso-8859-1?Q?ByNktdrLREeLauQTFKmuU2TjoW+accFh6Z4DBQohGvQnoZklueJmZGNPue?=
 =?iso-8859-1?Q?kw7suOQE/4gJEgFVfeswq61RjQdFLki1dNPZor4+IcWi9++er+bucpctWk?=
 =?iso-8859-1?Q?WflShrScHra8dDHDJ2eGTjRWpldQ29fnZOhKxj+v4WmdU3S6uBvHnImIkT?=
 =?iso-8859-1?Q?ZCjq6N8IXkmuKi7TB29INgd7wwR9FIs/jez5mM+VtVt0RYpSXJEu2r67XI?=
 =?iso-8859-1?Q?hvii+RgNUqlRi0IPt9yU/IKR+0S8LeQc6tmtkQO603ARxwpL0bZjI4um8K?=
 =?iso-8859-1?Q?rJ1gHBufQVuWmn2Pn6YZLNF5RmA8UHVGHmFL8MSXdzX8z3pT7KqqvaLdt0?=
 =?iso-8859-1?Q?zC3DzfJY5VJGxYlydOkzEoY17yUIdKKFgXyDSCpVJWidmnTG2EYyzTl46c?=
 =?iso-8859-1?Q?iXv4qHwzPrgZNy02UF/z5ST8S3x7CGmhrUGRimoI4V5IZBvKtUWi+rCV4Q?=
 =?iso-8859-1?Q?WX1aqo8vtAsVZqbZOcWZkHOrxpaWU56mSwgssBRhFB9szkxOVniYyDFE5u?=
 =?iso-8859-1?Q?C0ZXPgM6AnaQTb4ASfhhn3xlay0ivFqgqoprFB2LcBd7qlgMBmAmdv7p/T?=
 =?iso-8859-1?Q?HIWUPcJjGKzowkjZgOTO0nHXzbNfQTg9cTZ2WZpNSXs7nBBwbBiwt+j60O?=
 =?iso-8859-1?Q?X91d71RZnpG4390ZRWKeiKGf+y9EmoI74HQapvKpaV8vcaalB6QWfaxQFf?=
 =?iso-8859-1?Q?GoZArfwA1xa5hAmxQG06AzSF5cr/A3WgWO2OxbUWaOw6elx3s1SCeizzRP?=
 =?iso-8859-1?Q?vZSFXAezhEYv2tj0jN8z6m63+oPRcvu+V5vk8iU7ybDg+xDADViUizeXcW?=
 =?iso-8859-1?Q?YGMNxeKdkIvh9txmoMoqR3YxuQR0TLCMez+yc3Dbzh2Kmf0L93qg4lyYGT?=
 =?iso-8859-1?Q?LGmEk9OfIclRYbBoxecvAqi5uLOGt1UbPiMNnoXiMTH4tfOg7MsLPMp1DC?=
 =?iso-8859-1?Q?uu4w94bHUUwToUhXefMFsRjYtpA30zX+Nwn87oSZCgkvz6NLUv1w+RoXIm?=
 =?iso-8859-1?Q?ZSI71FmFajpEQseVxuYWUrrBTH3HAPZw/6BvmQ+kPYmuu2IEkfpxLmxG0y?=
 =?iso-8859-1?Q?rBIh/jtNiVTb76dWY7cLUCHnGKpb+OkroDqgn9oRTmOR5Zox1milKETxik?=
 =?iso-8859-1?Q?JVsb19CQjU65nxrcvGBt/NUegb7l0p5C/yfdb715R+GU6wGyz0msdNY4IZ?=
 =?iso-8859-1?Q?n9bS0BU7oMQDXxSuc0frjyRii7L/uUbMPxk1IxiWLg9A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+7zqaeXqj1hwRqme+Zs/qHGeYVYpLqrDGTZ3y0ZxcPYXDqKFeHWQfX2eOF?=
 =?iso-8859-1?Q?nq2TwSkUvKncjXgwKNI539U2U+RjhVDHT3ZeLj6j9yQ8QnBfq1UgpdUHiV?=
 =?iso-8859-1?Q?KpnXrCrlj8DYZY/w9L6a5vEyrsJ3oCici8PRmxE4vLkZMk94VNjN9gqMcb?=
 =?iso-8859-1?Q?9aV209aMPAAPzZgiXn3rLgxv2Ugzm+1ruowv8PLpcELBfZLqQm8b6GfrcI?=
 =?iso-8859-1?Q?jHMHurwxS4sYf38X24RMi/pAkGjl1ImRIwm30ZEyGL6FxcgqIPsxvTfO/X?=
 =?iso-8859-1?Q?EVxK+YyUh7KTuzBd7oHB/w2qaJy2iTJTQdsD0tiZqmxUb7ToyMdRVEhmDK?=
 =?iso-8859-1?Q?00vFLUonSKDSz8iNarpcIMBsTHfV/YVqLb5ui/tCjF+ZpVhMrARtHVL67a?=
 =?iso-8859-1?Q?1yeTyhYMyyhH1ZStH0bEw1vm/njG+fJRlrNu/aqQwCAKbWF3dY7sNouI6A?=
 =?iso-8859-1?Q?N9fbbZ4Wrt2Tvl7IVjt/yn55QrG99H4j3ohD6atMkxVhibkeqsNLF7fO7o?=
 =?iso-8859-1?Q?m62PQvi+ocJZOw9ZyZuD4YsWCDaKRvdxuAgCVAc5DM13P7kSPYoPRz333K?=
 =?iso-8859-1?Q?NGdUgR59YeNrGQ+bcwFyjEwtoegcxvMUBFfENofWPENC4Ovgr+oUaY2Z2+?=
 =?iso-8859-1?Q?6+lrIj5KiFRlP50wt4IZIGYHi1+FPYsW6XOZxaegtVarNuk2lAN6mfCzBP?=
 =?iso-8859-1?Q?mZssxjxfxT6slweCxg0cqBeXUlBLOMpNMvBx4YgRqhcBtz9NQJOEMjbj7H?=
 =?iso-8859-1?Q?Z5o+85eZnejeBdSNHj8rGKYuJbgvCK37dhjMeij4TbCQli8G/ELD6KU3FR?=
 =?iso-8859-1?Q?WiElwFZbbbeXEXK45gDmRbckB1U4/cPHeHMNQejnYWC1gp04oTqQXZfUlI?=
 =?iso-8859-1?Q?wVz6xUcD85TnZO06LjepPp56pSnZcaiKiG0YEvyDGle+YcL1p6M8OKRiUK?=
 =?iso-8859-1?Q?r/aAT1WlfD9cSbi/xSwcOmZ81e7ZaS80Kw6KuaRmLRPP5daaD1tM8vl+nQ?=
 =?iso-8859-1?Q?iV73k5MTXt0+yJr6UuJD4FcacqX2yva9vxJL4Pw6c9SpSv2q+7DWRR+KGb?=
 =?iso-8859-1?Q?gbrQzHwudMEL1CP/2tl5EkEh0jTcdV9t/WhZrdRi23pKTBvBY8sMe+nlEC?=
 =?iso-8859-1?Q?CavrZkAq0nmsOizbENN5/EvrfEVpEltdo+zbjiRJjzACU9yW+XzKeAqpiU?=
 =?iso-8859-1?Q?e5KuKDK0dz6DtsmBxP8BWg0amWWcuZVEAdK7qWEy/i/NYG3aykjEGtqyb2?=
 =?iso-8859-1?Q?5eUUv00apWo+/IU0E+s3UPXyT/S1Vi+G/jCWsmJKizdxELHlFerfT0oMck?=
 =?iso-8859-1?Q?Ly7yjT8rCdLoXJL0B4uZTbIoEYGgpa5XZoYZPvYwx/gqw51BjQGzg6K2qY?=
 =?iso-8859-1?Q?tUeMowy6SEhYU2VQBaRQiZYwuP2czbP0MCp05WeNSzTFnGSlBbtGoOJzT1?=
 =?iso-8859-1?Q?mpPQ+Fkf0G/P16szvxi1Z+XyTHCpnjGrecrfJxT9TBFX6i/kJc38PMw2l0?=
 =?iso-8859-1?Q?miT+3zV7z3diTBCNSN1ayc8586B0qJEfm/wHFHpuvtKGwYvgEei21uosqi?=
 =?iso-8859-1?Q?gzfNyBq/F56UqpM0IYN7k0aKKExpzrICSF2K0q9U1NRg07M3faM0MpV1ed?=
 =?iso-8859-1?Q?k0FPseto7CMjMBAhiEPgqvNnBFac42Bxq4hyOcLHKg4qCCRNXFWOPBmw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd7e891-146a-48f5-b9e5-08dde3b695b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 09:05:49.1488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnCQzV0J+Rt+hA6vcFLNO0y1IN+GLVkXOlLet6hGFv/dJKbEX+xjFWWC8+6gzTwEb0sLGKQXefnlBmBwhlUeb+afoOkM2jXHZ+JhFOET3PM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10938

MISRA C Rule 17.7 states: "The value returned by a function having
non-void return type shall be used."

Deviate functions like 'memcpy()', 'memset()', 'memmove()', 'snprintf()',
'strlcpy()', 'strlcat()', as they return a value purely for convenience,
their primary functionality (e.g., memory or string operations) remains
unaffected, and their return values are generally non-critical and seldom
relied upon. Update 'deviations.rst' file accordingly.

No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..23f62ef646 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -575,6 +575,12 @@ safe."
 -config=3DMC3A2.R17.7,calls+=3D{safe, "any()", "decl(name(__builtin_memcpy=
||__builtin_memmove||__builtin_memset||cpumask_check))"}
 -doc_end
=20
+-doc_begin=3D"It is safe to deviate functions like 'memcpy()', 'memset()',=
 'memmove()', 'snprintf()', 'strlcpy()', 'strlcat()',
+as they return a value purely for convenience, their primary functionality=
 (e.g., memory manipulation or string operations)
+remains unaffected, and their return values are generally non-critical and=
 seldom relied upon."
+-config=3DMC3A2.R17.7,calls+=3D{safe, "any()", "decl(name(memcpy||memset||=
memmove||snprintf||strlcpy||strlcat))"}
+-doc_end
+
 #
 # Series 18.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 2119066531..ec98366aa5 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -576,6 +576,14 @@ Deviations related to MISRA C:2012 Rules:
          - __builtin_memset()
          - cpumask_check()
=20
+   * - R17.7
+     - It is safe to deviate functions like 'memcpy()', 'memset()', 'memmo=
ve()',
+       'snprintf()', 'strlcpy()', 'strlcat()', as they return a value pure=
ly for
+       convenience, their primary functionality (e.g., memory manipulation=
 or
+       string operations) remains unaffected, and their return values are
+       generally non-critical and seldom relied upon.
+     - Tagged as `safe` for ECLAIR.
+
    * - R18.2
      - Subtractions between pointers where at least one of the operand is =
a
        pointer to a symbol defined by the linker are safe.
--=20
2.43.0

