Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7C9BFC515
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 15:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148088.1480320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKQ-0008Ru-Bo; Wed, 22 Oct 2025 13:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148088.1480320; Wed, 22 Oct 2025 13:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKQ-0008OT-68; Wed, 22 Oct 2025 13:56:38 +0000
Received: by outflank-mailman (input) for mailman id 1148088;
 Wed, 22 Oct 2025 13:56:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0J7Y=47=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vBZKO-0007mO-Eo
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 13:56:36 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebd79559-af4e-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 15:56:34 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by AS8PR03MB7207.eurprd03.prod.outlook.com
 (2603:10a6:20b:2ed::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 13:56:21 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:56:21 +0000
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
X-Inumbo-ID: ebd79559-af4e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciYU5M6KkBIhG+vxgG7WcDNz1bQ0B/3sD1Xhud6N+hGivNQJ6oCr52Fg9iDTaYlAHjKLYwP6zjaUK4W2phCQfCPcbMhDOXWEo60TctltTAjqTZKf1VWUB6gL9KkfI9OSIWF3DFO6sa0dD1AZGr4tk23azpfkm6fwfhLg7dv3bR8SZvUlwbAUVhuOmVKcf/rBaL/hIeumEs5Gg2Eml0pfJ+A6ytCp3A1m3hTllKp03goJjx45xXww6PG6XQu+mSFa79rm25xi0d9Fg16NSMyrRXm3yoRYPDxU/mU6g0ePHW+lQix9xU+CvBYWWPM9cDwTMIR2MTIhlLLkEaLDHBxIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvD4SVXF109JRWeMXAWwZhDsbGriXI8hVFD3jk6rbOM=;
 b=csLP9NueJwqz8PB4lcqlZMhSymIwV9WalxBt8q7K5oKhODsEPz5MQeoueSIZowhv/9GkNz3FNnw1Q+1mCc6uppi3Oha7DFIf4tT+ce4c3bX9Xadv+OD9A8xgg9NSuqBOVUc6JIIqJ7j/VQcRdKLSlmymqEQ8efwz7D3WmIzt+YDr+RP0RkmgO+1R7xtJa9uitQyVK2AHI2/EckEUK/TwoXE3lgZag4jpHZKhykdZ8UzjMVD9qeVwCtFh9Fg8zFk/Gj1CnFFhd1Z2BUpPFO5RQMPEN7Z4sAFJRhd+fv58dLPUkIp/9FeJn/3elU+tdMs0U68jm7PyPnB0JD+o5E8img==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvD4SVXF109JRWeMXAWwZhDsbGriXI8hVFD3jk6rbOM=;
 b=ti/erpqJaOHdyNEWYQieGxHA/2WirVOzbgOqyflhzI2m4X64GSPM26m4N7dL8PyBcHiV9jSJswYuG6orVQ0twDuG6xUKmxwxmgNJK4Yf/8eGIS66v9g7UvwnnybTHuRqYrC8v8A0Hy8UHonQYNaTtPogUQcShhjnu7YzIH9ert9Sn1HLRoM0Q2HCCS7ClzZ9WQKBjaH9VCwjQEacqkEPHblUqXjBKH/ejblR8Fk+sjNq8GAynE3RkI2Bu+JYGWPq3bk//Unwwx17t2rO2I58ASjF0AKKFgnoH2/eCO7utAae0VdF6juCzAA6V+oQId3QlIxZYT09lYrr9Xbj3PE+IA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v2 6/7] xen/pci: assign discovered devices to hwdom
Thread-Topic: [PATCH v2 6/7] xen/pci: assign discovered devices to hwdom
Thread-Index: AQHcQ1ulK3woYnUqFUiLH6LfWB/DAA==
Date: Wed, 22 Oct 2025 13:56:21 +0000
Message-ID:
 <78c0e358bd15266b029b3b6d0d71b142ea7d84bb.1761134829.git.mykyta_poturai@epam.com>
References: <cover.1761134829.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1761134829.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|AS8PR03MB7207:EE_
x-ms-office365-filtering-correlation-id: f1762035-645d-4616-08fb-08de1172c83d
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?2BDm2rMJYCDolcQJeAoy3Dlb/5ovgHYZeFkg59hQtfdnkudrHI83+dnvpX?=
 =?iso-8859-1?Q?2OfHa3qYhw1N5GtCn7h6/+K8iRFEi5IPnnM8VD/c/i0ptC/3P8XkXgo71e?=
 =?iso-8859-1?Q?2+mrX44ubofoWPOfsetTanon34e0WKnSIu3uA1nhjPnAaa2VEnwKRMVUnZ?=
 =?iso-8859-1?Q?lmODMQ4vIYdbymf2zJ6JxhD5Vy+haJ8styiphoVWFp09NWq+aNvHuuWTL8?=
 =?iso-8859-1?Q?BqQZuT3AuyBY6V0+Dc9FMWWK9sqdJhImVi2a+q8UpA0XZx5Oqol/wH+kyS?=
 =?iso-8859-1?Q?wmEffNRuWFR2xSlTpaBlCzkRA/CqtUciK2/281b5qov9NiAOPf+cMj8/wN?=
 =?iso-8859-1?Q?TvJrVT6k5s92zRskcSQ9s1pUeoClfwJ23+mcK308RzsuHB8zYD/oeJjlZz?=
 =?iso-8859-1?Q?mY3PeLxasbvhRmnZuKA6tHrIuO+V2K1P8y5dtZKyWYo44rXNRXG62CDGyJ?=
 =?iso-8859-1?Q?u4tLgxq7NjItkZl08m6R8D8R8PYypLy7fRQZuscg0vKTUsWyML6Xv8KmZd?=
 =?iso-8859-1?Q?GTZSTXABV6r8me+P6RzefQuIVmD1Duf++jVGIH7qfJ0+0Klf5pRI+Cy+NV?=
 =?iso-8859-1?Q?lZikNt+91Q7tkzYPJORoAchoD8tODVe4Xkbo/9cW8VwSllCDksvLfctZCV?=
 =?iso-8859-1?Q?sbC28EtrLzbf6KPMvzIXE8+I5QzAlGc7lnh3a/Bje64NXh78oq0PiI15mm?=
 =?iso-8859-1?Q?U6wBUyOc3RViz7L07HcbVeFmjajsubk2Ycv6Da0tSHcKdlI1DEBxIAtgrQ?=
 =?iso-8859-1?Q?CymvAkVPWaBGO81gtQ2bZSrZvanwvgl60Sh/abYr5LW+2BRW6jFFE0ZuDa?=
 =?iso-8859-1?Q?6UsnI9r3jJpP2SmGNSqmQTi8PH+z09ZRYu0Tjy5vnIj/dNl5KRJRejdQLb?=
 =?iso-8859-1?Q?l3kA3lLhDaKUsMvyKRSo2ER3hdmU0nnWSiQd4g33ZMtLeBaWf8fBD1ihiE?=
 =?iso-8859-1?Q?vnCjN6K8JfPCOWLQOeJ2LWU8z0DP8Y20HB+BrhBXkgQsKabA2xKAWDYbwF?=
 =?iso-8859-1?Q?b1B6cocpvYWhc5TOQzdjDIvhcBSphnQm7ww2bJRosSWwEjs3Ih52eOzc+h?=
 =?iso-8859-1?Q?yXToZkc93roIjWytTpUX9F1XAJKCXMAuvbZ7aSN/VJGKVoYQKowat9cPGb?=
 =?iso-8859-1?Q?EZ0Mccu+Iryf2b4rpjJ7MsyqFevTl4WHrEGdviMEpUzCDAA6tfc4MtDwdJ?=
 =?iso-8859-1?Q?BvAN6CxhsDYRFblal11MXArKNV3zOV61PfUZXYZmHlz1TpVIXRNemRA+Bn?=
 =?iso-8859-1?Q?AEPFr6VVJMmvZfi3H8lNluaeiGxm/58C+3/n9se3Yb62Q90pe2ZtxhcVu+?=
 =?iso-8859-1?Q?IMi+GWniAxF3u6BGyH2xyyFi+M7q9EVNVlVfTzWZxy6EBsiVCoht9adlcB?=
 =?iso-8859-1?Q?MVUJQka4NDE7+WmyM3i7hGq8KLgADND9PInQjz0+Xi8cWLdsf/KTGCgQct?=
 =?iso-8859-1?Q?x3eGRxQtejndJ/Wxn3X1KYwfAfN94ELtbxlGdFf4xA6gbHqwRp63/HiylU?=
 =?iso-8859-1?Q?37gAbITwG1zal3YDIPbPTYxh2a+zo0mNeLKCgkSlN00u/hxDJ58P53s5KL?=
 =?iso-8859-1?Q?MXxcz9ELU7bPAUtj+grACPQ0AXs8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?l3cQHWlugOjquRp96jKGntfgMWki5Q6FFccVKTSS32CgdQSnJDjzLhMxu2?=
 =?iso-8859-1?Q?qdWk/6S0TzsiR4ChbFHVmSXgnB/Hb4G2GTjzjHnpQM7o6xUbwCCCF9FKbl?=
 =?iso-8859-1?Q?xeb/37sGO9qODahV9qvYlksAbXuHZpjYuI1CoQBqSxsMTyBqWR4KOBTFUM?=
 =?iso-8859-1?Q?KuXcG9Oal4O6zfjOGNcubPpAdQd1J6sczawyYi0uqc8e+pgjWkeuiPMDs+?=
 =?iso-8859-1?Q?O8wgtlxS9d22edFaNX2T/4cEY+Zrd5g6lcMPCnaSvF5KK4ToyDnP+tYcAE?=
 =?iso-8859-1?Q?VwEcgS65LDF5MW09qj7BDh/8RiLvVqWhX4WL4TNlyL9Y2KTRXg7T4EtqSV?=
 =?iso-8859-1?Q?eHl2Is8z3SJpATuMHkm+N5DqO1Do5hWh6fl6AlQali3/LWOdIjHy+a3t0u?=
 =?iso-8859-1?Q?s8yYVKRrW15coXvvmI8dJJ3Aph6sLX3qbzmKhoyrGMXxLOyv8M6bf5hYcz?=
 =?iso-8859-1?Q?OTZNay9oBIWMv+z4HDvtomWqWYT9NJwieMfoUcMV6HSqWSu/ca5+yeOmEe?=
 =?iso-8859-1?Q?i/xXX35ULh3vQOiZgVNjfISBr7bEb7lxqACfZvhUWVc3slTiJpvbm8pYJt?=
 =?iso-8859-1?Q?gHyeCAx7DfeGuh6nv6oNMA9xIBEwWWzRHThVlyD1rQE0ZqWBuSkSBiNM0M?=
 =?iso-8859-1?Q?tXf1XjjGmXzu/mCg8XIxvsKx4dF4VaFCGokVnFOpuhIMVE74hlnY3U4D30?=
 =?iso-8859-1?Q?AsREHGtSHCcZXI+bDRgs3Tw74Ml9714Gld6zv3ik2pxC2ADr/bDUolXQjZ?=
 =?iso-8859-1?Q?HB0hDGn7WE2M5r6AzA2+xwa2NUekcV1LAMtBPRlDvV8M5pNEQVQn6fcDMb?=
 =?iso-8859-1?Q?CfMjMaoOJ+uYlOLL+0R/Ug7d3ivHXD9CKEx08q9C054tbUqfXBXpsDVeoQ?=
 =?iso-8859-1?Q?P3YW/jwGPRJe6R7gonxreM7qNduwZfyXg0xPmbyfek9SGCbpL9xNqw3IUh?=
 =?iso-8859-1?Q?eQP72IZmcgtXx/eUoVuG31K5sGwnIfgNz+efA21uPR1UEAFSIpcK9RKKbm?=
 =?iso-8859-1?Q?ipdNm625+S3dXtfiDuvv0A6EHkZtL+smiPdgAiq5qGrWUyY/jx9Qrj0+TE?=
 =?iso-8859-1?Q?Zsc4FWC/PchxMRZXrWDXPwDN/lNObTwLcvuAcHMpfbJfOSiJWZqOVvmAxn?=
 =?iso-8859-1?Q?+2AIo4PTrgUzJgOaa79MSOvgLz83ggrOBmq1NEnGZ1uI6EpyeM8T8zP+7J?=
 =?iso-8859-1?Q?KhnbWgc9yFLfGnh59mUoEHoyPt2B/kFcr1iFvmXN3L5YqAdStlNKjEmVNE?=
 =?iso-8859-1?Q?0aRKW+LmPijeQf8eKx0/GcYpWUixkRpW498men8UcMcUPNhZkD2X6KccIB?=
 =?iso-8859-1?Q?H486i0kA3WEc8CzrwshwvsOJkcJ4RizI+7ClZ3/uwRyOnFRvnth6YII4zi?=
 =?iso-8859-1?Q?I+vO2EEDU3hXFfSQMlC0djeV+jmI703GUtqJgJeR2lQXC1M7Irl/yD1fcl?=
 =?iso-8859-1?Q?jZMLlauhC3aO9mj43mMjkMqe6CsEH4ofnfy6QQwPVzsKg0t8oU5D0Z/VDw?=
 =?iso-8859-1?Q?oNtIf4YO4iLOZh4cjkeGQRtP1h+PFdiWxLo7OelcNDwkDsN0rT2VOwvUg/?=
 =?iso-8859-1?Q?Wb6B0LG6vmlnyCpozvDX/sqxPk1Yrzgka4X0plzlmuZCdFTuD1iJfWC9Kp?=
 =?iso-8859-1?Q?0f7bb4EgEoZR57FRDkcbjURNhteOHr3vSfOrzbla89F3csuxoFV/xk/A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1762035-645d-4616-08fb-08de1172c83d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 13:56:21.1372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gD9noOSLDGb06gUhIWfb4i4iVbEi/IdEgI9srRvf+31nIRy7Fym+JbtsMmHzE4iKo2DMB9uSIpu7Uq1l3tH1og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7207

From: Luca Fancellu <luca.fancellu@arm.com>

Hook up existing PCI setup routines for hwdom into Arm iommu
initialization sequence, only assign endpoint devices.

During scanned PCI device assignment, also permit access to the BAR
ranges if hwdom is using vpci and hide host bridges from domains that
use the fully emulated one.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* add host bridge hiding
* fix build without CONFIG_HAS_PCI
---
 xen/drivers/passthrough/arm/iommu.c | 13 +++++++++
 xen/drivers/passthrough/pci.c       | 41 ++++++++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/=
arm/iommu.c
index 100545e23f..340659853d 100644
--- a/xen/drivers/passthrough/arm/iommu.c
+++ b/xen/drivers/passthrough/arm/iommu.c
@@ -19,6 +19,7 @@
 #include <xen/device_tree.h>
 #include <xen/iommu.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
=20
 #include <asm/device.h>
=20
@@ -133,6 +134,14 @@ void arch_iommu_domain_destroy(struct domain *d)
 {
 }
=20
+#ifdef CONFIG_HAS_PCI
+static int iommu_add_hwdom_pci_device(u8 devfn, struct pci_dev *pdev)
+{
+    const struct domain_iommu *hd =3D dom_iommu(hardware_domain);
+    return iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev=
));
+}
+#endif
+
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
     /* Set to false options not supported on ARM. */
