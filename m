Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A6DB5694E
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 15:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123860.1466563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxmkq-0001RJ-SI; Sun, 14 Sep 2025 13:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123860.1466563; Sun, 14 Sep 2025 13:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxmkq-0001OE-Pc; Sun, 14 Sep 2025 13:26:56 +0000
Received: by outflank-mailman (input) for mailman id 1123860;
 Sun, 14 Sep 2025 13:26:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7UnR=3Z=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uxmkp-0001O3-7O
 for xen-devel@lists.xenproject.org; Sun, 14 Sep 2025 13:26:55 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7524aa67-916e-11f0-9809-7dc792cee155;
 Sun, 14 Sep 2025 15:26:45 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI1PR0301MB6637.eurprd03.prod.outlook.com (2603:10a6:800:17d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Sun, 14 Sep
 2025 13:26:42 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9115.018; Sun, 14 Sep 2025
 13:26:42 +0000
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
X-Inumbo-ID: 7524aa67-916e-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJAEzOYk0soF8EMXqX5Epttjh1j9lFe4uCwvaBmp8UQWhr8wSo6865j4pzRn10xVzBAgLb8dgRbuwCmxJrf2K5wZC3ezz+py5ubW38azk2OduddEctnzoee2QesQcDwngF4sWr5mcoPcZ4p4agJHkpNuCHpo2SdfWwPlwkT2DHPgaiGRPMtLQkkD2vQUz/3TgiItfR+gMyQl/U8H0CrWBcQ2AN3ZsmpFv+DfDS2DC4ta89ZDV6MV0FJ+eIgngSJak1DZaXhcI5bRY9E7SFXHTFNOSObapw3rMICVrrrOcLf9BBX7rQb+yGanIwj7qIrw7Xks8XHTIztaZ2d5FIZVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNAc1qEb/6M5T2GGRl2Ps8WmmqUXUMtwvy5Hlsi5R+o=;
 b=DlNbxRLOIz/pXe4zA/4lkwdsHiZVOYB2dwU8N4Lqx7d5qVUANdtjKcvncM8Y3qhg2WBPYj6cdSALrMd3aG6Zb89SiX2ulhwwsQ1UnCHwhDoogstji9JN88lmO8PixUR+nNkspZQYfqTw/2kn0RD77nuHqjquzU0e329+vLW7fvn1gaUdXlAwuMyhvqucnwDLiLAyqOEM2ql+bAUXvOG+JcuBxfaPQxgDYGIy9S5PxFUBITXU6sQrW0gBWdZtHLUZvapAGaC3W+GjxKPApyKM3s4fSeM9VNhyLJ/asPXzwsjcnaUjy/uWfhEfQ+4rm9Mnl4LvXo6YUHJDPpXjVXWRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNAc1qEb/6M5T2GGRl2Ps8WmmqUXUMtwvy5Hlsi5R+o=;
 b=OKfg7c1PLClcpVSGc1J4RLIaAwSH3gULhETJkXlKJMGYsjYnsD++jhGZZqMiSyMI2SoMte5OuPzBKmmoLxETlD4xtINNaqG+PPWNhNvfF/6NadQblFxi0eX9+V2pMfk2pw6TGLWD5iGBEvddt2nnHsu8U4eiw3EEgB0dRvmjpz/nSYAPlNoLVDJKbLr6/lEXLOiuwNUb63b6QGFFmrEzOqvd5bMvT5ptQ/1nbDrXzW3kBRDqnnxQvMOekUxOXZRkvaaQzBldiMwV2wEO47nBczMc7Ilf8YqESNgE8DAlZaTolrVI82W2igFH2R6RntIXkSiya+uFXamDYZgT8YF1/g==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v2] xen/arm: Reorder SCI resource cleanup in domain
 destruction
Thread-Topic: [PATCH v2] xen/arm: Reorder SCI resource cleanup in domain
 destruction
Thread-Index: AQHcJXs1K3LqZ5+aqE65C1kspBdxMw==
Date: Sun, 14 Sep 2025 13:26:42 +0000
Message-ID:
 <20ec9d9a8533417489a95543c1b72f7f55865c9c.1757856381.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI1PR0301MB6637:EE_
