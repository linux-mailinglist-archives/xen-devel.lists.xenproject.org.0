Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8914FB3C05A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101750.1454726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1gm-0005Hu-1x; Fri, 29 Aug 2025 16:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101750.1454726; Fri, 29 Aug 2025 16:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1gl-0005Es-U2; Fri, 29 Aug 2025 16:10:55 +0000
Received: by outflank-mailman (input) for mailman id 1101750;
 Fri, 29 Aug 2025 16:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1cg-0006O9-5w
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:42 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25fbc72e-84f2-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 18:06:40 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by VI1PR03MB6317.eurprd03.prod.outlook.com (2603:10a6:800:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.26; Fri, 29 Aug
 2025 16:06:38 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:38 +0000
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
X-Inumbo-ID: 25fbc72e-84f2-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DC4T/Np5DHBSTQPp4yWpi4wuBsP9Eh/0QyaZROatPlgZhEeT55qhlPG7ketlYlfudcNT59tG5mB3br1PKQsTOJG0ekCRJucmJ1+R407HHSpn8KsxmGgRbyd4b1E6VlBwutvwyMO5eBoDnlAR5bIxrhQvUchioR1OBzDQ8f1Y2KHrY7n+2cUbegeXuUlpQBgO2OrM7Osqlm4wzAjYC1TDAXymbWumdYjzyp4q/2VEi9YMcl1ywz+HqE1Odgkd7f1BB5FaOaULaDi4Y1o3SaqHhq7yeiAYEw7Ft6+s/lqXn222aieZ7BRNzN45IiHMcDQjd1/nF3yxaUUkK+uEu6qxyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GONSEj8/1mepKECBs7Vda7Viy+ul1d1/au4fjFSO9gg=;
 b=eVIlIk0AM0DcQ9gFDSo4N1KCGeXLX+Ng/tspQQlFeM0vgk0MPZ+xZ+NrDX57787M5gJrI7Ug2fIXUB2Z29eIn4RpZhYVZTOLh1EQQjkuzGt+1oTcH41+ToIvuoQluJ6JAY1n6ZsAq1itPI4oxkx+GTFlCMJMnboAbMdeNAyVVL5JceuHqjhM50Cw04o2V/qfXvibI3F3g36X/320Ke+Ioir98WEO3T4wx3H2WiqlLx7WFlrAfo8J3zU4ZvWJG/Rd572accbFjL4qzEfOQp9njRa8LxQrhe3uPmGfmsscaDuYmiVaXu55DagUjD4Ot8gtMIvnV6b8Rx1ox4cmr/zvFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GONSEj8/1mepKECBs7Vda7Viy+ul1d1/au4fjFSO9gg=;
 b=Z+xpaq6xdOEBSdJoiyeovXB5jpssnTpusHyaAYWYIgzYuZJyL5Tz43Yt6bWIFotKwJDszcg5YYxhiKbqmGdyRfUEcvxqkg2EFcsH+Fo0U25SXJeGlzrBCxfLz0LjTxvoWE9DOhby3/r3c371kD14inGe/bQUzCOXV8Cc0VqmFpiS1naudSXyN0ZwEFwupsH5C0O2iuz2CRYs3VXYrCLK8phtIlUuVnQPiP9e8YaLuHZ4+sfrdH4X7sDB1DbpuYtBolCNGw2q4dGJJj/jX/Dl1VLcyDux+xxRmI3GEwGrJl29aeg+I2vHKe8vEzjObzkWCnKg/sHBo0+0oJsViKDsOg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 11/12] doc/man: update description for nr_spis with eSPI
Thread-Topic: [PATCH v5 11/12] doc/man: update description for nr_spis with
 eSPI
Thread-Index: AQHcGP7m6ftj+OqxyUm3COIAuPKuog==
Date: Fri, 29 Aug 2025 16:06:38 +0000
Message-ID:
 <e388d273ea64c8665a96cc5be3f507da35ea23f8.1756481577.git.leonid_komarianskyi@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756481577.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR03MB8676:EE_|VI1PR03MB6317:EE_
