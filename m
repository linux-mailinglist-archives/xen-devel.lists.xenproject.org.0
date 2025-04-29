Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED8AA0ABC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972140.1360574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVZ-0000Ao-2x; Tue, 29 Apr 2025 11:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972140.1360574; Tue, 29 Apr 2025 11:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVY-0008UT-Rq; Tue, 29 Apr 2025 11:52:16 +0000
Received: by outflank-mailman (input) for mailman id 972140;
 Tue, 29 Apr 2025 11:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zRN=XP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9jVX-0008D2-FF
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:52:15 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2608::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6467fffb-24f0-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 13:52:14 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI2PR03MB10907.eurprd03.prod.outlook.com
 (2603:10a6:800:270::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 11:52:11 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 11:52:11 +0000
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
X-Inumbo-ID: 6467fffb-24f0-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s93HuYsABjg4jG/b5FGliZ5tAkj4MFZGwjBIYXcQxkQgaLMdzPtQjFkCHThSm92MLJqRJjkS4CdMJUuZ5cY6t3Xl1sg6zBB9fAA0rIeuIuY5bkg0wgY8qgiCD3lqVmKy72E0iCMFvbQGsS+7U/KjuwedwMV1Gnc1won/E/AeHle3aTkPXKP2ge5c/Qrl7y4tR+C2J5g/3OBUoTFF6YoJ3HbAUVjSQ7J/3+ihD7CtdKocQ7l0M5IEiJcYO3wH8RzDAHokG3zIKwCSm9KGYraqbVwvR8EV7ezlYwl8tO+OPBOs57ibID15kiJkRoIpMMUM9+uebqcUwsqPFZHLm/LGiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsK+NDcogxQ4tQa4AM8elaoQkhxa4D6CDx3Ped4aQy8=;
 b=llGEaKpEaC0LrLOqq+tZfYwgc2SgRngBKKpuBSwPg0LSCMBr8RnZRZnGbxROflEWZsDm9lPth1rm5cFyTDGSx5q+cdA1iATKIVnMUOpFGryN2vmKmIfnvtuBczZib9bhfCeZSdElaqkHgU4ChYt+u2dCnsP2dQoIbVb2LnQgCDjPn7m3orH7ZE3GGIzTOfLV9N/nvUySLhWhz5Uws98AwOeVQ+/STJ7kQIRbGziZEv3ntdXFRacnR/Ge8OiEV0QyGHylJ/d+bYTTIGhzv4g7plhmy2xZrM9XEF1t5GQOfILtQK9arXUiICioy6ysfv50gzu6NzMWj5y5VgS8yOZh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsK+NDcogxQ4tQa4AM8elaoQkhxa4D6CDx3Ped4aQy8=;
 b=Od46jul1vBUH9OT99nXRjwTcYM8m0v6vMxbJ/j6R541dzTYLoRrd0lmC+hsTmEIzNugVLfrWIdyh7qdO2irnmgMZbiHmiqMGrh8QNC6TnJr8phcc8iWQw2ks7ZMDTRgfJdQ1+/HRzQ6qVped+9M1IJTYp5jKfPNjjZwjmr7/+dSo5L+0cyss2mQyjtleRa0onkQ/kvVFbOKOeQEjmJ50swFu6K/V6rXGRJ3M9pdwLoF09qfl2mlYF7UJ8Tk0+cVku5D82gGMksOQwq7oWMQAvISVYxj0+xb6WDByz2WQ5UV9cfwFtyDgrvgJ/VoB+JmMaf2+2N+ikRQv1fsxm6waJQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v10 7/7] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Thread-Topic: [PATCH v10 7/7] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Thread-Index: AQHbuP0kTLZqYRB+4keNMzg1ePGW7w==
Date: Tue, 29 Apr 2025 11:52:11 +0000
Message-ID:
 <c425567d767e30a7750c0f93cb618d3e3381e039.1745918678.git.mykyta_poturai@epam.com>
