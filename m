Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DBEC46167
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 12:00:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158257.1486621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIPcU-00031d-PM; Mon, 10 Nov 2025 10:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158257.1486621; Mon, 10 Nov 2025 10:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIPcU-0002yc-LU; Mon, 10 Nov 2025 10:59:34 +0000
Received: by outflank-mailman (input) for mailman id 1158257;
 Mon, 10 Nov 2025 10:59:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EGxd=5S=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vIPcS-0002yW-JW
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 10:59:32 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5561bc06-be24-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 11:59:31 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAXPR03MB8276.eurprd03.prod.outlook.com (2603:10a6:102:23f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 10:59:29 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::d976:7403:c89d:4677]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::d976:7403:c89d:4677%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 10:59:29 +0000
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
X-Inumbo-ID: 5561bc06-be24-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBxcM52Du91//d+df0q/FSY6SiHD2gwjtwaPblXzVyv/we9wWgAuC/SaMsMUuM58DhxuESpZI+9ygyVuzbK/1LDXuHRs654h75jZxEEQPFalFxzjAFMnAopf94YI+2m5ZuK4jjKHXQuEMUeHDRHX2kDgHB65NdKjyzfdzd/IWqamdgPtjGTwq+a6JluJ4VRtOmVuM3wmDAV6nr7RjQVYcDZqQevinlhAAM96Jm3qkRYbtBXTBYlO9wfSMVziN0ZOGLUh9tcTIS5/2vZB+zvcdS/59ozAGa+s3TIm5f6jR2ogkAdD/BxYCrTgDM5iADb/pyj8rlCNbyTQZXQAREBJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVmkuwZAOk2BI3BVRgitWWF9v+5Te2hQ+t8u3r847dg=;
 b=zDi0AhmxYxAaICkFSx/EUPTL0pts8O0b0VNpW9EsPK+qJ1s7G/b6ZR0/FqHp/kVBK+052tQKjnPIiOlRAz9PyR1XSui2c+XSs/9+1LtPCu6h+9TqlDwSTwTLVOXkUnLE/XxNax3scCkDNOyNvRhWzGGAq1tyNjFmR6TC3XCV1t/pBfE+gVidARewx0C51qWg8CwNgjCCuaFjfYDPEa/10LgXQzltEoabwBlt9PL9jO0wHy3nRdxN4oAJvQj2vWS7LJY9UO3Qoa4RM2xi0fv41CkWgzxGEc2ZRilij1sZ4/9nEjEIzS6lQ/2m8UejV7cR+4eKoXpxr4pumXIooMao5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVmkuwZAOk2BI3BVRgitWWF9v+5Te2hQ+t8u3r847dg=;
 b=rgbyatSR/Qy75yvr1JPVuDWDC5qHFsKvdufd4s8dvwl1fWRQRMpz3JwKcOxNi39QF5JE9WvnfQvEcET2kJUEMU4Hb6lyBfeX+nIBW5P1YlNc8WZIAxyqFIU5vifdaTN4+p1/fO/ttKyOdWDFXBEwyIei7sp8Dt0tFEfpKTCmgXVu2ShAfXWPfrG/ddpFub8umNieDTRZccv49YNE4DXWXpjM8X4KCfR5DAWip+0+/ksZLLh8NVZZSpzOInhB13qB4zslKud+96c+H36rXTp6gI1e/3J8GG5wNUlvgMGHSj1vfk50IsG+Q+Ch5yzDQ7Th0wGGuKx0VZnBWj8/1o7D4w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] dom0less: Remove redundant magic check in
 'check_partial_fdt()'
Thread-Topic: [PATCH] dom0less: Remove redundant magic check in
 'check_partial_fdt()'
Thread-Index: AQHcUjEWFoN+6Y8Er0i5/VElc9NTMg==
Date: Mon, 10 Nov 2025 10:59:29 +0000
Message-ID:
 <f624c6fd2e63ce92d764519922ec5cf39152fa91.1762772330.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PAXPR03MB8276:EE_
