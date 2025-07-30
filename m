Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C65B1687A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 23:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064539.1430142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhEeQ-0001D2-Df; Wed, 30 Jul 2025 21:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064539.1430142; Wed, 30 Jul 2025 21:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhEeQ-0001Al-9V; Wed, 30 Jul 2025 21:47:54 +0000
Received: by outflank-mailman (input) for mailman id 1064539;
 Wed, 30 Jul 2025 21:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6hfZ=2L=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uhEeO-0001Af-Rs
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 21:47:52 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6b6b3a7-6d8e-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 23:47:50 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DB3PR0302MB9208.eurprd03.prod.outlook.com (2603:10a6:10:430::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 21:47:48 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 21:47:48 +0000
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
X-Inumbo-ID: d6b6b3a7-6d8e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8sIUzApDdf9vXeAOnIdkZ7IjGrgv6DVjcqUckc56PZesLhUFpr1LDYZQJRlIqZodgjvn1QynhE09Lama700vG4XX4DpebaaUuHyHcIlj5CaoLaL8ycNCgiFHQgei7dKjdzIWcWVfJMhEDhgocIv9f339ndJ1DRCXlwnVd3VnTn6rj/T/BURuSJtSRxK9+YaDvg2C6Jv39NMP9vi04eurXdn1/NH8ZVhnjL6guyUamz1M9BHDBp6BUt9L9hV29cQO370X38a3ucGvcnwKDVcM7Cri1BB1k32xp9hKqdHvR9W2YpxpemDT0Ubj658xBIAbPgx6B25CoWqA+Q2/EWzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxvZbFXAO8JYHEF2Pio7vC1/Aa+LbDDstLjz6ybTipw=;
 b=hK47yitWndf7MhtKT0XZ0objs3h6b4cv2HOoBByi05sRmW8tn9Ac20C34bI40uIeX+pGeImo677b+7M0+7eZDetLo5pdXfIMN3FzI9WjwVaszZnpYKIoPLMBQD4lQ2NfGa8bYNmT6r2EOgFnHly+lxIFOzR2T3hXIqNNzP7qCYeaKTkVRyEXuaqmwfwpQiXZwFu3gXsXiNx89nceP4Yo0ooGUDCugj2PDu5ofxy/eGgtehZi69wpA6AxV8O597vOiEEIrRd0ori8Jb1wFqdpxOKvWZAPzrnHhEmtK7CRyY8sNSujqHC4tjHodod4KKStPw98VjS6YBtIDTWOX6B6yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxvZbFXAO8JYHEF2Pio7vC1/Aa+LbDDstLjz6ybTipw=;
 b=sYuSrhJ37q9Hqoit7D3jb/rpYskTzG7RxOpAI9Wut3B93qFfnoRuS87XHw6KL/dw2OivWYFModIEp2QYSVFutjgytljv9y890ZaYBzSvlmZYOypRmlmAHw856NbCwRFEULhpb6w6vo4suk3SLtqCGkiBjJWwOIJS4dGj/ZURO0Aw4xHbBsiySwLymc23Vx0Iy92Tko3EH/7MxqoUhIYuHgXEsLdQmoKilS+WsZKjEVVPZV6B6EgbZGOrbgFbZFyVWfDH/OC52xN5ZPDrR17AgaWeshTho/+oqdpUkC4An7JGV+KlEvxDiNB4FQ57PlrmiT2ZSGAmInb0paAfI8ND6w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3] misra: allow discarding 'noreturn' during function pointer
 conversions
Thread-Topic: [PATCH v3] misra: allow discarding 'noreturn' during function
 pointer conversions
Thread-Index: AQHcAZuXMk8luH5qyUihUMZTH0cl+w==
Date: Wed, 30 Jul 2025 21:47:47 +0000
Message-ID:
 <63d5d311e6502d5b957009be59e1c97599015b46.1753911912.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DB3PR0302MB9208:EE_
