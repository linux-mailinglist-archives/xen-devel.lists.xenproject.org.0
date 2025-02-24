Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D6DA4189D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 10:19:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894978.1303601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbf-0004K8-9s; Mon, 24 Feb 2025 09:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894978.1303601; Mon, 24 Feb 2025 09:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbf-0004Hw-5S; Mon, 24 Feb 2025 09:18:31 +0000
Received: by outflank-mailman (input) for mailman id 894978;
 Mon, 24 Feb 2025 09:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vb1z=VP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tmUbd-0003pb-7K
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 09:18:29 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f403:260d::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ec72298-f290-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 10:18:28 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8859.eurprd03.prod.outlook.com
 (2603:10a6:20b:56f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 09:18:25 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 09:18:25 +0000
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
X-Inumbo-ID: 4ec72298-f290-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRyHYSypBSLR9j1ELa59f0k5ebczB4IDkRPe4t26s4SdwLxwl8LWhIoeNxtWU9P3OTC8pAx3Mp0wfD8VnpNzv2GVpUhNizrhWQz2TpaHb5EwnPMqOA1jV1dAmYI37w8tg8oXqVFQ1mYZHaE0gbx8TZH6K6YLkbD8PSXKCw4Z72q43b4k9bZv4JfOha4vDu1YrtrDoGSP1MwV5Vjrlu58Cy40BwjKbLwSs10F2ZtUCLtJM0NpTbB6bBGE2HEfIb+VpNX3rCmTLUePbw3AZ57KB61OkXeeAH27fLUaCpshfmAjFZYLWrBimMbyCHJ50XGkyX3cnjOFzJcb2kHXWEBMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fC2pKV6Knn2B6+xxOok9PcE5unrt7qlO9zl/Phe/vsk=;
 b=qHU+q2ZJwbwyiJ3NDMCiyBohHJG6ap8USGDuxrf2al2qs3g34xpf0GEaWKE7HMPCK1A/ToRM/aZzZq3wpBHHBp1cO9LJ7oLx5hteKeq+7k3HMWKBvH7acrPXXCzN8tB7eSl1+bwp8mTYfvOFOkDMsvEKQLWv64wdWMyITkgV1X91PBb/uZXomxanu2f8q2Tglti/w8BJacfiv0HQHcB424af1ULBpH9k8A7+IDVw6TVw+9AykkIzdd1zDhOimVhxOUhYrekxh4epPekgB6/Q7hqm7q8PxZeP2Ke3ynK9Df62jc+sl45bFm20unkk8Y3yq8HiOsMVtkMiXLFR9wMGUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fC2pKV6Knn2B6+xxOok9PcE5unrt7qlO9zl/Phe/vsk=;
 b=iUEqzOOBFiGYsozQK1nW3oOGHPXjZzdwUabeds5Wwot4AhKHUyMk/ExuiyENXCsEf9M0EbFRty1t37hqjGFWKjAuml2Sh6Lt54Gq0dFvdBMz0nuKAIjl40ylSPtIxVYUvz+i3NrF23pMowXCSr56ZlAlw0Um+zIFx9xgbgiXGLw4rnxmVzrTF4jbUzblaP17X2Mfz5LIjXypp1UIaI7hh7pccfTv9lWCWe6qNN0menq9lijkJb+7w0ZyaO6/s7BCsm6hQocrqX0HkLIN84WoTMeBV+KSlZw0VMfMkRHskTH2m4QZrDYiVvFY2j+wSobBk8eVx4JOLwb1YrtznrO4bw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH 3/7] xen/arm: add support for PCI child bus
Thread-Topic: [PATCH 3/7] xen/arm: add support for PCI child bus
Thread-Index: AQHbhp0OxLzto7VX00+joODTbNcGbw==
Date: Mon, 24 Feb 2025 09:18:25 +0000
Message-ID:
 <c6706d49eaf5e2cab29c47c346b5cb8cda20a943.1740382735.git.mykyta_poturai@epam.com>
