Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91416A06F50
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 08:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867811.1279357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVnDm-00051t-CX; Thu, 09 Jan 2025 07:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867811.1279357; Thu, 09 Jan 2025 07:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVnDm-0004ym-9H; Thu, 09 Jan 2025 07:44:50 +0000
Received: by outflank-mailman (input) for mailman id 867811;
 Thu, 09 Jan 2025 07:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+x7=UB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tVnDj-0004yg-Vh
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 07:44:48 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98a7bffd-ce5d-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 08:44:46 +0100 (CET)
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB9PR08MB6490.eurprd08.prod.outlook.com (2603:10a6:10:25a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 07:44:43 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 07:44:43 +0000
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
X-Inumbo-ID: 98a7bffd-ce5d-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8HbgAQunI7+T5mXw1NuM/UqMsWnosqoS5OtL4MNd7Kh8susnS5VfI3sRxRdHjoAgrEYWKqC+qqgDX18yBTmIG54odRTT+vEAdalwY4SmXmPBLf87VtOAcLmpiLkJLzD0KkLuZ/g6z8/omGopocGzZ3WzTShHG2VGDyFcubRrXwk3ci1ukh1VEhdQPTs1UQqHs0JlOI94n0T6AbBytIM3UkhdOXqBM0dlYZUiiWRuMIuZ5adEeVT0qpvn2tceX81Rvp3iR1c4c7eQWP+0q9H6GqR0iZBLXQrtUtWlFFQqCE/1c58smGlTlR7fMLZUW6skWMEZOZ3YyH4YG4blp68SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fH+VKwlzw0iKMVEqVDynbAlT+7oOjEXG0z+zF6p+wA0=;
 b=ynJMh9EYvpNyQ5OMdM8CpXPdryvRc5n7a75UZdXnVKrhsxh8BuYPBAvIF0DCKBwX3YaZBpbVts45xvV1W/TyiAMZ868iC1wY0W7CaHuK/xRQwG6CdrCA20T4c9RpmY+4tvjFtNz3Gnf+ODk64MHJj14fKMX8NOqC2sqOSxM94XQz2iBwpOkF5LzAoqpsRwlbfUMDqcLnR9unaYeVkZx+9lx7jm3CcUn3nWfqmfoJzChZQxTLgJ+ovArIAwMwcHvZ+v8ljennC2mk73LvSaomEGDqkYr9mMwf5mPt3HbAnamdMSM2/dTSUWIqWuvNHkAZqR9nLvw89tPnY/PxisKH9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fH+VKwlzw0iKMVEqVDynbAlT+7oOjEXG0z+zF6p+wA0=;
 b=SYFpw6vCPMXvb+jhq5MJUislitP2mHt3auIAG6d0gen6g9yqEXXbgMGNH6B90vS0mU7LMaZBosaJTlVrijKZnzsgUMLMGKBiOE9rDtJE44tV5Zs5aB6qohL6TfVFjU4UEiO7k/ZXaptRsKe0kbAxfeRXQi6vK2ZqpCmwBwM1Wmc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2] xen/arm: ffa: fix build with clang
