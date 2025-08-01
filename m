Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA4B17FF0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 12:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067065.1432026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhmhB-0005ZL-1c; Fri, 01 Aug 2025 10:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067065.1432026; Fri, 01 Aug 2025 10:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhmhA-0005WP-U4; Fri, 01 Aug 2025 10:09:00 +0000
Received: by outflank-mailman (input) for mailman id 1067065;
 Fri, 01 Aug 2025 10:08:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZgs=2N=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhmh9-0005WC-A3
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 10:08:59 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89f89f57-6ebf-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 12:08:58 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PR3PR03MB6604.eurprd03.prod.outlook.com (2603:10a6:102:7e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 10:08:55 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 10:08:54 +0000
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
X-Inumbo-ID: 89f89f57-6ebf-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yevSkz9Otk/SyS4IdXXtnHuSucxD2uFDLZEDGj1p1PIbm5J3fte4+MG/0+PvRGYKKVMcP0UDg0wlfoTaxno90nrqfgWLZhYndvhN+Gg2NVxnHLdbM0QHeUZM+N4AhB0j3PTjtZXYhsDXlclzhSH6EIty1/yK+vM6PRwIU00fgmltST9Op23ZxS+CpEEgG1Bev6+WhIoTMv5u8tD8jvuD74b5j0Tu/+3u5WCiAlfhmM3lBOZMxsigQO72nzgbVLSzxJG+hltjuwJcI6bCbsgaAqMcK1EoJOSzO7SY8kVWstxtXnHqRcX7LpcUgyJUNdJIoek4uzyL1d+kiyl7ZBuW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7flGp/8/Dq0Hg7DY3mxIdpXEngEztiNgXG9DX2dJxw=;
 b=gZVBxvfZNws1gO3PgQutDMStDgfWOansgph5mWhjjqaWGT2sUkhS9RZmXefZpXNqNXDq+TGiHdYTLs0XM8Xv7W3qnknO8pdjkjHDnOCabO+M6KY9UiS0E6TiUvLyO3CSi3iYrTqMEm7Z/oBqFE7tOZicoepwkLaejCNP1QDb8xjjAlkzPkzrobSgdyZhsq+ecO94Mmk9Hpq5J+ED8PO9jf9oT5wRTwbfd/v2fC9LU7S2kpd34np5Jn3vJGY6GhyVGAhLo3ypccwoUScnY4RxyDKQVpNUOTyL8UdGDjOz0JCSlXkXEfpVMGLmdo0bcF9N5SyQxyFv9NIrigZx/WF/fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7flGp/8/Dq0Hg7DY3mxIdpXEngEztiNgXG9DX2dJxw=;
 b=Xf2GAv5FahQflCffKiE+ECH5/FTnkJ7jFGDit8EOTegjD8rKiclo54SkxXirT+xQFSyTOCFOfo22gPQI3zcGZl28oF8e5WtNLjAE+YzJxi3wSKf6wi0VspxgATU/kQZXf3qNunwhyiMPoP3PSi4CYosehVUQzOal/sl8qyM8ENfqnD5uBr7tNyGJTqlLm1RX9bO1CF08G0+n55GiU/QJYB9/SWTQVyCVPxLfTrFEqf7ty9ndjARiCL7Zg7LsTYrvFHuoJxgnvhVzSNCVklsM+VesjaBPmqt1Vfe1ulZunmMAyM/rev0yXFCyDTzsNHbuQQr5Tc9VKnQngKW2WteDJw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH 0/3] xen/arch: irq: drop unreachable pirq callbacks
