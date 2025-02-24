Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73A9A4189A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 10:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894977.1303592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbe-00046I-1O; Mon, 24 Feb 2025 09:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894977.1303592; Mon, 24 Feb 2025 09:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbd-00043v-UQ; Mon, 24 Feb 2025 09:18:29 +0000
Received: by outflank-mailman (input) for mailman id 894977;
 Mon, 24 Feb 2025 09:18:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vb1z=VP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tmUbc-0003pb-BH
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 09:18:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f403:260d::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e2cb060-f290-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 10:18:27 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8859.eurprd03.prod.outlook.com
 (2603:10a6:20b:56f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 09:18:24 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 09:18:24 +0000
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
X-Inumbo-ID: 4e2cb060-f290-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zre0OrYPctFznQ06P/L57StD2/Vf+dcD37UOjzIPNLTWC6iS790JlgaWT5YyBQjPgMTnCViy7w2gxHtIrcHa65TlbHYqAMaXiRT9QOajDQ7m3YVteJpCbBGmuIXPyvf5Lj8YyNfp/f9QMV8sfazoSD8iX3qeDqeC6Df6D/pRUCRD5UB4QPQYPBq77M48fkX1FADmFkGNi91Hzso11/maDvag3cX+pBy/SSNx1M/gpR3LMST70K0GNfGYI+PN5wdhdkWfiK2LY+tnn9+mj0TBZQfeXGQUZJL/x7ZffU1gTE3iRIy1iBPgxz8mmZgOZCv1MibpHxrqetZbuHPPIQVN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gblh8BA3B38RYzw5oAODeH7N8XCpfEMqk7ps6NGozAI=;
 b=GpmnHDTfIhdzjTvQIofLLzbVHQId43ZQWu393RFqIHmAwGhPGh5BU0rhWbK/erT1Lenv263n4tQ8n54wQKQxcvgFSPJljPQBpqRNXMqqCl+o0ftdmsS9OXIxX9xiihnmY0TKmtuuzReoeYvXAdFM7ktrf4GNGI5AvYGyMiPlNfCRNg0W1VPoPRSzK/3HNUVxadufOqYuDUz6Z+Papk7G5yWv0ULFBzK/fd/xrEjvb2bgLyOzXsJRQAM3yHGJ/p6aicWVywqyIIE4YCOHzqATMkRv9lRE6U4GJCXlSpKKv0C4wwA5CnloBPCm+IiF3+0HkdwJOIkfe5KnXeFivWpxEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gblh8BA3B38RYzw5oAODeH7N8XCpfEMqk7ps6NGozAI=;
 b=YHFVlDl8AhewLpqIGT9lrIV6H1qowwLEdzpQcKvwJFWMmjYMeJL3pbeAoUZnaRaeJDf5W2jBl7fzHhH+jBEOjB1fsM3Eprk4AV4kl7pYUkH+K9aXnHLit5f1e/6nLajsG9e78+E8O2y0CR65q6xRHGstOgYDIESXlrOZkrKumGO7w7k/si6UWnPNUjEAHnYOwn+6k8sio/ubn1y7FMRPH8A7SJCPnfnEkMjkMb0cIZ9MVuXFjcTjMR2HKWbCBvGk0dVbXoDlIHQoV7UrmVurf4GC7FPqgGgYYDl5+GGfJ+6AJ3mSKI8xk7oofuuB5wmx2VJdLsG4I/bYErhyxHv07Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH 2/7] xen/arm: make pci_host_common_probe return the bridge
Thread-Topic: [PATCH 2/7] xen/arm: make pci_host_common_probe return the
 bridge
Thread-Index: AQHbhp0OxJ4bxTlfI0yOtpGJET1sPA==
Date: Mon, 24 Feb 2025 09:18:24 +0000
Message-ID:
 <922cdc05d4821925c796c6411814dfcb94d55b21.1740382735.git.mykyta_poturai@epam.com>
