Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7B1BFC514
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 15:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148082.1480257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKH-0006lj-6Y; Wed, 22 Oct 2025 13:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148082.1480257; Wed, 22 Oct 2025 13:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKH-0006gf-2Z; Wed, 22 Oct 2025 13:56:29 +0000
Received: by outflank-mailman (input) for mailman id 1148082;
 Wed, 22 Oct 2025 13:56:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0J7Y=47=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vBZKF-0006dh-6N
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 13:56:27 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6ab83af-af4e-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 15:56:26 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DB9PR03MB7644.eurprd03.prod.outlook.com
 (2603:10a6:10:2c0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 13:56:18 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:56:18 +0000
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
X-Inumbo-ID: e6ab83af-af4e-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zwvz2E3RRljI1iW5HoGRjCHe9trsbah4KZZJ8RoQ/3pCcmpFHiJPKtkhJxqPH0R+zS7zzzLqqNz4W4hzrHWxxXmNaOmqH/jkQiSqRy1fExVeDAwVN1ajI7lOFuOdPH6HjYhPPezwHfpiGpshkxr609IB0vQ2//K+317nV4WBA610nRzFR2lSumD+pECJ8QmvzReXt5hq1icKBUTsEy2yDgcQjdatrlwq5qKyGNVYvpdj1KetyWcpwTDbjmp1WhhkuVPmI7eMkHviDb799p5xvBvB9B6DJjAxKobVSOFm6H6fBsdG2E7/2fS4dKpB6vsihEtyesXXtxxVAtTRxM0NSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUFW3uPowKzoVf+Zmjh1ybyh50HYabmWq1fqRE+JL1k=;
 b=BnG1IZw8/x/02Wf9kYlNsE1XqWIQcKG7L9gGwRnc4RGdoVhzG8v592HCdhzuiWLOCZ2eCxfdXYVEzZHhji83nvTfKFXZkAmxeSRqxlfHpU613iL8rLx9paGeFTneU8b9oJHKnHreY9Rdc2tRxjsod6nbIqJkziHOD44hrey2CmWQF3hNJctW9AR9IPUTlcwuB0OcYgTksOZDOJO9wHUrDlQBbFS5rJEcPuJdo2nPADuLtvIp8Fdn82CaP1BLIzLLVmLLRfpuyddrt3hWzbQl6cvdLQQoU1AmaY1n565ZossRHTgKPzL7vOER+FUXeuil+fRH4wE5lft/jF8noUApRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUFW3uPowKzoVf+Zmjh1ybyh50HYabmWq1fqRE+JL1k=;
 b=rbgTkfny5JoCKomSkZFbTN6zcqW7xik05HUdkkYR7HP9+WvGWuSbYOl4KdZw+ydckaRbBj+ZJWKq/GjQkhBYQG6OjI4uwbW1wyNAu2rv6bsz3f8aLYdAiny9zVS2FS6ydGdAyVNi/R01Fh/G+Yvjp6Hu7NCN6LNOb3azhaOhRdfkbdqh/Zpy8Uvk2YtbzInh4pB04xsD9308BkVTGPBGyjUVJGqbWPvZ1WAbEZ5CnrHILKrbJgdfE4fukt9lmJAAVe0PSzsivvLmVzf8i4yITBfG/3F7zBURjcR9RR51dXeZrQYlLmUm1iz9zMinAMdxfrt106l2iXaGjlPQIxDifg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Edward Pickup <Edward.Pickup@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 1/7] arm/pci: Add pci-scan boot argument
Thread-Topic: [PATCH v2 1/7] arm/pci: Add pci-scan boot argument
Thread-Index: AQHcQ1ujfTqrR7NNFkeeHnU6acvuOw==
Date: Wed, 22 Oct 2025 13:56:18 +0000
Message-ID:
 <f9a6554e833ae226e1c36df6f57c67aa0941a2cf.1761134829.git.mykyta_poturai@epam.com>
