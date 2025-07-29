Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC772B14D8F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 14:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062607.1428317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjKR-00087Q-5g; Tue, 29 Jul 2025 12:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062607.1428317; Tue, 29 Jul 2025 12:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjKR-000851-2q; Tue, 29 Jul 2025 12:21:11 +0000
Received: by outflank-mailman (input) for mailman id 1062607;
 Tue, 29 Jul 2025 12:21:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NAX=2K=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugjKP-00084v-Ms
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 12:21:09 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80c542e5-6c76-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 14:21:07 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS2PR03MB8817.eurprd03.prod.outlook.com (2603:10a6:20b:550::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 12:21:04 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 12:21:03 +0000
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
X-Inumbo-ID: 80c542e5-6c76-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nL6nSszCw0dslVMnHvHqld1rdDvuJ/88bWfAw9rJnfVllzl3eJ2BVQkW9LEMXJnrNwtWvQckNm5LB2tQsq6i29u1esU2QraweSxM2fCRyj8yT3g5U8C4K2VGAddopC2BWOOzaMfzZd6dEE14LO9XWx+PtfLJxEQVJ8lANqW5mLljtsbIHAICq3vST2rMCgRz+HljMS9YfvYRJPlKGz5+0ZCkuDm2S9UG0+sO9okjJPPv/DXdujqFxwlYoOHD8vmFoQ8u7iu5wjSkl5T1cFNmXtFry95UV2g1IfwDpWhr3/z9A6ifFpUVNZ6e0suf955jgTMX4/7oL4MQo3xEiRzB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pUNvfnMp/OQCQaO4DM8Ap9CmmcCyeMMKJJpKmT2bbw=;
 b=ZoL95ef6P6Nz6kVaWEF4Qd69wqypO07a7jgBIhcgnBzAdZokPlqPqiU7jMmLzcd5XYCSTlPWGXQo5joFqJvMzCNHfQVNiN41IXyVISsbs3cV+oWgz5iZzbs2+RC221OoPv/UGHDP3MGLBmJ7vPv1Z4hyFPmGBW/8VS8xCZwLVZFiFq2H3gw7SLpPL5la6DKuGtV4TXxZ/8pJ55MfKZgQ/rRBE/5Ap8cvMrL9CWSaSK4CQnlN6liPjlTUKGvFEgiYWQJljdjWRObqWOX0bWtbaZaUv20WO9VaToV45KBmsVyziFX25LykhlZ/l/MZh+qBbjUFpXVO+k2GGaIxFw8mcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pUNvfnMp/OQCQaO4DM8Ap9CmmcCyeMMKJJpKmT2bbw=;
 b=MmzgperfuOzm22zkhnYyWpkJfFJ4oSvxm6BdWrrLVni1A11ZJQ3FOA3Q9Ejdxce5PIWEY9jWfBVQ3ADDa2dvNryI30IAiHOt8duAfxR84qnKAfTtbu+ARK2+f991L+xbWvR9KcdAI8sGRMNcQZxvh5QbKQ2RU2oB08lsWoMtSwlJqvC4uscr5/0TPcdbpwYj2aW15hWzQO1/7oqxASOCkY70Vx0qJbPgv7VywTrK/ujFkF4zmyGXdBKFNDi7JqWCalFAbuIshiS8dlINCFvQpkbHE+8eaEaeUfNjDuMRjpsptN6Mo1mPoPQiCo4p4WusQHuMFXwjbS3cMcT5oNRfjg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2] misra: allow 'noreturn' as safe for function pointer
 conversions
Thread-Topic: [PATCH v2] misra: allow 'noreturn' as safe for function pointer
 conversions
Thread-Index: AQHcAINAh5kgMNbMpUuhxpfVzSXJUg==
Date: Tue, 29 Jul 2025 12:21:03 +0000
Message-ID:
 <3b821bc506b04bf7ff8bf5a3712449d45429dc90.1753791398.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS2PR03MB8817:EE_
