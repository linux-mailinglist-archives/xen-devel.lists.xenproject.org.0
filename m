Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE782CA9478
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 21:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179436.1502967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRcXz-0007Ua-5N; Fri, 05 Dec 2025 20:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179436.1502967; Fri, 05 Dec 2025 20:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRcXy-0007Rj-W7; Fri, 05 Dec 2025 20:36:58 +0000
Received: by outflank-mailman (input) for mailman id 1179436;
 Fri, 05 Dec 2025 20:36:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rowU=6L=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vRcXx-0006OM-0T
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 20:36:57 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23689d4c-d21a-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 21:36:55 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by AM7PR03MB6182.eurprd03.prod.outlook.com (2603:10a6:20b:140::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 20:36:53 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 20:36:53 +0000
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
X-Inumbo-ID: 23689d4c-d21a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5bqKK0zmCGQWij/mtSg4UqVPs89U+UqKnV/wM1Ve0TmJ0Z/AEaN4OOuSv76Xp++3pW7hdqhcBvYV+9W8Kar4tRvYFuZw6OjFtV4eVSyS+gUWfbCswkzJPGv7n91BVth1HSKKKs6thGMTFacBUM/Mcb1QnBdyyTwGlZeAjeUsQXtBcr/KH5WPuFWY7wNjkWFG6pVE4m9jsMkowzQbFU2x9HINZG/KgI5nB3sjelKxDU9UWqk0YAzVsFaL4brjQsn5kHQ7YyXGLfBCuc4Er8fDVSTwcSuvGsRdu3+8q3wzEKrbrovV1AJJtSkUR4MGpYscKP1cv5utJPsabkHQzKq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3hht+B/Z3BXKM33lvD97f0jezcDIH+75DFkaQV/1GI=;
 b=JJ/0mAiU0nQr5cKil2pQQv/nuT5V2nN2P94cGR4BCKELf2Of4tSGACAe7++tlMS++ohxmRzNiKp7E+X63EHDuk3+Xl6wjKopceCzEDB73YZPQ/ieXjYqRfCfmD/aEscmCS4/CwNAF88zFEqn3gR36T1aSuofCYAhX/eUic+a/SJqTJEF2aiQDwl3kLPbKNIOWTGkNW6v0Uyj1ypXqRWi+MMNDzDYEsPiVcMW/z7XN6S0r1bFZnRINjE6BQV/JwD5D2OhwEa2T5uhp1fX4GQO/kpNHsUt7o6HOOYRScJGZBvNUH/RI3koXJ+5544/qUFlZr2EVhbPEnAHAAVOQnPvPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3hht+B/Z3BXKM33lvD97f0jezcDIH+75DFkaQV/1GI=;
 b=IJbTpA46w+dzRoftvYZ9BUWz+SSGpId9e6oVJxes9Vhl+7tR/xg7vi5NN3PI086LLAmoEV1kpbGisTyW5At6imcMUywywd7f2U11PSnjymYgiM5S+1WILe2ohUUH0nNB1iHjHoqt0nDdSUxEExCJ6fEQ4eKNb8myZBdO8//v8ACuug+33isnlMYJWHGSA7x6cicCGBJQD/iMU5GLhw7GX1TJQVyNBs+fOXu1CfmkWJu9D/EAMUwMxVRfzHcvmF3wsm/i5bHK0uX+rNiu8QvXed8LfJPoJIeVRSzESPIJxAHAj5URE0AFflNAQn6IvM6e0aFTFq4XRQo10s91Wy/LNA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Ross
 Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 4/4] sysctl: align handling of unsupported commands
