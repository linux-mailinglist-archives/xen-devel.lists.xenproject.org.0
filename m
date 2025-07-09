Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B974AFF3FF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 23:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038670.1410959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZcUm-0001JJ-4g; Wed, 09 Jul 2025 21:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038670.1410959; Wed, 09 Jul 2025 21:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZcUm-0001HZ-1v; Wed, 09 Jul 2025 21:38:28 +0000
Received: by outflank-mailman (input) for mailman id 1038670;
 Wed, 09 Jul 2025 21:38:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxYN=ZW=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uZcUk-0000ps-Cv
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 21:38:26 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0afa41a7-5d0d-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 23:38:24 +0200 (CEST)
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com (2603:10a6:10:3f3::12)
 by AS8PR03MB7461.eurprd03.prod.outlook.com (2603:10a6:20b:2eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 21:38:19 +0000
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30]) by DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 21:38:19 +0000
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
X-Inumbo-ID: 0afa41a7-5d0d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVoNQ1vLC0wHcQ/ARfWRtWEWXXcfDxpxLnb9WigkvjmhVcrfiQjOTsRON+XCCcvbHTgGaLGW++PKSTJ+JtZUaaOwFIsrQ0iOJE/arCDQ5oOCG7ROI+Rvb/aLejcSiNQbTwrBjQ+4yRYme4Ezfhll7W+RvuAZ1+xK5u/IMVaGiHuYRXWPXjs6Tj7STqsqCTDiPlBTt6A5efYy8ySaH7xMfpc58rxH+BdGcUcdZkXFcRWg/uoh8yPC1VkwAlbVs4KD9Vx1xeAPbg9d7lTphf27ab4I9dW1o0jv4dgsZj4CV8jqJA6OcvyUVL5hub8GscKhVlWKQWNb+TJj/Jjg/M71Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3ukeX3wq+UElyvs0FOh6d1EvTnkp8JXBecye8XWal4=;
 b=yV7ZYit4coHbhTshmyUlN4wPBgQv76g49JTlarWdDvdbA2dNFsZf0L8ND6TGxvDu4HlqDR0FFv8EerYQdWWdyeLiuJtMV1j2r23QyUAsAwmC08wPuzyOseGDfjFf77XNBusUf5IPR+QBHnQA6XsELKJ+olWuRsx45F+lqGY3kkjRpsPbJ+U6KyAoEzQvBTuZ2NJT5VtMH6yHO+FRR9RvLKUyDZwICBoz75mGdk5MYVqiPlmh4iymqE7LinUYdh0PdtK8FFE5LemTMnefr/RZRtlRDYw6EJXjvR0byUCv2Ycv0J7UTfrJp8eGbIbfu+iGqv5+rJrxBsai+LD9A2ktAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3ukeX3wq+UElyvs0FOh6d1EvTnkp8JXBecye8XWal4=;
 b=h26n/cBcUzwD4x30L0BjlehEWR1sX9zSsjoXHjSxk4XhKGuX0p+7X2/CJT2vAh74XSIYBS/SDyrZ6GKNHuIT4W25EmyYNsrEcKSieM1qu0IYY+f85KUBCXA4PG5GcDm8XktHsbWvz9kRfdhakoMOn10Ui0CnnRLIRlh3ht5t+25yg7SpQSJRQv1r6bvFcJ1NfN9NZO5N66M76SpOEH/GOtPqmBVNTTpd5FI1VoVmYxO587gED7q/xGwuAWygHH3z1ro1b+UFoMvr8rtxQCNpZ002sHXJIiEtE2GPyrOOxyhb55eapB+bUOETQ3pQzEAAs42oD00pXmudeYicjvb82Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 2/3] device-tree: address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH v2 2/3] device-tree: address violation of MISRA C
 Rule 5.5
Thread-Index: AQHb8RnJ3I3XBASNWkufF4wQbiQgCw==
Date: Wed, 9 Jul 2025 21:38:19 +0000
Message-ID:
 <f7af4b1cf5f3e4ff4e503f5fa01593e12acc55ca.1752096263.git.dmytro_prokopchuk1@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR03MB9556:EE_|AS8PR03MB7461:EE_
