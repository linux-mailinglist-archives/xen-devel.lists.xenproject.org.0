Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1DAB154A1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063071.1428855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugro2-0004dl-EG; Tue, 29 Jul 2025 21:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063071.1428855; Tue, 29 Jul 2025 21:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugro2-0004bC-BR; Tue, 29 Jul 2025 21:24:18 +0000
Received: by outflank-mailman (input) for mailman id 1063071;
 Tue, 29 Jul 2025 21:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NAX=2K=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugro0-0004NS-Ol
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:24:16 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 611aec2a-6cc2-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 23:24:15 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GVXPR03MB8452.eurprd03.prod.outlook.com (2603:10a6:150:2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 21:24:09 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 21:24:09 +0000
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
X-Inumbo-ID: 611aec2a-6cc2-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UL4/8Om35ciKAIsiu851pOXcWfSaoH+pQ2vYqeMuDwuZM87WIuMxT9zflIAIpg42xXElJexiQjV2QceedWIb/vgcEQB055l7v8wsF2kVRsCo252MAMXq7ziTqX7ZSFu70ZhMagRKd5sLAgY/XUZXkpqo/MymdSBNl24wgpKaGxtvq36QL4W9x0ki3MOPfFUw28Bjm4GF3oerkp0LD0EFUeaVuAkTlj9FAhlC3EMh8WRA4w+4PsskFxLVbYb/Anjmid2fpM1A/UxPzv01fsLNo+rITuT8k4/7quB+Vl2iqmFki1nyR2K0IDIyk+M2BK+5YDfU3fJnnqe8ydLhXgtubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cgbIjQ7DRAeXz2kWDGE9OsK2C9dJxIRJmS+9MzQSDQ=;
 b=NIhFdPShxTTROzUFdT/LQ0/0ZraInYNXOiKaLYPZ1GFrsm866wEbfTmFYEI3TF/5FNTRkXd6eE/sUSsp1pxMhOTt9aEWCVqYnbTZmtT86U8vDopqnUiFdA0Lu75U+7PRf7+E5hRkjI+9q9QViiS0Y9tf38VwQlLR18BHMAjPTZ+j5XbdzX/PLNrmWmFwX6TteqJJBYdQpCpTgGt8jGVMD2YsSFNNO4oscwp3IDL55c/bAGvXSPzsmklNq7PgPzfkbQR9Rajh1FEHkV8k3fO39bDiev38MtqURhvq7EAux61hVGtEIE6/YdAwlf4MmTYLI8oCyZxuRSOCryIZaKOT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cgbIjQ7DRAeXz2kWDGE9OsK2C9dJxIRJmS+9MzQSDQ=;
 b=olr1OCNxUWHKeVF5kRfrnWpmAr2XGpeHa4X9LDCONnWmjhjqk3Ux7B00qKYACOStPVpVxx7zGBDLLzpxAvw4W6We7WDqqjux7n3kwqNyQrgcDYHet0WwGhgnTzexn8kgnFcYPKTOYPp2rSH4OO/rHsDWPq9yJLmzTypfLmTiqOHNKcfZyzEcvosbw5Bl5UakvMEgPQbRa58zfO4hFq/4hZyOzPhGxXf3eb+4E/ZiQ1/o1SGtpIAkXHUl5z7zie1KWXKvMvsSTRXl3yamXoCwFxlosO+EZqvKFaKHvf/XE5jIvKFBhvv5hVXubeL4Wt7+42EamrjMhvAs4vt/X1zXNg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 2/3] misra: address rule 5.5 gnttab
Thread-Topic: [RFC PATCH 2/3] misra: address rule 5.5 gnttab
Thread-Index: AQHcAM8fdlzlyMI8LEioIBJY9HwlfA==
Date: Tue, 29 Jul 2025 21:24:09 +0000
Message-ID:
 <b42e78384731eadf15dd45efdc35c8ff72b37dd3.1753822074.git.dmytro_prokopchuk1@epam.com>