References: <cover.1761134829.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1761134829.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DB9PR03MB7644:EE_
x-ms-office365-filtering-correlation-id: 6859d73f-ab3d-4b23-7a8e-08de1172c656
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?zd0mJz0NW/ict5WIka2wCgja4MW1/ngWOSNIGDSu2Mizf2eIt40bGHdQor?=
 =?iso-8859-1?Q?VG9bJ/P1kZLuknGjeGJeM+ms0QqAJ+lqY1Tg67w2Eq7LFlw9aar0jhw1hD?=
 =?iso-8859-1?Q?3UsInfmwQ96hFt5ftz4m0+fTovSpSNMZX8OS0pNzY62fz5vGqNxKpHhwFp?=
 =?iso-8859-1?Q?Y5TbFQgUMPaH750vMVzJ0wEOLUskXgAF/0JdvolNDfiPhLs03iwXGTylyJ?=
 =?iso-8859-1?Q?Ux51jIXtQ/Rpk6r7mlTwyX+5Dqx52Exag/H7NhUxnakRAwjNOMSdaCzKb9?=
 =?iso-8859-1?Q?pI220FDiEq7xe5FqB+zRzMXSFMcljmVw6FXi5hxN13ykp+ecBVkVxCy+vr?=
 =?iso-8859-1?Q?WI86eDNno5lWc0HHteoYyChzZ8iVKi2kgHADzX16F2OXL/VISKA1oeMhf1?=
 =?iso-8859-1?Q?u5wpLgmjuIFAeBxqCB/JyPD9+QTxyz9YtJDcTjhhVBOmLBzGfG3xIL/fDo?=
 =?iso-8859-1?Q?5/Rx+89ZWE1IOj9g5NfGdig3QnnMo230imnhddmevuRyKmiCy03ps99mf2?=
 =?iso-8859-1?Q?sgXKInxIMVnznBhGolBL//+uEIX+J/pSBGHf3lsrtBaWZscvc0W4bbzJcF?=
 =?iso-8859-1?Q?6V32FSizCgmAOsRmLgc8aVecZpbqmSOL8hMBF01Ijby0zhd+xBBoxiFLnA?=
 =?iso-8859-1?Q?FWzCmzJFZQWVCyGtuBmcUI+0Xsx+w5aezxHBm3N819cNL9vaViqoIU8e+o?=
 =?iso-8859-1?Q?saGaKd6mr6Cyn6DkoKfoBgvn9fv7d34+3P7CtE1e3fTWouvC5IuxG1E19f?=
 =?iso-8859-1?Q?cVZ+feVCnJ+tq5btWk97OeRWFtZyyZuaFATDtxKm7+V3Y5Q0MDwa/cBlW8?=
 =?iso-8859-1?Q?Xr+B/+jYEOjvZt0B9gQj9ebsGsvjQIJH7CcD+1qLtOJByYNEFL0vIn3vGS?=
 =?iso-8859-1?Q?wNZq1N9CjEfGcpWH4nvPwxmfxLjukFLSX7rwZSR6Y5V9Ot2lWPGOoylEda?=
 =?iso-8859-1?Q?zioDSrTYDbu7AvoZlNeo8bz7DfpdsPQFYCC8OJbdnUnJLDVRR3LWzTHrva?=
 =?iso-8859-1?Q?PFQNxaNUsavlCKeCL8wriD6diEjjQs+b1aNUeHC9JEx0TchIVQEIjbCHHe?=
 =?iso-8859-1?Q?gth8XuvMSXnbjXg8PaO65fhk4ZNlbGZy1/IN/58JyFhkK8WXNaWTT6DviZ?=
 =?iso-8859-1?Q?Y5StG9rrH89NIGrgRpWDk1Wv8NgRZsfntptdz6nWcId9GQSelFhDhetu/Q?=
 =?iso-8859-1?Q?9/gz5CL/8qr58tSxpkbNglOTe7OzZe9L0/dZpIpTFjv67XJXBhq3VOzX61?=
 =?iso-8859-1?Q?RJQeYwH7SwinJYsx4IhvbMa2w4X+7akGFkCl7cZhq87GT64S5lIWUp5MAU?=
 =?iso-8859-1?Q?qqFAy6g4STynUCyVihXGuVtL1rdlU96Uqqbimmpf1IsLmwk42hhZgB6epN?=
 =?iso-8859-1?Q?D181DE/wIMQAHPLD7O3voYmrt1nGE2ysZVyZwsgwX9aotbZv7WVfmE57HC?=
 =?iso-8859-1?Q?jPpAQozPWy6WrwcBoCUJK72a039BUBBM3VVp49Qk2qBdLYOjUZqqdA2Q/p?=
 =?iso-8859-1?Q?j5tACKp+ZI8tiQQ8n54oMNWNvcbdzbHSGbDgRZoMtqAiZA+7/oOeM/xKJy?=
 =?iso-8859-1?Q?egkjrG+46CrDbNT+H6rQuotUtIUC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/XMancJVWi7XBr73fIoQ7hWC4Q9lG2motvx8v+DSZSCJFWpNF4UeLfnQXh?=
 =?iso-8859-1?Q?XjCiuK6+TV8KDQk6H9a013QiRit6a0zvxd5n7fenuaa4lHm+rebez4y7Zr?=
 =?iso-8859-1?Q?WI8+tX+5vQxbQmBVjAB/nly7pd/2Lp6v4bqO5Pf/Tzc8w0kJHriMRGHO5w?=
 =?iso-8859-1?Q?mW6PiI1E42IMDmNRY+o187R25VZXZj99VpZPaPCJd+RAGeCZJgk4K6bKRJ?=
 =?iso-8859-1?Q?RXHGckuAnFHcNDBLGVi3M6+q+jZmLyvEBIpvquLaUaL2B45vbQLdkNKcxF?=
 =?iso-8859-1?Q?E31ZuB5EWtZlwEAYmz2hL5QBYY79DUkmzfc+ef+Et3wlD8xBH8FH/3mfF1?=
 =?iso-8859-1?Q?BAu9tz7ECvJCn7+p2n7SoBOUvEMQwW+BD72H2cTCtOpM7NbMecBlqMuZCY?=
 =?iso-8859-1?Q?koK0PtxpfG8QF4IRj775i4HfhjRQtwsEGsAYQc9fjH2Hr4GxSDmTVPUJQ6?=
 =?iso-8859-1?Q?xY/lSFgGXl9JL2VEz7O2kHGKeF82D+V+sOPXUBbx//qCyDL2XsgkonaP72?=
 =?iso-8859-1?Q?W+eTI7bK5g/kSFTNW6CuQk2gqatwYluQHQ02/RU2hMIO0Vhto5GqVMvGiT?=
 =?iso-8859-1?Q?DjKYJhYxuQH9/gO1D04Iaqt/wo12kFn2E7xc9hFWH7KOlcH5iKRzdRWqi2?=
 =?iso-8859-1?Q?mJ81fn5j8TNlBYwWr0xVl+vnPgNCqpcBsyiArXfSWGZSKSzz6P1T1qS5Vz?=
 =?iso-8859-1?Q?rluo1hMzXBAyshf2jw3YfQw2nlMTMO41OjsVs1SHS5ELz6rH9bnje91CWc?=
 =?iso-8859-1?Q?eShb60kdjHKfFiPhrUpzc2VxQCLZMlCrok35GqCFdkFI+YYBTKEHAfJcv6?=
 =?iso-8859-1?Q?WD5EMjT8bKRv69k6qY6INhUbNvg3ovDt/U15ERfHQfuWMLTxT4rV0IVDdZ?=
 =?iso-8859-1?Q?/zwj4uy+VzXfW3PkJrmuZYxlFitKFjuELVvHsyFfdGHBAtUZlAuP/uaOOH?=
 =?iso-8859-1?Q?TliECloXy9tloMgChbNfVimyJWSAqKp6t1T2UsjTIOteoQs9gYPqKvuGft?=
 =?iso-8859-1?Q?JjTA547py6GwJYV3x9IUQ5QazDrh6dInwjm253jcj4hFCYZJqVH267rj1W?=
 =?iso-8859-1?Q?5D4oxN2LhL9H2rWgOkKugQmmYxvwH1SMerrtRUOBMwOOEWx6hkEMRuvOUh?=
 =?iso-8859-1?Q?SsZTB4jETYopIilrppPVSyQfGI+uHcyKAL7H+2nFt1PiA5GHJb4104v69v?=
 =?iso-8859-1?Q?t1r0b673OC+xi62+LCy9EBiWAl/CHQjzU7UTNz2VAKGGQvkpn7djZLxe/U?=
 =?iso-8859-1?Q?ZfqHcawI1jZv/4Z2fd1k3MgRv3ATPnCgR4TO4w+u1umTciS9efXeXh6BEB?=
 =?iso-8859-1?Q?cN0rSPRxRUCec/R5e+tm3H6kKK6xLoP5O/jEYVU9f4lewNYSOdRmzXoOJM?=
 =?iso-8859-1?Q?y1bq6dz2xE8kKzWqmkeUPv/6MDmPw5wZAG3jTMzRNo8bWLeFI0/nwGp6uh?=
 =?iso-8859-1?Q?oE1dp34J62kr8spoUzQ79RXi9Kqeumm8AYBmgw4MDfdMnMU29hbzhEIka8?=
 =?iso-8859-1?Q?//LGPInFPoqg/MNEFJzereFQh/wkBLvhrOYVHcLyHXkElYemlOUCjoATB7?=
 =?iso-8859-1?Q?WWAZD9BFbUBWbbye9HLJg0j3+mXN85ozELZtb2k4H4kAlr+QTuf0TZJd4L?=
 =?iso-8859-1?Q?RxGQSSiStvNLaiuidrHhxiPQGCU+8AkGpyO2iCKDhg520r4e1k4henqg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6859d73f-ab3d-4b23-7a8e-08de1172c656
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 13:56:18.2920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SgvpKRPFgYSxA1MdLFY2bwvcNxploknWrinYKkSEv6bCKX2Bn1WV0MoYNMMsdYd5poEmP5g2xQCrHJHyDCLuLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7644

