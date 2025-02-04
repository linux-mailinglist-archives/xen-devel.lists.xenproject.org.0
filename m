Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E35EA27373
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881488.1291702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNZ-0001Be-8F; Tue, 04 Feb 2025 13:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881488.1291702; Tue, 04 Feb 2025 13:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNZ-00017F-36; Tue, 04 Feb 2025 13:54:17 +0000
Received: by outflank-mailman (input) for mailman id 881488;
 Tue, 04 Feb 2025 13:54:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jloo=U3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tfJNX-0007bp-5n
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:54:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f403:260d::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 845d4309-e2ff-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 14:54:13 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB10120.eurprd03.prod.outlook.com
 (2603:10a6:20b:57f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 13:54:05 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 13:54:05 +0000
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
X-Inumbo-ID: 845d4309-e2ff-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrbQioc10REbxMafjiGLMIMBB6LSnmbrkuatcmu+HXHRYIiUQR590uxMI0J5ABRI6XiVDVQa3S5TuWrSSD/mWWjRr608s0nRsu/5Sk1duVSEgEn0ObC9F/ZiBQh5ZFXe4h1i/DrU1GU/5Hfcsw+LM6Jv0K5bzrt7OyQzlhqdEKYvH06BOHvtfvY6RYpX9yBShzoCpFEaIkit+q+TLMuOVVXemBQaQsT+VNTIst/IOZBOSDEKP7k3bDys0tOPHdneFqp21Vs1cDMhLF5nekN7A62UmRaVO6xAkBhiIQOsOfSaEc87weROzXkd1WFfaEWX+wanS+0G+15LrgCk5RwFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOv/bef5Zt0oQozTpFIdNHzB4w2PEWBoFld5FZnj5JM=;
 b=Mr4kUFb0vZSRaZX2Kw/LdyxbH0WvQLYhN8AoBhlqhq0fYkD6lh6boVHbvHIs6rH5Pz/xvPGKLkXofGIxKDPItgTwmzIhIQvoGNWUhLYyYaaN9E3gZUtZGoWFg1Wq/USx/uQHrMcVEEFG8YscOoANPEhKVafB6XDNHAnKd1h0+TX89mzEs0o3jAQOyeWw2M8C/QnsaJAGoWbtl09WLUrx12brCh9v83yo1OUEdzmrniKmYDdBZagSa7nUY0p4jfBCx2xFgMfUkH7pLTo2QD/ry6tz1SUrqX+FzoHYf0Kry0GrG4T4yz1ynodmSmTbE8/odYgtxetRzUgrhkMhwFYmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOv/bef5Zt0oQozTpFIdNHzB4w2PEWBoFld5FZnj5JM=;
 b=C0I3VZoOIR2UHepz8TVJthwGpUQgJzPX1YlBBKxNWrlRQ0/D7mda7xAO+jXCdsK/QUDXF2/6ar2CRPBgRO6E8Q8DI2FJNOqB5c7TZAEfVNKs7wTfNbpFiBu9IPbjARKs6znGUbH6tT/T4acfIsAUG+VEU+Xhcth1OnbcA+JZsnhlR5iB2n01rFnyoUxb7cFB6qhcdhmhJQSAi2HlBku6RT36CJagROXZ/Ka0WMJLELG7tI9fUKTImnjIdzyGC+9qSZpxZRsKSdUS5mWsqwOBR8u5iAvo+WccpSb/014vGoFIXvkyNq129vLFZznjZICfKJm/K9ZPK4Rd9LKkVW2U6A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v7 8/8] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Thread-Topic: [PATCH v7 8/8] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Thread-Index: AQHbdwxBkPL/bZ5O60y1uwygJe576g==
Date: Tue, 4 Feb 2025 13:54:05 +0000
Message-ID:
 <dd22e231b4f3309800cd9652f4c5ae50b355267a.1738665272.git.mykyta_poturai@epam.com>
