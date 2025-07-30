Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A81B16241
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 16:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064037.1429782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh7SE-0001x2-7y; Wed, 30 Jul 2025 14:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064037.1429782; Wed, 30 Jul 2025 14:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh7SE-0001v0-4r; Wed, 30 Jul 2025 14:06:50 +0000
Received: by outflank-mailman (input) for mailman id 1064037;
 Wed, 30 Jul 2025 14:06:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6hfZ=2L=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uh7SC-0001uu-OE
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 14:06:48 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bbd7c80-6d4e-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 16:06:43 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PA3PR03MB10987.eurprd03.prod.outlook.com (2603:10a6:102:4b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 14:06:41 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Wed, 30 Jul 2025
 14:06:40 +0000
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
X-Inumbo-ID: 6bbd7c80-6d4e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRVcji8JoBtY6Ns6aBLWwHuUZ4an7cOfZDvKQAxurGKGgAJ7U+IiFQa9iMY+9ForcAASHYEKp+f50Wkwn0dUxYLpR6AbnTjBErsAXm2U2mc/L50pa9JSGpYvFoGPi+8dkfU3lsFdzk4ohH0K5HO/yATqR7wXdh8SFphi3FuseQj+2tsdikttGvIAWQ+T6mJc+7poapIWsXNmVhwVzn+FY7kHqWreJmrfelSF3Qyry3K5yFUaJXk0kac+lTehWzKhyUkDQ5bkJOjARypCMP+3Smyazl+go+Gj+lKxZPwt8RBt2GXEA6LG19xQooukl/9f8vkNlx2TfSyMSFvv5A6BaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9pVFRN3tJeSeQJLTWqF2f9Yu8yMxBsg6un1UDXG5dw=;
 b=x6PgT0ix5gsE8NwMYuUK1CvzA67aZmZV3My9Kei0aUCXY7yKy5p24Kof7mfS0Xiv06tyJxoS5lN9kafowsBzwJUDAMN3+wMwKmkvbiiTFgCIQ0WziMufZWt7P7rStTZWtQ+t9lXFlcRl03UgPAkj1NmcGqoAVFxtywiiikitKd11lZIftFtVWaaq/3Bz4ug9f1UfN8n2gJFmph5dSSFtR5ZKvM32hmJJWbrZmqe10rpBLcOrgSAf9O0pOWZXkgP8ZhWErfmVsqBG6CQystzD2OSaEfauUKp5rso+b8dtm3hlnwcA2H5XpWfgcsWhyhR0//qFuz2Ts5ecGdbMYjLI/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9pVFRN3tJeSeQJLTWqF2f9Yu8yMxBsg6un1UDXG5dw=;
 b=DLS8pXp4dCHyYApwlf6UbMn+VWDX8SOiTX6BmS5z9esXKWOak/JqmSnvvohbRGWmx8CFnQLFgo6W+nUR5C0nLnYmOj6cSYz9VdnxQQghPfWQ47KFrYOiyhln1vtxSCe1ZeyFJljM0oDD4BvW4vfoAg1oAtrkKJ0MdHQWXjETUtu4cSMDnVH47N3ksn4Ik/4vyDodwRet9dOJG9xTLq9WV6Ugtb4S/5rur7zbU3x64WFzo/U9suPoQGXRcqxZj2tvWM0T9it2cvHc12Vh8vUM/OdqC04Mzp7mNzCogYPosAfzFz7smfskWjpKwK7VLYeHMwm94Ocv6wE6c/c/P9nW3Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Dmytro Prokopchuk1
	<dmytro_prokopchuk1@epam.com>
Subject: [PATCH] automation/eclair: deviate intentionally unreachable code
Thread-Topic: [PATCH] automation/eclair: deviate intentionally unreachable
 code
Thread-Index: AQHcAVss8EFecYrbzEuwp3GEEH5uyQ==
Date: Wed, 30 Jul 2025 14:06:40 +0000
Message-ID:
 <e699179c079df36f6cb4fdc7865a73cb9fe79f8c.1753881652.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PA3PR03MB10987:EE_
x-ms-office365-filtering-correlation-id: b0f0d2da-818a-40dc-5084-08ddcf724ea9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|42112799006|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?PenkVm/EVBjq1LQEUALLYbhtjZ0y3jxFdVQ5jMb+3fgrVGFbpMZjRAtHrP?=
 =?iso-8859-1?Q?ELOoptNK14DBwwxEaocMwpDbDlMqrlFf/al8mxAj4Bk9PR/hkb3WeMwxCR?=
 =?iso-8859-1?Q?h3w0iyiJZ0NmeQnUN1eRmFyFUYh5zUi1Fbj6k2KW9cHAnvqxgWIWazg0oj?=
 =?iso-8859-1?Q?AHs8a+Vwc7muKK6oKWodpERULsyrySyZr4AoaJzoQ5vG71uL353f2L+XkE?=
 =?iso-8859-1?Q?iClyR8T3pGiGMEjGULBRAk8vVEe1wf0Vouwene7C+fR2446Yse+6Ue9az6?=
 =?iso-8859-1?Q?t5iRjKL7i3m71qcZC4zyGLIkyZ4/8So6Gedrt/6oMZQijzr+llNPLZXXAM?=
 =?iso-8859-1?Q?Q8Aq33w7GaPKiocSwyVOQ4gqegVq9mVuZCYcvZwgciTL0QmNi1ZHda77M+?=
 =?iso-8859-1?Q?cCdM6yuZb2m+L4jdli1bMoFAEjVhczNjFbOVb3LphbrgiFtHkpbOeqwpSe?=
 =?iso-8859-1?Q?9fQFAY+sTQ+s4P5fwYS5HaeXbRyHrEFf5c76vZT7kn+cS8nDVSVpg37/lK?=
 =?iso-8859-1?Q?XvNQ9o2x+5+NcoDsjodHXeYaFF7M6YR3faGYm5sMnWaS4oDZO9z+2qf42p?=
 =?iso-8859-1?Q?7rhKMoSbcMO2mEt4slzbKCgjbA9jivqAQxaiMFEhjJg6yWRnBFjTDKHtnp?=
 =?iso-8859-1?Q?/N/yq1CbQEN51JNZJl/Q1WizWCdgWzZh1ZmdHKQfQ6eSYIdD7zDg7yJGEc?=
 =?iso-8859-1?Q?sWETJd5sAa0S76io8OM3fELoZr4E9iGa1yH1R17Ql+wCDH/xcHWFhinaNf?=
 =?iso-8859-1?Q?VsVjtAmZSEQIz1SWye2i0NOvHzp96xyaEOtG/+EijR2ljldkb4gbAQgytN?=
 =?iso-8859-1?Q?kJuNkcTmCjhrms1gKAhw3gzZISgWTKU59HRltZPcIKIzup4quMFHYoRVMH?=
 =?iso-8859-1?Q?Raac5b8wPDRKI91Ebb7sn8dfTySmYTAMmQSJYMAq38PZyZKORUAk5KOMhc?=
 =?iso-8859-1?Q?MWb9F2DTXzYXXy5hqfJKPT2x6AoZIxceSsn3HFwX8fwrpSAEC2IPMcnsx5?=
 =?iso-8859-1?Q?IId4Grj12mAO80qBZ5DAxb4IDJ2P9j8Rt8jSpZnP7tQoFjGc/lrnkuXW08?=
 =?iso-8859-1?Q?C2eUf+6AbI0amyG6zzNt2/Q8nP+RPdaNXmZ+yyMiKqdu/96OKMrHyxL7g4?=
 =?iso-8859-1?Q?I3cK7DKn+iSnWiEqlg1LJJ3KyBDvv4BLf2hAZf9eajCsDt/eABvUjchros?=
 =?iso-8859-1?Q?EPqXIGDxMuas8Dk5QTqSDiqpY1p84CB+nMRFnCugNZ7B0gwkskD9iWtq0x?=
 =?iso-8859-1?Q?s5ouKP3l94LFWkj50BWFFf/nIyrxaDQ2S2vxHYk8dbOA+ciQK6cAGrXUCW?=
 =?iso-8859-1?Q?Jgv1sTl9WdBfouEM18KKZL16RY/b1sGPFX0B8t/MkEz0qWlOY0kBUyqogH?=
 =?iso-8859-1?Q?dT5sQ9Y9eKM7q9JwTmBfvkzrG41atPZnLvj3AUJuThNIgcG4qIx37i2Vl1?=
 =?iso-8859-1?Q?EiEX0zzWvSmR5HZZrl+s7So9Ig/jTo41tlVDcQL4yzAn9W7VqIfdtpRQiC?=
 =?iso-8859-1?Q?QKBzrjhcJLolr4H4PkIUwizQW4BjzLPoxCK+BlGbSVLlP2lvyIyp6+QfZx?=
 =?iso-8859-1?Q?lLAu4UM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(42112799006)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3wFsccirm67kV2XO+AfWgRxs/+rHxYXjsinrxzEeyE6WGPVlTaRa9mXrwz?=
 =?iso-8859-1?Q?E5jJSImuW5BA2Jaf0RYIuBNYvcYY1sek3BWTkJoH0MfU8ENlbBSMUSANSz?=
 =?iso-8859-1?Q?oSd2uikuxyHrkqBa5IpMf4lnBSQBMu7HxnwQD/S8s3g+jUbeJ9fO8tyfM5?=
 =?iso-8859-1?Q?UWDTYD/5geKnB0wgnCMuMpnPSqCtC9hwuacqlTlKFR4QB2I5nN4jb7WJ1Y?=
 =?iso-8859-1?Q?taPx7ErlFEGPffJxKo26qhmTWzkbcNIhC+uUqHtgzxUcNUVM7EKMkqMjF1?=
 =?iso-8859-1?Q?8wCpw3C+UESyfwb9BgmolTELX6rhkaxgSKaYj/Py1+qvNR4mJ7mN2gNeJ7?=
 =?iso-8859-1?Q?rMmG/zp+g/sAKLSjLq1TZ8BFWCz91Gj+/K1zaGDCVL0ZqtT953aawxOVea?=
 =?iso-8859-1?Q?DWDPTwKQmg+vHcsHFAz2gVwRimrUBgQyGTjFI1C4gD0C8Xi7e4jaF00JoD?=
 =?iso-8859-1?Q?mARk3yIMyivF8TYqeAq/IFNJeCPVU1th8TRJPFmi4/OdNwV2bFBeH1lg4r?=
 =?iso-8859-1?Q?/r3ltSkayEl+YjewxWXSCok+rcckMrfKJZMG5ZcfjPZs85A0xZ0L6r/c+j?=
 =?iso-8859-1?Q?7A33GdETXPHf6yFdA+Uo3I7arejUBA/eKB4qAeo4Lr9s3zE+myoCGlf51I?=
 =?iso-8859-1?Q?FL9ON32QgGWXHPr5LeDRzxx8dCLgutkmgMH1l7f2mMBFeJtTejwcsFjsdt?=
 =?iso-8859-1?Q?XRGl6pH+uSHKbTG3RpxNXs7J2aABFJPAflmWx2tAtZAn+dDOHGIzcuyaTw?=
 =?iso-8859-1?Q?1MYwKUP4uyQsv5LKVfmPSTYrsxpdSvSiAoPqcAawe4zqjeJXnyU6NnmeIO?=
 =?iso-8859-1?Q?kGWFUoPlB9xLFvh/tzZViVMebg3Kn9yI6E0kxCVa17MVWOQE87CLfnqQcK?=
 =?iso-8859-1?Q?cXKoPBr2H9EiDcsDN3ULpIJkfVfFYqLDoebnb+o9ON8sYF7PNN5VUw1mMh?=
 =?iso-8859-1?Q?FWo2uZ8m7xHkkJRBUt4iMHNVKF6ZrEYdibWp44rNf3HES06/wUMeG/6LH2?=
 =?iso-8859-1?Q?VmMIb62Nhj4vNMx0N4UxlgsIyezpBJZpgrERRY80sWH9PMPHkzlmbH1OJ9?=
 =?iso-8859-1?Q?uE/UWWNVDrcbslILFbbPrv6ghZHLuNblpQprCW8oZoJWtk4zC9/qkw0PzQ?=
 =?iso-8859-1?Q?6RusQiA3aGGrkhkA7EX1u9Cg2otPe0RrEZxWxLxqfDEvUclmuqFtHsTIPF?=
 =?iso-8859-1?Q?4DuvKag4q85Kr1KiFgOQITv0zLXnlvIYnNKMpBbdW8SeDdbkuPojUBvZ2A?=
 =?iso-8859-1?Q?BHCCfiYgSBSR7jqBSfBtB3Zdg2k/tyv9+mmyXNORhrM7swHT88SoM66HXb?=
 =?iso-8859-1?Q?3Cjj91rDIdb6dR1IbIsCMwiksGH3EqWEmbylsxg1B/P9RT2Pn00XsDGxTx?=
 =?iso-8859-1?Q?OmJ91+/HmP8brZGqoPPtlpxovaAkTeHvvhyc1RanrrxdpD6OCwOhyTagvb?=
 =?iso-8859-1?Q?80ycmPyHlGHIKt7GZsMxrcl2ZKiNeYycdVmQVw4fDICGXgV9lygKzV/3B1?=
 =?iso-8859-1?Q?do2zvDFZGQre5jqPdv50gVmS7tk+UAleVsE+VlC6a+QhGe2QtgE6uLw3TW?=
 =?iso-8859-1?Q?dopO7iQSCMIt553YIBVDMf0002gczVf3csA6nzyYPlFZVje/tJ+Ntaeo60?=
 =?iso-8859-1?Q?2Du6cHKGwFghTT4HNqlNHwxk5m+Dke7kxK1+0/EqEhJ3RAoK2X+wm8bg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f0d2da-818a-40dc-5084-08ddcf724ea9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 14:06:40.9058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9qPiJhkgprIyx0P+cG3XXn9+bpFjArHoFcllhxGuweZUvwTAAn/nbKXZ8Z0IJYWaXR1b1h+HIEGa1vSF2DwRLqOhSsfnnQYtgEkJwHrming=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR03MB10987

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
Functions that are non-returning and are not explicitly annotated with
the `noreturn' attribute are considered a violation of this rule.

In certain cases, some functions might be non-returning in debug build
configuration (when `NDEBUG' is not defined), due to calls to
`__builtin_unreachable' in the expansion of the macro `ASSERT_UNREACHABLE()=
'.

Conversely, in non-debug (release) builds (when `NDEBUG' is defined),
the macro `ASSERT_UNREACHABLE()' expands to an empty construct
(`do { } while (0)'), which does not affect the execution flow.
This allows such functions to return normally in release builds,
avoiding unreachable code.

To account for that in debug build, the `noreturn` property of
`__builtin_unreachable` is overridden in the ECLAIR configuration
to deviate these violations.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1957211653
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
 docs/misra/deviations.rst                        | 8 ++++++++
 docs/misra/rules.rst                             | 9 +++++++++
 3 files changed, 22 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 483507e7b9..8a05e17dac 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -36,6 +36,11 @@ not executable, and therefore it is safe for them to be =
unreachable."
 -config=3DMC3A2.R2.1,reports+=3D{deliberate, "any_area(any_loc(file(C_runt=
ime_failures)))"}
 -doc_end
=20
+-doc_begin=3D"Calls to function `__builtin_unreachable' in the expansion o=
f macro
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
index e78179fcb8..fba75be2ee 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -86,6 +86,14 @@ Deviations related to MISRA C:2012 Rules:
        generate definitions for asm modules.
      - Tagged as `deliberate` for ECLAIR.
=20
+   * - R2.1
+     - Calls to the `__builtin_unreachable` function inside the expansion =
of
+       the `ASSERT_UNREACHABLE()` macro may cause a function to be marked =
as
+       non-returning. Since this only happens in debug configurations,
+       the `noreturn` property for `__builtin_unreachable` is overridden i=
n
+       these contexts, resulting in the absence of reports that do not hav=
e
+       an impact on safety, despite being true positives.
+
    * - R2.2
      - Proving compliance with respect to Rule 2.2 is generally impossible=
:
        see `<https://arxiv.org/abs/2212.13933>`_ for details. Moreover, pe=
er
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 3e014a6298..74badcb616 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -124,6 +124,15 @@ maintainers if you want to suggest a change.
            they are used to generate definitions for asm modules
          - Declarations without initializer are safe, as they are not
            executed
+         - Functions that are noreturn due to calls to `ASSERT_UNREACHABLE=
`
+           macro in debug build configurations are not reported as violati=
ons::
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

