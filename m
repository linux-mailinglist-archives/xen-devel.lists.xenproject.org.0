Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0692EB420F1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 15:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108275.1458484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utnOI-0002cP-8k; Wed, 03 Sep 2025 13:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108275.1458484; Wed, 03 Sep 2025 13:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utnOI-0002Zf-5Z; Wed, 03 Sep 2025 13:19:10 +0000
Received: by outflank-mailman (input) for mailman id 1108275;
 Wed, 03 Sep 2025 13:19:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wznA=3O=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1utnOF-0001dc-T4
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 13:19:08 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91432e83-88c8-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 15:19:06 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB8120.eurprd03.prod.outlook.com (2603:10a6:20b:447::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 13:19:00 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Wed, 3 Sep 2025
 13:19:00 +0000
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
X-Inumbo-ID: 91432e83-88c8-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCyramYxvCIMt/sQp/CbVr+f3EMhiSEqVB8cCE/b8f8z3QHvEWRmYHtioR3MryZML0WKdSHWlW8Tbzmh9bb8kQYEhX7ngnBTUDsGcVO76hBTcQLO97fRBqV9+68XzIS45d+EtejRUCBXbXHyPZZhm7bQ65IsmkDUaF1qmDI4D8gLtTF/UiGgiHRJu8vzHyGMbCYviwWgoW7PPnxt3dl3mABYiQZKPPAG1BjKzO++1dlEMkcHk3XZKgSHU8wJOEWLbdOZ9vbdVd6Ay/mYFBkbZoiI+qb2jQbtxc+B24flWFJ6fW4ZXjEDucDLyXiolzP/eiPjvo3gZhP/lSprFCiDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaHCelQ59jKtKWLwfwblTdez/+Ey8JJ4o/qqx28tWCs=;
 b=W6oSgzzzH7JiIjxafOr5ftja3LF83R7RbG9MPSmA5WIgmDdQyNh4hXMBy1EYlRBi/W4h4/AQ8ftESSkpTtWRIrX6cS1tkVayRXJPJ36JGnvQBgFNCeZinmyYIq6zxKHKF4ebSDonS6tr7zoG9Qf6jvw0ndjY1lNFhThdzReT444G2oD1XRrACsa51coUzsVsdMCxEYORLtf6JNbFgJhNQ8NlD9IU0vIzjIeTRjWrFlqFDBKcphmoWngIkHgA5gNIXWxyjzP8mh+/zgUluo0GTrErwDpT/CG6WQHtzCHry9K/yar7GmKZMAq5S/xK+ACJW46qtewKHAqEuJ7y8c3WMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaHCelQ59jKtKWLwfwblTdez/+Ey8JJ4o/qqx28tWCs=;
 b=NM3WyjoaDwrrAix1UHB3bL30LLGYEwHN5Mx1TzyJtMhv/+8Fh5uD/H0RIfNPV8hnyPXGTqe+gO8EtDV1XbdzJpYAgjbsFXhcDZyPrLtrU0KyTOEvrhBJ/9YOqacOUUaYcgEMtoBcxaN5CVtA3ZOradVzs7y4V9yAmmPtyMjmYL2fMKr9c5EmyDvswd88DY31FCIXX1DT/l7bDatf2DxL2kIaXio+36VPaaK+oTuMKpghIGPAB1IVDMo5bJe29AETF2jKqyZXlbbFzqTjF60/3F+r/OFx8eWAiEpKVtzZ/7d/jEr0qq0x/saJ9LkhRP33LB9N/aysd9WYFckLRUpYBQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v8 4/4] docs: arm: add docs for SCMI over SMC calls forwarding
 driver
Thread-Topic: [PATCH v8 4/4] docs: arm: add docs for SCMI over SMC calls
 forwarding driver
Thread-Index: AQHcHNVMacs1ox/gAk+LMlCTxD8NJA==
Date: Wed, 3 Sep 2025 13:18:55 +0000
Message-ID:
 <eb807f9734ec81ab22c292e02207016774327561.1756905487.git.oleksii_moisieiev@epam.com>
