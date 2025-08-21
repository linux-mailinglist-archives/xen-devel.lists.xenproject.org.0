Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CBAB2F4F1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088342.1446112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2KY-0005Ri-Aj; Thu, 21 Aug 2025 10:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088342.1446112; Thu, 21 Aug 2025 10:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2KY-0005Oq-7a; Thu, 21 Aug 2025 10:15:38 +0000
Received: by outflank-mailman (input) for mailman id 1088342;
 Thu, 21 Aug 2025 10:15:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+ul=3B=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1up2KW-00059V-ND
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:15:36 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c728d7c7-7e77-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 12:15:35 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU2PR03MB8021.eurprd03.prod.outlook.com
 (2603:10a6:10:2dc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 10:15:31 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 10:15:31 +0000
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
X-Inumbo-ID: c728d7c7-7e77-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3RpouwbT1QJQgWqNHboOojCNYsdAP60QdXhyRcHRZtxzWteppwxsrIimV8EjVe9EJa6BO2ZeOXcIUMKDa6gJISYUy7XlaVziNTsUUaTHxKiAmtat6E9m7BS3fg/Eho5ESqworLiIdMcXBGO9UyU7hPACVEcNa42lXM2wgnh9lEGZPNRWDiJvj32t6vSK7g7ijvVgHJBp1rO9V5Mgs7gJxRdD52mAC9IglXkE3wlnWQ5wVWj5JFQKOzZ5uljApAq34nw8OkceSyjkWSJdzyhN/gahCwL0OAE8M+AHSPHNt2W6x4kz8nsI7dl+1EyKd3Zw5JEw5W0dgpuX3jIT1ohQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86Mi/jKKSXvwr4maQx0aFY5gwsu8uqzkfgL94yXKVYI=;
 b=YA/NIJnTtNWS9E8RnzYMrxdDVy8a2J0dDAqNgufGRdd2TXjhGeiayWGbmtew4RLxhddzFBU2Leijdrl+chGP6HIGdk/V1IZQ47NjXrspm2aT5oE6BBD4+94RUE/BdhRi2MFwbKClFZGOQz+Vw0zBmqm/N02ps5xrg3rMeorslyN9KpDWJkShAwX91Osy1QPcBraOyfISd6lKmHTAkUuht/L8oEh+rif2UZxRhQOkPS5I8LlPG3ZE7YOX6M9SckXMK3B4Aibpm2UVR7R37sa81QDnSkBhaSQM+RrRmQMppuutYvnJ/QEMIT+bj37FwkKSrjMZ+4KJYvO1JO6w3reNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86Mi/jKKSXvwr4maQx0aFY5gwsu8uqzkfgL94yXKVYI=;
 b=K7s9/o7VoQi/tjN+dW0bsQNSNAr9KBvv1fZObAP6OeChEV3aUMa1KiMReMmMTpdQ89RzEC0LrsWFUg3ef5ppI6+J8fzJVpsg5jwWyzdvoJSFswKT8h37xxhNrRAri+qHXEjqC/CpkessYJFrGu645sY4kJ/ED3HWShNUk1UTKO7ElqHxxD5SNN14BgnDeF9xLK0IuC47gp1FsRpoKwupu6jrYMlCS0K1onnZpFmOURf95Vc0ketqjbmZ3DqtdT70korkiU8yGwFXW1+aZXv7y8C5FhH6u4OSeJJtVbK3WiWEbQbImVSzm9Ue335TR5bkMLKLG86TyMi16/3ofvBNrw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v3 1/3] arm/pci: allow designware-based hosts to have private
 data
Thread-Topic: [PATCH v3 1/3] arm/pci: allow designware-based hosts to have
 private data
Thread-Index: AQHcEoSGgUpxpjEE+0qqirNnOFnD0A==
Date: Thu, 21 Aug 2025 10:15:31 +0000
Message-ID:
 <c655ff468eb806bb6b21fd389762bff41c537310.1755771103.git.mykyta_poturai@epam.com>
