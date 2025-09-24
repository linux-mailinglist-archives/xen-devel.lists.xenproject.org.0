Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44A4B98B7B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 09:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129034.1469184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPS-0008KQ-JT; Wed, 24 Sep 2025 07:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129034.1469184; Wed, 24 Sep 2025 07:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPS-0008Gl-FJ; Wed, 24 Sep 2025 07:59:30 +0000
Received: by outflank-mailman (input) for mailman id 1129034;
 Wed, 24 Sep 2025 07:59:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4Db=4D=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v1KPQ-0007no-Ne
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 07:59:28 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64a08838-991c-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 09:59:27 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU5PR03MB10523.eurprd03.prod.outlook.com
 (2603:10a6:10:525::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 07:59:24 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 07:59:24 +0000
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
X-Inumbo-ID: 64a08838-991c-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMnuVJZDifYgnpS9h+mWCmdkgTsbGpz1inOaM2EUWY0xtWeKVKeWFV8p0KWRdwUFD4SuW/JBu42bbPDGKGKSr8pH8LyTvWLJugRj3A+4F9X35sEjKaRpgSq67DUKkJzgcUOU5tPk0nOi2ncncvuwFp3CTcfMhG4d6T4tmxI1gt/0/em+ZlBCRgAw9aCII9o9fH0tEIHnVyapoL4juMOJfvDWRq2kiAYrvgLc1uWCuQz9W2VDn75NLfMdxtAOvqsOqV7b0CvYxEFqWzJnsC91Mr8Y3Ix4Logej3AfV5wPzHRek2nDAyHjBabNZWDC8xU2A/IJO+vcA6NMEg+3cKsEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmIJngmNAJaHcrvOaGKlWpNmiqsAzrA72rwaTEJwhf4=;
 b=EW+e3XunmQdPLn4KblXb1cpeM+SClHC670JtW12hX2rR2wxGITwnCKg4RDq9GaIN5leVdvxr7Z2l7a3obu8eyd2bol0h1UKVI5BEhuZ4bjf6IzGwdqxzWRZ2BySwEHzszok6uAkBUqJmmflSnpfTd+iY6d2DsEkB0j6OZFYQdL/XWysTJAxitml5+8uiQGqacb/0UGDnQ+XchHwq1YCoOv5KmfZX2t7x27aBlvvYoT1P8cBT/s/rlGKgdNqKYuyWd616TXVrNgw1P9z1i6prQ648ZpcOta69g0GqiezV6TCxBGjfqNcY8llM7e5sIFvIXmmDdTnHzsMlk6aQXyQ4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmIJngmNAJaHcrvOaGKlWpNmiqsAzrA72rwaTEJwhf4=;
 b=Oy00EC29OX4zWTTdaICK8G343JRM/8CkG8ynBqxZW++hdaVzuvNtKMQHa7ezea3vs4Z6c0/rH4Gb34tueceWeT44c+LxtgGHnRclxwAUToFgjXE16IfS+4CSO8yoau92cFNjEIR3VLkwZOPvWr8FCZi+uK8WLZeLNXFIOsizA+Fg/THa7sVoIwBHhRLPL8++X2eg3SLBmiDAVcyXn/inojsFGki8yUV5TIA/azJQfOBQI4YhTtGhqck/vd7EoD3TUszjCfmcD0tLpVa2MiTDFdU4VXp24Z7GNgjhBxtO0EvWICD+sDF7TQd3cIwLgKLeE5c5U+s6i98GxQz3ha6aRg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v1 7/8] xen/pci: assign discovered devices to hwdom
Thread-Topic: [PATCH v1 7/8] xen/pci: assign discovered devices to hwdom
Thread-Index: AQHcLSkkWmtwb4NRmEuuI8pQV3Va3w==
Date: Wed, 24 Sep 2025 07:59:23 +0000
Message-ID:
 <ee305fc5b277060a3ae3c7fb26cea6b34920048f.1758618839.git.mykyta_poturai@epam.com>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1758618839.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU5PR03MB10523:EE_
