Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96005B039E8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 10:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042712.1412803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubEuj-0000Pz-TS; Mon, 14 Jul 2025 08:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042712.1412803; Mon, 14 Jul 2025 08:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubEuj-0000Oe-PJ; Mon, 14 Jul 2025 08:51:57 +0000
Received: by outflank-mailman (input) for mailman id 1042712;
 Mon, 14 Jul 2025 08:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ryw7=Z3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ubEui-00089a-05
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 08:51:56 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca1cba46-608f-11f0-a318-13f23c93f187;
 Mon, 14 Jul 2025 10:51:53 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8854.eurprd03.prod.outlook.com
 (2603:10a6:10:40e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 14 Jul
 2025 08:51:50 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8901.018; Mon, 14 Jul 2025
 08:51:50 +0000
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
X-Inumbo-ID: ca1cba46-608f-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZT0SqrgEmfiJ/LITZrFucs8Fb3RE/X0etnrctEB1qnHm3eJq10SCZo0qDaESCQcHJ8fADCt95d845uG5GW3doIQBx0ESOWTxgZ64WALGkpFonQZAhXtLHGINsuwJtQRIZVDQmLqgYGiP8i6yfxhH4efOF91cjmi/Bq7cjsGEz5pjh0RyePUL5CU0Mm4ARonOhSurZwfZSGlN/U3aTcyemKJnXaH7uAVTa/shCioU4MhervPMfy1bKaCBvx/lJQe2DfFJtmQrH9+5tKNzMIc27BujEu9uY4N2+mSgXiR3wcQNMi4kw62YJS0Krk+yo3SJJTwUuOkLqjd25sk53K9jxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9gzOGIJhqKarmjPK2T+noV2HTzR7upzjsFuFXEOuVo=;
 b=WwbbYtU4/F8tKVeAVTzlPKXepVsh3sBnekOzyzLoATe+5GuXqbPtxP/Yp3hP2K3Zxc2HC4Kztbi7MDgQJVH3EDmdS08QV8W8K5tpunRrtn/KOr6OQf3cuIcBTSGfxLsW2YJ1pYhNMECUSSTOaj3fFnFNDRmb/vGrN6IZYhKutCoHXyDJvE1aM7cRjuA/z6b/xEBW4tYkTYp3cs133d60BdAt9DTxaudm2TZk3W0Do3ymC/mSJhrO/mJ6mbpWurp3bZ7c9L9tC5v3/LonInjJQPbaLu8sceBCYot1JPEgC/o0NvVKwnWqX9JrWR1Vdlqd2xsCIXzWBlkHOdyrSFyrIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9gzOGIJhqKarmjPK2T+noV2HTzR7upzjsFuFXEOuVo=;
 b=eGqnZcpLDFB9YEzvXGUL6xmyXoOJS6tC+fjVTK7iXsSS0nk50BXwf8fx6mvnmHYf7jU9b9FXgeKCq8jwH+YGknhzURzeK1rtaQ5lnVrUar7JnHt1gFJ6YF6Cxggen9ixcYYMuFndgQp+nPJZpxnX+ad9Uo/2ackqXhX6GN+8ZKU5RKNcsVQzlRNWKC6m9n338S6XnYpG40Pp9aQY4OFFBEKpTBzKpS4jpw8f28N2ohtncmg8IHiTNdt6dw3VAIVCb+9Jf4MBQIhLIXuthxSTI04aGYS/vPnEqHsGGDM+Bj9KsKl8xOhcEigB2dhqKoFVOtqlkYWrwIzaBYuXMBNjng==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 3/3] iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID
 support
Thread-Topic: [PATCH v2 3/3] iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID
 support
Thread-Index: AQHb9JyJh0VYqWOxgE6oNIqsvkqrcA==
Date: Mon, 14 Jul 2025 08:51:49 +0000
Message-ID:
 <8d0e16b6cb439000571ab6771a6c0e61627825ce.1752482857.git.mykyta_poturai@epam.com>
