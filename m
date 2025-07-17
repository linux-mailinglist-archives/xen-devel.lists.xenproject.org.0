Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B53B08DC7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 15:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046857.1417252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOFQ-00054j-4F; Thu, 17 Jul 2025 13:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046857.1417252; Thu, 17 Jul 2025 13:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOFQ-00052G-1F; Thu, 17 Jul 2025 13:02:04 +0000
Received: by outflank-mailman (input) for mailman id 1046857;
 Thu, 17 Jul 2025 13:02:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HfYL=Z6=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ucOFO-0004rn-Io
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 13:02:02 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a54a447-630e-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 15:02:01 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB8465.eurprd03.prod.outlook.com (2603:10a6:20b:52c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 13:01:58 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 13:01:58 +0000
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
X-Inumbo-ID: 3a54a447-630e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqLax9pudSEG6jgKNxT4DouwyHe+fyd6OpObC//oEAhvOOraYbPIa2xv3zev7IndzJX3j5TOYNWLlh4QJNr26b9cB7IYE7YweHYJTBnIR6tZiuBlLk+gGSzVqqijBn45DWy1/y6v6RLhhcaysbBh/CmJQ/zi7WyH26TptKVih15DIavIXqya/0YyL7fFzuVJRgRWeHcKTompOEL8saXVaMmZzDL1PIk6epEwsqA/csJuDI+X2vWyd6opURL2OC+wmYnoPRogDXPBezWtMOVHmnV8ohVKy4UMsWhnZwj5mYKL80jWEkY3piP2c2/n7q6NRvmAPQJXTnQUhgn7AAFkGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSdGAj+j7HEUTpGACkIL2RDO37zmHteZ1kvBGvrE+lY=;
 b=Zy9RF13iHhjLnnjXg9wz9S/uHEk1iFd9Utztv6aLhEb+9rEsTjaH087piKpVhc0/+vszC6+fkHQCgV6Hp962r3rR23A05lQJ/nMWgNjwWMGq1QSHpOwKiKIuYMGn9XXs/4f8EBRwZ3I0N105LzfHqpy95tRNJX3hBYrxIOt8rUV8vjdf9yGolWdTmsgx6Yk89g1xZVPA2WD4zAsm5ZP+J7iYtQE806WzwijxcKJGhsZNzGr/kSaAH3OxHVTM27iOZz6oZ0sISlKFNr6ajgXg6Xbnd11ZwDs2s+BMgWJDIk3tWi+bDQdLFKbRZbkUpF24EpEOnMUpfYw2DUKoDC3kMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSdGAj+j7HEUTpGACkIL2RDO37zmHteZ1kvBGvrE+lY=;
 b=WnKO911Mvjew9mCtDK+mnwvV0Cp1l58VoJSm4uv6GvysZnzUGo63kC89cn91HUqK/HVy/+YCih0bnIw0wKyYUS/5p6HRg2WgyL+H+hZbmg9eXmaIm5NGNTkgTqKUH5lqa1PTBb0sDxur++eJ7feDmkYCLxgwpAwUqElocROQESkGeyxx/pmk3KSyt1rRen+tU5VqI/VbdUr6RzRO98a+b0rhvSkv1EpQsPDNaSvo4ZO9+vG9IK327WpkW0wlpSwAz16Hh4MfgWZALqXdbzS8rmDcnRTFvH6n8nQ65YpYsEjj1f1eQjrdDuWjIFa7IEK7t/mf/T3BeoI2wa31Z2v5Eg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar
 Halder <ayankuma@amd.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
Thread-Topic: [XEN][PATCH] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
Thread-Index: AQHb9xr6oTct5b0A70W8Vu3/qpQqAw==
Date: Thu, 17 Jul 2025 13:01:57 +0000
Message-ID: <20250717130147.2842159-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS8PR03MB8465:EE_
x-ms-office365-filtering-correlation-id: fbaa6cb9-98d4-4f27-f01f-08ddc5321cfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AURo7WG/4ddPlvRm7/TDEAihYmR/H/UiZzOmZ97uccw1Tlf9HvWxYjqnEc?=
 =?iso-8859-1?Q?uDn0ow70uwRGi9MQa2iQxqxROFIDeLa/MlsCCK/JcjwCbKr/eCOrAz3GzL?=
 =?iso-8859-1?Q?Y1QcPHBiCG1zDrgaZXbDQE/umbcibzDXHM3D41TSJXz1VxdzjHhRRPyiHc?=
 =?iso-8859-1?Q?goTVPbYzWfYlRpxag0pifGpyfpxy5JRjuYHZe9wAcJh0r3+QPRI2WFDQpV?=
 =?iso-8859-1?Q?6R2EMSXJsgAsjjQAeXxMK0lGRiaYa9d2mrwdwi6/KTRd26pOFWyNbAOkJ6?=
 =?iso-8859-1?Q?KKL+OoF1oxLu8IsnICSiL4zYTWHx8vmpuI32PFhhd1dO2XQeYgvvdzVVcG?=
 =?iso-8859-1?Q?9w94RzQx1+/UvSkQGezRveUpXs4rH1hdrae/Nu939ZQHQaKVhotZpFsYIS?=
 =?iso-8859-1?Q?OncjVOoyBOXcyME6KdhuPxloltr0XkpYLv7bXY/rHXWRC2wKYnYTQOwnof?=
 =?iso-8859-1?Q?sXcBYwH6mYFawJpirFn+4ffn5CZ+vOiNngzq+Vz+aEc7ETnG6hzmSTiIqy?=
 =?iso-8859-1?Q?U8hnihKWvPKfOHcS5S46YAkITDOc3l4WKl/JGEbxuE4LY1U9nlIkCC6/S7?=
 =?iso-8859-1?Q?kiRe0vrQgJ4ne/P8WEQtT5WgSRcGMA7ssCkqQQ8kaCIVsb3qrqPMVMU2a0?=
 =?iso-8859-1?Q?EL0AXdoLr2Ffq/W2qYeCj74WN+tTSf1nKL54htRDLXS7ZIlbp6e8i3pcvW?=
 =?iso-8859-1?Q?mVTvcgAYzR7EgH0KW6o73C8gfI8obTdQ30IdjAScU4b/G1NsvBlhQgpMhn?=
 =?iso-8859-1?Q?XOO+SqM+uICNo6CsHc0rGIhVxgoiKctO2NMWEI7Y6lLTkXEEE4rJogz67O?=
 =?iso-8859-1?Q?O4kZkOP9FzBOYHBcIZTeoWORlEauLRtF14AsMWcwGNRKxv24lEXzwph5F3?=
 =?iso-8859-1?Q?paP4XQppRS2/tetKanq2R26go3guU4VBVEoWt2I1cbiiWvslrm0+6hKklr?=
 =?iso-8859-1?Q?PvmM8jZZiafaJ6XHtslau/F/RdESKMYFCP1aXHhGebzuNp+uRsAWXXsBN8?=
 =?iso-8859-1?Q?kBisra60TGLRAVo7sDrt3AX+QXlXi9kwOVyacFZpTBMzNCBAxh1pq9sPGZ?=
 =?iso-8859-1?Q?+jlTveYGLCK2o4/XYDyTZ/PwVG6x8nJq0JLw4VfuMMdpcLqg+xBK+qHK27?=
 =?iso-8859-1?Q?EntzrhJQFBZelHnQy8Wo7TT1bcXvitvVUS3YHUuzlFzfZmVZZkeIyfUqh2?=
 =?iso-8859-1?Q?pFhvhrQiEhyE2TZTs5CiTC4x8lnWKwnKBQRxnL28Ffic26FgbhCrzYTwzM?=
 =?iso-8859-1?Q?VxL1DkmniiZEDJ2FtNaBR1xYsrYw8R5RhUyOS93R6cX3VCqXo2DewfH0Tj?=
 =?iso-8859-1?Q?OhzTVUQ68fN1WXpCOF8tlhkQp6vU035yhb9WmEj6x14VLuC7Bpv1BfKdd2?=
 =?iso-8859-1?Q?Kjc8zhiycGLTuwX5CGo7FCRYiEMBjgcQ/jOC3MwfG1tY5gDpXBMqwuArEe?=
 =?iso-8859-1?Q?87gFVMAxqz6I0umQwv8w6Ef1peONNZCWhVM+iUU2mA0Dn+RaVa8NroidO+?=
 =?iso-8859-1?Q?pMkRX3wbebmiBPLfyv26f7YimtttsTKG2Uf8S6hNjpxw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?H5T7glJg9KOdlVSqOVj50EA85d8ZAceTQWpQ8BLJpDZ7q/4e7ZHwU/bPEd?=
 =?iso-8859-1?Q?opkwcx+lYDaaiPFJPIOyqwL7ESLL6c6iBt8QkITIMrFrlMal2I7ezQ49Ie?=
 =?iso-8859-1?Q?a8GYTD5cv+UU1zloHhnXYX2/+JHZebK3MPxOiBDKMi4q+ruYH3RRprj/Ik?=
 =?iso-8859-1?Q?NCfcZYQzNNH/G2Y0zMnVizlK8GGiKrVy09D7nLJntDx5PKtR5WMJ3Ahgto?=
 =?iso-8859-1?Q?8ZLPMZl1WKRTjIX0txK3iC31p6zj8Ox3ps8Zorx4NKELr1mA+lKTYr2hG6?=
 =?iso-8859-1?Q?HRc1agADjMlg0QhaMiM18n250XOtk1L72IOncXyQj0h/MoMmvrz7EyY3n+?=
 =?iso-8859-1?Q?l0ILf2FkeTbdjYj75Gq4jG+raktWBXe0WunY04CrksanK3DUad1yTLAHYa?=
 =?iso-8859-1?Q?3H3CgOXZAm+zwSxvxpKSuQnPAkDSMslWrQV4PHkZNqEQm+irWYb0QTH80c?=
 =?iso-8859-1?Q?aOM10Ht3Kz8+uNix6rUjgxd5QtErv/6yb0ggYAcbcFvmj9J78R9P0qKLVH?=
 =?iso-8859-1?Q?zf/Pv70KIoq53DLqvJLMxjYYAY4PoFnpubl1GQoVoz2wqXdFZj0D2+Mw8+?=
 =?iso-8859-1?Q?GmcC37V7TNovSFF0Ub73rLonFtM9Wu1U2JBxM9D3Y/I6gast9gfqkwRprb?=
 =?iso-8859-1?Q?bSidZJK2SY+R4Z7nfNsKvbe24cLewHR0AFFlc7ZjPAijjY1JP33FBAA5wV?=
 =?iso-8859-1?Q?+1tfKCaXLVsbideu3irr0WTRX4bWOC5QJ9g2GA6c4dXcmItgWruK60cwZu?=
 =?iso-8859-1?Q?qrjiaeJ4IxFidKyuQXHS9w2VL1AzMXrxoo7KIOMItp1RJ+DV0TtQIdCChs?=
 =?iso-8859-1?Q?3gE+9Rp4CPS0TPY3R13mbU4vKVn+Rj4UQE0wQKLkf4iIpcCKMkOeLP3H7Y?=
 =?iso-8859-1?Q?ihiGjCbsz02uKKV4kuFXA9o8ToPrpOko+zjfZeAmg5f3Cd+CnWDFKu52wb?=
 =?iso-8859-1?Q?e2EzlhGFdhuwvr50TzL58rTqEjYfu1/11s8oct/0rLA+fjrvXttSMLAuwj?=
 =?iso-8859-1?Q?AoiO5u6+78HK2c7NoXrjph6WT/m4uaTcGbIg3p4mBsntsYrpp8WlrGGDuE?=
 =?iso-8859-1?Q?ZBY8zi7i8qufg7/RRwwe4LT4nN20zSkJNa6OT8sSeZvmLF47qK0UYB6TEw?=
 =?iso-8859-1?Q?qRBbigygKydvrjlgOCLxL9bZLiIuYfPRc74wP7ktxIehvBgvhit44W8IHa?=
 =?iso-8859-1?Q?ypf/aZ6yl3Tid0S94e+5LtXAMizUHyKRhQi3PW1b5hnm+adQ//QngW5/au?=
 =?iso-8859-1?Q?wqJ7CIdp88r3wnuXIi0/yfUHWyMCDPV+nXXeG3JQ3j+ONfp5KBtPYfqOsy?=
 =?iso-8859-1?Q?ywvMUCiuGZWE5LvS9LH0yUuFoEkwtLYSwZexDo9Gfa8hPP5IFLNSexxiZu?=
 =?iso-8859-1?Q?GAXW048zjugFQBA6PH2j9K/IMeihYYRXnWUeL/Mno/creY37BJtzFQBXT1?=
 =?iso-8859-1?Q?Fp6naOgfI22ZJBN8geStvd3o/aLOce6ewvt79sB+/Kx9zZjGevDwfyc7lj?=
 =?iso-8859-1?Q?w1FQtxmYbH59rCzNPSmiHcIN9p+7cNEZlOiG/UccvJMVXv09S4Rgo6jB6O?=
 =?iso-8859-1?Q?evFJrnAxuBU0JToQcmJLmjohO4JssfvEmygVFuGvwsjh5wsPCZz21BIHem?=
 =?iso-8859-1?Q?tpvCjEYJvl/7uuR/8OTTH0UjzLexzlAAKvpM9dKWpe396lppCJUEFd6Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbaa6cb9-98d4-4f27-f01f-08ddc5321cfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 13:01:58.1444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SvteJTvMzYQSuwvNz77Eo+48HLwjSp+yT5e42g6kSpVdVfh6QL51IZNUh7T0RpbImsgkp95adgCLJ5K3Dasjqgeh0nQMNyJyt/5ozNsjHTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8465

From: Grygorii Strashko <grygorii_strashko@epam.com>

Enable build time optimization for evtchn_move_pirqs()/send_guest_pirq() on
platforms without PIRQ support by adding compile time check for
!IS_ENABLED(CONFIG_HAS_PIRQ) at the beginning of functions.

This will shrink them to (on Arm64 with -O1):
000000000000264c <send_guest_pirq>:
    264c:	d65f03c0	ret

0000000000004644 <evtchn_move_pirqs>:
    4644:	d65f03c0	ret

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/common/event_channel.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index c8c1bfa615df..ccecdd682dd4 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -975,6 +975,9 @@ void send_guest_pirq(struct domain *d, const struct pir=
q *pirq)
     int port;
     struct evtchn *chn;
=20
+    if (!IS_ENABLED(CONFIG_HAS_PIRQ))
+        return;
+
     /*
      * PV guests: It should not be possible to race with __evtchn_close().=
 The
      *     caller of this function must synchronise with pirq_guest_unbind=
().
@@ -1710,10 +1713,15 @@ void evtchn_destroy_final(struct domain *d)
 void evtchn_move_pirqs(struct vcpu *v)
 {
     struct domain *d =3D v->domain;
-    const cpumask_t *mask =3D cpumask_of(v->processor);
+    const cpumask_t *mask;
     unsigned int port;
     struct evtchn *chn;
=20
+    if (!IS_ENABLED(CONFIG_HAS_PIRQ))
+        return;
+
+    mask =3D cpumask_of(v->processor);
+
     read_lock(&d->event_lock);
     for ( port =3D v->pirq_evtchn_head; port; port =3D chn->u.pirq.next_po=
rt )
     {
--=20
2.34.1

