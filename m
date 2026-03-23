Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPOBKAvEwWlUWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF222FE937
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259668.1553113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7c-0003Qz-OY; Mon, 23 Mar 2026 22:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259668.1553113; Mon, 23 Mar 2026 22:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7b-0003Dz-RO; Mon, 23 Mar 2026 22:51:43 +0000
Received: by outflank-mailman (input) for mailman id 1259668;
 Mon, 23 Mar 2026 22:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8gh=BX=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1w4o7X-0007Yi-Ju
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:39 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021085.outbound.protection.outlook.com [52.101.70.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d923f423-270a-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 23:51:37 +0100 (CET)
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB9699.eurprd03.prod.outlook.com (2603:10a6:20b:61d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:33 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:33 +0000
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
X-Inumbo-ID: d923f423-270a-11f1-b166-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHOrF+EjAO6uwA9vJzJktySafOiodyX0POlB+eqgIfRsiLQ0eeDPSlHuCjVRGkmzV0e/1EERPee8XEYq7rIsQ5zjq/vFTXbrO+OG7mSEzbuPZ5noky//EUn/BcpmtIoRSAiJyhJHFE9FFY6uCJGkDU7KcLsBuelbwFb84BZ1RDNy7K4Ffura9YZR8wIitbqbcFGNcS4eSY9V6OzGFf7b9/W3Oz7KaSantRqqvjqgJtZBci3efU4drC+qtGVKIDQxPyos6qlYzauaKD8JdOhSZYlLO9xZLRPX/xSaC9noPG9+PWIq+uUAAxSsvdFmM92+hbnPu+8hJP16ncWqRr+cFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lj+Sg5LBkxi+H913KrrxXSn48z00gNy3tUlieV05i7o=;
 b=AUvLEA9HnkYKkpY8UV3ZCrSFTqdmL2eKqzw/FTi5bMqfcR1BZiCEZUaW4X5Ys2AAiaUfwi0DAPX0EnL6nWiwvGAaR1SZ7eg3LJC7q8oOcUgYuk2Y4r46mLx1aSb3kXhIEAb+hGSVgAsSgeQmnE60lBsdDesdLlkiKRU2Mr9tAhQeXm6QX/CNwEO+KuzK/EWSsW+UQUCNzemzMM8OHMQbavpFZqXYOcaBCI8TtvQ67Vbv2cJIDWa6gWlEaXIONT+gdxCE36q1jMBtd7XHHW92xUHGNi8pMmpgqQI81Bz81v7Wk9Y2KwtJeSBC5TbKslRPIWjEDCndjkTSBd5B8suwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lj+Sg5LBkxi+H913KrrxXSn48z00gNy3tUlieV05i7o=;
 b=QskhLSAUPOx9YjQ5YqAEee8mWiNlIGUuQpWDqzow9FuumJw3h3eU369IU9www7NtmObiMFV2ZVJLMAonIkRoyiqRqiRX/N7krUcdpS+a+k+KQgl2KyHd7x+GQ/P5aJomH6lUBS9TIPlpPwv0OxdwZ1EkcBe5pPSM/0dC+67faqzysym2IuFnGAxfZ/N9+ceXoxOGuTmgEtj4E2YQAaif3rr02FNNLoBG28sppipfq+t0sA5HgJ9q2fh14hj7NZpf4CWK4UZ4xmluwn3hkAYsx1RRDeFiqveUFQ+wUMCQZFMe6NctnmcOe159Qt5SHuSiv3xp/TCN/XesoGqNaJSjKg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v2 16/23] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree node
 in libxl
Thread-Topic: [PATCH v2 16/23] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree
 node in libxl
Thread-Index: AQHcuxeY4ZME1ykbT0SM9HSVq+3Z2Q==
Date: Mon, 23 Mar 2026 22:51:33 +0000
Message-ID:
 <a33ab266d95c9b9ca18043d6ddeab48fd5a2f86b.1774305918.git.milan_djokic@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|AS8PR03MB9699:EE_
x-ms-office365-filtering-correlation-id: dd9833ac-2772-4628-5108-08de892ebb4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 F5t84foDWq2fsZAJr9P/oCL+6SmAl2dSR5pyDYNrw2GP6wa96An7+/po580qpA+cxaWpUq9mM6pTh5BOdvqm1yckfMfQjUrvdbT11vXyRGYq0vOL//sn+JmTw8mfLepwTzQtJGh3EjahzOOecTyE/jRnDdhrMvQc9d2glzhAxrECnwmg09T79i/+/l0Uhporo5mR89qDMIchMsvoxWrTH3EX0P20fdAEmYa4Pi9bJU+UKzfFeG4q0khIHkxY0KK3+xV6yT0syx7Odnlk8d+WWyU9h0nmSPhUI8g0MBFtOV0bNpO+/qhN3WUuK5ysaaOz3OjtIaHLQnVU/xEOc1XAMUYbj++4LyqDEfFF9K98DjMC/81h2h01SiDVGeyIm5Xdd8Z0k8JN0BwTkFc5vFiviITBC6thymKvVY5Kn5AHbD0NNXB4qgRLpoBrpC86qxMXaC78JkFVDEB/Y+lD/sQN9vksxX2m0Rp4jtBvBZ9Y7DaOsg693gQKNkv2umbLX0cf0s5xvyRQ24l7Yr8DEKg5M53P7UGuvFAvvFm1+fXjxSTBXMmGug64CDECctYEcappRec2HKtSUaaWzZ1JECefKkMfxs41s+1o289Osf7sTIgBHApqPRkoWGGwJdR6H7cNKM9PUX7TdkhHN4fyOwKNkIUaFQZrui4hI6SbNQO9dbbB2n8A/und3hyUy6hjxcKTapb1//vrzXm0rWkRfn4KUKmfr22t4vvDyEx/ho8VOnPuGH65Uy9BuFnPxVgXJU0QBPXJbl3MRLX6f4OBUJspSa4tRrysauwWiFL4bkiKIt8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hFo68PatmN9Lgd7E3aKuE0hI8mKrSKVq+YjXtBQb19wSIBsYfGgRIvCcMd?=
 =?iso-8859-1?Q?9tRmffRjpJ3JTS9aZkHYpFBSKziCRI/Jvkrts9R2lN2zjLDFaRuUn7hzro?=
 =?iso-8859-1?Q?lmAiJJR23M3W34imU3Qi0IZ62aWfyT6gGztj0X+eD77IYJEqJ2U2JZq3iY?=
 =?iso-8859-1?Q?HeEF6nDyMzEhKF7Fchml5HqvtE8X9eMSd983z6elGnwW54ObYpZmpp/2id?=
 =?iso-8859-1?Q?lRAmqrpGvRcDEMmVnFg940liIhCFiJW9LNzq1bs+AyOoBs0KfwqYBYLCdC?=
 =?iso-8859-1?Q?+24l2BarLy20vjwlkLuIRpVjRgGWgryHFwtWppCLgY/OyTNZ6G1DZAJ2cO?=
 =?iso-8859-1?Q?Nbuu2iknM89wUaMagmypUOCFYg+IwrIDlMzr/N/uYZNLyvXkJ1ul07350w?=
 =?iso-8859-1?Q?fjamOPD0YlmqHUUQyAym4dD9bHVpUAYJOiUZHjy/iqHBv1lFHo8mLtleQU?=
 =?iso-8859-1?Q?EOf0kDSaaU/ZL0K96Gt9dIR5zxcDqjL0reX19TJmcBYEOBEBUyhP49CJLe?=
 =?iso-8859-1?Q?VyHMYIO+pEZMM4+AYQuNFhSWKJqSkl99eV7Z3vb/q54P2IlsSnSXYi1Dnh?=
 =?iso-8859-1?Q?mV1drrkxTguIhY4yLOjOntPpSZKcXRMSt8TuG6HJvD8Sril7H2nJ6sIF/S?=
 =?iso-8859-1?Q?WQqgq222o4w+bub/gvaWMBnEd+ZFDnaCmPM1m3/lJw2mxtAuhyh3z41+/G?=
 =?iso-8859-1?Q?0mPFlwKQAikyIIUkBOnBX1SQ/zHMXJ+3c+RV0kqmXIOBm9xj3lMthvaIoD?=
 =?iso-8859-1?Q?7bLka9u5Hx7S2r66oUgLs01FinwAVDmbt1C5F40c4IpVa3NyZbxZfY1FJ2?=
 =?iso-8859-1?Q?b/hejuEZFhJ8Sj5Iu7Ek5qE3//9TNFQwXLKxAhq/rcsMCVh7R7xo8/tx6w?=
 =?iso-8859-1?Q?dh36J55DgPblUX21mGT78Hj7wI/Rg90/dmghu5qvrfLK9X4tZyo5DfXPi8?=
 =?iso-8859-1?Q?LphLF3PIeGg18TE8UPeGWFbOOlNnzdSPbBezGZ9Uavi+OC1ARHGNLhc4aa?=
 =?iso-8859-1?Q?Hfqc0FROrJAXx5CBUD7NYOpAC4DOpS3t1GusSPr2TSrOQoqFYj64h5OBZ+?=
 =?iso-8859-1?Q?LP0vKp56TI/FGAoEJiv+AcHJ//VtYvmSRLKZNwipX/ey35Taktfs4GwcpE?=
 =?iso-8859-1?Q?+rDpYkaPLPnntPaHkpxYtVOs42BfIRLijaAHuP5rHhJOsicvr6zHG0cIaR?=
 =?iso-8859-1?Q?+toSzNYxi+JFWRUE4XdBKuVgViVZVNelNbmnEdaX9o5Q6rHYO/RQkOFt7m?=
 =?iso-8859-1?Q?iqQnKO5ibfaxCbY5eAgT7eAPoiRPUop4Ua2noc/DJkr02PNUDlAhC0vQEZ?=
 =?iso-8859-1?Q?Q0ygh7wHR93mEqd/ohr6OLqGjti+C7hQZpXJKKMgs/G4jY533T+eLqKJBd?=
 =?iso-8859-1?Q?aVARSXTx3nOufzYvePgN7r932rPxXQVdq8pcaGuMqobh+mIzyF6YGjGsxh?=
 =?iso-8859-1?Q?fD3y4sH+qIwZaJp9VbIkaSjudOSCYklHk2FIlg8IPvrGzQlMQPF7RTzYX4?=
 =?iso-8859-1?Q?Fo7Qi+ISsWl4EKy6MC3aOKR5bAHRIF58hd4MLBwDmRyM1y/yGU78BWRJPg?=
 =?iso-8859-1?Q?V8cHyTrfFF1C1E85S0cSSBNFI6r3VbuBX3sXo/y4MsQTQRu5TmPRZK0oQS?=
 =?iso-8859-1?Q?Bd3T+N311FzMXWhOZtD46HDw5ze283VUrSc1/nwbxuQMylVX7P44TZIE/B?=
 =?iso-8859-1?Q?aLYUrqBrv2plicsTA30GLxWABamvBvacs67QmSOP8UmLwcciRHdKr7EStT?=
 =?iso-8859-1?Q?eAoWN4/DyJ4zq7N5dKzDMx72Nvj0idpkIGS09NpnshakECkQGDqI92LgLg?=
 =?iso-8859-1?Q?HV2x1B/9/JSl8bVGy/uIXEu2rB3TeG0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9833ac-2772-4628-5108-08de892ebb4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:33.6739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XMscshbLCJ/s8dQtJ4eu7YX9lcBHD+4iGNcC+Ruy0GOx+SFoHUJu8CGFGU5ZIFJeIDRhzgwV9h0nBjj3b98ozA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9699
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,epam.com:dkim,epam.com:email,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5BF222FE937
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

libxl will create an Emulated SMMUv3 device tree node in the device
tree to enable the guest OS to discover the virtual SMMUv3 during guest
boot.

Emulated SMMUv3 device tree node will only be created when
"viommu=3Dsmmuv3" is set in xl domain configuration.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/libs/light/libxl_arm.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index a248793588..eb879473f5 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -901,6 +901,36 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *=
fdt,
     return 0;
 }
