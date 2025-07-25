Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 814CEB1200D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057932.1425647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLo-0007kb-BE; Fri, 25 Jul 2025 14:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057932.1425647; Fri, 25 Jul 2025 14:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJLo-0007iM-6k; Fri, 25 Jul 2025 14:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1057932;
 Fri, 25 Jul 2025 14:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGu/=2G=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ufJLm-0007Qu-2L
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:24:42 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a1c21c2-6963-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 16:24:41 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB7421.eurprd03.prod.outlook.com
 (2603:10a6:102:103::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:24:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 14:24:33 +0000
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
X-Inumbo-ID: 1a1c21c2-6963-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7X57ZgcN2q529q3LsyY+2FIaqaAYR49r9ibbldZuQtjnyL6xRnsUj3HP4Bmf+VGuQf/bWeUsxn7KcxmwglGL5hhGYKMpC7lUyiLbwELMWeqlfvmWWtZcxjQkhw1sSaHR8KyVRO7aqLEgaS/JDIHeG+Uug1erDrLfON64dOkQTQcB2YSURw+B+87AmFduZEjt08kOjUHR7MbxsQi4+LOOghgm2Ax7hff1wIu3dASCthbeR/TbqhOSrosXzOt2z4kLPmIT2dScNlX1FmMzQBrzwNi1DDMW3M+JNY1DVqYPArcpobwfwKjE1CmHOoIVkK67qjHQlcYSSHVcvc3oKh+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXWTfPytJbqMe3km4Un0ecOad4IAifHy9GqTYt3gIOY=;
 b=cJXH2kBGoNeaOW+zlV125VjCW4dT1AsPJQctwW0ZUeoKfR2oMI94NeINZuEZOf3KZxaI7PH5dcF+QwJvKl01ZF8MIC4WZBu4R61IZ+XgcVQ8yfq7NZDS+71XyV6FHtxU5XwHv4KmlN3kjrO2ZXaJ+JavSuZiuXaXJ48wMPmpIpKknqHwBKRKWqx39mPJ4F5BKbrGxJIyRd4yBKym0fR1lUlhncZRg2dUtWRzXUzxcr0yeluEYAa46qxDhsG2n0pSuS0kaO1+7xQT6OQbJPasiOWVjKRYHXgbbtC2BJe0LSzb2Oke8UjqViCpQSxHWdFHBv2UsT/AJhTfpKXc5eQoXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXWTfPytJbqMe3km4Un0ecOad4IAifHy9GqTYt3gIOY=;
 b=d74v+oovQam+wEvgF3j9xevpVQH8Ow2cgijgBmkgBIZs3oCNziQNQVvEs65xHy2vzvDC65VvoO0V6JotHKkmLhpGeLhdjumMjx4prkfG6aHDSVM247o/9PETnyhVZ06O+05AakYjn7TElrox8mgmROTmUNokGlUd6Kz+1hTh8JYQ2ea8SSeL0cmXbuwb0qFOq/oTOAXurcoaBDPCpP35FB1g3rGNLVK1RuBYcZnBEBJBYoFsKto6Quq2Jc1aku5YQxYDZMrhYyLa0HuynIlIgN9mujehavWifzhJboTkLeQQ7khDMbEH7QFRsG4PSh48N2leaNQ3/jwpy5OAtUpxJg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v1 5/6] vpci: export vpci_init_capability_list()
Thread-Topic: [PATCH v1 5/6] vpci: export vpci_init_capability_list()
Thread-Index: AQHb/W/Xl+AUyzxiPU+tyfGoelM0Fw==
Date: Fri, 25 Jul 2025 14:24:33 +0000
Message-ID:
 <288f53231e6328a840d9b1ce3d6b261a0c181942.1753450965.git.mykyta_poturai@epam.com>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1753450965.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB7421:EE_