References: <cover.1753822074.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1753822074.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GVXPR03MB8452:EE_
x-ms-office365-filtering-correlation-id: 7d60c184-03ca-4bb9-43e4-08ddcee641a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WH01vWjbnwjFykEThF/fm0MV5qtxK8U+9MXRiIeyH3Q9O/jwQ+7whGMzJ7?=
 =?iso-8859-1?Q?s/rT/80PCe9AWZyFdRHUVOW35LR1JK0Xcm6UYhfyyMpyPwL0Qy5Ho+bypw?=
 =?iso-8859-1?Q?bd+mgqEAo9JcD6TndbMLDnFQxN/cbAF5848kvvkZLujvJcYDI3xdsZwS63?=
 =?iso-8859-1?Q?Tm38nr3On/Ep/SxrYDqQbR6OeaqlAiK9Y1LScRV6YCSgUXXlAmFmZPeCqE?=
 =?iso-8859-1?Q?Mm7s8BkeesBPoAHcQnSvSXbb32n0nHER0F+vr1YsOrqEfem06yoYOaIvVJ?=
 =?iso-8859-1?Q?c+Ai+5ex9zeMx9umdwIKzh5SIny5KU9tuVPpGDJ6RTcMSUPsPBNpr8RDfK?=
 =?iso-8859-1?Q?NJQPa2zbUGHTKyXLU3sPmHIdWxxJY6Ib6oFCrtcgxzW9k5q17Q1K+g2FXp?=
 =?iso-8859-1?Q?NY0gU6EWDNqflTtQ1lVsB3tfxqmp+v6ab9I0San8RGLPc2evuocvD3hx6x?=
 =?iso-8859-1?Q?3bYr24Eg5ytUzZXJTS43Z+9B5L4X39bvkjXoGgaNAG3zLkNDfa5ar1VgXW?=
 =?iso-8859-1?Q?Fjwl9+//nu7CBkCdHfnzaemSkxj9U7HFoqM8Btcq/QDHDAda/xM2a8p8Mp?=
 =?iso-8859-1?Q?K1Lyp85Oc+GWdni/3hU9FYV87Ujp5bPkQS0v2MnXi9gLJVGj4SZR7fekxX?=
 =?iso-8859-1?Q?21tqrw3BADFPwJwe2rhZ3flLm/mdv0Ah0sCx5Nysp83Rvd/PeowkgH+vlS?=
 =?iso-8859-1?Q?GdYBhpwWP05An7ozy8bWIKglQbqW4Wetoh/nvWQUUGTbRMQjGXwIaJTpZM?=
 =?iso-8859-1?Q?aMoZCnDIAiKLx7BfGh4nJ8Rp30+WeoQSToJSUkzrz0Rh4OFgTpfJ9L1A5/?=
 =?iso-8859-1?Q?DuoBPz991boQeJMXnozIlYSCUtuEPkqRyHGHas61mbjJI/CAclI6kdmCtt?=
 =?iso-8859-1?Q?S3cOF4WbUYYIkE6pbwRPXhr+cjVSvG2XRC9a+O4gC+jeJ+1Vp7+MtRqwgv?=
 =?iso-8859-1?Q?48rwalqRlWVqeUT8Nh96N2K9UOSjdRi1GW5DdF7oZLX3/M1OOr2crwA/z7?=
 =?iso-8859-1?Q?8MwYdfAKi3mOvR2kXMeDkoVUmVwB0WYyBoQGAzrTaW5WcIpZwPYpwbbSiA?=
 =?iso-8859-1?Q?oUeMV3i5IFHJ6znTzoKWQrqZ/C6WBlNgaIohhgvxhVu4TFPgMDFfW2dQuU?=
 =?iso-8859-1?Q?V/TY7KfzGTuSOt51cxQ9R/DFuqarFDpmzlbp8T9cL9Unp6BEi777tW8Ig+?=
 =?iso-8859-1?Q?u3vJWAyHVqxhzzcgOMTHLoL3Fin7wM65MEZ3ZtrTu/rThdUjMVQ4OHb3NV?=
 =?iso-8859-1?Q?wgTjJeEHx7f32lnzt20AkY6/KBqmYk7CecBMl2qQzWn50cxl4kaCWdK3mH?=
 =?iso-8859-1?Q?OWj5Jv912gbygbLGC4fwSxHD3T5lD09fSiOJmBwUoDh/RXty3COnzadXSV?=
 =?iso-8859-1?Q?q+PuvvukpaKz+UHVgr3J8ksXaCJLxtMrPCODOkFnRH1lZFbwMWcfoNkc8w?=
 =?iso-8859-1?Q?WTJhEVYt4V8RP0NrqwjtgMAIJ7+T/9DReSKJceLNdNOFaV4hcMYa4waZEY?=
 =?iso-8859-1?Q?gdlz+uZw5COqbcuisTMfH8jh4SnNyEKJR8sJJjYGVIaQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5/SpVWiDNUPhON/xm4zP8egEv01w+ibsnyTBHZhkN04wyLJFyYNjBdErhw?=
 =?iso-8859-1?Q?PdWC2PBnZEzb067h/0SpUQS6sHTIEf6QcT9xcgKjSPOJuKM2YccpCYbToX?=
 =?iso-8859-1?Q?VSMH5pmcFcJPHavaYZfVBOtkA/93YeoZ5Ts93QqNbybG7skMHQ6a9rRiB9?=
 =?iso-8859-1?Q?XQ1etR9/RLcppuFg9va1z+/JCiscoX76bj9hSxKnxRnVdZwBn6hY4LlnUS?=
 =?iso-8859-1?Q?EUQ69eOlPivo0iTSwiPMEynidNm9yo8+iJrTovpDVUrVJfSs++SYl9LP19?=
 =?iso-8859-1?Q?tz4FMhcMMrWlYIqSBCO3n3AIupRzegOAgg+eAWXcVO//5vib2cCxVm9ORD?=
 =?iso-8859-1?Q?FJUn7MLVeT+7J9IYbdqa+VVJvUNxhT1/pg+UiGpGvu9+7jTYASkLtUCfer?=
 =?iso-8859-1?Q?4PLE7g97TqhMBZ2BHE5+bXcfOWK8lhDn/somVtiW8aurpDL1wzOzu7hKzF?=
 =?iso-8859-1?Q?pcvNbOHKP86p04THPLIpZfE69/PR7OF1p5Y2Mux8q8hrprZU+1bhokUR5O?=
 =?iso-8859-1?Q?Najks1mYBdCTd6Uy6FSMRYMT1RbqJmuN9QqkcewfWtqDsh3jigruziAZtT?=
 =?iso-8859-1?Q?kvuMnmWwcxH2LRQRXxDrUjYaNPiq7Cc+2nLatuACbfhqM/gU3eZ1WUMYK6?=
 =?iso-8859-1?Q?v6+uVvEVW64uwp0GeoShnMV0q83VatYCLA2B5lcSm6CYpDDQ75FhyskRrQ?=
 =?iso-8859-1?Q?c3OcGVh+4sTxxF993E5/18ScLj1G+UrN6B7sab9xDhq35RzkgcNw49FFkr?=
 =?iso-8859-1?Q?l+ibG/5UBMUmdoCmNZsa1AMrehtaP46lIILOKMIYBivuaE1f+vJM5nxXT0?=
 =?iso-8859-1?Q?C/xnncZq6z6y7aT4gq5E0oGtOOdVnc2WtOIwz8TujHo7xy4eqEunDV32zX?=
 =?iso-8859-1?Q?C44rzaiXDLsFetIFEkguyBFWsmXyKMlXr75Ux6WO8NP/GO6Rw4O3Vx9fCL?=
 =?iso-8859-1?Q?4IgW9I9BG1zH50vlFQGbOOrYZCJlWUGkk1aEqvfrygYbQ752wUOVsLvCmV?=
 =?iso-8859-1?Q?aKmjSSzfLRNz88fX/uMVMG39lGw+GuSbp9Fewh7mqpFZEYaIAY8lkQPZy3?=
 =?iso-8859-1?Q?PYoKAz0/rdzMVWUPkzrcYyIk7uCPfnXnk1h26+ZEQxZTwHpHE4w31xJxyu?=
 =?iso-8859-1?Q?eJocVieUMHqHDe9fugN6Khe2seGW5z5KRBUEHUb77m6TVYbL0bfjJ9ALpx?=
 =?iso-8859-1?Q?/5B6m3V2jUyrYpg7hyCz6xdDk4UofzHK/eLx/5Of2EdLZ6eoiIfDJI6P6r?=
 =?iso-8859-1?Q?eeqQV+7kwgj65XcCqk/Z8L0UHjA0/XK/2E/FuGIS4PgI6TFWayXBLqWqeU?=
 =?iso-8859-1?Q?ijc/s/5oHc9ZnhnGpyQHlhrt8pl0h8jfA2oBI2kH1Gj5ujvo6QOaoItgMI?=
 =?iso-8859-1?Q?ZTk0RggyCSwoxEM71OYPVeKM7aEvLtzrIx3Wz0iWZOM8h80RIm7Yv40wf9?=
 =?iso-8859-1?Q?fv8GWvfU2oFyRI11cVC97gTDovvS90svFd+/BqdQ/UKLPHcBat3m2aWMqG?=
 =?iso-8859-1?Q?/g17zJV78bpOVumXkDw7eDy53mcK0kUNLmvUtoL3gsRDCkhhtkZPMvPl79?=
 =?iso-8859-1?Q?3d/L8D0npOcJL4GroT75AcgfRV3SbpPT2/C5kynru7B6NrSVc5v/ThfaYi?=
 =?iso-8859-1?Q?cPv5AOMm/dfG7Qf52JUzOqDHaef8Rohq8qmOce6VVwRsUUndX7EEz8pg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d60c184-03ca-4bb9-43e4-08ddcee641a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 21:24:09.5410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LE3G9SAJiz6IkKYRw9UZnJNLFJlqzJjM+ukIeJvuX4PvfYduByPisvdB3oMOgXhWi8agQkrx6fmd2DCRoCgZ5RJwnI5iq1FC6o1oQEGJqTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8452

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/common/grant_table.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1..9b8f0d87d3 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -127,8 +127,8 @@ static void __init cf_check max_maptrack_frames_init(st=
ruct param_hypfs *par)
                       opt_max_maptrack_frames_val);
 }
 #else
