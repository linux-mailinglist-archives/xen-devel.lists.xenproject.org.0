Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC525B2D4B4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 09:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087205.1445314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uod59-0002pG-MA; Wed, 20 Aug 2025 07:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087205.1445314; Wed, 20 Aug 2025 07:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uod59-0002n6-Ik; Wed, 20 Aug 2025 07:18:03 +0000
Received: by outflank-mailman (input) for mailman id 1087205;
 Wed, 20 Aug 2025 07:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiHc=3A=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uod58-0002n0-8U
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 07:18:02 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd38498c-7d95-11f0-b898-0df219b8e170;
 Wed, 20 Aug 2025 09:17:59 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PAVPR03MB9116.eurprd03.prod.outlook.com (2603:10a6:102:32f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 07:17:55 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 07:17:55 +0000
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
X-Inumbo-ID: cd38498c-7d95-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muZ5Y+QChTbA+4QEil18v6QohFzVCd5TifPQXC8lgoK2jiWNzH+IYC/HqYw7IdY/CzejFUCuV5jdTNWzV3MMk5ct00JVPBS3dgNQrS4ui/gADtkw2uzG9LaN6TcnDEQk7VWvGO1XBXfLypZzPFNoqNqOjTyrs5Lwctap30vl4Gr5JJ1/dHUuOzOYG54inAryJYzRpBvANA1MjPsYfPV4+uwzzSdv68whZtUEfC0QRQybNCgKENV9fplPJyf8Msh6G/5BVsMwgrnxft5E7GQGtDne88GWSShl00BDGoW+YATIZHzrqBowlK5aO2yTscBEkCXBKANxHC4FR4oa67y36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nk17zjqPVgk0nvhstfnHnzLMV54YaJzzHLf9YY3z7Y=;
 b=Mq4UoAoySplA0zMxcJSinR4YNtpb6FG/6S2pTxpgtOXUci44zX2E/f33OGGEKXMPQNaHKOrVIVtG7EkRtWwQo1C5q9mYHowUpsS0ZU3Cifds5tyMZbVxfZOlt9PTGmtXodEL4pRcWBXpa9enoHwyNQKVrKQUOXgbIecALURmuiTf5HWorFSVUyTvy/T6985BwnFaVPuaMdIVF47IkPiFZ4839Rvly6eRkzvTsbBvsNVTJ+Cu73NXQ/PUwUcAja7EMaCjsDmteafHs0OZVqVXpH79oIng3d/7A2HeHv8sKVtjTZzcgdF1K1+sbRcFE/gQvD+ABO9FiyayLucMhxVYmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nk17zjqPVgk0nvhstfnHnzLMV54YaJzzHLf9YY3z7Y=;
 b=agyKz8HpmHtDBOMHG7VlHZaROWI6nDqQCFnXvBUE0AtdzTEGcelv1aLGdlYsC9JH+d9s60ry3JvkVdSWtp1d7Gkgu4ELqU1P4MY3mh2BAdSXfjOnuHjj+cbgPfX3HSwjvMMO7eFFyNo8BwKqWG7Z+RboG/4WtUoxAoBuJVWOjkNB0LF5mhV3nXUBcsku4iHuITG5xp+PRrJhELYzAZMugBSQxEi7XgRnPlsQazZQK53/KCBMOTa/LcM2IpnG2wtDdTOdJlT0YBUujJFrErULyFks/xuyMpdzPdDT5hmAsXSPGMe/U9Ul4iJPMQKIfA6VlN+3k+UYdlTowkXAj0CH3g==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH] misra: add deviation for MISRA C Rule 11.3
Thread-Topic: [PATCH] misra: add deviation for MISRA C Rule 11.3
Thread-Index: AQHcEaKMMDydbZiTjE+UNGKddouDNQ==
Date: Wed, 20 Aug 2025 07:17:54 +0000
Message-ID:
 <d6a8682c98880d66ea99f882520b3defda0e3fe0.1755672275.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PAVPR03MB9116:EE_
