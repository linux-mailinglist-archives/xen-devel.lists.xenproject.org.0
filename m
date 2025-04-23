Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64B2A98823
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964356.1355198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Xxf-0002hI-B2; Wed, 23 Apr 2025 11:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964356.1355198; Wed, 23 Apr 2025 11:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Xxf-0002gF-5s; Wed, 23 Apr 2025 11:08:15 +0000
Received: by outflank-mailman (input) for mailman id 964356;
 Wed, 23 Apr 2025 11:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hoPD=XJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u7Xxc-0001zZ-VV
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:08:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2612::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e5e49bc-2033-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 13:08:11 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBAPR03MB6677.eurprd03.prod.outlook.com
 (2603:10a6:10:197::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 11:08:07 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 11:08:07 +0000
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
X-Inumbo-ID: 3e5e49bc-2033-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCG2hXlUa94PO1q0BfZQ2ksvViQZBy6p3BAN/qmGx2z2i1HSWM+ymumjWBc7WTg3I0x53sFfCrgAWyslck18Ebblp6+Cw6ZQs9ZX/JZcbuu2ecA34Rd1Ztm8fVnkL4POhowpZ3fbuaad4l+yTJ6vydjJZdnznRe/zVKm+f0cXrYsFf05hFrWDX9ZJUXRRniWVvF3gz6vnLPWOThmip7LXiRgM0O3nZd8COTklNtIQXi6aOqPgqV6cBXwZM+SkkpWBWLuoYkW4eG7RYPaWP7I/TAWVGTHnj8YeNIWAvPdzUKGHiHrJuZkLTHdJHt2srKBELIYMTuJCRec4UBi2MKznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTLGLd9o7gZNxUWN6Ny0WrPPGFxlWqxyuOhACd8eCRk=;
 b=IWaKqygSc0LApq9Uuyf9aYZfC864gjxntfCL9cqgdo8troDAvJOWDtjMGARa/rvv5Ib5gc+gPon27Q/KxC2v2uEtBPUfzMR/56GNmd4iivh31BfPzgEqrQ7B1rZbtKn/OYDHpuTxpHFp8XKHiIm5P7Y8RxybwHI7i0yhZBk3FWE2bwzEdNjNiUWMlttP9Qhl7fcsFy4jYoDpYqql08jfp4AgzyOIZpDTGpCLZeOkdnJ/1pHwoXYVHdocU+Rm2/xaTgRp9zHewKwg33tBZzctL0SkvV9beLpHaMuTO5NmCP8Y+iOA8QSHw2Wq2CGjGYRwL9uuKbndUe+NPJotptUo6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTLGLd9o7gZNxUWN6Ny0WrPPGFxlWqxyuOhACd8eCRk=;
 b=lP2+3LMTzPAQbD8kFepb0F/J+jRHRW1QYjCHrmLP11CmgL2/q7wMVtiEbJzV3PdFWlNa2X7pRAW5itc7GZvm/s86fqaJLiFrCS8Bcpr/sNEJPcW1GrSzBeKJJoEe+VJI0SKDsOJ3MIgtOMGTmo5xR9Bbk4ucE0o+PrtNIzcHwsBKgnm3HfYyspAqSzPgRT8b3l77kTd4SlsGNWHxJL1xS32Rmo7fO9WYt1b+JT2vvmRSMhKY9k7Yn5E860u/e2XVgBQ3HCbpTi3rVW+RWBYUPyYzRGNJC2ipoA5sLjK9g4yeZTeVqQ+nmngoj1KZeff8ziVoVfCo3cTgohpqLtkQSA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v4 2/4] xen/arm: make pci_host_common_probe return the bridge
Thread-Topic: [PATCH v4 2/4] xen/arm: make pci_host_common_probe return the
 bridge
Thread-Index: AQHbtD/9bY1r1kpO5kCnx2GColGe6g==
Date: Wed, 23 Apr 2025 11:08:07 +0000
Message-ID:
 <8bacbb27806c04eb68ac4d5582b42961d61435e5.1745402473.git.mykyta_poturai@epam.com>