x-ms-office365-filtering-correlation-id: 01bea42f-2947-44ea-4d81-08ddcfb2b984
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/Hi7LH3IbYwVSZTZgsRIm0WnQ8sZFFvnXon2bGN/BbxP9O5Lh6Ojs2FoZD?=
 =?iso-8859-1?Q?vH0ZgJ3q17c2HH1MjyvkS71yZVWNo5Yn3PbuSYqwdwYoeotf8H1Z1zdUSO?=
 =?iso-8859-1?Q?9hI1K1gEIlxd0Zlfy9qPKLJ77cqF4milc4DJedtwj96PHvwtjShJ/n32az?=
 =?iso-8859-1?Q?MEGwdCSwkDrc0ZYYPtbuNC0NMbTGSAMGNgRjvVU/RwF43oNjV+MzQLKsS/?=
 =?iso-8859-1?Q?ad6BFQfVa8rv8Fu4mx0h3LakJlbDK9zJJhaHMLgwPjx8991pIEegxHgRVc?=
 =?iso-8859-1?Q?A+FfVZ+42p5tCQ3P2eezVc9lwzgGyOiVKyhZrYkVlNy5WthcYbmMe+L8Mq?=
 =?iso-8859-1?Q?zLkyyMEEqmbHJzCU9jbFVzZxO17mjsWyg4BGHXtAgBPQl6AhPe+M4roqKB?=
 =?iso-8859-1?Q?WhUbwj+97SD01SrRtDQfnYKHJeTerdQ8GE8N9AVULN4flDAxAZwyoFbet2?=
 =?iso-8859-1?Q?0rLPeRrJQmxf9X9B9wiS4y3/iV53FI4R2E5RzvWDFlIOUEO12I9yuRISYs?=
 =?iso-8859-1?Q?WF/tDhuuqA7SZXXw1hM0dCKjH5iLtTcJQMhyvu2DnZ40C1ZeOLXWPHHGEO?=
 =?iso-8859-1?Q?91i4a32bAi4ekvIcyRR7SO1Q+KHOCfuM6c67QLe+IKKZJrqVq7/x3JEFP/?=
 =?iso-8859-1?Q?RZedscGOvQd53IovjGLvZeVhny/BV7cfn1NDQX4aItt2X5c5KyXlYKw9e8?=
 =?iso-8859-1?Q?aeicYHpyESB0kOUfc2ny8USWKlDyQbrA5MAfaTHF/xtGdQ4AbUgWtIaFI+?=
 =?iso-8859-1?Q?GWE6GUSA4amjEtY7ZgMz368CjEpLsqGr7L8gBfQIZe7T967zcexb1w/xoP?=
 =?iso-8859-1?Q?axisnN9Wop6BS37h5rZZuh+l7KSNFJKl5XMvcMutGQI7HqZ5UJWIrf0so4?=
 =?iso-8859-1?Q?pLuThzZzWCKDjYWiFkpUTt6Vug6XUhcmquPE5w4D4dsB9GV4YtdAS2fFEa?=
 =?iso-8859-1?Q?s+gB6eeFibJ2MV1yUD1DlZj7o7o1D0Qq1sD8ZaQU9D5qRMutcuLFbbCRT+?=
 =?iso-8859-1?Q?Dm5BsIPCMXhsBIPWrbKqj41zNgQuvhaAGR0DSJZg2mQoZsZRBJEz+NqmkU?=
 =?iso-8859-1?Q?p07BJPaIqxDEHTM/7ilmwETmSlkCK49g85Hy5yCjB4yXg7NV2KycLjjGaO?=
 =?iso-8859-1?Q?PPrT6GzNN5uLhrWjcyOQjuci34ivJk57mE005KkLSGsSbPoXgmksRIgbVZ?=
 =?iso-8859-1?Q?D9vkhTTML+EPO44Vvb7JJXxBFkrVLxuc7akXIbR2CZXVSlC4CRLzvnwVUc?=
 =?iso-8859-1?Q?3ZFW3LmK9CEscATDVgWkwzMM/yJGW6/ju67XttEDICejODHMH3Yh/95Hz1?=
 =?iso-8859-1?Q?mnjVkCMuaFdlx1kB+UQOTJFUGfhGGXdnCEBGYWvviwRQ5JW6tgi87YZBSi?=
 =?iso-8859-1?Q?hstJds8TkTuhp7T1/dGTLu86x5QgKfXMVdZzUJO2FqEVc7MlNmmSr10Wn6?=
 =?iso-8859-1?Q?psp75w1K9KNkpyFlIqRkkMUEEFbhxAYsey2qiV+ck6q85V0F87b915vv0b?=
 =?iso-8859-1?Q?M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CAPbua48AcZu4VzBNGJ5nzr76/pbZN1nBWDblZv260z50b3x2Tp9N8UQft?=
 =?iso-8859-1?Q?ytqtLHMGnGEssD1/2b4vJXPG4o2Oh3DasVKBB89PQmTjCtHUgxmK4grXLD?=
 =?iso-8859-1?Q?g7dGwvN5r74dKw6457wuOMez9ExxDkY9Dak63AC06Ho2dTz8oNTP8mVguY?=
 =?iso-8859-1?Q?F2nBvIO/a41kMhua9DiyLsMQzQvwTxF8DiLcPc3mgP3d95NDh7RRt9GIK3?=
 =?iso-8859-1?Q?PJMLstoWHIvxtdssYh0B8uCQN025xP9QSs5LUJKZ+9eulsg8ZwGpuFFCwb?=
 =?iso-8859-1?Q?QBFqhuwFC7WBnjcy3If07QoO0ELy3ZdMi12nUaIMx9Wz5LS3tzJbSq+ONU?=
 =?iso-8859-1?Q?hJt3QrADHlhQXicBSbCgnhHj56WpwQkeXKt1tBs37OHT0VcWWMihedmYf8?=
 =?iso-8859-1?Q?Yf8E8x+6qWTFSNUA1R4GD0bxsP1PAxu9vbmXO4RZm1H5AezJZxcGASKJS0?=
 =?iso-8859-1?Q?cMEPuGZGBl1srNijy+b0ZyBK/9E65goKfN7qjKzrRXG5tbLjTDlRRGKL/7?=
 =?iso-8859-1?Q?xBcmWyGwYAkSuAsZJpiZfx14Nevifsq4Q4ABOohxyakLR5tpzCzq2ZK2cs?=
 =?iso-8859-1?Q?sAgRTDZNUNxyZ3Tm8SCdNZe+MGT72JTrnWufSC06Gq24vwdzxRHKolRD7R?=
 =?iso-8859-1?Q?KihXN57hsA/Dd3Hxm4W03VzkVpVvQYSnZzRwqmJmbvHsX4Ngsqaw40Mp4Y?=
 =?iso-8859-1?Q?dEoQGw5LQmYU8HlFYh4Tx4+TnBTXEHdcnJNe/BeFR315H8Tb/e63YAGlyP?=
 =?iso-8859-1?Q?UxOEGiCgf01a7qNCxXNcMo9TOaNCgYQaNHoUZ8lSVFvShCPB4N3vMPrEXU?=
 =?iso-8859-1?Q?9sFG+TC4Vtq2MyvjnD++i9zvSkin9+XpnruLToehjAggz9fkhaT5xBrxUn?=
 =?iso-8859-1?Q?r4AHhBlt1QG/c5rWOmSiU5pVtq8VaDThdfkdXFDB/gyqDi2SxOsugVEYTe?=
 =?iso-8859-1?Q?ndJEQFjXbWXehTQiEbhvCxt4Dsr3xTo5r8QpDHSwy2DtOo79khgm/ER8cC?=
 =?iso-8859-1?Q?PDB5p3ASaQDFZhyz0WbMUtNhvVc3IrKCp1CPaqOMxBR8pGK8JAMBaUGJfA?=
 =?iso-8859-1?Q?M6GQXe2Dz6WMWRXog/GzYrwTjUXMQ69rUTWAUh5kX48flysYJL+8mSjrSs?=
 =?iso-8859-1?Q?rJ7h7TEUvUUFncdl7hLhpfxsqfuNMiJkEhtFqZ0fMRyuNSzv1P+OG03cdE?=
 =?iso-8859-1?Q?MPM8mLW9VZzMT+K1w7HJLLXoANt1KJC0cLSBtEwFNZQGR/sDOQzzGjdoY2?=
 =?iso-8859-1?Q?27Ycozcm6TtOVcnuxfsnR7cFozUdT/H7H5WYNJGBYh8r+rVuSJlFrgGgRS?=
 =?iso-8859-1?Q?JVXCtSBenPTkPcPqWmj2W2xxkZm3u+CFjwZ+hnnFjtaqvyqPM1BG0hIGca?=
 =?iso-8859-1?Q?Bu0RIsA93ra26itkzthfkFqC4MXgP3GQR0aej3BeyJMVUiEjsqjn5q41o7?=
 =?iso-8859-1?Q?sEPuRUwclxPjkQbmpGZ0D+JoKuiiyVel2x2uEGSSc5DNsoRPQvyM3VZind?=
 =?iso-8859-1?Q?NL5nPHUrDbckiMw9auhX9+Lclv/YtuZj9RcsAU3+RVfeqwNztbb/vw0/K9?=
 =?iso-8859-1?Q?u8NOg6khB6waoiJE5zEqQGZMj3bGJqpWIdZZwBm3R+V9HPuHOGl7ZGDLmb?=
 =?iso-8859-1?Q?VDtKvXBzyKCLdw97PKCQzzis8yOJl5Iy4ebUprsbBa+APlV113GhCWZw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bea42f-2947-44ea-4d81-08ddcfb2b984
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 21:47:47.9824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aXjw7B6DpT5ooM5w+xEW4UAC1jdJuDqfcQbPUs+G1vrrccGo2s2yIFYMyszzNIpQ5bmmPqiLlKlmCdAkf2sZndLWyFyIvb++ySrqOyFvc2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9208

