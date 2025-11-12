Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF01C51C67
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159698.1488031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8SA-0007Nt-UO; Wed, 12 Nov 2025 10:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159698.1488031; Wed, 12 Nov 2025 10:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8SA-0007Ma-Q8; Wed, 12 Nov 2025 10:51:54 +0000
Received: by outflank-mailman (input) for mailman id 1159698;
 Wed, 12 Nov 2025 10:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulhw=5U=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vJ8S8-0006fP-Tl
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:51:52 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97c28258-bfb5-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 11:51:50 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9786.eurprd03.prod.outlook.com
 (2603:10a6:102:2e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 12 Nov
 2025 10:51:47 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 10:51:47 +0000
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
X-Inumbo-ID: 97c28258-bfb5-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIunFsVEGYhcl5IVW48zB1HszazKjgssxNQVOZ5Uq/Wkcws+2wpKqvgOW31V2Df2pCn3UdQ6Fm1gU1VgQYRi7nPBNWUuQ3rxf7rcAGD3qfLzmb6KblZ4Tm9aFNH7bB0eJO/Aba38ICypVDrsRVTDsmtZohXh/ndVmhPoLH8WmisxK6cyxJXYuNVjhFfJBwwpzPeqMPMVwQQ6NJOf9nndgCIU7WQkTi7gHo/nqFZlJUvPW+gJ9Nvy2l+hIZH+1YS7o2MaxXzzWIqQ7v6bIUhT0b4FVRitw9rRGYviG9OTYM1ClKORpXtR+aF/GLYJ5/tmZNzmy6+529pynHP/Kf+rjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NqkjAuClLmD7EKX2Kq8rTElBLtaqpCAVge0cueom7o=;
 b=N4/WcQHSsZVyhLsciYsN4EXyoyTRoWqp0vKfXGe/rh9ro3vwWN6DMTbDPLg7Kpxfv3YzEGG6kzsh/0P2XsAfom2r7RQD9uKkydMA0SXCS3n7Cozx/5AIE1D2al5/zSXKIGZrWxM56Egzor/320Tf2QuRrdUTIZ+D2DUhM6ta2aRNyo9pZKlWWOOIBjoeT1Rn5s7tkVxhGTbXWvlPt0vIsCGi93nP/N4gXddrrrSj5WyzNO+cFaq9q0K1gkB95UI03HhMrGsmJvBgoHhyXCg9O0oEBYVkUlqOX+MouFJZUM21eUbgcttGOfoshpmIteByoTwm+Zx1qm6VbZZFhv9i5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NqkjAuClLmD7EKX2Kq8rTElBLtaqpCAVge0cueom7o=;
 b=K/w1Rzv51YJ/zNYvo6FwMOOIVOCiurge7rM7thqvlBhdkePMUBe3iDvB+UdKy+bTK3iyMD9rNKKRNHZBbezG8klZjIWpAi8OrEt1uCszwfpdMSx8WQjDQNo+8Fg/hR8QkIP2ioNy8tApCrRMw1QKqZlBiz/wJiU8+bWkgtBtpiPjkKwAot6WAH/VQDq6Ba+7KagOzgzvP7D+K/zZaJ6oFbqSu0vpJWTqhpa1gd0Wf/t21a2fJIU9Tmapu1Jrkh8eeVd/gKPfmNWqRQ7sd/SE/g/6+HLetqbClMt2+6oKWP5iB9CSX+xwP7sx/sNjxz4Msr1Tw3G7pTEgad91Fca6KQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 3/8] arm/irq: Keep track of irq affinities
Thread-Topic: [PATCH v4 3/8] arm/irq: Keep track of irq affinities
Thread-Index: AQHcU8JXa8Kfz7C3KE+RoTRetAsLUA==
Date: Wed, 12 Nov 2025 10:51:47 +0000
Message-ID:
 <a467474ba2476ff85c52483f47ac1ba6a67a7a22.1762939773.git.mykyta_poturai@epam.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1762939773.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9786:EE_
