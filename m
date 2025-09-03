Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34A7B423B4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108408.1458548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoUg-0006hk-Bd; Wed, 03 Sep 2025 14:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108408.1458548; Wed, 03 Sep 2025 14:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoUg-0006fb-7v; Wed, 03 Sep 2025 14:29:50 +0000
Received: by outflank-mailman (input) for mailman id 1108408;
 Wed, 03 Sep 2025 14:29:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoUf-0006ez-CY
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:29:49 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71b57246-88d2-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 16:29:48 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB8100.eurprd03.prod.outlook.com (2603:10a6:102:223::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 14:29:45 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:29:45 +0000
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
X-Inumbo-ID: 71b57246-88d2-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gC0NgJ4rMgkXkh2lqqwtGSWuoRNKEpxKx6f4xqUMkx2MKJA5JRNwKCV5KZ2ZyM9ieA4wxrDKObNyLGXcXxQPp7u47WAulJJ9T6NFjniDOUpn8aCcYENx3NoP4kcoDZ4Aba/igeIMuH9FJNGfsN23puWoR6YnOjM6bY1iH7LmvFkK2W6i8w5X1dW2/XBL7ARb4MBEmlzJ3lK/W50LJVgLLZ0ycHuRz9kY1ff9ByL+h3SzHfICnKASfdqNZzYMeIjGLp9PA3C+thg0JsggfRNvvGIfsiZx12YBAE6mSBW9Fb8uH71w+Pzck/y2pEJQxOuDYA/AKepRNPCyb7aXfL5HJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRl3NFKrUg/k7v6Lw+zVjZJtjfFQquHWqZIm7yHIZ9M=;
 b=A/u45gn3MmgXD/EnxmWdn1UjTmkfKamXGEVWSRs8I8ivzjVvsjmH/i2rlewKe8/isNjxuABaSUvKIjgbwqQcuzHfZZpmFm7xL7KpFOEgAzPAiTgF3dpR+T//ksnwrBhVUqMUQBSqE8ncdfsL/vkrOa/BJkKJV3pdqmTq8zm1csQh13XJZPpIow8I36n8OqjE1cS0QCKsbJX5Ov7cKNsZP1VYg0mQeykMDGTbSA6OnPsT23qBlPOUwVNRpcqPUBRSkO8z9suBHW0SHRMeWB+L83Uxqw1tV30sn/+YXCgHW3HAF36On3dhEyV+EJzuLhkW0T3JIa9Y+trf75wf14SPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRl3NFKrUg/k7v6Lw+zVjZJtjfFQquHWqZIm7yHIZ9M=;
 b=q3K8ia3qKEZ38Aaj3Ad+t7D3JQsbViLInOjniVEN+29wUxwWlwfYEqq7DvCXJQGkYJOU/krPXNnd+ZmxLAAcA2575OsblK4WFU93blT/8AS6WU0rDf6OC3YxtbJq82gOyLZ/z4nyh2wa0hvXSgnpi+01kmSItfBcsBagaHNtvKks8rVAGT+d+aSIqZyIKocX2LGfzLVPopQu3c7J+cftj8VoYOc2u5p2+BOikWQDC5mVfzFwkLmdxFdKtM4Jw2Y9k2tZ/iByegXC00dnl274LG3IB5LIHZ0yj2uzG1Oxgg+NoMOAy+2v9SJP8BUQplxtoFHNjrIg3uJK3pY8QjMThA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 02/12] xen/arm: gic: implement helper functions for INTID
 checks
Thread-Topic: [PATCH v6 02/12] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Index: AQHcHN8xw0irkX2OhkWK7SZDCFd+4Q==
Date: Wed, 3 Sep 2025 14:29:45 +0000
Message-ID:
 <2ca603e479eb320c3ce02035ecdf64006160bf62.1756908472.git.leonid_komarianskyi@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAXPR03MB8100:EE_
