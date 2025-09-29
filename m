Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA02BBA872E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 10:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132647.1470917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v39ZC-0006Z9-3y; Mon, 29 Sep 2025 08:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132647.1470917; Mon, 29 Sep 2025 08:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v39ZB-0006W8-Ue; Mon, 29 Sep 2025 08:49:05 +0000
Received: by outflank-mailman (input) for mailman id 1132647;
 Mon, 29 Sep 2025 08:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbRY=4I=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v39ZA-0006Tl-A5
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 08:49:04 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26413e27-9d11-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 10:49:03 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PR3PR03MB6668.eurprd03.prod.outlook.com
 (2603:10a6:102:5f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:48:59 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 08:48:59 +0000
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
X-Inumbo-ID: 26413e27-9d11-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBAnWv3gWc2cZ+Ikv6fSV1aNwyI/LMWkDW3p9MsEAuTd1ViLslgKXSdJrKwIHw4HywUdRRhVv4OHaaPoQ6/H8T9/r+3Lo8bqeEGea78G1h1rDg+II0dS1LMMxgfqSRCm6sozTBnk0SVRrWIEuxQn8PlJcl60sOUzC/hYdbkmid3Q8l/AM0wZFZ5c+yIH4U8sxQllSAdMoefjBcweO1r8xMIW+4+bEeduFKT/tu6O30HhUJxkFp8vZU965UUEvhB/fYRK2zzufaZ6GjcsIrUayx/IjlShh4TahpLKzd+vlfnbK6P8e/8ZgEvR3tSkojymc24bAxYCKGuoDchIg8RAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+YYBGRfTXcvGMs4a3ZSmAVsaDxbeSYPy+wB54gO/UM=;
 b=f0pedsujJr4t7HjlwQ/1M2PA8qeyUT7ZDih7qgsA4hqcAexF+n3lqNttyeIH1XY0RFF+dr68e189WZn7ybnoKh22HhfjeFPDAK539pPK/LDRV3Jm3ROB7gEpy0grpVS3OeSb0aYMs7Uo1qydSppe7eMLlHzhyFsc77OOv6o+8sdXHDe7w19GnICLIpBNUHk4y9LxxZD2aNeWUAzWhRwcVtUtjqJ5hvpiTINCueiQ/wX1UWeMnXSVP/VFIxytAqsnveDRz2KfK4bA55z6JNqWnPxr2IiJL8cfmK92meSBGBhABCP7vhKpqSOVXyEAOiCH0GKX5b/qFxAV6rJqSoF/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+YYBGRfTXcvGMs4a3ZSmAVsaDxbeSYPy+wB54gO/UM=;
 b=MfqZFUbOyu8DR3Bkn2sz95vluMJyJpzlWib21nEf5Y56tRH0a4/852YxCPO0gQ5lc7WX+Xc8U/LxI7K6r8CYPEAI+M8VruAVTFHbOE5m5oL2cVV4pY028drWSxvJt69uPseqgcwxT/i6mZxkO8WXE7MRB65KoE2N1Sm7zGIVPdFp3Ne4KdY9a3j52bOswaIOJjdxjH23WVlOGLVDYXMtL944ujgyrmNHvX5K3R0qfCLWpwtkVZP/trKqXjkP0ODHpwwQh03sxPkGuGasbmL6Cos/2Maph60h9DogXyer6Mmbna+04oi8+Iz7DRZ+NTOE6zlLKcs2O4wuRRcY87hmrg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 3/4] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v2 3/4] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHcMR3mMfDQQg/odk2GMtm9qNuvyw==
Date: Mon, 29 Sep 2025 08:48:59 +0000
Message-ID:
 <bbd7ebd07d80ead78106c160e4368116dae1e548.1759135193.git.mykyta_poturai@epam.com>
