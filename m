Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19DB17476
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065876.1431271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVg6-0003S2-9j; Thu, 31 Jul 2025 15:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065876.1431271; Thu, 31 Jul 2025 15:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVg5-0003Lq-SV; Thu, 31 Jul 2025 15:58:45 +0000
Received: by outflank-mailman (input) for mailman id 1065876;
 Thu, 31 Jul 2025 15:58:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GSHe=2M=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uhVg3-0001FB-KX
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:43 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38e50557-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:38 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU0PR03MB8912.eurprd03.prod.outlook.com (2603:10a6:10:476::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 15:58:36 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 15:58:36 +0000
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
X-Inumbo-ID: 38e50557-6e27-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZZMxQwVgH2diMXvINosi6JuQbk/vpEXW8FV1kB3kZM1kfBY4k/CO0nYjsidSZ8nZeGpIjHa3g6oOnDu8JWScb+QP8/tguMBdCE79nC3dTxz3qRAe9+jNccOV8/HIadZpX9T8jBjrJnPTcasfsM6wX/sLVmGUta5UKiA/iff/3Q0DJwKPw9bN3oq0yldPurlxzLYH0suJCj70nIJZSNtdTN6DVMWoZKaNvGwNLpbU4e7N/zFEc3rOd4Eos4LLySiKNzEL4SNfobEkqX5WUWNK1wroNHFER/wz/2Fh3f/bnfzYrn1oKAh/V0FXgPn3tv5hq1TsUo59HA9riwORMOvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9gz472QiKyvCTzTKwbjlfv/Nihk529fJm8T/Qe+nSc=;
 b=iujE0gU+duyv7wZ2jBYFqZA91FLUDgIp5MWhPZHqs5AIvDuhSNuk6njnuNs53+gA4o04ELlNLNMigJg1L+EtglFDiBjFOUMs1do3kUWsqcz3bP0eWSkOnIOemkr2Pxq7a6n9/T4d6/mvfKGk81ydtkcOcFHuDOYs0696MkTRDqW6WbZTokuMGTuSwto6PXikhBFP4N69YkDa49CVNlQtn6lIZiFAcUJzJ8BGp7h8SbcqcLTRxwuTJ0S8AqPmFr+0pbNgPI8Zv+0rjhojZmyXlZ8Py85df+thtsf9dFsfNSdmo7heOS2KKu01HNYxURvwocvFslsVGtWZRdRP9pktLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9gz472QiKyvCTzTKwbjlfv/Nihk529fJm8T/Qe+nSc=;
 b=s6Jhs9Eve36fPJ13+uPpg1qjTTZN8sXFLpq06KS/gYFquBhK1PRZY2HqUhxLPXnH0UaivsMkYTRZDqwqYDyFwnicTKfmCba8VPJE+8RH7nf4efk5gBXxkO6VfWRYUL+r0EW/ghAtUS7v2hQPnjdAMZPHE5SvP0V6aPIkIy5cm0tkrhIYiILXY1kXilW48IkG5ci4UGpkndyBzc70qgcXDHlKO/KtjlXk0nbr+yXgWFzPo98Arhtp3LAh3bRn7d22wqGi081CValnX7HHn4kFA9LnUGdLtsQ43oBqVucP0yEemv884iTR3Hlm+ZCBstFBK/aZ3v8pWy4xUl91ZoRYBw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Dmytro Prokopchuk1
	<dmytro_prokopchuk1@epam.com>
Subject: [PATCH v3] misra: deviate intentionally unreachable code
Thread-Topic: [PATCH v3] misra: deviate intentionally unreachable code
Thread-Index: AQHcAjP5SP3sHW2Ih066MQex/T0sYA==
Date: Thu, 31 Jul 2025 15:58:35 +0000
Message-ID:
 <fcde5a987aba5f7a350128aff645631baeec6778.1753976981.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU0PR03MB8912:EE_
x-ms-office365-filtering-correlation-id: 4ce6e259-bf6c-4438-31ce-08ddd04b1b9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|7416014|376014|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hAlVuXv4/r/82XUdWkpEhlZtN8nIZqWzcLr/ZVOMSkT0cFAKY2Dl/uaSTo?=
 =?iso-8859-1?Q?FLoD8akdo+qD5dlW+RV1UXpEoz0cztkSN5lsR6yRpQ1Uoj8glXmw3bFW8z?=
 =?iso-8859-1?Q?NvXkt2t9x3lZemPUxMP/mC/SWa93G5QFPQbbCtRbrQ06Ot7CXNWJCcDcAB?=
 =?iso-8859-1?Q?Fx5Y8sCZe7hp9to7yAQYJf3REXOMYKFmGhWtpr+1toYsNt/3RnVxPgN/za?=
 =?iso-8859-1?Q?2vF5ZLF9+jXhfii1pCRu8wd3H512dsdWILpqmUaMvN0k5zQ1yvy5FvtCQ1?=
 =?iso-8859-1?Q?vtucf+31GkRH91E9zmpk4JVqCZJWSeVeDKYbnd2rg05hX+ytq3wpMgihlC?=
 =?iso-8859-1?Q?5lTHo9zjocxDSV4GfLyLhMqA3o3cUhYwlGeO3jIlk9mdqgXM6GOVSljGGr?=
 =?iso-8859-1?Q?3NfkogZFsjkOHsoFmFcGDfY90X3FfafjmoAO8i34tuoLEtw23XAEABsE+U?=
 =?iso-8859-1?Q?85dT53i+6a/r8xXVLwovSptXoT/eiIub3AC+P5PAokM+hYkTjmHcSu3275?=
 =?iso-8859-1?Q?8t853D/lt/CAOmqi6gWcQiLM/Hqc80d54m7eLUP7M/kcl+HVwAXV44o8Bb?=
 =?iso-8859-1?Q?yg61Fv7H3ZusTSjMB2JoAyBBUSD6m9lzUUiK1lyFs1sjefNR60c09uihlb?=
 =?iso-8859-1?Q?pgdxTPF6hoIg4xQUtjEJJk3kDggkbUpMCVQL0/A9MrIhBg8AEpoPGSwEkG?=
 =?iso-8859-1?Q?JKNUI4YyYvaq3aqC65G+8ztmqK/bUkDKLW7rQwKI9BQdzbjaUlEeul1UTx?=
 =?iso-8859-1?Q?2MiCulzuSOyn64MY0mWOK48dNZZ7lvh2OQVwB5zUGMFg8xZQi/RjXE67ap?=
 =?iso-8859-1?Q?aLcHHMecMwhcmwYN5K3iFsjxw7EgkvwU7pkUq5qBhdRgnCIoH2YSdddu6r?=
 =?iso-8859-1?Q?Bitei6k78XDSbYmUEKzA+s0+MiR/Q0wptvY9Rn392AWreu60PenV+X2btc?=
 =?iso-8859-1?Q?WZwGRq6POj9a8LuCNAVP5cYLMfL4bsoIreg7TyEzyWmu+OS0Ck9tfyXU8q?=
 =?iso-8859-1?Q?3JhYUQRVEIXFZXw1LmjsXB3Phiccp6Z4rfksBgO+K6VSPcQ6Z+OchMpOEE?=
 =?iso-8859-1?Q?KB8DF3iqzGmb/m1BbpYlcPHZGrWAHum2YQTcUvs70XD15Sk+JIm6m71VTA?=
 =?iso-8859-1?Q?FIOQtm4aj3rzTdT4QTEFziR6mjq5voWZfUnehZHIuehRovduV58mQlt6js?=
 =?iso-8859-1?Q?o/OL5gRrrX0jwmfuR4f6jtGnbu0IQRbBiB5pR+t944YbSb16OT/YtU2U8E?=
 =?iso-8859-1?Q?HFbp8nDDIbQJKqk8g9+Dfqzff4HwFmhKUdgGAwAW3zVQRj3FkmvVVurCnq?=
 =?iso-8859-1?Q?TCfaCRG/bf29FsRYap96jobzUv35fcna8aVb2/HrBxaBG0vEL02xdyS/eW?=
 =?iso-8859-1?Q?RJ6yhcL4Qh5Xp7xWqfvVfeIJLMZ/kdmMy7I14KDhgYySlwk9EkQ0mceVC6?=
 =?iso-8859-1?Q?Nl1OlxFZIMoEwAUkFKpF4DgJnnG70kbCWO31YCcQlx3SZgQpvX4i6Pe1XL?=
 =?iso-8859-1?Q?c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(7416014)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ytYodi4PRETxFQEwm7q1kI6key5jtCc3NnK+3w57F3HviVt4ktrpzJUiwL?=
 =?iso-8859-1?Q?3HcelGyCml+NiPlqwGeHj8LxZUbB8fMFz8eyMtZw2mf3pHqDG4eixYiW1t?=
 =?iso-8859-1?Q?lkGj+77y7x+l7aekd0do8KgnQe6jSSF/ThmYq0WpAfA0gWcbc8E0T6ucBF?=
 =?iso-8859-1?Q?IsWVr0rCgQKdS1RX96M7o/bJDItSHknr1/3F5NXjehjhC7JlU9eerX0uUG?=
 =?iso-8859-1?Q?wx4U2XJk18cDOCZHyW6Azfp/oOmhuQjUtAt4sV3VRcMi6xs/Z4aEamj+VO?=
 =?iso-8859-1?Q?XDrhxv4/vao5UuuQKVtTx5phPla4VOo4aj46a5bod7uDfkgdRUhY5FuS8c?=
 =?iso-8859-1?Q?udjW/qKs5UUzDJrgSs7eYHEhvrGKExAQLn73YLr5iE1Kmdfgi5kOgMetlS?=
 =?iso-8859-1?Q?v3JvJt1XHYg3os+w9nPo4qHPMDQgPS+2ml93AZYmktsnhOSQp6Nd0tdZTf?=
 =?iso-8859-1?Q?X/kpr6ey1qXaJ1otKvsbladSqyYAOXbbjEie2+TYCxMiIMtohUs1N2Pf0j?=
 =?iso-8859-1?Q?kqIP/C0oBn6hw5CMUeVrcjqyb0UP8Z7f2yrx3ctzp5uZd8IZSCUTnCnwZv?=
 =?iso-8859-1?Q?+6UdpP7dFLjAZ9clvNuP/YEdysmuA+TyDD6KZBiyCqk0tFY+EzevNPsvPk?=
 =?iso-8859-1?Q?Aa82+ryEweO83CvKk6F74enAs8OeS2Lb6QTssdRMMZhzduueTe3ON5T1oS?=
 =?iso-8859-1?Q?0l6dKyGy0b1R6AWB/9wXDh25KpebgVjg1eCIpHolshxJO+gZIgKpf8jDnI?=
 =?iso-8859-1?Q?ZAk4pV1VGIq7TyXXTGXUil10bqBF739p/qrILVVcBaS1ixa2yxCwb147G2?=
 =?iso-8859-1?Q?EXduMCBxUX5jY9JDOqi6eoooCnKMhdfbHycOKbt0oqHromERffCd2Xq88H?=
 =?iso-8859-1?Q?imcXQyWKq0T5aDSDi1zctJnuldOIpaIHvyQxukB076yDGWXY76W+H9coE1?=
 =?iso-8859-1?Q?eJb3aD2rt8zZBUDtiqA+Lz0bZbB9z6S8imz0uWql4hAq+ea03sUSvrLZUT?=
 =?iso-8859-1?Q?GeeJLJWmkDzeFgifcgwOSeUmuBSQ7JsaqvQPGtlcx0yjcXB4Ju+y5s+wLn?=
 =?iso-8859-1?Q?ExzSaaHxIbvZxAGolBkq+t3NCd0Td47uheSCwbpSHPKzfYn3XZ4ex3Th33?=
 =?iso-8859-1?Q?tRhhAEZFTHhCmdeMl5U5KN6u/ahNRpniT7AlntfVLRl5B3Cb0aXAKtwF+0?=
 =?iso-8859-1?Q?vssFctUvZzcY6cZO8smz8YHiIFwi8LNo0AD+0KWDB7IqxR7AZlIMHvLr3k?=
 =?iso-8859-1?Q?lEB2Xi+WMV8PnKgpN3uUnYSZ5paKLxRo/br24TDu1LLQDtMEObQuwMmuLe?=
 =?iso-8859-1?Q?2imfI0Sf711I/tBv46/2afMoaqO5+IWZfW0PoCkdjlrCajsulTCT0xGaKh?=
 =?iso-8859-1?Q?YoFDNrqa5ACG5kAb+tYfp6v66qFF72CU/CASzNJD1GiUWILLUgEk2evs7F?=
 =?iso-8859-1?Q?dWn/wAidGBjP6qgOoTROsw1PsKS114pkCf6amOYjeje3wX8AHonk3Y4QqR?=
 =?iso-8859-1?Q?NTbMnMjcfeJLjGmrNYIY1rv3yKOct3W7cm7G0bD7fc1/pJDOOSPx9bCrxW?=
 =?iso-8859-1?Q?uM3ey8IUbUogGucYvpGvMNuTNedJSnbDyMLamBDG9+GesGLLxA9a552G4J?=
 =?iso-8859-1?Q?obDNjANpjzdyMcmjbdi7z9hkrmOO9+ukR9lWn2iWIFRDl5//8Z8EI/sQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce6e259-bf6c-4438-31ce-08ddd04b1b9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 15:58:36.0594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IDkQjktYRDhynDHhnSj67imHyPmB3l3kPFTvkRxF9xZmTeirUwLoFF/PqvIJxRq2BshxSZbv9c8JnkPPAYKSiO+RHjliC5nbKK+4Ak081lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8912

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
Functions that are non-returning and are not explicitly annotated with
the `noreturn' attribute are considered a violation of this rule.

In certain cases, some functions might be non-returning in specific build
configurations (when assertions are enabled, i.e., when `NDEBUG' is not
defined). This is due to calls to `__builtin_unreachable()' in the
expansion of the macro `ASSERT_UNREACHABLE()'.