From: Edward Pickup <Edward.Pickup@arm.com>

This patch adds a Xen boot arguments that, if enabled, causes a call to
existing code to scan pci devices enumerated by the firmware.

This will be needed ahead of dom0less support for pci passthrough on
arm.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---

v1->v2:
* remove dead code
* don't return errors from pci_init, but report them

changes from previous series:
* remove is_pci_scan_enabled wrapper
* make pci_scan_enabled ro_after_init
* drop debug prints
* drop Edward's SOB
---
 docs/misc/xen-command-line.pandoc  |  7 +++++++
 xen/arch/arm/pci/pci-host-common.c |  1 +
 xen/arch/arm/pci/pci.c             | 30 ++++++++++++++++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 28a98321c7..3a59b2fce1 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2079,6 +2079,13 @@ This option can be specified more than once (up to 8=
 times at present).
=20
 Flag to enable or disable support for PCI passthrough
=20
+### pci-scan (arm)
+> `=3D <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable Xen PCI scan at boot.
+
 ### pcid (x86)
 > `=3D <boolean> | xpti=3D<bool>`
=20
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index 487c545f3a..d3481b05eb 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -284,6 +284,7 @@ pci_host_common_probe(struct dt_device_node *dev,
     }
=20
     pci_add_host_bridge(bridge);
+    pci_add_segment(bridge->segment);
=20
     return bridge;
=20
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index beb1f971fa..3ddee5cdbb 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -91,8 +91,14 @@ bool arch_pci_device_physdevop(void)
 bool __read_mostly pci_passthrough_enabled;
 boolean_param("pci-passthrough", pci_passthrough_enabled);
=20
+/* By default pci scan is disabled. */
+static __initdata bool pci_scan_enabled;
+boolean_param("pci-scan", pci_scan_enabled);
+
 static int __init pci_init(void)
 {
+    int ret;
+
     /*
      * Enable PCI passthrough when has been enabled explicitly
      * (pci-passthrough=3Don).
@@ -104,9 +110,29 @@ static int __init pci_init(void)
         panic("Could not initialize PCI segment 0\n");
=20
     if ( acpi_disabled )
-        return dt_pci_init();
+        ret =3D dt_pci_init();
     else
-        return acpi_pci_init();
+        ret =3D acpi_pci_init();
+
+    if ( ret < 0 )
+    {
+        printk(XENLOG_ERR "PCI: Failed to initialize PCI host bridges (rc=
=3D%d)\n", ret);
+        return 0;
+    }
+
+    if ( pci_scan_enabled )
+    {
+        ret =3D scan_pci_devices();
+
+        if ( ret < 0 )
+        {
+            printk(XENLOG_ERR "PCI: Failed to scan PCI devices (rc=3D%d)\n=
", ret);
+            return 0;
+        }
+
+    }
+
+    return 0;
 }
 __initcall(pci_init);
=20
--=20
2.34.1

