Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 975E6B3897A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096716.1451330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKoa-000745-4G; Wed, 27 Aug 2025 18:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096716.1451330; Wed, 27 Aug 2025 18:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKoa-00070p-13; Wed, 27 Aug 2025 18:24:08 +0000
Received: by outflank-mailman (input) for mailman id 1096716;
 Wed, 27 Aug 2025 18:24:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKoY-000703-Fw
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:24:06 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02b74e1f-8373-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 20:24:05 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:24:01 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:24:01 +0000
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
X-Inumbo-ID: 02b74e1f-8373-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS3DI0ZzvEijgmjtZDg6u316K/+J1b4Gs6OzU2fOSs60UBQ/0C2QTxRIKp26cux+cVnMHgDlXK48MsGtzDikV3I1JdaxCqjqcQxZOjuHqRUwdlYmt3iite0HrcHNMWayoXzmHNN0EOpi6Cea3QgvUcv6rrhcgPcuIWDHvo5jLEs1IM0+8XIp17rNaIv6AmXwT8Y7s43IggHHGRQarCU5b862Xb68JH/HBfGzKBoPYV+T8sAye+BXeuI2DhkHNSXE5T09SuYrE/6LwWdkQMLnVj7N+7cuJQ/tQ/YVfJUdBo4KlSLU7C6fEolSlu57uFOur+H8MXfPZ213SPoy/9/2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg0pipsxluNUTLAfrvU29jgR6fAYKaQkc7w6WIEy79k=;
 b=zGu9z4W9JkXU7K400NWSve/Vw9lkvgvf2ELftXJiqht+l+Y10abkUwUInKAYOG5j2B63hKSEwf3YutgQ2LNxuafC1XSxDYu6Kc1JizQ9iRMyP1O0VQyTs+UG7G/gih3QyU+pKxiJlbn/dGB3GGOIAjGC41TqzkrAs7mIGUlVknV02bzK4a868yEb5G6mhUWuPycRo9yfznf+zWPaefUWt1d+l1XXl6tVkd4DVerH7j7ocw74i1+uiaTZJah8I2RlHM/7n7GxlCPSdwGJvZMeipG7txJwUxS6NT+RHfKZDePmdltOuCE8XEECvqmTxqtUM+xuJS9G9HzNtOKu3A8PxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg0pipsxluNUTLAfrvU29jgR6fAYKaQkc7w6WIEy79k=;
 b=OQK/vFaK6peWq+j6WaHRTxnIiFB3MghZ8kINLjArDnYB613AgwBJGa+rjh/mlMxYDQp59H48UQzi/05Hr+sWRwYA+vvQhGukxJhxANbRXaCJkl5UIde4Z6vEUr7UK3/DHMd8NShpCsPU3LOokcskFJJ2HGjB4j/Qxfw6vC6pZQoUmtDEPx2+p4MqSAk07x9LQxFJLl9vSkq7x3UYriF/ExjDYTJ6WBPZZJdU3MgChzUa7CZssM4Emm3wJE/7qFaY9iePUNbmbECGG4mSj5bh0S7aXKtBP3P/HKjuZ3U5dCEtfCth7XmwmGhLtUlsgV8TyNG+vszvH8qU8mT3Rd8EZw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 01/12] xen/arm: gicv3: refactor obtaining GIC addresses for
 common operations
Thread-Topic: [PATCH v4 01/12] xen/arm: gicv3: refactor obtaining GIC
 addresses for common operations
Thread-Index: AQHcF3/CtR1KedyUO0e9jC2sdgHn6g==
Date: Wed, 27 Aug 2025 18:24:01 +0000
Message-ID:
 <5f511d386c7f20b09106aa0202e0989477eff498.1756317702.git.leonid_komarianskyi@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756317702.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|MRWPR03MB11023:EE_
