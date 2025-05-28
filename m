Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAE6AC6552
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999018.1379716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpn-0005yp-M2; Wed, 28 May 2025 09:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999018.1379716; Wed, 28 May 2025 09:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpn-0005rF-FM; Wed, 28 May 2025 09:12:27 +0000
Received: by outflank-mailman (input) for mailman id 999018;
 Wed, 28 May 2025 09:12:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sgde=YM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uKCpl-00059a-RK
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:12:25 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddb0393d-3ba3-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:12:23 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB9PR03MB9709.eurprd03.prod.outlook.com
 (2603:10a6:10:459::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 09:12:19 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 09:12:18 +0000
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
X-Inumbo-ID: ddb0393d-3ba3-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuuMcL5oTp20L3Tx+iYrtKrxciMhRKn911u9Nzn1tarSndhiVPh0CALi+4eEoQohwYV9bpOUt79ENj7zEhZrQLWTsV/VblJtvFM6UOP7ETEq/aFwFtkbDzZ6vsp5JxGBOcX9Id3adDbBkgUN35qd3Mo4E0GdrTkgqJ3kI+8bEMSCBX9RSIW1jUFqc6AcJX8ucOqAUlBdXwnrmDqxawyaCqjErUKEQodz6XS8n4KUDFv3Baw1U0p2wVS5HL1koRRWOq5bps1SpQslYKCphpIE6KfY+9JsuGsIO3gtgsDCMDSoRcuBGzK93dzhnPn+UyRfK0vlgLMloIB/pi473aGuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsN3+Hc0Zyjf3eo6bzRyCdA+s2D30emzWYJHPOHFSwI=;
 b=he7L4hfSmLEkR16Ot248b5m0J1bUruDttaKO+ulToQkOmmFYiESswriafk5MYrdsBM8+MkFPldE0vzxSQ/w5uHs9G5V5VDpSYu9tV99A8cLvjc38VXN3vhhii1Nzu3218axHeYGMyxu2fI+H9QfJubDrHRxxrKFVmYKhpQCDSIYvNTCdHiycEcI3pz6NijiDQ/aJdDAgfbLWjwLK4sePquOpPkOqdicIvlsti+ayonmf/ftdZjHrtiku0lGbjpfSOli59eGYUEfw3TV//k2rfi6lpjqF1nS/y0/IW/OgkxKX8+NEPJqhZHKoj7v+b0WAE7TSO4eqWAcm1FiRRRT1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsN3+Hc0Zyjf3eo6bzRyCdA+s2D30emzWYJHPOHFSwI=;
 b=b8x3KFgFVjI+1hSK+ZXJ8q5aSzp7e45Yrlxm7Hxy81aplW7hXK3eSyhOsR5uge4HinuYEAFm5T0D3kiAl2YSL+7uI5+fP0GL17jhxWjyTg0YxiYAYJ8XOpjPomBLclWSZpuqc7axLteBgagd1iDW4emhhr3xkTsrU9XNndX+XjWMW7nH/EyjrIu1NkvkV4D6w3pP884nK6gc9BgOBSTga46n3c2UXF8hCNfqs6uayYvzOJWapmIZL3MZ/IFzrEdrjff4kd7IcS82cvkKayZyNFV0/kaCHqAMRti7J3+opi7EIT8RMc0hzWnDbUDXz8nbw+fd0d/Wn0elqNpL2gMeRg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v11 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v11 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHbz7CcYslTkZ61QEOdjKGC2c9Bkg==
Date: Wed, 28 May 2025 09:12:18 +0000
Message-ID:
 <c0b080618909580e527d7c6cce6010edf5278d2c.1748422217.git.mykyta_poturai@epam.com>
References: <cover.1748422217.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1748422217.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB9PR03MB9709:EE_
x-ms-office365-filtering-correlation-id: 4d743920-f541-4f9a-b257-08dd9dc7bf40
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?daVNnpDbrn098FVLaweoZxClQHK6PkTXcNAV01FwSVAteT9/+znZ6IKUEX?=
 =?iso-8859-1?Q?6Kce/xwZPZm3ywxoyzf6dbCz5hbql2rI9IXplbKjHxG5eyfaf/oOYgo1c9?=
 =?iso-8859-1?Q?809t9GcVcaCVW1t9nwAsvTERnbx/6T2lcBISk4/m5vxXu6Mouj7mhdcxH9?=
 =?iso-8859-1?Q?YvWEo0oGsZjp3EJc2fl/D/+JrgIf/VxGiytP5p0nClx4oRsQJbTyXtZlbS?=
 =?iso-8859-1?Q?mUfJt8MkRwPBejkaQijngBAmzPUwtFudschGF0m7Rp96mVYa+xYjKM/RU1?=
 =?iso-8859-1?Q?fC9gVm70i1JRKV+oklIYFQ/q8N07iO1PeuUukaBgM5huZjPAZkyNNNcKsR?=
 =?iso-8859-1?Q?M8opHEikC36qo6rkoiKgTaweIrxf8S9LT78XhspOl8ohIY1ADruTsW9iGM?=
 =?iso-8859-1?Q?D6/E3Ck+8uNqHlD8Ng0pQY8hPNNl4QhYk/ti0LgwLDjFx3P0HOinkld4zW?=
 =?iso-8859-1?Q?XIFTmI4J7hSE5L036OX803woJvTXvalRBELGtKo+aCxEg4xqe8Qgsbwvhi?=
 =?iso-8859-1?Q?iVbISGxbWdJNabtjhkNF3xy2C2iHHQ4qntuYcZ1Vxj8n1Ob10b5sowOeBj?=
 =?iso-8859-1?Q?XUE/0YVu9bvsQxunO4O4djb76pQCcWA/cIUEr7s2KnmLbO9SVU3hP17qr7?=
 =?iso-8859-1?Q?W+uECASwdkMVqIlAG20Mu6AdsbISN1iJFmOMMi4HkmlmByb+r6znnTorUH?=
 =?iso-8859-1?Q?erSZq8v5bMMlJQK/uRC2QYxpUZLfxLUhRf0t4PD1dOk/4c0XH6ixMPLq1d?=
 =?iso-8859-1?Q?pzKx5fDs3hL9L9F4eWtP2N94sRpVRAkqBRyUojXPXJSzJiM6GqcNrhmsgV?=
 =?iso-8859-1?Q?P69RWRWMpUVLXEs8L9E1ord5HdyWGvMHkoviU32YZ2GKsPOLihc4qbvQBx?=
 =?iso-8859-1?Q?AQk0ybJXBGm4ylR1Dx/p+zUoIwhTobTdxiy8cdeMe2tVGPZy5GLTnY2795?=
 =?iso-8859-1?Q?JEmOw4qpjnso/qeAZfoDpzIG6oCT79FKZOTOcsmbP2p9nrIhdZ78p0Kur1?=
 =?iso-8859-1?Q?cXbnLfkTTBvK1IC8Sv3tDmxXMgmvu6FSeM/N6EsFZrQR12BjmHUndBUkpA?=
 =?iso-8859-1?Q?Gj0QLCKh3CMsQUUMxKgCoiHzTcjU+Jlu+uM+ZGWDqJD4Qc5mmttGM9wwJm?=
 =?iso-8859-1?Q?W9H4aEdH8lVUL69P9uz9agC3VZOsnRZI7prG3U7t/vViJ2bhWbw4ViDf70?=
 =?iso-8859-1?Q?Q5TALmL4U6j/7YiOFzg4q4lyf/RFVwVo0BYF5WKBVDI10HT8mLxAoxYZJs?=
 =?iso-8859-1?Q?08V6AzWNLbZr5VCZ3aCUK85SQdoiUl2nE5Ns9F9cypANPO8DlUk1sWvBwv?=
 =?iso-8859-1?Q?2Q6D/cNAqPZJFLAwfINH3wROQoG3AL+koXsaIBmGPOpWcToBFLQiWwXU3n?=
 =?iso-8859-1?Q?DI7pjcVk530yvYXDXQc4f637crnqfazyekTqKuzB7yUsd9/SSdDS42Frab?=
 =?iso-8859-1?Q?5PwwpLJrrivsOJIkyqaOLpRpUAogxf8yc0zSQPD3GcV1YXaajNfFcyew7W?=
 =?iso-8859-1?Q?3hdKFGPf/0J/oc+tbcDsv5gqwS9s5iDxOhttobKC6AgGKU0xF2k5XKVpgq?=
 =?iso-8859-1?Q?MgDRb84=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oTWkHRaixakLB7xik17MapjxoKrDVQECK0eTWiUZrij22Nipt8Jhhsw3+K?=
 =?iso-8859-1?Q?I502RzAHDv0I9PnfVg+yYdwDrFqFuk928RVvqO4VTXBKOqOt75s8WJqicJ?=
 =?iso-8859-1?Q?Qig8m9uYtZSXRZrnDWYA7gqP1SibR5QIQq4vAKzSFwhZhGTjfB0dyUQg9t?=
 =?iso-8859-1?Q?6FfiZZ60BODVe4zhA960n1f/MicSpjOf2LcjTYzhzgZoo6XrrKZECOZ62S?=
 =?iso-8859-1?Q?HwUqug2oOB8+6PB6I8Ouj36NZt/XoKAzXQQ009hktdV4t8/15SgSLL2vIh?=
 =?iso-8859-1?Q?EpbEaOuumKH0cicKJ6fbhSAtygoOPc5xQOiOnWVnlrrCjlSktrvNeZXKtu?=
 =?iso-8859-1?Q?QjkBrr6oI4piovGknOaS/F18ezfNv3J03aemcl8/PJCcflhN8/3Pzb/rX9?=
 =?iso-8859-1?Q?rn/k/3e9M1WsClJwdCmq0KDmBn1jp2GfBLsGDC3u0sQjfLhh9xfNCBDOxg?=
 =?iso-8859-1?Q?JX+hqMNm4O8bezrS6LXlYX+fISpIL/f4ziYVLpY9NoBywMIK6ys4rAONwi?=
 =?iso-8859-1?Q?s5OBnAPoAXry9JUUoWTA2lT9kK8k1432BeSbIbYi73Xi+/DF8OipvKj7ym?=
 =?iso-8859-1?Q?xPO/YrGqDONYCIzYBaibrNBR2dlWGTHAH8cOFBdJo/kx4k213oKudSpp6w?=
 =?iso-8859-1?Q?vtAXI1jYCSkQE1BjAvYmcMUNRP17/p5RYKvwcbygTgUZuHvSmZzyH2W1X1?=
 =?iso-8859-1?Q?qPOSMB5+LLVo1sh3bllQoiRDet+01AytzLrJnPc3ZmZIfaTN+1Jmu7P3Bk?=
 =?iso-8859-1?Q?OOoe8xAi/Y/ayTuE3ivEjQ6oALFaUSsNpWxl+WWlCMDJWiwVN7aRx62pcI?=
 =?iso-8859-1?Q?B1XvlegSeHMsNpWAaRXpnk06aRZCwliOgFEbWfKDNAFANWHVjEfUSIWuVS?=
 =?iso-8859-1?Q?Ev0QxpUhxW69xjUIsrF/i+KFJL9D/QyqvLVSH2dW9LDZWLMyGs7yFzNMmx?=
 =?iso-8859-1?Q?o/yPy1j0p5gv+OP+2pTtvzr7f9vjWjhE2jTc80/SuP/aTNoz/NwXgtkdqF?=
 =?iso-8859-1?Q?SpAKGSMAEIh0+hGPDMPPl7ivy7byL2I1zAD+yj47BNpatiQ+HZHjG37oCt?=
 =?iso-8859-1?Q?biWxcsOQFKzpuUNcO37O+/56gDSbY4iN7v3EUUxoIseH8Z7Ruu0JeExESg?=
 =?iso-8859-1?Q?ZD+WTnDoQSh6+UnscIcNo9BWSdnNviyYhWXbekEvjVNbs8ph0Uy0c1nX+X?=
 =?iso-8859-1?Q?c+f/1aZdEV7IjetjMxD2N8pzQlkjmiDclz3oGjk/sAjcwuRdQKgSqH4fXo?=
 =?iso-8859-1?Q?kpje1Gi1VH33OZVX72QYO2McIHMqLmsi0A8zbeRuUPTiExXsio3dDMkOWa?=
 =?iso-8859-1?Q?ddqWhnYgQy0jcRR+Tb42HFjLu0tB1kQA8vPkrf1+/9o/ZMEIc3HFfBPZjZ?=
 =?iso-8859-1?Q?2cuIUp7k2rtSC6jHjYGexWuakOM1oqMdvVw/KXuxZq/8xGMJlKzHDriCeM?=
 =?iso-8859-1?Q?g6LBdZfGVYlddma2FmTizWa6aoliLQR5y1S7IxxvCJxNfIElj1bIu+DIU4?=
 =?iso-8859-1?Q?9yChTL/RN/Ktl+ndU9fZRQkmVQOLQyDNJm7VYJwAz7Y1JxkxDGrQx7ajiO?=
 =?iso-8859-1?Q?kNKUFp4rmO3w+JrXuDcHlVmy74RkoSqp7EkdB/R7Syx65tyL3aG7/hV4vk?=
 =?iso-8859-1?Q?IxWtj9gT0oHAYk+KC42XqF7kOwWopuppnGV19R99QZgNdX2JaHe0zSPQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d743920-f541-4f9a-b257-08dd9dc7bf40
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 09:12:18.2184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDp4VJdTEmb6VQxN4gV8MOiTNEJRL3+QCWa59wckpaFLP0b5xiT7HqnqvArA+Irlvk4zwHNR96Cy1sl3TH9JQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9709

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Enable the use of IOMMU + PCI in dom0 without having to specify
"pci-passthrough=3Dyes". Due to possible platform specific dependencies
of the PCI host, we rely on dom0 to initialize it and perform
a PHYSDEVOP_pci_device_add/remove call to add each device to SMMU.
PHYSDEVOP_pci_device_reset is left untouched as it does not have the
pci_passthrough_enabled check.

Because pci_passthrough is not always enabled on all architectures, add
a new function arch_pci_device_physdevop that checks if we need to enable
a subset of the PCI subsystem related to managing IOMMU configuration
for PCI devices.

Enable pci_init() for initializing Xen's internal PCI subsystem, and
allow PHYSDEVOP_pci_device_add when pci-passthrough is disabled.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
hmm. Since
  dec9e02f3190 ("xen: avoid generation of stub <asm/pci.h> header")
Should we also move is_pci_passthrough_enabled() back to xen/arch/arm/inclu=
de/asm/pci.h ?
Not sure if PPC/RISC-V will plan on using this check.

v10->v11:
* always_inline -> inline
* add comments
* clarify reset sub-op handling in the commit message

v9->v10:
* move iommu_enabled check in a separate arch function
* add Stefano's RB

v8->v9:
* move iommu_enabled check inside is_pci_passthrough_enabled()

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
 xen/arch/arm/include/asm/pci.h |  2 ++
 xen/arch/arm/pci/pci.c         | 14 +++++++++++++-
 xen/arch/x86/include/asm/pci.h |  6 ++++++
 xen/drivers/pci/physdev.c      |  4 ++--
 xen/include/xen/pci.h          |  5 +++++
 5 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 7f77226c9b..d6e05f16b0 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -128,6 +128,8 @@ int pci_host_bridge_mappings(struct domain *d);
=20
 bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
=20
+bool arch_pci_device_physdevop(void);
+
 #else   /*!CONFIG_HAS_PCI*/
=20
 struct pci_dev;
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 8d9692c92e..ca825ee3a6 100644
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
@@ -75,6 +76,17 @@ static int __init acpi_pci_init(void)
 }
 #endif
