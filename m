Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626EFA5BDCE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:25:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907714.1314961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnQ-0005Vm-ME; Tue, 11 Mar 2025 10:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907714.1314961; Tue, 11 Mar 2025 10:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnQ-0005O8-BT; Tue, 11 Mar 2025 10:25:12 +0000
Received: by outflank-mailman (input) for mailman id 907714;
 Tue, 11 Mar 2025 10:25:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFC1=V6=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1trwnO-0004Ad-11
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:25:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2613::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b32108e-fe63-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 11:25:08 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU4PR03MB10646.eurprd03.prod.outlook.com
 (2603:10a6:10:58c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 10:24:57 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 10:24:57 +0000
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
X-Inumbo-ID: 1b32108e-fe63-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nd3aHdKhIn9vB84mlBklg8YKc2fLBXKi8LDjK00A6hvbw+yuPNHY1N91rwh9H55lIJe8p8lCwKGTxftCOa5Ulfff1okj/lplBiebpUp8TrlEwUUv8PaHqeFadtqOpGzN6+fsINUvdNOUyIOhrv3pvog1EmopWS9FuRqCCRiX94lRguIqjif6h0sWUWsGKKvEQQ0U1Kaq1cKaixfMMX+xX+F9LEqgtmvGTDUJWC2Z4Zl4PzIY+DO32NmftodPnKUbSwqQKSW2dtjEzMgGSULp4jENTKQn8/gLbUbLsqeH8bCkRduR/ryCP0DDL+mFFeI/+Gkgi+f9Z48qR9BElXKrFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dvd/0gWByS7JSPGL03cPILxwiEHvlhItiyeW4bdjMzE=;
 b=TTaKHEKjlNv9cfibTpGsVKViF9o3DrAhuYtpxxR0buN/Mvx6ipH0pwMfVXRJYDKJe9bMkWfP52b7P7BOG6cuFHaffgcEvyHB7KbADnENRUyBls+zrLqYg5AQKRjET8ZIub+qGbNNygOsLfEnEZavZ4y1iAaZOBiqCiF7nCAXYpyYSZ5kHWMAKZIK0fidijwy9ZR3Wyhx3pxlvNen8q2n/giJ4hx55Azy4ZTpDXIwS0VStOhRKyOKXhg4VBsJFvBDb9lYYaEcSv3uB5OuzeGUfVqVPQ6HCm1INBqI3nEr0JVdqyRzBbolfyuPQOz2/yicgKh7Cvd1yQ8KbZHKarSW2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dvd/0gWByS7JSPGL03cPILxwiEHvlhItiyeW4bdjMzE=;
 b=TbddUNMregTF3GGB5b1ZOCXEUwqQOuJ4ixei8E+VbVAGeWIT4SUNwxK6PPLH+XQPR+fxSgkrcjZFC2US5we7t5rEjvXprvSYWCwN55HTnZn3tuIpx0QfIBzc1lMCDXpqnTfjzRmodVtSInL2pTD4KFBRnYVOBhf/bYRjgSCBEEuc//sEcaYnLDq/0tjC1CTcH7ExjN102jFta9va6+uIb0oR7Kcf7YdLcXI1hv1JU4XGRWjdaoxJGzSTekQykuqKDGxX+TE7lXTAPq1/tecEJtS1an3S2PKs+D/al7VF6AaBTvFZAVMraIJK7bmCyk3PxBYJL2vGr6Wn+eT7gCV/IA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 3/7] xen/arm: add support for PCI child bus
Thread-Topic: [PATCH v2 3/7] xen/arm: add support for PCI child bus
Thread-Index: AQHbkm/VQEv3ZcEekE6JuMob/0RHFg==
Date: Tue, 11 Mar 2025 10:24:56 +0000
Message-ID:
 <1737690bf95f80ca3965abc5961a05b2193590e4.1741596512.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 0e4e3ea4-7743-43a4-9ac1-08dd6086f8ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?54KUlCvfMQxD8Mp9W1RlkAUvEc3p3YsK+T5zoyOyOL8K9dajKTTSvWcyRB?=
 =?iso-8859-1?Q?IorSfn/0DTe/UheusJGLpi/sEaJIktYmLI7irsxqvGBzdwJxoi21R632TU?=
 =?iso-8859-1?Q?sgQGYVAjvk1/l3wZhfTEMLJ2x0GQOs3UWfMunwwpPY+0QWtT84YZjwSb9D?=
 =?iso-8859-1?Q?8jJfCEWsKzleVE2xoMXQEBrs4xHq5xXbk3WxI1NQ0qQAUOh/Aguhqfc5EE?=
 =?iso-8859-1?Q?lT4c1q+42iXmbHXHxE0arsxrjL9u+RllCHN72zxXtnuHN8YgyuBpaqxlQh?=
 =?iso-8859-1?Q?NEpbusLlChXfrRES0Jnq+1kQ9Xt8OlYAlvwqCnv5WU1Ux2oyjQvUKD/Ztl?=
 =?iso-8859-1?Q?gWY9IkuaQk7zcddhnndXJXJ35MuO21CagANOh+P+a4na++qh9IFdo81nad?=
 =?iso-8859-1?Q?lruZ56QtiOcPaK4OLBof1aqoamyUv6k03QH+yzP17VhK54crjls1Cwwl5g?=
 =?iso-8859-1?Q?WaM+5zImSY/ao3+Wqi++kujglXPMVgp+WzedYUJ71cTqY3auQEwv59pkIU?=
 =?iso-8859-1?Q?y5offmQnUW8FkeexQBARKVOiqPtwBLwrtEV+ytp69j0dRYar2FcJxjnzgT?=
 =?iso-8859-1?Q?oNu3wNmNG/46Iw7dcksPgwAG4qcI+WpkCtroQToGYDwnV4kNWJp4TE4YnN?=
 =?iso-8859-1?Q?rXyMNNiU41KSUHfHg915Bdp19m4Gfv96CnPC4IQWBEM8j4ABhaY8b8Kfzh?=
 =?iso-8859-1?Q?Uh6C4mZQW4DkWb4w6I/+8fUEQTflKQFKf8+wv6cJDag5w0MBIt0/sQnjIn?=
 =?iso-8859-1?Q?V/sVTYXb5AFvdZkQld64hE94/Sru0fuCTwxMcFMJCLnpplcOgE+R1bK8oq?=
 =?iso-8859-1?Q?gEfeunq77QjQ4fZ8vLgMKXhAW9ooz+cj8ETtbHoxAP7sMDhUxi8XpwAydZ?=
 =?iso-8859-1?Q?i5LfZY6riBhCdUntDwcczvzQ/loLjE1tbLluroq4LLUiDzQJ1O3VTECN7d?=
 =?iso-8859-1?Q?xOLLNNF8omN9vGOvBoDHS2SsiN66Lz25UL9fYwOXumR19IiNoYDtG0w/PE?=
 =?iso-8859-1?Q?SYTXEBAvu88iyRh6M2BOif19yMnXQ9LHlIlDkh39rxxgqJHC19Zb9Jb4sB?=
 =?iso-8859-1?Q?i0hmwJg/aYgyOdx8Z42KvIO/WeBGpxj+GVp9EXcR0Bves7e4XIRph9sYN0?=
 =?iso-8859-1?Q?nGdAmNwR2CmqACagkU5MN+a1UqwYaRPRghkQhRM7ond5EZfvZDB5nSaeRs?=
 =?iso-8859-1?Q?ruJgHaz/UcCejI3t73tqCSrND8iYm572CjArgd9XTDZDm1VdAd1VC6p51j?=
 =?iso-8859-1?Q?Nk8YbncoP+kGYmmk+sg0840GTD6Gx4X+APfBdP8a0ippUCDE1Mtm1suzuJ?=
 =?iso-8859-1?Q?i24VUPpFkUj0vzeZt51N75xKf7YgK1ZAW/LOfHeGcf6NlKQ9uGce0w4OnD?=
 =?iso-8859-1?Q?gwGFyc0HGf/J4Kq3HWEUJKXRM57Q26d+Xt2p/6wr+eHfOmpUZMQPNADGmi?=
 =?iso-8859-1?Q?kGPjoiwl4BpiqIuuVXZpFI5JCQypmJXrcDbVng=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1Qbucgq90CtkiL53fC70W6rWpVpRtWy7/wOcM22BSwQoLbIhF+4o1ojAa+?=
 =?iso-8859-1?Q?jZgOgH6CXz+cP7pUCS8MK7h71AgBNc61xrNkcB8xLId8DX4xVKZ3Km08Ns?=
 =?iso-8859-1?Q?6QAtYbapOaph/oyaedyjy8wNvPEesY66s3M1AvFuARCf3w4doanBP0OkTa?=
 =?iso-8859-1?Q?gQgIbqqqJ5cmkbtwSZi0kmDgkHBzbSmqMJfML1gfP4AZUYlPsY85iYyYAi?=
 =?iso-8859-1?Q?LU/iwHylQDIcPk8cHVOfmt9/rKb8nOdyBPM/X+qel/XMT9vnwc5pZVBI6f?=
 =?iso-8859-1?Q?k0ObpOF4nsADfclKhGtxKlE7OhN7lqJ5eWxJDQArmjHkoGv0yGfWO2rDuY?=
 =?iso-8859-1?Q?AGS8cfOD1g5P5gPTPLXvD35T5Vt1gybQa6CKtues8SmOvFkOH6sPj0mWpR?=
 =?iso-8859-1?Q?7VojouaJxacv2ylqFaQ4b/Xpnt5gXDaYAWm3mmsvDEDQXCF+HpV/+Z+2p1?=
 =?iso-8859-1?Q?/Ebsdl9BLaYHNJRldP9ifEW/kyEy+tbf2lJmlu1pq4VDz79PK/aHiXgBug?=
 =?iso-8859-1?Q?+NiXSa/4Iky0PIF4isAoh8IhTrxmRc5hsCECdSiu1qHDcc8A/m1ieTeF7U?=
 =?iso-8859-1?Q?gV16+/nfaC8aAheLu9wnXJXAaScNFaTDBc3My2iTAC3zdEDLQInUG7sQJd?=
 =?iso-8859-1?Q?h2m5V/MVRdJxddbfBhj6jM/c8Amihr6XybAFGuDFZv8IQ74g797B6m8XAy?=
 =?iso-8859-1?Q?Imfg3/7lPVx/IgXwAV+RDPR8NJ3jNOUfGATSnlJRcE/E4ps/VGKpulaJLT?=
 =?iso-8859-1?Q?sOHH0Nz1Zy09l5SKWDaCBDcHRSaq1pZpPIBPFokWTkZKjwc8Ge1zcqI9ys?=
 =?iso-8859-1?Q?Pf1YMIY51XkEZMg54lioUVYNGTDCFl+aCxHi8OHJQRaDX5S6MZlBVWPVZU?=
 =?iso-8859-1?Q?PaatWgyq2tbdLiw+DEeLdKjND80t6G8MnoVG/oomcbi1k7peRqPMOsdXgx?=
 =?iso-8859-1?Q?tI+Hm75Xp6tBD0VIgfNy2LbvDKDYsmi8aMqELtq5OgX6+v5+SGA02qeNQa?=
 =?iso-8859-1?Q?S2/Pgla5q/hd8JYqQMT7Wl90Hv0nxAURvGS+YFMdA25/MiRZ1nT49Gmu8D?=
 =?iso-8859-1?Q?P/HFFQq9V0boy8ytMKCg6Up6vDPwmjvrLs5/bAw+rjflhnjtkersRrnKAL?=
 =?iso-8859-1?Q?24uxHeYcxH5Up0/yBwMV78KHLVz0fE3gX6ioeg0M3fMto65bIDqiFkv+6h?=
 =?iso-8859-1?Q?mviFvDC7823y1EYBhM+EWNZfbBGCg9et1pyD9SVOiW7JRNhBJTI03q5QWk?=
 =?iso-8859-1?Q?0vxkNQTIFIBNL9eoRlx5xoD8xhD3TGTmhowj8LvOOXrui5BwPPMAot/KYs?=
 =?iso-8859-1?Q?Vmv/7jWo2z6IdP/+MciPZaH/hcUvDugkJfCZB6y/TaR9vnV3LuNkIIZFNX?=
 =?iso-8859-1?Q?MiOusSBQfQuoZ7gHuo2U3cTmpuW3mYCGtJ8O+ArbHA/Du7CjYesu5S//8g?=
 =?iso-8859-1?Q?mI4Wlh0kRVXi/9515HezPIjHgWsV34ajBrWpJBZKvfeiGN61ZTEhOiHimT?=
 =?iso-8859-1?Q?jAmRROwNFxv90TORNmKY35P0OTAZk/Pnt6sB6GUPHviiLtosg3S94Biw6+?=
 =?iso-8859-1?Q?LPGSC4lPPqHbj140etEqxq9bDLCC9YuuGX6n4FmMf5uaQdsjfUpIfOEIGe?=
 =?iso-8859-1?Q?wZIu5yn/uccaSYOcDMzZT4xYNDeXlEsn/89HwPeDa6C814N6k6fFa9pw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4e3ea4-7743-43a4-9ac1-08dd6086f8ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 10:24:56.1208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 061zzsoHUmq7lT442xgtDtkwTWqmYRAHLfFMRD4c6wEV8L1rispBLBXUqoZs+t6SlkuqYya6C5Kyu9mUfwoCKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10646

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

PCI host bridges often have different ways to access the root and child
bus configuration spaces. One of the examples is Designware's host bridge
and its multiple clones [1].

Linux kernel implements this by instantiating a child bus when device
drivers provide not only the usual pci_ops to access ECAM space (this is
the case for the generic host bridge), but also means to access the child
bus which has a dedicated configuration space and own implementation for
accessing the bus, e.g. child_ops.

For Xen it is not feasible to fully implement PCI bus infrastructure as
Linux kernel does, but still child bus can be supported.

Add support for the PCI child bus which includes the following changes:
- introduce bus mapping functions depending on SBDF
- assign bus start and end for the child bus and re-configure the same for
  the parent (root) bus
- make pci_find_host_bridge be aware of multiple busses behind the same bri=
dge
- update pci_host_bridge_mappings, so it also doesn't map to guest the memo=
ry
  spaces belonging to the child bus
- make pci_host_common_probe accept one more pci_ops structure for the chil=
d bus
- install MMIO handlers for the child bus
- re-work vpci_mmio_{write|read} with parent and child approach in mind

[1] https://elixir.bootlin.com/linux/v5.15/source/drivers/pci/controller/dw=
c

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* fixed compilation issues
---
 xen/arch/arm/include/asm/pci.h      | 14 ++++-
 xen/arch/arm/pci/ecam.c             | 17 ++++--
 xen/arch/arm/pci/pci-access.c       | 37 +++++++++++--
 xen/arch/arm/pci/pci-host-common.c  | 86 +++++++++++++++++++++++------
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
 xen/arch/arm/vpci.c                 | 83 ++++++++++++++++++++++------
 7 files changed, 192 insertions(+), 49 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index e1f63d75e3..0012c2ae9e 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -69,6 +69,9 @@ struct pci_host_bridge {
     struct pci_config_window* cfg;   /* Pointer to the bridge config windo=
w */
     const struct pci_ops *ops;
     void *priv;                      /* Private data of the bridge. */
+    /* Child bus */
+    struct pci_config_window* child_cfg;
+    const struct pci_ops *child_ops;
 };
=20
 struct pci_ops {
@@ -97,15 +100,20 @@ struct pci_ecam_ops {
 /* Default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
=20
-struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
-                                              const struct pci_ecam_ops *o=
ps,
-                                              size_t priv_sz);
+struct pci_host_bridge *
+pci_host_common_probe(struct dt_device_node *dev,
+                      const struct pci_ecam_ops *ops,
+                      const struct pci_ecam_ops *child_ops,
+                      size_t priv_sz);
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value);
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
                              uint32_t reg, uint32_t len, uint32_t value);
 void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
                                pci_sbdf_t sbdf, uint32_t where);
+void __iomem *pci_ecam_map_bus_generic(const struct pci_config_window *cfg=
,
+                                       const struct pci_ecam_ops *ops,
+                                       pci_sbdf_t sbdf, uint32_t where);
 bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
                                      struct pci_host_bridge *bridge,
                                      uint64_t addr);
diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
index 3987f96b01..5486881c5c 100644
--- a/xen/arch/arm/pci/ecam.c
+++ b/xen/arch/arm/pci/ecam.c
@@ -20,12 +20,10 @@
 /*
  * Function to implement the pci_ops->map_bus method.
  */
-void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
-                               pci_sbdf_t sbdf, uint32_t where)
+void __iomem *pci_ecam_map_bus_generic(const struct pci_config_window *cfg=
,
+                                       const struct pci_ecam_ops *ops,
+                                       pci_sbdf_t sbdf, uint32_t where)
 {
-    const struct pci_config_window *cfg =3D bridge->cfg;
-    const struct pci_ecam_ops *ops =3D
-        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
     unsigned int devfn_shift =3D ops->bus_shift - 8;
     void __iomem *base;
     unsigned int busn =3D sbdf.bus;
@@ -39,6 +37,15 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *b=
ridge,
     return base + (sbdf.devfn << devfn_shift) + where;
 }
=20
+void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
+                               pci_sbdf_t sbdf, uint32_t where)
+{
+    const struct pci_ecam_ops *ops =3D
+        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
+
+    return pci_ecam_map_bus_generic(bridge->cfg, ops, sbdf, where);
+}
+
 bool __init pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
                                             struct pci_host_bridge *bridge=
,
                                             uint64_t addr)
diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index 9f9aac43d7..4da607ac3f 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -18,10 +18,31 @@
 #define INVALID_VALUE (~0U)
 #define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
=20
+static const struct pci_ops *get_ops(struct pci_host_bridge *bridge,
+                                     pci_sbdf_t sbdf)
+{
+    if ( bridge->child_ops )
+    {
+        struct pci_config_window* cfg =3D bridge->child_cfg;
+
+        if ( (sbdf.bus >=3D cfg->busn_start) && (sbdf.bus <=3D cfg->busn_e=
nd) )
+            return bridge->child_ops;
+    }
+    return bridge->ops;
+}
+
+static void __iomem *map_bus(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
+                            uint32_t reg)
+{
+    const struct pci_ops *ops =3D get_ops(bridge, sbdf);
+
+    return ops->map_bus(bridge, sbdf, reg);
+}
+
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value)
 {
-    void __iomem *addr =3D bridge->ops->map_bus(bridge, sbdf, reg);
+    void __iomem *addr =3D map_bus(bridge, sbdf, reg);
=20
     if ( !addr )
     {
@@ -50,7 +71,7 @@ int pci_generic_config_read(struct pci_host_bridge *bridg=
e, pci_sbdf_t sbdf,
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
                              uint32_t reg, uint32_t len, uint32_t value)
 {
-    void __iomem *addr =3D bridge->ops->map_bus(bridge, sbdf, reg);
+    void __iomem *addr =3D map_bus(bridge, sbdf, reg);
=20
     if ( !addr )
         return -ENODEV;
@@ -78,14 +99,16 @@ static uint32_t pci_config_read(pci_sbdf_t sbdf, unsign=
ed int reg,
 {
     uint32_t val =3D PCI_ERR_VALUE(len);
     struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, sbdf=
.bus);
+    const struct pci_ops *ops;
=20
     if ( unlikely(!bridge) )
         return val;
=20
-    if ( unlikely(!bridge->ops->read) )
+    ops =3D get_ops(bridge, sbdf);
+    if ( unlikely(!ops->read) )
         return val;
=20
-    bridge->ops->read(bridge, sbdf, reg, len, &val);
+    ops->read(bridge, sbdf, reg, len, &val);
=20
     return val;
 }
@@ -94,14 +117,16 @@ static void pci_config_write(pci_sbdf_t sbdf, unsigned=
 int reg,
                              unsigned int len, uint32_t val)
 {
     struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, sbdf=
.bus);
+    const struct pci_ops *ops;
=20
     if ( unlikely(!bridge) )
         return;
=20
-    if ( unlikely(!bridge->ops->write) )
+    ops =3D get_ops(bridge, sbdf);
+    if ( unlikely(!ops->write) )
         return;
=20
-    bridge->ops->write(bridge, sbdf, reg, len, val);
+    ops->write(bridge, sbdf, reg, len, val);
 }
=20
 /*
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index e4e05d1176..3824146561 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -57,17 +57,12 @@ static void pci_ecam_free(struct pci_config_window *cfg=
)
     xfree(cfg);
 }
=20
-static struct pci_config_window * __init
-gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
+static void __init gen_pci_init_bus_range(struct dt_device_node *dev,
+                                          struct pci_host_bridge *bridge,
+                                          struct pci_config_window *cfg)
 {
-    int err, cfg_reg_idx;
     u32 bus_range[2];
-    paddr_t addr, size;
-    struct pci_config_window *cfg;
-
-    cfg =3D xzalloc(struct pci_config_window);
-    if ( !cfg )
-        return NULL;
+    int err;
=20
     err =3D dt_property_read_u32_array(dev, "bus-range", bus_range,
                                      ARRAY_SIZE(bus_range));
@@ -82,6 +77,36 @@ gen_pci_init(struct dt_device_node *dev, const struct pc=
i_ecam_ops *ops)
         if ( cfg->busn_end > cfg->busn_start + 0xff )
             cfg->busn_end =3D cfg->busn_start + 0xff;
     }
+}
+
+static void __init gen_pci_init_bus_range_child(struct dt_device_node *dev=
,
+                                                struct pci_host_bridge *br=
idge,
+                                                struct pci_config_window *=
cfg)
+{
+    cfg->busn_start =3D bridge->cfg->busn_start + 1;
+    cfg->busn_end =3D bridge->cfg->busn_end;
+    bridge->cfg->busn_end =3D bridge->cfg->busn_start;
+
+    printk(XENLOG_INFO "Root bus end updated: [bus %x-%x]\n",
+           bridge->cfg->busn_start, bridge->cfg->busn_end);
+}
+
+static struct pci_config_window * __init
+gen_pci_init(struct dt_device_node *dev, struct pci_host_bridge *bridge,
+             const struct pci_ecam_ops *ops,
+             void (*init_bus_range)(struct dt_device_node *dev,
+                                    struct pci_host_bridge *bridge,
+                                    struct pci_config_window *cfg))
+{
+    int err, cfg_reg_idx;
+    paddr_t addr, size;
+    struct pci_config_window *cfg;
+
+    cfg =3D xzalloc(struct pci_config_window);
+    if ( !cfg )
+        return NULL;
+
+    init_bus_range(dev, bridge, cfg);
=20
     if ( ops->cfg_reg_index )
     {
@@ -208,9 +233,11 @@ static int pci_bus_find_domain_nr(struct dt_device_nod=
e *dev)
     return domain;
 }
=20
-struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
-                                              const struct pci_ecam_ops *o=
ps,
-                                              size_t priv_sz)
+struct pci_host_bridge *
+pci_host_common_probe(struct dt_device_node *dev,
+                      const struct pci_ecam_ops *ops,
+                      const struct pci_ecam_ops *child_ops,
+                      size_t priv_sz)
 {
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
@@ -225,7 +252,7 @@ struct pci_host_bridge *pci_host_common_probe(struct dt=
_device_node *dev,
         return ERR_PTR(-ENOMEM);
=20
     /* Parse and map our Configuration Space windows */
-    cfg =3D gen_pci_init(dev, ops);
+    cfg =3D gen_pci_init(dev, bridge, ops, gen_pci_init_bus_range);
     if ( !cfg )
     {
         err =3D -ENOMEM;
@@ -245,6 +272,21 @@ struct pci_host_bridge *pci_host_common_probe(struct d=
t_device_node *dev,
=20
     bridge->segment =3D domain;
=20
+    if ( child_ops )
+    {
+        /* Parse and map child's Configuration Space windows */
+        cfg =3D gen_pci_init(dev, bridge, child_ops,
+                           gen_pci_init_bus_range_child);
+        if ( !cfg )
+        {
+            err =3D -ENOMEM;
+            goto err_child;
+        }
+
+        bridge->child_cfg =3D cfg;
+        bridge->child_ops =3D &child_ops->pci_ops;
+    }
+
     if ( priv_sz )
     {
         bridge->priv =3D xzalloc_bytes(priv_sz);
@@ -262,6 +304,9 @@ struct pci_host_bridge *pci_host_common_probe(struct dt=
_device_node *dev,
 err_priv:
     xfree(bridge->priv);
=20
+err_child:
+    xfree(bridge->cfg);
+
 err_exit:
     xfree(bridge);
=20
@@ -296,9 +341,11 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t =
segment, uint8_t bus)
     {
         if ( bridge->segment !=3D segment )
             continue;
-        if ( (bus < bridge->cfg->busn_start) || (bus > bridge->cfg->busn_e=
nd) )
-            continue;
-        return bridge;
+        if ( bridge->child_cfg && (bus >=3D bridge->child_cfg->busn_start)=
 &&
+             (bus <=3D bridge->child_cfg->busn_end) )
+             return bridge;
+        if ( (bus >=3D bridge->cfg->busn_start) && (bus <=3D bridge->cfg->=
busn_end) )
+             return bridge;
     }
=20
     return NULL;
@@ -364,6 +411,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
     {
         const struct dt_device_node *dev =3D bridge->dt_node;
         unsigned int i;
+        bool need_mapping;
=20
         for ( i =3D 0; i < dt_number_of_address(dev); i++ )
         {
@@ -379,7 +427,11 @@ int __init pci_host_bridge_mappings(struct domain *d)
                 return err;
             }
=20
-            if ( bridge->ops->need_p2m_hwdom_mapping(d, bridge, addr) )
+            need_mapping =3D bridge->ops->need_p2m_hwdom_mapping(d, bridge=
, addr);
+            if ( need_mapping && bridge->child_ops )
+                  need_mapping =3D bridge->child_ops->
+                      need_p2m_hwdom_mapping(d, bridge, addr);
+            if ( need_mapping )
             {
                 err =3D map_range_to_domain(dev, addr, size, &mr_data);
                 if ( err )
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-hos=
t-generic.c
index dde6a79a8e..08d94879b7 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pc=
i_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops, 0));
+    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops, NULL,=
 0));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host=
-zynqmp.c
index c796447ac4..0b51ff6bd9 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pc=
ie_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops, 0));
+    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops, NULL, 0));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index b63a356bb4..ed665e9f26 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -8,15 +8,17 @@
 #include <asm/mmio.h>