References: <cover.1752482857.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1752482857.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB8854:EE_
x-ms-office365-filtering-correlation-id: fa5d66c8-75cb-423e-c22f-08ddc2b3ac2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?CqzF7/lpdRoAPX0WBz4XwgKTwHpGDiftyE81Jym9l2oPZP4GUIP7pKP2ut?=
 =?iso-8859-1?Q?duvEQZcuInZULqPG94/Wlslt5Xm1zph8RjxT4LxkIxm5/lVTI0pz4XJ3Ub?=
 =?iso-8859-1?Q?xC5CU75QGyjC87wqeJJKRTFabfT2Oucepvnp/u3b0xgXfxtqpcWsUoKs9s?=
 =?iso-8859-1?Q?og3RH6ZVJlIqYH8Df4AIgUBnslTnm3dWfaA2J0ogQqL6eSWTYlhUjA1TkZ?=
 =?iso-8859-1?Q?j8g4fUjmGP5PZp++H/sbMyafuVx+d12hp3ZzTwIIpyp/+64PAHNLq/il33?=
 =?iso-8859-1?Q?A/CCeMxaM3ahbdGTtve055nyWwYQ1ysoJGQSoDzkDCMWkTgWF2GRUyFB8s?=
 =?iso-8859-1?Q?5BbQYNpZ55m96lQ/GRn1kkmQV6jnvupibSDMH9ZpicOsKs4M9zWAsLGa1x?=
 =?iso-8859-1?Q?lIp2smiuLm43MuQRdLp4cpuo5xlbmQG+DdxVToUuq+Q3n6x1i8cTOoD6eH?=
 =?iso-8859-1?Q?8rqEPc1zDrkW0KdW0V+JkAMeu9G92N5fyCrLGyDXV7QB/IZiM3ic4dc/xu?=
 =?iso-8859-1?Q?2kPty4dUN6hakOiqa0Xf7ib8qmn6rSDXZWIvNzMzTasfjLoUKvnbQWx6q9?=
 =?iso-8859-1?Q?I/eKEXR9w8btjMKZgPcUgRYd28MR0ZQFv0mmEoXiLedbLJ6i9duYK5LF6O?=
 =?iso-8859-1?Q?QLDaCNjaB1UpkuPkGvum8XunwRRGUySvyod8p9iVJWamIxp9aUfY0dP/gz?=
 =?iso-8859-1?Q?fWu70DO/uQb2ATLbN72GPbguXef/+rZQZXQVV5FvShqOmdHilM8BYBrl1g?=
 =?iso-8859-1?Q?zjHcFZVaqEkSj793dYMuFAnklaMc0ETByXCqzr8WMQOwg6jNJC8Plee+4k?=
 =?iso-8859-1?Q?+a4CRwgG4Fc8X8gf5+HL7dYot04u14mdkYJUR9Ea22CnsW9/U5O7zXz5b6?=
 =?iso-8859-1?Q?d7a3b7qKyKKa5m/p+wtjFNsh97UYGlr7bkebVMUJQWSnt0hNnPAKJGoEeI?=
 =?iso-8859-1?Q?GYwKAKzkoqEZDeotBkVUc8eziuy7qyIAqJrvz7ca0+q2DuD6nU9TcOHL6W?=
 =?iso-8859-1?Q?qz3hEb26vDB3WmKYYEGGaUD9zws8RsNPODzoy46MI39CB9Evbotleu/Dxt?=
 =?iso-8859-1?Q?cd+jxnjeSZshjbfupEAZBehQHsphKHqhCD9+5Hr59BlinHV8NNLRRaJ02x?=
 =?iso-8859-1?Q?sYWedJP/QblmQYbe0KOrSohXFNP4H2C8zk615G4AThGdlrCl0xhuRjE43B?=
 =?iso-8859-1?Q?674mXflPk26i/oXc9psEPirkoCoq8+LgEgVrVTetUOpQWNQjU5XctEzcRZ?=
 =?iso-8859-1?Q?D6yzdIZx0rvduNw8/0ryjqM873py/M4n0XCJ2D/qGHsuie52mI5xfuQB/p?=
 =?iso-8859-1?Q?pNpFzT/DWO+z+NsC4QpqMgGYOyUvxzoC8pAsjzdz3R3Gmwvz5fT0Ox3Qen?=
 =?iso-8859-1?Q?LTON2H802QxCMNpiltxhPKMaOGV8dNqdlvk4jsuiVPNGQ2iaXiddH6KarK?=
 =?iso-8859-1?Q?UkIdHwiekHkY9MQgAfzPb5nLnC+QLoSeHOrT+kjc+0vtoA0KQe9gzLt5mX?=
 =?iso-8859-1?Q?EpKTs0unLflZmVfvYy+6LIKvIP7RH2YktYJ9i8lUYHQA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HiSVPcZ1pOqpUaaaFlj/SgfzRROTtXhEc16KLL4CuZc7+cWQ+h2OFD8XIx?=
 =?iso-8859-1?Q?EDyOr0cNCqd9wKLxDMyb+f/+p0fz2tOkD3zosKzEVDOUJjBzeicB/BnxY+?=
 =?iso-8859-1?Q?tekriF4u3wXiZqZCe+pojyinRtXCaYPnhc0x/hgPAysjiOTQKI4gGy5a5g?=
 =?iso-8859-1?Q?hPn22l+JBapOS9E2RBopv/l2nS41LBWXK1F48jiFqtD51SNLH+xzdmrje9?=
 =?iso-8859-1?Q?FvW+JBn/0ShTHg9hfCJHp8PcJ3+fvfJbNo6eT4EnpGDzwhWm1Lhc5KIikP?=
 =?iso-8859-1?Q?/T5PfO4ILIopis0Lki1LIPi6YTVjgoFp6qqUf1MwzM29Dl5r53KBrwA5u5?=
 =?iso-8859-1?Q?PBKwOEIRx9sNNhIf8dfSYZTGxVSKadsHPG1oNFA8DCYjubfrRry1wELvMm?=
 =?iso-8859-1?Q?2rm7FImBU93kNEhSFSSSfIFF6cQvbDG2y/u5WxhgcR+LR3BfnlqzSWju6+?=
 =?iso-8859-1?Q?hn7rh0OXnbwkYHwl5ZCZUw2o0fKJM5CisNW9ihrCv6dDWdVL3VECtV2YFb?=
 =?iso-8859-1?Q?sBP7HWhZG9pU3nqtVfl5Bd5qGd8yzOGwPEKBtgrnL22kKKs3UOfsjalW+o?=
 =?iso-8859-1?Q?pQ4ezu4WWJEdr+1/85oi79ddQKjDRoseB3h29Db4IjNx9J0HWxqbrCXQpy?=
 =?iso-8859-1?Q?efSSZWOSRYKlqrBXrXRcVyjNHasQ1KFau6brlrOI9MGvzKRKvC/fRxx+BM?=
 =?iso-8859-1?Q?E5UUpHCtArRBKXgoOZioHcQhH7bNkXbI5CabS4NFJo3Mms/kqSNmcGH8QF?=
 =?iso-8859-1?Q?QMYiX4NuZNKp4Xr7YiZCz9+roFcAJhUZ1l6bP75Fenq1JXCnck39ezNupe?=
 =?iso-8859-1?Q?Sl5EUSf3uFc5zVTEn0j48gYQugKdg8VBAJitj/i/q7Ph1cVvcOnMdoUaaa?=
 =?iso-8859-1?Q?SmDBaw6Ogpc53bNjCd/jUq5wSiZj+if2oGNXyGYSaXHlTb5+XvdrjSuOBk?=
 =?iso-8859-1?Q?/o9+3Of3ixs9ZwzX9SX0YmuqiH7uQJAsuIku8EEWXie1FY13Dl89chAQMX?=
 =?iso-8859-1?Q?w8akBAwzC39qyMtQpRAQtgrYKIdX2g7M2YrDkq/bU0zusu6go9EcfKrK7b?=
 =?iso-8859-1?Q?2v23dSpjsiEg/2/gLfg8YIoYUraW1OytreclvS7p31agBllDCJUmHO44ez?=
 =?iso-8859-1?Q?WN7c8pWkXn34YhjAIPFk8FnG1pH1GJgCYBIBfOHhb1QP3DXnBieX4Pk372?=
 =?iso-8859-1?Q?5VxNgAkEWbW5mt24yJXUvJFSqfhFm+lgWzcsY3p/bro8zIJ1fxpu8L37da?=
 =?iso-8859-1?Q?UVnDJ+Vey5YCKpDtu1KkoZ1oQDLXEV3yixTPJJkXlRMJlqsAre9LGJdowZ?=
 =?iso-8859-1?Q?s2DyeB5v+AKk/frJVOVevq0vqEcYQZdgG4tGIQemzs0uwM59Qlav3w/R56?=
 =?iso-8859-1?Q?G7H6J3NQn+axubFZWxr00Tz1d3cwm1DD7/g+W5v/XUp8D/EGGHwlFc5edh?=
 =?iso-8859-1?Q?4KbOaQtZjmxIT2g3jy6OeNhnPhiwbH+6evsxSVRz6Cr6I/jL3rHOkQxBPv?=
 =?iso-8859-1?Q?nOw9RzesVcw4rqH8SYrZQfn8NRZYcABFHs5axMG9ox1CQ3Fjqp8DsYRJ7Q?=
 =?iso-8859-1?Q?Z3elaVRN5V7a2THJhhC144uHsakWB4PrLsKKywTe7WlfZJmYJgEwxleTaQ?=
 =?iso-8859-1?Q?pd5/x1CL7AliMreZM20jTxK9URKtS/bGbj24yFHPV83gFtIWnR5u9ijA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5d66c8-75cb-423e-c22f-08ddc2b3ac2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 08:51:49.5795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wTTK4BNYlNBkaNHUMWRqs27/6Cx1LG4bWPy/fuHYJ+Fzk5eSE6bgS5SwuW4GjHwcFxagHd1I75O6w8ZzedX55w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8854

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Program PCIE BDF-OSID assignment according to the S4_PCIe_IPMMU-OSID
when adding PCI device to the IOMMU in ipmmu_add_device callback.
This is needed for being able to assign PCI devices to different
domains at the same time. Programmed OSID is emmited as sideband data on
the AXI bus during PCI DMA transactions and then used by IPMMU to match
the transaction to the corresponding uTLB.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* rework VF handling to be in line with SMMU drivers
* add locking to domain_list manipulations
* remove assignment print
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 136 +++++++++++++++++++++--
 1 file changed, 128 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthr=
