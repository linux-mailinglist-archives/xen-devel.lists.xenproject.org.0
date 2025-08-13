Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AC9B252BE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 20:05:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080161.1440730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umFpa-0007FG-96; Wed, 13 Aug 2025 18:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080161.1440730; Wed, 13 Aug 2025 18:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umFpa-0007Cg-5R; Wed, 13 Aug 2025 18:04:10 +0000
Received: by outflank-mailman (input) for mailman id 1080161;
 Wed, 13 Aug 2025 18:04:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOuC=2Z=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1umFpY-0007CZ-7X
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 18:04:08 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df06c095-786f-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 20:03:52 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB9120.eurprd03.prod.outlook.com (2603:10a6:20b:5b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 18:03:50 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 18:03:50 +0000
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
X-Inumbo-ID: df06c095-786f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWHRJ6hoQ7vi4El0xRnL5/HnO3XrHQ0sl+6xbp/3c8AbD7y6C8j2H1h1Q222tsRbbBBisRq7Si1DGUIpHQYDYPPS2E8tbLOY4Xy0LJH0eWCzQmo2P5sIDVW0uuE15fWKrQ6DdT1SjGLq/v/XZc3wFzQX8jv4OJUO0ptYTnuyliBkxP9GCwUtobq4kulexwoAxf6gdifj7oyTSyak/GHrQNIAjGNF5E6V/gf5AVgnqZxZOAPeBB5t2OeZFeUa3Knx+x9tYdyWGDganOP6+Ev3dF8SIF7CcHUIusr7LkGmdwIMecN+UGSS/mR7nGylIrvIM4d7VDrpVbiSqJ0tmbep6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WM5oMPjmZLOci1813SLcbAPd0JjSY3Fo1ZPlrMiOo0=;
 b=s71NOhFcA3v5zJ1CRy2UvC6uz6cvK6k81FOXB6VdHWhuBvW4XLN/EQPFBF1YBJZjAz/3ZetDsFStlbN+zLlJYoemd9rlumEBG3Z5aZvGa1UMMJi2I0JnOApxvHCqIbmZRRMIeGM0PaZvpGEkEJDxazMU0iko5CnpT2d9dGXLVrYhXo4lSbptwcSMwon0sD9iRkuDvDtu7CnR9IyUzT/dE/VwxOyAQLsEKhGAxiCWevGh3hF6Z+F99RQJMHTqSWzfIJJ0W1gYruOrAMUleIMHNtnPsT7YAKu15on7d8nIjmHE7E0MbVUy4gqIM9MppedoJpFeFHe3fdkllFeWNOL4vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WM5oMPjmZLOci1813SLcbAPd0JjSY3Fo1ZPlrMiOo0=;
 b=EVGCUX/Ev/q+P0VpPj4d6aMtNGubJ+0ahZPZu7fFn+qnHPyDrhC6ENCTpuzdFUO5hMqvFo8OjGSkK8rdNpO+qOwlbi2QkotMT+3eYQ/KaQdCvAhWs99U/KRAtpZk1ekgGHpIhP4UXkatbJuVSxQBofUpobnq5rT+yrbvqEO67BiHkXCwwhtSmTfzG2G1FFoSumzCQn4PkH8ALVbc4j5rh41EqoNgaDY/nUecFuCn4Kb8vRlPQecpRs/fdcv9CJfhlzLlU6GknY1lPSzH07l/w1FaFrRTWlT3iHMZJUHhu6e8CSB2tjOmGDpzVz3tYMWlvdAquqJTIb3nyxtOAWrWSQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] misra: address Rule 11.1 violation in cmpxchgptr()
Thread-Topic: [PATCH] misra: address Rule 11.1 violation in cmpxchgptr()
Thread-Index: AQHcDHyf3UfD7hhtRUO3Pk5yKmZkVw==
Date: Wed, 13 Aug 2025 18:03:50 +0000
Message-ID:
 <64882f9ee8e470a2633b8b4d0b5c1cd9d1c0a8c7.1755107902.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB9120:EE_
