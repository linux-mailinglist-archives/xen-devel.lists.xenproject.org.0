Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0A0A879EC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 10:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949343.1345904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Evh-0001cV-5l; Mon, 14 Apr 2025 08:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949343.1345904; Mon, 14 Apr 2025 08:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Evh-0001Zj-2Y; Mon, 14 Apr 2025 08:12:33 +0000
Received: by outflank-mailman (input) for mailman id 949343;
 Mon, 14 Apr 2025 08:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XA/R=XA=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1u4Evf-0001Za-N7
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 08:12:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20629.outbound.protection.outlook.com
 [2a01:111:f403:2612::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 352da751-1908-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 10:12:29 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB8343.eurprd03.prod.outlook.com (2603:10a6:10:3a4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Mon, 14 Apr
 2025 08:12:26 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 08:12:25 +0000
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
X-Inumbo-ID: 352da751-1908-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bm1Nz2B/kc1OtIud9IGp//wJoeXD8W4L6IAC6Upf0fLXInfe0JFA0j1OmUiXqCt2vbQUoH9DZ0HmFvt1O9xTzLmMFgwKMEIhPsv4Ou1TGL1MjblBATbVw7BMaqTxfwQd03yrlCJhsu2RpP4XThJhJ/POgasuDx5c7kMNUgj6ueF8R93orcSkQUorJbZ/RtXZGHzIImLFueaQ1LOUZi4g/09Z0bU4naFv91YMoQxPGaO/ECflPqywsDlZgKBtchrEjWL7oWFX1w+GWx01zULOTiQWWe5XjOCeL9CSRmIfoM1KedQGWYf3/66kyRhU3ZxkBe+TP5TVpFdiaowWgKzHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjqsOGtN0AX9PhuCyH7NEGIpTjCWtuA4RAzjPTtEQZE=;
 b=wdq9+1/UfFjAXLZi2WFGaLGsT3B6I5BTMQ/vWNGZLg9jqLc1m3MjZ43EJjHp3tPBxj16FT4kWHgQyDH1Bs5F5obyzyW6iXs7IiNreAxKxKc0NqOlPD5xFr4P+BAzz7M//MWKFQjfgEUSBA629WOkKDhQ78uyXtQtOzmqegC8gvNTphvKfg362PD8KvjGV3ACqIb1uzz/gVkGN+aG84uq4XxptyHqLlyxOTNatMBBff19P72J8pnbyzf34FPFHm5qP7OC+7tO76IK43r5YmtejzwVDloVwF+o6EqqySy+enTIpmwxPIQLC7dfKQ0ZJw7zwT8KhOmQ4Tojo1PbB6FXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjqsOGtN0AX9PhuCyH7NEGIpTjCWtuA4RAzjPTtEQZE=;
 b=lYKb0P9M4nu+/bNNubfJKFRxy04wKVDRzcK62FMiNTwFMYS+8Qz8nf1EyJKjeCnfXPRa6lV8IQu3kyW37HMP7UEn4/10rDw0AN6fRRcjXD1xfFTznrP0vlH9pDBXDfr4pwHlB4avSyN1bLgE2CPZWBPnnKDPVb8VO9LA4sRuZPc5yP+oRqrlRnr+cqBuB1MNep1wZKDdf6vgLNYgtq7ivLIdaOoWamxY23z/q4Eaq8vZZw9Pb1bggErIB36Dk8DTmhLQA60lU67zC1aU3L1JkRhyzkjgAcCub6mKsOp0BKv/kTwc3gk9M4L3M64pODKvJLeBAGBVaQuR4GHZJQutiA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [ImageBuilder] uboot-script-gen: fix arm64 xen u-boot image
 generation
Thread-Topic: [ImageBuilder] uboot-script-gen: fix arm64 xen u-boot image
 generation
Thread-Index: AQHbrRT0Xiz3Rqv37EutLWpfpuPiGw==
Date: Mon, 14 Apr 2025 08:12:25 +0000
Message-ID: <20250414081223.1763630-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU0PR03MB8343:EE_
x-ms-office365-filtering-correlation-id: f8bb22bd-13bf-42e1-cbee-08dd7b2c176c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VFz2jeVEpFdczghH1BJsMdR2pXIHhvbrAVfWzSlIcDtkqdxYhcIqSf+ZxN?=
 =?iso-8859-1?Q?pwfUuiKOO6H+Agf8/vrnIjfVDPtzURWLQENidHzTdr232AjXCOlYAaFMmt?=
 =?iso-8859-1?Q?pYYpW/da8gVLr79lo75IhYg+UATPQbfReatvUVKIxM42H6dmsoFGK/nwsH?=
 =?iso-8859-1?Q?XOC5r8Na30fzHIib9rvB30ELUiEteTJmJQ3t36hPeUbWIY0Y2dDqGcSAxf?=
 =?iso-8859-1?Q?K4B6SHfZVsZEttGNd/As75ojRwcZsif2TanaI3cyuLkbuyM3Yq0tJ4cX8u?=
 =?iso-8859-1?Q?8POftkS1cEQ3RDMlrpnE3C2ws3rDNOvf9x3dN8YoQl1LqijqRE5BVfsSmb?=
 =?iso-8859-1?Q?NX/BibeB5PTwtfE/YTYP6o69ttBHoQs+l50KSBSTxJ7Imy4yHvkHDa6UqV?=
 =?iso-8859-1?Q?w7Q6gXQWrnbEljEDcqoVW2sd1ysSEfS8yLOsugQLdG06xBKXpOQZAEGQRG?=
 =?iso-8859-1?Q?fu/KI52c2RAJldItIpPo2SixeU+ecZb/y0frACPoa32/Q9JRI88M9Rd1Ry?=
 =?iso-8859-1?Q?xjWqLEe6dcjcvl95sPijC4xYJCKpZE+JmDfur/9usC9PNzmQVCX9P/7rHY?=
 =?iso-8859-1?Q?IRX+iragGDbDX6Zod9X/DX8VGE+9IBjWSyobjp+YdDhiw+A1MwoALHuKYy?=
 =?iso-8859-1?Q?fP4MRiYZI1K1/QPGAibJ3c2Fp5jfYS+U9mZCi638msCG8JHABr0kJhogpT?=
 =?iso-8859-1?Q?yvGSiYfU00PsIbpuAPdBCfg5419yqUSHKatpdN81vKcURiPT8+ClBtIOW/?=
 =?iso-8859-1?Q?DkGc1ZEy40+Fc0sjGnKu0+1MIkFxpy7oCQPBR6CC+VFQjTLy5c8YCDKcQk?=
 =?iso-8859-1?Q?Yn01wvxejfwnONmy5kau7c0GE8j/adZeBEppQGsXueAXoN2ZGapaQaKtao?=
 =?iso-8859-1?Q?G9Pdw9Mzc+6+KUaegETs7++AsVLl0GvRH26mYDjUpMg9evEGtjD3kn7/kc?=
 =?iso-8859-1?Q?slC5rYpDi3YvKGOvAx/4lJxXoVFPY7nOusD3d/ibQTBcbDXSWAOGs+UcYP?=
 =?iso-8859-1?Q?keyLoYroZVyFiQpwFhR1cQrJaBlXhQvHlt6gIDsczYzLsULzJJDxgchaVS?=
 =?iso-8859-1?Q?ERl8oYEFKEICEMztuy2LLbDaAnL8G2lfnJscP1Hkh/aQ2MV8WccyQNsTx8?=
 =?iso-8859-1?Q?xkhGAOyduJFPrD9CiwGK4gke0S/FhGHGUHS7W8lIXkESATmciRatfgfcdt?=
 =?iso-8859-1?Q?SbqSFTKwPh9uBNS2tx7eN9fySURtJrYCfA5r58/gSC270MzNqyhi2V6Ec4?=
 =?iso-8859-1?Q?tMMbY79sjk8+/je6PIfHKOCvGlStJbtofKDIDkka/ngqUU6QkxUrDlLPe/?=
 =?iso-8859-1?Q?a7iZvHtjTO6HT8F+lZMVKB4DlN7kYaBPPSN0MUjg0ohmMew2psv9y4UHxV?=
 =?iso-8859-1?Q?M3Fd/tSAdfC/cQB0JzsDB5e0zmnAuuImK3Wix3kcvy0wcTqd9akoVYFYoe?=
 =?iso-8859-1?Q?6LteKe3wQNkx05sGe8fRJvWHmArjk9IDBIrtkqWuFjNEtBctfhbgCxhyyt?=
 =?iso-8859-1?Q?uJRonrvzdX+KepOvEI0HfgKn4jf8KkQxOwwcy210enNw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?14b5dxHAxzyqCZDOVxwzb7ztsScNs2TydYe5F5/52M+YsCZHoScA5gbREE?=
 =?iso-8859-1?Q?LwKXD8Jj3M2uGFwLuFfIxE2oC8uH9Yk4A/oM7a4xFpLrVfOQk25VI0IRXh?=
 =?iso-8859-1?Q?pEkj56xx2Yesh7qlfqbY6wJJrDoC2Ckyo/hdyKzm2ZgpHG243f1V5pggBv?=
 =?iso-8859-1?Q?o4jEZl8cQT1UFywYuyLwj9z0ZlwFYdOVRpcXtHcBQT1geriZdGbpylKMNl?=
 =?iso-8859-1?Q?N+3M9mMYe7k3HREY5gTcxOUCnkfEOVE2Hg4EMD+sbuX0zDBtGjHdz2l9m+?=
 =?iso-8859-1?Q?hFGUB18DelKsVR70+IaKyF69aSFbgLopZzfdx5Z/yXnXvwBVL433u3OTdE?=
 =?iso-8859-1?Q?HWTWHvl9h0p/mW3yDOFL68O9vB7gp1Qp33oJjLWqDb47hwdkE7uJdLx3Ny?=
 =?iso-8859-1?Q?RqkwnR2xRcyWAyAsc+dfkBN/sIuZuybVsf3Pro1X9yHFthHK2fYbvtvX/R?=
 =?iso-8859-1?Q?XpswtOhQApb35FIULlsz4AG5kCv+Ee5qpW7o9rek3HFUBsbYRUGmeIr2yO?=
 =?iso-8859-1?Q?GEFBdWT616IzkkX6t3ZMaXcMHNfBoi+MU8HQSoinnxWdMzoMjTNof9GkQX?=
 =?iso-8859-1?Q?c1kgKVHc1BbFTJ0dAjI6c4fJyaBVteC54TcTVRx8ipdPh9BwMUsoAbogef?=
 =?iso-8859-1?Q?eVs+GjHjDk8jEos521vtsj0xykva1xfCZ5PER6e5ITZoCbSOflogyJsIoe?=
 =?iso-8859-1?Q?DECUWV4RH/ToFzlkAQ5HKUV6kPLV7EZKiuCx7BSN1vkKyYxBD/mNPevS/V?=
 =?iso-8859-1?Q?LAcp3prG0J1lZxeYK9Agz9XyHPB3ydQ7dfjrfBu9fz9uh1nkjDxPewYmvZ?=
 =?iso-8859-1?Q?P+DCY2/WwW7RZPiVypEhzvJTiPo7ou5P4GoZ9/Kg/D9ofxXyQ1qzFwJN/3?=
 =?iso-8859-1?Q?6f9erNJrA2HzdX7h9Srt7gHUr7IlJUK+uClRMjxoQYKmMw2sN1qp6eW8h1?=
 =?iso-8859-1?Q?wz5U078/ZEguA6ySeV539is5eVvdLHANgMzXQIaYNiJaqenyJpKzp384DH?=
 =?iso-8859-1?Q?21uFZ+ZEDi5ga0LDU1/ru/zrsdKYe7Vzew8OVimogiGPETAee0MfD/HQC2?=
 =?iso-8859-1?Q?VPg7+6rVNIZ9OS0hEvs/hMG81vMKRZthf9xGYoZKxuhixP9i7U2/xyPV1L?=
 =?iso-8859-1?Q?QND9mvKO/r9xBHjAN4LEMNQCzO7KlB+kK9YUIvuI+Ifdxq0u8CGcikyXUI?=
 =?iso-8859-1?Q?4BeiBrK8BVLAbfUPw2mXvMJcPMVHwSE9mpsXVUulEHy3JdI99Ih1BA6BuV?=
 =?iso-8859-1?Q?+RIsk1ID3Cj7ORxTFjaIZam9x+gK/FFxy99cvkiOf02W8tUti0jRzjx8tq?=
 =?iso-8859-1?Q?mJ6RQCixPduwUOV1GFJ1YkbP/CKuqqo6z7E5RY9WfF1tov2c6RjwTmo/0c?=
 =?iso-8859-1?Q?odrbSSXI/rtHb9wfZ1QLir6M1Ny0RFBZl4tsyJvm+Lryxq8wbadHLv3N9U?=
 =?iso-8859-1?Q?pf0FP2/gWQblrJWxciseaIhkJycBi7TNiTunbuByYvzVVljkBqZGONz22X?=
 =?iso-8859-1?Q?KRxWsJ2IKeJsFu/Qv5s5HI8n3dmUi7VvxnZGIifMys1ixhlYYX8YCXilFZ?=
 =?iso-8859-1?Q?SBvRYoT55ljd2kX6WngHZ4lvJqf2aP5Mgum1Hg25Cd7FEKNCtrVaxA6/2j?=
 =?iso-8859-1?Q?7AQVP7p+CRMlTW5BAfuLU7+Q3dVAJd1saoiOIIFkyaqe+shLb9wcPBRw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bb22bd-13bf-42e1-cbee-08dd7b2c176c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 08:12:25.8095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ECYDlsvUOTmDrHQJLnfdJFBMTkKAvWBOKZOMFfOr27GMrjgbO9L9gsjzvvAkO+fscE57oPqVBtyeavPUgTwUgb+H0H5GvVQBhovStJgpGaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8343

From: Grygorii Strashko <grygorii_strashko@epam.com>

The current code in generate_uboot_images() does not detect arm64 properly
and always generates ARM u-boot image. This causes Xen boot issues.

Fix it by searching for "ARM64" for AArch64 binary detection.

- mkimage -l xen.ub
Before:
Image Type:   ARM Linux Kernel Image (uncompressed)

After:
Image Type:   AArch64 Linux Kernel Image (uncompressed)

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 scripts/uboot-script-gen | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index a9f698f00fd1..c4d26caf5e0e 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -815,13 +815,13 @@ function linux_config()
=20
 generate_uboot_images()
 {
-    local arch=3D$(file -L $XEN | grep "ARM")
+    local arch=3D$(file -L $XEN | grep -o "ARM64")
=20
     if test "$arch"
     then
-        arch=3Darm
-    else
         arch=3Darm64
+    else
+        arch=3Darm
     fi
=20
     mkimage -A $arch -T kernel -C none -a $memaddr -e $memaddr -d $XEN "$X=
EN".ub
--=20
2.34.1