x-ms-office365-filtering-correlation-id: 0006bf11-de25-451b-6c60-08de20483897
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3X3Wt18PCyqRyMYmtuH5DqWuOATrXD+J8ifX/9TXJkIu4rOAukLW4OGDCc?=
 =?iso-8859-1?Q?gnsUf2McRL4hjp7Yr7oz8h3feK+PQwZt/AHzrWquUvR8QwGI0zHCcqq7eH?=
 =?iso-8859-1?Q?7w/lYoXPHiLV3rFfRTsX+44yhL6WWpwbE19IC5UgD2LC/9e0wGveSGK3Y7?=
 =?iso-8859-1?Q?jkCSMzD/TXFKfQ02oMnRBY2JERpcEpEWotsA25OE2rHB7uXXK2HD0VgSar?=
 =?iso-8859-1?Q?SJNWjZwcjoefnDxJ9J5hkmzu7rXVQng8mlqf3qjyExOA9pdYdp3fzEgTAR?=
 =?iso-8859-1?Q?4yogqvLC0uWPtTZxTqCdgqJaEV+9DMr/xYE8uKYEKtI0qTjFfwbGEpAsap?=
 =?iso-8859-1?Q?5qjK3pBztcgwix+3A/GA0oGbz+yget9rAFTeVFJrBBRI806n18I31e1iR8?=
 =?iso-8859-1?Q?S+Lz8IS4ywgXHchsIVPyzDssT3MZ8CvCPCh1Myy6wxzlFtFB2NSZrG9952?=
 =?iso-8859-1?Q?YiQeQGTiBgPobuBLQdH/dzDnNq7i10sIWkQIAXH/XTVwr8bkAGKHv4xEWC?=
 =?iso-8859-1?Q?6fGvjeufUVVxZtao0Yqhtghz21Oft8NRrmjEliUZi3E9evAXXXfprSTHzf?=
 =?iso-8859-1?Q?RixkgOfnz+ww+qwn/QXrChO3GK+/GvHQTnaa4eqmxJREKakv5ut4c7lfo1?=
 =?iso-8859-1?Q?37kYTMJHevC31Egb7ylR1hcgqLsM7s59hPMYKTerntvFIO5OaF5xgCyYIN?=
 =?iso-8859-1?Q?XCMiZfqI3ZD6O2SrHB7ctt70aKLXZk8XGlXyv9wy8miaWnEYWw03jr5X9z?=
 =?iso-8859-1?Q?9zbDbY9qUJWJlJzHoTrk99VCIVurV9fVwyu2YK1q4Cl5jeqodGowXTxGuh?=
 =?iso-8859-1?Q?kwVXlnT/eDVW2pC5i4hXwLlXG6WdUKKrzrl6ZgHnaRU8zfYhST1JHWUpfc?=
 =?iso-8859-1?Q?z/y9wEND65ru97nQwa1qZlTKMUo2bZ5DCkZBpGWmY+hc5Wx0T/7ULSsyth?=
 =?iso-8859-1?Q?s4qVX2XrSJ5TtOiWR7F7M0zb/rf64CQeP2S5WYlG9RhIUcJs14K92RBGt6?=
 =?iso-8859-1?Q?q7X9vycU7qjEeFIs+yaVNawlRtXMjEYHZQYotwaw0YNiiZQ6mCBQ3E1WPE?=
 =?iso-8859-1?Q?gr+lqhtlVDcr75Q17x24mZ3jLDFp4ihky8/LG9ivR24tLcM8saGd0ErO1I?=
 =?iso-8859-1?Q?5J9pGOuynb2QrYBPIJeScMt4LefG7WjcCi85q2rr4HnhrgF/BJSYocqrRf?=
 =?iso-8859-1?Q?bc8K4SWf6Ti4yD/e8wH1XSlA9WkmP7yHv7XUrbLRBwFnrCFzQf52WkkD5g?=
 =?iso-8859-1?Q?aKqdr0SoW1FDjYUYQ2WqPixrDsBWYymX2MoDMF7mTkzaYnazTSmuPNuEXb?=
 =?iso-8859-1?Q?sil0xSVZXMdm2WWN+OZXhJ/Y4pSZButxHUrvBG1c2JrjrVbXFFMFoTwftP?=
 =?iso-8859-1?Q?BOcAZUSXE35NQGIUBKdfWCx1B3Z+maUO05h+NvaOyChtdqnU/z9FUif/kM?=
 =?iso-8859-1?Q?CS2DHwFZXQdOkt7xmHQvZYalMYsmQ8VoCyG0giqmdzoj2Z+GbSbnaOqyfu?=
 =?iso-8859-1?Q?q4LSaZUoXr3h1Kb5CEWTr83MVgtZntmDzZukzQyOfZj1QPZSLvFHJzR/CY?=
 =?iso-8859-1?Q?GjKaikizwVG6RKjDyf9YTKAtG+jU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GYavnNhXUhyCDPhzhh5misL8c4nOBmKnQMk70uKUKENogFxr6IvCcN6jcN?=
 =?iso-8859-1?Q?gfMQ8ZWPaoD/f8nt5wjPH0oYeQPcnAXrnhouhmfD5o3lMsBpiYk4NaZNkv?=
 =?iso-8859-1?Q?ZUQLbbdsaZ82a8+u+bOyYLJ8BS3HP8c/5UxN3hLNDXUzvGnmYCi73hroF4?=
 =?iso-8859-1?Q?UjBN0NjVgazUfp7R2t3yyXRfKDhp0GbPJ7tuPG+KGj7jRS+ayMv9E47uYL?=
 =?iso-8859-1?Q?IAw2ryorPCubQU/PgZqcjh1mvd+fNl1IfeSgG1CttKczN1uLweMx8HNjXS?=
 =?iso-8859-1?Q?Pi0JQ7+8oXLPTc9kjS2sF42rc3OcP1pR1VcoHoYJKLig6r2DodjpuitSXy?=
 =?iso-8859-1?Q?52ygWMzCuDPVOcs9LL+OnvqBu5BI78pa38S6P0OM4wzRGK5Hj8YQfQ25LA?=
 =?iso-8859-1?Q?briRexhxgL90q0g3c4ZzcVhELcyfwD9ytIKW7yTKPC7uoduKtNh5hDv9zt?=
 =?iso-8859-1?Q?wyV5BZKYozSIKE2NLVb+SIiNWK8cufTypvb9x9n5xm9m8ji/S12NDZANH8?=
 =?iso-8859-1?Q?1ReFK+y98U9m7A9Lz1G0Baqx7RFuug9hRmrm4PsKmI4yqwSdaD2e4qVLZp?=
 =?iso-8859-1?Q?eelSvfqYe1XhEGkassP2oM9ctpv81d1h73E3K9QJ0tFrFApDSLpNBmENjV?=
 =?iso-8859-1?Q?fha30k4BRFdyB/SvujSe94r0uLeviHHu1uJYdfNSaOioNMI2dgAtsY95R/?=
 =?iso-8859-1?Q?L7Zln/hormpNNvvY82BWh6yLd9cN9WPxPAq4PV+rMUD7bD+NbLmkUF2ZXa?=
 =?iso-8859-1?Q?zqj+bwjXDYbDvsfRQd1uVq+e6nF+icl3on26+scLrZrJi+rt/+nOlw+SN7?=
 =?iso-8859-1?Q?L04AQPLmKbKAr6OVsd5Jv49Oz+fCd5NXiOaJixHIsWjefvx2Z82MOKw8XV?=
 =?iso-8859-1?Q?mq+9/yeHMJo52ksCvSDDxmfZlltoJ4BOpP4L5+PoOzsutouKyMzsYvNZ6W?=
 =?iso-8859-1?Q?ZSuDi2/06mCUKW0cXDBqRt8QrNraiPGW5h/p0ugtf+M8cBwS1pMlUqwJOF?=
 =?iso-8859-1?Q?UwpK6cQwQAPrZrfc5lkNHbI1eursnjQI9iNLdvy762/LmDelZwg70oq6rg?=
 =?iso-8859-1?Q?k4JySD5vanOtl3Hr7K6pRoLEZNURhfMpkxuB5+z2bhjv6sCWR1w1TCmw9H?=
 =?iso-8859-1?Q?pfP097czwZiHh2UP7OwyJBs/OFUq8HH+ZqSmvovsktQhkDu3aGisQtmWC+?=
 =?iso-8859-1?Q?pbBuxYyqHTHsVr1ieW6jcrhyfBP7opNVWiMm3jGoKsjFt6QIMW99fde96Z?=
 =?iso-8859-1?Q?DUb5HGWAabU0Bi/E27z2PErrJVL+xWYhjvaa7bgkDq727kfdAQoq0LFoU3?=
 =?iso-8859-1?Q?h6thPkNrkSzWoAO4AP1DxojhOiw0URAn/8RKjuMshlSY80SwDMG7pg9rDX?=
 =?iso-8859-1?Q?hz3YP1DEEnHputr0vweI3Ir7cN9ZmmKxrfdhMAE6wFnqHBA/3igQw4R52H?=
 =?iso-8859-1?Q?Y00inG6ARbNXI38tWmlCyzcRpNLfYSyMAur4ymri0F5IveC0z4Td7ia/nZ?=
 =?iso-8859-1?Q?tP68YXsiGRziaFuJyPohuJEsmFt1ZEfJRuLCliGTPHTUxfNkMI6Z6B1JLr?=
 =?iso-8859-1?Q?gEhwwfjtZlmLHhtYJsftRPfN/veq/w5L6hHAntxVzGAOk0/I7stWgNNhn/?=
 =?iso-8859-1?Q?+AHWGxgBB405Esl2mlm6OuqooHQDEL/x6BcKjYMyNDrHswhDZYZ2LI8w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0006bf11-de25-451b-6c60-08de20483897
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 10:59:29.1925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WtmDtjKpPezHOsQQ73fki7DhaWPCOUdrSRA8gh3jcyNhVi01+QUdZeMhMb5HeXS+NEXCyDL5uct+TM+a3XdZVXuqu6xV+N4KYyI3HBfaxgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8276

The function 'check_partial_fdt()' performs an explicit check for the FDT
magic number (FDT_MAGIC) before calling 'fdt_check_header(). This check is
redundant, because 'fdt_check_header()' includes checking the magic number.

Remove the redundant check to simplify the code and rely on the library
function to perform header validation.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/common/device-tree/dom0less-build.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 9fd004c42a..2600350a3c 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -359,12 +359,6 @@ static int __init check_partial_fdt(void *pfdt, size_t=
 size)
 {
     int res;
=20
-    if ( fdt_magic(pfdt) !=3D FDT_MAGIC )
-    {
-        dprintk(XENLOG_ERR, "Partial FDT is not a valid Flat Device Tree")=
;
-        return -EINVAL;
-    }
-
     res =3D fdt_check_header(pfdt);
     if ( res )
     {
--=20
2.43.0