References: <cover.1745402473.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1745402473.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBAPR03MB6677:EE_
x-ms-office365-filtering-correlation-id: af72f70a-c0fb-4b5b-fefe-08dd82572081
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?uTZnFPBKNVRo6ubOX5nE9oQeCbtr7LbwH0GhWUbiO6956/vh0eJ6nL2h0i?=
 =?iso-8859-1?Q?BF3KC9Zp2ZMKa8EeYJv8gVteuptyjzAb9eciOUqblQFgov76rgawJi1jGE?=
 =?iso-8859-1?Q?bAXsuZkwqrxU9DoIc+48eNWLeHIYBUcpZFVFu8tmWHd4OG2S21wiYL3Hrf?=
 =?iso-8859-1?Q?IhU0RRudkAoASvaXX/IgZCL7Y+uI92BNohH1JqqOowMGfbodD1yq7eL31e?=
 =?iso-8859-1?Q?Q+MSQ2ZkQjBF7fYYYffVAsBz1DVsXUGM4ubnFUGGSK/ICha+mT5LNDBiQ+?=
 =?iso-8859-1?Q?jxK0HJqdyj3eMVM8xDl4469Nkwzp9x0e+K826DfUUkZsMY0SWsin1wLVr7?=
 =?iso-8859-1?Q?XRJpMbiVXlAdEPF4Petk4ruu/ahrumA2bFWKO3DvCGwI3awe/ZC+xsqHsS?=
 =?iso-8859-1?Q?lt5mpWB3ZuNce1bXyTm5Y5BZ25bJzBFMh3KYSpLshMgG06MCd/jDm6OrhP?=
 =?iso-8859-1?Q?MWvKLb9C6KyrMjYvQzRy30QNJnJiOctLzuJVhx+3NY/2DayI6baMXjwHmx?=
 =?iso-8859-1?Q?VaQhH0q1rxfaC7zXRkAWMe0QjEeXeie29BmJyKPZ9aHRr0uAyAne3dmtJX?=
 =?iso-8859-1?Q?FDMFDmRLtdnaveoWJexYQ7cEhLiFRThov1r1XbUR+Yz8VFMwOLluPoIajX?=
 =?iso-8859-1?Q?qZodX+XzYG4pMsfg8pYf5eCx2FmEEtNqK8fPx1Ssp6yO5rR3/r+BI/zjus?=
 =?iso-8859-1?Q?hOhPIfjLdTLjjoZ7qVA5Ndqe6u3InEjo4ZmKzDH+1uJumf/PIQ137jMBvz?=
 =?iso-8859-1?Q?S1WOb4Ti2Eu1BdUPCv3U2OgM1XgCpUY+W6yhJtuRwqW9TH2IbuMPagzFAy?=
 =?iso-8859-1?Q?UDGjZZOoe2YL74qkDO51TChc89ZxUlI4UsqFmQlrb8soni96pxcz9JAsqm?=
 =?iso-8859-1?Q?hlbzUwGizEF9QHP+b7F0sTVuf4N+HgMK8hhMmU2oeA6uKIemKDRQD1Yyv9?=
 =?iso-8859-1?Q?4RzMTcAHlqwH/BqBKQfoJxL4oHhoQ/GTtkXT+LnA/Q4aoyrpPEYQx8QsMg?=
 =?iso-8859-1?Q?WfLorDaQSaiXs8qnLtN8WulCR0Nr9z2l4ok6k87ek0I6WwH/LHvKAUgLB5?=
 =?iso-8859-1?Q?RVE7I8lbuqw7j1IVpwviUu6J6LPmUYctAm6ZlTJ83tY4BjRXVYinzkIHNP?=
 =?iso-8859-1?Q?LKBUrqIsDfaRJK4wP0RdQhG7+s186FSEmKH9mbpCqmLbnMrZfecObaWP7U?=
 =?iso-8859-1?Q?t0V6OyORx9NrLkC/yNtOx12Y7lEDbS+uM0JHMFkbPDG20ryt6IwMqlO+HO?=
 =?iso-8859-1?Q?GmRI/57MsMVgmepYwa8DuxBE+EW3zUNFiX81aNgjFwK9tXzHQJsSOWE4NN?=
 =?iso-8859-1?Q?SHwgEnRPWLvXsl4kbe9djm5BANrgxS3oeN/p0M58EC8JjQQRNFPx/fwdY1?=
 =?iso-8859-1?Q?MI4aQxkn6Ifku4nn7eLHv5DcGeJEw1gf3oOjQb4oHWHKl2QLSkHfnVn1dN?=
 =?iso-8859-1?Q?wKfsixpLVGMsUDtRpOMPa/hoRYAbpRcPOzZwkehcsYLP9MaB6cyY2TzX5h?=
 =?iso-8859-1?Q?2EZpCdwkCfN9xYiMPkiToG6qowdn2Ui/t+RIrnmZ4cdQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JXhCd+GSW8mnpSt7m9rt5sBJ1D/Uo0Y7zYSn3WRSgHOqtHMu/zThWTU/1Q?=
 =?iso-8859-1?Q?eJe9/U7i7NqV289Y79ye738n6BN0keY2Pzf7Q7gxPcXBWsOW2Wr4FOAu1q?=
 =?iso-8859-1?Q?HQ6lJRljQ5YoPBYlL6rtNyvjKnkPjgEItJaTo5/rwqIb6zthVxBCuRq63j?=
 =?iso-8859-1?Q?37O8oUt8iriSGb/+K5KT/GDZMAuOXDU0T8midKnXzMpUo64CQvEblLsB7V?=
 =?iso-8859-1?Q?OZwztV4tkhdGNqvc7izchLUAr9VQzIriRgA9rm1TzjYvWBG008dNp+tQSz?=
 =?iso-8859-1?Q?BxNUrsZBm/Y8lzdO3q+ITjeDkNxLoZI+J6dBIKT10IKdcjNf1ho9z8IuWe?=
 =?iso-8859-1?Q?M8f+/I7PP2h6rebXtIcF/I5J2xBWlr9411UF5yvh5hiL/Jkzdh6h9otCLi?=
 =?iso-8859-1?Q?SnyxtRJp7Aw0X9TYDB4tW+UgcRonLjHc2x+gF65Z6p4l3FAWQXDlTRjdrF?=
 =?iso-8859-1?Q?CWbffIpJrKV4EU0oAgaVjgFj25cLdLcOWOFNSMtUOfOcYDlzsgqb9f7USX?=
 =?iso-8859-1?Q?Dq/lEDoRdWJ0X0GR7ladNlSM6oClQmgeS9qe2k3erKEBuI5HbnhqP/Vf9S?=
 =?iso-8859-1?Q?9FXFDTGW6t5OqXxUo/LUEWA0USvyDdREEGbAj+g4ONIdE+sxiwQnDXcAwL?=
 =?iso-8859-1?Q?ZJGWaJRh0aEx0sPAyCKAkeE2EpbZNhxwodaypGjdsmB4xxS/iPrYuq3/BF?=
 =?iso-8859-1?Q?0HzAaqitD+jLEnADogiaBJhQ6BDmMg3jiuybkswwCbSrNUQVBgpzOfO3uG?=
 =?iso-8859-1?Q?OlcMD+Ec/naq7lCHradmNYqDt2WcyC5pk+TWqfLHAbsOwT1pCI8fYPO6EW?=
 =?iso-8859-1?Q?TPwNeppMkTWzlbeaf/9l5sZ7vVElgPxrwBe2wAG+sNzdotagsccz+5KaQh?=
 =?iso-8859-1?Q?By7M7NjBO1wcXI5RjrUgPqX1IK2R2BTrBTFCcIa7GriNJM5djoh5Y6cWxK?=
 =?iso-8859-1?Q?C4fB7dLCm9UKNip9P+rN9z8X0MVu/jN0YZuyfB0Pem4UMT4VcPI5T7vju3?=
 =?iso-8859-1?Q?q6FRmvQBLRgBM2peGz4mWB5awslx0TjyJ6na2sRXHN3coohzTlJ8c1N0tw?=
 =?iso-8859-1?Q?oJP2dNS/MgVyq3AO4/HOwWPFUtIERij1YUmKzuFKwOrllaYCgyrzhcWAs3?=
 =?iso-8859-1?Q?EIhRB0/m8rnhY05tYskXP9nlMRGUtirD8uvi9tvOsNNCTjID95+CkznkJU?=
 =?iso-8859-1?Q?oMIpajuR+sDZ+hWVvEiKGoX3lOrRXOg627GU+2YpDPjlAgxhqzCXa8FXas?=
 =?iso-8859-1?Q?ooPco3bguP5aSHi/O0hxd1UyN3C6XWr3GOehTzYbzXc1dIlrVUU2r8DT0K?=
 =?iso-8859-1?Q?HyVq2DF51WXZkBZ1XZg22yRA13fiftRRTkhJ1bZSZsLMZVCXXEkrWFCVfm?=
 =?iso-8859-1?Q?7aCQT3b1xsa461m3dj90jGTOl2ypjXXN4bP9wXpjtHD10F6bSKlShdrmWZ?=
 =?iso-8859-1?Q?GBNESmBgVhBI8kE/bvx6QStQxcVTkTxSV5M+eOd5A6KQqgu4IbQS+ghUZv?=
 =?iso-8859-1?Q?/mdZW4Pf3UdLRSVfs08QVaKNKIj6KK190gXozcYKrnU924px6OUSV7E9gg?=
 =?iso-8859-1?Q?3oTmwKVs4aWneKMoQStZiJYqHa7999xKOf+CuABR4whlAcX4wLAE4LCYma?=
 =?iso-8859-1?Q?el3DFtUXTMkf3MUfHXaKMWJOtZ2t5kDQ4MqfAbHvGMxDG+ry64oKUnDA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af72f70a-c0fb-4b5b-fefe-08dd82572081
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 11:08:07.3215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQOToDKHKEVSpl8Bpw9W4fDZu9Kha2wg8M3xQqkQIYZrkawTeeqk3IRQjFPiRisIxNDaod2F7O8Kd/U/+Sik4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6677

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some of the PCI host bridges require additional processing during the
probe phase. For that they need to access struct bridge of the probed
host, so return pointer to the new bridge from pci_host_common_probe.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v3->v4:
* change return 0 to return NULL