x-ms-office365-filtering-correlation-id: 837c6ec8-223a-4eee-513a-08dde716090e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?nD9RSJ64wIPpdcxF2+eCkg3yKLoAeZ+CXsGGfKyDrukqzGJOnGCGcBdxPW?=
 =?iso-8859-1?Q?EsEN5nQ3ecS8A9svRkMEFKZsPJzvWROJ009Y18FV+2SnjwFNfzHna8E1TD?=
 =?iso-8859-1?Q?Pdy8kyZ8nFK4EqW9mj0DWQ2fK/zS/X4jU1YvYjn7ZsJPHXy9fZMzLcGSic?=
 =?iso-8859-1?Q?MxbNRdFrEcxcwNyaJoBIkv2O+lZ67s3w72zExFxXSYuOImHTXpmW9qf2o/?=
 =?iso-8859-1?Q?txqU5or7glVwfKMxYojKLRHyGD9VfDLnB6Z3J4L82vVYnozRJQIiMlIjNd?=
 =?iso-8859-1?Q?hSqTV04raWJLuN0Gw4+zVXphgf5uVeNbTL4um9b7l96R1pTjZ1ePpo+APJ?=
 =?iso-8859-1?Q?yyHe//MSiy8PTd6ThJcur7S9XmPl4vsmXb8A/n+mbjNYgouch3mzNLaq4g?=
 =?iso-8859-1?Q?TPP2G2l4z0EulQ2CKQPuqt+4b2LWfUvGbg/rgLhS1WIXosCXOyl/pZRmyL?=
 =?iso-8859-1?Q?bimHY6dkVsUMpynxSQk+TdpqQFPvn9Bxbd3qaNNRoNJ3m5PdQG37N3wdli?=
 =?iso-8859-1?Q?IXEEK8OsnEbaz/x+EIwENLdNFcHwTifiPwQmthtRbhxjWmpAMGBzH5HViZ?=
 =?iso-8859-1?Q?rzajvR3C/qKmqAFbR9UzwTtYBCSidX3tNszZ5NauLrRTFWVozax8vPrUnb?=
 =?iso-8859-1?Q?bYtA0OFxanaKyjKSvKLH3vBt9dFAS/J6X0SZSX8yApNX/vIgb2PBbZfTyp?=
 =?iso-8859-1?Q?JuAyidjozxzVw93nj2OgDH2QM0zrfIq7ElXNN/4Voilvu8a9F7tKWIVlsa?=
 =?iso-8859-1?Q?5GkfDWHEXX5mam+vMJPoz2qyJWwERV1GbeOcnIy8swdC6cxsIi2CgfG60i?=
 =?iso-8859-1?Q?eb5kFTLXZaaxRnHHPCPOwyBMfdI7sjc1u86vtolR3Mn6kfIfsWU4OSEzkr?=
 =?iso-8859-1?Q?Jk96RhaVEPFYqYiuMZJIEBUpbGbjY3bhmE3HBRk9YH1+2a1LGBvRSIOa+4?=
 =?iso-8859-1?Q?CfZnJVTd6fw3jvAv96WtapPPLfOjBXWSqhN6BUNY5aCDm+wFXBxGMMaiNR?=
 =?iso-8859-1?Q?MMOoc6GPgwAlhcJeUbtGHFJ34I4l+vysmeV97BbtS+mOu3e1137q+9EJ/g?=
 =?iso-8859-1?Q?qUaqhvPxmoivd1Fv4XN0BWOGhUP+7FX2wwedRatN6RgN7jtKAYGQRgNLKf?=
 =?iso-8859-1?Q?i4ZCt4YSTw1ujoZ+MHrRSixabunfAKhawUMth25Pat2ePoFTAfv1qMMPCA?=
 =?iso-8859-1?Q?jbZdHbHbSAVL/+Q6KZ/1MwG20iuGLPySd6xfVkayyPsYT6+1WlHqdYqh2V?=
 =?iso-8859-1?Q?8T0mIc1+5GduwetAJvXFlN538pxOoQbERxlfSDk2Ey2Vcv7ilv8pEKjM65?=
 =?iso-8859-1?Q?Cg5DKiT4VZP/vSrOtTUll8Z8R9pAby4MvtnV/6QWMmW/4jEZdBciSj1JB0?=
 =?iso-8859-1?Q?tH6Lu63MtqQLQYcli/ps1rYvKPmNzD1trgWSZGYGfPBL2KgCklAOBTkaBQ?=
 =?iso-8859-1?Q?xl+7+nnk7Nm7T20oIr0Sk+3aGjs0uf99VTXJsBjYx4o33ID4MagOGkAh2G?=
 =?iso-8859-1?Q?HWMrR67ZYldsO6j61JMHd1dF3RDZGdauqK7aHEmggZfalss0fbtx8S7/c2?=
 =?iso-8859-1?Q?magr7Is=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?r2LY0Ne3Ke0bnj5ZBhu06+wA27wmAJvX9+WQKyzyOfxO1uNQNdxjoeCm8l?=
 =?iso-8859-1?Q?YrzMYUs6+vR9u1sAHYKo/6y+Rp/8ke68dHC2gkRrBsw5la4xXQxdMn1zJG?=
 =?iso-8859-1?Q?D88ep9iSBT6muXrV2QSduDnlJeTlERgjqquslE9rQ5DLPcprWCRr8xb0oa?=
 =?iso-8859-1?Q?sru1AXmVYq8uDit51e3KNd25u975rSt1xVSvVWcLK4Ks4CR6LjNGqmbwZf?=
 =?iso-8859-1?Q?CKEJjovt0LeyMi/c40WiI48sk648n2Aei74u3FGv9/7W7ZYQDthERFuu4n?=
 =?iso-8859-1?Q?ozD06i/Y8fmlk//OKwXvQRDl9vUBad8+ectDPZTif22KADW6FxKRB3bXrE?=
 =?iso-8859-1?Q?19ksjQBBbhZiRk0iFMfxI9T9Fbgm0EY5lankf008v92lsHrREdMgJHmvZC?=
 =?iso-8859-1?Q?sKRUwp2+VhVIZ4vvEzxcUx5vZ/ZVhuwJ8HiwJYSVwfRq3RFTEOf5AjLxRO?=
 =?iso-8859-1?Q?3v4AtSZeju9vTwVB30djmzdvTcjCW/F4a3wFdX6fr/Jifwyp7TtiaMEfHh?=
 =?iso-8859-1?Q?zKL3wm9i76DHOFVx1juWoqvZxtijD3qXJekTUdp3NAPpdKPSK/xeRpjd8+?=
 =?iso-8859-1?Q?LOxSdIq3qTEj7fzE8uxeoxOyLliPkZS6RqGEO/Qh9Asm+Wu4ykZdAEK17z?=
 =?iso-8859-1?Q?buv1Ap7QHdK2whPnm2I+0ztaUY1mZ1iweHL0GqeWgWRu050UpUXIrVwBo/?=
 =?iso-8859-1?Q?SLVUIByvDMARt/WC4F6JZMBwRR3yH5mELW0OvhF6N0tE3hISAGWtDQTRhE?=
 =?iso-8859-1?Q?ng7BdU7h2jI8mjcy+g02lsOdROMcqphF8hjkx947kgZEAekVjqmNT2W7nQ?=
 =?iso-8859-1?Q?QUikGOwFoRtNfSGdZEQWcmoAlj5+X3bPqwe1oJjZHAYlYwQmKFJvuI4lUH?=
 =?iso-8859-1?Q?GPEk4sz0h6R3s1o+9IvvErX6WwjoiHCbIpQADZazwW4ToSqelnfylwAPIh?=
 =?iso-8859-1?Q?lVETxi3mdM0V88Sk78YDb1QXPmVIxvSIcJxQ/NGYby8xTlFLG26dM/7N4Y?=
 =?iso-8859-1?Q?3CMXbg60YiILDlKw63No7nORZaeisSDRpuU3YeTYL3XQawiOg2Bk7M4qmt?=
 =?iso-8859-1?Q?9Sc55vsCiNhH4d0Ck8aIiRrHadxtgnozR5+taE9E2e/Zu3bp/1XVoskdGS?=
 =?iso-8859-1?Q?bh1TxmqSTdTlBcFgG108akmUi6ItEWnBWwnvyRmYlWwBd9or9tPDZFGkg+?=
 =?iso-8859-1?Q?arJfovWyS6+JBCbUEoHyW4talNQLAxuTT8TRRmPEDMEd/us5cXjJhLnRbe?=
 =?iso-8859-1?Q?RYHv5WWTeXJdRkU4Bd5/iGzEe1jmQHwD8ZdT7dXllsb9G/o0TCNCJ1gqjM?=
 =?iso-8859-1?Q?ttxk/Qa0bGQpjgRFUbZFml/k8nKI9AIk8tCL5GAMx6R6YZMsGx4d863bev?=
 =?iso-8859-1?Q?6JBSKegOt0aZPCVYMHpjb8KjrAo6C2tBhM6tpPXEvMYJ0S9QQgrjR/eiAk?=
 =?iso-8859-1?Q?CqiimeNWunYzxkGHKjOiirW96olL2iz9m25wPD1YgHjI4WQOU8GfBeEU1I?=
 =?iso-8859-1?Q?qc4MWJB2VtUOadk2a3IjCQ5caueHWo5ovzMoVy9eXCZ6qqqUCPSwGeICAK?=
 =?iso-8859-1?Q?IUFhtifNBA7ryAFaC2RabsM8YZrSe556ClYtaBHaNWSDFiLQuvXPrNqD6/?=
 =?iso-8859-1?Q?gTsCiCGVF6gutWshDlz3JQHv2LA65J7rfWOGHERGcMh6AVwx+aAfgxoWpU?=
 =?iso-8859-1?Q?2pQzJuSGOEyINMSc6BE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837c6ec8-223a-4eee-513a-08dde716090e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:38.3525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8ap13roLu7tvyhIcF73hHipO+WOpO0aNC8YjB2Ho4jZZAp3Lq0niChFFzYxUlY4gbkXuA9OXlQY6wAj/feU9NTg7IF2El3JPWfb7BE8G0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6317

