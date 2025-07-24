Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA33B10E39
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 17:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056229.1424430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRe-0004ej-Fn; Thu, 24 Jul 2025 15:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056229.1424430; Thu, 24 Jul 2025 15:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRe-0004XP-BA; Thu, 24 Jul 2025 15:01:18 +0000
Received: by outflank-mailman (input) for mailman id 1056229;
 Thu, 24 Jul 2025 14:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMfj=2F=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uexNx-0003AJ-4K
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:57:29 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83e2fdf6-689e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:57:27 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AM9PR03MB6756.eurprd03.prod.outlook.com (2603:10a6:20b:2dd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 14:57:25 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 14:57:25 +0000
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
X-Inumbo-ID: 83e2fdf6-689e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNpVKx12R2kR1p/R3U6KRwTyAJi35L1dG+gVlkksCunWe5dgyFw7uavDsclYHKUe84FhKYTT7U3bqNJvUm8i8vS5lrD8pfeyw602Up6LBEvA6mBlk/PUNZL1o2BlaQSDiwHqOxkCi4rMLahkU1AWXZdpnsGPDuO+gFYENGIV6/fvoYvRN7mfftdv8z1PdQGpb2NlsCm6MWjZH1/+mm4jyTvFfxxX/p7CL/2Qqsq/UL/F/bgsFRkqt/E26NUQp32pg+qXnKv7EjdTY1ruFMJir6aapPqzNGbjr1BpSPMwmruoMlsBmw83NZ1RHwnUt/Ejrkw9gndRUGHRPOhxvM1pKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkXMdcYZElU447yfHOg3hHZQC6lnB+D1rzPhPCLCkHg=;
 b=Yx6Htes1jgDTfXtwlHqpGz+vXnHgUPVA0/V9nAZVdD2g9eKM8DlbI90lz+RQB1sH2+sMxJQZkF6pI2OBcVvAXbQeYGgtqsaBazYiqbj0S5tEbVDu3x/waxVAUeOnksRe7/AdpQWkIWPXKXZKVmhdgCnp+8J1JDyBkxcXljf80uyYfc2945zSVAfB300yEWW/YpwbLnLAlURU62UZfEyBN98K5S676ByHmfIlU58JkoP4TnIS3htrAlypqDSc563kWVXPJ5KB8fVltnjVn4YxuJQlN1X22ikH81YcsJ+hRVdkg8iOQEGVIkp1BPjVBiRHCrv3L2+lfcSClTKNDeV87w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkXMdcYZElU447yfHOg3hHZQC6lnB+D1rzPhPCLCkHg=;
 b=p8Bs7dvFM2lI9T9bIs06HKKVYD523dkYNa7eU50sWlawhnAaF3Ie7v6gsh9pl7k2czTFQ38QHV22ewhZ4NMDgs1cb13tgTQK/dt4x6sCsxCsMr8GL3bUIpgBmGUW0In+uGStARC9H98eknQV5akGrIZRpltdhK71Df59RrwHcnZoWDYKETpIWW6UKpz2gCvdUgxUXhyx3t8a+CZNpPi28O7kvTRA6Rw3EVlODQ9B1GvKfT7zsZRtstk4Vs533Gup19jhJXXK6p3u1OeHIXQYMUx5A/3HEub3tSOSVgbFAT+UFqOU3vMeX9QGsLOlsknJ7Z50xskMc+YHlZBldkzg+g==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 02/10] xen/arm/irq: add handling for IRQs in the eSPI range
