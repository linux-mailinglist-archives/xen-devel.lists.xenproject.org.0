Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01BCB56050
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 12:45:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123132.1466395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxNkM-000526-LB; Sat, 13 Sep 2025 10:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123132.1466395; Sat, 13 Sep 2025 10:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxNkM-00050D-HJ; Sat, 13 Sep 2025 10:44:46 +0000
Received: by outflank-mailman (input) for mailman id 1123132;
 Sat, 13 Sep 2025 10:44:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nB/d=3Y=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uxNkK-000505-Og
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 10:44:44 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a83b80f4-908e-11f0-9d13-b5c5bf9af7f9;
 Sat, 13 Sep 2025 12:44:43 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI0PR03MB10855.eurprd03.prod.outlook.com (2603:10a6:800:265::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 10:44:39 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9115.018; Sat, 13 Sep 2025
 10:44:39 +0000
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
X-Inumbo-ID: a83b80f4-908e-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfEubHy5ELREPkhTtIxg5gN6rqVgeCcOOZveRD2jLAMhIpRcXNEOp0v1qstEjMewVQ6EySUpkvQluiEhPRDMZE2xUGNJ+Ow/RK8CB5zonhvoKjPqwBkhzTVcJk8/mGnJK3tY8vD0t1V//+a6M/EkpET1tEBALw8A0uuiOCjLDjNLgO2dLcciiCQsloxdoCDWavH9nG2bXFOzJLWPq1/PAHLGGIrCkztSgKyiVI+xO60ZKD06R30bRvmzH+odT7d8tRZzeruXX6f4asP/pMIA8ZIMK9n6HrrInu3SfGENUHuh5WApZEZXtPs86LB9BaPW9mPFNxfvmpw+k2tKIA4MRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61uh5N/uThDNa1TWy+cKskqdhGcAZG1zA83c/tYm0iY=;
 b=OWCJdBHXwKxRAi537jC4ShmllQT58IbKeu7H0hEUIt4c+mEmhqVVsZc7QtB9lWEAee8bLoFkuHu6WlGeFzLxiDjKXybA/noYnagQ33ADcQquAq26D8ZT9cTVVgPmkHb1KKRraXrsEokaYsicpT9IdqzYyCPSX5xqd809Eid/Ml3bndyoYHNUYtJPvbr9GQ1nFvw9cbJHohKXt53yXy0kujkPc3Hqf27REyh4mCyJ7/EW6cBO+w3EEJ3UvOtmrKKpHOa9y7I0PU4d8bLncSAN3FPLjPT3WoQA5xIs4YKqu0qGTr8NTpVrh2UUtdlQJfrrmTwtzW9dCGor4AHF7t5oVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61uh5N/uThDNa1TWy+cKskqdhGcAZG1zA83c/tYm0iY=;
 b=SxXHOUiP0KYgVYwFDyV+T0jowv7qFyz9gG6fjUvSMP5wf2tLrXvx6y8UEYq2ej8q6O8QyDA+U080CEBRCefAEIgfEcVu4cILxmdHV6+3NwBcui3KqSbLa853G6WC3E43GDrRMyORia33bM8BE8FqS9Zd9azvQHdXs+JFjsk3b9UfLlYZphzrorSgfIyryS/jbE5XGSZgvNygbhjTYADSyBvQRv2OPNmTcUlcSjVWUvCyOWbsDHXUAVOGBW0HyCwyvBKqbBGU2Yvnr+TlaguERHeOZMFkYPSsPjY5GGGOiSNtS1JY16cTT3NboWfS1zRQtqWZJEYx+k7iX9twYkIrvA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH] xen/domctl: Fix double domid_free in XEN_DOMCTL_createdomain
 error path
Thread-Topic: [PATCH] xen/domctl: Fix double domid_free in
 XEN_DOMCTL_createdomain error path
