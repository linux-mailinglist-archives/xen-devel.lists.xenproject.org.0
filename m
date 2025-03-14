Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FB3A612CA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 14:35:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914592.1320354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bl-0004sx-HQ; Fri, 14 Mar 2025 13:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914592.1320354; Fri, 14 Mar 2025 13:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bl-0004jC-9H; Fri, 14 Mar 2025 13:35:01 +0000
Received: by outflank-mailman (input) for mailman id 914592;
 Fri, 14 Mar 2025 13:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/juS=WB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tt5Bi-0003qF-Ij
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 13:34:58 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e96aaa1-00d9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 14:34:57 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7950.eurprd03.prod.outlook.com
 (2603:10a6:102:219::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 13:34:52 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 13:34:52 +0000
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
X-Inumbo-ID: 1e96aaa1-00d9-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2FX7YtnXU26EmXw/Wcq3gqtxohaEsdOEEzYUihSEr2JptRQgcsbs0OPkU2TFZMMn/iKP4WI15U7+W3WsVzzObqMEMSdZMMKZLQy5By40j8SyB2S4Oru9qHrmxcA1FLF/AlR/vdI5J+k30jBleuWjgxgKFdxo2RvV5dZnPcoVEruW4s+g4uHWaLSln5CnpkDEKGJFkm5sZ5hnPgstV6OAfQ16Kv+CPAR6MJngBM07GscMISgUGNnlCCpaeVo1rtHAE5btDEjLz5PztUDSsOedIXNbjWDgp3VaqOO2S/5pUr+SofhLCURFz9bwQxlRilK/r4K6STMYgAIPSHo3YvHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXb77dvoSIicJfrdR1ZABgIlCW7Hf5cEU2GUFGRcKJs=;
 b=a70Z1vhPh9s90UPkohH0swHYYL09a60pav+8rLKVcvlDKAp6XeBT0mSdCP871BmN+Jnzh8A8YFmzW58Z1NRtC1aJy2+2Y4cnUMQT/eqQTatpHDNvpZsWqYO8n/1yZ62N2x1h+paK6i7L5ZfTL16H4r0AZAFFHq7iUheEOcFfEuXIw3y3Hm0QBIEJ0Zfz06DVZxIn2mdF1sYViWLedod1VYlDC+bn3FSpSwvjv/2vhK9d9iPlQ/waDPPPuLvzKjzmJHNnZQjYebGYJBKh4OggAc7OYK56SylnJ4xSGGhDOgQlw38Zzy+9Yf7gKEOUqXQ8YHCYY3DBjW28ajs2vXeFWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXb77dvoSIicJfrdR1ZABgIlCW7Hf5cEU2GUFGRcKJs=;
 b=L51lqS/Tig8lD0J+hSSBEG/AntrmeIP+gGpDk56gZxK/bFU6xKefHM0I3Z9o0ObZFtuyNAMWWahVySjLIDXcpKXfnxLai800XKWFsy5glf8MX8M6bksyxuY1jAXMkanQq0KV+3858w+TcThcFVrZd8m1Kl9QzrBzxH0iO9wtwJBI8GQMSFD/kPJ98Zzm1G7aQdL+DrGh49db5QMzILhzg0bgTTvPW5oE2vhGfJRza7ZM80VH/vxopcMGhus/DNvbY94FxMHNhNA8wWuZr7F1DQsbDuelGVRnXnUI3JzOHYz0oze3InLMKZgBLRuMq9RvrjEmRMQrtTjkK3Uura83Ew==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v9 6/8] xen/arm: Fix mapping for PCI bridge mmio region
Thread-Topic: [PATCH v9 6/8] xen/arm: Fix mapping for PCI bridge mmio region
Thread-Index: AQHblOXd3SOsXym3+kS43vL/VEJ0fg==
Date: Fri, 14 Mar 2025 13:34:52 +0000
Message-ID:
 <06c0eae067d00df58a47dc1506d8624c8ebc52d5.1741958647.git.mykyta_poturai@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1741958647.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7950:EE_