x-ms-office365-filtering-correlation-id: 78c793cd-90f5-4ae5-e968-08ddce9a62db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bAggKg7+0RlxdRMLCypsJSk2JQoJNpBnbWkNEayWwonXPraUhyK6IJQ1ZR?=
 =?iso-8859-1?Q?Nbk98IjJmMvZDOZ7jYs5V49u8eewmai0WhoFa81cAT3vFLUQv/tGnmzmSQ?=
 =?iso-8859-1?Q?dKEA1Ia3iDwBW+L9HtAOqOXc+EZpOEAcW6UM6zgLVOxvw/+/ap/IyIcm64?=
 =?iso-8859-1?Q?Cqawdik3SKtz1Ar7AOC4Sza2K8fzS6Own/p081ITdThls0PV6FRqn4xbKh?=
 =?iso-8859-1?Q?y+wwV4Io4Snahj2NNE9fuZ3/skvmc15z+AnJcpQQf7ux59i4CjMqrhiRXs?=
 =?iso-8859-1?Q?UT8+l9MpQbZ8rK8Bc3l8c20xgdiBA0/aTj60vFWPBlbrW27fTNyHLrjFZL?=
 =?iso-8859-1?Q?s+Xw82j/oJQc3qNx0jqAa1eCL1BdZ25+yn8ieL+I8LIKqrIHKkL+UG2P9S?=
 =?iso-8859-1?Q?2hEiKzUzRd4LbYS+DimKBzTrvtiDCxbk7l08DIOnAEincXRof4o5U8L2Kk?=
 =?iso-8859-1?Q?f5nxJkAfWKBk3+4Xp0D0pWne5/XLWfyPchBPD34mTy0gapvUR6tdzZM8Mi?=
 =?iso-8859-1?Q?99N7plHgdEnCPGZQwdaNetnOHZwK8u+EazBWdcTipVV65Br/875JOEC6Y2?=
 =?iso-8859-1?Q?T9BjwewnSWeBnULUWffTovVg8BPq6IkAdEKiqjQ1SyvQYcwIN7wDLBLphK?=
 =?iso-8859-1?Q?aBbcHvAc1sY5wgHVEzUoWwUxnRJvWYSm9nHQh2+0CVkjMHQlBitNAKibv/?=
 =?iso-8859-1?Q?H9nuHwOBd/UGZF1JPfrPvyKod/YTuvv6Gxur3LGMhyr4fhqLbO5c1ZC1P6?=
 =?iso-8859-1?Q?cAnqlZPiHkoF7veG2jm/AAmzn21yyE75gX8dWtOZcogpivPWSIEbne/lnU?=
 =?iso-8859-1?Q?iiSU+7NgOY0cKkULwL6nDQFQGrwjYlubpQ23Q4A1y5UobDYpIytRsFKeX8?=
 =?iso-8859-1?Q?5jx+smG0iBn02jhhjePVNAmpVpFsxO7XgLT/R4S6yInH4Ar099VcDRs3fj?=
 =?iso-8859-1?Q?uFQeHJ6yBCed4M/WqV7f8t8oPRYL43wIk0uOkF2yMFmEnkvu6NtnZbhmrI?=
 =?iso-8859-1?Q?H/45QN3m+rQlXpEHVVnPGQCx2YAlcl/DNTlImHbfRU4jG488JNZuB8PP40?=
 =?iso-8859-1?Q?esipm+ayswYsF7ag3UBUTnLZTblgnUrm/WJ+b6nmnzUeR/Zk7ukpIsSCa5?=
 =?iso-8859-1?Q?21z06i2Q3kv2ocKoItECB3IA6V2GDJ0JBWSbZmo+pYtXvGTIHxtJoLqi0e?=
 =?iso-8859-1?Q?mZpst4hKzQcY/HPD4ogqxkk40WWXz+8Kp58KbLYvA4H5OjXHmYjtuYCNfT?=
 =?iso-8859-1?Q?9PKX+EprOO6QZ1WnY17gZEaBLehg4uXHgHVMheCZ2BvldeQdBseiTAkgBD?=
 =?iso-8859-1?Q?+94tl3DPZPDdc97bAbm5pSYyaMwOLAJRG4ItyZncZfS+pnxcTK73B/X8zH?=
 =?iso-8859-1?Q?Fjy/wVg+1397+1h3Ai8X8izoUVgtTCP9bFTbD7HnSeKvBLYxPrjC55rlIP?=
 =?iso-8859-1?Q?BOkDIV29sKASu4s92F1M8U1ZFTcR21s6Z0LUgIn2qCrGGmPrgCwv9RSjwZ?=
 =?iso-8859-1?Q?k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qRCAVdAEXrCC4IAxQdifNZYa4GPP6Vxx7a4Oh1ZQ7D56DdKhRGwytmmf71?=
 =?iso-8859-1?Q?iD/C8r2oCpNk1k+1kkZJ5H1I988At1PoijXiScR+qxozocv/8u4W0Ovsvz?=
 =?iso-8859-1?Q?+4QO61T5iXwa2EHUjPGnZy+GUcyd0CDcLJ11y+1heuN9YhIwhbYZCKRyMV?=
 =?iso-8859-1?Q?ciEipieaxcn8Am8begkpPnN2UpOSr+l2MOZovqy3lT0DoBWAyDJHNvqM7C?=
 =?iso-8859-1?Q?wxi7IeoIE54vQ9LyjKQHaZtnbY6s+QZhTFOEBtF0jHoMqmmKmkxRcypR9z?=
 =?iso-8859-1?Q?22FbkeRIL7/i92SLGpPOVjios1RvGuNpZCovFP7tlZLxfYO2xtTLautsZm?=
 =?iso-8859-1?Q?gUYeJMfsnKVnVG81n6zAdYSd/lMBgoUO7zf7W3IWsGQr2uKLIl6wFlu/tT?=
 =?iso-8859-1?Q?4b0gTjlq3tjZlHguYhUYefiS9qkC+2dEnyB3rwf5C7rYivxdhVeKCNT/84?=
 =?iso-8859-1?Q?z28EfcvxPwFlYZ69FTYxhDOxB6HaRB8QvmqiJTlj5XV8AjIQOik2hijGuK?=
 =?iso-8859-1?Q?xpq9IfgcguHPnSuPcpFURa7KDfYdrvfMwqK9CjDCWldOj/nHj3rCn1yoK0?=
 =?iso-8859-1?Q?0N36O3uZvBe9Jg4kQUdaHTzQet1nTTXWZmydWlhL0V0ZSvcz1ahibHpgg4?=
 =?iso-8859-1?Q?SQAGTVziciltHHRlGMPlByHneeICjbCTGPDAlKG2PFhfE/ebzl3R0eUraA?=
 =?iso-8859-1?Q?rVRSUCU7YKnQzaRvyf9D5rigJCWRIISnM0eTTadbcYni8qVTXb0QPh4MUE?=
 =?iso-8859-1?Q?uSa7B6YmzZdbgpgNgvp7QhLTuGlMiVuC6fGldnDmMlif0La751lsj97qSi?=
 =?iso-8859-1?Q?M1FsF9gdzTOHmurqZnP6ufZEqa/dyYu6BD65l9q2D8vI4FfWWx8PEhlnC5?=
 =?iso-8859-1?Q?Qdh1k1iFtBLDQz+8oPgmGH45Zl3c1N9AmjHGAHuizAk2Fil3KSps7h1Z0i?=
 =?iso-8859-1?Q?CuQ8U4u8Za236jES2CRcEPr0OQn7eidJjaVMM/pTY7HE7DF4fgLI66DNWN?=
 =?iso-8859-1?Q?ZnMEQq2TPDpatag8Qv6MIj96MbjeA6TdidNBPnb9fyL/fC6jLtTg524SiB?=
 =?iso-8859-1?Q?P0Y0yWJII+TztNdjZeZIXWnCe7KcdqMuQNpEUQF2Unel5unPOhjgskw/Si?=
 =?iso-8859-1?Q?5PzKtP9cAjvw9yveoMBeTJsfZxHVk5BKAyDigm4iAkNHyIc0c1pqWxgmdT?=
 =?iso-8859-1?Q?3ty68/5WC5y2bmBPxWhQnz83rLu0lO95GRgHupggo/daVTqFjzJAxgi/za?=
 =?iso-8859-1?Q?zue6XgY4Awu31GIbLUFOr578O2DPGIMwff/JQoasy/RLDnJw/ILlcp4ySm?=
 =?iso-8859-1?Q?vGLulsufNG/1DgKso4p2kB/aKShnzlhlA8yR5pjuYziFWRbwloHEWXdrCQ?=
 =?iso-8859-1?Q?mOiKzf6rtvNJpb+D9QRDcNdG5GraMZTvsaOewT93wd/2nIrMv1DHcYJJYe?=
 =?iso-8859-1?Q?UbkjVjyFuVt2dJuhR3W4IlmpAljhFhmmOi+St2usSX5j5uwJkF6klAjGGn?=
 =?iso-8859-1?Q?e7UicNFyErz6xDeU/rsks0pN/PpiLtD3Qd1//AyDTYbE5YxK0FbOXIjPOn?=
 =?iso-8859-1?Q?m5NkIEuHBn3iHkGegsUMt54DOMXWEWYK9paA+NqQXDNPmKVNaQJwi77u2I?=
 =?iso-8859-1?Q?lkiy273KbcM5g8yEX7VxryPNyw2EnEflQ+mar/qPTCch422TEoWqS9RQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c793cd-90f5-4ae5-e968-08ddce9a62db
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 12:21:03.4922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JozZa3N7nBslJUZCSi2xvQ0DwodlC3I4NYHGvwp6teaDA8C2i1veWcumtr3/t8l3S2yjBU4f0sZicoWqB8p5klfyLcnhp7xneUruzUMVfvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8817

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

Configure ECLAIR to treat implicit conversions that lose the 'noreturn'
attribute on a function 'void (*)(void*)' as safe. This is because the
deviation actually just deviates 'void noreturn (*)(void*)' -> 'void (*)(vo=
id*)'.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- Updated subject line;
- Updated commit message based on reviewers feedback.

Link to v1: https://patchew.org/Xen/8989bf6d8d245537628912a00f5ba4731b292fb=
1.1753738107.git.dmytro._5Fprokopchuk1@epam.com/
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

