Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5356CA9479
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 21:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179434.1502947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRcXt-0006vV-Gg; Fri, 05 Dec 2025 20:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179434.1502947; Fri, 05 Dec 2025 20:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRcXt-0006tw-DB; Fri, 05 Dec 2025 20:36:53 +0000
Received: by outflank-mailman (input) for mailman id 1179434;
 Fri, 05 Dec 2025 20:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rowU=6L=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vRcXr-0006OM-FJ
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 20:36:51 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fe9e26e-d21a-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 21:36:49 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by AM7PR03MB6182.eurprd03.prod.outlook.com (2603:10a6:20b:140::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 20:36:48 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 20:36:48 +0000
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
X-Inumbo-ID: 1fe9e26e-d21a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCrHIOy3HrLam35iH975ZHj+8/ZCuNbaUj8XMlwE4C5U/2ZQAv4GkLx63ZEvkAriM0rDqavaK/cuVLO3aUdqbltMAaE7a0/XgIlzwb6wgAtF4DRyO4XqfytzeGpo5M0I/e/Vto3dkk2UJM8XatMiWbCKLWXzoJly6Hno45XGLwr6SkqMZ28vVMLVqIpROL94j5hu0EjPU1eCAoDWr1bKhAgqglXVoQSuZHsbfcvIJMXDp3M8XiTMRL1STH/cwdjIJOpXkcWyDaxuepBL9cdh4v5vLLbiO3fU7W1SO2Bvpi7KEHdUr58y/tYLu/bw/PxMljDCJHByeCRM4hgZxeUHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lB6qJppX2KWYBujGwJWemEjd9Q9RzSskT3pkFV3zoUc=;
 b=ZYOsj/o++7WIe+A1ctbfuq3nV7z0J+EutwFjnUUmcJ3NMCqVuUMxaHaPSSejYl/Vrm3g4m7MPZLNLfoojKZusND7hcQc/86fw/v4ERA+JGKOsU2poiT+GueuqHL/ihoSyTN8AthThJ1DZyqfEvVjEld2zX3ohj/88BoBUAHMKCFEwpl30o4pRgAcHN+NYe3GZUQzy/1DBt1zIAKeQdmbQFmXpZr2IJ1blLCShSyDzxCc5u3wYB8Crp6hqndLJaZ31H1Kx5bseGZh2GBPWAauRQLgqnOmm3eXt0X4sa6FQvMbid+EtBezIGBRRd55Hb0emGmxWdl6sNcHrQ18GJIhVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lB6qJppX2KWYBujGwJWemEjd9Q9RzSskT3pkFV3zoUc=;
 b=MvBohx52GHY0ppaLrtAaaDJAmRE0QaL3Vqzvko7Z0mA/0SMDOzlOgQylY674yHqDkrUwbnGP3OzGMcxuCKB4KvhzucaQSm6B2zIwPqDeZ4ZIs61ecMT1FpBYzk/jasZ7VPWmAs1K/VJzTnPhlwSXwADOOis1WbNaHPclDPb9moBAQ3rkk6rcJNJpxWZPkCQpYRueeFO6BiyNiKP+cgtf/dR1Z3LV/Q2ZFNVhXN+MCvt9VMVP+Ccxchni4494gvwgMuP3lG+ieCsOiYFzp+WLtwZeLKFNmLgdPrr0wkojAD9VPvqZi6wuzTDO29kvfoR4sHKybCRpJ031jRXaq/HJ8A==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 2/4] domctl: Provide appropriate error code when PIRQs are not
 supported
Thread-Topic: [PATCH 2/4] domctl: Provide appropriate error code when PIRQs
 are not supported
Thread-Index: AQHcZibgOinge/Jy20Oi61t8GSsw2g==
Date: Fri, 5 Dec 2025 20:36:48 +0000
Message-ID:
 <b38b7b65630d1f167d1589d21556be1493c180be.1764961645.git.milan_djokic@epam.com>
