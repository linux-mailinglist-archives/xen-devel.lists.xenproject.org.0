Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D761FABF43F
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 14:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991775.1375612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiS7-0000F5-KF; Wed, 21 May 2025 12:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991775.1375612; Wed, 21 May 2025 12:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiS7-0000D6-DD; Wed, 21 May 2025 12:21:43 +0000
Received: by outflank-mailman (input) for mailman id 991775;
 Wed, 21 May 2025 12:21:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ic9M=YF=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uHiS5-0008Qd-C4
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 12:21:41 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2606::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25d72b11-363e-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 14:21:40 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9644.eurprd03.prod.outlook.com
 (2603:10a6:102:2e3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 12:21:32 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:21:32 +0000
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
X-Inumbo-ID: 25d72b11-363e-11f0-a2fa-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7dCmwk5rPd8ks8HhjHFpohMzpf0J+/AmWsYtwsgxPdqvvFwfpB32ZQXRG8a0JRb5T23lATSmFXTW1i72C5IOdZkLrXAWjIA17vbi18hU9houIx6pO2vcwFg+9kKQ+TiOVhjbqvyyEUvvI/PSfi8m6f4GPy0M0x2/5LBHD+QTvpgoKmLagfYCELKU0vw6sBkgPEzeFFygIN2Cc0Uy1IcEVy2SCdKzv23Tq/b9fglj0lKPoZLV1rvSpYP+yBLg0QHbDcLwC1h9Zyb9KcH1Yu4vzr11cta+JUJ3E3IEpiWHBy24nMVwS1RL+hFlYZz8/hu6Q+tFggU+BBRfRpGRbdS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXlEugMu56S+FR75MPQXIrqVs5/GFWgKNx5N1lVYYZg=;
 b=e6Bm010FGCcUjSX2HNIfDNKDTDfMp+AvlYh1uvJ6y/EV/Y1Vt/kaUCn29a/pZw0Iu2mM7+s8bnjaGuEer0RySLUG0fEeGgDEJt1xD+7Xii8Scfr7UdxuOnMXgqvvRuFMAyUboTJFr8sOmYTZw7oWSyY5B/QQEX7+xchp6+R+ygdfxshm9aJ+4SN9LMNP7l0EGCdVY0vyIe5bIM44kNWxhDYAU6JTjmMzj056oanI11IBrEWpNgej5hqQKar+Lrp8pH6wMmNgjP6W2hyoF3wT6Ij0XXmKxNc+aP/9OvrVeaOxYbf3upFfY0bp3AQkfNzBGAFubvTFFhDXrwlGWg79DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXlEugMu56S+FR75MPQXIrqVs5/GFWgKNx5N1lVYYZg=;
 b=LEpQQBTLeGuumx4h6uc+JPO3XxfYwDCoL6QNJjpn9rUUMhmqgIVyIGdKVmceIb0OZIwNVmR3udjHEIWMjLd/aJYyuXfXmG1AGPsHXPlKvWO7TBtpor5Ba/09ueidnoG1OmiV7oujDuDU9v2b0is4GRukYATL5qD+28OykQhC0br5OGmrozXxesCOVoZpHt09gkxnpDhKQou1IV7qLG6TapiZgfx7EXgkwVTrFAIJ8ethBauA5REtIXDLR/3wnRl7VygDKrDqdqmBB8zTFA9PBufRpryYr/Wl+jSC92sCqg0Nf/ZPhdZRikNuhCUKLEbWNI2nEPrsAycNgWOZ7dM3cg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v5 2/4] xen/arm: make pci_host_common_probe return the bridge
Thread-Topic: [PATCH v5 2/4] xen/arm: make pci_host_common_probe return the
 bridge