References: <cover.1740382735.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1740382735.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8859:EE_
x-ms-office365-filtering-correlation-id: eb8219a2-3ecf-47a4-c2e0-08dd54b43112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Kfji/g30rB6MQ7+4rMf+a44BLbxM8hDq+3mINog32do68sT/ho4hwFmqrE?=
 =?iso-8859-1?Q?nt1aWY0r0PqfV/gfN97dYexm28DrCs+ZpIgafVPZZhmwReONWL788eD8PN?=
 =?iso-8859-1?Q?X9kziGNtp9/9+RvIhI9BaYctDIMRAp53HoN3Ug7sjkj/oj9BKHf5XGovUq?=
 =?iso-8859-1?Q?lcVbyVK07H0Hc2IqZOL7lGyrEYcCKehxmS+hGYGOS4rjyPaRgDhVgwQ3MH?=
 =?iso-8859-1?Q?Y5p/KpiAVN7dP9QDmWso4dAWqzCjoN91C1JK4UKzJUMo9F0I3rQQJQAMKE?=
 =?iso-8859-1?Q?nnw75lASFcDimOHYtwukwJLu76UWz4F3zu2XpyMCRXcyvRxsx1xYs9Oq1j?=
 =?iso-8859-1?Q?CYmXQez5etv7ojzWN0DUDBXDE+7CoLtM9JQqs17xQ6m+keO3UPvTsovkkX?=
 =?iso-8859-1?Q?S+1YjM5RqGneiZshpqd0kdVdJ/DRDone1wIK/EWD+U8DjhUsqJGUTLQMCX?=
 =?iso-8859-1?Q?Pj5/g/24WqG2lyf6mfib/S2rOWgxn5fA6+f0k2o7d6nJkblqLKxx79YzSQ?=
 =?iso-8859-1?Q?yUhsPi4MfGBbSLIXq9dyOsLmqTmwSFYCFQ9be5fQMvWqcBZjwxgtEcFOkJ?=
 =?iso-8859-1?Q?XlT5yF1vnyuh1jCVSvsLa3nknA96hnLJnGtdtE6HoepZijeov7LGEVxIiF?=
 =?iso-8859-1?Q?L+cW8rv91n38xwf1z7+8j6oDd/2DQi55w96SgZF2rPyVXd3R4TqdnQwbRX?=
 =?iso-8859-1?Q?nBjT+PHbRlqCHfmikNPXIN3G+XJkwPOO7IbG/8ma68LL4X15BEsapHyrXO?=
 =?iso-8859-1?Q?sB0f/TCHMqgfv6q6AMzhrYxigvj4/Ieqvk83e5IJEMmHMZQPeIfQWPzUmb?=
 =?iso-8859-1?Q?0ibDE8hJs9oCJzhSFBe8BjaJ1v3uTHWBMOWVOrskZYKG1351+jCqXrd3sr?=
 =?iso-8859-1?Q?Mv4V6AMgys9qTwFepstnkT9n2Su7RgaZEHrqFWbZ58mzJwpO6Q3gEk3t2t?=
 =?iso-8859-1?Q?ph4Y46RQ/SKf/olzUpEPTbQZVl308U1uqpLcZd7my5upFVT/aVNx37KKp4?=
 =?iso-8859-1?Q?6mWiOh2d5zyNA2zDZFKvCijdZlZiytDjLKxmoD8Ib2/xxhKcRsxVQX05x3?=
 =?iso-8859-1?Q?0JBT79Aa9sGxAMy478/Pk/7lJ0DNYQl1zyVronC+ywuDORP+QLoL3UXcNB?=
 =?iso-8859-1?Q?O2mmiVmLxP7grFTrrYLKfyFxnBfA21s8JgB7bvdDOvQJsdAkx/ile16al0?=
 =?iso-8859-1?Q?cR+I0/PZQBeM3eJDH1uZS7kWAG72lJuelrf4ZYnwm12rPG8Y01F8/gsMPJ?=
 =?iso-8859-1?Q?3W37hpoaSzRkJtfrH3jYB6vVhp26BihyS/A9YtPtO83vqUP2VioiJ1vi1F?=
 =?iso-8859-1?Q?5CMxKVUyd79ucXtiplap7gpoi4egn6lzzH+QGM7GnSuoetOqU4OEpV35yW?=
 =?iso-8859-1?Q?sUv3GMG5a6lD60ImWPWbkwKMkzPkMZLMvyWXts3wd30tqCFOliisGA0mzU?=
 =?iso-8859-1?Q?NFMgnRw4cLDzgICA6vq0Jh7LatMoUPFPI5Z/fg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Q4fGGAqvqEomoJ8O4Hvti5PlZP9HrR4++KZjCzve+29nRd/itM9UVef5BZ?=
 =?iso-8859-1?Q?bh6acr1md63K6ywUA3pxtbLiLyjQoUeVyl5CPRD2L//TNyaxtQJXsP+RXb?=
 =?iso-8859-1?Q?yjcW+k7yk4WHkcVoMmcXCEb8Ocu2YQX/wINdeHfDt/C53l5/ftziaZD1Ug?=
 =?iso-8859-1?Q?vSnaKVfucKkFfxtodlgZA/0CogbCHvlhAP05c9R8wa433tkVLQstEBTdch?=
 =?iso-8859-1?Q?pHkEJ56BBS/iC/EAHzqLpKsCaCTtQXHvabmlzMC/1kOAolNe+tLM2QCMUD?=
 =?iso-8859-1?Q?921axQVX/GvMBvEjqS2pCiA/rDt9PSD9OanxSlADoZmudq4VnHv0RaBm5p?=
 =?iso-8859-1?Q?MDZFrV23ZfPo4veompBenAd+WX1NAtgHU2+68sQkv45kgKO3EEHpfQJTUg?=
 =?iso-8859-1?Q?jW6nPqdr2dJzKPV7zIlAk93baMRIP0wqniKCkjcMesuXQKobXB9/MjAyTB?=
 =?iso-8859-1?Q?lDC6kseoXW5r6rTIS95V9ypyJYh8cfGzr8rMHM4uu4aNKMUp7k7xzskjP4?=
 =?iso-8859-1?Q?/q12inyo3kg7St+vwN/DWT8j78tB6dUXIUciNdtBgZDVkxJrSCWlgkOpjg?=
 =?iso-8859-1?Q?xps9GYk23KRJ2+mmMmR49l5QtO5LlLBng5ToGjEytCryz+jfHoeL2tHig7?=
 =?iso-8859-1?Q?diY+06XKWNbU0a4OkW/wwFmIq6RI0ZivUV8zi1IImJzkMUM7Agz8dmv+k5?=
 =?iso-8859-1?Q?HAeJfw93hdKCdmJ/dHbq0HeeFjXclj4jJcWEUnF7rzs9TlAQCbWBY77NeQ?=
 =?iso-8859-1?Q?Mdj7dmTF9JvrjQGJUU930ghftrNwmDuzAg/9Bg0+b1EpPAns8yuh9y45Gs?=
 =?iso-8859-1?Q?I+FTvGprr5XIU/lpqhRQpikOx8i11DNchc8P5XJcrJiBB71vbea5RAzsXj?=
 =?iso-8859-1?Q?ow/bM9WfMKFGEvNkrRHeETb2XI17q68QTtWcKCOuzfs9n/SDRXFKsvgDJe?=
 =?iso-8859-1?Q?JKFOgy6BIIOWqjAsb5WaQhq7/bx3C/b3ENxXhi0ukCjeIJ9LhDAreYV9bR?=
 =?iso-8859-1?Q?MiEQfaPQEH6Sa9qNvbxf8XwCs9LGn8QrkdLZLOlrqwWsb2+Pnk4a/V3PVC?=
 =?iso-8859-1?Q?SWlWB76qDuUide+zR0QXn27vh1cYQg5oEQsIQV/d/xfWx3bTnfaFYkgtZe?=
 =?iso-8859-1?Q?tqgTW3ByfymeBjNS2Zi5JR8yK4WZcZGtNedPww5UV6E8G01BdwdQVyS/tl?=
 =?iso-8859-1?Q?bUcifKHOjFdZm6RmgLdGUpNDIHmGUjnohV1wJe2CtOi/f1vPEeZ65FnVkT?=
 =?iso-8859-1?Q?7foODF1to1ggzCr4E26heX48X1V8YuUavLRA2R6A/MWSoWtSoVnND3AhHF?=
 =?iso-8859-1?Q?06ifUZwG2qaaFlrKE2Y82aOEJlsaJQeLkFRBy/W+fhoEP1Nyxtrzq1jSMv?=
 =?iso-8859-1?Q?mEVI4J9RdU54kwGUZXeHGO3ZfzZyQM3vwAAtyo42CBn5KRKcKU3eDWQv03?=
 =?iso-8859-1?Q?r+S79HOVV3UCz3UseTW+3RQOG+rjMukX1yuZmEmGZTxrWsocuzyUn7uyvU?=
 =?iso-8859-1?Q?5xm4wValcu/mTkJuuw61Jo5dyzbClWG7pck2LXeI6rdsX+uxrVYZTQQMru?=
 =?iso-8859-1?Q?uARF/A2WwVRnNGGNBfnCkyHqG2rQXRj/frN66T7U4FlwRaOEyMRsDaOKrp?=
 =?iso-8859-1?Q?8VkE0w/J+Q3j1GGvR/SduzelBUkXpQEaJMSwKv/PEtdrCbJuEcfhaIRA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8219a2-3ecf-47a4-c2e0-08dd54b43112
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 09:18:25.0273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e2VJMz00H2MbPRQ53I4TNRoOnRL9ITS6rHGQ13t3dmwLmjXS+UFrPAi524qspd8aprBcthaVPit/5u3PVp6RCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8859

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