References: <cover.1756905487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756905487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB8120:EE_
x-ms-office365-filtering-correlation-id: ea08d6e3-eb61-49f7-7546-08ddeaec71cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6c297EsFKHeuXRPgsVJW+RNqKumchFM5AUCsfO5gqcNstE4lGrGoB0uWCn?=
 =?iso-8859-1?Q?XFRdFGqaOi2s7syoSa26knAjy46BnXO3X1Kgrs2UT0hlEI5zRtS3WEz2wr?=
 =?iso-8859-1?Q?I9hI4ovHdlkodP6CRmbTM0aMzbxD86hygIYLD90EsFm4dkj57TzvQqB8NZ?=
 =?iso-8859-1?Q?dRm/C1WOIwyZSpKJE7z9FFQYfMfltjNKHUdLSB2a6uhrltGf7RSNlFboz8?=
 =?iso-8859-1?Q?/51qvKMpfPUULSsBqhhUVPkPZaJcol+e7Byf6bC5mSAx8P/RIOlw87gsRt?=
 =?iso-8859-1?Q?yA4DA8NPzQyn1nQm2rvtL/9TG5F+TMWz2q3AzcRqimJ9AMtnRvYFsHvwZ8?=
 =?iso-8859-1?Q?/kUzTzSKh64GuBQm3eQ932jL9kPPoZs32IuyKbfPTvVj4DAEXPGFS8vzHE?=
 =?iso-8859-1?Q?J2Dv5DpbUfjoFEmyYWyQl3+QVognLYSxAlpLn32xg3l+xNzoakOFxVnoIM?=
 =?iso-8859-1?Q?g4T3lPr+ylPeBJCGi7o6wVXuBx5O1PYfGWrtltM6zrXGjaA5k71Yzjjxis?=
 =?iso-8859-1?Q?/1/PlIXJRCIChiv9VBS9CClQjfznfBTRbPGWd5rq9lavE85h6ipvlDldnk?=
 =?iso-8859-1?Q?dvpJ1VmHPhA5e7n82IO520Edr+stJnRbc2HAbAhLi4tF3HV7NM1hMx2XiA?=
 =?iso-8859-1?Q?kWt3HymdFt46uQL4My58wY4zCchZswb2JwmNE30+JRuJDv57fqQW8EHfw5?=
 =?iso-8859-1?Q?u8XA9RCtAB3l48Go0NB+vHELvsfYgO7HoRzCSCm79yR6iIRHWgOCiwmnRu?=
 =?iso-8859-1?Q?dHLu+jal2hhJSXZUiN9VPSDnagb35Jt4gj4nBE+XLTwlDJ98xP8yyZ2zxU?=
 =?iso-8859-1?Q?d6ruY7V+Q2dvYhVe0dl6Gpq9m80mQycVIHoinNgkgvEOdDYYz0oTg7KUWB?=
 =?iso-8859-1?Q?wTmXe0zCr0LOzyFQcsCd+XiqC0j5XIIJQMiwUXyYmmDbS6zq/qCQ7MTNZW?=
 =?iso-8859-1?Q?xZsMrStsOhce7IWZNB6CMcDbi4MyKfRZcbWj97rZ/+PVCIrMl8zG7WUe+k?=
 =?iso-8859-1?Q?ebnvDRG7HLx4lOII86oDyxDyukZfYP7KjXlx+heIGMdpGnN/wkDc6tMy6x?=
 =?iso-8859-1?Q?NdMy9bZ+yvxUbiE15K9c+GaTIw7b0gNtxpKzBBZzNCpwWV9XEUkBgm9hCH?=
 =?iso-8859-1?Q?8sziRyWPqweJ9xR98+P/JiDscZTfCWdJtJKKCOp8M8XyTNOfUyNrmRQaUW?=
 =?iso-8859-1?Q?FRqLIMPG2G1Zk5wemz/Xy9Cze3nzR4KXTGiru2ny63bnzrrdvOiFZ1thho?=
 =?iso-8859-1?Q?jeFSWaUpNdZvP3ugq6dKsBMiLdIUTNfXvwf2A03pSqjTc9sfaszsasyMAR?=
 =?iso-8859-1?Q?umP9uOryWEluxb3RNGQyoLpqNnRRvJTPl8cfn0Vg2errvOLP3Ha3a+hme5?=
 =?iso-8859-1?Q?UOLEdYfwjlabj1KwhSGR1mj/irGbg4UAGaFAuww+ulS07dQRnLOj8vrQ7v?=
 =?iso-8859-1?Q?ftOkQYaEFwjUPWGWZ5m2qA5GDUEUfXcVPH5n3NG+JsB1no0U97sq92NhZl?=
 =?iso-8859-1?Q?E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?H21j2teYAl0eYPOXUeuLjVe1RNDMtO97at+gaYXXCWbjp5So5kbirsY+r+?=
 =?iso-8859-1?Q?tVbS2qwjMiFtfzAu9ohEa55GpYiRmA9cqGCrURLKzoAPwioTbm4j+3EEcX?=
 =?iso-8859-1?Q?1hhaqEqfhm52NjUAaElB5+RBe542G9KYoboteyAhD3VX6F+IYa8/eN4c0e?=
 =?iso-8859-1?Q?mqTmhw5F6Rf8ZF0sThyHVZQlIEg2N6M2UgrziCGHbgpKEM+F10zSNvQAEH?=
 =?iso-8859-1?Q?SfX6zobvk6JiB5AAdFbYvFjqqQ20Rrw8F3fpwC3bMSblUhCOgNDH5h/rI5?=
 =?iso-8859-1?Q?p5Ebhi1ZHo8RiJ/oYrNnh56b6YYxuDG4/JWo2rzOhwAPTJjI5A1mwlTClW?=
 =?iso-8859-1?Q?714X4RWNZxo+XMHv1BQMcLWkcTvTxOc7EIEPOShNHYlyGGoATiIQYLUsAr?=
 =?iso-8859-1?Q?PI96v4dh0GoggysU+8zwsa8sRaPnx/SvKJMekCC8kk2lIEiwaN4ZBbi1Vi?=
 =?iso-8859-1?Q?fHpo+d0wffL5Bx8M/KtM6npYWidAKzNUG2H0VoMqEM8Pyuth/vCWenW6Vi?=
 =?iso-8859-1?Q?Ff8Ns7YlwZvb9kmx7C54EiFmDKAoh64/+LZHDlP9VTfeF8oefm3yJ/6y7n?=
 =?iso-8859-1?Q?cR6PqBvZYEBnUnrfxeXnDjbja+udPxSWjcq+vAnlNzJa8EjzGMLsGvzc9Z?=
 =?iso-8859-1?Q?h5KcEEEcxGmmiDi6l7fYbqYjcey8Nkdhx3e0zEMrKkwlyfuukIw2aoF3aP?=
 =?iso-8859-1?Q?EHgUXPk10egboensgzZPnwN+HIwQHVlC6PVUyImTw/9Fl1R9Z3nG9VVj1j?=
 =?iso-8859-1?Q?bBHvcxGOlIe4Aj4uFzjQOqoUrCbiw3oMzFvahSryMjgUIjdp5wZkNIQ81k?=
 =?iso-8859-1?Q?yULUPOKLnUrXeXuX3aqY1h6/AgS4+MC7ew8XG1UwVcnivgv+vYikBnr8vt?=
 =?iso-8859-1?Q?w5B11eNhl8e9Ryuzz8T4fY6K/P3wu2ZQLQ4V5tmiEIALQmT/+joLr/JFz5?=
 =?iso-8859-1?Q?ldfRju9OvO78D61ON5nx+3E+MfsYi9k00Lr9Pb9qTMhyTTvjZ+Bp7GzsOv?=
 =?iso-8859-1?Q?YE0TNbf9qL6mRCX/Ce7Un+WmBAZ7yDlGb2rB6X8ow0lrRdwP6HwvouKAHj?=
 =?iso-8859-1?Q?P3iHpfQtLsLU/r25wX854w/Iy9TFEtE1PnafgrfaKLmq080kfu6Wtm987E?=
 =?iso-8859-1?Q?qfT3P/Vdy6gY6Oji8HigVH6TL0lPWqpWS9oZgmnme2DRlfLVTggK3Dgs18?=
 =?iso-8859-1?Q?SijAllhtVcwuZhVadj64MFe9Xe/zz57FZL9ihTZrwE+QviYU2kuEFYy5Bf?=
 =?iso-8859-1?Q?HEyF+CD1AlYEm7NKRKdEas0EVyCNfgieT/osBlbTRVrOR5IINbg8DcXNjK?=
 =?iso-8859-1?Q?ifE0NNDJu8ni2u5BRk7rqpqwBbkoMYrnt+RP92LCSfJsGzSHA0M9USGsTs?=
 =?iso-8859-1?Q?oFv/UsP5wtc5f5luZdIUoKmyIao8Z6dUsgKzLnUF/Y0Oof6u0hXRTvg08s?=
 =?iso-8859-1?Q?OoDwpEeOKT3y9m6DhKKobe2jZk+QYad4HJjdXVhKovPwNpDVAEzOfNUYbL?=
 =?iso-8859-1?Q?LPcmWScdED+OrS//yiRuQvZwuGjXxHX9OAJEl3QHvJoE5v5j5tvW688+mc?=
 =?iso-8859-1?Q?PUE2W8MV5NR4GrnrCh9Kujt/VsuTd9JyEcHRJePrXcSHy4G1Yegmn/9Ht2?=
 =?iso-8859-1?Q?QEKjk4zJ9JlJzviL/TiLePkpJqoQTyVaPqzSlJc5OpS3NZfz8IaxMB2Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea08d6e3-eb61-49f7-7546-08ddeaec71cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 13:18:55.9671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sImTxDDug51v/QHmVtYqZnUtTF7M/DISzwjplzpqNycE+1BkNcKTTJly+UoJfbzuQsMWV1GDy0al/6yjPZ3+EXl6MjFVBTrUBHf1Q83k+Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8120

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add documentation section for Simple Arm SCMI over SMC calls forwarding
driver (EL3).

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

