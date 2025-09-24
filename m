Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0C0B98B82
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 10:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129032.1469172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPR-00087t-Vi; Wed, 24 Sep 2025 07:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129032.1469172; Wed, 24 Sep 2025 07:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPR-00085A-Nj; Wed, 24 Sep 2025 07:59:29 +0000
Received: by outflank-mailman (input) for mailman id 1129032;
 Wed, 24 Sep 2025 07:59:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4Db=4D=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v1KPP-0007no-NV
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 07:59:27 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 641925d5-991c-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 09:59:26 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU5PR03MB10523.eurprd03.prod.outlook.com
 (2603:10a6:10:525::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 07:59:23 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 07:59:23 +0000
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
X-Inumbo-ID: 641925d5-991c-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fY4Ocp1A3fYhI4EA4KWUYcla1ll3W5XYrzd2jGHJwUgYNNcNlc9jZuMpAX6TBQmoQ4TjftciKltRAexYpRM5hgHo2lliSTqj4Sm3YA9Af9yRZybqnuX06X9DKMOiocat/vhkBE5J8ZYSfQ5WcfKQpo+nX47DLj4a6PWIUz5aJsUVdw4RhMopQZvkyoeo8jXsR/oJJ63Zh3RLHwh8FjkGrFFi7t2rfY6nE8wzoWptldsgfqETdUGVVS2wjb60+psNquWGSqoKugKnqwKpFY7TPHQNbXkMyPjOjNhcHYYj7rYwOERPaLe2Tc7GgRS1wxqP/ojZRD/XGQO+D1J5f7RDzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNV6Y6o2sz7AQ4bcrVfEpSjNRMiw4hKSwkvuVDIqZEw=;
 b=Q+SChlSXGtVoY2fj3b13oHnnznCG1aLfa1qEbjzGxunGbJxjHg6ggPU4nXVIOQqNbm7eT8mKYnMQ924Zj7/hghayGZZThjpGjXXJ9XNjEOg/t7fDUhHhLMmrGK8ngHdqONb9DMvi9CwGRSfxgswu6KoO/WUN1Ag10X3Vl+r3ShDKmPaAP1XVLlh+KzMj4vHYe0e0KBorMIcq0p0yQOnLwK3mjI2ElVbVDLNQm6WEun0umiKW21Iv8sNmLx+uS2FCtRPFsJtLYle5gGCQ2cWHDFuyPcr6TBCrUmTcy0p27HiICieg5CsEDSq7tfqx7Q66QozoxJ2qMiS03pA+W8K/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNV6Y6o2sz7AQ4bcrVfEpSjNRMiw4hKSwkvuVDIqZEw=;
 b=IQ3hyCZi9tQHBFAjl0Zgq1BLGMCA4w5Fc+qBs3/0K+Q220UXS4iTN3KqP51eiGkcpe9Fu3d48OZDzT9jWxgyVbYi4Wdic4AKNgUvjKEfb3bVg2w4u5dfHjR/5VKGsJp4CimFfJk7msQreSazDqThr7U6SJPWykEtKhG9TdfqBQ4JDEt51LhujXpoDGqH0PAuj3apuiSN4iJHHa3XZU0+WSV0OS9j2wpMt/VeRO+DLwDzQP0Xs+y8RsyXPtntMo/cw6R/DuntmR6AM2dDOyImrMnQ3CumKSSlzrBJtQIecY1az/GGcorutvoo6tF9uDlqPE+G/4OuocqS2bJ9qEWVPw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v1 6/8] xen/pci: initialize BARs
Thread-Topic: [PATCH v1 6/8] xen/pci: initialize BARs
Thread-Index: AQHcLSkjNTjer4+LIk6OKFhehALrog==
Date: Wed, 24 Sep 2025 07:59:23 +0000
Message-ID:
 <e50fd6adb255b0c5472a8ff640d714586f59c328.1758618839.git.mykyta_poturai@epam.com>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1758618839.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU5PR03MB10523:EE_
