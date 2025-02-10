Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0568DA2E970
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884567.1294343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR4B-0006G1-LG; Mon, 10 Feb 2025 10:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884567.1294343; Mon, 10 Feb 2025 10:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR4B-0006Au-A4; Mon, 10 Feb 2025 10:31:03 +0000
Received: by outflank-mailman (input) for mailman id 884567;
 Mon, 10 Feb 2025 10:31:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzWh=VB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1thR49-0004Pl-58
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:31:01 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2607::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e41064f-e79a-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:30:59 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB8977.eurprd03.prod.outlook.com
 (2603:10a6:20b:5f5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 10:30:46 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 10:30:46 +0000
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
X-Inumbo-ID: 1e41064f-e79a-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aujIjaarDMYd8kRjgohxSKVfROutdhGgydLZpUDSVRQzSi+rGhc+27FRIUg8IBQIkKW3DQeol1H7SkzHuFEhkjJA/lhdOmy0s6jZJaUmTleOphNKkUsZDsxyt1zxAPrRG5D2A4hlCu1fq3/5nBkDRsUWTUIg3hCCm+swPdIfmRHE8zWE1p1mWSRLurpXDZgQLzVfpgDN9ayfbvv5yfikIaMc2FCsMwOGQb4XcrXEoGueNEEKCczxfGye34/3psWv8XeYYTXXXhWSX23cEgxiD3KvuGwiALjPnYtyhaCSojT48c/dDJmNjDKu0hhafkbgDaYfNKdj5aAOOhKnKZq1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJzeBG/QJ7V8TMJ6kfZEM24ay9nElFXvR2jyFj4qnzE=;
 b=KLa0n3Q3Ugw4Rn5xpqmNheMJYygW/PSj/7mZRSj8JydbI5DSyN3KbVoCopVpbSt1yC6sSxMD6f6GVSyxnTsm0OBlYZgMt2y0lZis+Yzemer3FixAoUo3x+P/xamzAUUziaAM/75NnWT/B1acg0nHVRdP+FtOH066l/Jl/GjubFr6dZosQyeCIsfIqdNos6Ohthschyk7hxdlutHnQCMxxP83/Ni54HPozO6iizt0U+hrLWMZmdNNHWUhQXzBfgMy0grpwNCfxZ1FxEYqdHgaZ95zWkpxO87nQtAFClpJVELgMKmN45IPKC5bzksSfrt7JapTtZWTNHFhmhjtS5Q7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJzeBG/QJ7V8TMJ6kfZEM24ay9nElFXvR2jyFj4qnzE=;
 b=HRml9QN6s60H9bJa7YtpXkK5mj7gDPUKaKSeImYM/7g1Sv4wYMFz6aC/oyEnp0F2hHKYm+SQjLQdk+D/gvXUQOLEIx3iiHFPGdNn22aCZ/QKvbvAB4vJEC+r9JRXUJltXrUVNNgwvt5b0hRlRuOtETeZ9UGJwydk0SF5ibkrOU0OZXWqQH5LVF08FojAFIppFIdB2YCnVuvJ/ag0mSHLU3TRP+M9sNj2uFfQTgIlOPAWqTVLqQ9p7GLdCW+gqi1j5t92Uho2C/QWGPPwIG2lRWkvKSPkafTD2XxSO/Bj9Ya452jBscMGxbk0Eh7afWE3+vNzn6MPpjoiKGRsQSkhbA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v8 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v8 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHbe6bYLRtr9CeUhUS7u7CeNu5b3Q==
Date: Mon, 10 Feb 2025 10:30:46 +0000
Message-ID:
 <9950eff2f8344c5d658def7d2c6d7fc010607498.1739182214.git.mykyta_poturai@epam.com>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1739182214.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS2PR03MB8977:EE_
x-ms-office365-filtering-correlation-id: 87b54a4e-0b94-49ae-b5ec-08dd49bdfad6
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?KKQCPo3pxJCaRQHSRl0mitrodedgZIlOh63VP9c0WYmvMGIEfM2dk0dbEz?=
 =?iso-8859-1?Q?s2PtQW+GndpVgCaiDifxKYZy53vVXiGBJu34kYhL/wYc8zCMEzykiFNdFr?=
 =?iso-8859-1?Q?CwNVwVZHKWwUXrfUr6QeXgT+768ZAtZRmsxN2W58pGhCr4WRh+lgnMdXYo?=
 =?iso-8859-1?Q?A77XxZsi31a34f7ehQP4hyPVsEG2/rSGnzFLLuwtsz8MrxvYFQhmVdOfCO?=
 =?iso-8859-1?Q?7XX/WoVd/QyoEu6s4XKi1jtVN4NA7RQTDmoLYsgdqXHBQrYkfh7t8xj8Zu?=
 =?iso-8859-1?Q?hgxh35GB1j28/jHT7u6SYGCMYgpG8C1C9f6UwpE4qrr9YgRe64Fz4Fom9n?=
 =?iso-8859-1?Q?LYeggTYfoAdBUtKhBGpCFrBZoHuQfDGX3rJNJVHE3/iE4UkuyAKc+IluPr?=
 =?iso-8859-1?Q?8DH1xRU7QMUiVejDMnvq3mk2SjfomhPP5iSc51dRBqDPvo5Uv0otkQmRSK?=
 =?iso-8859-1?Q?spw2VXRiMff3sTdgxysdowQlm1oH60AFy/B0RyMnJvSxAybN1iBmhQh3wg?=
 =?iso-8859-1?Q?CIW+gJJCbiN+uWuG4AsE2DKYmO1V8qINqYmwNaNFDo36NYkoflzVTzImZ1?=
 =?iso-8859-1?Q?J35so4vAEv/t6xEcaSVnq7/zNe/1wTE+KmDVCUGj+32El5wUzE/lK01aum?=
 =?iso-8859-1?Q?xv8Hbhd/gZS12SD4eXD8HOgejENObuCAvkkk4rNXprmMFz5pC9uiGheVJp?=
 =?iso-8859-1?Q?jbYdUFO2tii4DykWj15fCU5EghVROIFt6RwkNIPfKMr0IwTtKWqZO7tV6X?=
 =?iso-8859-1?Q?4GbMhj5Dz22oY2sTrmkO45NgTpafvQxrBmUc0On2kiz3fyxNoJKrR4K5L3?=
 =?iso-8859-1?Q?+01yUui8C2ONxy4EUHka3L9ISJrK7E6AZgpX2oERU7SPeu4Beez7aeft2P?=
 =?iso-8859-1?Q?uY40+zwNW/+DU36hp8P1qG0WFzgYBNjUA3bV+aGeEQIsn0tOn3UcmeJTmm?=
 =?iso-8859-1?Q?Y6QnmKZG0yXDy/nX4lORfE8xdRLQDPTxINTDRY9QPbvgyU9IA+ncVtZH9t?=
 =?iso-8859-1?Q?7p5iZ4mw5JCWebXdx2a2SPfpKt1PCFJV0475dfhksKH+y+fjGTFknJvDF9?=
 =?iso-8859-1?Q?j5DBnKw7lYXKeGHgSwlAH6KhaEtmPDA9FoeoaBCAfcw978FU9H5SBvGJ78?=
 =?iso-8859-1?Q?e3OFPYQpjNy1pJ3W0GNf5rLHW4Snm543ZCbD1h2iFPBnAVQhS+tsermroK?=
 =?iso-8859-1?Q?PMzKN5LpNJXmLPUFdFYAaUFxZunL2i3RIOr8c9PUDWWhrw/O149LDOMvqz?=
 =?iso-8859-1?Q?kGMCSCgGh28n+Z1yQ5JINYZiMEYguhVFo6AHEbzfSOymYYr/EwsXDUY7v0?=
 =?iso-8859-1?Q?dBPbHk7gAEmz8OiRtN7F1n+p7QDKFNRgRxJjsZlW+AA/UOsOaNWkKYSbC/?=
 =?iso-8859-1?Q?RFZLjoOWMYcMLandMHJzICzrQ7eRwOTStuLdlW3e8I5xd/saL/FwZMO7D1?=
 =?iso-8859-1?Q?nFWQAcbj2KOkPl+zqPELtiCtjZJoyvQRnE9c1gNAkqt23JVc6XadjFFG99?=
 =?iso-8859-1?Q?lmCd7TGpj4kZbUf5FovDdZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4TymGGUtjtguvlyiUrM6V9aD9Wea4c0GR+JPS1Q1v9eQQ9zFIMENHPfak6?=
 =?iso-8859-1?Q?xwXjVghf3TijQUHzOYAMwCHa1NDUKSrFxGnVSSFsbQLNzkiglvVtT3KzDd?=
 =?iso-8859-1?Q?G3UzQTJINONnCsGPzW7ZSQiL+nPVCdWRwqEKZyZazWTICcCWdPJ5BL4/bx?=
 =?iso-8859-1?Q?eMSL0LLLcpp4XSFPbu+tfHX+PUkII57oxNTlcRZM9OSzDDJHp3ZNxB0AwS?=
 =?iso-8859-1?Q?Sjkzi9dfYChzzgGeYgZZqs5WsZ//YCTwOJIc1S+8QztjJXKwl/VDO5uPLk?=
 =?iso-8859-1?Q?P74Wz68E9ffveBmPaUIXDW8xw9W/KTMS9FcC1EmTbWch0jZCmLxFduJC/u?=
 =?iso-8859-1?Q?y8us5POK0SuVBAZO1fLL8fCufVWAVI0WYqHawWMDcp9Facin0k9bY06r5h?=
 =?iso-8859-1?Q?BXbfVzzq2tbBt3+ZQbpTVb70b2fOmPCvmtPcevmS+scqFG08k+UfD9x+u5?=
 =?iso-8859-1?Q?v95rrMlZV5F7o7LRTdCjTQv/862uqAXuwf3/M4yDKRdFortuy8DWhgwp8p?=
 =?iso-8859-1?Q?gXjgVLwCT0ni0WHBbHf46dgVttgPq5mL05CSTOyIPRNmP0iNHM3UsmYpxr?=
 =?iso-8859-1?Q?0zL2wzHGvBxDt83EtbfL4utKGnAlCVXBU06tLEmPIzcpnAsjmhiNVSDdWx?=
 =?iso-8859-1?Q?5mcykQuQLUq/hia2Dmb93DqYr5qW/V4qGMFr37CFfNC7tqPkyD4HHkKoeX?=
 =?iso-8859-1?Q?dFSBD3L2JOstso4nCYm9ywh/gcTM9TAtJO+V1IEqJfooxAN15NDMmBg9Rd?=
 =?iso-8859-1?Q?44D3EvqwE2meBvaIZIHyaS/3Ry99+VWikVJ4pk0hor4+/r80syzP3JVhzQ?=
 =?iso-8859-1?Q?bP/JAto43t6o49CLGPVMKJL+Wt9dsSZyGuyt6LeZUX7OUuUnTAKmFIUDBC?=
 =?iso-8859-1?Q?VNPsLAkhOI5cdOXh7yKUfEfjeJViExTqMHeCOgCwwdOvz7rqQZu2y1Fj5a?=
 =?iso-8859-1?Q?YNhz/8wVDtSqOeZ2xalH2Hgmnsb0dw6MSl72eErDk+8iqHN/gR4bafBP3q?=
 =?iso-8859-1?Q?nQOvSFHWmy0EhpDbLqVaKCXEfzm666+qVd7R1jatfBMRTxSscE23Vq7VSs?=
 =?iso-8859-1?Q?IjdDpx+00c8Odknc8fTtbc8pI41T4Rtn6en+1tXnrHluoWS0hELT4Qb78Z?=
 =?iso-8859-1?Q?qAEPW/tTznn0++63XKkNSnelhE73QuZ8sFUX3I2f/qF5IbDtWsZXbWurjO?=
 =?iso-8859-1?Q?IB5G8TFvu7LRaaqiNeTB8FFR5Kj34ie2A12FYsVpkS9pMTQkU5Nc0zJUJI?=
 =?iso-8859-1?Q?UNYAVHpsIjw8/plkRAEiBYlWq1ddfqwXfM6HxCIcIElI8OXmNmFzAYKQSp?=
 =?iso-8859-1?Q?XaH5pQ4HzshZG/DVBfkZ0iv7IkDPiO+qkBx9ySbaaDUl6n70LCY/Qs0iji?=
 =?iso-8859-1?Q?tiWuYRcfXozMIZ2kKgNZDQ6zDwHY4E1IB3bLFEB3DJ9qj5LR4qVRw08y4Q?=
 =?iso-8859-1?Q?MSuZKjBIpIDZ74QJ6DTKidw67M+t3OJnDqbOpEZVIruKOEFqOAl/kzVKgi?=
 =?iso-8859-1?Q?k6jaCZRzZI6+/oDcWjpZGuRgHaKW54+tJY4sy0Ra8TblyUFAKvjQvjZX6q?=
 =?iso-8859-1?Q?ssaxD4yeFcEndAUfsagyxi3IykH40Ro7Zl8AGBsFXHuxFqp7l8l07UZnyY?=
 =?iso-8859-1?Q?9K5vNkL/WwjdcJtq80NlCNGpT+lIarmEQxtu2pLmEOGgoBTJHbI4pTnw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b54a4e-0b94-49ae-b5ec-08dd49bdfad6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 10:30:46.2117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BFAcgJ/9Wp+JNYLlteGmF5J5FiLjaSHWEMF3WyrWPREh1WGdky6kHjPVMf+0bJGIQjsLZw+03erDxkPJgvYveg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8977

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Enable the use of IOMMU + PCI in dom0 without having to specify
"pci-passthrough=3Dyes". We rely on dom0 to initialize the PCI controller
and perform a PHYSDEVOP_pci_device_add call to add each device to SMMU.

Enable pci_init() for initializing Xen's internal PCI subsystem, and
allow PHYSDEVOP_pci_device_add when pci-passthrough is disabled.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
hmm. Since
  dec9e02f3190 ("xen: avoid generation of stub <asm/pci.h> header")
Should we also move is_pci_passthrough_enabled() back to xen/arch/arm/inclu=
de/asm/pci.h ?
Not sure if PPC/RISC-V will plan on using this check.

v7->v8:
* bring back x86 definition of is_pci_passthrough_enabled()

v6->v7:
* remove x86 definition of is_pci_passthrough_enabled()
* update comments
* make pci_physdev_op checks stricter

v5->v6:
* new patch - this effectively replaces
  ("Revert "xen/arm: Add cmdline boot option "pci-passthrough =3D <boolean>=
""")
---
 xen/arch/arm/pci/pci.c    | 5 +++--
 xen/drivers/pci/physdev.c | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 78b97beaef..f2281e81aa 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -16,6 +16,7 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/iommu.h>
 #include <xen/param.h>
 #include <xen/pci.h>
=20
@@ -83,9 +84,9 @@ static int __init pci_init(void)
 {
     /*
      * Enable PCI passthrough when has been enabled explicitly
-     * (pci-passthrough=3Don).
+     * (pci-passthrough=3Don) or IOMMU is present and enabled.
      */
-    if ( !pci_passthrough_enabled )
+    if ( !is_pci_passthrough_enabled() && !iommu_enabled )
         return 0;
=20
     pci_segments_init();
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 0161a85e1e..d8a49cadf3 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
         struct pci_dev_info pdev_info;
         nodeid_t node =3D NUMA_NO_NODE;
=20
-        if ( !is_pci_passthrough_enabled() )
+        if ( !is_pci_passthrough_enabled() && !iommu_enabled )
             return -EOPNOTSUPP;
=20
         ret =3D -EFAULT;
@@ -57,7 +57,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
     case PHYSDEVOP_pci_device_remove: {
         struct physdev_pci_device dev;
=20
-        if ( !is_pci_passthrough_enabled() )
+        if ( !is_pci_passthrough_enabled() && !iommu_enabled )
             return -EOPNOTSUPP;
=20
         ret =3D -EFAULT;
--=20
2.34.1