Thread-Index: AQHcJJtnc9kfi+189ki0+czMQTtF+A==
Date: Sat, 13 Sep 2025 10:44:39 +0000
Message-ID:
 <37561a9a3b6000502bb1a43651f6ddc49cd9149c.1757759941.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI0PR03MB10855:EE_
x-ms-office365-filtering-correlation-id: 7dbfced2-b058-484c-50a0-08ddf2b28a68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?QMwoHkwSTffHXLO+sboQzbywGJNxwLrqMoAN7w/CbY8UG6OU7rq166df0G?=
 =?iso-8859-1?Q?cfvmMWS7WBj9q3tqCmY/IXKJPcrp9hCCHSFHEz7UbBxBbJdm2u0IqT/sC4?=
 =?iso-8859-1?Q?E1cG2ah0ntpqi2aLOY/hJy6z03hIIfX+P97AD9dtE6mqKvymqjhvuUlLv0?=
 =?iso-8859-1?Q?c6xSlv+KlhaSuH8CZh+GIgGqlhs/jlIH2u/jxTyfDz6rWmFKT8Y00Jgl6g?=
 =?iso-8859-1?Q?jSCJD0HHaMhcVFDmDXIWu7Q+WJw8pDSQOuPDqtwKNXXwEKXZPbHMcvKtqK?=
 =?iso-8859-1?Q?FoPS3/oj6fMXc2AkZTA0RgsepzVN07rGt4oQCwftATsAbrIeOaGLAih32G?=
 =?iso-8859-1?Q?rAcHuVLNW3JTZokIiNK3cyE8Y15QAVX+KGfTQUSGoR2+PigQLxMbvlS9AI?=
 =?iso-8859-1?Q?cqFJM/CSoDV2b5FrChEN3UmKBjcrfgQ82sam2dpcTOJh1fjX7CidnRZPFT?=
 =?iso-8859-1?Q?sUE0xQcz/LK7vAV+CIP7xpZdjLKXnrLQ5SEfsWqVSjqVlN6Rn9WygTSZOf?=
 =?iso-8859-1?Q?FLYLSnkmPvY8RA95xgp9IHYIZwCyZCp1m6hL5R7joEX8ILWJzwmMUTOBr6?=
 =?iso-8859-1?Q?yz0x9Lb0PiNni5tvKnplemRLc8H3zFbEjM/r3Uy5fixDK2vDJxBP9k/PS+?=
 =?iso-8859-1?Q?0wzudYlaoy6HpnaKynFPTteLnXSKLCxnn4R5UzEhIoJ/NlR0/jyh/fFcpd?=
 =?iso-8859-1?Q?hajhqDvyYTjpYQ+p3rJ+xJVZmWKWHhTsIn3BqjoYz1sewJkiwFapKA2+RI?=
 =?iso-8859-1?Q?VNDcJDlEbd/xMD4Q4bjTKx2UXpL60T4EHTsV7x1i2jZlvP16Xb4fAOvrjF?=
 =?iso-8859-1?Q?huURrsghHTed0RH0+d/kMi6HO4DVmmelEQ64N/21M6H2yncUDmfwJx41il?=
 =?iso-8859-1?Q?o2256adgGHSgWUXrKUmw2x44P2zTsouxpDpgFGw/SZx5cB2gSyyXxEPs7A?=
 =?iso-8859-1?Q?HtlFaHIrERCHJA22yrshfVoRp8AkRzPX2RjYKT5voZSkkaJhw0QDm4JVM2?=
 =?iso-8859-1?Q?a3SUD3BoYD2kDd2EiJQCzg+uPV+/BJkpjoSmFojHoBjc+ku6w7RwStm1I0?=
 =?iso-8859-1?Q?mQQaQ7baDozsfNvi7d1woLi8bcZbzkEz6aqmjFsEE6GSGF4PNCkCl09ouV?=
 =?iso-8859-1?Q?H+FFeWLRabTmPYi7GGdhxkjXzQd4hx96yoQlRQi0NRvvPpN4IVDOCs98Wo?=
 =?iso-8859-1?Q?8O9bUJlvsAVGRUvny24wOvznbFelCkrdkj6/RPOfR0QpRtTLJftsJLz875?=
 =?iso-8859-1?Q?Ny6oPsQIB4Ae2ZDFzvLqcvwgIqGXVo4qGHa7DOF/Xc33ztaEFU0HV3RYwL?=
 =?iso-8859-1?Q?SlVUiMz7+PaIZeMCZAMJlmR4xVFNuyLgTuadKN/fbLLdss3rXDGJA54t2L?=
 =?iso-8859-1?Q?cKFid3SZD93fC8oxMtfo6Kuv4PqQ6iUYNYDHozf0jalcv6oXmLThI/VQmj?=
 =?iso-8859-1?Q?4TzVz4wuZjTL6kwHFequKsnZ4BKTKVAiwXuC26tcZx7EBqd5GyyofQAmtx?=
 =?iso-8859-1?Q?hjKG0DkHVfo0JAmt14kfdioZrREXzoIg0iH2JENHKuXStcOzfxVnx9f01A?=
 =?iso-8859-1?Q?JGqq38E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?znMq04nmhh51JaGDq9Ipt6UGab0UJaBt45SGAFW+J/mSLZczdGSnbYbSrv?=
 =?iso-8859-1?Q?JY3oD4TuMPX+yNho2CmozPgmxeNmSnF/Um5Z68g8aG3Y1WR8yGgZmB0VJy?=
 =?iso-8859-1?Q?DSnxsS4m2FRnJ3hkhzfcQNPAc3blfFCai8snD96fw5iEbCpjGzXToJfG+P?=
 =?iso-8859-1?Q?mmCERuPrAG7rgaBP+NRlZsnkHoM4Y+Er8Fx9HBEEcUUCg7xu3vDagI1Grk?=
 =?iso-8859-1?Q?U1iOwO6mFIG4nTC3pQuRz76srHwSkYkr9f28dtQzBTox7/VOHjZ7UKkiRR?=
 =?iso-8859-1?Q?xgHLwCJZIpIrIWBESFr4E+PWp6150gV9mvyDboBA9R/NXo0gB0HEjY/ybb?=
 =?iso-8859-1?Q?jrfQGUchHwq2k76eY5SNi0/hC58KQjI11I2BPpiK8By7fEJ7doPBB1DsRi?=
 =?iso-8859-1?Q?ItYf7VydzFrHc7ol8EEIOY662ifiIhooaoDmsAEC1Q3c/UghvcJaWl5cgp?=
 =?iso-8859-1?Q?7frKcOsDe+hc0Qu/cCaCmsnjGMDXA1RyxBpcEnOx7rnDX7oCLS/JvDecox?=
 =?iso-8859-1?Q?19n1dgsi8pIGN0yPNxxchhvtxjs2uuAIpOOU7lrtQnJwgOZBsWa35H/zWQ?=
 =?iso-8859-1?Q?G/rjizr25U+nMGUs5uQYP1zERgwEVwnzSRXhlIhovjiMmA88PgdTmQaw70?=
 =?iso-8859-1?Q?WENat3QZqL8qFAdHecp0py0wfftyOjKZjnwfUtqdMrVOxlWtlZa0uv9gyE?=
 =?iso-8859-1?Q?t+SJzLtMy6HSlcAx4mIHZOLNf4gnPikj2hYD7a9B39KI8SdN6bSoGzKTvx?=
 =?iso-8859-1?Q?2jKiG8AquJMFazGGQo+s0k7rlPunJk+/bhTWFvEuhjqo63LJTe9ccuTMl6?=
 =?iso-8859-1?Q?EqCYO75bwaBEG2qvvvgDmQuF8JdaEkPPYReDdXJSwX6acphSjcLZPH0pPP?=
 =?iso-8859-1?Q?5JWFjbUfna/A87Ld3sFTsKxwaCNDU4TVDpFSNZoECXETwAHEAEbFNpfNy6?=
 =?iso-8859-1?Q?0z3dvcZnPA+5GYDreShkVKJGurwUEXrwfOVM/RsRtjcmSunrXVLBmwVIcF?=
 =?iso-8859-1?Q?4jGCWtmqazB06XtVeW7DuH78Ilo+FOJ48+p2nBT9ZXf/MFI+gpGRLv839p?=
 =?iso-8859-1?Q?DLc23KeFNczp05jSe5nq2n34J2y1bIumlegpMgot5kWA5lpl/bP/UH17+r?=
 =?iso-8859-1?Q?S0QT6r7y9DvxFHOSHpthF6+uZwzxZ6iYrrsPUy+3Qf+pB67nYNBtGz44Ct?=
 =?iso-8859-1?Q?vWWuRJRLsinmUvc9NR7fYUMCgbGfBPdDAlq2k/gTMPojOeDjetwDxhy2O6?=
 =?iso-8859-1?Q?1MPHgy02TmOVweEKi4wwq+xag7n8oSrh3j3hxM46JX9dTJlJYiwaQdNhoR?=
 =?iso-8859-1?Q?DQbsc9ox3GjhGJRBuoNiN1HekFFxgFvjzNDDF22ijDyvujHLhky/Zefrl4?=
 =?iso-8859-1?Q?9/05RfBd8mg8EKDjhhXcDnJeU+3Kjs2+eDyUApoO/qL2k4SsHN92XJ6pev?=
 =?iso-8859-1?Q?dz+xP0ErPt6ln7dMIfd0pr2hBPOi2pVmLcs6O5bwyTr5FyyY6eaXl8jK5Z?=
 =?iso-8859-1?Q?QbBCwOQhtozMtgqq6F5zphQtSESDznTrYcxNw7hvEnyQr5+5bk7HJAnmIw?=
 =?iso-8859-1?Q?sxM+8XYocjtrjVYdXBHPopBPL/OBaQwkgsIt4csnR0ny+EgTwMpZ+F+fJs?=
 =?iso-8859-1?Q?mQK2Q0LdoSJUCQLPRy73ahkS4AOl+gp6B/gIFeGPDq8iy5lMWG6eYEdg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbfced2-b058-484c-50a0-08ddf2b28a68
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2025 10:44:39.6395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqk3ylImYLd2HcKBZ+EmRh70t349FaojTkpo0A5h+6lHVQXApb+WfsavKuYOy/P/+YLR9IKKTvNbPrD7FBgaDKszHpIzjtIGQD7YsZhfnaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10855

Remove redundant domid_free() call in the XEN_DOMCTL_createdomain error
handling path to prevent a double-free condition.

When domain_create() fails, it internally calls _domain_destroy() during
its cleanup routine, which already invokes domid_free() to release the
allocated domain ID. The additional domid_free() call in the domctl error
path creates a double-free scenario, triggering an assertion failure in
domid.c:

    Assertion 'rc' failed at common/domid.c:84

The domain creation flow is:
1. domid_alloc() allocates a domain ID
2. domain_create() is called with the allocated ID
3. If domain_create() fails:
   a) domain_create() calls _domain_destroy() internally
   b) _domain_destroy() calls domid_free() to release the ID
   c) domctl incorrectly calls domid_free() again

This double-free violates the domain ID management invariants and causes
system instability. The fix ensures domid_free() is called exactly once
per allocated domain ID, maintaining proper resource cleanup
semantics.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

 xen/common/domctl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 71e712c1f3..954d790226 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -421,7 +421,6 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_d=
omctl)
         d =3D domain_create(domid, &op->u.createdomain, false);
         if ( IS_ERR(d) )
         {
-            domid_free(domid);
             ret =3D PTR_ERR(d);
             d =3D NULL;
             break;
--=20
2.34.1