References: <cover.1738665272.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1738665272.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB10120:EE_
x-ms-office365-filtering-correlation-id: 9ae0ff71-c690-4137-9f39-08dd452363aa
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?mkEP3Jel9qDBjM10UQsJwU2cTfPBbZl8c7KLDBOq5QBf0+QXi5g5WMVWPP?=
 =?iso-8859-1?Q?2f25fF7cHCcYltv+n6cSDg6aPPf6dz3QI0saVUtBngeySh0+MyWWny+tEF?=
 =?iso-8859-1?Q?b0mrKPRGJ3/ioWxIkzU61/p930nPtoWNQ6agZrn7KxjgpDFl2AdtxBj8uF?=
 =?iso-8859-1?Q?PHj6gyb6QODRGnDicqpdSL3PkGLLwvTX2EmsY+XaOx4kUQt1sIjyztVumt?=
 =?iso-8859-1?Q?bxVCknnCAUey7QUlbGTPiewqsXBV6o1MDV8BA8LgCm0s46RdaQQ9sWc2w5?=
 =?iso-8859-1?Q?8cQBYGmn8bryC1+NorXW/gNYgpncfCjQ/w/dqqm8bkZqzkXZ84VjX7Trwd?=
 =?iso-8859-1?Q?U3snECxn+VaCclVm1eIECuqd2HwqokCFmsi0GxCGYNRP9zLZFAziE2dmFF?=
 =?iso-8859-1?Q?vZxQRvrJsFyHbkHomyg7/DFDsFfMUok2nAb0a+2+3L/GsrpSiu30iP4OLD?=
 =?iso-8859-1?Q?NRjBpYQ/lo9Gepfu0S3Zm4m0yffZcLssgh0zlZLFdEvY0eQC1fSG0+aIHh?=
 =?iso-8859-1?Q?5VATePViq4fJwk0/pTz4Z2dx95FVsuJdgAlsju7O32kzh2wq6AhGJAu6/O?=
 =?iso-8859-1?Q?aofergT9fVvhhZIIPzIq/Rli4J38/2j7UfTXqeGmyEA22b9p2GDqN5G0mO?=
 =?iso-8859-1?Q?BW08Exxs+JbbbmUyDKNrpdPZFuRQem4cGCGJP//qWf80bFZAfeylkdZRbH?=
 =?iso-8859-1?Q?lt4GAyvIFggFFLSUVCPu4WO6XY0ST6hNB96SEA/OsBIqNe9zI89+Y2ENIR?=
 =?iso-8859-1?Q?nON+JD7xTOVhy+Pemfnr5LlfOPgA3rnrtqYrqceUv3NN3o6321Mx3skfi9?=
 =?iso-8859-1?Q?T5iIcV3HOGkWtGCSV1wb9s/1wElQZwGFkTVFHixWBHs8k23CuTgXnm3gU+?=
 =?iso-8859-1?Q?0xGuAGH8HSknEqbyYDAohWb0pyCbEVave344oAPcTtncs5Tx699kT5Vrq2?=
 =?iso-8859-1?Q?X7EhiB46aWGYTc3uzWd6/OGabLQi3ZvGhGTEa0CeBWwww3HA+GFNKppH4B?=
 =?iso-8859-1?Q?Y6Y0k8liz0c/g4fcDh4eitmzVnVJsWiZ7LFtvy9ySZdW5QHAK2dpXk5kf7?=
 =?iso-8859-1?Q?NoXMmO+Z1Y48pFocpLtdFM1kr1SZbwJLnIQZDKrY5IAK8s8p1635jyGuqA?=
 =?iso-8859-1?Q?cPbYkW9iEnMT94JhkNWOUj9clI9CoTUxlvt8t+KOmGW+j8MvQvsoBKZhJj?=
 =?iso-8859-1?Q?EfKLPbjJeoWgBteWAxJvcJ/H+Dm/cw5B8vp81p7EOux0y+YYa9lvoUXUGF?=
 =?iso-8859-1?Q?3FZRCv5rQYw3kBfD4dKZvkDDin0+k/KDCWKFPacTRUDwXftljiJ9lWmf4R?=
 =?iso-8859-1?Q?ShpcvBvEkb/oYBxvLPEtQq7zqrjLLCmC/t2x8gkam+ul0MNrgaGAGHoQgQ?=
 =?iso-8859-1?Q?DzzE9opNjz7+wi1EAM4UI50tGXVESvWEX2mw5qhnQfdmUxuZ8sdxEnPE9F?=
 =?iso-8859-1?Q?9AwCAoeS23uVyvpnwIsH+FFflhIzs0aLf53yxQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WJALqx/B5yhM3Eor2VRKsPAujeOki6CYDb+lam6F/EZ+hgccg7+sb31QGp?=
 =?iso-8859-1?Q?4im5Uo5UsJ1NBSKtlah+wl/EcYjVRHkYPWqmoF6jFF3hhOg8VP3wXcHBMj?=
 =?iso-8859-1?Q?1lxhXGwDjC+pfQdPW6XI2yJgHEvIGVvO5+/pQjl5kXEe+dITYRRwgFHPGm?=
 =?iso-8859-1?Q?e/XhG6HZDgYZY31dM6B5LWXjfzJefJEHcF8yxybHLGp7gj84p1fBsfgaYc?=
 =?iso-8859-1?Q?Lx6lqXqonMCMfxZFuuhthTG6zn+eB3dH3r64IciSMIZoxISqXxPAjMWJ8x?=
 =?iso-8859-1?Q?SZGt6DNIcGwnqICpsr+ScOCJrHipKAROIUWYKf8siGaRmzwgSPJO0cTSLJ?=
 =?iso-8859-1?Q?g9qLbCosFkmWjRnxqNwvEpZxRnAuIr4oDGXIZZaEAitoy/AHKosxW97Wtl?=
 =?iso-8859-1?Q?wAUfs35TC089CHIvhap1rhPPf0jDqzLV8AGpTOICQrxOavAN+AnUDPQnkv?=
 =?iso-8859-1?Q?NRxqorqJrnT0kCEbjUMZOEI6jmazuHOXRu+XTVdpCDIrnRZ1krzzt9nODU?=
 =?iso-8859-1?Q?4thmYVPZ8T0bpEIZ8eMXdE8m+9+Z1Wtw1twPQQFwaxLgtfQRRdLPz7Cip9?=
 =?iso-8859-1?Q?jvlNTQ6WCMKt5UNllnVVH3s00v7uOCgILPxlHJi56fgc6IhSU7fEKb4h4T?=
 =?iso-8859-1?Q?tW9SkdcxvXNPDoKtMsianXDQbNeTCAf/3kcEpOT+DAzm4d/bjxY2SvbEyx?=
 =?iso-8859-1?Q?/nqIwJxK77YRvvzBdeuRps0iiwxMMLHYowfsPpEKK6Z5MxiIBLONFk/tOu?=
 =?iso-8859-1?Q?f/NmkZH4sj8+uD1OqJwOw+bmI9pDrShGcxxZEntG3qjPZdZA+R3NeXNCjA?=
 =?iso-8859-1?Q?svahaAOFFMl4U0NINsIDY/WffGn2YjGQkahstUsE1Yj7HKYOOfJ2oE/Cx5?=
 =?iso-8859-1?Q?XEeXniK8NzOeSGTTdEU5vx8lE88+9VoWBKm+BRZWaey1NkO28Dik/MZzvF?=
 =?iso-8859-1?Q?J7NEr18OQzzqm3HjGhjfQzNYyPVoPuHdHGKoHWDp9bfVhBf+YLiwcOPI1M?=
 =?iso-8859-1?Q?eLJcMJN6YzZvAR6D/G0/CcrtPezFcxUGtpuabq7eXxxXfn4OQr9qIrevZr?=
 =?iso-8859-1?Q?LYYM5b/s1u4trLQqO+D2UhFsLhpaq/fgcivw04H4nElaKqz6/jzEgJ50Vg?=
 =?iso-8859-1?Q?bI6HRZb9tfIwLERYuvEodEehxD5BIPal6isOy7s+ByyAuO7R0txzG9PkXw?=
 =?iso-8859-1?Q?y9/op1Vcx4TwXqBUoj63n6kiytRl4lfx5gfi4v3VbPdT8GzbHRj/Vbdkil?=
 =?iso-8859-1?Q?5WpPZ+jrdjGxbFdmceNKVDGigmY1+oT7zlqFRaWKsDpdloUf43vem69HY7?=
 =?iso-8859-1?Q?thOekAf8kH7NMPFdNpJSD0e1r662vSZABvWFPAEVt31mTCklBJtbPkFk0y?=
 =?iso-8859-1?Q?HWgjGjwSKQ6hMDOJsiyLs7WH4EaVq5jJAFOxOGR4n5G6bB0pPL3MN/UxSh?=
 =?iso-8859-1?Q?yhuz8uZ4HFJZ0aUvbnVprdS8uP4g4QWuofbNimtRfLD5a3cnRFeodA1ZyV?=
 =?iso-8859-1?Q?VcfyZxt+yjtM87wbxnf3rzzpRnX+cmdH6GDOw1s2UvbJvaDs0wYpNvbXV4?=
 =?iso-8859-1?Q?PFMGZ+f10E8BD3WOrIa6noRt/faZhT4cgd4SEOHMTjKcIYkb/rTJSLZvWP?=
 =?iso-8859-1?Q?liujUd+QRrxBYiFBMiIt/KSSYrjyiWvlPQ7ycAtiGTo2mEbsSAlvNvZA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae0ff71-c690-4137-9f39-08dd452363aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 13:54:05.3010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0IruJEtzZ9AOpNgeFwa/cnLE1dP12vL5D4rrE/cn4AfwN1Wo4ejjmFW4ay3RzpxcsqlKdycYwmJ4d7IrRWmw2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10120

