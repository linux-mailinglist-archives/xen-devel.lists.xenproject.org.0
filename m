Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1043AFAF86
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 11:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035407.1407672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYi1w-0001L3-9b; Mon, 07 Jul 2025 09:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035407.1407672; Mon, 07 Jul 2025 09:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYi1w-0001J0-6A; Mon, 07 Jul 2025 09:20:56 +0000
Received: by outflank-mailman (input) for mailman id 1035407;
 Mon, 07 Jul 2025 09:20:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wd65=ZU=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uYi1u-000140-PU
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 09:20:54 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae30105c-5b13-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 11:20:53 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM0PR03MB6305.eurprd03.prod.outlook.com
 (2603:10a6:20b:157::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 09:20:39 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8901.018; Mon, 7 Jul 2025
 09:20:39 +0000
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
X-Inumbo-ID: ae30105c-5b13-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1jFCggsfmh1T5sGOSwYF+jVJk60lTp8kiqOfI4gDOWXAShiutx/7K7qDpNjfIw6NsLCCh3pebxGI7+QoeURN/he05iKwiAL/SU5yxk19w02wCi3onCP37Shhv1GLK1aGZzPqWpSVR1b4BYzO6pnCmLfJyE0Ec3bMNkO9Cyfd02oYItpeXR4XltdwS5l0j/mauWjFVy5Fw79ojnwczjR8GEqeX+FPN/O1fe6RibWdYwo7i/V4ZXIqp455M3greiCw2sX+kKxTP5N5TvMZYcwKdCHiiMRwGKMoUeFbNECbwvyrp56tbfk+xqtyUJj5Due97EYD+GZwDUm40FTQiaUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lasJV+pPqZD93tFQZyWOWxi4PC6HOLFl08y4mG9goc=;
 b=U+V5WSWcA4k9iTehO+VNmAh1FNveJhqxuzxASZyKWJmlHBhdQ9O1X1XMDL/KtrEbfj7hoFFuAsGiVxVBhcZswvkWsOi8YBLC0eTSMjw2DjmWZF+lOET7yroFXkvf4RJi1lbWQ26TGG+KLUIGXLz6wrEzAaDd4WB/5bSFJRw0DQIP7ckHgw/4javg3tgf+Epg5gAKqAYqsZkIrXdaRm4os1Fz87Q5ICG2vVWNd+fixs02dmsuOvrPdqw2taRuoIwm1zepUt68PiUxvA8a6mAENwCvTtY4LEmC0Lk/7hxqRsoTOx0Vln1VlsjExYkrkuJj+dN0qxzUBZ4ErSSXPAwW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lasJV+pPqZD93tFQZyWOWxi4PC6HOLFl08y4mG9goc=;
 b=kELNvRUe5BgGCqPlrGkLRpnV4pXp97GYw5JTtFy6VrgRQLeONKxlcQzcAAqVvbVNbSfjQKtIKvaAKEtDuRohOXURDRlxFcoNymXky9ckhrq3JnrgPrVW+UJpX+4otUR7I2+HYWrBcsq2sW2OBp9vimZmv5SMVhnAflXa5gNi0y6l2bUnixDB7eejlyKs2ciUaaHspQKSdbyVPJg33QlqKxN5aBqqY2ccDYhmL3V/xrnnCaIvBP/RgGbaME09B54UXwKrqzwkY2OBpMH9Kxfa9o2TR+WVpbqp8750oaF12rfunkqY/CDOqlEprnKcZeBP88HEJYPSj4s9hEGSAaPWcA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 1/3] arm/pci: allow designware-based hosts to have private
 data
Thread-Topic: [PATCH v1 1/3] arm/pci: allow designware-based hosts to have
 private data
Thread-Index: AQHb7yBn813y1BMg2kOezoiTnMICsQ==
Date: Mon, 7 Jul 2025 09:20:39 +0000
Message-ID:
 <471d93d91543c5bfcd5a56cc555b94b3ab5fb623.1751874601.git.mykyta_poturai@epam.com>
