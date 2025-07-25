Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDF9B12012
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057929.1425617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLi-000707-Eb; Fri, 25 Jul 2025 14:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057929.1425617; Fri, 25 Jul 2025 14:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLi-0006xq-BU; Fri, 25 Jul 2025 14:24:38 +0000
Received: by outflank-mailman (input) for mailman id 1057929;
 Fri, 25 Jul 2025 14:24:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGu/=2G=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ufJLh-0006kC-HF
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:24:37 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1728b892-6963-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 16:24:36 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB7421.eurprd03.prod.outlook.com
 (2603:10a6:102:103::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:24:32 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 14:24:32 +0000
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
X-Inumbo-ID: 1728b892-6963-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuvOUqIvEKZDDr5LvK1iNP1+zvODKUkPvmyvxCOqmTLDvrtAa/HAJXwYGJwXGATWqFAmaJwzzWW1ztEyAkQRowe62TDkXwiQXb857tL/tCWXPcb9jBd8wUMvUDn15m/vf8u8o8+raDlWDXJrj00VEwje/+4Zvwo9T6dntG1cNIs0XPH7vWGY/H2PHLTAz6CweFtPtW77qhE+XXKS1n8KROej08hdnH7MGlQJhGc4sKgcq6HwO2hbbmacer8LsIfrJm1dCdLOHzkSsUSeVJ5P3bKKCYbZi50Z6pXpC7Y2q/D2Ul7M0eIyTzz1AaoVGjrUROl4BtBHG0eYr6WhoculRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inGNoog43S7nN5ydBltQmDOakREqZ24RMy5InFBpc04=;
 b=mLb6UuUoz43wvJg2YdCnl96holXntJruIEipSDxX37I/O/17LDFnu0bHqbkp6nk1fSDW6TvGd5tPgR6gl+XEI6cFAVCUWqekX1AOvAbYxSgZVLS8inw67JBPTeRyI4iyr/ZIRTtdnIyoHowOq6dDp9BTix7uYos+3cqvJigiHB8oeN1QkEIjxrikukcffgmy66IH/CTt/AikGtH0ui6SEujUHc93GrjULfn+ZIgXeoHHneTOogOihewE6zoJBBkKXS/NcSHqZP+1xNPGg9rypOUTiREa9XLdegebb4repuwhOkDAaonmxJcLZLcicbNpySHGPrdbPnZJ15TsyFbnkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inGNoog43S7nN5ydBltQmDOakREqZ24RMy5InFBpc04=;
 b=KpApqqAll5BDHgPhnn+icVCCvilCf/7NiCqftttXMh0JkuUJUnE2JjnPfV72OVcrocR9YBcpuqH9GNFkSFyBNE4yHRTY963AmINV6FZstXF0WOc+ms8v+mdlySue/a1NPPu4roV5AfPJYYjfCebPBJyyQ0rbpb+bhW/tfFsZSGutZiXIwxtxm6gIVPhZP1JlqPTmrrYdUb6AudjLLoAFffzMmSNDVOjCIOmPGdamv4hoILusUefvSggW5LfgubeXpVxpX6yhqoH0XIHRs6oqmpf58TiUEB6MaUw0OtS5cec8JSqUBAjHd90NUsFx3AYvqkZQeWDAh4OjQGQcQDDrWQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v1 1/6] vpci: rename and export vpci_modify_bars
Thread-Topic: [PATCH v1 1/6] vpci: rename and export vpci_modify_bars
Thread-Index: AQHb/W/WGeBnINj/SU6xDj4XmbeIxg==
Date: Fri, 25 Jul 2025 14:24:32 +0000
Message-ID:
 <d966c812dfa498db3a906c7ccbe0333d1833807e.1753450965.git.mykyta_poturai@epam.com>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1753450965.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB7421:EE_