x-ms-office365-filtering-correlation-id: bc26998e-9a49-42e4-dbe3-08dde596e560
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Q3Nl9aedbjM/3VZ4EjNeL7nsOtr0mKtG19VCxX3rTR/qIvjJ38ze9XUsvf?=
 =?iso-8859-1?Q?VbO0P7Tsci+pLv+IPAX/giYZ0Mdh56Ja9dx7oHX7DrpQZsaZ0sonExKZdf?=
 =?iso-8859-1?Q?cJ3LnVR3Z3R3XsCq1iavYpaQ0ZpBN/86jyMdAnEfyAJiTWATklEW1K/sYZ?=
 =?iso-8859-1?Q?4gRxhen4CdtCT1WCvZ2H8pMhDlnMCEZ6rHCmSClLGE6ArBpkTi2nK+DDSv?=
 =?iso-8859-1?Q?ObMp5R6b7og8lKkG0gLkkg6l/iE8FfvatcS070D19xqTNGeOG4X0YOawIL?=
 =?iso-8859-1?Q?zztfgC+euVvmDkjz2rKmTpChfFmOslRSifegEKMHtk9qPWVd+y1b4OrHec?=
 =?iso-8859-1?Q?RBLvOdADK1lGBIVbh0Oc7ikkd7kelOXKak4qwqsi6Gu7QHLpdiMSbCrKtf?=
 =?iso-8859-1?Q?itd0Yi7YEisT9WBXbMA6Y5rSkKeyhOog4sjPYEcJuNyfV0JRcN29qqybhR?=
 =?iso-8859-1?Q?qAAb8E22hk2y1eq8vJ2P9A3br41t+VTEfahJwHUrqUw61WspKImNBqlnfN?=
 =?iso-8859-1?Q?hPffIftr7wyFhr2wdB3LRXY1xG3Ubz81adrw0iMampB8e3IAcpAIWbinkd?=
 =?iso-8859-1?Q?jvMa5t9V4tcHU/r8xAl6y1dYgFNQtLi3ofzsFV82I4MKWX8cWzVEJJy01R?=
 =?iso-8859-1?Q?vA6Xvl+75oSlbiwpwiUpVsyq5950cbz2F3FSbENc5/YP4C0ZC73Vhpi2O/?=
 =?iso-8859-1?Q?Bg6mS4PEi1JOgKba5RPR0+qo1JaH52CHntgZ9ilzFEYi7WlR1O0o8hsJIw?=
 =?iso-8859-1?Q?Ba9nEsaTW2ItgIoxmBO3nvnVyOy7kerujRSTVuTF+BgE5O2tLYQAetRPXj?=
 =?iso-8859-1?Q?ZFQzdAtTD6BUUA1zdivBtiJebWaMw9zwRAPLiiQ+A80sW2Hyj5rc7wI6Fx?=
 =?iso-8859-1?Q?qs9cR36EBscVyUJRMORi0LxqwunYWQXtR9XsQS1amE7cDtA3q8WU6FNrVu?=
 =?iso-8859-1?Q?nVEktLcORcJo5D2NSo3d3oJIVG+xYlYqDGaPA9yrwOBE/LPqE94z18fzYY?=
 =?iso-8859-1?Q?q+FwVeBj4LEkx4+S0Qkdr7O+G1mwF50DOPnml/PIFEDV9d28ZXhtfgD31F?=
 =?iso-8859-1?Q?gHZopWzTt4JvF4I7Zjumf8cRMxrJ9ZXDMhbk+ivZ5lGDrQ5mUUFFWz+yFQ?=
 =?iso-8859-1?Q?PKvnAfL3Puco0JBog04GWhFqcbIrzJ3uQ0PXnTQba+jEPvGR3je/69GDcX?=
 =?iso-8859-1?Q?Aae8U26XMmvxLm4R9DaOwxNZgv1GtV7DU3RUQCTpw2Wf1ZNM+0kLE7Oxpe?=
 =?iso-8859-1?Q?QiW5/fKOF8aYO35jsiaCgBLs6Q2bOXKz6pg4ZyLAn1CK5V8fAJmDy3XKlR?=
 =?iso-8859-1?Q?1C09onERiES3HwCrZ8K9oYIOg8geV5DC378OOKWSvb/Ife840gmrRi96Sp?=
 =?iso-8859-1?Q?zEHAgkZzhZ+JG5yGuU3Sjt6FQl9LrMgXhFt/9MLSYhKFs6bCQEqJBCddtN?=
 =?iso-8859-1?Q?E10s5eDPCnXW1mlkmEGl+D0ynkbflHwSq6QONX7HNsmWhORtv84391vtLl?=
 =?iso-8859-1?Q?brOVKbjjBtt7jRLFuxEB4z3H5NXgmKWm3truweuolBcw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UoBdPHGJM9G6NyFvE2IinF5ZFwf13gOnddbuFagXw5CmxmxZkEvhMVSC8U?=
 =?iso-8859-1?Q?p7m8kMzt0nmRmqBj3BXexhFdUvvxw5r9Sh5mFsoA3onxej1qaQHqjKeXgf?=
 =?iso-8859-1?Q?pa95qN0doPXtw9uGBZflPqLxZnb7OwpQFlR1rW4hlotpvGgn/gOmx6tYa7?=
 =?iso-8859-1?Q?9mInU1BSKDe5Z0q9VKNFJO+CzT1ZWxfw0GTDRO2T+pSC2hWS6m6myfKnjQ?=
 =?iso-8859-1?Q?SYvboIHlAdZ0tQOLvJbFX4yaPRrK+8Y/fOpLWUXbNT/H/J8aiH6+ZTmTHr?=
 =?iso-8859-1?Q?S0kyD4eYi6mAMGft8wt6vuTRWCV89iJowITgNccgElY0PmepEc5Nu6/aC5?=
 =?iso-8859-1?Q?7yTBrqv535doMFE1m7eVlAsM3WvFTA8R+8d6OiKVK6yu4/QdChX36m8tnt?=
 =?iso-8859-1?Q?kd0uEglBAyFaIhrOek4n/OIJiHZVhwRJ/HyGOQXQrupL1+f3lsaLUgJe9K?=
 =?iso-8859-1?Q?/fRHZHeFGmAmuA03ZavHlRbJS5TxyusxUR5BQLEz3ROH1zwhNAPs/Lnf1j?=
 =?iso-8859-1?Q?ivWvJRKM1u58pm6Lm/NXWRMj0b8cKWxgUFMKhoVZ8i0aZLq2Jr8sG96JK/?=
 =?iso-8859-1?Q?58YSi5cT1EFrFhd4pZucZ1YtobkGe00QurVI+hVZsEdJYExCLi99gxUEHm?=
 =?iso-8859-1?Q?ospZ3AmkTXJYI+7/sRc/OPTGjSR6k7GVyCp/Z9aQB7UqJw0p63O3j7xMif?=
 =?iso-8859-1?Q?YszWWJ76PkiTG0jtm0HfT714JmENH1uXX/S0DHD0XIlBQG/ISbapQrgZj2?=
 =?iso-8859-1?Q?9Iv9T5Q3nuoKD6kwTDuS+6Lh6ktisKNMvXeapGD5mZKuK2UGLNcTEO2FZa?=
 =?iso-8859-1?Q?arHddP9hoe07dyiS+9KOxaj5+KDCimaMQwZlcRNwb2NfmIiYOzW72MEFCi?=
 =?iso-8859-1?Q?C/FjoU0G+3CYeXF+RDuq5n4jEiNpPwP3ghWk3KMB/w085TljSyfrhO/wbz?=
 =?iso-8859-1?Q?ivfD3DnEIPMiFxyj7SZAIHj6FBSg7/E6gm4PR0A/JDwZ8gv2uNmGcObywq?=
 =?iso-8859-1?Q?fT0jebTtwZ525gSra5LGoPbzimwV2DHh23mVHBUGMA2EhyFxiq6LOGeHJQ?=
 =?iso-8859-1?Q?SqB0nP2pt8PTXoMRd+VTivR8HyVFcyKCDPF6dDYpInwGQ9eLp2ESJxnnbO?=
 =?iso-8859-1?Q?h4qlBrt1oc7SmveR/0f/ndlYsY9JGSSjE2rUcVcAB/5GBPUF/yrAbQ6QQR?=
 =?iso-8859-1?Q?Xkaim1lmIUiqPbKLNQfB01ek9sUY+1/nHx+gIYSzSg1tRLyt7+RUyn3fJZ?=
 =?iso-8859-1?Q?B+Yug6X4DrliloFs4Sfvyzq/MR7mCb694PLCVcM4MkdGxa4alb+0g8Ty5f?=
 =?iso-8859-1?Q?WCGge9OYotrgeu7BdtEyFapaF7JezPFZUJrsavdM46v+Ghe1zKUqDTfYYf?=
 =?iso-8859-1?Q?4MfqCnbXlDgQ6ylJ/VfbYXEsOzy0sVzGgf8J55R/UszkuG9fD2tETjBjIC?=
 =?iso-8859-1?Q?bVLOgq24wJsli4m9wusw4UHNScQAaQIKhKryCexcqyNRY6lN/1vvaYAJZ1?=
 =?iso-8859-1?Q?Evvwf5RQHUchm/A+D+YsqPklsRQmFMLgLIpqbhV2scRqbokIh8ONos6CDB?=
 =?iso-8859-1?Q?FuJL4XsYAbYZPWBqoRweXBb15oGld0X0lHjt9SkBudJA81eGtOus5mCtKS?=
 =?iso-8859-1?Q?oq2ZxZsPUuSDSRYqf/QuJZev0V9DQ/EcGP4z2H6ZhUvR2z9v1PXgF6s0DM?=
 =?iso-8859-1?Q?RDuR6c+pe+vAZFle2co=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc26998e-9a49-42e4-dbe3-08dde596e560
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:24:01.2602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IMiHFohBLdcb/BzA3kJmKfNQ/5MOfrH1YgBBVlEwv/sCZFhUo7biz6Dqdx798LM329C8beFIrdk0VXCcMfs0PrHRy++oYh0lOhJgjn/1040=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

