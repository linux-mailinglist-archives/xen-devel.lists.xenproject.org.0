Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2A2A5BDCB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907715.1314969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnR-0005f4-Bd; Tue, 11 Mar 2025 10:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907715.1314969; Tue, 11 Mar 2025 10:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnR-0005Yl-00; Tue, 11 Mar 2025 10:25:13 +0000
Received: by outflank-mailman (input) for mailman id 907715;
 Tue, 11 Mar 2025 10:25:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFC1=V6=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1trwnP-0004Ad-1F
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:25:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2613::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bdad314-fe63-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 11:25:09 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU4PR03MB10646.eurprd03.prod.outlook.com
 (2603:10a6:10:58c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 10:24:58 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 10:24:58 +0000
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
X-Inumbo-ID: 1bdad314-fe63-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxLQ2DzKOIqnCcIg/+vda0ayaUYfMBT6SiC0X9VrakaEzyVODkOaUUymHVKgY23adZl0s/ryC4Y7bUdY/snkqQWYKcpdnZwHMFmmfRFxKRt+PFYlBzG0RpPt9cmkKRVc64yjWDgFqgVAv0AD4WIzB7F/zpAYoTo287HuKCDjrx5mkSSTWwj+QsKKsdmb0VGPEUXw5N9WdXWPHyZwPqCjSm5T3qf7MIyFlJY7IJj2bYneIjWDHXmmLk1vbrIUQTaNq1TPUTvNJ6pnC2drfwhq4xVR/IXV4Ea7oB1GrzqCtB3Ah6HLGcra3H/tBzzKzHnD3NuUvEN0pEHyTERHTMkwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gO2IjWfufULwwhkWhKMvUjMTCm7EjpS7pzTWQeUncXA=;
 b=VOi1jxUc25c/ZYO4pjiz/Atu4VJwFLIg1sYTQpkVipf81+cKwL/rSjgHBCja7y8zoD1Sh7QX1WM/MsiPUBAlug7GPVYhaXE1B+5z/LSCjQnLzNjjsHJfKtvfsEpsBD+XnaqFzfZ2oUyNqMNmexp+vciUFcT+iggIlmVYWhtLKZu83mc60Y8LDfzutGdgawPNw6HijIhZxrcj1paaGUafs2Q0xy+qLcIpYxpBU2gdzrY2yrMIDCnOgfp6q9cbggUTzkdIChpfNX1FKddKf+RmIohi++PJcRUE18+D68GypT7uYXCyXW4DWGjw5NwM6nm4Jw7lf0gHCPLwS2ycCfEGJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO2IjWfufULwwhkWhKMvUjMTCm7EjpS7pzTWQeUncXA=;
 b=KhfBYpBAHk65esToO58MEXVmKXF5lheQxCvL2pZIPr8aewZyhnjWncnF8dGpJPVqEjg5gtc2AQnu1sJ+r6anHiFp40KsCkIvj1C0n7HGXE+Y11hJNCE/j6kmvyjsbOjatHwMJA78ocHgI8c1zaYeQrHNIFpKrYwFKuXs+Em/wct1Jn/ZBZoiAOafILwUetaDMfJbnZ9BEw2f/ajtx4YJ+5pewwfK6h5Umy/mGiQOXNGX1atGj+SoC15nb6ArAgwEt+pLpW/K9yZZ24PAZ/FtBCqaX8jaebqQ/VtgwDRPO/7/JijT63dzoMPYl2DDwufuLnfizqd0x6U9rCNxky+Wug==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 7/7] xen/arm: rcar4: program ATU to accesses to all
 functions
Thread-Topic: [PATCH v2 7/7] xen/arm: rcar4: program ATU to accesses to all
 functions
