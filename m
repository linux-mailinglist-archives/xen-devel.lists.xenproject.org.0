Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62307B2DC68
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 14:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087381.1445467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uohvR-0003qh-97; Wed, 20 Aug 2025 12:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087381.1445467; Wed, 20 Aug 2025 12:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uohvR-0003ne-5h; Wed, 20 Aug 2025 12:28:21 +0000
Received: by outflank-mailman (input) for mailman id 1087381;
 Wed, 20 Aug 2025 12:28:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rUzz=3A=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uohvP-00037u-Iw
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 12:28:19 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 264e4dda-7dc1-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 14:28:17 +0200 (CEST)
Received: from DU0PR03MB10116.eurprd03.prod.outlook.com (2603:10a6:10:417::7)
 by VI2PR03MB10594.eurprd03.prod.outlook.com (2603:10a6:800:27f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 12:28:15 +0000
Received: from DU0PR03MB10116.eurprd03.prod.outlook.com
 ([fe80::7866:f529:f351:d5db]) by DU0PR03MB10116.eurprd03.prod.outlook.com
 ([fe80::7866:f529:f351:d5db%4]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 12:28:15 +0000
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
X-Inumbo-ID: 264e4dda-7dc1-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqXxlqp11ghaQNRz7Xvp9uU1yXdfqntVGXFFyx2O/H6bpa906FRDw4hhHlkZZMM7hEFuHuZEQ5WacL4h0SRzrva+Nvf1OOSPUryr3urtsFrnfNU9+QCTI4Y5s/ycbmLF0A8CaRYVLkehe+kNu/LWV9jsf9qpfJBl97hlytKtnlBhLfArWFNIQotMC0HSkK3eqZ7RwoTRJL7FU6MOMF6a6tHObQNb556+T/0e3PCEszRvxQvEp2wpVYtcw88UedL8wdEBlgW1bzQ/iw5NFDJQNR1rDR0SJitY+1zZGr2/LGxE7T+bEaCZDSYQAG0r2+CoC5coR/1Krne7Jr2oAu0LIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVMSmg+ZotqbA/Olb93TpjL0A75kD7z3fpeyTxGIOkc=;
 b=odEn6ipmWoYAmyxaxbyVvsVVi+0n3MAI9CXjN1PcBC3GFtDgSZ1GMvRx8Qv26zq4yTpKJ69Po9FXp5zM6ly1AGZ5dRjzsWMXpI1M7zutXh/U9O1eKtnkrXi8CRcErMhS4otLZEzeYxneboK9LHva9jkcJ1wCSUx81zLsulDq9KerEhW4fnNcehHzIBegWdrn/TegwpfOYKVt6YLOr+BW5e8PkOG1ST+vpKnOFOo3U9kLPcB4tgg4ODBBnJcaLmm7NsJnL4tgaulWbB+K9sPFz5qBeeVD+War0ja/0yZch/wTggQ9eBphJy/yuob9morI2TWg086qE23nzqvYK4EduQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVMSmg+ZotqbA/Olb93TpjL0A75kD7z3fpeyTxGIOkc=;
 b=qpiAzqqWRVJa9kElifPNWASVz7OON9y85kBZ9Bg46pYac4LBAOmPo6ToVMs401951fXni06LOe9syI8c0a+2PtYJBM+3iLyr8PzvuUkabZpThzhgzztWlX51QvtNErTDyvZIYs57Dl7dntbLJU5ha3VcG/XA7MzSTDHsOQesFpfDOPL9W6hTbJBnVwtd5xfLPz+bBC6sBW8pOP7rOKQNwP4MA1tIvIwMCHHUecDEeTHgnkbvxjgw/yVoZHYulr34Ut/icFZcI0K0FUsldQ8IpzbVPBYaxcP6NfMEsQnhvHdSmNkATNJR/6CRQ2INMgrryqKuU8uvq08Qo9UuNtH5sg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v2 3/3] xen/pci: add discovered PCI device at boot
Thread-Topic: [PATCH v2 3/3] xen/pci: add discovered PCI device at boot
Thread-Index: AQHcEc3mKXITpUZcl0ea3L2+fX5U/Q==
Date: Wed, 20 Aug 2025 12:28:15 +0000
Message-ID:
 <bb2589996131b0e7e645c0af281b9862e2e0f4cb.1755683961.git.mykyta_poturai@epam.com>
References: <cover.1755683961.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1755683961.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB10116:EE_|VI2PR03MB10594:EE_
x-ms-office365-filtering-correlation-id: 1296db97-5722-4fe1-6093-08dddfe50939
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?m+ZDWDLxQKqduaCQawsEUW08ueA1yhmJGWBuoYjAQM0cUMM0ehLU5G/hMu?=
 =?iso-8859-1?Q?9habU13av3zG3e/QRZkwqyRu27xPOtbpF5zfZhFZRF9uun/5JGN1V3DKgL?=
 =?iso-8859-1?Q?s7cGNpXGLDZtDQ+CKuaS3wQUubthih5Mp78nRAwfOrIDCgFIZQXmZOkIHs?=
 =?iso-8859-1?Q?ufo0JFo3QZV+XPvJhdTY8DBZju187qIHfwzQg3NGCbu4H1DtXiaA8wEHgM?=
 =?iso-8859-1?Q?9ABTyltrSR61/ZR65F5x5LRQZHYvmA0Xngr01Le+L0ybkfui6p3muq9S4t?=
 =?iso-8859-1?Q?5VNjjDZ6H2r3+k4hbM+H/fDOVsi9UecyH0QuhiGxZ48S0mSkgIRRd3YuaL?=
 =?iso-8859-1?Q?PW8GDBgmP+0GmUoXV2KkSzi7vRQMZiUQ8aR7G/rXa2M2HTqOga2NjVz/BG?=
 =?iso-8859-1?Q?YMI6sNEClb95nSeTI14V4KCEBNPQvD0enO08jHYIh7u/mN6OiMClYWjR2w?=
 =?iso-8859-1?Q?62Vmqg8eiFAxN6BpOXuMY4/UoPpbVx+RH9/1A3cKNbPyDJG76UwtOqjoD+?=
 =?iso-8859-1?Q?v0W/LeycBV3ca4y1hYrHSnrScGcnTJfBctt9kuWMt9M0ystBklpBDf7+yi?=
 =?iso-8859-1?Q?lKuSwaaqvspnhlLRRU/NwCkQdQet8IHGwWtlVWGo7oyVNxU2mgp7vgjA0G?=
 =?iso-8859-1?Q?elmEgP9peKeDxjxEMidQw6uWNLx+AWNyZ40pu823oY6emynLyTPH8dYPot?=
 =?iso-8859-1?Q?0/bjbktfoi5+pBYPZB8ffz2gShk8GRcKgnFD+KncMH9WiKe3EhZ7vzO5Cu?=
 =?iso-8859-1?Q?zt8HaXzlToQKxDrZINS3rnsSnzEcbuoWfD6NpxmKc38zD5N/IA1H3+lEda?=
 =?iso-8859-1?Q?WIpRRg1mNX+LSt5HINP0186KEDe/b7OzXAd7S/UkGIX7C6KzBXJNMFg4p7?=
 =?iso-8859-1?Q?bdSa4rYsY833zGwiFoxFON2QEdF6K/Cm8Zb9s0+iCCxq5ZYO4kSWmhqutg?=
 =?iso-8859-1?Q?bZBxojddr3FEBGMGGpyWarRCbvxL0gwLpd159Fzbc9/Rbr7Sap7L3cQcn4?=
 =?iso-8859-1?Q?ZsgRdogBab94LV0ptNfSuxV7XOtW986/c9B6NVhouajoNetvqEBNMqH/lT?=
 =?iso-8859-1?Q?P8NFci9k4117B06m7OcnO9BX3D0OO7Sg1f8wzdUs/vKjAgD85DySqwH0GW?=
 =?iso-8859-1?Q?RKGs2rV7gFy9kk4jbJyKqnD2f1ygXUlZxN49Oq+dDqXQnmTEjVLs221hNZ?=
 =?iso-8859-1?Q?phAlTxr7h1vuKeDqg86aI1mShoGVg6i4BYLh0WrWZ0jnRBNijoXJ+p37Ss?=
 =?iso-8859-1?Q?zE6yDB9Aibv6U+XodxH6heIqUl+7+bhSIr7uyPxN8iOStHBJg6DYmwgcr9?=
 =?iso-8859-1?Q?bdF9xlbGOpjrt+NjAkeMRFFi9buMABr2zrUglMH45y0/6Wb7ATapxs/Fxq?=
 =?iso-8859-1?Q?ZjcyVStwSqIApHh4oZNkXytQnET8FY2cvCP01dlqOOEJFm9JKGF9HvkGDr?=
 =?iso-8859-1?Q?N5HcQ0rSdGi7gRzDSH2jC1FvMQR6Fg2ZDW/TZBlWKyX7WjEE5qYKWYUYgu?=
 =?iso-8859-1?Q?heKLjbM0GCp9wQ26GBhGN+5OUl3iIA/4S/sVWWls31iixyF7EtMuDz6urs?=
 =?iso-8859-1?Q?JAvQXQE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB10116.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1QVMHjdsKBv4eO/PTW611E5uzgxfgiy3YyLA9KR3Wz9At46XdSwJmXLrkt?=
 =?iso-8859-1?Q?GCB4VMBeOp8DXNT8uOBMy8/WXHIx6bWcX1bi8dW91/U4hHF3/N4ALA/3+a?=
 =?iso-8859-1?Q?U+vqIKBDyMC+n/87re3b7umELdqUqu5KoYuLUCInIW+am/0pReCsqKani5?=
 =?iso-8859-1?Q?ma0LpwLvcFE9BLg94YtrKczRUR0IQzrs/R/XOQyDq3iAOliEIaCi6j2n+0?=
 =?iso-8859-1?Q?p86FMY4Y5DLf8pl55Cq6AbhhcdHUmyhHuBQqo+TkvDueE6hpCvqhb88Mlj?=
 =?iso-8859-1?Q?I8VtYSDyTS3qoc79qZloM2pypRGzM+w31Sz84hdMx8pfko6OuwkHvUhueH?=
 =?iso-8859-1?Q?VVC2nkevIhcpbKLxhAdplvWejoakO8fz4HfCJkW9Jwv3ekTV1F9Rdv/blA?=
 =?iso-8859-1?Q?93fpkeMQa5aI448Fjy+iBOiEsOp46KOiJBBMhIHL3F8e9n5NKv0KRtvhSD?=
 =?iso-8859-1?Q?KrM59Y21UnqfLNi5XxZtVPVhmLDBA2XpGnZ871FmvlVrEkKppFbXfWElk6?=
 =?iso-8859-1?Q?AYbL9aJQPSXaAXXLSvmAo1o61GtV6aYKEatHUnsszNpRyz+EU/QUIwR7yN?=
 =?iso-8859-1?Q?5oERi6WXJWtqT5wP2GXBSeRjCbs8BULOpCL8IG5SX/fp4ctaSgBLrwBMAN?=
 =?iso-8859-1?Q?jFHKfPfN/cOaVbkXX1DpAIUVoIoLNwNQ6PU441vGYjgnShcVc0BByMz3ZE?=
 =?iso-8859-1?Q?whZV3c+ukmLWwL6r54e/DOX4S5/pqWlaeCde1riPs0c+max9kMPdKyB979?=
 =?iso-8859-1?Q?7KWEwuTPKnpvt6umPcgVp1ipyk6LDUV+RmH4OTAmk1cvYmYcuqwhoJFbTe?=
 =?iso-8859-1?Q?7tgjMySqNAOBNqkIg5UA+j1yBke+p7fQzJMpE0c31wDFViTZIj1GB9mQko?=
 =?iso-8859-1?Q?2e/YimojXwOK8K67REglVh6eLfSORghEPOTkrMUGKg8y4DmulB1S5KQQjP?=
 =?iso-8859-1?Q?6x55ovD1wBkmiPYEKj+FjvKVy9PlC03k8KsVoS3o77xPUi1T5FzkzcI+Ut?=
 =?iso-8859-1?Q?gKaJmTSkSMz7K+6CmE1WesqJvqfKQW7ZB1BEjou2fcfbcDSprELC+XR1Ev?=
 =?iso-8859-1?Q?r9v56zTTJDEROM4/oDsr7OS+fhQ6pdmPqqvw9dpJnISn6lMyfymZ2hSiEW?=
 =?iso-8859-1?Q?q+KzgmxrSn0Wkgzxv96tC02R5PPr1LYybSh+VP1l7ubO0Os8Vpf/dc3ycj?=
 =?iso-8859-1?Q?Vm8s3KEnwOfE6Caag2jMu7dRfFqKopHI+0aee9elGWilZvTDjEpyJt0d0Y?=
 =?iso-8859-1?Q?gCJbeeLBh8fG8hkzBgZptktmk+h88+aJPUKZAc3SpLVNnbHNVWbXw25tvZ?=
 =?iso-8859-1?Q?fsNfFpCIpAeQpv1BjTKFLqiu0usyLMKsBshexeF9aeNoXQk+lpzU3WN8zS?=
 =?iso-8859-1?Q?86vPEUkJxSyqK85nBgjvLPA6etcIVOhqLdrBBf26IAgVSuJH69nHi7uvqB?=
 =?iso-8859-1?Q?xxG0hUUr4fXZfa8I18gnZ32CWac/YURZs9Aqa211LJdHscCCI3iEQ3QoAZ?=
 =?iso-8859-1?Q?8K4nfoO8UraBz16chwHkVGGmulDf8M5oDIkeNLRk4dh78XScOZ66aGJi6w?=
 =?iso-8859-1?Q?6jX+SGIT9RCADgEeDXY7BA9NsM4E1gEgMpjtZRiOK7Mrm4UbgBzCChRhXN?=
 =?iso-8859-1?Q?1w1x41W6L5Tghf2xKqDqEQ4bH70VYu5Qw0Tq6S8Ja5/Wc3ahyecQgbEw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB10116.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1296db97-5722-4fe1-6093-08dddfe50939
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 12:28:15.1213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVwCDxnfy6I0KrhadZ0oaZHtztRq0i2oLeN0MgNJ3LBLRRVO+PAUhXsgLMmTqpSDFx7Wg+gBM/KO0OyBaaW85w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10594

From: Luca Fancellu <luca.fancellu@arm.com>

In dom0less mode, there is no dom0 that can call PCI physdev ops to
register PCI devices to iommu, so it needs to be done by Xen.
pci_add_device requires some default domain, we don't have hwdom, and
the guests are not yet created during the PCI init phase, so use dom_io
as a temporary sentinel before devices are assigned to their target
domains.

Rename setup_hwdom_pci_devices to setup_pci_devices and add dom0less
handling to it.

In pci_add_device there is a call to xsm that doesn't consider the
requester of the function to be Xen itself, so add a check to skip
the call if the owner domain is dom_io, since it means the call is
coming directly from Xen.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
(cherry picked from commit eff51e50021b75f5a50533f7de681b2ce044f5bd from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)

v1->v2:
* integrate add_discovered_pci_devices into existing routines
* better explain the need for dom_io
---
 xen/arch/arm/pci/pci.c                      |  1 +
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  2 +-
 xen/drivers/passthrough/pci.c               | 42 ++++++++++++++-------
 xen/drivers/passthrough/vtd/iommu.c         |  2 +-
 xen/include/xen/pci.h                       |  5 +--
 5 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 1b34e17517..909fbdd694 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -124,6 +124,7 @@ static int __init pci_init(void)
         if ( ret < 0 )
             return ret;
=20
+        setup_pci_devices(dom_io, NULL);
     }
