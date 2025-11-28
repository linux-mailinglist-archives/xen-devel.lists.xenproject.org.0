Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B0C92726
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 16:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174945.1499882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0In-0006u1-Rw; Fri, 28 Nov 2025 15:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174945.1499882; Fri, 28 Nov 2025 15:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0In-0006rv-Of; Fri, 28 Nov 2025 15:22:29 +0000
Received: by outflank-mailman (input) for mailman id 1174945;
 Fri, 28 Nov 2025 15:22:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqkP=6E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vP0Im-0006eN-RI
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 15:22:28 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c490793-cc6e-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 16:22:27 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by AS2PR03MB10087.eurprd03.prod.outlook.com (2603:10a6:20b:62e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 15:22:21 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 15:22:21 +0000
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
X-Inumbo-ID: 0c490793-cc6e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdWAR796qRNOlTs3VUZFHWd1n+M7HDMfdLXx+lKJcdmUIZlSmaVEM3DGPqr+o/JGk/rmkIoBDL7fuGObN47Pgz2CWV9IGUBlZlew9ms+QQr6oG0XbwhHjV47cE3lHmmdpMUHUTeiuJmPQr2Fp9ioPTtjEtVpWw401nZyAcO6Hpzda2UP6eUQ5GJa3555zXKiA09iMca0Awn5mhvu8bqfBJuJu63nMRsablMGo4PyOz76PQ3stHAgXca2uQNudqiyXy4MSHy3dMmuDUSQfy0atqH4boqxQR03Jv/sH9NYBFZ2uYAeMHMSvvynQ8V1pRcMphJSUJTIZu4ylEhW56Zqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPhlpPQO+kk9DvnzI2NKX1j+ZgUlHCbYfuwZsB6QEdU=;
 b=DIEC5KgzMDkOCSFeNndPFoLKqN3CF/yrhpKF+pYpVHAsB+dsO7vdkGArXnbf02Jh22WS9Fq2EvpymNhXOUOdyyHEkEUzuKDP3TMBLahi/Pn2gUlAI2VyTMaKKfDeEcyXlpyhPASkMSHY2sm0lGBf4g0tGWVsUIAefAskWm9r+A9L0vcWWWq7eEVxldjtNk0WK33kSB0tpjr3DoFAiEyTFG5o1AL974TqX/4iyVqbbA2+QbaTBxSVQwSvZNsb8bA9mCsuPho+HgdCY7Ym4AcrIOOOfOa3yhVbCqaNXkPDtANVdoqghbSDEmfE0RUMBDkknvJHSsUIUqt5+nMtDAHJfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPhlpPQO+kk9DvnzI2NKX1j+ZgUlHCbYfuwZsB6QEdU=;
 b=ApvzqVNCguL6W+rd9Sn1tCm1E7d233ozo4yEJnE7MmzWjzA8ffmjsZJOiYCI6Y1x0/qVGBwQZ/mwA5tpwxxc3ib9nSyLFC4tQQ3G94iXvUtPgdJUP6zYzDP+NdQ0ikWhALQP7MdUnT0D5Jl/cVOywsOfSl6PS+bqdEFP4ZHOkzkahn4i3FrnH7ySe/6isImTZfsqqgP3ZwOfNEf7XHCTlWkAjb15xl//7JwrZW+5oSaM7gC4DuzkPNHkHp3g8wvr8GI9Ga96ITEuVETHzJ92CqbPU3F5GvBFGnrIV8KyFz8G5RDkkDuUBg2NDCrIhYSnEnWSxOT1vb/8vXwb0LrAnw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v3 2/3] xen/mm: add generic domain_clamp_alloc_bitsize() macro
Thread-Topic: [PATCH v3 2/3] xen/mm: add generic domain_clamp_alloc_bitsize()
 macro
Thread-Index: AQHcYHrKI/DuZxtTF0mX/NaGMgBzNg==
Date: Fri, 28 Nov 2025 15:22:21 +0000
Message-ID: <20251128152218.3886583-3-grygorii_strashko@epam.com>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
In-Reply-To: <20251128152218.3886583-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB4600:EE_|AS2PR03MB10087:EE_
x-ms-office365-filtering-correlation-id: f4241c1f-e2cb-4f3b-217f-08de2e91ecfa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kqxYjPgdjrqO53B/JH2oj+/s5AGYWt69SI6z4rDfqDE4tAk0x65fQnhbWu?=
 =?iso-8859-1?Q?ZYR/lEhqIriSdK6PDuVQFsJ9KLO4ESjxT6ktTyuvn0Nq3gpVqvTFsNiYEX?=
 =?iso-8859-1?Q?smuPO4JliP5aLMmboBJlxCfjnLMvfSCIt7IlkShYBAUXMnGPyoSmhxMbDI?=
 =?iso-8859-1?Q?7FX4/KKNN7RxBis32RXZ2BeP1mIfhpkj4T8pRZEcvRbwtsbG6oR4GFIiPl?=
 =?iso-8859-1?Q?eE4Wkn6E8DmhsXMv+WdMzN9PgtCBJCR6e+/CReisDJ2/HCuzsJFvXKwEGR?=
 =?iso-8859-1?Q?9mIE19QvoYuBtEGzw6CbXa0ZIsvc7vu7qdBvECW7Qh9IJRa1vUUWRrPSiL?=
 =?iso-8859-1?Q?/IfA1en/NOa6fnnvRP6jNoW+2lz9YxAanylUa55qYTJwWODXaQ65buzsT3?=
 =?iso-8859-1?Q?boYm5n8B1skG5/zWHKJS+OGiLrjFDa6Q7jbzcmuNAFm/UALHt+S0TdSKtE?=
 =?iso-8859-1?Q?ck3Wsz8ijg2PQFHKdB7X/pfaS9dcm5xjt8BdTeiL/K4A6bX8ORJxT5i5Ii?=
 =?iso-8859-1?Q?jB1Hwy5Y7ZXVr2nCm9ZizQWddFcBKxLKLjnSuC4WjW1lDRqXOCUWHelbjh?=
 =?iso-8859-1?Q?GEBoqytjje9iUwhoRBpQlmDzsa6ZUVHYDAtKzJV7zMxJLVex2nxR7Qgu7G?=
 =?iso-8859-1?Q?M8EMuVuPTVuEmrfCfgf6dcEQXjxe3LSjoQ7Hkv4P8VCy2H8eGyDGglCK+o?=
 =?iso-8859-1?Q?7y9WJoI/GMH8BFFG7JIP44CcfgsH83vQESDR7EfW3I0/WzrfFW2b2wm58Y?=
 =?iso-8859-1?Q?XLWhr6lMWhmFZ4JtdQM3daASIfJnNdhgd5uPeoW+CJsKfsYjfsSHonIehY?=
 =?iso-8859-1?Q?kUJt7pHYN1vOgSMzvAf0TgqGzHpZ+owWsiMdqacrjMvlCIf7RbOpGpaaRL?=
 =?iso-8859-1?Q?J4DBhMXjpY/lGIlY7dt15PtO5lT43KiJYUO4JIzqeo1G5snnDC3U0ysRCq?=
 =?iso-8859-1?Q?fxSzCzfDf4SSwg9lcMebb8uq0WohP/QZKC5fc8lD1oYQvME2S/wmk/a3a/?=
 =?iso-8859-1?Q?KH5bMBR1YGpHrYqW4QMQLVXob/pSHsmt1x31svotwojkc4EZZJV3IeNnWV?=
 =?iso-8859-1?Q?dqwVJzsuVIz10af7AmdpF8f/WcVNLodIYG73F64PdnicqOc2UecDY9zjuS?=
 =?iso-8859-1?Q?s6IlSMOxA2JFkuUk+TwgtyHBfdjV8UMzf/T8xqiAjC48K8FjevhWrL/ClZ?=
 =?iso-8859-1?Q?yMo4aIP46g4b1ziqL+NN6HCHGiKikTbY8S1x7yA53N9W4SLFM4PmkBjoAy?=
 =?iso-8859-1?Q?VftnwD8gdZZXk8XgapVQHzVUHCRitg1OZLyHBS7h1w2BKzx48QrOWsk80x?=
 =?iso-8859-1?Q?2bFxlgo5+YNLHxcMlg86uvEHN35PxraifTGoXgNCy6BGpRLHN/0f/whgyN?=
 =?iso-8859-1?Q?z9CqYESr7ajMf4bx4dmJ6i7fOWHeWewzDarL9y7U6YXc94WU4YuIYqWNP0?=
 =?iso-8859-1?Q?QtwnEVMw80CAjHmm2OLpEj/NA+OOiq2e+cr+mo8FlMAOVXrSaJzAIwJcZN?=
 =?iso-8859-1?Q?lbmHaqAAjN5oAg2TTCpI4L2TDcauTt1oxYOoBEqhhHKRvwZeYOHQgYwbVa?=
 =?iso-8859-1?Q?45hDlVmhcxEIY9z9AepzPguGvjDY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tT1cz13hGC5lVzqwTSY8lWk+BjUX3wNjnGmOj8DuXKFROetrkold/BOMmr?=
 =?iso-8859-1?Q?+/GtxX3N2fV3Qjo4U6QciUpnxKFYBVwEI1qPo1SpkJC6xeFfl44WDMsNRl?=
 =?iso-8859-1?Q?R/uvYAIp+n46+ldiMB1IE075qAcHmTSfqyucxTMAC9JjsPwtK97WDk+Sng?=
 =?iso-8859-1?Q?rVzPNBpOmwE4C8D20HT4te19692e+eFs2JKYe4icxiHbb5fnyG2fKA4dmR?=
 =?iso-8859-1?Q?7iyZVOfBPa0niDkb/B8WYK/fZwPpvUxcANpSxvbNVZHtbRWevbWEJ0FB2O?=
 =?iso-8859-1?Q?+Y1njIcaTgkxZ15jOl8wD1PYIlnES3BniWAIZ6nuVA8ejxREc/jr2igUm5?=
 =?iso-8859-1?Q?dCr9rPYLbcQ20s+uDw1uS5Qc9YiP0xhHQeAYVUtjZZut/H+Zy3GQZiZZgj?=
 =?iso-8859-1?Q?pAkmJnW4n/iWqKUF+A73cjJqFxhJZFfMrVuzoHcasXQVnvT2GiYOE9rBxL?=
 =?iso-8859-1?Q?dasLKGmw1RaLNARnPbyh37SAx2BVoZuiXDzZslvGrO2GKtoqNSsc9c5G59?=
 =?iso-8859-1?Q?JTE28HSPSe2EomNyA/8iHtSiIFDrWZ/u8uXQTknpN1meVOUvvUjIOI/yRI?=
 =?iso-8859-1?Q?o3K7ew7IC9ETYLlid32HuOt4ZTwKnrn2MEsFhKkK2OF93LnB8kzt6+gGzB?=
 =?iso-8859-1?Q?iOkZwPPMOsjczbJeYiAqLbdslRsXHVhDWk/+9/GdTEMDWe5vBMO/UutFaK?=
 =?iso-8859-1?Q?Iqah0RFNsruUtUWbgfSDxgWbr5cnFZBWovSTpnxvhdk5/kuM3j1lR4aCJX?=
 =?iso-8859-1?Q?umZBhV45PYrcN0ScNo+HO7hNySdPLlk1TbGixkMn80l/PUYZ5WQ8oGtxat?=
 =?iso-8859-1?Q?kblAH+G4tskz+dZfmUqXv89JtVI+D1hLn94h1DNA3qaJtvOK0w/g1PruNR?=
 =?iso-8859-1?Q?e79gT2KC/+OO9Y0jclDXNbMI8VoxuBuMRpE30wx3W2hDPrkR0EHQCqAVLx?=
 =?iso-8859-1?Q?AUKRwhMGdzgSgl03L+vpgVrrU6Jcd38Qw4T2iL6TqJQy2vJCRCTHpFOIG4?=
 =?iso-8859-1?Q?wqlSya9aWlT6qgV7vbqjQFVFIAUKBl6wqkUJzvQUds4Am/4gFhTqjczQRp?=
 =?iso-8859-1?Q?8eWrCGv8sJ0gFfYvQdi7Vup6RIAvhwUb4qU9h4oR4PEOLhPn6Vn/CgtcN1?=
 =?iso-8859-1?Q?2l+RbYjsH5AQMUBm+0Dt7QORHnRb+hBQkIKYRUfCUe16bxoVgWZobKS3h+?=
 =?iso-8859-1?Q?+FiN2aZglPfVoCUa7jzVHYoRNvLX1WazwfwQCZj5Gyr6YOKHJQ+W8wo1o9?=
 =?iso-8859-1?Q?SPJV4DIOBAyhTRpYt0uSKqhcEHI4cXiHIMteMvKbGeKM1DBSKjMZb6dduO?=
 =?iso-8859-1?Q?10bSuUH3uNWGeLv24nZSL7fhESmuLMjmYGhridpvv3RqqDUR+fBYPuq2/0?=
 =?iso-8859-1?Q?mCu4akesSsY1mKpjsjFspAUuFAXrRHcfXCx9xkpZ5tv0MRK0JQosXLGcgc?=
 =?iso-8859-1?Q?yLk5DtWUtI5F2PiY7v+rSMR3KGScBNG5aA5rTTVjpTqYt8JblUu4oRyTG+?=
 =?iso-8859-1?Q?7AQ1B6nu84TNotZcMuK7w2W02Go3sirJwywmpZw+0qLMoMEZ7XA0doiAUI?=
 =?iso-8859-1?Q?BJL0WCDM6lDUlXDY3GbyFwH1N65aCPf6DKVoSn3cWBqnGk4EmbE1dEzPcM?=
 =?iso-8859-1?Q?7Nyt8l2LwsD/npp8CjWbaJM42k25ygpnR/sAl0irfCndVyKounZp67RA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4241c1f-e2cb-4f3b-217f-08de2e91ecfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 15:22:21.4116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oItp5ybrO3uTXT+yrHnp8keNXEyZFyWM1q+Pt6E2HpOoxrGZphqohWzd1zz0nr1z5qLCXoW+X+2sTXFkKaNgionh5uD8iGIqAz7c43FheZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10087

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add generic domain_clamp_alloc_bitsize() macro and clean up arch specific
defines.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3: no changes, added tag

 xen/arch/arm/include/asm/mm.h   | 2 --
 xen/arch/ppc/include/asm/mm.h   | 2 --
 xen/arch/riscv/include/asm/mm.h | 2 --
 xen/arch/x86/include/asm/mm.h   | 1 +
 xen/include/xen/mm.h            | 4 ++++
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 4c6cc64aa7ba..ec2d2dc5372a 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -313,8 +313,6 @@ struct page_info *get_page_from_gva(struct vcpu *v, vad=
dr_t va,
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
=20
-#define domain_clamp_alloc_bitsize(d, b) (b)
-
 unsigned long domain_get_maximum_gpfn(struct domain *d);
=20
 /* Release all __init and __initdata ranges to be reused */
diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.h
index e478291fdf55..91c405876bd0 100644
--- a/xen/arch/ppc/include/asm/mm.h
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -96,8 +96,6 @@ static inline struct page_info *virt_to_page(const void *=
v)
 /* TODO: implement */
 #define mfn_valid(mfn) ({ (void) (mfn); 0; })
=20
-#define domain_clamp_alloc_bitsize(d, b) (b)
-
 #define PFN_ORDER(pfn_) ((pfn_)->v.free.order)
=20
 struct page_info
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/m=
m.h
index 11e9f26bf0a5..e5ea91fa4d0c 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -292,8 +292,6 @@ static inline bool arch_mfns_in_directmap(unsigned long=
 mfn, unsigned long nr)
 /* TODO: implement */
 #define mfn_valid(mfn) ({ (void)(mfn); 0; })
=20
-#define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
-
 #define PFN_ORDER(pg) ((pg)->v.free.order)
=20
 extern unsigned char cpu0_boot_stack[];
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 08153e6d6fa2..17ca6666a34e 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -621,6 +621,7 @@ extern int memory_add(unsigned long spfn, unsigned long=
 epfn, unsigned int pxm);
=20
 void domain_set_alloc_bitsize(struct domain *d);
 unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bit=
s);
+#define domain_clamp_alloc_bitsize(d, bits) domain_clamp_alloc_bitsize(d, =
bits)
=20
 unsigned long domain_get_maximum_gpfn(struct domain *d);
=20
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b968f47b87e0..426362adb2f4 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -641,4 +641,8 @@ static inline void put_page_alloc_ref(struct page_info =
*page)
     }
 }
=20
+#ifndef domain_clamp_alloc_bitsize
+#define domain_clamp_alloc_bitsize(d, bits) ((void)(d), (bits))
+#endif
+
 #endif /* __XEN_MM_H__ */
--=20
2.34.1

