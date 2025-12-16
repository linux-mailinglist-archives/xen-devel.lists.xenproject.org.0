Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C3ECC184E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 09:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187649.1508987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVQKe-000124-W6; Tue, 16 Dec 2025 08:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187649.1508987; Tue, 16 Dec 2025 08:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVQKe-00010d-SS; Tue, 16 Dec 2025 08:22:56 +0000
Received: by outflank-mailman (input) for mailman id 1187649;
 Tue, 16 Dec 2025 08:22:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5a7Y=6W=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vVQKd-00010X-Jt
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 08:22:55 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b213a29-da58-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 09:22:54 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS8PR03MB9487.eurprd03.prod.outlook.com (2603:10a6:20b:5a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 08:22:51 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 08:22:51 +0000
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
X-Inumbo-ID: 6b213a29-da58-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPrx3SmYCoWqrdsfMTh/RvXObrc+qMDlT1SIioxlqOwUgCUWXNxinm/XnvG+LyVjSmzQpxeBKnSYG88QrjjQBI0MVkyL6B3o57WAL2LiULGdE9eFbSky97/YxX8Z+q/d+G58dcbvF7uz2Xk6Rf437HjgBCQBhyJi5SuBOTTleK2Cy4zmoOLtu2yNiOfsKusZhHz8JsNUMTI21vE16FZofKPhju/Kk2t2QP9k9xG9OlSJGSWQjcdMLcNBVjIK3Jy7CQ4/sanj8gG4r83xfGVlBtrB9abO1i0LgVWicmZUDkPZsh5V3QwHcCm6XytujcKZ9qSvAHjKK9MAmKig2BTZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ex/UrxMpgu7R1i1jcVvwwCh0n4O5CLU0y5hO4NKliXU=;
 b=L9nwKS7Y6W9jyWA/Bx825p0AFo3JvtiHl5NhNYQ/4WWsNtClECUCYtBF1H28Sh/lk/DIXp6mveGjmNZB9WLSG7+k762ufhoG9bX+fqIF/SzLs4AUwrxy/OGcJBsOnxEtEXBTAmTfpXYKZLp5jkCwz4T7VeeLa584vDK72+6vW0sXBQEIRtc4N4I9ZKNzc9pz5a21l7NoxD3mufHdCKKfq69oiHay1xTnm38AHGmioeivg/7bJ4SjP9US2pL41czXAC4RnqvhnjM5nwA7wfH/hswWmvgt11q90EL2RvAM62Ex7Rv5nSBIIXocXDJ9MSedYLHjIfpo9hIZ1PFSA9gtPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ex/UrxMpgu7R1i1jcVvwwCh0n4O5CLU0y5hO4NKliXU=;
 b=BgtJaVnLYBF5GQjuSqLSOZbi0/5wUEGK+dLVEAJyppk97BA8TvmrpNmTmbhfMQeLGhcqMpTMTpsW225bOG2jFC5fMZQAR93sGiM9SrdSgT31Q8HEu4EWYMZf4r7+N/kt/1ieQ8MivBZLnMwn2KIlRDqnRcg0SSfLA58Bx0DPMrPI+c9BiSdTZMduXb5CqjDvtczk4W364F20JciH9EoANXt+vK/m3oOzPHoG5P8ysQLWSpsYxD+jJef11ePt6Bh/9Mg8VJJFmI1P9BitI/bmSFzgQlFgf9lQDtOWCKSNrDNq2A/QB3KRTJ8gE5N08+3uiM/lK6t/cPscyYIz5ZzqzQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] gic: Replace BUG() with ASSERT_UNREACHABLE() in LPI paths
Thread-Topic: [PATCH v2] gic: Replace BUG() with ASSERT_UNREACHABLE() in LPI
 paths
Thread-Index: AQHcbmUrcEwVn+26xE+Vc6oA3vTwfQ==
Date: Tue, 16 Dec 2025 08:22:50 +0000
Message-ID:
 <1c846d023255a7a7a9ce533cde0a8db3c26eb855.1765811852.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS8PR03MB9487:EE_
