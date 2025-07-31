Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E57BB16EDE
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065257.1430682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoG-0002ca-Kv; Thu, 31 Jul 2025 09:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065257.1430682; Thu, 31 Jul 2025 09:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoG-0002XJ-FV; Thu, 31 Jul 2025 09:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1065257;
 Thu, 31 Jul 2025 09:42:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXc8=2M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhPoF-00025l-9X
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:42:47 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b658f8bf-6df2-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 11:42:45 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU5PR03MB10524.eurprd03.prod.outlook.com (2603:10a6:10:526::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Thu, 31 Jul
 2025 09:42:39 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 09:42:39 +0000
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
X-Inumbo-ID: b658f8bf-6df2-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMjHy3MXSObE7iVBdJCIy5MvN47D2+vRQPiJJirPfBt5vxu8K/4tXMoDqnO3lOOjWc+PdjTaD1euw6QjFC78laq9XUOWbd2hKqO3S9CkDtaoH/IJD77PbayXafibnT6/nRRKulM0o79TGWytPyp/aV8cjToy0sSJWiRxNcpbIdrozs8Q2afJY4E76gDWzrqFNrt+S7vzhf3ef/ViWuuubxySYUUJeg/8+EKY0ncrrsvUBq52iJvJKFUNfDr4cbWivx/3ZI7rYY7ux6JFoCbJj3p3UwbtLUBPojTRqvmIVpEaxfKY4lHe+cqmumxcGFUYznWRdsiQhW7GYSa9FOy2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ca9D6PMkweJebiIuFfryFoA7M6qmuDZwGEjLmzQa2M4=;
 b=eNUewjlp/gCbeoDltmGR5hq3CsZ4MRWRiBXycklm7mx0Jo585hN0SE8n4x0xM+ED6TcK/fmj3GMcOgdtOy0sKGkgXpXMyZTzxpkeXjI04ot/wyGBSYLg/s+TOn74+i72ovW2PAilaOv5dIh8+zD4IztXt2gEaME1y1duXmp2iIBmhWFqEGCDMIZDXn3azm55K08MjeEVNOKZZbc4/Ut+Fkkb86ChEMeU0rYhnUc5ZLGizWPQPHxjEKhgRntKL4HVuHA2GclVYvDZn8JHU9Vgb7z+4/1+rIO63yS9zixG4HYp1Wl/ue1ReeACR0LeUVO8NCfxFecN4ext/J6BMCxUrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ca9D6PMkweJebiIuFfryFoA7M6qmuDZwGEjLmzQa2M4=;
 b=noj590DpsmK+0JxHI8CVUl+FxWzTf+mHx1CTVPcj1qGb1b60L8wiQYHgBm2s1GlHZTlHmHFaRSefYFD9Pix4MkkbprC+xmCj55cYzPmNNukjKriOvRhvj7raspSFeFQ5QeNHATwGJxK1CxvInT0FbXHB54DRGGeZiR/Ef/bcPgye2R7GPA8SMi5PD0zELPNfrD3OF5ok7KDhhxP9LguMo23f/dtdXCshI95km6rkGl0Sz9Xt9pRPypdDoNb4Ynsx3bo5TRlmyHgQgRDReF26abEIuvoPiZwQNdk6cSis0LKr9NOUhaZa1b0EgWcZX/EMYr+cC/24sPAaM/wbPkVYPg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH 6/7] dom0less: probe kernel before creating domains