PCI host bridges often have different ways to access the root and child
bus configuration spaces. One of the examples is Designware's host bridge
and its multiple clones [1].

Linux kernel implements this by instantiating a child bus when device
drivers provide not only the usual pci_ops to access ECAM space (this is
the case for the generic host bridge), but also means to access the child
bus which has a dedicated configuration space and own implementation for
accessing the bus, e.g. child_ops.

For Xen it is not feasible to fully implement PCI bus infrastructure as
Linux kernel does, but still child bus can be supported.

Add support for the PCI child bus which includes the following changes:
- introduce bus mapping functions depending on SBDF
- assign bus start and end for the child bus and re-configure the same for
  the parent (root) bus
- make pci_find_host_bridge be aware of multiple busses behind the same bri=
dge
- update pci_host_bridge_mappings, so it also doesn't map to guest the memo=
ry
  spaces belonging to the child bus
- make pci_host_common_probe accept one more pci_ops structure for the chil=
d bus
- install MMIO handlers for the child bus
- re-work vpci_mmio_{write|read} with parent and child approach in mind

[1] https://elixir.bootlin.com/linux/v5.15/source/drivers/pci/controller/dw=
c

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/pci.h      | 14 ++++-
 xen/arch/arm/pci/ecam.c             | 17 ++++--
 xen/arch/arm/pci/pci-access.c       | 37 ++++++++++--
 xen/arch/arm/pci/pci-host-common.c  | 86 +++++++++++++++++++++------
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
 xen/arch/arm/vpci.c                 | 91 ++++++++++++++++++++++++-----
 7 files changed, 200 insertions(+), 49 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index e1f63d75e3..0012c2ae9e 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -69,6 +69,9 @@ struct pci_host_bridge {
     struct pci_config_window* cfg;   /* Pointer to the bridge config windo=
w */
     const struct pci_ops *ops;
     void *priv;                      /* Private data of the bridge. */
+    /* Child bus */
+    struct pci_config_window* child_cfg;
+    const struct pci_ops *child_ops;
 };