Thread-Topic: [PATCH v2] xen/arm: ffa: fix build with clang
Thread-Index: AQHbYewebJ/QvtJc8k6NoHOEpj2W67MOEM2A
Date: Thu, 9 Jan 2025 07:44:43 +0000
Message-ID: <3340E928-64F9-4F31-BD6C-9ECA75A1E846@arm.com>
References: <20250108164054.338799-1-stewart.hildebrand@amd.com>
In-Reply-To: <20250108164054.338799-1-stewart.hildebrand@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR08MB6588:EE_|DB9PR08MB6490:EE_
x-ms-office365-filtering-correlation-id: 7cf81317-40a2-41d6-df21-08dd30817b73
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VTM28Nq75IpTbATTjBhMk4GRVUkzG5Vioti+blDoe60qebWFF0odUzu8sKnT?=
 =?us-ascii?Q?Gd0/+rtWoMXGckEEM1r6TwndpGkR3u7wERdBnRXoNNGdHsS1QW6uooVH39aY?=
 =?us-ascii?Q?NkTpA5cxAzzybBTCnKPJ3cNkub0utEXOVhZPjY+bX9jzI9vMt/4XNpQuxjVW?=
 =?us-ascii?Q?aSrI4DKvWOpzSzwkAPOoL2UzKOoYgsJ8ORZqJYIbcTn51fgGhAUdyCDAnLta?=
 =?us-ascii?Q?3eH9WRIxBkHkTX2n+XqqsAYDRcKpS11rLMnsk3FAfUubqHYMYrOHEXCmzUSh?=
 =?us-ascii?Q?soOnQmCOBU1RRLpw7pB69db/3IC48op+i++wrm09h8gtclWNyrt0yvhPICG/?=
 =?us-ascii?Q?QN9Yj4cY9GU/BQS/GFs9grRAwDw0AbkKRVU1uWleel0fEMAdS9ATxxVLUKWM?=
 =?us-ascii?Q?aJtvhYBrXy4vJHgPEcpHDfia290vKTUcuEaSdSivF2+p23vP7zt6iHCZ5kdY?=
 =?us-ascii?Q?U+mt/Zr0QyEjHj3Hj9DZt8yxa9Ej4C1FQBsQmD5lfUJIeFEufGrp/rWRQ1lm?=
 =?us-ascii?Q?yjlBLVBL6ff0Bj3t/e/obPy5KoBdFbE3mLEhBmG6aekivMNEmhtlVjPxzUe+?=
 =?us-ascii?Q?CSkOtNz44ofoREvdq3u/5+4/kaS25/0JY8qbfYkevNGQuUIbf/OCy55hFd8e?=
 =?us-ascii?Q?3ByX8p4eo8pKaCNVKV1gM9cLlbxeLPlEkTSmHzxdbZ5af2ViOgn3FCcc2W/N?=
 =?us-ascii?Q?as1aVS8eNfiKW2te2yGPBy9T48NRAzTWdqoyTZi4pAqffsvE9/bm+UZT37S3?=
 =?us-ascii?Q?gX3+W+4hVXTdBBAnYb1SRXavC7qzAewb/FXOr2Zd3XqPScwVKawUMGeheuo6?=
 =?us-ascii?Q?onP0TlFeKYnq5FOO7tXWTQydRM+qt+wcznP3Y75xDwoaJ3TuPM4ePs6YHmOQ?=
 =?us-ascii?Q?tGWG1wvVRo/HPM4dQOftfv9I1L3U6nOv0aQWhiPgtkm3PmO5a0cXTopoKP4I?=
 =?us-ascii?Q?4EVK2yCXtcMHINu1hzcEW16yJnkOrZHD8x7a3UDuoGspRBQU8ic9ElVPSqGp?=
 =?us-ascii?Q?MDl8n/g9I5A9Ogo+wGl2N26liRlLbDr76XXqnpH/mNMRLlT8Y7A1/T+zGpi7?=
 =?us-ascii?Q?GBNY5DCqpfSHeW/l1nc/PTOXwyj+wcFqItCFAkixYgM2Lhd7rgDBRGQ02wpI?=
 =?us-ascii?Q?76c+3TM2nPopKv+uoco9T5dqNfhb9tBLt57jFJazu5nhJ3K8FNvC5/szyQUk?=
 =?us-ascii?Q?wJepAavPrbTlw2D8euK8A0QBwFnKmx3iBbaybqxsW5PbqLMi0sPSqDlbwIAC?=
 =?us-ascii?Q?K0oWCeMlXhrjYV3y2y0zZQNvy/E47eoxXrAM4zmURPoUYl9n0Gwlzj4Nz8oF?=
 =?us-ascii?Q?Rni+EkOKI+YenKhqoplw7msWCm/ZB0s2JbFVjMUw8EgGDsWsI5SkoVpjYPIM?=
 =?us-ascii?Q?ptyUFaZaJ+07PKng6V0UsnGSBf5zlMd3W3SCTEu/vPbDSlstcaH+SIogz+GD?=
 =?us-ascii?Q?tah2zbKAlF0+6X3qruDvScBERc0rpvFG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BHXy3MTaHLCwW4s025IHdbvqPJ2knbrsd6qQHGP90xbF9zYKqQOjMjymQET0?=
 =?us-ascii?Q?GYaHcikY3y8JonREUlNSsfuzFMuUiy31q9tQJ+s0DL1F/qJ4AU5ON8t2Qq9s?=
 =?us-ascii?Q?bmstMik9u3VOZ3mmpYy7LxUBi0jVndYYR6JMYDOdC0h2TpQGyumoliWy+p19?=
 =?us-ascii?Q?0ARa40zYQ4/eEgvVe8Yx52Sfuacho1/5VYvd/QJaweV4FAMAcI/h4zKfut/T?=
 =?us-ascii?Q?g1zlA2eaWRgmmrHw990A6YcHi/HEcFXrRUp8VIA0g0SG9zSwK8kR6C0CWuQE?=
 =?us-ascii?Q?nbBTnahTGxaPpJmwfGiNzgYzY/SXOShevGMM1gDdgDuHzqOh2hMhZtxktpTq?=
 =?us-ascii?Q?JWrFH+/BJEBFAg74I8ZGwXZ3DpYdpIjhDBRHjlsTLaO/TsCaJeFPhP33xzR4?=
 =?us-ascii?Q?CKte3OLKjAagnIBoHW71+aMgIyHkIGAxe6cnLTudm1dMSM2eeUNL+Zn6eJjW?=
 =?us-ascii?Q?gnsCZKw3vkWc3seK9SC0hCHE71ZRs1csjcf2r5WOVh3Ir3ei37j7GMvP0vr7?=
 =?us-ascii?Q?0vPPUXJgzTMU5cE97UgVLiCnZNwVspcADZfL34Mcb3+6KPKkLGWTyk/aX0ht?=
 =?us-ascii?Q?JB43oQhPeLs/IO8rcS2ChtqhAv5dKyAHmyDLu2cCrADojicjLLut79GmC3ZI?=
 =?us-ascii?Q?13znDNJ4+ygNKIsum1sKDad71XE9u3rn4wbRYmS85ofPEVM4S82fnMQhPthG?=
 =?us-ascii?Q?4lsBB7HSPQ6vgu+veYLHWW1odk0aaQ3DjqEaNAmBArwBlcO1ETY6LkVetxrE?=
 =?us-ascii?Q?uR5LvhmtuRv4m0hplJmPelvFBMb9gFBN70nucJfpiuL5absffLStxZ07Yz7G?=
 =?us-ascii?Q?eKJmdRwbN6ckvmVLDhbKbi6gPwGI5imGEEbW8VGoM0ybanvDZM1GJpnDy9wU?=
 =?us-ascii?Q?rGuSemsy9MpuQet5xuFQI3PVUFIVkL2II8PAbYNBP/b2SSWE5tEdmbrOc7Qg?=
 =?us-ascii?Q?/ynXCxptotSA5i5MO9TyHa/q5Rbw1omEKG8DY907LsN5OqBPZt5sS6el79xH?=
 =?us-ascii?Q?Mx7Yvd/R8DboHhq/lEnFsx+h0d9XGDWd8FU3wRziNh/+ZZtZW6jP6sYXC8jJ?=
 =?us-ascii?Q?QiH5YsR60TPKMbPbgRN+4A4JMZlreB0BmsRablUmS3OW0SWVeXFilyclJ47e?=
 =?us-ascii?Q?GXi3JmqhGzEevz/P0wexinrKSzPAs1mB0pOVTLYEfJEkminZd1QyuaxeF8sb?=
 =?us-ascii?Q?IBL8iJHCm/l0wy8LPAAqaETf4kBgsBPQKKBKJEVmwXywzmV7JNHKuQaF/Nmz?=
 =?us-ascii?Q?JAtWIsDmrSggCiGNq5nE3MrMO61uIMrvgmsNaAz/tDP51CgkfM5Hs577ehiF?=
 =?us-ascii?Q?EwDpppJNroS/ozzEhZRW74u9xgGNW6qKfcULULQasDqsWAuEs+/ZRPIR6fT0?=
 =?us-ascii?Q?DYmKuQnwAh7b2R9raN+oPPz/PzWZCKZ/uF6lGsBwteesydNyOB3YSmrZApzR?=
 =?us-ascii?Q?XQUilirFJqMka20YzlvVASwL4987nosI4nSQgVKtEhQZwj2ixSyk5XRc2Jre?=
 =?us-ascii?Q?Egsn3LYN/YzKvMnRtZPbwz8MYAsVvyWgpjHnQmBImlEeKaWXbi7iSQWSRlB2?=
 =?us-ascii?Q?NjYb++RpRl/3j/FfLDoIDBX+pRidbpwVMWFzWgnopbrnUZLszP+kyTz4aGnD?=
 =?us-ascii?Q?a76jh4j9rNl5EFnoSEHTQy+2vh+/nLkAM5Hr/bM6i2QafNgafw5psbfEbDb5?=
 =?us-ascii?Q?Qai+LQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D40460A5477EB248BB0A84D2A65E7D6F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf81317-40a2-41d6-df21-08dd30817b73
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 07:44:43.6513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UtxxXnP+iCMQUdIqa85nOO24iPfeMjvTMYZM1pKnP6vptwQ8R2OpF8qLKbfVmnjxRk2jicCA8yYLOh+PzIm8jNcbu62hezUfqRD2/nTnhZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6490