References: <cover.1740382735.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1740382735.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8859:EE_
x-ms-office365-filtering-correlation-id: a5077c81-2d02-472c-9e8e-08dd54b430d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6oHPvNmwXDz2XZ7yTPbGISl4yK7AmFy0+TyRDgS6WD0Z8Rl20rTH7+0eG3?=
 =?iso-8859-1?Q?DFHerwys4AT58Z6DFW1pLkgjVX6tkLXR/fybfESmf9GbJSlyFcrnBuMi8Z?=
 =?iso-8859-1?Q?vyurwThk4IPXwpeRkZfW5gqo+21GzBYeA4FXcmpRNZjs8LLaweSWNPHgaP?=
 =?iso-8859-1?Q?I2Tmem12UKpczNlfB+LJsx7P6SeABpadjd3wttx9+E+ms8aHeBix2stpPz?=
 =?iso-8859-1?Q?0SpLVmWL9WaFo+oCciciiGJEy+pzkdFeAxoDQ1q8435qFkexNSKJNt1IaS?=
 =?iso-8859-1?Q?kNX369W+CvUT3Oy7Wj2Szgte4P+eqegbzDYyx6h1+k67VkPDA041ZFEBp7?=
 =?iso-8859-1?Q?I7GTKoCqnIvDs4I+3e4F1QF/U8L6d+GW7de+SQ6b+3rVcYyKMiOuUINBba?=
 =?iso-8859-1?Q?CFZgEbspFS1L/0BY9X75CRd3FGpQfJvMQMHFac0V6p2Zjr3SzAekzbG+TM?=
 =?iso-8859-1?Q?Bg+2YpoTBiuCNDOouNdH618W7TGjCHTqhIprOiPvT5cf/Wo+ettfSImDTN?=
 =?iso-8859-1?Q?rV3QGKrXN+1NRKacY9EkGecLuVT86h5J1r8BEO0rDsrPaOwDVdS7fhElk1?=
 =?iso-8859-1?Q?hzL3HoSWtRUfVElfcFBz6cjzGbNquViyFB0PPppMKaNgxB1ha3kGvATy36?=
 =?iso-8859-1?Q?jmMgXFyRVuMS2McJBwBkoCvUEQNTUab3MYe4dMX9j9Lf075YMwTN3y3ph7?=
 =?iso-8859-1?Q?gYjGsfhpkUfBQbAsPIFHwOqKDjOtkEluC2sYfGR2YXg2viPopGSc61sx6/?=
 =?iso-8859-1?Q?uxa+7B7Z+QKftt/yeKkgcTrtKNA796jM3PcLSFnqjPYNTnE2Aeoydkr6gw?=
 =?iso-8859-1?Q?Ou2gG9dxb8r4BC/KJqXpVhMarzg2QcCRlkMfDSuXwLl4yJNL/XAoteK+hc?=
 =?iso-8859-1?Q?KCE+YkdWHLc8ET8yNEnDzuiJUieZQm7QRVU8JtbDvFsvbo0wZ40lg4cweC?=
 =?iso-8859-1?Q?lBkDXXH+9ec8L0KMyKWewhuhitxKO4LAzstOiDzGNkktD1OYid9WEckSUx?=
 =?iso-8859-1?Q?d+MbIZ4bqzKmw96bd6SWuEaES3sPdgLKvJumv9EMjumzmSoHcSNIzIZASF?=
 =?iso-8859-1?Q?O77V4gVPBk/VgeRHHxuzl1fD0MCbCP/RDEnO29MQV/aluG03xVDbJNLj9+?=
 =?iso-8859-1?Q?ptmx3E4HNtQ4SW4BgF2g+wnUPg1HgZyG+W3n510UQ7pGKXpzy0TTpQz8Iq?=
 =?iso-8859-1?Q?DM38v7P+R3pfrcqCoi+0+UXl9DgpGV5Ag+bgj2cwjBBFk4XnH/rqtih66z?=
 =?iso-8859-1?Q?BM0LanJhA8ghXzHixXZCswsrAISrd4MYoRkMJvhdeIX0UDbG98DdH/KtS0?=
 =?iso-8859-1?Q?QQcggTmCyaoqewFvq0qoSDq7qsTgXGH2ErBdXPZHhHQcaWP4sSMURxXX18?=
 =?iso-8859-1?Q?9usuFsuCtfCo51b0vtTlCJvKJiVQg3/toa7gqaam+3gyD55Yw5p7OPmSe4?=
 =?iso-8859-1?Q?Us7W3lWQqzgpqOXmBsSfn5a0qdxQItMSd0xyzrgb9cOtco7G2Hb4TTffJc?=
 =?iso-8859-1?Q?d7xBtjbZ/bsp4+sMyw/Z3k?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6OAylqsHEI3pcq6+0986LUphGQnZSXnsvyxthz8IjKrFCPjEmo012GJ7O2?=
 =?iso-8859-1?Q?YqMeTNdznmgCW2yKvUfhBpVUkUa1VQypA4HO2drq6TIoSiSw+A9S3fg9gb?=
 =?iso-8859-1?Q?rQRsOEX3EADWApZBV62NFSzCMAvjniJbj17cFUoQDttHKt/RXnqsYXn0Aa?=
 =?iso-8859-1?Q?TrZAaPdtn72qYP/rYOF1SPHmtcMgAHYJLw8XjSD8pR3JRoY6uQwnC2ymOC?=
 =?iso-8859-1?Q?d5i3nOACgvcvyibhxD/ofcGOMPW+Vev48KbIVjrqxQbnvIU9JS0T2SAUxb?=
 =?iso-8859-1?Q?XbmSUVTLLLx08SshqBDQD/OTiX0PQfMMRRhxBXcIHChKG/dDDxTDUPghKQ?=
 =?iso-8859-1?Q?GGil4HTSz1GcnZlBEwlEKsqBonnKfgwaObYPwvXEXS3M4i7aBnM2nrPOpQ?=
 =?iso-8859-1?Q?uQ8d/+xBHXXIBwufwvkB4Vh37s9KjeATDSXd8P3gw366p8oNobOq1CcOEh?=
 =?iso-8859-1?Q?9QAZ/em4axAOhzAtp0OzRnJSXq8ZSztRQosL8HzuP2vzRhEnR7fUhkq7rA?=
 =?iso-8859-1?Q?AIMF4lACvYpPEr2pnu1QP/I5Mk3FE8GoZ9+Pc4I3Mkd+cTZOz/pkAW1a0i?=
 =?iso-8859-1?Q?i7IWrk/wDYqXgKt61BTzrAjN47Pau8Tbuooc3RCbZLyKEYPAsT5fIS3gZy?=
 =?iso-8859-1?Q?n24WQdRaoMKRuS4Yt8JrJCtsqVDgwmekwgk4fZ6hS2/UTZZKYv6U4mgbqF?=
 =?iso-8859-1?Q?GXZtKLnAJYYQekjIcwFlYGiIvIwruAf+CGur5dR2hjfSSBpJuYKQ7hkzpr?=
 =?iso-8859-1?Q?E+sPQ4SZ+Dt6LUs1pPQLq3+Bhm7HtnunL3ID9yzZPxYzYcuH1Us2QyKm8c?=
 =?iso-8859-1?Q?ULGUjwMxvYxKSC4D+Dz/4VRCnA+ZSd0AUN3qAFxAGpGUIuCPzM7XYRi2O6?=
 =?iso-8859-1?Q?ffLaJIBi61ZxZ3InRmvd2InsVKIafQplsgoC+hK+43+B/oSRSLFuJi7uV7?=
 =?iso-8859-1?Q?x5R6BC6ABdWneFhUyqnCnsxomQ+CQP79WC+KqikwpVMztwWf2FXp1SeP27?=
 =?iso-8859-1?Q?QCuUWviHYEpLPLwGABO1Y1sEeVO2f8tTbW0LHNL2ihv1ZxDLoeIfl20Czx?=
 =?iso-8859-1?Q?JqcnCdf1ElgsLr8/HDuGBxZRsru9uyLGdARenFI2Zax7k816Nk9XsKUcUm?=
 =?iso-8859-1?Q?5/MYJNYAzPaSWm+v6Pd8C6ueOPKGnLIpFQN8Je2UlzMPgXuFVP/gchPmZ7?=
 =?iso-8859-1?Q?V3eppR0hGTM/ZUz/pUpSvLKP88MlcwcjnjrW0SHUFmj6dl26uOpVapH3xf?=
 =?iso-8859-1?Q?Tyfdpfn4qZy1TLcU1WxaBP9UztSHrM2c8Ie5TqqAagJxlzcOYXbQoB5F3O?=
 =?iso-8859-1?Q?Xqs2rExigtysWykI1jZ/q5pxJdTrb7n63yOByOpNegfeOZsbkz5+mRW2Wf?=
 =?iso-8859-1?Q?nc3bBel/cFUF5XUPDoP/uM8JAx4NhAepLSxuseXQMBBv4/EBjYDxbgzF60?=
 =?iso-8859-1?Q?RRQgwZa8SvRLpl0F2pJuDg6KOP9XmBvTXp2dVbJYIOLEcLG1SkfTLqhKoQ?=
 =?iso-8859-1?Q?7QpGnkXuHYYNya3RPw1VvP9nwgO97SDj7ta4DDuzih2gOV0utwSKNn3bBe?=
 =?iso-8859-1?Q?V29sWnWREvoMQd9AXVeLbiHIjLTovdBiwVMPxy3w39Tky2cnylyEgLoP9Z?=
 =?iso-8859-1?Q?qC2hyP/C3TlpYAkeArSENip5CHtqgqkEIhnDi2N0iXk3V94dH18LTOVg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5077c81-2d02-472c-9e8e-08dd54b430d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 09:18:24.6687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JolKrYjr4h5iCwgGmlxT+2pPl79lg0SHaAf2OoRRmX6pd2CLOjtEOQVPY5JOwEz4Pwbn547hteC6+ukdPMCmcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8859

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some of the PCI host bridges require additional processing during the
probe phase. For that they need to access struct bridge of the probed
host, so return pointer to the new bridge from pci_host_common_probe.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/pci.h      |  8 +++++---
 xen/arch/arm/pci/pci-host-common.c  | 12 ++++++------
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 44344ac8c1..e1f63d75e3 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -17,6 +17,8 @@
=20
 #ifdef CONFIG_HAS_PCI
