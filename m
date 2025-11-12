Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31432C5174C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 10:50:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159626.1487939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ7Uo-0004th-Hw; Wed, 12 Nov 2025 09:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159626.1487939; Wed, 12 Nov 2025 09:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ7Uo-0004sC-Eu; Wed, 12 Nov 2025 09:50:34 +0000
Received: by outflank-mailman (input) for mailman id 1159626;
 Wed, 12 Nov 2025 09:50:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8ume=5U=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vJ7Un-0004rx-3w
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 09:50:33 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07490a76-bfad-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 10:50:32 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU0PR03MB9633.eurprd03.prod.outlook.com (2603:10a6:10:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 09:50:25 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::d976:7403:c89d:4677]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::d976:7403:c89d:4677%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 09:50:25 +0000
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
X-Inumbo-ID: 07490a76-bfad-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xr52im+wIrCTj2F1dYqWcglwa5UFWYxWMXvZ0dOACeXQPgdC59stHCaRDTPO0kFOcfOAbB1mfFLff4CsTk7KmXCq/2kB9u49sVQ0Q79R3k6zlKLzbPxcVdMi0jJ547gVQ0PBbbkn1hOojq2WXIKxvhv9Wn2xtjbwuXIuz3QB6wK6l16RPVv0qJ70Vt0yP3c7KqlWvqIpT/huG8SOMr+xY/1zQtRqpik/Sep6/l0WmSumc+S9DZJtv8ADZKj7HEI5cb0A57ZQqmD//qef798qCY1dIJ0sTMg6OBoNz+quFB5mjiaDzc0Psm3Dg+ps1l4EC/3fxNz2Ogl8o6YIuTVfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYHVTZOonjDSkdIOBbIUb9cCFIEfDr58ylOWab5gnlQ=;
 b=O0BqVbyFJDxT3w30P4l5auZOn7ddUuZ0dpA/XsHSeRegxss/xSow1pt2pm3KlDxsDRs8am246GjRoybL1N7PEk3Cp6AFKfaMJesxfHbQDQeIzsVzFRf1nEz1D75iY4/P8C4KYnUwp3e+sOz/P+HS3eBfvwNgCVFFhiyiMdjzUSqS+hSGsWd/AJobXrtwn9EvfNaIfUwIydXbF4JWDxHjhyREU6YKkPNNEeAnQCKHqB9KtQZgxlIItzH3ulr7U0uBNfkkys9JrSn7rh9CbTyPOIQFytP5f+SAnzd9W/3FML0eNMFtp8sX2zk5lfkyusPLEK/+L7QU/4wonAicIvK3CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYHVTZOonjDSkdIOBbIUb9cCFIEfDr58ylOWab5gnlQ=;
 b=qhrLo2MYCA+eedlBwTbbWMYaeDRhinySeUsn8Xm3Q2N+t7lKhoy0V293YJp9/+QrSWcTCHh3aDL5FcUU5j97+PMGHr509gOHgg/4dkWtu98xfQW5yhNo19BriyjHH52+2KeQCKbg/08/nTL6Vekh2YCYDLRyCJh7m2TvnTnPynM7H16mscsqcFjr0XadhwKycEkRBHcnyuD75CkbnPJZXpzveTeBYN+lKMseK0H39+rs1VjiyC8w+Zmwl0+Avna6Lg/IywguBOZiXR/hSy9fDYEH+Chcijm6nzkBcBsVJKS7Il1aIRQqjaHJ79ECmbMuozIuWUuWRPmeYT5IuA43bw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: Use FDT_MAGIC from libfdt instead of local macro
Thread-Topic: [PATCH v2] xen/arm: Use FDT_MAGIC from libfdt instead of local
 macro
Thread-Index: AQHcU7nF1Zr/ErjEH0+gSpDahlo6Lw==
Date: Wed, 12 Nov 2025 09:50:25 +0000
Message-ID:
 <92efc0f0bb286ceeb8788a8900bac9f9f1ed9613.1762940762.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU0PR03MB9633:EE_
