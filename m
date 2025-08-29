Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593C2B3C042
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101659.1454685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cZ-0008T5-77; Fri, 29 Aug 2025 16:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101659.1454685; Fri, 29 Aug 2025 16:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cZ-0008QO-2Y; Fri, 29 Aug 2025 16:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1101659;
 Fri, 29 Aug 2025 16:06:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1cY-0006O9-4y
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:34 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 204ffe0a-84f2-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 18:06:31 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by VI1PR03MB6317.eurprd03.prod.outlook.com (2603:10a6:800:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.26; Fri, 29 Aug
 2025 16:06:28 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:28 +0000
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
X-Inumbo-ID: 204ffe0a-84f2-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9TW/t4f0zwdRr9dcSUiRgkvBC4U7kpD9BSsvdrG+Izm3YA+5dnokQ9nwcEa1Qobu2q81OV13CTGSEht1mPLncvfDK8zYax2V86/Rx6R4zcyzJT22yc/43Li+KcN5OmdtrVVrt7cwvErcVcA+vhilyS1jbNC2dH4aTnAFeHXYJVmBk4msiCBvHsHzDBoippr72CypuvutP3HRtioHRY40mEm70vz4RqjB6cJ9iuKxUDwjON2+wTppoPhbNueCIGRuuhD70GFPmz7JK2NMRCegL+5czuzr/vbtLJHVjBWOmMKRL/4euuAqbGWujseyUGMkyVcZrRVUm8IRIq7D4Yzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYCvgFFyCTVdJpP4dBMOeGpkcAlgpbx8MCbzfUuiAk0=;
 b=q3hehr+ZT1cOJxN/xTUiWVhmMGxiNlcHZ0zhPFY+jCxfWIWJ49cnozFSsOh81XsyuInlzx55eqFbrc4HZaoR/hUjTIJ32nAbdaQODESohogx47x7rUFcWVXtMHAYg8TDMdX/j81XnZ3xLo3FPN4XOffra7cUXuAiJ9zEpQh8oMrp3tdvQT/U+lW4p0Fpycht3LePPnseyVIdRrtZry1t+CyU/GN9Gd4rmv+6n+MAC/GKws4R4mX4+Cos7XNMfZ+bk7vrYMm7f/lwM7bWGPAyyp+uacNp9DNZxtN1zwbnDrDqicB14zokyXQjt1dmfaWHeCDp88folI36ElDNjNJrwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYCvgFFyCTVdJpP4dBMOeGpkcAlgpbx8MCbzfUuiAk0=;
 b=GgjEuXBTFCmd5bfSHScRZenPnngNsdtpnTVW2KLW2zxFTxosi5l1M4/nidsgf0hRMBLCCDPuBy+8uFc2BOaUqly4gewBPO8gS9x/+T8zeZ6YE6vkxIOdROJ/cb/hEhmufVpjmsB3ORNIb4eVcagnFeVWBt3mF0hOrvCZu3W+Q8IWRYF7Ev6Nwxel6TaknByFzJ33I+uIICiqpNfkem+T14HJvHWsWgRVIbfDVBPgnXabdJCG3pEhDv1J4wcNl4LMbfmlxUGNOBLeXePFaVp68tq1d9ZWTd/uXm/0ccNumNe20xc+kqDwHGOHfJvuHfsLtWgaHNLZBFZ+DuTMqgDdsw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 08/12] xen/arm: vgic: add resource management for extended
 SPIs