x-ms-office365-filtering-correlation-id: 50217c18-6c5b-478b-286c-08ddfb404688
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZQmZYdC88wbYFBHsn+GKuGdChUZ0pmiA8Dz0HemuszMk8HWJhC14SinMqQ?=
 =?iso-8859-1?Q?IWKBzrNRtJTZ7QnzshnA8gmxKs/ciMOxSY/9hDkJuhmah5SMj1LRSCOUra?=
 =?iso-8859-1?Q?/J24EAXX8WDoY5y4uUp8OHvBaq5fPvu/8/C1uuXxif9488n5yk01AsJWiz?=
 =?iso-8859-1?Q?7R+uY/Bpp5F5asnd+eoDaQtpaL1rn7ehMC4nwn/yUat0TYgW8KjqL6kjhb?=
 =?iso-8859-1?Q?ECECT6KPNi9Rt3KrKLffRxD2D3mHoiaRvfs7NVNrhG9+biKV096b/6iG1q?=
 =?iso-8859-1?Q?FhRKMGZ5ScIjm0JR5PoRmRihBkXMT5d2nZO/2j4uLd6yMEHglZNQvP262t?=
 =?iso-8859-1?Q?lNXJ4YzOSASrN3jFDQNwtiKw5glSTQ5dzLISNqu94bdpfAFiuC9WDJq8M5?=
 =?iso-8859-1?Q?p3W74CC49O4mG9aNaw6bRDCfyvAkrHLfWJCWLwgA8dvgiiJoLa0f4pE9Ea?=
 =?iso-8859-1?Q?FfNE1+ejOsAvkCqTMbowvwOvf4wzZ18dgBsidnP6L8NT2X9bkvurLApddC?=
 =?iso-8859-1?Q?BXowPv3znZ42wrzviK5lxlnewYk6OWSCrZP035FeptVicjP0qQg0qz8jYf?=
 =?iso-8859-1?Q?TEn0odfboBOB9zud7wPMJVLyQ/CLPbWtPvHmZuBnJQu5oALPSpwElRz1nf?=
 =?iso-8859-1?Q?K8IM73k4Mw5BjBSLW2sudwa/jL0krJOxQtrb4p8rZ63/4jj/KpqvfVRqdp?=
 =?iso-8859-1?Q?xnYK3z83iwX75hRLyJwdB/9fQ8XSsPIH31c58dn4G57QKPV1bUBJHtNUDp?=
 =?iso-8859-1?Q?Afo6IpfHsP2gNEf/sfMP1O3e7GwUaeSU/nk+ldhtTXwvOHUTrF6/C9E364?=
 =?iso-8859-1?Q?JG3Xxz7iL5/0qULHOAdI85CukvE9Rii9NEy8x+yzUu63pXGjWNIv+hcYVN?=
 =?iso-8859-1?Q?NsHOZ3IZnvo4MtDFB2Szz0+KKIYMw9c365JOnV5b27j/EVnYCst8O5qycG?=
 =?iso-8859-1?Q?8rWpWniBiRIP96PhT6hudDYjWNodJ9LF4bu9mvLqECmv3SGJ7S911y6y6D?=
 =?iso-8859-1?Q?c9S/vEr5ZM8RtyZSvmmLDIHbuJBuYwSMP9xq6h2Rjsnyaqlxty/hq8AtL8?=
 =?iso-8859-1?Q?o2j6JuBe4oJvftwm6IcOHzcZs3SgeOfgMOuBYp9+NqMV45WdC1NWKRyvN7?=
 =?iso-8859-1?Q?eWVhiF2tUrVpfgSkDgkNJs5ZfIjzw4Uq9qJIcsga1g1sHpn9xJ5oo7aH19?=
 =?iso-8859-1?Q?PMAHPVzXjeCMA6omL6fuz3D5mKHuaVZAqWKSRZ15rGnImDVjhWpf//JjRM?=
 =?iso-8859-1?Q?jAQrwLOMYmJt0h/cM5MSvVVOEWthx61z5An3OGpMJPokl/unwA7AxF+e4D?=
 =?iso-8859-1?Q?2stgBosBiwBbBT2f0/GFkV3naNoGJoaVLdXdfuqV9P+7b00I7rHEUQbjOY?=
 =?iso-8859-1?Q?APkHHBBkau0NvDZgB9yYPC5UUOSrD91kR24Ki5odEpzf3520DHGOopTp5a?=
 =?iso-8859-1?Q?sfT+cJquSy/xQoxJd29TKM5cpKDwG2snlTpqsTIU3phMUU1+0999VErrEt?=
 =?iso-8859-1?Q?W2DXF50A9UA3wsPKBjTOdL9wCTJm5AsQJCDYh/DFlE79of9JpAfNV8tl6J?=
 =?iso-8859-1?Q?oH2ysY4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bilJVjYo7T88EBH9D3E/iIS31Ogl+1diuZvmXE62zhqX7M7IR6viEqZ5j8?=
 =?iso-8859-1?Q?dL0Uw8RFyBKOEctQtUBKBcQpnAZJOgh3N+11DhOxKghuKT+5fBeYvYLFh3?=
 =?iso-8859-1?Q?z+dlajZrgxFvc8s+EopD8vw+Q9FlTcUZE11J66sMuvHUiGnklBhK7mG9OG?=
 =?iso-8859-1?Q?ID1BUA5xvOvj1VV/AJN2iIuGn/2V1YGhNZXFsIWOMTErfrPo/1/+PxV51n?=
 =?iso-8859-1?Q?owpAuZStNth+HynJJNs8sYCAAuS5bUHGa1xNC7bS0cHo9O9GPOPNGhPtVh?=
 =?iso-8859-1?Q?j9YZpDiQE4Bx4IsknHOn500XjjkZ+CVGNANNvugtRHQZHVoLf2FYMspxJE?=
 =?iso-8859-1?Q?qfKEk0NwBIm1n/dxOgjVyENrIdZPUze8Wm8h8b7U6Jf5xv+67JVZ7PJLW7?=
 =?iso-8859-1?Q?9kWK5q3OiBxd6i0277u7AY3hTOsvhIIbm5I01bUUcR5ehOktrEjvLFR3Ti?=
 =?iso-8859-1?Q?KvngpOu+t6MtNJjt7bxSxab/le8rivB7G3ENMa76+spEFPcXq2axsm3qeu?=
 =?iso-8859-1?Q?BJxq4NE6dFyvPkUhdK97+i/DWqZbJMGdBetxvZ2hGj2gZRWmjuuGasIcnH?=
 =?iso-8859-1?Q?ysPmvQGh/ocO50Gn4cSf8bst+lehz7YclTL1LGqrK+Zwvha37HszeeRnXH?=
 =?iso-8859-1?Q?8KHcUHUSGrCnkbMD3V3GF0JKLNwSsoBO/AWL+OBpEKv8+nhf9HNSI0bd67?=
 =?iso-8859-1?Q?YJnrEEemk9w/sYyoz9EaiH2TzhfjYMDCz4796H+voJ6AXoB5w39uS5KiK/?=
 =?iso-8859-1?Q?Nxn/nnGXM7+wvwV+qKc4AjMD9u7Dsh9FIwzbzE6A5O5/BkEHYcPHrcOABK?=
 =?iso-8859-1?Q?3xoblzcTIi0dRK26yEkD518S4gY5X0Bj+zrU4HQXYWq4F/rmmPDZgBjv9Z?=
 =?iso-8859-1?Q?KW+kBOMkvJYHGZ6H/XVO6II5vYkRKx9/ZwLz0GkZHYIsaL5b1eUhin4YsO?=
 =?iso-8859-1?Q?Ms1FXJ5R5n/E6G8f3NN4WZZHo0fojUckaBhThuHUALw+8sX6l1opJ5DhR3?=
 =?iso-8859-1?Q?PItO3QldMZTUji9k1MOYtvYUpNomfD1sl6KgLQD2lJhGpeBUhWNTLewx2C?=
 =?iso-8859-1?Q?d4B8eTPBmrF9IW/znoTu6ffE/hacig63qQLNWucmQ1Hcx71WKC7CMNga6P?=
 =?iso-8859-1?Q?4weROrVy6MysobcmIgbCy1GvQMODi6v1Ufyp2JtxLx8EFwYdgM8LHBAz93?=
 =?iso-8859-1?Q?WmUKq+Bu5avpVaXWII0a3jJ9zI/Qo4zcFQsR2M34CSZ5yjfhLs4MktxPtd?=
 =?iso-8859-1?Q?rAs4IQMtHB8alU03pnFPpRDR1kqjMVaZndO33P7mhT8sAzVbHRUMtegSOH?=
 =?iso-8859-1?Q?AJQTx+Io0QpfCQ28jXrJmg+BnevWZjyrpUgnHz9X98K74nj0F4MuPiXa5T?=
 =?iso-8859-1?Q?zJPoF9eBko//AtFKtDHw9/LpzG8spjJmM45SXbwZIja7G8K8JHukxLbLww?=
 =?iso-8859-1?Q?DFIAonoJCh/4BhCXxLqYUUwydMGWr9ww6UWs8PYHqcv0DTWSRNVjCzbjgU?=
 =?iso-8859-1?Q?30TH5QN399HYlhVIMULtMOr1Z0yI7+K0sZxRW+Uqar0wR7wc/jml0jEWqK?=
 =?iso-8859-1?Q?O3VP7wrXRiE+7SmtbbD8/OxL7t14R0KewcrKFgCPLqG194O+iqY+IFIEkG?=
 =?iso-8859-1?Q?kcQbwWPeiAxgvjF6zpiFhPwk8puQ/wHMOH7Uv5j/6exMAaBrfMm5+oeQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50217c18-6c5b-478b-286c-08ddfb404688
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 07:59:23.4293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uF5EnbxXLgFxVHEUWqmQcS59oRDUv/yKRMxpTNnk5a9MfPl1zU09DPHDutMzr1wwQZybcjaJLwcNtHIxyL7T6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10523

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

