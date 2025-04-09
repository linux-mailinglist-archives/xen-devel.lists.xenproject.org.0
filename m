Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1403EA82645
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944042.1342630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VUk-0002Dx-FU; Wed, 09 Apr 2025 13:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944042.1342630; Wed, 09 Apr 2025 13:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VUk-00028C-8o; Wed, 09 Apr 2025 13:29:34 +0000
Received: by outflank-mailman (input) for mailman id 944042;
 Wed, 09 Apr 2025 13:29:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=scqd=W3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u2VUi-0001T2-CQ
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:29:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f403:2612::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab780459-1546-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 15:29:31 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DB9PR03MB7468.eurprd03.prod.outlook.com
 (2603:10a6:10:22d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 13:29:27 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 13:29:27 +0000
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
X-Inumbo-ID: ab780459-1546-11f0-9eab-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGQkVyOlanR6clnxaAUDfiTGB1L6eKxWv63LtZThFfr7QCCLPqzeUVQoKRABU8jYqRL0cvEXACJdStgDSemkoOQfrya+oEVBjUD3NrWYopLK78A0doMFHvOjXeMGJB89oYCV18sq5GUO3fow2zSDlAhfiE4DL85ZST9K00Is9dI2YVVej9S27vpx18sxFVdf4/WjxB6MldSCGXtOGDkUvPb6OE9BW5cybaswqK6POt1zGMW0kDF/+ZDhNHJAGljMZVvRnMBrTTfv6G2YoM3wgP7ZUVIeFwUDA/w455saz+IDMSpOYa+jsd05D4STClUcaGQcedt4VQ66z2kqcAYYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mcb3OVAU2iS55vFkQoEajm7xT7k3icYGgVNKzOXMQDE=;
 b=LbNJz/abPNRWP+AAq86qC5oCgxqFouaSOAQvls14nSRHaxxzQWVVeUFNdvcOlJBbVwwuQW1/YoZoN4QkCWSY2QNx+CejsrQKmbNtJPX98rvXOo6dsAwBFcaWbEIgDXymf2q++VeQExp++ocivNUp0zFQ2VH7K8jSCO8LGy2rU+x+/GgbFolcoa6gpHfgf2QtN+HwuUhUjn/p8vGMs8UbLwC28Ih+GPCa201UEhV38w9QBGpLKskdr+ctTRc/kDSM3YA6S+rTQO1Oth56Incnv+9bbuIbVgyw6W76qdE+FqhZqfkuP4Sw70n2rNcJ+4U5BOU1jygssQDUNLZHSR4r1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mcb3OVAU2iS55vFkQoEajm7xT7k3icYGgVNKzOXMQDE=;
 b=H3KDZuRtUzuXQDM5X5GyZggat8ertJnxMcn58xrJd96HvCYl81i1ArkH0d2232l8Dxq3jw1uHrUq1RLNuQccSTSbRRpPn3gHNsm6A5la6tF5eiaRDtSKuYxwaDjEQ4QN0Z8pijYcZiwpj0p3HslEgBq7qCldW7KwJYNg3UvnZZXu++u9rp8BhGQsHW0DuHX+bI6vcOLHyLonKHn7qNMsteBmRnk48DfxXzXrlolMaKr2vl7wuE+oHUL/o6MDPPlIdkoGGKGtlDx8ialXjPn5++OoPrulgKQEYWtw18iHcFk8fiip6GvfQIithh8raIHiL2LzSiAjttxK2tEtPObObg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v3 1/4] xen/arm: allow PCI host bridge to have private data
Thread-Topic: [PATCH v3 1/4] xen/arm: allow PCI host bridge to have private
 data
Thread-Index: AQHbqVNqGG2BsgJGTkebsT5cEBm3YA==
Date: Wed, 9 Apr 2025 13:29:27 +0000
Message-ID:
 <d2e51d90af19a790126e0483f2d1becbfdae2a30.1744203405.git.mykyta_poturai@epam.com>
