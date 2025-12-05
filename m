Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D22CA9473
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 21:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179435.1502957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRcXw-0007Dn-Q7; Fri, 05 Dec 2025 20:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179435.1502957; Fri, 05 Dec 2025 20:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRcXw-0007BN-MD; Fri, 05 Dec 2025 20:36:56 +0000
Received: by outflank-mailman (input) for mailman id 1179435;
 Fri, 05 Dec 2025 20:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rowU=6L=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vRcXv-0006OM-F9
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 20:36:55 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 223da751-d21a-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 21:36:53 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by AM7PR03MB6182.eurprd03.prod.outlook.com (2603:10a6:20b:140::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 20:36:50 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 20:36:50 +0000
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
X-Inumbo-ID: 223da751-d21a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHxFJcxGFBQDpY+56liR25hKkQ1H5lmAfXFWiFL5i2dEgYvcalX4EOXWHi1mzqDouhEmFFjbVmz7ov5xkP5hNYcR8cdvL0VPUSplSRjJxksBdGe53eTedLsUcWeNiZhOrOxzutcebt1PrsMcYwnsgw3f97Z+/CRHgWtB8atQFCxk8ZjzKZ2zZGQJgz91P9pDGBPMbQsCeZ0k9f3FOY0PoNS+zcDl9pWnQh8hxY5+6SD9ql1Z9+EwvMfSY/gzrmG55VL/tiUqncHMpE1sLYUEhFkGVW4qbZ5Y4hUrAVXb5uZtD9HUsFbo2YU73u2D1zXhwr0egEM7a8YZee+7oY0Klg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yMP3Tz77lZyIHFAGIFCclXZDcQr3lxGx6rzXnYKPZs=;
 b=BpHfM9XR/egSMquInMoIYCYtdN5m0kabhrqnT/xIy4qkh23E176gJKuiHu1XqZ0qglhZkpTAue8wK5XUpbNMQeGw+QKg1JevWi0QSGAzVuC+DS3bHjNayBbYujLFtcuepCDwacF9N+yuUA24ZtuFspr9fws+MgLdmhBqDPX6a5bP1td0PCC2UHvPbAdavem3mxunWd1mjt55QBhJhwZNk+DvaPYKUe3mnBrxFvkdSZoY+/F419apbLP//JlRRPfMTnz6hedP+mhW5AwZNPXqYvnidNRfvcRO5XTsEYg61i9BsmS5xPQ5Mx5+FloMDpBKIFJtbiwMMXbgZpTNZyqn/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yMP3Tz77lZyIHFAGIFCclXZDcQr3lxGx6rzXnYKPZs=;
 b=ilYlRFuY68ScLeK7H5FbP7kqK3k8vN1iLq1Szq1QLU47fNo7lwZOID2SjuNJ1zwpRlm0yqXuTgX5oY5ahMpWszN3QKjRrHlqRMZDwXFZKEg4Cg18PAaeMSWa9PpJ1JRhMK4XOm2/tYc56v48ZGhx3cme3wPfpaM3kgJ2hlcGIn6MUiwf2S75Nz3OSEQi17t0uIpW4EL4607a8iUB6lwfgXWi0Q0ZvoxUIK+wLnPd2aZaHDKDWuM5sgU1CK1PVrnjgikxESWvBoLU7N7YtuZRH1xf+ayuE7kDlTjBBEPUVZDD+O7Bkkxjbcv3OGI1BVHi588YJsq1XFouXuPHE6n1Ag==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/4] domctl: Provide appropriate error code when VM events are
 not supported
Thread-Topic: [PATCH 3/4] domctl: Provide appropriate error code when VM
 events are not supported
Thread-Index: AQHcZibiNA76ACBTxUmW3HNmbMMsdQ==
Date: Fri, 5 Dec 2025 20:36:50 +0000
Message-ID:
 <99f899addf349543eaaaa328596dd9bf90004214.1764961645.git.milan_djokic@epam.com>