x-ms-office365-filtering-correlation-id: 6c833251-bfc7-4e3f-6996-08de21d0e786
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?CBv7GrrGnO4zNVWqYsQaxCN9/2NiaegPKRJEZxI87QQqJfVfoBTN/6THvO?=
 =?iso-8859-1?Q?5Ecmpy4BPlyh9AC2hNrwq49ptMx1aUtYhupmLAjn/ATL7CLgnyNNE1r6SD?=
 =?iso-8859-1?Q?g50J9fZeX1ILLLBsp58CaXXgF3SddMYEgcEimcJjF1Jm1RjkUrHrS7F6TF?=
 =?iso-8859-1?Q?Fh5a9/2OY9zUZ40j40tpvoay4ZPur3liaJ/n75fwDyHseIZgHb/7pHpVz8?=
 =?iso-8859-1?Q?lIk/1Yg6HZiOpNX15iRifuWBCURhFSOVhI8RmPLOj3s2Nh8c24/dUk8BbD?=
 =?iso-8859-1?Q?5upx3/SfQivj1XoRB7TzyfesiWVyqIFdQhP1/UBB0FfDJ94Bcqi4k2areB?=
 =?iso-8859-1?Q?uPVdHoAbAgmPqVy4RcFuxVe1BUWdiJ4jb1xhEIZOaREguWtKqQvf1aV5lt?=
 =?iso-8859-1?Q?Ch6whjx9Wnsegcz16ff+zHRgISjmW+o4sYkLH60NEGvv/B2OZl2PtZdTtf?=
 =?iso-8859-1?Q?PT/a9tFLQqMItwrmpaf+xzwinuTJU0DkZ0LF4MG98E32jKT1coOrwxWPHR?=
 =?iso-8859-1?Q?EV4uqfPBm+ovqbhN6n2mik8UwscApmOoUit0D0Ju4cPwPyfVrt6PlaLT5M?=
 =?iso-8859-1?Q?SvaBfrCnYkyslWbKv4elECNtEgAb2GCm2lb2c4jKXZn00fPDB7d8UrCBt1?=
 =?iso-8859-1?Q?Ysn3SelZm8f/VMuw1ss1/uzcIVPYkwW2uYL+5m+JsdKVyzDKEEBGoJPef3?=
 =?iso-8859-1?Q?289zz1ZFrM1ucELb7rE7S4y2yVvnK4pR5LsiSIo9BjdYiIs77toEZ1rDDv?=
 =?iso-8859-1?Q?0DwYFCtwFHMRdEeqjtEKieddXgNo2kVTelS51up/Ki7yyyACJIqvgbGRoE?=
 =?iso-8859-1?Q?uNe6h9WG1DQWDRrj2tWHfokZ+vNCKwXEkOH1FN8jwWr1SneOGw9IG6sNYl?=
 =?iso-8859-1?Q?9uET5DMYJP6bdbY/z5FGcsbUWWLDI6/eCGNcbSR4lDRd2ocWh/vC4PpX2M?=
 =?iso-8859-1?Q?h5YBuHjMLTFlsAnreVbW4c2an+2YeAwWpPfZ9BK8vyyBxvEl48WF6GLl8g?=
 =?iso-8859-1?Q?A2yUfZo72i4Pk1Bt8w6CR2/a7JDrjWlEGkzbROBqqKY4vVIe9FAI85dS9p?=
 =?iso-8859-1?Q?bCvdRhFABPunFL60tP+ICgyQJ7iQ8ZLusxbf6Su7Hdpr9CH3xF60khDbQI?=
 =?iso-8859-1?Q?TT48H6O6GncB40L0G/0uJLA8rpp78dgRKFeZssSMhFkceFPAbTdFqEZzUH?=
 =?iso-8859-1?Q?dxcuazL1+jvXrioXEWO0a0T78sGwYCznAlPmbeLlJ44c6+wR0wyOnlCocd?=
 =?iso-8859-1?Q?+kQ866cK2O/N+2v+BOL2lmtx4ttmPQGV91X3xgEhqqH3NCKJGcIlXV1qki?=
 =?iso-8859-1?Q?JtuPv/CiOc/otnikZpeSH333NJxG2dUcajujaD4cZANMK59Jfr6t0nUips?=
 =?iso-8859-1?Q?BkJ6cWoJm9V/ZGbnfLTsyQYAyJEAd8dbgR2uX+ULzm1zNcoKa9w5mCrJVr?=
 =?iso-8859-1?Q?DTl2QYDSwDft1Kak02HI9ukJTfWB5tWFDRhS+pEfaUBLId7rfC35KkV8Fv?=
 =?iso-8859-1?Q?wGSu55NgiJ1TR8lH+5WPr9sFtE5VktQNupzOXCJSN+pg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pW3rgblsL1iVfgg5BWKUXDllmoPIzm8S6SZ5vLcQXsrid0nCiOyLd5ZyCp?=
 =?iso-8859-1?Q?FhkyWJdHOtl4Vr7Eor+Nd1VmVxguf3b+n0vsJZjbyGUhaZXUmf8dBSNUXk?=
 =?iso-8859-1?Q?PWLIBA9cmkQ+uCu/HOPwr5GrwhBplXwO1IPmOy746f8XgJjvenHZWZLN9/?=
 =?iso-8859-1?Q?6v4zho3KVyTI6OKmTaLwGsUwsR/m2pkTQki6MCzbmrA8rTpmQS5zDdeTRZ?=
 =?iso-8859-1?Q?bQAZmV/3pQ2+BIkLP8nmhT+VTdaY86Bfo0S7Pd25D0Y4w7fkkbsjnW6c6D?=
 =?iso-8859-1?Q?fcR7KsiwZa9uTVVLeQKjMiB+YtaLaPdY+gaqQlwUGmkvfF/LzUZBT46yht?=
 =?iso-8859-1?Q?la34zoRoqiATPEc4j8D2YOGAaC2o34TRdKVVJ48v3PnIrTwUT9sqHUfkM5?=
 =?iso-8859-1?Q?6n6iU36VD2H2l2UYYxTgidcoZ5UZ6deNeHuOUpi3tGxgUnnxsSoIy9Pu1Z?=
 =?iso-8859-1?Q?kbrZ3N4rpHfP63UrubuBFAt6G75nJ5CwrX6SWRCtB+0WPSGhYlYaWjkatt?=
 =?iso-8859-1?Q?zco5XTNz+e8216gprrO4IbjStEFffnex82cb3VIEBvBZLf6e2GvSWpnGV3?=
 =?iso-8859-1?Q?tmUtPfPkG8SH8Twl+rdVs9Z0fxacybfMhw7Kp0nEiWvu6yjNTFaogp7Jjp?=
 =?iso-8859-1?Q?DLTgN3m9Jy26EVvcEqUCZWmgMfMFQ48k4bCV3i2mKUXZEIuM8jJAUhnaG/?=
 =?iso-8859-1?Q?bukLxl902y3HQZcBXQgjJcta/FIrYEhvOi/JYrfPx/Vcu5HsuLv7fJGUfT?=
 =?iso-8859-1?Q?+2Ar2Cjp15FN29LSUjWyVo4Yk+EHJIzJDUDOm+oFFwmIA9igSdjP7QNG2/?=
 =?iso-8859-1?Q?ufgDtfbSn839lagHS4CMUCXNKxRULdMssMwnH2DZnpw954JExCh1lCkKmS?=
 =?iso-8859-1?Q?H/J9EI5flPshO3xFA3YQaKI8h7MWPcuSUhET7Kyou0S8ZfRhDyKB7Rp7q/?=
 =?iso-8859-1?Q?FyRtbLVm9g9msDSbLhUE+hZW2Iko+DSWcbqF6ywrcqUa0dIU22KS04Jx5i?=
 =?iso-8859-1?Q?8yf63kyI1XZDZM7mpVzKHlAUUDK+FQ6GL9AJT4iDTnfglDesgcIMGgPt/P?=
 =?iso-8859-1?Q?aebysRvLmDPaTS4CmbH868SVh3CjgWmDBZn+PZjFun0bYZzGi6mkC3zxUI?=
 =?iso-8859-1?Q?YApQEHTVbo4QervQXzLeL8OX/60Pqf77o5zXAwXnDjtAN4z77phyMHJNBJ?=
 =?iso-8859-1?Q?1FIoFq0cVWMMR3ZxF6wZ75UV5bR4BnewNc5/TBoG7KN/bYzHJWp7SIK+py?=
 =?iso-8859-1?Q?b8zx3N633YLK6lLo0LmXXh04AOsnrcmAH5K2jUvbxAFaDu6jUqt26y8AQS?=
 =?iso-8859-1?Q?1bWEBfbN+ROb4nxvgTxs7qsLHXntUwPQfoRbdXQl6qIPN3zaVHdi1LdiKa?=
 =?iso-8859-1?Q?FgIzjzN11kAkOxpqcVI5t3f06ThjAOBnPJHv3qv9OzPIPhy+2BZMTfKUkG?=
 =?iso-8859-1?Q?v2aIKuvPoYHp6JVVGUAVeB/j1SK/eBOGm+I9+fxzohuFbYLiI+IJyGflCn?=
 =?iso-8859-1?Q?1250e6Xscwfg9wpRVRl1PGbDeK2Qk4Jd1F3ofdyyB1XUNGFGQh2RvYu2DX?=
 =?iso-8859-1?Q?IyTlvUscbUIpKkFz6IcjeimKRpJb0/imBC+QTjlZDA9MS6A019MnvOV67G?=
 =?iso-8859-1?Q?ofVpDEr4S5LTB34B6hLQjAEGLB4ndX44qFv4ODgJzQKOBL1JxKguwgCw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c833251-bfc7-4e3f-6996-08de21d0e786
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 09:50:25.4153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJQgiIDoDoxI+89xWitArgJu2BbRTlCXnBQLInvsE3qcEGGXDS01s0lJXpdqBy27XXy0jhx99eq/uf5ErP6gRVuLOOqL+RkTRYvNX/Xj1xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9633