x-ms-office365-filtering-correlation-id: aa7f666f-e342-4d99-2308-08ddcb86f976
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7zn7h5w3W762Ucg21SRCL/pNoicHt5W3kCMekeClFuSv3eH0tGr+SmbeBr?=
 =?iso-8859-1?Q?kduBbhSGX969gQ54V4zn0ZprwtG5wXJ66fZgCY7m3arrFFdtSN2fDVB+M/?=
 =?iso-8859-1?Q?7/TQBcGQyEuYTqc+B72KJxd65KueNEVNJTaYdpheKD2pWGHKadrXg3O+Sc?=
 =?iso-8859-1?Q?Lu9fgPO1g0sqv8iWhBR5tlyhKf2z2adNVW55AE1L+4OLK8Sn8cURQwBXp6?=
 =?iso-8859-1?Q?daDGqf4rhndQBLmShaYrm015Nm/vQnC9mVvSXVFE0ERknTqxAXLbjBGOSW?=
 =?iso-8859-1?Q?zkaI0I6+jBTWnu3irJaPQWVpRetvauYnXAvfb4sVHKXBRn7V6FqCM88B44?=
 =?iso-8859-1?Q?F3ZBCIz6haM0peszZydTF1O+7SUKThmhLcWhcLH3e8uhj8Gh2ycgLTl7q9?=
 =?iso-8859-1?Q?VzoyBvfcE9aBdSFOZKq+8PlHeh62qrWJLAPWgP+aqjbevpKisaTjSCNylW?=
 =?iso-8859-1?Q?Ck8asVEDnpK7T8HlWjJv0BrYD9pb95hW90Lan+GOe419+gt+MONTPcQdeo?=
 =?iso-8859-1?Q?n/gRZqvKxjZi0zMryHGqMerKqo9b6iElNNb8qmG8worvJSjSwbSPMksvWI?=
 =?iso-8859-1?Q?JanGwW7RX/twVAW+GwGjpjso/ceAYlj34jh4AujyC8hFzawB3RE8GKxa3D?=
 =?iso-8859-1?Q?DmRKn37D5M81Ki03wHsz5inLfZ+fVOmxgdBGj4F6ZbWDK+ZnANRuRTrHdT?=
 =?iso-8859-1?Q?Y1/204zYvrNb+QCUbqqRa9lZ9jtx5CN0ahPHggO3ltBa5lBcRYTUjcIXhM?=
 =?iso-8859-1?Q?08x2eT9fEyP/UYAK4bMdxwB0JNFhpA6YDRx+mEbKyRxEgJzoOZ+ZqSixf4?=
 =?iso-8859-1?Q?6hna4WqJ59Ojit0G8b43VckU7a3JX3aZkf56k8EI39HopJarqa8ijRxI71?=
 =?iso-8859-1?Q?JREcOBi45x+vYhyEp72s0qXWqp4jpRkgVUKXJyXNPm78S19jvfNIZJ7QeQ?=
 =?iso-8859-1?Q?m3i1IsvWa3JtozR+hKKCNBS7A2/4NOy0fll3/R5WiGms2PpXIB5RjjCSTg?=
 =?iso-8859-1?Q?mLveEmgzK8PmPYZLGQ3rkA+vSQV0JqAzas8r8NK3UTlu7HpCftWVIHPenJ?=
 =?iso-8859-1?Q?KnhWVpuNV/1E8u8AbFF+/FcXwI7LaKAbcmQ89vcL1LdcRhUMh1GsFqVSex?=
 =?iso-8859-1?Q?6BuxheMHpeqGw1fQ4nElJsicEeUhfg3PV3bREqT3QSdvQsCdLlXHGudA9i?=
 =?iso-8859-1?Q?MZJJfIMIXscg2nQGWgQFL4OPuyM7VX12LWMvcQyzuFELCEkKW3OOp9V26Q?=
 =?iso-8859-1?Q?Cu7RdTB11sajqD2UQHqmpM2wevGnqxwah3W6ibTaKP2UYzZtp0tg3kpy5o?=
 =?iso-8859-1?Q?ZWvvLWHjCyuz650DOFRQANFO7Lj+vFbkEmsfB13fElAjx7VrWKl1xD4Pok?=
 =?iso-8859-1?Q?F0441bWcPPlMSFGLn3p1qM3DkwpgaLxwpERMgFwvRJfuhp3Vw0RTqaRXRd?=
 =?iso-8859-1?Q?HG2Mv1MckhzFmYB1kWnHSwtLChY63bJuVXVzC9JW8Wn2NMD6wIM66yvwGz?=
 =?iso-8859-1?Q?ZNLlIy60hwJDOo+IbRoGAssOHbOXh+wfVOdIHTqrNdRA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3rYborc3aVqiZ7bACcPDgNqM7p26dFTECIiFy4clpwpGcrmyEN4EM1MR5c?=
 =?iso-8859-1?Q?NZiwC4gNWcKpDAId1DhW+A3NObQmGj/lRvp5ZP7GYVnn/C3D5mWTxO7wms?=
 =?iso-8859-1?Q?fiH2rD5mQzzdTPRinHi71Wl4PT4xfdnVDRBnZme1B3nsccHTWAhcIXonYe?=
 =?iso-8859-1?Q?SZUjQtpboi2XvVkrkkfxA5yLHXm/oFXrwmDVn7dtzNOlkdeQjzl/22/Ovc?=
 =?iso-8859-1?Q?2lTfYDSSht8lQShRCWDJvEIKCNC9LkbhWPBpIwMwpXw/bxNjeVIryOdd/O?=
 =?iso-8859-1?Q?NdSLVjOZXkx98ySpRJHdQeLbex/uNodMNg0gFY+m4dG+K+TWOLm9AftJxI?=
 =?iso-8859-1?Q?Ivm6fnZ1ZID0/TlnJSDWtZOIzodaRIxYTIvemvjwdcl/+e0G4EH/1wWDl6?=
 =?iso-8859-1?Q?pKhdGxYzzHiBzV/JAl9yWMBupteWtZnOSnVuJMVhag4f8MTWhHrwJU/CdB?=
 =?iso-8859-1?Q?RBe4xN4+gzkWmJaMvQGqH8YEZUcOFiY2IGoKJTbH51PV6pha4Z1L/cJdYd?=
 =?iso-8859-1?Q?RBnyA0JnqKWdtYV3xVhYNhxM0SZh+vucioiVa2YDMTk2wI/v+lZtZOwJTs?=
 =?iso-8859-1?Q?mPVsGdNzG7nm8XqsFwpuiRsgZrYwV6ymH30nCK6LNrBPadko/gQPiAUivG?=
 =?iso-8859-1?Q?Oyw3KJrOprGEcwnmbd7i0DdwAr9TBecYegseTzLvQ2GOeVfYDBSrE4hmcd?=
 =?iso-8859-1?Q?SQzlgVaAloANRxkJHzKbMshnpmUGMqqHoIhOKC0pca2yHXcLvQynVRFn/r?=
 =?iso-8859-1?Q?BabHJK3Z5/I9f23y7N39+cUMD2uSeI80062H6thg3QZ2cJZ7cSXv82iVtH?=
 =?iso-8859-1?Q?ng8ZaxLfxDV6tu8CmwvwizpUGKX/I5q7cuqKPOfMAtCLRwROanJAO0nGHt?=
 =?iso-8859-1?Q?SqgNaxq4mMXnQmSaU8xKPjRAdvPySGFY/UuSGGjBkTRjAby+/pjNW7gNpy?=
 =?iso-8859-1?Q?P3cYSoLMnxAnPGrRVwx5+RYaq9K56fepE5m1GOQEvW/d1mine9lK9TXrPa?=
 =?iso-8859-1?Q?1N/zhYBLu2K8n1BPj9l8rTOr3dpNo4JMuHrDSaS5n+W3ic2HB1IhqTJH7Q?=
 =?iso-8859-1?Q?RLNUqkYc/VJlBYMPPyJZmoXyRYJj48wDIagTgtPW4SEUm6MjMj4XY0CjvV?=
 =?iso-8859-1?Q?l1L8zgcIJNOZEsU67riekGfEVSsyZB8IYEDZ7ZqbbGUwK9pF6/fx4p7dkO?=
 =?iso-8859-1?Q?m432qI4oPKJM0wCo/i3lshU+s6IYXP3MmNOQxrB67xxiVx6TxW1n46b8D9?=
 =?iso-8859-1?Q?84SUFQWOM67BVBGo7b4HW+WzQD+uzIJDMx0I2Ls1t/SVwGcaFYENyMlhXU?=
 =?iso-8859-1?Q?3gCmRURttZ+JVRVPRBgIdOQkQG8Fn2/tabWIRlWvM/qqlrcNtNlxuR+1z4?=
 =?iso-8859-1?Q?eg5RIyJUKu5otg7u5LQI+L+wtTaVRVo876nmJLEVj2CeT29B+/t25VCNnL?=
 =?iso-8859-1?Q?CGvtHt4ar4G56TrA4RT0fcdrL+P5PwpaixBbgOtGIV9w07jOXgKhy8u23z?=
 =?iso-8859-1?Q?y0LeJ1bT0s5UgSgZtsr1aVxeHjdYnGde0mQ8sfR2GSPcxME2W4JQzHGoiN?=
 =?iso-8859-1?Q?XOTgCwGk0l2myylOmRP9W3vEbbaQexv/6h8JwttwYWaEf/E+X6own7Tlbc?=
 =?iso-8859-1?Q?msYUl5jQWnsJm0aQ/lVFrOl62p2i7u9oZO5dglWwMu9NO16SupnRQJIw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7f666f-e342-4d99-2308-08ddcb86f976
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 14:24:32.2316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XqamBGH7LweSF58ATgKihTsG6ALno7/a+UmQG+bdB5Se6kab0th71/CUtFnnMyUizNbHMSP4WN2D0/P92sSyeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7421

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Export functions required for SR-IOV support.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/drivers/vpci/header.c | 16 +++++++++-------
 xen/include/xen/vpci.h    |  3 +++
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index bb76e70799..c4d8c45640 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -304,7 +304,7 @@ static void defer_map(const struct pci_dev *pdev, uint1=
6_t cmd, bool rom_only)
     raise_softirq(SCHEDULE_SOFTIRQ);
 }
