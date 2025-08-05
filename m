Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F791B1BA89
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 21:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070914.1434524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMtg-0000C3-Jp; Tue, 05 Aug 2025 19:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070914.1434524; Tue, 05 Aug 2025 19:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMtg-0000AJ-HC; Tue, 05 Aug 2025 19:00:28 +0000
Received: by outflank-mailman (input) for mailman id 1070914;
 Tue, 05 Aug 2025 19:00:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kSf=2R=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujMte-0000A7-Pb
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 19:00:26 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fcce49e-722e-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 21:00:21 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9345.eurprd03.prod.outlook.com (2603:10a6:20b:592::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 19:00:19 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 19:00:19 +0000
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
X-Inumbo-ID: 6fcce49e-722e-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oe0UwB3HQLxorOoxNHmp9ns6LuJT3Y4dUv1jRF3UtpMBRtTRTzjVh//MizSFYb3rtibsnGurrXW1D8z6kF8II9wplbyI05502xNS6VFATF4847L5L+eVMpXq3goSi8VOLyLZgBKqRUzrlQ3lDKcm0iC2zDoBaodP0iuJoTCTm6iTE5WWh0cF/MRbCkowIx2+PsNuziuHC7cch27udlcOFkBqOjYJHFGfHVppFU33RyExc6uKMvsiB61bRfie0l28diItouChNM7Ja04I0339jI+CIuGTmMOMXyfBS5tOcsRy4nyX8tm+tqzA+2tOBfRVKSTKB8iexBmpNRBna3VftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOTYkfNxKLpeG0ARDLowPGb0KiB3tfLrFWnPYBRiem4=;
 b=r+JNInC40g/cLM+SLqxJ/s6+gey/wBHigbkQ3e+YFyLyIiNDvHgXkoPSrIetUJ4OcRUYxjFuP6DW+dDlJElobOzXpPcUYdN1plVwPeaqxdPw9QSVcsp07suVsPqqGUhuhRsbwtmoR4EUImsUCDBQd7LJgdVOZ06wUFlfzm63Ceqz1hdlV767AA+XQPG4qiNNLaO9qGqxFr2Wj89f3hx+4nUHRRo/6Fi8sOf/UJDlT/jJ8JZxvjMukzJc+ZweCx+jn7aGox3kohEHd27Q+H6r5o1t+gBibj4O2dnV5NVfcOpCxzYdX6XNG1VEDn/neVcEo/CtBKSqSW/DgMHCjXUTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOTYkfNxKLpeG0ARDLowPGb0KiB3tfLrFWnPYBRiem4=;
 b=Ehu7wh4aXDnKdhDxh/uj3PWwSLQvjNbvAsZ4RAsnz+HI6Zr6FvkqeIm9yL/Kn/CwcvrMcTJJFmqSczjl6Dn2fN0F+mAEyiKJQZ8YKvAP2W2WWeOdnlMsaYhTe5SYkhsMzgwboagW7B00eojOb2FstL03nY+ATNj9xQcNe0Gj8b5P0oyxJIyE90AuMX0/pC1B4Vxcjrk9vlo71rz+niMbgs+s3SeKDQew/6L5lA+A//IGfIXH7GnHtXn9Wpplaw/KNhoBErteAgoF4phqfZd95Auw1xLf1NZ+16wXPxSumt+2cleMbggscUwmpqpx+3NyGgl0lw+PNc+XqhjY21OH6Q==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Denis Mukhin <dmukhin@ford.com>, Jason
 Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2] xen/dom0less: arm: fix hwdom 1:1 low memory allocation
Thread-Topic: [PATCH v2] xen/dom0less: arm: fix hwdom 1:1 low memory
 allocation