=20
 static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
-                                     paddr_t gpa)
+                                     paddr_t gpa, bool use_root)
 {
     pci_sbdf_t sbdf;
=20
     if ( bridge )
     {
-        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
+        const struct pci_config_window *cfg =3D use_root ? bridge->cfg :
+                                                         bridge->child_cfg=
;
+        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - cfg->phys_addr);
         sbdf.seg =3D bridge->segment;
-        sbdf.bus +=3D bridge->cfg->busn_start;
+        sbdf.bus +=3D cfg->busn_start;
     }
     else
         sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
@@ -24,11 +26,9 @@ static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_ho=
st_bridge *bridge,
     return sbdf;
 }
=20
-static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
-                          register_t *r, void *p)
+static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info, register_t *r=
,
+                          pci_sbdf_t sbdf)
 {
-    struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
     const unsigned int access_size =3D (1U << info->dabt.size) * 8;
     const register_t invalid =3D GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
@@ -46,31 +46,78 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *=
info,
     return 0;
 }
=20
-static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
-                           register_t r, void *p)
+static int vpci_mmio_read_root(struct vcpu *v, mmio_info_t *info,
+                          register_t *r, void *p)
 {
     struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, true);
=20
+    return vpci_mmio_read(v, info, r, sbdf);
+}
+
+static int vpci_mmio_read_child(struct vcpu *v, mmio_info_t *info,
+                          register_t *r, void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, false);
+
+    return vpci_mmio_read(v, info, r, sbdf);
+}
+
+static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
+                           register_t r, pci_sbdf_t sbdf)
+{
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
 }