=20
     return 0;
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/pass=
through/amd/pci_amd_iommu.c
index 3a14770855..f3a83a0ab7 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -401,7 +401,7 @@ static void __hwdom_init cf_check amd_iommu_hwdom_init(=
struct domain *d)
=20
     /* Make sure workarounds are applied (if needed) before adding devices=
. */
     arch_iommu_hwdom_init(d);
-    setup_hwdom_pci_devices(d, amd_iommu_add_device);
+    setup_pci_devices(d, amd_iommu_add_device);
 }
=20
 static void amd_iommu_disable_domain_device(const struct domain *domain,
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 09b424d1b3..6ddc6811df 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -35,6 +35,7 @@
 #include <xen/msi.h>
 #include <xsm/xsm.h>
 #include "ats.h"
+#include "xen/dom0less-build.h"
=20
 struct pci_seg {
     struct list_head alldevs_list;
@@ -676,9 +677,12 @@ int pci_add_device(uint16_t seg, uint8_t bus, uint8_t =
devfn,
     else
         type =3D "device";
=20
-    ret =3D xsm_resource_plug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | dev=
fn);
-    if ( ret )
-        return ret;
+    if ( d !=3D dom_io )
+    {
+        ret =3D xsm_resource_plug_pci(XSM_PRIV, (seg << 16) | (bus << 8) |=
 devfn);
+        if ( ret )
+            return ret;
+    }
=20
     ret =3D -ENOMEM;
=20
@@ -1181,19 +1185,21 @@ int __init scan_pci_devices(void)
     return ret;
 }
=20
-struct setup_hwdom {
+struct setup_ctxt {
     struct domain *d;
     int (*handler)(uint8_t devfn, struct pci_dev *pdev);
 };
=20
-static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *=
ctxt,
+static void __hwdom_init setup_one_pci_device(const struct setup_ctxt *ctx=
t,
                                                 struct pci_dev *pdev)
 {
     u8 devfn =3D pdev->devfn;
-    int err;
+    int err =3D 0;
=20
     do {
-        err =3D ctxt->handler(devfn, pdev);
+        if ( ctxt->handler )
+            err =3D ctxt->handler(devfn, pdev);
+
         if ( err )
         {
             printk(XENLOG_ERR "setup %pp for d%d failed (%d)\n",
@@ -1213,10 +1219,10 @@ static void __hwdom_init setup_one_hwdom_device(con=
st struct setup_hwdom *ctxt,
                ctxt->d->domain_id, err);
 }
=20
-static int __hwdom_init cf_check _setup_hwdom_pci_devices(
+static int __hwdom_init cf_check _setup_pci_devices(
     struct pci_seg *pseg, void *arg)
 {
-    struct setup_hwdom *ctxt =3D arg;
+    struct setup_ctxt *ctxt =3D arg;
     int bus, devfn;
=20
     for ( bus =3D 0; bus < 256; bus++ )
@@ -1229,18 +1235,26 @@ static int __hwdom_init cf_check _setup_hwdom_pci_d=
evices(
             if ( !pdev )
                 continue;
=20
+            if ( is_dom0less_mode() ) {
+                int ret =3D pci_add_device(pdev->seg, pdev->bus, pdev->dev=
fn, NULL,
+                                         NUMA_NO_NODE, ctxt->d);
+                if (ret)
+                    printk(XENLOG_ERR "Failed to add PCI device %pp: %d\n"=
, &pdev->sbdf, ret);
+                continue;
+            }
+
             if ( !pdev->domain )
             {
                 pdev->domain =3D ctxt->d;
                 write_lock(&ctxt->d->pci_lock);
                 list_add(&pdev->domain_list, &ctxt->d->pdev_list);
                 write_unlock(&ctxt->d->pci_lock);
-                setup_one_hwdom_device(ctxt, pdev);
+                setup_one_pci_device(ctxt, pdev);
             }
             else if ( pdev->domain =3D=3D dom_xen )
             {
                 pdev->domain =3D ctxt->d;
-                setup_one_hwdom_device(ctxt, pdev);
+                setup_one_pci_device(ctxt, pdev);
                 pdev->domain =3D dom_xen;
             }
             else if ( pdev->domain !=3D ctxt->d )
@@ -1266,13 +1280,13 @@ static int __hwdom_init cf_check _setup_hwdom_pci_d=
evices(
     return 0;
 }
=20
-void __hwdom_init setup_hwdom_pci_devices(
+void __hwdom_init setup_pci_devices(
     struct domain *d, int (*handler)(uint8_t devfn, struct pci_dev *pdev))
 {
-    struct setup_hwdom ctxt =3D { .d =3D d, .handler =3D handler };
+    struct setup_ctxt ctxt =3D { .d =3D d, .handler =3D handler };
=20
     pcidevs_lock();
-    pci_segments_iterate(_setup_hwdom_pci_devices, &ctxt);
+    pci_segments_iterate(_setup_pci_devices, &ctxt);
     pcidevs_unlock();
 }
=20
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/=
vtd/iommu.c
index c55f02c97e..1096c16327 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1451,7 +1451,7 @@ static void __hwdom_init cf_check intel_iommu_hwdom_i=
nit(struct domain *d)
 {
     struct acpi_drhd_unit *drhd;
=20
-    setup_hwdom_pci_devices(d, setup_hwdom_device);
+    setup_pci_devices(d, setup_hwdom_device);
     setup_hwdom_rmrr(d);
     /* Make sure workarounds are applied before enabling the IOMMU(s). */
     arch_iommu_hwdom_init(d);
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 89f3281b7c..61f69a8a1b 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -220,9 +220,8 @@ int scan_pci_devices(void);
 enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
 int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
=20
-void setup_hwdom_pci_devices(struct domain *d,
-                             int (*handler)(uint8_t devfn,
-                                            struct pci_dev *pdev));
+void setup_pci_devices(struct domain *d, int (*handler)(uint8_t devfn,
+                                                        struct pci_dev *pd=
ev));
 int pci_release_devices(struct domain *d);
 int pci_add_segment(u16 seg);
 const unsigned long *pci_get_ro_map(u16 seg);
--=20
2.34.1