(no changes since v7)

Changes in v7:
- fixed typos

Changes in v6:
- add link to the scmi bindings used in the doc
- remove mentions about HVC calls from doc
- rename cmdline parameter to scmi-smc-passthrough

Changes in v5:
- rename dom0_scmi_smc_passthrough in documentation

 .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 3 files changed, 190 insertions(+)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
new file mode 100644
index 0000000000..d65ce35acb
--- /dev/null
+++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
@@ -0,0 +1,180 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+ARM System Control and Management Interface (SCMI)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+The System Control and Management Interface (SCMI) [1], which is a set of =
operating
+system-independent software interfaces that are used in system management.=
 SCMI currently
+provides interfaces for:
+
+- Discovery and self-description of the interfaces it supports
+- Power domain management
+- Clock management
+- Reset domain management
+- Voltage domain management
+- Sensor management
+- Performance management
+- Power capping and monitoring
+- Pin control protocol.
+
+The SCMI compliant firmware could run:
+
+- as part of EL3 secure world software (like Trusted Firmware-A) with
+  ARM SMC shared-memory transport;
+- on dedicated System Control Processor (SCP) with HW mailbox shared-memor=
y transport
+
+The major purpose of enabling SCMI support in Xen is to enable guest domai=
ns access to the SCMI
+interfaces for performing management actions on passed-through devices (su=
ch as clocks/resets etc)
+without accessing directly to the System control HW (like clock controller=
s) which in most cases
+can't be shared/split between domains. Or, at minimum, allow SCMI access f=
or dom0/hwdom (or guest
+domain serving as Driver domain).
+
+The below sections describe SCMI support options available for Xen.
+
+| [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`=
_
+| [2] `System Control and Management Interface (SCMI) bindings <https://we=
b.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documenta=
tion/devicetree/bindings/firmware/arm,scmi.yaml>`_
+
+Simple SCMI over SMC calls forwarding driver (EL3)
+------------------------------------------------------
+
+The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is pret=
ty generic case for
+the default vendors SDK and new platforms with SCMI support. Such EL3 SCMI=
 firmware supports only
+single SCMI OSPM transport (agent) with Shared memory based transport and =
SMC calls as doorbell.
+
+The SCMI over SMC calls forwarding driver solves major problem for this ca=
se by allowing
+SMC calls to be forwarded from guest to the EL3 SCMI firmware.
+
+By default, the SCMI over SMC calls forwarding is enabled for Dom0/hwdom.
+
+::
+
+    +--------------------------+
+    |                          |
+    | EL3 SCMI FW (TF-A)       |
+    ++-------+--^--------------+
+     |shmem  |  | smc-id
+     +----^--+  |
+          |     |
+     +----|-+---+---+----------+
+     |    | |  FWD  |      Xen |
+     |    | +---^---+          |
+     +----|-----|--------------+
+          |     | smc-id
+     +----v-----+--+ +---------+
+     |             | |         |
+     | Dom0/hwdom  | | DomU    |
+     |             | |         |
+     |             | |         |
+     +-------------+ +---------+
+
+
+The SCMI messages are passed directly through SCMI shared-memory (zero-cop=
y) and driver only
+forwards SMC calls.
+
+Compiling
+^^^^^^^^^
+
+To build with the SCMI over SMC calls forwarding enabled support, enable K=
config option
+
+::
+
+    SCMI_SMC
+
+The ``CONFIG_SCMI_SMC`` is enabled by default.
+
+Pass-through SCMI SMC to domain which serves as Driver domain
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This section describes how to configure the SCMI over SMC calls forwarding=
 driver to handle use
+case "thin Dom0 with guest domain, which serves as Driver domain". In this=
 case HW need to be
+enabled in Driver domain and dom0 is performing only control functions (wi=
thout accessing FW) and so,
+the SCMI need to be enabled in Driver domain.
+
+::
+
+     +--------------------------+
+     |EL3 SCMI FW (TF-A)        |
+     |                          |
+     +-------------^--+-------+-+
+             smc-id|  |shmem0 |
+                   |  +----^--+
+    +-------------++------+|----+
+    |Xen          |  FWD  ||    |
+    |             +--^----+|    |
+    +----------------|-----|----+
+              smc-id |     |
+    +-----------+ +--+-----v-----+
+    |           | |              |
+    | Dom0      | |    Driver    |
+    | Control   | |    domain    |
+    |           | |              |
+    +-----------+ +--------------+
+
+The SCMI can be enabled for one and only one guest domain.
+
+First, configure Dom0 to enable SCMI pass-through using Xen Command Line
+**"scmi-smc-passthrough"** option. This will disable SCMI for Dom0/hwdom a=
nd SCMI nodes will
+be removed from Dom0/hwdom device tree.
+
+**Configure SCMI pass-through for guest domain with toolstack**
+
+* In domain's xl.cfg file add **"arm_sci"** option as below
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc"
+
+* In domain's xl.cfg file enable access to the "arm,scmi-shmem"
+
+::
+
+    iomem =3D [
+        "47ff0,1@22001",
+    ]
+
+.. note:: It's up to the user to select guest IPA for mapping SCMI shared-=
memory.
+
+* Add SCMI nodes to the Driver domain partial device tree as in the below =
example:
+
+.. code::
+
+    passthrough {
+       scmi_shm_0: sram@22001000 {
+           compatible =3D "arm,scmi-shmem";
+           reg =3D <0x0 0x22001000 0x0 0x1000>;
+       };
+
+       firmware {
+            compatible =3D "simple-bus";
+                scmi: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    shmem =3D <&scmi_shm_0>;
+                    ...
+                }
+        }
+    }
+
+Please refer to [2] for details of SCMI DT bindings.
+
+In general, the configuration is similar to any other HW pass-through, exc=
ept explicitly
+enabling SCMI with "arm_sci" xl.cfg option.
+
+**Configure SCMI pass-through for predefined domain (dom0less)**
+
+* add "xen,sci_type" property for required DomU ("xen,domain") node
+
+::
+
+       xen,sci_type=3D"scmi_smc"
+
+* add scmi nodes to the Driver domain partial device tree the same way as =
above and enable access
+  to the "arm,scmi-shmem" according to  dom0less documentation. For exampl=
e:
+
+.. code::
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+    ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
+    ->        xen,force-assign-without-iommu;
+      };
diff --git a/docs/hypervisor-guide/arm/index.rst b/docs/hypervisor-guide/ar=
m/index.rst
new file mode 100644
index 0000000000..7aae4a0a03
--- /dev/null
+++ b/docs/hypervisor-guide/arm/index.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+ARM
+=3D=3D=3D
+
+.. toctree::
+   :maxdepth: 2
+
+   firmware/arm-scmi
diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.=
rst
index e4393b0697..520fe01554 100644
--- a/docs/hypervisor-guide/index.rst
+++ b/docs/hypervisor-guide/index.rst
@@ -9,3 +9,4 @@ Hypervisor documentation
    code-coverage
=20
    x86/index
+   arm/index
\ No newline at end of file
--=20
2.34.1