Thread-Topic: [XEN][PATCH 6/7] dom0less: probe kernel before creating domains
Thread-Index: AQHcAf90t9uAadcRfU6jyiKw0u4U4g==
Date: Thu, 31 Jul 2025 09:42:39 +0000
Message-ID: <20250731094234.996684-7-grygorii_strashko@epam.com>
References: <20250731094234.996684-1-grygorii_strashko@epam.com>
In-Reply-To: <20250731094234.996684-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU5PR03MB10524:EE_
x-ms-office365-filtering-correlation-id: 0eb1e040-9853-4910-97e5-08ddd01696d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?j+AxWXhMw/GcSymMaPqtQzncK8JiQKb23wECab52koHwnPo+8d271cq/Td?=
 =?iso-8859-1?Q?YhvcPDglaVvtG/L1vAtGijE2GPc+jBwnUhelhhSbLSOnndyZomM38nNxce?=
 =?iso-8859-1?Q?SIdl9+NuJqf2xVBvGtkPcMOcW+6Lvs69VwFnJlt+TSV10lomvOJq2FCnoS?=
 =?iso-8859-1?Q?Zs0V7yqEsSjX1mEbpR54iObGT6vpIfi4W3KP09n22Jm+YxNWjRuwB9dBBC?=
 =?iso-8859-1?Q?6iMpC8zyliHwFvUK9r7jPdO8ROi+S0HyVTxNHH/RVBgBDxN+M0QpWx6BOQ?=
 =?iso-8859-1?Q?9oUTdtdUzlKfIGciMwsiCbN+9Smagd36N1m1ZdOvlVw2yg0z9if6S+s7ag?=
 =?iso-8859-1?Q?u0rLdSc0sDQ3Y0snpLiiLqim2JE4gJAogXk954qT5CWWAaCptLigwst64v?=
 =?iso-8859-1?Q?+OW5MX3Q7gIWGXNpnqcRzivwNxMijbQ+ufKv8hD3tVRdiRkUPh3wQH5fV+?=
 =?iso-8859-1?Q?H8BzmMBEiCZ0t6jHO49jDII43nfrrP5vjyih+4Zr02Jsguw0CzGWHeUGy3?=
 =?iso-8859-1?Q?oDHMhRUCRF4lJUtvHGE9lhvN2WdbAscf21uo6u85NHcB+/AqfRBIHVNEaX?=
 =?iso-8859-1?Q?R66skpXEGc6ejR8WahGcui2rk3TgH6ujFb8YGv7SfATmI6eQTZj3wtnrkQ?=
 =?iso-8859-1?Q?Qlb+rvzfy0ZwfAx0lq3apqWCTcEEZ+40kVzHTa9MElcCPuXgAdB56XXIbA?=
 =?iso-8859-1?Q?WktCPB9gGUA42mXfT0oVEz0Ta1qmCZ7j1c5Dv/CrP6RZENYlHOcVD8YjOx?=
 =?iso-8859-1?Q?JyF1K4LV68pe1ACeRV8+hS1XH952j70BCpNFpvQP7ANYfP8OTqFu2mO5L8?=
 =?iso-8859-1?Q?bun5HjMFRNAqzX9alR5i2dEd+AQHBi3ZOoerIK25wGD2rEz6+R7QRYPuaQ?=
 =?iso-8859-1?Q?MrjJkI+xsgFp79tGPDqjlGZSG8Q81+V/ZuCdzWbdRiJ7mhen8414N3Bxa7?=
 =?iso-8859-1?Q?pFH33ZLinQAvqOHzo/X3vbyYrmOY52/S2dZ8L2RLjjkl5UnBLshSmTpRmI?=
 =?iso-8859-1?Q?9ZaVV1HSQqp6vm0QurTRnSYyFpyriC+Aj0JsLGHyV9NSz3NX2EUOShAqf4?=
 =?iso-8859-1?Q?2QUpHcIqetBo4qsZ99DG4Y12ldm5RWhgQSHNMBlmIV7FUZsSneejznuDsx?=
 =?iso-8859-1?Q?pea09FMPHtr/ldlFwsmL9lH7Cw97KnsKuqiZRBl4thpZe2xrOiJBzzfyaK?=
 =?iso-8859-1?Q?aOTp5F8gds08yc7ynZ29n8Y82BZahXK3Ongz3GFyk31WPbj7ZefIvsa+YB?=
 =?iso-8859-1?Q?eWAGi77Hq+LHvRxk8WmOSZVfPB7LcrXTEoIdblwsG//8DfxCuVsdxwGdFw?=
 =?iso-8859-1?Q?ROyqwPL6RRp+KBWcsf4FTiJYtT8VMYJHeVSUlpwNUgQwv9JH/8wBifgT4r?=
 =?iso-8859-1?Q?vNRpLEpTHRJndK7Ln6tgp8mCVq+p/Qo7/U6XHKmsaHpOj2ZCnwb0k8Hxua?=
 =?iso-8859-1?Q?u2HzwlL5Zg/zABIr+8A63RcfUrPLIVKq8vMhedmN89dednTSxu7etPNh8N?=
 =?iso-8859-1?Q?Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Th48nOgf9esqnpiS6YxPDLJq4b9+n3yRdvi9bsTAk9HLJEaVILLLpdhgZn?=
 =?iso-8859-1?Q?ugzSDK6BOcx2RvCHpXnbv7l2U6TbukRvrM4wwvtkrxGLpCy8d/hLKG33Ii?=
 =?iso-8859-1?Q?PhnOFlvyx1Dp8VlIIif0BmnsWZzJvs9PR40JcIoT4fr9uUj1HbQEOmWSBG?=
 =?iso-8859-1?Q?qVm1sedudfnSDiD7PD0N8/xN31/NqVu3A4s5oVjVURgE0IPwk8wjP4geRi?=
 =?iso-8859-1?Q?dLWzvcuv+DqfKKuSjliBD4F/au9GWjJQ9HeNBULXmuTDXflMQ98zckegMB?=
 =?iso-8859-1?Q?aZp8SxEkFw9Gb9BQDuRgJJvgm6weafkEL2Jaqzl3LbkmFDAHwii8LKzATo?=
 =?iso-8859-1?Q?cQMi0+wigSPPTAIIL/1etiXHyUPXx/sglXRgQrHKJC0msjWOHCt074SeMh?=
 =?iso-8859-1?Q?PExVZX+hralqb93Sl7Sqm3F9uunkJD1EAheJCEFBS8jl7BPZtUO0eid7qk?=
 =?iso-8859-1?Q?2XFAAlvBAUJ9xTee8pclFfbQRK5fMBc5SuTBAa3WUjC5arrbLDaBRAsCNX?=
 =?iso-8859-1?Q?/Wm0DpuTKvckUV0JWnzo4UKIIzTRdrx8eHDD94Iku4/EEbGumAMyXV7gDE?=
 =?iso-8859-1?Q?D9cZBNStim/WZmarne58lxxIyU3M9hfkYiaAxHfXmzcrbwM0qiFhNz0B7J?=
 =?iso-8859-1?Q?xE35VyFlmtC9ihK6Zp05tdUtPoj3p4S3PnAAMmmnJtjWVHipcpFXDJDOYs?=
 =?iso-8859-1?Q?NK/xjj8zSzh4mLXnu10H+BrSW66ksk7XlGQefYp1cUZMjoyH1VJ5Cfktb+?=
 =?iso-8859-1?Q?53zr/4Bc7nyZDJkruijGoKNzX6eR2jx0fW4nNV43RQm/NBpPu2zWR2fjbQ?=
 =?iso-8859-1?Q?N8hqbHopZtdLv5ZG+T6RJX/+7IgdkGa21njSS21MuacZTNS35Zc+I/b9m3?=
 =?iso-8859-1?Q?UpEYoNn75HN2EFsm1g/PWYlLVrii5m/dMlXVZN7ijJUzplDFHXU79QJ/pG?=
 =?iso-8859-1?Q?zjEpvUsZ3b7dF1uBKeHb1zSkpYyzJrD2L7Iq5yPJK+H/3pdfayF3iGFU5D?=
 =?iso-8859-1?Q?z8Qm9q7oHw7bG1wQHVhl8g8ZrNYMJ7p+2SDQ6KF+AgthnI+qoa0eDs0wmJ?=
 =?iso-8859-1?Q?7OUIsYPetAU4vBDFyauhu12xw6zeHDhtG62UFj1/I/8unzEW3GM9wvpKmf?=
 =?iso-8859-1?Q?GNKKTUv0PAieFwrp+Mxt0zO4QLmUIVPrSGHR0tEqM/s09hpaoH4uVGL7Ay?=
 =?iso-8859-1?Q?AeR/Duths55K8h4XiLrv86MwilEtpsHr1w+p0Wa3GGAZEzzZb+kcMoXqaN?=
 =?iso-8859-1?Q?eBEiobW1Vf8j9BwC+X+nEKwQ2KkKwlA4tebsfGPYKO8ztT0ZFBy5MG29fk?=
 =?iso-8859-1?Q?3uI/nxoFvye4qrDhE4tKGYpVD7Zk19Kt01QHklnuof0ksZ9Sm1p3UnKUH8?=
 =?iso-8859-1?Q?3k8GOslIYIN9iymS6Ndg9UBIYMTKjsA0L9KN2bXg3WYW9neCw/1B99yQ0y?=
 =?iso-8859-1?Q?P6JTzWeSu1EmtIOS64YZlKI0FtOLK5r0I+i/VRo4+JRBdO2gZ2yM0jYxmz?=
 =?iso-8859-1?Q?MevrcO9i2JUom604fus/cAIPrdzweC5M1xslWvXHL2LMYn9QqIw98Aa1h5?=
 =?iso-8859-1?Q?s3Eu7PcXUzFkobzmroANbhg2cqPcEIR90pYdxljLSbiK5shHhaMNpmgG8d?=
 =?iso-8859-1?Q?ebYijc0ZgzKSxMKbKYZkbxUTbdpT2y0r3qppM4nXzr2LG8j6UyrstUKA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb1e040-9853-4910-97e5-08ddd01696d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 09:42:39.1659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1XHJNWJhKIvCM/KxZ7ap3/QpdFAuy9Sarndvih2/fF+QihLOdW+8pQ7eVxsUie+iSukG4oH7tqI4SO9hdayCsCjqMBZIZWz0L/kKf6n9vQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10524