Thread-Topic: [PATCH v5 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcGP7gzxYtqJZFyUiPTlrb5XV2MQ==
Date: Fri, 29 Aug 2025 16:06:28 +0000
Message-ID:
 <4b13dea924eabf1370d3f31030f3eef48371de06.1756481577.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: f37cd360-a999-4f97-2a2b-08dde7160329
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gK9eo/zKgq8M+/3L+NhD4+Izso2Tk0KRe7tTqTEUBQr5k0P4vNqnykmgEr?=
 =?iso-8859-1?Q?P7HfeFLgoCeB6YFd3c+Q17OAzl15/ZBgshdL9CdWDGB4IY7WKw3uiohrAT?=
 =?iso-8859-1?Q?K+W2Stxhbx6mM7r1bdLn5a9Ni/+w1Rdhgav7rlg4rDzGtW99K6pEH6Cl2e?=
 =?iso-8859-1?Q?mAvsCkHcOJX1/RUlH4XloQABtC34a1iK/i9wG1BVqwY4dU62yESBqrHDEH?=
 =?iso-8859-1?Q?oPbOZqTWGyaUxuqxy0oAd2xmVFuQOja8Fdjz+lqOXP4s68854I7ahg+Ami?=
 =?iso-8859-1?Q?AJRguh+fV4laIpnfd/23jpd161RYwtwuURYh+1ssjBDoqQn4BVFbM2XuIO?=
 =?iso-8859-1?Q?mXTufrdu0Se55c6il90egvOQwEe1Eoh/eKoUwt+rIR9Sin9khKNE4veNdN?=
 =?iso-8859-1?Q?yrVQngA+EODJcceQ1jXXXkeXcffjngo+uUvWs6YOUjPrU7E2BnMnX0lV1e?=
 =?iso-8859-1?Q?86arpR6Rn4Y0sjp7INWN1LAXUm7GMLcoJr0pTxybec2PwG4049xpQpf09A?=
 =?iso-8859-1?Q?SnXJopkgUkEjW9/I+jbWpcnkcmmbbbJ22BHCEXno57nBnZp+o25NIi3BdY?=
 =?iso-8859-1?Q?f6EN82DkizI006ul5Nm1vkzrI/k+nvpBqri0jJqMr8s7v5dFgtEs98c9zq?=
 =?iso-8859-1?Q?Ls5xO6ztRxcVGVWMSm7e5ahoIWknSuhCDJcpo1eg8/DuH4/Q6ITM4YZcqj?=
 =?iso-8859-1?Q?I4OoFKGXw+M1tjbDiVMTuo00M156DviTttLUeZUkJfjSXLuxmZc7cCDW+n?=
 =?iso-8859-1?Q?Z3OPORDvjOBYl+WuG/nCQlCBZONluW2kYs8mFAiW5bdm27OXNAJkbW2eus?=
 =?iso-8859-1?Q?QjecPV3eHOOKe4m5NYc4RA3zj1wVhm0KeaRYBQJ4Occ1UsIqgMRZS3Npgk?=
 =?iso-8859-1?Q?OKMWy710NPty4BDytK9UEQ+U2K2Jb8DpUkwiJsaeZop0iF7IVPS64OVgc0?=
 =?iso-8859-1?Q?b6y4Cq8u0nltbrSXhY0vfL1pyi1BT+7aOLNDh5KogIi6yhMrk8RUBsOMTT?=
 =?iso-8859-1?Q?BIwvJ6UclJGsrF37qt9Wi9kiwmEaJqB50MoODfquI4pzH2dV9+Lc08Jfe9?=
 =?iso-8859-1?Q?wByGSPIeHkmZjDwJXTOfj8iDBNc5KqoXSEOW65pDaNicF235r060Ukvn99?=
 =?iso-8859-1?Q?4ujKMd23C9I4xkzp61v4IKWcf+3B+xMCKaz6IQGKzFyJ7l8nFO8SLRP02e?=
 =?iso-8859-1?Q?yFbIE6C680jzzPRjsLnBN0j5t2nLRCHgZlh1oB5+I9iCkiiWZAl7h3zrnx?=
 =?iso-8859-1?Q?MN+M4aptdLjM5YlPtmSe/gDmSK9+VavTrGhMO4DaznjnYy+gUc628WKkXA?=
 =?iso-8859-1?Q?4V2dB+uYIgPjc9KbEIIGWPncFQPx8LNrYC2j6ZCdX+bozTPtPS5Nw8Q5nk?=
 =?iso-8859-1?Q?mrQTgjTC90k/tzyskYIoFO6phyZFJYrJ2QP0lYmwwDQYfcpQD1gKYIaNSq?=
 =?iso-8859-1?Q?7rg/esUJKR5Md1bmdcxuFZ+IooO9sFPS1x35Lcow/Xqb3OTjKOWZYRYmiO?=
 =?iso-8859-1?Q?GuNakc2d3ilJ5QEKfx7GAQmf84kGcXmso2iOlSFJpOCA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?o0gEGSK6PofRnahYUNeUfbBgOUKErB0bWQI+l3nxV/gh4uP8NxrtODuprc?=
 =?iso-8859-1?Q?+Wf7U1vOi7IQLwo/pWnJbCfArXHyIFLotxUDq2R6s1HM4Q+iSRTnl81AST?=
 =?iso-8859-1?Q?go2flnuZLD+MlFtL9qP63CKr2kAU83O1KS3N0tSnZoyHfcSH88o8ofYZPT?=
 =?iso-8859-1?Q?mBmmKnirEva5d+QtLrW6GFm/P9pNEaUNENAhIHTb7psOE8TOENNLtOkrR/?=
 =?iso-8859-1?Q?hQG5p5aB1ILdMhxly6Y9xWpph+SqB4Uw0I5QAj0VJb2T8sFLKaHo2h6QPi?=
 =?iso-8859-1?Q?RhMfStzBj1QyZxKnFw6vMsFd84BXdClHUI9Z210PMtPeHeVtKTBN0yQrIR?=
 =?iso-8859-1?Q?xpvCJE79sJNqiuuumDrEXo7ImblfMCo4rOCySU4c6pZRpz+EhnP5HC32eK?=
 =?iso-8859-1?Q?wEPiz7fvYQ/mA5h16ydcsB34JotO5hDiq1vUy5yfG5ZMuZ1LTRlzBFRNec?=
 =?iso-8859-1?Q?0/Z1+Y9aFKB+FIH31/vnq1Ahuo15f6HnpGOpHSK0SvxHOLFPnz3vOr8bB2?=
 =?iso-8859-1?Q?XejzDoVxaACBdgZ5LLIsK6Gx6zIThrMZ0hfR8tOLHDCbl88Y/otSNg7P7/?=
 =?iso-8859-1?Q?MiNmjKTFcP60rpzA1jI02hnsDg/ezOfzVQImJMBygCeNPE8bYwiB7U0c7P?=
 =?iso-8859-1?Q?0j8ary4Fns2fpXcG0jngWh1jL5CMUwvxX3xB68SpSgsFF6sS4mk4dwM59f?=
 =?iso-8859-1?Q?a6CU7OG95ofUfEgYyavO5A7FangwItkCJOw6sP7RkPfH6Q9qnzyilCvNfW?=
 =?iso-8859-1?Q?SSLCJD6IyKUEVH+llWvbVKEONf54o0cyN5v4O2UE48fzaxaVfkSXqi3YN1?=
 =?iso-8859-1?Q?xRhpuiTyKwjV9HywjPiPKTSrY/8pt8mWH1r4EKDK81qRAJJ8VIiWuT5j4V?=
 =?iso-8859-1?Q?T8uJh2h/wY7A1gy9sZocrAVxw/giFP2H7XbmDuzL+cF3gYgqycoMEgc3m1?=
 =?iso-8859-1?Q?ZwUDR3zdh8N1rWRB5t7S4PcVKH5UwPkA2dpmAB52ukerRL4kZDf1PLIiUX?=
 =?iso-8859-1?Q?MrMo0A8Oun62LcEcVQmiSjSWcfrvzWEdo/bu5Af/1UVkZpP/XR8nySZwLB?=
 =?iso-8859-1?Q?pj8SstCtFr1YfmB2+0J3kIaVoBB+urOXoz/e/Iph+Rk1moPwyUYSaLVwNu?=
 =?iso-8859-1?Q?nhQavEM7Xzi++9RsuaIRYwcdsufMXrxtBZntZWSZ/Yp2ibh3Lr2LoAZ4zV?=
 =?iso-8859-1?Q?SKpKJjQSninBZ+2dF2PNwyuXcfFvgw1DkfxwDCw80FgGYatRPs2FpRB8A7?=
 =?iso-8859-1?Q?5AiYhH4JxVFZSncs5bwbSHaahO0X7jKLPwsq1xLCAmjP2FgZsQq9alJWp7?=
 =?iso-8859-1?Q?orXmf8FiMsaotsK3bLQw4nIBOZntJesAPYK3HDrhd2D5Pj01F3UCb3lpGk?=
 =?iso-8859-1?Q?XomOnD3IOzHiYfGL8z8goROD8hE5C2RPkuJLZvO2E68pjTU9yRUxJCrrg1?=
 =?iso-8859-1?Q?FlzkCQegzo4j+Xe1nY7ZZ95KsaZCrFy+7HBs1Vz1mTSymi9AvAuTvFEbJi?=
 =?iso-8859-1?Q?pKOyXf0O1W6N0jRZ1Xxdf24MZJvDrITyc8xOxln2CDhheGLpjKF35+AiLe?=
 =?iso-8859-1?Q?amACMMM5WN6fhsAHRsKOioauPv2t+UvnUgdDkv5PIoqnOXi8G45hzo6I3N?=
 =?iso-8859-1?Q?GmVflt8gDN3e83FY+6Vr6thDNdrmq22IkSfGS/YPZK/o1l5XMZg6VV24kJ?=
 =?iso-8859-1?Q?7XqIf+UY+WvrgEDm6Ww=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37cd360-a999-4f97-2a2b-08dde7160329
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:28.4572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: trzV33dg8oAqz7jgyX0B+F4uJ/3zIJHkTkuDu0SxuYaF0/XhLQnmcDdK2Yj9Yr3F2+1GpKyqK1Z4A1PKYOvHBqxD6s/xqFKjHH6fjJj4vAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6317

This change introduces resource management in the VGIC to handle
extended SPIs introduced in GICv3.1. The pending_irqs and
allocated_irqs arrays are resized to support the required
number of eSPIs, based on what is supported by the hardware and
requested by the guest. A new field, ext_shared_irqs, is added
to the VGIC structure to store information about eSPIs, similar
to how shared_irqs is used for regular SPIs.

Since the eSPI range starts at INTID 4096 and INTIDs between 1025
and 4095 are reserved, helper macros are introduced to simplify the
transformation of indices and to enable easier access to eSPI-specific
resources. These changes prepare the VGIC for processing eSPIs as
required by future functionality.

The initialization and deinitialization paths for vgic have been updated
to allocate and free these resources appropriately. Additionally,
updated handling of INTIDs greater than 1024, passed from the toolstack
during domain creation, and verification logic ensures only valid SPI or
eSPI INTIDs are used.

The existing SPI behavior remains unaffected when guests do not request
eSPIs, GIC hardware does not support them, or the CONFIG_GICV3_ESPI
option is disabled.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V5:
- removed the has_espi field because it can be determined by checking
  whether domain->arch.vgic.nr_espis is zero or not
- since vgic_ext_rank_offset is not used in this patch, it has been
  moved to the appropriate patch in the patch series, which implements
  vgic eSPI registers emulation and requires this function
- removed ifdefs for eSPI-specific macros to reduce the number of ifdefs
  and code duplication in further changes
- fixed minor nit: used %pd for printing domain with its ID

Changes in V4:
- added has_espi field to simplify determining whether a domain is able
  to operate with eSPI
- fixed formatting issues and misspellings

Changes in V3:
- fixed formatting for lines with more than 80 symbols
- introduced helper functions to be able to use stubs in case of
  CONFIG_GICV3_ESPI disabled, and as a result, reduce the number of
  #ifdefs
- fixed checks for nr_spis in domain_vgic_init
- updated comment about nr_spis adjustments with dom0less mention
- moved comment with additional explanations before checks
- used unsigned int for indexes since they cannot be negative
- removed unnecessary parentheses
- move vgic_ext_rank_offset to the below ifdef guard, to reduce the
  number of ifdefs

Changes in V2:
- change is_espi_rank to is_valid_espi_rank to verify whether the array
  element ext_shared_irqs exists. The previous version, is_espi_rank,
  only checked if the rank index was less than the maximum possible eSPI
  rank index, but this could potentially result in accessing a
  non-existing array element. To address this, is_valid_espi_rank was
  introduced, which ensures that the required eSPI rank exists
- move gic_number_espis to
  xen/arm: gicv3: implement handling of GICv3.1 eSPI
- update vgic_is_valid_irq checks to allow operating with eSPIs
- remove redundant newline in vgic_allocate_virq
---
 xen/arch/arm/include/asm/vgic.h |  12 ++
 xen/arch/arm/vgic.c             | 199 +++++++++++++++++++++++++++++++-
 2 files changed, 208 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 3e7cbbb196..912d5b7694 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -146,6 +146,10 @@ struct vgic_dist {
     int nr_spis; /* Number of SPIs */
     unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
     struct vgic_irq_rank *shared_irqs;
+#ifdef CONFIG_GICV3_ESPI
+    struct vgic_irq_rank *ext_shared_irqs;
+    int nr_espis; /* Number of extended SPIs */
+#endif
     /*
      * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
      * struct arch_vcpu.
@@ -243,6 +247,14 @@ struct vgic_ops {
 /* Number of ranks of interrupt registers for a domain */
 #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
=20
+#ifdef CONFIG_GICV3_ESPI
+#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis+31)/32)
+#endif
+#define EXT_RANK_MIN (ESPI_BASE_INTID/32)
+#define EXT_RANK_MAX ((ESPI_MAX_INTID+31)/32)
+#define EXT_RANK_NUM2IDX(num) ((num)-EXT_RANK_MIN)
+#define EXT_RANK_IDX2NUM(idx) ((idx)+EXT_RANK_MIN)
+
 #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
 #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
=20
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 2bbf4d99aa..c9b9528c66 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -27,9 +27,82 @@
=20
 bool vgic_is_valid_line(struct domain *d, unsigned int virq)
 {
+#ifdef CONFIG_GICV3_ESPI
+    if ( virq >=3D ESPI_BASE_INTID &&
+         virq < ESPI_IDX2INTID(d->arch.vgic.nr_espis) )
+        return true;
+#endif
+
     return virq < vgic_num_irqs(d);
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * Since eSPI indexes start from 4096 and numbers from 1024 to
+ * 4095 are forbidden, we need to check both lower and upper
+ * limits for ranks.
+ */
+static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
+{
+    return rank >=3D EXT_RANK_MIN &&
+           EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d);
+}
+
+static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
+                                                       unsigned int rank)
+{
+    return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
+}
+
+static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned int v=
irq)
+{
+    return !test_and_set_bit(ESPI_INTID2IDX(virq) + vgic_num_irqs(d),
+                             d->arch.vgic.allocated_irqs);
+}
+
+static void arch_move_espis(struct vcpu *v)
+{
+    const cpumask_t *cpu_mask =3D cpumask_of(v->processor);
+    struct domain *d =3D v->domain;
+    struct pending_irq *p;
+    struct vcpu *v_target;
+    unsigned int i;
+
+    for ( i =3D ESPI_BASE_INTID;
+          i < EXT_RANK_IDX2NUM(d->arch.vgic.nr_espis); i++ )
+    {
+        v_target =3D vgic_get_target_vcpu(v, i);
+        p =3D irq_to_pending(v_target, i);
+
+        if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
+            irq_set_affinity(p->desc, cpu_mask);
+    }
+}
+#else
+static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
+{
+    return false;
+}
+
+/*
+ * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn,
+ * because in this case, is_valid_espi_rank will always return false.
+ */
+static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
+                                                       unsigned int rank)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+
+static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned int v=
irq)
+{
+    return false;
+}
+
+static void arch_move_espis(struct vcpu *v) { }
+#endif
+
 static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
                                                   unsigned int rank)
 {
@@ -37,6 +110,8 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct=
 vcpu *v,
         return v->arch.vgic.private_irqs;
     else if ( rank <=3D DOMAIN_NR_RANKS(v->domain) )
         return &v->domain->arch.vgic.shared_irqs[rank - 1];
+    else if ( is_valid_espi_rank(v->domain, rank) )
+        return vgic_get_espi_rank(v, rank);
     else
         return NULL;
 }
