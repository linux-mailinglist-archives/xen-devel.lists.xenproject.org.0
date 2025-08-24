Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83505B331AE
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 19:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092175.1448196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqEuG-0007d6-EH; Sun, 24 Aug 2025 17:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092175.1448196; Sun, 24 Aug 2025 17:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqEuG-0007aF-AS; Sun, 24 Aug 2025 17:53:28 +0000
Received: by outflank-mailman (input) for mailman id 1092175;
 Sun, 24 Aug 2025 17:53:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epLo=3E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqEuE-0007a9-DX
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 17:53:26 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a9d8a5d-8113-11f0-a32c-13f23c93f187;
 Sun, 24 Aug 2025 19:53:23 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DBBPR03MB7132.eurprd03.prod.outlook.com (2603:10a6:10:20f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 17:53:20 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Sun, 24 Aug 2025
 17:53:20 +0000
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
X-Inumbo-ID: 3a9d8a5d-8113-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fag1xTe0juXWjODeB8SbTUDqmsb5cTPq/J1sp/4mBsNMQL9OdkgBCPZFW1FwxcV6UrMFMBdPBeW2507YXxmWWnvRpuPRq4rznyNLQ7lyn90AH8Cqc+tHvtxNxuAEyiNeRzPlU0+ntL2czJCU4ItpFD6pqFc1OESgeuovNuACMaerUX6gRWYjdr6KHXq+ehybWrrBQXLjHzgk87DRRnR/VDeUmu621T61nZFAxL+pWxi11FdOZkIUrwxjc6pow+HzQvUAEIYfQAqC71/iMC7uMCILA3uf0mI4P6CQcxjDWRzqe/vrXX1p93wo0WL6O0e9f0zmvrYGqqRIO/eYeZY5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGFWGOFhoclq3cZCxDPviK6AXxSaMGJkGxTF99FsKGo=;
 b=WOvTI1zxYbiEhdZ9QybysApqiwgUs/XeddsM4PfLNNd+gjNG+M9boyevLdTzePGeTITlgC+qMqqyhrcmUlb+I1FcJzhXAVsqAZa6WxG0mMFjQV/3BaKBjbTsqc5/TuRW/Ab9b5iv3uW7Xl7ucIN4GJa9Ds71pCFwTQGdzKpMSVhOUWnvnXmHy1VWQp7U2JeY/Tn+Ng/IJ70tsnfQIo4H2IcFBbGungJYeT75TShr2Qqo1QY/81YKPb4T7wbVjKn/Qae1FZED7cOdTrqAN3xcZPtKonkPyOtYjePcDjwC9VErT6HSamhj2aNbuDJOrDbVnQMvbSGYLuz/2MDNUzwYUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGFWGOFhoclq3cZCxDPviK6AXxSaMGJkGxTF99FsKGo=;
 b=Wgk98XYWXL4hKPxM83Atme5QlBgOAQmssfhKGZGmrqqrxv+KnbmTa7N4s4ZYkBKxLPL/iCkfRbI9ACYjNDnHVX+nxbhs4SNIaVfD/z/5EZJI4MoUsq8gD6MrUBsLsrg+ZoIzw/4rlRUakc8nlIbdisIvNMC/weQ0ANCRkqclxYgZ6bnpF1DyeJaoYvsTuu+0IfSKzJRXBRHZhg+2tLHmU7dVEOOKvckM2QoGBj6c6IhJTw0fZJlivolVHlvOoiKUubXuEEXDNj89wWzPS/NOr2FtOddKlbgRNt7Qh55w+mVAE45ZfVSWxISbFJ1CB4jm5E/Qws8NKxE8g2ZpE7aScA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v3] docs/misra: fix sphinx-build issues
Thread-Topic: [PATCH v3] docs/misra: fix sphinx-build issues
Thread-Index: AQHcFR/6qKs/+WblEk+6G3rdASWMgg==
Date: Sun, 24 Aug 2025 17:53:20 +0000
Message-ID:
 <7d72a561ddd0a7410cc0c73a7182b4a3e56a61ef.1756057748.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DBBPR03MB7132:EE_