From: Rahul Singh <rahul.singh@arm.com>

When ITS is enabled and PCI devices that are behind an SMMU generate an
MSI interrupt, SMMU fault will be observed as there is currently no
mapping in p2m table for the ITS translation register (GITS_TRANSLATER).

A mapping is required in the iommu page tables so that the device can
generate the MSI interrupt writing to the GITS_TRANSLATER register.

The GITS_TRANSLATER register is a 32-bit register, and there is nothing
else in a page containing it, so map that page.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
This patch was originally picked up from [1], and commit description
loosely borrowed from [2].

Example SMMUv3 fault (qemu-system-aarch64 virt model), ITS base 0x8080000:

(XEN) SMMUv3: /smmuv3@9050000: event 0x10 received:
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000800000010
(XEN) SMMUv3: /smmuv3@9050000:  0x0000008000000000
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000008090040
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000000000000

Example SMMUv2 fault (AMD/Xilinx Versal), ITS base 0xf9020000:

(XEN) smmu: /axi/smmu@fd800000: Unhandled context fault: fsr=3D0x402, iova=
=3D0xf9030040, fsynr=3D0x12, cb=3D0

v6->v7:
* add tlb flush after mapping
* style: update formatting
* revert back to printk with XENLOG_G_ERR

v5->v6:
* switch to iommu_map() interface
* fix page_count argument
* style fixup
* use gprintk instead of printk
* add my Signed-off-by
* move to vgic_v3_its_init_virtual()

