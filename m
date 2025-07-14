Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4899B039E7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 10:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042710.1412780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubEuh-0008Gv-FO; Mon, 14 Jul 2025 08:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042710.1412780; Mon, 14 Jul 2025 08:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubEuh-0008D5-AU; Mon, 14 Jul 2025 08:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1042710;
 Mon, 14 Jul 2025 08:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ryw7=Z3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ubEuf-00089a-Vq
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 08:51:53 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9b1b6cd-608f-11f0-a318-13f23c93f187;
 Mon, 14 Jul 2025 10:51:52 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8854.eurprd03.prod.outlook.com
 (2603:10a6:10:40e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 14 Jul
 2025 08:51:49 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8901.018; Mon, 14 Jul 2025
 08:51:49 +0000
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
X-Inumbo-ID: c9b1b6cd-608f-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+RJShDqHWBi8w+k5IPx7zV/uTdrmXfUwxHOD5Rwqwy376NeHE1pohxbSsTXgEI8qCxLKJJ0lkrDduRdBbZTzkQnGar0mKK4r9Zodp/VK7p0jP2MCyWqJYQWE7fxerEz5a0NHYqlMCqyfW7I5ajsrkgTzpdiyX3UEDusNeBmPAmTF+4gJDuuUFob17FZg2vihP6+xTafVY4RbCUgq/q6KKa6EDnnA+ol+ejuXkmoS/C1upl+ELpfZQduRxN+62RdXVJyIyhcq3CKbRQRcvCgpSH1AktG0/OpUMRCyutSZyFHImGRcBtxRUyeB+ZTH0rPj239IvdS4MI5CsCaZbF3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoOyIhouvYIDXzMxu8XbELYjE+hFgNIPtStPFOtL0jk=;
 b=bo/cqq2cdbzug1M5+csNrhraPhmLYD5DeFGxmZ8g7wdOaz3nVpdoTTjtO7RVmsjaIzTw5Ps+XPkDdDGQCK4IFHc1Rewmwqb/kEosO9Ed/lEAYzxpXyWkeA4VdRexLz8GucNla0I9eAWsdxxAW/gS622n5f9+hAngc9ZJQvSb+7l6aD9zP3K8HzQF9iHMJzLhiwFa7Tevf1dzm/3PdXreConjJeA+4INoutQcGT0JsdoG5JFYTzvEXDrngvR5x/jIKKbyPZ9+rwhlsikLzAbyQFrhN4wetjGr8wFqSiSQPHabm88KpqKO48JOj7lmbnAZfgHRyihn1AYby03otQR0zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoOyIhouvYIDXzMxu8XbELYjE+hFgNIPtStPFOtL0jk=;
 b=CaS/a+AsuodeKHVUQho1U6BICGZ/0bPD8ZPlJaHQWLGPXlFHzSGdMlX9ib4rxpe3IplicxOenrWC+kHJq3KnjZr8d8LoMnbf15qndDRn98gqJdjrG9+CPn+b2yCuRs6kyTb0MyoDragrONKHQpzaCxv1jZGntI5JFpPVFPTkMPZY3/TeMCFNf9Z5gxc/AjvDTwwAvOnZXAcYIt/t2RcwhMwrtmCvgp2lRCU/Er9QZvgQ3umvoph6AynDcWcDHhYCQWbCW2Psj9tsI0Em89sREXe+qseTtDvuxBgVeaR2cs177fsSoiaIe6dFhrERW0ShE1oo3EgUswezSe/DgmcfoA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/3] arm/pci: allow designware-based hosts to have private
 data
Thread-Topic: [PATCH v2 1/3] arm/pci: allow designware-based hosts to have
 private data