=20
+/*=20
+ * Platform-specific PCI host dependencies require dom0 to handle
+ * initialization and issue PHYSDEVOP_pci_device_add/remove calls for SMMU
+ * device registration. This check is used to enable the minimal PCI
+ * subsystem required for dom0 operation when PCI passthrough is disabled.
+ */
+bool arch_pci_device_physdevop(void)
+{
+    return iommu_enabled;
+}
+
 /* By default pci passthrough is disabled. */
 bool __read_mostly pci_passthrough_enabled;
 boolean_param("pci-passthrough", pci_passthrough_enabled);
@@ -85,7 +97,7 @@ static int __init pci_init(void)
      * Enable PCI passthrough when has been enabled explicitly
      * (pci-passthrough=3Don).
      */
-    if ( !pci_passthrough_enabled )
+    if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop() )
         return 0;
=20
     if ( pci_add_segment(0) )
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.=
h
index fd5480d67d..61d8043fa3 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -67,4 +67,10 @@ static inline bool pci_check_bar(const struct pci_dev *p=
dev,
     return is_memory_hole(start, end);
 }
=20
+/* PCI passthrough is always enabled on x86 so no special handling is need=
ed */
+static inline bool arch_pci_device_physdevop(void)
+{
+    return false;
+}
+
 #endif /* __X86_PCI_H__ */
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 0161a85e1e..21c8a3a90e 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
         struct pci_dev_info pdev_info;
         nodeid_t node =3D NUMA_NO_NODE;
=20
-        if ( !is_pci_passthrough_enabled() )
+        if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop()=
)
             return -EOPNOTSUPP;
=20
         ret =3D -EFAULT;
@@ -57,7 +57,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
     case PHYSDEVOP_pci_device_remove: {
         struct physdev_pci_device dev;
=20
-        if ( !is_pci_passthrough_enabled() )
+        if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop()=
)
             return -EOPNOTSUPP;
=20
         ret =3D -EFAULT;
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index ef60196653..130c2a8c1a 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -79,6 +79,11 @@ static inline bool is_pci_passthrough_enabled(void)
     return false;
 }
=20
+static inline bool arch_pci_device_physdevop(void)
+{
+    return false;
+}
+
 #endif
=20
 struct pci_dev_info {
--=20
2.34.1

