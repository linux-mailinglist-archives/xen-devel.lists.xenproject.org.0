Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB087B2CC82
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 20:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087013.1445170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoRV2-0007YN-KA; Tue, 19 Aug 2025 18:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087013.1445170; Tue, 19 Aug 2025 18:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoRV2-0007Wu-Gw; Tue, 19 Aug 2025 18:56:00 +0000
Received: by outflank-mailman (input) for mailman id 1087013;
 Tue, 19 Aug 2025 18:55:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1y2Z=27=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uoRV1-0007Vb-Ia
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 18:55:59 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2132b0c1-7d2e-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 20:55:53 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU0PR03MB8164.eurprd03.prod.outlook.com (2603:10a6:10:353::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 18:55:49 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 18:55:49 +0000
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
X-Inumbo-ID: 2132b0c1-7d2e-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhxYQUUV4qGavwCsOV5IsS2Xq4LbIa8WgxiNDKkIuBVeCAXBIHLwDEu1RrJnLNoDr8+xOtx5kkxsf1BAlUUhGz2252aWfsKp4KDssnvpsEienTCsFSyf+wNsfpv0BnMkBHCmBq+C6YGJpUNa2Jle14j/nc+RmXFhiLMjWg08m9FcF64upJyQgo79fkR21NELiJvk11z4WYBPsSgWJFMFwfh68qq88BnnMU5Jw7pjMjjZM+9wEoneMGU8u3VL5qCmw9XufJxLdtIuQq6WBpe/AlD5eKbw4E3lOJUT6gPBMSHlETZDsB9gzpnyqU0BWjG0D4shHZ4BTUm5Ay2GmRc4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrrMBmiNRzQVInQl48AnTqOiLI6PzPO8kbTE5N2xFE0=;
 b=u5wZ89sHT5EXsrkadmFUSVqt9j2gfnSZ/rQExigarQ4GHBIoCEW2Vuz5EJQrBwbZkoDQsEoraj+LJM3eV2wyVy6Xb2Zlvev+i/inK3XrH/kKZXb3Ah/NxpMvjnmbsPJ5l7ZjcfJ5qkZ0XUXo28BQ6Bn5WKic6wC8UobvVQ544vfoFYBDuux73qfeWPQnJCqMU9zbILIhhnJh5qBcstcULOqN4TXlzrDaWJ3RNDg6VkYZb71TMfl4/iSEFgS6nNHQcUJLvEi/lissXczEca2sMo9VaAQupY5Fh6+WLUXzwT1+AGpmyq3YiCaBqP6bizMtUg3gNIbIbMVoavvG5TnyYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrrMBmiNRzQVInQl48AnTqOiLI6PzPO8kbTE5N2xFE0=;
 b=Ra3jUm0jomYRnwV2Psg5BpatNxTmsRON2rId/F2+mdfzXIiPLOqZdNMa3Tr51FvPbeaNwZZ20WookbohHXBlVZ8miR0slfd5M7w+wubNFn/ReWaA2mxL0VikWxveosIxV8XiwHC/yGsiG/GwMsIsL4g+SgpBgXYesg4az8Ew3LLhhIQf1snBxQFdoqjH9oOhMnjNVZuChjqZtPl5xiUSiXN05eocGvsE18ueGTuIgPjSzbmp9HGHvuLyv+jbd4vbdUfDZ9r704hV4yV2FTWbWIRv/rh/U/cJCE8biwuDyWjy7i3iMRoX0meoc+QLYl+gCHMnN73lml5Sg/xizObMhA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH] misra: consider conversion from UL or (void*) to function
 pointer as safe
Thread-Topic: [PATCH] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Index: AQHcETrg9Y9S2hDXvUqVfYmm522krQ==
Date: Tue, 19 Aug 2025 18:55:48 +0000
Message-ID:
 <9e5e4ff2c7ba0a90a6ac403e2de9318e18949274.1755628705.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU0PR03MB8164:EE_