References: <cover.1759135193.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1759135193.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PR3PR03MB6668:EE_
x-ms-office365-filtering-correlation-id: 5981a451-28f4-4443-dbc7-08ddff350888
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?cCxKoNfWgtPr16Ym7UINsFK2VmWBWx0seXKM4pTE4PaMjpituZRW+zG4q5?=
 =?iso-8859-1?Q?tenABhHtMLrDw2WxWpFO5IJHBQ+kNXeXaUgXkjSCmA4M+QLCyhDHUfVMFr?=
 =?iso-8859-1?Q?so4vt9SMZd9mazeix8UJs0+om8ZJ6uiFPw8zoFcipcvU5mMInxUSnn9RaY?=
 =?iso-8859-1?Q?Gezn2s3Q8okSqO3MRChxU1Az3MWBTz7/yywDpmsa6+74hDGiZhXN2vrvqI?=
 =?iso-8859-1?Q?GZQqAGUuQxbRPsvc8JrMoNjLAcmwWBnHvifJIELg/54qxjXPLpB/sBowWx?=
 =?iso-8859-1?Q?lox+2keRg6XeneV1XnR609Zel9WBrVJvyNczwOtqIS8+OTL4TQHCx4Swvv?=
 =?iso-8859-1?Q?KDKz/yyGgnGiZT0xpEP2jX7+C1WtvlF09Q3eMqn8wcT8Kbx8Z8jjdUHivs?=
 =?iso-8859-1?Q?rIDDvTeGSiNTCBp/KrKl4924NO+Zk4klNH7MZrS9ZhA4tTrSVvQVAnW3ZE?=
 =?iso-8859-1?Q?PkhCavw4PZz01BSK28j5zEkmzA+6UHWW/0hP+084bbCAfsyO4VUGSZsQIn?=
 =?iso-8859-1?Q?jmy5TLI7Y+VidLLNun57GB93WLwo6cu7kJd2xcQm1sHmdzc676uwc2+/bz?=
 =?iso-8859-1?Q?mw6okI19RBBvsq/ZQcfmJBL+TxlIaEJEy3e3G1kLzhsRdRVLwxdt3v36di?=
 =?iso-8859-1?Q?KAd9rnsN5lF2IF1+arwJg6MWFzsLs0nJ9kGINq2ZHc7hRWZnTMGoqlPj3K?=
 =?iso-8859-1?Q?E+Pr8PajhbHja+9nDItZNVVr4xricnutvg1ZoAzsOvphzvInEA/Q17q/GH?=
 =?iso-8859-1?Q?5QhX9ZvS/u5/OLqWLTjxCdaTB6aD5dB/bvM8H6acb5xBiHuO98FVphNl0G?=
 =?iso-8859-1?Q?NMvnYv+yEkhmx8v7lchNc1fXa9SqazaHysu/SrZhB6M692Ea2egKklOSw+?=
 =?iso-8859-1?Q?Jky5huweRkZeCs7Ok+EMkRHkjs7qiK1FwaVJeCggtSYp9JL+bH4JxiBOPQ?=
 =?iso-8859-1?Q?dyUVVwiMplg5r2vq7h08bzIUE+bwxoS7bTl6q/Ed2rw49cVo4i9ujc/ha7?=
 =?iso-8859-1?Q?m7/zZX1vY3SeEvrYFvPmDq2QVKDv3BanQSdNHtpDMf4kmKrl/6h0Ul9px1?=
 =?iso-8859-1?Q?WB04h1eA/SDuRg6/yQ7n1SpdHLNareQmJCSZk2rtZPyGRfqPsIyDtkpwWM?=
 =?iso-8859-1?Q?JvXX6pOhfDUN05xAed8eqbVDnP8bkWTJ2YEF784haYnyC1E/Y5XAEEjbT6?=
 =?iso-8859-1?Q?kRCPVKSV4OZfWIx8ho7I12zPHkHXbp1e89jzboDr/EhdYQt4ELJ4nvLeEB?=
 =?iso-8859-1?Q?wrskncxNOUpWk8/rXVIKznL9kI5M7X0YKbjrSfYmVDtQXJeMvl7p0chsxo?=
 =?iso-8859-1?Q?x8/KVRzybGwLmHOKQ+ge3i723x2jCm81d14RlXGHF+7tcg+fzsZSoMrmFG?=
 =?iso-8859-1?Q?5kE03fo2/6VTWN1JPhhFddiCZ76NTOlEs5SVAlFT7wNdibqqFv/3FFxvK2?=
 =?iso-8859-1?Q?xlTFs1QJLW5uXC9KRAZBklzRDxGvRhDOfQllVd+s5pxQ4w/BZOz/l6EbU4?=
 =?iso-8859-1?Q?GHVODAKgtmofzqpX4KXOVxBZxgDnrONFj2R0nDPCfOC0ahq30OQrQIXRZo?=
 =?iso-8859-1?Q?bCqAd1sagpNMnBFr+o5FktmXc0dh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OPdvoQbNZb1edgFrTsRrGsNuyUuLYoN2uR7dA/lE6ggDxP6CbHy6XgEeAn?=
 =?iso-8859-1?Q?/oJKbM4lKMwQTKt57+YGgpP5CPSwibL0eBRlBxpGuzRu1SyLu7EHdpn2mS?=
 =?iso-8859-1?Q?oBDpNFi/i9dkMFhKT/3STjOw7krJL7OQHnd6BG3OXvqQiozhc/z53LThRt?=
 =?iso-8859-1?Q?iOQAY4+D0UXeOdhZ+KkWrkEIJZ4eNxgBqyIeNBXCXjTUYEYHs1hJMJli1F?=
 =?iso-8859-1?Q?XktjwrPkhc+HgG5PgI9srfyq8zR8vmEVnIhSJIHUyI3pw2iDcKYUv2bfwL?=
 =?iso-8859-1?Q?Woo1+/NktyeHN986/E3q1Y+RaB9eB17BT7o4mWPg4eiWKLThA4gXk8o4t5?=
 =?iso-8859-1?Q?T3yVBlC2Gqd+amWcSv0+AoxHYftvC7Ur05abbxNIcdaIykgGAeduFUsVNV?=
 =?iso-8859-1?Q?i41GJTyM7IfQcIac1xQYXBizyig1Pp/y7baVzwj0ayYb76D2Nnj1frLe4M?=
 =?iso-8859-1?Q?Zu//1dN8qD1DAcg2FvdOdoElPj49yzuM5+VraAUHVi61kne3NjBHZG3sH4?=
 =?iso-8859-1?Q?gJqlNO+wwfIACpIrgdhdNW38KrPw34v+b6n9YaJFM/MGmBqtZgbz0FSZHU?=
 =?iso-8859-1?Q?yTMQTxI5NUsp2Luh+DAtaXIbY15KtQEKYW7zh2qSBecmptIC3nwEJAZds1?=
 =?iso-8859-1?Q?SIEOgAANntO6T9lTA5pVW9ebfYhsvZg7RqZ0szZzb4zMcmzpIH/qhSWywA?=
 =?iso-8859-1?Q?6NNvZ/FAsV0XqAkJyNuOmtopZZCRTWLz+TyeG+36aOh4XBE5LON7PIzOl5?=
 =?iso-8859-1?Q?WfQSeAAyDvCmTMwAnyyS5LZBBLrv6tkkvuyZ7UA1quF9lcNygdr3ZaNuIa?=
 =?iso-8859-1?Q?l7n2FPvE3hmdbc33Q0qAHA5ln+4a1/CpSTZ6X9lAAf0g9JXq5aOwgjE6sU?=
 =?iso-8859-1?Q?IZwfX1lTgejZJHqfEzXQH81bRsQMl6XnPTWG4G8HDi8fa+iofGalfQWh9m?=
 =?iso-8859-1?Q?ls1vSV0xkP2gHDB/vYYdJzsiR6f8iLDQZzWayOd4ar2RgxQz4EMRJsXisi?=
 =?iso-8859-1?Q?vFE9Z18emvuYAvWquTA42mjaNP9y2SJ7cxMnuTwK52YXTzouuJGKc3y/Af?=
 =?iso-8859-1?Q?M+5wnPhpQICO+sWdew9IgoOdHkqeN51aYyt8DMoU5b+95BUkNdawUcb9c4?=
 =?iso-8859-1?Q?RxiuKM6pP0AEO97EDM/eKyLaNncgWBvabeIwWxHeOdfj1MRGZ5JFjSRT9P?=
 =?iso-8859-1?Q?AXp1K8+vOvlCFKOMGFdd801jb7Dub84ap6gvi/1QggKPCvFsAQzyEyG+Pj?=
 =?iso-8859-1?Q?H29AbWwvQSgrFLFLDU9uXtRiZ88GB+K19SQJR4Z1Hf4zGS55MfkPDmRWDI?=
 =?iso-8859-1?Q?JAri9+Hb+GdhybRU8RT3JvAR03hX5wvl0waqfVHRkYnTlEJ2/S9PEfRjsw?=
 =?iso-8859-1?Q?Ao2xuUUIWr+7tkA+NWATc5G+xSwf9MG/l1EmoPgNt5jt4u5CCFFeZsLpoE?=
 =?iso-8859-1?Q?nAGZphOPbkrPRw1wU1pVp5fHtGcqHla9OH0pi+SXoau6RZW4icwpnkr2v3?=
 =?iso-8859-1?Q?GZyf1Ca5HKSLAUSj8Vlsipoe9Q/c4xjnF/vMm7mCMs4sNpXDRBd6vGlOlO?=
 =?iso-8859-1?Q?0NJ1ywS2/00o69GrOC12E9RhbenFhECt+MRXlzjuN8wZDl/ZBLBEva0I1A?=
 =?iso-8859-1?Q?O6wAFHzDeXjUqgh9Bn072KXHbjXMKGojn6XJz1CFN+rvA453hYdYerKw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5981a451-28f4-4443-dbc7-08ddff350888
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 08:48:59.7648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7d5rzHhtGAYdp2rUzBKJQR5H3bmaR3ao6K8kSdiIeNd70BhGcQC2W4WlZSjOCBmGwEIbQ6POJWp5iWhG0VOCCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6668