Since eSPI support has been introduced, update the documentation with
the appropriate description.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
The discussion is ongoing and can be addressed in V5.
Clarification is needed from the maintainers.
Link:
- https://lore.kernel.org/xen-devel/87y0r4z717.fsf@epam.com/

Changes in V5:
- no changes

Changes in V4:
- introduced this patch
---
 docs/man/xl.cfg.5.pod.in | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 5362fb0e9a..292ab10331 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3072,11 +3072,14 @@ interval of colors (such as "0-4").
 =3Ditem B<nr_spis=3D"NR_SPIS">
=20
 An optional integer parameter specifying the number of SPIs (Shared
-Peripheral Interrupts) to allocate for the domain. Max is 960 SPIs. If
-the `nr_spis` parameter is not specified, the value calculated by the tool=
stack
-will be used for the domain. Otherwise, the value specified by the `nr_spi=
s`
-parameter will be used. The number of SPIs should match the highest interr=
upt
-ID that will be assigned to the domain.
+Peripheral Interrupts) to allocate for the domain. Max is 960 for regular =
SPIs
+or 5088 for eSPIs (Extended SPIs). The eSPIs includes an additional 1024 S=
PIs
+from the eSPI range (4096 to 5119) if the hardware supports extended SPIs
+(GICv3.1+) and CONFIG_GICV3_ESPI is enabled. If the `nr_spis` parameter is=
 not
+specified, the value calculated by the toolstack will be used for the doma=
in.
+Otherwise, the value specified by the `nr_spis` parameter will be used. Th=
e
+number of SPIs should match the highest interrupt ID that will be assigned=
 to
+the domain.
=20
 =3Ditem B<trap_unmapped_accesses=3DBOOLEAN>
=20
--=20
2.34.1

