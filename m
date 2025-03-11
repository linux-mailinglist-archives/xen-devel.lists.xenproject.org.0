Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A668AA5BDC7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:25:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907708.1314905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnL-0004CO-3s; Tue, 11 Mar 2025 10:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907708.1314905; Tue, 11 Mar 2025 10:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnL-0004AG-16; Tue, 11 Mar 2025 10:25:07 +0000
Received: by outflank-mailman (input) for mailman id 907708;
 Tue, 11 Mar 2025 10:25:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFC1=V6=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1trwnJ-0004A4-D9
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:25:05 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20603.outbound.protection.outlook.com
 [2a01:111:f403:2606::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1652e606-fe63-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 11:25:00 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU4PR03MB10646.eurprd03.prod.outlook.com
 (2603:10a6:10:58c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 10:24:56 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 10:24:56 +0000
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
X-Inumbo-ID: 1652e606-fe63-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G63J9+9t6DdihOp+Xuavrce8/X0MSm0NjAoNyI7D+nPLvylgSfNMVqaKf6CLoB1cr7luXUkB6RPglfoGUle/ix1B+Ny+8xe8p7blDldFXuqBCRR+G1chbzuvsHFHBBGc7WowaGQ0m4fXqd4TIpd5+IiixC1sgVoSc9vNlLlTL2RJ6cZaoTAsg1HiIat9EYd6r/FFWAm9vXulZ+5WxY/m5CT/44ETB5RNxH/2tezVMHJNHatc8H62Vf08UUp1XeL5JZuWLPKJ4Ze8nBZDp/Ni5Fwd6Pfmc8Hdz+Z2OiputJIYAiKJULqrPeRBF3C1j1Ik0O2NUtbGry8g975vjfDGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtzJ29r2CkN/VA0see5wRUAAmQGRSSS1z7FUujbClKE=;
 b=JqBVSVkUJTAUoNlW69hVcLxAPP6MuOWzYmw2E4w7HZd8TD8/W4Vz5/bmIP9LvBcTGfRAh+wCDK38LODCfr7GWqrKSSAlvJUIi9FPxe1a1JVpobLUVISxB7AeONAr6/iZwgWN0741qLUPwAuAtL2n5OkzU1Jc33KQ62n2Q+/0Uk6wn2Q90GC2cPtQg33LeKC8dmLf/CSrpbjxGqEtlj5lxiGi03gIxd8D5APyvsF0vNd8+2GGa/QdZJIeLyimp+LfZntibMIJbISk/0ad7iFXLL1y18Se+XmFEt8WsEo4RpFt9GKUmQWljJ2y9In4GzEeJtMq9vkmE3QCMKPLRPTGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtzJ29r2CkN/VA0see5wRUAAmQGRSSS1z7FUujbClKE=;
 b=Hqhq+L3mLX9qaEgJEk2c5C6LCPooVoAAP2FGnSz6H5U9d4+2/JipZUUcNBr/Lwg3ZdDdK/5gG7h1EQejklMVMEe6AOWGNBcU6GrLsR9Drxy+hgKiK9Itjoycpr6M2Pda6xSFt67kviH+O2mifw0ExOfCa45EgpWudpDP2wTDLKouhQwVZce+z5pTOHRMylCYMiQVbVAqGkxZyKIGQQ19qXyCY5VvK4bacBMTIk9m3/RdAiuIMaLxuJQQgvWYuHLvLxdUAj5FznhyUH/aZuwdVw5DphGM4qw22EbK9aeQI6yLLjDFBqie6iUdlZpN6HtHno3Q5eYu6U7Q0HrEh9Izag==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 2/7] xen/arm: make pci_host_common_probe return the bridge
Thread-Topic: [PATCH v2 2/7] xen/arm: make pci_host_common_probe return the
 bridge
Thread-Index: AQHbkm/Vjo6HzaNfH0a1zt7pMvvptA==
Date: Tue, 11 Mar 2025 10:24:55 +0000
Message-ID:
 <a534f2e6b87497b3abd8820178f3ef9979d2ec70.1741596512.git.mykyta_poturai@epam.com>
References: <cover.1741596512.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1741596512.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU4PR03MB10646:EE_
x-ms-office365-filtering-correlation-id: a8191275-57c4-4539-69d1-08dd6086f885
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?OXXcFr48bnDyV7CZjoYIBb5kWktg+oUslvFlJsGYynqvurdkyIp9gZG34J?=
 =?iso-8859-1?Q?nL4i7+PHy2Fm4UXXLdZbaSrCJnu4rMHJk+BOexe0M6NrNGO2glU9bxGlE4?=
 =?iso-8859-1?Q?TD1TsoXq8fRrTd3n0ugBbvx2UNmNBFC65xRNjMvGzE4Ttn/slCCoR/2c1x?=
 =?iso-8859-1?Q?XTDTJzLLB6NW0GBpA3FIOEoc5WtaM07IxVYGWO3TcIxlfh8yqUdV3cMUus?=
 =?iso-8859-1?Q?+HdkyAzC4VyKEIFaZPeVv+avyWWqSMt8T5VjzMzdvfc0QavXdCLbdeYTck?=
 =?iso-8859-1?Q?p7+8YjP4X5aFdQ2W4MEfAW2y+4DIkLVKXjMk4UFtkpMeHzLEzJY8HE4q5R?=
 =?iso-8859-1?Q?7PM9XakfQm1qLM2epYZP81vL9NWe9yDom0Ouom5huGBXN3ESuh5Hnw2nqG?=
 =?iso-8859-1?Q?Xn1s+2g2h+H66ytJuqI/7GEW4KLC2oPQHnl2io/gbKAzrwWwvhi1i3J3mw?=
 =?iso-8859-1?Q?lxM36XbA49aLZYbwutqCy7mgXX7pFy5aKmEjJv8l4Tq+5RGXig5/ZH6Y3o?=
 =?iso-8859-1?Q?0sz88fuz6NwTML3CAihnY9Gq28ebQ85dkaMPwJWsyFv1fWOKaSxeRzr3pa?=
 =?iso-8859-1?Q?W4p6dvrIer7/Q9ZZabL4d8xoJIIlA2KLWRUa4yE0qRc/aTOeDNnkHz4yOx?=
 =?iso-8859-1?Q?406cxskGUn2GtyNFvLdCJLt+mz9sxz57iOXvaslsuECKDFemiSMktQCXk+?=
 =?iso-8859-1?Q?XmSYSFgQNCMokEpFGD/m2ueM4Yiaw6F+nX94ao6Xs3qQKVPoMc5AqtA82h?=
 =?iso-8859-1?Q?YCAhlDRlE//bdPVfnYDDlX8YzEKGMfYIEXXD83bPgODWEF4gCMgo1m24MU?=
 =?iso-8859-1?Q?D+MXxtQKb+0W93b+eyo6/+1otdC2pmtM4vPbE3UZKiMjMp9lJCY11Djol/?=
 =?iso-8859-1?Q?Din3v6i4ugRCC7AmW6h6socYnSg49JQumhFdWfstwqm3R4+JxBMy4EEKmg?=
 =?iso-8859-1?Q?dzo9IJkeqdWI3Y6LBC6p0ZuvUM7Z65e4oI5hr0F0gh52pA87XCXyt6+xzE?=
 =?iso-8859-1?Q?BiLdRx1I4TM2JO+dbsFGGxM3YLdALXqe7hywpfD+6o7c4Jk1fa/xOVkp28?=
 =?iso-8859-1?Q?+1DPxcgPfmvcyqPxO+vpYVx9l2x0SRpGVFbMbw8PvXf+648bzJV+0OT2EP?=
 =?iso-8859-1?Q?ddeCOo8TwTt0MIC8r3LGk1mG+9Z+M8LMEVvQ81N7WyQClUFUfHMabiWysO?=
 =?iso-8859-1?Q?mlB1jXuzuSLBijYH0srqipi3YKWRmHxm4ozOcjLkHUQB9RI5Ag17DCCE47?=
 =?iso-8859-1?Q?yCFO7f1DIDP9Y9cQxx5v7zFQBFbr+iEFvSGtAzPi7/kFiFlJEPFJcCT3CN?=
 =?iso-8859-1?Q?i0Qllplc8TLdEx8bmvEX6PWqX58a2+jBlEGWpv0IMJ8fUwL3RiU8FxdDEg?=
 =?iso-8859-1?Q?jNQmlzM7CyyykhLwvAlakh97T5BJ5KMoMtUZ6s2D64LuwCzdfliaIZIcJb?=
 =?iso-8859-1?Q?Ohk4V3ik5xgm/hx3/RcQ+QlhS6lgd0OPHJ+Lkx/6ita7wO+Ri/dT3Ct/nQ?=
 =?iso-8859-1?Q?6qx4K1PD6jyIwnsNLMvPgT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fflOVtU1jj6OE08Vzxt4gOQPHB15FFP3G3wPt+ohFwPzVD+5GJN14Fqpe6?=
 =?iso-8859-1?Q?0x0o3GHZzooZnklyxdEWyZcs7WWN1aYm7H+nwUrVTccyVuTeegdNJ5StiI?=
 =?iso-8859-1?Q?r2XQB/dx5E8IvU1yzI1zHsMN6CMQ7s5ZA5EblciaOYcGBNVlC127jLpc8a?=
 =?iso-8859-1?Q?haIJQA1N9wQPiuSfZ3peoox8crwIYxyRPfzHH7EpGGZzc27+jT0IZMbM0o?=
 =?iso-8859-1?Q?4TsKhkMX/zMUufqthPLVXenYK2DB6z1GljWIsQyfjo2dGETAqLc24Evx9a?=
 =?iso-8859-1?Q?hQE0WsdMpD+rfmqVour5OIRxswhiS7sDxljueLY7nxxIB3F+AwptwFVGAG?=
 =?iso-8859-1?Q?OkWNMwnhaN3DlrREVYn15Bts6mJ4cGv7eNrTlaab6MqjGsckMqftBg5m/i?=
 =?iso-8859-1?Q?sDSPP+n4l/YKAsZtZ9MBjXFDmeIbdCxjSQ145bI+AgGFCrhxh9suTbjOeT?=
 =?iso-8859-1?Q?zkvnMxf66P144l3fBYJemFecgSzaNj4gDllNNQYnK0DjverYUsLOodQBnC?=
 =?iso-8859-1?Q?shJJHRuBCqAWo1qi+yVowwgIWbV/nIomU2+XZJFO2c6M2EA9tNvjJqawqk?=
 =?iso-8859-1?Q?y5MRmPkKSvJwf/uxz9uGzGLwS7o+JCQQhi1LAVqGD6N/YpuwQ6StORn8cD?=
 =?iso-8859-1?Q?ajm2BQ6aN+2IkVDF6niiFMbmIMJ5rcSmC+xV5T3MarOQQ55V7QgJ3PPzow?=
 =?iso-8859-1?Q?sUiRPS69x4u3Sacfe8Eisvpx6AojRKdXIIjTZX0qK3TiWtGDIMserMw9Js?=
 =?iso-8859-1?Q?VL3kSmQeQMU/LCNYBYgWEiRX+10rT5111wkaytjAAo9XhrsPe9So1i65WX?=
 =?iso-8859-1?Q?FgjnYM7rlXEM5kQMBLO5egVOqp3uK1+9wwWcsCMHgvuJyq79iadW/zwS09?=
 =?iso-8859-1?Q?FuW30bBE7CGVX/Veb554yChHIRhI3TgNytYb2WcI70iuKhHirDftP0i7Ho?=
 =?iso-8859-1?Q?d+I0T6MhmuZjJNpdHctytiRn9pYA0pI9XGICvpYRrtgQb5FKSKziGcdFHH?=
 =?iso-8859-1?Q?+6U9SkHRWZm/Orx1l2PcLT7WwvLycKkMxSlx2B8rq07XY+hL95Qnsyx01j?=
 =?iso-8859-1?Q?ebZG5Mo8ALzAB+javDaHspCKovW0oseV3iOujngNQWGrSfX/aKdYcsM3X1?=
 =?iso-8859-1?Q?09fBH9rwPMojrnsn+PiShKPvq2Q5TYtBAiG+IAyK5I986qbgApn6Yx+AmN?=
 =?iso-8859-1?Q?uy/zpFB7848Ve584p7dp6lPbl43dbcs0/up+3XuauQeEGVacB4tBjgOUOx?=
 =?iso-8859-1?Q?dDYemMOhmequt2ZLfXQjpmAGjORrF76vqqNTNhuWXwy7hvMxmtPVFzsgS3?=
 =?iso-8859-1?Q?VcWnZebqyx6wVrxkRDbUDX2dfJsPsSETZOM4E/6Z1lyXsfBC40w8yxdGq9?=
 =?iso-8859-1?Q?T7P9XF58mqUZJbhNVQkmlU84A0nf+QkuxTcPOkOyAO32AXx8mXVJwmzzq+?=
 =?iso-8859-1?Q?JlL05cHmLwzgKNs91x0ssZ4RiYSxvZTnFDtMG5UzyqlFA9I9UkkpRh2nfR?=
 =?iso-8859-1?Q?IsFeGxH5Ak4tdK6w+HXYoOVTofFpC3YHA4OAYu7bVqojazvsVNCDBxEtwk?=
 =?iso-8859-1?Q?2Zlkn48IqPI8YHtBOS7jQCQFAljY2N2h+lf16irjyIDJ/yLBd0cGFwfjRm?=
 =?iso-8859-1?Q?GmrANy/TjsX3xRqtYS9+cBInQOiQ7QfjtMA5ham14rOLOvHIsQwPeurQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8191275-57c4-4539-69d1-08dd6086f885
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 10:24:55.8291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fhp1KUU9SZajaVQ+MFZ+uGJ/H/5x8PvoVL9WVaaYJkMFZ6ucElyU4MXWUc46lluRJmwWBYfuqYByMcnQKd+05Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10646

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some of the PCI host bridges require additional processing during the
probe phase. For that they need to access struct bridge of the probed
host, so return pointer to the new bridge from pci_host_common_probe.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* no change
---
 xen/arch/arm/include/asm/pci.h      |  8 +++++---
 xen/arch/arm/pci/pci-host-common.c  | 12 ++++++------
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 44344ac8c1..e1f63d75e3 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -17,6 +17,8 @@
=20
 #ifdef CONFIG_HAS_PCI
=20
+#include <xen/err.h>
+
 #include <asm/p2m.h>
=20
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
@@ -95,9 +97,9 @@ struct pci_ecam_ops {
 /* Default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
=20
-int pci_host_common_probe(struct dt_device_node *dev,
-                          const struct pci_ecam_ops *ops,
-                          size_t priv_sz);
+struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
+                                              const struct pci_ecam_ops *o=
ps,
+                                              size_t priv_sz);
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value);
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index be7e6c3510..e4e05d1176 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -208,9 +208,9 @@ static int pci_bus_find_domain_nr(struct dt_device_node=
 *dev)
     return domain;
 }
=20
-int pci_host_common_probe(struct dt_device_node *dev,
-                          const struct pci_ecam_ops *ops,
-                          size_t priv_sz)
+struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
+                                              const struct pci_ecam_ops *o=
ps,
+                                              size_t priv_sz)
 {
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
@@ -222,7 +222,7 @@ int pci_host_common_probe(struct dt_device_node *dev,
=20
     bridge =3D pci_alloc_host_bridge();
     if ( !bridge )
-        return -ENOMEM;
+        return ERR_PTR(-ENOMEM);
=20
     /* Parse and map our Configuration Space windows */
     cfg =3D gen_pci_init(dev, ops);
@@ -257,7 +257,7 @@ int pci_host_common_probe(struct dt_device_node *dev,
=20
     pci_add_host_bridge(bridge);
=20
-    return 0;
+    return bridge;
=20
 err_priv:
     xfree(bridge->priv);
@@ -265,7 +265,7 @@ err_priv:
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
index cc4bc70684..dde6a79a8e 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pc=
i_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return pci_host_common_probe(dev, &pci_generic_ecam_ops, 0);
+    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops, 0));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host=
-zynqmp.c
index 985a43c516..c796447ac4 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pc=
ie_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return pci_host_common_probe(dev, &nwl_pcie_ops, 0);
+    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops, 0));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
--=20
2.34.1