ough/arm/ipmmu-vmsa.c
index dac0dd6d46..ea9fa9ddf3 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -51,12 +51,25 @@
 #include <asm/device.h>
 #include <asm/io.h>
 #include <asm/iommu_fwspec.h>
+#include "../arch/arm/pci/pci-host-rcar4.h"
=20
 #define dev_name(dev) dt_node_full_name(dev_to_dt(dev))
=20
 /* Device logger functions */
+#ifndef CONFIG_HAS_PCI
 #define dev_print(dev, lvl, fmt, ...)    \
     printk(lvl "ipmmu: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
+#else
+#define dev_print(dev, lvl, fmt, ...) ({                                \
+    if ( !dev_is_pci((dev)) )                                           \
+        printk(lvl "ipmmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
+    else                                                                \
+    {                                                                   \
+        struct pci_dev *pdev =3D dev_to_pci((dev));                       =
\
+        printk(lvl "ipmmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
+    }                                                                   \
+})
+#endif
=20
 #define dev_info(dev, fmt, ...)    \
     dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
@@ -1125,6 +1138,8 @@ static void ipmmu_free_root_domain(struct ipmmu_vmsa_=
domain *domain)
     xfree(domain);
 }
=20
+static int ipmmu_deassign_device(struct domain *d, struct device *dev);
+
 static int ipmmu_assign_device(struct domain *d, u8 devfn, struct device *=
dev,
                                uint32_t flag)
 {
@@ -1138,8 +1153,38 @@ static int ipmmu_assign_device(struct domain *d, u8 =
devfn, struct device *dev,
     if ( !to_ipmmu(dev) )
         return -ENODEV;
=20
-    spin_lock(&xen_domain->lock);
+#ifdef CONFIG_HAS_PCI
+    if ( dev_is_pci(dev) )
+    {
+        struct pci_dev *pdev =3D dev_to_pci(dev);
+        struct domain *old_d =3D pdev->domain;
+
+        /* Ignore calls for phantom functions */
+        if ( devfn !=3D pdev->devfn )
+            return 0;
+
+        write_lock(&d->pci_lock);
+        list_move(&pdev->domain_list, &d->pdev_list);
+        write_unlock(&d->pci_lock);
+        pdev->domain =3D d;
+
+        /* dom_io is used as a sentinel for quarantined devices */
+        if ( d =3D=3D dom_io )
+        {
+            int ret;
+
+            /*
+             * Try to de-assign: do not return error if it was already
+             * de-assigned.
+             */
+            ret =3D ipmmu_deassign_device(old_d, dev);
+
+            return ret =3D=3D -ESRCH ? 0 : ret;
+        }
+    }
+#endif
=20
+    spin_lock(&xen_domain->lock);
     /*
      * The IPMMU context for the Xen domain is not allocated beforehand
      * (at the Xen domain creation time), but on demand only, when the fir=
st
@@ -1244,7 +1289,7 @@ static int ipmmu_reassign_device(struct domain *s, st=
ruct domain *t,
     int ret =3D 0;
=20
     /* Don't allow remapping on other domain than hwdom */
-    if ( t && !is_hardware_domain(t) )
+    if ( t && !is_hardware_domain(t) && (t !=3D dom_io) )
         return -EPERM;
=20
     if ( t =3D=3D s )
@@ -1292,20 +1337,95 @@ static int ipmmu_dt_xlate(struct device *dev,
=20
 static int ipmmu_add_device(u8 devfn, struct device *dev)
 {
-    struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
+    struct iommu_fwspec *fwspec;
+
+#ifdef CONFIG_HAS_PCI
+    if ( dev_is_pci(dev) )
+    {
+        struct pci_dev *pdev =3D dev_to_pci(dev);
+        int ret;
+
+        if ( devfn !=3D pdev->devfn )
+            return 0;
+
+        ret =3D iommu_add_pci_sideband_ids(pdev);
+        if ( ret < 0 )
+            iommu_fwspec_free(dev);
+    }
+#endif
+
+    fwspec =3D dev_iommu_fwspec_get(dev);
=20
     /* Only let through devices that have been verified in xlate(). */
     if ( !to_ipmmu(dev) )
         return -ENODEV;
=20
-    if ( dt_device_is_protected(dev_to_dt(dev)) )
+    if ( !dev_is_pci(dev) )
     {
-        dev_err(dev, "Already added to IPMMU\n");
-        return -EEXIST;
+        if ( dt_device_is_protected(dev_to_dt(dev)) )
+        {
+            dev_err(dev, "Already added to IPMMU\n");
+            return -EEXIST;
+        }
+
+        /* Let Xen know that the master device is protected by an IOMMU. *=
/
+        dt_device_set_protected(dev_to_dt(dev));
     }
+#ifdef CONFIG_HAS_PCI
+    if ( dev_is_pci(dev) )
+    {
+        struct pci_dev *pdev =3D dev_to_pci(dev);
+        unsigned int reg_id, osid;
+        struct pci_host_bridge *bridge;
+        struct iommu_fwspec *fwspec_bridge;
+        unsigned int utlb_osid0 =3D 0;
+        int ret;
+
+        bridge =3D pci_find_host_bridge(pdev->seg, pdev->bus);
+        if ( !bridge )
+        {
+            dev_err(dev, "Failed to find host bridge\n");
+            return -ENODEV;
+        }
+
+        fwspec_bridge =3D dev_iommu_fwspec_get(dt_to_dev(bridge->dt_node))=
;
+        if ( fwspec_bridge->num_ids < 1 )
+        {
+            dev_err(dev, "Failed to find host bridge uTLB\n");
+            return -ENXIO;
+        }
+
+        if ( fwspec->num_ids < 1 )
+        {
+            dev_err(dev, "Failed to find uTLB");
+            return -ENXIO;
+        }
+
+        rcar4_pcie_osid_regs_init(bridge);
+
+        ret =3D rcar4_pcie_osid_reg_alloc(bridge);
+        if ( ret < 0 )
+        {
+            dev_err(dev, "No unused OSID regs\n");
+            return ret;
+        }
+        reg_id =3D ret;
+
+        osid =3D fwspec->ids[0] - utlb_osid0;
+        rcar4_pcie_osid_bdf_set(bridge, reg_id, osid, pdev->sbdf.bdf);
+        rcar4_pcie_bdf_msk_set(bridge, reg_id, 0);
+
+        dev_info(dev, "Allocated OSID reg %u (OSID %u)\n", reg_id, osid);
=20
-    /* Let Xen know that the master device is protected by an IOMMU. */
-    dt_device_set_protected(dev_to_dt(dev));
+        ret =3D ipmmu_assign_device(pdev->domain, devfn, dev, 0);
+        if ( ret )
+        {
+            rcar4_pcie_osid_bdf_clear(bridge, reg_id);
+            rcar4_pcie_osid_reg_free(bridge, reg_id);
+            return ret;
+        }
+    }
+#endif
=20
     dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
              dev_name(fwspec->iommu_dev), fwspec->num_ids);
--=20
2.34.1