=20
 struct pci_ops {
@@ -97,15 +100,20 @@ struct pci_ecam_ops {
 /* Default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
=20
-struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
-                                              const struct pci_ecam_ops *o=
ps,
-                                              size_t priv_sz);
+struct pci_host_bridge *
+pci_host_common_probe(struct dt_device_node *dev,
+                      const struct pci_ecam_ops *ops,
+                      const struct pci_ecam_ops *child_ops,
+                      size_t priv_sz);
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value);
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
                              uint32_t reg, uint32_t len, uint32_t value);
 void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
                                pci_sbdf_t sbdf, uint32_t where);
+void __iomem *pci_ecam_map_bus_generic(const struct pci_config_window *cfg=
,
+                                       const struct pci_ecam_ops *ops,
+                                       pci_sbdf_t sbdf, uint32_t where);
 bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
                                      struct pci_host_bridge *bridge,
                                      uint64_t addr);
diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
index 3987f96b01..5486881c5c 100644
--- a/xen/arch/arm/pci/ecam.c
+++ b/xen/arch/arm/pci/ecam.c
@@ -20,12 +20,10 @@
 /*
  * Function to implement the pci_ops->map_bus method.
  */
-void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
-                               pci_sbdf_t sbdf, uint32_t where)
+void __iomem *pci_ecam_map_bus_generic(const struct pci_config_window *cfg=
,
+                                       const struct pci_ecam_ops *ops,
+                                       pci_sbdf_t sbdf, uint32_t where)
 {
-    const struct pci_config_window *cfg =3D bridge->cfg;
-    const struct pci_ecam_ops *ops =3D
-        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
     unsigned int devfn_shift =3D ops->bus_shift - 8;
     void __iomem *base;
     unsigned int busn =3D sbdf.bus;
@@ -39,6 +37,15 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *b=
ridge,
     return base + (sbdf.devfn << devfn_shift) + where;
 }
=20
+void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
+                               pci_sbdf_t sbdf, uint32_t where)
+{
+    const struct pci_ecam_ops *ops =3D
+        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
+
+    return pci_ecam_map_bus_generic(bridge->cfg, ops, sbdf, where);
+}
+
 bool __init pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
                                             struct pci_host_bridge *bridge=