=20
-static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_=
only)
+int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_on=
ly)
 {
     struct vpci_header *header =3D &pdev->vpci->header;
     struct pci_dev *tmp;
@@ -545,7 +545,7 @@ static void cf_check cmd_write(
          * memory decoding bit has not been changed, so leave everything a=
s-is,
          * hoping the guest will realize and try again.
          */
-        modify_bars(pdev, cmd, false);
+        vpci_modify_bars(pdev, cmd, false);
     else
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
@@ -713,13 +713,15 @@ static void cf_check rom_write(
      * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note th=
at
      * this fabricated command is never going to be written to the registe=
r.
      */
-    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true=
) )
+    else if ( vpci_modify_bars(pdev,
+                               new_enabled ? PCI_COMMAND_MEMORY : 0,
+                               true) )
         /*
          * No memory has been added or removed from the p2m (because the a=
ctual
          * p2m changes are deferred in defer_map) and the ROM enable bit h=
as
          * not been changed, so leave everything as-is, hoping the guest w=
ill
          * realize and try again. It's important to not update rom->addr i=
n the
-         * unmap case if modify_bars has failed, or future attempts would
+         * unmap case if vpci_modify_bars has failed, or future attempts w=
ould
          * attempt to unmap the wrong address.
          */
         return;
@@ -894,8 +896,8 @@ static int cf_check init_header(struct pci_dev *pdev)
     /*
      * For DomUs, clear PCI_COMMAND_{MASTER,MEMORY,IO} and other
      * DomU-controllable bits in PCI_COMMAND. Devices assigned to DomUs wi=
ll
-     * start with memory decoding disabled, and modify_bars() will not be =
called
-     * at the end of this function.
+     * start with memory decoding disabled, and vpci_modify_bars() will no=
t be
+     * called at the end of this function.
      */
     if ( !is_hwdom )
         cmd &=3D ~(PCI_COMMAND_VGA_PALETTE | PCI_COMMAND_INVALIDATE |
@@ -1020,7 +1022,7 @@ static int cf_check init_header(struct pci_dev *pdev)
             goto fail;
     }
=20
-    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+    return (cmd & PCI_COMMAND_MEMORY) ? vpci_modify_bars(pdev, cmd, false)=
 : 0;
=20
  fail:
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 6a481a4e89..5ef35b23c7 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -286,6 +286,9 @@ bool vpci_ecam_write(pci_sbdf_t sbdf, unsigned int reg,=
 unsigned int len,
 bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
                     unsigned long *data);
=20
+/* Map/unmap the BARs of a vPCI device. */
+int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_on=
ly);
+
 #endif /* __XEN__ */
=20
 #else /* !CONFIG_HAS_VPCI */
--=20
2.34.1

