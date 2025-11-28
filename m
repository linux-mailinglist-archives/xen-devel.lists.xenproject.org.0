Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDCAC9272E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 16:22:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174944.1499873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0Im-0006hC-Ka; Fri, 28 Nov 2025 15:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174944.1499873; Fri, 28 Nov 2025 15:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0Im-0006eT-HY; Fri, 28 Nov 2025 15:22:28 +0000
Received: by outflank-mailman (input) for mailman id 1174944;
 Fri, 28 Nov 2025 15:22:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqkP=6E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vP0Ik-0006eN-9J
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 15:22:26 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a2cc5ac-cc6e-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 16:22:23 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by AS2PR03MB10087.eurprd03.prod.outlook.com (2603:10a6:20b:62e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 15:22:20 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 15:22:20 +0000
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
X-Inumbo-ID: 0a2cc5ac-cc6e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUfr7MrdpJBOQeqvzWuzq+iBEOgazMgG3NcJwgcy5CoSmmMZ4wug0aCn4XpyxM0ou9ib6EGl6qX6EixVOlSo9ELpNsuaywTOIySXeR0KqYtaCzYc5PV1QYm89430fbT/BLvaDqt08ZQjOHKCewPrDaK0t4qqHLDXKwANTFrhWLIVH8uLrJ2Ftef5Iqdb8RoysQfkH9krnzciO54L+jiGfNe3r7MR+HpuuHHJojRBJQdt/k5sFaYZbLG+TPaee6EiVj10xk8UBOW+9XGjD6uq8Xji9jkTKUGS/O0JDpjPpZfST5d5/d0J7v+v4YGkoemZXoi3awfSqrXN6Mf3Ts+kbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhllEEdN8c/THLolcCsFuYa7Q16LQxiDOFaDDhoCu58=;
 b=OLx/e2Y/iknm6F+e/5PqYXMjGgkGuK7Ito3P1kQqIK/KBALc5ERyrKgGl+Yq4QYQB8/RnN4SpWm1AJfm6Zd8t1AgFLOKRmrDfdxgni2FhjUVz+XdkPpol39CReQZENW+y0xX2Aq59BQpOPsqirjOYsR99nkNYJlKkW4GeC/jJg5sxJP2HJY8dFOIY6Bq2QCJ6/mMl78Q3CvnfBc3JO3hZHyO6STb8KT3lEN0x/9AlB4cM1l0Srcw2B/7XnxQ7CytnTOlpwMoXFOLxnT3NtaX4JSI38PQmwYe6dXkl5L4lh+2cGKvkG3ffLV7AKJbR1S3M88cykTFs5begjILy3UVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhllEEdN8c/THLolcCsFuYa7Q16LQxiDOFaDDhoCu58=;
 b=EzWzbibh6e+cspO6HQd+Bgjwnxm6xoTIZwZelnMb/k8fJgJ8vI1Ga5A3mFORnuHJ3d/TxKXdmz4WeknYk8nB71pZabINBG1w6KJHSf7yh8EsNcKUZ7JpAIizUidvp//cmfTxX0VjjfFpeinneVYPPJKNcGIIBSKZoSBZdC2WKhF0S8ViFr6xYYQDhwlNAuOBGsry7MM/eokDIbSnQ0NjeDFKwqNp3RqgyzOyog6Krgla5GUALtq6kotLHrtJzJyh/z3QmndVChHZ3no3DN58pQorJw/SGmOX8Xx3oZzptHBx8CSOmQ3oI5ATt7D3P/Z95MZHyUkm/IxEWcQcMvwBnw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 1/3] arm/ppc/riscv: drop unused domain_set_alloc_bitsize()
 macro
Thread-Topic: [PATCH v3 1/3] arm/ppc/riscv: drop unused
 domain_set_alloc_bitsize() macro
Thread-Index: AQHcYHrKJo3fQNjNOEm0i3u+ucdXcw==
Date: Fri, 28 Nov 2025 15:22:20 +0000
Message-ID: <20251128152218.3886583-2-grygorii_strashko@epam.com>
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
x-ms-office365-filtering-correlation-id: 23721e61-7608-40ad-31f4-08de2e91ec92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?yrF75vEESpNIOSNaLPAUaZ/R5kRubxv6e69bSoAoOe/B2Ff/M8Qt1N6qez?=
 =?iso-8859-1?Q?LfZdHO8rZZrrxd9ocmy1dZoAqQmA9U3ydm19rrd8hUoGmfhZX5kdhugXce?=
 =?iso-8859-1?Q?o03mQwm89yJyODP+0/rfBxcDfozYp8tNxeJeh4Y4e1+0mRDuz5juTXWoYo?=
 =?iso-8859-1?Q?OSS20Td1qSqM5hPtTE6OvdPKM+guTMd67PGzHAT9MrXKzv/GWtahbsm/IN?=
 =?iso-8859-1?Q?WSWuWF5coy93/Z3Px3ELkez2j+X2r1giApZuuiYDOw2w0Eau9lnSt0uqyN?=
 =?iso-8859-1?Q?JFs8xhZN4juGbFGbjqfPkRzkd40fG+xI2VzgbVOSG42ZDE3678HfKt0ulW?=
 =?iso-8859-1?Q?944NXBGo3cFRA3qFXhR6PZqyDE6Iw1eZxO2sQo8yi0CiEdz1utTn5VZ/6z?=
 =?iso-8859-1?Q?zPLo8Gm1N+PBUAhiTfhYeEJVkgw9rYz0ZLFpZtRnNacIXcRdOmZmhIknox?=
 =?iso-8859-1?Q?IaxfKuH8ecHGxlwTch1xo9rJFBZlOGLjpxB9UXO1tFrPcsMLY1QjqA0Zh0?=
 =?iso-8859-1?Q?/Iuwyb5/zDcN7WyenGy0eyNCJ6CupkpVq2RqpfUVAOpRfQMo2MrgQHIAYU?=
 =?iso-8859-1?Q?5DDKIWt4jUHG8ICIiCYYTuXWs/EJJi7ZRDXhYykr0qkdxUHJ/fVTDXY3Wh?=
 =?iso-8859-1?Q?Y0Je0jgg1xo4iVlM0dQry6MXQ+9WL8OyHVFQW1H1cXGLBfmHhwUukoT2o7?=
 =?iso-8859-1?Q?7sqioWyiSBmCrDiH1e8qyVDtmJhgVAOFvukC5FB5epLsVK7fJUvdhkc3Av?=
 =?iso-8859-1?Q?O2tsp2YgYKBmzDBGWAiXJH71dH9lUmyXJsVJP1eyFFoHhRfEg33WaQGGS/?=
 =?iso-8859-1?Q?4BOEHVyXa63fLyk6AUZvpybBIPD+uSbDXFzHAt7ayKL87D6wj9uRnXuF7Z?=
 =?iso-8859-1?Q?go3XuKHd90uh19aBra05ubWJAB2UHtPhqYb7aJX1ynTOFn/IvIlE63j/1A?=
 =?iso-8859-1?Q?dscBuiT2Mit6ood3ZNYZFwo6PlBuZ992tpwFOsdNiWR1f813QzMi0gTKEw?=
 =?iso-8859-1?Q?9QYjXy4D2YKydkjj+qqhGkyIIYry7HMBYZf5lmqW0d4GpPw6Ml4OBDg0Lz?=
 =?iso-8859-1?Q?YFQ7+HGg8xFds0VBicutXJFSt55wFhwlC6J3JT7xxo4fFGrNrYBFRFAvRC?=
 =?iso-8859-1?Q?AlHWBiHiNvOFMoidRvUSX8aPWVRc7DUldLTXd8em4ebO1FxGHIm+MfgsmT?=
 =?iso-8859-1?Q?7bouuyYmJzmtQNhlOGBdgBvLh885pvRW3+YELcLkXCWVhVrPNrqAx7x5WP?=
 =?iso-8859-1?Q?uAZyKKyZn19w43twdd7Z1yMkHj4GSOCUxi7mCxRpe+FDPTHAwsDS8cP+PM?=
 =?iso-8859-1?Q?sJGftwchb3NPdTSvJ2t9tF0TFBg202dDAb8TaZOCEqB1E+gTZil9oeCv6p?=
 =?iso-8859-1?Q?qoBkm5wIGYypiBP41ZDBTNwoyjQkKKRXp02195jDqKwPyK90C3FahcfnxH?=
 =?iso-8859-1?Q?Zgdl26eZcegRuedOvz/PWS7rjtjExOHXyP15pqgiF6EigU+YDusJK+QAfs?=
 =?iso-8859-1?Q?rFgkBmwNcnZzJAcYfq0nRyfeycqJKxS78LKZKMpYSc/TqSaioJo0CP85LP?=
 =?iso-8859-1?Q?bov6WlogvG826wUfGxgEFOvMhN4Q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fNmTnK05ZT6kDiDqqUUX/F+Uv3xLy8ELk8+Es0CeBqykOTOqbmW3LVVogK?=
 =?iso-8859-1?Q?lfUn3ZKzzOt3hHmMfaX3XcrukJSVCIGIksH/iWM/ENykH/ESxv/yPxnER0?=
 =?iso-8859-1?Q?5bcBbYNR534rF8oiqRHFSnu+O9hoKgqFhAjnzmmPO9HdEffxXwBUlIkIrm?=
 =?iso-8859-1?Q?5L/kKyTT5Qv2t+wvC3bGrtnWKGlTEGDyZ8eGK+eOo+ULbI8EFmFUoZbhU2?=
 =?iso-8859-1?Q?H6UgqruzqO8X5F0R9B2VUA0f9a6b2shqRYfPRumSgGRnIeo/Dqjks8cY+Q?=
 =?iso-8859-1?Q?GHqX4o2m8hdYdpwkKNe1GQ5bqdxte2VJSelZJLM69+gCOxqPSv8GXIAR2t?=
 =?iso-8859-1?Q?QKVe/GLWhbBFZngAHJwsxdKaiuDyaemY2MJ9PKatBtuhmQDq1eY9vGDfq8?=
 =?iso-8859-1?Q?qctJ4wtXnbBVg8JhFWGxIg4R9iMMns8XORyjRfOpdPW5ZunBY2LnH7ul6P?=
 =?iso-8859-1?Q?7jdoWoLfj81wNCuJhfIYTvbvFLD5kOgtQRYvD8RY64rjGlp0zHf6S9dKQM?=
 =?iso-8859-1?Q?gtUs/5+QtmpMHmtVuTbXTLQihxitdt7nyfztoQj739mBNeindM7DYzHF3N?=
 =?iso-8859-1?Q?HQ9s9lcBgveEpTV1bM/L3WDrdrtvOa/ePG/Qla7/wu/L3Qgpt2Z5+X905F?=
 =?iso-8859-1?Q?q4xG4PdCCDA1iToN0+5vPiN2SQf75QkX/jyby1K+QNtxxO3MfIcwXM+9R7?=
 =?iso-8859-1?Q?F41Nv6C5FsIjpXNNBiTMtgsQQt/F6axt+xg5ZD7ymD9eLI9GGpMvR3EVt7?=
 =?iso-8859-1?Q?ILnyR+bfNJKNPoqcTTWKQTBJg7sG0y4P6Qx0p5omHxa12RRQ5J9BIPWImB?=
 =?iso-8859-1?Q?zXYCVruJFXbGov167dhaSNfzkdiV3s9Mnylh/nq7p8AMF2JEETTzLkWOGd?=
 =?iso-8859-1?Q?mD/Ca5phW0/DndSNi+cARV9r/VSWtbA4jP9yIx6gj00ocspGSd3x2JPdwV?=
 =?iso-8859-1?Q?vXzdWxbOSrORRNVPs9urjyK4TjyeE7KmPdR2cSrI/xjLbwlhyF6aGAXayj?=
 =?iso-8859-1?Q?Brsohq6ApXk43G5XhF6hJhWTVZehJ0Cs/GbMly9UpF/H6WFfg4nyRS/CDU?=
 =?iso-8859-1?Q?JXpEDOG888+lF6mPy0J+tOuK2HAT80eIOnHFGNF4dNeAYUuVIER+DD6D9C?=
 =?iso-8859-1?Q?/BQNjOeR7MYvQanJCwTRqI69WJGyuGgL/E0bdYpr+Di7es42O1FwGpJB4v?=
 =?iso-8859-1?Q?TVXIZB09Wcpw8lvr1Pr0gMqS5cYLSQ56l9Gp5wUlJ75zLRwq5WgF71O2w8?=
 =?iso-8859-1?Q?rZ54mnz3v9KUR2O2vopS41N63SBAcnCSSb5TwKUg49DkMKrrhzuleoygh9?=
 =?iso-8859-1?Q?ee+uBN43q8IHwqKWs92tz6/es7R0D7tQ1bhgfnfGmstTmokO2e3akLjVXI?=
 =?iso-8859-1?Q?QsNAaOgAerr3NcbSwGckgJ47ap8E1q7qH8DuA4nvYPz3TLhm8laHlAg+OW?=
 =?iso-8859-1?Q?55JQxAEFtCai3AI+Q5kMjelR+3wgfKxlVn5W3i6hcP6kyV/OoxLKlaysOD?=
 =?iso-8859-1?Q?WYVoMmaNL/cTWIDYaKO0NYOkjOtUtK5OGPdcKBuln+qbLGNqIpgjQimiFG?=
 =?iso-8859-1?Q?fu3DhuUlrvg4yXSS0HHpOeZ5AVr3yDpQ5+EdheIs2TRcyJNdaPnp7FC1hm?=
 =?iso-8859-1?Q?kSSWOY81FqbbwG6dW3YhINVXz89I8Nu6gDxV0AY3xTBL969ADHunVv8A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23721e61-7608-40ad-31f4-08de2e91ec92
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 15:22:20.7186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BEO8ZkYPt7Fwp2XeF3AU/LDc8b6wlGc41srWfkoncKzj47RWW74SR2zTb72ey9MToDyBFYSMDgs7JFpLUImXbUHIK9DTj0YoSUD0SDx4O2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10087

From: Grygorii Strashko <grygorii_strashko@epam.com>

The domain_set_alloc_bitsize() is x86 PV32 specific and not used by other
arch or common code, so remove it.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3: no changes, added tag

 xen/arch/arm/include/asm/mm.h   | 1 -
 xen/arch/ppc/include/asm/mm.h   | 1 -
 xen/arch/riscv/include/asm/mm.h | 1 -
 3 files changed, 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index f702f4a0d676..4c6cc64aa7ba 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -313,7 +313,6 @@ struct page_info *get_page_from_gva(struct vcpu *v, vad=
dr_t va,
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
=20
-#define domain_set_alloc_bitsize(d) ((void)0)
 #define domain_clamp_alloc_bitsize(d, b) (b)
=20
 unsigned long domain_get_maximum_gpfn(struct domain *d);
diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.h
index a33eeec43bd6..e478291fdf55 100644
--- a/xen/arch/ppc/include/asm/mm.h
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -96,7 +96,6 @@ static inline struct page_info *virt_to_page(const void *=
v)
 /* TODO: implement */
 #define mfn_valid(mfn) ({ (void) (mfn); 0; })
=20
-#define domain_set_alloc_bitsize(d) ((void)(d))
 #define domain_clamp_alloc_bitsize(d, b) (b)
=20
 #define PFN_ORDER(pfn_) ((pfn_)->v.free.order)
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/m=
m.h
index 9283616c0224..11e9f26bf0a5 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -292,7 +292,6 @@ static inline bool arch_mfns_in_directmap(unsigned long=
 mfn, unsigned long nr)
 /* TODO: implement */
 #define mfn_valid(mfn) ({ (void)(mfn); 0; })
=20
-#define domain_set_alloc_bitsize(d) ((void)(d))
 #define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
=20
 #define PFN_ORDER(pg) ((pg)->v.free.order)
--=20
2.34.1