x-ms-office365-filtering-correlation-id: 7b8a5f84-4a62-4cbe-0f18-08dd62fd0022
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?G3iGtIpdIrtKpnYlLn4R95JUAsGTn0P7BY0Hy2jFrDcYfQIwaePmNdPJ/z?=
 =?iso-8859-1?Q?HAnhxS6gEnTUR23rQMSj18VaCvvGiyQpvKEI+h9LoDAIf/pab4+mxqSDBB?=
 =?iso-8859-1?Q?WpGiCPIVYIioJLNPZojRpjyyHIONMs3kLtnlLUFuBiUqHHQsd+pe9MSbXZ?=
 =?iso-8859-1?Q?Zs/4LRB/HoH4j7pom0rODcrccAVctCE5jazCgXHcBZ4XXuJK+BDZqDAIC1?=
 =?iso-8859-1?Q?pTW3T21SH95ykPwQ9IW1vl4+aYzvec9qnN7J5dxt0BcpkBQ0GXRlJChq+Z?=
 =?iso-8859-1?Q?mhm5DavJk5OkT5qx2z+PHQEz0VVL472x1LWKb0kcZU0pLWtNwTUSUI/Ih4?=
 =?iso-8859-1?Q?6wJefhRcXcXqVjX74Jsel7RicaC94003cSOEyiqKAcvOmBfzE/3stwGtlQ?=
 =?iso-8859-1?Q?FH9ZzfIQ6mHr8KVKFNs2XpIrx1jYja98Ta0YPnlDhZC5m5f3NJegviPf/u?=
 =?iso-8859-1?Q?+LYSxbr7M+acqEDnUwQd5mDJUD730/k9TxJNdXryq7IIxizNVpe7GlkI78?=
 =?iso-8859-1?Q?vjcDijRw2jpywyBq555gHSwVAoEa6xJYgs0XNVBqvyAF1dJxaYC3dEL+uj?=
 =?iso-8859-1?Q?KrT4FXCwdycWn4bh9Dc3aO8/sX3VmiwAAGgdcpPaTNuwELKNYLr5tC7mXe?=
 =?iso-8859-1?Q?mX6Bli4GDNRN6SSqs7QTGp+gW8pnwNfDMckFG7kWR3ZtLSlvL6h2gG/JLF?=
 =?iso-8859-1?Q?G2eYzvnlA7L6CoRXClgCaKiXtVg7aFnvD7FTtVWxal4FfqkhxadOuiZ440?=
 =?iso-8859-1?Q?+T9QiRS1mi1OMfdNSh1X9w1bst4/j0obNyi7fePeqNMywJQlNK65JgOSmt?=
 =?iso-8859-1?Q?HYKhxMVZLo1Kzpx/6VGYjJIvzoWNBvPWiXsQ3SG/6wDHMAp7N3fYlQvVFa?=
 =?iso-8859-1?Q?ZdNxGHao80E3BcUr8+IY22yHW0e0TbYvDj+azLD5as8cRNgUlSzXxi1Af5?=
 =?iso-8859-1?Q?KeeUsiY6Ysw8uu6/702XZ9YDRR+1bLB82HulkL68aXhmI0iMQT3b7Dp3BQ?=
 =?iso-8859-1?Q?ETDJIpnl4fWd0/QNAWkQc8rQKDA3yq0LvCmWDiLPI+Q5D+icZTtdlo+W/y?=
 =?iso-8859-1?Q?QG9NJmo+BRRvBvCofJ4V7VbToCztRT+My2otDa+GYLyhdHCV3iIuc+8wOK?=
 =?iso-8859-1?Q?KlQtLOYa615wDgjvgd30Gc+v+epLzo50y0DH14MJIyxi8BHOt13Y3MonjI?=
 =?iso-8859-1?Q?bW7GRzTciGojTOl6WilJeGLuBZ0YTY7ZxdbGnE3jUNx8CTUlnQBK74X9XW?=
 =?iso-8859-1?Q?RuFRcaUNqRZoMcDhLhQNYE3sFdUlH2eRrJNsgNXhiz0ZoJ+DqOQQ+hSp0E?=
 =?iso-8859-1?Q?ScCcM2uneXBfR+67Yoy3SU+gfBUhw8BqcsQdw8cJPyq0edU4Du5HVn3uQu?=
 =?iso-8859-1?Q?htDzejwlBEnbIrpWcYt+e94mV3XsMvj7PBnsvtTApi9Ky9SlUdZJtE2vk3?=
 =?iso-8859-1?Q?2Fp+vFdBgqMRl89Udupqu5zXDj++BN9mA+lR+FbrW1PsH+TII5A4gN3UxT?=
 =?iso-8859-1?Q?zsfipdw+UVFF6Wlrzde2p+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MQcZVenzu2tDSneANZom+omF8QOyS7t5FEvHhQ88txaK1eUn8EqXQs9W0x?=
 =?iso-8859-1?Q?VwVz7HQcvVDlee4cfFrLoSlm7K+emflsE97E/PBKK2FrXYrHFqsiIabviG?=
 =?iso-8859-1?Q?V12XbqqC/Q6Xbe7pUuvqg+0vr6isjS5tcuJgZspzq75JWRremsagV8v8hY?=
 =?iso-8859-1?Q?l1Uj3V0GNKCDcwc7Eu/QmsgaH2pCONxoII9rh+odnjMviFGIWsAzogjf0s?=
 =?iso-8859-1?Q?27Z51CtfuI3x8nqD4aWZOGauz5L6wSX/CUpe+aVqKETEZnGhUCDcdCWsFV?=
 =?iso-8859-1?Q?n3yF4JyYGvJgzu6h5sOt8x0PO2Rzq34i4UYyaHTUlOSSMzyb+oXwElcZgN?=
 =?iso-8859-1?Q?9JJKLN3BuGR8Fjt/nFrwKXfAJyj5E9nahhchdFEf0C/WGqWzJl+VsEdE56?=
 =?iso-8859-1?Q?oaXCLykq7jTk+ignfhq87DTNjDKo0LyW7c37BXGW+EpPpRGUmRBbxiyPH4?=
 =?iso-8859-1?Q?W8BoBBwaaAyz09GQusE1DmzpqT0z02VHA2biW06hYCOiMa0qHv5lgA/D5h?=
 =?iso-8859-1?Q?qkprjR2YvldHouHB3PgEm5X8y5Q2woG1Pm76IOlD5RJQ1nT7vUgLOO7L76?=
 =?iso-8859-1?Q?mJrSyCDFR9e0Jn64/rC9ERVoghb7yxF2O5niVC+tUpxBIVjycSIU4n7iPw?=
 =?iso-8859-1?Q?VPjx39HUqipYH0MHYOVqURUZNxEcXmG2wmN3cuBdgRl9IzhfSkYKQdKiP7?=
 =?iso-8859-1?Q?E8/vMBU61G8jmXvdwzqp8GcP3oECo9LaaO0/nMuDzSQ/E7y/btunwLkcd7?=
 =?iso-8859-1?Q?mm6HZojCItCJwnciH3c5ZFTQ4IXAcBVVT1wT5pHl0msUTWEq4jmfaAACql?=
 =?iso-8859-1?Q?OjcUFSwHOxI7xW3DZLCw3vsr416BfRaGv8N/VQzFSIk+3qZuPDW/aGlfCB?=
 =?iso-8859-1?Q?ghJMlDfkq/SiuZEort4ZHvhJWxy5OGxO1v/J06XxMnjzVX8x24ik5opP8I?=
 =?iso-8859-1?Q?cmMEltGrVbAJKuPph2w2nFitdLnpulkgIAIlZR+PCMZCJ4/YxBMDmdzvjj?=
 =?iso-8859-1?Q?0rewvn5KPnSrIEfIYrXP3/szinG86HOHTFkFUTTnFplbQ6eYUBkGSI4xmQ?=
 =?iso-8859-1?Q?xQRL7NVDd9/N41isQ1/ZSjLDuec61zbk58rwcM4K+9fleaoWz3w8ajwQu1?=
 =?iso-8859-1?Q?DxErcgqE+cbN1jZTyOc/Dm20yuPS0ANECgipT0CPQRfZaUwgIeyhQrte0E?=
 =?iso-8859-1?Q?oE2Co4/7nV5BofJdAItrWNxjA/dLlywTEiSVVh6xf0rVOU8w5ey3U3Dmdw?=
 =?iso-8859-1?Q?GObN+n5/lThDqI+KJwJQzJ373Us1OTEA+AndXGeBXaOVFxRxzQ1JFJDtl2?=
 =?iso-8859-1?Q?Ez7Qxpo2pGz1/2oKCuRES/5La2mjZt8AdevmL0FhbEcDc9k0hDyPGUL3MR?=
 =?iso-8859-1?Q?OTPbQt7DPkEOCe/RIJF6g+rBaohOxMJV7o42kjKeo//3tAu7spVFQSD9eG?=
 =?iso-8859-1?Q?77Je4nGPCGnJOsD5iABzYpI2BRCDwV81xbr4eAY/+JTZVaS2YAJ3229/vM?=
 =?iso-8859-1?Q?ISxYdDSfnELAU0dJXiy8/tzomCaIv0dEpczXtAMF0AqWe1sDnl5+EDvJ56?=
 =?iso-8859-1?Q?v4ixBjLk/7KZH01JSO8YKikYsbpz+owPVwOQYzCuXJXmZkJLKFKPNLpWBo?=
 =?iso-8859-1?Q?w6NeAXNIptyNj7CDYwUAD+VGDaKs9CIiMD1C2ZCf0dboVo6KR8eyU7LQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8a5f84-4a62-4cbe-0f18-08dd62fd0022
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 13:34:52.4598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: evY0Ns7NWZkJvQYir3T4MxmZN5ZFhf6+J6rRB4y9dP/n1EEDag4CXpCDOPFUYHdTPOm2z9GFPvR8hyjX7Q5FGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7950