Thread-Topic: [PATCH 4/4] sysctl: align handling of unsupported commands
Thread-Index: AQHcZibkme3OGvWxDky6ckEgDIZ95g==
Date: Fri, 5 Dec 2025 20:36:53 +0000
Message-ID:
 <6c7cc11e3569f69b185d32809d63b8cdca67aa25.1764961645.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: ae5f47c4-96ba-4233-5a04-08de343e0688
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?b87e5TVUdR21dga6uFPvdOOyklBWDB/h9DMsTPrIxCJFHeD7378yZ53Knr?=
 =?iso-8859-1?Q?SSjyjeiOIlVTvNQrmJMpQeIy1zBa6JxihfWcagiiTnKPn7CTSy95X9V08Z?=
 =?iso-8859-1?Q?jMIt5NssL3Gq2/NWK/4L7cpGpXO/juS0zkRLlVBQeKjoU4Z3g5W0md6sLt?=
 =?iso-8859-1?Q?nwV8cruInIp/9Mss4XusgabxZcr6YWCNkzZG8aCRaL860nd7QwJ9qzZMdh?=
 =?iso-8859-1?Q?MgCqyXJhnMO4YpnyE8AxJ9M0qHYBDD/2CuiMAawUdgk0RwNHcy+8NgK2hf?=
 =?iso-8859-1?Q?mfmXZHb0enY2OIIUn779teMkYDeukettVKs+IPdMusoymJslF9xAH00N8N?=
 =?iso-8859-1?Q?55J27h+G+pcBaB4MPY+zk6yb5TQ1gdxTX8fiP4NmXNg2gbJADkMnRY05+E?=
 =?iso-8859-1?Q?Qj4ELxceQsdcY2lA6eu5g/3kbeJfzyDLVu91UjRNzJYKSAV3r7IFvekTbs?=
 =?iso-8859-1?Q?3TX9dgWfl/dI7g+8i9/i/2Lgyq+iGEuDHHcHUxyeKxNy1UJMLHm5HAWw/n?=
 =?iso-8859-1?Q?t1QREM94uNoAHSqUZqKl4rxSU0pahgJkq0rIj91LcItHcxN6nCeQ+9PzKW?=
 =?iso-8859-1?Q?4Iq50BaNZ+PTOEbHLlWFRRVDMfy5kWJ4vywL4oYQdrljtX8WyJnKbHixqT?=
 =?iso-8859-1?Q?1g0eJo+IwSflKisk/bKGDC48V1/iedKKObWiFZ7KfGclW+8qZcvu+AbSV4?=
 =?iso-8859-1?Q?4p4KCXoMyw7d8XcQ679VZZRe0dgHpD5FzXWdkrG430/yMsl9PK9HTT/bvo?=
 =?iso-8859-1?Q?lvXpfuB4TXK8sbI1tZE86AiLp/PgnCLW2Cl8xouQ7C1QaeNdxstMELkcsP?=
 =?iso-8859-1?Q?oZxwlpP1eMoyxXnC6R8YX7jDv+zqjbbF02IZ2QG5fNMWrwSLzBLWhAcA5r?=
 =?iso-8859-1?Q?x3WtUhuHSh1XNZOAuSIDZ5FSVT8TGfxjEdEGSbtV4lCJb/izv4ac2Kwtql?=
 =?iso-8859-1?Q?aOc/YOarg3HziR3gdiSYTVxHRUQKfNkWCcm0Ui/5Ub/DId1HX8NCg9UIaF?=
 =?iso-8859-1?Q?0TGB3EmGBFJ5UfUar0oUgFE//edbpyBW2lrV21dFOTJ7urBA/3pVDTqT0z?=
 =?iso-8859-1?Q?cqy9K43QLKDlz0nQPJ/AVgNnymFQHoPY2Yw1nBRFzJ4LBLd46bJGwgmco/?=
 =?iso-8859-1?Q?DSgHs/irQe8wx5YpYjhNrWGA82/X47paLwaD3xbUQGQI79f7fDa0Inpyrc?=
 =?iso-8859-1?Q?GIYoo2lpndIT/KxTSrLXTbcqXSKX5Jio/YQyRS475dTVisKz6SrKpjzi1E?=
 =?iso-8859-1?Q?bK9cND3FZAwHhIobDh+iYq+tLj6czpbzNZ2L5P0a51VzIqpb59fVJ7gpsh?=
 =?iso-8859-1?Q?hZCUQ+rZmAdcwhtOjBrISG/u81H1S/CdrngzQehqsgvGF3ygn1fvLtnVZq?=
 =?iso-8859-1?Q?GcYX1p5MlWBUWkbRM+HlY2ymQ02QyHmTL8Wya5I6Xad7eeUSVFRuszVXYE?=
 =?iso-8859-1?Q?Ul3J/aApleAOMdpRvF7i4mJgaDCd7DKk7ooqxBHqGB/RlgWzTt9J48HQMo?=
 =?iso-8859-1?Q?xqrJLIRqzxBm7faB+EMMgfXPURmo1BmGzHmCARjNjop7rBHGxpYd2wrpf3?=
 =?iso-8859-1?Q?WBnj8CaPxOuSAvYUCVOYG9mIg66S?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GO1N3MwwGLX4fqYJLJSGeZm1GZ0lb5maYrkaNW/4Ssl7YCsdRdzsTpia75?=
 =?iso-8859-1?Q?6cJIff/CAaH6OCRoQnIk54IA5+c7hn9DO8fomAthwaQ6U/w6JDYf2qUUW+?=
 =?iso-8859-1?Q?18QIaL0YIreGZxl3oZg+ktxenf0VHvwpyfYYsDWv13U+FRqTI6Hr6JK+zN?=
 =?iso-8859-1?Q?ZKJrbNKiKZs1z0ifutZxiYai7ZsO3Zz4XONtM8yEvdS8eOjOsMdFBbz01+?=
 =?iso-8859-1?Q?DuKLLge7SEIuP/csmgB0PzQuaKU9X9SbD/oY1RXaAvHH4/udSIvU9u5i0n?=
 =?iso-8859-1?Q?y58GZBv9BXcNLtB99zLLKYauIAWzfRsb4tY6cYhfD902PkBIR+d7A+TJ3o?=
 =?iso-8859-1?Q?eXiw7O6plTqHcpjFzqgwLpNjxNQOD9x7yMP6ItvrdiF8Rodfp+MfXLzL73?=
 =?iso-8859-1?Q?zLonMT6CtgQm95C31UXSoN3jsNjcfcIwxY4jo6F6ICI62+XOcUHdA07UbE?=
 =?iso-8859-1?Q?CyaD0EqAMwBgtdsBOcbq+cECDvVWhSRHNdc+Z8QHY1LNeLX5YN5EzJ0MKy?=
 =?iso-8859-1?Q?Jw46JhiHMGpsLxt501UYqBZ0Rwr+anBkPaw4V48oe81apUXJRz8ZJ0PjUP?=
 =?iso-8859-1?Q?ZpDvwL6XYwc6EWn4KZ7qBBw+U/Ox7VaRRLtN80xIREtMtoKZkKmVuwjH0b?=
 =?iso-8859-1?Q?lKBjYPD8AwHHUtzT8z8q2gC4S3xhf/FunOXGnCTU+N04QIUDlGH9c/RlyL?=
 =?iso-8859-1?Q?+ZBL4Xu1gPedvP+9x/9/bejgZtHkN5ITAhKNlR8W0I3PAyMAm375oKAgE/?=
 =?iso-8859-1?Q?AKQ5MJcCJz3MkeF1l+MwnBzr3Kvv2oTZB2cQugiCzNsVOqPx9Ql3rIIkdL?=
 =?iso-8859-1?Q?op8gVWwHFqbXNABVXkLXv7+YZUnMqx0dVYf2v96d+i85Wv6H2cODpp9pcC?=
 =?iso-8859-1?Q?JfFefGaCXo6RJqVLLRtmLlQBpYZlL68pZgSG0/wX6CUn1ibH5EilCTqB1l?=
 =?iso-8859-1?Q?l4qFvKVxH/jdoiJ6bHcpC940y9JrKIbgk4z8ZfDBIy1y1MyfptUZXMOcdG?=
 =?iso-8859-1?Q?fVOkbtgrNqEujHc9zEYH7iluFYtbkvl3uV0HleNRkamzxtAa15y8ykIcN6?=
 =?iso-8859-1?Q?58CuvcOXf1S5o8Rc6YYE2LDtUY6CmUtf74i/2JOLXuOSy/sz4H4r49DMUY?=
 =?iso-8859-1?Q?0MA94nTyuNatbH3iR7oClzSU7MNHlx0vqyPaWFZ6TxuvPSROPPbUb5QFDU?=
 =?iso-8859-1?Q?KFtLJIL87j1aljQIRPh34hNQHa/+FrRrUmtdsEPq3A7rVlULrrS27I3o0w?=
 =?iso-8859-1?Q?QyOdLPI/TONNjksDTEXFS7TX+obOiv2Gt0DYl2KGIfnm8p246yIcoCmF1a?=
 =?iso-8859-1?Q?3klCthwlx3vGI6PNzMmg+uZUNsMT5uNBjvXxlm3gwvW4bfUjzB/f1p7lhZ?=
 =?iso-8859-1?Q?VjopXJJFBK0dDcdqb1BbVvoUTiW2jpMtfnqLp29Z+Q5uxWRg9g5ESt/Snr?=
 =?iso-8859-1?Q?D2ofXDDP0GClOxp2K34Yg/v4/yNwa+1ZznvcYluc5OvpP9zcVftdohapPS?=
 =?iso-8859-1?Q?KjQ+iT9jgauotQoHGtrBf/NK0Hz4F4ewT0ln479fQZbIw6bbk74XtCkIhP?=
 =?iso-8859-1?Q?/0Qbwr6mUe52boAcg/n68MJSHfV/6cHGBI6IUfduwgN4JFWUvLHXrRBzc8?=
 =?iso-8859-1?Q?TD0HZekuhSz8dBYynf6yBfUH2fT+SBGIwW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5f47c4-96ba-4233-5a04-08de343e0688
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 20:36:53.5131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MgrgwS6FBdzIJyP+ZVh5v14mgwDypBHvyG+9J49KmGk0yvcv3LPwvyt4lr+B35+PS4Bdc43UFSK+kzOmmzQgQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6182