x-ms-office365-filtering-correlation-id: 86aae18c-4bfd-482b-066d-08ddfb4046ce
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qxEiTwlwFFx4/qtbMvl8Ej/2UaYGeZq7aZhNpqL7VbTtFsBOrDVT7gyGrM?=
 =?iso-8859-1?Q?TxagX6frc4BJNc7XWVvWD2w1dKMYbdJBlnQjc2RYMVRZZrjWbwa798Skrg?=
 =?iso-8859-1?Q?R9BYjDvfJ94kd9GECb5VkIKTJvNfZfO8dD6P4fBs8etyrFsDfjr1R033l+?=
 =?iso-8859-1?Q?hMhL/QPMz4dJz0yZ/8EnzCVWNvtbwpMVpTqBvjlBhqNi8ggFeS+IUI5Nxy?=
 =?iso-8859-1?Q?5L4fVStZsE/7ipk5vgV87GzBBpU8zWsE5a7Pcy+IYnb6swukQMtVqyhomt?=
 =?iso-8859-1?Q?Uh9pSCwHMhmG+KsCDJTmOb2kV1MZ4tmH2xA2QmtzpP1hz4VGWyq0vAcFp7?=
 =?iso-8859-1?Q?R6N+0t5PJ/jARIcO61I4/EYxvhqD1EWbC00U++CNYI6NIv+3N9kiHE2vl1?=
 =?iso-8859-1?Q?2C1T0bH/eJsJcQ6oRtag23EghcILuMPbNlAorF2MDUgX/KuwIFKxU0m5mP?=
 =?iso-8859-1?Q?hXCuQm/o0MihOdxVS+TscEOd2RRxG7vFh5nezBEZIpX8ErtjTtWyv83N7w?=
 =?iso-8859-1?Q?F3jX6hoR5Pyo/ml04s7cdHS0Azh0lxACGh+Y0ltd4yGCnaiJdc1t+ogcv3?=
 =?iso-8859-1?Q?xF8F6+s7ctCA1VILUsdEwqDNPcNZovlN1NW2ewCL2/OWRAvhTreCxnZtBF?=
 =?iso-8859-1?Q?l4zrhypJK/2xMYwCqsV8xiTPFgECBX4L3o2v72nGwxIM+dNfAAmeO1Jqew?=
 =?iso-8859-1?Q?t2QKPAMw4yDO6TyEypFX2kzQxYGQNqdlKioGMin+B5+RsjyYleyVZ9rLL6?=
 =?iso-8859-1?Q?twHKFWgimQXT13nDHOjMtXDlJHoif+ZOK/+ZzVoaaO7U3xgN8jdrhEH6Fb?=
 =?iso-8859-1?Q?OnM3o4ZiLwUu7ScCKVTYrFo4FpNiI/PLgE2f1uwrdkSJ/H4yDxxJU1/JMt?=
 =?iso-8859-1?Q?j5LPULAwe1L3E2aDM/4JH2zoGw9oOsRa8uAha74CQKkuhSE0waG6+F2lHc?=
 =?iso-8859-1?Q?ExaZ8rHO3PESBr24vYJTeNzIa7iRL3wUv5s6sl+0IRUkolm1PmmHKT/BGt?=
 =?iso-8859-1?Q?JHRAJsT6DSyqUSzcWgz2xWI2ad7EtaeWYikAeNwjEn4I6eq/sRFMxmXahW?=
 =?iso-8859-1?Q?7hJn8XG9p0GeNzMjNaBIKaw0XlNZ1Rk1hYoo2VJFdxSL95DB63S+A21apD?=
 =?iso-8859-1?Q?66JjXrHE5p2Xbt6VniP3YdZi6VcqvbD2jEBpat5TBJzPsjVBn3brjR61jy?=
 =?iso-8859-1?Q?336djYXFAozcwgiQc/XFqSp8KHLQ7ewB2HaA6VcXR1l5+LfeTN99qmgxC8?=
 =?iso-8859-1?Q?A2eI7LEoOZ3tFR/XNmHV8ywADCOFPMwCJjYBlRxYv/dSxYLTEeLPIKEhUl?=
 =?iso-8859-1?Q?bmYMRiPUNh7c7eROBsfW8y/Ke/V4oX01eEXj0fiXP+60tPULGEt7A5M1cr?=
 =?iso-8859-1?Q?kQNsL4i7YfziUgN64UMVQjcBliJNzdmyVGmvBpQUnfyJulPmHS8TjzroZZ?=
 =?iso-8859-1?Q?4YWo5wuhjlu2Utvvb7dd6SUGXAg/TXr2fowt3+zbtRmQqwrpo22S8MMAoD?=
 =?iso-8859-1?Q?XG3Q7hl4qRpoV8JKv2F/MYQLZuL0Jj2RiEy1y9Oy2J4vFg/ro4IEAnYAOV?=
 =?iso-8859-1?Q?e69WhQ4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OW7bShq5XUekY0H8Re+GjVliUP1fhorve3/jzr8ww/fIYGxEtgkllFj9bv?=
 =?iso-8859-1?Q?JGVRm/lF32lh2YC37o1GFwX+2Ta5vjdAKHXd1jgA+967xj2eiKi+HG9mgd?=
 =?iso-8859-1?Q?iQdxvLUhMBoWIXVhAYt9YU5wcVBjQtQ5FmgeXQCsx/0G8LcSMDrU2UkMB8?=
 =?iso-8859-1?Q?xbQSBTTGAOBUBtwDVaZcjqEajn0dTX2awsb1BuYKes33Kwmi5b5wIofEIp?=
 =?iso-8859-1?Q?kMwPSxqUyBv2wn1arGjHNMJhPpipHYT0Hu5C2bjylVIEX6tLmbm4fS/V2n?=
 =?iso-8859-1?Q?spdosQmJV3iUnkRTzdGbo9qb/UinIN0jAA1Kq722G8lktEG3uMfVgbW0C5?=
 =?iso-8859-1?Q?21Xw0Q6FGm1UESbeA75HoW7Ll5uHdaVRHJH4GkFUxpeqMUq/pzqoEbaV+h?=
 =?iso-8859-1?Q?LU7MIE0ybZApzsHhm+KSa1vqJf/woEcZmV8tb3/IsT961IrelutH+qkQ7g?=
 =?iso-8859-1?Q?h8AIhDjKL2yTPeLY8YmOqoPXv9O49fvvTC7Llh/fIXqf+VA+WYcDWx4Xta?=
 =?iso-8859-1?Q?d0vJZAfC4NVMSoCdE/8qe2h++/vM+omRxXPoeeM52Qf5V5Ubm9mzSph6JK?=
 =?iso-8859-1?Q?FtM0tGGdOdJabpcLT1oqHwT5iJP69XDDBAXIeVKg0Spb7pasuf/fL2AJ8c?=
 =?iso-8859-1?Q?HLmCyuVZqxOiP9znzCrL6EBYrp+oEBwHMCutyNPNu4+nPPtZ5H3NJVBGSK?=
 =?iso-8859-1?Q?B+dkfwwGViKmMNqkN49sMWKMJKttnrMjS1np3zFajRkkAQKxEPD3oA2wnX?=
 =?iso-8859-1?Q?n2S+sTEyEErSmkjSNqBefcVW2ob3qiCSNzqbkcNvgjH6h9T5SLH/gDKhWH?=
 =?iso-8859-1?Q?qJ2UFmyCGTt1BA0Hck8oKRNEDrJlOXF/odm8S74mwETIRt1jPj3/GKUni3?=
 =?iso-8859-1?Q?8u0Hcnm+O/pzKL3WycDt9fltKqhtGXoqX1YpjV+kooy5CEHkX0IOdO0IdX?=
 =?iso-8859-1?Q?XiodddtMW9/LPgmWhIR9on9adDHnXz5fIFX+EjVK8MvO60WrRITThuJzKM?=
 =?iso-8859-1?Q?4B4KgJPRnjsCpb6WrqTbRr0vySX/u8DYQAJ4Wn19UnpgyNqKRnDGd1gJxb?=
 =?iso-8859-1?Q?yIUw9jyWeB3GK2jSL2eU0l9CR5YZ9y/zwQnd+RMyH3U2o2mqVatV08OwOK?=
 =?iso-8859-1?Q?5u09Y3jMQMLQRUirQQmp6hXkt0FPEyd+K8lqUEOfaJWf+H4GVL8MEhOQMC?=
 =?iso-8859-1?Q?BrPNkEoyOpcMWOW21An6l5wVtrur2zYrV2gXAv1NPL2cyTxWOHdiRaF8Le?=
 =?iso-8859-1?Q?H4KYPYQG2+4YpiqBrLmYViE4gIbaQjr8K61h4JaUTIHemS6rgoPWozHcOP?=
 =?iso-8859-1?Q?Fo9/qrmwPRSpspMX4nBl97n5q/ItTpl8VeHEo4Fpe6w41do1s8wUuqzOaw?=
 =?iso-8859-1?Q?kTClq0VdSJZlKiKnskAhK0G+TCpws0ThtMwF6VzBO6SHquMiE1X+YPXA25?=
 =?iso-8859-1?Q?rFyiM85cymOuZAeAxGnCW7VeN3jlT2Hp+U4FNaQVrxz6ysMWJE9i8a7XP7?=
 =?iso-8859-1?Q?WHCA6k+1dUUzU8KH4CR+x/c1w5jc9BM9K0T223fYCF2XOnjjN/K9DQkQNr?=
 =?iso-8859-1?Q?ihF8j4FpQbsLlV+sHTxt9AVXLycdStBu7LDK49KYhqX8HrxHWF21LV+Nbh?=
 =?iso-8859-1?Q?7FTwNwmZKRT3ZCJHLb2K6qLbBFIkM2g2PRr2PZjqViTYxirt38fyH0lQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86aae18c-4bfd-482b-066d-08ddfb4046ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 07:59:24.0356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: US9NGmlwluJ1fV72i9rCbwiqsP4olR6W6OaQbDwzfRL4R58Pk+CDW9/pdqneTd4e+3NBjt7V21GF638zZRBu4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10523