x-ms-office365-filtering-correlation-id: 4e96787b-1f1f-40f2-e3a6-08ddbf30ebee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?584AQyE1LmJimpC78JHKNn3osGgh3rg8ZZgVebUscA7Unx/WOAnwI824Mb?=
 =?iso-8859-1?Q?Grj/iVXeZi6JN/rOkCT9vv0tYy52FYOE/eHVNvk5Htk2hTUykGmS6irTFM?=
 =?iso-8859-1?Q?3nO3bUt6Vz+GOkugibSDeSh+80RdBFRn/2/ZGHL/7+V6wR7ScMZ/ivXLeZ?=
 =?iso-8859-1?Q?PJ14lkPf5uNDDbF/bDq254nrVBa7dQqTEoNSXs6cbditBvg7zGaAtcHc03?=
 =?iso-8859-1?Q?uBk4qwvb+bOmmF9wmAIt9W0FxDtTQz1d+dayNeQovFMFCSPy8cL2E2X+9B?=
 =?iso-8859-1?Q?uNdf2NcBgzQqzrkiF3sU9MQbifCcwfYOC26TU5A5iYhzEyZUtdKyuXAX0i?=
 =?iso-8859-1?Q?2D0fRQ2VzGYGwYnXvOD0PdvyR5J/KTINKeFpvYD/czIufV5xvz6IkrRsi4?=
 =?iso-8859-1?Q?XhudRvy5ArA1Ak/YwznKmEgR7BTqaprP03KP3r+fzfgBAQhjOOFauNK/fX?=
 =?iso-8859-1?Q?4ghQw4xzieinjfoc1ukOLk7pC0e5kfgqBdW7VLltfJCA5eQU7jjaqUzLnr?=
 =?iso-8859-1?Q?FpQg+dS4IXXZjkWgOQXG0z+sjT01D6EDjN9YxG3IL2h3xVM6IhJgY1GAl4?=
 =?iso-8859-1?Q?ygnc8RRLbxNv3CKUvUkYy0C+DUHlHdT38EO9aIj+UZAtjO0r3h7YyqrAQX?=
 =?iso-8859-1?Q?T3IgPlDt2ZYjSE0LTVn6bMZMGgGeVCQi4xLpcJBGjuSFyvMcXOaignUQlW?=
 =?iso-8859-1?Q?6zdgwxWvW7CIFFYhZrWhwhXih3k0C23e9Vt8SD2ga7/F8FAuhawrMVeE6E?=
 =?iso-8859-1?Q?1BWNNswNBt5Dra2GlZLF1CzQVHnfjDPpKLubf64b5KXbRC5KC9Zmh6xrdh?=
 =?iso-8859-1?Q?YWns/yJYFeB9oW6MJKCGMCRoiDzaVCvpg6lqBDmiheVIFIJyFSAFc2vGNJ?=
 =?iso-8859-1?Q?aCNbNV2DeT5jF5a0tV62QHqczbSOCfjf29wSYJsE65/Eh6lyXrCemp1Nvo?=
 =?iso-8859-1?Q?9Xxy9IF5lDAlyLGtpcCF7zfmrHWbDEjoc06b2cEZFnNc8kCo+y8L9OzOyQ?=
 =?iso-8859-1?Q?I7HXIR+05C1gXZdHljdT6CzJevzshOo2RPLj21VWCJca53cdYDa9+SkBLj?=
 =?iso-8859-1?Q?34gkTq3FdkGk/TnLos09CnrWCcgNa0LhwS77BY1Bttt1OuNQbXDX29E/ve?=
 =?iso-8859-1?Q?PMEjI2RoFQW+K5Te9QYLhpBkWr8uuxI4YuutxjAVZ97oDU54yGUwHHQWFR?=
 =?iso-8859-1?Q?A7rLaDQ8C8AHc/Nb58nqFas1tMkiABxo49fXo9rnm0O6WlXT2bnYqHN4t7?=
 =?iso-8859-1?Q?wC7JOoCQemYP5hdWuyQEa0lFGNrULCOxKCaw3a7d/Ww+grgZaO6LlovwjU?=
 =?iso-8859-1?Q?f+B6k3xZweu8vB6LXJLFPmZGi7wctsKP56y9JSddMV8+xaLsbBU3t0+0RW?=
 =?iso-8859-1?Q?PiaaWnCImi6easODGybjAb9HuTVh3X51A6ZENNokWlBPgR9irdNQQffqHl?=
 =?iso-8859-1?Q?hOL7U4EyitV5DJf7VqGtlgX0UXnloHyJnGgGo/M5D6VWbRTyayyjWXL6Fc?=
 =?iso-8859-1?Q?t/c3VXbzu5/OIVkWsqUYpQGr4xXKvlHJ/mFkzeobsx2w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR03MB9556.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2ejkpldxppts4/sdC+XCNP2L7/aNUTnwwqV6tz4fS5XdlRNrcf/h37NFom?=
 =?iso-8859-1?Q?62rQoHFt+gi2GmhsjzOBijWNJ8Und/egyknXRURQIuB/jUr7NP/SEG5d7/?=
 =?iso-8859-1?Q?GNxHzqoPcnty50zq8W+2DGL0EmgOPqvvUKAC4EFloNmN9aNTZstghGlkvh?=
 =?iso-8859-1?Q?mpNPprmNoEvfaPC0cEdfu9S1EKgJBIIfkLEt1fqgpfHlWt/VOAgqrUOf6P?=
 =?iso-8859-1?Q?Szj7NLa5dm0N7EX5uRv6ZgAJNudVKFrCTkGVsds7WahiWQygVqdxgiWusN?=
 =?iso-8859-1?Q?Cl6zt1JExcOvlXdgW2UBr1FbGhhHBMUmUYuVuEUWeOMjCGjSC3pMWlWZLl?=
 =?iso-8859-1?Q?xuFXt9lj8dynssKJkw3Gr/9dfM+py93/25uHc6EzQUv+fbcIF2ExX3bWyV?=
 =?iso-8859-1?Q?qn1qKvvKNQxTcTErtfokoxEoEYFWEv0PEYuD5zHYVcFfrsQmNvhvMK4UJv?=
 =?iso-8859-1?Q?yQ4GDHHtHno0y6glAyjARM5PupItgZUnKXCN7vY3awdxd6VtgsKROEIwoF?=
 =?iso-8859-1?Q?p2SgI0XDvHoPWOjlBGNXQIhwQbWh25FlVUjQ4MVlyRPe9g4mYsSPDs9FbX?=
 =?iso-8859-1?Q?85PCUzBQtFAdDbZiuKMUkggtR2VDpzbOFbzQ105zld+IZZZkql6QuNGro8?=
 =?iso-8859-1?Q?FZ6x61X99iAYTxJ0Glu9diUqoTKifXF46pePRRz/D8F46snJA6yRXqqT6f?=
 =?iso-8859-1?Q?IBeSEMgdGade2eSttG8XEysNPYmNYlxuwUqAvHR56TaePa4/Wkk9f0GEsE?=
 =?iso-8859-1?Q?ZW8iQSLQcKpPEHfG9O4dvQ1LpoCJWhy/7X0ZZxjdIebu6/hf020O+dhLFB?=
 =?iso-8859-1?Q?YF52wXmEDyx1TyNTZJ7IfCNzAq6C+b5YjbbaU0gcX4gNjfo6dXEES/nqP5?=
 =?iso-8859-1?Q?2PX4RLVGo8GTeT0aCs1CDO6C/GJ1HlfamrH5ihukNFJzjGq2Y07i5xJPkc?=
 =?iso-8859-1?Q?fHn8Ispq6RCB36FMqYFq2UdR2cphD7JuKPxhga8uA3wieZzdmF5Y6c9h2o?=
 =?iso-8859-1?Q?RuM6IjdJtnG+/PVy8Bnk5RBxWfS/4QyOD+wA29MietwER/uyhbQwVCoSW0?=
 =?iso-8859-1?Q?5wOGCf9a9HvUGueMjPsMKmQ30F024RwAzWbM3mYT18UtQPCs2RIFEyyxQA?=
 =?iso-8859-1?Q?WahZSpixc+kUgH/dsQ8dsz7bb7tehwsAszh3Qni7OfTlWnGS5VAkiHgYtK?=
 =?iso-8859-1?Q?THwv1/VNhFOS9OjVrWbQtkSPeeY6LY0a/Gz/JGh+0eA+aKXef3g8hXkAuW?=
 =?iso-8859-1?Q?3FeklnEopCvyzW/SJWcWwuLpEJozFjbUKPPS4mqvBtcI2NQRwUs1OoxoqK?=
 =?iso-8859-1?Q?lniauBq3biJ0lH96XTsoXJubCsbS+YfYkV2hZusC1xDovfAZqjZ/3h+MUP?=
 =?iso-8859-1?Q?yY1V1ia5k2f2R5GEVy7f1KUYg9ej8Lpp3y5o65yrZnLg9W0m217WJldM3i?=
 =?iso-8859-1?Q?1uAQZ0BMpPgdx09blKGfjmaLglQNUz88l46QsiJisoqegUd8WsR6FrsYUH?=
 =?iso-8859-1?Q?xmy0ePUCO29Jhfk7ceuJh2t8VDMgBYQYi7Tgh68NSvM4Woyqw83kM0URkS?=
 =?iso-8859-1?Q?CEgS+rIWwscaydep/EwLT968P/9g6PFnTAAk005E0pONy1FMb5hTCjs0mY?=
 =?iso-8859-1?Q?JnwRJyKCfUtrVdsEDHWAAr17sOniIQUoE2eab0F9XwtUv/NH1Op8BXMA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR03MB9556.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e96787b-1f1f-40f2-e3a6-08ddbf30ebee
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 21:38:19.4001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6d7y4+jpbAgBRDbPIpAxw4EOwqy/xdd1wvLhJRkdqXMwRdFVpE3yo6FJIQ5MvmoKMdLkDHFZ9XVm2l+HhxHI8oqNl8Jd5rBgGFl+AfJmwzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7461

