Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE1BC8DEC
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 13:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140492.1475359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6p2x-0008Vo-VP; Thu, 09 Oct 2025 11:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140492.1475359; Thu, 09 Oct 2025 11:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6p2x-0008Tm-Sh; Thu, 09 Oct 2025 11:42:59 +0000
Received: by outflank-mailman (input) for mailman id 1140492;
 Thu, 09 Oct 2025 11:42:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZ0Z=4S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v6p2w-0008Tb-E7
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 11:42:58 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16f1c59c-a505-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 13:42:53 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS4PR03MB8722.eurprd03.prod.outlook.com (2603:10a6:20b:58d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 11:42:50 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 11:42:50 +0000
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
X-Inumbo-ID: 16f1c59c-a505-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axYUKkAomB7XY7EH6Yw74Rf9x0ghRVsCF0ist365b9odOrCqzDZ7uRZXMe73J6q4YjU5DihXz+jvrbxNjyWQwUhMvlK46MSpVKSnszvp/3c2/ur2sML0fcO+QCu/9SWCZk1zKZHhvsHPxmRbiBJnMWoBJKmg5ZtgnfROB9dCjP0sCqzIJsBCkKTWT0/bEeu2IDPfMwwI8L6T3o+JHKna8l88E9jcvtt2YIYwClP4n5FqvVLsYK/wZkljF/uMMVfSHBOCjlQem8CqaZcfYya6eqBysFck73x68Pi+hBzLij57POcgMZPE6xUcZ+dCERkBoA+G4SU/vBtN5rSua8nM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUvgBglGeeyR9NbGi5nY79T2XXUeGYL1phu0//2Hv6k=;
 b=MRvrBL7qlz5ZZXFcnkMMbBiC7Lp2qH9Fwd/un6hNi05IbiCRbgh9vOdPpMwWug5GVqOvCVdd0kIFo86WP2i4NOdzCJDjqtQMFXEeoEGurcz+y+LmVtP9zxS63BrTmdSS0E9hfMGBiGHJDdHV1hORymyk1h1zZxz5erw4Q10PC4OcVhua4qs5hYDAYGQSjT+C/cS5nXKt6X6W8YYoxL/U5RWEwjICYMBBql/GR+ko8SiPLhtN6RnZ8Kb4sabpyiVtCiLmGtOvej79zbp/E49GeyBQ2GpMVVPnw6KHI0i75s83/KyLnigCkU2c8hkG2f2gkY6LgHskUrHE3ZTzy+i2dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUvgBglGeeyR9NbGi5nY79T2XXUeGYL1phu0//2Hv6k=;
 b=fx0ZNospNRiR+ex61ZlfeY8HcktwqtDNonzXb3T5gZvPe+PmzWpanaAIqrBeyhE3mW0I0VD6AuNZe6Jmgx3PsUAXHORaOUfG00bXEKgGtzzxgy5bvDoomcreASlk+ZBLSavc000bDWWXfztyRLm1RFSZDhY8C8vA2wk3950uUatzCsUnFnsRi8b3qEyzh8uMLCkncySx+N/toI5LmERvLsvOxHpZi47yNJqc06nNjW9Cxx8TmQazcjS/A73n2JAZlygz6zLZakj4u4WHZAXw/s7M/xXjs6zjReAabN9DMAzQa3iGVlUv1Wpgmb1pbyeEYBhlfH7p7umnH/cR5Xc6Xw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [XEN][PATCH] x86: hvm: vlapic: rework WR/rsvdz masks for LVTx regs
Thread-Topic: [XEN][PATCH] x86: hvm: vlapic: rework WR/rsvdz masks for LVTx
 regs
Thread-Index: AQHcORHXhYFVkRUALkuaMd5pXZySsA==
Date: Thu, 9 Oct 2025 11:42:50 +0000
Message-ID: <20251009114249.1964387-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS4PR03MB8722:EE_
x-ms-office365-filtering-correlation-id: 8cc56a83-fd2d-4ce9-7136-08de0728f9c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZfLyEGWBuiZbcgk5wYpjqtzV8G36WGrd4MnIuqT+wm0qYbdwh4mU4VPmNp?=
 =?iso-8859-1?Q?D6ApXubwUb7RUOTlPlzPvT5qGnsPnRtIpaqPUJtzeL497SlWE7cWZTK7ZX?=
 =?iso-8859-1?Q?OI7b4NWytXMRLUjS14cLP/AdRV9EF1bLxVkveo9uMi2m1UVREu83sWrCf5?=
 =?iso-8859-1?Q?ZC9ZHsd8v5Yh/oWUa4PEA6YWBPxI/oi1WJP6hcKpSkZgcbVgN9lRu3DIlp?=
 =?iso-8859-1?Q?Ms6hcci+QoXiwqrGa+4bRa+z6QWx2E9gwEBozEo/tujrLeBmIqV/sN5odC?=
 =?iso-8859-1?Q?dbUAZDyoG/md+eA3+rotgkr0FKmHK3TpW2X0M8kW0A4mO0Liieg8JmsoVh?=
 =?iso-8859-1?Q?BMfa+ge2EtO1IudRoC+iJIBWlvsxGZcTz6kAIyfFBTisjBaYDFfW5u4h4T?=
 =?iso-8859-1?Q?Ccn8Y2N9I/oIEl5SIPMmEVlZCdobWjFojpvq77TevNpMKm6ChJZxd2cuOx?=
 =?iso-8859-1?Q?uGrvE5h+ks44Zz6L5lFBkfrDesZAYuN7VC04Zq5GXlJO72T870atkDhHvV?=
 =?iso-8859-1?Q?YMRkDKwAZ7JlmhDa1UOoaleOqsx4xOntbmKJdwHZTxnYPTnZ2zD1zMBsIj?=
 =?iso-8859-1?Q?Mj1vwaODRU9j8cZz+4fcD9FTSkDZepbbRrvzN+lhUbSwnjDyYN8lgtE1JI?=
 =?iso-8859-1?Q?821467slsHIeooZuUef+PP56YAwnMoyakMOT4SfwcmxraynDmTds3hf0Oe?=
 =?iso-8859-1?Q?X6effx0o74SDsjRzfa0XHkeyckvch67migfD6OHtjrtjkxMZfYHdzMjok7?=
 =?iso-8859-1?Q?BjMmOC6fRVLmsMXEYDdR+RAkpQYTTkfpCWC/s2+A690e5jpoIIG+b9lpK0?=
 =?iso-8859-1?Q?PcIzu1w+MFElS7KSUl0xNJzPw7cZv6vPpvKQmB7IuOMivgHG/DF+mN7N4A?=
 =?iso-8859-1?Q?8Vj8fYUm8v0O8nQiDdqPs6Waba7nPYmYDwcPa7ImS8n4PBcU6hx+H7OT3D?=
 =?iso-8859-1?Q?gId/8UBpm8vYtAKmW1TCmWAStlnJoZCC7YCz9vfUCdHTNLz8c5eVV4gtoL?=
 =?iso-8859-1?Q?xGTIPEnBa1gNb2+lbtAcgbe1yd2MIxE/74SQAzfLjyiv/UnSaNvl91Hao0?=
 =?iso-8859-1?Q?jzf1y3yE42BuBa7qQGyBDO48afzis+xreilNVh2wKxsgofkVh6H38cbC75?=
 =?iso-8859-1?Q?duuvqKCHIJiLA3Y1PwEMR48L3Q7TxoBgF+W7a/LqHNU5W+3vGd8lD8GWXF?=
 =?iso-8859-1?Q?/sxjOwBAbqr6l5Im/I2Fp6ysKKoadwUMuGcrfyMQZHLf5QMktmpKmSPnea?=
 =?iso-8859-1?Q?RE1a27Ic+QkBmMw0DlaujBC4jXxX0AlmVefdBOJMDeLwdNDik1INv0slkx?=
 =?iso-8859-1?Q?UIjnbFshPenAyKKTqyC7pT+Fo9DWejBhQVaM9jtS+26q1sHh6a835rItdu?=
 =?iso-8859-1?Q?y/2YgUVy7dKJYpxwlwdP3d5380hiZkY7X/+e8unphzupgeb9v7lj46PIWN?=
 =?iso-8859-1?Q?isI2UvC6qgc/TURwl2cUsn96WtHdOEka9qcAg7q/np8qlv46e2aPt7S7rR?=
 =?iso-8859-1?Q?6vLcOju7ATA4ZNcmxqOZVJXB3riqYIBI/QQubyZrdtcjmD+w0Sz5mMUNf4?=
 =?iso-8859-1?Q?DrTR3asz/unH/tMbDSojrCeTemE6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mLwTZTy9+HiinCFh8r34INUEwMzz44R8Ip8Pt6EtdIPKHLDDlSzsMz15V7?=
 =?iso-8859-1?Q?q92ZUwAAWnEGMNlCrWGjU19Tqr8gNwdv2g/dHVABkkJkdk5bHzWwjokOUU?=
 =?iso-8859-1?Q?WINv7D8rrN/zpufjBXJzX/fUpGbzPsMGmqUMeZYnc1rUyytBbolIPjLVap?=
 =?iso-8859-1?Q?1EZpB99/i3jZDNHtVBG+cdNvRCvN45BS7S/ayZifbQqPl/xOK54oP29n/Y?=
 =?iso-8859-1?Q?sNc30Wjap7TXwDe3XBL3ckczky2dw6QNwucF/fNuGYiyUrtkM62Z81079P?=
 =?iso-8859-1?Q?KLyEX2bGscqM94Xm2D/a3L4B5jOPmGbxTLgB3gyzK7gUuQITf/OeISKb7J?=
 =?iso-8859-1?Q?16TIN+Mp0D1IpwDVRbVS/5PGOtodnerqIwU1Mb5BQgwUXopgwM+57U9gyc?=
 =?iso-8859-1?Q?n0lOR3Pcb3hoSEMgDRe9pmSj1eQR3ZayNhBYGQnDtsmmrpgIEBCy/Gxu5A?=
 =?iso-8859-1?Q?R35STcag1IK+0/x+JM8Ax2VeM0KJaAca5IsfCG9UATYeKzV3R2NIcEBW5b?=
 =?iso-8859-1?Q?GaDO+/frwcc8BboFMg2d75kntSC2oTtFcJmnlFIm96nIBXM+zmhLocqgmY?=
 =?iso-8859-1?Q?pcjgYhgpUKHxDcABJbqO8ob0ZnfQXGj55AwRkX3mYFyEPPp0nYZmVzAmRl?=
 =?iso-8859-1?Q?qn1fiyA9L6mev06huHuFPkXuV6o0ajTiKMjiSQA7qhtQcGWE+pRzOfsD9r?=
 =?iso-8859-1?Q?0cQjJo9STmWFWnwC691Fx+XapuufDGf7UsFAOO12f7qJ/VRr4soSMaL/aK?=
 =?iso-8859-1?Q?uOI7PBSKVYj0u6fzW+xCyAu2ZpRJls9y0Gg2f8R5PlGUraiOHwtMWw9xM2?=
 =?iso-8859-1?Q?qmbHFe/+vveV5lEKoz0ByO2b1JbXln4O196zjuWq4QGVctHhCcEV4r10Fl?=
 =?iso-8859-1?Q?+2Xq0e7fObkI5irznuW1yhBHga+L8EBgSwbTMZGezRmKnUNCwukSwzzj3l?=
 =?iso-8859-1?Q?a3apYqJPIHGWWehsdgDbHG5/23rtUdEkeZKEXGXO+O7Sqhi2YdihfGEfoV?=
 =?iso-8859-1?Q?M+RJCxrAMNI3MOocjiUD6SVikSwwWCAk1gcEa230JJhF8X/OpvdCWEKgBE?=
 =?iso-8859-1?Q?MMwVfg1TuHW4H7WrqRIkBc7eIvmzWbhgdQNRsXB5jfHL1+XMVQM+KMwCq5?=
 =?iso-8859-1?Q?g/89V/yo7vx1jjkVmIcYRUgM36rMDGbsrChytuqC0Lzh0CUB6zqlgEaw+V?=
 =?iso-8859-1?Q?5HyVgdpa8JXS4cBcycP5dZNXUB1U02kVB2fuj2mnST1xj6ejOyY8XUZnOY?=
 =?iso-8859-1?Q?fNSXsiT2nz2t4CFms1XIJwi4sRqomGS2os0jDiIs4GVAG5DlkEi5qTZmZe?=
 =?iso-8859-1?Q?SD4HnNZvYATyc7IVIywAmnFNaobqXugm4VoMSS5a4Ty9vhidT2109uqUBi?=
 =?iso-8859-1?Q?/284TdTuwkpi4gy9MBf6q4NOaLuJ5lzX/YuR6JjSKjozQk6fQ3e+aifbQo?=
 =?iso-8859-1?Q?91tXT/rMZa79KOojNCDp+C8SGiS0QYN5SVtUK6WgCxiXLgyuCwuhkdECEd?=
 =?iso-8859-1?Q?b8bWhCBjtRV+GqTeqDFEKOr9SBkORLqEGsBtiY92p6j0RXtv6fBeuAuFv2?=
 =?iso-8859-1?Q?T2Wuo88VTv7p0ZtGQYAvqSDzSnOdhklxR/fH9IWCraToUVGL34LkAmLirW?=
 =?iso-8859-1?Q?O6kStMJ7Md732jQoqHs8TluVFd20ncok5W4PrdLKdIbNvXMqc1FqI/1Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc56a83-fd2d-4ce9-7136-08de0728f9c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 11:42:50.3322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B2YYanJMCRSxHAv0G6T4MZ4LyRGWRdghUtcTsSjFqS4cO4CxfiJyT/2DOiKaVmIFL+ueSQ1Ik0kdsHJp+XtR3jRqC/BRFIXaC1ZOTxYde1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8722

From: Grygorii Strashko <grygorii_strashko@epam.com>

Rework LVTx registers masks usage in MMIO/WRMSR write emulation code:

- do LVTx masks renaming and rearranging to x_WR_MASK/x_RO_MASK

- rename "vlapic_lvt_mask[]" to "lvt_wr_masks[]" to indicate they define
writable LVTx regs bits

- add lvt_rsvdz_masks[] and use it in guest_wrmsr_x2apic() for "Reserved"
bits checking (RsvdZ, Non-zero writes to reserved bits should cause #GP
exception)

- add LVT_REG_IDX() macro to avoid open coding calculation of LVTx regs
indexes for lvt_wr_masks[]/lvt_rsvdz_masks[] in many places

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
Hi

Patch created according to discussion [1] and based on [1].

I've seen patches from Jan [2] a bit late, so sending
it as is for now.

[1] https://patchwork.kernel.org/project/xen-devel/patch/20250930190550.116=
6875-1-grygorii_strashko@epam.com/
[2] https://patchwork.kernel.org/project/xen-devel/cover/265d5053-af61-42cb=
-a3b9-ef60df39c21b@suse.com/

 xen/arch/x86/hvm/vlapic.c | 75 ++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 2ecba8163f48..1a00b224e033 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -34,27 +34,44 @@
 #define VLAPIC_VERSION                  0x00050014
 #define VLAPIC_LVT_NUM                  6
=20
-#define LVT_MASK \
-    (APIC_LVT_MASKED | APIC_SEND_PENDING | APIC_VECTOR_MASK)
-
-#define LINT_MASK   \
-    (LVT_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY |\
-    APIC_LVT_REMOTE_IRR | APIC_LVT_LEVEL_TRIGGER)
+#define LVT_REG_IDX(reg) (((reg) - APIC_LVTT) >> 4)
+
+#define LVT_WR_MASK (APIC_LVT_MASKED | APIC_VECTOR_MASK)
+#define LVT_RO_MASK (APIC_SEND_PENDING)
+
+#define LINT_RW_MASK                                                      =
     \
+    (LVT_WR_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY | APIC_LVT_LEVEL_TRI=
GGER)
+#define LINT_RO_MASK (LVT_RO_MASK | APIC_LVT_REMOTE_IRR)
+
+static const unsigned int lvt_wr_masks[VLAPIC_LVT_NUM] =3D {
+    /* LVTT */
+    LVT_WR_MASK | APIC_TIMER_MODE_MASK,
+    /* LVTTHMR */
+    LVT_WR_MASK | APIC_DM_MASK,
+    /* LVTPC */
+    LVT_WR_MASK | APIC_DM_MASK,
+    /* LVT0 */
+    LINT_RW_MASK,
+    /* LVT1 */
+    LINT_RW_MASK,
+    /* LVTERR */
+    LVT_WR_MASK,
+};
=20
-static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =3D
-{
-     /* LVTT */
-     (LVT_MASK | APIC_TIMER_MODE_MASK) & ~APIC_SEND_PENDING,
-     /* LVTTHMR */
-     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
-     /* LVTPC */
-     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
-     /* LVT0 */
-     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
-     /* LVT1 */
-     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
-     /* LVTERR */
-     LVT_MASK & ~APIC_SEND_PENDING,
+/* LVTx reserved (rsvdZ) bits masks */
+static const unsigned int lvt_rsvdz_masks[VLAPIC_LVT_NUM] =3D {
+    /* LVTT */
+    ~(LVT_WR_MASK | APIC_TIMER_MODE_MASK | LVT_RO_MASK),
+    /* LVTTHMR */
+    ~(LVT_WR_MASK | APIC_DM_MASK | LVT_RO_MASK),
+    /* LVTPC */
+    ~(LVT_WR_MASK | APIC_DM_MASK | LVT_RO_MASK),
+    /* LVT0 */
+    ~(LINT_RW_MASK | LINT_RO_MASK),
+    /* LVT1 */
+    ~(LINT_RW_MASK | LINT_RO_MASK),
+    /* LVTERR */
+    ~(LVT_WR_MASK | LVT_RO_MASK),
 };
=20
 #define vlapic_lvtt_period(vlapic)                              \
@@ -881,7 +898,7 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg,=
 uint32_t val)
     case APIC_LVTERR:       /* LVT Error Reg */
         if ( vlapic_sw_disabled(vlapic) )
             val |=3D APIC_LVT_MASKED;
-        val &=3D array_access_nospec(vlapic_lvt_mask, (reg - APIC_LVTT) >>=
 4);
+        val &=3D array_access_nospec(lvt_wr_masks, LVT_REG_IDX(reg));
         vlapic_set_reg(vlapic, reg, val);
         if ( reg =3D=3D APIC_LVT0 )
         {
@@ -1013,26 +1030,18 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr=
, uint64_t val)
             return X86EMUL_EXCEPTION;
         break;
=20
-    case APIC_LVTT:
-        if ( val & ~(LVT_MASK | APIC_TIMER_MODE_MASK) )
+    case APIC_CMCI:
+        if ( val & ~(LVT_WR_MASK | LVT_RO_MASK | APIC_DM_MASK) )
             return X86EMUL_EXCEPTION;
         break;
=20
+    case APIC_LVTT:
     case APIC_LVTTHMR:
     case APIC_LVTPC:
-    case APIC_CMCI:
-        if ( val & ~(LVT_MASK | APIC_DM_MASK) )
-            return X86EMUL_EXCEPTION;
-        break;
-
     case APIC_LVT0:
     case APIC_LVT1:
-        if ( val & ~LINT_MASK )
-            return X86EMUL_EXCEPTION;
-        break;
-
     case APIC_LVTERR:
-        if ( val & ~LVT_MASK )
+        if ( val & lvt_rsvdz_masks[LVT_REG_IDX(offset)] )
             return X86EMUL_EXCEPTION;
         break;
=20
--=20
2.34.1

