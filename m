Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62271A663F7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 01:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918386.1323080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuL04-0007xo-Ep; Tue, 18 Mar 2025 00:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918386.1323080; Tue, 18 Mar 2025 00:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuL04-0007wM-C1; Tue, 18 Mar 2025 00:40:08 +0000
Received: by outflank-mailman (input) for mailman id 918386;
 Tue, 18 Mar 2025 00:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvL5=WF=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tuL02-0007qo-Kk
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 00:40:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2614::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88f22b8b-0391-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 01:40:05 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU2PR03MB7941.eurprd03.prod.outlook.com
 (2603:10a6:10:2d8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 00:40:03 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 00:39:56 +0000
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
X-Inumbo-ID: 88f22b8b-0391-11f0-9aba-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQRIU+jBy842nAozs8x9qUtArsKU/pMq+B7wIzpJwUxLcbVXjPylMmg+8yb/+bdZQnNzWXAsjHZXlWi3dHpZlZtzpIz3VvYGyFgobCQBdMwTrdjAHkwz6SA1pLlws/f9O8Nmt/GxaZctiRJX7O5ylQsYMAk+QL1iPaDoHaw32VPEafBNh9biQwo70NEPBzw4Aaaa6DGL/vze4XQzqlzkHvQVaVFvOXN9y9Si2GE8CldsDY/IXr18ktvWzYHTDQdDdtJaTVRLoEWPWM7aR9dUYKt2jLyEF/ezPBfWxkH3h28pCPZpwqcht3CUg78kRV+kffi7/tsnsCi15XNdD0+rqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXv4xU4x+53wBXOUxfeyQ86OQhwSjk5uUNJFUrGsBfY=;
 b=Pi8cBNLwY65DyXPcxbxXdPbqRbHOcdhNMOuY7yIexFtNY/0vhg2+V8wSxHCUyjAYZ1iwt+KPjGzd7jEhouqk7Oi2DEcG1tZ2F0qacc+bcITt0Ly4e4NXSIPYwEwMRBsNHoQUj/XpdaMC7rIqsGRok/HZxAIExLlr6e8B1oNr05MBmbbLoqqXmn9e5kqM7fkyPPXxzDKUCu6t8E2EYcjqDGgRA33JU26TLlavPP/+CePBtzVfJFV/CaaXmUqj93Bqb0KFq7r2TC2mTDv76y+C+5qpA/9fIOtiPjGDDB+rX4Yf8EJsvQVPEcxRDCD/ntehTFsR1EKfUBOymExULMmXfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXv4xU4x+53wBXOUxfeyQ86OQhwSjk5uUNJFUrGsBfY=;
 b=NoCHA+ujoOWkpn6eSYzaC8EUmeZkmQbjHwGlA2LnDs7icR0T0J+7+jRMoJdYjCxqglL7TU/TfiU+yRSlwNjn8bTTKWFCn4NjE788kF2aHSyD+po462mdClxj+MYWya+f46RAAkpXlEWVwf5wScys+YIgbOC7I3rmoTa1VQRtZpLkKJLGsxFPrmdNYA6IRHpaisqFWLLQDM9ORkm7GGpbbWPEhi44Op/byvB6Wi5q5SIZcRyF2Lqw60JUQZ0aq9YWeGRxwFrPi78kgcjOdt/f+KH9mBuc5rWbmyhkCQ2JGrrF/QpmECshBLCU62bK78dhK4BbYzQy2LI99pgCFbfiVA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH v2] xen: vm_event: do not do vm_event_op for an invalid domain
Thread-Topic: [PATCH v2] xen: vm_event: do not do vm_event_op for an invalid
 domain
