Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDA8B0EC87
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053423.1422204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNE-00065M-0D; Wed, 23 Jul 2025 07:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053423.1422204; Wed, 23 Jul 2025 07:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUND-00061o-Om; Wed, 23 Jul 2025 07:58:47 +0000
Received: by outflank-mailman (input) for mailman id 1053423;
 Wed, 23 Jul 2025 07:58:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueUNC-0005y7-Jj
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:58:46 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db151591-679a-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 09:58:44 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB8082.eurprd03.prod.outlook.com (2603:10a6:102:231::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 07:58:38 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 07:58:38 +0000
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
X-Inumbo-ID: db151591-679a-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwyVJguC8Ab4aA+yOQUdsblHpqazYZvyVmM4LK31pEer0QLwsAsykP0Sk8bfc68rqMEfZe0Kb7yjcRQPQzKwXtlVhDiMiLvBMGXqtpioue0Bm0JHs8f/ZebjVrVGZXGRVsOji3pU0dR50D0gYzxgkTSzrvFZXHoRTAD6sH1uUxYyAkbEWEAsxsEsl/2Wy4tqeJR5OgPkYAD0JTG0EiccnRmLyDDzl09O9aDV0tmbwztkZDildTlV2irW/V0HqmZeNagSgqrpqlvGC1FyQRwf2ZHadr01KOfVgwRsqBhQEAis262YVhDDCeEE0/ABsKDkLa2VrX12Yj7DcIlZqOLv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFDTHmETQ5fRxFAxpX2NNcZUKxnF62Jp5vQIcFCpppM=;
 b=W7B8Y6n4YivbwCNVtvTVzHSzJtBw0lmRtR4TZrae9P0pfT0pRygZ7mIS9LZFsXAjbbsJHtR4+hn3r8pFMkAV3vs70RLPsyqu2KsrftQq7qkjJSbxojZeMbHXBmWQVUQwmSYODtpqJMNDBMUBtEemtmOgelouvYXaheHNitQ1PXafUqLN95vEyCAK6KcWlbHSMMDzHSEzmKy6kdARUU0fedQ9cvLKMoxBYY5QR64OxqaxJy9NmntkYREKzHRmGX92R438B8VRjSdaXMDuIhdqeRBIo2hjTn5Y4bdCsz9DoXKw2txjhLvTSl5M1zXUjLW2UnkOWpwGJOaVIWt8QktJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFDTHmETQ5fRxFAxpX2NNcZUKxnF62Jp5vQIcFCpppM=;
 b=i+PUHOgVaY+B7+k2Wbr8NG2aizXkUa8I1/9Hk7AdGIHVbt4pXhHHtLAtmD/ZP354Nh55POt/50n0Q6WP/C277Whaefvp8rff1MltkCw7DT+TsuV5toDbI69dbXEqQgpk4RkiR3wVURmZfyxtMMv3iYOMpC7aK2zqljcsRlD/U1PuOGobhqe1NrWnd0y4D+r8shbFH2j03XlNx1C49M+RY0AIULoGis6+Lm0qynhbYBdr1kUJBrP2wL5kVzFaWnedpBm3GSGqs0PEDq7D/kKIhaiYLsO8iLpb391C8OUmPG+bDf7DdiX4bzHIORikiADmgdBe087BALw/sCu82PLz3w==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH 3/8] xen/arm: move vcpu_switch_to_aarch64_mode() in arm64
Thread-Topic: [XEN][PATCH 3/8] xen/arm: move vcpu_switch_to_aarch64_mode() in
 arm64