Thread-Topic: [XEN][PATCH 0/3] xen/arch: irq: drop unreachable pirq callbacks
Thread-Index: AQHcAsxJHjfjEhDPRUmYxo3s3ZWyfA==
Date: Fri, 1 Aug 2025 10:08:54 +0000
Message-ID: <20250801100852.1260544-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PR3PR03MB6604:EE_
x-ms-office365-filtering-correlation-id: 3327ac93-cfce-4ea6-aad7-08ddd0e36c0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?v42kM4wzA6nlkv336+hA0FficO8Quj6ZJlP9KEiZfXO43vcZC+sp71exRA?=
 =?iso-8859-1?Q?zb9lIlGifgb69WGA4vwcDFPHHEiKq0UKNHswaGkj2JYqYGMM3a4REnMhoB?=
 =?iso-8859-1?Q?xnUCA6YsPQja/3r0Hg/dcDbH/IF3fFRcbhb0DoofLbbZyKYycJinKRyB15?=
 =?iso-8859-1?Q?FzHSuCszAW5nxJrqO0YpkFvvWLyxO3W7+8QgL8X/p35XBP5uM7e/mnDPlw?=
 =?iso-8859-1?Q?vlAxBfueoTB6EeGyJF4Y0qvZX2eQoMJqzSQYhUIxoPnPlDeKiqoe3pHPs9?=
 =?iso-8859-1?Q?7dIsye9+Bg40sYcDKbhKEOuIDJkERwo9RVJe2aVEOMgHfQxXbFBUJ/W5z6?=
 =?iso-8859-1?Q?7LrwLCHevOEft4biBxxbhYHLNWmsNX3E6rfNt2n64dV5DNfged5odjtkUV?=
 =?iso-8859-1?Q?MCt3OYNJlaMqnLV7uOQlTgNMrttCMV1YGw7nQugUADdriaKZgmWuGlKgdr?=
 =?iso-8859-1?Q?WYepj4g04rHB0buFv1OBsMzQ/wa11bHGPZlOqxrC3qlBm9SLUDkU+wiQEg?=
 =?iso-8859-1?Q?n/I9OJ+gZFAAl5WAI6u2mzZXhbCSy2TKWXqIaFBaRrIW84tbKvsVWY0yIx?=
 =?iso-8859-1?Q?gBlnRQVNVd+fPI840qBTS4uYaT7yApBP0x9BfWWrZh66Sv1u+fQrsXgCGW?=
 =?iso-8859-1?Q?bupSVH3PMYhGQWKZoFS20MIlUkYJhyMuHg2NeCxDONBRM1xgGjTTIlGOTX?=
 =?iso-8859-1?Q?POrLUpw/3X26SEIgIcX9pmZwsnWxULNO/pUMr7klaL95IEsGlKmz4aXBl+?=
 =?iso-8859-1?Q?zz2MT377Estu1ZK0YmRfl0i99oTzMsjSvB6kIkQxAyz2CYOZLoQOYcwEaP?=
 =?iso-8859-1?Q?i6cs/7MzchhmSpLleRZEv3Zi3Hg+Kzpj4wPL4M2Jzx0TUYI+3pihkhwqKW?=
 =?iso-8859-1?Q?H51qYAbWzMrwjsHV4oxFZc19OG9XbLudKaQIuqbJNwh8eos0HJVFyZsqKg?=
 =?iso-8859-1?Q?c6WJG/jI5EyTFYDLJ14TD7DxxNWKK+6XgJ74ArMOvWQ2uFVIU7CGKiiNvx?=
 =?iso-8859-1?Q?R3VfO7L020H+iZ1ter2kF3QoqKw7TNHuOlUvQAeSOIV2YDvABxEA/VEJsW?=
 =?iso-8859-1?Q?jqaz7PL47S71qXp47sgnRXbUKFgYQstzcqXlrGZPsL+8LhCGEzA0yPB1j3?=
 =?iso-8859-1?Q?7Iz7WMlmUHctvfhz4BcxL1tTQ8UWmIKVb1in2K8afIHfYTCJqShQUUP0B4?=
 =?iso-8859-1?Q?EJNw1IjD85oanr4/eWdMCH5+6CfsddKIFZl4uiATHAIyu89QFxUKfvv3jw?=
 =?iso-8859-1?Q?xD4zxJGrJLncIb5KsoE2oRYPfoATjw/TItnC6XdyNlrHmRP8NPYPYIKont?=
 =?iso-8859-1?Q?gE47IXhw2pEMZk8seFrqixB8vP4z3XuZE1lx9cpppA5PpK+oFx2Vfl7TPS?=
 =?iso-8859-1?Q?r+2zmh3mPMLv4hKUQqgcCVfg8ehGeBQgi0AlDtqxTUc0QbIC6PSfgT0el4?=
 =?iso-8859-1?Q?u6NFtR15QTt3L0Pq2sXBbx1XexU0CSpMVc/yI+SBQDWLc7CZN7CcnACqIB?=
 =?iso-8859-1?Q?yxo37Hpnzy9GtmWmg4EdQYPckTaIrYI+TVMCFruJAbxA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PiPSqgjuidfEwKQDSIrl5rE2QSqoSB/W02SwqTQIdg3xjossUUsc+TiV3q?=
 =?iso-8859-1?Q?k/2AcVnhMBf+n7jecoReNKgJOIMEdYn6hen3LKIvzXkaknpTJiCCYoJoh+?=
 =?iso-8859-1?Q?/GR0uj8r1MHFE0Y01pgdgsK+n8FEdvNtJ6irHWDWYgqlFQQR0poAEuTwJ3?=
 =?iso-8859-1?Q?04OQiRHQre+WilHAzd/prwDy23xSWc7HY1ZEvnQqZE5Md3eLFLMDL6F+Ps?=
 =?iso-8859-1?Q?y602g1k+YHyjrOpLdHx/CyPswEP8y2CRcV1CSJHr1pzP26LZuIhBkOTAhY?=
 =?iso-8859-1?Q?cOrpvFAL/gWCPvVugEwbgIeQEjxL4wll4aFfEfyWTua9MphV2GU5B7HbFt?=
 =?iso-8859-1?Q?84uV3RuN4JNg7OfGkPeTOTNuLIGp7//IydeNo5gTBT+jfEzc5S13sHkACj?=
 =?iso-8859-1?Q?b8EIsWgrUBdYfmhMdcfguqTvpNwYSLVtsjA97IRLkHe/LQ1RGhSO4kvYjZ?=
 =?iso-8859-1?Q?dXpSLXaNaBgeO61bLYADT4PeW8nLNOyQv/8vY57LiabwV5BILlvyaiXJ9D?=
 =?iso-8859-1?Q?47XtFg2iqKlXB2OskDuxmsL36J3mVaiNI1CXfPFTp/oIwro5ehOz6l0H/1?=
 =?iso-8859-1?Q?dpy6j7Lb7/NjjG5N2BKYQ2avjka+M7KhvnjQhYuOMqkJUrM59bjyDasqNO?=
 =?iso-8859-1?Q?4xeZqVB6v1Fy/A6011xgnmlDlSnvupIm3FkZrYo/iyruGoioIEJgvldKQI?=
 =?iso-8859-1?Q?k2gRrALKlJyM1jUkT/d/Sj0DwxEjsgSOk59JP/Iyft8qbZDGyKtwxZZ6YL?=
 =?iso-8859-1?Q?3TYe0tL64D/XIDQo3Sxye40XuFKRa73sQKUMwmIEhUZ+QHD9vaN7lAnPMT?=
 =?iso-8859-1?Q?3UWdIwT5ZuM5jSLBM2FFbKvL1izWjVFfkgOt8WBf2bSeuLT8yJxlGs+H9I?=
 =?iso-8859-1?Q?WjdLfQwlyXJMx1vRPhoSWAdEJeix5w4O9btxS9JkjZEvvPyW8CjLqSfqOj?=
 =?iso-8859-1?Q?qliDQigomeWp3MzjoYI13QcE2SjH5IK2gehdSciYJDYwpqvS/Cl4TTa+/W?=
 =?iso-8859-1?Q?9+x3wtyo33YmiVdA49T313zRFfo/y9VFoC2e6I7JDMa3y6RrKRpX4U6+4+?=
 =?iso-8859-1?Q?eq7XDzK4+ZlefD6Em7827tgEUphQNueDCu/pAwQ/AmHzBWbsNYEinJ+7aq?=
 =?iso-8859-1?Q?PDPQvgLpGl+f7Ay05myUHYU5YAnY2j/FfC//XvFcsMQKp0TXtN8rTYiW/x?=
 =?iso-8859-1?Q?KIVQiHMxj69kMpa9HL8U1BfWw0/OOZZ1e3pQNCokCx7HooaISAoFTm3rLV?=
 =?iso-8859-1?Q?Rfuk3rFP4HT9FyrP2yNeeZLSnxalUprKS4IdCPuXsQ210zulCLD2dReipN?=
 =?iso-8859-1?Q?+uHmWki3lkxNLzO1BCHCBQZu+eZga4pb2/L4fP/H2CgJJzWI1uUm4LvhL8?=
 =?iso-8859-1?Q?+ln0Gh4e63OOR2cB+pMs0zGCZwE/Y01aKo/yAGTQ4tkYwr6pLNkNIhl/3l?=
 =?iso-8859-1?Q?c3gdMluclXoD7+nr84hgsupYlTlQ3zHPSaLBhS9GooOSS0H2RlXl1LygKD?=
 =?iso-8859-1?Q?wKzQ2gTochg+97xEmXtMNqj79miPPdSuFwh1j8sw/Ggm3KmSyTxfMHLXNY?=
 =?iso-8859-1?Q?5LOu2hmrDx6Gjfc+vmIueL9HjvdVSzjQ+K8gnb/TBnuydbQjP0gboJi7u9?=
 =?iso-8859-1?Q?EYJFRJmSTu8a0W0mpMW4Vf1EeMhHC78zn3iOmK3Xz+yP6FoLqVseecDQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3327ac93-cfce-4ea6-aad7-08ddd0e36c0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 10:08:54.5086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hvhgm4K5C1175Q98gW95BNzz6sRDSGzqXnAVfXT1NJhy4/xa3mwMyerHRzfpr/CAeFa9Kltq4S4p7ccBVb4b/bLV9cCDCmtNN7Euf+8xfZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6604

From: Grygorii Strashko <grygorii_strashko@epam.com>

Hence prerequisite patch was merged [1] arch specific pIRQ callback can now
be dropped for arches without pIRQ support as those callback become unreach=
able.

[1] commit 341f271cf86f ("xen/evtchn: fully restrict concept of pIRQ for ar=
ches with pIRQ support only")

Grygorii Strashko (3):
  xen/arm: irq: drop unreachable pirq callbacks
  xen/ppc: irq: drop unreachable pirq callbacks
  xen/riscv: irq: drop unreachable pirq callbacks

 xen/arch/arm/irq.c     | 29 -----------------------------
 xen/arch/ppc/stubs.c   | 20 --------------------
 xen/arch/riscv/stubs.c | 20 --------------------
 3 files changed, 69 deletions(-)

--=20
2.34.1