@@ -117,6 +192,62 @@ int domain_vgic_register(struct domain *d, unsigned in=
t *mmio_count)
     return 0;
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+static unsigned int vgic_num_spi_lines(struct domain *d)
+{
+    return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
+}
+
+static int init_vgic_espi(struct domain *d)
+{
+    unsigned int i, idx;
+
+    if ( d->arch.vgic.nr_espis =3D=3D 0 )
+        return 0;
+
+    d->arch.vgic.ext_shared_irqs =3D
+        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
+    if ( d->arch.vgic.ext_shared_irqs =3D=3D NULL )
+        return -ENOMEM;
+
+    for ( i =3D d->arch.vgic.nr_spis, idx =3D 0;
+          i < vgic_num_spi_lines(d); i++, idx++ )
+        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
+                              ESPI_IDX2INTID(idx));
+
+    for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
+        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], i, 0);
+
+    return 0;
+}
+
+struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
+{
+    irq =3D ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
+    return &d->arch.vgic.pending_irqs[irq];
+}
+#else
+static unsigned int init_vgic_espi(struct domain *d)
+{
+    return 0;
+}
+
+static unsigned int vgic_num_spi_lines(struct domain *d)
+{
+    return d->arch.vgic.nr_spis;
+}
+
+struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
+{
+    return NULL;
+}
+#endif
+
+static unsigned int vgic_num_alloc_irqs(struct domain *d)
+{
+    return vgic_num_spi_lines(d) + NR_LOCAL_IRQS;
+}
+
 int domain_vgic_init(struct domain *d, unsigned int nr_spis)
 {
     int i;
@@ -131,6 +262,36 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
_spis)
      */
     nr_spis =3D ROUNDUP(nr_spis, 32);
