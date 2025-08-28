Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C489B39879
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098033.1452174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZ6h-00051F-TP; Thu, 28 Aug 2025 09:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098033.1452174; Thu, 28 Aug 2025 09:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZ6h-0004z2-Qp; Thu, 28 Aug 2025 09:39:47 +0000
Received: by outflank-mailman (input) for mailman id 1098033;
 Thu, 28 Aug 2025 09:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRvb=3I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1urZ6g-0004yu-1p
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:39:46 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed72a425-83f2-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 11:39:44 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GV1PR03MB8094.eurprd03.prod.outlook.com (2603:10a6:150:1d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Thu, 28 Aug
 2025 09:39:40 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 09:39:40 +0000
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
X-Inumbo-ID: ed72a425-83f2-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kk0cCSPTwqLbmS2Ft2j7oHCPUUsd9edHmdwFXWZCiUSHSxMdwpkXsfq+hIZm4JU6CcZ0R8hhYw6VYlh8+SEdxSC7FdmzngehQgH7p3Q/nEDHIqN+SYiEqs8piOUpiMqElDeL+Cg1inhkWrYzlphekCncBNHJJ5f/oHfNhj7wT6mXs1sWyM7ugKNsuYkyiAuK1O1IcCS6tU0BHzffgE3euem0sqki8N/9vXi9lzWBze4maJ/d+QD25l9Jrgn4FI/5fKckTC8EUQ+RfXtg4N+zxGOWgxXJBd8PFPer7l9Xu2ESg4N+2BIrH/jd9Ie+K4TMKYH85pAWZkQEi9ZYE3A37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rC+z1m3Xqg9BGv69p4gUCcMrc5tPT/9elUP1cYDguXI=;
 b=Me0tKKBUYVKVKsKSQaey30pjfiuxm4XjtkWeOFKHq1ljBLoZCU8SfQHuBKWLB/FczXm0GV8/Of51CmumQpEqO97TpAyKyJIuB2/DEuZ7Vm5DasRGVe2Tt8eU2IsYk+7Y/nbiZ6t64c4U7zMbWUl5Lg2M+5oPtLuZKIouTswm2zXW9T9gx7yKx5gMzOmVyHs8nAA4fiioicJJJx0LzZO1plctILjcSxmzeZeaVFlURIA3SeYuLmJpvwxZEZu1N6Gn2Yd/FFpFhn/K6Kdx/gdN7lr1c04s4PfwZwxjBS4uYzJe4gwC+sqKT5nr8N+p+/L39O/wmPQhixlquFv2b62zrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rC+z1m3Xqg9BGv69p4gUCcMrc5tPT/9elUP1cYDguXI=;
 b=cxs+hTD1U2xxNiwDI3uOfqEktYKEBWid8ln2x43XybtxCX9UdyTXiIpzBPyBzj539cx+blyW8x1g2sPU6tM4DRFO4gn7waGPBh8fd8x6J+xKScVvCzgxaYdWORCzIYRA+XNtrg9Bql4kJUGBFrQQ32MF/XLnvVoWZJgDlEVpbJblti1ubgvCVkX7FAlh9WIT3DKi4kebMyktAszJ4bJcLcKhho2NHlkc2ryQPovffyY9TJwP8a3NUVXK6X3O64+hdP9VhL5iPV7RyYWDZ9nqirYD2ou0YN8otzwBdULLLjp9cgKRmtLztOQfPParSqHUIPiJoFXsThi4dXZpL1eecA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
Thread-Topic: [PATCH v2] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
Thread-Index: AQHcF/+t4SQcUfz6iUq+nv3WfuhiHA==
Date: Thu, 28 Aug 2025 09:39:40 +0000
Message-ID:
 <0e562f695e5db87ab80dde69cbcc0cfa14f94b21.1756373770.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GV1PR03MB8094:EE_
x-ms-office365-filtering-correlation-id: 950d4b6c-f7bb-480f-9b8d-08dde616cf99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0ORMxPqDLBUsep5f0gcBoLZI8iKBC/Ub1VQEx0eNvwaqkS+S8N5N4ddzcX?=
 =?iso-8859-1?Q?fFAkL4t1n0cV/qzTUYMK7UmvmtICSbZNaeSfzA9LRqU7/CdEyF5o5jI6yA?=
 =?iso-8859-1?Q?HmOIIC74M+yptF1j38trDMIw8moxM3RZIjZwO+m/XYxjOFzgmla8UUzSDs?=
 =?iso-8859-1?Q?g9MpwiIktrKU9GLcFv15c/2kIpXIythWYfPRS8/bU8OTKpdtHWUQaX+gLr?=
 =?iso-8859-1?Q?fkcKZo3sBsk0MsFdaZg+xfiwybrv0bHvGK6TC5SuU/GGhjgNsOYxz37KPd?=
 =?iso-8859-1?Q?hx9as+6EEuIRnu09vH6djwjConUS8IuJ1aQGf/DWYlwm8rXHWRjRrkBonL?=
 =?iso-8859-1?Q?oI3R54MH4sZSRjKvRpag/EOmOBI/mQuYDkn4KvEryHSFVuYQ2xicc2Nsty?=
 =?iso-8859-1?Q?n4poMtz1cAiYi4vzJ7Eaja2G4oULJeLuNCI1FJmHDPpka2ADaDQw/0rncZ?=
 =?iso-8859-1?Q?izO0PtXTEryRjglBd5hXiomqnoRXP4r0IrCgoTscKw/o6ydPiErPzjor0b?=
 =?iso-8859-1?Q?7zcC7zQxqW2naLNbSf3OW4LlZoi1Gh+RmGtrm1zhQZa+YAEyQIkcNDle38?=
 =?iso-8859-1?Q?foM+3d5vhKdKXqYGtUDtgMlhCaP+/D4B/d1PREAo9FH90HGmeQGWLer3he?=
 =?iso-8859-1?Q?RwI1cEFOdutUXpl1Ha2pJridQY1C3XlvlZ1GHLSbWZCsPIxdQCnWBerEAq?=
 =?iso-8859-1?Q?sRpgCNoynqosJV4PtWhxZPQKzUa0OxCo3DwgSzNLzFsTiFy9YKbbGgH2P4?=
 =?iso-8859-1?Q?kuhw8X7LuyXcOg3fR8ocWBTb/IPr/E6ZPE+QbND8B+oBnqDcHHdE6gq3Gz?=
 =?iso-8859-1?Q?Rl5OAq2VnjVaEx+LYOyh5ELjPQjfiRw5AWIr/VBdnM0PBEd3PRNLCwTggC?=
 =?iso-8859-1?Q?5c/QdbGl94JMTQYyU5uc+tCFlmvqwr0A3teIOKT9/n5P0RQk2mq6Tb+Ecq?=
 =?iso-8859-1?Q?pgTzA290+FG+WPNKcj9I/1NzNGdjPIsHQNQAGD2+jUjERmWed1Avrwvoza?=
 =?iso-8859-1?Q?1tGmgkighdvctG3GmyeJ0dTrRb94GezlDcRswMF10+9/XE4KwVpn/2h7XT?=
 =?iso-8859-1?Q?G+3TEllg2XWayrObksMEjwUoaeqjPa906fqzzmupoRUKVwcNaKaP6K4rGP?=
 =?iso-8859-1?Q?u87iQVhCsmLyXMBMbdLsRu9nWQlOssn3dbjOjcnUU2L4qLpNTjNsEfiYym?=
 =?iso-8859-1?Q?uZEEOSI1J6wQ4Cd+k+/qffUJzHGBHQVpKKj7eWY2mqAUDuvJ229Okvr1Mf?=
 =?iso-8859-1?Q?bZ+wxIkbvDtquMge1e/nTvPZCNmEC3wBmIJ382jVGYT+av0UkVezkSZ3wQ?=
 =?iso-8859-1?Q?cleDGhGYtQHIrjbDK0ha2SHprUWNKb7s75graoQyzTz4iVfSlb6oUZmfsN?=
 =?iso-8859-1?Q?8i2d4x0MXVeRpkuWGTAtN1Ux0LfsG1Nn7blENQ+8qmkJKqZFCwQmfOgXKH?=
 =?iso-8859-1?Q?57Hg09zovuKmvFeUmA+y2MCGnuGgy4mR/PFuTd5l6EYcR31uG12IjyFV+z?=
 =?iso-8859-1?Q?g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WsxxVL+vpS0YqvM7UGEAdTJTxNy0lrLsN8XIMGGXLVM2nZsh5ALRqHERRX?=
 =?iso-8859-1?Q?0znwvrFSUC5APvfG6YwIFTyuC5+HEQju5B4L2XO0In8kEfbszzhVWyAcN/?=
 =?iso-8859-1?Q?oTAAXAmTrIRngjMA51eec7uUtDDKY+NViuH6Lo/hg9Bq0SjNk7am8MqTZe?=
 =?iso-8859-1?Q?uwcC3JhP1ZoyUmZ4Heger4Qj2eLe+h0XE5Z/YgrYEqbHuTv42qwaxqz7a7?=
 =?iso-8859-1?Q?JrjdZU6eNROEkFhU2iCPjFrPvaiB7OTbmdPV+hAArKa3ciPP6D0p+u4ZL8?=
 =?iso-8859-1?Q?mT0h5P7YAXmr3u5QvHgHur74QqrVH19Nk2nWqg2ySW0z//31vLV90rPahu?=
 =?iso-8859-1?Q?ugiE8kW9t8zc0vZymBdAP5IqmX1pq0U6iz0i00v12QVd+/as/QfgrtNbm4?=
 =?iso-8859-1?Q?u3cWMb8JOLvSJfGNFiBhllnHnH4juCERifDdww4SIzK/teF1L7X3pmzBSk?=
 =?iso-8859-1?Q?GzuoFKcZ/Q90MRAy3WLUcKyCcNKd+OC5dNzBUb1EoMb3zvHPJ6+NwFApzd?=
 =?iso-8859-1?Q?1M1XkMZGNKxHkFSe3BPFAbPZh477v8eGe4XkFEBoffE3a+RGvWKJr319TE?=
 =?iso-8859-1?Q?UiYjBGM4HZR6XRf6kYUh31hb+4+YSwWzgFrTbKKeUNQdd2D6AdgBJosfQl?=
 =?iso-8859-1?Q?TA51FFFWrkuNr5R5Ix1/7Cu6u++eoXLMPThQ3Kng4d9q+PIO8JT+B7S6Bl?=
 =?iso-8859-1?Q?Bdsab1363Oaf7BasqLtDYjt6Pxjl5HS1fz8e4WCEWT0ANhYaKh3yS/BKc9?=
 =?iso-8859-1?Q?pcBmaLUaMkArMc+CvRIQwMQ8rIuuH6tMyaghIngU2jpi8QkK+W2aZUiIF5?=
 =?iso-8859-1?Q?RXiKbokYN7D0g/HBG1juh4BdeqXCBeOAeijMeZZDd/b/NvcNSJh9dm3+Ko?=
 =?iso-8859-1?Q?alTR25L9azC7cZt5nHN0B0rtowqMoFyMBzgMG+Sa5N4ER0Lbuz2qKbG7S4?=
 =?iso-8859-1?Q?EUDiVXnX8Tbpeqpbk13jkZwtVyzZ+Nu3EPE5hzQ74ChCiu2wXuFhhOsU/B?=
 =?iso-8859-1?Q?ZLKq8cFqywgRS/5r/NsDuHSi6aBJVsVO3zZu5EG2cRzFs1x7xT5g1XV5Xi?=
 =?iso-8859-1?Q?6UpffJr8jvZCQ80SuLws3zTW93cl/RIpamUwIeZiBbXtDuYBJsyZL7onEI?=
 =?iso-8859-1?Q?LpCOXz4rIrzZ5OS1cTaoWAmr6gGu6cao3AB5ZF0MvleQj3p7oMZwip1D+d?=
 =?iso-8859-1?Q?9F2fRLOTSuKYbJyvWxeDpndPPG4KhMxrX0gOH40y3m5amqk7QYDXmuHYLF?=
 =?iso-8859-1?Q?f3SO6oRLmLGdqZN//iXq8rcB4atfvdcOB8KcKMYtRj5M5e60lwwjrk/lwm?=
 =?iso-8859-1?Q?F9ahoji63yH3reg/VPAC7XjI6a85aIAaiVgJTH/Dsm4zdOJrJEJBGdmijB?=
 =?iso-8859-1?Q?57x469XsLcpxCyoCiZ00B6fZ5gfeWZdmUocFAs8U/qiwogN2LxhxgHHz+G?=
 =?iso-8859-1?Q?29hyw/g8vTv6p4XscQcBcvMssYPBGmQ0sxoAJisRM3FvV3B+mpsEJSJMZv?=
 =?iso-8859-1?Q?kIVZjeaBbM9lBC/YVbqenqODnc2AT2f50rnzdIBOeqOeX84SmQ5gkuksdw?=
 =?iso-8859-1?Q?dpO659WZhCGsZVBISI5S2P3Yxl8eR8+YYP+SL/mFAv74hDYIHiFxV1EcaE?=
 =?iso-8859-1?Q?/FxTKV1s+ZjDotiFMiC3V9ovQuspNroULAjneTqcAqo9w+dLUyJacB6g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950d4b6c-f7bb-480f-9b8d-08dde616cf99
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 09:39:40.2635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z0JZjmboeBzhwNMG4aq81xwxR8uQscTWbpETxmVI3nbUvoj1LUzZUjdX+1+p8aWHxZi5GuuUjjeX01vhNvO4zCTc+AhorW1kuKsjU4T7gz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8094

Fix an issue in the 'fail:' cleanup path of the 'assign_shared_memory()'
function where the use of an unsigned long 'i' with the condition
'--i >=3D 0' caused an infinite loop. Update the loop to use 'i--',
ensuring correct loop termination.

This change adheres to MISRA C Rule 14.3: "Controlling expressions shall
not be invariant."

Fixes: 72c5fa2208 (device-tree: Move Arm's static-shmem feature to common, =
2025-06-03)
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes to v2:
- added Fixes tag
- updated the loop to use 'i--'
- updated commit message accordingly

Link to v1:
https://patchew.org/Xen/d7768394209c65cfef4006c3ffc0a0f5d82c4c18.1756368997=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 xen/common/device-tree/static-shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/device-tree/static-shmem.c b/xen/common/device-tree=
/static-shmem.c
index 8023c0a484..79f23caa77 100644
--- a/xen/common/device-tree/static-shmem.c
+++ b/xen/common/device-tree/static-shmem.c
@@ -185,7 +185,7 @@ static int __init assign_shared_memory(struct domain *d=
, paddr_t gbase,
     return 0;
=20
  fail:
-    while ( --i >=3D 0 )
+    while ( i-- )
         put_page_nr(page + i, nr_borrowers);
     return ret;
 }
--=20
2.43.0

