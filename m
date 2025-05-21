Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EEAABF440
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 14:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991776.1375615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiS7-0000Jc-Rz; Wed, 21 May 2025 12:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991776.1375615; Wed, 21 May 2025 12:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiS7-0000FV-Mf; Wed, 21 May 2025 12:21:43 +0000
Received: by outflank-mailman (input) for mailman id 991776;
 Wed, 21 May 2025 12:21:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ic9M=YF=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uHiS6-0008Qd-1R
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 12:21:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2606::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 265b73e8-363e-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 14:21:40 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9644.eurprd03.prod.outlook.com
 (2603:10a6:102:2e3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 12:21:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:21:33 +0000
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
X-Inumbo-ID: 265b73e8-363e-11f0-a2fa-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZuVpWrXEKUdgwkBfCWgY8RBkCx7A0PtzKhSSttEmJW5vO0AhXFa4ERO/N9tzighvO+E/qCdvr25Hd44+1pTz2vip+/0UdYYXG+nIzvfgzpau8EUB1jaq2r5hwyT1H2pAUP/eWNpiyO58DhBts3cHL5y4dqJeJ0POvDIeEwpfVLSaZSfmYKw95Xz4L2ztku8qXxCa5S0J064U8XDNHnXmJKmiug0Uy7WSyq3c1z3GT3L+3aNLzLd+T13aYyu5otYmQG+W/jmODLo2zuXK6N8BlsAHxIv2N7t63Pt5mK7EJk0wWsbG4vCGiZ6EHpyhWBzJvyd9024TT/bNnSl97PX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpZsBbj7D3pf+dpvbBxlCm4AJ6L7tIyDoTO9zE1yQnQ=;
 b=PVLcFt2H+Ib+LtrInNRZd415DTvSamtq+aL8U7AVuw3jaQE4qixN8VEB1zBBz6j8dF82d1nOwsPkikUyJdlzLB9oFloOVKvVzUX44Xf2hMtrUs2TajUqrXjpFHjEt0wGFhFTcU+ZotSjFCanZE9tNo8rLmjQX0VErM6zXK2vwc7N0E3gqCPH9W6aaUwELxP+aG7o9uNB7acRtqvpFy3Jc6hztIfKA9VCcPaZiAtHR4GV0/vI8RBDBkuW4LYAS+36DoSqHkekFTXqHtmCc/1doNUSaBJTzxKu7crQwmxtwSJyDd6J2Gknlv88kMwwL/f4u/+SAivs1sgYa0sbkmTJ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpZsBbj7D3pf+dpvbBxlCm4AJ6L7tIyDoTO9zE1yQnQ=;
 b=jzZ+e5qco2zKkdvaIZi++LbD0h+eSc6MH6d0zdeXzxOW3HDcJaSYhbB6PbzZxfpk3rAzpO7ypeTd7OG3cN4kBi11c2Ljac7tcai2CUPMSW6cbar6t0O5dkE/Z6Llw2drDdt+QNIDlD4ixf84LG76cAptFCiAp8eD56/4mNttPEvsaVVJKjVdw7RYLC+CMYfHuEM2V+sVGXYAHXfZ45FeNA+chBBdefyYXqKke/7RENLqFUyJRA/+72g9u5iLM8GP8jjpTluugXqFF2h7ZwLz0y9mtZlMfJvEkV7ZQKRP5qUfCAJjmZ0kRsV15u8xggP1/x093ZFIK8RHlCgOLZHxDg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v5 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Topic: [PATCH v5 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Index: AQHbykrjmOX6JVLEJUWwTM6YRoyEQQ==
Date: Wed, 21 May 2025 12:21:33 +0000
Message-ID:
 <06f5972dda6a8132be8eab5ad1b8586ff3c5aaf3.1747820844.git.mykyta_poturai@epam.com>
References: <cover.1747820844.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1747820844.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9644:EE_
x-ms-office365-filtering-correlation-id: a96de8b4-4f33-4aa8-ff99-08dd98620627
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?E6AYpxJC4tCe+lEK1eyvKu+Gf3pF4BGUMRNDlwpAwG2+TXTWr7pHlfHOdm?=
 =?iso-8859-1?Q?YdyBNiNTYpknSP34dXrFRM5BBsdFZy6AV01AMWs4kQ9XM9BRav1qOZL+6i?=
 =?iso-8859-1?Q?hjYpShMkSffuhJQ15zYY1Ivq8kRJndszfA9+eSD3mpWmf/3nW6VRcCngst?=
 =?iso-8859-1?Q?qMvaq4zCY2NogL4LLNhQEQr8h3aiAXDnePfxUpSJWGmGYa1vukyd2rFJ3y?=
 =?iso-8859-1?Q?UNsrwhIDRgzR0ysFyFn4EoUYyrRw4gVoU1HXDnxbBp8dvoEZzo1+k8BUbV?=
 =?iso-8859-1?Q?X8hVmwEG5cNFXQDnPZll9iUPT+ddKufP++QtFjNSxbDZ+OGJipE1PtqCe9?=
 =?iso-8859-1?Q?tiM7yszxaW2hIv1FUVx5LNF23eDhdF0TX2Jb50UHd4iiKjpmjwJlk5L685?=
 =?iso-8859-1?Q?kgbKnuz3qbk0izVrqdJVBbPLyDWl8fRPfETMKSuXV5unM2oOE2KHcCM6L7?=
 =?iso-8859-1?Q?apnLgDZbxyqIpLrgJb+yQUKAUD5BbLyNpgwJhXBMmAJkGyKpWVuQrPXUrt?=
 =?iso-8859-1?Q?Aj9C89Avc+hidgiBk4tkhFCF58anrQPq90pWUvUbRRXyNB09xxmU4Cf1cQ?=
 =?iso-8859-1?Q?5VEHf1GQXEwIPMcvtkzfAL3CYP8MC8nh4QQ00I8kMUbvsi04SS57femCkC?=
 =?iso-8859-1?Q?pHpAjPnLLEBRQtivDL8VJyY2SE5W1FV29uRWinql2jAuqzFGfxT4ID37Sm?=
 =?iso-8859-1?Q?eXQzR2TEajM3sAMhbwHZ4J35hrHa+bV1OZzHmMJ1N9V5c6MfsKq4P5oGhu?=
 =?iso-8859-1?Q?R8vTsNWdk8CowiYeY7W2f6EqoEEI63evPMCPykcWvwplAy5I/FiVf/oFm8?=
 =?iso-8859-1?Q?Y3/2yF2jhcN3loHwR6gtlympVEPjOQKxU3hbw/I6uBN59PPWsiRYTC8VMw?=
 =?iso-8859-1?Q?PewymC+j28wBzomza2j971piQzixGH2RJ62C110gXApJgHYrIpw7Tq2pnT?=
 =?iso-8859-1?Q?7aK2WcDVaca9HeNVyPA1wyxHx+NYML0+Q959bQTV3jVAjwd23rqA1519O9?=
 =?iso-8859-1?Q?7FysZlrEnVGoaAz7/ekJ1bC9R9r4fy/Srldpgim1wKYH4wS7VeldtmOwXv?=
 =?iso-8859-1?Q?em7zIBzvM8b8ur+es4PBy3/ascv2z1dP49kpEcSjIu/v6AnzJ8HqD/oY4R?=
 =?iso-8859-1?Q?qoG2U20HxYtuJ39nSd5+j2E2HQA357McsedcPkF5BH3ReyAQ0R4fZ+dNc4?=
 =?iso-8859-1?Q?dDLcx1z5pNVgna33JKDDabam0KazaHHKVcv20M9Hgcv66NI4RoBE7nqYRu?=
 =?iso-8859-1?Q?DoLT/JPURBpSismU0Fe6xBzjj60PC+sS5gaUlnh7ATiYzMTHMEkdrMFDdu?=
 =?iso-8859-1?Q?Hsn9IDqGikXS3UMGvsW8+lx5P16Ce/3N9kTESd6N8vNJObjcHEQQeiNcdN?=
 =?iso-8859-1?Q?u165sqXUP/qdWtfgkZsT/LipyCEeyb7Aoa+G1TY+8lF70nPhLURGYyxv2V?=
 =?iso-8859-1?Q?5+M4Sm2khapeHYFgKjy85xkgpdAXA0V8xVZr8bdFXEEsx6A8Sg7O8qSunT?=
 =?iso-8859-1?Q?k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?d7xfOBKpf62MZCQahFItVyrUoNEwwApUuxFGAIk3z9+YXIPds/tdJTkEVz?=
 =?iso-8859-1?Q?9BekWv7g07V7xTZWrdVHTxkdPXk9B+spTv+wt582fuyJby9gMZmXnq141k?=
 =?iso-8859-1?Q?soxjN4B81owE5RmfdH6aFOCQbP2NXU+ZMoTKbzRyagzCyoU3Slwvdb/6LZ?=
 =?iso-8859-1?Q?uspLFtI1ra3gAVsYNahOBQVzs/6Ssxi79zUl9afLg7ewgDtbH1LPRg774/?=
 =?iso-8859-1?Q?pUz5iUf6j2WY4FpvWEerQ1U4zXih7/xCWOJa57jWZ0Vk/zdQwJXeouatuW?=
 =?iso-8859-1?Q?jQ2mahKEDuRtuGm3VdGdALMCWS4+e3G4EVMFqvLgTGo/k6VvtLzv8cR7Eb?=
 =?iso-8859-1?Q?hq2QmTH6CVuEPFTwDj+z3ZuRg1NayVjwzWRX0q8EtEbBPVN9aMs5wA2yB2?=
 =?iso-8859-1?Q?14t0+httyUvj4ZgD02qk387IyDKcadzxd99tVZx/7BLSu/CgtsZ2cZFhbN?=
 =?iso-8859-1?Q?+zWXWye5+/Bmbe5+H5FTqdOeyPVi8GEVnJ1Rq/jSJ44oBOq3hr/oYk5WVP?=
 =?iso-8859-1?Q?XI6uZt0FlXiFiMYcEeaz8ECkq3hLawk7KdMBOatRns5t/8vqpXHmvQOFpH?=
 =?iso-8859-1?Q?pzv6p9w8gSDiD5g6JZcnk3qek9/Q9o2bQB7envL9xjzPpaG727nhJo0NlU?=
 =?iso-8859-1?Q?N1ZtAUgZ+vsn1SpjgGnJpBn3ONsbRWKPXAJWs32Y7PpKN4ZJ9Jix+OWdWb?=
 =?iso-8859-1?Q?3LsSghfkPK7zwL8gtiuEF+iIKa5+wZhZVoMAl+em3ZxVw5mW3uF1RJPVNi?=
 =?iso-8859-1?Q?5m5sbc7i76XuiJhJp6GRn6OSin+YQrgL1jx5TARh0dDiBDudid4pxHwuG6?=
 =?iso-8859-1?Q?hznugayYHs6LBDShCD6pm5y7di47mn46967L/KhPGX5YUopLLCYzVwNvDD?=
 =?iso-8859-1?Q?CXQ0J6XUeulUjTQ2vQxqVcysyvPefiCrM5SnHxpzi8zk4OKPthUqqfEADS?=
 =?iso-8859-1?Q?aLbnNvZ8CzVf/Dy6Wd+wYzhIOkO2e26RgC7/Mk7E8rPMtB2WtBmdbtqpqu?=
 =?iso-8859-1?Q?noN2jIQQLp2uq5Xe5QyzSGY0gX6h/lN1wourgaIDUDAL1HrCzlDCISt6et?=
 =?iso-8859-1?Q?lYmWMsAEIhzdY3jJPXTW9BOJuYP8atvEpQJRwmoHJ1e7aZOzaT1k0dBKNE?=
 =?iso-8859-1?Q?ViT5wzDYvg8Ir6qiEJQJcPR5Vkv1NV6PjckmHZqETGUKBbXYGQAwKr/we0?=
 =?iso-8859-1?Q?pwDLubjUCC7mEN8SY4KncdhNE+OP4tuQBLoaUwd47fiBsUMjuqUX2s7vat?=
 =?iso-8859-1?Q?Cb1Ap+9PMKR7nljFZKajvY1BQ9HMsL9pWbT6WWKihUkSgGLQn4za42n9wQ?=
 =?iso-8859-1?Q?9KJrNtGvK9aVRMSj7Mgv7D0PF7thl3vTC9pn6l/fIMniU9hDZ+WaZ5f2r7?=
 =?iso-8859-1?Q?Fzz0jQS86l+GGkiTFCKM1K+MjlizcsneqUT6XArwf/0waopeji47s3AWXO?=
 =?iso-8859-1?Q?nmoESgZCDObH8609IvpLcsOMqq9oyEWUIaYGKUaKvPwGjFwzeSzv6tAtaI?=
 =?iso-8859-1?Q?e/BqOriz8kuiFVgx1XcVTs7/LAIOHo1z1xXIszo9GSxpqwXhEODUEbKsVf?=
 =?iso-8859-1?Q?VcmFdoOt0H1WfPp0g5D4/lJfdd42oIiXJPabKdWO5M9JvXpzFuKHJ671eZ?=
 =?iso-8859-1?Q?UAjhYADuQjVOeo+HramsLHyjrXu6UFifUK2aIeFfj1J3VKbopEMeuJMw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96de8b4-4f33-4aa8-ff99-08dd98620627
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:21:33.3900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ppQjGIx7d5XmkBytdm3n9SJlDwKqDqUQaChreMD8JIY4Fkpej/3F7Tr8kmbvwBQnd83IQ4OQ5n5SxqjuBuzrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9644

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add support for Renesas R-Car Gen4 PCI host controller, specifically
targeting the S4 and V4H SoCs. The implementation includes configuration
read/write operations for both root and child buses. For accessing the
child bus, iATU is used for address translation.

The host controller needs to be initialized by Dom0 first to be properly
handled by Xen. Xen itself only handles the runtime configuration of
the iATU for accessing different child devices.

iATU programming is done similarly to Linux, where only window 0 is used
for dynamic configuration, and it is reconfigured for every config space
read/write.

Code common to all DesignWare PCI host controllers is located in a
separate file to allow for easy reuse in other DesignWare-based PCI
host controllers.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v4->v5:
* update license identifiers
* improve error checking
* use XENLOG_G_* where needed
* make macro defs more robust and minor style fixes
* add MAINTANERS entry

v3->v4:
* no changes

v2->v3:
* move priv allocation to dw_pcie_host_probe

v1->v2:
* move designware code in a separate file
---
 MAINTAINERS                       |   6 +
 xen/arch/arm/pci/Makefile         |   2 +
 xen/arch/arm/pci/pci-designware.c | 416 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-designware.h |  90 +++++++
 xen/arch/arm/pci/pci-host-rcar4.c |  94 +++++++
 5 files changed, 608 insertions(+)
 create mode 100644 xen/arch/arm/pci/pci-designware.c
 create mode 100644 xen/arch/arm/pci/pci-designware.h
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c11b82eca9..dc1291e2b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -476,6 +476,12 @@ M:	Anthony Perard <anthony.perard@vates.tech>
 S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/qemu-xen.git
=20
+RCAR PCI
+M:	Mykyta Poturai <mykyta_poturai@epam.com>
+S:	Supported
+F:	xen/arch/arm/pci/pci-host-rcar4.c
+F:	xen/arch/arm/pci/pci-designware*
+
 REMUS
 S:	Orphan
 F:	docs/README.remus
diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
index 1d045ade01..ca6135e282 100644
--- a/xen/arch/arm/pci/Makefile
+++ b/xen/arch/arm/pci/Makefile
@@ -4,3 +4,5 @@ obj-y +=3D pci-host-generic.o
 obj-y +=3D pci-host-common.o
 obj-y +=3D ecam.o
 obj-y +=3D pci-host-zynqmp.o
+obj-y +=3D pci-designware.o
+obj-y +=3D pci-host-rcar4.o
diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-desig=
nware.c
new file mode 100644
index 0000000000..fc8c6724f2
--- /dev/null
+++ b/xen/arch/arm/pci/pci-designware.c
@@ -0,0 +1,416 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on Linux drivers/pci/controller/dwc/pcie-designware.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ *
+ */
+
+#include <xen/delay.h>
+#include <asm/io.h>
+
+#include "pci-designware.h"
+/**
+ * upper_32_bits - return bits 32-63 of a number
+ * @n: the number we're accessing
+ *
+ * A basic shift-right of a 64- or 32-bit quantity.  Use this to suppress
+ * the "right shift count >=3D width of type" warning when that quantity i=
s
+ * 32-bits.
+ */
+#define upper_32_bits(n) ((uint32_t)(((n) >> 16) >> 16))
+
+/**
+ * lower_32_bits - return bits 0-31 of a number
+ * @n: the number we're accessing
+ */
+#define lower_32_bits(n) ((uint32_t)((n) & 0xffffffffU))
+
+static int dw_pcie_read(void __iomem *addr, int len, uint32_t *val)
+{
+    if ( !IS_ALIGNED((uintptr_t)addr, len) )
+    {
+        *val =3D 0;
+        return -EFAULT;
+    }
+
+    switch ( len )
+    {
+    case 1:
+        *val =3D readb(addr);
+        break;
+    case 2:
+        *val =3D readw(addr);
+        break;
+    case 4:
+        *val =3D readl(addr);
+        break;
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return 0;
+}
+
+static int dw_pcie_write(void __iomem *addr, int len, uint32_t val)
+{
+    if ( !IS_ALIGNED((uintptr_t)addr, len) )
+        return -EFAULT;
+
+    switch ( len )
+    {
+    case 1:
+        writeb(val, addr);
+        break;
+    case 2:
+        writew(val, addr);
+        break;
+    case 4:
+        writel(val, addr);
+        break;
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return 0;
+}
+
+static uint32_t dw_pcie_read_dbi(struct pci_host_bridge *bridge, uint32_t =
reg,
+                                 size_t size)
+{
+    void __iomem *addr =3D bridge->cfg->win + reg;
+    uint32_t val;
+    int ret;
+
+    ret =3D dw_pcie_read(addr, size, &val);
+    if ( ret )
+        printk(XENLOG_G_ERR "Read DBI address failed\n");
+
+    return val;
+}
+
+static void dw_pcie_write_dbi(struct pci_host_bridge *bridge, uint32_t reg=
,
+                              size_t size, uint32_t val)
+{
+    void __iomem *addr =3D bridge->cfg->win + reg;
+    int ret;
+
+    ret =3D dw_pcie_write(addr, size, val);
+    if ( ret )
+        printk(XENLOG_G_ERR "Write DBI address failed\n");
+}
+
+static uint32_t dw_pcie_readl_dbi(struct pci_host_bridge *bridge, uint32_t=
 reg)
+{
+    return dw_pcie_read_dbi(bridge, reg, sizeof(uint32_t));
+}
+
+static void dw_pcie_writel_dbi(struct pci_host_bridge *pci, uint32_t reg,
+                               uint32_t val)
+{
+    dw_pcie_write_dbi(pci, reg, sizeof(uint32_t), val);
+}
+
+static void dw_pcie_read_iatu_unroll_enabled(struct pci_host_bridge *bridg=
e)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+    uint32_t val;
+
+    val =3D dw_pcie_readl_dbi(bridge, PCIE_ATU_VIEWPORT);
+    if ( val =3D=3D 0xffffffffU )
+        priv->iatu_unroll_enabled =3D true;
+
+    printk(XENLOG_G_DEBUG "%s iATU unroll: %sabled\n",
+           dt_node_full_name(bridge->dt_node),
+           priv->iatu_unroll_enabled ? "en" : "dis");
+}
+
+static uint32_t dw_pcie_readl_atu(struct pci_host_bridge *pci, uint32_t re=
g)
+{
+    struct dw_pcie_priv *priv =3D pci->priv;
+    int ret;
+    uint32_t val;
+
+    ret =3D dw_pcie_read(priv->atu_base + reg, 4, &val);
+    if ( ret )
+        printk(XENLOG_G_ERR "Read ATU address failed\n");
+
+    return val;
+}
+
+static void dw_pcie_writel_atu(struct pci_host_bridge *pci, uint32_t reg,
+                               uint32_t val)
+{
+    struct dw_pcie_priv *priv =3D pci->priv;
+    int ret;
+
+    ret =3D dw_pcie_write(priv->atu_base + reg, 4, val);
+    if ( ret )
+        printk(XENLOG_G_ERR "Write ATU address failed\n");
+}
+
+static uint32_t dw_pcie_readl_ob_unroll(struct pci_host_bridge *pci,
+                                        uint32_t index, uint32_t reg)
+{
+    uint32_t offset =3D PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
+
+    return dw_pcie_readl_atu(pci, offset + reg);
+}
+
+static void dw_pcie_writel_ob_unroll(struct pci_host_bridge *pci,
+                                     uint32_t index, uint32_t reg, uint32_=
t val)
+{
+    uint32_t offset =3D PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
+
+    dw_pcie_writel_atu(pci, offset + reg, val);
+}
+
+static uint32_t dw_pcie_enable_ecrc(uint32_t val)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+
+static int dw_pcie_prog_outbound_atu_unroll(struct pci_host_bridge *pci,
+                                            uint8_t func_no, int index,
+                                            int type, uint64_t cpu_addr,
+                                            uint64_t pci_addr, uint64_t si=
ze)
+{
+    struct dw_pcie_priv *priv =3D pci->priv;
+    uint32_t retries, val;
+    uint64_t limit_addr =3D cpu_addr + size - 1;
+
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_BASE,
+                             lower_32_bits(cpu_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_BASE,
+                             upper_32_bits(cpu_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_LIMIT,
+                             lower_32_bits(limit_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_LIMIT,
+                             upper_32_bits(limit_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_TARGET,
+                             lower_32_bits(pci_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_TARGET,
+                             upper_32_bits(pci_addr));
+    val =3D type | PCIE_ATU_FUNC_NUM(func_no);
+    val =3D upper_32_bits(size - 1) ? val | PCIE_ATU_INCREASE_REGION_SIZE =
: val;
+    if ( priv->version =3D=3D 0x490A )
+        val =3D dw_pcie_enable_ecrc(val);
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, val);
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
+                             PCIE_ATU_ENABLE);
+
+    /*
+     * Make sure ATU enable takes effect before any subsequent config
+     * and I/O accesses.
+     */
+    for ( retries =3D 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++ )
+    {
+        val =3D dw_pcie_readl_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CT=
RL2);
+        if ( val & PCIE_ATU_ENABLE )
+            return 0;
+
+        mdelay(LINK_WAIT_IATU);
+    }
+    printk(XENLOG_G_ERR "Outbound iATU is not being enabled\n");
+
+    return -ENXIO;
+}
+
+static int __dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci,
+                                       uint8_t func_no, int index, int typ=
e,
+                                       uint64_t cpu_addr, uint64_t pci_add=
r,
+                                       uint64_t size)
+{
+    struct dw_pcie_priv *priv =3D pci->priv;
+    uint32_t retries, val;
+
+    if ( priv->iatu_unroll_enabled )
+        return dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type,
+                                                cpu_addr, pci_addr, size);
+
+    dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT,
+                       PCIE_ATU_REGION_OUTBOUND | index);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_BASE, lower_32_bits(cpu_addr));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_BASE, upper_32_bits(cpu_addr));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LIMIT, lower_32_bits(cpu_addr + size =
- 1));
+    if ( priv->version >=3D 0x460A )
+        dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_LIMIT,
+                           upper_32_bits(cpu_addr + size - 1));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_TARGET, lower_32_bits(pci_addr)=
);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET, upper_32_bits(pci_addr)=
);
+    val =3D type | PCIE_ATU_FUNC_NUM(func_no);
+    val =3D ((upper_32_bits(size - 1)) && (priv->version >=3D 0x460A))
+              ? val | PCIE_ATU_INCREASE_REGION_SIZE
+              : val;
+    if ( priv->version =3D=3D 0x490A )
+        val =3D dw_pcie_enable_ecrc(val);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, val);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
+
+    /*
+     * Make sure ATU enable takes effect before any subsequent config
+     * and I/O accesses.
+     */
+    for ( retries =3D 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++ )
+    {
+        val =3D dw_pcie_readl_dbi(pci, PCIE_ATU_CR2);
+        if ( val & PCIE_ATU_ENABLE )
+            return 0;
+
+        mdelay(LINK_WAIT_IATU);
+    }
+    printk(XENLOG_G_ERR "Outbound iATU is not being enabled\n");
+
+    return -ENXIO;
+}
+
+static int dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci, int inde=
x,
+                                     int type, uint64_t cpu_addr,
+                                     uint64_t pci_addr, uint64_t size)
+{
+    return __dw_pcie_prog_outbound_atu(pci, 0, index, type, cpu_addr, pci_=
addr,
+                                       size);
+}
+
+void dw_pcie_set_version(struct pci_host_bridge *bridge, unsigned int vers=
ion)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+
+    priv->version =3D version;
+}
+
+void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
+                                    pci_sbdf_t sbdf, uint32_t where)
+{
+    uint32_t busdev;
+    int ret;
+
+    busdev =3D PCIE_ATU_BUS(sbdf.bus) | PCIE_ATU_DEV(PCI_SLOT(sbdf.devfn))=
 |
+             PCIE_ATU_FUNC(PCI_FUNC(sbdf.devfn));
+
+    /* FIXME: Parent is the root bus, so use PCIE_ATU_TYPE_CFG0. */
+    ret =3D dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                    PCIE_ATU_TYPE_CFG0,
+                                    bridge->child_cfg->phys_addr, busdev,
+                                    bridge->child_cfg->size);
+    if ( ret )
+        return 0;
+
+    return bridge->child_cfg->win + where;
+}
+
+int dw_pcie_child_config_read(struct pci_host_bridge *bridge, pci_sbdf_t s=
bdf,
+                              uint32_t reg, uint32_t len, uint32_t *value)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+    int ret;
+
+    /*
+     * FIXME: we cannot read iATU settings at the early initialization
+     * (probe) as the host's HW is not yet initialized at that phase.
+     * This read operation is the very first thing Domain-0 will do
+     * during its initialization, so take this opportunity and read
+     * iATU setting now.
+     */
+    if ( unlikely(!priv->iatu_unroll_initilized) )
+    {
+        dw_pcie_read_iatu_unroll_enabled(bridge);
+        priv->iatu_unroll_initilized =3D true;
+    }
+
+    ret =3D pci_generic_config_read(bridge, sbdf, reg, len, value);
+    if ( !ret && (priv->num_viewport <=3D 2) )
+        ret =3D dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                        PCIE_ATU_TYPE_IO,
+                                        bridge->child_cfg->phys_addr, 0,
+                                        bridge->child_cfg->size);
+
+    return ret;
+}
+
+int dw_pcie_child_config_write(struct pci_host_bridge *bridge, pci_sbdf_t =
sbdf,
+                               uint32_t reg, uint32_t len, uint32_t value)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+    int ret;
+
+    ret =3D pci_generic_config_write(bridge, sbdf, reg, len, value);
+    if ( !ret && (priv->num_viewport <=3D 2) )
+        ret =3D dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                        PCIE_ATU_TYPE_IO,
+                                        bridge->child_cfg->phys_addr, 0,
+                                        bridge->child_cfg->size);
+    return ret;
+}
+
+bool __init dw_pcie_child_need_p2m_hwdom_mapping(struct domain *d,
+                                                 struct pci_host_bridge *b=
ridge,
+                                                 uint64_t addr)
+{
+    struct pci_config_window *cfg =3D bridge->child_cfg;
+
+    /*
+     * We do not want ECAM address space to be mapped in Domain-0's p2m,
+     * so we can trap access to it.
+     */
+    return cfg->phys_addr !=3D addr;
+}
+
+struct pci_host_bridge *__init
+dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
+                   const struct pci_ecam_ops *ops,
+                   const struct pci_ecam_ops *child_ops)
+{
+    struct pci_host_bridge *bridge;
+    struct dw_pcie_priv *priv;
+
+    paddr_t atu_phys_addr;
+    paddr_t atu_size;
+    int atu_idx, ret;
+
+    bridge =3D pci_host_common_probe(dev, ops, child_ops);
+    if ( IS_ERR(bridge) )
+        return bridge;
+
+    priv =3D xzalloc(struct dw_pcie_priv);
+    if ( !priv )
+        return ERR_PTR(-ENOMEM);
+
+    bridge->priv =3D priv;
+
+    atu_idx =3D dt_property_match_string(dev, "reg-names", "atu");
+    if ( atu_idx < 0 )
+    {
+        printk(XENLOG_ERR "Cannot find \"atu\" range index in device tree\=
n");
+        return ERR_PTR(atu_idx);
+    }
+    ret =3D dt_device_get_address(dev, atu_idx, &atu_phys_addr, &atu_size)=
;
+    if ( ret )
+    {
+        printk(XENLOG_ERR "Cannot find \"atu\" range in device tree\n");
+        return ERR_PTR(ret);
+    }
+    printk("iATU at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n", atu_phys_add=
r,
+           atu_phys_addr + atu_size - 1);
+    priv->atu_base =3D ioremap_nocache(atu_phys_addr, atu_size);
+    if ( !priv->atu_base )
+    {
+        printk(XENLOG_ERR "iATU ioremap failed\n");
+        return ERR_PTR(ENXIO);
+    }
+
+    if ( !dt_property_read_u32(dev, "num-viewport", &priv->num_viewport) )
+        priv->num_viewport =3D 2;
+
+    /*
+     * FIXME: we cannot read iATU unroll enable now as the host bridge's
+     * HW is not yet initialized by Domain-0: leave it for later.
+     */
+
+    printk(XENLOG_INFO "%s number of view ports: %d\n", dt_node_full_name(=
dev),
+           priv->num_viewport);
+
+    return bridge;
+}
diff --git a/xen/arch/arm/pci/pci-designware.h b/xen/arch/arm/pci/pci-desig=
nware.h
new file mode 100644
index 0000000000..df4a9afe75
--- /dev/null
+++ b/xen/arch/arm/pci/pci-designware.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on Linux drivers/pci/controller/dwc/pcie-designware.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ */
+
+#include <xen/pci.h>
+#include <xen/init.h>
+
+#ifndef __PCI_DESIGNWARE_H__
+#define __PCI_DESIGNWARE_H__
+
+
+#define PCIE_ATU_VIEWPORT               0x900
+#define PCIE_ATU_REGION_OUTBOUND        0
+#define PCIE_ATU_CR1                    0x904
+#define PCIE_ATU_INCREASE_REGION_SIZE   BIT(13, UL)
+#define PCIE_ATU_CR2                    0x908
+#define PCIE_ATU_ENABLE                 BIT(31, UL)
+#define PCIE_ATU_LOWER_BASE             0x90C
+#define PCIE_ATU_UPPER_BASE             0x910
+#define PCIE_ATU_LIMIT                  0x914
+#define PCIE_ATU_LOWER_TARGET           0x918
+#define PCIE_ATU_UPPER_TARGET           0x91C
+#define PCIE_ATU_UPPER_LIMIT            0x924
+
+#define PCIE_ATU_REGION_INDEX1  0x1
+#define PCIE_ATU_TYPE_IO        0x2
+#define PCIE_ATU_TYPE_CFG0      0x4
+
+#define FIELD_PREP(_mask, _val) \
+    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
+
+#define PCIE_ATU_BUS(x)         FIELD_PREP(GENMASK(31, 24), (x))
+#define PCIE_ATU_DEV(x)         FIELD_PREP(GENMASK(23, 19), (x))
+#define PCIE_ATU_FUNC(x)        FIELD_PREP(GENMASK(18, 16), (x))
+
+/* Register address builder */
+#define PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(region) \
+    ((region) << 9)
+
+/*
+ * iATU Unroll-specific register definitions
+ * From 4.80 core version the address translation will be made by unroll
+ */
+#define PCIE_ATU_UNR_REGION_CTRL1       0x00
+#define PCIE_ATU_UNR_REGION_CTRL2       0x04
+#define PCIE_ATU_UNR_LOWER_BASE         0x08
+#define PCIE_ATU_UNR_UPPER_BASE         0x0C
+#define PCIE_ATU_UNR_LOWER_LIMIT        0x10
+#define PCIE_ATU_UNR_LOWER_TARGET       0x14
+#define PCIE_ATU_UNR_UPPER_TARGET       0x18
+#define PCIE_ATU_UNR_UPPER_LIMIT        0x20
+
+#define PCIE_ATU_FUNC_NUM(pf)           ((pf) << 20)
+
+/* Parameters for the waiting for iATU enabled routine */
+#define LINK_WAIT_MAX_IATU_RETRIES      5
+#define LINK_WAIT_IATU                  9
+
+struct dw_pcie_priv {
+    uint32_t num_viewport;
+    bool iatu_unroll_initilized;
+    bool iatu_unroll_enabled;
+    void __iomem *atu_base;
+    unsigned int version;
+};
+
+void dw_pcie_set_version(struct pci_host_bridge *bridge, unsigned int vers=
ion);
+
+void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
+                                    pci_sbdf_t sbdf, uint32_t where);
+
+int dw_pcie_child_config_read(struct pci_host_bridge *bridge, pci_sbdf_t s=
bdf,
+                              uint32_t reg, uint32_t len, uint32_t *value)=
;
+
+int dw_pcie_child_config_write(struct pci_host_bridge *bridge, pci_sbdf_t =
sbdf,
+                               uint32_t reg, uint32_t len, uint32_t value)=
;
+
+bool __init dw_pcie_child_need_p2m_hwdom_mapping(struct domain *d,
+                                                 struct pci_host_bridge *b=
ridge,
+                                                 uint64_t addr);
+
+struct pci_host_bridge *__init
+dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
+                   const struct pci_ecam_ops *ops,
+                   const struct pci_ecam_ops *child_ops);
+#endif /* __PCI_DESIGNWARE_H__ */
diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar4.c
new file mode 100644
index 0000000000..62d2130a63
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ */
+
+#include <xen/init.h>
+#include <xen/pci.h>
+
+#include <asm/device.h>
+#include <asm/io.h>
+#include <asm/pci.h>
+
+#include "pci-designware.h"
+
+#define RCAR4_DWC_VERSION       0x520A
+
+/*
+ * PCI host bridges often have different ways to access the root and child
+ * bus config spaces:
+ *   "dbi"   : the aperture where root port's own configuration registers
+ *             are available.
+ *   "config": child's configuration space
+ *   "atu"   : iATU registers for DWC version 4.80 or later
+ */
+static int __init rcar4_cfg_reg_index(struct dt_device_node *np)
+{
+    return dt_property_match_string(np, "reg-names", "dbi");
+}
+
+static int __init rcar4_child_cfg_reg_index(struct dt_device_node *np)
+{
+    return dt_property_match_string(np, "reg-names", "config");
+}
+
+/* ECAM ops */
+const struct pci_ecam_ops rcar4_pcie_ops =3D {
+    .bus_shift  =3D 20,
+    .cfg_reg_index =3D rcar4_cfg_reg_index,
+    .pci_ops    =3D {
+        .map_bus                =3D pci_ecam_map_bus,
+        .read                   =3D pci_generic_config_read,
+        .write                  =3D pci_generic_config_write,
+        .need_p2m_hwdom_mapping =3D pci_ecam_need_p2m_hwdom_mapping,
+        .init_bus_range         =3D pci_generic_init_bus_range,
+    }
+};
+
+const struct pci_ecam_ops rcar4_pcie_child_ops =3D {
+    .bus_shift  =3D 20,
+    .cfg_reg_index =3D rcar4_child_cfg_reg_index,
+    .pci_ops    =3D {
+        .map_bus                =3D dw_pcie_child_map_bus,
+        .read                   =3D dw_pcie_child_config_read,
+        .write                  =3D dw_pcie_child_config_write,
+        .need_p2m_hwdom_mapping =3D dw_pcie_child_need_p2m_hwdom_mapping,
+        .init_bus_range         =3D pci_generic_init_bus_range_child,
+    }
+};
+
+static const struct dt_device_match __initconstrel rcar4_pcie_dt_match[] =
=3D {
+    { .compatible =3D "renesas,r8a779f0-pcie" },
+    { .compatible =3D "renesas,r8a779g0-pcie" },
+    {},
+};
+
+static int __init pci_host_rcar4_probe(struct dt_device_node *dev,
+                                       const void *data)
+{
+    struct pci_host_bridge *bridge;
+
+    bridge =3D dw_pcie_host_probe(dev, data, &rcar4_pcie_ops,
+                                &rcar4_pcie_child_ops);
+
+    dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
+
+    return 0;
+}
+
+DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4", DEVICE_PCI_HOSTBRIDGE)
+.dt_match =3D rcar4_pcie_dt_match,
+.init =3D pci_host_rcar4_probe,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.34.1