x-ms-office365-filtering-correlation-id: 6cb5b868-4444-4146-8c09-08dddf520331
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/DFcpcJfsRbOwomQslB1cAy06k8H0wlDLmZ7q/eCbS/KYhlf9fzTkh+eNh?=
 =?iso-8859-1?Q?EaOB5pNjrfhslf1xqKeKOJxjsa/hCwM1GLTO/dpfO51d61Ad++dTu1PIbo?=
 =?iso-8859-1?Q?mNXS9qkDZNIr66o888zJN943cobp+IT38mlXve2IjvQxad+VLFKVenCwDs?=
 =?iso-8859-1?Q?hZNQo9/gODB7RZEz0IXQNiYgtWysOFI43F9smdur3L99v6WKevRvUFvG8P?=
 =?iso-8859-1?Q?C8xakbtHUdyEob/UvIdnUbvzdCwkYKGUXYvEI78KDuSQfDqb0fwK9Fx+E+?=
 =?iso-8859-1?Q?AdmX+WfVgNRU2hxkFhB3b1TWsigwHjHsj2FMZElzuMObB4IHhxs0NmV+Eq?=
 =?iso-8859-1?Q?D7fH+FWNRZQEn2rcqjY/0jDZF4RdibNDjvs1WicZTopeADw8TlJMRvT4qA?=
 =?iso-8859-1?Q?aMqO523worVFtVrSWWJbJepcqo7yjIoTKimmLhl7rnZtDRWHOkgFtmkDgi?=
 =?iso-8859-1?Q?yv8ytqtHV/l/FU4uVkU4sz+N0weSCaV9P/GKKLotn7qjlJgyUUSpbZ4AU+?=
 =?iso-8859-1?Q?kFxAd7D4zVwX37dTfuroE/0PvujfTDo7s+Kwlb7P742cg+TgU8cdisjIbl?=
 =?iso-8859-1?Q?9O/9BDxipfl+t0k2MpGgi7qk5wcFb52XY15ujU7vbxLTOUwelKUHDtM0tu?=
 =?iso-8859-1?Q?AMGjL9d6+OQKs9W/W+domegp5daxOtGvpUbWTB3cDZmayacQ4ZXBBbzobP?=
 =?iso-8859-1?Q?rvupEPOki8mJG7tRPnTmK6iLnpsKIhQ+SAh47E6M7AEgZi7vXE5GA2wy9W?=
 =?iso-8859-1?Q?5gU5IEgvs+R+Z6ER2cRUrQi1/RWsHM/gqJ9UZ2Im7pZP1ocjhie/I7B7D+?=
 =?iso-8859-1?Q?fJlTMD1506S3vDdOZ+3DPLBQA+r7Lz4xIMYAVONJsf8XkN1JNH1dPL4dc/?=
 =?iso-8859-1?Q?9o9W6m9veUhj1+zr9PegmoRXDdYb3zJ4Q+uxwmfCq8Jr3dfCUEqf/QzOAu?=
 =?iso-8859-1?Q?7QzF2QjtNWSjPao4OFFKqhSdgttggAj5SnTNuLTMbLYkHjQFox5nv668Of?=
 =?iso-8859-1?Q?/LAE5i9BYvs/EqQBmV63Jc1ixR5dnfhlR+un/Xt8qj4DyypXSiS12lAJdz?=
 =?iso-8859-1?Q?uor827Q574nHZei74imq6toweFq0d1VShz1hpwkf2KCGAusBL9N+48qzRC?=
 =?iso-8859-1?Q?LI69MZEYMIvAnuStEehDSBn9xDNNs4gKhOqe98xob+5doMFz6cqpWER3hy?=
 =?iso-8859-1?Q?/nwN5sQhH/Lyp9RdLGQJnydVrJG6y7/Ga3TCawRoHA4h93amjGzYQxSoFD?=
 =?iso-8859-1?Q?b5KMfi2qwCYTuqjf9KXba8IG47wMnANj0Z7nvpj4kNWR/i2aV9v4LGCTsj?=
 =?iso-8859-1?Q?yZRvrxr208qT4B+ce8QDXeUxj+q/LBkipngP3ubArJnJfMoeRdxw+s2sJy?=
 =?iso-8859-1?Q?UhN1glPX3U2DYU06HvQ0dGeza4sfeWcBqUSOoaT/eZFuJ16q3Vejxr7yWb?=
 =?iso-8859-1?Q?SzGAB3y5fmFVw8olJJCHHM12kiXZcRB6IgHGtt7VltZ06jVnZ9kH6YhDZ7?=
 =?iso-8859-1?Q?o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TX3zEJuV7czUoRsYS5DAMwvEUggKwXBey/z2p45DaFMl6cESUAZTY8+vdV?=
 =?iso-8859-1?Q?Ae/7wDz9OJGk+4GoOFANUkOC73Uau+ZIJeAd+HN7QRtyQMKf1gk7FlCSN1?=
 =?iso-8859-1?Q?ug2uR1abz7kL40BwRPcOjHwHqd2ZMjrjXH3Qw3AxyS+yxJqLLIo9lyiVK7?=
 =?iso-8859-1?Q?JyMhxxPwzrzLiqn0aNOW2skmNaj9Ii+v5O5NlXQatf5nMas7Y9dQAQ1dhO?=
 =?iso-8859-1?Q?ps27LnImuoeqWo5meo+wJVyHSbpUyYQhbyI27oo9g0WgBzyQQX8cGnTMkV?=
 =?iso-8859-1?Q?+s2ZCa1oCeJrux9vQ7GTAQgFCrFWT6ACVwu/oL0Znt3IJ1aOybwBqG33z/?=
 =?iso-8859-1?Q?ArxgWPhqdmH4AgPGEqMl+l5rx08FJ0/gvVJJalEbtcNXca+tjEmfTe+7k6?=
 =?iso-8859-1?Q?r/KTBH1ZI1llkZ2a+Bg12NcUFyvlW7ZcasfwH5l2Xq7431m8FLRN6oe8k1?=
 =?iso-8859-1?Q?MTIzF9DILg+8K1YTAPsSO+BnTFL5Jwv4A8ecFKPxrldjmMRyEbIhYIQeEa?=
 =?iso-8859-1?Q?39CzYgJRIULHK+aBvzfltoom7cHnSxMk7sIG/d4juLwTkRoTPsYl1kvhII?=
 =?iso-8859-1?Q?azLREGJ6WVqUzBfSSc3sRglg7gCvY1V3TTwyZn7htskzpEOuPCEUD4wwf6?=
 =?iso-8859-1?Q?1lqmYHvlZjIEQQdYXWiaU8dJ+0etFT0AIeqijsYALHzH3lP1YHrQ55T2jm?=
 =?iso-8859-1?Q?BbKoQUpMNWMpMBL6yfaVMCoPPdlJ1okKgDA4v5u7DAsCZZhvcD4wlsGvXt?=
 =?iso-8859-1?Q?g2m8W/dmbKxwhmo6nUQEte603lMCAJOO2t8iU87v2u4jZiKlz4FrYEPOxu?=
 =?iso-8859-1?Q?dQvZ+QUQ8E2fgDklmVe8rcETL1ozw3Y0E+55/UJVaM7nnQ0iX5JhezdHwI?=
 =?iso-8859-1?Q?b1EhzPhy2NgjA4f8A5G80cThrNn28Rur2HJGTBkTgi0QGxCLXQdmP+AowG?=
 =?iso-8859-1?Q?542oFemRZfQlC//uSnkR+xYuus5wQAaB8XrKCFRJX0sDceyIXWKCz1PhYp?=
 =?iso-8859-1?Q?SzpGR3Sx4qtzhsft3YiESfyRM3s4VCLbjZmDwvKSsnX8NdKCHGzwiW/qHH?=
 =?iso-8859-1?Q?U4qcAD8zKVtqIcgnmqmzBM+nWu9WteMh5ijhd4m8Z8Lr/rdD/Z1d5mfhQ1?=
 =?iso-8859-1?Q?KYsxvA93hTHczm0YHShlNmRkM/qkKwtZoeKvKTaoTnTItM2rUGhmbvbo8p?=
 =?iso-8859-1?Q?GH9WF462i1UKGsguUWTWg+zmH7WeIlmBNM2I9xoyUvSeBu3fzMtZIntFR1?=
 =?iso-8859-1?Q?9UNlUGv4lOjdxQocwmzJcMO54Fxhfuq6cJchOB53m4+2BhDeCCedeihyRE?=
 =?iso-8859-1?Q?ZWThxccQp9h02ECitSWNKKFqzVvxlqrkt2XKNyZuy1w7mq3c+Yh/x1UtE1?=
 =?iso-8859-1?Q?o0OyG5lYpLY53z02buzmmszjqj7LPT0TtKTzHhplTiiIwrxOJNF/AzZLId?=
 =?iso-8859-1?Q?K39YpnHQLMhmRVX9tG+5dEm1Nn6hj0bl0XVvx4OS27jG/MmY9005u42G6L?=
 =?iso-8859-1?Q?s3y5Rvzaukb5Zkd8mr8l7ev+BeoPzvy++WhUV8mzPWXKedzdWPSju6Mkfk?=
 =?iso-8859-1?Q?GVbNqsm9xBcQnSaxvEr1GR2nh4iz91Kiko4vpPC5rz6dxxvsSz40Jtt0VT?=
 =?iso-8859-1?Q?wN1lzmYV2KeED3TKcj09+HpGbQNyzXVXwgIPLQO/psLNIQ1DscUHbK5g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb5b868-4444-4146-8c09-08dddf520331
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 18:55:49.0023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pyh9sdKt0C8D0V7tOZA4NzLE6QE2pSuhB3q4Q1iwdd6CIq0AJ/048Ymt/PzFN8SlwGa6Uj/NFybwfk9pNaGTHWEAoeHtkdPQ028NVX1F9qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8164

