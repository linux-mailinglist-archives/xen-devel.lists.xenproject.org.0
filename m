Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A66B593CD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 12:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124600.1466889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uySzf-00022h-W0; Tue, 16 Sep 2025 10:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124600.1466889; Tue, 16 Sep 2025 10:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uySzf-0001wl-T9; Tue, 16 Sep 2025 10:33:03 +0000
Received: by outflank-mailman (input) for mailman id 1124600;
 Tue, 16 Sep 2025 10:33:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/dE=33=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uySze-0001tN-2x
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 10:33:02 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84eb78ab-92e8-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 12:33:00 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB9591.eurprd03.prod.outlook.com (2603:10a6:10:422::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 10:32:56 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 10:32:55 +0000
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
X-Inumbo-ID: 84eb78ab-92e8-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mImsfdtGNq4t8gltSOs5PVcUnn5PZfLYhTXUx9ItNQYNjmhGq67OQ8AXSigfXpBUIgybqBTO62H0YWmKlRIFV1spupfGf70SzWYg1111ZwVR5M0JVqSUyG8nPuqGTtYyLJzG5+YoACVSH/Lo8vLyYpW5+k2gCzjj+yFmZzlcvaDO3BwTlzsZ6nwaqqhwlgzdUJJ7SQt44cCOkSKvLwQx0w+BDXGfQ9cztlq4bbNUpRzB5JQgSisK0zxM0t2mSblhsRtTg2XW5q0vpnL8VLQ4/dZ2u8hSAAvWQap60wHLvYi5GxRkVqat0g0NKGp2Kq9nG4A5YSDzjwQYdg2B32lxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wv13zN5BcibyLFTJq/H0LRp7NtOi2qCJ2E+tKH0O7oM=;
 b=g5gAPTFhLQxc7YTBigHCXK6H94IoY9/+71IEVPJPsANngz0v0G9cwCsdn0UUwkNpmSQJ5rh/qmtRa0AqxfSlf+Otmkzs+MjF0dxD1Vj3Rc7vAPfruQtKyYdxYw2FnA6/yts8dP/B/IavQv1gaXdYoOuS4K5owq8GQ6MKQrf2Tny7TJ3XSdDWKGkMKe8vwI82vtfSK0ziRNE13mxZVK6h29fbzatCI+VRncreutM+zH+YmO6zjTOfrl4DFXhOH740Nd02KFA7cD3TcJa258BO+zVBE8tJHphaYF0GSbdNrrGcvH5/rZa+wr7IJ+sFWIwnWIhVG6Bb1Zq7/+LuwhcegQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wv13zN5BcibyLFTJq/H0LRp7NtOi2qCJ2E+tKH0O7oM=;
 b=umPNSuib6YKTbkgM1kFCLWUf/09FTzDY0OqWnapdkfsVvwZv9RFJt9GGZw+v9qdP9swsJd4+v9yGo0cwlzBfxjydIQTM4ykx5+3ArGZ2J5O149KbBQNbbbZv/q6kv6TPYfLsOxZdYJwOYJerSEOKaJyKOfsXMSQ9gUTaomF+GXk6uoJGszXWnCr+h8PItSXTB6Dy70jqrTW3tQljdm9J9KzV1bhHsTZyMfBJ7kJM7w94R1zeoJ/wql0udOCQNKvq3tEFMZY24rebjK+lST1HvkJsgj1L5YEUW6BoQJBVPDt//tlxYfUfQ7A6Pmrvkn98lfp846igNECEkeb/CfvC2w==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: [XEN][PATCH 2/2] x86: hvm: svm: fix runtime svm presence check for
 !CONFIG_AMD_SVM case
Thread-Topic: [XEN][PATCH 2/2] x86: hvm: svm: fix runtime svm presence check
 for !CONFIG_AMD_SVM case
Thread-Index: AQHcJvVD14T55ZkVAEOSLzvP6+fiIg==
Date: Tue, 16 Sep 2025 10:32:55 +0000
Message-ID: <20250916103251.2144449-2-grygorii_strashko@epam.com>
References: <20250916103251.2144449-1-grygorii_strashko@epam.com>
In-Reply-To: <20250916103251.2144449-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU0PR03MB9591:EE_
x-ms-office365-filtering-correlation-id: b88a02e8-624b-474e-257e-08ddf50c662d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?W1HaOsH8Qiit4UyHtoR4oSTAvV+obToComCIWzccGVet4DnMq+d3XZYhs5?=
 =?iso-8859-1?Q?kzI6Zg+RmGiDdp84ukY5muq1eB4Pi8kH8S7MpVKxTIfkq5sxUqeVHd1XJ9?=
 =?iso-8859-1?Q?7lPsVPducCSSgW9tY4lS+pmP4OiAjHNPviodtBLgT0xOhrNFNi3JRL5pBp?=
 =?iso-8859-1?Q?7PIWAM82NZKJ/VLQupSSYqhd+I2RJsBZpyD/h9TZjHo1Ttg4R+tE95R2Rj?=
 =?iso-8859-1?Q?JJQfaJRkI8t2BqP3V6+tFFsUukanQ2u87L5ZWUh3OBhx+CDKqpd34GKs+y?=
 =?iso-8859-1?Q?T4VCRa6y7WOOR32uBgQvih9nwdJ7rCCxXZa28WnstEnd3C9oEIcRAMRpoE?=
 =?iso-8859-1?Q?up//jbKfy9ocuhcI9BHoMA11w57Xb5jcf9J+jkWeeDZtQfPNYPAQBdWD3G?=
 =?iso-8859-1?Q?yrIPD+hvkGYybbMo3nsihmaf9jQj4LtsG6Gbf3XNRvLihNO2fm42gD1Xqq?=
 =?iso-8859-1?Q?SbjHZdyKm4sZw++lL84346avy8sdy4FEIyuXgldvP0J2bDbR12Hce1TvUT?=
 =?iso-8859-1?Q?RuVrsS3YnuKcoVOfMdNOrZ0OB9FTnlgCm3GWx/INilrLW3w13sAye744ZW?=
 =?iso-8859-1?Q?YQVqEvZ2tbjvSR90OAQiREn+c38ZJTgGAuw9qoJfcfJNjBdcjNlYqLl7rC?=
 =?iso-8859-1?Q?CoCj5+McFmOCXADwCjpx7kbfIyPtLYS4JDbOjlElpjk1mFcjzs00IqSN+m?=
 =?iso-8859-1?Q?ScDFDTLWBJrx8Oo7zoQ6OUtVad73vtZP/GLEy+FmVFW2pUMOi6fPILn5ET?=
 =?iso-8859-1?Q?3EhgU4jULYC0yrQ5o39rbzs4EInylYTifvmRyRUGX7FsMAMI3LfPwh6yMy?=
 =?iso-8859-1?Q?vIEwo3b6PiBThphDMV40ZBpiKeZxA73LUeEGdGAjaIZ3iVo2zDM4OpHrIR?=
 =?iso-8859-1?Q?o7j71o4w1PdPuhwshvh9/ZUs+KZi23LNl1qdI37q68KonpKrRnOy+ETmkE?=
 =?iso-8859-1?Q?NE+7msiWcPWu3RLEA/p8B2PruVnKQF1d7mIMRIxV+DEK9dYyWQNUi7PWfn?=
 =?iso-8859-1?Q?7NLp2CiGPHp0i7N3Up2VC/8AlzSLedGJInswbNTNmWYllmhu5HOeWhfvQ0?=
 =?iso-8859-1?Q?m0l8EU2hFbo4d1Gmo42zu0lIp6lSGCxwIe3JWX+DFJ+auBBiQnezFDvAQH?=
 =?iso-8859-1?Q?Fa0LCyWoYRXaGLf5jXcPYpY+ZUwvfP8B8yTNYKml5lFu60lgeOQZE4tmWj?=
 =?iso-8859-1?Q?E2zdNsk3eqryhkA7Fp4JmB0xxdQXZKn/DVZYe3hpb90OHEIVr8TZRBdn0M?=
 =?iso-8859-1?Q?6bCFnmWUZUlVsI50VczY5bMyeeEm7tHDo0e2NhDUAFlPvMZohKfjLGv7RG?=
 =?iso-8859-1?Q?qNdWw6Q0QWkrJM1Na8Zii5bH02a2q4KzuKtEV/xiP2C+itWFBWZGPerQ0+?=
 =?iso-8859-1?Q?LHedZUNBkqDJlp3a6Xwb7mKTr9985VoMnd0o5SXFkAAuu/xiihJnEnjpmK?=
 =?iso-8859-1?Q?uEP50TBdyOAYyg1sf1nW/BHLTlR3aokFS4RvXZY3eRJDXj4EaI4MEwy0Gu?=
 =?iso-8859-1?Q?rdWDpK751dDF60s0/7Lh2kjCwnDpcJy8izDNz8eseLFw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Le7xk1M7BVFU8s7P5oN9RdBwgAGAlcB4u8ot8jx27uQJJvroshzQwc2Fy5?=
 =?iso-8859-1?Q?lYdQ2zpOrSFrZjgOYrRZ8JnkozAOh5U8ZJZ17BQT+a2QBK1YeP3eaUlo2H?=
 =?iso-8859-1?Q?3uhyQzi0SpvzaQ2J4Lw3S1GWmuakUsh7Z+dbE740/cLHJdMEJ2Nq9eC81J?=
 =?iso-8859-1?Q?u2PshVWbuc+0PwQfgjYAlR4Znxm6lp3aqsnqlgMVRwGbSj4mN4f7hIZP3D?=
 =?iso-8859-1?Q?CRII3vOYiK4eke7DJLzgGMtvCoR82q+EZFuEq635JGXkVKxpIfeoOjAm7D?=
 =?iso-8859-1?Q?2jTlW5KOaFXzu5iW11CFJWoJajKnUZx6pvogTDMBI/zXiAf4SwLdPQW9rM?=
 =?iso-8859-1?Q?1vJaOK+0Cg3QOOrNiyWIYbKa3GhoS18sud9YmlD37z1PFn1ah9VP5Q4xJG?=
 =?iso-8859-1?Q?MiUgJvXM0XCjrlCYj38hioobFIkOJcj4f2s2WIzO5FmMfqRvUc65if9lqi?=
 =?iso-8859-1?Q?7oi7DSN2Q/s8nI7pIAYRfeNkXQJhvifOZqDKwJYRppEleBh6vFhLXrSSzO?=
 =?iso-8859-1?Q?3/EFd+VVW/AjGJLxePmF68AtPcq9kX6fNKBH5+t4DiGwQDFFrJi37S7yIS?=
 =?iso-8859-1?Q?8G40N9KHJcIPB1qFjKxOM1kJYNLkaT0CxRBqZdJNI2Pv5OB2jJg/qFxhn1?=
 =?iso-8859-1?Q?wbNuEC0+C0S5XTkAuyxDc2jtApdWD81Ny48ZW1q8Z22oMniLVDPRjWZYv4?=
 =?iso-8859-1?Q?FA4WgKVxEpZzbrE3ajEMBcBonaaZBZauyb/+xCI/Wf0D37wXUSUfEh58tI?=
 =?iso-8859-1?Q?Oi7+Rq2AjGCMDvyhcWgdAgao+q5vVetCDgrgE2bhp/1RcDtsR4N/hWan+3?=
 =?iso-8859-1?Q?rr83HveI1/2SvvLUfZjUV06A8J2FEEKooL+UH7Sp6+fe/Jl9jmaZ+E9XOZ?=
 =?iso-8859-1?Q?1oVEMzohCzKvnV9stLs+SRWNE5Q7jzFAZHgW6p6oGTMu7BAwj/7uiQQbV+?=
 =?iso-8859-1?Q?G6eJ4eaDl+XpQ4SNkxTLXKqOeLHFFGKwJNTQ+cxRVrPKLJZuGQIJ2MLD3I?=
 =?iso-8859-1?Q?85MtoSLpI6UgtCicVqYepZSxc7d9mwsqNMMH9Suii/Ep2j+R+gjdM9HH79?=
 =?iso-8859-1?Q?WIMogZmEJBSPqHwBNhME6udnhHpQy7yOUabk/KnV/jWa7hMtzYhcN7K9Gl?=
 =?iso-8859-1?Q?xFkP5/3XiABzylMGMiP10c3y8M3pJJz68Uo/KOaiC+O0dT5pqSOjgi23it?=
 =?iso-8859-1?Q?ckc/fQQWP4rtFbbuxb4KI1qkIiHNbErGH5r2EH+dOG5njXRe+ar12nR7Qp?=
 =?iso-8859-1?Q?BVmbTgop0wc1E/kcqcbEgYW/UlOnQGLjcmBRCHmk2wWJo2Wh1/WAj+BwcJ?=
 =?iso-8859-1?Q?PxSNpswOnOeEcayI/8s5cxgaWNj5QaxbPQQYaELQ2Tdz0gs5EnGZRnoWpK?=
 =?iso-8859-1?Q?C9XkeImVME1FOA9kgOd8f0ci9gbl0s/hw+xug3KlCWPz3ni2S/885pQp1Y?=
 =?iso-8859-1?Q?jX/zSx7Yixkep6Kkf38yFfy7YlrkIScmXrm/mbVn0nN8uiY4jfZDREtapD?=
 =?iso-8859-1?Q?1GBKjRonj7A2Qmd2T8OYSewJZItQ3F6utk+sO83DihAEHw51btryRzmJn6?=
 =?iso-8859-1?Q?LerXmGD+J1rZfkknsAru7lWgCBE95WrEJlg1UJdoBJG6+e8YM6IwqCGbsM?=
 =?iso-8859-1?Q?kL65yraqoH5t8AZEPcvpwGPP9D9tJFAUvrfT+7+OHvy/EMiTcxPrETvw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88a02e8-624b-474e-257e-08ddf50c662d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 10:32:55.8111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WylyvfNMDUDTHLc5wTPLF4QG429br0mVVHotJKWnMCTGyv/532nbCrjbD++EirebCRPd+Gat7SmAy/o9VbgSWh3IwEI58MStgiPC+hJHaHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9591

From: Grygorii Strashko <grygorii_strashko@epam.com>

Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX dependency") the
AMD-V support can be gracefully disabled, but it still keeps SVM
code partially built-in, because HVM code uses mix of:

- "cpu_has_svm" macro, which doesn't account for CONFIG_AMD_SVM cfg
- "using_svm()" function, which accounts for CONFIG_AMD_SVM cfg

for runtime SVM availability checking. As result compiler DCE can't remove
all, unreachable SVM code.

Fix it by sticking to "cpu_has_svm" macro usage only which is updated to
account CONFIG_AMD_SVM cfg.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
Hi

It could be good to have it in 4.21.

bloat-o-meter:
add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-98 (-98)
Function                                     old     new   delta
guest_flush_tlb_flags                         71      62      -9
init_speculation_mitigations               10024   10011     -13
hvm_set_efer                                 364     288     -76
Total: Before=3D3656835, After=3D3656737, chg -0.00%

 xen/arch/x86/domain.c                 | 4 ++--
 xen/arch/x86/hvm/hvm.c                | 2 +-
 xen/arch/x86/hvm/nestedhvm.c          | 2 +-
 xen/arch/x86/include/asm/cpufeature.h | 3 ++-
 xen/arch/x86/include/asm/hvm/hvm.h    | 5 -----
 5 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 19fd86ce88d2..92661527eb75 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1824,7 +1824,7 @@ static void load_segments(struct vcpu *n)
         if ( !(n->arch.flags & TF_kernel_mode) )
             SWAP(gsb, gss);
=20
-        if ( using_svm() && (n->arch.pv.fs | n->arch.pv.gs) <=3D 3 )
+        if ( cpu_has_svm && (n->arch.pv.fs | n->arch.pv.gs) <=3D 3 )
             fs_gs_done =3D svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_STA=
RT(n),
                                        n->arch.pv.fs_base, gsb, gss);
     }