Implement XEN_SYSCTL_CPU_HOTPLUG_{ONLINE,OFFLINE} calls to allow for
enabling/disabling CPU cores in runtime.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v1->v2:
* remove SMT ops
* remove cpu =3D=3D 0 checks
* add XSM hooks
* only implement for 64bit Arm
---
 xen/arch/arm/sysctl.c | 45 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 32cab4feff..fecd649db1 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -12,6 +12,8 @@
 #include <xen/dt-overlay.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
+#include <xen/cpu.h>
+#include <xsm/xsm.h>
 #include <asm/arm64/sve.h>
 #include <public/sysctl.h>
=20
@@ -23,6 +25,42 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
=20
+#ifdef CONFIG_ARM_64
+static long cpu_up_helper(void *data)
+{
+    unsigned long cpu =3D (unsigned long) data;
+    return cpu_up(cpu);
+}
+
+static long cpu_down_helper(void *data)
+{
+    unsigned long cpu =3D (unsigned long) data;
+    return cpu_down(cpu);
+}
+
+static long cpu_hotplug_sysctl(struct xen_sysctl_cpu_hotplug *hotplug)
+{
+    int ret;
+
+    switch (hotplug->op) {
+        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
+            ret =3D xsm_resource_plug_core(XSM_HOOK);
+            if ( ret )
+                return ret;
+            return continue_hypercall_on_cpu(0, cpu_up_helper, _p(hotplug-=
>cpu));
+
+        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
+            ret =3D xsm_resource_unplug_core(XSM_HOOK);
+            if ( ret )
+                return ret;
+            return continue_hypercall_on_cpu(0, cpu_down_helper, _p(hotplu=
g->cpu));
+
+        default:
+            return -EOPNOTSUPP;
+    }
+}
+#endif
+
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
@@ -34,6 +72,13 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
         ret =3D dt_overlay_sysctl(&sysctl->u.dt_overlay);
         break;
=20
+/* CPU Hotplug only implemented for 64-bit Arm */
+#ifdef CONFIG_ARM_64
+    case XEN_SYSCTL_cpu_hotplug:
+        ret =3D cpu_hotplug_sysctl(&sysctl->u.cpu_hotplug);
+        break;
+#endif
+
     default:
         ret =3D -ENOSYS;
         break;
--=20
2.34.1