Thread-Index: AQHb+6eZp6GoTWRoEk2X7VZ+pq7wbg==
Date: Wed, 23 Jul 2025 07:58:38 +0000
Message-ID: <20250723075835.3993182-4-grygorii_strashko@epam.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
In-Reply-To: <20250723075835.3993182-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PAXPR03MB8082:EE_
x-ms-office365-filtering-correlation-id: ed19eae3-0c06-4944-7f61-08ddc9bebb88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?DTqWz723ahZjG5bzn/W/kMqXYNq3o0ZBWrENzmnJ8koJgbYYn/irgNti8F?=
 =?iso-8859-1?Q?+ZaSuqxH64FTNHQe0w96wg/t7finXhKSR/wwZL4AwXXH1tuaaMjpK59PBJ?=
 =?iso-8859-1?Q?jcC2ZAPtioR7ioEI/v0DSnpBSJHhqGVVMpcbhEAo4dkGbVwYtILUbtwwnx?=
 =?iso-8859-1?Q?+KFVI56C+fE96R9T0o3xTSLWFNlxT5Pp76Tkr4Jh//0SqeJ9s/dOLIWqle?=
 =?iso-8859-1?Q?VRzXDI/1A+9sjgPiqvoXiuft1SKEI53hdoF9uX7JDEXTCApS2HGkY3+OMU?=
 =?iso-8859-1?Q?Wrhtc3UOy+YS0Cmiaf8FTPKCxp5DXjGIQTtipzri1JwpfHw9KEvJe3WqWl?=
 =?iso-8859-1?Q?3liSPh0ZbKYskpSP0aHSXCHbfIehDHpFcjHhycEgsSCDLbvYMxtd7DJHSg?=
 =?iso-8859-1?Q?PPsvQbbUIHJDrku7nn9ZQ3wKJBFu3qIu0htV47VuMMqSApKASOGIC74kAU?=
 =?iso-8859-1?Q?qfKZSRaBWZ+nyxpRxc6LZ8dtlS0d1oR8uiLQcA1jDEc+Zq3VZr/l1jRIhy?=
 =?iso-8859-1?Q?E9eKracDqb74QjtYagzWeJcyGO6U9XKlwwydheC7YS68n9Dcnql7Eapqp1?=
 =?iso-8859-1?Q?/1E1lA7y96zq1NrxrWK/qmrSt7qfhn/JM2t6vPaln4SpbAgAlFZK2h8axW?=
 =?iso-8859-1?Q?2+bG/+7tjZJp4UCtJOiZ8D0UTWlsLcbNM85213zTo4xiJ6RK7e1uIM3pZV?=
 =?iso-8859-1?Q?/Nbb2/AJZMEGFocje8XHZF7KltWxkrZ6DmFoUqnlPZis652l40wOBlVJ3E?=
 =?iso-8859-1?Q?SOxrr5Vfl9yFcwMoI3u6KJTa0m17a6TcPCQCoTaKtWLccrS/e/dKal3CDw?=
 =?iso-8859-1?Q?lzK5aYdoZ0Cnu4+srGvqCDBm1vs/x1v7Tsv5+cQ3MkgZnWQJIhXbrpVgEx?=
 =?iso-8859-1?Q?Wjo9XF1Has688TqQlg0ZfkVXGivYNcYU7bkHQC28QkMFLJrunQ/9MKpo09?=
 =?iso-8859-1?Q?w4EiWaG8mnX2QwyXUqmPlvYm82z/4psviz7iblp6e8zm4ULDNmPLSUpjPA?=
 =?iso-8859-1?Q?TkP5ZHULxy0Ms8RmGdEl+MmkR10taqrlUD7FTYm3wNvaF+fwwN+3YucQxy?=
 =?iso-8859-1?Q?RShdrRvLiRHfTL8k8nSZqtE8hSaI/9rXhP5gbMkTnqVmjFaIW05AMoStNR?=
 =?iso-8859-1?Q?q93qGhgM2fPep7eLMKWPQWqw5DFyN+M8xTmhqVUt36gY6JAGNFdZ/rXpzA?=
 =?iso-8859-1?Q?qxiYkYwml68Z4U/Qgst0fWvpFGmCojiM7BF9hr65NpyfdXUmheezQsXTUz?=
 =?iso-8859-1?Q?cdqdXawbFpUsRAyZloCxkTIfuPXw6s3PsE8BPSaVxzM82WABawICEZ0p21?=
 =?iso-8859-1?Q?C2yYbp8PK3K5AiPBiTlP0SFXH81lPwj9v4oG8U6RSOtFyXMfYEWBgGiq7l?=
 =?iso-8859-1?Q?kpXHtjfNAaVwo/908DzsHhoiS95Sx3M1e8xo+wwNPOuzYQzP7SyVUhH+1b?=
 =?iso-8859-1?Q?pjUvXBDYPZCzAyMJgd/D3i3p5WScbwaWWJ7oorbVivDnUYIxBFm05vewNV?=
 =?iso-8859-1?Q?PZ48qVPjLhJEBBZ7klNnQ62hTKQix3nK5OIH5Mg7CwOw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Sun266M8M3aorGDAGj7v7R6SGmurDh2GugPoglOT2M9fhpOy5oI18gPgXI?=
 =?iso-8859-1?Q?DIEGxLEHG+WMEz8Xv/oCtFBa07Lun8fXyahXMxSE79BVcbtMY/TXE6Wm5z?=
 =?iso-8859-1?Q?KU2v7yQRATfcyGtQ2Bai3aMl1jTZE8H6FivxkUKAEDXn83ZOurMJAQ44rp?=
 =?iso-8859-1?Q?iQ3Da0gxYRPOJOZL9v/XWHQSK7UNtxZULTDZ7Z1mPL1OJ57gGscpLG7/OM?=
 =?iso-8859-1?Q?cTyMbvZp3DPY+FJ3StTo6MyGN1+WQSyKToq7md3sqSEFAN/DE9Nb330lbW?=
 =?iso-8859-1?Q?qayoO4NcqifA341YT6F737atJoYyzhcW1JkWroNrbZpCkB5H9Bs4UdQFM1?=
 =?iso-8859-1?Q?RbZCPSed4Uq4BUtuIoGoKKf3BpYbc5emWSNfcl/XZf1UcfQ4E3KaG87rXu?=
 =?iso-8859-1?Q?0zgCb7r9SkeQF7yp0fZWB+xwro89aZDX3veW6XKzZ36Mki8/GkX2G7NjxF?=
 =?iso-8859-1?Q?q7o9XPpWLoJA9J5m1wiiB1tUSktfOclN3/sVPwvnHgd/O4GodLmhUVFVfy?=
 =?iso-8859-1?Q?9BwZoTHBgwKwCvU0L37oSzG9Hmmcg+B3J+lcEPLOViCOTHBIHcedFCY4g5?=
 =?iso-8859-1?Q?yU021H1ova+N+IZ2r8pNz/c6g0yH5VbGovLrB29EMQtEM/JOzDujzfM8hF?=
 =?iso-8859-1?Q?18bX4RqDiZUTQbWYq+PXH8j4DXH91nL01m8ZwnS/a8rmbw0qdg5OZoi6V4?=
 =?iso-8859-1?Q?bZa24ufi8c9NVDczyYmIYbmGUvHOFto9HETxCzB7nNy6LzxZFp6h4XnCMP?=
 =?iso-8859-1?Q?Yi0f7FsitX7aUWZ9/CXCNkJrkwNCU01mPXYIF1a3mULvtXEH0QyHwJ9puW?=
 =?iso-8859-1?Q?RQVn5Xp2X6UnN7vNApIUvOqEWc1S5f7GF/c4ZaRkML5pKU6wcyRdo276wK?=
 =?iso-8859-1?Q?2QVE3MqopNPuRZBairmZxI0abuaoUHaU5P+EE/RQyyuV0P8FOAxhshZp7Q?=
 =?iso-8859-1?Q?b5snfXIujPqp6wgBP1eOdUrrOxPeDkvs/lTZWiEaRAk0PuZFHtlbCclnnx?=
 =?iso-8859-1?Q?MuYIxJq24qLaRu+4zP9yvlEydHOG5eCow00g0lFjHwOfeu+oZm1EQawIER?=
 =?iso-8859-1?Q?pSXQweK8dQ1PBX5oxj2tJjnp1a6ABsFrAMgtXrivSty+ZfAV0aatjY7GA+?=
 =?iso-8859-1?Q?gWynch+lpp1fvsUGQgfVUeNktTa9mdCKLgY9MCa3653qug8jt3/P7vRe9p?=
 =?iso-8859-1?Q?B6y/TvPv/9QOKSjjEc3ABaxFgYJxpZ0cI9SktA3P5YrzReKceQ9ocMGIua?=
 =?iso-8859-1?Q?iZjICc/xvQfzp7MK3+6hv1ax8G+TCI21mvD7q4rTTR4/zhmvfFb6pfyTuD?=
 =?iso-8859-1?Q?YG8zI0wRPvRUdee1KHKhWsBE80qVgflUMpatyME/djWATojlwhVZrb9qeu?=
 =?iso-8859-1?Q?2eZXHJv8h2wEJ2tHONb29lY8aNwbUNjJx/Pmq2HKraT1xN4WXDBEu2WJkN?=
 =?iso-8859-1?Q?5bVDhvEaQh4FWq5uRPZwYAuSGCruneJlsU+eYeJMOGokSSCmo9iRkeq8J8?=
 =?iso-8859-1?Q?1ccpP5oLGDZ7PHOC1u2Gqc46hyBaGIf8a6YAyk6hD+MlzWPNg9EblIgZc/?=
 =?iso-8859-1?Q?aQe4jcP0UGIxcNIyWl6RyvwbEaNbCMvUr0zvdHtllhfNQqEZqEC76lB00R?=
 =?iso-8859-1?Q?RGKG4o44Aumsdf53wNBgVLPbUiWOirzU3qJivoICGPHcYQ6S4N6cQFFA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed19eae3-0c06-4944-7f61-08ddc9bebb88
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 07:58:38.3086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFn7jI4j8AvAoN5u/RElfn1LIe3xrkjl21YkcCVtrGymPoBRrqHp43HDlw7iidhDaY9lMyX0SlfqTTv8rVD3qxOW6JZs0/V7wHS+HLp+sVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8082

