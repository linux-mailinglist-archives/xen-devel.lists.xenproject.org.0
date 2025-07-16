Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C55B0754E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 14:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045124.1415197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc0vb-0004o0-Pu; Wed, 16 Jul 2025 12:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045124.1415197; Wed, 16 Jul 2025 12:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc0vb-0004kv-Mn; Wed, 16 Jul 2025 12:08:03 +0000
Received: by outflank-mailman (input) for mailman id 1045124;
 Wed, 16 Jul 2025 12:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nLWN=Z5=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uc0va-0004kZ-FS
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 12:08:02 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 844de1e1-623d-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 14:08:00 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by VI2PR03MB10596.eurprd03.prod.outlook.com (2603:10a6:800:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 16 Jul
 2025 12:07:56 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Wed, 16 Jul 2025
 12:07:56 +0000
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
X-Inumbo-ID: 844de1e1-623d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVI9U66QfScmxFVk6qwCZnkjggVhfdySY5WnM58cvBM6XDe9hGDlh8SSytarH4AzBgQ0jXk7ixoAM5wugNSmjgeaMq0fpw/akUK2tV8aUjvNSPB174lbm1txKvh9/N0NsZn5CDnK6b8LbcgR5jByX5cOLSWkGyE2JLtmlZOBCJYA67ZmA4cHx9cJ3S9zSIVt8qUnzj+Z9PySfUTEX3OwHbCbvoAwbdEGCJ08GYLRD2XRJn3xcKB8BmM0qwR+fQQRwBtxTascmS8DwBpJrcLlf0/LoTyQsi7jvxqVXMEqkTldC3rGKmyvNyrik2HEq/rD1cZIJzU21zl+fDsXswAC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDbNjGaYD8yV9+VttaUaCF0qxIZx4mdAh+Vdd/hW/iI=;
 b=KvXuTTyrEjEUliHsL1vsBOtMWA63/pBrXH+AWYHPivnj6XlTD1NN/pEZFeldCgbCP+F141Elyfak5rTrambbk9qfGRsz2uhMgZF6cUa/xl3LJ5mECkV+iuEKhKkS4VQ1TAMjOl5qmSotw8gyCLlV+Ouk1+RDsYJ9Vjcb55HLk1F/9tDSfFv+ZWNE8FCnT0aGsc7PKsBsn3EpO8g3BR20ugCDYxPG2MYQaXmss9r5O4VAPpcR55h0zf/4d5b1U+CQnTIRy6UgWIIX2G/3kKZeXiRnaRDLtoX6l+J9yRa0+2o/seAVVpv7E298uGKCV9REFgY4iJdwsx8a2c6znkKA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDbNjGaYD8yV9+VttaUaCF0qxIZx4mdAh+Vdd/hW/iI=;
 b=VsPmQ6MhMVr1MrooyFMPev3bbuB/em10+LjpS4q3wwGSTmKQRryLjydiKHa0GSrsXHAUboiOlXSWxZ9jTp9Jqpu8hZehVndT1uNtFJiD2BSXo4nU0a7wQ4H0JgEg7+SFBKko/8e+GShCgZjR0F+QmD7j+e1LZGxB9m4DqnIvxwSyVygb8dvipWu4aDKiVnB5ZK2EcllCZN30WlC31VfvukxOj9Apz8Qj0nz1VyEX3Rr63u25xMaQIGF7dDkXBcRHIToSf6X2bjPIPE5zO4nhFyieEcLCmlGXO443YW+o3mr3deuqvm+7Fc7Sbt/xQbKXCFo4gowGBGuxhFVhLk/CCA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH] misra: tailor the definition of Rule 12.2 to C standard types
Thread-Topic: [PATCH] misra: tailor the definition of Rule 12.2 to C standard
 types
Thread-Index: AQHb9kpD31dTcYF/7UCF8hLOSjEN6g==
Date: Wed, 16 Jul 2025 12:07:56 +0000
Message-ID:
 <f486aa4ac823085afb7e068f6e84ea6be3cab19b.1752667611.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|VI2PR03MB10596:EE_