Thread-Index: AQHbykrjILOaYfYMbEqAZUHbg++Fgw==
Date: Wed, 21 May 2025 12:21:32 +0000
Message-ID:
 <2bb8628cd0eaaa2f84749ca7f72d030d20ca4325.1747820844.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 6a97cb4b-0c87-498a-7eb0-08dd986205a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/WOsPs0DfV9VxtoT4I+t+BGqP32C5rgjr1VbKbC1z3RiPkhEQikfR0xATB?=
 =?iso-8859-1?Q?6IzuRB/KoPqbCSVpd2hlByVRSeWB8QJLQc/bXcnaozdOIs4feEl2sA6Gkp?=
 =?iso-8859-1?Q?oFaolsKE+Kx8B6mqd+p4aWrmPNbA/O2hWBLhoNib849pP40whKKC/oci20?=
 =?iso-8859-1?Q?CQBIrTZnuN2vYiCau7v8Ae92OdG2l0LpwpDiJ3mezfoQ6eN5QdhV90EdHP?=
 =?iso-8859-1?Q?gPXp2id1yoOSN0dw4L6O/XX21tZo62PfkC0BbEh5ggNEzHzsWSQXjVRlzj?=
 =?iso-8859-1?Q?HcFnVYnmvuWndKAoGj3j3ezesoFP69ITfZluzp4hW5JrXVsvMbRlLFZUOJ?=
 =?iso-8859-1?Q?ZYOls813Ta98JRYuCxpTF5BkcWQFW5sZ3g4IMplZpQuWuSg+5//SwPblLw?=
 =?iso-8859-1?Q?6KCdx/kMhmNA7Dc0VmHdesbHsH/L22NYXPjbNa0CArpbyHtBdtjduNb9Z4?=
 =?iso-8859-1?Q?1FVMfBotFa7lkG1Hg5Zpj4TXxErKescZ6vtiVKpgIxkIuUSxmLoSUcNzOX?=
 =?iso-8859-1?Q?tNKZqX0gaZkYreGtQMx9KMuMoU3OTOMEM5zW/35C7Ruebe7zhJ1GYb4Lde?=
 =?iso-8859-1?Q?EFY+L/QO6T9m9r7eBeth+Ie+mjd6I58+l78OdklqTxhbnl/RMo8uT6V+ie?=
 =?iso-8859-1?Q?P/KlTahcb0idlc4ooJZkoCIS/0PfNBME1RSeV0XJFN8FyqCpQEyaAk7TP8?=
 =?iso-8859-1?Q?W3Ps3WuKqEEMta8fYepa/3wfBqabsPVvDScNdmfmpH0GR1+aCTzIFvJZyR?=
 =?iso-8859-1?Q?MN9zZkqJwgBqhfqjYV5OEFEZ92kv1s0PtgUgeV5CV/CB2d7Qestjf8Lt4y?=
 =?iso-8859-1?Q?VHg5YdhJsfEI8j65RlbPAkM4GKAWJEetzR1/NSDac+reRA1VUbLwHr3Pih?=
 =?iso-8859-1?Q?GM4jfbjaK0dQylzqjfP13up864Pjb/p+oNFhsCUd5vvHoNniCnbN5ppsC3?=
 =?iso-8859-1?Q?pekvZNR21Gre4bcibhZA5Z7OrwSaSyQPCFd89vKOVWLqL0WB1IpsJiVsW8?=
 =?iso-8859-1?Q?6PQmcXEbH1FoZ5Pw24R6dJlpVtYEGDNJSrLuKsXltgZAAF+Kr8N84V9HU4?=
 =?iso-8859-1?Q?Fl86JFQcB+IUV4spkxXiMKjw53sM13zeYnqWNjuTWYWHLI5oADpO9hNs64?=
 =?iso-8859-1?Q?O0MKUgsTkYLRSv5v5vdHOS6QH0aw4z2oEHNSvuINO26zytF9khUtXl4C1p?=
 =?iso-8859-1?Q?ASJCqOeI0FAvv8BzTANcl1GqRkguNvTfKfTKSc//Xb1T4JvcFRpdgp5By7?=
 =?iso-8859-1?Q?NcHpoPRpe/tYBBuN22+OvGexSIWjJUFYPPBx+7gjqFIH4V1IFkPhygm6ry?=
 =?iso-8859-1?Q?xJ9KpmtYRcd6bU18l/watT8h7TXcdKlFud0BILE1vMkTcuUnCutCC1ayuz?=
 =?iso-8859-1?Q?6tteFi7TSUl1Awm8woFCnXavoLbVlIUQcPwAszUXEpJDdmnN6asxIgIEUm?=
 =?iso-8859-1?Q?aP+4IoiYtK+Jw0QOGWo3UxTmMIy+NG3z8RvPyFUF3fD6tSJKLgEW7Yle+y?=
 =?iso-8859-1?Q?fpVLlnZr/92q6Z+vNR6HylYuLj7R3O+ZWWLOH9KAdU4+sn3x2ncKYgZYUt?=
 =?iso-8859-1?Q?l5h3Ovo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mTOgo3AuN8oR/f9n1ucgRGYbfU4i0VQNPWuOV5MJ7PsG3NHKuWBXTcZdPb?=
 =?iso-8859-1?Q?h6pWXiqjGxzWqpB5IOl97uFYQfKalO8maL4wdpzKaWvcN6KkvRQBdgCKsH?=
 =?iso-8859-1?Q?UBqOQ+vbQOKbH32ftkEtSsmzJnAFucNvRa9vwwaG/ucbzrYiS4Mo8HKGuX?=
 =?iso-8859-1?Q?7fwOOXvyifo49ODq6oURnKvb3haxSqq2PZgk2va89EqsrKtJqeqHCIATqv?=
 =?iso-8859-1?Q?SkgTyWgyc8qQzjlhDT+nbifb6UorPl+ngALIvxU+RjZForJH3X95i3/XEt?=
 =?iso-8859-1?Q?pIXqcMFkG1//s+WSbR2IUpeVZra7sjfsoB7H9clffmypmPPM7zEOK61QV+?=
 =?iso-8859-1?Q?MoxCxWTUT+pnNcX6HUqmim9FMvuNwgJd7hSYMPTutgfxSXGr3nBMvpxNZa?=
 =?iso-8859-1?Q?SlKsW5/80tCjYcQKDp7Ki2iYz62lkRAJFt9N6VKIpO713LWG8e/TxPWLaI?=
 =?iso-8859-1?Q?YIleurF7xeLZ/sKINuNI2EcnhEdB3pet29iM2B4lddP2/Qb8///jaG/d39?=
 =?iso-8859-1?Q?BXbZ0tZDe6rQeDQfXP+02g68Jwl1LznGEkqwp8RYUVyyqzWxeHjJtujpMY?=
 =?iso-8859-1?Q?wfC6tEus7t53l/bkwSh81Am9kCckGpKF8DvfMyEXeLIZpuB+RlBhfUiz1j?=
 =?iso-8859-1?Q?t6ib42Ncn41K6LDCrEsRgPSuYMggo1EUDP3qBBop/OB/N1eODKChW0cyFQ?=
 =?iso-8859-1?Q?yidoo7xxcq41BrdDNMkMy7azWrQZhklUVMEiFt+PuD+2bhilgNLnWp+6UU?=
 =?iso-8859-1?Q?wgKF0SGiawEpXxLrs4sSdolUW1t1fYtGENQrRq9EcGNf1anB93x2xLM8U8?=
 =?iso-8859-1?Q?UsmRva6TnOmdGp642nEf/SEJyRzsv19+P30uCG2R6R4f4J30CrDYXcgru/?=
 =?iso-8859-1?Q?6E919epOKXlZhBocm/NQzICOo/Ekj5880agP6BjwMQEKJg4nDpih4vmD+j?=
 =?iso-8859-1?Q?gAe229f8RL2ncND/9VbLhhYosKKNuq3Ma5XDr3x6PMyvc1sLSuItbKcgZh?=
 =?iso-8859-1?Q?oY6DWI/ulvcL1n7tYTmvtLxUGNWsh0/WmC9dxQHP5vGOGlE6i8lsRynRUI?=
 =?iso-8859-1?Q?Acj42Th9yFj+pSM7Yl1cR+glD6KxzW6Bf5Q++VuWOuHJ9YK64TZ7KNxJox?=
 =?iso-8859-1?Q?H/HOMQfHLEpS8S5t/yqFf5eN15DD7yxjMiN3uSKQRdmNtceBzA5PFtH1QY?=
 =?iso-8859-1?Q?N7ODzYtEWJxKokvw3R+EiTTT5/RC2CRZcYIAnGbDS+YSCjIBqJ6795ibeq?=
 =?iso-8859-1?Q?vxUXe+Gnp/LauyR2OJSoDe402VDN24pzoGRcq8vZeBJKfVAcynbS7Tz+Ks?=
 =?iso-8859-1?Q?LlW9iLqHKoPDuhDtVTNkxji9AL9CVhbASWDk6nv3ahbUHqMYB5yJltL1nw?=
 =?iso-8859-1?Q?w3VDO/2avg87Avpo5FHL0lsy0MFEaiQPl41OMh3CkoTi+QVI+SNsDVH4nB?=
 =?iso-8859-1?Q?89bQpg2qsMpP36Dx3yE025qymcx8OW5RKWa02uUr+7DkybJf5dLoh1OUQu?=
 =?iso-8859-1?Q?j2LJeS4fsoxydQhLPLEjIIbS6oGBivOr2LiXljhwjAjHADkZFlNAB7pDN7?=
 =?iso-8859-1?Q?kWfVpMR/z5EDPO8P/qcxhZd9YSOtDeltjbNaIsDOh0XB2mW0KVUcxcxMum?=
 =?iso-8859-1?Q?uF1tzY8O2pnWunZ+CABUvTylUsrR9cceZUApooKaFJJN6DKyeHnZ8Vww?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a97cb4b-0c87-498a-7eb0-08dd986205a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:21:32.5035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1LyT4qVVJzuMNby0PHPsV/p9iVJgNfeaFThr6ktZHWw3ZRt8r/SLrUxwoSkFRwfROw0sSt878o/z8lZ9fcY5Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9644

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some of the PCI host bridges require additional processing during the
probe phase. For that they need to access struct bridge of the probed
host, so return pointer to the new bridge from pci_host_common_probe.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
v4->v5:
* added Stefano's RB