x-ms-office365-filtering-correlation-id: eda8d98c-cbac-4aa8-ff6b-08de3c7c4db1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9slgr4YWA3qJbHxtUyu1c/+i+2DvCElWz4ej6Aoa+LLklh/CRgWTfD1yde?=
 =?iso-8859-1?Q?wkM7Cyl3tqGyT+v2iXfXqBC7m8qPyOTMPgTKJhyCe20BbrKnpnfu2UvKsw?=
 =?iso-8859-1?Q?TVy9xJWlNq9meVyR/WxUi6FlU73BTBoutWhZZgprMYR2j+nG5lUOdw4e01?=
 =?iso-8859-1?Q?y8jmsDo3pVlWIzEJUpPVkvbabj2UvXua/GoChbr7ROEbhEI+vRJ3H5kmYh?=
 =?iso-8859-1?Q?tJm15u3yk02bIgDqmxsJBVDVv5HkF1bT1cti0Ppb/OuW8UZEmSCjwInW+w?=
 =?iso-8859-1?Q?5iiop2zmAmclrkF+vZ5tqX8V3vB2RrQPJsxqSPLc2VYlSAKZ2H1oml2xOF?=
 =?iso-8859-1?Q?R240I6XQFPU6ZsSjpuQaPaO7tNFszoHrYWyloFCBdJgb0MGus5wbEIoIYa?=
 =?iso-8859-1?Q?5Y6ExrqLWOTFf3gbEDBgIStxENJBloCq7foTQOPlIiqRZWvbXRBoTb7f/v?=
 =?iso-8859-1?Q?6yYOxZBImmTJm4eDd9/v0Id+dea5HQpENhIUBwh7TO7E61unb140kuHpFP?=
 =?iso-8859-1?Q?l9AlrYdUzVTj6SdMKQ4g4CIMMwCdsqWt6G9IvQ2cpqibag50zAdxI1Kevf?=
 =?iso-8859-1?Q?K3qO4NIf+7MvqHpArGTlcXBsrmvg5j15fahL4pFeq9vYcNPy22s7SCBfTU?=
 =?iso-8859-1?Q?4018iW3IV91bQcqWDqySw9MBeDDh0zszUZ6DAh+prQSilqXxQ3ECtxPbKi?=
 =?iso-8859-1?Q?nW3LoJF9tyMJnzrErbZb+MWi2YPqmTS3/ngbC33XBKg3FLwJ0laj8WfJF6?=
 =?iso-8859-1?Q?FCPipV+mEakSy/8T2fBpjeAwcR6VocHzWkCzTAJ9KXjIlBwCtCDL9zEj9X?=
 =?iso-8859-1?Q?0V5NqPVosTH8L31w0tPMtaoRwosxTmVyXCBfPt8EOG6dh6l5EXzVQ+fV71?=
 =?iso-8859-1?Q?4hpHpliRvplbM4tUDuB1+ZXouN2s/ATWgUOk6eo3uDL25bmABGkTfggBkN?=
 =?iso-8859-1?Q?3DYEYFVSvhqAo732AzoIp3Teewi00m3mvzagvUVvpQgpsyyQZKKmjh8H40?=
 =?iso-8859-1?Q?3T/sS2BihBsvO6i8D44hKA72uNPr4vG+SudbuR6CvK9uLvku7f6tvuQK5d?=
 =?iso-8859-1?Q?4473EHw7drKgvAxAuJkQPkCelI3g9ZfrkNqInSMFE8dIuA4QmehM7I4JtK?=
 =?iso-8859-1?Q?qDOGAiVuN/Cws2rdTrrd/N50OvjsRLmzuxOW00j8nRWJUwxKfyxVAlbBI0?=
 =?iso-8859-1?Q?nHWG7vH+3/ylg4GwvyS7hyIkM/9K6bYb/sS5UQJ5tzOSzhlpHLRcSXZ34B?=
 =?iso-8859-1?Q?G0YxEy+HuGvCr9N3jwq33kLgKpfXhz1FFQUDGkWuOoAPKb+AP1bVMYylGp?=
 =?iso-8859-1?Q?xU7Nc2u+ClXRracWUvSeFV/d3k7yU0wYhIcHFb4v4h3mHYDHtWgxT8KBhi?=
 =?iso-8859-1?Q?fSEIdIWevweUzZVrezlaXxryu5Bbyhm8Blnfqjt0OuuFy47GR6G4tfzIqn?=
 =?iso-8859-1?Q?DMxC/tQjGb4mXKC5nB7rogaiUIcAvRwrcPtQqh9I73qqlFsrPwiWosofb7?=
 =?iso-8859-1?Q?Nz+NwGj1eVZ4Tpyn2a/cDDmf+4vEuo/6qt6nOBmGlZRw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?10vt0dhtT/eGgb5d36TmLhU9WZBSiAzEHGyyREKH1Vcp9sR2Ohjg4eAzex?=
 =?iso-8859-1?Q?8jf+5TFs43cpqDzQUyviQCods8mgyWJZ+bE84L9vOn1lnmENX5OV+yubTf?=
 =?iso-8859-1?Q?U/7mpvdZ3D5s+wxwCexC70ZHe0PChnFxz+i2mGfJKBWce1B9jDY4VoFZRQ?=
 =?iso-8859-1?Q?5y2UXeaUJ8H4NptOvElY+iJdzLfcqI1gUEz+LXEEXAHP5l71kH/dTH5FHR?=
 =?iso-8859-1?Q?IPs8J6yGf+n/cJ9ouLNYvTPkj+CGRKSO6b8VZAcVKxFxtj8t+n58d0EMPv?=
 =?iso-8859-1?Q?z7S1cv5rzbzD5m8A3EuhfgJ9DsEuD4VHhAG/kzw+YDUseWEuCpRZ+Ok0xS?=
 =?iso-8859-1?Q?pilS8G+07oYfs2ZTK2MjNcA6WgSqd8n5TxoUHfNOv9SyWOgdpVFKs6MHFA?=
 =?iso-8859-1?Q?dBVnIPC9ITIyxAiVJnh5I2zUwCKd1j8IaMIt2vFchdA7H7jOsaXG7juMnP?=
 =?iso-8859-1?Q?GNuCqX1TUL42YjrCDmk5nsMrQvCVPzC0NA8Da3lG1sTRGGg1q7w+GTW0lo?=
 =?iso-8859-1?Q?csMxBEVk47WyfmkUfiV6x0S8Oh0G9cusGbvsWXekXV9o70lsJLCg+CK4oH?=
 =?iso-8859-1?Q?CxlpFg/SjnV+lJcSPc1Is4eJdKBOUpeSHzpcZL1mWgDl/XfxeVYCciPbOS?=
 =?iso-8859-1?Q?IDbZRdwNPq2RTm7Ga+/VnxSq0PsLP7aX7Bgh5YIdybAl17J+++MPq4rkz8?=
 =?iso-8859-1?Q?WdhWTisI6mzO8DX3Qlfnou4bfOWdMGt/fe8GnJk7XoR1xW2Ycg6ejo+BDh?=
 =?iso-8859-1?Q?xavYhp5neIa80VdzEtILfmdXX4yLNSTQt87yGa+NXhyA2nMyLD53pvrBPH?=
 =?iso-8859-1?Q?aMG98/VWsBAjgNKfJcBPJ/6FSkQL0F93enNbRy9uZpn/1d8TSCn8AIoppc?=
 =?iso-8859-1?Q?RZN/lbCdOfPb24Lo2UOt3mv0sywHVrfQ4OQb2vDlfSA028proZrxleBxAP?=
 =?iso-8859-1?Q?AmVMClAawsWFttQg42iYtNZQpjOjeM5X2dpKDHuNl03msK0UJ7KaDhgnZC?=
 =?iso-8859-1?Q?0ApmcH4J7JmMDssKry79dvte47YaWAn7V5+5JaaBJkKSdYRKvUf/Y0wsbG?=
 =?iso-8859-1?Q?9L3MOiQ1g/ezcvF29CHp3r7UP8Ydoezbp/aGjyHGVcMyt0LXSxxnRYnu/T?=
 =?iso-8859-1?Q?JzmSz75dZig7MqUVeOdVz2IKwmZH1T54XQC6SP0yIlH5sK64pC0vgJGuWx?=
 =?iso-8859-1?Q?0lvnCzl1OH2nXEKCqg78BC5sVmz2bnm9umkicNIzVR1eSupoLek8igJWKq?=
 =?iso-8859-1?Q?MmPqoUMkyLtUfGcQd8JX3Ltez9Xkor1t/MhTRwb7B26WcrF2qQ0tmBXtra?=
 =?iso-8859-1?Q?wfsH3HzrECto+rtLakuNGwD3SErL9z2fgv7DvVALIsmDmTMbk/QRTX3h0o?=
 =?iso-8859-1?Q?vax6ziJLAnOMqMfNYLa5JgJoQgxEvFwz31i0O2J8/ZF7higdg49LdGJOKN?=
 =?iso-8859-1?Q?7vsI/8NDCboUh/4s32Ybfx0YlbJMpxeH1yHmr4kmQZ+X8klzGKYl8/mP/L?=
 =?iso-8859-1?Q?G7YuS4gIaDgrT+jmG8/4H4HF76pNzkgWXMTWmSiY5Mr7HSxYVl2h/KAz+e?=
 =?iso-8859-1?Q?fXgBBDelFn3HJhl2pJF2vdth+iHUKOMd10ERzhpyysGROurLzQN2v8k0mt?=
 =?iso-8859-1?Q?mmwN8k/3cLXXpZ2CS0QfIVn6m9ty/TsDmrBHaNhqeW0XwG6AyQZrn1Fw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda8d98c-cbac-4aa8-ff6b-08de3c7c4db1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 08:22:50.9093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +T+GuAy9pSgAxFjWC9Lq92QlWD1zt4I1UUSdRgydjSN5ztXb9k2C1vkzZkOxi00sp+6ZPpgme1JYVmAkHV1v9u6SvasP+Vppp3YbP8cN0sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9487