References: <cover.1745918678.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1745918678.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI2PR03MB10907:EE_
x-ms-office365-filtering-correlation-id: c694266e-9722-4b48-2c34-08dd871446ed
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lfj00ehfPkdbkxk9OoK9tepM8oAdvSyAhEYwytnYg2vsa1SBkXXqPXtTlV?=
 =?iso-8859-1?Q?7PetecgDRtF1PrZ0MMLYSi0cUfHmceJgmArquygdrqoHt0neClKHBXzMEH?=
 =?iso-8859-1?Q?LlxnmFbW2QxNlzWFyBh+dxNus4zhMHgsZ2uWyG3cDrDln8FRo+ZOgdYKX/?=
 =?iso-8859-1?Q?L0SYSwv2WB2UfnnkxhqY65V64Pf5LGpHBT/xWMbdQbEL5guObPd+ODkWRX?=
 =?iso-8859-1?Q?dxvHjdloH/7AlqvwO90DlNLgVQq7zPFZqd/Jmaw4NE8xtg++Ybhh9/xbst?=
 =?iso-8859-1?Q?mdXEy2bpzrVBxooQbeWPD6jnvp9/SnVLD6XzGMXu93sYgOfdCfrVMgJFys?=
 =?iso-8859-1?Q?p1SEGVee1IeF6Ab0kMf0gE/Gp1Uv92ZcWpOBkO0wfF6zODTIZhQh25ZN4P?=
 =?iso-8859-1?Q?fC2txtLDOwHKPaGfZp17dDgr3kb1dOKmJU15RirwjKGfyuRel9t94/Ewbg?=
 =?iso-8859-1?Q?WA24aB60TIBI8ORBhRjlzKr7VW41H8WI2dSQ9YFKOzyusJoRkUv5gHaq5c?=
 =?iso-8859-1?Q?NeI6A2vv6QfOwLfcqFU/Mpmijx9Nb2szUUhOUWsaf0yh9uVDwXDbA8OgY1?=
 =?iso-8859-1?Q?s4BBGYh0G1ckmkUygaXv1sAOLX3falvnwpJMxwwWCexslyMU9xE11wUZSx?=
 =?iso-8859-1?Q?iT3vCsw2Cl0vKP396wBbhnrpL2CtFcLGj4ygP1NPFhyO3U+N3llkMsM0UI?=
 =?iso-8859-1?Q?BEDxWAuvimT93ZziY4TG6Nnt9MODEOZsxerwnpFRbsz/KLK4CA6kpc7Yxp?=
 =?iso-8859-1?Q?AYomHF4n3/x6/04IMBT73QTmQdpuegv19VrcLF6iCfdJiOfAltkfwXt0pf?=
 =?iso-8859-1?Q?n5ziTU7Lj8jkunr45YLrEkpFVUtr181yDduqViYAiEhC1FSxdyeIbqptIr?=
 =?iso-8859-1?Q?Wj1UVbkoi6aik7iDbIMkb7wB0ql5VnQzLRvCu5+FBBUlhTABH06COqNoiS?=
 =?iso-8859-1?Q?xVHA4W5uij6LG8aU0ywfNC4ht9w2XL3FxhyVgLTmrDp/Dd72xX7sBYi09y?=
 =?iso-8859-1?Q?gmsf2zr54CiufMiSxBiDu93vxzSd8+FYadjXv1KT7pvqcLCXrppDy92Dqz?=
 =?iso-8859-1?Q?aT9LRsAWcbAyKu55Ge9987IXFD2Qmvk65dXsYFojPD0cMrBzapv6i3GmnN?=
 =?iso-8859-1?Q?VGLIOmu88lzCwZ7BoUoCHkDMioN+1uRkSjOUUPiEJWSmh/1fHDS71c0oeU?=
 =?iso-8859-1?Q?bHh0odOQr3eNdzzq3CDh531GvPjlJQw5h6cAXDs/AvvMyxIyLQH1L7szmM?=
 =?iso-8859-1?Q?LmxpdkE44/HAme6RwKSfj74eyVGlX1+YLt1R+NocXI7lCt8qB/OpE0NtQ1?=
 =?iso-8859-1?Q?KCCPDhWymQu4b83WdZz5Q1cxbVQetoQEgi2YWIkwoSPGy/0gr2yD3n8fGA?=
 =?iso-8859-1?Q?5sDImpAHRoB6wTXfzurmDlvSwljA6gkphjvlrMT0GK6pOFMiE2fVuVKw2H?=
 =?iso-8859-1?Q?L7xjl0F4XwPQx8f+W/GhjgKriv6Wy6cBrOf8QIkVCcB8LzWGtL9BCjFCet?=
 =?iso-8859-1?Q?I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4wiCZH4DDf78jH5kt17khRWc+9BlmIaI/zuHQXHhoHoqhxfAcxwjJT7reQ?=
 =?iso-8859-1?Q?z7dp/g/ZJs4iZwXVz0UBoPww4m1Zi2zi+fVxy3FVcHVVg7TX/yB6gR8HD7?=
 =?iso-8859-1?Q?sGFzRXx3XlvDCd0JqpkXg74yuKcVQNvBHLZvqwroLmtVJz4C+9W9SItmw2?=
 =?iso-8859-1?Q?fe1qA4ioC0dnMPM+SxrkOmt2OQ3rRERm173wLROZt5d6Z32zhD7q1DrYAS?=
 =?iso-8859-1?Q?2mp5dHLPXkXWrL4d71z6P25VmQboqCD/pmFdZ8AV41t+RG1YqB+0NY9js9?=
 =?iso-8859-1?Q?SyoC1uYJrk0bD6fNFH1jS6Yc/z4YMhGWsQj7e83Xl9HWXGjMvwfRWY1UP/?=
 =?iso-8859-1?Q?h0F33DNC6CHF4635pdYJmJLgr9WQz8zkMatq5/iAHbyOnmrhCJFBy9rTgj?=
 =?iso-8859-1?Q?GP2M+5sm43hF8ihEl6GfgN7D7y0v0SjCDiAhLA7HuXjPMreoiSAX901lzK?=
 =?iso-8859-1?Q?uS7QVNtURJQMTECD+W4dhYoJO1yAhf87zjG4hcYG684STtXNbrD0G0Iy4j?=
 =?iso-8859-1?Q?sidEAVUGyCT3evnKk2J0uYKUjIyJ4hel06s4IKkZaKLCMu7W22oFdODT3L?=
 =?iso-8859-1?Q?PgdaoaFjerZ37kpPQeZn97nDgrNdc5gnxk5K9OYhkYxIJ2N3z7Ha5mN2mH?=
 =?iso-8859-1?Q?gC1Nf6Ymq/Reup+auYOfHY3RAlQRMyJgfYz8HhWqJ781zMG2G6BRRMs2cp?=
 =?iso-8859-1?Q?W8wt6e4PKwletk/F70mxE0HHEbbzRllnWgXHTE/AICnuitNZgPFJB3Kanj?=
 =?iso-8859-1?Q?JHqJ+69rDkgeBlNwjVrS57Q4HNHFNjgRnVCnWSRHiI0c88KyUyDK1Y4UBe?=
 =?iso-8859-1?Q?VXTySjqKam/ztBduqccl0QhFU1CC6HW1b46CnT9yhR8R191dbOpt2uZY3D?=
 =?iso-8859-1?Q?nfVsZyZITUXF3yHjwHRpgNYWm+rLmWf+F6B4XFIJMzfgQFPq7VmlVIvYsp?=
 =?iso-8859-1?Q?dgdeRvuqtDPB4DjbHfJuocdNzDsLpGJJ0lKGTwLp5VIZwomHxn4q53a+Qh?=
 =?iso-8859-1?Q?hdNfAioipUcms+JZ8CSDkiFZ0Vt5sWQ9Gd76wbMBND71H699dsEK3gdgSk?=
 =?iso-8859-1?Q?3poeLBMfatVxJBQOcBS1QJv8h1WTiVGarPEAkNjXZgU5FUzOE4AUDKnlAW?=
 =?iso-8859-1?Q?7DOwz5WqAnu7ATjYX5we3ys9AxDsD0cbEP2YDi+xQe3xb7zmAJhNGTfdtm?=
 =?iso-8859-1?Q?u9NMV3z2/UTOn2fY1WrC4VAgvaF/GobFuqS8PKRny2yUDqBs5GH8nwlHuM?=
 =?iso-8859-1?Q?e8+7vHDFiOc9CFsTSfistmR/hHUL3CmhJcDBm1J7PTJZdl1VdyUKkCivmP?=
 =?iso-8859-1?Q?JfUq3RVfW9YA8SP/a5qj+HRiocyyUgE/1I3NkZICN2MyNKHQsZ+CtNor+O?=
 =?iso-8859-1?Q?3gW65Hyj93+qRRrcI6RwjCeQ8KMyAKPozdIejQ9ONOP/5Nyy2nOG8Pp0DL?=
 =?iso-8859-1?Q?LEZofVk73/Dto6BUFw/H578n3nsm4YWlWy4xr75FbSvseLX5E9YbmGq5XJ?=
 =?iso-8859-1?Q?uCd4bFU5MTCMip/aEYMY1ry0HKE/4+/Zom3L7p9HGKC0zt18R8i9oRj42M?=
 =?iso-8859-1?Q?FmMaWa3cRJ6WsRFUY3GlZYyGrAew2WDMBd9rCcxlidr2pdjBYlvSMLV8Cu?=
 =?iso-8859-1?Q?VQRBNH7e+dWACOoeJhhQ61H7zr7go9cwmuM3KZHpGbJf+D3k4aC1d2Vg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c694266e-9722-4b48-2c34-08dd871446ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 11:52:11.4879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dR1Cawb0c3rYDcZZByDieUPVksrWZC/SQHaymI6y2mx2nB/qrg0qzs1asFH3fPHZ575fSY9YBFxgIxrSClgI8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10907