x-ms-office365-filtering-correlation-id: ed04c68c-4044-4f3c-3cfd-08dddfb9aecf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xWK6JCdM1u5eadzYXOcYh6BLb076jD+tZpFi6pIbyMHF3zlAaxNNkbdjWO?=
 =?iso-8859-1?Q?6FS6wn8RzVirK7XMtKKJWyikSVDkJ2UD5SjQ4poFTh4rRJSE08lCshqxsG?=
 =?iso-8859-1?Q?UqOMO5WDdRqQv0eQdjIwl1+9aGvBKLYzDrMEJyANMgjDjU7LJ424nBRoAW?=
 =?iso-8859-1?Q?Ou6R5WDAefjgSnjk0BCetvJa6RMF9evk/ShKhkCVg5m8nBq6rgh83HwERo?=
 =?iso-8859-1?Q?VLXw+D5FH0gU59vwLD+Bej94q8iUOQ9+3XWHEw8Ei2oTgRfeN4glwDEzI0?=
 =?iso-8859-1?Q?TZouvmZKQzIGS1XRUPIS5gaUyKNFKi6/G8CRAHrXcR++eDshISxvi0nSRo?=
 =?iso-8859-1?Q?0ie5JgaZyOeB0NlFg3XYtY0Wnoph5vQWh+Blic2WZatsxYnDvKP7CEX66J?=
 =?iso-8859-1?Q?O/uVhtRXR8pKBUPAJ9TwiUeFjxEhepLce9d8gPUKwaJhILJocET0u1oJAv?=
 =?iso-8859-1?Q?qp/k2PO7zj63kBr1AhOa7/Z8SKig7Y2RcibRHRv9bjqK7ZwdgGZUdWRztW?=
 =?iso-8859-1?Q?/rE0Pv3YaldS2/p5Z9mz2hSptfts51XuBR2b8OVeZgBvwJ96bFm3i/Lwn0?=
 =?iso-8859-1?Q?RZmj2u1LQjs4pp9cS/sI0Dqw7zj24GJ+0P3w/hNN+DLyaCKzA4M8XmIilZ?=
 =?iso-8859-1?Q?+pcwSfbtAeHhFUZ3jA2U2++E86bzG4itx3KKTWUt9TafVBLNyDf7ofSFqC?=
 =?iso-8859-1?Q?oEzMJL6c0Xj3HD526cbizw3T6PuxBP2kLYcowydsvNzQkyBOih82aWCUuw?=
 =?iso-8859-1?Q?p/9Z0vKGy+79jgt0+Iut+9b4NxBQ2MPrJrBBssWJFELM7NnhR8yI1JbA3w?=
 =?iso-8859-1?Q?iMYuXGq220mDqyU8UBBnikr6zWWuP844wA7qASXQHYOdhG1ODNRp4qyP1X?=
 =?iso-8859-1?Q?KC5y5S9x49sHP+AaTzdVbkhFfYhHUo5gcjDbtCdEaGsyAr8XSRZkaJAUVk?=
 =?iso-8859-1?Q?s3Ku1HN7maJiJ0Tpi+FXozAKbTsauIFh/UlCe2pnID7lR6GSgiJTttI60B?=
 =?iso-8859-1?Q?mHUxZIelFEJXtpQXEO0Q41I8s6YW3nEGxtKz2ck8ux5066YUrixVZtXZwj?=
 =?iso-8859-1?Q?C0NlCAVaiSVun01fmU+++f2mx5thHTT+oTrYMVI1y/cMvo7ygZ07Y6VzzH?=
 =?iso-8859-1?Q?x4zLAiEH9ZPM5GE6XE/4vKdHQVMDaDC4uANLNZRiA97KtTaLZLqbyNL01k?=
 =?iso-8859-1?Q?5Ah06554Y0JpAu/Yz/3xK8ypUVmiZO/FLhA/Vj6KnfwE8U0FYkOkpWJvqk?=
 =?iso-8859-1?Q?egY3mzWJzQfJvvew4tJ3e5Cv3rYsrxpG8blfGT2E8ORnGh68OlbhWae8Db?=
 =?iso-8859-1?Q?dMxVg5AK7q60R+1fHxafZ3eDHskQwzOSy/sBR/6Hre8KgOwxHn8gauYLpQ?=
 =?iso-8859-1?Q?sZhSgjmg98AhCoxmfFEaJ3f+SvXkvKOAgHIeWk8V4bt9Ei3dgmpy5fdS+Z?=
 =?iso-8859-1?Q?mrRp4XO+EKvvN1hr5/YIhBmpOwiBc6ZDSZ3mELpPQPPobyyQWKfobtu3tD?=
 =?iso-8859-1?Q?g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?i1obyFk5ECGlOHqQ87hdJ5RGF6YB7FU7fQWRs/yQASpMdbvLhk+8URU2JB?=
 =?iso-8859-1?Q?Kz1Gcz4fA4RDW9IsYwS52SQGFR+TWFtnm5drDGoHPfwXYismPBfr1wWE3q?=
 =?iso-8859-1?Q?50JS6OEcRDJwaWkwEg5zoHpbqQU1oTeCvH89eJ9gS8/NgRXEgyelf+39si?=
 =?iso-8859-1?Q?zNHl1T6nwdWq/0oVXJ4e30blRYYTtqvszybW5gPD7zYGwJw3hYxsQ7W2e2?=
 =?iso-8859-1?Q?vimJEvQvRm57+G3KNDcXPwIfY3SV20tO+z/bt1Vn7Svcmw6Nqi+bVuU9Vf?=
 =?iso-8859-1?Q?hpmZdnc1LOpakbl4+xtm+jDkLNbvf+fs21cyr9ggRMM3ohqt/uR2Zhu7fm?=
 =?iso-8859-1?Q?nfo4r6nVzlt7OhqCLrdvypvMt5GQvCXzHOdWR6eCyXGG4j0ZtPvkD549Sc?=
 =?iso-8859-1?Q?JeXYc8no1ZGgdDEAJT4bteTZuADzemYnQeLUA5kS+ALdumhQ08qgLqu5iO?=
 =?iso-8859-1?Q?dn04andqEv+D2rvHd+N73xvFMAji+eqB01rfXEg/YldgkQBiC8LmNTAb6k?=
 =?iso-8859-1?Q?dJjLK2Npx9Z/dGgNNCF4qDgfsf7QFQtSWr5RqZlAtWqgvhdbns9QVp28vR?=
 =?iso-8859-1?Q?7/woUtLpRuoV4zBBXUpmrAFrvMa7VAR2aWoQV73hNmN6u7LxtGZq239M/H?=
 =?iso-8859-1?Q?A4KcWwLOMCN8suwRdZXBUKqFbCiFfxesJPjFxVmLQfEKUeaqI6QBpnCj19?=
 =?iso-8859-1?Q?a8FNMlOrH7N5dECFXfzUaH1MochpqVV7C2KsVb4dBpdyuL7n0st0ssI9H5?=
 =?iso-8859-1?Q?7EhvDpjwlQnnWqLbQyx54CbEfSIW0Hoz1O1hkiXy5EC+FIkXRPTwvCMYGm?=
 =?iso-8859-1?Q?HR41AHq/F3A7vu8FbkqmjUyLspAJcp2XGKno7QIps03xnVsEumIg2YSgZh?=
 =?iso-8859-1?Q?zWhCys+5jxMkuwkZeYT59qqNtH/ojff421GFvzlzJUzqER9PmnPvvEMpoq?=
 =?iso-8859-1?Q?KRxGuhKYT0RMw+WJwZmQW3iIWsdgc+lLCffoqW5HuO4f4pCW1lnn+z1TdR?=
 =?iso-8859-1?Q?r4zQ+B9VJhBINgpR12XuIPenJwUuQVuvJEjZvqvpMHylcbttshHMIUy5VE?=
 =?iso-8859-1?Q?fw1Brao4kNXKZDf34JW9uM1WAI8H+3JWmHG0JjGPX7dAFj0wzI0AmBBVKV?=
 =?iso-8859-1?Q?eHJ67TXtWm6AnQjLJoepaaKggzpT9dAb4YPXzLpvDw4YMz/u+EIDiKlpVW?=
 =?iso-8859-1?Q?wHjiJuZFlYGYErfr7hlGC+R5j6bhls+WpQEwHjU75VtbPGzVPBe0EuqA+j?=
 =?iso-8859-1?Q?n0+lH2xU174y3yqEH0+sOKFQ4HFvttTbSaBRD9Pve/vhRwtwXBbM9vLyoI?=
 =?iso-8859-1?Q?/mkZ5bFchKrjMx8TYM4WWpziz5J+4+JZUP4ksXrjZqyWec6YMr6RLct2Ei?=
 =?iso-8859-1?Q?qz/emIUpoi9VY311huQv22rsBnx2eqkgxHjyBNio7Gdd2MWIiVCv9dgrH5?=
 =?iso-8859-1?Q?xuSDvJtnt8AMHMBOBogli+W++7Mn6d/L80sAQpUJPczL5NwKC5H8GVW0ys?=
 =?iso-8859-1?Q?9W0zCmukDDBe2uS6KaM6KGcNPLcc3h/Dz1/ro3LRJ9FEryURE9UShwGbYJ?=
 =?iso-8859-1?Q?14HwespaQqPRBgvOAAL605PauDWHPAZUJVYDiHJIpgq84v2OyjJ40K7ryU?=
 =?iso-8859-1?Q?Guxh78fzg2g18jGq1NHTqERL4YryoVzG0fUbnNISb0cDT7fndsilHmNA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed04c68c-4044-4f3c-3cfd-08dddfb9aecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 07:17:55.0601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O1EAdaK8f9sjde672Wk7cenJPKwZ765JE3Sn2Tm+Q4pkMS1h3QoE4iB81NL3oW3pUX2jrP+pCaFMGAghd1zdyrz1q91RAyffo5yEccQwXZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9116