From: Grygorii Strashko <grygorii_strashko@epam.com>

The vcpu_switch_to_aarch64_mode() is Arm64 specific, so move it in Arm64.
As part of this change:
- introduce arm32/arm64 domain.h headers and include them in asm/domain.h
basing on CONFIG_ARM_xx;
- declare vcpu_switch_to_aarch64_mode() for arm64;
- add vcpu_switch_to_aarch64_mode() as empty macro for arm32.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/arm64/domain.c             |  5 +++++
 xen/arch/arm/domain.c                   |  5 -----
 xen/arch/arm/include/asm/arm32/domain.h | 17 +++++++++++++++++
 xen/arch/arm/include/asm/arm64/domain.h | 22 ++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h       |  3 ++-
 5 files changed, 46 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/arm32/domain.h
 create mode 100644 xen/arch/arm/include/asm/arm64/domain.h

diff --git a/xen/arch/arm/arm64/domain.c b/xen/arch/arm/arm64/domain.c
index dd1909892995..1e78986b5a7b 100644
--- a/xen/arch/arm/arm64/domain.c
+++ b/xen/arch/arm/arm64/domain.c
@@ -55,6 +55,11 @@ void vcpu_regs_user_to_hyp(struct vcpu *vcpu,
 #undef C
 }
=20
+void vcpu_switch_to_aarch64_mode(struct vcpu *v)
+{
+    v->arch.hcr_el2 |=3D HCR_RW;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index bbd4a764c696..e785278cdbd7 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -605,11 +605,6 @@ void arch_vcpu_destroy(struct vcpu *v)
     free_xenheap_pages(v->arch.stack, STACK_ORDER);
 }
