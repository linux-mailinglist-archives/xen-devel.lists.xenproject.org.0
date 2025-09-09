Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF50CB4AA3B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116242.1462635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvRq-0007hK-8H; Tue, 09 Sep 2025 10:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116242.1462635; Tue, 09 Sep 2025 10:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvRq-0007eO-54; Tue, 09 Sep 2025 10:19:38 +0000
Received: by outflank-mailman (input) for mailman id 1116242;
 Tue, 09 Sep 2025 10:19:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvII-0000yD-JL
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:46 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bc6b1a4-8d65-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 12:09:45 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU4PR03MB10645.eurprd03.prod.outlook.com (2603:10a6:10:58f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:09:39 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:09:39 +0000
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
X-Inumbo-ID: 1bc6b1a4-8d65-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JArrhoqG+j/InGzMl+jRgyENeuOXAoxBjzdKJ9j6k1KD3Nrq5/U2bcWqdO9ouhnpskcie19X9lfkKCD8sLMYqYo2pGeAo761OK3FNB3VrJeyowMxMNLR/JIHNoLVBnRq0qu9LAOzc/n5D0ILf+uK+NoJiiHsr0MPvxMcljkP7IXSYnBBS0m0VCn5f6UDGKDIJA7jsv4fwxczoouOduFVQTo5sQON6JD6jBTpbbLM8Dw94WNiWDxRjJ8Cb+gGqgNlw1TZikwEANoAAWt5515N15aoGcKyzWVlb1WjrZryvOUHmDTSByFhlDxjdzlQpcgFFC0C2WeadaWH2rnOugIj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7fQLCSN2Xg5hczty36vhSzRR6D7dPrajIYlhliCz/g=;
 b=PTO8uXCjQeAjUXyW/vSA6+TpowNhsrhVSxMeX883Sm5x9Jb1BtqDQOafdudehGndiO4hYNThUawdo4jniiE9zzS1LtHM5ccx7njNeF9CR70IfoowF2tTFzol3G9GQMtz3wh0llcKgEFKGAp6EJERqE/a1M1YGskmf7e4SZdD3HzqkByOu1HVr9PMQXiBeZXb5yaxBF8t4cVycEbww7r2EwzbHPjFjWEuzpJb6nbzwGJNajoM6aERijmAkFHVdToGjti46q9z4fnmUdfOgak2vc7Ge4VrGZR7rElYqHFCnwvDnEAkv4cVGKaCbekffOnvekFl6HV9cPt5kzhxu1PO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7fQLCSN2Xg5hczty36vhSzRR6D7dPrajIYlhliCz/g=;
 b=fm2pDHOmaZUgVL/Nd1EhxOcDq4BQPeS+sdbJeqrU391ZkF5jnO4lzXxfUiZR4ADV3VJP/32My0NVuiH5l+GNF2GsBcUmAaoNaGR4iKn3KlJoODQqaCLlIeLwpCF0Tq4TVfbyPdik18SODrODzuayTadArgkSJ5u7HMvHIUzkxjcPaOwqCT5c4CIfzeHFjrYFTTGXpo/AZ9koEogjICEEM6fzTh2Ki0k+hABJKA63XcDtZ3ABaT7GW2hL1+Ly/iqM75Sloac6whFYP6bDFEQs/1ugGazLMfBc4qam/tW7dYojq+GjdFy8eqqqZpMAqRsohDfnJ89UZRwSMb0+HeyD9Q==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v8 12/12] CHANGELOG.md: add mention of GICv3.1 eSPI support
Thread-Topic: [PATCH v8 12/12] CHANGELOG.md: add mention of GICv3.1 eSPI
 support
Thread-Index: AQHcIXHa6pa5FlfG8EaEsm5Ttfdaow==
Date: Tue, 9 Sep 2025 10:09:39 +0000
Message-ID:
 <db2670f5e675fea2fef48a2842f27f4be8514c00.1757412099.git.leonid_komarianskyi@epam.com>