References: <cover.1764961645.git.milan_djokic@epam.com>
In-Reply-To: <cover.1764961645.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB8322:EE_|AM7PR03MB6182:EE_
x-ms-office365-filtering-correlation-id: 9a3cd245-d047-4b65-55f3-08de343e037a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?e54tHWWdAstptkeL1fqcI/c469cVsFbbty25udQGYgl+/G2BJjjDGutycu?=
 =?iso-8859-1?Q?ACdsp7Uf9jZpctpdnN/LcanyVrNIfvw9NHFeHTOGwLHTRzm0U09AlK3pmr?=
 =?iso-8859-1?Q?B8jruEKG+YJLYcEHQ9xy6I5WL39ifcTZH7S2SS6F75dhw9okhH32hGvlLw?=
 =?iso-8859-1?Q?hWBMOG5Tg5oDonqemdTAFVQoZHxbEtE0+gM1sdF/JJnSZe80tJuvPQpSp/?=
 =?iso-8859-1?Q?OImIULDoZ9DvCdSHF40Ol65xg/cjFoaUEW8ZFk5WAMghzH/ZNphWv4GVHq?=
 =?iso-8859-1?Q?XRgK+f8cd7ddllPP14W4MrdO/83E+IGETw3DonIleZW45hh+BfSvOAUj8v?=
 =?iso-8859-1?Q?02SRt0yBEK0pTYh/0d4rOTiAqFUv+AZUSxzUdkZUNUhJi9yiCPIm9Kl8Eb?=
 =?iso-8859-1?Q?rK5LcvKSbhzwBVENG7CBGQUp2JjZyYpjyXM80PrQVkc1oOlCnCxLj4TdZf?=
 =?iso-8859-1?Q?0HszhKuAhmEqOVkf+KULMozbRoXXLQzWziYHigo8VkWsmN8pPk41arifr+?=
 =?iso-8859-1?Q?gc67E19ynBwfOwuxHrfdZN0ymeMhO6HHRI2iJ+tkrrVqJmcxqhqU58o+VQ?=
 =?iso-8859-1?Q?jPO7FBU8SoEw1l5Dckn0a8KsdT094lzxtVhPVYL04Q0BJWKE/6Hg1MSzDj?=
 =?iso-8859-1?Q?Fsz0DW3tAnHiuArPa2V15aiNzD1YL6jgkLLLpYpixzxhcoFrMqzSNturyA?=
 =?iso-8859-1?Q?Lk9IVX9BjDjGws7SnZ58B7xgc5G0AxXZh9Ui5CL+w3+ZXDG73wgjnQMQW2?=
 =?iso-8859-1?Q?m1/sigXieD/rOdvix/Q54GYhgPgy6ye1N2RmuHJPjhq8eLo3QXJEBaUkks?=
 =?iso-8859-1?Q?zWZwCso93QVjHEYT0jZgLEqYStuBpj3I/TTXVnxfL2veQqW4Oj6+BR4joS?=
 =?iso-8859-1?Q?OQq1fDrpvFvp5G882VnDiO9BZI0GRPnX8pOlrlVKA89TkNax1IItlCb7dF?=
 =?iso-8859-1?Q?221cA4rOe4Wi1JJlvcUmGag9W8Ni7L+Prkhc2uL3nOumNvUAJZ3T4Pn3Kl?=
 =?iso-8859-1?Q?+yVgV1qZV7OZDp9+O0/pIN6B/L7RdcwVGcpNcM+94GAe2KuzJOS1be6Sur?=
 =?iso-8859-1?Q?UzNGRJS2LJXe0Ds3pCpkzGT3H8226YUg1a3ZKgNMzT9KvaFdno2X/QSMNK?=
 =?iso-8859-1?Q?RS4QXJ0CTemuEH8WI/Bc6xKof27XpX5vtZqK2yq1W9ZwJJa/7H1ylek0rI?=
 =?iso-8859-1?Q?bpAQ6ekl+9So+gISrEywK2lNd2+BKvSWxS38aTuSgI1aVoltoLAzSisTYC?=
 =?iso-8859-1?Q?GNkPgynHssGxfYqdJL79bEIDDRZx76MVZoKjqVTkySfI+AfEh0VPXGkmdt?=
 =?iso-8859-1?Q?VSYUi/aDCjn4Vx/IGQ+4YO/dQfhSRT8+2DEbJN3i811W9ybFR2Z984ZqTn?=
 =?iso-8859-1?Q?ugbJoXf22K+Oh733/lq/slaBmZiE7oQdtnOwohfqSQI0Y4M3gIWvgQzStX?=
 =?iso-8859-1?Q?axiitJmgIbnUUXywErIhmJrzVNRPU9Pd7RCBvPB/MoMjSQdgwft7G48COG?=
 =?iso-8859-1?Q?gU19yxlSVqBf6E/isQBSf4ItnblVojMw+bVvGduFS2tsYQU50IOds1wLrn?=
 =?iso-8859-1?Q?1Zwq0HjQM0nbRFw5sFNr7fihz/vI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ozjSlGNEutnzFN71IRtxqAOJ9xjrgX9d+SQjMkWb4ls5X/1uOk/5n6ipTZ?=
 =?iso-8859-1?Q?mlbQi5zWzX7dStrdXFYxSLYP/lcl3452OOWWQIJ+pcsjUqPhxRTYSO7SlE?=
 =?iso-8859-1?Q?hWwMifzig2F89uFZzSXmtp9U4PwOe2FC+MBN1b8fHUSWla8wrBzPWsM1Z4?=
 =?iso-8859-1?Q?s+9fnXNXasB8yIj+aAGo6WAA3N1LcZapwhSQrQsJZL/+unPM8h5jF6uk2U?=
 =?iso-8859-1?Q?a9ccNEmB3SzWQ0b14GCX4uc0fn6h8sDsdYx4czOXHKLr4iJnKnChOXtOgE?=
 =?iso-8859-1?Q?FQEAC7YDVDHOSnmDb3oKneR91x+DxoUxFH9OQ0T/va3xgRZZlnvrdqjUcF?=
 =?iso-8859-1?Q?W3NPZz4i3dJMtxSg+Qw1O9sZ4rbPZTQl/kSk+unapc2QmRkkcZVgR5cHcL?=
 =?iso-8859-1?Q?DC+d1a8XXevV/5hmL9ILHJx4KFFHzyCBb1MaKyeyREsvrmzrcYxc+8mJP6?=
 =?iso-8859-1?Q?oqRMosw/D3OTLKkbfw3J2euUwqg53/tCGpDlecJ9ZCxrR1bf0ehyTa9jVm?=
 =?iso-8859-1?Q?ujiuhrI9K5LK+AHJpzegxVKUEWmDuBJJW4P/WqAMEbOlcxMIHbAsfuW6RV?=
 =?iso-8859-1?Q?SO7fOCn0dRD5HGd+7bmVsz6c5wIYb7VHeAgAVGwyeXI9Aw3HttPQk9FkjZ?=
 =?iso-8859-1?Q?mingRtgNEqUxbkICnvuR5g2k/XHSUFOvZHdJLOuIyDiaNS2VdfFBXRwbN4?=
 =?iso-8859-1?Q?sx+kKSz+rBU9yHyI6NtkQHmzedMG/dcuRrbrds6Xqai0oxANpsqIyt/EZG?=
 =?iso-8859-1?Q?/Iv46EOjGoElei9CJhZjOtrzrwKaHjqy8NUnAUoXA4RxQfkPsS6P4UId69?=
 =?iso-8859-1?Q?U+Ib9EoweBSZJRhwMGteINoTSY3GBeIucAHIK9GNv3uNHaBRgyU7wiEbyA?=
 =?iso-8859-1?Q?NCzNByLRj8Xqfo/duSiQgiIY0LgJEvuMtddFr61ab4YtT6UU73l4CtzkXB?=
 =?iso-8859-1?Q?2rTWchcmzVvNvMLyQ3DJw7jJfQtA6CTFm6aYIh6+lZFOidtZjObyieMo9h?=
 =?iso-8859-1?Q?UVWvKm96IH7NWn69qXiL2H2qeqG+WhQ63fenRJc0Zisi0QSP6W8mbKzBjT?=
 =?iso-8859-1?Q?ExrX3f1IIGTyiSx16X1os/2/mes24Du42G3f4ftjH4uYMgxoUjRyuvgeFA?=
 =?iso-8859-1?Q?qcDo6F6bXZHi9y82Ge46ROAZK2XtiQYpcpdST33VouRhop0bSU3fgYtLRC?=
 =?iso-8859-1?Q?MXYnKL+4Aq6Eh0/XBPRHf/Av7SRenF6qbpJkkxsE2jeA4a7OItvqclkQ51?=
 =?iso-8859-1?Q?geZZvoIGp471Ny7s0N8jzYWEsPAVgk8F8fYJvl0YAbsOSvlsLCr3V7ptAx?=
 =?iso-8859-1?Q?yRgIMcOB0hsNm4OI7hJwRwfTbNAdl8dakTw902Er7z1NAbxj0K0hAijC4F?=
 =?iso-8859-1?Q?iSHQ/Omz46MK8IU0Qu234J7xUAuht7+DEmKzdoUodkzG0E59biflNAnH73?=
 =?iso-8859-1?Q?6MUqnqxb3Ns8eCb28riCZSN68PTELYjadTXJ39XUl5Qs8tLPle3lw8oTo7?=
 =?iso-8859-1?Q?zzdjv5dnMsYrapRLTyHnVa89kvOh2CwuYBjJtGhVFj9AUMGMpggyzaDENP?=
 =?iso-8859-1?Q?qRr/OIVu77mKXITmZ8hNqhtNNSWYrH04i4o7ktNzHSmTl9Zva0iU2ojPnb?=
 =?iso-8859-1?Q?XWNShz/EaXMt9+C+h3ZwKFNVatyg5/FRnR?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3cd245-d047-4b65-55f3-08de343e037a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 20:36:48.3861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COriHAsR/iYO4KXNu385DGOj612BajCkUISveMJ63pxLCf0cXG1dGg9/jqCgvdbUkij686M3B+Uy0vUW97V9wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6182