References: <cover.1755771103.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1755771103.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU2PR03MB8021:EE_
x-ms-office365-filtering-correlation-id: 3e0e1d70-b1be-4e55-d827-08dde09ba902
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?g4N4YWTiI3O7e3x7JNKcpwjPaBZhUv6AOGQmDMjoqDAR2By/0qumMLQ93j?=
 =?iso-8859-1?Q?Lav1r0Fw3ju+NxqsvayH4xhXCHm/ybsJY8e79c0r37Hb76DHBmeofECRsE?=
 =?iso-8859-1?Q?VX7eoNeIbvbn+dLb5PreloPfWwNu0VNaKCCEi5y29RE67m+erhODfQayfn?=
 =?iso-8859-1?Q?8vWfkS6VeR9GoGHBS/59Im7Rd6RRjvVqhhHGDxUMiREP+svnLXBwsTdjUt?=
 =?iso-8859-1?Q?ztv+1XrTwUVtiW+0XU+fBXw8dAmi5wsVMGJEUo4xk32TVdNnVv7w08Img+?=
 =?iso-8859-1?Q?XBnDmpp/V+JE/QyaeKj2h7PdXHiFBrDhdsqoclJA/fAs5CirdoXMkLe1Rs?=
 =?iso-8859-1?Q?C/KSPeFMe5XA/IRLLqbHmHUv2Bj95+bvbbKsOYdajsbK1BLkTPzkDN+whW?=
 =?iso-8859-1?Q?pLbk6Ne/sFQbwL2OR2/BHpr+IHP5vPUilhgp6vumoHgvkdy+XOFNHom7vK?=
 =?iso-8859-1?Q?9De7cRsWWQyP5EDtZ7LibD88EuNBqHvC63P8zfSDKmxqnP8aJTbbVD8RlX?=
 =?iso-8859-1?Q?aPA4URI/IZb13A1d/CltDWsTIanU8eE18ao/cN9pt5+LMAue2z6w4+iKqU?=
 =?iso-8859-1?Q?7Q8NmHfJ0e09O8+qzG+YbnxoOlvHA7r3k5AUt3lEBZj7n/qnC8iLkoG3BG?=
 =?iso-8859-1?Q?2EgXJh87svwdBIL53C0ECJRK50yRnTfDey9PFm/+VXJrndRfUxKUsaFUry?=
 =?iso-8859-1?Q?phZFXrO3urcBdOd6AeAcJDrzK9VJPl9DEVNaID6J6lT1KZ0ep2/VQN3BoJ?=
 =?iso-8859-1?Q?ZBveNkj5TiTjUtCYuAOCoQIvQ1DVx6uzdxkfBeT+Vl6xXZ2HpBqWjJtl29?=
 =?iso-8859-1?Q?LUT4TDjCtK6x0oJwlO9Y9YhxaQOaDASJdJZDXhWVGqkNg6OEAezoNCnMl4?=
 =?iso-8859-1?Q?kt9op1JEYqsgpHHlFHRg3t+Gypp6Z43cIumDiMsIFJzmHoX3epffx+1jEy?=
 =?iso-8859-1?Q?22Ji+n3fdCuHg2eywbHYZz/i9m4sZipYIsqLodfo6YwKkFEX2iDynvWYeo?=
 =?iso-8859-1?Q?N1xZQkugnCVYl1N8qykQQfOBRknML8C0qufmtcIJ7xwDCsaf4CfQOquM7W?=
 =?iso-8859-1?Q?WBTPHeJksud9JLr0GSPfXj0qv50ulc4ajWFKyziM2496HZ+FOdTt0zcJxd?=
 =?iso-8859-1?Q?NNQlIvb3iwbXUjCBlKzMH5LcVLOdK2JMkMv1MKEM4A5cEcviZF7j1V21qk?=
 =?iso-8859-1?Q?VwR261Ayq2XshaGoa8Gb/OFOxifwrZqNjy+1tt6ISXXGI9pQorI8rF1Gn5?=
 =?iso-8859-1?Q?99gWasEvX/1l8fkC5gc5HZRb840R3cxlDT3Ug9lR3nimg4SLWP9H3i0g+d?=
 =?iso-8859-1?Q?8xJiXiKRgGrrpxgNnXpEVGJPyk5x7pWDHaKe4/KEVIKPOGo8/T8dSuAlxR?=
 =?iso-8859-1?Q?5S7X1BVNya1UlkCrCzHj5IZOSax9riOrETvkQ7nwr2ARQD1YRJbxuaBECc?=
 =?iso-8859-1?Q?tly6d+dZ3NnKvbxGj2My4YVAjy8CEBw8VebISr0O5v+0/HWyl3ZvYu2oXH?=
 =?iso-8859-1?Q?rClG7fFotC4cUlxAl1Gumbirz1FoOud4wkBKo15L+ZqeopyeLFQOl//Zuh?=
 =?iso-8859-1?Q?feedIKU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XUAc0v5VpFkdZZ8ITIX6uofzuK/RJSbKSeJpvguZN+g8dwZdGQgx++TJs/?=
 =?iso-8859-1?Q?4uojpdvepmxHV9b+FCgVb8rKpR/2r3EidPfZ+NyCTovU0LDGK8WA0rVdLc?=
 =?iso-8859-1?Q?XyJQgG3j8jsqlTVlsM5ouj448JYqRCF0vhdZsSTMYrNMg/X+1mfuFbWekG?=
 =?iso-8859-1?Q?9tfFSJqkh5ucCPS2ou8T+yd/MXyQtduzxwAbMiSZNlCnaGUI2V4S4wbplU?=
 =?iso-8859-1?Q?s+OWrfAHMXrOlHDKwJYD2j7HhGG59dec2enNQeSoAZnhxIina0gUmadx28?=
 =?iso-8859-1?Q?xBVHNpDUwEhElM4aNbyPMFQItu3G3DeCETrkMMod3xqcaEF+4YMEB1mnLZ?=
 =?iso-8859-1?Q?Ltb340MB+x1U7TIzv0dcNSjju6g9wKPlkgC0Cp9iEyP73tXc/F4JHGdscH?=
 =?iso-8859-1?Q?R6kk85rWK12dQ7UwL9sCZwut9DiOrlpgTbnh6MZJ5SkFeQLQuAYSWHd1kP?=
 =?iso-8859-1?Q?/ThEz8Mvc3j2eoIHNqd4ejFwBwi1jqhzZWYClg2wlIsUcc2SRTdX+zrpP3?=
 =?iso-8859-1?Q?co/I90MQhiXrRoRX/7ycKxZQFu6F0V5CccOD0m57xnhb076Yvib3gOIxh6?=
 =?iso-8859-1?Q?EYLm8cApgqq1q9CHgmaPBjxmzhHYY8rx8FidIJHiPbhY/NkEP2YYeqd0WY?=
 =?iso-8859-1?Q?ZxGCs7GMiKsv7doeEo3F5S3oRpQmAtnZ/rbcQS+h2W79+jCZjFYYn5Q/7h?=
 =?iso-8859-1?Q?8f6T6TYIcT+MIJ9PT+lYpMR9ZESbINW547h/uzlAUThbKHlrdiM1tDMdHM?=
 =?iso-8859-1?Q?mSap6Qja3VXG04jN9d6F/SWiRCoz9XliPLxZAZy5/UqZ9dtkaJQ77mfiFF?=
 =?iso-8859-1?Q?CR2Q6HWb7c1xKvNDful01OpurGHpJQxd9NTK2r9P8OlTnlHBbJ1Y2coHvq?=
 =?iso-8859-1?Q?0D+qC8aGD96TMna2+cV9jDVHMqE65/ZV3KcvUTuZ9Q0CKG/xDH+aiDsJmx?=
 =?iso-8859-1?Q?UpfPHiEsElN5OS48Y/1jjd46rF4N5s9jncDZyHV75IPEHp+XowK7+rbk5O?=
 =?iso-8859-1?Q?WbKHsSsA4XwoPeeTKdn5hr5Qu8d9moS0b/uBxObSa5SjIodaYIt1Q3WljL?=
 =?iso-8859-1?Q?JFRiRyfiG41IIK6jg+6IVlB6gtjURrzuV3SpjumScJLgIMiSl2tOTvZzhE?=
 =?iso-8859-1?Q?mk67aU/Lq9R/Dv3YK2yMAO1VTCe8gi/VtGHjsb5J3Iba2esPfl760dX4h3?=
 =?iso-8859-1?Q?NZrcEWAKqo/jqZ8pwXNmLpucpRuZjEy8lBfGmqnJgZ/NRteeGlfC9jRchi?=
 =?iso-8859-1?Q?DVuzgjAXvPON/nWCA/ODIpTu8VCuqndQ2sbm4MHUoMqoazGS6euD0zPqFb?=
 =?iso-8859-1?Q?tupl/ey+scMUB1XP8pQgDxvQJqv7/uqLs5wcF1TgetxQI95ZeGT4w72uLc?=
 =?iso-8859-1?Q?wL1jA109m0mZ9ctPnJ3IwHjna497XOZIOBI4jYxPOzBnDbnFulmWTPnBcD?=
 =?iso-8859-1?Q?0O+YCk8s+RT8Tgfy+rM/fN/sVEsIgHjtEVtQaj+wAohrWq1PYN6A4EewRB?=
 =?iso-8859-1?Q?XIFsn7x/XgCmfXvmFK1EfxQV+6rtOIcD99IQNMG/ZPT8OW07A7abFzGTI+?=
 =?iso-8859-1?Q?xT7dKYg93/j0mjli475o4/AeAkq0J6G8jHHEehV2k4hx6GjV/ybskpKJGS?=
 =?iso-8859-1?Q?bi3Yar0zKFCnBcaGsBHFbD966fnl0OpLRbOg89TyTlXX87PXXC6KO68Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0e1d70-b1be-4e55-d827-08dde09ba902
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 10:15:31.5993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJQkvS/+DaDA23FO/fGqint5mMnkXbJfL2HWbywq7fpNqbkVy7TZp0FmEW+9wbZndzuTt6JFELUiWpNrdqahWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB8021

Introduce an additional private data field in `dw_pcie_priv` to allow
vendors to store custom data without interfering with bridge->priv.
Also add get/set pair to make accesing that private data less
cumbersome.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2->v3:
* no changes

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