=20
+#ifdef CONFIG_GICV3_ESPI
+    /*
+     * During domain creation, the dom0less DomUs code or toolstack specif=
ies
+     * the maximum INTID, which is defined in the domain config subtracted=
 by
+     * 32 to cover the local IRQs (please see the comment to VGIC_DEF_NR_S=
PIS).
+     * To compute the actual number of eSPI that will be usable for,
+     * add back 32.
+     */
+    if ( nr_spis + 32 > ESPI_IDX2INTID(NR_ESPI_IRQS) )
+        return -EINVAL;
+
+    if ( nr_spis + 32 >=3D ESPI_BASE_INTID )
+    {
+        d->arch.vgic.nr_espis =3D min(nr_spis - ESPI_BASE_INTID + 32, 1024=
U);
+        /* Verify if GIC HW can handle provided INTID */
+        if ( d->arch.vgic.nr_espis > gic_number_espis() )
+            return -EINVAL;
+        /*
+         * Set the maximum available number for regular
+         * SPI to pass the next check
+         */
+        nr_spis =3D VGIC_DEF_NR_SPIS;
+    }
+    else
+    {
+        /* Domain will use the regular SPI range */
+        d->arch.vgic.nr_espis =3D 0;
+    }
+#endif
+
     /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988  =
*/
     if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
         return -EINVAL;