=20
+static int vpci_mmio_write_root(struct vcpu *v, mmio_info_t *info,
+                                register_t r, void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, true);
+
+    return vpci_mmio_write(v, info, r, sbdf);
+}
+
+static int vpci_mmio_write_child(struct vcpu *v, mmio_info_t *info,
+                                register_t r, void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, false);
+
+    return vpci_mmio_write(v, info, r, sbdf);
+}
+
 static const struct mmio_handler_ops vpci_mmio_handler =3D {
-    .read  =3D vpci_mmio_read,
-    .write =3D vpci_mmio_write,
+    .read  =3D vpci_mmio_read_root,
+    .write =3D vpci_mmio_write_root,
+};
+
+static const struct mmio_handler_ops vpci_mmio_handler_child =3D {
+    .read  =3D vpci_mmio_read_child,
+    .write =3D vpci_mmio_write_child,
 };
=20
 static int vpci_setup_mmio_handler_cb(struct domain *d,
                                       struct pci_host_bridge *bridge)
 {
     struct pci_config_window *cfg =3D bridge->cfg;
+    int count =3D 1;
=20
     register_mmio_handler(d, &vpci_mmio_handler,
                           cfg->phys_addr, cfg->size, bridge);
=20
-    /* We have registered a single MMIO handler. */
-    return 1;
+    if ( bridge->child_ops )
+    {
+        struct pci_config_window *cfg =3D bridge->child_cfg;
+
+        register_mmio_handler(d, &vpci_mmio_handler_child,
+                              cfg->phys_addr, cfg->size, bridge);
+        count++;
+    }
+
+    return count;
 }
=20
 int domain_vpci_init(struct domain *d)
@@ -101,8 +148,12 @@ int domain_vpci_init(struct domain *d)
 static int vpci_get_num_handlers_cb(struct domain *d,
                                     struct pci_host_bridge *bridge)
 {
-    /* Each bridge has a single MMIO handler for the configuration space. =
*/
-    return 1;
+    int count =3D 1;
+
+    if ( bridge->child_cfg )
+        count++;
+
+    return count;
 }
=20
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
--=20
2.34.1

