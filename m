Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A88B597ED
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 15:41:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124660.1466922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyVvv-0000V6-8m; Tue, 16 Sep 2025 13:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124660.1466922; Tue, 16 Sep 2025 13:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyVvv-0000T4-5y; Tue, 16 Sep 2025 13:41:23 +0000
Received: by outflank-mailman (input) for mailman id 1124660;
 Tue, 16 Sep 2025 13:41:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/dE=33=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uyVvt-0000Sy-CY
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 13:41:21 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3937680-9302-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 15:41:20 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB8056.eurprd03.prod.outlook.com (2603:10a6:20b:412::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 13:41:16 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 13:41:16 +0000
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
X-Inumbo-ID: d3937680-9302-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=st8JHsIbVdYGuyoOdrFhdQenTt0sp1LPGKB8Yag+uJovIaFHesY0eFz60FSKFcRSjcgZVzAMguAb8teyKnkJLMaNAfafH4KcIINlhLVHthaQc+JSUr0k3+z1qrnNMRJvaS1jqtHRo+5Y6rGzLR5RhAwbhB+WBw4soS6oOtZR9dcExpXjjA+fKrbn+5M3N3mZugVpmVZtX1DckiIOiA8tygo0F16UtpxsixjOPd4tgqO+SlqZOQMmBP7pcCIpD5IALmvNU0o5wT/SuZy7bOHr4RRra1csry6L+yyDBQ71drQqo5g9dj3+d373RGzOwigyxVxMRUaJzJOEtnbquY5WFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLpF1mnMF2e6pzGWDziI1N7zYaog8WbysndvDk8Wg50=;
 b=GEPdhNHuC8cDYeeRgWgO0Xyj4k0TIQn7rI3EzUU53Wn4GAUn4LmSNbL4V6aDw3+r+r+gB5e0w2hwpqV8Yj8nCDdMTtOQRyoGyHKjImOCmGM6Tvy2XXBWaLXiMdyEb930ZjbKYD9fgjL0EuEacvfliPUPzVNB0efmF4C3pPRQFtRPDvPlLGdnjHydaiPnLmhJMxhJ40FmtpSQTBCxgqfjkXgu7VFG+7xsN7AyeWqMy4sA5Av7K7BYuy2M2tgzd2uXO+kKbfAlxi5a0OCD9XrapQSDfexIWvADZWzIB3u3EZj6YnhifLW9NyM2Tb+o7Z5Dvoe7n8vtOTaKFrb2kCv4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLpF1mnMF2e6pzGWDziI1N7zYaog8WbysndvDk8Wg50=;
 b=BG9ph+wvDRntMgJPfy61EtN0ZEvEPQqi63FV+qpHUSPeYT8LHuHWxgL5ghRqZ+j/eKW0OJ8Phz934fWZfRtkSI6rFtRIw2kjwGUvB8H1cN/VvTV7yUOt+cbVOy7AD1kWqAHbfwYJsbUFCxTATqbEfYSwweDRUVlFYzAgmQ5QsuBPuxN0pj5af/70EP2AnhJYDvtY2IQ7B0vU3DNl8N0yRLHG60I67Hdx12ymTffQJLsOPOdvNN3o7VpTpcH2EY9YcznK1TtyUsB+jqQFxAlIloXe4zYPLyUBpCttIwFLJP2NqPrHAVlm4nLuRByIr0NPeZh7YKHKMYGyCYhoHBOhjg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [XEN][PATCH v3] x86: make Viridian support optional
Thread-Topic: [XEN][PATCH v3] x86: make Viridian support optional
Thread-Index: AQHcJw+TXHcbPb3jhkSvBimN3GcHkg==
Date: Tue, 16 Sep 2025 13:41:15 +0000
Message-ID: <20250916134114.2214104-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AM9PR03MB8056:EE_
x-ms-office365-filtering-correlation-id: bd601bbd-85ed-4540-84bd-08ddf526b5c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7fQCUZ9KLLcoDZh5SkGrEZOIzde2l0jykqnwpQyfVP/nwephyHNYrlfbUL?=
 =?iso-8859-1?Q?X4F63EL7ctRx+0sEEtNFm48NnK7O3nPNS0JM3lkcQ2SvxA+rlDsp2n1F86?=
 =?iso-8859-1?Q?MtmLr3zDbcgga7iNU+7/+I6RTCxBLKVVQSDuM5bqMzcjqsa50dHhayBd0/?=
 =?iso-8859-1?Q?WdjGwL3g5amDOhymKVD6AVBNAO04CHQFWt81Ug/iDZ898vPxFXK65L6JPh?=
 =?iso-8859-1?Q?tYe+5rfCJfK7iWGSWzU3mpMgXB0gEVNSFKtzGeC3As8wF8+CoYgs62D2C1?=
 =?iso-8859-1?Q?JiLwYHCZ3OBXH8dTxjvitg/ChpA5XnLg2JHhmOdNymZFmKGCzFs2B0tGuP?=
 =?iso-8859-1?Q?A7tzYLMJaoyycTYx+e3sANj/WMJXmq17RKXZoahOIXbc4Yi2TCFh1/eTHY?=
 =?iso-8859-1?Q?Nwqet76BmpFJsPF3nXVDX7Bc8DRAX+chYl/cB4XUeAmCeIO7/L4cgfzMXg?=
 =?iso-8859-1?Q?S93cb14MTt/k/RVrRhmnd64fvO3/7b4O1CBzoNmFYDrDy5Dxv+bYBLAwmI?=
 =?iso-8859-1?Q?23PBowa2KwskcTQOApTycqXmfBYJb/A/7FkafM811zPyCLOAAGb7ZxoYew?=
 =?iso-8859-1?Q?ovVe4RGitP/YbNLLTZ1TS9hsflbYo8LmHl9ul7xmwlaE/3AMVoBdvfGuZC?=
 =?iso-8859-1?Q?ZfV4EnvpPYI8jvguIW+whkMqlDXxAOBQLzdAwExG21Q4B0qWHeyiRjzKbJ?=
 =?iso-8859-1?Q?aucoQMDVL4CG6yVhRl7IV/XsHanB2GcaecBeJ4koRWNZaKx1nG9rb7K4sI?=
 =?iso-8859-1?Q?6ubsaJhr7ehAoXqrhr4eilL6BOfOyr2SRz7Rn0Ab3+hDwLltDMyQhG4BRZ?=
 =?iso-8859-1?Q?VBxo6h4jeKGAWxj/laxxSvjH6OAJTouZikpmYdqiRQZ54wQa1VmhH38XHN?=
 =?iso-8859-1?Q?J/L4CB/Qk1gVic+Im7juaKRXlh6mM2Q0dE/fS3ntr4GwR1u4Hjnu0f+woe?=
 =?iso-8859-1?Q?Kz8mAo9ChnwqaOUnVAK3u0HE7NoGrVwv5jwIYsFfb0qEqy+ZaKnxJhP76k?=
 =?iso-8859-1?Q?rkopcHP/Gq2cAGLoXetrPP0E2Of3DABV+sszInJ0FYfp9dEfjp3M0Dhbso?=
 =?iso-8859-1?Q?jglPgdi1tjh3OEzlyk2jWMPU4kW18BtqaENkCLVywvF75Tr+ZaFl8FrFNQ?=
 =?iso-8859-1?Q?TSls+PfM8zGYbT2+Zyiu22PpB3mibP3tcLzguwP8ysx75w1KMoLGbQVEmL?=
 =?iso-8859-1?Q?qbdIZNwZjCtzODDorv65xeq0mpGgHGBVhxbcyTpv3NC+C/K6xsPVJcvwjz?=
 =?iso-8859-1?Q?NWmkhT5m02Qqb7bpWJdSxRvNTiK+Aajleewpdf4v9tMzvq5mgj1+juv8Vs?=
 =?iso-8859-1?Q?IFj4GKtcbSy91HNQ0vmPZRD33F+KlcNx0fLvO6kJTsNgT7mD/D4ILSJpTl?=
 =?iso-8859-1?Q?DnnZbpjD26cNmndzLC/YuV5aujwAF2poMBHDdxd3a/uyWV4oRgU4shSLy4?=
 =?iso-8859-1?Q?26CFFgzekb6lC+wbmfwQCX3ifN+ADviDeQPWaZ9XS0FYy1JS8qqsTNDYTG?=
 =?iso-8859-1?Q?xFVM1Slto9DGvLGGm4xcJ0PKZW6mm7Zht/6BRCjcezFA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?P1qOY2TxD5w1HzxiscFLGnP50K0d3d5vrMpAEVPmcI04RI8M593DhxNzuI?=
 =?iso-8859-1?Q?YaKIDgtXBQgdlymzqJq8tiPaqYigDaDSaMa5I/abewhSjza7LsA2gbeN7r?=
 =?iso-8859-1?Q?8wMXs4MhxYC5Ezl8ggSmKKsODUPdA9wKT7D1KpU+bLY+KlJN2lGQq1BFH3?=
 =?iso-8859-1?Q?oChGGkUTJzkbix/REdlPCiZDNNKzbxKoJTHakQySLK08LtPSe1b/mG2mjr?=
 =?iso-8859-1?Q?6xkbTs7epIPwIkLz+AfpbB/F2HtfijxEwItiEt8bgxN39UHzI1Uk0iPI3b?=
 =?iso-8859-1?Q?1Tyme4Q0WZvG0eZ8i/bRzBQ7iucCP5WpNRiY7+5LIBDYeGAZMaMO3B3mL7?=
 =?iso-8859-1?Q?1shSezDURUhvwYaILREU+6yDDqoFmvUv3NTHGRTpeoNrQhwonC02DtZ6z+?=
 =?iso-8859-1?Q?wn8NtLeQ6nQh9Bf2W4ik/yduqB0KrFXQb3bJvTBBY/F2EQDcLvuC9v/DPq?=
 =?iso-8859-1?Q?I+ltVy1o72CWVzazNGEkFuU/hJhcZgogFTO8gFNiQyNfu9le0rH5phO43S?=
 =?iso-8859-1?Q?873Sd+sdoJ1KpmY/I55nCy8u0KopCH03i7GAv76hwU4w+HLJiv659X0zDT?=
 =?iso-8859-1?Q?K5YOLYRNDiPUxzhUiiUjiXcIzry1QCtCNpCoZbjKcQ97MOHVg5eLp1p9jq?=
 =?iso-8859-1?Q?W28EPMdrKbQtkifWl1LoBOkT991Mlm/Jx9dKn2l4Fv82KvBrjeza8ojjfO?=
 =?iso-8859-1?Q?1ham0GWSSIMnI1Z6cnz+bwU7+YZQLtNI48IXE4UsiSgwJPyvK8OohQ2zFb?=
 =?iso-8859-1?Q?O0UW3iCSD05GDU0PIMlOdzLH097gUM7JTFweW5ZjdQqZz606p1qnBm2tOB?=
 =?iso-8859-1?Q?JrSmTyWAtYZ+/kF2H9+JZxIJvJINCN9J3Ft32eCa/dH8exlbEdlVq+rFbj?=
 =?iso-8859-1?Q?AkwpIjDg+esF8BPEw4bAOssZrpSFYioAuf70wg/oZXg7CfgBsEriFz3Qwi?=
 =?iso-8859-1?Q?BAlPaYVbEVkqdiQYAgMFWSl4gbHDtAtV++vPqQT6DHhgfcMbee3l0LQJTs?=
 =?iso-8859-1?Q?2yOp4ywCp8qKyoMDSsKcqfSH6tVytT0QYOw6XPjFIrL6WknXDi/bW6803X?=
 =?iso-8859-1?Q?V2wWp01+/abQwYY/2KudPg25SVL2uzSDKlcyHq6Y9/3t1sV5Fi7nXe5yzg?=
 =?iso-8859-1?Q?n6EKQJzfkzlCqgwjQvAx2Zk3oXwbBczoo6SZ9tNO6dPltVm0fwYbVvoWjR?=
 =?iso-8859-1?Q?vuNWtYfhQJRW6zA1lWP7Ot6S0VbLkSOGQndWejjKVbGzL7n3E9zrY1og8r?=
 =?iso-8859-1?Q?H0o4uvOJd5w++3qH1+1BuUcd/nMeKOjqGZ4Li/NQFhOUC7SSaqmI3soozy?=
 =?iso-8859-1?Q?MFR7imy/wQmVL9fDloDqgpOK1CGAFnH4ZeAqmf42m+TS4EerQBx/g/qT8X?=
 =?iso-8859-1?Q?eSwHg2JM6iAgBwnScmWhDZL5JH2cQssUFuK7C/wmcVDbPj6lJCCnI4GtnA?=
 =?iso-8859-1?Q?4YEDVrR/pqL1suEtAAMhtDPJTLPikakV0O9LUdgufLI8BLX2lB5jyuEniN?=
 =?iso-8859-1?Q?J3kGouvjC+X08c8BSJdcuTs6kU5HW18pNtG/GVIaDuWXnomsXJDE+DmHLE?=
 =?iso-8859-1?Q?kSCESeB4brQwO1w1q87ykRpYiyS/Q8K7h2BeRdlaNiiyQtuKQdccDaCskF?=
 =?iso-8859-1?Q?l5s54bn/7GdQ4ShAGe3hWMl/az7qCM4xS88AWc4bSP9Q9jfoA1NKdXOw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd601bbd-85ed-4540-84bd-08ddf526b5c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 13:41:16.3028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a3/fGwVDpIg7RCZtwjvId/8niKG6xxa9iFMIUpLMAk51n+FnYBfNVICsWtrrE5qB2x3aMSk5zLexxXcwMNIgG1/boo0PZbsALMaAFd4NFXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8056

From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Add config option HVM_VIRIDIAN that covers viridian code within HVM.
Calls to viridian functions guarded by is_viridian_domain() and related mac=
ros.
Having this option may be beneficial by reducing code footprint for systems
that are not using Hyper-V.

[grygorii_strashko@epam.com: fixed NULL pointer deref in
viridian_save_domain_ctxt()]
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v3:
- fixed NULL pointer deref in viridian_save_domain_ctxt() reported for v2,
  which caused v2 revert by commit 1fffcf10cd71 ("Revert "x86: make Viridia=
n
  support optional"")

v2: https://patchwork.kernel.org/project/xen-devel/patch/20250321092633.398=
2645-1-Sergiy_Kibrik@epam.com/

 xen/arch/x86/hvm/Kconfig              | 10 ++++++++++
 xen/arch/x86/hvm/Makefile             |  2 +-
 xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++---------
 xen/arch/x86/hvm/viridian/viridian.c  |  8 ++++----
 xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
 xen/arch/x86/include/asm/hvm/domain.h |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
 xen/arch/x86/include/asm/hvm/vcpu.h   |  2 ++
 8 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 5cb9f2904255..cf2726ef6bc3 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -62,6 +62,16 @@ config ALTP2M
=20
 	  If unsure, stay with defaults.
=20
+config HVM_VIRIDIAN
+	bool "Hyper-V enlightenments for guests" if EXPERT
+	default y
+	help
+	  Support optimizations for Hyper-V guests such as faster hypercalls,
+	  efficient timer and interrupt handling, and enhanced paravirtualized
+	  I/O. This is to improve performance and compatibility of Windows VMs.
+
+	  If unsure, say Y.
+
 config MEM_PAGING
 	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
 	depends on VM_EVENT
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 6ec2c8f2db56..0aee4cd114b8 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_AMD_SVM) +=3D svm/
 obj-$(CONFIG_INTEL_VMX) +=3D vmx/
