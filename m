Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1628B16EDA
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065259.1430711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoI-0003L6-Uz; Thu, 31 Jul 2025 09:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065259.1430711; Thu, 31 Jul 2025 09:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoI-0003FI-Mq; Thu, 31 Jul 2025 09:42:50 +0000
Received: by outflank-mailman (input) for mailman id 1065259;
 Thu, 31 Jul 2025 09:42:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXc8=2M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhPoG-00025Y-GR
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:42:48 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5dc697a-6df2-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:42:45 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU5PR03MB10524.eurprd03.prod.outlook.com (2603:10a6:10:526::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Thu, 31 Jul
 2025 09:42:39 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 09:42:39 +0000
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
X-Inumbo-ID: b5dc697a-6df2-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOkkjvH8/54x8k/W+Iit357pwT2iQo3TTLNdvxKmJZsvEl906wCsoD6Pm9s4HK3iWZhfAF/MSgD1HP8aWMunPOcj5FFimJwqLP2K4aZ3ovuYK8TKmCQmREi6mY92i1US03X1rE6OQBePUN5dbqWQfZD5meN+8e5eYeRiCNOXzVbQJeAPv0956Hm1fO5ouYY/NNA7D7SNn4PRhgUyorecggdYo1knW9Kqv3pGiTRKLTmNA18GIKzlmlYaCqPMRwXl0IMKLPvzFbraa4AgMVr5KaNXX5L+A/R2F2gsUKDxdxSkAwJIkXJOrXwxRaaXRNIZ/GBB6u8dMGCm1WuJDMbCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2duM0JPOLQ5odxgjgBE2ib9pZ3inljj8ieFqvLWZu2c=;
 b=gN39UzAC716MWn2+R80sKjk7ftz2fZca/GAYK53NZtBAaUOu1K2vYy2FlwPTdo7u3utXlqwlxxqJfEAs35FWnSh1i5OxucXwPcTOnf94nW5n0cJJTGkJ1J/HFPU8p5ZgDrpB+2UZ10Ik9pGI3uUd5PI5v6x0xd8kk+uSpYdtTN46SeFSV8IRwWfOOO3swBuk0CVE08/dQ2Fh09bVqApoAar9gzrMIAnM8zcNA6Lkqims2fz3XJ1SfWDDFbwr7rQnerxAl6yZQxtnkuUOsTzX2ryDOBlOEiK4J7F55l3efrZQsmSibACH45cgxUbDlrfc+KfhlwhmUO1RAnDdfaNDLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2duM0JPOLQ5odxgjgBE2ib9pZ3inljj8ieFqvLWZu2c=;
 b=fLBEjExq/O2IjS18uz84Zi2WJDja9SJUvPPu/cSMj4BA1hCKdIPRhwYRmyVIgGZnkOHk5EDY6CSK1JA1Iic7jSM0rxyq1HQr3JFX/xVA79K8uWev5juC2hTCOL8cOt72vaMNqWv+jNJq25KYSkvMNWKtn2EPKt/yBwJmoRlf37ZDRT2VIg4hBc+nahQd5N8FHtSoyIB0TOOpldd2cL24zqVXh3NmSCm8RPwnE7lK+Q8CIr8zvKJrMtgXEQ9muAdC5TW+BxhDDEUe3Solym4mWU1yNas56laOSP2ZcHih2pC/Nxr32pdQ1aHJuca2LFDNaHinyszocZb9mG1xAORPGg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH 5/7] dom0less: Parse memory properties in the common
 bindings
Thread-Topic: [XEN][PATCH 5/7] dom0less: Parse memory properties in the common
 bindings