x-ms-office365-filtering-correlation-id: 500e24ed-a5da-468c-b822-08ddc461664a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rEmMSSR450ykffxzjuxYwG4zo+abyIwxGnI3LzuX7SrbZG+PVKh2uU64Fk?=
 =?iso-8859-1?Q?I8R9BcNmVrIru8HEr1HzQIxOElaHwu8kaZK1U/R5lIuoBXvHTFOTN5fQmT?=
 =?iso-8859-1?Q?mDvTHbVJLWar+nlYJrYf/tNMkWh9+ZhX4m7ZL3ARtkMUgiBdA+HqdQM8XD?=
 =?iso-8859-1?Q?eD+BdgQXoX5obWpPNXCtLQGhjqlFlbizC2mklc7VrTkCNpYPInSk5ebzHL?=
 =?iso-8859-1?Q?gcfTV7K2rdw4MWmoETJe621jd5qV9OM+F2+2fOJNWklvmLNsX4SK98RO0k?=
 =?iso-8859-1?Q?pUpGKFsbJLSiAq/Rbwlyr5yjyQgm/jRhh315fp1o+X4WH/OpnlaF/xx5Ex?=
 =?iso-8859-1?Q?KgoyPZPlAicsInJ2AuxZapD+SC1Mwce8YIoe52Tqkn6dxRjDuQsD0vpbHi?=
 =?iso-8859-1?Q?8XIXjo6lOe9x/PUHQqbC1S+38KaSb8hep9M/gAIg1JpnzRnD5nDohnzUkQ?=
 =?iso-8859-1?Q?mWbbzG686BzuVFhbxic3YsPsA5h2THfYdKRxh5ayDFBwj7cPZYg4OCo08Q?=
 =?iso-8859-1?Q?qT2kLvU0VIX0cof4DzfvBHgRgfMFn0zNhXOseirY5fGW56U2d0Xzr8TLIa?=
 =?iso-8859-1?Q?EVmDlqhr0fXAYuxAcYZZn1Hfe9M4YPKthugLUmJDRJ3WWXPBmoU1+rzYrX?=
 =?iso-8859-1?Q?6iJz/RfvKX16/jo41aGC1Na358ijMDiIu693LT+BXvFbOtyrMhoAqt9R+a?=
 =?iso-8859-1?Q?ZYI5BJKYAqj1O9f3BjTVbLceOzsm8zk7rBL+PVT4rHWkyJevCpITpgfpta?=
 =?iso-8859-1?Q?bTIVwayxHwpr1UW5Bk4vUDY1WX0/oIsaMyMZGcqwGIOhpvg6KpViofYujK?=
 =?iso-8859-1?Q?S/4CHIKHTw7cOWJrItIDNDXwZ4I4AiraPRwSKFZ9Pm0DbAwBx8/YZRL0z/?=
 =?iso-8859-1?Q?5lTXeQS4vZPQu/Qm2ABhwVgRzENFRltoOo7eBR8lu5tBnAyUTPwzai8QHY?=
 =?iso-8859-1?Q?qKPCX0zNzR2Ro6uj7RrFKFOtkc2cfYTN2sLG418IkvuJQwuim3ohWENDMt?=
 =?iso-8859-1?Q?9xgQAonUrFiCTcViZ7X917JUBjhU6EWNG62bJ5zq6hDc320W6QMou9Ha7y?=
 =?iso-8859-1?Q?8f1VzitvNmhQ/+2oPO4+V7kZ12dK4ddoxE6BPNdc7LVamfHV50cPf9RcJb?=
 =?iso-8859-1?Q?xrBvpD/BDOWfocmH6uVlsGMVy5j1Zw5l8F6gsORTPL7Xb/DsyGRHYMxLgb?=
 =?iso-8859-1?Q?0yJjmGaSUQ6lU0+aWfiZ20+bflx1XR9clH/C5fsEtn1AXr0+LKDuxOUCnv?=
 =?iso-8859-1?Q?oKa67KOoeNmv1HaT/Hx8LI+9ReD+AtaQRS47TQNNJBoYMlHj/sn7HyFIsk?=
 =?iso-8859-1?Q?Kl+f2MM5JFh9niDxZEKsbVp1l7HA6XPBTclWPoiNYTQzp6F3m3B6q6PpmO?=
 =?iso-8859-1?Q?nRBy6uNSuLHytN+0igoflkra8pC9bsDJe97i1s5Rpll3wNsfOdreu2O2UD?=
 =?iso-8859-1?Q?ku258A1nKsdan9ihO8BDAzZpzlxVUrK8h+9PjMTdvL31eQg+emKCJb+1FC?=
 =?iso-8859-1?Q?w3b42gQyaawLCuIpkyzZtrHk6ama15z1ZB6hrlBCnmzw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nUvNaDL2/Z5MqhAguZUpAm3GHRzcXi2moZpguolDpi4NNLP/sz9UX+Elwy?=
 =?iso-8859-1?Q?hcxZBWgfAWtkb82Qh5DdaRP1wHP1TtGDhDlIu9I5Q+zp48jV5zqrVR1tJd?=
 =?iso-8859-1?Q?/N/q75/cftN84ZqYOBA2Cq+0P5qEktUN/RWcz0iZ/a6VOQrsjH3+Sm14ai?=
 =?iso-8859-1?Q?PV//oKy8fYF8dhnrO5Y5l5gQkYeHTmcePqsWt+iWHoXDyrJNhpKKPuCYfH?=
 =?iso-8859-1?Q?4yDkaCU39LpjSLa6GZJ2X41wbgMVh/4888NncorqoTDx9cKLXPIy1rKT3f?=
 =?iso-8859-1?Q?SnE5nKTHgpTcbONTcbsG+PIS7cpXKWujQXSn6dxdsK/Lq0uI0mV2tNNQ3j?=
 =?iso-8859-1?Q?SCXYMBQNuTKIyiyr1VF4o8Iwdwpj0SLZsoS4AyAPWoFRbC7rAGLrjWPE71?=
 =?iso-8859-1?Q?vHUW9e0l+zVSWVq94+4lTpDankm9rCS/Fwsxk2bt5ZsuXFwtxHDEiSHw2z?=
 =?iso-8859-1?Q?k8CU91tah72HF/pEUs9tQ4NAySeXPhwo8UTA/f4yjDJ5qPNLsWdMqrpT+1?=
 =?iso-8859-1?Q?y61mH5tn2yaqK2USDV0ggSisaDa56bIuwy0wg/dXqyF7gMd6Yb8A4cUDiB?=
 =?iso-8859-1?Q?fMbr7yea58L4VZkVzrBaLUlaUiRNTe9QiiTndxhsPClROMzb64SHk/TylX?=
 =?iso-8859-1?Q?W4lCH13Wcpp3nTVwArLPewici+MSjPRsLFOsJYWiQu+ztBtP1WbQVkuDLG?=
 =?iso-8859-1?Q?Ahy/Cc5H/xaDP20T5WmUI5YnfrkBEZB5sW8TkFWrgCThUkxydOQ78ONsxP?=
 =?iso-8859-1?Q?l8th9uufi7EGPO4zy6Az19H64l6GPMRNagPOy3oi+AEerd8AvFr1QhaFpX?=
 =?iso-8859-1?Q?J0pXYWIOw/bIvS+YjVQ/ayP8XH2ZlmA0tQblvaWUIJpsuUZLn35UZo3cqq?=
 =?iso-8859-1?Q?ynHM9MYofm7ZsIwYNY5IGCbxbMUR3B73IY8FWqCD7FigS9GwzQCIy8vTVt?=
 =?iso-8859-1?Q?5DsRCkkpHVQG6CIY9/3TCAL6OFGF+Y/GmqjW35Yyy1g2s8tN11SogMdQ0H?=
 =?iso-8859-1?Q?p9OSUXblLnNUEjA5ds2SL69Xnv1FIj9typOqd7mt1sn89Bmswa+m6P+//f?=
 =?iso-8859-1?Q?gXJtEto7EwDYaFvFQcD2xfhe7XEy2aaQKDADgMhlfW6cninLxWZxLWwbV7?=
 =?iso-8859-1?Q?iQoGbU5SillmTCNgnH7PI5JwwIS7/+9Z4B2FyClbZtPgmLwPy3jtSeAPyy?=
 =?iso-8859-1?Q?XSOA+6zFEiQVIoHs8j/CerQHPQJoqt6JoD9AaubD89VnyKFgE6L2IHM8Sy?=
 =?iso-8859-1?Q?/XuKzS7Fnd6kMONuRb/R+A9PkCmJAcShnHXUVAHgc0HgmG7MTmimLyOpmn?=
 =?iso-8859-1?Q?pvrWf+7M5azvoYwjKXOXYE4mUcSZSkBz2OsfgBxVjbiEs2Oudqf6QRzmME?=
 =?iso-8859-1?Q?rI5ysZKrtW6WTEm/KWdY13Iy7ng6RMjJKhy1Hj13Ru8lwuUl8Afoc6PDuZ?=
 =?iso-8859-1?Q?rtIeqqdJow8ci0V0UH9LjaVFP+S7UhGk7V0+BtpnGGMew9ClplIX9rM+KR?=
 =?iso-8859-1?Q?+jSvoBod24Bt52bS0XO2YCAFiUIGxHIOdQC+MAfwgNZW/0h+lVSSwgQ15X?=
 =?iso-8859-1?Q?XsWzixlfS8jvvgP5qZgF6R7BqEI563MlrTgCBaye4gB8nAHWXZYIM4t614?=
 =?iso-8859-1?Q?1PahL4zd3dLPgmqffMgroTevDfDKivN9Q4ybBxN7cREYJD5YaB/OUCiQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500e24ed-a5da-468c-b822-08ddc461664a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 12:07:56.3331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bgJKZ+1Qhprk/1FM0P3+yNnKuBy+VQKWq/GAMTeJ5hEqjiW8nvHYZxvMzYXRyjmYTz/pI95M1ou7t5KNWSsuI8NvRj1T1nOil9UNWnWTswI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10596

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

