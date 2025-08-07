Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09E8B1DD1A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073355.1436424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P7-0003Rl-Iq; Thu, 07 Aug 2025 18:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073355.1436424; Thu, 07 Aug 2025 18:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P6-0003AE-T3; Thu, 07 Aug 2025 18:31:52 +0000
Received: by outflank-mailman (input) for mailman id 1073355;
 Thu, 07 Aug 2025 16:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xp-00076W-3c
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:37 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e513b6e4-73af-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:59:34 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:30 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:30 +0000
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
X-Inumbo-ID: e513b6e4-73af-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGcIWVJAgzSJ7SDTPk84jg2pvaskaLRYXIEcNDjTwQn5DUIGqSFDhtitobO2Zvj8rfdIrmdnOJRhzqdWBGho/OIzdFBllO4uEnIOLVIAnerr2eQ8F6JqDmd5xj0KAr8jSKYcGdJz4mlH9RNoURLRf4iH4visn3qKJwFmwvBGTIqnc6HIrMsrklpd5n+aXf/qV2xXVwHJ66psBduhtQCOpQEgo1hNO9Cn+dvssQNXPbifuxGaxrcM2e5TB14Bm6DYkrO1bKyQq5BIggD2mo8B1qKTm0xndeDXinVB3ntFnuiZB/MlHhyIc1c7AvpVptGEKyPeQhLiWR8U3F4ymGtTwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0wLAFBe2B6lmF1G1qgjASfVwAIUTNN68hmplMu9YVA=;
 b=BdIJzCmkCHHYr5z0qNQOxUT1WgTYw/rekpiMq+SribW4vzH1ZFAzFYx3DnHS9tjwA/s1zqAtyzxwoiPNN0FJchJDWkwxFXU9zqYoM8u8gUMtvGaOhIVIgFfy2y/zJb7/LVChp8UQ+dbx62l9nSZzJ5pWK+zldjt6o6tg2ZO4f2Xn27UyZawuh6Ss03VQGCq1ONjZLUmTsS0Y0kM6mLAiyaiIoccpS+O4GPA75UOshAsDT+NE8SKjrbhFa89tw/hxmbdXzYseRDo4vqTdpOm4tP6lmcWCR7uHwhLTjXquv1F9l8pGL1UkYmyzGCqwhL4slRtZcriUlpMejp8wHS4kzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0wLAFBe2B6lmF1G1qgjASfVwAIUTNN68hmplMu9YVA=;
 b=BJg37zTeOjOgdTuDprqjLZQBFPCz8cU3gdLr6x/AlnShneL45HIRt+cWsAiBllOWLdIY530eN9TIAsqHbWpbH2ipjCpLgNoGAVTyVHHcTntO7ElMATrYby8kA+2klBIf+Q52cixZT4qnFShfEcsAHT6VsXA/9PeAEiprSZggaZFsKBjudFbnDsBYV6iYWeNFtkC3DZXZG3sdducBETPK/ZxZaJ7Y3E92ZFwYVkfJpZbH5KHxtMbYmq+RiN5GJH2rrYi//wEm13tJYCi3ve6MiLkqEDPBjthOE082dmEJXExXvLtBAwQIk0n7u8t0/0k3m7Qq60G23Q4CAGmceGMxDg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH 15/20] xen/arm: vsmmuv3: Emulated SMMUv3 device tree node for
 dom0less
Thread-Topic: [PATCH 15/20] xen/arm: vsmmuv3: Emulated SMMUv3 device tree node
 for dom0less
Thread-Index: AQHcB7ykWuFnTntxcE+YZDhqvaBxqA==
Date: Thu, 7 Aug 2025 16:59:30 +0000
Message-ID:
 <0be8cd7abe1c3b2fde6cd4a0004e443f14f99d92.1754580688.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AS8PR03MB7336:EE_
