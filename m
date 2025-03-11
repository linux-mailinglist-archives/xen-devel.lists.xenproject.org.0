Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9F6A5BDC6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:25:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907709.1314917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnM-0004SE-EI; Tue, 11 Mar 2025 10:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907709.1314917; Tue, 11 Mar 2025 10:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnM-0004Od-Ay; Tue, 11 Mar 2025 10:25:08 +0000
Received: by outflank-mailman (input) for mailman id 907709;
 Tue, 11 Mar 2025 10:25:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFC1=V6=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1trwnL-0004A4-8n
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:25:07 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20603.outbound.protection.outlook.com
 [2a01:111:f403:2606::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 193cb026-fe63-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 11:25:05 +0100 (CET)
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
X-Inumbo-ID: 193cb026-fe63-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inqdVN7uVusAHSbG/YVKB1F8Fzw/qJX2aSWG6dgubfDLy4MBmRe/HXNYuylfE4WXCDcLOf4x5EDR4R5OU9evmKczSYTXK30LVHUDFL8t/dVTGBnaFdkRZDWZ56xHToIIdppGg6qZFUXhBojNUX5Dyyv1xrmdytSdt8msutiFMg9f87FlPlR4TwiSZMyIRqjbbL6xPj16jw2Qy7qe20hQdLBQg86+Nu+tvkZlGxLtLFX3x2BPkIL1xCYY7Nm8WkIjt3Mu40KDmhzVMLLseSPDgk1AIglQjeLI5YdKFk9egtnU4ruXXcYH7Bwk/kahxUbZ8IP+H5xXcC4ZQ6oFvC5q4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0TfRl/3++KwXJXT4f/ciAOEs4ilm6jBMLPNvvLZqhU=;
 b=ECKZZhYISW2w8kG4YB+QmP4yra8LQh/uvgMRxjYTTGns66BrpKugZMvKz7QeVI/wH+OYKAIOmoI3JUMuei3yQLv6MPaP+2WoUZlOuL5W3yE5nEtn6hZ/DiYSI4EWT9ECGUBnBWJ8J3s6JbtCEcc3vRPIJdwiQxG7RpGrzIrgnZu8Ows09kc78Rj6HCamg1pgptInICDoHAk9xgL+1SXrJcJuvCs0gRCLk9UHRZzkVR/GK4VPmuPcsvoX0T+bj+1IXxwrDXUf3sEnmu1uFU3VW7skRFWOYaP3K7B3tYzAw9ld+CHTwQd5idITtm61dCcOGQDG4YIUD5e09VfHts6X/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0TfRl/3++KwXJXT4f/ciAOEs4ilm6jBMLPNvvLZqhU=;
 b=mouxT5Zxm+9IypMA28g1rxZRlepDvjTGFMdrObLvjHwXULpS/lB8haBMS6NjeROC7hLYg+n4mnerjDYTgZiMr+iXgvNWbhsaP/QRiSQNVF7zUlvosUu3tQ6E8pPbfGDy6I6xE9eydea2jXLFtS1+D/3h7UOJ0DWRincBsoY/1Fah1aWgeda6O5NenvztXRuomhOh+Fu3CGlu2x0FVKHWIJb5BjAHjymvYn/CQnjus3yT4bf8I1P3tQMj6c3LNreUKDWK5XoY/EPsKktf0p+RQoSES8yOE3FCrhcwMyktNforvFPbTvZoiXcFiTuuBMX9JDX0xRMOFiRfwDxTgZrhkA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 6/7] xen/arm: rcar4: add simple optimization to avoid ATU
 reprogramming
Thread-Topic: [PATCH v2 6/7] xen/arm: rcar4: add simple optimization to avoid
 ATU reprogramming