x-ms-office365-filtering-correlation-id: 5261e6d9-d41c-4e47-2f2a-08dde3371cf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8lZCLCRGGVmZMFCldfHpWQ8qoGB8fRlqFGR+XRwdI3O1tNzqPpNjPoxhme?=
 =?iso-8859-1?Q?7lEHqTTOm0ZbxY9BRUrNcobiOE7rWBi6IbWWDY2VR3ZKf9HFsz3J3pQqM3?=
 =?iso-8859-1?Q?cjNooZ4JEGWh3bD1U0BYq1mcNRDWRvDIQbueYRF6h9aTKIdLFqcQBGyV/B?=
 =?iso-8859-1?Q?gLPWI5trScANVwgc8DW2aj8Ee38kaVLO04i5q2fFbusuf9R1jpHsTC6WSJ?=
 =?iso-8859-1?Q?SeSN7GBRmxG2cH7sijjpwLNEikt3WTOCgxysZCjKcMUSzrJVey/6gdjfXi?=
 =?iso-8859-1?Q?cPmUkKXXBp05ZLL7RmQmOozp9QVya3BgiQi/VbXBJeq9W4hWf35DdE5VAd?=
 =?iso-8859-1?Q?Y+S+Wy0l4wZmiIZ0xlmxmKiWa4KnBgHFC238O0d0RbqCOk50Q3g31oX4b2?=
 =?iso-8859-1?Q?qDDvob8nBsxeAQLUC5+T1r8XpYPxDA4gLV8vyDKJJlD8BUQR0r6QKz/qLc?=
 =?iso-8859-1?Q?7Ff36UTP/DHsDU+Z+ILelM8Nt4cSVV9rbJ/m8xqLu2uPTnICqjayBInqt6?=
 =?iso-8859-1?Q?0/rG1pF/01KtebEC8xnr2nUidoq/dX0f1tjfZCmAbWNrPXW6oldaKFwlDc?=
 =?iso-8859-1?Q?iCu3tRlSF+Ml6qv2fk6QK58V0eQ05YBRygQZ0NNBiyToN7CzZ6GEOuusx9?=
 =?iso-8859-1?Q?dJVDMoRb4St9a2M/N6WS6DVK6smLt5F4GJ07uPgbnEhbLUVcBbDXbyV3yF?=
 =?iso-8859-1?Q?17/BqWEvIW0HoRNuPCFgMH7zp3476JT86t9oj71gWmsEZUCqqaZpcqIKmr?=
 =?iso-8859-1?Q?byDZJWKyeks7ztqbOJARh9dYheER0q+O2Jla/7qLsSkLW1+tj8riALrIGW?=
 =?iso-8859-1?Q?XZTA6eLo1WIiLSFZMnKf2F43y7kI7FZlh8W+COXoNR16nmGgo4QJeX4HA5?=
 =?iso-8859-1?Q?2HXI86rRRmLmWbjMCOs8h7glG6P2bX5hXFWqg2+RR/XrzdXg0tCsj14yKl?=
 =?iso-8859-1?Q?bw1wrpYDdFmIQqv2FG1sxwawyfWTJjOOVFUtbHQvPu2pn5XRInXRi3GAt+?=
 =?iso-8859-1?Q?gUakm6gOEPqT0szIA36AAh43bsJeTzj9f6AKfwOt8HRjyHy1oM0tVntyG/?=
 =?iso-8859-1?Q?Cy1wlL+PjOk7yj73bJ+TVYr4KT0cOJMNS2/5LvRjMhGs6ttCZsmgt4geYd?=
 =?iso-8859-1?Q?rlC6teF8OqLPcMAxwQSyvnBmgRxo8Zm0A02CnHxB/RonPh1YD7EbcuiE0z?=
 =?iso-8859-1?Q?ooQULBWaRVAdU9+qNDANsTgpUcTI4iWlNy0lHTq1i/Szwpe/z3ABjFsy5u?=
 =?iso-8859-1?Q?ggh5HzHJKExV6b3YeKWnVpAyjftLx29RspwU7QJoLU6kgHroLsl2MFf4yS?=
 =?iso-8859-1?Q?lbFnaoG8s3EO+Bvfev1XptWXLCztac1rRcwUMcQ/5KBZXEATHGNQJ0EyMu?=
 =?iso-8859-1?Q?bkWEhlYePDVTF1GnGcE081JVX5+Aj5STrnUw0rv4a64YBCZqr7NT0MWzcl?=
 =?iso-8859-1?Q?2Bmuo983NtfdtgMnlMT2OCfFbwDhKYLmwyRUddBnzLcdkS5aQEZAcPhEFw?=
 =?iso-8859-1?Q?E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7SyKiKToqq0MWIEbL8bbzB3JSEmiXDmeAVpBoyrUwzjmteH1xex/J4a0y4?=
 =?iso-8859-1?Q?MYNnYyR8oxzJ/vK9MDWYmbOSC8IeWiSrf919ywNKHmt4OAkKUgaLf9QtSY?=
 =?iso-8859-1?Q?iZqiYf7mViEJmnQk6Jj4VfpdWd8uT9bg/S0FAonEcbln2gTPin7bpFwJw+?=
 =?iso-8859-1?Q?d2tlwz4I/ba9NoqlznNAEX2aakY3a0A4ENJ+jWgMjgIYT8x5RHqUwtNGtL?=
 =?iso-8859-1?Q?3uGVYNeH/hfDuoutol6IaZIu7bJwc3JMUVBL0W5b0dOhkgGN/0FPHrMug7?=
 =?iso-8859-1?Q?slMrg1z0G4LL73xM41Ow89XH5CbzbuY3dJboT82G+dCmVgYYCCw1nI7x4w?=
 =?iso-8859-1?Q?XaT8mrQ2BRbLLktGPTVZSEqmnbgJ3dTnGMf/5x+g6nGClAFwV+2L4opC3x?=
 =?iso-8859-1?Q?L1Na9ITPWncIW8zuAAhhtT0L3qqVObnHYiIGiKvuGp0xjmPm91aL87/RNs?=
 =?iso-8859-1?Q?bIvdEXW6bYxrHUBd3ZKkj5yyjrms1IgfTW5kuvq8+VpEE/t3kVFrSNOqQY?=
 =?iso-8859-1?Q?Kbs08T9R4UTtNE/8zKlzJyfkiKiLUhlDypSM/VQUKpU6YtN2HTJrUlr7pa?=
 =?iso-8859-1?Q?uCu9e8BB8GQQmJQN9OBgHaPPvf2TLekXxsQUOgQakso4Isvx9pYWU1LqR0?=
 =?iso-8859-1?Q?BSzdpJncsCdbA87PlaCKBFqd1izABRAYuaWt3ZAC/1le2H8DetjAAFrL7b?=
 =?iso-8859-1?Q?MncamG634j+j2y/GNmmSTOqb4EP7zZyRQtcudVXfI9bLSmdAe3d/LCHPNp?=
 =?iso-8859-1?Q?oq3YG76yvznQTNG/bXNX63HUb/MWNUouLaZ44mDty25Hh9Dy5j+rFLvq4l?=
 =?iso-8859-1?Q?7duNPxZ/8/P178i10TrdXHM+aw46AA+ts+KJApLEGoaseDSDnMHKpRgkFg?=
 =?iso-8859-1?Q?vV7nQJuruI5IAyKRIaLoZcai4/mFrQxrg+8Od7N1ePyumLrljMN9DXOhSN?=
 =?iso-8859-1?Q?95zwQOI1xq6Yivfn6XYejf+6V9oc3ArMNMUkjWOKHljGLmNPx1kKCuVKL5?=
 =?iso-8859-1?Q?qlquLMEkba6eUoqZendjUa0su0U0wOaqTNMLTIF4XV19p8Y0egdlsUXPWJ?=
 =?iso-8859-1?Q?wBhuvSnvIlM6nf+ZALOh43sEC2Ju2PvWZY/o7yhEe5fi9pgnKvThySYh1w?=
 =?iso-8859-1?Q?YqN4mYCI5BEGS2ghrCv6sqYQGVHREYsKs8wIFvux9bgu6EgSi3D/p7zo19?=
 =?iso-8859-1?Q?nB+1PrZboBYvu5D5L0JRDAQA0pxgvqieAje3BE0a6vEJgVgXNh2nMiAmN4?=
 =?iso-8859-1?Q?jtT2XgpaW3PzusfHgqy8cso/+vnOoMbBFqHgmYMSf2Ma2W3XEI0SctmhTO?=
 =?iso-8859-1?Q?YGBxlndKiENATEnjgH6sW0CBqaAvHrerxwxFaxuZaIW0LPHJGUu7hR5ZZA?=
 =?iso-8859-1?Q?htwLz/wscpZgGuj0it7MVDgR9nMaHCfCAT7oG09g8wGWLEP3maE6kPXpOV?=
 =?iso-8859-1?Q?m4Amy6vEjdsjKlUin0jd61VJWH0/XiM50LzXxlR4bJ5oz0JI/3rWfji3MI?=
 =?iso-8859-1?Q?SYgwbFc/70e0nc7SCVuYO+ztNEciJkhzA02R3GqXNADZZPLY1JlhBXXgDa?=
 =?iso-8859-1?Q?WXHzcUvgQklF64mHt9OfSVK4t2/UwHeDLOzcWxb/421D07Ws+hFHEJFPVQ?=
 =?iso-8859-1?Q?t+Pjg+niWM/vZJr3886Qgxkd8E/tA8O3NySWk3sSnw1RPUbx6WYHqvFA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5261e6d9-d41c-4e47-2f2a-08dde3371cf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2025 17:53:20.4765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yd2ZFuvoHnKw1Fbb9JT7J3ly7ICIHVVG2QIznOyn+rwpR5Rdfdkzp3lyilblskbj3b4Xa2fH//2P1w90CaTMkbYP6AnmjEhczrVMYdfOPiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7132