The conversion from a function pointer with the 'noreturn' attribute
('void noreturn (*)(void *)') to a function pointer type ('void (*)(void *)=
'
causes type incompatibility according to MISRA C Rule 11.1, which forbids
conversions between incompatible function pointer types.

The violation occurs at the call site:
    smp_call_function(halt_this_cpu, NULL, 0);
where 'halt_this_cpu' with type 'void noreturn (*)(void *)' is passed to
'smp_call_function' expecting a function pointer of type 'void (*)(void *)'=
.

The 'noreturn' attribute does not change the function calling convention
or parameter handling at runtime, making the conversion safe.

Configure ECLAIR to treat implicit conversions that lose the "noreturn"
attribute on a function 'void (*)(void*)' as safe. This is because the
deviation actually just deviates 'void noreturn (*)(void*)' -> 'void (*)(vo=
id*)'.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v3:
- updated commit subject=20

Link to v2: https://patchew.org/Xen/3b821bc506b04bf7ff8bf5a3712449d45429dc9=
0.1753791398.git.dmytro._5Fprokopchuk1@epam.com/
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 7 +++++++
 docs/misra/deviations.rst                        | 6 ++++++
 docs/misra/rules.rst                             | 3 ++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 483507e7b9..0e04681c4c 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -367,6 +367,13 @@ constant expressions are required.\""
 }
 -doc_end