Thread-Index: AQHbkm/WZsnsJQf1WkK0RbNDpdgTwg==
Date: Tue, 11 Mar 2025 10:24:57 +0000
Message-ID:
 <10bf9a3b4489242cf9407a2f70d84be378e9c206.1741596512.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: c4be1d56-6851-41b9-c7d1-08dd6086f954
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?P8B0IBehlimYY5w5wo+CR839mkva06YoQ1C9gzjGLwHYUu3k75xYwG0or5?=
 =?iso-8859-1?Q?tJ5t5104zFrVewSEEmR5IKcHvrtk4Cdgpa2G8ZExpUxQcYnc1uInsB564u?=
 =?iso-8859-1?Q?6pu8PBXuRR9uAHHymU5+2LV4D8+4dH7SdYmf2L65wL1F6nUDyPWGYcm64o?=
 =?iso-8859-1?Q?7Ip3xl8ACwdrQ3St2XsHQ6kldcmTRphgcHmHUK1kHngDX2L4XK6RyJ6w1k?=
 =?iso-8859-1?Q?nDdQe0bQPq6Om3hi5dzOhn1oF/g9m0kaSxAquN9M8pbbyyqgYzGwi2fqUY?=
 =?iso-8859-1?Q?Qso6fCN+zvCQQ7hGa19ySr35SGJIlFxK3Ip//qm4VDkXR0Y+aOKhl4u5KP?=
 =?iso-8859-1?Q?OA8zwoJ7+fkSvuqOYrzsjIAYHkdb4ReuH2BNDPV6NhBkkLM7nN0EbAqSPF?=
 =?iso-8859-1?Q?yfUjKDodN0p5YlPLtd1VZMQs2UZfg0EdLKiN4E8ML38QtZZLgoRqDyvZqf?=
 =?iso-8859-1?Q?8+mqkDg+CcWU3PcUortbSlgqAxJkVlXNSU6KWL6ohfGaAEoFAjWmejbWSx?=
 =?iso-8859-1?Q?m+ofO1xRQxnFMZhqrKVZnNlcF61dvaXa1moIJmT3qVaXdhJc8J5P3l/PfZ?=
 =?iso-8859-1?Q?9ly8bWjjiiLXuwiBSmsJ3LnUUIZYHqseEHZbDqOjtYaLS4B+sS2m9Q7KGC?=
 =?iso-8859-1?Q?srN3RIgEFFGrR5yUCcr0n0L1nPKQFDON1qOG/zwF8DoJvMJuPjUr+zYLU+?=
 =?iso-8859-1?Q?KKf1QnKw/z9v3fo4kB0K55G9L8HJDf0Di1sCjNDGn+eN4SOZGVAP/AsVXm?=
 =?iso-8859-1?Q?o5Y8fNhmUP/afvEHW59F565azlNKooUQ9F012U+bJOq8MPnwAFQw4e+DDH?=
 =?iso-8859-1?Q?Qih5zKlsZqhD3VmLwiBhCaSegvn5tm1oDD1vljwjgCsMbqT8tqq/LalXrF?=
 =?iso-8859-1?Q?IglwFOhESwJEW6PqUl5Vm+V2J0ynZGoAGgrpRVy7xYEGMA2FvxSGTppRzZ?=
 =?iso-8859-1?Q?jNxejAJPc4UVvif0YjDTUAuJWhZ/SAwZcvNYJg3r75vM1Dv8A2HxCV4j+A?=
 =?iso-8859-1?Q?pLBsf3eysJwGosTEWMmBk6vp42c+9kSadh+3KLAzACWc5qB1CNNFlSrwvA?=
 =?iso-8859-1?Q?PSGS0QLYRtAqH6jJYjcV7kApAzP7wQEId0SFSfm1T1MbB8E+bctThSKV2j?=
 =?iso-8859-1?Q?btrqP3JxZE852G+G/ZYTcuiotD3m/uaN8HUgsxslpCCCTw+ObOKHxEoDnH?=
 =?iso-8859-1?Q?cg/4t2DL48/3jpiuQezXFwL81srDg4hHu8rODpM0FuuWdYHd7RW//2tL4v?=
 =?iso-8859-1?Q?osONHEDYI/6UhkRfXlZvSuB6Ij8DdwErUKDPJ9VXI3MySciAA7GkhspZ/H?=
 =?iso-8859-1?Q?N1yfrh+HY9B0lOmll38VQ0gkre64+xsgsQQ4+VB+0mq8SxR7WIKL+5WCSR?=
 =?iso-8859-1?Q?7uazTQusHrDDCVP0Uo7my/WZAt+ihks6/Lp7a+Kn+NDSzKUp0Bgk/zqdfy?=
 =?iso-8859-1?Q?fSllX/TVb3J0UBlwGvt3KhvnVkvgsBPS/1j3HDx8EN8oHTG+nClGcJD6DN?=
 =?iso-8859-1?Q?e/D3srvZoGEImygHfVW9/z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GOkryCYrJrvp4VNYUsNfRl3pvTAwSV1j9ShbxEDPy4tpeSTdzxbgcBcYu/?=
 =?iso-8859-1?Q?C357Ku5h+GzqE8NaaQt7f6lLXC1ehFocBV0Fs9Ybf7EukEw4I/RF9fy/Fp?=
 =?iso-8859-1?Q?MP1rcvxjYoxAK8jaHC6QV4pAvintLdmjUrc++MrIBP6IWWKtgzzkLkEmfj?=
 =?iso-8859-1?Q?kEjg6U0t1S82Pg+pLSOj57Tv0vGq9+30IydkpUJsdDxowhp7Sc3OUj2uvY?=
 =?iso-8859-1?Q?yaPdaqoDp7FLUsrQL3K7tdXXYK9rPsN+h6fHFsOOI5y6evl5GmmwmFOhNw?=
 =?iso-8859-1?Q?TE7eVHwTZun4xbG/HldTqoqyCgtE1O1e6cM0BcQxXw+aeauhUynfV9xTAD?=
 =?iso-8859-1?Q?wwo7vWnl1fINylmfOfCwylGZUuky/tWqosbOz1n6j8EbYss+jf2MoBbdcH?=
 =?iso-8859-1?Q?dJdI4S9b3KL90yspdtmqVy5xJd9qs8/WuhkyAgZN/W7P+KKOb40A2RHQ62?=
 =?iso-8859-1?Q?cHRM9HSwWfpIfpsTMqCFUkdpcH/o/258pR8AOJlBb8pu401U47vhv58sTm?=
 =?iso-8859-1?Q?3ukeZpeLYr9blcMEHgNC0C6oRiuPmukDEKiRRFNG1XLBcqfv7rSYjNfHs+?=
 =?iso-8859-1?Q?i1Xm/ZsPf8Q3jw5PDWjkNW4zmiWFk1fksExa/Qf/VUDjNZCEsW4//gEOF9?=
 =?iso-8859-1?Q?kGnLfSXVWLtaBB8E5tFwPa8RQc7lCnRjCh+knw1OPI0ujM1VjhcJAzeJ50?=
 =?iso-8859-1?Q?fWWIo2PgAt582FjU26LZN1U3Ioz4aUlZ6X1Zz/Va9WbqcZ1gW1mammK1Sy?=
 =?iso-8859-1?Q?fMGJdGTv3z27Elk08co8HcnuGQTgbRhOL27Hv5UjDGPFgpi7fcp1lAwlLF?=
 =?iso-8859-1?Q?9YDYWR/LMOrGY44ELQCTP2Czb7JBmcCXuTndLoRCC4eG8h994x6lpu2KZ+?=
 =?iso-8859-1?Q?uBkKlIoV0s873ZPeQ9secFg4C4k8GfmPodV8ePlUeJ1inTUxsrGHY+u3CE?=
 =?iso-8859-1?Q?EeNtW0PCbYr5m0QU4KSUT3yhTReBIg9PYU1Q9tr6ZVJuga5CtJG5lbwyB0?=
 =?iso-8859-1?Q?5/wIs1N9nq2QB72n9Fu0z9hAirctOCFUmo43rdQEyQwBgEEB62M2bwd5oo?=
 =?iso-8859-1?Q?JiZdFXEbSWR5ygwKfMQSqF+x52Lu1hP7t0TxjvEh0BmbwdV+dJg5GAp/Mb?=
 =?iso-8859-1?Q?QZZTPXHfUSryykEWoEAcyecwn4aVx2Uk4Og/U+1aWJp0mFhGgYaJ9XoHkR?=
 =?iso-8859-1?Q?m5qdjcMNJBAL88QEdxhwgqDREQu9uN/vdYKJ3nWYFhqdmUFo98QFA8fNQm?=
 =?iso-8859-1?Q?42+XNcXgn5wQzicjrXpy8DIXnAhP2QPZsQaXdxKMWGHzQ4guaeTUjjbPRa?=
 =?iso-8859-1?Q?GiLsK4z8oP9AAnSDvo75+R0S3L2Ok6w/g4ktM7xSaIVMXAXYsyRmNTfsET?=
 =?iso-8859-1?Q?hyiK12s7KhgiG5NdGluTV7EYfMX8zTvqt4bcRZ2gbS5kv0Q7Cv6hTwFOzK?=
 =?iso-8859-1?Q?XzhIs4B6zKMKi6P7Lw6kNlSzECq/GKaj3jJ3xpojZ5aiHnISMLw+Y9bTzn?=
 =?iso-8859-1?Q?I+EiJKZiIvxiQ3MlW/0Lnl6FVpETUKuN53n5UiI+2DwFyHdcEv1M1DechZ?=
 =?iso-8859-1?Q?eVWm3BLGjNDLF/GYt9r52dVxzl7Ig7EFj0B5AM856H0D0/clhTFO9/rpmp?=
 =?iso-8859-1?Q?5BZfULa7T6W4KuGUlWkBYzdug7HUaEOlb4W228xe4gu3QbYi5dXN+kzg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4be1d56-6851-41b9-c7d1-08dd6086f954
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 10:24:57.2139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cg/wVhin8kV0txwdqfVNwEo/18o0O2pkXTqAhlCIpBxSqEDfLcHERnzz547ZH47YUyhoRXg5yV/1Ec+gq8MAZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10646

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