Currently, many common functions perform the same operations to calculate
GIC register addresses. This patch consolidates the similar code into
a separate helper function to improve maintainability and reduce duplicatio=
n.
This refactoring also simplifies the implementation of eSPI support in futu=
re
changes.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Changes in V4:
- no changes

Changes in V3:
- changed panic() in get_addr_by_offset() to printing warning and
  ASSERT_UNREACHABLE()
- added verification of return pointer from get_addr_by_offset() in the
  callers
- moved invocation of get_addr_by_offset() from spinlock guards, since
  it is not necessarry
- added RB from Volodymyr Babchuk

Changes in V2:
- no changes
---
 xen/arch/arm/gic-v3.c          | 114 +++++++++++++++++++++++----------
 xen/arch/arm/include/asm/irq.h |   1 +
 2 files changed, 81 insertions(+), 34 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cd3e1acf79..a959fefebe 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -445,17 +445,67 @@ static void gicv3_dump_state(const struct vcpu *v)
     }
 }
=20
+static void __iomem *get_addr_by_offset(struct irq_desc *irqd, u32 offset)
+{
+    switch ( irqd->irq )
+    {
+    case 0 ... (NR_GIC_LOCAL_IRQS - 1):
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD_RDIST_SGI_BASE + offset);
+        case GICD_ICFGR:
+            return (GICD_RDIST_SGI_BASE + GICR_ICFGR1);
+        case GICD_IPRIORITYR:
+            return (GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irqd->irq);
+        default:
+            break;
+        }
+    case NR_GIC_LOCAL_IRQS ... SPI_MAX_INTID:
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD + offset + (irqd->irq / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGR + (irqd->irq / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTER + irqd->irq * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYR + irqd->irq);
+        default:
+            break;
+        }
+    default:
+        break;
+    }
+
+    /* Something went wrong, we shouldn't be able to reach here */
+    printk(XENLOG_WARNING "GICv3: WARNING: Invalid offset 0x%x for IRQ#%d"=
,
+           offset, irqd->irq);
+    ASSERT_UNREACHABLE();
+
+    return NULL;
+}
+
 static void gicv3_poke_irq(struct irq_desc *irqd, u32 offset, bool wait_fo=
r_rwp)
 {
     u32 mask =3D 1U << (irqd->irq % 32);
-    void __iomem *base;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    if ( irqd->irq < NR_GIC_LOCAL_IRQS )
-        base =3D GICD_RDIST_SGI_BASE;
-    else
-        base =3D GICD;
+    if ( addr =3D=3D NULL )
+        return;
=20
-    writel_relaxed(mask, base + offset + (irqd->irq / 32) * 4);
+    writel_relaxed(mask, addr);
=20
     if ( wait_for_rwp )
         gicv3_wait_for_rwp(irqd->irq);
@@ -463,15 +513,12 @@ static void gicv3_poke_irq(struct irq_desc *irqd, u32=
 offset, bool wait_for_rwp)
=20
 static bool gicv3_peek_irq(struct irq_desc *irqd, u32 offset)
 {
-    void __iomem *base;
-    unsigned int irq =3D irqd->irq;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + (irq / 32) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE;
+    if ( addr =3D=3D NULL )
+        return false;
=20
-    return !!(readl(base + offset) & (1U << (irq % 32)));
+    return !!(readl(addr) & (1U << (irqd->irq % 32)));
 }
=20
 static void gicv3_unmask_irq(struct irq_desc *irqd)
@@ -558,30 +605,28 @@ static inline uint64_t gicv3_mpidr_to_affinity(int cp=
u)
 static void gicv3_set_irq_type(struct irq_desc *desc, unsigned int type)
 {
     uint32_t cfg, actual, edgebit;
-    void __iomem *base;
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr;
=20
     /* SGI's are always edge-triggered not need to call GICD_ICFGR0 */
-    ASSERT(irq >=3D NR_GIC_SGI);
+    ASSERT(desc->irq >=3D NR_GIC_SGI);
=20
-    spin_lock(&gicv3.lock);
+    addr =3D get_addr_by_offset(desc, GICD_ICFGR);
+    if ( addr =3D=3D NULL )
+        return;
=20
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + GICD_ICFGR + (irq / 16) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE + GICR_ICFGR1;
+    spin_lock(&gicv3.lock);
=20
-    cfg =3D readl_relaxed(base);
+    cfg =3D readl_relaxed(addr);
=20
-    edgebit =3D 2u << (2 * (irq % 16));
+    edgebit =3D 2u << (2 * (desc->irq % 16));
     if ( type & IRQ_TYPE_LEVEL_MASK )
         cfg &=3D ~edgebit;
     else if ( type & IRQ_TYPE_EDGE_BOTH )
         cfg |=3D edgebit;
=20
-    writel_relaxed(cfg, base);
+    writel_relaxed(cfg, addr);
=20
-    actual =3D readl_relaxed(base);
+    actual =3D readl_relaxed(addr);
     if ( ( cfg & edgebit ) ^ ( actual & edgebit ) )
     {
         printk(XENLOG_WARNING "GICv3: WARNING: "
@@ -600,16 +645,13 @@ static void gicv3_set_irq_type(struct irq_desc *desc,=
 unsigned int type)
 static void gicv3_set_irq_priority(struct irq_desc *desc,
                                    unsigned int priority)
 {
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IPRIORITYR);
=20
-    spin_lock(&gicv3.lock);
-
-    /* Set priority */
-    if ( irq < NR_GIC_LOCAL_IRQS )
-        writeb_relaxed(priority, GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + =
irq);
-    else
-        writeb_relaxed(priority, GICD + GICD_IPRIORITYR + irq);
+    if ( addr =3D=3D NULL )
+        return;
=20
+    spin_lock(&gicv3.lock);
+    writeb_relaxed(priority, addr);
     spin_unlock(&gicv3.lock);
 }
=20
@@ -1273,6 +1315,10 @@ static void gicv3_irq_set_affinity(struct irq_desc *=
desc, const cpumask_t *mask)
 {
     unsigned int cpu;
     uint64_t affinity;
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IROUTER);
+
+    if ( addr =3D=3D NULL )
+        return;
=20
     ASSERT(!cpumask_empty(mask));
=20
@@ -1284,7 +1330,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *d=
esc, const cpumask_t *mask)
     affinity &=3D ~GICD_IROUTER_SPI_MODE_ANY;
=20
     if ( desc->irq >=3D NR_GIC_LOCAL_IRQS )
-        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->i=
rq * 8));
+        writeq_relaxed_non_atomic(affinity, addr);
=20
     spin_unlock(&gicv3.lock);
 }
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index fce7e42a33..5bc6475eb4 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -29,6 +29,7 @@ struct arch_irq_desc {
  */
 #define NR_IRQS		1024
=20
+#define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
--=20
2.34.1

