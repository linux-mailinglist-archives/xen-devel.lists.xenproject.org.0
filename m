Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7FEAD6EC2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 13:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012879.1391406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfvC-0003nX-Hg; Thu, 12 Jun 2025 11:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012879.1391406; Thu, 12 Jun 2025 11:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfvC-0003l8-ES; Thu, 12 Jun 2025 11:16:38 +0000
Received: by outflank-mailman (input) for mailman id 1012879;
 Thu, 12 Jun 2025 11:16:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGhi=Y3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uPfvB-0003Ie-6E
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 11:16:37 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3ba77fe-477e-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 13:16:35 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10784.eurprd03.prod.outlook.com
 (2603:10a6:800:262::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Thu, 12 Jun
 2025 11:16:21 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%6]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 11:16:21 +0000
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
X-Inumbo-ID: b3ba77fe-477e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igio+9fAb3iEvClhG9Sv/AVXdTXF2m5BESwEPXzUkXxyzCxU8g8vccbxGY+njG5VHat9JUAZCaVJoVXmMzIXkaAoJBWJ1QE7hKypDp7NQu4bDwuveII/qxtXPaxvTrb7Cp/tBLY3q41ENC4nx7HdoKLofEeOIjkkc8CNiVplpGh0K/MpURh//hvQkquSSNDVYQCLUnyFzgWb+/mBf8TFApJfxmre0inXYnO38XfCq0GEwNHRz2AaUa5JkJCognmBBQOEor4w5fUml//15ZDlFW3RmNyV93Lffu+zGB4uwGa8RlIjSPRZZa9dUSZQbvkzC5h8eaYjSG8WKKsgAlTSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nScYt7GmoMzS1LXbq902oz4FID+2oMIzcHIRz6jw5Cg=;
 b=j9eIPGOeDGqET4ddUayRfYXaq/X3WERzeAffzDrR2x/354RNorfRKD4mAsEz9Bsuu540TCZ/yjP6EYgoFNt73gcVqhp8brJ09FHZvgldIU9RvDJtEVWyk/7UCshYBZupgRMctubXVs6+1ugREj9mFBq9sv/jLsUYmQ7xR32jK/DdvqkGK0JMzQvdAKwX9XR5rveD73A6TkbSSwLPrH9noo9Nb+l4uhPD/SVG6yWnBCCR7f0Ok8BqnVPAjfDk4jxpCm7zhIV05Ak+w2cMfZNE+VJ+a9/Sdzqhw70bJ602CPmtZY8TXwnI5o7dl5QpISYtPyD6QIBsPN9VG2L0YiD/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nScYt7GmoMzS1LXbq902oz4FID+2oMIzcHIRz6jw5Cg=;
 b=MJ80UwwAe4VP54nKCZiPaDYYH1kca9jxUILhxwSrKw3Sg4tzJrOb0XC2YvLqnm3vaBnCAKsBgNivUPDuSRNw3Ue2CjnzMsMrGfi00RqFnXpcg5yh1qjKQRYoaxb9etRFT1nFDJIrkgzBAOD/9xgyqnuMLMxZCKGrbHWOs1kO826i8siH1TLUS5e6WpZrdT68Ld2dxDf8wysY30xTK9SKnGiuQEnsn0AisSyRdcxwi+hRzNwmJZIvmAiS1TQwCx5v8PFs2NNO3CkDdCcHp2GItFDZou16TXgrOsRcsYT07eEPWAhDuFa+fJm4c/cYxm7j7NOlUlNJbADK5eAftjurZQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v6 2/4] xen/arm: make pci_host_common_probe return the bridge
Thread-Topic: [PATCH v6 2/4] xen/arm: make pci_host_common_probe return the
 bridge
Thread-Index: AQHb24ts21/zmTrEckWar9vhEnDhBg==
Date: Thu, 12 Jun 2025 11:16:21 +0000
Message-ID:
 <89b6866f789ce19908f16031272ed490aa9e136a.1749720912.git.mykyta_poturai@epam.com>
