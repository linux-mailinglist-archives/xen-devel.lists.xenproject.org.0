Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B556A32919
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 15:50:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886495.1296130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiE46-0004Ow-6k; Wed, 12 Feb 2025 14:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886495.1296130; Wed, 12 Feb 2025 14:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiE46-0004Ni-3x; Wed, 12 Feb 2025 14:50:14 +0000
Received: by outflank-mailman (input) for mailman id 886495;
 Wed, 12 Feb 2025 14:50:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F6iz=VD=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tiE44-0004NZ-72
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 14:50:12 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a78ec172-e950-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 15:50:10 +0100 (CET)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by PA4PR03MB7133.eurprd03.prod.outlook.com (2603:10a6:102:f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 14:50:07 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%6]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 14:50:07 +0000
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
X-Inumbo-ID: a78ec172-e950-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7d0g/BgQxkZlvsECS2/7zOavH7AuDzzrvoWydGfgxpp6ooLl8x63z6DTvvqeIqOjoXAdCtGJPqWyrxwXC/xzlqcTjuuCL1vIrnnqxwbmQIFkz17QjGQuuieU1kCPi5d7rWLeWPLTF3FyMTmihVcb0UevqWlOHVc2YUVyxwC0l5tjzfi8S9dvDJPXVxNx09AgBkSvs+jNwMyZhTixoI8NE/byZudOLjNdHRBMm200BYJijNKK8csDIy3xmsdINKP/fVTjiS/CjkCk+jLrsZhHAGZ61dfRv0QQSgg6GcajMstz3JUPFDi0vx2bI1fUXXsRHffeF6vRd4ffeLN5u9TPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOPi5VS27uH6rJEGNSap5sM8KCGqIVVZHMOZcpvYAZg=;
 b=unHo6vas5LadsIISP/4U8iFxksnyCVl8HCIIYAAttHbw5XfrWNP+7DP4ZrYyobgLNTiYw6DkDEUdjW6ssT7kQxM6qiWtm4xh7x3TGQoLvSkGbWPX0q0da6k3VhiD+ZLXRyJTjbCUjvoT55qfEdkXbI8S6hqpcDOtfCavt9VuluJj5+MeKPf0Og3QdFsbZ5A3mf6PGBKr2onEd5yLTdgnvBbWeFtvJyTJZxUxnUhYUxk0BPB6jX4E1YOiFUNEXYkWgzV32Vh2R0GQ4S+QDvyPgQJ8RzQeXka2oPvxgWvshKcWYbpNbunxsNL1fi6RbW2YU50+r7kcWqiafd0QZawggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOPi5VS27uH6rJEGNSap5sM8KCGqIVVZHMOZcpvYAZg=;
 b=CddyYJ6iL8swXx7MWYPOIp8e99+whN+PSSGQuagqy8CqV0vpKq3s6JzfrktGxUaymFAvj6c1KhIIVovr8P3XQ6AHHmLzzJitZQqpmkElgds2YynmrwCXYPlo1/BCaKNJ0D9lU1iF+M6nMRQZ2dpg+SG+QhrH52unVH4Cp75NzW/DSfxVb4KjT6sCRIgWqC3Pf6+FuGepAkzBtdk4Iftx9d9k6/IAUdn8p2RiBhtUmaDICjrhR5KV1S8iqEYc9B7s4iJVREqaleg/N5FjGqBnStZjpTVF8n5YCutQ8AmrALJ6Zb4KabfLZ3mZDVf0lBoJIAdDXYsHATghJmbpxBEClA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arch: arm64: always set EL=1 when injecting undefined
 exception
Thread-Topic: [PATCH] arch: arm64: always set EL=1 when injecting undefined
 exception