Thread-Index: AQHbl55FCdjKP1y9WUaUbohmcfQCbw==
Date: Tue, 18 Mar 2025 00:39:55 +0000
Message-ID: <20250318003943.1191439-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU2PR03MB7941:EE_
x-ms-office365-filtering-correlation-id: 893314a5-5f80-42d8-b73c-08dd65b567bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5iLJS0GyXkysNHeuQI1a887nU9vRvF4yT4MlsLLti1V1ruOgV3jRWAnwbW?=
 =?iso-8859-1?Q?Auo7c6KVwi47JPKNSt1WuVAMPxDeh9g4LSel2SmtSla3YYzezZKuRoIiCf?=
 =?iso-8859-1?Q?JRaSRf1Ir5dnDejTN/uHXc0aJbYRNgk2RK5CbZkIaQBygEg3RRtYjFwkix?=
 =?iso-8859-1?Q?EuJCB2uOTzEQcXqBwoackJVRwfDcJaEBKB8wWBvCnCkvI6uApLgbJlsQyR?=
 =?iso-8859-1?Q?TGWLDfExS9jiNG891bPppMpZm9i5uoI6nQlyi2xnzqV/WrMRd52OU2hpc1?=
 =?iso-8859-1?Q?gF25/KkszTJUq7hDk6bxLEmY3Ehbe+mk6DSq7o0t80Ul4FizEtKYnFOjPa?=
 =?iso-8859-1?Q?GVyFlADQJQB3Txn4GcF5fAXsVPyPlVZFll1IHzKeb7/Fn7bipywauJKHqx?=
 =?iso-8859-1?Q?VHomtysPLbkFrIhhTBDGDzzmAmZtCPeBlxNe28UsVZdwJAoRwuJUwJd0qn?=
 =?iso-8859-1?Q?okxNgW3WGvxZD8Aiuq55XvC402Z4CUj8X/F8m2A5FkJ/m8a6FTi+KTNTvy?=
 =?iso-8859-1?Q?2BzAhcNvErfXUi484cgGSqlab388qgbg9eyI1vNnhKespRarSQ3Y/mhK4t?=
 =?iso-8859-1?Q?vwyXrz2l4EP9cCCQrxdhyqfYwZk39uHIViOSLuE7wZIVL6KOoA8uW/7Vz6?=
 =?iso-8859-1?Q?y1QLFY5/q0brWrFf5Fh3zPMoDLE4SkQHxqXeGSRHL1dULMMk7bHmE8Xltw?=
 =?iso-8859-1?Q?VXhoEDBvhsMmQ/YGYkwqo0IAcz2y9IaWI7C8d8KTOJFm7chj7AI0HS+Sbi?=
 =?iso-8859-1?Q?amF+jAILnDSpcFVOI+aegpZyG0LfPM7w2IyhHIACHXJ6RjKeDTQzn/RxMV?=
 =?iso-8859-1?Q?OWD2d9fVC1kdGrhd5BPqIJZ9XxcXyZW78UhO9/KFe/hgHXRvbknn7M26X6?=
 =?iso-8859-1?Q?53dm9yDcN6+aKxE3Xij5L+05QNqnvTZqOzHmyhjBxTJGDATh3ElPNg8g+h?=
 =?iso-8859-1?Q?/O5VK/0J9D7AWtxSwOoj7sGvba2fXdFDMK3KgU1P/4LG7jS9JZziVhtrEy?=
 =?iso-8859-1?Q?wxpmHK0WXJ5BO5ufkMYRA9Xb/ItzqiOLV0yzTnVRpMjnsccTFXB599eU/n?=
 =?iso-8859-1?Q?+bekl+663sVIBHwwLSQv5d1ZQFBdlTW5VjHs6OGLca0Rv43YT5zDaZU3VR?=
 =?iso-8859-1?Q?vHJzUXBBFH3u4HeqrwVxOHjMaXoVXclYbCD4xO70dsCQrPKshfOdKcyZ0+?=
 =?iso-8859-1?Q?NHRrI8lnzcbq8CyP8UDlwYBGBBusk3idqXGexpfJZkQEtIs69Aw16EkSjS?=
 =?iso-8859-1?Q?vuRb8sgYNs2SAy/ba7EbrjkTHbJMO0oVWSMxbvVyDuai+MvxOD0NhUIPIB?=
 =?iso-8859-1?Q?lb043ZgWGn3JekeKNGkZFVeYhijCRg7UiwPq8HoAzNPEuWo6f2YZVmSPe2?=
 =?iso-8859-1?Q?+RBMHVWrlpUxfKHK1E62etV1+q50uLE+mI7s87w+j6Dbxiz6Y8ONnhozHl?=
 =?iso-8859-1?Q?uFVFtbiXCgeuHreE1AkjndolCVYtO1oixzCc9NdFLLm05TFVaD2PlvQnQ/?=
 =?iso-8859-1?Q?RzZHaavzo2+m0W108wnFLi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2hBvqReyWuT8DTqBF3k0ZLd0SsUwD5hTs6KVyZFtvAf1UrxE4R9IPdQppd?=
 =?iso-8859-1?Q?Og02ymBbnthm6ecUjYxnBuCDWYIKxMgTnw2/3Px0itk23jH29F4pXuVY4j?=
 =?iso-8859-1?Q?oDUp00sFIpXDlZwOQ1c3bNrbxK1L4PBYCTGxWrry03y1q/wgBYirgrbvjt?=
 =?iso-8859-1?Q?N79teJjwYB18qHjHBEy2iZPMh2behZ5SLVXGFYb6GaclRrAgwRS6w7gBOc?=
 =?iso-8859-1?Q?l5srK7aqjCo7gL3tQqeaOCUBq5R5sqd8JwHgX2TO3Lb0kYVvqKQ2C58VP4?=
 =?iso-8859-1?Q?bijXlKSQs/JP5XyFUaPSJjJQMO/manNkTdV5xtv5mCKaAfrUyfZROlcfkG?=
 =?iso-8859-1?Q?oXlrA5RbXV1Jpr33Qv1zoGbM0FNkf5DnGMOFTy4649i+PxjWMqoYFWV55T?=
 =?iso-8859-1?Q?CiVnIP+o9JbVLLOSTR+7oC2WOlL7xOoZY+DeX5fVoXuN+wTeDRZfFoWw/R?=
 =?iso-8859-1?Q?RNUJIivix3IGFCPAxXjhb7mliZvqfhKp2SqnXW/IRCUXrVJ+AJ4U9xleme?=
 =?iso-8859-1?Q?LvAa71PSo/CfRQdCNZQiiqWBerfpNXSCWeYUs6JxXMMtC+Y3NuUksSadSd?=
 =?iso-8859-1?Q?hUaLVgyJeKYd1tamvDIwNmgNW3c0Ru7DCJlimieLAtvmgUZXKMkBbvah3A?=
 =?iso-8859-1?Q?quuqI6WC7IOXwiitioSYzTPVVX25WDcdWFtgsBqWbENCEiUgqtxAtLguvN?=
 =?iso-8859-1?Q?ZId4WQNvCRPl5RYHpuDQb4PBmmrq0HiTmz1JtWU1+Q/XhKSnvGg+u0BwZQ?=
 =?iso-8859-1?Q?1JmExPi1nMoESSeIcO803HPXK19bZMv2Wno7yC7k39d9yWrbIM2mSQc4QU?=
 =?iso-8859-1?Q?qWFdnF7VJD2Qqt0cF3iixD+w2qVv7/n+XB1isJ0SNHc4o2+owZPiC/pWd2?=
 =?iso-8859-1?Q?ldD51CZ9iJcXagpOoOw+IS2utDjZF5rWNPtv6GfifvKedpkjdL0S8O/dxx?=
 =?iso-8859-1?Q?o9NawE4lCAdrTn7EI8Agi7jnvi/DsU9IhIqe3VU0v0lPZf/hKKCM4fpJSk?=
 =?iso-8859-1?Q?LQ3ToS1uYs4vglktdvpMqodrZTxM5ZF0rw3ceF/ImwgpwJ4ZevZyk9/xRM?=
 =?iso-8859-1?Q?IoDxafLflWTndVuDejzxDe3Nz+oJyQjZmV7FPUmhcT/cVVjyF8UWI6ctxZ?=
 =?iso-8859-1?Q?Gko7p8kuWr9Jt8uuhG/Ry/205B+hTWS9DQFPpo/EO3Hr9gsJV6GtCO71kU?=
 =?iso-8859-1?Q?UBRZa/+QET2xRnlquPh3SjE3ncPgiZZp7eNBxwSAMYzWg2v5EMFirSe+VY?=
 =?iso-8859-1?Q?G5Du1gKQFn3A0eg3rwyu9MSGMOtXmDb4wOzyuUVLTybhj+ZPYHH/o97CgI?=
 =?iso-8859-1?Q?I5l+HvWeJ+hl0aaHrM+iasIiti+uoB7VzHPLCQUiKxYdRU54KE7g1zSFQA?=
 =?iso-8859-1?Q?HuwchxQDTuAesvpIweQX8JTH+gKKlVLXg2ZWBhR6/3bn1CdPpZQcM+6IPX?=
 =?iso-8859-1?Q?A+LwmMHHslWtFNazXDL2EICfa5+FV4To3847Dpqlolnb10pr+M1SPV+DQR?=
 =?iso-8859-1?Q?+0d7byuMDaJnoAIUiBdGIgPtluebl/xCFxaG6i70qrzmyGLb9xHgNqOa27?=
 =?iso-8859-1?Q?VZoVDIslavjjMtWNlhckNCj7Y6QNmC1TRw7YzYtFMZvV/6En3SMCve5ZTQ?=
 =?iso-8859-1?Q?iuJgkOD/hThlvAB5xgupSoUnADBgFNTKXdSFTVD3OygzuPiSn+Sr7sfg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893314a5-5f80-42d8-b73c-08dd65b567bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 00:39:55.9916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1drBLeFjgsxqUhptq5wTqHzU0Ibp9GPKwZHhJY8yQnrhXIdnHFIIgPqNaPqGkRoZQuQmUnWjpE8IZkf4NTEOoc0VrOGcEo5dakiJpa/g6RE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7941