x-ms-office365-filtering-correlation-id: 5e0a5920-75af-4101-6a54-08ddf39257f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?zVob1uerdlOv3cgZqJk2cDMGdso8KAdkSebZNxXOwtxjJzFl0OgRXwWFqQ?=
 =?iso-8859-1?Q?PXRpbkF239S2liFoE40BlU1lj2wlfTNNeSOnsBpKpHJaHCTGRdVz5ny4fN?=
 =?iso-8859-1?Q?Xru+5VjFe8orNHd713B50S4s6n/SItS4Q9v3GkRF73OUeji2+bq9Ikmowp?=
 =?iso-8859-1?Q?UoBoahsrYgB39gbKNx8UZ2OKe8M4polGzXEvlToJXTQNHU8GyPt6tNHnG8?=
 =?iso-8859-1?Q?GcEZmqDyRLbYpuOM3WR04NS61ZghX8PNHyF8e2XPWKnjsS/zIuibaUZsgD?=
 =?iso-8859-1?Q?9AuMxIgYXtERbIjL/aiX8Ef5L3s5XJII3cccAfyjZEi0PUVvOXncBznHB1?=
 =?iso-8859-1?Q?ExSIfivoLWyH4+SkqsTk9cM69ZG+z9u3vtsj8o0NB9tpJ61jXjAf7kImaF?=
 =?iso-8859-1?Q?uuDCWcIwXv/urLa6wEdn6xuZ8Mh+i9qYUMp3b8A82cKq4rtChnmM8eIER0?=
 =?iso-8859-1?Q?v4gnWqAMlORuxA0a0yNEAtNT4qCP0FXTIVD7ACjn3UIRxkUThwz3/k3ohT?=
 =?iso-8859-1?Q?oeREr0bhm+Vkd8kO7t9FXCXZuVgJjwGL6buQV5/vex5u3mqMoD9qgwlNCA?=
 =?iso-8859-1?Q?D3Mfd5Kus5CbQbfhFtMxjMUYDqDcSG0db61elZPucibQKfgMG2ZA+Gcf8V?=
 =?iso-8859-1?Q?NpztiuaqaUFB6sWnedby3CWG2rgM2Ekjnh2O/iWUjUzNsLdZ/tmsox0s9z?=
 =?iso-8859-1?Q?vigBPfuGSG8wFaIOCpwlEVbXKRUA34gvhz8Tm+c9/lI92Bn9fUnsaBf87U?=
 =?iso-8859-1?Q?tR7ws22T24b9fPV4e/J2vYKo6xGZPlG8aLiLBN7W0/GBayuynRnB0Vl4ZL?=
 =?iso-8859-1?Q?+DlHehcym2ZzBVJ0k99RSbbDC70AWc7RMEq6u6Cdh6bHxkJLbbt+TOgs2i?=
 =?iso-8859-1?Q?WPHWFH4NIwaK+zGqZfOhaYTUSPH9LmMTy8yF8epusan9xXl7U6EE5Up3Ex?=
 =?iso-8859-1?Q?a4pEQWKCrDGkhLtIwjh48X64JeBC9nkov1qr78nZLtO2x9N3UFmzsrIfiH?=
 =?iso-8859-1?Q?JfAYzDe+QAp94kAkUDkhz5mJnxRrZ0EiTxsT4ruXnbK5nrhJDPGQqqQoXJ?=
 =?iso-8859-1?Q?8aX1fH3bwgRl8suo6cenvd/9lK1ex6M0XCEywDYtfR9VekOa8l6Qs9AXYd?=
 =?iso-8859-1?Q?3EXECb0bHYzcgNbkycjlZ6DqwY3y3cmUikClfmJVuc3fqutUchSvpWmq66?=
 =?iso-8859-1?Q?yNuEjrzORf98ug+4d/anoIoYIXxIsV6p1Tx37osoPaiqCaL9hI403IbKo7?=
 =?iso-8859-1?Q?4ig6yAkDzTh1PBN8tdoPfHkEWdQMaVoIlRvgjkVHmaLrl7RMQ/9Fceo93U?=
 =?iso-8859-1?Q?XFUpgJKKflC5lhwCJMoqnXUORd62OV13cjmD/dWRBFjL13wyI0jWbb0fvs?=
 =?iso-8859-1?Q?F5rP6Y7vLdBUbWwqENM2JvD6X9eG+IPAsrXP4G/83XKWDOJmIHnE/C+vld?=
 =?iso-8859-1?Q?Yn0UtkGHVX1Ptfb1gmr96UaRv54jo8jUY/DkZDhk+pGZkL532hfhYjNNPh?=
 =?iso-8859-1?Q?R+xYTD0YgWJjplX0z8+f7sMMrI40EC1vlf/x3D3nVhag=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VeIOlZa9Egn2TA/a7+nKSptpWaxKRY027k1ueSaJH2A6Bd0k7hbtNzqKdS?=
 =?iso-8859-1?Q?mfjnGldKSfVilkvuqEIZ/TXobrMBnonTao+OGmFnukVHOZ7dnvhn6ApK9z?=
 =?iso-8859-1?Q?YG9NgCTOvg5INl1sgjXiYc/WwJ15WkRIBwNCq1GqTxwLs5/JwpnAu0dl/5?=
 =?iso-8859-1?Q?Yk7qbx6m5Oh/XnBfhEe0mUeTMX9BBdfmwloQlMZ+GK7ZLjOyQBGdrWWrvv?=
 =?iso-8859-1?Q?F8fMxSFLKbi3IG+maaiPlq7ZSRO9+ovvKszS0iBzWoCxIAba1ZqCIvgwww?=
 =?iso-8859-1?Q?4UAivA3ropCFxd8mVm6ncjeAY7FLddek7x4TofDS8zUf5ex9XuJRsc2c3q?=
 =?iso-8859-1?Q?5yyREEBYvqbqcee2WXa6DRFKMeVWvrWPQSTzGiQU+MTwpVhpzkjX9/ozOZ?=
 =?iso-8859-1?Q?E++hZDKxRfOPjUh4TGz0syr/frLyzccUc4p3Tto39CMzMmrQtJv4hey3ve?=
 =?iso-8859-1?Q?6TIHPm7bVprWXkPfbv28QrnvTUiLUd3RGB+0yiloov04K7kxNC9dB63CME?=
 =?iso-8859-1?Q?pKoA1efordWdsilpfLqafDXuZNWGZTqA3ExWQ+bIzSfkJdCVUxtxWgBM4l?=
 =?iso-8859-1?Q?GHlJCIt9HgK9QErrlsp2SuY5CsRBe/N0J7/cB80aIbw83TQ+iYDfWaSQw3?=
 =?iso-8859-1?Q?YZgGfEP1P+tdmE8iEpPJlYQ7YT+EQxcb6dmEr9pE19WLh6H4ykocbf//K0?=
 =?iso-8859-1?Q?sOmE34Z7MNTfIYHDwGYRd/iAUyPniATpnEkxAC6ZoqosoND30Kta8LHzal?=
 =?iso-8859-1?Q?UzTcapa4KMjKZ6a9Pjim/0tmXSfGszgFxC9EAOmDmF/m3aXQ3ywo6PHcdw?=
 =?iso-8859-1?Q?snarZg2HYRgUZjp5uAW/sGqBNgWQzoqX+I8NhPCdvPe91m94uZeMMU7Jkt?=
 =?iso-8859-1?Q?lAlYMaRiT9qpvvHvOnQgrn2owlSAEqbBVKL996Ag+S3v2SXbkZg0QOkyP4?=
 =?iso-8859-1?Q?dIshDKvqisnhgL0ULsJVylG4Ro63Rr82XBSXdnCEyEflf+3mQLYVmXeect?=
 =?iso-8859-1?Q?X6Jv2EpVntzy0QGo9tGmEaDwAnoUSCW0CwQaIYLFK15wANucEQXjDSZDNJ?=
 =?iso-8859-1?Q?7NeyB3DOqkTmsKGDtOfOBxjYjJjDy6bDSoxOs8yOByuU7/JNnTEGIhw3QT?=
 =?iso-8859-1?Q?lpNNi/WvxCnbNLkpJBLajFFDzhBlDm3mPhxVgCylSpxzpYZnqV/zbtHBii?=
 =?iso-8859-1?Q?MKgfAwfP3/FmbZx1b5WQfeU2llqKHhN8vJlmIEd+S4LO1r7QtdpuD3xJF9?=
 =?iso-8859-1?Q?DsR3j9sZgiBgBbbnFWSjtUQqeIbKrXG9KVHBW7XcHssibbKjnbfYIvkPFt?=
 =?iso-8859-1?Q?Jam3oMBdATBwY9TwRhuDBDk7+qayE7idypoMj/z2CVG5O1gC385jRsLL6T?=
 =?iso-8859-1?Q?9kkFCO37uNjvkj0BlObLkic/9xZKbOEr8vMeyNc8fSdBvBuHnGraTHrwvp?=
 =?iso-8859-1?Q?rbpAUtNZ76AODCuzVs1JXcQlBVG3EZ5NMhrRIgzA5RV3jdbgW9KJe77Pio?=
 =?iso-8859-1?Q?kqyFlBBlzXfRMbHpkiafzN+daimpuM6VnZ+0e56VYS/oLi4/ItOd6IXQbz?=
 =?iso-8859-1?Q?3/3pL1/81wQoNb6PNCEiFwDdPtfXl1dPwL7oNrE2jj105myFjE7wKlgMtP?=
 =?iso-8859-1?Q?aTKfFhuvEpXI4ml8OhSIjBBotQavTCurYiVhsCQwOmymnmrQ55CkJ1JQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0a5920-75af-4101-6a54-08ddf39257f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2025 13:26:42.2419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SpKVWF9OwafpK3UyprddCvzj981sgoKECc+PZGvkXU0it9I+/gbu/fFBkm0DHg+xANKkrGTuGqbvHZZM1xoP+uWJjBp8HpAAX4A5iTfVhCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6637