From: Luca Fancellu <luca.fancellu@arm.com>

Hook up existing PCI setup routines for hwdom into Arm iommu
initialization sequence, only assign endpoint devices.

During scanned PCI device assignment, also permit access to the BAR
ranges if hwdom is using vpci.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/drivers/passthrough/arm/iommu.c |  9 +++++++
 xen/drivers/passthrough/pci.c       | 40 ++++++++++++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/=
arm/iommu.c
index 100545e23f..d110520e0d 100644
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
@@ -133,6 +134,12 @@ void arch_iommu_domain_destroy(struct domain *d)
 {
 }
=20
+static int iommu_add_hwdom_pci_device(u8 devfn, struct pci_dev *pdev)
+{
+    const struct domain_iommu *hd =3D dom_iommu(hardware_domain);
+    return iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev=
));
+}
+
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
     /* Set to false options not supported on ARM. */
@@ -142,6 +149,8 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *=
d)
     if ( iommu_hwdom_reserved =3D=3D 1 )
         printk(XENLOG_WARNING "map-reserved dom0-iommu option is not suppo=
rted on ARM\n");
     iommu_hwdom_reserved =3D 0;
+
+    setup_hwdom_pci_devices(d, iommu_add_hwdom_pci_device);
 }
=20
 /*
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 4f5de9a542..534faaaa84 100644
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
+    if ( !hwdom_uses_vpci() )
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
@@ -1294,6 +1329,9 @@ static int __hwdom_init cf_check _setup_hwdom_pci_dev=
ices(
             if ( !pdev )
                 continue;
=20
+            if ( hwdom_uses_vpci() && !pdev_is_endpoint(pdev) )
+                continue;
+
             if ( !pdev->domain )
             {
                 pdev->domain =3D ctxt->d;
--=20
2.34.1