x-ms-office365-filtering-correlation-id: 4afcc69c-3d45-40f7-78d9-08ddeaf6546d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?SaxGk2ZXsOcGV+xc4HUKcYV5Jyahv02/pNdTgGN8oQ8aqPjGQqeDTjVNyH?=
 =?iso-8859-1?Q?cP3Mc7qBagSjbrBLEakye3bUqEG9crLjv6pHJc5thRnwgmg8z7yH18D7jt?=
 =?iso-8859-1?Q?2fdv9n4htz9/Fa2GWNxvlY8wg0C9wPFIRTNIeU5EyDwFYXuOVWlXUXSaME?=
 =?iso-8859-1?Q?zlT05ZeqtfV0EIrgMLq/lNwxbkvDoaqhRAYfCi+Nhfj/pxhn47F9MKNPoZ?=
 =?iso-8859-1?Q?JiR6lx+kIH8r0T1Sd0zEnUkbHK8yPqi2nmZZTeFUiayHFWNNFhLWB31qoJ?=
 =?iso-8859-1?Q?/4zJGAPcPwqWVBWDuSo3v56b6qqDDAPL8lEUHA+PwaJfGIU/c1PtvHuIgt?=
 =?iso-8859-1?Q?qEkCVhZJUTuRwIRe9Aca5oxGaKSGsBln4yPoxqGboRLPOmEYCdn+RcdUeD?=
 =?iso-8859-1?Q?kN9TESiBGwpoQFgo/BEVd7ibXY6RYXATAyx8xVeg8HtSr2yDOt9NxzOYLN?=
 =?iso-8859-1?Q?OgbaBBqvSilHEei+TXb9VjkojL73dCvAZ10pEUwqd75Cg2LDJzkauD2YAN?=
 =?iso-8859-1?Q?ygu5S74ZCM7eyFUfXCKkGxPv+HrpDOYwJREd6qiccKI10DTvbZTf+8hWYc?=
 =?iso-8859-1?Q?dtD1quTuY7zYcTYocWL0Y1a6ob5x4VOTziimDoLr687mD8CG5Ls65RRFa8?=
 =?iso-8859-1?Q?Q7I9VO4aB+0c7UtPoiQp/ne0HQnG1lZbFNTlUsl3Eq227SG4DbE5rZUPvm?=
 =?iso-8859-1?Q?9MtnGmnQcxpLE2bIBFgOv0ppvUE4BFyhGI0u9rVD0954B+T8eL4lA58Wi8?=
 =?iso-8859-1?Q?UjZarxZmluQZ1kGHEy+dgABRUWN93BEYcb0Ay5C9xo8wpPcT/ET+XM+wc7?=
 =?iso-8859-1?Q?T92a8oL9jZ72QU3BpODZpO0AIsu0ewskUYxohWL/n53qJ9SA/cees+kKRx?=
 =?iso-8859-1?Q?bAnhytBbER3H5O9TbbeoFvmPRqKADKIxJ04pK+y/4gtq61Zd7LGJ0zX3o4?=
 =?iso-8859-1?Q?Xw1QYn9zTVZwgsdr2kXJMcuGGgzyN6KHD0RiL5/Ig2KTSFgJjp0rhWID+4?=
 =?iso-8859-1?Q?JWJ2UOMAuyb3S4GroVhMu4XHvhFyuSbKrd/PN5iR6wNXy9m67MZOpgrXTN?=
 =?iso-8859-1?Q?RSdCv/m1onLHYITWQKpQHCtPGO3CZIq7INh24kr3nS2jjKb4q6NY4/qc4D?=
 =?iso-8859-1?Q?Bi5qJdsH+xyYEr1WT0k9ykTQxUoHyeORZX8rErQDn6j6jxk4Q6A2g5YEdK?=
 =?iso-8859-1?Q?s03NEtwP+enYJzcYM+Qp8PTuj7ncw9/49u6kLJIbv83JFSuvRMVMX80Jx/?=
 =?iso-8859-1?Q?yK3mg5oY1uQshvSyvtbvSRHkySATJk7ZzQo/nH7WPsrLsT6VcJ3Mi3BSEw?=
 =?iso-8859-1?Q?S2gUD6Mf2Mr+BVbxC6pHGkV2mE8tPjlwkrPRmls+XaZiP2gmClmEQriVkc?=
 =?iso-8859-1?Q?uscQDBNERiJSuN4pfBK8uK+ntH2FWb9lEw9HVjnzuIsHJ6GnSoHwEWDY3r?=
 =?iso-8859-1?Q?y4xmTU/ES+Ll0YxLm9vlxGGi1TFSU/3bq7MeHS/qm901N8XSYoyZWf1FYb?=
 =?iso-8859-1?Q?zobghv28eIIEHbyEgBokE+jFdgUi6kRcPJMfHbNAHDGQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3ekiKNQOxma2IAkT/tUzQPJx+0kb4jhXWTntMIvp9wF7ngt1Ogcs0IAK/L?=
 =?iso-8859-1?Q?FJ76Rd7N10r6tIE438jSVB9DipvMv4K7ZNEHfaNLX5imUtYjtQmBxegZLQ?=
 =?iso-8859-1?Q?yVxpqR8oH4J7rl567yCpP8GOd8zmW+dN2upMnXCrHtKtc1WRZwo54bl3m8?=
 =?iso-8859-1?Q?FAcu5chhIjUNEOzZdeZdH4vU1HPxSHGUMtwQtWhpOgiBwJXPMZGfwx1znu?=
 =?iso-8859-1?Q?LNaQmd/USNt5aqBM+PyhOWq3Tplxb65Sm0Rrxiq9wgdKHmOIacqk4xw1i5?=
 =?iso-8859-1?Q?bkpNCMMBqcWmxCvzr/F4nVtutweG67NnqszcHDw8rt0UFH+6KpSl2kHjTZ?=
 =?iso-8859-1?Q?mxB0oOLIrcZ2ASw4lpE70FX+UN/I4jwwWIYpicUOQUGF2Zt4pQZ+9ewr+4?=
 =?iso-8859-1?Q?1OBPvGk5M9OhveRnVL+n6gE0+vnlCbD1JezwXppwHkDSaVLEUr3LrpvH9v?=
 =?iso-8859-1?Q?M7wmxfx27TnS/WKj/pFK7DacAlq7tx9Vc8oq/0AKk2gsDG80rPrMN1NyQ9?=
 =?iso-8859-1?Q?f7d9d+OtN11t7agdvnoVKJBl1uiFp8X4uWw1ElN20ownLHQ4xdmD5jqrs4?=
 =?iso-8859-1?Q?lTE+gdV1YBLicewnUemqzoLFkNsp0O7COXZZqBsov6rOHQaxNLuWjSXUJP?=
 =?iso-8859-1?Q?R503GYSJZsNrRR5Zt5KPjs7Yxo0UZ2k6bzdt/6tXb0zy5mYAcgx+toESky?=
 =?iso-8859-1?Q?Q+GVuApHHX0vKT6HmG2dGXbEtGfXOmGEq7lTt4G8aO71168sAZUe452cCB?=
 =?iso-8859-1?Q?1Fx+IfnN8twW5xd5EX7PvEKF4An/KbBxlRMv+CNR+JeUbSqOxM8BC5Wx/I?=
 =?iso-8859-1?Q?igt5Zi5OLWeyaKEX9hY/QqZ45YlLLp+FpDmkXzJRjBM2TbCOnhzXDcaKqW?=
 =?iso-8859-1?Q?DJ6qharcnqwfnSf9nacdhKc0jsBtPDs55zjmoaKGDZoAROR980QQDHshiq?=
 =?iso-8859-1?Q?c9Z7xWtEBzDo2c/xlCtCSMyrNEnoG9udHAoBdGddc3HNWpfK82O2mPADsA?=
 =?iso-8859-1?Q?PMhL64EKbJRoxw+W/B6jQ/2s3MSukehrbOjSiGAhqkY/yRZdqeS6XZlQVT?=
 =?iso-8859-1?Q?lDW4hKBNQMImf5zWjTktg94/4c4w/zsRQwP0rjAy+DDJAjruehX0gEh4Nv?=
 =?iso-8859-1?Q?dCyKmvJbq+zso7E5uU7db4FNlSU3ryz8VW1H//zfSW4OEgCcHTGbxBASIg?=
 =?iso-8859-1?Q?mMUDejpMGYvF67b/8o19FQUB2LvrGfHFwllawHGbRrzuegvDSzxAeadl5H?=
 =?iso-8859-1?Q?Q9YHbvZ+pdZolopP8qPOK5PTQNFRTzRXco/48FFXX4nNZuMYMfmunWJQEe?=
 =?iso-8859-1?Q?ccbKzuAPWCQOMEgOysDCDP4JVgjSOYuLfu+7X7KMZfOtTXlByylA6rOWoj?=
 =?iso-8859-1?Q?LxSwXfqK7rORJ35/48DOw31ON8fNExNdGhFJE1mXJ6f0p4NSz9E2YumM+r?=
 =?iso-8859-1?Q?R/RbwIhzMdFAcBIAiM/6twOU354q3G7u+2UKmkuOHDfqjCYPyfGJ7I/BIK?=
 =?iso-8859-1?Q?Lfb9sKXECvTV7JLOqx/M1CdT1A0kvLhzSmwQtbGm3svOA7bavtuJaluDEP?=
 =?iso-8859-1?Q?5qmxV72JJcKHgJYCFf98PNa4gcNp0OdXZDSlqpZupLgkPSuV3kbhaXMtXD?=
 =?iso-8859-1?Q?m5mge2OBOv+mbWVMPfZt3O9+2R2YKOuGHRI+bSj8p65n3oA8dY2KMvwBSU?=
 =?iso-8859-1?Q?h620Fy8x/yX0nc8MkrY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afcc69c-3d45-40f7-78d9-08ddeaf6546d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:29:45.5691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AU6fhZ74rGvoVE62aAg/7rI+QXaCLoTI49qKvllz93iddVPuaoluooXeCpM25jMBdAIYYOo8i5XTqgRKlh5TWjoWb0BiU2xr3JQDp2NfsLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8100