References: <cover.1749720912.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1749720912.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI0PR03MB10784:EE_
x-ms-office365-filtering-correlation-id: 953e37f4-7855-4e91-0d7f-08dda9a28f80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0IxKtvjB5+uxR9Mod9ReiP9nOsoeSy27/fGmnEhKEpkByddlmJ8IOvo1TE?=
 =?iso-8859-1?Q?MPIEcbjyd8F/Q6qluS86ocIdtycf66atcmkF03GKy3YBpvLfXYxkXh2S42?=
 =?iso-8859-1?Q?vHUJYYfGKajz7njA9w23OVU6Y8Aw0Nhxa1L+AMTYWnJ69rqm8+keZL8Xqi?=
 =?iso-8859-1?Q?egkLY8vLqfIue27u0zbB1WRpWjRQ0+V8WFvziEr7ra7QBxL7oS0wUwgKcV?=
 =?iso-8859-1?Q?f7hZrIGMA2JE848+7GYqn1GAL6tQ5aJgpIPqxCVGf/1YttcRQb0CHLTJDS?=
 =?iso-8859-1?Q?JIvjpAAiGtrHhbWtVIVQ7/RukRnLW0A4p40WHu+AtWC72AeTLm5SVhy0N2?=
 =?iso-8859-1?Q?W6s7AxIyV41T35bUsF3FPzvhHZZeLVFqW6v7PJX7QDEarFXuF19cFHhyUf?=
 =?iso-8859-1?Q?xu1ls8zxRjGlNL4swjEkFS3KHLUSlAnkL4bZMA3mHcwNxm7FmsFmGejLgv?=
 =?iso-8859-1?Q?hBZDGmnPYHnttZNkJwOImKUh9ughso0CjlTzOUZK2DPgpBxyH2X+GFminA?=
 =?iso-8859-1?Q?ds1hI/T+aLoM//UgX2MeYAYPgTkeWhTpuILHoVmAlseY25t0O0W1a2rG+2?=
 =?iso-8859-1?Q?KrcU72wCqmR3tWN735s7vPZHgYOEMNHMtXdfRX6pAw7j6++3Gl3VWk2Pn/?=
 =?iso-8859-1?Q?VGnn4TptagMR7E9m6fjpNZa6O+at8tgw5CfqQsNtoq/Sb8cLb1ASRXCRJZ?=
 =?iso-8859-1?Q?q/bCUYs6Wt9dOTB1B75QbFr0en5E6s5qDP3U3HpBGGwl+QZ6xMG3gEFMw7?=
 =?iso-8859-1?Q?LjXcJDaMnE5ltnIBG+fnKeMniZ1aMGmIB99qS+r8LMfsNsm3x+yXmHmGRD?=
 =?iso-8859-1?Q?H0fWaOpOvyR9opGYUFnQYQmEwhr94gj19baw3TWCHFsoSCm6YVggKkukiB?=
 =?iso-8859-1?Q?xIW5FS4HQtxboglDhv1jp0u7KxRlapC6pnk3H78uZ+rDYe1ISGi5OAFi/w?=
 =?iso-8859-1?Q?HvSEbcPMRf8TD1s7rRmDS10DCb4guWZtAn3LUfXLhux8OB2f7xlonOzvEQ?=
 =?iso-8859-1?Q?FetWyaWznkZjXPHs+QNCMFADj8aJ5xG9W4x4mprD0DCwdONf24iZflF4kw?=
 =?iso-8859-1?Q?RTtOKVvGR3ywidwELrPzGY/LJeFpTLnc8ZnOPruZcjKJY3IU5B920Oes72?=
 =?iso-8859-1?Q?RhsTVxQeUK4M7lWhCuznDUoveY/2qr0U9d6u7RTvLXCW8QFAAafDTxVkur?=
 =?iso-8859-1?Q?2U0QYK6EPlDH7DIypSkrOTt2vnQt6Aw8pF7afGK+c/pAIRKXHetgYFCu/S?=
 =?iso-8859-1?Q?3QvGdZ1pb8IPbIG/CGwnuEDpfFk3STOvusYiBuTXzz/63GiE5Y/t8NcukQ?=
 =?iso-8859-1?Q?eMwElnvdQ8bMBDOA3BSh0P+3mzu56wVsH1SR/AfapauSo66fSiMx4CFUBS?=
 =?iso-8859-1?Q?bLMRYcaM6bpFYFZZHnVyuHxlKAibt1PgdA7Y7UFGxsIuaMz9ITaFz1XInK?=
 =?iso-8859-1?Q?+DaDAM+wrVD1dv5LS7FLP4OJnx6pHYnxnfH7aYTskMmGqxSXZZRuQ+rjTL?=
 =?iso-8859-1?Q?SNBstWNsKWKtvsJ5qOrHHN60aA1bMz+9Dq+UEa3XTK9fLBcXYxYzVoSsxG?=
 =?iso-8859-1?Q?Bl18rZI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?h06h44ZQnHnLC6AMOAxsm1E03/JHSutnZHTKnQjqB7pZLXTIOAG4cg3Zc8?=
 =?iso-8859-1?Q?GCc3z01mb9hzmfHvos+GdK4nXiOw8iWVhTeJfHaHd88etZt4vF32tqovXQ?=
 =?iso-8859-1?Q?QalhYTX0PQVX8ArGjcpxYeTyMFbfbAOxqFLvgFYv6TIriC86oEhJYT+hKz?=
 =?iso-8859-1?Q?c1EZ3RTkphrLI0A8fCA58JB1tlSadYSImPq2fuv7ZyR6o5hAjbgid3QmLy?=
 =?iso-8859-1?Q?cOdfsHSiVnN4FtBWO9RSPFWfsw0OyUajHYvEqRZfZBxr96z/4/VNpUfb+7?=
 =?iso-8859-1?Q?4afIPyVJqIfhDoFvvR/cVRknIuDC+txZfmexoXlnuhGHpS06YtxL7uEmZk?=
 =?iso-8859-1?Q?hiE6k+YmlbCZ9JZteoCHIsAepsl8vo0PJvy/VLwvu7Fd2TUiNnsiNe00hd?=
 =?iso-8859-1?Q?Ho0wEakmLApEXYn/n4tD351M94w/fnvi964xwaxbIsA2rpCDzyJ2dvtihW?=
 =?iso-8859-1?Q?SP8YXQi66YHhP1hx09j2MHNl0VITb7GgG/ILvv6Y+gJKxq9mSc5QOLvtvw?=
 =?iso-8859-1?Q?sVlsYfh8TM+htlY9f0CSBh6VFEOCflb6UTWL9xV92EUn+NAxuRHZ650XSe?=
 =?iso-8859-1?Q?a7QhKRNATn8YmaUxvahYNAq9d3XilrZ+okluLXlZT7BjyE4aYgnWahzHcb?=
 =?iso-8859-1?Q?ze2husrtYs/hXHK3U7XEknsy6ZQypKb8qT11eBQasW3QALOZIhCiiQ91b0?=
 =?iso-8859-1?Q?CAMtaaHixy8rl9CLVBDiAd2TPHNVjUXO9GQE7jqWQlK61USVLUyYw7xi13?=
 =?iso-8859-1?Q?9TNOilnEVc/NOCyfI2JBEF8r8iDxHm5moNiT8AthEXvo7env9TXaOtM8Vl?=
 =?iso-8859-1?Q?vmbCBHJOiXCmNOa1HlqUyNwWpd7mjeLrgonyGjOdducCKkEJtQyvGp16Vf?=
 =?iso-8859-1?Q?KmTGZ2ujRUrvi2dMnEUt2F+dwM6Tp9Q4O1C7NgDWgXyenT96tlYLqwI9Us?=
 =?iso-8859-1?Q?lX898v6k14wHKoWekCNpxUUneLf5HgLhmGstysdy5l1Y1PFedn1vQ5Q7Hz?=
 =?iso-8859-1?Q?5RoDUHzvQf1H0KCypU0UZqjHf0XWMy8KAHPr9s+tA7RlA9ayRT2ccFmu0R?=
 =?iso-8859-1?Q?99QrAEiCF2+eO+5xBQe46TlkYTYAFWTn+8ApTt/FGObK0FKLXU0kalho09?=
 =?iso-8859-1?Q?MjUz+x/mHnb1HVJDqj2u6QF6SFMJGzzVXt3ae5BbLieaXpJChXmHSbm1w4?=
 =?iso-8859-1?Q?EvnrKNd96u5kGQ/o8uYXoWOMXJHbU7lJlFVyCeoTODrhpG+3pE7jCJ94As?=
 =?iso-8859-1?Q?M3o2FS+8wq1MA0VHa9lIChec5WOWAm7aToNnBG096gN/YurMA6kXAgzmf9?=
 =?iso-8859-1?Q?/qaI/QshF/kKO0lcbWei8UMcO23hP2ViKoZYhsabgPrmBxMqPz8yd64TmY?=
 =?iso-8859-1?Q?B1hL1/xEHG0y8Vh41xafCjgTvpLNIznOfzm3MtYaVHq6wbmm1scSpXPBpp?=
 =?iso-8859-1?Q?D7455xA12xR6dqWNdH0YFCt59rkqn0rBYoDzmjEAslykwX8+9ruysLR3vS?=
 =?iso-8859-1?Q?eyVwwwrN86GXfw+lgpEBRGACIk2B82uM8lkyrWnI6Tosn4r9qW72J4UtVH?=
 =?iso-8859-1?Q?igCfWJHXEexDgf5WBugjNKcNv6E3wsxX99ujwVgxJnPF13jReAZu8aKhz3?=
 =?iso-8859-1?Q?Um4sSWf+dPjxzn0VzVeuPPZpUG68738ou4J/zkYtYhGaF6a9OuarsW5Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 953e37f4-7855-4e91-0d7f-08dda9a28f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 11:16:21.0778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zegq6GTRH65NjqJOTyQIymeYC9Oz6+DLel9SN0TUnOlMJlJyk9StophwECEQwUiz9tCPMaIGAFy8Pb3IrqdrQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10784

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some of the PCI host bridges require additional processing during the
probe phase. For that they need to access struct bridge of the probed
host, so return pointer to the new bridge from pci_host_common_probe.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
v5->v6:
* no change

v4->v5:
* added Stefano's RB

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
index b7b2dc7832..061d9810af 100644
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