=20
+-doc_begin=3D"The conversion from 'void noreturn (*)(void *)' to 'void (*)=
(void *)' is safe
+because the semantics of the 'noreturn' attribute do not alter the calling=
 convention or behavior of the resulting code."
+-config=3DMC3A2.R11.1,casts+=3D{safe,
+  "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1=
, pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
+   ref(property(noreturn)))))"}=20
+-doc_end
+
 -doc_begin=3D"The conversion from a pointer to an incomplete type to unsig=
ned long does not lose any information, provided that the target type has e=
nough bits to store it."
 -config=3DMC3A2.R11.2,casts+=3D{safe,
   "from(type(any()))
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index e78179fcb8..4e430bb17e 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -342,6 +342,12 @@ Deviations related to MISRA C:2012 Rules:
        semantics that do not lead to unexpected behaviour.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R11.1
+     - The conversion from 'void noreturn (*)(void *)' to 'void (*)(void *=
)'
+       is safe because the semantics of the 'noreturn' attribute do not al=
ter
+       the calling convention or behavior of the resulting code.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.2
      - The conversion from a pointer to an incomplete type to unsigned lon=
g
        does not lose any information, provided that the target type has en=
ough
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 3e014a6298..82a26162a9 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -404,7 +404,8 @@ maintainers if you want to suggest a change.
        function and any other type
      - All conversions to integer types are permitted if the destination
        type has enough bits to hold the entire value. Conversions to
-       bool and void* are permitted.
+       bool and void* are permitted. Conversions from 'void noreturn (*)(v=
oid *)'
+       to 'void (*)(void *)' are permitted.
=20
    * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_11_02.c>`_
      - Required
--=20
2.43.0