v3->v4:
* change return 0 to return NULL

v2->v3:
* no change

v1->v2:
* no change
---
 xen/arch/arm/include/asm/pci.h      |  5 +++--
 xen/arch/arm/pci/pci-host-common.c  | 12 ++++++------
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index a87672d834..3d2ca9b5b0 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -18,6 +18,7 @@
 #ifdef CONFIG_HAS_PCI
=20
 #include <asm/p2m.h>
+#include <xen/err.h>
=20
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
=20
@@ -95,8 +96,8 @@ struct pci_ecam_ops {
 /* Default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
=20
-int pci_host_common_probe(struct dt_device_node *dev,
-                          const struct pci_ecam_ops *ops);
+struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
+                                              const struct pci_ecam_ops *o=
ps);
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value);
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index c0faf0f436..53953d4895 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -208,8 +208,8 @@ static int pci_bus_find_domain_nr(struct dt_device_node=
 *dev)
     return domain;
 }
=20
-int pci_host_common_probe(struct dt_device_node *dev,
-                          const struct pci_ecam_ops *ops)
+struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
+                                              const struct pci_ecam_ops *o=
ps)
 {
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
@@ -217,11 +217,11 @@ int pci_host_common_probe(struct dt_device_node *dev,
     int domain;
=20
     if ( dt_device_for_passthrough(dev) )
-        return 0;
+        return NULL;
=20
     bridge =3D pci_alloc_host_bridge();
     if ( !bridge )
-        return -ENOMEM;
+        return ERR_PTR(-ENOMEM);
=20
     /* Parse and map our Configuration Space windows */
     cfg =3D gen_pci_init(dev, ops);
@@ -244,12 +244,12 @@ int pci_host_common_probe(struct dt_device_node *dev,
     bridge->segment =3D domain;
     pci_add_host_bridge(bridge);
=20
-    return 0;
+    return bridge;
=20
 err_exit:
     xfree(bridge);
=20
-    return err;
+    return ERR_PTR(err);
 }
=20
 /*
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-hos=
t-generic.c
index 46de6e43cc..a6ffbda174 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pc=
i_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return pci_host_common_probe(dev, &pci_generic_ecam_ops);
+    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host=
-zynqmp.c
index 101edb8593..a38f2e019e 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pc=
ie_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return pci_host_common_probe(dev, &nwl_pcie_ops);
+    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
--=20
2.34.1