v2->v3:
* no change

v1->v2:
* no change
---
 xen/arch/arm/include/asm/pci.h      |  5 +++--
 xen/arch/arm/pci/pci-host-common.c  | 12 ++++++------
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index a87672d834..3d2ca9b5b0 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -18,6 +18,7 @@
 #ifdef CONFIG_HAS_PCI
=20
 #include <asm/p2m.h>
+#include <xen/err.h>
=20
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
=20
@@ -95,8 +96,8 @@ struct pci_ecam_ops {
 /* Default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
=20
-int pci_host_common_probe(struct dt_device_node *dev,
-                          const struct pci_ecam_ops *ops);
+struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
+                                              const struct pci_ecam_ops *o=
ps);
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value);
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index c0faf0f436..53953d4895 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -208,8 +208,8 @@ static int pci_bus_find_domain_nr(struct dt_device_node=
 *dev)
     return domain;
 }
=20
-int pci_host_common_probe(struct dt_device_node *dev,
-                          const struct pci_ecam_ops *ops)
+struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
+                                              const struct pci_ecam_ops *o=
ps)
 {
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
@@ -217,11 +217,11 @@ int pci_host_common_probe(struct dt_device_node *dev,
     int domain;
=20
     if ( dt_device_for_passthrough(dev) )
-        return 0;
+        return NULL;
=20
     bridge =3D pci_alloc_host_bridge();
     if ( !bridge )
-        return -ENOMEM;
+        return ERR_PTR(-ENOMEM);
=20
     /* Parse and map our Configuration Space windows */
     cfg =3D gen_pci_init(dev, ops);
@@ -244,12 +244,12 @@ int pci_host_common_probe(struct dt_device_node *dev,
     bridge->segment =3D domain;
     pci_add_host_bridge(bridge);
=20
-    return 0;
+    return bridge;
=20
 err_exit:
     xfree(bridge);
=20
-    return err;
+    return ERR_PTR(err);
 }
=20
 /*
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-hos=
t-generic.c
index 46de6e43cc..a6ffbda174 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pc=
i_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return pci_host_common_probe(dev, &pci_generic_ecam_ops);
+    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host=
-zynqmp.c
index 101edb8593..a38f2e019e 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pc=
ie_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return pci_host_common_probe(dev, &nwl_pcie_ops);
+    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
--=20
2.34.1