Thread-Index: AQHb9JyI9h0+QrhnmUqIUro/j8+LRA==
Date: Mon, 14 Jul 2025 08:51:48 +0000
Message-ID:
 <f835fecbd31b1314f7f61e21fb6546f8cea4fe64.1752482857.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 387259f3-1808-4ff0-2556-08ddc2b3abaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?LTGmhh6xbq0hpolq4I60tEmO68JWxUlaaNUADMb5Qw+rtCBF5twvWUynAV?=
 =?iso-8859-1?Q?ARbia5Xi9fiKXjyuG/z3J0/VTJfww1es/u2e235IHHLlgptR2ojnUiWHZ0?=
 =?iso-8859-1?Q?Pnw9zXfnAhdbuiDm2GlLS3lDaC6cIXgY3xKdUkoNtkRAEd+oyBqAJ/R6Xp?=
 =?iso-8859-1?Q?qozif0P5eSVvThG4G7/DXRT88vdgofzmaMbUFyYtcbotDHAj/CFRoX3q8p?=
 =?iso-8859-1?Q?OEuVDrlRgWRnGZIAd4akbppLTV779JItJKkbVWzEbAeYQTkre4u5BZDgVN?=
 =?iso-8859-1?Q?MJbGXRKfXeByvHp6hzLDgL98h/ZJ/neLu1waqou9D1+VKzqK8MR/+oavcc?=
 =?iso-8859-1?Q?hNXkb3spY2ZJkguCebxPkEmQbVQBudk+JgHF8JitBwvlhY+BH03mosVfkz?=
 =?iso-8859-1?Q?jt38I2VU5ODDcU9zEb9o0LFUAelX1VLKZj4KL4G9RsKWjC5JJA8+iHBLtp?=
 =?iso-8859-1?Q?VDZ8KVd+hULRa4AhpvGqSP/9g2NWLHs879h9K2lx/d71U27poJJI+IPOv+?=
 =?iso-8859-1?Q?3rlI9qwpWMdXK1ZY7FCbtmCnNtgAaN2iYwOfEF6BPHnXFY0IAdauSBdckM?=
 =?iso-8859-1?Q?GzmSYdlXiDCIosUdGw+DTo+FyjRnQuTs7WIYHij814lrerH2tlA57rzh3Y?=
 =?iso-8859-1?Q?njGplskzhXc3hf55UCB7y/skdyWcadFP1GJRil21+qsh6rkGqBUYVwKP27?=
 =?iso-8859-1?Q?bEC2a1j8v3CtZ7hgdyPW3k+/FNB0OC4mn2dPX8lljodo8gc5LH4QVtJ+on?=
 =?iso-8859-1?Q?giG9YI6T67g/oPe1CRPIRWXyRhLuduP2Ukn+K3+1oX06uoL7VYM9FZOuQX?=
 =?iso-8859-1?Q?WAHnuOUqRtXhYMMefzyyKHN2SZw/UvrdQVauYdLUauPUPRK19/M7N+9BLH?=
 =?iso-8859-1?Q?lHe3HIo3JKoQVeE0jc06dd4P45aFaDNMkWXi+1aYfb7Bta7s+D0GifpzvE?=
 =?iso-8859-1?Q?EYcDLiMtbnpQlF/Mjol5lNm8cvG7wlvt0uNyBG7ih7hfH7xTPEQjlu1rX7?=
 =?iso-8859-1?Q?GQywd/T/kp3FEt6Cpd4C64SLWiO+kUaECxKyo7QIwEA0uUfFd3aH6/4oSM?=
 =?iso-8859-1?Q?hx6VE8fB11v0fNAC0kzLAeqE9lp7mX0iDpininhUjLDiA4dPobYTxcf7tn?=
 =?iso-8859-1?Q?iBjrfzpX4HNQekd99dygZSdNQk0PA5rYNebYcm0sLW0BGJQrEjMpnEqD3s?=
 =?iso-8859-1?Q?k8wEy7l1qzKUZ0n1e5NKfJRTe3Z648ceLYIsP+kBDutbwAQZovNxg77spc?=
 =?iso-8859-1?Q?vX9QnE83BMZ636+E/220gismQIdkCPAZjjzhxw6w+nZcuEf6QhGeMttL8C?=
 =?iso-8859-1?Q?jVkwkjq3v/8eJMrUSzLqayP9njrcsI3fniExdj7gKHnEa2V96A4fv8ioN4?=
 =?iso-8859-1?Q?jpY9054tcOfFKBJxPeg7F9iVZJ2bdLyVSy0+uit/OuATzRKPBCMQ3GYxmI?=
 =?iso-8859-1?Q?GvaJV3YWWU3SQUquz+NMsAlqVGe9YTNg+IMnBZ8EZonc7fQu3ZOg9R6LHX?=
 =?iso-8859-1?Q?M5ubaKAhxIonktOlyFtjqr4nXXiCpvf5i9FKqiPD8rPw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LpD4HcV3iLs0dOJ6O+88H7OMpT1UtFOJpNqgHoQjP3nAfzjrcjquAtLhoJ?=
 =?iso-8859-1?Q?e+HaZ+Sl749d+6H2KSwBtGn6ECezIJw6QPwJ3To5bTr7f1J1Y4VHevk0mk?=
 =?iso-8859-1?Q?wHQb+vBK5CZG2nE78uk6ulNbBgVAcXcpp2ELPAauhbMVKUTAj6UZOIyeXG?=
 =?iso-8859-1?Q?f6I70tOWtQpS+wWxyn2UGh7WNn8XpoRi+w1pBToNhaqMhwSac0kv5J4ALL?=
 =?iso-8859-1?Q?mwTCMJbLDl6BU6eBWFhJq3530I5vzkVi7uOc4fvzzM0O5wBka22oAPU+HX?=
 =?iso-8859-1?Q?jgrKJRKqlDFAvZxoS3fL1xdTZjCOkFvogRNamebVJtcn7jDb4BdN6aCZON?=
 =?iso-8859-1?Q?vFgdMbVKf3Z5HfFMEjmjmnMEUWPvqK87Nqm7gE/PnVNxJZc+/rqZnkyRaC?=
 =?iso-8859-1?Q?e+xxftZIfHpPlK6iIwVgJawWXCFJNDalGK4CCnJ9sQ5HAEPGPdhVS7kLjw?=
 =?iso-8859-1?Q?t4anXnDuhjmf9bSZJPR5c986cFLctni0BEUNIcGmC4gmSgeIAunEN8ePuk?=
 =?iso-8859-1?Q?x6w/2l1WMjEwxB5n5a1cD9GTQgYYiv9+NnLLgB2k4OG9FRI6HohU2ujUjh?=
 =?iso-8859-1?Q?BIIdW2/aavKcGaz9BBSHIFoCk9qSrkfVYIpdrGrGZ8lHDFOZzZTYzgC88A?=
 =?iso-8859-1?Q?vM2g8Z+ZfrujU9mguaItykdPW41u+P8o1GMODJ1+Jn8Q3Qb1+vsV/dLg5s?=
 =?iso-8859-1?Q?TrMk5AkJG+Xur8hthQm6EQaqyyh7pLybu3S6EcxV3PmZ5Nf/Ose2iv9lTO?=
 =?iso-8859-1?Q?LHXZ/8AbJU1LtBTgOx1doPC224fWPiaTjEffYuUcqHNYSK1LDbW5tvDkoM?=
 =?iso-8859-1?Q?usDJaUCACWwwR6AsM/uGmEfV1wPnmjQDvjGrY0ZeL7FbLim3TvwHduOHWW?=
 =?iso-8859-1?Q?B6Lt6cx6e5uDdaUMiBOCEtkkqfWtWzXevEAg5FmIsfojhug6q+LfKjaI1D?=
 =?iso-8859-1?Q?IpzrNV05ObSQ5x1WiJYVIPxEPj6t3A3ARdMrS0Jrp3/uyb5MjtGs68NLCI?=
 =?iso-8859-1?Q?/9t/Gf+pIH7NiVYxizHznRvl9Bkd2bVh+FINc5ufMFxwekzTAkhhYgxwq7?=
 =?iso-8859-1?Q?Jslrd9O7EA87CsT9PuGxHrvOFflCLfoxqjb2JyF+UnO21BIigY5yNVqBwy?=
 =?iso-8859-1?Q?MwFaPa935VpAPSNpJe7475ks7qbe72hMonb9mUX/SpP2WzvIOGZu1R7201?=
 =?iso-8859-1?Q?qngxb4dLu//FyHCNYvsC/ANr34wQakr41YvVO+PKUfn6biMcJ0VEU7wYS0?=
 =?iso-8859-1?Q?QK0QVPA5WKlmtbusBP75zmtbnz+1dm+HQAJtHZ4yGjMHgt2tRpDJONmVrF?=
 =?iso-8859-1?Q?CpwIV94jkVyhN+w0zn3WVILKbma0EK6Mp72gWpxLtPTOXXyP2sarDFBnpx?=
 =?iso-8859-1?Q?N1sA2NPf76zVATADcw+yZ27u4Uu8HyCbQ0Tv3udhTS74dpT3ftcdJlYzvp?=
 =?iso-8859-1?Q?bpETfysL5LrRTtc8W8U5qX7DnzPXssT4kQtNnZ+XD0t8SPjFbaX6fnXeOl?=
 =?iso-8859-1?Q?YdSFTX+r5USXnnxbR5cHiFPDCN5/dMgZwhS9ezNG4x5wjD9+mja1+qoy7X?=
 =?iso-8859-1?Q?8djyO2D+GrbwPouoCEY0gxhsuL1t2JESi83fIJtKqSl1/eyGFSxd316L0N?=
 =?iso-8859-1?Q?jTf4VSVrCs1oYMph/RliHC0fQZ7mjfZ7WczwqQaeZESsRDloTTRs4/xA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387259f3-1808-4ff0-2556-08ddc2b3abaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 08:51:48.5646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TZcQIyCxajDhsfsZ2bhvkMQAvsXHK/vcokuXAx/mNY/k84JtBQzj4aJy0SlWWqvd3VCrE/rqLhGSL1CV0aCO9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8854

Introduce an additional private data field in `dw_pcie_priv` to allow
vendors to store custom data without interfering with bridge->priv.
Also add get/set pair to make accesing that private data less
cumbersome.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1->v2:
* add Stefano's AB
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