Introduced two new helper functions: gic_is_valid_line and
gic_is_spi. The first function helps determine whether an IRQ
number is less than the number of lines supported by hardware. The
second function additionally checks if the IRQ number falls within the
SPI range. Also, updated the appropriate checks to use these new helper
functions.

The current checks for the real GIC are very similar to those for the
vGIC but serve a different purpose. For GIC-related code, the interrupt
numbers should be validated based on whether the hardware can operate
with such interrupts. On the other hand, for the vGIC, the indexes must
also be verified to ensure they are available for a specific domain. The
first reason for introducing these helper functions is to avoid
potential confusion with vGIC-related checks. The second reason is to
consolidate similar code into separate functions, which can be more
easily extended by additional conditions, e.g., when implementing
extended SPI interrupts.

The changes, which replace open-coded checks with the use of the new
helper functions, do not introduce any functional changes, as the helper
functions follow the current IRQ index verification logic.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V6:
- no changes

Changes in V5:
- fixed a minor nit: moved the existing comment to the line above to fix
  formatting that exceeded 80 characters
- added acked-by from Julien Grall

Changes in V4:
- removed redundant parentheses
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- renamed gic_is_valid_irq to gic_is_valid_line and gic_is_shared_irq to
  gic_is_spi
- updated commit message