Rule 11.1 states as following: "Conversions shall not be performed
between a pointer to a function and any other type."

The conversion from unsigned long or (void *) to a function pointer
is safe in Xen because the architectures it supports (e.g., x86 and
ARM) guarantee compatible representations between these types.

Configure Eclair to avoid reporting violations for conversions from
unsigned long or (void *) to a function pointer.

Add a compile-time assertion to the file 'xen/common/version.c' to
confirm this conversion compatibility across all target platforms
(assuming this file is common for all platforms).

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1991940822

RFC thread:
https://patchew.org/Xen/8cbc9e6d881661d0d7a1055cbcef5a65e20522be.1755109168=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
 docs/misra/deviations.rst                        | 10 ++++++++++
 docs/misra/rules.rst                             |  8 +++++++-
 xen/common/version.c                             | 11 +++++++++++
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..0083c9c505 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -375,6 +375,14 @@ constant expressions are required.\""
 }
 -doc_end
=20
+-doc_begin=3D"The conversion from unsigned long or (void *) to a function =
pointer is safe because the architectures Xen supports (e.g., x86 and ARM) =
guarantee compatible representations between these types."
+-config=3DMC3A2.R11.1,casts+=3D{safe,
+  "from(type(canonical(builtin(unsigned long)||pointer(builtin(void)))))
+   &&to(type(canonical(__function_pointer_types)))
+   &&relation(definitely_preserves_value)"
+}
+-doc_end
+
 -doc_begin=3D"The conversion from a function pointer to a boolean has a we=