,
                                             uint64_t addr)
diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index 9f9aac43d7..4da607ac3f 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -18,10 +18,31 @@
 #define INVALID_VALUE (~0U)
 #define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
=20
+static const struct pci_ops *get_ops(struct pci_host_bridge *bridge,
+                                     pci_sbdf_t sbdf)
+{
+    if ( bridge->child_ops )
+    {
+        struct pci_config_window* cfg =3D bridge->child_cfg;
+
+        if ( (sbdf.bus >=3D cfg->busn_start) && (sbdf.bus <=3D cfg->busn_e=
nd) )
+            return bridge->child_ops;
+    }
+    return bridge->ops;
+}
+
+static void __iomem *map_bus(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
+                            uint32_t reg)
+{
+    const struct pci_ops *ops =3D get_ops(bridge, sbdf);
+
+    return ops->map_bus(bridge, sbdf, reg);
+}
+
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value)
 {
-    void __iomem *addr =3D bridge->ops->map_bus(bridge, sbdf, reg);
+    void __iomem *addr =3D map_bus(bridge, sbdf, reg);
=20
     if ( !addr )
     {
@@ -50,7 +71,7 @@ int pci_generic_config_read(struct pci_host_bridge *bridg=
e, pci_sbdf_t sbdf,
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
                              uint32_t reg, uint32_t len, uint32_t value)
 {
-    void __iomem *addr =3D bridge->ops->map_bus(bridge, sbdf, reg);
+    void __iomem *addr =3D map_bus(bridge, sbdf, reg);
=20
     if ( !addr )
         return -ENODEV;
@@ -78,14 +99,16 @@ static uint32_t pci_config_read(pci_sbdf_t sbdf, unsign=
ed int reg,
 {
     uint32_t val =3D PCI_ERR_VALUE(len);
     struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, sbdf=
.bus);
+    const struct pci_ops *ops;
=20
     if ( unlikely(!bridge) )
         return val;
=20
-    if ( unlikely(!bridge->ops->read) )
+    ops =3D get_ops(bridge, sbdf);
+    if ( unlikely(!ops->read) )
         return val;
=20
-    bridge->ops->read(bridge, sbdf, reg, len, &val);
+    ops->read(bridge, sbdf, reg, len, &val);
=20
     return val;
 }
@@ -94,14 +117,16 @@ static void pci_config_write(pci_sbdf_t sbdf, unsigned=
 int reg,
                              unsigned int len, uint32_t val)
 {
     struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, sbdf=
.bus);
+    const struct pci_ops *ops;
=20
     if ( unlikely(!bridge) )
         return;
=20
-    if ( unlikely(!bridge->ops->write) )
+    ops =3D get_ops(bridge, sbdf);
+    if ( unlikely(!ops->write) )
         return;
=20
-    bridge->ops->write(bridge, sbdf, reg, len, val);
+    ops->write(bridge, sbdf, reg, len, val);
 }
=20
 /*
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index e4e05d1176..3824146561 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -57,17 +57,12 @@ static void pci_ecam_free(struct pci_config_window *cfg=
)
     xfree(cfg);
 }
=20
-static struct pci_config_window * __init
-gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
+static void __init gen_pci_init_bus_range(struct dt_device_node *dev,
+                                          struct pci_host_bridge *bridge,
+                                          struct pci_config_window *cfg)
 {
-    int err, cfg_reg_idx;
     u32 bus_range[2];
-    paddr_t addr, size;
-    struct pci_config_window *cfg;
-
-    cfg =3D xzalloc(struct pci_config_window);
-    if ( !cfg )
-        return NULL;
+    int err;
=20
     err =3D dt_property_read_u32_array(dev, "bus-range", bus_range,
                                      ARRAY_SIZE(bus_range));
@@ -82,6 +77,36 @@ gen_pci_init(struct dt_device_node *dev, const struct pc=
i_ecam_ops *ops)
         if ( cfg->busn_end > cfg->busn_start + 0xff )
             cfg->busn_end =3D cfg->busn_start + 0xff;
     }
+}
+
+static void __init gen_pci_init_bus_range_child(struct dt_device_node *dev=
,
+                                                struct pci_host_bridge *br=
idge,
+                                                struct pci_config_window *=
cfg)
+{
+    cfg->busn_start =3D bridge->cfg->busn_start + 1;
+    cfg->busn_end =3D bridge->cfg->busn_end;
+    bridge->cfg->busn_end =3D bridge->cfg->busn_start;
+
+    printk(XENLOG_INFO "Root bus end updated: [bus %x-%x]\n",
+           bridge->cfg->busn_start, bridge->cfg->busn_end);
+}
+
+static struct pci_config_window * __init
+gen_pci_init(struct dt_device_node *dev, struct pci_host_bridge *bridge,
+             const struct pci_ecam_ops *ops,
+             void (*init_bus_range)(struct dt_device_node *dev,
+                                    struct pci_host_bridge *bridge,
+                                    struct pci_config_window *cfg))
+{
+    int err, cfg_reg_idx;
+    paddr_t addr, size;
+    struct pci_config_window *cfg;
+
+    cfg =3D xzalloc(struct pci_config_window);
+    if ( !cfg )
+        return NULL;
+
+    init_bus_range(dev, bridge, cfg);
=20
     if ( ops->cfg_reg_index )
     {
@@ -208,9 +233,11 @@ static int pci_bus_find_domain_nr(struct dt_device_nod=
e *dev)
     return domain;
 }
=20
-struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
-                                              const struct pci_ecam_ops *o=
ps,
-                                              size_t priv_sz)
+struct pci_host_bridge *
+pci_host_common_probe(struct dt_device_node *dev,
+                      const struct pci_ecam_ops *ops,
+                      const struct pci_ecam_ops *child_ops,
+                      size_t priv_sz)
 {
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
@@ -225,7 +252,7 @@ struct pci_host_bridge *pci_host_common_probe(struct dt=
_device_node *dev,
         return ERR_PTR(-ENOMEM);
=20
     /* Parse and map our Configuration Space windows */
-    cfg =3D gen_pci_init(dev, ops);
+    cfg =3D gen_pci_init(dev, bridge, ops, gen_pci_init_bus_range);
     if ( !cfg )
     {
         err =3D -ENOMEM;
@@ -245,6 +272,21 @@ struct pci_host_bridge *pci_host_common_probe(struct d=
t_device_node *dev,
=20
     bridge->segment =3D domain;
=20
+    if ( child_ops )
+    {
+        /* Parse and map child's Configuration Space windows */
+        cfg =3D gen_pci_init(dev, bridge, child_ops,
+                           gen_pci_init_bus_range_child);
+        if ( !cfg )
+        {
+            err =3D -ENOMEM;
+            goto err_child;
+        }
+
+        bridge->child_cfg =3D cfg;
+        bridge->child_ops =3D &child_ops->pci_ops;
+    }
+
     if ( priv_sz )
     {
         bridge->priv =3D xzalloc_bytes(priv_sz);
@@ -262,6 +304,9 @@ struct pci_host_bridge *pci_host_common_probe(struct dt=
_device_node *dev,
 err_priv:
     xfree(bridge->priv);
=20
+err_child:
+    xfree(bridge->cfg);
+
 err_exit:
     xfree(bridge);
=20
@@ -296,9 +341,11 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t =
segment, uint8_t bus)
     {
         if ( bridge->segment !=3D segment )
             continue;
-        if ( (bus < bridge->cfg->busn_start) || (bus > bridge->cfg->busn_e=
nd) )
-            continue;
-        return bridge;
+        if ( bridge->child_cfg && (bus >=3D bridge->child_cfg->busn_start)=
 &&
+             (bus <=3D bridge->child_cfg->busn_end) )
+             return bridge;
+        if ( (bus >=3D bridge->cfg->busn_start) && (bus <=3D bridge->cfg->=
busn_end) )
+             return bridge;
     }
=20
     return NULL;
@@ -364,6 +411,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
     {
         const struct dt_device_node *dev =3D bridge->dt_node;
         unsigned int i;
+        bool need_mapping;
=20
         for ( i =3D 0; i < dt_number_of_address(dev); i++ )
         {
@@ -379,7 +427,11 @@ int __init pci_host_bridge_mappings(struct domain *d)
                 return err;
             }
=20
-            if ( bridge->ops->need_p2m_hwdom_mapping(d, bridge, addr) )
+            need_mapping =3D bridge->ops->need_p2m_hwdom_mapping(d, bridge=
, addr);
+            if ( need_mapping && bridge->child_ops )
+                  need_mapping =3D bridge->child_ops->
+                      need_p2m_hwdom_mapping(d, bridge, addr);
+            if ( need_mapping )
             {
                 err =3D map_range_to_domain(dev, addr, size, &mr_data);
                 if ( err )
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-hos=
t-generic.c
index dde6a79a8e..08d94879b7 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pc=
i_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops, 0));
+    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops, NULL,=
 0));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host=
-zynqmp.c
index c796447ac4..0b51ff6bd9 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pc=
ie_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops, 0));
+    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops, NULL, 0));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index b63a356bb4..05af4ef390 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -8,15 +8,17 @@
 #include <asm/mmio.h>