MISRA C Rule 2.1 states: "A project shall not contain unreachable code."
The GIC LPI driver callbacks violate this due to the use of the BUG()
macro, which causes the function to never return.

Swap BUG() for ASSERT_UNREACHABLE() to satisfy the rule without needing
an additional deviation.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- replace the BUG with ASSERT_UNRECHEABLE
- drop SAF-based deviation

Link to v1:
https://patchew.org/Xen/b26772df8733dbd1ce6ea14a6e8b73f278db3a3d.1759174857=
.git.dmytro._5Fprokopchuk1@epam.com/

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2215606139
---
 xen/arch/arm/gic-v2.c                 | 2 +-
 xen/arch/arm/include/asm/gic_v3_its.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index b23e72a3d0..db8bc310ab 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1308,7 +1308,7 @@ static int __init gicv2_init(void)
 static void gicv2_do_LPI(unsigned int lpi)
 {
     /* No LPIs in a GICv2 */
-    BUG();
+    ASSERT_UNREACHABLE();
 }
=20
 static const struct gic_hw_operations gicv2_ops =3D {
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index fc5a84892c..09c1538b75 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -232,7 +232,7 @@ static inline unsigned int vgic_v3_its_count(const stru=
ct domain *d)
 static inline void gicv3_do_LPI(unsigned int lpi)
 {
     /* We don't enable LPIs without an ITS. */
-    BUG();
+    ASSERT_UNREACHABLE();
 }
=20
 static inline int gicv3_lpi_init_rdist(void __iomem * rdist_base)
--=20
2.43.0