Thread-Index: AQHcBjsvROW9CE6cS0mI5regAJMadA==
Date: Tue, 5 Aug 2025 19:00:19 +0000
Message-ID: <20250805190017.209711-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS2PR03MB9345:EE_
x-ms-office365-filtering-correlation-id: 305bffee-1589-4ed8-fddf-08ddd452526a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HUuT4/R6iPv3AM1PRD9rkrkpTc5EqSIs+u4m7szHntmduFD2tiwcKt7upM?=
 =?iso-8859-1?Q?FzvRB7898Ld4srhK+TMB3XLwlFjmyyw0b+nlwLH8zHxs8RfBlUzAqhgKvF?=
 =?iso-8859-1?Q?dB7G44sqJorEnK9FbisVqlXnCddwx0bhYvllPszSgtEQRKKKKVHXUqj5e3?=
 =?iso-8859-1?Q?3gEBxTwrxbpIpKi2h/vW3Iw74WfAJMYaMxGZ2ZzbAHB5d4TG+Q/kXVgNRt?=
 =?iso-8859-1?Q?ltUuFo/tTFR0e8vAaWXgnoNnCDL+ML4V0Ifta8iZ4ZeM0mJPmKcuXpTcaz?=
 =?iso-8859-1?Q?zSdcaJD9CrKuyDDBLyFDMwBkbzGkUV+nXPjBis+UyvpdYLPrkrN5jk8Pt/?=
 =?iso-8859-1?Q?LvJqFeORBm/pHw12fFgM2/6pLDGSJr6dHYh9rlRLudB0IJVABZ/dDlyBbt?=
 =?iso-8859-1?Q?cXhakFc5lQT4Rjq/k/ZImbdVBhB775q2Rg/H9n18q5751zNLfyWchQrKUZ?=
 =?iso-8859-1?Q?V1tf0nABAe505EZQvX11nQp3LFe6410cfXA5FgHd3mJ80fMU5XLh1tajsm?=
 =?iso-8859-1?Q?nKQITLUFeN2DWNE61B3QWmVbsT9LzAcu3gdp7XwehdIHcSTRJZNjWWaUH+?=
 =?iso-8859-1?Q?Lqz7oD77M+egL6wOruTdCv5wZqT7HoUWY3F6i7RaHAmQLwOXWGgCaFLdqN?=
 =?iso-8859-1?Q?s5+8Z5BZoKIJyszCdxZs5H5sfzkSwRiQFIa0aHTci1NxOymxsLIo7s3s4o?=
 =?iso-8859-1?Q?MkLOyqlKgAWL0ZverC1MckXb+O/AROYndRI6NNY8pzn3ABO9HnnDePHNjc?=
 =?iso-8859-1?Q?jcFqadrEcHcZJ4CbnQtpLJeihByUWnOKikGpWLMwmj4AO5ZOFOGkiyDxuc?=
 =?iso-8859-1?Q?B+a8YTHCr4yDbVKsrHB8fFpXI9sGoycCLQIellYJ4mvLIHl42XDo03Q9rH?=
 =?iso-8859-1?Q?cAedcCagXSeZT3r2a1I1ECGAGVyv6gtDU6m6wAUO7ZQ9JgnJ7ZUXLPlrGe?=
 =?iso-8859-1?Q?8wui55sr/bBWrGouOcue4qQ++Q7Q0f1uD43SsZ4kA438ZOoMyHvh99OBE6?=
 =?iso-8859-1?Q?4Rot/vgRfjLt+16+nBvNMQA4SHURQlWAFtfhfi0C2yOvd79JPtPahjr6BT?=
 =?iso-8859-1?Q?kglzUoiTlPDMg1/Z1GtQSLILyKYRvMWe1XuCQQ1MEyI908SXlkXnq2fNdo?=
 =?iso-8859-1?Q?QVGqiz5EZdSyQzFFSBMi31iPAk39nmJwgUo7zsQ/Dt/14NFIUovFivcnUY?=
 =?iso-8859-1?Q?z8K/Dwi/yK+JB1tgzQeduW9Xf98kAJUG7/mLOlxIH9N2HnWSlbk68LPI99?=
 =?iso-8859-1?Q?KqxxByOVMaoZSNt9n3QOi9z3HM70yn9mS6PW2Pv8rI5P3Ib2c59jhy4so0?=
 =?iso-8859-1?Q?6zCsGfs77bbYnDoqUQrNi0jY9JA4UOJPqiXsOtTskxToQIv9tfzqIWTxjC?=
 =?iso-8859-1?Q?Ab+f5FCr534Ijy90k/siYDf841Mz1CIgqX5XIxH3iDgjun/mbM2XY2qvfg?=
 =?iso-8859-1?Q?GZR/jV25/yQFCX8K5+Z4RaUbjICj04I+aXPr8MtXTjz5TGMQSlWCISFSLD?=
 =?iso-8859-1?Q?Rk+0KZw6QMSmaJ3LM8+5W8xC1MxeriIptAhQYuj6KkEg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YZJqqi4HmWwjhxOeIB5fAQnT2lwvU2IXyYVkrTzJMDlOknW73UStG1jNFs?=
 =?iso-8859-1?Q?9mH6i0Xgzjn3yBiNYsJueiLGJlQPSCPinrMjsWvPz6MW/JHAEksVKjWoie?=
 =?iso-8859-1?Q?8qprutQ2WakYRv8QUkZsh4Y5lefee4a0OuhrZvSkRf33BC5iqktctUpZpj?=
 =?iso-8859-1?Q?2lL5/7Up5WQxg+UB6TDmtm3R3t5oXDua9lEV4f1eD+hegyWtEZYzc0uERa?=
 =?iso-8859-1?Q?17YN6KQpfr5xd+r/ab0dB/kZlTGAmC8RmNjKE7qs7P2R326nXsFrP/AobD?=
 =?iso-8859-1?Q?qM9YBfxmZPzBHs5Pah3Y47UTAdLRyXhfkIVQEK2T2UzofYpyWPfLHSYEUO?=
 =?iso-8859-1?Q?efhg6DL7voWqPa467kdCJhGViMAs36OPRqRaBaEoL3gmASxuG6aVw/2Fqr?=
 =?iso-8859-1?Q?oFEI9bxEYuEI8lgZHZLnsGugWC66/CoEBSILLulI6XYfIHgVEgF2HBgX7K?=
 =?iso-8859-1?Q?k7czC30jP+lnPaqpVGEg9VoMEQD6pHRpDmUovkcTRj4Ggf5icUfLdfZRu/?=
 =?iso-8859-1?Q?1Vk3WExYIH5sjkqYDmOxG4Z9DmQ4B/o0PvKQhUdMGGzP1repqyHuHeqDxT?=
 =?iso-8859-1?Q?Y+AryDC/FsyW0F0gu0QdMdwlUB239WBaDVrK1qJ6s9dgxiTSKHSN0dbdRY?=
 =?iso-8859-1?Q?Zmk5VHL+bNQXEIAzDwjr1pJmgnzRxYs7xhjlqiqb5ui5G4Ear3vfV0If9T?=
 =?iso-8859-1?Q?J7dVJIc2RgSg0QPCC6cDxrOUbvJWAMdwXo0aAvT3QNw947pMB8w/0R4Z9q?=
 =?iso-8859-1?Q?Y2syRX8B3jjoK5hUXyGWIKiKGa7IjouBWRXo06VDkpVDOWqYgvj47bT5dy?=
 =?iso-8859-1?Q?pBMGlhq8yuGkoVdWJERtZRmnYqVupq28shmIhjI5Ke/kska1v/T0He2M2x?=
 =?iso-8859-1?Q?ntQtpHp1Showw5IVAy1Q7Yk3Ld8RywvRMjDOBx/bMXc2HoF2DRJf4ay4Kh?=
 =?iso-8859-1?Q?IAn/4abahYJKekcBOM2p2fgkFx8dsc5pSVRnX/UEEYsJjbH5Fce+H1YfKn?=
 =?iso-8859-1?Q?5BOeR6k0HRWrWAcVB44UyFhzFn2kLSpetnK3SNOSO/p2WRgFNSpcLie+WO?=
 =?iso-8859-1?Q?zL5skOU2m652TLpg/+E/2IUxMoEkaRXlZfp7wb7bVNwK3DZlBaHzXnfEbf?=
 =?iso-8859-1?Q?H7zRP2ZKWeECa49TvQAjVWqfOtJ/YsozMxNQGTp3sOeA+ZTnUaqsftyTfy?=
 =?iso-8859-1?Q?2ONfqga7VcZ9GZ4LxFQguQAaqMGMrfRfJjBICtyQIVPrdoZz6yzQS1ggcC?=
 =?iso-8859-1?Q?Yi1LF75jwLJVQ+0qEGNKA8UtMfEUaatCVSafsJ+ezQ5ogOnfGZSxb2zaEQ?=
 =?iso-8859-1?Q?uIZehabYf/x4IgZc2liZbW7VYloCwOgdKa6/sf2OFYU+QDkHInCl05JfCJ?=
 =?iso-8859-1?Q?mpKUnckflj9yGR9eAulzDEE1HY8xYZDq7ocS84R6Cyo3H273OBKGiBS+Lx?=
 =?iso-8859-1?Q?pIE0oveK7pzKjVQYsdW4G0fJ7PZRMWN3Lao+GxinMk62u6Gcp7o+BNgLmS?=
 =?iso-8859-1?Q?FLjZzLVdd9m7axc8F7jHDPu2sEA6c4CPkGsslGZu0qQWTCC8u5V3ZHIwW8?=
 =?iso-8859-1?Q?XXzFcQmSXNRE8GdoFLXuKd+uasxNzEr8FDlsh4IsTTmqMz2yg8LQA1AKNI?=
 =?iso-8859-1?Q?IsPLoAcZpksGMC2Wz23wjjQLhu7LSLl86ZRMJUBNP4fMaXexGKDHHZRQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305bffee-1589-4ed8-fddf-08ddd452526a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 19:00:19.1440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CyVVqVq5KQ4ZT3LNHqr2YXWmAM7HHYh1QC+ifzquvfgkYjYSZOpF7OJvY3K0evi3UASIDO4E4CcHf3NLMgn35kurTkBqFnMSDtrFUVzjSCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9345