@@ -145,7 +306,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_=
spis)
         return -ENOMEM;
=20
     d->arch.vgic.pending_irqs =3D
-        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
+        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
     if ( d->arch.vgic.pending_irqs =3D=3D NULL )
         return -ENOMEM;
=20
@@ -156,12 +317,16 @@ int domain_vgic_init(struct domain *d, unsigned int n=
r_spis)
     for ( i =3D 0; i < DOMAIN_NR_RANKS(d); i++ )
         vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
=20
+    ret =3D init_vgic_espi(d);
+    if ( ret )
+        return ret;
+
     ret =3D d->arch.vgic.handler->domain_init(d);
     if ( ret )
         return ret;
=20
     d->arch.vgic.allocated_irqs =3D
-        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
+        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_alloc_irqs(d))=
);
     if ( !d->arch.vgic.allocated_irqs )
         return -ENOMEM;
=20
@@ -195,9 +360,27 @@ void domain_vgic_free(struct domain *d)
         }
     }
=20
+#ifdef CONFIG_GICV3_ESPI
+    for ( i =3D 0; i < d->arch.vgic.nr_espis; i++ )
+    {
+        struct pending_irq *p =3D spi_to_pending(d, ESPI_IDX2INTID(i));
+
+        if ( p->desc )
+        {
+            ret =3D release_guest_irq(d, p->irq);
+            if ( ret )
+                dprintk(XENLOG_G_WARNING, "%pd: Failed to release virq %u =
ret =3D %d\n",
+                        d, p->irq, ret);
+        }
+    }
+#endif
+
     if ( d->arch.vgic.handler )
         d->arch.vgic.handler->domain_free(d);
     xfree(d->arch.vgic.shared_irqs);
