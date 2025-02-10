Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666E4A2E973
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884569.1294351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR4C-0006SB-GU; Mon, 10 Feb 2025 10:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884569.1294351; Mon, 10 Feb 2025 10:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR4C-0006G8-2n; Mon, 10 Feb 2025 10:31:04 +0000
Received: by outflank-mailman (input) for mailman id 884569;
 Mon, 10 Feb 2025 10:31:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzWh=VB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1thR4A-0004Pl-5C
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:31:02 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2607::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e834653-e79a-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:30:59 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB8977.eurprd03.prod.outlook.com
 (2603:10a6:20b:5f5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 10:30:48 +0000
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
X-Inumbo-ID: 1e834653-e79a-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Djzn1gJaljctp/weOYpONzQpITO1dJbLNrVFl2cSu6SjA02XlLropKnsV1v+E1zWH8Py/DB8lq09Oz0e9sKSYRhsCsPjc3J6UqdX2yyB+S9jO0h0B8dmSPtjIhg8tlD4N1V9UFf2xIY7u8RGvAw/yegrRwD6i6P7qCEnU2jA2QtYQhEE3yJpiO5RK02Va9z0g6YQ+3vVpY6YkGv71yzLDT6oaBv4i4KoP8TSyPc20VpZnur161s3Ohy/OSOO7Ny5gzFw6CDe9RUIQ4qo2iqb4A41SYWDGZ5r2JsdJT5YjFua4V2+OxYnz7X8G9SimALavquvkagHA8oXM7CYxceWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8klElrME7R5RtdGFYb77mc1kx6zBAz8YXcueMgJdQc=;
 b=uYLN+YLeoSObMHJIkMAwWXZJHNn8U5DooWlKnbE3DptPXYG1sjcuI/Envm3jXUFgdauTeWQArZ1UUDXAhNCDkAZ5xVM0pHvxgo7GLHqbYb1d9q00o7L2EmQYnomdPt37GKkAJmRWiXkfMCkWsQvfYRcPwreKpFBYJB6NFZ6kyaS6Cpou3vclFwMIvJHI4HkaXk94NAKB3UALnYicikXQWBN1LJ2Gzh0X6IqCPNTpAyBYi7f0azfDrAY1GD+PnKo3/LQZhYfXllqbRvudbqrZX2R1pqKn7EtiwyN3HJhNHNBsG9/M/L8WpZ2YuXyxE8lhH8g6Z5LZtkTFC7JPXmwNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8klElrME7R5RtdGFYb77mc1kx6zBAz8YXcueMgJdQc=;
 b=X5vx9O51nny2minFR9iez+sooZRBg6LzPZ0WB/OLmgkUAAMMozD2JplcloRWTGEEhv1D4IMXI8ZGmZQzA4LpS/dFirDW5tZ/7ecbi8R8j13C0139hyaO7qcBQfIjiqDHdql1obSVhEAp8yko21TGFJlZpPqeRi6ZCvlDVmwNVUpxCl+YAxzPLre502mGd7mdEr28fZ/rhOShNQUcVWnCyXpBrLl1R0L2RziZUrrHtApVLzYclJW7hTD0p/l4shdrtmu5IsgotEfAMuRnpxr6PHL8UhbBUHXuuNdhi462H9+sFs4OBxfcMSyYV9g51nt5za8jXKuI4DbyekUuAzVyyw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v8 8/8] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Thread-Topic: [PATCH v8 8/8] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Thread-Index: AQHbe6bYNGT5/8oLtUmi3k2BEzPULw==