Thread-Index: AQHbfV1o49BmN8//HUa+q1wWbdbPiA==
Date: Wed, 12 Feb 2025 14:50:07 +0000
Message-ID: <20250212144950.2818089-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|PA4PR03MB7133:EE_
x-ms-office365-filtering-correlation-id: 8eeb21dc-3e02-4400-b5eb-08dd4b748ac1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZfJc7g4XDTygSjHSVBb3WpTFJWIkspDGLuHbBu4efUtQmpbJ78KohWoJyX?=
 =?iso-8859-1?Q?3tZIScfgJN2OqPoUunfrkIar1RpIyIw3I5DByb0F5Sh8mqN6QNvQknFwrW?=
 =?iso-8859-1?Q?e557A29PPzQBhK8PD240KOL4YZBZJPbXaf5H415cX380btAzO+963LfRnl?=
 =?iso-8859-1?Q?Cs2gRJpMSlmZpIhEFzw0xPNm3Pvof73AocmwsZDpuSdU1goeQ3GkI/ngzn?=
 =?iso-8859-1?Q?nh7po7vSu0sBUnlers51KPLryQh1RvItHbICSsG8JMmfI995bFlGmnDMG/?=
 =?iso-8859-1?Q?JD1ULUQCFJ4CapmDaSs90H8ImjDe8pSJHr88sM73ghUWUG7EZD0Vt9U+bN?=
 =?iso-8859-1?Q?S+oHu4Wu2V3HuYhgbPc9O5nzjLKGsRBxLE1u7gv45kO5X81rmgsDFpiG0f?=
 =?iso-8859-1?Q?ML4O/4ODTRml2diarRYbHzV3M88JjpE8qGjV4CACClJzReDpGFjyoOYEqz?=
 =?iso-8859-1?Q?8y2F2q9Q6/CTiC5AI/Ggoa8ipl0i1UvGIYyeum8d3QQU+FeEF7Yj0usw68?=
 =?iso-8859-1?Q?yjpnDrYEN94/j4Knn/PtDgONbSOukYNyGYqjS8PBOGl3sD6gBzmKDz73oI?=
 =?iso-8859-1?Q?Bf3YllbeCuGVGD0spBBB26DTvPoZRsvAncczM5eSD0IWHtoQg9/WmOr7Na?=
 =?iso-8859-1?Q?cDsyBAFmVq0auPGVgdL2WvuSYgGAHFRWdqraX+pJaNp9FMLjqhejIcagGV?=
 =?iso-8859-1?Q?CNvNlZjYNAGAqUeld7E8ZNJ/xSonjerLNsimo9qmi1OqA7REDgVsqg6eN5?=
 =?iso-8859-1?Q?Va93+pYoYlDbuLDWEjSTsBiVfZoNUQV0TS8jaMy7VU8sbUtZxGE1lPBszN?=
 =?iso-8859-1?Q?4ZCIKG7aPQG0yv1PtRsKIpJmUuGjn8/L13uilhig6TnJqCxqVym060f2sz?=
 =?iso-8859-1?Q?gCuObxwkNDH2yHjCGFlbPEedKZQ/u9fy/WrSxhcCR+1u3IicSkmmONfsh7?=
 =?iso-8859-1?Q?VDoL12cQ/CGUiGoVPbam8+pIHfdEwp5NrvtKKZ7D3jUrgktPM1fbiTgUUz?=
 =?iso-8859-1?Q?wadiEfDXwkyfFh86S12AMEHL1V7t2PeHo9b+3iudUU82+Yno/66DspPPud?=
 =?iso-8859-1?Q?YQQgYY8N9iR8ALP4qp4DpDgJqOw0TP3vRyVAYKmQ6tfIQZzOLU0xw9ONLA?=
 =?iso-8859-1?Q?c0hA9KcVUwSNnYlM4O2RzKb6c/Zs7MR3P2RQWz5Ux/A/Y/IchWR0RGIoLQ?=
 =?iso-8859-1?Q?KyNoPXNoisq4RM1oYVR+vkLxHLuNDcWJ2h2BMkJH3cBeuykev3JwuFPeXa?=
 =?iso-8859-1?Q?l7DGGujwCiF+wM9y6j0NTT/EXxm0DqL0ee9qg5IW184MkWD7lOlOS3L37v?=
 =?iso-8859-1?Q?YTof/4MgwpGaD/814q635kqSYJqcxcvTtdqg8zSmTupAAZZhRG3r+C/h6M?=
 =?iso-8859-1?Q?tTqWUGkKwmU8UiG+y5idMtNc7k89hILZSboT1CBcwlE3lkhG12a+EqSU5J?=
 =?iso-8859-1?Q?E7de0mWCBlmRjBFnFnRoOhkTEk9b3JqtXyoj90L383sg7Irp5yB/HWO9/t?=
 =?iso-8859-1?Q?RLFBrSpuzrSfsgQVKN8wQ7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0p5ui/1/BMGWO3zEEwT6bTggt8POQitRe25Xpp4max5mdKT/wx2r8X6jeq?=
 =?iso-8859-1?Q?VcdkxqYba8turVqo0wlI84MdM9iAmf2w2d22gkVizf60e1BzWrCCGVJ24t?=
 =?iso-8859-1?Q?ofdI8pOaoeR5bWjXGAGKTeH3pkhYYOiLa81sAhbSswaFTvDGOSrRmVRUs6?=
 =?iso-8859-1?Q?wFJsPXroYnSViVlDp1eRAzjodU3/jBf2ZeBne058y3FnwbmXlF5X+eywMV?=
 =?iso-8859-1?Q?JxUJdIjVQ37vIJDuNKUX4Q9KjZz80MuXWd7yO8MMR/dPPjQokOkrELjYEu?=
 =?iso-8859-1?Q?kx11PDaix35zfvHhATf3YSm08aDE6BbTMIDG3IKFek8nLmMaxKV6wdw5bi?=
 =?iso-8859-1?Q?GaDopqjk5CeP/yfdGKMz+kGpGV6gitG4oW55ImOX4prrrzltPhN5YUm4xm?=
 =?iso-8859-1?Q?gHkQxmckOzGTMLVJCGI2X1sT/Q2f1ia+5IugTyXGfWLSD5eGw1uMBXSvee?=
 =?iso-8859-1?Q?9UGF/VNLgu16dVM0zhi9LUdIKEcLwHERcjOpxkfhf9MW7ZajDgeGFzjdLI?=
 =?iso-8859-1?Q?oy6f+eauPnwmUbEo4esre5VomywTPK1PzNy80Z3vJLXR7NzHiEK4tOxR8g?=
 =?iso-8859-1?Q?ibBiu5L3xponIHbSWkShJdFeCNZTmq8fZB/I/jG+7uWneWBIP7UHl/6/p7?=
 =?iso-8859-1?Q?T7AHMipRVSP7q5ASshHOxnnyFrPz9z0r9rIBB3ARk8heDybQ/eIEHTtdRg?=
 =?iso-8859-1?Q?U2X9An8n4ciT5IrIvfhV0mm+bb8iZaPf/aseoC3UNqag7Vkfm8ljxq7QBO?=
 =?iso-8859-1?Q?BC26A2hKlKEND9n5wmKyl6jhwB6dehPBUD6qBY3SisG9GPfjYkALN6v7wN?=
 =?iso-8859-1?Q?q+KIOZtiJdMQhHgF50I3dJyaXcWssNBZyN0pimDhIuuchF7IECUwQIJZKx?=
 =?iso-8859-1?Q?brucJFHifMQ1lZavZTjoTDj0qakerHF6HX6jw7OPdyIbuPdRYMztE5SSL3?=
 =?iso-8859-1?Q?zlJJxKkH4GoE9ySAUpjUHtNWiXFOgn/8z25k+KywZZ/8Mo/gT7cCx4uSND?=
 =?iso-8859-1?Q?tyKyGFYE7py3zYxRnZoZxBPRLnbR396U7KOEDxZMFb+YFXfqKdxEFBshTN?=
 =?iso-8859-1?Q?LzJ+Ivz4+HDfMNFACNTkcQicFQBdcsZLYe1E0SG8wek1choIaFAEve+HPW?=
 =?iso-8859-1?Q?fdrNXx1XexVPP8mYxCAtsTj4g+Tn9tFDNHPm0k/EMmZEHWeomF+Xl98OLR?=
 =?iso-8859-1?Q?B0GoR5dKPV7dY0NGDTcD44TlpNqXFPhRBjfx4/D6xn5KZFFg8S3pSSMAgr?=
 =?iso-8859-1?Q?wYLhjMkqhldLLXAjZd4mmjzO+c11ZbZgH86O/OuPK4ugfUnxiilqrAz07i?=
 =?iso-8859-1?Q?tYXqnvEMivsxJFiLoicwnrjct0Q9ZaRHwT8sAUmA8cq1ChiES94LufS6a+?=
 =?iso-8859-1?Q?6YS4Ufqj4Rd0mA22Wwp+l9ytwVWVw6iKoW/h7BF/1nIHTtq/DJ3BsqnLRT?=
 =?iso-8859-1?Q?9puHNcg74OmzBxKVfqtXVb5oeUG2gO3Q9npSvg6+Ip5UZn/aIfk0cT0hlV?=
 =?iso-8859-1?Q?ZFfX1xvf3AqjOR5fTSjp9M2ut8IneEzfkWXPoiF5mH++MaRYYCAUA0VH1P?=
 =?iso-8859-1?Q?yNzvX7VF2lwVYY8qOyPgmDmWzRjVaOfgdHgozjS9wQ2OKofsyI/jL7C/q5?=
 =?iso-8859-1?Q?1n4zzkkizj2zrgOW+sJxbkYxAllG6meaPdAI2CKh0CIG2wWFsE0ZjPOQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eeb21dc-3e02-4400-b5eb-08dd4b748ac1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 14:50:07.2566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EgjFQmF8ApOd5CBwbyDlWw0wmfIUTJvDibjtzxKOCkMiABhtOw7+67ii/eAluUrURx3ic948XP44pztMncjr4uKFHEtH/QMYZQDAHEXj9r8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7133