-#define update_gnttab_par(v, unused1, unused2)     update_gnttab_par(v)
-#define parse_gnttab_limit(a, v, unused1, unused2) parse_gnttab_limit(a, v=
)
+#define UPDATE_GNTTAB_PAR(v, unused1, unused2)     update_gnttab_par(v)
+#define PARSE_GNTTAB_LIMIT(a, v, unused1, unused2) parse_gnttab_limit(a, v=
)
=20
 static void update_gnttab_par(unsigned int val, struct param_hypfs *par,
                               char *parval)
@@ -150,7 +150,7 @@ static int parse_gnttab_limit(const char *arg, unsigned=
 int *valp,
         return -ERANGE;
=20
     *valp =3D val;
-    update_gnttab_par(val, par, parval);
+    UPDATE_GNTTAB_PAR(val, par, parval);
=20
     return 0;
 }
@@ -161,7 +161,7 @@ custom_runtime_param("gnttab_max_frames", parse_gnttab_=
max_frames,
=20
 static int cf_check parse_gnttab_max_frames(const char *arg)
 {
-    return parse_gnttab_limit(arg, &opt_max_grant_frames,
+    return PARSE_GNTTAB_LIMIT(arg, &opt_max_grant_frames,
                               param_2_parfs(parse_gnttab_max_frames),
                               opt_max_grant_frames_val);
 }
@@ -173,7 +173,7 @@ custom_runtime_param("gnttab_max_maptrack_frames",
=20
 static int cf_check parse_gnttab_max_maptrack_frames(const char *arg)
 {
-    return parse_gnttab_limit(arg, &opt_max_maptrack_frames,
+    return PARSE_GNTTAB_LIMIT(arg, &opt_max_maptrack_frames,
                               param_2_parfs(parse_gnttab_max_maptrack_fram=
es),
                               opt_max_maptrack_frames_val);
 }
--=20
2.43.0