Date: Mon, 10 Feb 2025 10:30:46 +0000
Message-ID:
 <0ffd7eebe6b39580586bd50817529306de5c53aa.1739182214.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 587e57dc-94b0-4fd8-0664-08dd49bdfb0c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3wfiI3OFvXoQsPHpKuvFIaj5fget3a4cLum14HdqyP27PI37tm8cBIDvVH?=
 =?iso-8859-1?Q?DWUxMTDdYCuy05Cz47iIGBZoj08eZzT92EVC0jc9FGj0TJgzKicUKj9Sb3?=
 =?iso-8859-1?Q?GjFhQSpWykOGXnFYnKF550B0D8AM2+tcnA4jvku7+cAyJ78vJswfJhE/pz?=
 =?iso-8859-1?Q?fzTH93AQxkTW3svG08/cIb9eltMcWhLN+eDkfvncTdiv0c2oej0NVyreEr?=
 =?iso-8859-1?Q?8s8kFIXC7qHJJp7cXjpSnPtquEQIUud1/6sj23EbFfsqZJHdgWgGR5hA2B?=
 =?iso-8859-1?Q?ZzyQxmAo5jOrPrIf+3gQNWfkZSQ3txwrqGRNl/9hygAmKnKxHplfD4HYlG?=
 =?iso-8859-1?Q?/hA7tTyLTfNWtOO0HC8M/gFAYB5wamf/NyHBED8pwBiv4PHovQGRsSRI0u?=
 =?iso-8859-1?Q?wrMu63n4gszl167aX8F/Fk9v3Ms/CgJnCbElpyc5djzBXj5lQ3f+x/oIjv?=
 =?iso-8859-1?Q?q2cuurx189NoPpt5nJG1Jdoj7UeW75snqVMso1AnmdiJe+FG699Ye6l8YW?=
 =?iso-8859-1?Q?goaRmS1Px7fWqKb5Y1pEx9qIQaJps/hL2UHw85xwIweoH30AS04m3bkWsP?=
 =?iso-8859-1?Q?Snm5h7/AOmDo73jckYz8sa9NPZlzOEcQ9glTEaW89wT7v2q5fNyn4Q3fQR?=
 =?iso-8859-1?Q?ji267RVNsqeqdTEvv1N1hEAoiACSPkAnh4Q0Wh1qkNHZDVwJZomg4SsM5K?=
 =?iso-8859-1?Q?Tq7EUcnzegunj6PHR3Hw3IF0AJyfiRjGvrjO4hMhFDynlT9wJfuNTMFjeQ?=
 =?iso-8859-1?Q?9fCqn6VzJt18jyNGezU5d99xJwQpxezEMnoNCAqCf75eaxGI09gu2HiHGw?=
 =?iso-8859-1?Q?yviUffCu1343HntqnllJ0XPgcFRRCPcog4z1uayFlUoF61i2njHxVcinV8?=
 =?iso-8859-1?Q?6MWit22OeCmhK5B1tfMJCq7uDw3GcDGzw+bSUUKef7ynxlSkpO0RjcNrSF?=
 =?iso-8859-1?Q?UWgHFEaOVKtKah/7z3ra12dw13lzVSsH+AI/5UKtQS7IwqXu4llugazUiT?=
 =?iso-8859-1?Q?TMA8goQVsHbPBP0Nxv/YxzYbXZ4J2o++b9PMBor5Z25MHxXnVl0QtQHGiO?=
 =?iso-8859-1?Q?CcrXeaEGIPKqptQ9WhT26+5Rsxfr5t/wCA8N9hwGEmgfmUOjPCX53foE01?=
 =?iso-8859-1?Q?w9/jNZrFC/JmQJS8kFI2WtYhpG/4HCqTbE+HDzXjiCjxNOjqNEjh64yYg6?=
 =?iso-8859-1?Q?s/w0WbLBBJQzV+UHh79cG0UZNi5W7GxRip/AlWuK57es6jZPyNZt5f/uYb?=
 =?iso-8859-1?Q?ijsKtKriO4iFgMi7X06hwMA7GXjeZhmn1ce5QpVAo3MEuLmJIPJfDZOYY8?=
 =?iso-8859-1?Q?K/ECkpthQAmsXXuf1Vguvhz1vveO7p+vD1gthZH9SFlP9g34CF+/opjnBO?=
 =?iso-8859-1?Q?Mf+obhpd0tCFwXz6KusZ20l1Sj6WsSp9BHfPKi73toC4gtd5ezW+mgmk3E?=
 =?iso-8859-1?Q?VPXeLgEqFWcsbpuVYhxzLfj095hU5Lkbjcm79g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kVhkN6ywh9R/MVySOxQwW2XvZlS9iwDI+R7OpW5nlPjo5I2GvQyoz5U+cx?=
 =?iso-8859-1?Q?2axafP0tawJbnZD5nfJml+1TFK7ffH900AFvnIWUDom7r221BatWxM+1rw?=
 =?iso-8859-1?Q?ePjT8tPbpe6G/HAfWIwYxKb0hvtocqds8R11qr53BsR1nfBP2SrDn0EM4J?=
 =?iso-8859-1?Q?FQtmUVUfSWG8vA2asceBhLXnRweJpwvd/fUzO9LAQr2YUAeC7XWAd2C7L7?=
 =?iso-8859-1?Q?B0wsHXsKqlJfOkgohu6ulv513OTcq4x6Lwb7bvfYhxwNlY7lusse4PWkjK?=
 =?iso-8859-1?Q?hygQtRMt3GDUAIQGrSEjm8BarFGBMAY2Efihj5cwbPqQflDD4TKufmX9By?=
 =?iso-8859-1?Q?J30N9ehvM3JORlvjf6PFjesFVqhsEzvNl78BqAXYPKxkIJC9HymZWsgjQ7?=
 =?iso-8859-1?Q?XdmcORFkOEqrhz8K2ZW+zUxsndanBXOzsCcMmgqurHLDr3MSLb/b0IjxcU?=
 =?iso-8859-1?Q?bKmFeoqFJObd1J3WuVcy3Z6wTTx2S/BKjjJSlZFyTeQ7lD9Y7ecvt9iYAS?=
 =?iso-8859-1?Q?VozM/glsX3JnPS/XoC2OBgJjjrvdpkY/zjRnCjJTXu6aBqNdAvyMgnJTSC?=
 =?iso-8859-1?Q?xFHeKPp7XvS++BrZWFJOjIs/VNvKe6mglwy0/u1zRIs+latkGJqOUv2VIN?=
 =?iso-8859-1?Q?hxKaiTJoPo87S6ADdB2ajGz/noKdxvO7Ye3HeVkH3GoqGyw2+HWgbhwiNs?=
 =?iso-8859-1?Q?y5hBB1kr7cJCg+yxFhuOqaFES4ZDdRd1LxHVlJNBRVOt25+3gWGeW/wweH?=
 =?iso-8859-1?Q?wfEztd0c4M43bt6mICpzDqt13dh3Rgnj+SLX8oDpDu3ZOYysdTWlQB4UCo?=
 =?iso-8859-1?Q?1QnMOoPjqknOE1qeWD1EsRMLy6PIjcpgkFZWn5iL/Bn9ZCjlSka/iDbNsT?=
 =?iso-8859-1?Q?CMxBGWXTlONWEsGwtKcTJdguQN34d/kcdfJjKBlrAJl2b7CtytNfDB7gJT?=
 =?iso-8859-1?Q?X0zf5Ohh0botBt577+qYBB15ncIerZgpRf/SgJAuphH+XZYGh/Y5oWWiI4?=
 =?iso-8859-1?Q?/poSVOEj4m8oLcXwnspWkGKHKlqxaoTZx9oHKWkGvYQn4AnUm+c7rmUx8m?=
 =?iso-8859-1?Q?A/iXtwoEQQRWhd6EJH+cp5EoLrQev5IsCj8sqXMrxRuAaU1UP8vYZ+DdZ1?=
 =?iso-8859-1?Q?6wsGtqQQJRdtbxAYQP2VJ8/cvAig8AK4zexA81kPyanc+pGSZe1IbXcTdd?=
 =?iso-8859-1?Q?yuMf1FRBiDmQ/+VBShvh6vLX7R80lEmmquqzGAFTbop5YxXpA2wF/2xQXb?=
 =?iso-8859-1?Q?y882P48V1Ctd67KNVojhu//qUk4vgQjfXo5HYTo4nl2R8Kc34+8UVwovKF?=
 =?iso-8859-1?Q?DL3wJ2/1mKa4Q78Q6EjNxjjpGXouKGeJ0Mw3jfMA8ICQftAEiQ09liH9ar?=
 =?iso-8859-1?Q?aTYGuWsdIkEzTRl268CnlBDvLAm6RKmdBAr+mebKym/6sARvgATmkcr1HI?=
 =?iso-8859-1?Q?+y86m7p91dfFRR88xFtBgf5Eu9hdj3bW2WzRQYhVvySxnOV/gZexedg+Et?=
 =?iso-8859-1?Q?+PyEbFAnoat1kfJq0p69bfm9KxPwS+v5dyqlyGxjkadvNc7HLrvXKyf+R0?=
 =?iso-8859-1?Q?oYDG6fm96ZSNgwOdEBp/l2H21DZXrB1ho8fWr9141CLg0zO6cR+/HArSDM?=
 =?iso-8859-1?Q?ySC+nyVojfSewmV9dyWhFoUNxjbBry43ptX7Dz1NHCaYrKdiCxahjwMQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587e57dc-94b0-4fd8-0664-08dd49bdfb0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 10:30:46.5316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: keJB4qrUtQhEhJ/POFYj3M/Z+E7nSKmYN6/KrYTCp9y2XhKPVw5sYZP6P5kkyQ5qvhX6MhDo3Lu93wR51kpCcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8977

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

