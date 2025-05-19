Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98998ABC31A
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 17:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989964.1373964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2lh-0006JZ-DO; Mon, 19 May 2025 15:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989964.1373964; Mon, 19 May 2025 15:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2lh-0006HI-4c; Mon, 19 May 2025 15:51:09 +0000
Received: by outflank-mailman (input) for mailman id 989964;
 Mon, 19 May 2025 15:51:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWXC=YD=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uH2le-00055d-W8
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 15:51:07 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20612.outbound.protection.outlook.com
 [2a01:111:f403:260c::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1298e768-34c9-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 17:51:05 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB9023.eurprd03.prod.outlook.com (2603:10a6:20b:5b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 15:50:58 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 15:50:58 +0000
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
X-Inumbo-ID: 1298e768-34c9-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvojqNmdAdi3vUx1VnPVkxS20qvzhQiT1gPOSfH6JYQ6WPFm5hrV86aa9tgLYADpA9x1rgTxzG3lwoTpMddrnH4UB3NDN3PVBsRCkVsgmDf48XAOOnI4EKa9NERYmHh/j6o3zS0jRvboFsjMgFDUs/kAv+Wqt/NT66yfNZLou3u6mY5XDJX2bic9/5ZBwTuclhiCLBPzq7eOGEohHmXT/NQ4tXf366LFCeBIbA7uzhmyhMjx1Lh/FqOHAvWInIbYOe16LDEMSegIbkPMyObwR1gku44y96AKKGeqwKA8iRyWVaABTDbWo3b901eKX4FYRe8oFzKW0DCK/yvBBfa8xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngb/Uc83s7G/8aLrdtXV+MINpMrv6VMh+dzEgsn3NaQ=;
 b=lGQpMZCCs/+E6yag8SOhx3VcQYtLSPyBwhBBAKevjGgfJMmCLfAkWAt3twRlay7ksUzmrSnfPPZJvDKH0iSuZuZtjJqxcyqfTZaeRKf7/ZsqDNQApfI4IoxqqXvQQHBzM2qtafzdUTk5xOU8aioYjuetJmsMVBWYjZHKk6FaeqsC3vJymPNVNtLnlDeV06zBTsxXZ+TFzQxc6r9RHzEB8FzJIn7F63yqlRDKSoCdXMoNyOZrwVKna9nxXQvk2IAdJhBIwuzXqiTHfKPgpCT7olREfKVSqILF1Fe+6Vmu0+emqbALJetFS2brCMtX1glSzSSpubyS/pyhAAqif8Py4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngb/Uc83s7G/8aLrdtXV+MINpMrv6VMh+dzEgsn3NaQ=;
 b=Ft705z1BLCkBkrSM8BF8su2/xJL5aQZdsQjzn+qMdzdu2tu++a/edXvc385LnkZ7u2M6JkMzJZHW2PD3Hdo5GiS0HjF0JNWlRZ6X2Sbwd5UblexmnzPQXW4hy4/yEgZXYOe1IKRCk+iQToRRNsZCDUqTGNAKM12fMVSdg3iH4Ze+wq84eGo+8PXobMxs24R0gwM4y/uJ0RSI7D9k1cbnvTN2w9ofFRMvoEzNKPNKLIbHRZYYM8jjOfNFaFVnBjkbwrlbjv/YuIHZ+xccDYI2lLjfhYNyBME6bI/NJFEGgTpbzSmithOZEpsgB47TaWpNFgwyyP4MPt75DkVMR8zHeg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
Thread-Index: AQHbyNXPDXt2FT3RV02cltfdm/Dd7g==
Date: Mon, 19 May 2025 15:50:57 +0000
Message-ID:
 <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1747669845.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB9023:EE_
x-ms-office365-filtering-correlation-id: 4814fdba-2e4e-48bf-f582-08dd96ecf29f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Fk61h06h5Zkt3QzB2qONmvJMJTHsQ+pMeJ4dlo4/aDhJkFIPsuvoYaD4Vf?=
 =?iso-8859-1?Q?nHV5wgoNXlLNAj9EwjekpRSYGbj5Uda7wS+R0Jpo2bdzBFaMjLrM1oMRvu?=
 =?iso-8859-1?Q?/P4MA/WTJjn0lWZ5ITLdgV7ttBZ6Y9j5FD3gBgirmHCAab+r/1WtDA1TJP?=
 =?iso-8859-1?Q?gpX3U02G5FAfvKfIvuIN7nBvCY6iMzSxCc1DCft4eeickLIC96OfxaBNSg?=
 =?iso-8859-1?Q?h7a74X3J83Ckau/1zS1q0HzX/r3cjAtgbwOOFaqkQE9J+kYc0ls/JHyHma?=
 =?iso-8859-1?Q?tygjuUL5IX7E7qe4AhjrBSuraOOc/ZqtfroXtnpgtcxuMAasbb3eT0zFUD?=
 =?iso-8859-1?Q?X2li12IvMyV90BSIL+S6R7eNqwLACwYEmGMC57933cFx9juU2NRxkopcIL?=
 =?iso-8859-1?Q?mLi9z2PwMBFf4F4xP7lD3bhlOlNYGqi7rT+KC/1uxqRulr4lHCRnZW3ioD?=
 =?iso-8859-1?Q?31P5xjDZpetQe0IK/1WVkrPjjohdtMt5KvyM5y4RHPvm20OzjnA76xcUnU?=
 =?iso-8859-1?Q?JhH1Ch1dG/3QZoCs9cOQYJs16Kru0pnbSongyYFJA4uyRoPqA2oaVnhauQ?=
 =?iso-8859-1?Q?tjbVTsvYp7TmRJ7k90y6Xo/syfDiW5OjirxzKUv2Y8NTO5TNW17f7d49rc?=
 =?iso-8859-1?Q?F4z3aanryNIlLHs1sma+w9CwHEGoKTZcRMkBZAHtaBcdY2JpihymK/K6iR?=
 =?iso-8859-1?Q?AfRWNdvO+e9bzpoWhxiNX3K/E/4kkAMbFCMs14E/l9pX/c5m6qsCWZVWFX?=
 =?iso-8859-1?Q?G+hHJ4sUz66RRlMHdHohkZUeku6iO80u5dn9fKaMOnoatDZU5xxaTje07S?=
 =?iso-8859-1?Q?5YewifXdYNSHoAI+pvRP3PrmxLclqvXpuiaWViCqJu/KYLG5to07rywcYF?=
 =?iso-8859-1?Q?S7/lNSm0BkypMJof4GsXHamZpd2qDcLo0hp9Sdvb4zrplflWqnJsD53fsO?=
 =?iso-8859-1?Q?T9mMz3gtIf+uBdbwJdU5rG/CdB1C/kDPgSZsYValEX8To7wjVnoPvaiss1?=
 =?iso-8859-1?Q?dMnqqXlTJgSMZHEC0gb/1rk2KjWlOe+pyoCQVDQA9mT6TRoH9lUWuYq5B7?=
 =?iso-8859-1?Q?cQiSYlibEntaV54B1VpOVlMQuLxy3O6WJ+ElY4NG3QbkAMkP4xAZickOPS?=
 =?iso-8859-1?Q?nHdjlg94Bfm6CZnIbLZPIp3evEYeKyycPUe8DNYPyy/Qs4nmWKjie2C2tG?=
 =?iso-8859-1?Q?8IQT9uL635PYZbwYWuvemIeE29CDeOu0kU1r9iY/XHTs80usuBOApIUqkW?=
 =?iso-8859-1?Q?3o+ghZgMpKr7onZkHCDFmB7UAW2vx8kwwy0fgvWOIMqsKPEA30C/w758N0?=
 =?iso-8859-1?Q?973FSifM8xSZJ+/Ra2wsapLKbmex6dDOdUDoLrSrj7e60E+vsDBVA2FiG7?=
 =?iso-8859-1?Q?Rgp8m7ZOE8dTPUkVjxz8lIj68FtozbTRbpEZ8IwgPEAp2tvZzF8J1F4lbV?=
 =?iso-8859-1?Q?iWDTZy5IBdz80EMXxfgbjvF6RqCf0c7al6U3i8hyaj0feKM5Mzff3gN0aO?=
 =?iso-8859-1?Q?U8BXrdhUnorl5iqLp9Q0nB5yMQ++SzZfxrNEx/NecLOVEXbGbV+fSOmWcC?=
 =?iso-8859-1?Q?HBen7TQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7qlLpp1diIGUrXgCIuBS2MIsAbGtWBHWNi8sPQzgYfzIcI5zd0oWamKCpD?=
 =?iso-8859-1?Q?hDZg8J4wn1YIEc9QwBIGGKMfWuSxwrBGgZI78oIaOo96RyQtT5zJxKOH56?=
 =?iso-8859-1?Q?BzFGyo+avEsRU3C8KHH3e+enzZSTNgOby8Bq7/28Y1dyttAr4ZID+ZtWSZ?=
 =?iso-8859-1?Q?tFPtnambdnxIl1wXC3H8OhXPCjmyKTJJtV4ELCe4Cm1gppU7vfUACTYy7a?=
 =?iso-8859-1?Q?uQoLxB2cBRms3zdsk77fvlNkSc/1D616Xcksux5aqn2hdPseF1xdgPbzET?=
 =?iso-8859-1?Q?3EqCr/kV+T54BOF++W4qd9jCJEErTuXUCKx/DLa85l0Fcg14vWIwUa6QIC?=
 =?iso-8859-1?Q?mZHSzZWpxmafo0nNHK97wdEeAUi5zW52hPTZdgCaYoVRrrumHgDreTxn/U?=
 =?iso-8859-1?Q?6w1MyP8XzhiV/6vLkwzi6X2Wip7cEBfAgvFurb8fI8vUT49LBbL6VARFJA?=
 =?iso-8859-1?Q?H+dVFsGXy78ISyaMOTtvpxwURAZy6FkvofRp83Ep4/MRw0SN1/lMOf4iMY?=
 =?iso-8859-1?Q?rWA/kKSniox2mFqbq2urnOAB7ZJZKl/wF7K6Nrs/Km6W48pMrLo7ft4Yvl?=
 =?iso-8859-1?Q?NTATJvu5fgT0IbsVzJ6Xb1+ofqwmiLmbEiu3o7/xkXWdHW1tcKy4MTKUm8?=
 =?iso-8859-1?Q?afBFr6ktj2qggEJvGkBMMN+lTTG996v7XKS2KVeBZ4cQ/XimzCg0qxoszo?=
 =?iso-8859-1?Q?4UmwouMTGkGTHYmKt5OyKsP2z6T7BbR/qLmxVvoV97vLwlBlX4MIVBT+cP?=
 =?iso-8859-1?Q?rR1LUUcxW3phLyOaAtJJhaud5YCWYvxHzHVo3R1ysymiwZfQt068pNgZqH?=
 =?iso-8859-1?Q?vpkm6I0To6UIyo8wWIAfXHCBYCBr8/cruTYDhfgAawz7mmFJZShQd4VjUt?=
 =?iso-8859-1?Q?6Ft9RecTfLLF1VgMylykb1yzRhvHrTR9PCdz6VVCFlgQohU5zdkrHPcyYN?=
 =?iso-8859-1?Q?muYPHmmPJjt19kBDyPeMEiz/GeZCQvfarhnjOz8xcFKnjh5HUCO8LRTvzF?=
 =?iso-8859-1?Q?UdroAAAST8NP3KvRa7KvAkbvNqxQ1jA4U3+GrZmu1jyG/gxJz1ojPLEJ4z?=
 =?iso-8859-1?Q?FxcjPOyNAejBN0h2EZRY1SC/T/dRnZH+bogrAbZriSBFKDKMsT/au2vWSv?=
 =?iso-8859-1?Q?KF0tme51thPVVWnB8GnPE+PIRi9nj6SRM/g9ONikTxm96PcWRH4FyCizXF?=
 =?iso-8859-1?Q?DN6FaZ68Mz6WAOc7U8uLln1zObEYnAaZTCvLiSh0Oe3fqvB5fa8P5h6Izn?=
 =?iso-8859-1?Q?i3BJSIYpEIgexbaCj/MRnmRc/V6fHq8/oM8VissgzT1b+VhnT6hd9DoVsm?=
 =?iso-8859-1?Q?mwOwrRRpL2S+xHmaFY625yeBeQuNYPtwskLg5HF49j+2xlQd3XVGgecNbi?=
 =?iso-8859-1?Q?O1+RzLPqUW+IyvN7NHO2Y5TIYItjJNjqaQP2Fdf3QhjH0RKKNwoHvIupDh?=
 =?iso-8859-1?Q?5Oy/qUsu+VKmsa89/ofjtZKcT8MJyJef8rUdvDsbni7U9hcpBjaUJms2h+?=
 =?iso-8859-1?Q?UdnZylzgDzMA4/XsFjN1m2+resSi4QTpg6KpE0IMb2TVirQRwKioexjK1n?=
 =?iso-8859-1?Q?u0Zkfg89L6C5qh8chpvdII9IZULGlsVUbTZzKPtdwjn0yHvktKgVI8FUUT?=
 =?iso-8859-1?Q?jxknycJXzesaD4I/+4ggtzi3E21mULuqdsjzZjlIK38mtaYy1nwQ8NJg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4814fdba-2e4e-48bf-f582-08dd96ecf29f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 15:50:57.3512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CqHYKHE03zuHq3KtnGYLIQQong7yhKITgflql5ORezTsKGv+tEN88sEcFlT2sY4i1UdsrUWo14GO77CLO+KUfou7s7fOXdq3V4zE+u+0Gtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9023

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add chained handling of assigned DT devices to support access-controller
functionality through SCI framework, so DT device assign request can be
passed to FW for processing and enabling VM access to requested device
(for example, device power management through FW interface like SCMI).

The SCI access-controller DT device processing is chained after IOMMU
processing and expected to be executed for any DT device regardless of its
protection by IOMMU (or if IOMMU is disabled).

This allows to pass not only IOMMU protected DT device through
xl.cfg:"dtdev" property for processing:

dtdev =3D [
    "/soc/video@e6ef0000", <- IOMMU protected device
    "/soc/i2c@e6508000", <- not IOMMU protected device
]

The change is done in two parts:
1) update iommu_do_dt_domctl() to check for dt_device_is_protected() and
not fail if DT device is not protected by IOMMU
2) add chained call to sci_do_domctl() in do_domctl()

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---



 xen/arch/arm/firmware/sci.c             | 37 +++++++++++++++++++++++++
 xen/arch/arm/include/asm/firmware/sci.h | 14 ++++++++++
 xen/common/domctl.c                     | 19 +++++++++++++
 xen/drivers/passthrough/device_tree.c   |  6 ++++
 4 files changed, 76 insertions(+)

diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
index e1522e10e2..8efd541c4f 100644
--- a/xen/arch/arm/firmware/sci.c
+++ b/xen/arch/arm/firmware/sci.c
@@ -126,6 +126,43 @@ int sci_assign_dt_device(struct domain *d, struct dt_d=
evice_node *dev)
     return 0;
 }
=20
+int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    struct dt_device_node *dev;
+    int ret =3D 0;
+
+    switch ( domctl->cmd )
+    {
+    case XEN_DOMCTL_assign_device:
+        ret =3D -EOPNOTSUPP;
+        if ( domctl->u.assign_device.dev !=3D XEN_DOMCTL_DEV_DT )
+            break;
+
+        if ( !cur_mediator )
+            break;
+
+        if ( !cur_mediator->assign_dt_device )
+            break;
+
+        ret =3D dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
+                                    domctl->u.assign_device.u.dt.size, &de=
v);
+        if ( ret )
+            return ret;
+
+        ret =3D sci_assign_dt_device(d, dev);
+        if ( ret )
+            break;
+
+        break;
+    default:
+        /* do not fail here as call is chained with iommu handling */
+        break;
+    }
+
+    return ret;
+}
+
 static int __init sci_init(void)
 {
     struct dt_device_node *np;
diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include=
/asm/firmware/sci.h
index 71fb54852e..b8d1bc8a62 100644
--- a/xen/arch/arm/include/asm/firmware/sci.h
+++ b/xen/arch/arm/include/asm/firmware/sci.h
@@ -146,6 +146,14 @@ int sci_dt_finalize(struct domain *d, void *fdt);
  * control" functionality.
  */
 int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
+
+/*
+ * SCI domctl handler
+ *
+ * Only XEN_DOMCTL_assign_device is handled for now.
+ */
+int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 #else
=20
 static inline bool sci_domain_is_enabled(struct domain *d)
@@ -195,6 +203,12 @@ static inline int sci_assign_dt_device(struct domain *=
d,
     return 0;
 }
=20
+static inline int sci_do_domctl(struct xen_domctl *domctl, struct domain *=
d,
+                                XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_dom=
ctl)
+{
+    return 0;
+}
+
 #endif /* CONFIG_ARM_SCI */
=20
 #endif /* __ASM_ARM_SCI_H */
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 05abb581a0..a74ee92067 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -27,6 +27,7 @@
 #include <xen/vm_event.h>
 #include <xen/monitor.h>
 #include <asm/current.h>
+#include <asm/firmware/sci.h>
 #include <asm/irq.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
@@ -851,6 +852,24 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_=
domctl)
     case XEN_DOMCTL_deassign_device:
     case XEN_DOMCTL_get_device_group:
         ret =3D iommu_do_domctl(op, d, u_domctl);
+
+        if ( !ret || ret =3D=3D -EOPNOTSUPP )
+        {
+            int ret1;
+            /*
+             * Add chained handling of assigned DT devices to support
+             * access-controller functionality through SCI framework, so
+             * DT device assign request can be passed to FW for processing=
 and
+             * enabling VM access to requested device.
+             * The access-controller DT device processing is chained after=
 IOMMU
+             * processing and expected to be executed for any DT device
+             * regardless if DT device is protected by IOMMU or not (or IO=
MMU
+             * is disabled).
+             */
+            ret1 =3D sci_do_domctl(op, d, u_domctl);
+            if ( ret1 !=3D -EOPNOTSUPP )
+                ret =3D ret1;
+        }
         break;
=20
     case XEN_DOMCTL_get_paging_mempool_size:
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index 075fb25a37..2624767e51 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -318,6 +318,12 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, stru=
ct domain *d,
             break;
         }
=20
+        if ( !dt_device_is_protected(dev) )
+        {
+            ret =3D 0;
+            break;
+        }
+
         ret =3D iommu_assign_dt_device(d, dev);
=20
         if ( ret )
--=20
2.34.1