From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>

Fix the following issues:
1. xen/docs/misra/deviations.rst:90: WARNING: Inline interpreted text or
phrase reference start-string without end-string. [docutils]
2. xen/docs/misra/deviations.rst:54: ERROR: Error parsing content block
for the "list-table" directive: uniform two-level bullet list expected,
but row 6 does not contain the same number of items as row 1 (2 vs 3).
* - R2.1
  - Calls to the `__builtin_unreachable()` function inside the expansion of
    the `ASSERT_UNREACHABLE()` macro may cause a function to be marked as
    non-returning. This behavior occurs only in configurations where
    assertions are enabled. To address this, the `noreturn` property for
    `__builtin_unreachable()` is overridden in these contexts, resulting in
    the absence of reports that do not have an impact on safety, despite
    being true positives.
    Xen expects developers to ensure code remains safe and reliable in buil=
ds,
    even when debug-only assertions like `ASSERT_UNREACHABLE() are removed.
3. xen/docs/misra/rules.rst:127: WARNING: Inline interpreted text or phrase
reference start-string without end-string. [docutils]

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in v3:
- removed item #4 from commit message
- set backticks for macro ASSERT_UNREACHABLE() in deviations.rst and rules.=
rst

Link to v2:
https://patchew.org/Xen/f31b8d62f16bd272114276f53db842101cd53e52.1755266805=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 docs/misra/deviations.rst | 3 ++-
 docs/misra/rules.rst      | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 2119066531..3271317206 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -95,7 +95,8 @@ Deviations related to MISRA C:2012 Rules:
        the absence of reports that do not have an impact on safety, despit=
e
        being true positives.
        Xen expects developers to ensure code remains safe and reliable in =
builds,
-       even when debug-only assertions like `ASSERT_UNREACHABLE() are remo=
ved.
+       even when debug-only assertions like `ASSERT_UNREACHABLE()` are rem=
oved.
+     - ECLAIR has been configured to ignore those statements.
=20
    * - R2.2
      - Proving compliance with respect to Rule 2.2 is generally impossible=
:
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index a2e4e9f4ff..4388010ec9 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -124,7 +124,7 @@ maintainers if you want to suggest a change.
            they are used to generate definitions for asm modules
          - Declarations without initializer are safe, as they are not
            executed
-         - Functions that are no-return due to calls to the `ASSERT_UNREAC=
HABLE()'
+         - Functions that are no-return due to calls to the `ASSERT_UNREAC=
HABLE()`
            macro in debug build configurations are not considered violatio=
ns::
=20
               static inline bool
--=20
2.43.0