Remove the redundant local 'DTB_MAGIC' definition and replace its usage
with the canonical 'FDT_MAGIC' from 'libfdt'.

Amends: 66edeb2e3972 (arm: copy DTB appended to zImage)
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- "Fixes" tag was replaced with "Amends"

Link to v1:
https://patchew.org/Xen/464fb509cc7f66934689d9e2d3a77bf5fcd45c24.1762931200=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 xen/arch/arm/kernel.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 48f4b56d0c..7544fd50a2 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -40,8 +40,6 @@ struct minimal_dtb_header {
     /* There are other fields but we don't use them yet. */
 };
=20
-#define DTB_MAGIC 0xd00dfeedU
-
 static void __init place_modules(struct kernel_info *info,
                                  paddr_t kernbase, paddr_t kernend)
 {
@@ -383,7 +381,7 @@ static int __init kernel_zimage32_probe(struct kernel_i=
nfo *info,
     if ( addr + end - start + sizeof(dtb_hdr) <=3D size )
     {
         copy_from_paddr(&dtb_hdr, addr + end - start, sizeof(dtb_hdr));
-        if (be32_to_cpu(dtb_hdr.magic) =3D=3D DTB_MAGIC) {
+        if (be32_to_cpu(dtb_hdr.magic) =3D=3D FDT_MAGIC) {
             end +=3D be32_to_cpu(dtb_hdr.total_size);
=20
             if ( end > addr + size )
--=20
2.43.0