Handling of unsupported sysctl commands currently diverges: some commands
return -EOPNOTSUPP, while others fall back to generic -ENOSYS.

Unify the behavior so that unsupported commands consistently return the
appropriate error code, allowing the control domain to correctly identify
unsupported operations.

Using IS_ENABLED() macro to identify disabled commands, allowing
dead code to be removed at compile time.

Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/common/sysctl.c         | 34 ++++++++++++++++++++--------------
 xen/include/xen/livepatch.h |  2 +-
 xen/include/xen/perfc.h     |  4 +++-
 xen/include/xen/spinlock.h  |  6 +++---
 xen/include/xen/trace.h     |  2 +-
 5 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 5207664252..1c4e0b60d8 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -113,17 +113,20 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u=
_sysctl)
     }
     break;
=20
-#ifdef CONFIG_PERF_COUNTERS
     case XEN_SYSCTL_perfc_op:
-        ret =3D perfc_control(&op->u.perfc_op);
+        if ( !IS_ENABLED(CONFIG_PERF_COUNTERS) )
+            ret =3D -EOPNOTSUPP;
+        else
+            ret =3D perfc_control(&op->u.perfc_op);
         break;
-#endif
=20
-#ifdef CONFIG_DEBUG_LOCK_PROFILE
     case XEN_SYSCTL_lockprof_op:
-        ret =3D spinlock_profile_control(&op->u.lockprof_op);
+        if ( !IS_ENABLED(CONFIG_DEBUG_LOCK_PROFILE) )
+            ret =3D -EOPNOTSUPP;
+        else
+            ret =3D spinlock_profile_control(&op->u.lockprof_op);
         break;
-#endif
+
     case XEN_SYSCTL_debug_keys:
     {
         char c;
@@ -170,19 +173,22 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u=
_sysctl)
         op->u.availheap.avail_bytes <<=3D PAGE_SHIFT;
         break;
=20
-#ifdef CONFIG_PM_STATS
     case XEN_SYSCTL_get_pmstat:
-        ret =3D do_get_pm_info(&op->u.get_pmstat);
+        if ( !IS_ENABLED(CONFIG_PM_STATS) )
+            ret =3D -EOPNOTSUPP;
+        else
+            ret =3D do_get_pm_info(&op->u.get_pmstat);
         break;
-#endif
=20
-#ifdef CONFIG_PM_OP
     case XEN_SYSCTL_pm_op:
-        ret =3D do_pm_op(&op->u.pm_op);
-        if ( ret =3D=3D -EAGAIN )
-            copyback =3D 1;
+        if ( !IS_ENABLED(CONFIG_PM_OP) )
+            ret =3D -EOPNOTSUPP;
+        else {
+            ret =3D do_pm_op(&op->u.pm_op);
+            if ( ret =3D=3D -EAGAIN )
+                copyback =3D 1;
+        }
         break;