When PIRQs are not supported (e.g. for arm), XEN_DOMCTL_irq_permission
command is not handled.
This results with default (-ENOSYS) error code returned to control domain.
Update command handling to return -EOPNOTSUPP if control domain
invokes it by mistake when PIRQs are not supported.
Also exclude xsm_irq_permission hooks from compilation when
PIRQs are not supported.

Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/common/domctl.c     | 6 ++++--
 xen/include/xsm/dummy.h | 4 ++--
 xen/include/xsm/xsm.h   | 6 ++++--
 xen/xsm/dummy.c         | 2 ++
 xen/xsm/flask/hooks.c   | 5 ++++-
 5 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 29a7726d32..159864bc99 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -638,9 +638,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_d=
omctl)
         }
         break;
=20
-#ifdef CONFIG_HAS_PIRQ
     case XEN_DOMCTL_irq_permission:
     {
+#ifdef CONFIG_HAS_PIRQ
         unsigned int pirq =3D op->u.irq_permission.pirq, irq;
         int allow =3D op->u.irq_permission.allow_access;
=20
@@ -656,9 +656,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_=
domctl)
             ret =3D irq_permit_access(d, irq);
         else
             ret =3D irq_deny_access(d, irq);
+#else
+        ret =3D -EOPNOTSUPP;
+#endif
         break;
     }