@@ -142,6 +151,10 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain =
*d)
     if ( iommu_hwdom_reserved =3D=3D 1 )
         printk(XENLOG_WARNING "map-reserved dom0-iommu option is not suppo=
rted on ARM\n");
     iommu_hwdom_reserved =3D 0;
+
+#ifdef CONFIG_HAS_PCI
+    setup_hwdom_pci_devices(d, iommu_add_hwdom_pci_device);
+#endif
 }
=20
 /*
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 4f5de9a542..076739031b 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -20,6 +20,7 @@
 #include <xen/pci_ids.h>
 #include <xen/list.h>
 #include <xen/prefetch.h>
+#include <xen/iocap.h>
 #include <xen/iommu.h>
 #include <xen/irq.h>
 #include <xen/param.h>
@@ -1040,6 +1041,12 @@ enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn)
     return pos ? DEV_TYPE_PCIe_ENDPOINT : DEV_TYPE_PCI;
 }
=20
+static bool pdev_is_endpoint(struct pci_dev *pdev)
+{
+    enum pdev_type type =3D pdev_type(pdev->seg, pdev->bus, pdev->devfn);
+    return type =3D=3D DEV_TYPE_PCIe_ENDPOINT || type =3D=3D DEV_TYPE_PCI;
+}
+
 /*
  * find the upstream PCIe-to-PCI/PCIX bridge or PCI legacy bridge
  * return 0: the device is integrated PCI device or PCIe
@@ -1255,7 +1262,7 @@ static void __hwdom_init setup_one_hwdom_device(const=
 struct setup_hwdom *ctxt,
                                                 struct pci_dev *pdev)
 {
     u8 devfn =3D pdev->devfn;
-    int err;
+    int err, i, rc;
=20
     do {
         err =3D ctxt->handler(devfn, pdev);
@@ -1276,6 +1283,34 @@ static void __hwdom_init setup_one_hwdom_device(cons=
t struct setup_hwdom *ctxt,
     if ( err )
         printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
                ctxt->d->domain_id, err);
+
+    if ( !has_vpci_bridge(hardware_domain) )
+        return;
+
+    for ( i =3D 0; i < PCI_HEADER_NORMAL_NR_BARS; i +=3D rc )
+    {
+        uint64_t addr, size;
+        uint8_t reg =3D PCI_BASE_ADDRESS_0 + i * 4;
+
+        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE)
+             =3D=3D PCI_BASE_ADDRESS_SPACE_IO )
+        {
+            rc =3D 1;
+            continue;
+        }
+
+        rc =3D pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
+                              (i =3D=3D PCI_HEADER_NORMAL_NR_BARS - 1)
+                                  ? PCI_BAR_LAST : 0);
+
+        if ( !size )
+            continue;
+
+        err =3D iomem_permit_access(hardware_domain, paddr_to_pfn(addr),
+                             paddr_to_pfn(PAGE_ALIGN(addr + size - 1)));
+        if ( err )
+            break;
+    }
 }
=20
 static int __hwdom_init cf_check _setup_hwdom_pci_devices(
@@ -1294,6 +1329,10 @@ static int __hwdom_init cf_check _setup_hwdom_pci_de=
vices(
             if ( !pdev )
                 continue;
=20
+            /* Hide real bridges from HWdom when it's using the emulated o=
ne */
+            if ( has_vpci_bridge(hardware_domain) && !pdev_is_endpoint(pde=
v) )
+                pci_hide_device(pdev->seg, pdev->bus, pdev->devfn);
+
             if ( !pdev->domain )
             {
                 pdev->domain =3D ctxt->d;
--=20
2.34.1