From: Grygorii Strashko <grygorii_strashko@epam.com>

Call stack for dom0less hwdom case (1:1) memory:
create_domUs
|-construct_domU
  |-construct_hwdom()
    |-allocate_memory_11()

And allocate_memory_11() uses "dom0_mem" as:
min_low_order =3D
  get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));

In case of dom0less boot the "dom0_mem" is not used and defaulted to 0,
which causes min_low_order to get high value > order and so no allocations
happens from low memory.

Fix it, by using kinfo->unassigned_mem instead of "dom0_mem" has correct
memory size in both cases: regular dom0 boot and dom0less boot.

Fixes: 52cb53f1816a ("xen/arm: dom0less hwdom construction")
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes in v2:
- changed 'fixes' tag
- fixed comment for allocate_memory_11()
- added reviewer's tags

 xen/arch/arm/domain_build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 463ae4474d30..a9e4153e3cf9 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -249,7 +249,7 @@ fail:
  *
  * We first allocate the largest allocation we can as low as we
  * can. This then becomes the first bank. This bank must be at least
- * 128MB (or dom0_mem if that is smaller).
+ * 128MB (or memory size requested for domain if that is smaller).
  *
  * Then we start allocating more memory, trying to allocate the
  * largest possible size and trying smaller sizes until we
@@ -278,7 +278,7 @@ static void __init allocate_memory_11(struct domain *d,
                                       struct kernel_info *kinfo)
 {
     const unsigned int min_low_order =3D
-        get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
+        get_order_from_bytes(min_t(paddr_t, kinfo->unassigned_mem, MB(128)=
));
     const unsigned int min_order =3D get_order_from_bytes(MB(4));
     struct membanks *mem =3D kernel_info_get_mem(kinfo);
     struct page_info *pg;
--=20
2.34.1

