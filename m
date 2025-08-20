Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB4BB2D576
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 10:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087229.1445324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uodk0-0000sF-Uj; Wed, 20 Aug 2025 08:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087229.1445324; Wed, 20 Aug 2025 08:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uodk0-0000r6-QX; Wed, 20 Aug 2025 08:00:16 +0000
Received: by outflank-mailman (input) for mailman id 1087229;
 Wed, 20 Aug 2025 08:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiHc=3A=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uodjz-0000r0-1v
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 08:00:15 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3d0e078-7d9b-11f0-a32a-13f23c93f187;
 Wed, 20 Aug 2025 10:00:14 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GVXPR03MB10684.eurprd03.prod.outlook.com (2603:10a6:150:214::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 08:00:10 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 08:00:10 +0000
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
X-Inumbo-ID: b3d0e078-7d9b-11f0-a32a-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzSX5pzUhK6vyvVQ6VWJf0MR61GtI0yocgKwDBpB30wLb803OnARP7UVN4ukwUeiN/AMbQwacBVoNQ1qjnllLly8aEHMvHjbf3z8UlVmtd3VXukrJNsETYCdEUvh7Vpyk8Ofd1s1ghbbjwgtsDrI/L7XBuTD746HAr30Abo87cGed2OqCZnLkxheqasqYG5K1x3M8iycHMb27nbLQEBJg1/1atJVs53Aojs/1bAuyQATIudS5SpeDosiPr2bMCwS2RW1MDLEzfa4UZQO+k23NkMJZhqn/JmIaHbB35dN//Q1CfDNeWGibXka0KYqvt2TKzbCFOoftlh4/5c9uCXpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtkxeDBACc0cYECjaqfj1ThuQQdwXeAzi2qPSx8hTrU=;
 b=Jm3a2lM3pOs8bJFOKjEfX/hUGC6veZXtoroFfBpU72Yb7TjlzIHjVGG7rnOY7JN0H4jis6B3GPKQ6GiSglmYRncLnnapS5YP/m1ytcwY0GmtDtkapKNG8lQTzzIS9XUyILUFfilN+diSNJ+DAHKNQ2nAujE2eSLJoe7NVaOxfxNy9qZ99NOKuxxUIFHJNxyMX92XID2mF3iqiw0TBjBIDKmeMiOT3Kfc3nrviB1o8V8kxaWeWjeJLqwXDJSByA/qVIvLbYDjHHxbiZZ617jFeHHJ2bZ/B2b57lObcqY0KQqKFF46prraH5FrZ1CTWnYFx5x7/Cm7RHbYJU/tGZUmMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtkxeDBACc0cYECjaqfj1ThuQQdwXeAzi2qPSx8hTrU=;
 b=lIl+jpu55msSBSnrULTQxtX/IHCpVWaC6K4lPhvuBMiQ7poYnYu5ZBRsh1zSPhe1iRIJjVB++/SYMGpUzgKtEHUisL6Chl4vBGhcc87qxtg/7ETeQouj3TJjUxuzN/qb9DxtPiW3X7acnX2tozlspBB5O+zqLKHurhwtKSRJ0rcboTkTRDSJ2qkYu2xqWfPctA3/fQ1FzufUBZvkQfi6+2qAaBGvEIP3zQckUyeLo7CjgeFwod+Ct8avv2T0Oi90/38Rl2HZ5XBxp+YknV1tPGbQUgWCpH8QNRai+NAzjVSqgLPOI3dyjY8w0oJ7gFDBdclmiAmuTQJ6XTaaebmgvg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] misra: fix Rule 11.3 violation in 'vcpu_mark_events_pending'
Thread-Topic: [PATCH] misra: fix Rule 11.3 violation in
 'vcpu_mark_events_pending'
Thread-Index: AQHcEahzo6Ns4M/vpkyFl3Gc8+EN0g==
Date: Wed, 20 Aug 2025 08:00:09 +0000
Message-ID:
 <7210337994620b60ed123ec6fc73e469c287adf6.1755676142.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GVXPR03MB10684:EE_