Thread-Topic: [PATCH 02/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHb/KtEJYrDUu1qgUOuYJsg7nHmQA==
Date: Thu, 24 Jul 2025 14:57:25 +0000
Message-ID:
 <fde45aa6de09e955aee54ca38d7d0e994ce7f6b3.1753367178.git.leonid_komarianskyi@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1753367178.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AM9PR03MB6756:EE_
x-ms-office365-filtering-correlation-id: ef0e2596-4733-4f75-9ea0-08ddcac266a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?e03sce+CwHkqK1H9v8gWfzdA9uwVgaX2cGcyhihggGS3diQLp7BHonPY2Q?=
 =?iso-8859-1?Q?ZDq8ouept38CGuiUCOBe2qMcd4IjudC1e5n/bPJ/fxF7NJ11yAQvFhRIUe?=
 =?iso-8859-1?Q?JUEaZZ9tsOEAa3wJQFALXTsA3JiAzSebX49rzs31q0aoyTKq3dW9b64BXE?=
 =?iso-8859-1?Q?j6sP7jfIWbAhdkWchNQHTDPhTSgog3xLhsGBd4Bkxs+OEl2v2/XOTXljGV?=
 =?iso-8859-1?Q?SnRq6uaVpOKJcwoGvGfZ9uT8VRIoDraE4hNf0YT+Dt4BjIDcGtUAfPmDwJ?=
 =?iso-8859-1?Q?l9CrjLtM8Xn1mywZgwOtFmcEasTi3dytEugR8iw65E+D9Q2E9eztrC8sl8?=
 =?iso-8859-1?Q?i3lxKR69sYSiheHUfu9J0TNuHHiysANZlPD8eBg6bOhYtup8jbUswVNtJw?=
 =?iso-8859-1?Q?9Oe9DRyjIufQlNXYeOw54tkV7kfLikgMyyWYV3zuWiofQEbvmzqpCpmHpU?=
 =?iso-8859-1?Q?UX3zKovSyc6FUK3SdtyMucEjeAmXeT3jYXddlfh69iXSJiopxaw4GUhx5T?=
 =?iso-8859-1?Q?e/WVHxFsbaf3FU4iUcPpfmtmontiaoanV7B10Gio6o2/pOknaj+vTEaFRv?=
 =?iso-8859-1?Q?54AoyHf9aAjJZSw7Bw591bXBiuIQBb795ZwrAulU7Hjo/GJNJax7kbWR/3?=
 =?iso-8859-1?Q?J2ADZJRB04LnfJqOe3C0l/+FTdususCx2xiYBZiwMF4QhPMydkNsErFK9w?=
 =?iso-8859-1?Q?xy2Gb89rJqODGvZL3W1sxt570gUDL81kTKgnRoYsUyl3OW9U6MAlA5V86N?=
 =?iso-8859-1?Q?xOcXGMUsGyfuSGGi72IDAjDM7fHf8OyPJhF94mNtbhpOrB/c4EA/8bpsLN?=
 =?iso-8859-1?Q?dzR1f9bXlbAc5fIKl6ofOhOvqVFu/SoTFCuTUaLKJSD0xHl3YdLvvwG81x?=
 =?iso-8859-1?Q?4cQSdnCz+r77jtznYygFYfUhmE5pW+lMpUpDcWiqR3/tAUttD9NXa4QSoH?=
 =?iso-8859-1?Q?0jdlw13pIm5KEaFKcGYaol5n+KvREvo4Hz7zf91BjcdYRsVdBXSVo19C0/?=
 =?iso-8859-1?Q?NGpdhlgY1Q/vX9HHlXFPpxPOSlPXoLefGhw3/ygNrrOkqSMZGco9XE9K7t?=
 =?iso-8859-1?Q?IaK13WvMoeRTSx3vqP062dF0vOa6Lt7DqejCUmzZLTVvOeTK5Yzzj4V0uB?=
 =?iso-8859-1?Q?81X2YYPfJY9/Ee51QZ6cEThN4E4CVbrSvNKOzvWAPa1oWuv+7nUkaX8HI2?=
 =?iso-8859-1?Q?A/wA72Ic/kwKFOe4MEGs6sIlz7yrL/8Xi+vNiQPDLww5EmsGLLIre4jnTh?=
 =?iso-8859-1?Q?Iza0Glzo0Xy3Y9OP3GHrgOG/F99UlE8jWwMA0ueTwlF+EPY8yDZIclNWYw?=
 =?iso-8859-1?Q?ZjTUN18r+jxZQ3vSUuXCCeZXyl37FPgfpe8TGMRZAll1oPQ++HNu/P4Ggv?=
 =?iso-8859-1?Q?bl5c9iZBaLBmo86cG6QHmePe3rRYIhR9WHqCEVbM+fzWv0mR7MR0/0kqlR?=
 =?iso-8859-1?Q?kG0u+UXo72DZuX0YsSXz01DvpJdqoAakwufEmbOGp1JCfw3+MMe6l6OJcv?=
 =?iso-8859-1?Q?M5oOwsxjqmVc3ibnEesnLL7+GsCvjJs8eAnJDMNtBN3Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gqQNqeylgXPU954Z8jH4VeczTztBqygvFULlr/FcHjGEyt2CWpPnhlr8oH?=
 =?iso-8859-1?Q?kZajrvjHpqdwteoQJmt/Vd7aZ46dmZCY9sg88Bl+xsQFgJ7QXRO3+lLdxz?=
 =?iso-8859-1?Q?UR1LjTdz+czX87+fOhY9TnhlPkOGm+s8PpluS8th1INXPlxTC27tt+aABz?=
 =?iso-8859-1?Q?rsd63Eh2sCDHaFXb3N2ItYInVGVpRV6s8JbM5TsBiaqllVL/bERL5wJ3IS?=
 =?iso-8859-1?Q?FYWUB/azhIaURbcW+MxdTcTSOLG6gjZ473n57EYNUduq9hvz80PW5XiCoI?=
 =?iso-8859-1?Q?RMep58sW1b2uWyMclA+CBMhMCu5bxcOH8hjtSYEfg0SsOSWwznNFqchc1z?=
 =?iso-8859-1?Q?CN1mwzPuyeFdNgBjZ7My0JzRU3P/4ujRoJ9pFlZ5kDwEz2lcJ6qmD2lM07?=
 =?iso-8859-1?Q?TQ3QHGbCM5s5TO+MT4aHx9lZwqXSe2yupXF+IeMWYsPe7J95ZzCe/9mxFX?=
 =?iso-8859-1?Q?QVrCKQTutaZVbUnCjkV/4ZSNOpP9/vQozYkuJlSfLe6zjRVwqlTJUUB0GN?=
 =?iso-8859-1?Q?Rlz0cVMAjdecJWbYejb4J+11vqbK2hvjs/DjdExQjn6ziCruixZMQmQW10?=
 =?iso-8859-1?Q?UEJ1B0BnGvhTvuIkXcrZL+N1H+4bIp98eqh1pnCpxyonzRKS3e9VsZVqZ+?=
 =?iso-8859-1?Q?Z9Dbrkd7q+2qPfSHVIoOBXkiq53V7NpA4tQHfStaLWQD+TQDuvWTRA1MT8?=
 =?iso-8859-1?Q?V0v8qx1U/RsiJUBHuck2oic0j9IrMuJEZbCtJT/Mb+RW6gzrwP9IV4K9+p?=
 =?iso-8859-1?Q?6pQf/cvE3D0MqWJE6MTbQ9K5NSre4+VeQnSwo/zoD/W0CEtYY9/jxoz+h0?=
 =?iso-8859-1?Q?SBPRxlmHfDIP9TP9kkPKB1J3icf7ZWYEwGTfcvvZ4qjTSWSWgkyZvPiDH3?=
 =?iso-8859-1?Q?jDwDmBdQ3Q6kn55w++No+CZDd/7xFkuK5MbDI6SiXDZPHinrDPE0ZI3ENJ?=
 =?iso-8859-1?Q?uM+al5nt9f672gZWLNToeBfrCkHK2oObHl2v4mNyCrawBiyvypA/P/qBdY?=
 =?iso-8859-1?Q?5I6AFsGo5z5R7zvn2aPDGyC5YEZvBC10Xz8XpZK3NDlPDtpCSTXq2LvQfQ?=
 =?iso-8859-1?Q?8p5HIEiB3c3N+Es/8XKclc1OIhMGKWpjT+FsOcedQqnIXEodpFij+dh+y2?=
 =?iso-8859-1?Q?muAOwtwuuFFmt21BQ7P4p5zlMYpyH61HhfmkYSKDQ+opJzhtMqs0VPN57i?=
 =?iso-8859-1?Q?M0OvP4//fFPK15M7jJKR473n+cI1a5a4zhuToJxZg3pQSjgewnp3rFwfS9?=
 =?iso-8859-1?Q?FPYUCQmKWm6DKhj3NUqRuWivit2tkiRWc1jIvfy7BgOkNxQq1hCmgs9RoG?=
 =?iso-8859-1?Q?NEktc10SObfgr3m0gZOA/r2Qn3wHWNRkyEM6nF0Vfmy1HBFshl7zMz9eQd?=
 =?iso-8859-1?Q?6dlnTqGTFWYhtXB4wno5HDImeorcm0ktiaVfjfoZb/sOy+STR22KP7ng4o?=
 =?iso-8859-1?Q?nwm7hl3BlRxdZDHRr8d1Rbxf+yLU30RkH0AwjVl7o1wrXUifge9CWiyDh1?=
 =?iso-8859-1?Q?cvGhCdRoZ4Bdszy9VRhdcwyX0gQfm59RwsxdOaYO5LutjxtvCDES0xsLda?=
 =?iso-8859-1?Q?Ogw+5wjCwo0Z8Sw3id47UHNdEYDuVvZf/X9+22zFfF/wCIk40UyYIJo+nz?=
 =?iso-8859-1?Q?rRTKpyeQYD7tPk/imoOt2aMdDpzB2oM0BsEmSGFTmv4kz3DAItQJxYqqy6?=
 =?iso-8859-1?Q?QglHE8zi++iXqsAHMN8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0e2596-4733-4f75-9ea0-08ddcac266a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:57:25.0845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a03nkL5mDj/E/nUB0mjVQ2+P6cy2jDU2bHR3ryl6CEtuRAozdyfY3gDTi0TxLNvGT2oLewRNxebOIPLLEXxUAsY1GuokR4qpFz1oZsHs4R8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6756

Currently, Xen does not support eSPI interrupts, leading
to a data abort when such interrupts are defined in the DTS.

This patch introduces a separate array to initialize up to
1024 interrupt descriptors in the eSPI range and adds the
necessary defines and helper function. These changes lay the
groundwork for future implementation of full eSPI interrupt
support. As this GICv3.1 feature is not required by all vendors,
all changes are guarded by ifdefs, depending on the corresponding
Kconfig option.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
---
 xen/arch/arm/Kconfig           |  9 +++++++++
 xen/arch/arm/include/asm/irq.h | 25 +++++++++++++++++++++++++
 xen/arch/arm/irq.c             | 30 ++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 17df147b25..08073ece1f 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -135,6 +135,15 @@ config GICV3
 	  Driver for the ARM Generic Interrupt Controller v3.
 	  If unsure, use the default setting.
=20
+config GICV3_ESPI
+	bool "Extended SPI range support"
+	depends on GICV3 && !NEW_VGIC
+	default y
+	help
+	  Allow Xen and domains to use interrupt numbers from the extended SPI
+	  range, from 4096 to 5119. This feature is introduced in GICv3.1
+	  architecture.
+
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORT=
ED
         depends on GICV3 && !NEW_VGIC && !ARM_32
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 5bc6475eb4..d621f17f10 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -32,6 +32,14 @@ struct arch_irq_desc {
 #define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
+#ifdef CONFIG_GICV3_ESPI
+#define ESPI_BASE_INTID 4096
+#define ESPI_MAX_INTID  5119
+
+#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
+#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)
+#endif
+
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
 #define INVALID_LPI     0
=20
@@ -39,7 +47,15 @@ struct arch_irq_desc {
 #define INVALID_IRQ     1023
=20
 extern const unsigned int nr_irqs;
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * This will also cover the eSPI range, as some critical devices
+ * for booting Xen (e.g., serial) may use this type of interrupts.
+ */
+#define nr_static_irqs (ESPI_BASE_INTID + NR_IRQS)
+#else
 #define nr_static_irqs NR_IRQS
+#endif
=20
 struct irq_desc;
 struct irqaction;
@@ -55,6 +71,15 @@ static inline bool is_lpi(unsigned int irq)
     return irq >=3D LPI_OFFSET;
 }
=20
+static inline bool is_espi(unsigned int irq)
+{
+#ifdef CONFIG_GICV3_ESPI
+    return (irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID);
+#else
+    return false;
+#endif
+}
+
 #define domain_pirq_to_irq(d, pirq) (pirq)
=20
 bool is_assignable_irq(unsigned int irq);
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c..3f68257fde 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -19,7 +19,15 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
=20
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * To operate with IRQs in the eSPI range (4096-5119),
+ * we need to add the eSPI base interrupt ID.
+ */
+const unsigned int nr_irqs =3D ESPI_BASE_INTID + NR_IRQS;
+#else
 const unsigned int nr_irqs =3D NR_IRQS;
+#endif
=20
 static unsigned int local_irqs_type[NR_LOCAL_IRQS];
 static DEFINE_SPINLOCK(local_irqs_type_lock);
@@ -46,6 +54,9 @@ void irq_end_none(struct irq_desc *irq)
 }
=20
 static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
+#ifdef CONFIG_GICV3_ESPI
+static irq_desc_t espi_desc[NR_IRQS];
+#endif
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
=20
 struct irq_desc *__irq_to_desc(unsigned int irq)
@@ -53,6 +64,11 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
     if ( irq < NR_LOCAL_IRQS )
         return &this_cpu(local_irq_desc)[irq];
=20
+#ifdef CONFIG_GICV3_ESPI
+    if ( is_espi(irq) )
+        return &espi_desc[ESPI_INTID2IDX(irq)];
+#endif
+
     return &irq_desc[irq-NR_LOCAL_IRQS];
 }
=20
@@ -79,6 +95,20 @@ static int __init init_irq_data(void)
         desc->action  =3D NULL;
     }
=20
+#ifdef CONFIG_GICV3_ESPI
+    for ( irq =3D ESPI_BASE_INTID; irq <=3D ESPI_MAX_INTID; irq++ )
+    {
+        struct irq_desc *desc =3D irq_to_desc(irq);
+        int rc =3D init_one_irq_desc(desc);
+
+        if ( rc )
+            return rc;
+
+        desc->irq =3D irq;
+        desc->action  =3D NULL;
+    }
+#endif
+
     return 0;
 }
=20
--=20
2.34.1