x-ms-office365-filtering-correlation-id: 06e2b492-ee99-4c72-38d1-08ddd5d3c6ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0CzW3FYuGQdkUuk7YOPgePNQufbmtKL2y2dWL3sfwGBvv/Ncg7Qa/kgfGx?=
 =?iso-8859-1?Q?/ejnFXv9UTlo8zkQiL8TIbwXVJezIt94tZkv4tGtTboXQvganot0kgtI0g?=
 =?iso-8859-1?Q?nMLgtb27k/ThR0Qv3jKDsuJvO2WXhRoAGMXmfRcUiwQjMqgUfjdYx+W/7j?=
 =?iso-8859-1?Q?94Sk+nj5Vlpa13WK2o3iQQl1+5mF8SPQ453T8kBRLYO8ekoiHMtsj3JDmU?=
 =?iso-8859-1?Q?olJRszZ4NCL3C++ctIMwb6LFuvt0oU+KAxUCpyvjmWTZaPU9NHXl9dtHHt?=
 =?iso-8859-1?Q?pz+mVcbp1XG1HF0rtLDDqxuP1twKew4f6fdbTtArVSQq2VYYQhtq0nKtFR?=
 =?iso-8859-1?Q?OV5xaOYi9CGAyT6NSsAZWQpt8kG+1kX8diX4QF3PoY4JRmXkr4lP7hyXS1?=
 =?iso-8859-1?Q?Lr+cA/uCHJtvbhol2kxD9UKN/E/IdCk1JrtlA8yuGURygBkmHygJqAueDF?=
 =?iso-8859-1?Q?vMIrrlLwMkT34ZPWY5OrmW8yHegUNyV9iK/ln+Iz19N8yYU2XVx/1c6MLA?=
 =?iso-8859-1?Q?psuvwHiEbMB7gT+fWjtXw439hv9ht3F1gSHwZn1zUIzVFoPth93qVPLl3g?=
 =?iso-8859-1?Q?tJzg6r0dL8xlan1DDfShpKs7Xvboq/+sXMZohQYik+2vkpSp2PskZWox/i?=
 =?iso-8859-1?Q?K1w5tk3qKlBEtc1IjI/LPHKyFEpMMS4gGhsxCD7pXp22E/jgvBwmeMalFv?=
 =?iso-8859-1?Q?1kZO587+OBRoiacEMG4edIbSoNPosXU7iFCewV/mzkWv3FQTLLo79rUpq+?=
 =?iso-8859-1?Q?Ze4BpmvnafcBqUJJ1yVyWzExWKu1N+tdpC45xIuf6ntf2shjfd8PSpnDlz?=
 =?iso-8859-1?Q?3Mthds/tf7aM/I8sKoaFsE6X+Z+g+iV3EKRJrFtmXDGnMehcWaFR/rYn03?=
 =?iso-8859-1?Q?Av3ddbLdxwStNBpO02g72/V1X8geVcgF4MBvyRkTxorBwigSaeQrhnqgzO?=
 =?iso-8859-1?Q?1GLksVHxWn+bzaRTE08vM0Yo2Vxi5VLLPjnssblcGfa5xMtf+XBEcp+PBU?=
 =?iso-8859-1?Q?5WRXPDPHTfAexpFy5wT4gpQpmCIvPeVffZRSh85bO4lWD1IJ4uFNuiIYEE?=
 =?iso-8859-1?Q?AGfrrok9WsSUgtENIhWFvylUppDuLLzb3pp07aCrf2iYQItYK3C++Prhcq?=
 =?iso-8859-1?Q?3c77S27LauUcM/puQFf+KvBaH5z9dwD849cuU2uyrLRZNEkVTu5pge5L+N?=
 =?iso-8859-1?Q?7lAIwfu9uBxPitzOk/k8dF9AGXS6NkxQgAhfJEmARD9aiBhzoRk2YCZcF9?=
 =?iso-8859-1?Q?2vzNplLFmElRcTIc3YRnme9MkqkGg3ykMDtH4FeIV/G53y2A2EFIu+waZO?=
 =?iso-8859-1?Q?/B9pr79ohROTuRjBz1cu9TVrQKdIh1KmUuEIzyi2k0WyMdbpTBz5y8KTqg?=
 =?iso-8859-1?Q?+EkczRymnxpUQqwc5NZAwiS4MykPYGmbOgqswAwzS0fB9Khegzs8mgJJvc?=
 =?iso-8859-1?Q?qKcIyyNv9QM87k7/k/7ROekAsaHJKsrdc2lKGGnxSS0MyQCFdBagdMNSqG?=
 =?iso-8859-1?Q?dEk9TIA7CpUy820bWsyXlsf8t275BKkFJ66nKbBij71g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?d7faCe9I/Z75OX0aI4If5Rpruzx9XL+8dZIOM29ouHBS3FEy3tP5/zeWEo?=
 =?iso-8859-1?Q?btFzs3L/2DukZANeGB4ejI9cAjwB3ZOSF4agxzeIXLc7mvXeEdA3mG9yVB?=
 =?iso-8859-1?Q?mI2Us9KHZVVhomM3oEnJ1gULGLQAN9PU3/gDIKxUM6iAmYEfkCX2FrQT9a?=
 =?iso-8859-1?Q?topv1X3YXPJ1DBo8y4riWraT8Vkvk07SJSULw5sBQ060Y/v3UASD7ifUaO?=
 =?iso-8859-1?Q?LJbrcVf1Y5OZBs7ZQ6PC9X8Ky4V6kMtMk2jLajxpnPneFhpPRMGv/tSzsc?=
 =?iso-8859-1?Q?k2MTP+z817jZlm7w9KlNOfARoioe1MvqdhCJxuUGhpoJxtghmdjaVO/UpM?=
 =?iso-8859-1?Q?tMtK7esEPa0tt5VbrOAkTCT0vUvS20YR25PQh0Mz8exZxtgMlUUE7CrkuP?=
 =?iso-8859-1?Q?mcB2jdfKAhdlkktEwAkLll5O2OL7IkFBes5iobkl4jxXR9LEJA1emHvqpf?=
 =?iso-8859-1?Q?0iOicG4CDucphujeB9oIoAB+7yVDWBB/igyE8+f5jg82mIk8P4MTCDfN5X?=
 =?iso-8859-1?Q?259WnX0Q7hfpQbOhmusrWciZ1Jyv4Nj9kPETWEMIj0121ny3pnkAMu3qmz?=
 =?iso-8859-1?Q?a737RPIXlgeD/wewrxGf2pqoO0hpeaZ4VLP1OFZ7PkDVXeeRz9q7CEk2K+?=
 =?iso-8859-1?Q?R/hTWTCYyLJ/83UD5cSgKQdN+CYau+aRCcahFaxXqplScrnfvt8eE7/PQ3?=
 =?iso-8859-1?Q?SOUCMuOkAYXl0uIKJddJQpGuUwr8WBgjJMae8uC2Kxk2c1e6kh1mr+Q5O2?=
 =?iso-8859-1?Q?RunkF9lw8mIfgr6AQTMrvwuLRYGF0jo7gSIKaGbJ67Zpdrd/UdycT8XACO?=
 =?iso-8859-1?Q?XEz7UmYBGxQnpNgavo7QfEund2TwTCVC177fwY9BACM0TC0aqROx87ZoGk?=
 =?iso-8859-1?Q?3LU6bqXhHgZErWEctQHjpvIvzkzrUkslLkmG2+nS7r8Cu6TCpplyFa5PbN?=
 =?iso-8859-1?Q?d2Rq01qw1pbFD/SSsVSDqWC5uP74MBJMJTBEzmPeV2RzCL1jdQ5fPsMfer?=
 =?iso-8859-1?Q?eueyCNFYpmg6bYRMdaHGEgfthNj2oiBU1rnz088x28xon+1KnlNngNbNtv?=
 =?iso-8859-1?Q?+5pPqviQxdMIF48Kc1xss4pn2E/uyOCrfRwkremUYWqPJe3ZMRCsoKjRyf?=
 =?iso-8859-1?Q?XQSKrLG0bwLyixLojrxDNgU+LP20GX5TanZlAZBSNdhigYkkqPMGY6dg+C?=
 =?iso-8859-1?Q?CJjJZwA3JypItv6YfaHHpfP2E7l6q8rLbbaO8njmh/FadBCB18hOi/FVmU?=
 =?iso-8859-1?Q?9O7Q72Xn7e4nPDAW+J+kkTC6K8bWM+txj3Man3BJSsYB+zIMBPYLNn/PyY?=
 =?iso-8859-1?Q?FeDpwBsr3yg7glb5rvykzYgsd1wBSGo3mp4XIuyeC/fKrTRu/DbH+xho/h?=
 =?iso-8859-1?Q?OfjFasaz5Xb6/Hik98NKB9NjRaZLm2SAz+hPRj9wWDi+GergIYrw0CYlYw?=
 =?iso-8859-1?Q?GuL12xuhFsVU3eAicT/3jKVJAeSCGxg8HvFMkUTEL+CZtJfgIDLu+zfick?=
 =?iso-8859-1?Q?sHz+tdJTAxz+PoBBYnwAvnzynADrmu8yjn5fQX0YyN5FyduP72TkHMF53o?=
 =?iso-8859-1?Q?lGxt3G02W4SXhnvPgCWhHU98Hv2pPpQjpMH/uSPLvX2Z2fBJmegPFNomxn?=
 =?iso-8859-1?Q?nbwd0ACEdSuRxf+bnSUraaMDuR7LpOtzIpyOyH7+hbiZS0sK9769MpmA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e2b492-ee99-4c72-38d1-08ddd5d3c6ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:30.4106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKgTFF5H+wlbIq0Yr9mmupQZG1v3keFLYwzG0rvLWrUAySSCO9yOBFmLs1Ix0Q4jpgPc/IjWqkd8K8k8RS9DhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

