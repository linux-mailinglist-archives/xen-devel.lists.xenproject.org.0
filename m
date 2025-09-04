Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A0B43E8A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 16:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110287.1459586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAqK-0006eB-Og; Thu, 04 Sep 2025 14:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110287.1459586; Thu, 04 Sep 2025 14:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAqK-0006bV-Kx; Thu, 04 Sep 2025 14:21:40 +0000
Received: by outflank-mailman (input) for mailman id 1110287;
 Thu, 04 Sep 2025 14:21:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m40+=3P=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uuAqI-0005ts-MZ
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 14:21:38 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77580edf-899a-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 16:21:36 +0200 (CEST)
Received: from DU0PR03MB8934.eurprd03.prod.outlook.com (2603:10a6:10:473::15)
 by GV2PR03MB8751.eurprd03.prod.outlook.com (2603:10a6:150:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 14:21:28 +0000
Received: from DU0PR03MB8934.eurprd03.prod.outlook.com
 ([fe80::26fd:98f2:a1cc:be40]) by DU0PR03MB8934.eurprd03.prod.outlook.com
 ([fe80::26fd:98f2:a1cc:be40%7]) with mapi id 15.20.9052.013; Thu, 4 Sep 2025
 14:21:28 +0000
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
X-Inumbo-ID: 77580edf-899a-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjnJOz4kzjyGz+9hbMnanO9ye/Jl4hoWy6YrxVOwwZLSTqubUmo4AYhBMix0Q+DiQ/OuNIVSynA4Foj9IutlUF3L4tpmzWj2TN5HConArzfmz9kdb/q0u56xjiP3Iiuj3MrNfCFEmsAE2yUKH1h3T/vwvol4gUBSSj9iZH54I8xJy2io8ndi7wrkR0ZxYwD/Rai+WKPVQpEH9BNsFMmpl4obqPJpdmQ3Hn/lk+N2UF4Ssoz3HoI0hTbhOamfZC2O4gjJZACgNzHIFGAxLRVm7WjLc+a8GhfculakbuWPJnGasjZProuEZC16Rc/n4/kn3zVrwrXq6O1WvQD2IkXnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLqKtUXnnhvD9/L7FKSmlG8ST1SlgHYQ55gQP5fFKiI=;
 b=XC78V7Z6Xl/1MxR6uMvWQXsHvpitVY9lE7oS9s6l1kOQplocxXGqhR6JaV/KqnjAVKdNt0TLDw9x8uLDXDUixkqmJYcGTVFllydcWt570IHeAFk/dePGBYWVsJHFOCTFte5/Yiqu9sYLi0Iv7MzDYgKeswq7Fm4dG0r+tgmSesIBUvxd9pdIIlfMT1QZW04L2ZAjlRdKfKHEwI5BUhpy2/E+J9+5UZzZWtMPkFbVeTJG36G+F4i0O612LEol56sFQLrlQA4Vst+D+5+ggXhfVi21KHncs3wQL5haMOPq6QJQoL5TIzuEuaseEPsP+M3P0F1KtevONOJXC8M29LjuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLqKtUXnnhvD9/L7FKSmlG8ST1SlgHYQ55gQP5fFKiI=;
 b=Gh/KkS1EiboPbLxMXtIf7t65408TR9Z4Sltqy4NSrMzMQ+Eks73+jWroTar+r42BBzwO/7tcx2AfeuGhzCZhZbWTh2juvbNzzXy1vsgdaSNC2O7x8t+OC/Fah6TE5ZFGMEQ/wS9qgvri2/p0o9YMHdNHuNBf+F4eiGSKdBNezyy28Qi/MC5GFcseHtB3yo4lQ/DuCXs3tH/EB3OiHob6eo9aPCeYjtHHjEExZZ1sA5R8vwZXUgU2IU6s5UJcXhOUQqZ03dzCshgAMOYZgoAAH6+6yZihQzP/xAdAqIYhbbWOOdvcsTMbhjMTaiiPkchCoG8q2JyPelRYeeJkThuA8w==
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
Subject: [PATCH v9 2/4] xen/arm: scmi-smc: update to be used under sci
 subsystem
Thread-Topic: [PATCH v9 2/4] xen/arm: scmi-smc: update to be used under sci
 subsystem
Thread-Index: AQHcHaczwiXWETSGtUC3f6Sg3ujscw==
Date: Thu, 4 Sep 2025 14:21:27 +0000
Message-ID:
 <b302b64a5242552d29c033f9b8831ac026984e25.1756995595.git.oleksii_moisieiev@epam.com>
References: <cover.1756995595.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756995595.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB8934:EE_|GV2PR03MB8751:EE_
x-ms-office365-filtering-correlation-id: a00457a0-5939-4a70-17a7-08ddebbe563d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ArRqZYeNxee8ki1fQ76xsDP/X3cBNIFySWT9k1DDprrQg/yb94VQVFa+z0?=
 =?iso-8859-1?Q?+sO24Eok+ZfxHh0Cn9q0sMuat4DSJngaRa28Uz9uXOubBzyBwL4ZGlH+3G?=
 =?iso-8859-1?Q?BrJZ0dbjJCDN2GURukQjSnmiZMXcdgld6p5Ihu90phxrLfvQp9VG0v8dKb?=
 =?iso-8859-1?Q?kF4RtVvgggjNtBX7FxpotZZ+GKTi1SghR3f54Z31xVR/tUeHDHXstRk4Dj?=
 =?iso-8859-1?Q?2KdKrd5Vf0i+ZBpPNEotdacWruqgW6IaARoDDugirp5F53M51Fch9DYJsO?=
 =?iso-8859-1?Q?Tu0R/T7JdEXq9WULfz/+CDPUf5WRxKbopjdEYabdVm2UYdcudmuDFgpgU5?=
 =?iso-8859-1?Q?2vtqaYY5L055M9PZtWFaaiaWYHSbBemvYezqePxoQOGEmMRClz2iKwigEY?=
 =?iso-8859-1?Q?PQh18S/c3ULUjYWVS+acfbiBz6wDj3vKTTLIqeUs/olxBDsu470V4SCuFe?=
 =?iso-8859-1?Q?24fv0fnp2U9Koj8xWIS9wonxmKAw7pWw+Fgv2KTOfI5qYa/9TvZ9R6WrKe?=
 =?iso-8859-1?Q?HrXAVCLfEFZ4i1MYow4lOoXtPS6j296VsAqljMkbJzQf0cxPhwLx8UC8a6?=
 =?iso-8859-1?Q?qvz9y4nh0AMBcywfd+lDJoE3sZCvhpeAVB+Vp/g/Izld+5MdK9pHKlSC20?=
 =?iso-8859-1?Q?hgQTEB5J5bJffJHOwMebSLCTFl+uJy5kYaaesJcTSLMzGt78aVpGgar/Ux?=
 =?iso-8859-1?Q?2J388pbqAjV6jR9DO6idLTOg1x/KFuA9XWmW29ULFtLVyBJy0gux2zS+jB?=
 =?iso-8859-1?Q?Nq4Yl9LQLeNm+c3zUDfUKr7KWMOcdwv6vlyPR7YsebiXvDp5nKPnzmGywz?=
 =?iso-8859-1?Q?62UhDAvJgty8qqRUQa1J+yan5QPddPf0nHBqpx6D0cHVshnTzhfoO7xRrC?=
 =?iso-8859-1?Q?16DgUm3yQWDOY169zcTfUoDEGp70FnexRNJGuVotN+iuBxdB9BFn3pQEK2?=
 =?iso-8859-1?Q?2mR7oOyclKzbAE0ugceOqATH/mut1R4bdy2dYbW0Bo110Eh6Jb2/UEkdKR?=
 =?iso-8859-1?Q?VKYEFqHCLjO+wHG+l9hRygHDMQWhhmygJGMt0vCxk9WFS+cQOCXmEWRIT7?=
 =?iso-8859-1?Q?gHk+zGfGQJ6Ceoqa3Bj77OvjuHF+a3QPUiEKL00UhShp6H6u6BqmHvJpA9?=
 =?iso-8859-1?Q?rxAhXeTohqW9tmZUeBQyKyYxZbM7hdgckl/FTVJ4wLaTSbKk+ue39CxwsL?=
 =?iso-8859-1?Q?+4aYq9PSmUZbyXw3HW944E5COhuTru5bO/Q3a+UjhYH9wMRu3RQtk7EiAV?=
 =?iso-8859-1?Q?nsL6iV1aSi8A9oS/619qBuPndYNPDFAa8RxCekIvFlRN3yyjkfmAxCEnxm?=
 =?iso-8859-1?Q?lgxD3GCOKgLILbVeF9sVzHqPmyQ7VqJLxOWaSIY5RaR+XIwHqh+VbyGLwJ?=
 =?iso-8859-1?Q?g0SYfuStSq2AS6l7kSp7nBmLF2onm9Be2L0LUPflDvlpV9+cToiBg+OyTw?=
 =?iso-8859-1?Q?lV7MVnhuyEqCGuC9Ihl8JhkjWm3HJNaRin8tZV8Vu1ssf/TSfXUcL+YwyQ?=
 =?iso-8859-1?Q?T6CJRx4GMvUgf0oF1p3y74ZQ2Cs8F4nun+TZ08A3jrGw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB8934.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7tmWfT43VPUzIYxRme6lD93HSrE7p8jyQYSBFwI5o4wmiX/rlRxS9aBzuS?=
 =?iso-8859-1?Q?k81b06Y7gIs5RYPkY+fx7PqLuSlr7b7tlPtTZcpkn+HRHhKvHlH6S+JaPj?=
 =?iso-8859-1?Q?Cw14ooKccAZkqS5GIr/p73ocnIQSyOnnoPFj5vEWHaxO+ijBqa35d1mLjh?=
 =?iso-8859-1?Q?1E+ysGtRicciNnWeqjjPij/FZbiaEVACf8HGYOV18uxOhWiUlJb28YDQgL?=
 =?iso-8859-1?Q?RZwqe6hL8ogcNPKUYiFHUDZO4bm9vLcDgQS1x7vuKKbhja5sj/4vTYVmus?=
 =?iso-8859-1?Q?OmGoriQo4Erm3/NweIQp12xOpfN46xP2xj4WZmeKPWfxB4LzRXX5JA67Gq?=
 =?iso-8859-1?Q?j+tHV2w/2l9dWnNdCnRAP5IBBj6yfpEJXZh2Mm+Y4pZccjJTdt/F0IJMYX?=
 =?iso-8859-1?Q?dsnJckD5cKoaWYZSvoRHxdhNuu15VxBsZZqU7cJRRI1Q2Ep+8KogxYWZ41?=
 =?iso-8859-1?Q?JSjZP24UHbA//xnKMQOZfz2XLnA6pN+S2FQ0lVnf5ZvcnVPcDyxOYT7fL2?=
 =?iso-8859-1?Q?KNIEZ3evBmCIQL67FG/1WT+aEI3zxMtloCwX0ZjYqQqeApusY2E87lY/0d?=
 =?iso-8859-1?Q?AB6LvWcLYKz/NRGVT5a8cp7YKhjzAd0luK1HQfStKlYjikzQ+cBYzr4hep?=
 =?iso-8859-1?Q?+vP6p8FW9fx0gmOrhNbKgQwyIoxYuLED2D5StkQfspx5llFslgFTlhsEjG?=
 =?iso-8859-1?Q?yGZxqJuLrnXgyPjZc6haZ5FrI/158b6CmRaJlFvCfwOIM5tZ32iCab/7cB?=
 =?iso-8859-1?Q?w69hfZSVtlMdgEz4peDAZyoJIFlFo/eo63le+Qp44wGmc3Rs4cXOPirhYf?=
 =?iso-8859-1?Q?qSM64VfuJTC7N+ikaOi8O6IwxWohcQcEYBs3hLJSGw5CfpFnrskTnHiV5I?=
 =?iso-8859-1?Q?Eue3kxrFEjlYa4kl1PWM1hN+MAndOHeIxeHNZerrVZedr5BQaiOMF8UlYL?=
 =?iso-8859-1?Q?Mw9SH4gqJzcEdK2cf5pwonL1x6+WdtRik+VqmYKcM6FsyNM0B4ywWG5rz3?=
 =?iso-8859-1?Q?qm3rjAgG3fAzgzjcxUvosb3jjlxpsaYkprLvgYr0C8nHVBE8zmEt/yBQ0o?=
 =?iso-8859-1?Q?oG6zH7aVLZsQsBjhTUCCch+MxV+2EljKj5wtDEM64gIdilvKmFd/Y3hQC9?=
 =?iso-8859-1?Q?WcID00E7oLKH8MX9Q25+NTv1CfYQr7jfLjFBl/bpXWrmhLuD1DBQCRMoE9?=
 =?iso-8859-1?Q?yO4ZZLAt9CLOLNQkkeRYfvXpZGM2722yIR90UC+/6nTBmUHPPzE9heACIb?=
 =?iso-8859-1?Q?e5Px9qEHvwSlbCQigl4DIYTJgGsRej/ujXWcHdRe1PUX9pkxEXqaNcYzHn?=
 =?iso-8859-1?Q?PmUlWsxNm//Q4Ln86FxnlXdD6c3Fc9KSPt8ecmB8mOxG1nKNRXJhZL+eog?=
 =?iso-8859-1?Q?o8jpolhm26CRmb4pWcjBNPt+fte9TuJ2DOMEQ6LMgqWfyNzOljblMwb4Wg?=
 =?iso-8859-1?Q?McFp21tOC0JFjvcYAbBFcv/NkaTsxv0aBNs3KrczPSC6pwc2kz9JOHRFGm?=
 =?iso-8859-1?Q?ueldGPNUXEAo6U5v0gA7wESytwGiFL13wD8AUyslFw7pMoTpsM2g7RKtuU?=
 =?iso-8859-1?Q?UJ8au3+LV4CMyjeWqctopdypgH3RyHOMFCtRJukYY3tfzG+cBm1Eva4Ics?=
 =?iso-8859-1?Q?sNWXaQ24C/sbYhOYyEq1Qnan5/Fee/RrEw6EIqzuPXfXxcQ/NkAh7Sjw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB8934.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a00457a0-5939-4a70-17a7-08ddebbe563d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 14:21:27.5197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3992foHw6gz3wsQr2lV0uXTFZ8Nc6oF/rcoZx4Q8FP+hhRfszUo5SRRA1P36qHBeDHtPSnTT+iOOvHtwWGWoHmKw7C3Wn8aynDIyoWczmdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8751

From: Grygorii Strashko <grygorii_strashko@epam.com>

The introduced SCI (System Control Interface) subsystem provides unified
interface to integrate in Xen SCI drivers which adds support for ARM
firmware (EL3, SCP) based software interfaces (like SCMI) that are used in
system management. The SCI subsystem allows to add drivers for different FW
interfaces or have different drivers for the same FW interface (for example=
,
SCMI with different transports).

This patch updates SCMI over SMC calls handling layer, introduced by
commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls handling
layer"), to be SCI driver:
- convert to DT device;
- convert to SCI Xen interface.

There are no functional changes in general, the driver is just adopted
to the SCI interface.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---

(no changes since v7)

Changes in v7:
- sort headers in scmi-smc.c file

Changes in v6:
- add R-b tag

 xen/arch/arm/firmware/Kconfig                | 13 ++-
 xen/arch/arm/firmware/scmi-smc.c             | 93 +++++++++++---------
 xen/arch/arm/include/asm/firmware/scmi-smc.h | 41 ---------
 xen/arch/arm/vsmc.c                          |  3 +-
 xen/include/public/arch-arm.h                |  1 +
 5 files changed, 64 insertions(+), 87 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index fc7918c7fc..bbf88fbb9a 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -8,9 +8,18 @@ config ARM_SCI
=20
 menu "Firmware Drivers"
=20
+choice
+	prompt "ARM SCI driver type"
+	default SCMI_SMC
+	help
+	Choose which ARM SCI driver to enable.
+
+config ARM_SCI_NONE
+	bool "none"
+
 config SCMI_SMC
 	bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
-	default y
+	select ARM_SCI
 	help
 	  This option enables basic awareness for SCMI calls using SMC as
 	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
@@ -18,4 +27,6 @@ config SCMI_SMC
 	  firmware node is used to trap and forward corresponding SCMI SMCs
 	  to firmware running at EL3, for calls coming from the hardware domain.
=20
+endchoice
+
 endmenu
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-=
smc.c
index 33473c04b1..4c5df714c2 100644
--- a/xen/arch/arm/firmware/scmi-smc.c
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -16,12 +16,12 @@
 #include <xen/sched.h>
 #include <xen/types.h>
=20
+#include <asm/device.h>
+#include <asm/firmware/sci.h>
 #include <asm/smccc.h>
-#include <asm/firmware/scmi-smc.h>
=20
 #define SCMI_SMC_ID_PROP   "arm,smc-id"
=20
-static bool __ro_after_init scmi_enabled;
 static uint32_t __ro_after_init scmi_smc_id;
=20
 /*
@@ -41,14 +41,11 @@ static bool scmi_is_valid_smc_id(uint32_t fid)
  *
  * Returns true if SMC was handled (regardless of response), false otherwi=
se.
  */
-bool scmi_handle_smc(struct cpu_user_regs *regs)
+static bool scmi_handle_smc(struct cpu_user_regs *regs)
 {
     uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
     struct arm_smccc_res res;
=20
-    if ( !scmi_enabled )
-        return false;
-
     if ( !scmi_is_valid_smc_id(fid) )
         return false;
=20
@@ -78,49 +75,45 @@ bool scmi_handle_smc(struct cpu_user_regs *regs)
     return true;
 }
=20
-static int __init scmi_check_smccc_ver(void)
+static int scmi_smc_domain_init(struct domain *d,
+                                struct xen_domctl_createdomain *config)
 {
-    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
-    {
-        printk(XENLOG_WARNING
-               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
-        return -ENOSYS;
-    }
+    if ( !is_hardware_domain(d) )
+        return 0;
=20
+    d->arch.sci_enabled =3D true;
+    printk(XENLOG_DEBUG "SCMI: %pd init\n", d);
     return 0;
 }
=20
-static int __init scmi_dt_init_smccc(void)
+static void scmi_smc_domain_destroy(struct domain *d)
 {
-    static const struct dt_device_match scmi_ids[] __initconst =3D
-    {
-        /* We only support "arm,scmi-smc" binding for now */
-        DT_MATCH_COMPATIBLE("arm,scmi-smc"),
-        { /* sentinel */ },
-    };
-    const struct dt_device_node *scmi_node;
-    int ret;
+    if ( !is_hardware_domain(d) )
+        return;
=20
-    /* If no SCMI firmware node found, fail silently as it's not mandatory=
 */
-    scmi_node =3D dt_find_matching_node(NULL, scmi_ids);
-    if ( !scmi_node )
-        return -EOPNOTSUPP;
+    printk(XENLOG_DEBUG "SCMI: %pd destroy\n", d);
+}
=20
-    ret =3D dt_property_read_u32(scmi_node, SCMI_SMC_ID_PROP, &scmi_smc_id=
);
-    if ( !ret )
+static int __init scmi_check_smccc_ver(void)
+{
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
     {
-        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT nod=
e\n",
-               SCMI_SMC_ID_PROP, scmi_node->full_name);
-        return -ENOENT;
+        printk(XENLOG_WARNING
+               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
+        return -ENOSYS;
     }
=20
-    scmi_enabled =3D true;
-
     return 0;
 }
=20
+static const struct sci_mediator_ops scmi_smc_ops =3D {
+    .handle_call =3D scmi_handle_smc,
+    .domain_init =3D scmi_smc_domain_init,
+    .domain_destroy =3D scmi_smc_domain_destroy,
+};
+
 /* Initialize the SCMI layer based on SMCs and Device-tree */
-static int __init scmi_init(void)
+static int __init scmi_dom0_init(struct dt_device_node *dev, const void *d=
ata)
 {
     int ret;
=20
@@ -134,22 +127,36 @@ static int __init scmi_init(void)
     if ( ret )
         return ret;
=20
-    ret =3D scmi_dt_init_smccc();
-    if ( ret =3D=3D -EOPNOTSUPP )
-        return ret;
+    ret =3D dt_property_read_u32(dev, SCMI_SMC_ID_PROP, &scmi_smc_id);
+    if ( !ret )
+    {
+        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT nod=
e\n",
+               SCMI_SMC_ID_PROP, dt_node_full_name(dev));
+        return -ENOENT;
+    }
+
+    ret =3D sci_register(&scmi_smc_ops);
     if ( ret )
-        goto err;
+    {
+        printk(XENLOG_ERR "SCMI: mediator already registered (ret =3D %d)\=
n",
+               ret);
+        return ret;
+    }
=20
     printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
=20
     return 0;
-
- err:
-    printk(XENLOG_ERR "SCMI: Initialization failed (ret =3D %d)\n", ret);
-    return ret;
 }
=20
-__initcall(scmi_init);
+static const struct dt_device_match scmi_smc_match[] __initconst =3D {
+    DT_MATCH_COMPATIBLE("arm,scmi-smc"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(scmi_smc, "SCMI SMC DOM0", DEVICE_FIRMWARE)
+    .dt_match =3D scmi_smc_match,
+    .init =3D scmi_dom0_init,
+DT_DEVICE_END
=20
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/in=
clude/asm/firmware/scmi-smc.h
deleted file mode 100644
index 6b1a164a40..0000000000
--- a/xen/arch/arm/include/asm/firmware/scmi-smc.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * xen/arch/arm/include/asm/firmware/scmi-smc.h
- *
- * ARM System Control and Management Interface (SCMI) over SMC
- * Generic handling layer
- *
- * Andrei Cherechesu <andrei.cherechesu@nxp.com>
- * Copyright 2024 NXP
- */
-
-#ifndef __ASM_SCMI_SMC_H__
-#define __ASM_SCMI_SMC_H__
-
-#include <xen/types.h>
-
-struct cpu_user_regs;
-
-#ifdef CONFIG_SCMI_SMC
-
-bool scmi_handle_smc(struct cpu_user_regs *regs);
-
-#else
-
-static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
-{
-    return false;
-}
-
-#endif /* CONFIG_SCMI_SMC */
-
-#endif /* __ASM_SCMI_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 4095171533..78d5bdf56f 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -21,7 +21,6 @@
 #include <asm/traps.h>
 #include <asm/vpsci.h>
 #include <asm/platform.h>
-#include <asm/firmware/scmi-smc.h>
=20
 /* Number of functions currently supported by Hypervisor Service. */
 #define XEN_SMCCC_FUNCTION_COUNT 3
@@ -233,7 +232,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
     if ( platform_smc(regs) )
         return true;
=20
-    return (scmi_handle_smc(regs)) ? true : sci_handle_call(regs);
+    return sci_handle_call(regs);
 }
=20
 /*
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e7a17ede3e..b31324f8d4 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -328,6 +328,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
=20
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
=20
 struct xen_arch_domainconfig {
     /* IN/OUT */
--=20
2.34.1