References: <cover.1764961645.git.milan_djokic@epam.com>
In-Reply-To: <cover.1764961645.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB8322:EE_|AM7PR03MB6182:EE_
x-ms-office365-filtering-correlation-id: 24a9efc3-a44e-4c1f-4707-08de343e04ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FH5gIeSy/grFVN04JXmlVztRKAdcAMyAlXk3veU25J8WjKeL6bOUKd0uFQ?=
 =?iso-8859-1?Q?GrcgB0aY0TIpUS0PpqhE+n4Icytatf6nYXHzl+GfZgdXfIKnSkUs4Zq3CH?=
 =?iso-8859-1?Q?H02822biv3QM1ORxPK4K0QH8k3UXS5ivMQG/8GzgY4c4qat3+G12CTq1fA?=
 =?iso-8859-1?Q?YereJNuok/FnXl/X3ICbOQ3wPd+0928EROlXKp7J03iunW1UNZ17Nu5z57?=
 =?iso-8859-1?Q?MsKt/C+nT7wbncro41jjK4sQCOlkBzLTuYayBe9bVaF2S1pDayVRiDj+Wv?=
 =?iso-8859-1?Q?KAy691U3l446DJw7HqYVjeXPJ75c4ihKK9lb0w3INbVq40vIyxIJiwSawm?=
 =?iso-8859-1?Q?Hus4Dv+eA6RFpccBdNp/dmY0W+vNPVGKcvnvQDfbPyk4pytJ942R3eWeyv?=
 =?iso-8859-1?Q?yJHLZuCur1jbdOctgo3lAyBW7M13OhS1hBvvsFLoKEFqdGclCtCV8Vyqdq?=
 =?iso-8859-1?Q?XBL0Kais5swIAg8q4gQv/9+PtnqQjk4GcRUeWPuMmdCorb5a8sFJAFcHlZ?=
 =?iso-8859-1?Q?o46Qi6fzpMz/oxHvSoBtO2G87d4Q8NitBI5i4sXC22+GKPNsZU8u6dSbNX?=
 =?iso-8859-1?Q?Snv7aQdEfrnJqMynmKCYVEKdEe8Va7EHv56Y7IAv4lXRVwdlFnFF/aMzTz?=
 =?iso-8859-1?Q?5f+Jt1/VT+l3+AA/w+ohLciDDdHCdqb4LpiChcY8T5q8QOA/5+o1VXfnY7?=
 =?iso-8859-1?Q?XDi2Bggjtd4X1xjqAr4smOEoxKVDDn4QdQhwNSIY2FBU0mTAqjp0atf8p8?=
 =?iso-8859-1?Q?sdFFk79u+rKNI/QoUYmdnwH18OfSRvt13JRCfqoEz73V5ZDEO897sFDP2N?=
 =?iso-8859-1?Q?2k2Ez/IiGp5RriVyuX31Huyn7e82uWUgMbc90O/+ZBG3WDWXXT9LX74JxZ?=
 =?iso-8859-1?Q?EKmg4hh+G2E8zFzAymrw3h7+gBASt6sVBptzzviNPD3gsiQHen+PfVnF8C?=
 =?iso-8859-1?Q?CC6v+orudLVPXL8/YvgN7fEk/EX7tpuKnhJUnvcQ0rnQl6V+AHeO5E0P6N?=
 =?iso-8859-1?Q?Z+22izkAl/V5UXL1D3aeVF6HA/uMImj5X/js3/BEooHDGGToglNv0/0IVN?=
 =?iso-8859-1?Q?kck+5jt602W7dtxCcByCsUh1pSXAK+T0ukL/GAunJ7/HjFHa5o8Lm9Mmkw?=
 =?iso-8859-1?Q?Jc2A3+hRGzsPr359Qern4BMWZ3o1Fb73OFAXCyj0iF491KOmjOqnoi82PE?=
 =?iso-8859-1?Q?Z9brB0mvIsG9ibWLIQlU3v4IgpNGvhj1UNpEeFyLjjlzlHbvzS1Aif0SZG?=
 =?iso-8859-1?Q?FEq5g1HD1gu7jFiQN8Cm95DWpt05v4/FddeEVFv9mUIAUidXRHhkRU6OTQ?=
 =?iso-8859-1?Q?X4y6NVKGJgry1IUyhpAJ8sfGu6IygvsBYTptLpqXVDbkN7R+xnUBrHUdSb?=
 =?iso-8859-1?Q?Ea14OKj0XeN90UXcwwHca4m8X4IuP8ILcejYGs56Zu8yQQQRhbDkK9ykD3?=
 =?iso-8859-1?Q?8EbCcDtgGRehfcJeIb0pKo9pZCy0qTgDlE4+sQ1hnLHjedZleXVTre5Iw9?=
 =?iso-8859-1?Q?mR2oTTvRH5GOzy8+PlSehHyg+CYk9C7cgrdu4H+jUh1Q7NYPOogWZuILj+?=
 =?iso-8859-1?Q?Fiye8MymoO+J0Zq2Pi2McfMOsZHX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EXvRR67QPWQqoa2ViEwh2cysSbD2J4oPpnMWyrQZTfPXkqQj8vy8doXlsd?=
 =?iso-8859-1?Q?gKYrDhUiglNOL6wPtaBYw1ESg5De6o4jEwR+3asyhkTqswQuSNwOG1+CR+?=
 =?iso-8859-1?Q?PgGMYNUmMrnzXsu3K90vkJ27oiDlrabZHDAvZ+CzeomSMLmrvdfjJxEio+?=
 =?iso-8859-1?Q?8sW8XF1NoKzn7FzfXF2UKMYbxmkA6ZqLAfYW8dS4YnQxTK7dtZMrieOM+N?=
 =?iso-8859-1?Q?CQ08ZkCJdckbi0iBTeI60PRcR+3yHR1bmNC3yPJ//HOZNPIsZb1zFSSEbJ?=
 =?iso-8859-1?Q?1eWLM59v0AsX9GWaBZvLsVzhalZOEIJ1P+e5UaBio+lHlbsxvCqxWhfbJv?=
 =?iso-8859-1?Q?49MyXvuugjtVkHrpp9Tj486ZY3EvDFqL4kEbdly08A32tpibbQG5d0Abm3?=
 =?iso-8859-1?Q?tN1XTCBKy3F0RIW2NjY98950Ps6NJfVfFY3zqPpZXsSeeJd1q6C8XqLrpK?=
 =?iso-8859-1?Q?nn8ZcLnCPVZ4mLJRMazfyXmswideqAIJWsEcgqWS4UgUKz2kZp0XfElP2T?=
 =?iso-8859-1?Q?b4eeqq9T+9T2htR1AqlMcRNC/3qxz00n/4xf6i4WzkpmEHJDKhop8bBThd?=
 =?iso-8859-1?Q?IIIi56JkLYipfYLHmPMLuVQRyup8lB/TX4vGOU0tz1imI5OjqThdo4iZE0?=
 =?iso-8859-1?Q?NdTT1EnjHz+mxTUZswophFv/V6y3HPwc4SNYTd3xyRDNPfUWB+IdSylv6B?=
 =?iso-8859-1?Q?hj5RLNiOrnNCyqVpsVtpb7iT7qvtD1X4CAzBVM3VMbjYB7e5vCivvEI3CK?=
 =?iso-8859-1?Q?9dXcqVpKCj+b2N8Ni3IkvcpoNXoDPJdd+lb0Lb5+pSH8bzvh2o5iWpZNMM?=
 =?iso-8859-1?Q?KuGTTVVEm0chYsEMmzopBvrAze7354mMlKAtGdd/7ShImqmCOOTN7laNqt?=
 =?iso-8859-1?Q?A/YPk2qdQsPQ6WV1I5jlNNKyQ1EO0mNkL+X19rsh7nML3laKzrixN8imHs?=
 =?iso-8859-1?Q?/Xzrngs1GiXSW4aFACJwsPsP6LBr7rN0YfNh958ANsyVbDcxplqbH0L1tK?=
 =?iso-8859-1?Q?ZOtODBnZPkDj0nJ3jVWPzlyi2dz1xxtjgoRI8bcJROoj+9h0nom8ycZY2a?=
 =?iso-8859-1?Q?B/SmoR80E1RQdcuT0ffksHxqR3YSM0/oD1z9LIFXqrT5YrC9sft7bKjCBS?=
 =?iso-8859-1?Q?yJh6WIM5ZV0Z0enIuZlibBZ4fboVHxQ3/nmELmf0T93I3h3cBuSWZm77yX?=
 =?iso-8859-1?Q?WDP4PkJb8iHs1BLWIB9gxKfte4I+2ZFbAYHRiyIuebpjVDXODsgNg/R29r?=
 =?iso-8859-1?Q?7l9ACuoYoHB1OXSV5jfF13Hoo3vnP2D/8yZIOE41PMlMDdNAVAQetx45x3?=
 =?iso-8859-1?Q?Z6gNiktYvpqfchj85DzVLOVBBLt/fgoE49WnBqbLtNrcHStbPX26T3DiEL?=
 =?iso-8859-1?Q?lVpU6jFIJa6sKJbSKwD4u67oJs5T6U55AO1SavfKS5DwHzeD1ryC24Laqh?=
 =?iso-8859-1?Q?VSYvjmyHPORQxd8C8KItNTc8Iz9sCEtDgyEpu6QGlrGY31stzY0scZHTj3?=
 =?iso-8859-1?Q?fB61w+kD6Sa4pTSm7ZajOCvK2QYswbfnohtJVrmy42gEC435Pop6TPDAF+?=
 =?iso-8859-1?Q?HaegH2qsCsH/i6b+y8Ousa4Kne9XfAwINIeTNAdNjtlSvZ4Vva1im4OUI7?=
 =?iso-8859-1?Q?s9C6NbfmoMiWV8w6Orfm9jMn58+nASJZBQ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a9efc3-a44e-4c1f-4707-08de343e04ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 20:36:50.8123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0WYdXBzYZn+3udlZrwvzXZJwNO5OQiJm2lp7fcwaMQufIcuonQF+9QE/fN+LktHsWmHEYV1g2Pw0pr6jiqtE/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6182