x-ms-office365-filtering-correlation-id: af0d0ddb-640a-4577-06a8-08ddcb86f9fe
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?m2xv6lktYmdIruVXJehh/+r9WGKc3jaAKzfI4wnfAXgCYZs7pWqTggbziY?=
 =?iso-8859-1?Q?cXO4WIbm5QRuuSxA7In2C7GyjQ7x+oZnuwfOV3YXBKhzxzhsLaUXT4OD2Q?=
 =?iso-8859-1?Q?zXrMCy/LaUNxTcPJdn3M2L+maTLyw/xUDU7SUAmxZS3dQVmjVSBtI61+EN?=
 =?iso-8859-1?Q?hLK+bFfeSNuiidrsthVidFOm4OJ8vfnqQ6SS+zL5C5bajP5O+Z3Svz+k2v?=
 =?iso-8859-1?Q?CdM97mgrPwBtD+ImLqH/OlskrwvKn5/kvCsGzMWIrLJ2mVvVHjpB5uFUys?=
 =?iso-8859-1?Q?NLwSrrURLTXCCBF/SZV0fxz04L2cTgIX4cp483q9cpvgE2dKAQZrZhMWgc?=
 =?iso-8859-1?Q?eS6uf6wCo23lpeQpAm9DEar97NbCUZ2Huzbwzn0bYTB9HO2eTNLoCbKM20?=
 =?iso-8859-1?Q?P4vfhtA2M/CX5NEv1vatJhGvevJIdS6xIoiJBQqeV+iYxadofJcR0BbCud?=
 =?iso-8859-1?Q?tOLk42Cc1jGqBlFfVOUB5aep7vjNZXzGkletVwYlh2l+DVl4ikXAExQQQG?=
 =?iso-8859-1?Q?uegY2xvOysUrmOXPW/hE6F0L22t3iW8JOM6avN8NYO0aLRk6rlUxgF4nvD?=
 =?iso-8859-1?Q?INjT7P5skNi4qMK1sCLnRcNnNRSgZNWrOPV4PeYgAjmzClF8TbWaoztXgr?=
 =?iso-8859-1?Q?O7aSgay1bVSeZnNHrLlRRNOKYjhWSLM/afcNBad6hjldcKfqb5NAW4IVKX?=
 =?iso-8859-1?Q?DXPd5LDeF1NCqZHmfAA4iAPFC6RlDLW9Z3P5NjXNjv7fed1Gw2hcYiby3m?=
 =?iso-8859-1?Q?ZWWHdd0rwnKkdZd5rXsT0OmSUiVcooL7ipcO0VfkEtDQB7Bux2OQChUgCo?=
 =?iso-8859-1?Q?wu9/WCpA6w5Sqkkh/DXEWmYinix7JS5UtcNR6EN1sNRBxJt0LPFkxJjJOJ?=
 =?iso-8859-1?Q?fkT1KBtQvdip3zlEShrGFZFQNj76pyE40U+5BTYWi7oXleYYhDWsjgF31C?=
 =?iso-8859-1?Q?bFCjUxDMOobGOkklTplfmAB9nLxQ8fNf2zRf5gsyGdOKoTCU9A9diRuM7Y?=
 =?iso-8859-1?Q?kY0r3STQ48N5sMx0IA6xXhtUBCrt4BHIEhglE0miFs4PWL48wVS5p0Ycdh?=
 =?iso-8859-1?Q?qgpIspzEuiaTNGi/FNCMjQndCNm+rYVWh3NNxu4YBs9vXD9gA/1dsnUfkl?=
 =?iso-8859-1?Q?r3JGxG0nJm+4X3eaQ5qk0sMI2TKsW4Y8XUs6nVxmel6BnV7vZbldjjzgUt?=
 =?iso-8859-1?Q?bvRe2fkYQPYEO8990yDUSd9a3pyXV69nS6ifpAB1wcq41YhEWf6zhFU4xS?=
 =?iso-8859-1?Q?AKcbQPKHW6/AnBko3avQZW+GhCqJUFvu0ZORtHcLMFhsA7+xW6dJ6GsHuI?=
 =?iso-8859-1?Q?yBFS4vvQrKfdE4pHTNnlIq8lqRIbwYntzlt+dYGIfdveWBQ3KPImANIGZI?=
 =?iso-8859-1?Q?Nzq2HUf1PuMDCFqbAZ6rk3yGwc56670RPI11PKKgNvZkM14qFa2HWOR+Zf?=
 =?iso-8859-1?Q?Qo/OQHXMw4E3ntFqQkR3pLt8wfYkb011j0bQPqmEL8LyuSW3gGWNHCluDn?=
 =?iso-8859-1?Q?5Y3tQwrgY1vK7y6wI0e4Se36CwS/eyxO+aBOKJju6SnA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wb9+nMf/A07lW4G9nCxtlkmOyoIcjEwj09AEhqaVs5tArHvGK5ltHRCeUe?=
 =?iso-8859-1?Q?b12yUXruOYiZ4RaG/G2mLMhx6w4idZ9R/smdKEpYkwC1oS/YN7DqJ63205?=
 =?iso-8859-1?Q?x4ocf5AJtD9ymdcpHYKbmc7JHEtHAnimmMfiBJlgQfXN5IqltCgAU5WytV?=
 =?iso-8859-1?Q?u/+y5PBQptg4IOS+NRnkAi2qoeThHMQUlDOrKJk57RlhxFP7szwgGxSmeD?=
 =?iso-8859-1?Q?wDETUIfQ7jwcnYK3g+7smwXIkGBwL/wgMM4EgR5HvlTKRhNgFuUuHp2QWl?=
 =?iso-8859-1?Q?q+G4YHIeGFgSC4cbiUejHtcUXM99blucwVtumbsLp6MAjwdq+RiY4ZGLBG?=
 =?iso-8859-1?Q?zmm9qi3KAGOZM5y9tgIUF37YodzMAJd+bv3Q5t9kn6sw1i94Wj+6Zw35w5?=
 =?iso-8859-1?Q?57Z6us1WdNcAkgHscQh7sy/skooIMrwF/4LBQq7EcwMbd03DXKjkPDWx67?=
 =?iso-8859-1?Q?W8f+sVOhZboTeGYjQUkqLj7i+iZ3glriXFFRlyxCtvps+9AZqZfWbiOpsh?=
 =?iso-8859-1?Q?Su08NAXxYx5aJvydTuqZA+9nkm3IoF75M+0V3eqL5ldSKPe7N6QOVvk4b6?=
 =?iso-8859-1?Q?n4S8kPotSDAR5nyzKzAlWa5BAKS4vVA5I7h92lLftlB0PfersdNgkADEWx?=
 =?iso-8859-1?Q?4REYCgTDm3+GdXpY7ni4FzBdN9xnxIi5CWXbTSQVhULR2R8N7oOk6081Z4?=
 =?iso-8859-1?Q?j8h8DpuZp0I7bJOaPcknN81pgMBmZ83SULpVjOlKYFdu8sV1hlJ4KHMImM?=
 =?iso-8859-1?Q?PZl2N5TsgzGjW7jDdszvoXrXf71UJ7DHB5SjRM0s8sG6zpFPtczQ820W1P?=
 =?iso-8859-1?Q?jV++dW2hgWRFkaU3u9JLrVd5b3u6u+Tw7NT0gmCziTp12qA/Wwnvw+Spen?=
 =?iso-8859-1?Q?WJ4NMPZ2R7kfosDjK3JXleIKNhG5FgZgsRU/nRPasCvS3TOzl5vJf1vYsm?=
 =?iso-8859-1?Q?RYUDB4j3hR/nXhjHHSTE6VXKpQZ5bfekhQklorW+HMz4CbfXrdm/qJt2h8?=
 =?iso-8859-1?Q?8ZYH5X03aAMo/fxnPJSSXtndBf3IdJVaJvkxvPmK2cSPRyOlA8QAWfKfJE?=
 =?iso-8859-1?Q?XdqnckFYOGaWwYPCz4fu3Efmc+g5/ddXz4O/ttj7keCks5AxppcnDHySgy?=
 =?iso-8859-1?Q?T9FSsxTLrBKnj49TnIOT5GDC/gcLwFB/NaxOy8n0yfIDOtP1SZrlX8imB8?=
 =?iso-8859-1?Q?sY7AwCgGncVJfZ6h1qgIvvikPLlJ8KwvQPXy6bUbHGtfLhvjItxX25sUuZ?=
 =?iso-8859-1?Q?HqZPgAO7YRC587rslTJKdr+b0ZLhCdJgELXlTfmr1Nj/WNwVdNSPl/H4Xk?=
 =?iso-8859-1?Q?IEWsUEgS63txiCu3WkyCnrI5Vlgz/DfvPz/5ZcsieBnLdh59xrkOCnANiN?=
 =?iso-8859-1?Q?O9GqsobhOGNDvpV02U8Rsoxges3alyOpZ5JXJ2BKgUZ1Ds/qoGK9B776SI?=
 =?iso-8859-1?Q?fAu3Ohp0a7ohoZMNPjEfmb+GdJTSUQbkWVdurmNjsj/i3XyWnz/6UPrdgO?=
 =?iso-8859-1?Q?bKYjvSrBR+zU/6LgCXX6/70TExHFBxa/v5403FLq3I9yO8npSt5KHjhFLZ?=
 =?iso-8859-1?Q?m05gYbTAoyC5ayl/Gt2K4DM1B9WDVOrEPc7s8meFHQ2vUliLp7hvlh2kko?=
 =?iso-8859-1?Q?/fSLPrrNxcdS6miQED0dTD1692zBOYtC2j9gCs3I6JjJSigIruib6R8Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af0d0ddb-640a-4577-06a8-08ddcb86f9fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 14:24:33.5394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1j8G02Yd31cH2Y2yMKMq/2cx0BUG72o5C5acZUdu5k+Jg0rm+opGPFy8aK538XbXy1mjHrgE+KCdJdIoTWTrrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7421

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Export functions required for SR-IOV support.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/drivers/vpci/header.c | 2 +-
 xen/include/xen/vpci.h    | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 0a840c6dcc..ae44d6a73c 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -745,7 +745,7 @@ int vpci_bar_add_rangeset(const struct pci_dev *pdev, s=
truct vpci_bar *bar,
     return !bar->mem ? -ENOMEM : 0;
 }
=20
-static int vpci_init_capability_list(struct pci_dev *pdev)
+int vpci_init_capability_list(struct pci_dev *pdev)
 {
     int rc;
     bool mask_cap_list =3D false;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9e8dcab17e..b8fa93575b 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -302,6 +302,8 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16=
_t cmd, bool rom_only);
 int vpci_bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar=
,
                             unsigned int i);
=20
+int vpci_init_capability_list(struct pci_dev *pdev);
+
 #endif /* __XEN__ */
=20
 #else /* !CONFIG_HAS_VPCI */
--=20
2.34.1