XEN will create an Emulated SMMUv3 device tree node in the device tree
to enable the dom0less domains to discover the virtual SMMUv3 during
boot. Emulated SMMUv3 device tree node will only be created when cmdline
option vsmmuv3 is enabled.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/dom0less-build.c         | 53 +++++++++++++++++++++++++++
 xen/include/public/device_tree_defs.h |  1 +
 2 files changed, 54 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 1fa6df214b..1e526c10de 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -217,10 +217,63 @@ static int __init make_vpl011_uart_node(struct kernel=
_info *kinfo)
 }
 #endif
=20
+#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
+static int __init make_vsmmuv3_node(const struct kernel_info *kinfo)
+{
+    int res;
+    char buf[24];
+    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+    __be32 *cells;
+    void *fdt =3D kinfo->fdt;
+
+    snprintf(buf, sizeof(buf), "iommu@%llx", GUEST_VSMMUV3_BASE);
+
+    res =3D fdt_begin_node(fdt, buf);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "compatible", "arm,smmu-v3");
+    if ( res )
+        return res;
+
+    /* Create reg property */
+    cells =3D &reg[0];
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_C=
ELLS,
+                       GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
+    res =3D fdt_property(fdt, "reg", reg,
+                       (GUEST_ROOT_ADDRESS_CELLS +
+                       GUEST_ROOT_SIZE_CELLS) * sizeof(*reg));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_VSMMUV3);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "#iommu-cells", 1);
+    if ( res )
+        return res;
+
+    res =3D fdt_end_node(fdt);
+
+    return res;
+}
+#endif
+
 int __init make_arch_nodes(struct kernel_info *kinfo)
 {
     int ret;
=20
+
+#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
+    if ( is_viommu_enabled() )
+    {
+        ret =3D make_vsmmuv3_node(kinfo);
+        if ( ret )
+            return -EINVAL;
+    }
+#endif
+
     ret =3D make_psci_node(kinfo->fdt);
     if ( ret )
         return -EINVAL;
diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/dev=
ice_tree_defs.h
index 9e80d0499d..7846a0425c 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -14,6 +14,7 @@
  */
 #define GUEST_PHANDLE_GIC (65000)
 #define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
+#define GUEST_PHANDLE_VSMMUV3 (GUEST_PHANDLE_IOMMU + 1)
=20
 #define GUEST_ROOT_ADDRESS_CELLS 2
 #define GUEST_ROOT_SIZE_CELLS 2
--=20
2.43.0