-obj-y +=3D viridian/
+obj-$(CONFIG_HVM_VIRIDIAN) +=3D viridian/
=20
 obj-y +=3D asid.o
 obj-y +=3D dm.o
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 330103ddf386..0d063ae95f6b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
     if ( hvm_tsc_scaling_supported )
         d->arch.hvm.tsc_scaling_ratio =3D hvm_default_tsc_scaling_ratio;
=20
-    rc =3D viridian_domain_init(d);
-    if ( rc )
-        goto fail2;
+    if ( is_viridian_domain(d) )
+    {
+        rc =3D viridian_domain_init(d);
+        if ( rc )
+            goto fail2;
+    }
=20
     rc =3D alternative_call(hvm_funcs.domain_initialise, d);
     if ( rc !=3D 0 )
@@ -739,7 +742,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
     if ( hvm_funcs.nhvm_domain_relinquish_resources )
         alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
=20
-    viridian_domain_deinit(d);
+    if ( is_viridian_domain(d) )
+        viridian_domain_deinit(d);
=20
     ioreq_server_destroy_all(d);
=20
@@ -1643,9 +1647,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
          && (rc =3D nestedhvm_vcpu_initialise(v)) < 0 ) /* teardown: neste=
dhvm_vcpu_destroy */
         goto fail5;