Conversely, in builds where `NDEBUG' is defined (assertions are disabled),
the macro `ASSERT_UNREACHABLE()' expands to an empty construct
(`do { } while (0)'), which does not affect the execution flow. This allows
such functions to return normally in such builds, avoiding unreachable code=
.

To account for that in specific builds, the `noreturn` property of
`__builtin_unreachable()` is overridden in the ECLAIR configuration to
deviate these violations.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v3:
- in subject "automation/eclair" replaced with "misra" (to fit in 50 chars)
- fixed formatting (aligned length chars per line)
- "deemed as" replaced with "considered"

Link to v2:
https://patchew.org/Xen/6e47d071ffdb236642c1e9a70118a86d41487aa0.1753909082=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  5 +++++
 docs/misra/deviations.rst                        | 11 +++++++++++
 docs/misra/rules.rst                             |  9 +++++++++
 3 files changed, 25 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 483507e7b9..ceecd0093b 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -36,6 +36,11 @@ not executable, and therefore it is safe for them to be =
unreachable."
 -config=3DMC3A2.R2.1,reports+=3D{deliberate, "any_area(any_loc(file(C_runt=
ime_failures)))"}
 -doc_end
=20
+-doc_begin=3D"Calls to function `__builtin_unreachable()' in the expansion=
 of macro
+`ASSERT_UNREACHABLE()' are not considered to have the `noreturn' property.=
"
+-call_properties+=3D{"name(__builtin_unreachable)&&stmt(begin(any_exp(macr=
o(name(ASSERT_UNREACHABLE)))))", {"noreturn(false)"}}
+-doc_end
+
 -doc_begin=3D"Proving compliance with respect to Rule 2.2 is generally imp=