ARM Architecture Reference Manual states that EL field of ESR_EL1
register should be 1 when EC is 0b000000 aka HSR_EC_UNKNOWN.

Section D24.2.40, page D24-7337 of ARM DDI 0487L:

  IL, bit [25]
  Instruction Length for synchronous exceptions. Possible values of this bi=
t are:

  [...]

  0b1 - 32-bit instruction trapped.
  This value is also used when the exception is one of the following:
  [...]
   - An exception reported using EC value 0b000000.

To align code with the specification, set .len field to 1 in
inject_undef64_exception() and remove unneeded second parameter.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/arm64/vsysreg.c           |  8 ++++----
 xen/arch/arm/include/asm/arm64/traps.h |  2 +-
 xen/arch/arm/include/asm/traps.h       |  2 +-
 xen/arch/arm/p2m.c                     |  2 +-
 xen/arch/arm/traps.c                   | 24 ++++++++++++------------
 xen/arch/arm/vcpreg.c                  | 24 ++++++++++++------------
 xen/arch/arm/vsmc.c                    |  6 ++----
 7 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index c73b2c95ce..29622a8593 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -95,7 +95,7 @@ void do_sysreg(struct cpu_user_regs *regs,
      */
     case HSR_SYSREG_ACTLR_EL1:
         if ( regs_mode_is_user(regs) )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
         if ( hsr.sysreg.read )
             set_user_reg(regs, regidx, v->arch.actlr);
         break;
@@ -267,7 +267,7 @@ void do_sysreg(struct cpu_user_regs *regs,
     case HSR_SYSREG_CNTP_TVAL_EL0:
     case HSR_SYSREG_CNTP_CVAL_EL0:
         if ( !vtimer_emulate(regs, hsr) )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
         break;
=20
     /*
@@ -280,7 +280,7 @@ void do_sysreg(struct cpu_user_regs *regs,
     case HSR_SYSREG_ICC_SGI0R_EL1:
=20
         if ( !vgic_emulate(regs, hsr) )
-            return inject_undef64_exception(regs, hsr.len);
+            return inject_undef64_exception(regs);
         break;
=20
     /*
@@ -440,7 +440,7 @@ void do_sysreg(struct cpu_user_regs *regs,
     gdprintk(XENLOG_ERR,
              "unhandled 64-bit sysreg access %#"PRIregister"\n",
              hsr.bits & HSR_SYSREG_REGS_MASK);
-    inject_undef_exception(regs, hsr);
+    inject_undef_exception(regs);
 }
=20
 /*
diff --git a/xen/arch/arm/include/asm/arm64/traps.h b/xen/arch/arm/include/=
asm/arm64/traps.h
index a347cb13d6..3be2fa69ee 100644
--- a/xen/arch/arm/include/asm/arm64/traps.h
+++ b/xen/arch/arm/include/asm/arm64/traps.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_ARM64_TRAPS__
 #define __ASM_ARM64_TRAPS__
=20
-void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len);
+void inject_undef64_exception(struct cpu_user_regs *regs);
=20
 void do_sysreg(struct cpu_user_regs *regs,
                const union hsr hsr);
diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/tr=
aps.h
index 9a60dbf70e..3b40afe262 100644
--- a/xen/arch/arm/include/asm/traps.h
+++ b/xen/arch/arm/include/asm/traps.h
@@ -44,7 +44,7 @@ int check_conditional_instr(struct cpu_user_regs *regs, c=
onst union hsr hsr);
=20
 void advance_pc(struct cpu_user_regs *regs, const union hsr hsr);
=20
-void inject_undef_exception(struct cpu_user_regs *regs, const union hsr hs=
r);
+void inject_undef_exception(struct cpu_user_regs *regs);
=20
 /* read as zero and write ignore */
 void handle_raz_wi(struct cpu_user_regs *regs, int regidx, bool read,
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 65b70955e3..6196cad0d4 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -438,7 +438,7 @@ void p2m_set_way_flush(struct vcpu *v, struct cpu_user_=
regs *regs,
     {
         gprintk(XENLOG_ERR,
                 "The cache should be flushed by VA rather than by set/way.=
\n");
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
         return;
     }
=20
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 737f4d65e3..5338d5c033 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -533,12 +533,12 @@ static vaddr_t exception_handler64(struct cpu_user_re=
gs *regs, vaddr_t offset)
 }
=20
 /* Inject an undefined exception into a 64 bit guest */
-void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len)
+void inject_undef64_exception(struct cpu_user_regs *regs)
 {
     vaddr_t handler;
     const union hsr esr =3D {
         .iss =3D 0,
-        .len =3D instr_len,
+        .len =3D 1,
         .ec =3D HSR_EC_UNKNOWN,
     };
=20
@@ -606,13 +606,13 @@ static void inject_iabt64_exception(struct cpu_user_r=
egs *regs,
=20
 #endif
=20
-void inject_undef_exception(struct cpu_user_regs *regs, const union hsr hs=
r)
+void inject_undef_exception(struct cpu_user_regs *regs)
 {
         if ( is_32bit_domain(current->domain) )
             inject_undef32_exception(regs);
 #ifdef CONFIG_ARM_64
         else
-            inject_undef64_exception(regs, hsr.len);
+            inject_undef64_exception(regs);
 #endif
 }
=20
@@ -1418,7 +1418,7 @@ static void do_trap_hypercall(struct cpu_user_regs *r=
egs, register_t *nr,
     if ( hsr.iss !=3D XEN_HYPERCALL_TAG )
     {
         gprintk(XENLOG_WARNING, "Invalid HVC imm 0x%x\n", hsr.iss);
-        return inject_undef_exception(regs, hsr);
+        return inject_undef_exception(regs);
     }
=20
     curr->hcall_preempted =3D false;
@@ -1655,7 +1655,7 @@ void handle_raz_wi(struct cpu_user_regs *regs,
     ASSERT((min_el =3D=3D 0) || (min_el =3D=3D 1));
=20
     if ( min_el > 0 && regs_mode_is_user(regs) )
-        return inject_undef_exception(regs, hsr);
+        return inject_undef_exception(regs);
=20
     if ( read )
         set_user_reg(regs, regidx, 0);
@@ -1674,10 +1674,10 @@ void handle_wo_wi(struct cpu_user_regs *regs,
     ASSERT((min_el =3D=3D 0) || (min_el =3D=3D 1));
=20
     if ( min_el > 0 && regs_mode_is_user(regs) )
-        return inject_undef_exception(regs, hsr);
+        return inject_undef_exception(regs);
=20
     if ( read )
-        return inject_undef_exception(regs, hsr);
+        return inject_undef_exception(regs);
     /* else: ignore */
=20
     advance_pc(regs, hsr);
@@ -1694,10 +1694,10 @@ void handle_ro_read_val(struct cpu_user_regs *regs,
     ASSERT((min_el =3D=3D 0) || (min_el =3D=3D 1));
=20
     if ( min_el > 0 && regs_mode_is_user(regs) )
-        return inject_undef_exception(regs, hsr);
+        return inject_undef_exception(regs);
=20
     if ( !read )
-        return inject_undef_exception(regs, hsr);
+        return inject_undef_exception(regs);
=20
     set_user_reg(regs, regidx, val);
=20
@@ -2147,7 +2147,7 @@ void asmlinkage do_trap_guest_sync(struct cpu_user_re=
gs *regs)
     case HSR_EC_SVE:
         GUEST_BUG_ON(regs_mode_is_32bit(regs));
         gprintk(XENLOG_WARNING, "Domain tried to use SVE while not allowed=
\n");
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
         break;
 #endif
=20
@@ -2164,7 +2164,7 @@ void asmlinkage do_trap_guest_sync(struct cpu_user_re=
gs *regs)
         gprintk(XENLOG_WARNING,
                 "Unknown Guest Trap. HSR=3D%#"PRIregister" EC=3D0x%x IL=3D=
%x Syndrome=3D0x%"PRIx32"\n",
                 hsr.bits, hsr.ec, hsr.len, hsr.iss);
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
         break;
     }
 }
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 0b336875a4..a7f627bfe0 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -206,7 +206,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
     case HSR_CPREG32(CNTP_CTL):
     case HSR_CPREG32(CNTP_TVAL):
         if ( !vtimer_emulate(regs, hsr) )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
         break;
=20
     /*
@@ -217,7 +217,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
      */
     case HSR_CPREG32(ACTLR):
         if ( regs_mode_is_user(regs) )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
         if ( cp32.read )
             set_user_reg(regs, regidx, v->arch.actlr);
         break;
@@ -397,7 +397,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
                  cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->p=
c);
         gdprintk(XENLOG_ERR, "unhandled 32-bit CP15 access %#"PRIregister"=
\n",
                  hsr.bits & HSR_CP32_REGS_MASK);
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
         return;
     }
     advance_pc(regs, hsr);
@@ -421,7 +421,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union=
 hsr hsr)
      */
     case HSR_CPREG64(CNTP_CVAL):
         if ( !vtimer_emulate(regs, hsr) )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
         break;
=20
     /*
@@ -433,7 +433,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union=
 hsr hsr)
     case HSR_CPREG64(ICC_ASGI1R):
     case HSR_CPREG64(ICC_SGI0R):
         if ( !vgic_emulate(regs, hsr) )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
         break;
=20
     GENERATE_CASE(TTBR0, 64)
@@ -467,7 +467,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union=
 hsr hsr)
             gdprintk(XENLOG_ERR,
                      "unhandled 64-bit CP15 access %#"PRIregister"\n",
                      hsr.bits & HSR_CP64_REGS_MASK);
-            inject_undef_exception(regs, hsr);
+            inject_undef_exception(regs);
             return;
         }
     }
@@ -532,7 +532,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
          * is set to 0, which we emulated below.
          */
         if ( !cp32.read )
-            return inject_undef_exception(regs, hsr);
+            return inject_undef_exception(regs);
=20
         /* Implement the minimum requirements:
          *  - Number of watchpoints: 1
@@ -631,7 +631,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union=
 hsr hsr)
              cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
     gdprintk(XENLOG_ERR, "unhandled 32-bit cp14 access %#"PRIregister"\n",
              hsr.bits & HSR_CP32_REGS_MASK);
-    inject_undef_exception(regs, hsr);
+    inject_undef_exception(regs);
 }
=20
 void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr)
@@ -669,7 +669,7 @@ void do_cp14_64(struct cpu_user_regs *regs, const union=
 hsr hsr)
              cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs->pc);
     gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 access %#"PRIregister"\n",
              hsr.bits & HSR_CP64_REGS_MASK);
-    inject_undef_exception(regs, hsr);
+    inject_undef_exception(regs);
 }
=20
 void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
@@ -698,7 +698,7 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const unio=
n hsr hsr)
     gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 DBG access %#"PRIregister"=
\n",
              hsr.bits & HSR_CP64_REGS_MASK);
=20
-    inject_undef_exception(regs, hsr);
+    inject_undef_exception(regs);
 }
=20
 void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
@@ -731,7 +731,7 @@ void do_cp10(struct cpu_user_regs *regs, const union hs=
r hsr)
                  cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->p=
c);
         gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#"PRIregister"=
\n",
                  hsr.bits & HSR_CP32_REGS_MASK);
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
         return;
     }
    =20
@@ -756,7 +756,7 @@ void do_cp(struct cpu_user_regs *regs, const union hsr =
hsr)
=20
     ASSERT(!cp.tas); /* We don't trap SIMD instruction */
     gdprintk(XENLOG_ERR, "unhandled CP%d access\n", cp.coproc);
-    inject_undef_exception(regs, hsr);
+    inject_undef_exception(regs);
 }
=20
 /*
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 62d8117a12..e253865b6c 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -346,13 +346,11 @@ void do_trap_smc(struct cpu_user_regs *regs, const un=
ion hsr hsr)
     if ( vsmccc_handle_call(regs) )
         advance_pc(regs, hsr);
     else
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
 }
=20
 void do_trap_hvc_smccc(struct cpu_user_regs *regs)
 {
-    const union hsr hsr =3D { .bits =3D regs->hsr };
-
     /*
      * vsmccc_handle_call() will return false if this call is not
      * SMCCC compatible (e.g. immediate value !=3D 0). As it is not
@@ -360,7 +358,7 @@ void do_trap_hvc_smccc(struct cpu_user_regs *regs)
      * ARM_SMCCC_ERR_UNKNOWN_FUNCTION.
      */
     if ( !vsmccc_handle_call(regs) )
-        inject_undef_exception(regs, hsr);
+        inject_undef_exception(regs);
 }
=20
 /*
--=20
2.47.1