=20
-void vcpu_switch_to_aarch64_mode(struct vcpu *v)
-{
-    v->arch.hcr_el2 |=3D HCR_RW;
-}
-
 int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     unsigned int max_vcpus;
diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/include=
/asm/arm32/domain.h
new file mode 100644
index 000000000000..4d1251e9c128
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm32/domain.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ARM_ARM32_DOMAIN_H
+#define ARM_ARM32_DOMAIN_H
+
+#define vcpu_switch_to_aarch64_mode(v)
+
+#endif /* ARM_ARM32_DOMAIN_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/include=
/asm/arm64/domain.h
new file mode 100644
index 000000000000..b5f1177d2508
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/domain.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ARM_ARM64_DOMAIN_H
+#define ARM_ARM64_DOMAIN_H
+
+/*
+ * Set guest execution state to AArch64 (EL1) for selected vcpu
+ *
+ * @vcpu: pointer to the vcpu structure
+ */
+void vcpu_switch_to_aarch64_mode(struct vcpu *v);
+
+#endif /* ARM_ARM64_DOMAIN_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index a3487ca71303..fa258eb8d359 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -24,9 +24,11 @@ enum domain_type {
 };
 #define is_32bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_32BIT)
 #define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
+#include <asm/arm64/domain.h>
 #else
 #define is_32bit_domain(d) (1)
 #define is_64bit_domain(d) (0)
+#include <asm/arm64/domain.h>
 #endif
=20
 /*
@@ -246,7 +248,6 @@ struct arch_vcpu
 }  __cacheline_aligned;
=20
 void vcpu_show_registers(struct vcpu *v);
-void vcpu_switch_to_aarch64_mode(struct vcpu *v);
=20
 /*
  * Due to the restriction of GICv3, the number of vCPUs in AFF0 is
--=20
2.34.1