Move the SCI (System Control and Management Interface) resource cleanup
earlier in the domain_relinquish_resources() sequence to ensure proper
cleanup ordering during domain destruction.

The SCI cleanup is now performed before TEE (Trusted Execution Environment)
cleanup rather than after P2M mapping cleanup. This reordering ensures that
SCI resources are properly released before other subsystems that might
depend on them are torn down.

This change addresses potential resource cleanup dependencies where SCI
resources need to be released before P2M mappings are cleaned up, preventin=
g
potential issues during domain destruction on ARM platforms with SCI suppor=
t.

Fixes: e2cc10867b (xen/arm: add generic SCI subsystem, 2025-09-04)

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v2:
- rearrange enum by placing PROG_sci before PROG_tee
- add "Fixes:" tag

 xen/arch/arm/domain.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 1a8585d02b..e36719bce4 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1042,6 +1042,7 @@ static int relinquish_memory(struct domain *d, struct=
 page_list_head *list)
  */
 enum {
     PROG_pci =3D 1,
+    PROG_sci,
     PROG_tee,
     PROG_xen,
     PROG_page,
@@ -1049,7 +1050,6 @@ enum {
     PROG_p2m_root,
     PROG_p2m,
     PROG_p2m_pool,
-    PROG_sci,
     PROG_done,
 };
=20
@@ -1090,6 +1090,11 @@ int domain_relinquish_resources(struct domain *d)
             return ret;
 #endif
=20
+    PROGRESS(sci):
+        ret =3D sci_relinquish_resources(d);
+        if ( ret )
+            return ret;
+
     PROGRESS(tee):
         ret =3D tee_relinquish_resources(d);
         if (ret )
@@ -1109,10 +1114,6 @@ int domain_relinquish_resources(struct domain *d)
         ret =3D relinquish_p2m_mapping(d);
         if ( ret )
             return ret;
-    PROGRESS(sci):
-        ret =3D sci_relinquish_resources(d);
-        if ( ret )
-            return ret;
=20
     PROGRESS(p2m_root):
         /*
--=20
2.34.1