x-ms-office365-filtering-correlation-id: e685cf53-c497-4c81-66ef-08dddfbf95b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7FqRICyD7kVPyi/l4U7GeIcvG6NvzUHFAtZw1z3yrkhp+QjBMCogXJMG/a?=
 =?iso-8859-1?Q?2sQorUvVpP3hFr4Q374xDm+KBanwZe8HMCZEQsBrhaylf1iv3VhmYpaI3z?=
 =?iso-8859-1?Q?IwSFhxJ4oBGtO7K4uponjn/FxjbDJYVJeF8P4fHXLY/SFoXP8JqlzMwLCm?=
 =?iso-8859-1?Q?GhqJy1NctOBXcZDaIJaL9R56Nhz9aC9DUv1pnldz6YaSL2i5hwUGz98o/7?=
 =?iso-8859-1?Q?34S/Oc5+e3yAk2EH/FcVyV1FHcjmpMyMD/1bGlefVIUJGUlhC2LAYqtrS3?=
 =?iso-8859-1?Q?X/G1D9ujyrCpKAz50XtWTUxOusUylE2hm8Lf1SP3jRMTO8bfHbYPt6BnCn?=
 =?iso-8859-1?Q?FR33dKtabajVnSmkrHiROmUl9PRgq+UDx3lpDKm6P8CL5bsYBMx161l6BC?=
 =?iso-8859-1?Q?HvE2XfK0pYQ4wNE/KEJ4sbywu3FAMV/vCq7hXLNV4guaqJukD0NH0rvbr9?=
 =?iso-8859-1?Q?oINFS4SudgTTZgFUYSwGPr5rTT0c8c3XaP2LOM/vR69dHjI5oPb/VvnSOV?=
 =?iso-8859-1?Q?w2m3k2hCLUTkVxDzX64gN7FjPvWsHg6931gEeyLF/t7UjS6/Ef+sm1BrVG?=
 =?iso-8859-1?Q?7JCaFswQrDUWjrYGRGTN4VZbqHTStlLT7Nqj4ikE7Jju/12ndugTcQSKOY?=
 =?iso-8859-1?Q?jjMvWD2TJWJxel1QuiLrY+/piqcl5m9N7Ti3yIiOk4jdWqGffjXpyglU0z?=
 =?iso-8859-1?Q?KznzNWzll6PQ492NBVeeRPs9kdAn9OpYNBNBV0xnvlgWaOrl+i/qzzdSMU?=
 =?iso-8859-1?Q?ozea08VCnzSS4ajY0QnG3q8xVfsZpICjRNx6PdpfzNtzF6eL56Oyu+ghVy?=
 =?iso-8859-1?Q?8HJ5p33qmP433GjRDqLL9IArFwzaS4osFrnwrJrjdYXOENdS1NtrvbTTTi?=
 =?iso-8859-1?Q?tgJiXjAPA5ThUti44a4ZAYBgM50+LDcapUSjFeWX79KiSypKYEycQoFXk5?=
 =?iso-8859-1?Q?ZAmuqhkyhIZJN8bzOBhFKXW9sP7edZpqihhnwoBSrytU/sXv4aUIXVIfZx?=
 =?iso-8859-1?Q?0Ay5dTKH0m11hrkQiiQE4H/2nmsfhVMlCjarcejNiio4o2ijVJNQKt2nuI?=
 =?iso-8859-1?Q?2/5nhluLY6F6uD2bspIq49wO1kP++3hA/CZVelpf1mEgYyy5Acwc1S0KsK?=
 =?iso-8859-1?Q?2KCES6bVFfhTeSg+yECahKhcCVqLrnUl6I++oj4mkiZdFLCJ+F1t/gcoTR?=
 =?iso-8859-1?Q?SUYNoFGQ0gZzol0wI2f264n1kZjxOOatqtmO2kh1HPZlQta4P3GVxOBRac?=
 =?iso-8859-1?Q?SY0XTDPILz/dQWuJo4+kc5VJQIPwqE54dr9WB1jhDKTxDAAYzaAiWY8/hD?=
 =?iso-8859-1?Q?4KXwfRuuVrh2VCLqoMetZINFfz2/LN3XvkvJZzt9Ifoxkx2+5E6VKoL9Zu?=
 =?iso-8859-1?Q?VorRncGw9Fi7/uBmMP1GylTm5uGk5DjF3bqdrPMVglVrTByFQTGFBYkx/I?=
 =?iso-8859-1?Q?FkELnjEglyNWzQXAArHH2EJO+WSlMvpS2ikNvifbPbqzimrFPqpjK1Vnns?=
 =?iso-8859-1?Q?U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ly4c1BkLbrvLH3g5v+OPslNMtThBYtoOjvKKyj4fkGlsRWor6hPOpJv29U?=
 =?iso-8859-1?Q?osLaA+YfCW/rvU4pfphgKSUXNDOPUT2aLz6YjBJZ0p1k/Ps7x4BnqhYIly?=
 =?iso-8859-1?Q?6JcSOITahuOgTc3wX6QQdN3yfAYPlN6tsQY6slueGSwHJVfH9d+IrMEREJ?=
 =?iso-8859-1?Q?4L7gwD7apg5Dov6MKciVqjqwJfgQBCy3TnnpSaEJIW2E0/Iu3rc8k8UUEf?=
 =?iso-8859-1?Q?szYwkSf7x/k7frnbnZ8Nsqyn44D0jnmu1fbhmuiPN22WqFo9odIYbG++7i?=
 =?iso-8859-1?Q?xK7j5sbntwcRSUCblNxeuLAonWzYCCYgIQSf7+g1c/N0hMXmlrpVhkx5GY?=
 =?iso-8859-1?Q?nINd+ZDL6MHl6L4znm0g36euORbbnzqVwpyTFrAWPY2Yvn2S9UkVT/Hpx8?=
 =?iso-8859-1?Q?doLTA3U2v0DK6FlUx24uk47d3UR0KcJW2CpntsdhBShuMu8LODfOSYg6iO?=
 =?iso-8859-1?Q?ECXVZYiQB9eHjK4y1fEQnCcQDSBs4OHjufatsCPYW9pgh+7KndCQMneW7l?=
 =?iso-8859-1?Q?sHpTKu9RyFrtDH8j8xVahJIAScFnw1v8NdzPRD8yeK6lEnQt30+274mhea?=
 =?iso-8859-1?Q?CF23MKWOk8aBCJ6vrYOdijN+ELq0f2sRRWRBa9wJW0v+meetbqVeWYa7o+?=
 =?iso-8859-1?Q?W4i4e9LMD1/a7PfkU0JjLrgmUe6rlDXM2sMjM1CcJN0+5LsYXoZM4kVfMu?=
 =?iso-8859-1?Q?AmQZARY0ocPLxIgznGpyDBne2u4DDWz+skmWAgVQ5vawONHAGzaz+hfSVy?=
 =?iso-8859-1?Q?97HzeRjlAYa0dU6Lqwm5wNrtwiIK0C/xIMYhX7XNZ4Vl2E+6+KH3iX6nyI?=
 =?iso-8859-1?Q?HZpyO+hhrSGTyO44D7VIdO0HZUM0L9lweZ9pMV1lBCV11V5atswAYRAC+o?=
 =?iso-8859-1?Q?XQSflHsHpkjgWvyNDwlpOTMzbEt6Ac//K32XfM4N/VMMNJfZW0fzxCoiNk?=
 =?iso-8859-1?Q?7zB8S4vsTVn/WKBw0zuc0o6e3vYxKfskTHdN6YmOoy6j9vWabBvSrT5TXg?=
 =?iso-8859-1?Q?9iQXNORxNIm21iMVF+EPiDWG9KDNnTkf7FkDS6fqpGRpEaOltCSf9yfHVt?=
 =?iso-8859-1?Q?arJ5bE9nBdhswiKr/6MIej3+6IV0NaAtoz1QzvR4dUyi7H7dD7jZ+VCh48?=
 =?iso-8859-1?Q?rtO0mevqWSRcbXwrtHh0LdUdM757ZolTmKh9UZqNwHpLGKt7C7s/CniM9f?=
 =?iso-8859-1?Q?6f7m8nMfTG/9JBeuRridPtvhhnsh7wfkpMJzKAJq9Ka3DDeql4yo1aXqNV?=
 =?iso-8859-1?Q?cFH5XjmIRO4qwjTifIi5aXihZrqA82dEMDrFc72S/ySzXLpuQdpXCaISTf?=
 =?iso-8859-1?Q?tnQQOVLOa8KKs2hCOEtWmMk2avciJo9lLbL8G52bWNYO7Pni7MuPI/oq3P?=
 =?iso-8859-1?Q?WTsC8OO6NOryCUVlWyeYDeXGBcG0AL95uwnIYUin3gyhC0LBzLINppFZI8?=
 =?iso-8859-1?Q?fwAaha1LpatsQU9Roi646hrJGB2YacGDoJUaAM2MAG2mCI0S9vAmPjDzvI?=
 =?iso-8859-1?Q?HQtlhSjFNYB9ygdzuvWwq7d2HYKxD6J21kMyhiMWoAZFsK77tD3mP4OMfj?=
 =?iso-8859-1?Q?aKPLV7pEUntun5JXbsxvxLY2S4knC/D4Rve6Spq+/aGaL0C0H9HmRHiyvC?=
 =?iso-8859-1?Q?He0s/dkj7yXzRlIIVZNASNB5WmL+CGmkzejQsI8787GfBJ9wQXB0Yzbw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e685cf53-c497-4c81-66ef-08dddfbf95b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 08:00:09.9517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4J+9GhYgScfpv5DVWoC+6Mtnm34NReP86lLrSG8s6t5U56HkoORJLmv83a9ppia12eMIEBTQKjlrrnKUy7Z7g4k8/GMlgZ7C3vwl37E1UsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10684

MISRA C:2012 Rule 11.3 states: "A cast shall not be performed between
a pointer to object type and a pointer to a different object type."

The function 'vcpu_mark_events_pending' contains a non-compliant cast
to (unsigned long*). Remove the explicit cast and pass the compatible
pointer type to the 'guest_test_and_set_bit' macro.

Fixes: c626aa1a5a (arm: implement event injection, 2012-06-01)
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1993054203
---
 xen/arch/arm/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 310c578909..6371e68cc7 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1166,7 +1166,7 @@ void arch_dump_vcpu_info(struct vcpu *v)
 void vcpu_mark_events_pending(struct vcpu *v)
 {
     bool already_pending =3D guest_test_and_set_bit(v->domain,
-        0, (unsigned long *)&vcpu_info(v, evtchn_upcall_pending));
+        0, &vcpu_info(v, evtchn_upcall_pending));
=20
     if ( already_pending )
         return;
--=20
2.43.0