Hi Stewart,

> On 8 Jan 2025, at 17:40, Stewart Hildebrand <Stewart.Hildebrand@amd.com> =
wrote:
>=20
> Clang 16 reports:
>=20
> In file included from arch/arm/tee/ffa.c:72:
> arch/arm/tee/ffa_private.h:329:17: error: 'used' attribute ignored on a n=
on-definition declaration [-Werror,-Wignored-attributes]
> extern uint32_t __ro_after_init ffa_fw_version;
>                ^
>=20
> The variable ffa_fw_version is only used in ffa.c. Remove the
> declaration in the header and make the definition in ffa.c static.
>=20
> Fixes: 2f9f240a5e87 ("xen/arm: ffa: Fine granular call support")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v1->v2:
> * remove declaration and make definition static
> ---
> xen/arch/arm/tee/ffa.c         | 2 +-
> xen/arch/arm/tee/ffa_private.h | 1 -
> 2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 87775ed88ffd..3bbdd7168a6b 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -72,7 +72,7 @@
> #include "ffa_private.h"
>=20
> /* Negotiated FF-A version to use with the SPMC, 0 if not there or suppor=
ted */
> -uint32_t __ro_after_init ffa_fw_version;
> +static uint32_t __ro_after_init ffa_fw_version;
>=20
> /* Features supported by the SPMC or secure world when present */
> DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index d441c0ca5598..c4cd65538908 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -326,7 +326,6 @@ extern void *ffa_rx;
> extern void *ffa_tx;
> extern spinlock_t ffa_rx_buffer_lock;
> extern spinlock_t ffa_tx_buffer_lock;
> -extern uint32_t __ro_after_init ffa_fw_version;
> extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>=20
> bool ffa_shm_domain_destroy(struct domain *d);
>=20
> base-commit: 70f5a875becc9444a959830b10a361982c31a366
> --=20
> 2.47.1
>=20