From: Grygorii Strashko <grygorii_strashko@epam.com>

As was indicated in [1][2], performing guest kernel probe after creating
domain is not robust.

Hence, rework dom0less domain creation sequence to probe guest kernels
first, before creating domains, so guest type (32/64bit) can be properly
identified and domain type configured correctly from very beginning.

[1] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01647.html
[2] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01648.html

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/domain_build.c             |  4 ----
 xen/common/device-tree/dom0less-build.c | 20 +++++++++++---------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 59966f1bcd49..bcd642477d1d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1986,10 +1986,6 @@ int __init construct_hwdom(struct kernel_info *kinfo=
,
=20
     iommu_hwdom_init(d);
=20
-#ifdef CONFIG_ARM_64
-    /* type must be set before allocate_memory */
-    d->arch.type =3D kinfo->is_32bit_type ? DOMAIN_32BIT : DOMAIN_64BIT;
-#endif
     find_gnttab_region(d, kinfo);
     if ( is_domain_direct_mapped(d) )
         allocate_memory_11(d, kinfo);
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 8906e35e6978..14829ec465d1 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -746,9 +746,6 @@ static int __init construct_domU(struct kernel_info *ki=
nfo,
     if ( rc !=3D 0 )
         return rc;
=20
-    printk("*** LOADING DOMU cpus=3D%u memory=3D%#"PRIx64"KB ***\n",
-           d->max_vcpus, mem);
-
     rc =3D dt_property_read_string(node, "xen,enhanced", &dom0less_enhance=
d);
     if ( rc =3D=3D -EILSEQ ||
          rc =3D=3D -ENODATA ||
@@ -770,12 +767,6 @@ static int __init construct_domU(struct kernel_info *k=
info,
=20
     d->max_pages =3D ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
=20
-    rc =3D kernel_probe(kinfo, node);
-    if ( rc < 0 )
-        return rc;
-
-    set_domain_type(d, kinfo);
-
     if ( is_hardware_domain(d) )
     {
         rc =3D construct_hwdom(kinfo, node);
@@ -836,6 +827,17 @@ void __init create_domUs(void)
         if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
=20
+        printk("*** LOADING DOMU cpus=3D%u memory=3D%#" PRIx64 "KB ***\n",
+               ki.bd.create_cfg.max_vcpus, ki.bd.memory);
+
+        rc =3D kernel_probe(&ki, node);
+        if ( rc < 0 )
+            panic("Error probing domain %s guest kernel (rc =3D %d)\n",
+                  dt_node_name(node), rc);
+
+        if ( ki.is_32bit_type )
+            ki.bd.create_cfg.flags |=3D XEN_DOMCTL_CDF_is_32bits;
+
         /*
          * The variable max_init_domid is initialized with zero, so here i=
t's
          * very important to use the pre-increment operator to call
--=20
2.34.1

