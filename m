Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FAFBA145A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 21:56:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130796.1470188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1s4h-00049B-2S; Thu, 25 Sep 2025 19:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130796.1470188; Thu, 25 Sep 2025 19:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1s4g-00044m-TO; Thu, 25 Sep 2025 19:56:18 +0000
Received: by outflank-mailman (input) for mailman id 1130796;
 Thu, 25 Sep 2025 19:56:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jamk=4E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v1s4f-00041Q-Gz
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 19:56:17 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b24d7644-9a49-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 21:56:16 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DB4PR03MB8516.eurprd03.prod.outlook.com (2603:10a6:10:38f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 19:56:08 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 19:56:08 +0000
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
X-Inumbo-ID: b24d7644-9a49-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5CWZmKRBCU+KVzvIP+LEgFEu/CoEj3hLep2Gtc39MPc6UJz0GIj0Pi9bYjtZABzW9ObCNIpd68AJlhT9OfKa55qEG1UbH7E8nedDgy6BL4ExKLUNqPT9bCuer1wrFuUVIiZSzAakSqvggJB7PiXIMECgPDG0tz430JvX+/ToYNNZYwuZYZpQP5Lib7PVwdgBtI5uizzCNQJFtp/yMA9GRNrGUg8OJ3RpZLpsyA55XDY2A3N4jZkg6uUd6hZidwOsm6g2O2Mto5N0BeZuvSckHILVugRmvYHpnOjWN4L9gW762pca/+dU2ot/QdtgLp4rZRiDtr2Gm7mE2fjqCSNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY1u4Kifw0Qjg1VPQXbApa6JsxI2wU/3D2Mww3XVG9s=;
 b=frLOPQht0u//wncbDil7z0VI3v0yt5ePkuFd4PpImaBHU7EDKQdgskyJYFTNXtV0eLUfeHjdoZD+q5jj1AZnv88+T4R4JXbCHUAvPK7rr3lijKgDo/LeLFIY8/r/DH1wnHn25iGbK1KABVnJRESqXmE4qHmJ3ZT3voSBTUePnRh+Oukyj85Abw3ln4jPKEtrlzlmMeoLKb12ogB0wWs88NrZ8q5pjVpZ8UidVEpW19ao5spcvha0EWIW56p+7K+quIz2UtddKUuCvOzJyN5GxvVK1LaGlFjKGJQSx6He9hf3J+fqEJKwzjWo4qqUx1yqRgOgYX8g8DN2fKBbkmhLyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY1u4Kifw0Qjg1VPQXbApa6JsxI2wU/3D2Mww3XVG9s=;
 b=t9AwQGnAC+yv/0oxX4K4sO+Nyopk4vM/k+ivnrBLV7qDA1DtxPCona0RO86GUFW+V+GXVQhhL2Hc3tEIq/r9Ubb99GFuH/1WIq9jfScI88ev/5IfJ3l0o+2e+uvy+3FnYsxoS7dGiS0bjm9K2Aj6e6joa1nOkW0uYVGgZHllemgY7GlbmezRHJ9lfOrMk+8+2ZXnskaXSCGCRtCC9zKqWWEU2aVcAt/PHLCGfNuMlPBy4/qw5x81y1A6K71FOk2WDpvfFnBSowaR1R+kgvYlgAYViXdWFgzgMD0nH65YYsP2m/uYv/hPVY9X/LC70fpkvng+oXmT/aflPu5RIzc3FQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>
Subject: [XEN][PATCH] x86/hvm: mem_sharing: add dependency from
 CONFIG_INTEL_VMX
Thread-Topic: [XEN][PATCH] x86/hvm: mem_sharing: add dependency from
 CONFIG_INTEL_VMX
Thread-Index: AQHcLlZvmNyA5ChnWE+hK8ZrAp/wbA==
Date: Thu, 25 Sep 2025 19:56:07 +0000
Message-ID: <20250925195607.521021-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DB4PR03MB8516:EE_
x-ms-office365-filtering-correlation-id: 8234000b-a3f0-4ce0-53eb-08ddfc6d9197
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?C/sh87aSYktVYiuThsNSwy60DAFOaJJ7KiGU1NG1ttY7hp9vzXhngBBpS9?=
 =?iso-8859-1?Q?Qgw38i/nkDF2Mj51qE/UDsZbQAGF7MCLOJUGET7y2lcnwVY1QHPxUhSVJQ?=
 =?iso-8859-1?Q?Hba28Z4WdO7TdAdCVqhzKmMtdLKSIK11Ee8ei32EuDx0FgffA0YPXMScw2?=
 =?iso-8859-1?Q?PCGoS695SDQhOEe3dnq00vQnAC49k76It+WDVxwbxBV5jMQiWbU0a05CJ4?=
 =?iso-8859-1?Q?ns8IVngG1fVdPqbh6aYZQ7zmgmZMZlRkcti3IQn4hF2ZB802QU2w/cZhXd?=
 =?iso-8859-1?Q?WfVPKa8jLM8Z7ZQBVLIpYVBYUYZdwE0oYEnETiQeZNH+OAYmNVhS9EeLln?=
 =?iso-8859-1?Q?mY3hetzzXbVNtB/j58cizemLyzsIM26pQYlLtj0xsd1TvgZnlsk/wjBBta?=
 =?iso-8859-1?Q?CNelmCA5HAzo+PfYU6rOHwqJJgqGUCnUXkLI6cZumKDBTdz6Au/up0huxw?=
 =?iso-8859-1?Q?gtdazW9C3Yoq6/2xGaC1i07dCXHl734/c/6PfG+aJPZO2UroYaY1WdTnZf?=
 =?iso-8859-1?Q?3jHvwtAiJzJKhlJycPw6/5w8AZHDLHKB72bv7Zjne7gLdLBIpKRMfyEi1D?=
 =?iso-8859-1?Q?+J1hNDIgf0lGRtapfaaBjIwu5PoTmsJpLU6gTatzh2M9QACySky9EBqB71?=
 =?iso-8859-1?Q?mN2lHPxGLooXExAKbZsMAmzpGDVo01kObfWNV0CvYIzY0kPI6kjpr4iYYR?=
 =?iso-8859-1?Q?Nzq+HiM12XswuS2NY/BBF7bx0JSd1UINPOILpA6gQD9nNxHU7ns07MMqZ5?=
 =?iso-8859-1?Q?81eLi69UBtHPgTiMyAa7UftZSC5PURv2TPKIGqMC9RCfCQxa2/n+Oksfat?=
 =?iso-8859-1?Q?gYZe5GOqMv0XgW9dXVVGRxxRrp8Uys84JrXlGw4k6sUGMscADPOVWWXmvD?=
 =?iso-8859-1?Q?8uIst3UB/VfSs/sY0A+X+KqYlEtIMwEJb0GaoiQjOOybXMKS49PoDwsGOp?=
 =?iso-8859-1?Q?dTOXf6oJ9L0/t3+IXPnwCWswsyWOtKiAqG1WXB1IWvP0Px+fpr66EbS8We?=
 =?iso-8859-1?Q?Yu79ll/JNfmSvY+FwOM/mOR9OqGPkfvvsLYFHr0HS7tiud/SdL/RoKhgp1?=
 =?iso-8859-1?Q?q2UcBs7O2I3rXzQ2byQgtrMgG3dC7XwCcfuI94YzR3n7ujLhLFJ9crv8KO?=
 =?iso-8859-1?Q?YLyBaUOP5tCcQgu0gRJg85R7QGtViFv5MSFIQoQAzz5RjEkFkhZJLVkvpo?=
 =?iso-8859-1?Q?LIAPZzJchhdGKgpq37We/cBXeRKJkofoYNyeTZgcAe3YFCJ/G11HP8Srjw?=
 =?iso-8859-1?Q?Fbe3N+sKDyglhWHHiuv3QFFpgVcN7CyZoXpRChVcM0Fm8B3ayc93vFSXmX?=
 =?iso-8859-1?Q?2YJg7RaKgyYDJlrn9jDtdgATmMMogzSlneWXG+qWvpQDsejxU183kRC/V6?=
 =?iso-8859-1?Q?X3tohW0q1eqDmP8UUOOrlcYRH0gPbePLF52RD5VTXDDJiom45l4j/pZTIP?=
 =?iso-8859-1?Q?EVSh6EomGQCT0ntH3LxhiWIpaZF8sPSP7QjHLBL22PhOEIq0g5JbaAg2ly?=
 =?iso-8859-1?Q?/akHHImgK5SJriCquLahiQ+t0r1RRXcS5dC8SyVDrX4tlbO5KzIxOdzVpl?=
 =?iso-8859-1?Q?Hjxuc9jDCLnsTa3JL0rWb+a34L1L?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?INaILMXTRh5IfNtA4nb7b1XW3tQpxsdyY7P/3O0SvVGiTEqLzg/qNsVG6u?=
 =?iso-8859-1?Q?0rSXgMig0k4jDgMtzWX6pBR2FGA3SeySbfwXTerF6T00ctqHxWHYmPLKuJ?=
 =?iso-8859-1?Q?XtT6UfaMbaSwghFnDKXdgwAvni3fqVPJzlvCrUlb+Pz7MiOQE9ZGwD+hmc?=
 =?iso-8859-1?Q?E4AuvtEmU4reEMZH54el/NbGGWMZDI6UkQmNu8VCXgrkFSzP8Rm6pVlOl+?=
 =?iso-8859-1?Q?uJjWXaiXB8hQD3D5OPvo7moT1RQAFc/7mVEHhLGEOXzy60Py6xkDp7S9Ds?=
 =?iso-8859-1?Q?rKsB1QgT2CnU5tEdJyPYQtVRzIXa1ebTyMHhmL1EIDYQt1l/la0Jp8gDVV?=
 =?iso-8859-1?Q?xG99hM+b0Z7HFW0fQXQu2kTvTaMrb/WAE8sbYlcFxh4ebC+CjtLARd2kIF?=
 =?iso-8859-1?Q?leVjmOl0A4c68xQcOacWI5I7Eql9H5/UBQU4rwHEqTMMORFDrEAbN0iN6J?=
 =?iso-8859-1?Q?SXf1O+/SNNVj7WkL95EZuT1XX/uc+GBZaCktSmUv66Q6SerVP/1XtyODKK?=
 =?iso-8859-1?Q?1nT+7g1y0lmISjo5dgi3Ip8WjpymQKvstPZ3ygU2PBd3MWX4VU4q3S8zx9?=
 =?iso-8859-1?Q?VsmO007bSch5mbs6Ze8Vcoz79k7YmO9qJKriHhabJ9Vl8MTGpVhX9y/C75?=
 =?iso-8859-1?Q?ITtuARsAj7vqgGobFs0KeBTe1agFzpkalDf9VNWFJAm5fhuqFDvOKlsz3G?=
 =?iso-8859-1?Q?SUBr2GsuQZJTOUTcIdIut7ltb2T5xJdFGF1bnneRlYddPmuPyBvJ6acY4s?=
 =?iso-8859-1?Q?TzXmN1bmr1+SZRDkejRWAmO2GiC1AN7EXDFBCIr9IxChJRcAzrgm21o+Ia?=
 =?iso-8859-1?Q?cptqdwL8Ii2qo4Xt4dfLSTQgxjUaLLsr9zLahUEeXF7w2p4XxWNPv3SCN1?=
 =?iso-8859-1?Q?UU3rcdJy2kfPm9R62kAmT1GSReWN66RFmQIrcuYjfihw2Lh+AyL7fEyMbR?=
 =?iso-8859-1?Q?jc8dqnDsnw9OfIccLXWBIni8+WfajffMLNkJIooGYstxGih5chSSeAB0HV?=
 =?iso-8859-1?Q?97mCYt30e/2lRWC03NkefHh8vBxURviLBK5TLElKh6nWf9l4fLNnI2V2nJ?=
 =?iso-8859-1?Q?TMy+jgkaDNyIci1lqFNMDvX7VUNuarxXANNRbIUEL9WC85kzT/MKXmzeb5?=
 =?iso-8859-1?Q?h+UQ1ZUIFpWzk0n2fXqxMl1NrjuE8tTesP+96ndDpOgXqefrNn5jKm+BJG?=
 =?iso-8859-1?Q?1LyDj8d1iNO8438K7MVhjJbMCh1HCxP4qPwTidfvBRCGfW7ax7Lk4pAbvW?=
 =?iso-8859-1?Q?QxXMdol2iVPAKaVNLkAF/YqLd81dNWefSES5NB6q017V98oMLNqm3KDKew?=
 =?iso-8859-1?Q?fpL2IHsfOZkk45lKH1tAraeDHfH6lWyLevGltcU2I+jxm5rjCpg5DoLvpK?=
 =?iso-8859-1?Q?VTEIzBfVMlh7PMYZf8A4P7NZ8HOjlY3zO1T/V437Z9iBs5u8uBlcINMkTp?=
 =?iso-8859-1?Q?dz0d/s8hZkaRZHGFYqjOZEymCC2yV+4SNiPi862YRhNB5FhlhmQcQB3wty?=
 =?iso-8859-1?Q?NydRYhGCztWozKDSHWLFfZUVXFxEFMQsCgxqMNkry4OS8AYAKnpbMjk8dI?=
 =?iso-8859-1?Q?JqxXZ4W/7raO7KflyHoaMDANi1HG/sFaj2ySKa5O3azDYHVBxs9KVlOAFh?=
 =?iso-8859-1?Q?hjLm8yLbe8z4MGMxjnflxJrH8H2BLxOO0h7ER2Ha5OfpzOGpd8OcaBbA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8234000b-a3f0-4ce0-53eb-08ddfc6d9197
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 19:56:08.0378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nqhTKX+mwWE2qqK+ySkrbIIP6cwIQdNtdrjwjX3nt9ZvHK00Obj62OelPy5oEmmolnipLPvJ0NOAj6Q+3nPUj8GtGQykWUJqjqs7EAvAoqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8516

From: Grygorii Strashko <grygorii_strashko@epam.com>

According to the commit b66e28226dd9 ("x86/mem_sharing: gate enabling on
cpu_has_vmx") the Xen memory sharing support is only possible on platforms
with "Intel VT-x" (INTEL_VMX=3Dy) enabled.
The same commit is also added runtime check for "cpu_has_vmx" in
mem_sharing_control() which blocks access to XENMEM_sharing_ops if
!cpu_has_vmx.

Hence add dependency from INTEL_VMX for MEM_SHARING Kconfig option.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
It has took me a time (including digging deep in git history) to understand
presence of this dependency, so this patch. Hope it helps other people and =
they
will not need waste their time digging.

 xen/arch/x86/hvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index aed799fcb9c2..d62492d2043c 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -79,5 +79,6 @@ config MEM_PAGING
=20
 config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
+	depends on INTEL_VMX
=20
 endif
--=20
2.34.1