@@ -2142,7 +2142,7 @@ static void __context_switch(void)
=20
 #ifdef CONFIG_PV
     /* Prefetch the VMCB if we expect to use it later in the context switc=
h */
-    if ( using_svm() && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
+    if ( cpu_has_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
         svm_load_segs_prefetch();
 #endif
=20
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 57d09e02ed0f..330103ddf386 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -160,7 +160,7 @@ static int __init cf_check hvm_enable(void)
=20
     if ( cpu_has_vmx )
         fns =3D start_vmx();
-    else if ( using_svm() )
+    else if ( cpu_has_svm )
         fns =3D start_svm();
=20
     if ( fns )
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index c6329ba2e51a..d895a738448c 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -157,7 +157,7 @@ static int __init cf_check nestedhvm_setup(void)
      */
     if ( cpu_has_vmx )
         start_nested_vmx(&hvm_funcs);
-    else if ( using_svm() )
+    else if ( cpu_has_svm )
         start_nested_svm(&hvm_funcs);
=20
     return 0;
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/a=
sm/cpufeature.h
index f42e95586966..ce7dc1ddad0a 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -165,7 +165,8 @@ static inline bool boot_cpu_has(unsigned int feat)
=20
 /* CPUID level 0x80000001.ecx */
 #define cpu_has_cmp_legacy      boot_cpu_has(X86_FEATURE_CMP_LEGACY)
-#define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
+#define cpu_has_svm             (IS_ENABLED(CONFIG_AMD_SVM) && \
+                                 boot_cpu_has(X86_FEATURE_SVM))
 #define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
 #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
 #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index 0fa9e3c21598..24a7ed88567b 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -383,11 +383,6 @@ int hvm_copy_context_and_params(struct domain *dst, st=
ruct domain *src);
=20
 int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
=20
-static inline bool using_svm(void)
-{
-    return IS_ENABLED(CONFIG_AMD_SVM) && cpu_has_svm;
-}
-
 #ifdef CONFIG_HVM
=20
 #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
--=20
2.34.1