Thread-Index: AQHcAf9z2k2HeEdIvEqSKDGjQ7hw8g==
Date: Thu, 31 Jul 2025 09:42:38 +0000
Message-ID: <20250731094234.996684-6-grygorii_strashko@epam.com>
References: <20250731094234.996684-1-grygorii_strashko@epam.com>
In-Reply-To: <20250731094234.996684-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU5PR03MB10524:EE_
x-ms-office365-filtering-correlation-id: 9647e8e0-f02f-4325-8e27-08ddd01696ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?a+9CN1Wa1EdjKlFNz5gfOpXAjllf8X7eWdioUZBOSkabDRVgzjEPf67JEM?=
 =?iso-8859-1?Q?0hVWdFNH2Ycv5QwQoX0TNzu39IaKMS6X0oKPoIU9tJRWwcvjBt31ePRq5Z?=
 =?iso-8859-1?Q?H0/m6Q1vsxlbR3f2HE/15fCQFexBaSGclJmJp19NWNpUkuam8KbVxUJ5pk?=
 =?iso-8859-1?Q?BHptjq204UERZQHnxQNADihW7X8RU2xdxBxOP9F2PQcLsRJUBdHVMzBxnt?=
 =?iso-8859-1?Q?20G8c8lO9dppg48Iw8qFdMZAZMPVdquhgqcLPVVn5AXb8RX/jghhkbzpCA?=
 =?iso-8859-1?Q?HI+2Eo9hnx1+M5UEcrcXX7rngLCSA5vgZv7Rof79jZIgiRqPrUrPYApene?=
 =?iso-8859-1?Q?ZVQ1MwFNGrlvdvRuT8Fz5KTTxMf5X1pXlQCcIUunK3sjz9E/gCj6Isi5tx?=
 =?iso-8859-1?Q?BUGEajMzGMP5n+ZLaYcQRwJsv82x8dYXfVgxB0C8HHaRZpUDfEyI/77saU?=
 =?iso-8859-1?Q?GmBd3aSTYfc4kuSh3TyE4VTfjvufcB+4B/ZbFFqmlo9wo7HjrmXCSy38bA?=
 =?iso-8859-1?Q?OXu2bCy42D5DCkurW9tJWtymqmeFzNobCyJtGK6i36zdyN4r4WHX42NDQt?=
 =?iso-8859-1?Q?2AKu2g7SDrS+5pHGQbRK5k1mtoh9EqRw5RKQBjpIYOZ8A/ycHZMx/KSPgH?=
 =?iso-8859-1?Q?V9foZE6IJJZBzRB3X4j99e1eNBcNyrHZzXXa9XZ9U9260awoASsokSqVPt?=
 =?iso-8859-1?Q?AmPlqK1Md+isqLcYwZP5oBLiBQRirywH5W5xjSSv3+LcIGpufsAnOPOwCy?=
 =?iso-8859-1?Q?7blnTnQ4SONcsh250XhdJQ+I8hql2G9y0KSLcUi8kZfSl58RkBVWEm+7TU?=
 =?iso-8859-1?Q?fk53/I/gP50dd4FarvXbC1cCXDrEFHMCqTbZlbuMKnmXPalBNNtpwfhHvy?=
 =?iso-8859-1?Q?YjTqV3CzZvj4tzNa7pJu3xoQWmWXDa41uF7Dm93+ZBAZdR4CIxdKgGNMhV?=
 =?iso-8859-1?Q?zPN0g2c+HUQIsglObsevWi/7Bq6tI9qken89M/pW7HI0vW2N+ergJy/pl0?=
 =?iso-8859-1?Q?8W+Gptr/YNzW+1qCojOZTQaSg+JC2ZuqgizqIt23mHYEUWD9vCRpHBVeG5?=
 =?iso-8859-1?Q?X+YYDDj37fry86AYvnMtvTJtsmDEh+m04YPQl/fLCETMcqWjxzFeSRYF47?=
 =?iso-8859-1?Q?1eMfLg81STr5TnSQ05a3jOMKcmk6rmWntt+3M31KDqpp6qLM/OT3Lxcl9Z?=
 =?iso-8859-1?Q?pAv7jYRzxeyZLNq7D42xqKRRjs9Tuj6XPNSHPAzQshd/EaRKZ08iviwhBu?=
 =?iso-8859-1?Q?IIVFOTBadx490Z0S1AzvS0eqjWNk1+fPYQx2m3a+L+MB8BJSh2bX/dC/aV?=
 =?iso-8859-1?Q?opmYYW7NMnF33H8ysyeN8pfcYfgn1lkDjcFLDqEDKLtVWjHETtTxPyAxp6?=
 =?iso-8859-1?Q?sHL9Lo5cqdldQ0rreNvuEqWG52WIu8Lqr0JZbaOx9Q3obtHAb0WiwYAV6b?=
 =?iso-8859-1?Q?LBNQX7j9WjM8qOh8tESBINL0ActevJe4mIXNWBgrBTojYMsio9IeA8OGMd?=
 =?iso-8859-1?Q?9FMBu5BofPEhWlMvOMzW5dERNBsZ3GA7eNLg6lNi2KyA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IO1/l5UDQ/P8LYDZggAmSIWuLs3sQZo9RgCh+PwLtU0a8p9/Eq2UGPFTDC?=
 =?iso-8859-1?Q?vCYuWdifo2tiWWyuL/YOKCerfl88Ixqa9r3S+xFtgf7MSteyleSYHnZKdC?=
 =?iso-8859-1?Q?0eYi8RyPBS/aA247Or5yBg3EqJrBsx+8B2nbrDpWcjT5wMSTuJiyMZgphT?=
 =?iso-8859-1?Q?jNa/MAdz4dGWpvsC/PTEKqv2bRtA2DbA+Qb87HGTrsgPmO9ASIjIb1U5/l?=
 =?iso-8859-1?Q?7d6Y2Hs3mSZJqzSNhBIYj7vVxLjT+QeIwmDy3Ja1p/BQXPbXwNSuN/IP9A?=
 =?iso-8859-1?Q?Qx9SkM29BkchPL8OOWZdndgJJQnwa6KvqV7J8t6JJZIckXYVv1bI8dAW0Z?=
 =?iso-8859-1?Q?gKshbJJo7R3jRdndo49YvsRREV7P+B06JngarBaMoyo+rA1XN/Wgvk/QI2?=
 =?iso-8859-1?Q?JxWVYoaV5T9AEZE75C1XyQw2N8UcgcoEveZxsKGHS6wLpCZLbQjxlKQXfW?=
 =?iso-8859-1?Q?4oNTAq+UuRga23wJl6qpzx9V/Y5DPR5QgIUJEvr6SHwcWf7peYUEvsr2g9?=
 =?iso-8859-1?Q?Q4qC18U4kYCNDvsF3j4TWqwR6espbAcw0ZlmBAqpisZYVcTrypZZBUXWj7?=
 =?iso-8859-1?Q?xONxwIJ/gSorz4rfABJOw3FJ346BxQQJKaXQqRof0DqGsjXnTspvLvYYd6?=
 =?iso-8859-1?Q?qTnshxj9Hhs4g/rSMi7CC24BftmyfBjRHzt/Ebb86MtpZJ789VqL45usKH?=
 =?iso-8859-1?Q?2+5eTQHHfC/SgIGn3JK5f+YKnFSUn35ncUSzthWFz01liTNJmhGiLy+vmV?=
 =?iso-8859-1?Q?3Ys4MDRBgXwAT57XWwCHDNuUYUAN22THTQHG6jooaoHw6XL5Ax0ZSH8LKQ?=
 =?iso-8859-1?Q?k9CZcy7dQ3jPNrUI0YHPYpUb9VBwvPg6R0M23yOXEm1n4+1bz0xjgOUxNz?=
 =?iso-8859-1?Q?5rejk1X1YLQZFwyF22VaWa4QT5jXemLa25cOIYGmDXwgcmvFu44DyIcCQm?=
 =?iso-8859-1?Q?uDqozkOzNUuexFV+GLFSk2KBbM1dnUZdIGC31UKSY/Gkn0jNZwTzC7ouMO?=
 =?iso-8859-1?Q?z2iTmw8G8cU6nw4PFmfsY9TUoHfXLj7pBlgPIV0gRmE54ZhPdU/h2LuYY7?=
 =?iso-8859-1?Q?Fq+/an+BdoaOzDrVsuDFPfqCgKJFZTl53TbwPpZxKxFzxz6JpiKh1+jL4W?=
 =?iso-8859-1?Q?Uq4q+itz13qWeX80uXdgcDcWwD4IGbYTWZZ+z8YH+73BSyBvlCgoq+hiTe?=
 =?iso-8859-1?Q?zBZzbsZpbL21pMyiGaWwef4DHs2D1P43h6kzK2ez997NR/qlXjMF9u1/YB?=
 =?iso-8859-1?Q?E+F9udWCSlUR+0oerJfgkb5oPA+f4WrZdV12fPAv1tF4G5hyi12cZf1Kyf?=
 =?iso-8859-1?Q?x9eVRmZITygpIwG7fWLgMys0xrac0HkC7O7TFLeqhGQogcuGHPjuyZhQnq?=
 =?iso-8859-1?Q?UVfql891wAmJpO5jiU5thR1yhPDeK6pCmm6AtbKWNy4MzFgUUvhcyzlBSI?=
 =?iso-8859-1?Q?2TlMX7xIqnNGGoSXNiuoaUER1qOnnwclGBza+zhDLKsvwzXNpBDhTpXIMe?=
 =?iso-8859-1?Q?r6LhRk9g20OWp0RiYkAW9ebSrCoY9V32S7ms9FM1umHZTl3zo7DqClOjKB?=
 =?iso-8859-1?Q?fFmep/sSdIGmECCRrPcmmQyx2Vv24k9QSxQi3PTN5/XnLctYCAPdD4rb0q?=
 =?iso-8859-1?Q?/ZQC3FXH1MmjhI32ktFSgxLCMa+UBbYk0mzntyCbdOo0eI10+SekKwcQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9647e8e0-f02f-4325-8e27-08ddd01696ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 09:42:38.7913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hM72Ahvc2bHPTH44eDKVPL2p1n9DIkv7R+O3ABZ52hJE5gElKr2yt+Mniazjf90wiiFDd17xCaz8CYoj4UqOrMlHWx1ctd4AmqqLLHxGnp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10524