Changes in V2:
- introduced this patch
---
 xen/arch/arm/gic.c             | 3 ++-
 xen/arch/arm/include/asm/gic.h | 9 +++++++++
 xen/arch/arm/irq.c             | 2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index e80fe0ca24..4bb11960ee 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -111,7 +111,8 @@ static void gic_set_irq_priority(struct irq_desc *desc,=
 unsigned int priority)
 void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 {
     ASSERT(priority <=3D 0xff);     /* Only 8 bits of priority */
-    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts that =
don't exist */
+    /* Can't route interrupts that don't exist */
+    ASSERT(gic_is_valid_line(desc->irq));
     ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
     ASSERT(spin_is_locked(&desc->lock));
=20
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 541f0eeb80..3fcee42675 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,6 +306,15 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+static inline bool gic_is_valid_line(unsigned int irq)
+{
+    return irq < gic_number_lines();
+}
+
+static inline bool gic_is_spi(unsigned int irq)
+{
+    return irq >=3D NR_LOCAL_IRQS && gic_is_valid_line(irq);
+}
=20
 /* IRQ translation function for the device tree */
 int gic_irq_xlate(const u32 *intspec, unsigned int intsize,
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c..7dd5a2a453 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -415,7 +415,7 @@ err:
 bool is_assignable_irq(unsigned int irq)
 {
     /* For now, we can only route SPIs to the guest */
-    return (irq >=3D NR_LOCAL_IRQS) && (irq < gic_number_lines());
+    return gic_is_spi(irq);
 }
=20
 /*
--=20
2.34.1