A PCI device must have valid BARs in order to assign it to a domain.  On
ARM, firmware is unlikely to have initialized the BARs, so we must do
this in Xen. During setup_hwdom_pci_devices(), check if each BAR is
valid. If the BAR happens to already be valid, remove the BAR range from
a rangeset of valid PCI ranges so as to avoid overlap when reserving a
new BAR. If not valid, reserve a new BAR address from the rangeset and
write it to the device.

Avaliable ranges are read from DT during init and stored in distinct
rangesets.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/pci.h     |  7 +++
 xen/arch/arm/pci/pci-host-common.c | 78 +++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/pci.h     | 14 ++++++
 xen/common/rangeset.c              | 35 +++++++++++++
 xen/drivers/passthrough/pci.c      | 79 ++++++++++++++++++++++++++++++
 xen/include/xen/rangeset.h         |  6 ++-
 6 files changed, 218 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 4fc46da315..ba4caa56ae 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -74,6 +74,8 @@ struct pci_host_bridge {
     struct pci_config_window *child_cfg;
     const struct pci_ops *child_ops;
     void *priv;                      /* Private data of the bridge. */
+    struct rangeset *bar_ranges;
+    struct rangeset *bar_ranges_prefetch;
 };
=20
 struct pci_ops {
@@ -154,6 +156,11 @@ void pci_generic_init_bus_range_child(struct dt_device=
_node *dev,
=20
 bool arch_pci_device_physdevop(void);
=20
+uint64_t pci_get_new_bar_addr(const struct pci_dev *pdev, uint64_t size,
+                              bool is_64bit, bool prefetch);
+int pci_reserve_bar_range(const struct pci_dev *pdev, uint64_t addr,
+                          uint64_t size, bool prefetch);
+
 #else   /*!CONFIG_HAS_PCI*/
=20
 #define pci_scan_enabled false
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index 67447d8696..bfe610a403 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -21,6 +21,7 @@
 #include <xen/rwlock.h>
 #include <xen/sched.h>
 #include <xen/vmap.h>
+#include <xen/resource.h>
=20
 #include <asm/setup.h>
=20
@@ -232,6 +233,21 @@ static int pci_bus_find_domain_nr(struct dt_device_nod=
e *dev)
     return domain;
 }
=20
+static int add_bar_range(const struct dt_device_node *dev, uint32_t flags,
+                         uint64_t addr, uint64_t len, void *data)
+{
+    struct pci_host_bridge *bridge =3D data;
+
+    if ( !(flags & IORESOURCE_MEM) )
+        return 0;
+
+    if ( flags & IORESOURCE_PREFETCH )
+        return rangeset_add_range(bridge->bar_ranges_prefetch, addr,
+                                  addr + len - 1);
+    else
+        return rangeset_add_range(bridge->bar_ranges, addr, addr + len - 1=
);
+}
+
 struct pci_host_bridge *
 pci_host_common_probe(struct dt_device_node *dev,
                       const struct pci_ecam_ops *ops,
@@ -286,6 +302,14 @@ pci_host_common_probe(struct dt_device_node *dev,
     pci_add_host_bridge(bridge);
     pci_add_segment(bridge->segment);
=20
+    bridge->bar_ranges =3D rangeset_new(NULL, "BAR ranges",
+                                      RANGESETF_prettyprint_hex);
+    bridge->bar_ranges_prefetch =3D rangeset_new(NULL,
+                                               "BAR ranges (prefetchable)"=
,
+                                               RANGESETF_prettyprint_hex);
+    if ( bridge->bar_ranges && bridge->bar_ranges_prefetch )
+        dt_for_each_range(bridge->dt_node, add_bar_range, bridge);
+
     return bridge;
=20
 err_child:
@@ -476,6 +500,60 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t s=
tart, mfn_t end)
=20
     return bar_data.is_valid;
 }
+
+uint64_t pci_get_new_bar_addr(const struct pci_dev *pdev, uint64_t size,
+                              bool is_64bit, bool prefetch)
+{
+    struct pci_host_bridge *bridge;
+    struct rangeset *range;
+    uint64_t addr;
+
+    bridge =3D pci_find_host_bridge(pdev->seg, pdev->bus);
+    if ( !bridge )
+        return 0;
+
+    range =3D prefetch ? bridge->bar_ranges_prefetch : bridge->bar_ranges;
+
+    if ( size < PAGE_SIZE )
+        size =3D PAGE_SIZE;
+
+    if ( is_64bit && !rangeset_find_aligned_range(range, size, GB(4), &add=
r) )
+    {
+        if ( rangeset_remove_range(range, addr, addr + size - 1) )
+        {
+            printk("%s:%d:%s error\n", __FILE__, __LINE__, __func__);
+        }
+        return addr;
+    }
+    if ( !rangeset_find_aligned_range(range, size, 0, &addr) )
+    {
+        if ( !is_64bit && addr >=3D GB(4) )
+            return 0;
+        if ( rangeset_remove_range(range, addr, addr + size - 1) )
+        {
+            printk("%s:%d:%s error\n", __FILE__, __LINE__, __func__);
+        }
+        return addr;
+    }
+
+    return 0;
+}
+
+int pci_reserve_bar_range(const struct pci_dev *pdev, uint64_t addr,
+                          uint64_t size, bool prefetch)
+{
+    struct pci_host_bridge *bridge;
+    struct rangeset *range;
+
+    bridge =3D pci_find_host_bridge(pdev->seg, pdev->bus);
+    if ( !bridge )
+        return 0;
+
+    range =3D prefetch ? bridge->bar_ranges_prefetch : bridge->bar_ranges;
+
+    return rangeset_remove_range(range, addr, addr + size - 1);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.=
h
index 08e8959d0d..2cabbbb5d0 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -82,4 +82,18 @@ static inline bool hwdom_uses_vpci(void)
     return false;
 }
=20
+static inline uint64_t pci_get_new_bar_addr(const struct pci_dev *pdev,
+                                            uint64_t size, bool is_64bit,
+                                            bool prefetch)
+{
+    return 0;
+}
+
+static inline int pci_reserve_bar_range(const struct pci_dev *pdev,
+                                        uint64_t addr, uint64_t size,
+                                        bool prefetch)
+{
+    return 0;
+}
+
 #endif /* __X86_PCI_H__ */
diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 0e3b9acd35..c1c6f8610c 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -357,6 +357,41 @@ int rangeset_claim_range(struct rangeset *r, unsigned =
long size,
     return 0;
 }
=20
+int rangeset_find_aligned_range(struct rangeset *r, unsigned long size,
+                                unsigned long min, unsigned long *s)
+{
+    struct range *x;
+
+    /* Power of 2 check */
+    if ( (size & (size - 1)) !=3D 0 )
+    {
+        *s =3D 0;
+        return -EINVAL;
+    }
+
+    read_lock(&r->lock);
+
+    for ( x =3D first_range(r); x; x =3D next_range(r, x) )
+    {
+        /* Assumes size is a power of 2 */
+        unsigned long start_aligned =3D (x->s + size - 1) & ~(size - 1);
+
+        if ( x->e > start_aligned &&
+             (x->e - start_aligned) >=3D size &&
+             start_aligned >=3D min )
+        {
+            read_unlock(&r->lock);
+            *s =3D start_aligned;
+            return 0;
+        }
+    }
+
+    read_unlock(&r->lock);
+    *s =3D 0;
+
+    return -ENOSPC;
+}
+
 int rangeset_consume_ranges(struct rangeset *r,
                             int (*cb)(unsigned long s, unsigned long e,
                                       void *ctxt, unsigned long *c),
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 3edcfa8a04..4f5de9a542 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1172,6 +1172,80 @@ int __init scan_pci_devices(void)
     return ret;
 }
=20
+static void __init cf_check reserve_bar_range(struct pci_dev *pdev, uint8_=
t reg,
+                                              uint64_t addr, uint64_t size=
,
+                                              bool is_64bit, bool prefetch=
)
+{
+    if ( pci_check_bar(pdev, maddr_to_mfn(addr),
+                       maddr_to_mfn(addr + size - 1)) )
+        pci_reserve_bar_range(pdev, addr, size, prefetch);
+}
+
+static void __init cf_check get_new_bar_addr(struct pci_dev *pdev, uint8_t=
 reg,
+                                             uint64_t addr, uint64_t size,
+                                             bool is_64bit, bool prefetch)
+{
+    if ( !pci_check_bar(pdev, maddr_to_mfn(addr),
+                        maddr_to_mfn(addr + size - 1)) )
+    {
+        uint16_t cmd =3D pci_conf_read16(pdev->sbdf, PCI_COMMAND);
+
+        addr =3D pci_get_new_bar_addr(pdev, size, is_64bit, prefetch);
+
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND,
+                         cmd & ~(PCI_COMMAND_MEMORY | PCI_COMMAND_IO));
+
+        pci_conf_write32(pdev->sbdf, reg,
+                         (addr & GENMASK(31, 0)) |
+                         (is_64bit ? PCI_BASE_ADDRESS_MEM_TYPE_64 : 0));
+
+        if ( is_64bit )
+            pci_conf_write32(pdev->sbdf, reg + 4, addr >> 32);
+
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    }
+}
+
+static int __init cf_check bars_iterate(struct pci_seg *pseg, void *arg)
+{
+    struct pci_dev *pdev;
+    unsigned int i, ret, num_bars =3D PCI_HEADER_NORMAL_NR_BARS;
+    uint64_t addr, size;
+    void (*cb)(struct pci_dev *, uint8_t, uint64_t, uint64_t, bool, bool) =
=3D arg;
+
+    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
+    {
+        if ( (pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f) =3D=3D
+             PCI_HEADER_TYPE_NORMAL )
+        {
+            for ( i =3D 0; i < num_bars; i +=3D ret )
+            {
+                uint8_t reg =3D PCI_BASE_ADDRESS_0 + i * 4;
+                bool prefetch;
+
+                if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_=
SPACE)
+                     =3D=3D PCI_BASE_ADDRESS_SPACE_IO )
+                {
+                    ret =3D 1;
+                    continue;
+                }
+
+                ret =3D pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
+                                      (i =3D=3D num_bars - 1) ? PCI_BAR_LA=
ST : 0);
+
+                if ( !size )
+                    continue;
+                prefetch =3D !!(pci_conf_read32(pdev->sbdf, reg) &
+                              PCI_BASE_ADDRESS_MEM_PREFETCH);
+
+                cb(pdev, reg, addr, size, ret =3D=3D 2, prefetch);
+            }
+        }
+    }
+
+    return 0;
+}
+
 struct setup_hwdom {
     struct domain *d;
     int (*handler)(uint8_t devfn, struct pci_dev *pdev);
@@ -1263,6 +1337,11 @@ void __hwdom_init setup_hwdom_pci_devices(
     struct setup_hwdom ctxt =3D { .d =3D d, .handler =3D handler };
=20
     pcidevs_lock();
+    if ( hwdom_uses_vpci() )
+    {
+        pci_segments_iterate(bars_iterate, reserve_bar_range);
+        pci_segments_iterate(bars_iterate, get_new_bar_addr);
+    }
     pci_segments_iterate(_setup_hwdom_pci_devices, &ctxt);
     pcidevs_unlock();
 }
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 817505badf..e71e810f82 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -56,11 +56,15 @@ void rangeset_limit(
 bool __must_check rangeset_is_empty(
     const struct rangeset *r);
=20
-/* Add/claim/remove/query/purge a numeric range. */
+/* Add/claim/find/remove/query/purge a numeric range. */
 int __must_check rangeset_add_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 int __must_check rangeset_claim_range(struct rangeset *r, unsigned long si=
ze,
                                       unsigned long *s);
+int __must_check rangeset_find_aligned_range(struct rangeset *r,
+                                             unsigned long size,
+                                             unsigned long min,
+                                             unsigned long *s);
 int __must_check rangeset_remove_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 bool __must_check rangeset_contains_range(
--=20
2.34.1