x-ms-office365-filtering-correlation-id: cc99c9d8-1b3b-4005-cbf3-08ddda93c1d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NGm4ShPUWTIICSgj0yG2O742gsMtUGzBeYtq6XIAo2GZj9pZDanVxvovNT?=
 =?iso-8859-1?Q?3cV+nFlZFA/3HRT19evbew4kNsOqOT6WOYLnyAoyE6rFIMQsSWv5raWnhP?=
 =?iso-8859-1?Q?RKIrjkoJl7KeXK2u9P1xS9zRYZ85m75P89ccFJSvxou5uT1n6H3S6SoVHR?=
 =?iso-8859-1?Q?QQN+livhukLQj/T5lv08+Jkl0EfHOU4Cz0LkLCUj8nsI/BQnpU7xSp/f5v?=
 =?iso-8859-1?Q?NMKFP8QVhH0IpC1EiCPc7NJBOrerxJ3EBOwGSCIvxz43+VsJydvBm6L8oO?=
 =?iso-8859-1?Q?DsSDbQGkXUdvoB5opYpH2fV+TEFyCevCDB/BVCsyxa53acmH5SgqXzh3wE?=
 =?iso-8859-1?Q?Vm8Uoh0LzLHyi7j62lCpwyPnEbIUtfaSyMnfHCEDafGKWbIkXniGxQ3XzP?=
 =?iso-8859-1?Q?mN3ZOq0baQ8vnOwZFGbUQVQhu3nH8p9olPLdk/IeMLOsD4XHnuQe7Zobcm?=
 =?iso-8859-1?Q?3cxHltyk/C/VgJogKQLtVsEmb+NzOckE927rZXp05NPtcUo+FWW0G0lZC6?=
 =?iso-8859-1?Q?b8bMRIzg/LbzlgM04KOJsVHuOQ/qL88JueII6+MDAZVY0Vk7+4MSJwlEdF?=
 =?iso-8859-1?Q?SYh+BUMvIZ4TRzWyqoGtHInDsEGAnuIehu6GbCyEMRBBC6kpW1xqo/aIKK?=
 =?iso-8859-1?Q?+yzZ5mrL3QFaQDtVThrVtWNjSOcmqEZWCXjLv26kplaUWwblv0QjTRKISN?=
 =?iso-8859-1?Q?B7T3EWivcgLcTm5w3A2yoZUHkgZ8OS91GELNw+o0h7Zil514unWp3J+ENm?=
 =?iso-8859-1?Q?FpI+wikmGh0uj4dAXAakM+DZcTU2zPWKXrL3bXJmm42kgWAqqQ8qSosDRD?=
 =?iso-8859-1?Q?X9iuDYW9x4m+jJRm4Y4o+ltjg7GGAIKWur6LXpDqUaHBTctxsN5rk795XU?=
 =?iso-8859-1?Q?qp5AyzlQc9hvbGk9r8bYG013pgk6kyhhBYdd1WKbszzSAi4Gp1vQvVEu8P?=
 =?iso-8859-1?Q?gD/TrxLy7XSKz5OeovCbzL+S4ELSEAA2VZyEmkMHpl+JAeT6xopA0TNueM?=
 =?iso-8859-1?Q?Jne5TtzAh//FR0swoe6CWYRqgH5IBgbtLOgxkxnY5qVn4ZpsbUsQjT8/2t?=
 =?iso-8859-1?Q?RcBy/cv51uvP/2dIxc3uBAGqNdFiF8VpjzAdVYhmP4f3aBBBuYEC8L+4jA?=
 =?iso-8859-1?Q?JcuKoFP+I6hsElS6gzAomuaP6jVkqqW69D4Ii5JtO9+fH9rLZ5LVpGIuNa?=
 =?iso-8859-1?Q?tpeXmq4rqcREtOkc+Mi42VHPgM2xIRSx0Rx6CwfuMkuJNauMST3g7wAsEp?=
 =?iso-8859-1?Q?33ZEsjyADNwwzx2EkRN4kJZYPSrFZ+D3h0z6fETab5cnh/YuwzlkKzCNMo?=
 =?iso-8859-1?Q?esLENBLNf+3tMAvxdBwRNfl6HFLVoRhTpuyLdsxxGsNSc32GDivN7sFvCJ?=
 =?iso-8859-1?Q?CSpFSZE4G3E3GGAnid1t7ZDlsQ+JP4tqfDlKyKK8fkJTq5fP2AcWLh5NPz?=
 =?iso-8859-1?Q?YVUvSaRWEInDvn3CBX5UOPBQyOUJGa/uEkxym/qEyKvpZoqPJ+zvZ7fcls?=
 =?iso-8859-1?Q?3iTtWClS5QJ/Laabh4oLtR251n34Qhkg6SnsLVdKbjb0PEN5n3uH9pwjkl?=
 =?iso-8859-1?Q?rWBTuJM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?R4dycWxtM7CbBE5mtH00gdZdBfmRXwWPli42HRLdfAfZhyeO7L+9gcvwDI?=
 =?iso-8859-1?Q?BDXIGM1EeZ+rB6EUBUze8quJ1VuPDtoyz5jwNDdJzRbuyifBUnJaeRSqDW?=
 =?iso-8859-1?Q?B7HGdUglE227cG3PQbhL5Kt6l5KYpr/6xu2GKRLJGc2q3uS7UcI7Lltnfg?=
 =?iso-8859-1?Q?GN2rHxkB5EuBDksyM2k4WOB92wNOE3uhr8eZi0yU/Gy7FCn0O55KvymZfy?=
 =?iso-8859-1?Q?Kkc9nD5TYL2ORriq/ozahJepSBddDgdwOAiL3p/Q3/tXEzl9xJOkSNrjRc?=
 =?iso-8859-1?Q?feioHDerNkAm5Xvr7FcoEIf6wWxpT1ugluqiWg6vuObd1JT+NIBCOZ3fhW?=
 =?iso-8859-1?Q?dmz7nO2+LLJ9+OF7+Zn+TErtWwLwdSEwluKRhqSiDjUeQgTYgcSHQTkp53?=
 =?iso-8859-1?Q?llg9mmxz/NruMzpmeplsDXq40k9OzQtOperV2SibIYKtiQFJY3bYnsi255?=
 =?iso-8859-1?Q?X3KVlddvGfYI4Uh0IuPhS1TV968YopMkfWAiaLWDoy8q8WqFUlaDI4tie1?=
 =?iso-8859-1?Q?uVx6UD68iZJjxF/wpjdL5h3HeW1A7ugPOPw/Mr5Skk5yw8x2lo6dUCD6Qf?=
 =?iso-8859-1?Q?xSkHhgRXlvVGFBH4/hf48SLT65S3Bgh/ASOQq47PkAXJBwddjxgkc56eu1?=
 =?iso-8859-1?Q?8/IiR165a0cDvRWRDDh1ttjiQzrS+Sd746fdRFrky6UGJ5c7xfGUOUCdyM?=
 =?iso-8859-1?Q?VTcLW8VUrvbUsesbotPW91T7D8aVyRlj4Y/epK2ZKC7UyHhPmz3m90Gqkd?=
 =?iso-8859-1?Q?QsgY8Haetv7PdmoWAO4bb2kUq3HwnOr+OOgA1PI9q2adxZVZvgxOz90oA8?=
 =?iso-8859-1?Q?dFuCLYCHGBDghjKiUmeo5F/0Q1KexSg/Juzm4m+ds8lHflK7qu7KPhGDzU?=
 =?iso-8859-1?Q?FOYJUKHVGdgK5qoyhhnmOrJX5Mqwn2VoUuQr0w29ADLmrfW8enkQQca9qX?=
 =?iso-8859-1?Q?xKlXrpogugxpd4EJ5mRCT2Fy8lA5KLHp9UlDcu11tvpaFgllBx4efQ5wQT?=
 =?iso-8859-1?Q?54sWcXBKqJEFA/IuOLUJ9zVLuye0PApkqRFkWWg6IYqw/aN8+N87LNe15v?=
 =?iso-8859-1?Q?00gcNfwbewuK2e3ThfyblG4+jOBDS/Z0eb6Axp+vqOfwsZaUIhx519V939?=
 =?iso-8859-1?Q?F7HQP9IzJS1cSbMnDUh3jdOUGWvoIqfEpq9N1PM4kFG/d8DCqQhpJ1hMKw?=
 =?iso-8859-1?Q?KGWxBxmGWSSpjtDolAPm6x7ceyR0KUIFemaCtyjyWxcZxCCx6dZSG5RVQK?=
 =?iso-8859-1?Q?OPiolHqX4buuXhslIajgze6VcXHDVUw+HvW9un4A70gYWSzxrS3TxLrZW4?=
 =?iso-8859-1?Q?uzLJlywwhww3pzSZSMrACAbwBQ/d4nZ8kQZ2yZoc27FaHw5AYiMLn1yNxa?=
 =?iso-8859-1?Q?qqKKYqWRzBBzArbpiRXy1LAu4+Mn0BnApXzOLXu76+3tugAqD2TrtyoXPv?=
 =?iso-8859-1?Q?jkAVNrsSi7W14M/v35xmLV9sspPaCeH6SL9bsMxWgjiTIu95yp8nNYfCo0?=
 =?iso-8859-1?Q?Vm4tn98p3fABF1WEwdo9H6SMZrLERdRR53oAtM+N7PFZ2HSu15WDZBQbXv?=
 =?iso-8859-1?Q?comhVqEkV0uQCnqK8wyvd8ag6ino3YPRuFYFsO18Z3N92snxSgfwnKyja8?=
 =?iso-8859-1?Q?rDf+s+UnDQFN2uwnRFj4eU/x+cRxqAyZ2OzzYXh+cIYO0pW90TR27fyw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc99c9d8-1b3b-4005-cbf3-08ddda93c1d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 18:03:50.3422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GvUTa9jQ/EwFVrDgp0uvcxR14MeNIMzdIxUupDVG3WN7URrtTtQmVP5+xy9giWvFKdzke4ffxxjDwAbtBMSTnhbWAiQmoG7zunitrAZLbqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9120