MISRA C Rule 11.3 states: "A cast shall not be performed between a pointer
to object type and a pointer to a different object type."

Violations of this rule arise due to the 'container_of' macro, which casts
a member of a structure to its containing structure:
    container_of(ptr, type, member) ({                             \
           typeof_field(type, member) *__mptr =3D (ptr);             \
           (type *)( (char *)__mptr - offsetof(type,member) );})

The 'container_of' macro is safe because it relies on the standardized and
well-defined 'offsetof' macro to calculate the memory address of the
containing structure, while assuming proper alignment and ensuring no
undefined behavior, provided that the input pointer is valid and points to
the specified member.

Configure Eclair to suppress violation reports related to 'container_of
macro. Update 'deviations.rst' file accordingly. Add Rule 11.3 to the
monitored list.
No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1992968166
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
 automation/eclair_analysis/ECLAIR/monitored.ecl  | 1 +
 docs/misra/deviations.rst                        | 8 ++++++++
 3 files changed, 17 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..3e595e3a8c 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -403,6 +403,14 @@ because the semantics of the 'noreturn' attribute do n=
ot alter the calling conve
 }
 -doc_end
=20
+-doc_begin=3D"Convesions in the 'container_of' macro are safe because it r=
elies on
+the standardized and well-defined 'offsetof' macro to calculate the memory=
 address
