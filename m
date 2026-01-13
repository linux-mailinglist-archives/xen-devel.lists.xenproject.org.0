Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DABD175C1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 09:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201208.1516927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa27-0004Oe-BU; Tue, 13 Jan 2026 08:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201208.1516927; Tue, 13 Jan 2026 08:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfa27-0004LT-7Y; Tue, 13 Jan 2026 08:45:47 +0000
Received: by outflank-mailman (input) for mailman id 1201208;
 Tue, 13 Jan 2026 08:45:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kCXa=7S=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vfa25-0003C7-Mi
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 08:45:45 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f70102c-f05c-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 09:45:44 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8709.eurprd03.prod.outlook.com
 (2603:10a6:150:93::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 08:45:37 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 08:45:37 +0000
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
X-Inumbo-ID: 3f70102c-f05c-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zvtdd/z8f0VyyoPuqak0y2J1+7rSt+rl2KAy7m/rLAiebpuJK2maU3VqvqIOioTbv0rwpSIIvkIVZ4pXwfGD3+YJQGz6VKBQeee/AFNw3/me9vNm5C4+nfLtjyqxZsdEyzI7zIq4Yv48nrbqqf5brz4tHausNssjLMhEFZjj9P7YydgzpgJPMZLTgM7aAmCTban8d5NR4sWgXEbBjJEDC6rxiaxpd9mGZBnrwzmz46QwyJaItEdkVtt1ColYe1PB9Im+/wROFt7L8zUfNM43Kfha0yFE0PQfQ3QjERx+5CQy8nelY67JO3VLHdNG9IcSTqwBnbDGOg1S0bCzsHLv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YB3Z/ya+URTPFlZ29ONQyLs0kh0H7smiC37/7tWuSeA=;
 b=mSEQ60jcoiv+hvnToDkEnWlRaTV1yeHQAax06lwEioy/OqxTVt52MGrB6OddGQ0oxBHIoOmvHg8xYd10oS8mCiycv4kqfe+ELERGL1G+zEYykMLCNLfHXOpjFyhZpZmOaMMw/LoSqSs72A+57R2+3/uTfjX6JafazsK0QygQz5/g7mlmsFgn6UIbpzlEvpTBzWwMvrubmEEAs+4Lcl0EOynC9cEIb2iLRfEmGbbuCMSAivEOJkep4rlx2DSwf0m2+Pc5JA5dZk6OlMtrbOaQHoFqL03aZGiIXzYXhL46TLxYOGUhIGfaLhAW0N3zhdstxGbai7qLgfIPdXjt9xxdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YB3Z/ya+URTPFlZ29ONQyLs0kh0H7smiC37/7tWuSeA=;
 b=rTqLjwK6cBA3soLAAS9NHMop8NXwARXAP9wPfasomMH54BPM82JLmw+rQldIlolFQjKBCcxdEgdvqUSqDVI//YSG+HJ8+AkRXCL0I95S14Su2o1hSVefn0Kkx3/g8Gpk7Oy5OciQuLOfuKkQcNCTKr/UVs3H8J+9Es4LJwf9ivhMgkNJcf6la3TFEAOK6SpGvSl5YQHxirGkDAb6iRFkpgVu5Tb84YFCatSNdS7rUwWE5eS+nqNPOowpWvUjBX1tlCYcqdP6jeXjxNZq9jd8Nplb97QWdLRV855RodEcGGYo28Iak1jFnHW7fs8VRBQfi44YGpnNrmaIHhy5YlwmZA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 4/5] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v5 4/5] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHchGj8MU41z39/G0qN5OQ5+p9ktA==
Date: Tue, 13 Jan 2026 08:45:35 +0000
Message-ID:
 <76a8969cd7b8bd956605662edcf2ec3c4af3a178.1768293759.git.mykyta_poturai@epam.com>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1768293759.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8709:EE_
x-ms-office365-filtering-correlation-id: feaa1e88-4b54-4a4c-8ca8-08de52801f82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BVFTJ6Y+ZD4n9Tz/jHcelH07BPUGZUaS1b7sdMwx72X7/k1k/W3lgNLxTv?=
 =?iso-8859-1?Q?PMKSBlOQbClhOa3w/vnigtLvjhDJYt9Eo1MEG3akqlYznrRtiYb/SEvsTa?=
 =?iso-8859-1?Q?DWLh//n4iZBzB45wkC1/fGWOaG+opQR3LEnmp8Tz0/ERjIZVKs6rbgIrab?=
 =?iso-8859-1?Q?+ulZncMoo7ZibjtnI2EhQqmHtCcbozDdcbM9+dMk/qLkSOH2wy99b/cSHo?=
 =?iso-8859-1?Q?OJy/osQg2B7bpbIkLNKLNkjkpH46fsbhzKuj/+wxH6hCQo3MT+Gis/yfSk?=
 =?iso-8859-1?Q?CHRIXniRusdw39aP0U7X8JBpGQK+F+CsbW5jX7qDR7XPi15VpL1Xh0NTfk?=
 =?iso-8859-1?Q?VXID2ag1c0IMSE81Dt1Osx2T1S75yPtA2nMkEpPfpyNv745v8+SeA0DQ6M?=
 =?iso-8859-1?Q?4ccaTHp7hWEQkruRwp8DkpRMdczNydEHGosm/EoPVAbm7kNGFGST+nzRba?=
 =?iso-8859-1?Q?x9JnZug/f4fKt59ynGixtgegaNgfCFOJN2zEL9Yz2+K9oeAFccofN7sfdU?=
 =?iso-8859-1?Q?SxnqyfHfKjsSEqvdlPOYETIs9h7Qb8kJ+2OlUD4yKiaSY+nD9kGWY3Utw5?=
 =?iso-8859-1?Q?U2jpIVRJCU+bxZUy3PiIvIAOW7vSiverTQ1lwLKwmn0fq9yf8+ODvuQ176?=
 =?iso-8859-1?Q?Ht2s2rCoPVzL2rJmFp53RlkiB7mDjHxPPLXt2et+A8BLNIhCQhU6ND3iMa?=
 =?iso-8859-1?Q?QGn44MIMLTMO6XM3NsfzodKTDJ0irF6lndSi7LVteDGDH0/JO4Z8JhcVJl?=
 =?iso-8859-1?Q?Km8mfK+qxnTmo/CjByIbjfH6cEK37F2tVD/HcLkS3byCCGmiveHz7Rol4a?=
 =?iso-8859-1?Q?XscdA1hf4tI+3UAqpP+izv25NbDS1AyTnCT3jrWeozrvTD+Ro9BoDqVMoR?=
 =?iso-8859-1?Q?nadqi7HVvpNf3bmWDYILSxoQOMtleQF+sq5uiuu7lhrQzeBA1u8erkB+vW?=
 =?iso-8859-1?Q?fiBgS9bDagFicwX8KIh4GoXNbHm6KWnZq4FDdWANmqnhEPbDsaN+MGwv6L?=
 =?iso-8859-1?Q?U4nThInokyRn9ifGW2t3rAS6xPDGCjDuedVeIqfEhECIOHA64/SYizfAwm?=
 =?iso-8859-1?Q?94y0clkTtoOrKgrxnzrOA2a39U4j+H3o2Xcze6Afk/FXbN8Mv7buDBjAbs?=
 =?iso-8859-1?Q?Q5hvvC99tKqmLStzaui9udJndwc2d7sn6VGINIZaXaPbKTbVm6BJcnwabN?=
 =?iso-8859-1?Q?v1b/TOqHysKNjGZmX/MfjhZ77xH6ip8M9fkfbn7iMbRnHyhJSpTvQDp5xA?=
 =?iso-8859-1?Q?inM+UzILaRy7zoJf7BcN6yy7Oxstw7Sjv1Wml3KEj8Fr6L4mGaw0QKX11B?=
 =?iso-8859-1?Q?XgeKpJytN118J47OJzQsiZ1ug24KRXh2jTqA5rQqlhO2Sc5gpitcUZzTA1?=
 =?iso-8859-1?Q?IOzRfju3Pozl/h/EX+UIQrB3w6ftl75KKEAzFLh5cm26kBs+VS33GgP0Rr?=
 =?iso-8859-1?Q?jzLyT5xnpTnHNkk4PKAJySYgeDa/gjopTSHgvTQWyUclFXdk9qpZvhlGLh?=
 =?iso-8859-1?Q?9U4/7FAdx3/1vpLCiNzjfu0yFCbbPoxSWnWVCtO11AM1nuJq77FLfmxn+L?=
 =?iso-8859-1?Q?nv6Z5irKzCDDH5O1IQk3UOu94pyq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?d8wXfNiEOr44A2f/+OwPP6GBR1TrEpvr4ujfMxunkOsrJOB49vs0k0XwCk?=
 =?iso-8859-1?Q?UXEr9DFSMRNCKx+8dCFAUppxbNT4VTOW5uPnqvbAhhM1NuwwWRg9fj/zyI?=
 =?iso-8859-1?Q?tt0MSxVvcmMu/7Zdc5YAZeuPgmoqe6JLdU8MAtXh+cn6Cx+koPJeRY4fL3?=
 =?iso-8859-1?Q?A2esSSJSW78LU5euibmV9MgXYb/qR/KA/m/rbk20bpWQLQwVXMI64AXDax?=
 =?iso-8859-1?Q?7DQY2XNIz7aN0Hr9M14ZUPT3RkUVMgjObX3Ld+fcyuNZWkowzx5JsDTsY7?=
 =?iso-8859-1?Q?13UN7KMM6OT+UWj0/f0XOQATTmHK/woylwYOGbhwIlxRwmyRMF6RbMO/Zg?=
 =?iso-8859-1?Q?neELWqPuafjLR/zEETUOF4/Od0AxX9LGI/dLJHr0dOy9jbd6UnZ/rjqIVs?=
 =?iso-8859-1?Q?ZrmaTR4SMKbZgdLa2uVb1Gd5ZY1MBksuuv1l4X1fkkBWWqj+HcfURGQOkj?=
 =?iso-8859-1?Q?um4I/7JCJx9HG66YT+cakoPavW8P4b0I97+GLIjMi8RaUsII48VuQEhRcC?=
 =?iso-8859-1?Q?Dge7U5XXyCDXLzy41MONJAIgtimvRfvoJgOsaGY4stzsjyl5bvRG4b6PzV?=
 =?iso-8859-1?Q?NpYvYjUYQD3xcXg0vbc8izIfLigho2OQii1PpXla3ZaNR2O7xKk8ddby2t?=
 =?iso-8859-1?Q?WuUYuH7Z4DK49r8VN5fgSvSfli8gMOrfQcrynL6UJ6AadXSMgLnFUQ1mln?=
 =?iso-8859-1?Q?+M53AsDpjgL8dMdA8VVPw77XyfwtOB18wcVY9u98MrRYBKAY48vgFRcd2F?=
 =?iso-8859-1?Q?E+yq2uzRtIfVjwjdDJpwRIYDMhhFzqlYxQGJ4gWIJ6AVzHIomOtKAnRmYy?=
 =?iso-8859-1?Q?8OFYHkwjzJq1kY24ogqLYeXNvZsK5p46yyk3MlASHtalV2TbrdxaGdThhd?=
 =?iso-8859-1?Q?QZRnnjvbZVB5hfZlsDXEpeSWENKGCec+IrtZ+/wUcXPILqaz2aP8ahSDHz?=
 =?iso-8859-1?Q?egAqx84hyWWHGhguOtYPBzeqxgCwtVGTu/w12tp0tQt1EzwtH8rQ/FqB41?=
 =?iso-8859-1?Q?hCxsMAqymam3d0CrzL9kN7h1AzDeZR1aLqX9PQg2o+i8bn4KJMR4GHwm43?=
 =?iso-8859-1?Q?TTe+3C/QRb/gWKR6wyJkykn9aL91i3OzULEK0oi3UVGKjSYOMSA1OSriWs?=
 =?iso-8859-1?Q?9xHitZDSuo1p/bdWBZtlW3eFzprIie1snG+lMZDzjiAhdw/jVqn9683YlL?=
 =?iso-8859-1?Q?iBIKRn3EKPN6NNkS4jKyG1/Rx4EzDjRMtTVXf1v1DJoXnJFWnh1joDqhbX?=
 =?iso-8859-1?Q?Ot8gWR1j4gr/X+hTGybIajLGL4ljmzsXwr5HD0wvl4ekvSq3GXxxpFLM9D?=
 =?iso-8859-1?Q?4fQe+fey6yMJtB9wI+Pj6/uIjuX4G4vyIN5HK/T8V3MPN96s60OdLcH1Q8?=
 =?iso-8859-1?Q?Pq612K/GbceeNOY3OPsL+nBBVH1+LEuZZpgANKsxVswWoNWCyG2x2jN5q9?=
 =?iso-8859-1?Q?ujwZbdRNkK8EJPPUGKpl+fQyX1J09kjUgLeKcAafSJcof7qnNu3Ncl1Xhp?=
 =?iso-8859-1?Q?AN6zhkHLzHky6gCf5Ck11KCLSDbwYtDFBRP7iRPOx8TLPjUJuyT3yeQN9f?=
 =?iso-8859-1?Q?iw6yCBCLYOjtK+uHG3oavUw1ovTwxvmFv6gdFOB1pQ0z9vxI+J3jWoQc97?=
 =?iso-8859-1?Q?9lUUA3SSito09qbQTjrH20vPScIhaq5aMR2T+//vNzcOxkvb+yAkjpWr9l?=
 =?iso-8859-1?Q?228uxvkoQ0hhBQU2zbwDhOn8v9YYuIb6B4xZBjYeSc/7dDDj4DmHgbvSJq?=
 =?iso-8859-1?Q?zMEj+9ExM+cufNhW2Fk54VoeisWKJaRLDbyqSSW1HjjbTL+xSVbFVq/ohD?=
 =?iso-8859-1?Q?sPrMqSyq8lX09lN5HUT01j54gvMc4Cs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feaa1e88-4b54-4a4c-8ca8-08de52801f82
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 08:45:35.8098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ho4ueOmxvqpTo0UgfBXw1Rp1QC6qbrAOmtpkh1qS9TlNun+19Jeidh6HCwt7ofl3xm+0Wbv0z/ms2go1MluEGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8709

With CPU hotplug sysctls implemented on Arm it becomes useful to have a
tool for calling them.

According to the commit history it seems that putting hptool under
config MIGRATE was a measure to fix IA64 build. As IA64 is no longer
supported it can now be brought back. So build it unconditionally.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v4->v5:
* make hptool always build

v3->v4:
* no changes

v2->v3:
* no changes

v1->v2:
* switch to configure from legacy config
---
 tools/libs/guest/Makefile.common | 2 +-
 tools/misc/Makefile              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.c=
ommon
index a026a2f662..db268da68e 100644
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -7,6 +7,7 @@ OBJS-y +=3D xg_private.o
 OBJS-y +=3D xg_domain.o
 OBJS-y +=3D xg_suspend.o
 OBJS-y +=3D xg_resume.o
+OBJS-y +=3D xg_offline_page.o
 ifeq ($(CONFIG_MIGRATE),y)
 OBJS-y +=3D xg_sr_common.o
 OBJS-$(CONFIG_X86) +=3D xg_sr_common_x86.o
@@ -17,7 +18,6 @@ OBJS-$(CONFIG_X86) +=3D xg_sr_save_x86_pv.o
 OBJS-$(CONFIG_X86) +=3D xg_sr_save_x86_hvm.o
 OBJS-y +=3D xg_sr_restore.o
 OBJS-y +=3D xg_sr_save.o
-OBJS-y +=3D xg_offline_page.o
 else
 OBJS-y +=3D xg_nomigrate.o
 endif
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index c26e544e83..6cd8785cf1 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -16,7 +16,6 @@ INSTALL_BIN                    +=3D xencov_split
 INSTALL_BIN +=3D $(INSTALL_BIN-y)
=20
 # Everything to be installed in regular sbin/
-INSTALL_SBIN-$(CONFIG_MIGRATE) +=3D xen-hptool
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmcrash
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmctx
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-lowmemd
@@ -34,6 +33,7 @@ INSTALL_SBIN                   +=3D xenwatchdogd
 INSTALL_SBIN                   +=3D xen-access
 INSTALL_SBIN                   +=3D xen-livepatch
 INSTALL_SBIN                   +=3D xen-diag
+INSTALL_SBIN                   +=3D xen-hptool
 INSTALL_SBIN +=3D $(INSTALL_SBIN-y)
=20
 # Everything to be installed
--=20
2.51.2