From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Move the "memory" binding from dom0less-build to dom0less-bindings.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/common/device-tree/dom0less-bindings.c | 3 +++
 xen/common/device-tree/dom0less-build.c    | 8 +-------
 xen/include/xen/bootfdt.h                  | 2 ++
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/xen/common/device-tree/dom0less-bindings.c b/xen/common/device=
-tree/dom0less-bindings.c
index 41d72d0d580a..4513f03e367b 100644
--- a/xen/common/device-tree/dom0less-bindings.c
+++ b/xen/common/device-tree/dom0less-bindings.c
@@ -141,5 +141,8 @@ int __init parse_dom0less_node(struct dt_device_node *n=
ode,
         panic("'llc-colors' found, but LLC coloring is disabled\n");
 #endif
=20
+    if ( !dt_property_read_u64(node, "memory", &bd->memory) )
+        panic("missing memory binding for %s.\n", dt_node_name(node));
+
     return arch_parse_dom0less_node(node, bd);
 }
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 6bb038111de9..8906e35e6978 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -738,14 +738,8 @@ static int __init construct_domU(struct kernel_info *k=
info,
     struct domain *d =3D kinfo->bd.d;
     const char *dom0less_enhanced;
     int rc;
-    u64 mem;
+    uint64_t mem =3D kinfo->bd.memory;
=20
-    rc =3D dt_property_read_u64(node, "memory", &mem);
-    if ( !rc )
-    {
-        printk("Error building DomU: cannot read \"memory\" property\n");
-        return -EINVAL;
-    }
     kinfo->unassigned_mem =3D (paddr_t)mem * SZ_1K;
=20
     rc =3D domain_p2m_set_allocation(d, mem, node);
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 0e82ccea2f84..0b73ed835000 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -121,6 +121,8 @@ struct boot_domain {
     struct boot_module *initrd;
=20
     const char *cmdline;
+    /* Memory the domain is expected to have attached after creation */
+    uint64_t memory;
=20
     /* Input arguments to create_domain() */
     struct xen_domctl_createdomain create_cfg;
--=20
2.34.1