ossible:
 see https://arxiv.org/abs/2212.13933 for details. Moreover, peer review gi=
ves us
 confidence that no evidence of errors in the program's logic has been miss=
ed due
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index e78179fcb8..af7a17f96c 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -86,6 +86,17 @@ Deviations related to MISRA C:2012 Rules:
        generate definitions for asm modules.
      - Tagged as `deliberate` for ECLAIR.
=20
+   * - R2.1
+     - Calls to the `__builtin_unreachable()` function inside the expansio=
n of
+       the `ASSERT_UNREACHABLE()` macro may cause a function to be marked =
as
+       non-returning. This behavior occurs only in configurations where
+       assertions are enabled. To address this, the `noreturn` property fo=
r
+       `__builtin_unreachable()` is overridden in these contexts, resultin=
g in
+       the absence of reports that do not have an impact on safety, despit=
e
+       being true positives.
+       Xen expects developers to ensure code remains safe and reliable in =
builds,
+       even when debug-only assertions like `ASSERT_UNREACHABLE() are remo=
ved.
+
    * - R2.2
      - Proving compliance with respect to Rule 2.2 is generally impossible=
:
        see `<https://arxiv.org/abs/2212.13933>`_ for details. Moreover, pe=
er
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 3e014a6298..d9fd92160b 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -124,6 +124,15 @@ maintainers if you want to suggest a change.
            they are used to generate definitions for asm modules
          - Declarations without initializer are safe, as they are not
            executed
+         - Functions that are no-return due to calls to the `ASSERT_UNREAC=
HABLE()'
+           macro in debug build configurations are not considered violatio=
ns::
+
+              static inline bool
+              arch_vcpu_ioreq_completion(enum vio_completion completion)
+              {
+                  ASSERT_UNREACHABLE();
+                  return false;
+              }
=20
    * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_02_06.c>`_
      - Advisory
--=20
2.43.0

