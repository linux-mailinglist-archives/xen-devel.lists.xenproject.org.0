Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE30B2DC67
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 14:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087379.1445448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uohvP-0003ON-K3; Wed, 20 Aug 2025 12:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087379.1445448; Wed, 20 Aug 2025 12:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uohvP-0003Lj-HF; Wed, 20 Aug 2025 12:28:19 +0000
Received: by outflank-mailman (input) for mailman id 1087379;
 Wed, 20 Aug 2025 12:28:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rUzz=3A=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uohvN-00037u-Id
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 12:28:17 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25cb09f4-7dc1-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 14:28:16 +0200 (CEST)
Received: from DU0PR03MB10116.eurprd03.prod.outlook.com (2603:10a6:10:417::7)
 by VI2PR03MB10594.eurprd03.prod.outlook.com (2603:10a6:800:27f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 12:28:14 +0000
Received: from DU0PR03MB10116.eurprd03.prod.outlook.com
 ([fe80::7866:f529:f351:d5db]) by DU0PR03MB10116.eurprd03.prod.outlook.com
 ([fe80::7866:f529:f351:d5db%4]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 12:28:14 +0000
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
X-Inumbo-ID: 25cb09f4-7dc1-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+55iS4Cwunn0yOMJQjvshHY2BcrnyeokDLXQUddh+9axAq/mv3Za9kQk36t+aEPAcmsDzM5fa0SVjNCdenTRXAHXdjh07DxutMYw+7HMjVFm7kW7yLp2BFv+Ibvehw3gSHle9ByH7CDfahjcpbr73kVBvh5ZZ6IauQKB5JceJKicMt+SUtsWggVaNa1lQU6CbacJgKNmBMjboQAG/leWx4QpBpME3sMG0OoiNTZ2s6NnQhbvEi4NJ5xAJC6/PMReNJxmgUKHOo8vWOmmhaZfvDn5BbXwJz0QlemqC9nCi4MUBPgCg1cdJh1eeyFZXIOT/VNUFPL4BhhUnFosV4mWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHe2biraEfWiO4QhqZGE3FAuCAIETsgHo16/ecYld9E=;
 b=MNgtBXnYYcOOBec+Obe8ki6lBSd+g/pHSl0nYbAgZ4t0EB4CUfBRsKoD9gIYFicvtF4AxCP6LId50mq4CfzuKgPhHUzmEkDHhWmuCp6CFRTIsp0lrEC1NWzDVyO4wbnvWQGUK3eZYyTiDuF5lMwqeJLLLkPNvApg4eKeDNuwSBZjUYDei7xQEhDOseljY2+ukghd6hvVlW3IwH38H9M9Jt8jYUe7RbXYBa5KUwPP1cA7KnDLW7PkeXofabm/aIstTXs9VqhDjeiBsL1vLqfAx+MHz9B+YXirYnoV+9o9DXnE52DNMc2+sftbgUIXnLkExIBbzLseD54A8HPdRSEh8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHe2biraEfWiO4QhqZGE3FAuCAIETsgHo16/ecYld9E=;
 b=nP4kIKbAU9SKVR6+Mr4u6rkn/lUB54UlX53BYsI2gjgZlxeK4A/SRKan4fi/FnC2WSchZay8ypl374EdTlwTBhwj53Vfpe/ttQnZbnpD251PIUdbJS6lBX/u38VpDqY/hSa77qbAMz4z7sVGNvQLpiS4PE+i+vB1jbKVgoOWumFPSatF2nj2bnyT1O/fLkm8bg7RMd5LptwiNk9idz44RbssHKcsMaBLQm3+WCDMc+nax7UmunFS2GJ7CovQeGtZot2z9bA3Gpr7H3HUkv9oJ5A/PXW0Em6pSZm8zP7IRAvImxz3TLFWGjhU01TcZHtunwqXf8toKCd+YpCfbD4jsA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Edward Pickup <Edward.Pickup@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>, Mykyta
 Poturai <Mykyta_Poturai@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v2 1/3] arm/pci: Add pci-scan boot argument
Thread-Topic: [PATCH v2 1/3] arm/pci: Add pci-scan boot argument
Thread-Index: AQHcEc3mM5cSdUcCDk+EahVSEKlf4g==
Date: Wed, 20 Aug 2025 12:28:14 +0000
Message-ID:
 <e73e8d13a09294ccc8b256b15a8d3facfc878238.1755683961.git.mykyta_poturai@epam.com>
References: <cover.1755683961.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1755683961.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB10116:EE_|VI2PR03MB10594:EE_
x-ms-office365-filtering-correlation-id: f7e0ec6d-d513-4956-93c1-08dddfe508af
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?W7maNc7RivePspcT3pXSwghqzVRZn1bAqpfxoffO1DW1M1E2fqPt/YvWcM?=
 =?iso-8859-1?Q?/Eu9xn48IdU8zE+a8051vjMNJMW0OTE3GvsPcuNScGj6Ca5+/OOD1OJhX7?=
 =?iso-8859-1?Q?Kzmn5BXjqHZAG0k/H7R3CyHZPaMj7caajdr34TsWbKbPWwXwXc1+lNPZ8N?=
 =?iso-8859-1?Q?uSPcGSmDlnlaBrJ6ICtKbek7liLRFYogf+TF0juPEUQITCiTbsI0tvjrKn?=
 =?iso-8859-1?Q?S7iAdIyeBGF+ravCJMAHnDdMYvMJWYUvE2vmkzVrtsH3vyFua/3QuzhrlN?=
 =?iso-8859-1?Q?pds3qCkvaSrmy/IniO4+ZbUpQ52KU5HgguuX7ezK6uS/yGAwwrdLAotfAB?=
 =?iso-8859-1?Q?gPZU8DzSy85UOXD8PeqCNwawAS9NspI+fhhP77EGwWdYlxRz8MBxsfQDl1?=
 =?iso-8859-1?Q?CBh9Y8v5U5kqmKCtapnL3eXwp5aBSesNrYNkJwzxYn+sqvN1t2t8+LP8im?=
 =?iso-8859-1?Q?cAmuU2ZQGCTMyTr36VGgpyTw+nADW4nWaHnqDWf/xG75jm1eshoqMp6eLl?=
 =?iso-8859-1?Q?fF+tzkuQFlQrPGADDrLveyn4HAgpLpSj9rQ9+F8D/UUy+FvZv3AewAg+uU?=
 =?iso-8859-1?Q?Owq2Q17hQB/JYfkmS/ueKuEGhPEGfk9TyzEnI8EnLVlgN6K83svI8hi16z?=
 =?iso-8859-1?Q?yyzldnhC/sYAoh+5Dppb6C/FQsid2J7GW2wwyOlsLd22guRthV0Uaj2oIi?=
 =?iso-8859-1?Q?4kuTycjUZigJmzR20qD5ZD/1dxnOitUpX7J5oRmXKh7HWgzPwhVbFJaqDG?=
 =?iso-8859-1?Q?7o6O48eC1Vzw4FhviQUluk+sshHA9FqGC8u0l8ZxOkEIrSC86eXGt2TOxR?=
 =?iso-8859-1?Q?rXkCFPeHbHZELv+kLf3wkxRh+ufsDvzfhU6M3yDE4DDGGLgDp4Qpt4pe1+?=
 =?iso-8859-1?Q?GrAywWascxNs8PQdWaRpvt5ZCBFgrNGsJRC8PnkpUGRKuugTUSDGclTWnD?=
 =?iso-8859-1?Q?tkEAUmLuNmYxSme1rC0ieo3WkBOmSc3AGRo3PoBo9gMMnoL42PnRBnfzyi?=
 =?iso-8859-1?Q?YuNIfDiKaFlil6a+a3kWZKSE5p+QFeUVeJssxBLlUAyiSmVvxoReYOPiA/?=
 =?iso-8859-1?Q?EW1cETUDquuxoxPf/cshDAoVSCHx/6cdKtLsT75tGQ2Sj7yfRP36+ZsqD4?=
 =?iso-8859-1?Q?XGNjocDgm/WgTL3hgwc8+R9HhX99aibajpimuI9DKqBcHEnTEsJzL6gNTo?=
 =?iso-8859-1?Q?cUwxI9AQzl6Xf8/4lWKIiUeKtdlS82cXuIVfs4tO97VtDe+0dkDenMmd7F?=
 =?iso-8859-1?Q?lhtCtK5w04APZmj9ZOgvbo4+pltOuh/sIo5D5IJ8zRTjllbvmcBjZCAWD9?=
 =?iso-8859-1?Q?x8b2rETmUWa90fWyu54svO1QTnaI8dKtrRZVz6ptqkEz2Vv3meg4b4BHsR?=
 =?iso-8859-1?Q?GFeBPCTR7wkSNsfaVXtAQ5TPH8PNkNsQ/0PGyTfZIV+y5htFZpQVpqqsFL?=
 =?iso-8859-1?Q?dWAzNxSNHhXe3rS2/x3BdIC8lbfVP43gpmnHHQvGByj50tpbKVQt8DBjZm?=
 =?iso-8859-1?Q?pDfLoFvw+2dor+GJZbtx5s5ya+1rdGW4nK1vzwJuH0N+HAXtzWzBQDzmbJ?=
 =?iso-8859-1?Q?tmylajE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB10116.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kxeHluSTjxcFQqXTj0buvwT2wmKB9BQHG6Jkv683EdmyQIxHU3ZujBI1Dg?=
 =?iso-8859-1?Q?xHisLNrWm6TjQU0TVt3tN6bHgVtOXtmmI+GCHwGXdsfEVDrsO9ciZNKuUO?=
 =?iso-8859-1?Q?QtDT9Sa8L18j96Tq2dp+Aj4NvZCGq57FehVAoHXrW1YLL7890nfRroKDrV?=
 =?iso-8859-1?Q?iCy/HwlCeR8b1yCXGxQtpnvdMHfJtAacvzJemWl6sU5qdtzyBf5EMKk1p1?=
 =?iso-8859-1?Q?YKjWGhdnS+Pd+gz9wuabjQibdsw0Z0GBsAOf3OWx6E/2jYM8eNkNMsVUiu?=
 =?iso-8859-1?Q?rDWoPrDuCeYF9INzvGvtgM0bosn9WTNGAWKnMj6sALPg2LltmdwApEA2d7?=
 =?iso-8859-1?Q?IvN7esTPB5SP3Mime9FsCqB7YFgEE5PYRwN6UM6yAp/m2fPydrST5yJLej?=
 =?iso-8859-1?Q?QvKUIitnTL1r7CQgKdhyd+y0cfzuOEOpqsDTtQjtK0iY6eeYjJOpNE900v?=
 =?iso-8859-1?Q?ox6JIf7Mzp1cQ/ga2iAVXaAZcFnOIxmvc/onkSRNLxDzjS7mdu4GxBJ0HZ?=
 =?iso-8859-1?Q?/ZAUIqGdHohGeYHWlm8ZGVRQgeD56REozwmTFATfQ1kETSXZ4yOmE4fcAA?=
 =?iso-8859-1?Q?/+LVBaCNkbbThk6TgA6WOcdbWFF8UYid96qQ0DyRothfE7ia2/rnEFHAqC?=
 =?iso-8859-1?Q?TFqnKhIfyh34oZr7C1OlVHj/oj7FuTj8UbrsBNrTncCMo0FogQJQH7K8mC?=
 =?iso-8859-1?Q?SUm23cNDid3iJYXo1GVGjiWUL6YlZjQYK3BW8VpBSSuOHjTHLkPXzWtI+7?=
 =?iso-8859-1?Q?pI63Oo4RKNn1CF7eKrxenF74+yWK1NYyGnT0/9Fsi/i2bzUOzMyfgYU9ln?=
 =?iso-8859-1?Q?whtWh/6rtm/OnqNHE1iVkpxAreGsJgIi2ppQ0Jc1lBgbE4fLgSBf3d6OO9?=
 =?iso-8859-1?Q?rUy0k51QrPRj69Eh0MdeC2r3F1c8WDAfjfSBYLCrAmlLoLss+PO2FUGEsu?=
 =?iso-8859-1?Q?jZ2Wv0mZ6GFeVydaemROZmG8YHcEq1VAtG35htvkvNIIQ01fa9WrDJ5ONt?=
 =?iso-8859-1?Q?ALH88zKbKF+jMpBbS/sRUmcWb4W8BMyOJinuo5MlghOCkZGybhkLWyPOnh?=
 =?iso-8859-1?Q?uomB9K4PfRPUBMxtLqBa2BRKrveUAYettj6DUBUo0jOara17a4frrRlRh9?=
 =?iso-8859-1?Q?L9le8mFpOar/gZ4ACV4Aqoyu/pwjEjSm52ozbHlOfz1qShwsRRovcK2N1q?=
 =?iso-8859-1?Q?6mRQoyviCbFRZ62yaxG1W1PESTrb0GbuRo1ulueAxdU9C3Qxf3QIl06ZSV?=
 =?iso-8859-1?Q?05m+BopTGLoKZpA8wJeNYoKQsZKjlXx2Oba4bXIfq/ipDd27+qybf0/rq7?=
 =?iso-8859-1?Q?Fhj1drRn50irxMPV/G0whooLi3kqbuRjfsY7ZaUgyfniHHXLlugS2yPaWL?=
 =?iso-8859-1?Q?cDJWb3HIlqvi6GuG7/bxO4s2l10s9LM8C5DnaJcES1ySfSfR7WazoF1OwU?=
 =?iso-8859-1?Q?kqGwT9/IVXG1TDTGFzBpKE5Sj3mo4VFqfy2DbE2xuV+yWaHm+vg8lhgLbR?=
 =?iso-8859-1?Q?1YW4G9TSuzQl390vxid3IWxXsPAB5rVTP5ILiRuaRBAKJRTzFxA/wkVebF?=
 =?iso-8859-1?Q?XH/2vr8He2QXB4JOtkYs0n/784E0WKQFymdharUlhX3eyO0MfeH1ahEUhY?=
 =?iso-8859-1?Q?GbuX+h8dRo9jJv8YJiyJxQhCYacikryzhP2gWBWesCJ6G2YJkLCT68bg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB10116.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e0ec6d-d513-4956-93c1-08dddfe508af
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 12:28:14.1807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vTzwErKfFMIMNvZP/e8dZH+qgob16hS/8bExqPuYEAk0e1YNUBxmTanD+/Nbj6DB2i46wQgGhI/qIJOYLy8Wjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10594

From: Edward Pickup <Edward.Pickup@arm.com>

This patch adds a Xen boot arguments that, if enabled, causes a call to
existing code to scan pci devices enumerated by the firmware.

This will be needed ahead of dom0less support for pci passthrough on
arm.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
(cherry picked from commit bce463e1588a45e1bfdf59fc0d5f88b16604e439 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)

v1->v2:
* remove is_pci_scan_enabled wrapper
* make pci_scan_enabled ro_after_init
* drop debug prints
* drop Edward's SOB

changes since cherry-pick:
* s/always_inline/inline/
* replace additional kconfig option with config DEBUG

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 docs/misc/xen-command-line.pandoc  |  7 +++++++
 xen/arch/arm/include/asm/pci.h     |  3 +++
 xen/arch/arm/pci/pci-host-common.c |  1 +
 xen/arch/arm/pci/pci.c             | 24 ++++++++++++++++++++++--
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index a75b6c9301..762a1a4f5f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2059,6 +2059,13 @@ This option can be specified more than once (up to 8=
 times at present).
=20
 Flag to enable or disable support for PCI passthrough
=20
+### pci-scan (arm)
+> `=3D <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable Xen PCI scan at boot.
+
 ### pcid (x86)
 > `=3D <boolean> | xpti=3D<bool>`
=20
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 08ffcd4438..7289f7688b 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -23,6 +23,7 @@
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
=20
 extern bool pci_passthrough_enabled;
+extern bool pci_scan_enabled;
=20
 struct rangeset;
=20
@@ -155,6 +156,8 @@ bool arch_pci_device_physdevop(void);
=20
 #else   /*!CONFIG_HAS_PCI*/
=20
+#define pci_scan_enabled false
+
 struct pci_dev;
=20
 static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index 487c545f3a..d3481b05eb 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -284,6 +284,7 @@ pci_host_common_probe(struct dt_device_node *dev,
     }
=20
     pci_add_host_bridge(bridge);
+    pci_add_segment(bridge->segment);
=20
     return bridge;
=20
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index beb1f971fa..1b34e17517 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -91,8 +91,14 @@ bool arch_pci_device_physdevop(void)
 bool __read_mostly pci_passthrough_enabled;
 boolean_param("pci-passthrough", pci_passthrough_enabled);
=20
+/* By default pci scan is disabled. */
+bool __ro_after_init pci_scan_enabled;
+boolean_param("pci-scan", pci_scan_enabled);
+
 static int __init pci_init(void)
 {
+    int ret;
+
     /*
      * Enable PCI passthrough when has been enabled explicitly
      * (pci-passthrough=3Don).
@@ -104,9 +110,23 @@ static int __init pci_init(void)
         panic("Could not initialize PCI segment 0\n");
=20
     if ( acpi_disabled )
-        return dt_pci_init();
+        ret =3D dt_pci_init();
     else
-        return acpi_pci_init();
+        ret =3D acpi_pci_init();
+
+    if ( ret < 0 )
+        return ret;
+
+    if ( pci_scan_enabled )
+    {
+        ret =3D scan_pci_devices();
+
+        if ( ret < 0 )
+            return ret;
+
+    }
+
+    return 0;
 }
 __initcall(pci_init);
=20
--=20
2.34.1