=20
+static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
+                             const struct arch_info *ainfo,
+                             struct xc_dom_image *dom)
+{
+    int res;
+    const char *name =3D GCSPRINTF("iommu@%llx", GUEST_VSMMUV3_BASE);
+
+    res =3D fdt_begin_node(fdt, name);
+    if (res) return res;
+
+    res =3D fdt_property_compat(gc, fdt, 1, "arm,smmu-v3");
+    if (res) return res;
+
+    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+                            GUEST_ROOT_SIZE_CELLS, 1, GUEST_VSMMUV3_BASE,
+                            GUEST_VSMMUV3_SIZE);
+    if (res) return res;
+
+    res =3D fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_VSMMUV3);
+    if (res) return res;
+
+    res =3D fdt_property_cell(fdt, "#iommu-cells", 1);
+    if (res) return res;
+
+    res =3D fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 static int make_vpci_node(libxl__gc *gc, void *fdt,
                           const struct arch_info *ainfo,
                           struct xc_dom_image *dom)
@@ -942,6 +972,10 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
         GUEST_VPCI_PREFETCH_MEM_SIZE);
     if (res) return res;
=20
+    res =3D fdt_property_values(gc, fdt, "iommu-map", 4, 0,
+                              GUEST_PHANDLE_VSMMUV3, 0, 0x10000);
+    if (res) return res;
+
     res =3D fdt_end_node(fdt);
     if (res) return res;
=20
@@ -1408,6 +1442,9 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
=20
+        if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3)
+            FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
+
         for (i =3D 0; i < d_config->num_disks; i++) {
             libxl_device_disk *disk =3D &d_config->disks[i];
=20
--=20
2.43.0