+of the containing structure, while assuming proper alignment and ensuring =
no
+undefined behavior, provided that the input pointer is valid and points to=
 the
+specified member."
+-config=3DMC3A2.R11.3,reports+=3D{safe,"any_area(any_loc(any_exp(macro(^co=
ntainer_of$))))"}
+-doc_end
+
 -doc_begin=3D"Conversions from and to integral types are safe, in the assu=
mption that the target type has enough bits to store the value.
 See also Section \"4.7 Arrays and Pointers\" of \"GCC_MANUAL\""
 -config=3DMC3A2.R11.6,casts+=3D{safe,
diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/e=
clair_analysis/ECLAIR/monitored.ecl
index 72698b2eb1..abfc102d60 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -45,6 +45,7 @@
 -enable=3DMC3A2.R10.2
 -enable=3DMC3A2.R11.1
 -enable=3DMC3A2.R11.2
+-enable=3DMC3A2.R11.3
 -enable=3DMC3A2.R11.6
 -enable=3DMC3A2.R11.7
 -enable=3DMC3A2.R11.8
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 2119066531..33b045a5a9 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -393,6 +393,14 @@ Deviations related to MISRA C:2012 Rules:
        (i.e., less strict) alignment requirement are safe.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R11.3
+     - Convesions in the 'container_of' macro are safe because it relies o=
n
+       the standardized and well-defined 'offsetof' macro to calculate the=
 memory
+       address of the containing structure, while assuming proper alignmen=
t and
+       ensuring no undefined behavior, provided that the input pointer is =
valid
+       and points to the specified member.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.6
      - Conversions from and to integral types are safe, in the assumption =
that
        the target type has enough bits to store the value.
--=20
2.43.0