References: <cover.1751874601.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1751874601.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM0PR03MB6305:EE_
x-ms-office365-filtering-correlation-id: a4b90424-4b61-46be-507b-08ddbd378a48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7DHBQh7rbxsQmv73hP/653qSM1qgx0l5fju28tdczOjQkAFzUNvPJgHU0w?=
 =?iso-8859-1?Q?hvqP1O4kNm+Ze5MVjrlEqblngbUbZV7d/HkuE6XU6VoKq8N+ks1AzSQKjR?=
 =?iso-8859-1?Q?gni4mw/uCk3AIJHCHIlqVlYzBd+zF53yzFq5lLetJuOAyt8/SIA8i7Be5H?=
 =?iso-8859-1?Q?o9YN3Qs9QdzC1WfOACroazzS/i/Gsvr7YHF3FCpMFGs2FBX0VYepPsK2ZE?=
 =?iso-8859-1?Q?Kyq97F8LC47dOW1S/GCaIdFd6ERbEVvdZV4rButJnfcu2gzpYAzzKamzG3?=
 =?iso-8859-1?Q?jBXGHiVW9Z4UuoI7Yts/GD3mZLxhPNEfpzK75vNeAHsoBT/yYgyTKOEktg?=
 =?iso-8859-1?Q?2abYWKoWQCWtZllrKKimNvSEV65a5sq2SFRVf5J7+wVb/DHk6h3plRSxXA?=
 =?iso-8859-1?Q?7+B8UXWNuhdjc/GzqSiUFxCGFpDcKQS9YHH/Q+UR+a69i+Ox0tOJK9D39v?=
 =?iso-8859-1?Q?PV2tOhmCwrV1ervbktJ9c22m9+yLtQUkdYQu7mOwnNva9/4ijKvtWC9W2i?=
 =?iso-8859-1?Q?H0b0Rqom1CyYvozEdQuSHvX3/M6jxFWdLc1L0cYvg72mYlf7lYBvQus91o?=
 =?iso-8859-1?Q?p8q5zJS8Pf+I/Kg2PFwYB1ZrUY1WlxOV3hm8fRD8entqTtvgJXkUlgOCHk?=
 =?iso-8859-1?Q?yERaC0zwwT1XPFpNijdPpDrMXCi5+HC3Y/eVsr5BKziuhU+TJqs5OUgAvq?=
 =?iso-8859-1?Q?ZbHzrVV1onOCmpB3Ec5SIGmcQ9QVLNHWsZuRpaTnlahS1M4pxhO/DRfnvI?=
 =?iso-8859-1?Q?XzD8VDfcGqegbWyAXhZKXY5SDSJzM8WcUym0dIBOWUlY2/gQwd7Tj4ccna?=
 =?iso-8859-1?Q?zJFAKD2L8reTAQO3pNpAF+0yd57K3rsVNOpevawogU/pbyIeKnkiTcqVKH?=
 =?iso-8859-1?Q?VReuL50TqGHApc2+zVqTRG2S1vYpVUGa4UbTuwx5FLzMfN5v6Bs0ovfbFE?=
 =?iso-8859-1?Q?qoW98EDuV08AtpwWiP2n831KK9a37OkolLHGBFJyh+hkKDDwvBXcbnrW9B?=
 =?iso-8859-1?Q?oXyB8ZCZhWO1860n8nxZSjlfTqjGkqFXKzSixMyGbQDy03mVNwYGsXUjjs?=
 =?iso-8859-1?Q?QbYwbmEabCSXib2T2PrkX+yq8t5fuQhmdaqaqP2dCBEyNUIL5pb1M3toO9?=
 =?iso-8859-1?Q?5LE3wc87rfksQrd7F+//UM1CTF6XbOIYOGU+5y0CZd8Z+ol/1LPPT2S3xQ?=
 =?iso-8859-1?Q?1K+uT7yWRYsZC4y9VNkmhTkkBpQxbaBpCYx0NWUjIkea2VeNqJ9FsT/WC2?=
 =?iso-8859-1?Q?Q6qetlu5XeGeQ1tGO9cEzSVaYx1loZecvixCPhxAFXB6f6mvT8OVyvLtBr?=
 =?iso-8859-1?Q?cS0FLwSXmwECaUUTfBH+vcopB48g9Ew4vyOYukTHp6gqFkEJ8Bm2tMgf56?=
 =?iso-8859-1?Q?S7sHIdWbNXp1FL6M/EAIfB4Kv9zMeWDO/ETUKKxQyw5o9bsakBLJqrmL+A?=
 =?iso-8859-1?Q?ZNah06/hTzADLbu+7ii+eiAQKkUTkM5XpZGgUiovMBee5htBw8eRwPs2MP?=
 =?iso-8859-1?Q?KRKndZDwD/7QNtDK4ubeq1kOBUw4IhS8YVex0wf4MOww=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?R+8iZ1mm3Pp6hNc3XUMomCs/XCeVFPHmQT90zggOoYb+cHYvLlN/Fa08Yf?=
 =?iso-8859-1?Q?zAX5AQdUP+F9qIaKsYcH9sqZtOxmeSLFilJ8RyK+OvZxpIE1pKPV35sNe7?=
 =?iso-8859-1?Q?aiCiKWvdLRvfZlmwps1UHHmzy3aMBryq0d+loc1ZrlLCf+cMtBDUryVXCg?=
 =?iso-8859-1?Q?2kVa5xA0VRwp/qDmvRySWaezSrnBqTn4aGZ7MDj/MK3YttEo0Jri8hvtww?=
 =?iso-8859-1?Q?+Y5nwwNkjq8lMg2lnARVxvNs4mRVp6ZtWcMA14Haj/T25G9nbmaEAgIU4c?=
 =?iso-8859-1?Q?RnNMo211mZFfo1aavMLmPvW0LydFZOr/x02gOuxZZ7Ce4xODyMK+DgADi7?=
 =?iso-8859-1?Q?FJT7cheiolzFaA+uKvQvzt+e/a2d6BlcxDR5CXz50mStRp+p/L8PoF3z89?=
 =?iso-8859-1?Q?qsaK73CtT+eDosR+FdJJtFIyvBsDsH6Ygoi7XtgR9BK/r3IF8QiRwYMx3H?=
 =?iso-8859-1?Q?Xn6Gp1QBBgeoR6U6MsWlqVLk1dH8suMAlkRRwOeykisGheJUIOcy0eRf/7?=
 =?iso-8859-1?Q?/QZC+fo8QpTmzWbBSpvr53Lka/GLp+KNM+h4cx61JTisLAyBdDurqDspVv?=
 =?iso-8859-1?Q?f66BhSBzO2c461Gzvt9tT0dSDaD6nc5zOkrkv2hP9CmYYbvjLKMpe4+zdE?=
 =?iso-8859-1?Q?J8+PLPlWe6lCGNUbQaPlcWO2WBy5kQDWybZ+I+zL/kPqbx4LTd0NIuRTZD?=
 =?iso-8859-1?Q?nCAwAtg5Op+zZqFdr4Ocg5SWMv9TmfH64JgGK1ongJkD6kbhl7jWZYOZ9V?=
 =?iso-8859-1?Q?OYFz7hBbpc8wUlMx1fFYWsyYep8WHZyX3zK/dTyGXQ+a/UomWuvoh4c9a3?=
 =?iso-8859-1?Q?4+Kv1uD6a47Ks/BVWl+wqioyQzXgWzoJnd+fnE3arKiHCvJuhQuFVUNHMo?=
 =?iso-8859-1?Q?p3Wuvbo2heU8Ptfou4hDNTSe49FXc7A20jct1oNW7l5UnwuBz7aBO3LGuE?=
 =?iso-8859-1?Q?t/iW6zZyDuEWqa7r/OF9pNwXY+JzGJBxWX3J+60p28EyyLOGUJKRmIJNyL?=
 =?iso-8859-1?Q?0KBFuzG85BdydFEBLEk+tZhBGPAb64YRYGVgjUIqqLaVNcJr/lBJ1QkxsF?=
 =?iso-8859-1?Q?1a/9kyyy6Of326d2szSMU+0QqbT0urvSGIFK7rFY9r1dqo2MlPVdJel1G4?=
 =?iso-8859-1?Q?DOn44mQaEHHYNIR5bor5+J01R78Gju4rb97s1lEZ/ObRwhlUo/LTbNFc6E?=
 =?iso-8859-1?Q?gt93WC4U1v9m62P6BWMRhel61Bmg5nn1KK7we8tNa3sW3K1eO5+AE2aOGC?=
 =?iso-8859-1?Q?4dNSFNvx8JUeE9sZdNhKBgtXSJKKqcIGdw3pW48yjJ9P15X25Rb7Z+LQ1q?=
 =?iso-8859-1?Q?voI6WWQOMAcBrRBY3d8Q5rF8RELf+nh9u1ik54+HT6d+7kydkemOhGCiJ0?=
 =?iso-8859-1?Q?5Hp/231QAxhxtzv+9RpwbJM/yLfkrA/DKfn1t/l4y6b2WyMB75mrJF6JB5?=
 =?iso-8859-1?Q?KI3HKhOJtXBOvtQuJUSZ0bgLhJpvcwZT2q/I+VGows9dOyix8CyKeuywvT?=
 =?iso-8859-1?Q?O8HVCJeIx6OQMDk56TenS1KgHSuiYqoGF33IcbQogkg/nxPSt/iGsOPT89?=
 =?iso-8859-1?Q?TRXEpH7qs4TeRovMaZWNQ/P3BD1LIvEpDhTju6PXWPbyEURUZy6btiYtHF?=
 =?iso-8859-1?Q?YNV8fP75ueyf2OqbttzBFYss0OLEji/Uwh1zfrZZJCA/hsjaWwjqmo2Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b90424-4b61-46be-507b-08ddbd378a48
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 09:20:39.6691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9JQLYjTsxGVJWrmC793GZEj8Q+Au0PipyhLQLqzYlWALXGGI79v7P4UEVVDvBx5pz3sKIOx6r66V5Rxz8RdvjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6305