The definition of MISRA C Rule 12.2 ("The right hand operand of a shift
operator shall lie in the range zero to one less than the width in bits
of the essential type of the left hand operand") is concerned with the
essential type of an expression, while the C Undefined Behaviour is
related to C standard types, which may be wider but not narrower than
the MISRA C essential type. For this reason, it is safe to consider the
C standard type, rather than the essential type when checking the rule.

To avoid regressions, tag the rule as clean and add it to the
monitored set.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
 automation/eclair_analysis/ECLAIR/monitored.ecl  | 1 +
 automation/eclair_analysis/ECLAIR/tagging.ecl    | 1 +
 docs/misra/deviations.rst                        | 8 ++++++++
 4 files changed, 18 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 8504e850c1..483507e7b9 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -413,6 +413,14 @@ write or not"
 }
 -doc_end
=20
+#
+# Series 12
+#
+
+-doc_begin=3D"Consider the C standard type instead of the essential type f=
or the purposes of determining the width in bits of the operand."
+-config=3DMC3A2.R12.2,out_of_bounds=3Dnegative_or_too_big_for_type
+-doc_end
+
 #
 # Series 13
 #
diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/e=
clair_analysis/ECLAIR/monitored.ecl
index e2ad224d79..00bff9edbe 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -48,6 +48,7 @@
 -enable=3DMC3A2.R11.7
 -enable=3DMC3A2.R11.8
 -enable=3DMC3A2.R11.9
+-enable=3DMC3A2.R12.2
 -enable=3DMC3A2.R12.5
 -enable=3DMC3A2.R13.1
 -enable=3DMC3A2.R13.2
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/ecl=
air_analysis/ECLAIR/tagging.ecl
index f39beced9b..879485b680 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -63,6 +63,7 @@ MC3A2.R11.2||
 MC3A2.R11.6||
 MC3A2.R11.7||
 MC3A2.R11.9||
+MC3A2.R12.2||
 MC3A2.R12.5||
 MC3A2.R13.2||
 MC3A2.R13.6||
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 620e97f0bd..e78179fcb8 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -386,6 +386,14 @@ Deviations related to MISRA C:2012 Rules:
        integers for this purpose is allowed.
      - Tagged as `deliberate` for ECLAIR.
=20
+   * - R12.2
+     - The width in bits of the C standard type is considered instead of
+       the width of the essential type of the left-hand operand of a shift
+       operator. This is safe because the occurrence of Undefined Behavior
+       only relates to the width of the C standard type, which is possibly
+       wider than its essential type.
+     - Project-wide deviation.
+
    * - R13.5
      - All developers and reviewers can be safely assumed to be well aware=
 of
        the short-circuit evaluation strategy for logical operators.
--=20
2.43.0

