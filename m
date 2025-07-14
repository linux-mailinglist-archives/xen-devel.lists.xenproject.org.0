Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0205B03D51
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 13:25:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042774.1412844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubHIN-0005Ug-LW; Mon, 14 Jul 2025 11:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042774.1412844; Mon, 14 Jul 2025 11:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubHIN-0005Sc-IX; Mon, 14 Jul 2025 11:24:31 +0000
Received: by outflank-mailman (input) for mailman id 1042774;
 Mon, 14 Jul 2025 11:24:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UiLu=Z3=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ubHIL-0005SD-UW
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 11:24:29 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13f70e42-60a5-11f0-a318-13f23c93f187;
 Mon, 14 Jul 2025 13:24:17 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by VI1PR03MB6157.eurprd03.prod.outlook.com (2603:10a6:800:142::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Mon, 14 Jul
 2025 11:24:14 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Mon, 14 Jul 2025
 11:24:13 +0000
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
X-Inumbo-ID: 13f70e42-60a5-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q39ZVo/E9O1yw9KcPp1Quk3If3irPHK6coMyH/J5ZUutWjuMu1R7Yc0EfaWlshN2I1rOpQMhKkx2EZ9wXydZcecI3pnVPbX4F69dqQD0HFy8L1j/xg0K2luTY1ChR9uLqZxRzD/8bIECW/Tpq6wHOpTIJVaCO0ko9S8Mdk/2Qg+nBtkhcExZzhC/VMNkYGQbPdSNTYxV3b00aQVNjKndcl7Hx1Z77nVUxdNaCUQ+GZjh9U5XGueDCrvZmlNkX6u122OelcqHdZ6CIQLiDj3Y7p60tGnvryl3/dB6n3CQ90gSloYN0km34p8cMGAU2maJBQnWB4KRpPwXr0C64nQImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSiss5N4njq5/aoD5rf7VSps8X0ONTOJ1RSXNW4dG08=;
 b=jmwZB9zsJB9yQWoXkyPdnWN1LGBdlmzk5ft97/8F53s/n59ducUrwN+/27zRMFZ193QSdh6aUv9s2xiF2HwZnTlSjUFxXb5GY723qDpJfKND76zHGupEbKPFQ4fjqLak7Ut/aiAxoGrW4okv1PCB7kQRxY5i6HpfrempGsWoBkMU9YDjhZBNOR3vh30PkiIdSt+vwkxosznA1E3oFewHYrDOldop/IG6UXyZdEU4gz+jSMPtzOse/awfSMcEHytvSJAB1WQoqJajMsDtZ/acSujGRkehSqLZlrbmI+02zEBnfGSFcyWcmZh+p+lAPSK4VsDiTda6Hs/i+rCeXuxYaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSiss5N4njq5/aoD5rf7VSps8X0ONTOJ1RSXNW4dG08=;
 b=bZnF6Kuh22y10YNhZyJ7K+DoOrlPCmeURZtZT1n/nkMFGEil6eTH7NRTKl9PnUqJUXIqwVOorf+2MVPsciG8qcg8YkhwdL915yAlENBUFBnZ0mdbwcn2vTlor1KE8xtFfCjmA4ISIRz+w4B8b0I3N1zDovuX0bn5Ua+L8j2LnbumKQW8zsGNkCpIUcz4N7Vim1RI2jECXaVVhahgIVAz7fqPiexJOI59RmO5AvYDYs+EfsxHNKkrT3fl5R+jJBjLS1prFAzdYoBQxGlL/wA6oFQM1iFsOMRaPYv7e3N/RGYdjaayT6yJRauR12bBnBK7q/r+/ankpNdo2oNWKfwLWg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Victor Lira <victorm.lira@amd.com>, Dmytro
 Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Subject: [PATCH v2] misra: add deviation of Rule 10.1 for unary minus
Thread-Topic: [PATCH v2] misra: add deviation of Rule 10.1 for unary minus
Thread-Index: AQHb9LHT5f+FQP4BXEObxG6jgdfhYw==
Date: Mon, 14 Jul 2025 11:24:12 +0000
Message-ID:
 <7e6263a15c71aafc41fe72cecd1f15c3ce8846f2.1752492180.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|VI1PR03MB6157:EE_
x-ms-office365-filtering-correlation-id: b2f83562-0db3-4cb3-3ad3-08ddc2c8f5c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?di097x/KGN3fl5bKheVZ3h0R6m54tyAHpfRiHPH3hl3+hFai3OR6RbE/J0?=
 =?iso-8859-1?Q?9bN1BTNU0FLzQnLS8zABPa4u3mPMbjD5F6AWoHV1oc3+wcBPzns4AZYcbm?=
 =?iso-8859-1?Q?0unCPkZ1+4Pwk/8gpqJwvnZUxkxfvg3U8izX4OTYN0T9ZVfjlPYockDRYA?=
 =?iso-8859-1?Q?sUMQY65q1UTT+cmIa1NZKFXw9+n/xFzM6lI71TkViikHQkev2yClgW2jgd?=
 =?iso-8859-1?Q?dj+A/+jWUpNk4zzCyFAZmtoqzt4VCF04UCve+5fqt4/SP4/KOvZITAddrS?=
 =?iso-8859-1?Q?OU+Qq8ZkvANxmU3sLODYSFUwJ3lg0BEvMh8aiRWN5DZaCHNj4SF6Tc5o2R?=
 =?iso-8859-1?Q?pCSKHp07x/nytzlgCwkHM/FuACvo8EsgofH6hmpTSGsZDTvAGhVN1hlX6m?=
 =?iso-8859-1?Q?mqPWp2eAv7EDtEPS/YgunqiRlsULClYYdVBpFi8/hY8SwYgo01VJBqCFWE?=
 =?iso-8859-1?Q?LPOCNcBBO++23iBdQW5LzPE6eaaVezSG8H5NNRGdYZbJz2OS6ZzAxixS2c?=
 =?iso-8859-1?Q?xGNTU6Sp2TnabXrC/wAhhrW4LUcMz0sAXYz+qdteBDag+rKqJCj9OjaHvw?=
 =?iso-8859-1?Q?dJ4SR4qjomwi4woBujL7FRtLypfb0u48p55qsIptZBIS3u/qDQESeno/AC?=
 =?iso-8859-1?Q?6xxNkZh4ayDM1EHim1fB4J/BGrNlFmwe6kPJH+SYM6BUy9svw9u+0shGdR?=
 =?iso-8859-1?Q?/1Oa6EEWFQGJAXE+dn7exZ5ZlFwZi4kN1vSTBJgCU9kWyJ/N32Q4pmEg7T?=
 =?iso-8859-1?Q?bBeK2zt+0rsixdoslAFqPJ5EOZlIsm86J5n1HNm/SFeucckOmOoxPi4yX5?=
 =?iso-8859-1?Q?PJvAOfVOy/0ZINCpasqdElo6yIKKgQ87R1lk/UxB66A9MED7ZUtTkc04G5?=
 =?iso-8859-1?Q?OBof61Kclv5rMtRo/8KGUIZM0no61TLkQvkG+G2Ccp/MTr3aselonu8N8r?=
 =?iso-8859-1?Q?hT5idcDfn59t26dWo5vS1L7F7Vt8KTxtZ0D9lJQb8I6iGOC5G3eiFIiCsr?=
 =?iso-8859-1?Q?+YGuL77XUzseKuAvl0hB4FCrUyV3dRznDb5QS03E/in6+nB9c8yVpRWcc3?=
 =?iso-8859-1?Q?r4X0rQ2Sh6IiWggGKBaroFS2yOmlk8YuOf/kzLo6gMmKXmuWW0sWwx38ZG?=
 =?iso-8859-1?Q?XW/pMP+0E7k/Xx88KPa/kmdPW3rZAHD07wphMYYAkzSLQhNaibv6BHsEja?=
 =?iso-8859-1?Q?GKN3z7ubZZmVH0c6/AMdX9+UrTPSjSDoOtnK+/MoZ73AtdwmrntC6Bmtry?=
 =?iso-8859-1?Q?K93vySdpa3RkWmiPWj4su/XVCWFZfD5A6Rddb5J67q02K987BdYTBvEobb?=
 =?iso-8859-1?Q?0e72+LfUcRdNLK3EKn2JBFVjqot8JIr+mWk6HyKicsmo3i4LGYYsQwZlrN?=
 =?iso-8859-1?Q?1NX2RmU+WXs3Tn6pXMI9kF2Lszxl7krktv/FgQ8rwA+lf6jv74ILS6TSEL?=
 =?iso-8859-1?Q?Tc0EkQIKc3I/7QcOM8WUEnrP3TshRb3bS0v7WzVIwHoHVFrhRx4omgcjuz?=
 =?iso-8859-1?Q?Whmjjs6WsaEawCo/mU0ORJdchOfpPiCotkZIu5rVyglA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ysmRFVi5Al1bWrlmC4t0fFvIjx3BwB/TjCvDYLe9fvyIFs/phJUA4qJDT9?=
 =?iso-8859-1?Q?h7qBdXNLSU+7klcYWlb17q+dtf9teNq0jTcJOoRwyOSiyoiihb20vsgF6e?=
 =?iso-8859-1?Q?+M9FTkbC9S5PRDtN4kfJQU7zfR3SnWx6MrGmmRrd1qQgyXjTT+LLSe7Nke?=
 =?iso-8859-1?Q?oN37a4Y0vh5a77VpTJ75jCJcww2ntizipyuuTOvE7XCRX7JsBjcKPaExL4?=
 =?iso-8859-1?Q?wqdFJkK2Pdk3GGQTbLcWluc26VDcJ934lV7lQPaMOd3jBoefc5CjcJvDTH?=
 =?iso-8859-1?Q?FCX2qB8nOyWWi6sRw2bIfbfsAK6PETc2EOAG+SSGwjis5U8fAWq+kV+zBH?=
 =?iso-8859-1?Q?0JFM9OvUKhvgbL4kY4+3k9w69A+HaLvL5mnmBnzGBfHOHiX1uNMPY+8aa+?=
 =?iso-8859-1?Q?lipMopbp+eZ/MPcmJlEDrb6xH3V0EKL36jgwl/Lr2ecY1xa3DU1wgeU+gZ?=
 =?iso-8859-1?Q?NTj8DA8FMieamcu6GZaV+DmNuXnE2hXx7E50fsWAVpWEZ/2F0QRlID4Oj9?=
 =?iso-8859-1?Q?zpMiz3Xf7p8rcn7R28cvq4RPzRYOiBYQX0WDAzj7+b5PyVvjQjxksshgBt?=
 =?iso-8859-1?Q?jvVyY4cVwn2Ntqo4bBY1mV8MX0RSy15+N97a3mge7YLzTr16Ddql/iHKBj?=
 =?iso-8859-1?Q?1oahr3IE3J732gQtckQo4QpCtWtMtGn69vO7S0m754I1q6Wj1AwW6aTUXq?=
 =?iso-8859-1?Q?+LyXO7WxqACChxePl4VMGN5NnDQk9AvTwTqVIbRY6yxw3/J8yJRB6lzldq?=
 =?iso-8859-1?Q?c4+clJJnxSXQIKM8Ocd1PMOctsFeoMO9X17NB/Nzr+7j/bDZFujtGGhlUk?=
 =?iso-8859-1?Q?YDCp4pGxE2QmMAnO1X6oyKylZghB1808Vo2vBmuCA7f6BjSHOYm9scoQ8z?=
 =?iso-8859-1?Q?lQKEQlYKJBEksKoh1s4REMmgVm7BGBZFyXwHIwFn3j1Kp8zZPBLSVe2OQE?=
 =?iso-8859-1?Q?lC4fZthel6g1OlUXpFjOdo/q2eMcOihhPSHTQn6wLHfFca4hnp8R/eC2F7?=
 =?iso-8859-1?Q?7xjFMVwnJyDkXFgYElBLdH8KMWUkODsGThI7U6r2edgKnEPk6ZWzrK2p7K?=
 =?iso-8859-1?Q?521EOUh5v18NEOwRz/fku4UNGupWQr4oTnp7bQsnanwL9NOQao+pmbPl93?=
 =?iso-8859-1?Q?3XCt3jtB3HNOFdL08M19hbKOTRfnu1v0sPQpko7PFbKoIcuRJYEhhkvHK3?=
 =?iso-8859-1?Q?VP3cRgVQddTfg+wAFtG7fhIF6j4SJtPfj4iKafMoZfCJdBDsp8xqGPUDX3?=
 =?iso-8859-1?Q?I8wvv1HrWZtjwcsBGGRugsQ9hKT2VQclirPPhK9/n2i8Y8mFJMivnACEVJ?=
 =?iso-8859-1?Q?7Tn/Us6UbAotkdvJZgBO5ToCdQCJ3J5029PJye99IJSU7FomVcnbyFGVNI?=
 =?iso-8859-1?Q?iAJq6T87JMjwF9sNIBkLW+mQQXMbSq75GE21n6jYkVwk7Hul5iGetSxG+J?=
 =?iso-8859-1?Q?Iv2NxY3vP0BbOEXRJcVmoIOipVetu662kmB2H9p1vqvwP9SnGp0D68gjaS?=
 =?iso-8859-1?Q?B2VGypClOcW86kcpLiD1u6G6OhFLDQfqbqHlolkCDyRyH8xzkLY6T8HHmv?=
 =?iso-8859-1?Q?esTxmtOHxKqPHrA9rQyd7wM+RS5ie9s2x3qcNwtITU1zhaLv5isGZGFAYT?=
 =?iso-8859-1?Q?C2uXPJ7wNScCnZ/Ju+04pgdfLUbl9i2HSGYYPWihYruH4eB7TFy4lCCA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f83562-0db3-4cb3-3ad3-08ddc2c8f5c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 11:24:12.8633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b4+LbrOzgrpMxtgOpPY8tZjM+ZPg1aAbncRiDPX53q9AA9rnWl6n3nzzlHoo040MBCG/rZyg/9Gbpxn2V/RMzvFpJHapj80hBqkHOdZWIPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6157

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

MISRA C Rule 10.1 states:
"Operands shall not be of an inappropriate essential type"

The unary minus operator applied to an unsigned type(s) has
a semantics (wrap around) that is well-defined by the toolchains.
Thus, this operation is deemed safe.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes v2:
- improve the wording
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index e8f513fbc5..8504e850c1 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -342,6 +342,12 @@ constant expressions are required.\""
   "any()"}
 -doc_end
=20
+-doc_begin=3D"Unary minus operations on unsigned type(s) have a semantics =
(wrap around) that is well-defined by the toolchains."
+-config=3DMC3A2.R10.1,etypes+=3D{safe,
+  "stmt(node(unary_operator)&&operator(minus))",
+  "src_expr(definitely_in(0..))"}
+-doc_end
+
 #
 # Series 11
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 0d56d45b66..620e97f0bd 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -325,6 +325,12 @@ Deviations related to MISRA C:2012 Rules:
        If no bits are set, 0 is returned.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R10.1
+     - Applying the unary minus operator to unsigned type(s) has a
+       semantics (wrap around) that is well-defined by the toolchains.
+       For this reason, the operation is safe.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.1
      - The conversion from a function pointer to unsigned long or (void \*=
) does
        not lose any information, provided that the target type has enough =
bits
--=20
2.43.0