Introduce an additional private data field in `dw_pcie_priv` to allow
vendors to store custom data without interfering with bridge->priv.
Also add get/set pair to make accesing that private data less
cumbersome.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/pci/pci-designware.c | 12 ++++++++++++
 xen/arch/arm/pci/pci-designware.h |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-desig=
nware.c
index 47dd2dd4c0..0bd67524ac 100644
--- a/xen/arch/arm/pci/pci-designware.c
+++ b/xen/arch/arm/pci/pci-designware.c
@@ -403,3 +403,15 @@ dw_pcie_host_probe(struct dt_device_node *dev, const v=
oid *data,
=20
     return bridge;
 }
+
+void *dw_pcie_get_priv(struct pci_host_bridge *bridge)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+    return priv->priv;
+}
+
+void dw_pcie_set_priv(struct pci_host_bridge *bridge, void *other)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+    priv->priv =3D other;
+}
diff --git a/xen/arch/arm/pci/pci-designware.h b/xen/arch/arm/pci/pci-desig=
nware.h
index 7efb1dc9a2..b9deb3b138 100644
--- a/xen/arch/arm/pci/pci-designware.h
+++ b/xen/arch/arm/pci/pci-designware.h
@@ -66,8 +66,12 @@ struct dw_pcie_priv {
     bool iatu_unroll_enabled;
     void __iomem *atu_base;
     unsigned int version;
+    void *priv;
 };
=20
+void *dw_pcie_get_priv(struct pci_host_bridge *bridge);
+void dw_pcie_set_priv(struct pci_host_bridge *bridge, void *other);
+
 void dw_pcie_set_version(struct pci_host_bridge *bridge, unsigned int vers=
ion);
=20
 void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
--=20
2.34.1