ll-known semantics that do not lead to unexpected behaviour."
 -config=3DMC3A2.R11.1,casts+=3D{safe,
   "from(type(canonical(__function_pointer_types)))
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 2119066531..74540e0565 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -370,6 +370,16 @@ Deviations related to MISRA C:2012 Rules:
        to store it.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R11.1
+     - The conversion from unsigned long or (void \*) to a function pointe=
r does
+       not lose any information or violate type safety assumptions if unsi=
gned
+       long or (void \*) type is guaranteed to be the same bit size as a
+       function pointer. This ensures that the function pointer can be ful=
ly
+       represented without truncation or corruption. The macro BUILD_BUG_O=
N is
+       integrated into xen/common/version.c to confirm conversion compatib=
ility
+       across all target platforms.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.1
      - The conversion from a function pointer to a boolean has a well-know=
n
        semantics that do not lead to unexpected behaviour.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index a2e4e9f4ff..ff48a90963 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -431,7 +431,13 @@ maintainers if you want to suggest a change.
      - All conversions to integer types are permitted if the destination
        type has enough bits to hold the entire value. Conversions to bool
        and void* are permitted. Conversions from 'void noreturn (*)(...)'
-       to 'void (*)(...)' are permitted.
+       to 'void (*)(...)' are permitted. Conversions from unsigned long or
+       (void \*) to a function pointer are permitted if the source type ha=
s
+       enough bits to restore function pointer without truncation or corru=
ption.
+       Example::
+
+           unsigned long func_addr =3D (unsigned long)&some_function;
+           void (*restored_func)(void) =3D (void (*)(void))func_addr;
=20
    * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_11_02.c>`_
      - Required
diff --git a/xen/common/version.c b/xen/common/version.c
index 553b97ba9b..7091a6d440 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -217,6 +217,17 @@ void __init xen_build_init(void)
 #endif /* CONFIG_X86 */
 }
 #endif /* BUILD_ID */
+
+static void __init __maybe_unused build_assertions(void)
+{
+    /*
+     * To confirm conversion compatibility between unsigned long, (void *)
+     * and function pointers for all supported architectures.
+     */
+    BUILD_BUG_ON(sizeof(unsigned long) !=3D sizeof(void (*)(void)));
+    BUILD_BUG_ON(sizeof(void *) !=3D sizeof(void (*)(void)));
+}
+
 /*
  * Local variables:
  * mode: C
--=20
2.43.0