From: Rahul Singh <rahul.singh@arm.com>

When ITS is enabled and PCI devices that are behind an SMMU generate an
MSI interrupt, SMMU fault will be observed as there is currently no
mapping in p2m table for the ITS translation register (GITS_TRANSLATER).

A mapping is required in the iommu page tables so that the device can
generate the MSI interrupt writing to the GITS_TRANSLATER register.

The GITS_TRANSLATER register is a 32-bit register, and there is nothing
else in a page containing it, so map that page.

Add new host_addr parameter to vgic_v3_its_init_virtual to prepare the
foundation for DomU MSI support where guest doorbell address can differ
for the host's. Note that the 1:1 check in arm_iommu_map_page remains
for now, as virtual ITSes are currently only created for hwdom where the
doorbell mapping is always 1:1.

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

v9->v10:
* map vITS doorbell to host ITS doorbell instead of always 1:1
* use simpler addr to dfn conversion

v8->v9:
* no changes

v7->v8:
* no changes

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
 xen/arch/arm/vgic-v3-its.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index c65c1dbf52..bc738614bb 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1445,11 +1445,13 @@ static const struct mmio_handler_ops vgic_its_mmio_=
handler =3D {
 };
=20
 static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
+                                    paddr_t host_addr,
                                     unsigned int devid_bits,
                                     unsigned int evid_bits)
 {
     struct virt_its *its;
     uint64_t base_attr;
+    paddr_t host_doorbell_addr =3D host_addr + ITS_DOORBELL_OFFSET;
=20
     its =3D xzalloc(struct virt_its);
     if ( !its )
@@ -1478,6 +1480,26 @@ static int vgic_v3_its_init_virtual(struct domain *d=
, paddr_t guest_addr,
=20
     register_mmio_handler(d, &vgic_its_mmio_handler, guest_addr, SZ_64K, i=
ts);
=20
+    if ( is_iommu_enabled(its->d) )
+    {
+        mfn_t mfn =3D maddr_to_mfn(host_doorbell_addr);
+        unsigned int flush_flags =3D 0;
+        int ret =3D iommu_map(its->d, _dfn(PFN_DOWN(its->doorbell_address)=
),
+                            mfn, 1, IOMMUF_writable, &flush_flags);
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
+        ret =3D iommu_iotlb_flush(its->d, _dfn(PFN_DOWN(its->doorbell_addr=
ess)), 1, flush_flags);
+        if ( ret < 0 )
+            return ret;
+    }
+
     /* Register the virtual ITS to be able to clean it up later. */
     list_add_tail(&its->vits_list, &d->arch.vgic.vits_list);
=20
@@ -1522,7 +1544,7 @@ int vgic_v3_its_init_domain(struct domain *d)
              * base and thus doorbell address.
              * Use the same number of device ID and event ID bits as the h=
ost.
              */
-            ret =3D vgic_v3_its_init_virtual(d, hw_its->addr,
+            ret =3D vgic_v3_its_init_virtual(d, hw_its->addr, hw_its->addr=
,
                                            hw_its->devid_bits,
                                            hw_its->evid_bits);
             if ( ret )
--=20
2.34.1