v4->v5:
* new patch

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00483.h=
tml
[2] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/623=
2a0d53377009bb7fbc3c3ab81d0153734be6b
---
 xen/arch/arm/vgic-v3-its.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index c65c1dbf52..376254f206 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1478,6 +1478,26 @@ static int vgic_v3_its_init_virtual(struct domain *d=
, paddr_t guest_addr,
=20
     register_mmio_handler(d, &vgic_its_mmio_handler, guest_addr, SZ_64K, i=
ts);
=20
+    if ( is_iommu_enabled(its->d) )
+    {
+        mfn_t mfn =3D maddr_to_mfn(its->doorbell_address);
+        unsigned int flush_flags =3D 0;
+        int ret =3D iommu_map(its->d, _dfn(mfn_x(mfn)), mfn, 1, IOMMUF_wri=
table,
+                            &flush_flags);
+
+        if ( ret < 0 )
+        {
+            printk(XENLOG_G_ERR
+                    "GICv3: Map ITS translation register for %pd failed.\n=
",
+                    its->d);
+            return ret;
+        }
+
+        ret =3D iommu_iotlb_flush(its->d, _dfn(mfn_x(mfn)), 1, flush_flags=
);
+        if ( ret < 0 )
+            return ret;
+    }
+
     /* Register the virtual ITS to be able to clean it up later. */
     list_add_tail(&its->vits_list, &d->arch.vgic.vits_list);
=20
--=20
2.34.1