From: Rahul Singh <rahul.singh@arm.com>

Current code skip the mapping for PCI bridge MMIO region to dom0 when
pci_passthrough_enabled flag is set. Mapping should be skip when
has_vpci(d) is enabled for the domain, as we need to skip the mapping
only when VPCI handler are registered for ECAM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
This patch was originally picked up from [1]

v8->v9:
* no change

v7->v8:
* no change

v6->v7:
* add Julien's A-b

v5->v6:
* drop unrelated change in xen/arch/arm/domain_build.c:handle_linux_pci_dom=
ain()

v4->v5:
* new patch

changes since picking up from [1]:
* rebase on top of "dynamic node programming using overlay dtbo" series
* replace !is_pci_passthrough_enabled() check with !IS_ENABLED(CONFIG_HAS_P=
CI)
  instead of removing

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00483.h=
tml
---
 xen/arch/arm/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 5610cddcba..25847d60ee 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -268,7 +268,7 @@ int handle_device(struct domain *d, struct dt_device_no=
de *dev, p2m_type_t p2mt,
         .d =3D d,
         .p2mt =3D p2mt,
         .skip_mapping =3D !own_device ||
-                        (is_pci_passthrough_enabled() &&
+                        (has_vpci(d) &&
                         (device_get_class(dev) =3D=3D DEVICE_PCI_HOSTBRIDG=
E)),
         .iomem_ranges =3D iomem_ranges,
         .irq_ranges =3D irq_ranges
--=20
2.34.1