=20
 static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
-                                     paddr_t gpa)
+                                     paddr_t gpa, bool use_root)
 {
     pci_sbdf_t sbdf;
=20
     if ( bridge )
     {
-        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
+        const struct pci_config_window *cfg =3D use_root ? bridge->cfg :
+                                                         bridge->child_cfg=
;
+        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - cfg->phys_addr);
         sbdf.seg =3D bridge->segment;
-        sbdf.bus +=3D bridge->cfg->busn_start;
+        sbdf.bus +=3D cfg->busn_start;
     }
     else
         sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
@@ -24,11 +26,9 @@ static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_ho=
st_bridge *bridge,
     return sbdf;
 }
=20
-static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
-                          register_t *r, void *p)
+static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info, register_t *r=
,
+                          pci_sbdf_t sbdf)
 {
-    struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
     const unsigned int access_size =3D (1U << info->dabt.size) * 8;
     const register_t invalid =3D GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
@@ -46,31 +46,86 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *=
info,
     return 0;
 }
=20
-static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
-                           register_t r, void *p)
+static int vpci_mmio_read_root(struct vcpu *v, mmio_info_t *info,
+                          register_t *r, void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, true);
+
+    return vpci_mmio_read(v, info, r, sbdf);
+}
+
+static int vpci_mmio_read_child(struct vcpu *v, mmio_info_t *info,
+                          register_t *r, void *p)
 {
     struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, false);