A privileged domain can issue XEN_DOMCTL_vm_event_op with
op->domain =3D=3D DOMID_INVALID. In this case vm_event_domctl()
function will get NULL as the first parameter and this will
cause hypervisor panic, as it tries to derefer this pointer.

Fix the issue by checking if valid domain is passed in.

Fixes: 48b84249459f ("xen/vm-event: Drop unused u_domctl parameter from vm_=
event_domctl()")
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

This issue was found by the xen fuzzer ([1])

[1] https://lore.kernel.org/all/20250315003544.1101488-1-volodymyr_babchuk@=
epam.com/

In v2:
 - Added Fixes: tag
Addressed Andrew's comment:
 - Don't printk anything
 - Return -ESRCH instead of -EINVAL
 - Add comment that describes why do we need this check
---
 xen/common/vm_event.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index fbf1aa0848..1666ff615f 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -600,6 +600,10 @@ int vm_event_domctl(struct domain *d, struct xen_domct=
l_vm_event_op *vec)
         return 0;
     }
=20
+    /* All other subops need to target a real domain. */
+    if ( unlikely(d =3D=3D NULL) )
+        return -ESRCH;
+
     rc =3D xsm_vm_event_control(XSM_PRIV, d, vec->mode, vec->op);
     if ( rc )
         return rc;
--=20
2.48.1