According to ATU documentation, bits [18:16] of accessed memory
address correspond to a function number. This is somewhat similar to
ECAM, but with huge holes between regions.

We can use this to minimize number of ATU re-programmings: configure
ATU to access BDF with F=3D0 and adjust memory address with function
number.

Taking into account the previous patch, that optimizes ATU
reprogramming by skipping call to __dw_pcie_prog_outbound_atu() if we
already configured pci_address, we can be sure that accesses to all
functions of one device will not trigger ATU reprogramming at all.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* rebased
---
 xen/arch/arm/pci/pci-designware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-desig=
nware.c
index cec52cf81a..fec8c7296d 100644
--- a/xen/arch/arm/pci/pci-designware.c
+++ b/xen/arch/arm/pci/pci-designware.c
@@ -297,7 +297,7 @@ void __iomem *dw_pcie_child_map_bus(struct pci_host_bri=
dge *bridge,
     uint32_t busdev;
=20
     busdev =3D PCIE_ATU_BUS(sbdf.bus) | PCIE_ATU_DEV(PCI_SLOT(sbdf.devfn))=
 |
-        PCIE_ATU_FUNC(PCI_FUNC(sbdf.devfn));
+        PCIE_ATU_FUNC(0);
=20
     /* FIXME: Parent is the root bus, so use PCIE_ATU_TYPE_CFG0. */
     dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
@@ -305,7 +305,7 @@ void __iomem *dw_pcie_child_map_bus(struct pci_host_bri=
dge *bridge,
                               bridge->child_cfg->phys_addr,
                               busdev, bridge->child_cfg->size);
=20
-    return bridge->child_cfg->win + where;
+    return bridge->child_cfg->win + ((uint32_t)sbdf.fn << 16) + where;
 }
=20
 int dw_pcie_child_config_read(struct pci_host_bridge *bridge,
--=20
2.34.1