Thread-Index: AQHbkm/Wk5N38mqKT0ikm3bT0fuP8w==
Date: Tue, 11 Mar 2025 10:24:56 +0000
Message-ID:
 <e01e6aeba461001093b0da9af4c14b922049080a.1741596512.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 573653e5-aaee-40ac-db9f-08dd6086f92c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?W8uZaJSm7kuX4xLokQlb0ydhe07+HZPq3gAkl17SkCcLjjv9UYPAFSXwgp?=
 =?iso-8859-1?Q?Vj3WfOZc3bOtNoavmaUkFPVkg0nFxKHj3QpivuDzbaHP4B436IHvmOqTnG?=
 =?iso-8859-1?Q?Zi5Eyc7+fYAFr79OiT/WdgWHq5xjwoCapYpxerJ0XJ5Qoyq2Sc3LAkUl+d?=
 =?iso-8859-1?Q?9iJcdFUpH7P6vdwvsv2Inht7+YxYob4oA6h18JPfBo3jhGgJhj//Pls34O?=
 =?iso-8859-1?Q?6RSpma00DCoYKwkH62DC5iopwBwCMEKjUsXSymOxKt51lOvN2yTiI+o3Dz?=
 =?iso-8859-1?Q?5i+P0PAc5OiBwaFsSiZAeq35d8mlsXW+MdNiWsVQz4/MMAOmSalhjeGEnR?=
 =?iso-8859-1?Q?ubKSGiMdL7DV+D6MkCrZR3DnddBCOSB+fk628kcovnEI0DPVE0EWN5k1Iq?=
 =?iso-8859-1?Q?QjIKG0arj2m5O6dfo18pdo4fes8lVP1RXb7jMHA0mB0rIfqdHufWh+HvMB?=
 =?iso-8859-1?Q?SEu3jhezNo+Upi18f/C76KqTiK0JdlmsDKGY4dbz32ln5aIBf9e1k2BqSC?=
 =?iso-8859-1?Q?7NbEaqDq9sy+kLiaEa34udIRtNp8Ajc1JuSiAc96q1Y5nwI6/CSEEODLkq?=
 =?iso-8859-1?Q?tMuPhltBlOWnDwJZhUU/HezUvK6jEMESKck0oEt5kDOWQFpQyKPxVyiNTS?=
 =?iso-8859-1?Q?ASajV9igze++WHSb5iYbqq1YFgyiXYBxgo9XcYd3H/1b5Tv+YyQj+73boo?=
 =?iso-8859-1?Q?5gTGIetP+fAJFVQnE2/iXbHBoa6lGhLEZDHx1+6MyTJB2l+rDQ9Hu+9T+z?=
 =?iso-8859-1?Q?t6aBXiLgXWpCvocaim1evYZtB6RyHmxpA7aFMrSoOPqwnw9HS8mz5VzYGo?=
 =?iso-8859-1?Q?p9/WtkimPmH37A7ijJWpnKU05G10PwId0Yq68h/etS2ykTPXXfqSLjx3TR?=
 =?iso-8859-1?Q?8NhUfAraTZp+yfvufqyye+/xRgAw2VlpLbqyQkzN0VOkuSiE4coxY24rpP?=
 =?iso-8859-1?Q?9LSGVLdagaE5uSVih6GT/+t2rgCgcdtnPFe2GXUGEc7bhCZ2t42LlkjzRe?=
 =?iso-8859-1?Q?K16EmPh+CCMpcysLaeB6G573yhD+0YwIdikfr8PPKHfk2zeT+NmI+5JU6B?=
 =?iso-8859-1?Q?UMnfG56S7bn5gYtTBiHC+azlvyhcgZSljgNsuOai1cIY9NH3D52x3Th/m4?=
 =?iso-8859-1?Q?kA4ghRa3ZEtvWWkGkLtbGS/dp2/uvv3ilp+Cgn59N8t9Q8DWoTM4o++or1?=
 =?iso-8859-1?Q?EsytNzDPy/N7CsZSeqIJjp31Rtymj3K9gv9vToaaF3PazVm0a72AmArlrc?=
 =?iso-8859-1?Q?XqussNzveNIarGzkfkgPtR1OLetg6vBUgkIBe5oFxPC7gf5d9AW2UA0HDj?=
 =?iso-8859-1?Q?6dL7e50uhVkhDnm6+G8mNc1RynsamQm12vRkHLt1x839+MHMOZL+sLVG5J?=
 =?iso-8859-1?Q?zXkPEAba3yAiWyja9ddhe3tNFpn9O3HKVD+SnAj34yJmULvSvsuMV+gHEz?=
 =?iso-8859-1?Q?0FTbRst2/7F1DHrjcjDTY8PV8UeCNXWA1Wrw2s5j8JqVhpMA0CCWxOmBW9?=
 =?iso-8859-1?Q?N0qWRlf6S/2CpAUJ887DDA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?G2+M8EsPgg73QL02YokWWyhIsnOS/Tkqi+4v8y7N28TdaFiSiaRMOxctPV?=
 =?iso-8859-1?Q?ASVWeuTmWUj2UORpw35c31p048elJjIO8TUduSOwRU47auGbXsPtb0odL7?=
 =?iso-8859-1?Q?We+TVtNPoLTL8ITDC+qU1qiayzitXEIeIMzaMl3BG0XVD77D/JlqCjncv4?=
 =?iso-8859-1?Q?mJrp6DLvJPI3DUhB6L/XXzxfbErbEAZREya9KgjdfG0k4a67rXk+AV9amA?=
 =?iso-8859-1?Q?vOIIe4atcRffrSQxN/wYlw/Ev/LZjjNi6hvbIGahwW1NeWXorXv/Vy1o/s?=
 =?iso-8859-1?Q?Tt0joMcmUGsoTCu/PA4U4gYHgjE7+Sq+vOWVba0LrsdmbJccOy9yZRoO5L?=
 =?iso-8859-1?Q?cFziPduyAPTcRhmz/45eE3FHiLf2PZF1B837aGeYKu6HKrzo6g7VDrIk97?=
 =?iso-8859-1?Q?y8ECmZY5OBPdroWOTqGtNbrNGhMem4YRjvZjpTvmZOd6aPRSORGuGIk3vC?=
 =?iso-8859-1?Q?wiu7aBaq6bJNJx6J6MC8WUvqFDepREsAODE6hKcIx006LYP9rkzw3bGbzt?=
 =?iso-8859-1?Q?r/1nyEKUVT7jizphS3xIHPKwGwe9mcKPbbdj05L6uvpx9d7wdEk3o6elot?=
 =?iso-8859-1?Q?OoDUGP5ArRSw+DhHZAj662nAihrvio5lQY5yd/Pd4viBzGS1Ootl9vKAPh?=
 =?iso-8859-1?Q?EAjVUVCM6785MQ16gyaRK3bauJUpsX9lL1dKbx44kowAjjetUNDcLH2jYq?=
 =?iso-8859-1?Q?nnt918QQQj41sUNWa7fIXktUFth9CNY5wdLQ/S+iiZpcjdjYgyAEWnD0q6?=
 =?iso-8859-1?Q?EqakklIGVb+210VAW+0gqZOQIKglcaVLV3sWS3CZFL9k7l54ZS1Cup6Fwk?=
 =?iso-8859-1?Q?BFfXANhlEsX0kU3eTUWHpFlpHrdEPqWQSh0BZ9rsQSRX/sM+GLrghiVrFs?=
 =?iso-8859-1?Q?+r11+TNvbPCQC15kFftt1CAUpJwGCHGWvBqTTukGikbFrmaX50RWPEWVTk?=
 =?iso-8859-1?Q?2Nvo9sjYac/oLKevXWlZF0kcVsgRnDuvHoJwTvk/AoVvgUUlram4Fb5PeM?=
 =?iso-8859-1?Q?Y4YZOwQGenPymr2Oyxo0kRBU+fsDQHlK5nNEQfKfHF5Mbbv3e22DB4M75O?=
 =?iso-8859-1?Q?4xbWF9IhkbCvsVMVeRICCsnHCQMMYCMkcitgnq1l//+5FiC3ZgyE1s8MsH?=
 =?iso-8859-1?Q?bkWq+D6se8Sh3GiZGt2/2jCA9lziY0b5jegsdU8GdFqkapKNWNiTcGn2J5?=
 =?iso-8859-1?Q?TRBJ75oAGi3/F4F3EKM2Tvn81VfXE/Gb5+U4M66lj4NtT8RAJEarYRRENb?=
 =?iso-8859-1?Q?b+fSFo3a045EvTVaTII0rOZRwuk1VgtiqTmIT7uqwEZd/dN21o9v9nmw+d?=
 =?iso-8859-1?Q?8wo8f+lLojX9yXBhnF9mta6RI55nPur1vjgjSvP2qFxfROEX5rPXxwl3NL?=
 =?iso-8859-1?Q?eYXPl/57FKs105ueOSegnuNoEsWKppGzDqcMbE1xtbWx786ZSxy/G3kE5F?=
 =?iso-8859-1?Q?ruO4AFKoI73Ka782VBQayuRER82V8706UR4BxoZhGKOqEMMA5NyGVEFX31?=
 =?iso-8859-1?Q?saYoofdSVrMjL/ElzuN9f6A7Dn4DF4RHgNAJoit7mJRBY7REfWhKwVu4c1?=
 =?iso-8859-1?Q?aaAofmMTIuTnhUPG+9UCgn1Bq7+7rsPJ7L4uFvXFYPrbigQ9rvbYxyDOu5?=
 =?iso-8859-1?Q?1N6rGYPVSp+CBA62bfAa5JmG0ehW8P40iN/nF4YVCqVwX+xQrAFNncmA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573653e5-aaee-40ac-db9f-08dd6086f92c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 10:24:56.9178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J6Z5J/bdCktozfOkQkAgyPOyPZFdY/aDh/c2sL6FAIB4iz5R46fYNqoQKaxvj8q+M/+qQv+nAfWzRdG4ex6YYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10646

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

There are high chances that there will be a number of a consecutive
accesses to configuration space of one device. To speed things up,
we can program ATU only during first access.

This is mostly beneficial taking into account the previous patch that
adds 1ms delay after ATU reprogramming.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* rebased
---
 xen/arch/arm/pci/pci-designware.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-desig=
nware.c
index def2c12d63..cec52cf81a 100644
--- a/xen/arch/arm/pci/pci-designware.c
+++ b/xen/arch/arm/pci/pci-designware.c
@@ -272,6 +272,14 @@ static void dw_pcie_prog_outbound_atu(struct pci_host_=
bridge *pci, int index,
                                       int type, uint64_t cpu_addr,
                                       uint64_t pci_addr, uint64_t size)
 {
+    static uint64_t prev_addr =3D ~0;
+
+    /* Simple optimization to not-program ATU for every transaction */
+    if (prev_addr =3D=3D pci_addr)
+        return;
+
+    prev_addr =3D pci_addr;
+
     __dw_pcie_prog_outbound_atu(pci, 0, index, type,
                                 cpu_addr, pci_addr, size);
 }
--=20
2.34.1