=20
-    rc =3D viridian_vcpu_init(v);
-    if ( rc )
-        goto fail6;
+    if ( is_viridian_domain(d) )
+    {
+        rc =3D viridian_vcpu_init(v);
+        if ( rc )
+            goto fail6;
+    }
=20
     rc =3D ioreq_server_add_vcpu_all(d, v);
     if ( rc !=3D 0 )
@@ -1675,13 +1682,15 @@ int hvm_vcpu_initialise(struct vcpu *v)
  fail2:
     hvm_vcpu_cacheattr_destroy(v);
  fail1:
-    viridian_vcpu_deinit(v);
+    if ( is_viridian_domain(d) )
+        viridian_vcpu_deinit(v);
     return rc;
 }
=20
 void hvm_vcpu_destroy(struct vcpu *v)
 {
-    viridian_vcpu_deinit(v);
+    if ( is_viridian_domain(v->domain) )
+        viridian_vcpu_deinit(v);
=20
     ioreq_server_remove_vcpu_all(v->domain, v);
=20
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridi=
an/viridian.c
index c0be24bd2210..7a2f718e6be7 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1116,14 +1116,14 @@ static int cf_check viridian_save_domain_ctxt(
 {
     const struct domain *d =3D v->domain;
     const struct viridian_domain *vd =3D d->arch.hvm.viridian;
-    struct hvm_viridian_domain_context ctxt =3D {
-        .hypercall_gpa =3D vd->hypercall_gpa.raw,
-        .guest_os_id =3D vd->guest_os_id.raw,
-    };
+    struct hvm_viridian_domain_context ctxt =3D {};
=20
     if ( !is_viridian_domain(d) )
         return 0;
=20
+    ctxt.hypercall_gpa =3D vd->hypercall_gpa.raw;
+    ctxt.guest_os_id =3D vd->guest_os_id.raw,
+
     viridian_time_save_domain_ctxt(d, &ctxt);
     viridian_synic_save_domain_ctxt(d, &ctxt);
=20
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 993e972cd71e..79697487ba90 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -426,7 +426,8 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * priority vector and then recurse to handle the lower priority
      * vector.
      */
-    bool missed_eoi =3D viridian_apic_assist_completed(v);
+    bool missed_eoi =3D has_viridian_apic_assist(v->domain) &&
+                      viridian_apic_assist_completed(v);
     int vector;
=20
  again:
@@ -442,7 +443,7 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * NOTE: It is harmless to call viridian_apic_assist_clear() on a
      *       recursion, even though it is not necessary.
      */
-    if ( !missed_eoi )
+    if ( has_viridian_apic_assist(v->domain) && !missed_eoi )
         viridian_apic_assist_clear(v);
=20
     vlapic_clear_vector(vector, &vlapic->regs->data[APIC_ISR]);
@@ -1360,7 +1361,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
      * If so, we need to emulate the EOI here before comparing ISR
      * with IRR.
      */
-    if ( viridian_apic_assist_completed(v) )
+    if ( has_viridian_apic_assist(v->domain) &&
+         viridian_apic_assist_completed(v) )
         vlapic_EOI_set(vlapic);
=20
     isr =3D vlapic_find_highest_isr(vlapic);
@@ -1373,7 +1375,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
     if ( isr >=3D 0 &&
          (irr & 0xf0) <=3D (isr & 0xf0) )
     {
-        viridian_apic_assist_clear(v);
+        if ( has_viridian_apic_assist(v->domain) )
+            viridian_apic_assist_clear(v);
         return -1;
     }
=20
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/a=
sm/hvm/domain.h
index 333501d5f2ac..07eec231f023 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -111,7 +111,9 @@ struct hvm_domain {
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
=20
+#ifdef CONFIG_HVM_VIRIDIAN
     struct viridian_domain *viridian;
+#endif
=20
     /*
      * TSC value that VCPUs use to calculate their tsc_offset value.
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index 24a7ed88567b..ad05101f19ca 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -500,7 +500,8 @@ hvm_get_cpl(struct vcpu *v)
     (has_hvm_params(d) ? (d)->arch.hvm.params[HVM_PARAM_VIRIDIAN] : 0)
=20
 #define is_viridian_domain(d) \
-    (is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
+    (IS_ENABLED(CONFIG_HVM_VIRIDIAN) && \
+     is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
=20
 #define is_viridian_vcpu(v) \
     is_viridian_domain((v)->domain)
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm=
/hvm/vcpu.h
index 924af890c5b2..b38702045818 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -176,7 +176,9 @@ struct hvm_vcpu {
     /* Pending hw/sw interrupt (.vector =3D -1 means nothing pending). */
     struct x86_event     inject_event;
=20
+#ifdef CONFIG_HVM_VIRIDIAN
     struct viridian_vcpu *viridian;
+#endif
 };
=20
 #endif /* __ASM_X86_HVM_VCPU_H__ */
--=20
2.34.1