Misra Rule 11.1 states: "Conversions shall not be performed between a
pointer to a function and any other type."

The violation occurs in the macro:
    __typeof__(**(ptr)) *const o_ =3D (o);                                \
    __typeof__(**(ptr)) *n_ =3D (n);                                      \
    ((__typeof__(*(ptr)))__cmpxchg(ptr, (unsigned long)o_,              \
                                   (unsigned long)n_, sizeof(*(ptr)))); \
})
when it is used for handling function pointers of type:
typedef void (*)(struct vcpu *, unsigned int).
The issue happens because the '__cmpxchg()' function returns an 'unsigned
long', which is then converted back into a function pointer, causing a
violation of Rule 11.1. In this particular usage, the return value of the
macro 'cmpxchgptr()' is not required. To address the violation, the macro
has been replaced to discard the return value of '__cmpxchg()', preventing
the conversion.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Probably separate macro is too much for this single case.

And the following will be enought:
__cmpxchg(&xen_consumers[i], (unsigned long)NULL, (unsigned long)fn, sizeof=
(*(&xen_consumers[i])));
---
 xen/common/event_channel.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 67700b050a..2094338b28 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -93,6 +93,17 @@ static void cf_check default_xen_notification_fn(
         vcpu_wake(v);
 }
=20
+/*
+ * A slightly more updated variant of cmpxchgptr() where old value
+ * is not returned.
+ */
+#define cmpxchgptr_noret(ptr, o, n) ({                  \
+    __typeof__(**(ptr)) *const o_ =3D (o);                \
+    __typeof__(**(ptr)) *n_ =3D (n);                      \
+    (void)__cmpxchg(ptr, (unsigned long)o_,             \
+                    (unsigned long)n_, sizeof(*(ptr))); \
+})
+
 /*
  * Given a notification function, return the value to stash in
  * the evtchn->xen_consumer field.
@@ -106,9 +117,9 @@ static uint8_t get_xen_consumer(xen_event_channel_notif=
ication_t fn)
=20
     for ( i =3D 0; i < ARRAY_SIZE(xen_consumers); i++ )
     {
-        /* Use cmpxchgptr() in lieu of a global lock. */
+        /* Use cmpxchgptr_noret() in lieu of a global lock. */
         if ( xen_consumers[i] =3D=3D NULL )
-            cmpxchgptr(&xen_consumers[i], NULL, fn);
+            cmpxchgptr_noret(&xen_consumers[i], NULL, fn);
         if ( xen_consumers[i] =3D=3D fn )
             break;
     }
--=20
2.43.0