Address a violation of MISRA C:2012 Rule 5.5:
"Identifiers shall be distinct from macro names".

Reports for service MC3A2.R5.5:
xen/include/xen/fdt-domain-build.h: non-compliant parameter 'copy_to_guest'
xen/include/xen/guest_access.h: non-compliant macro 'copy_to_guest'

Rename 'copy_to_guest' function parameter to 'cb' for compliance.
No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/device-tree/domain-build.c | 13 ++++++-------
 xen/include/xen/fdt-domain-build.h    |  4 ++--
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree=
/domain-build.c
index e6d7b8961e..4eea095e49 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -336,7 +336,7 @@ void __init allocate_memory(struct domain *d, struct ke=
rnel_info *kinfo)
 }
=20
 void __init dtb_load(struct kernel_info *kinfo,
-                     copy_to_guest_phys_cb copy_to_guest)
+                     copy_to_guest_phys_cb cb)
 {
     unsigned long left;
=20
@@ -344,9 +344,9 @@ void __init dtb_load(struct kernel_info *kinfo,
            kinfo->d, kinfo->dtb_paddr,
            kinfo->dtb_paddr + fdt_totalsize(kinfo->fdt));
=20
-    left =3D copy_to_guest(kinfo->d, kinfo->dtb_paddr,
-                         kinfo->fdt,
-                         fdt_totalsize(kinfo->fdt));
+    left =3D cb(kinfo->d, kinfo->dtb_paddr,
+              kinfo->fdt,
+              fdt_totalsize(kinfo->fdt));
=20
     if ( left !=3D 0 )
         panic("Unable to copy the DTB to %pd memory (left =3D %lu bytes)\n=
",
@@ -355,7 +355,7 @@ void __init dtb_load(struct kernel_info *kinfo,
 }
=20
 void __init initrd_load(struct kernel_info *kinfo,
-                        copy_to_guest_phys_cb copy_to_guest)
+                        copy_to_guest_phys_cb cb)
 {
     const struct boot_module *mod =3D kinfo->initrd;
     paddr_t load_addr =3D kinfo->initrd_paddr;
@@ -398,8 +398,7 @@ void __init initrd_load(struct kernel_info *kinfo,
     if ( !initrd )
         panic("Unable to map the %pd initrd\n", kinfo->d);
=20
-    res =3D copy_to_guest(kinfo->d, load_addr,
-                        initrd, len);
+    res =3D cb(kinfo->d, load_addr, initrd, len);
     if ( res !=3D 0 )
         panic("Unable to copy the initrd in the %pd memory\n", kinfo->d);
=20
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domai=
n-build.h
index 45981dbec0..3a20623cf5 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -50,10 +50,10 @@ typedef unsigned long (*copy_to_guest_phys_cb)(struct d=
omain *d,
                                                unsigned int len);
=20
 void initrd_load(struct kernel_info *kinfo,
-                 copy_to_guest_phys_cb copy_to_guest);
+                 copy_to_guest_phys_cb cb);
=20
 void dtb_load(struct kernel_info *kinfo,
-              copy_to_guest_phys_cb copy_to_guest);
+              copy_to_guest_phys_cb cb);
=20
 int find_unallocated_memory(const struct kernel_info *kinfo,
                             const struct membanks *mem_banks[],
--=20
2.43.0