x-ms-office365-filtering-correlation-id: e783116c-4e85-46f4-22e6-08de21d97a6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?cd20ZZNR6TSzY+/yHhwLVYz+2LfditFAn5Ep/rs5LVI24cKX+oeM4vEckf?=
 =?iso-8859-1?Q?zfCMbT8s9+ripUjWpUwnjbdjnzp70ZIaSUgrScrpPGLyAjI5fPTfAwqw3l?=
 =?iso-8859-1?Q?0ud5XdQJdl0LR7kBCVfpZ0C6mdmZCYNpGv7ezK59254h1+yF+o5cja3yjV?=
 =?iso-8859-1?Q?bq6D8iTERsxrBLBUgVfuVip6Q5DfmCOLnxD70E6EQyD0jRvc+CpXQL45gd?=
 =?iso-8859-1?Q?LVAFJPz1R7KZ5AfmQjFynf+HrGeBABQS3B39E94+rgfp5kC8L1+Oy4R2Ol?=
 =?iso-8859-1?Q?nE13SWQPuvZf5RH69j7B9WshIOb6D9URaCYYgxfb/hlQ2RwdAHtXbCCauj?=
 =?iso-8859-1?Q?JB50NVWYIZeeI9rowsjUfMAoE7Z2pi+eCoSWWIyLEGkYSjAFfl2SJ+BhTl?=
 =?iso-8859-1?Q?M7dag/y30WUpWDgI4LH/XYQM7FgRDyzM2ZjG2ykjwfeJfvHBMNgBA6j3AR?=
 =?iso-8859-1?Q?cI1e1DYVDn+Wot0//lwJU49PBeSf877ixkr7fHop4Aq5VlUhh3LfW8MszQ?=
 =?iso-8859-1?Q?7YH2WAzPvzWt6J1ltaSy0L8o5CtuOtywHWNzn8n2i0LiTwyJWYOyZoM24Y?=
 =?iso-8859-1?Q?rCITe+2J6CRKiacqe4dRvZSkViy+Hq/j7M9EFaDZjlmFQaAn0343eZlOGQ?=
 =?iso-8859-1?Q?qaEJvFTfp77Lz79Wik8El3rHZ5oG4yrePwMzhRZkae31CJBACgwt7FgjSG?=
 =?iso-8859-1?Q?pV8wjPCtWa7hJZuz/wdeRxao9Ge4C1GIYXRo57T5+R4HWd4gtcWXMwDkg/?=
 =?iso-8859-1?Q?tJXrJiooB0p8ZYRvFJo2yN6Ln5O3ysh4z5U/VNVEXiaDN1YyEmHcCE45O+?=
 =?iso-8859-1?Q?slGBpzh1r49Tb5q6rxx1u2rclH5E6Cc1myKjAaVnwfZ6rxlgAZtfQ+mLTF?=
 =?iso-8859-1?Q?jpoIAX8UR8mJ/6UJPhhq036PRJmTqbTwM+1i0thtBGj71bfCI7wlMMM7XA?=
 =?iso-8859-1?Q?i74pO1GPCK11T8bBli1Xm6ntMXEzRLy1tiArZLm27lvOda034qzQ4HKzy7?=
 =?iso-8859-1?Q?XYezl7x6ly3jzYlURBKOUw52l/TrglXPJ7vtIltF/lr66Dz7WsSq/S8Std?=
 =?iso-8859-1?Q?pX8wE7oYQSwWxSsbrOBmFo6uFoRqNOpfK05YRrwYD5OsC7i3ikk0EMZQ7C?=
 =?iso-8859-1?Q?qr1DHz+GL2VZSuT/DhbsFzuLpYgLtKDOpgxon+17GHbGVmwllPs5VOlVhF?=
 =?iso-8859-1?Q?UfDxAy2a5WtUVQAINTdX0XZ/VBXVBU5PUd8Y2acbdgrSGi3HzsP5eqzoV7?=
 =?iso-8859-1?Q?4moAUFF16W5QumNuZpgn0y3VDt6WB5+n/9rksCM/XupSgjQ9y0FwJeA9jL?=
 =?iso-8859-1?Q?tiIIcLnrxbbzBPIL6yViXFLMuJybnR3LY/wskH1eBXqgI7pIfi49UrsPHj?=
 =?iso-8859-1?Q?lUh/svQj5/FEuhIhTFhCVqQ3Ya9TADA5u5d2lOCYf1cZ8qTxKRVKtgEQXL?=
 =?iso-8859-1?Q?50fdCnIVOYXNIFmVYDzh8ZOeci9s/+kgPjMhn6pGrsDSVhLk9uZQVF5n4K?=
 =?iso-8859-1?Q?8TPya89Cvtg/Sy3wGh2ThzowEVwQo/ZsbMAeXs8LEwz+2kyZ0uKlggvIAI?=
 =?iso-8859-1?Q?iWVNC3Acrt2m5X/GPCMJZys2UVDy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BeOiBqAv4PR6fLUNmvFCELM0iCmFPeNqKu3hMf4S9Ge9akJBjDqmsSboKE?=
 =?iso-8859-1?Q?zYILBFU2xKspoVF/D8ZbUk9YvhdOEzin6ElvRuUbdEgLa52f0YRjXEt8Mu?=
 =?iso-8859-1?Q?LleWiJri8/EfHAvn1scOHgIcLzvSJmU6zYklbi6Y/+U05n9xSiNiX8z3BF?=
 =?iso-8859-1?Q?kpPwppRaUHPz784x4hk/ysjqWP1d+lObm4O/Y4HFHUDgTnSk29BAKlWmr2?=
 =?iso-8859-1?Q?Dxsq1awtMRtD09ur5Z0QpczRxNLiECJ77gLXk290lW/1ZYOOS+rbyCdwpk?=
 =?iso-8859-1?Q?8RHTxqngykCoOGk7LfVlhoB1XHSctHxfMVT/6ZRNt3lVUsMMQ57tUZuCq9?=
 =?iso-8859-1?Q?yrh4tM4xkXKPdc9r866NQlLKbMUqIYUkGjBKq/pC4c4tK1rc0evMnqHUoL?=
 =?iso-8859-1?Q?N3TAy2FM+N1bAx47eARqf43hPbM9dqzR6UJOMvp7RiV99oi+0zO6ZjP4XF?=
 =?iso-8859-1?Q?iTv8ui9uxXNwPJdtLveVOr3BxdCzkkGSj99WlciD1vwAOAkjxulQnvNluW?=
 =?iso-8859-1?Q?nbrDYe3rqO+6WZtzWwsCFYclQ0qsyMXa9P5eah9tj9k/51A7Patwn4IBvp?=
 =?iso-8859-1?Q?qvKebqTB8XFT3rU/cAmjYGdXAN+XSZNX3H2h+P81R0OdGckfNVYg4MIUy6?=
 =?iso-8859-1?Q?L4klAtLptUo27pqMRshdNbYV0zWVOl7/t0LBtV/a59yRJo0TWaxJt4Orlh?=
 =?iso-8859-1?Q?Rpet6LGH6ktbzQOq3x+eYp8yr9KDuEU9WwXb2faASgLAUXR9kIMoDldqVa?=
 =?iso-8859-1?Q?a+MhdwAn8wizGOT3OBSmHAUPOJh+L4901fttqNpmhdngamewgMZL4BUmwm?=
 =?iso-8859-1?Q?FAi+Hn4SPMeWe6umjZW3dkWWOASJIghjG6p/UxawouPmrHS8zydmmwWb5X?=
 =?iso-8859-1?Q?T3zBjc/07dT8IUCs/AnSr4TQvxmgTLHJQqTxsFNcKYIXpn6zrpbLtiPn/7?=
 =?iso-8859-1?Q?rx9PkpxKnkmopbCHgbceUSB2gmuJaEAf9ohvMHUeby3V961vdYsg6N5g/V?=
 =?iso-8859-1?Q?QF7dQWQ6jFPFvs8dRDatIaFYrT4gNrNAIyJgMXiyU068VBLrqkZFSypWEw?=
 =?iso-8859-1?Q?r2UH7o4gBp/EngWkKSxBeSWsFwFZxGFVr5TJ01/mh/JXW8FztjDFk4rj/Y?=
 =?iso-8859-1?Q?wFCTAubC8N4VnR4KKOldGkxVQKqlCotiBx4lwKccn3KNOKos4W3V2P3eYF?=
 =?iso-8859-1?Q?fy4LYX4+njVu6zWNOhdTJjWESsqHxe11FpwiO23ctV9c4By97PIKjjhwrA?=
 =?iso-8859-1?Q?0raPfl6uulj3oEhq138ApfyG8IQAWCs9uIiwaJAxG1iOp23IixeCSwvcS4?=
 =?iso-8859-1?Q?rvNIMp0sXl7Hx5lbGokCVFgPOOkZtTy8db1IeF8P+GebYWKqqvYHBcyz1S?=
 =?iso-8859-1?Q?PbNN6vEQmMPCo19BqdSCnk3tW7cFURAUPDtnZsUkqXbh0xV+1esUwQUuRt?=
 =?iso-8859-1?Q?VMkLykKiP8L4z5P9A/hNNw3zHRI9L4hzMTi0QUWYNoW+FG+8rA6OrPfeu7?=
 =?iso-8859-1?Q?O0EZPUzAiK+v7OJ+Bo5W85yECWTL0/WXDoFib5CBCY7fp/4gN26481AdkH?=
 =?iso-8859-1?Q?PS4i2LQglI8ASq5OITroBUis8k8Ti69SNrrz5tQi9V9y4PJp3KmZrmjGUB?=
 =?iso-8859-1?Q?Jr7+/RvVxHfF+v0N0ky0bDvITMNbWZejiUqTgjYNZNgEL7GYBiWm+0CA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e783116c-4e85-46f4-22e6-08de21d97a6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 10:51:47.7457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vjAZlfqUelx24C+9gUWiL7EBWMITQoeijk/CnzJKWnNnLbKHzuLz3VQEmX6vE2cEGwYvqA1j2dJXGnia6Dwgeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9786

Currently on Arm the desc->affinity mask of an irq is never updated,
which makes it hard to know the actual affinity of an interrupt.

Fix this by updating the field in irq_set_affinity.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v3->v4:
* patch introduced
---
 xen/arch/arm/irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 73e58a5108..28b40331f7 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -219,7 +219,10 @@ static inline struct domain *irq_get_domain(struct irq=
_desc *desc)
 void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
     if ( desc !=3D NULL )
+    {
+        cpumask_copy(desc->affinity, mask);
         desc->handler->set_affinity(desc, mask);
+    }
 }
=20
 int request_irq(unsigned int irq, unsigned int irqflags,
--=20
2.51.2

