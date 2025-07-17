Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C54FB08889
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 10:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046439.1416780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKOw-0001l0-Ol; Thu, 17 Jul 2025 08:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046439.1416780; Thu, 17 Jul 2025 08:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKOw-0001jI-K4; Thu, 17 Jul 2025 08:55:38 +0000
Received: by outflank-mailman (input) for mailman id 1046439;
 Thu, 17 Jul 2025 08:55:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XlL5=Z6=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ucKOv-0000qS-FD
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 08:55:37 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdaba98b-62eb-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 10:55:35 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB7076.eurprd03.prod.outlook.com (2603:10a6:20b:281::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Thu, 17 Jul
 2025 08:55:33 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Thu, 17 Jul 2025
 08:55:33 +0000
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
X-Inumbo-ID: cdaba98b-62eb-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7BzrjTY1psQWJ6FrjVHiScwzfZnb68AqBfwtbxDQK7u7FWPME7U0ETMOQ2K/yJ+S2nDOlk7gzErQ0yzdV70tomXy6FZovXRN7t4FikfxTCVtgq+V4cqI1SCJAjtf6R+mtFDJ0TB1z7LLT+fRbNM+RM96+XWKm4yNIEVVOy6XZ1LGFcYQZFZamFLb0KiVlpCauceDikHW4oqL5HdC+R1rPYQj/NTy/py3ozop1XsKv1oR3X2s7oGje1Zco3Kxbm4v0wpy7IO3H4BLgAyY0sFkZBQQuZT8s+rlq5e3R3usXCX0l67ziroNX1Ve2Tn7efL8kLq3OYMAjeDj88mC858GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBhXucYb7qgcTr1ZdGsZyLMDM1M2o6rlgKy1CAt15+0=;
 b=nkq5KEuGlTHGO4oEfgpAyCWcsodaWccW2oYqorOfPCtbkTaT8D1fSfoQeEVT45vqa/5Sw3xP3vq1u/Y2fybkb+ikZ66+lFKFPVAVsAD4XRT7ymga1+iQXTxw1ZFp/tnrrcOd37RuTxIuV4hwzCyLmZSzz1LjF2UYT6al15fXAnZsEesb8aE/U5+KwNyADgj0U+5zLUfF8EpxByaPI0c63Uz+7GNiDacvq3/AwqzUm6bcRUBHiKUHIDhdc/mwFvCaTYO27cimILqXDHGdEGa/zXzquIoRQA1Vgygj++VhdOgUs7YnI80aydZ1MT/aED1Fu/j+3g2/Pg9tqcCoS4SIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBhXucYb7qgcTr1ZdGsZyLMDM1M2o6rlgKy1CAt15+0=;
 b=EcDFegfowBDkub8Cz9UNFsjuF7pqU3T7Nc5dq5d1AFkZzFTUstr9mKTz7eRoTUVbO6tLadIDx9LLVrH+tbmdMMfhuIMvn+K5QMr/9ZaRhVk5z/PgsRIl+hz8DBbFgJWaodYeVnw285LLTh4LC7FLR2YACiwKXr5DhF9Xm2nhqD2qaSTCt01unBr3DwfAbjTqBcueL7V1Bf78SibgBSdBFc28fHcKqMusCmY+zX1lN3jqKPqYQ0IIHk4DRCdkDgSDkrEEHXdzfUW1aBAJtDK/erXzxa2PWEpea1nF7n2Xyk6z/KpFjtkCr3pZQyY5+wysXchcZJyqL2SE4lQrJ1Vxxg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Dmytro Prokopchuk1
	<dmytro_prokopchuk1@epam.com>
Subject: [PATCH v2] misra: tailor the definition of Rule 12.2 to C standard
 types
Thread-Topic: [PATCH v2] misra: tailor the definition of Rule 12.2 to C
 standard types
Thread-Index: AQHb9viNL5XnNBRP9kGTDIT2uXOcAw==
Date: Thu, 17 Jul 2025 08:55:33 +0000
Message-ID:
 <195fd80d047d1533b5dae2b9922cd7aa4baf3913.1752741869.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB7076:EE_
x-ms-office365-filtering-correlation-id: 49ebb85e-2a79-49c3-ed3b-08ddc50fb06d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?OQTSbubj3kJg0wHe9JQPbdDxk98LLI9TdbIH1awo5a1rLQsdJEgdfVaTm8?=
 =?iso-8859-1?Q?Sb7uCQQc2yTd8H00u566PCPE07lHfP5TqS4/86NKk5xih0nu+OsuAVqzXI?=
 =?iso-8859-1?Q?txeh2KW7boR8KSEnaNwpOpiFlvjvc7rBFmo2lIuHA59qCP//Y3VJpnZJDy?=
 =?iso-8859-1?Q?XZUmu7LgE6HWyThTK1LId1NPxtH/srBNTTe4ANlL/aLevtOEm4m3Hc2Qzg?=
 =?iso-8859-1?Q?H18MiaxQOEITWFW/YBoianOV5boY0UE2KgvQHolh+vqRIfE4aHKcmuhg5y?=
 =?iso-8859-1?Q?asq1FbwLjy5QeqG6ceiq8Jdcy1nQ3YLFvSMisGtHy8fuA57Q1RUKE9c6G2?=
 =?iso-8859-1?Q?ni09p587g9lpzBE6FvpupubabGANX+uTipEBMdDb3mdVqF+OxWaTgxeBpG?=
 =?iso-8859-1?Q?q0YMPImNW2kQRywIMYCOffmIi2CmIDbANXMLdgdRV7B/NNGcD/roE3/Fsj?=
 =?iso-8859-1?Q?2Ku9bId9ZRgfKONyGMV1mFNwU3O6GPWzsC7tdIrpZT6n14CcC7LISq+nGf?=
 =?iso-8859-1?Q?uhq9y6g4+9hP1sYFZCrqXU1q9UZp16hiJh794h6qemgPl0oCd/eir4ZWdt?=
 =?iso-8859-1?Q?AoOpUbPwONMjcJRYz8XBO6eFgMoQXAG3lz8RIC/yDCv0J0k14l55UkU+az?=
 =?iso-8859-1?Q?NVFQ2u6D2kmiDvolw8Eb+cGnaVqiCO7lsqBSb8445F8+icAUMtf96dKeTJ?=
 =?iso-8859-1?Q?c618SQu5rAzAZroOZSSRONQFrkpO+Rxqzv1fh/rFDSHMQcxiWNsiHg3LPl?=
 =?iso-8859-1?Q?xUESUn+iGEEvIrz0IRun67f9QiD9TJ61u509JaueJoMf6q2ROB+DUpdLFn?=
 =?iso-8859-1?Q?396EQnVkWPcQCboSqHEDORd+Jxw01jGvRYuzWV8XeFvmsA5AOV/uQC3IJB?=
 =?iso-8859-1?Q?j0KDgn26zEtVgQt7MFqcJuy/ou08E9BUaQQD9zXlbIXskT0HC3owLuWYdO?=
 =?iso-8859-1?Q?V3WvhSHoE2+gpMFtWoYK0Tqxu1oeahcEHDyTj6BOquNA2koMRLyXwpmNve?=
 =?iso-8859-1?Q?mcPTk0TBPXHl+gHCQ4EGX5XVIL3IrZxIJlxjAEpZksLDguvY+4on8Po/Mt?=
 =?iso-8859-1?Q?t73SFT8JNQ2faQ06Clmn4aNedYoYqGddFrCxdxPhcnLj3ZK8HA9FPKPcPn?=
 =?iso-8859-1?Q?AhyI2DZN3eR/T6WXxFbau82wSZOd11mntiTPZUKnURqyhV9sGA72lXpdnK?=
 =?iso-8859-1?Q?ng6Lrf3BiDlWwAF6alrtCAuI533zaGE4W0QgqVkUZv7rwoYFZLvdUgg4Yb?=
 =?iso-8859-1?Q?cGO3pAFeqwBWpDzRtHGHvd6UdetbQuQ9f0MzmFY42i2oFARlI0lkaACndN?=
 =?iso-8859-1?Q?L1fvcQZ4exvaYZDW9yC1kubmLuiITkcU5Qe1rEb6LpHONZZng3ZFTLAvni?=
 =?iso-8859-1?Q?uY6tY3KSfOIdPPWJ5mb6Ol/OmwkY1pNaqbZ02Y4sljch4ONRwO2C2e68ig?=
 =?iso-8859-1?Q?pR58uIDlHUj6B0KVoAvsbXltGqJ74KLfp72gEPXa+C00GAdNUQ8xZZgPhU?=
 =?iso-8859-1?Q?NW5wRRSJgYJVQmoKJ2039BBD0x3poOKMr9q3itRo5Llw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?M1pA2lxMuM64rEx+YIopVZGxX6XdWk1JtVLjEHOFjty4FtEkxgTFt/dlpw?=
 =?iso-8859-1?Q?Yb9MpoMqEfrbThwzsLt8vG+AW2hrPIbORWJu3MkORip/J/4jOH6plAqfsX?=
 =?iso-8859-1?Q?4+HpNsyo5y9XRxZhjCh8mTji8UfEgNQved3hMs4cdI/wurq8mQj0n1sLwj?=
 =?iso-8859-1?Q?JqAsbpPo+B/2niqvRj2kybGrt/Q7tNCxAmNLt71eTKMP0I9Wv1XN26V8g2?=
 =?iso-8859-1?Q?gunQHhzwugWV6bWeR4DYJT8gaFfciGm8FbhiJWaRgqh2EjYjI8bNuwra3f?=
 =?iso-8859-1?Q?sLMfF0QPb+lzgr96Nnw4fgCUl4Wu6uMz6S+T8/xhmLYPv86iwuJuuW1rMr?=
 =?iso-8859-1?Q?Q2tqezPBRiIT4qmB5ARcQjjpiLoXOGgp4W3kKslIY0opCpfg4vY/uPyajP?=
 =?iso-8859-1?Q?/FM0pJySGOarDiXToMUWw7TxBQ5qDGdNQNF5s/MtIa1RtP6If5x/CCuIUC?=
 =?iso-8859-1?Q?hGzU/Rgut+nQIIEbHcx6sjV9OxaYzaAnleRMXWVkdpYKptDSsA0T7YIFHO?=
 =?iso-8859-1?Q?ZaOYGl1rhfwTwFYXKhz8MD9+8amUML8UrDqARoU4Wm0cc7DW0fgw6H3ndf?=
 =?iso-8859-1?Q?BrQ6bU5VzHOJHOx5lTqSqDUsGXdrjbXK5HVT8/JEUMK4x+MG7nBP4E/AOa?=
 =?iso-8859-1?Q?tLuXeavd1hi/N79Ck1tKZGMP7D+cDsMR6bkt5i0bw8TF4qPI2snTmqf8mL?=
 =?iso-8859-1?Q?7TovhSQ0wFg6LbGRY/1ChnLgrZ2AohnY9YCIVsmUlBPJ/Nx6V3s4NGH796?=
 =?iso-8859-1?Q?900rmtm0jzNZn1QiQGnP3np2ZzHwisS6GM/0Zc253Z7RCJ6pNvUNbCfJxP?=
 =?iso-8859-1?Q?ffuMLPfvrJepbHsPOBGGNZUC8RvuB8b9RwIECdHmOVhOVhFpcFk63eGJcj?=
 =?iso-8859-1?Q?L49Zyrbl2nd23MBPw7YPcKWJJe27t61l12IQ9NNsMJvToZxFGyEl+onoFy?=
 =?iso-8859-1?Q?32UsUUxfCCnnxESbplTEpF3iHkrddBjG2Ggy6aWDvNLh4q8OLZJ8t7ja1e?=
 =?iso-8859-1?Q?WoJurccW3aLDybmFU7BxaqIXf+E6XmX35jei6rxdL+bZIFcyorHuRxHG+7?=
 =?iso-8859-1?Q?VoHt+RdaoCeULv7NVa6xwnaEWk2li+hX4w0ZXBQANIcsClHP9xyHVTr1v8?=
 =?iso-8859-1?Q?yVJZKxONJnxL7CCAZ6Z6+0T2916IFZepHHlJXdnwki8b6/ZB8UqRAbTT0w?=
 =?iso-8859-1?Q?6K7Ly5EDkgpV5h4zt8Uy89wKlI9b+BA0bzen6O+/v3odaNYHScoKIXuD0/?=
 =?iso-8859-1?Q?+rV+EZqTeu1JM4Pwq6hUpKXGPFOpb+R0/bCJ/gKjAIW9qLved0e5XMuun0?=
 =?iso-8859-1?Q?DAkINerHnxICjEhK5eZk5BLKvzYTUS5wqaTHHHNvJI0Da1esOmDduLcJ1o?=
 =?iso-8859-1?Q?5zKp0FOYbDkvJBrTSwljDeyUS4qjGBuiixFqKE2vf8yPoJiED9sE3CONbz?=
 =?iso-8859-1?Q?l67UWMTEPEynoQDcI5XZfgx8z3ptSskaaXNghYKe7UdiBI/hexJCi3v3v9?=
 =?iso-8859-1?Q?3ajBxNABV+F7vVRZt5TpssymOjtMDX6v04hel06yGgYZ0u0Q3rfgZmGilF?=
 =?iso-8859-1?Q?n3cxzQLS2jV99YZ237oagYFsON3+d5qaVF3mo0Yi69csMaInuJ7E4AMRfF?=
 =?iso-8859-1?Q?t3TnhjwJF6J7hJPDoDW9DHcwRxZPlzLoFpoBxiJ5p09qWTpNCyrroV0Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ebb85e-2a79-49c3-ed3b-08ddc50fb06d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 08:55:33.0837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 93kutCV1WxCHDjwKg3wsmST2BbnZhJDcEwkNeFvwPRVmMzUwl6tGsZjyAaMC/L9t5VcQMNmiZ2V5oCh1UI0AaXzunLv+fARq21+YuOw88cY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7076

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

The definition of MISRA C Rule 12.2 ("The right hand operand of a shift
operator shall lie in the range zero to one less than the width in bits
of the essential type of the left hand operand") is concerned with the
essential type of an expression, while the C Undefined Behaviour is
related to C standard types, which may be wider but not narrower than
the MISRA C essential type. For this reason, it is safe to consider the
C standard type, rather than the essential type when checking the rule.

To avoid regressions, tag the rule as clean and add it to the
monitored set.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v1:
- added tags
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
 automation/eclair_analysis/ECLAIR/monitored.ecl  | 1 +
 automation/eclair_analysis/ECLAIR/tagging.ecl    | 1 +
 docs/misra/deviations.rst                        | 8 ++++++++
 4 files changed, 18 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 8504e850c1..483507e7b9 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -413,6 +413,14 @@ write or not"
 }
 -doc_end
=20
+#
+# Series 12
+#
+
+-doc_begin=3D"Consider the C standard type instead of the essential type f=
or the purposes of determining the width in bits of the operand."
+-config=3DMC3A2.R12.2,out_of_bounds=3Dnegative_or_too_big_for_type
+-doc_end
+
 #
 # Series 13
 #
diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/e=
clair_analysis/ECLAIR/monitored.ecl
index e2ad224d79..00bff9edbe 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -48,6 +48,7 @@
 -enable=3DMC3A2.R11.7
 -enable=3DMC3A2.R11.8
 -enable=3DMC3A2.R11.9
+-enable=3DMC3A2.R12.2
 -enable=3DMC3A2.R12.5
 -enable=3DMC3A2.R13.1
 -enable=3DMC3A2.R13.2
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/ecl=
air_analysis/ECLAIR/tagging.ecl
index f39beced9b..879485b680 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -63,6 +63,7 @@ MC3A2.R11.2||
 MC3A2.R11.6||
 MC3A2.R11.7||
 MC3A2.R11.9||
+MC3A2.R12.2||
 MC3A2.R12.5||
 MC3A2.R13.2||
 MC3A2.R13.6||
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 620e97f0bd..e78179fcb8 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -386,6 +386,14 @@ Deviations related to MISRA C:2012 Rules:
        integers for this purpose is allowed.
      - Tagged as `deliberate` for ECLAIR.
=20
+   * - R12.2
+     - The width in bits of the C standard type is considered instead of
+       the width of the essential type of the left-hand operand of a shift
+       operator. This is safe because the occurrence of Undefined Behavior
+       only relates to the width of the C standard type, which is possibly
+       wider than its essential type.
+     - Project-wide deviation.
+
    * - R13.5
      - All developers and reviewers can be safely assumed to be well aware=
 of
        the short-circuit evaluation strategy for logical operators.
--=20
2.43.0