-#endif
=20
     case XEN_SYSCTL_page_offline_op:
     {
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index d074a5bebe..1601b860d8 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -157,7 +157,7 @@ void revert_payload_tail(struct payload *data);
=20
 static inline int livepatch_op(struct xen_sysctl_livepatch_op *op)
 {
-    return -ENOSYS;
+    return -EOPNOTSUPP;
 }
=20
 static inline void check_for_livepatch_work(void) {}
diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
index bf0eb032f7..a44c2f74a1 100644
--- a/xen/include/xen/perfc.h
+++ b/xen/include/xen/perfc.h
@@ -92,7 +92,6 @@ DECLARE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
 #endif
=20
 struct xen_sysctl_perfc_op;
-int perfc_control(struct xen_sysctl_perfc_op *pc);
=20
 extern void cf_check perfc_printall(unsigned char key);
 extern void cf_check perfc_reset(unsigned char key);
@@ -114,4 +113,7 @@ extern void cf_check perfc_reset(unsigned char key);
=20
 #endif /* CONFIG_PERF_COUNTERS */
=20
+struct xen_sysctl_perfc_op;
+extern int perfc_control(struct xen_sysctl_perfc_op *pc);
+
 #endif /* __XEN_PERFC_H__ */
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index ca9d8c7ec0..10ee81b7db 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -7,6 +7,7 @@
=20
 #include <asm/system.h>
 #include <asm/spinlock.h>
+#include <public/sysctl.h>
=20
 #define SPINLOCK_CPU_BITS  16
=20
@@ -40,8 +41,6 @@ union lock_debug { };
=20
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
=20
-#include <public/sysctl.h>
-
 /*
     lock profiling on:
=20
@@ -164,7 +163,6 @@ void _lock_profile_deregister_struct(int32_t type,
 #define lock_profile_deregister_struct(type, ptr)                         =
    \
     _lock_profile_deregister_struct(type, &((ptr)->profile_head))
=20
-extern int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc);
 extern void cf_check spinlock_profile_printall(unsigned char key);
 extern void cf_check spinlock_profile_reset(unsigned char key);
=20
@@ -360,4 +358,6 @@ static always_inline void nrspin_lock_irq(rspinlock_t *=
l)
 #define nrspin_unlock_irqrestore(l, f) _nrspin_unlock_irqrestore(l, f)
 #define nrspin_unlock_irq(l)           _nrspin_unlock_irq(l)
=20
+extern int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc);
+
 #endif /* __SPINLOCK_H__ */
diff --git a/xen/include/xen/trace.h b/xen/include/xen/trace.h
index 30ebdcc47f..fff3a4f451 100644
--- a/xen/include/xen/trace.h
+++ b/xen/include/xen/trace.h
@@ -48,7 +48,7 @@ void __trace_hypercall(uint32_t event, unsigned long op,
=20
 static inline int tb_control(struct xen_sysctl_tbuf_op *tbc)
 {
-    return -ENOSYS;
+    return -EOPNOTSUPP;
 }
=20
 static inline int trace_will_trace_event(uint32_t event)
--=20
2.43.0