=20
+    return vpci_mmio_read(v, info, r, sbdf);
+}
+
+static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
+                           register_t r, pci_sbdf_t sbdf)
+{
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
 }
=20
+static int vpci_mmio_write_root(struct vcpu *v, mmio_info_t *info,
+                                register_t r, void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf;
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa,
+                             true, &sbdf) )
+        return 0;
+
+    return vpci_mmio_write(v, info, r, sbdf);
+}
+
+static int vpci_mmio_write_child(struct vcpu *v, mmio_info_t *info,
+                                register_t r, void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf;
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa,
+                             false, &sbdf) )
+        return 0;
+
+    return vpci_mmio_write(v, info, r, sbdf);
+}
+
 static const struct mmio_handler_ops vpci_mmio_handler =3D {
-    .read  =3D vpci_mmio_read,
-    .write =3D vpci_mmio_write,
+    .read  =3D vpci_mmio_read_root,
+    .write =3D vpci_mmio_write_root,
+};
+
+static const struct mmio_handler_ops vpci_mmio_handler_child =3D {
+    .read  =3D vpci_mmio_read_child,
+    .write =3D vpci_mmio_write_child,
 };
=20
 static int vpci_setup_mmio_handler_cb(struct domain *d,
                                       struct pci_host_bridge *bridge)
 {
     struct pci_config_window *cfg =3D bridge->cfg;
+    int count =3D 1;
=20
     register_mmio_handler(d, &vpci_mmio_handler,
                           cfg->phys_addr, cfg->size, bridge);
=20
-    /* We have registered a single MMIO handler. */
-    return 1;
+    if ( bridge->child_ops )
+    {
+        struct pci_config_window *cfg =3D bridge->child_cfg;
+
+        register_mmio_handler(d, &vpci_mmio_handler_child,
+                              cfg->phys_addr, cfg->size, bridge);
+        count++;
+    }
+
+    return count;
 }
=20
 int domain_vpci_init(struct domain *d)
@@ -101,8 +156,12 @@ int domain_vpci_init(struct domain *d)
 static int vpci_get_num_handlers_cb(struct domain *d,
                                     struct pci_host_bridge *bridge)
 {
-    /* Each bridge has a single MMIO handler for the configuration space. =
*/
-    return 1;
+    int count =3D 1;
+
+    if ( bridge->child_cfg )
+        count++;
+
+    return count;
 }
=20
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
--=20
2.34.1