Return -EOPNOTSUPP when XEN_DOMCTL_set_access_required command is invoked
while VM events and monitoring support is disabled.

Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/common/domctl.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 159864bc99..5284524b42 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -787,19 +787,22 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u=
_domctl)
             copyback =3D true;
         break;
=20
-#ifdef CONFIG_VM_EVENT
     case XEN_DOMCTL_set_access_required:
-        if ( unlikely(current->domain =3D=3D d) ) /* no domain_pause() */
-            ret =3D -EPERM;
+        if ( !IS_ENABLED(CONFIG_VM_EVENT) )
+            ret =3D -EOPNOTSUPP;
         else
         {
-            domain_pause(d);
-            arch_p2m_set_access_required(d,
-                op->u.access_required.access_required);
-            domain_unpause(d);
+            if ( unlikely(current->domain =3D=3D d) ) /* no domain_pause()=
 */
+                ret =3D -EPERM;
+            else
+            {
+                domain_pause(d);
+                arch_p2m_set_access_required(d,
+                    op->u.access_required.access_required);
+                domain_unpause(d);
+            }
         }
         break;
-#endif
=20
     case XEN_DOMCTL_set_virq_handler:
         ret =3D set_global_virq_handler(d, op->u.set_virq_handler.virq);
--=20
2.43.0