-#endif
=20
     case XEN_DOMCTL_iomem_permission:
     {
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index e801dbcdba..6f6de161f9 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -555,14 +555,14 @@ static XSM_INLINE int cf_check xsm_unmap_domain_irq(
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
-
+#ifdef CONFIG_HAS_PIRQ
 static XSM_INLINE int cf_check xsm_irq_permission(
     XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
-
+#endif
 static XSM_INLINE int cf_check xsm_iomem_permission(
     XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allo=
w)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 2d831d7745..b85cf9933a 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -113,7 +113,9 @@ struct xsm_ops {
     int (*unmap_domain_irq)(struct domain *d, int irq, const void *data);
     int (*bind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bi=
nd);
     int (*unbind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *=
bind);
+#ifdef CONFIG_HAS_PIRQ
     int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
+#endif
     int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
                             uint8_t allow);
     int (*iomem_mapping)(struct domain *d, uint64_t s, uint64_t e,
@@ -504,13 +506,13 @@ static inline int xsm_unbind_pt_irq(
 {
     return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
 }
-
+#ifdef CONFIG_HAS_PIRQ
 static inline int xsm_irq_permission(
     xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
 {
     return alternative_call(xsm_ops.irq_permission, d, pirq, allow);
 }
-
+#endif
 static inline int xsm_iomem_permission(
     xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t a=
llow)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 96dc82ac2e..28ef4a0beb 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -73,7 +73,9 @@ static const struct xsm_ops __initconst_cf_clobber dummy_=
ops =3D {
     .unmap_domain_irq              =3D xsm_unmap_domain_irq,
     .bind_pt_irq                   =3D xsm_bind_pt_irq,
     .unbind_pt_irq                 =3D xsm_unbind_pt_irq,
+#ifdef CONFIG_HAS_PIRQ
     .irq_permission                =3D xsm_irq_permission,
+#endif
     .iomem_permission              =3D xsm_iomem_permission,
     .iomem_mapping                 =3D xsm_iomem_mapping,
     .pci_config_permission         =3D xsm_pci_config_permission,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 9f3915617c..63e4b4c353 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1110,13 +1110,14 @@ static int cf_check flask_unbind_pt_irq(
 {
     return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
 }
-
+#ifdef CONFIG_HAS_PIRQ
 static int cf_check flask_irq_permission(
     struct domain *d, int pirq, uint8_t access)
 {
     /* the PIRQ number is not useful; real IRQ is checked during mapping *=
/
     return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access)=
);
 }
+#endif
=20
 struct iomem_has_perm_data {
     uint32_t ssid;
@@ -1943,7 +1944,9 @@ static const struct xsm_ops __initconst_cf_clobber fl=
ask_ops =3D {
     .unmap_domain_irq =3D flask_unmap_domain_irq,
     .bind_pt_irq =3D flask_bind_pt_irq,
     .unbind_pt_irq =3D flask_unbind_pt_irq,
+#ifdef CONFIG_HAS_PIRQ
     .irq_permission =3D flask_irq_permission,
+#endif
     .iomem_permission =3D flask_iomem_permission,
     .iomem_mapping =3D flask_iomem_mapping,
     .pci_config_permission =3D flask_pci_config_permission,
--=20
2.43.0