=20
+#include <xen/err.h>
+
 #include <asm/p2m.h>
=20
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
@@ -95,9 +97,9 @@ struct pci_ecam_ops {
 /* Default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
=20
-int pci_host_common_probe(struct dt_device_node *dev,
-                          const struct pci_ecam_ops *ops,
-                          size_t priv_sz);
+struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
+                                              const struct pci_ecam_ops *o=
ps,
+                                              size_t priv_sz);
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value);
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index be7e6c3510..e4e05d1176 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -208,9 +208,9 @@ static int pci_bus_find_domain_nr(struct dt_device_node=
 *dev)
     return domain;
 }
=20
-int pci_host_common_probe(struct dt_device_node *dev,
-                          const struct pci_ecam_ops *ops,
-                          size_t priv_sz)
+struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
+                                              const struct pci_ecam_ops *o=
ps,
+                                              size_t priv_sz)
 {
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
@@ -222,7 +222,7 @@ int pci_host_common_probe(struct dt_device_node *dev,
=20
     bridge =3D pci_alloc_host_bridge();
     if ( !bridge )
-        return -ENOMEM;
+        return ERR_PTR(-ENOMEM);
=20
     /* Parse and map our Configuration Space windows */
     cfg =3D gen_pci_init(dev, ops);
@@ -257,7 +257,7 @@ int pci_host_common_probe(struct dt_device_node *dev,
=20
     pci_add_host_bridge(bridge);
=20
-    return 0;
+    return bridge;
=20
 err_priv:
     xfree(bridge->priv);
@@ -265,7 +265,7 @@ err_priv:
 err_exit:
     xfree(bridge);
=20
-    return err;
+    return ERR_PTR(err);
 }
=20
 /*
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-hos=
t-generic.c
index cc4bc70684..dde6a79a8e 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pc=
i_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return pci_host_common_probe(dev, &pci_generic_ecam_ops, 0);
+    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops, 0));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host=
-zynqmp.c
index 985a43c516..c796447ac4 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pc=
ie_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return pci_host_common_probe(dev, &nwl_pcie_ops, 0);
+    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops, 0));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
--=20
2.34.1