References: <cover.1744203405.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1744203405.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DB9PR03MB7468:EE_
x-ms-office365-filtering-correlation-id: 007adfdf-614c-42bd-02e7-08dd776a8cf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?b1FcXIPUkh8P0OH4qeh3oqXwH8Jm2hsaJLVY3voN5P9lxKa+bTTsuovKsT?=
 =?iso-8859-1?Q?QhIW5h89Fcxa2EYYG2I1hxzVjigOcRFkXRPGi5o0cxBS0GGPyMHQRw7GSJ?=
 =?iso-8859-1?Q?x0sQKKHehN97q9ii9QNQuy3mx4VRq9ZPJ40ofZ2pBOe5PDyS/FlcVOjigm?=
 =?iso-8859-1?Q?HD+aBwVlpCp5C/7zJOFLXUXKhMGyydHgW8S/2DmUQPKEzVKRWVAmHf/ZJ+?=
 =?iso-8859-1?Q?jSs8CcWVSwjnjxl0z6tBki/uf7CbKTx3Y9TfqufB4P3u/jibrguTQ6gMDP?=
 =?iso-8859-1?Q?gJkKTB7NiyKI3tpDYHHkuD2VWAQ5eLKTdJe/jEVhJ1rhKD/njq48IaJPTL?=
 =?iso-8859-1?Q?qWIbtk/9D11K39n1B50+lZpCCd2jvV/PBLiQoxI21WarhRjV3aQ4LrtAhC?=
 =?iso-8859-1?Q?/hdb8AiUdFSPYoPVyxzdIJ+YxRdbbpqF5ViJsO1rg2ty4oNTTxsmyZRMCR?=
 =?iso-8859-1?Q?M23cfyloD84zZCaExsyLEVqZJznnrArDvl6xOvP4piJiP0wQyzYWmQGKIT?=
 =?iso-8859-1?Q?1Zqp5A5aBW5qC7j7jk6sfepYKF4McihnueRIGgxsxFt1DFtP6jCGOJzykc?=
 =?iso-8859-1?Q?6onUxmMKgIhSP8FenH1kTEAdVCWVV8/N9ynaVwvEyffrYGh0FgahNM9EdT?=
 =?iso-8859-1?Q?i+mugqPCLF8qR+XIkm6AnWrSaluPwsrfyJe6u4nRTyGx+I2Mou8FH7K+2U?=
 =?iso-8859-1?Q?pFLL/oiX19n9VK2RKoH6lV/ujVOfRM6AB/NGQJG6lH5hSxvccbOvldHUcB?=
 =?iso-8859-1?Q?lXv/umSYx9s9nQV8z1qs2t/EIaE0lBAlgEDN3QllYW5qyFLn8NAV8o4NWp?=
 =?iso-8859-1?Q?OKDSxLhAfFKCRwtuG4W2hzlJnqSpY2sp19BfT2QmgAEX/qllq264wFbc1i?=
 =?iso-8859-1?Q?vg+yVpOdT/cYFXGOdII3s21FDTp7KkpxWea2a2N1pDUmIcF2No7qRiB9TR?=
 =?iso-8859-1?Q?f17/Os/OkAcVcTkAr+mJFqGzWmIJEqL8/j48bNplhC/QvuRxMsyH6z0KD5?=
 =?iso-8859-1?Q?SD61xbT9/Lq8kPkixJ8bfyENddBPofoqgm6HII0jiGLahuzoEgFcF+8V/7?=
 =?iso-8859-1?Q?3Iw6dSEQnkyHwfy4ZhkhpL+7EPVcycg858twqqAgDNWF6mNMOY2ENgyZ3H?=
 =?iso-8859-1?Q?EvZj9Fzun6/xcuIzL4CL3tjSHioBWrlEfzVw/yb0Qu+ssfWpLEfdQUfiWU?=
 =?iso-8859-1?Q?lsPrU0JpIQRepzzyA4Zd0Ewc1pfnkf9MGKJo/U7pYrql7KhM1PTc0FglB1?=
 =?iso-8859-1?Q?q3toVVSmI1OA+Clnvkhp2j1tsiqYFScfjQ7pyIipBWS2YICkr4iH1q95c+?=
 =?iso-8859-1?Q?ge7kC0a9/1zpI1Cfmx0bSbgL6lB2P4ok6M3aCUbZgIq8Llk11J0nfEuTrN?=
 =?iso-8859-1?Q?Qs8pllXzR4AKP76tRUHhuF/BvWYt4ncLXQA4USxMFUeg78whEZa9QGgQhF?=
 =?iso-8859-1?Q?ZQb50YWdLwcsN7rhkNx1INrj/Tcp7t48/LgQCEKY6wk8PHSKzVudft/6z1?=
 =?iso-8859-1?Q?bWL+NtYU4YgH8NGhtlWiod?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?F8/yty4eDZ6jF0KfAY1JxoSXnedlR2WgaTAh35UUXHRJZ+pjSW86guFGGm?=
 =?iso-8859-1?Q?W5X4Lamp1pIvjfULjjNH15oafDEwBi2HfH5qstkXRgt4NIx+0dr16kXRkJ?=
 =?iso-8859-1?Q?K8eNwqqYgCLNGPLjkXEYrwV2d2nFLjKf3NQ6IYpN7St39jdCQAf2InZ5uU?=
 =?iso-8859-1?Q?7zFGZo9hEfHLrQEv2+ZgCcALameUUfCA5fB+9v3zuQB+HcBX7VDi4btACi?=
 =?iso-8859-1?Q?L+u+Jf9Y3v8pxqd/WQ6MJAAAR3G96QQj6ld6nTtcAivuNmClFy1ig9jfi3?=
 =?iso-8859-1?Q?XJ8Dots8qCkyXZi1MM9VcKp5C0YCkEDOTlxkF7yyI4iTysNOi4Irn1HQm6?=
 =?iso-8859-1?Q?AF8SQVEi3/uNBovtiFIFLoSfSn6/+uhQxfGgFQtuEmfTWRIdAp8JQZ40hk?=
 =?iso-8859-1?Q?I78n8bii0HP57HUxgev8m00KCxJntFXLjmPCUSENcIeDDKBbGnqkYXIZhG?=
 =?iso-8859-1?Q?1aPKU0XFFelPS8WZeq/fKDHjeAdvtMUOSDQNi4oRiSKLovSTlcelU0V5cU?=
 =?iso-8859-1?Q?Fgq3ZgziFgH4UqxE/6IgUl68l0JUT7KlitVxhKQ6agoNyHbILU2HTtnmX9?=
 =?iso-8859-1?Q?hIEc4KdbvasWoWz4AZPRJP4OqH6VQR3A06BwpLJuUwLwUkLeLWosfb70Se?=
 =?iso-8859-1?Q?AHMy1PZbYZgwyxuPk4tcCKofjhbGoHV/nYPCIejaVRXBm5FkjiE4Cerf4P?=
 =?iso-8859-1?Q?TSNINKYjSWPlWTUSI1lmZ3CId+ExuxrS3Rd3ye0y5bTZnpOe7qA0CKpT5+?=
 =?iso-8859-1?Q?nPJzgyjI3cU9o/7V5MAlf0MXYUxgPHHa3WrjPn7se9bL3RZv7PHWNyRLNK?=
 =?iso-8859-1?Q?paMtlSI6eF81F8eGRDjNsSAhHP0L3J5BUStI1rmR1JBdPyTCtvMVHsIuOw?=
 =?iso-8859-1?Q?QFoZ9R9Bc9ITwlDGC44kH2J5Uy7sGly8sHqGCequuDm6lNNXtTs55kkWGG?=
 =?iso-8859-1?Q?LeSkIIMXv0WxEoyfRMDPKC6cxW0VODG8dlN8MGqi+rN9gbl+n3Ls6j3UG/?=
 =?iso-8859-1?Q?4tyouYd+TtYzwkRFC8uyQwfJnwEv6+ijO1dumRO+Ma2Bi9A3r7+dD0PSEB?=
 =?iso-8859-1?Q?utOjNSfRrHzQTpo8kUlTrhACRTHzBz6VwuLX7n/GSt85vUsr8PGtuzxr0r?=
 =?iso-8859-1?Q?vCnx1V7fM2R4+SL1v0SagltqWPCekE5+lyYw0V9jAS/xOVefd8QmwkcwHI?=
 =?iso-8859-1?Q?uDO84aoNczoE/3bTs38hbZ+v2ju51aqyXvedzvcgCFxOo5+L6+jio1XTiv?=
 =?iso-8859-1?Q?qkDu3wN1+x7YfQHQfiwWXYyNdd3yFOV5Ul+4855PL6nm2xtes33ZXsyKdt?=
 =?iso-8859-1?Q?rf8UAjw4PBVF/kd2MI0UwoKyfJjnaA6B3S0D4cIgvvJrbha9ouRGxkvT2/?=
 =?iso-8859-1?Q?t9HMCb1vVueTEp48wsj9ZJJF+JDS/BAjLxQWHqbchYRy8VtDWuWTM2UmhD?=
 =?iso-8859-1?Q?JLcJKZwhe0CtMIRR3OPdXX/yPiTMEuYI4icfBhf1QCfKvK/ZREdFkX6BcA?=
 =?iso-8859-1?Q?wtucyeqIazPQOwHEdwn7g6xG71I03sKjeWBOpnvDwPjkzM0q7IGYEfogMp?=
 =?iso-8859-1?Q?Jdx3nc+x0KA5EMMfo1/vaoYRhuT6DJyelOzQIyoSj5Ov2dBgdCQySQzsOA?=
 =?iso-8859-1?Q?3y+pQMdYUKzSl+Val9YZuQvt03yfcMi/+C7i5AtU8ZHlSHJR0yb6UarA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 007adfdf-614c-42bd-02e7-08dd776a8cf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 13:29:27.1381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lsqS7NMccTv9ZXGsBB150mhS2NvJFFGqGzBuzK6wlem09btjhbh2AupZDaKE2uuztfCVuZVb+taQvWNZhSaW+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7468

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Some of the PCI host bridges require private data. Add priv field
to struct pci_host_bridge, so such bridges may populate it with
their private data.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v2->v3:
* removed priv allocation from common code

v1->v2:
* no change
---
 xen/arch/arm/include/asm/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 7f77226c9b..a87672d834 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -66,6 +66,7 @@ struct pci_host_bridge {
     uint16_t segment;                /* Segment number */
     struct pci_config_window* cfg;   /* Pointer to the bridge config windo=
w */
     const struct pci_ops *ops;
+    void *priv;                      /* Private data of the bridge. */
 };
=20
 struct pci_ops {
--=20
2.34.1