+#ifdef CONFIG_GICV3_ESPI
+    xfree(d->arch.vgic.ext_shared_irqs);
+#endif
     xfree(d->arch.vgic.pending_irqs);
     xfree(d->arch.vgic.allocated_irqs);
 }
@@ -331,6 +514,8 @@ void arch_move_irqs(struct vcpu *v)
         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
             irq_set_affinity(p->desc, cpu_mask);
     }
+
+    arch_move_espis(v);
 }
=20
 void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
@@ -538,6 +723,8 @@ struct pending_irq *irq_to_pending(struct vcpu *v, unsi=
gned int irq)
         n =3D &v->arch.vgic.pending_irqs[irq];
     else if ( is_lpi(irq) )
         n =3D v->domain->arch.vgic.handler->lpi_to_pending(v->domain, irq)=
;
+    else if ( is_espi(irq) )
+        n =3D espi_to_pending(v->domain, irq);
     else
         n =3D &v->domain->arch.vgic.pending_irqs[irq - 32];
     return n;
@@ -547,6 +734,9 @@ struct pending_irq *spi_to_pending(struct domain *d, un=
signed int irq)
 {
     ASSERT(irq >=3D NR_LOCAL_IRQS);
=20
+    if ( is_espi(irq) )
+        return espi_to_pending(d, irq);
+
     return &d->arch.vgic.pending_irqs[irq - 32];
 }
=20
@@ -668,6 +858,9 @@ bool vgic_reserve_virq(struct domain *d, unsigned int v=
irq)
     if ( !vgic_is_valid_line(d, virq) )
         return false;
=20
+    if ( is_espi(virq) )
+        return vgic_reserve_espi_virq(d, virq);
+
     return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
 }
=20
@@ -685,7 +878,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
     else
     {
         first =3D 32;
-        end =3D vgic_num_irqs(d);
+        end =3D vgic_num_alloc_irqs(d);
     }
=20
     /*
--=20
2.34.1