References: <cover.1757412099.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757412099.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU4PR03MB10645:EE_
x-ms-office365-filtering-correlation-id: 4e55f229-bcb5-435c-868d-08ddef88fcc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?XMlbbsjYdEhkQmIm76HKPFLZjUGZvXf/KCkIQ/toYIULpV2dAdNT/i95yk?=
 =?iso-8859-1?Q?RZzuz50S/EqNSZR/ghXUWMUTV+Utl5vpNwBurUPT2arxkiQpZ7Xvgw+5QT?=
 =?iso-8859-1?Q?XmPNq7AHbWdNJr15GJX2zLpF8ECnePkwVdTrRbwlrr7yPi+tUhJGNt2JQe?=
 =?iso-8859-1?Q?z1aPdo4WwsXRJ9Trr3z05gV3vVlm/mraSTqYzj3iNB6rkBtHgt742iJO5+?=
 =?iso-8859-1?Q?Gr2P0O0snW9FOv+/TgSmLaea8u2e1uJVpCUhoHk4JIxoIUgg+D37isxDuO?=
 =?iso-8859-1?Q?QU/q489rr2um/SYjvlOc15z44oHRkrBnp/yrls1IWmfwkWhEV0HgZmIUbg?=
 =?iso-8859-1?Q?CAZOaleOcvmPe86zPE51XmGMX13yXoQ8eqTwACwBFH8XqyRD+kK8DjBsCs?=
 =?iso-8859-1?Q?bm3WuZ9mlWZR75lvCaoWQ58Mw2XH037P1kC5m/e+sm2PLX86nN9Iorc+R0?=
 =?iso-8859-1?Q?af/cCwhsKZIDryZSURmSCNLQPjq6OEkFr0nQFbPQ6auqp/gWkyt+NwG99L?=
 =?iso-8859-1?Q?jmSzL7yZIKHrsZbBFcw1ycv2nAFgI0qctEqynJln3+ZG7pkx1pvYWqoetV?=
 =?iso-8859-1?Q?ZkNvU+PHJdk1Vc8V4L55IYp5NS068xcV0dzTyh5WWkJhFMyxOAqPZZNwyf?=
 =?iso-8859-1?Q?fJ4gyzjK+Kv3kPQMq3OepkNe/oxWO46pg41m+nUiPHYUQ9pPdWMZDMK17X?=
 =?iso-8859-1?Q?JISTawS9zfd8bCLWKfrlbC18nEyCnr0JP0KhEbOYiaqTIULct1inyX1/r0?=
 =?iso-8859-1?Q?8tXdG5FVrPDglXVmuDzywhjdd+E747fAH795f5jvruKxsCCBGjpIusHfE+?=
 =?iso-8859-1?Q?ni0h9CiAh4U0JCrEXMFlCQ9lwibPej5a7cFpAn/d+oMcgFAai7PncU6JKp?=
 =?iso-8859-1?Q?xkgumRPsUsfxrnL5YPbcobWAV1eBltEcRqSRW5va8Hg5fVGzDvdnXRziU8?=
 =?iso-8859-1?Q?mt39fUsyM1KjOTKM/PK2b5qbmNV+RZtKVzz/+bj3/X39YaHMWYxPxkzHF/?=
 =?iso-8859-1?Q?0YLrpZ6uhpSdMxdgvPgdiQFQsFQLMefcvVHh/y4q42qm7vSSddmoygV1QF?=
 =?iso-8859-1?Q?JsJKBBqA6VIbzwhQG24xNHFhEWN2IzjWDwDORqkqi/wXe3MVuFSlbubY+H?=
 =?iso-8859-1?Q?n1GFwOfFVbzTeC5G2ra6I4igVMyfBM6wpOtLXAjIBlicYyqLETM8+yCpWx?=
 =?iso-8859-1?Q?sNfdr97vt2EetGkcWZsoFFdaIUrq9vxjmOuUdOikXAxp3tXa3UpU1tTqxr?=
 =?iso-8859-1?Q?xxf04eO64iN6sNtGlwu2jiTuymU9mouNkrdHE2Yclo0zaLDqo5RgeizATj?=
 =?iso-8859-1?Q?lO2TtbJs0fey6+N8ilD18yoPQih7uSMzkDAwxR5tmb8TzoCZa0R8oMFygm?=
 =?iso-8859-1?Q?hLbtdr1NN9U/GcMq/2/SDmgaoe1TfSXGPt9s1fqjXzcuUm6QEOq6E5uoom?=
 =?iso-8859-1?Q?Y6E+Bb6K1cA3MXJEa5v3z3RnMyveOmmQ/w4rExHRnApxNI6BrqpEztlDd/?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qQ7wJ23txBcY7+Ek+PIXSE3GeZetM1SxCoCBSrIADRAMmlvS9Q75kszJm0?=
 =?iso-8859-1?Q?O0PDqDh4pS4VtI6xchWwvDk8G+zamfj6MyYj7oBbDOTkb0wiKnedd1SHB4?=
 =?iso-8859-1?Q?6t5WWgDcAnr6Qwxt8pYrOadP0g91rB39FYko/b4yrMEeTzCvnapkeXWTAZ?=
 =?iso-8859-1?Q?DHKF4P45M4VnfwCdS2eiXDzuK2QWJWysIZdB4wqpjLzyaV9kUASqTkAEEN?=
 =?iso-8859-1?Q?qRCZ/Bh4SsN8lgF+rpAWo85oJkHCD6NML9tUJYFB6cmPVBkv1Dw9+SDgoW?=
 =?iso-8859-1?Q?lq2O0k6dlwfBDD+wWdkVqpxnBZu4Cy6tIQxGzg5uUKk9D420K0fIRlXafh?=
 =?iso-8859-1?Q?k0uTy9iWWw/JcaRSYqK5qXxHg3a70UjznY0EVDd67pYXY4LAMnbbma4Dr6?=
 =?iso-8859-1?Q?QXE73kY40TNWvtiyhWC8goQvHRA4406CczKILvp/ct1p70CWg32Yx9cCYk?=
 =?iso-8859-1?Q?50XbO/2pQE8cYhB1y39sDOjmoBcVYrCw/mfYWuP1Lj6HFpuoA2st/+zwkO?=
 =?iso-8859-1?Q?ayGJKT1SYtEPUGWbr2R5h5cIxIVggL+wNiKdKjE20msuSzm2C+jx4auMUM?=
 =?iso-8859-1?Q?NZyN4hWnLi0iIYqFkrNNuFF+D433GpUUkP7pMjrVhyvYPjn1tXvM0anIkY?=
 =?iso-8859-1?Q?kcuO5vVx/+BzjKQpwCwg5r8SjYbMScbH49jeg87rCKM4dI6mg5TNb4MhIR?=
 =?iso-8859-1?Q?oq0+yHxK6oOxcg4QUpkDEhjAfxomjBKjaa34sbuQ4N/IaFPI+nmC9txTe7?=
 =?iso-8859-1?Q?dgsJQMexknmFP2kHhncQVduvqZD/dzNPPUgmTaBis92GHdW5RjwLIzpQrf?=
 =?iso-8859-1?Q?n5OdfLcnWmgNBabvQt9AUHz4FkLmqESAXzaSDu0G6DVxQPriszq8kOWlQN?=
 =?iso-8859-1?Q?G9yBzQVXYzT4BmDMskYOOoMdval0kK+Sy5v84QPtQ0KBpcG5etU6XYfIzR?=
 =?iso-8859-1?Q?+k19xcV5HOqJ7lxEn9fxPujbMgBvnGOmYOXJ6zcKAk/i7eYo2Q6JIXPip0?=
 =?iso-8859-1?Q?fZpe3NkEASOtNjVQySBJ/P6hrNuG1NIJnrvE3n5NjhBi6bsfCPx2z+CkbR?=
 =?iso-8859-1?Q?ENcc0SwNJx0Unw3yq+QBhgeckHA3Gt48HfHsWo/iNie0c5Up+VEUgvvVN1?=
 =?iso-8859-1?Q?W7Fc6MbTDmgzzrEt4xq+mH/W45KeDT05FZuxvPBxo8DJtKmFBCQGF3DCDQ?=
 =?iso-8859-1?Q?3tzxgUCmCAyyjamboc1VySDlEDLzTctxQsm5O+QsRstuX1jEgqIQJRawpO?=
 =?iso-8859-1?Q?W6lT4Gt9JKWYXalBBtR6BrJQky9l9Jfpa4RILwVmuaz2BX9376Du3XE7p6?=
 =?iso-8859-1?Q?ULPqX09rTvUHZeDV2TUSRmni1X5Ajoh4gl7BrQ2/4USxmqKoKD34WoAwvu?=
 =?iso-8859-1?Q?ck2ggxMN7moM9C4mj6i/NdOFzzH+L7Qkpp/VD+oy0KA02Tqc2WoNEJ6gDw?=
 =?iso-8859-1?Q?6Xq+S4X7tVo/dh2Tj7In6QcW+GrFj6flELksrNIPFnJU3q4HTQW4ok/ULR?=
 =?iso-8859-1?Q?t1G0ipHU95dvkYes4gmU7cs1O58oEkIOb92LVj86qSTcib4xkrz5uKDL19?=
 =?iso-8859-1?Q?YimzCJXu76Z1Hili3LUVaSwxwM++D6AMr0VvHaTgN+8GLuUwOpLJN9UXF6?=
 =?iso-8859-1?Q?w51Z3lLS9YnhtCV7Rddqy9ZB1ERPsxxnFwZGrIriaRwi+SLyq67nim3LrZ?=
 =?iso-8859-1?Q?JhdrlOwAfS7PoHtW2bU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e55f229-bcb5-435c-868d-08ddef88fcc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:09:39.1530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IPAxbgG8LYLAEkfrLssMY4+Uuwau8Z08Gmn+gV+fj5fmytmkMM2jofg2L5/5FJGG9QMPytOx15/S6wLHRnLMNhr3Us4gLyfd7lf8vSV9Er8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10645

The GICv3.1 eSPI (Extended Shared Peripheral Interrupts) range is
already supported with CONFIG_GICV3_ESPI enabled, so this feature should
be mentioned in CHANGELOG.md.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

---
Changes in V8:
- no changes

Changes in V7:
- no changes

Changes in V6:
- no changes

Changes in V5:
- extended changelog update with a brief explanation of what eSPI is
- added acked-by from Oleksii Kurochko, which was received for V3:
  https://lore.kernel.org/xen-devel/bce5e07c-eee7-481b-a833-4d5d8bbce78f@gm=
ail.com/

Changes in V4:
- no changes

Changes in V3:
- introduced this patch
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..31b4ded444 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -29,6 +29,8 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
=20
  - On Arm:
     - Ability to enable stack protector
+    - GICv3.1 eSPI (Extended Shared Peripheral Interrupts) support for Xen
+      and guest domains.
=20
 ### Removed
  - On x86:
--=20
2.34.1

