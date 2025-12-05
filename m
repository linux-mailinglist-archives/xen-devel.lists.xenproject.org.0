Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5B3CA915C
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 20:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179395.1502907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRbZU-0006qX-Df; Fri, 05 Dec 2025 19:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179395.1502907; Fri, 05 Dec 2025 19:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRbZU-0006o3-AU; Fri, 05 Dec 2025 19:34:28 +0000
Received: by outflank-mailman (input) for mailman id 1179395;
 Fri, 05 Dec 2025 19:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XFGw=6L=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vRbZS-0006nx-4n
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 19:34:26 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 624a967e-d211-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 20:34:15 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by PAWPR03MB9129.eurprd03.prod.outlook.com (2603:10a6:102:33d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 19:34:13 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 19:34:12 +0000
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
X-Inumbo-ID: 624a967e-d211-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOtkQyO4NRJNzbuCk66/h5jI7/1x8lGGbsizGV1NG0aFAiJBC4bbDo1eiqPyegFLTi61TmjE/E1pJSJHSKZl8lFnsyGgOS1W+yioLBjyHMwMsTHy2G4q9rVfsHlq34aXlZANcVeL4IcDkjNruFdmOVhinCC3eQYpmzhlPElfPmB7DAMBbvKpW8icDPDAiBhpuRt2TCVljdpypuu4Wx1zS4iwffrm7CspVw6YtLPcxlme+bq/fqO2s3dNzXTwcbmpQ82gsQg/+9ICmFHEDKuNv7n5cG6wxdBIdZq+bsIY5JyuFbIaWzfFwiPLoEhBz/URG/XaC0XpLQce7JpDCdY3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdQgXa4klk+QWtP66Tp5e3WuEgtjSXvGsni9dLvLTn4=;
 b=hKuNk3q7ANL3XjdOeeQEUjOoCAV3Dtm/ueWEZ9qDcgSETuPwMOmQzh0Nk2Db9YSXqSYAb0xyM9h24phuMZwx260AA4CWfdCnPuYWOFDRRBydYbfQJyANpKFWdTxgMlu2ATUJ/n2fqsQ1h7A8HWGdeaMnIdrP3vwrLu0FS8mSDOduWu6jXtvIlSbFVbIhNlZQQ7j7fhWdJRIBzfYDe62qqH1MrkQdzsT7pByJLemZGokpvgJYQziy3vvZExtuIzPzbi6LLCUSEZbrZwlYADUtQbN0Qbvvs5TKxl5VJSBp+lmSWRsVIGkx7BF0uKNT/2f85OhmL0nJVhPMKyT+Ea65ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdQgXa4klk+QWtP66Tp5e3WuEgtjSXvGsni9dLvLTn4=;
 b=EhHjFiuIrR4bOfXT82nGKtsvxOJlPy3HcXWe7scNjwqTmG2y1YRhbIBiBBpvjUWHDb6qyLiF69cjGJpRM/K2fpWx3smpQfOoWUcTknpHru+LDlKcM1EfFNMohv6KKvz0GD7tryHi6W29qltojaruFuJOnKNhW/uM7moWquD5aFMh6iIwwW/BZ1SV01+WqNBaEdFqhLw+CkTfe0laFAuIoRsMG5XWWRwaF0tm2/xXiouNYzBo4Mm7/Bqh23VR9DyrOObMAjoBRKXbK7+ySdK+OWG3Vj1qsjp1Bnf6lBZP/Xgowaf6vaHFL2JL2+lYxkj5Z6IKvt84r87xTeJvrq0a8g==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jason Andryuk <jason.andryuk@amd.com>, Victor
 Lira <victorm.lira@amd.com>
Subject: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
Thread-Topic: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
Thread-Index: AQHcZh4iEvp6gRy5ukqEPh3CRoOuVg==
Date: Fri, 5 Dec 2025 19:34:12 +0000
Message-ID: <20251205193411.1368659-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB4600:EE_|PAWPR03MB9129:EE_
x-ms-office365-filtering-correlation-id: 230ae922-35c1-4708-2e33-08de34354505
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0lmASX1FubfLo/eWex9qlD/SHPyJOhH6ykHJ9K/0y4TcsNy9U1SuXopiXx?=
 =?iso-8859-1?Q?dwY9QPO/yB0+hNdgW0l+qo3sOyuieQzZ6ISFmbhjRaD9O3hHz3zMqZh7tx?=
 =?iso-8859-1?Q?L+TR9TU3giKyycmGL7R+mkm3AKYyLDnCndceO8ss4F1+T8u40cXOJF6BFl?=
 =?iso-8859-1?Q?UV4ik26ne0hmbIL2iYmA83bMgSDxDB69uGVEcNScyVsy/vQpNFCPNjFRld?=
 =?iso-8859-1?Q?lb+700ipEKzhGQGDH4EClaBjX6tlrMPnkxSIjyZqZVXN1s9v0gpo99X91d?=
 =?iso-8859-1?Q?VtbX+8jEknIlEZEoE0xDoB7Co2QG6L4o8NWBSN2xUD/twIq6BbIJFaz/VF?=
 =?iso-8859-1?Q?WwT9ECwi3zyEwgNJrNFFLzf2xWjtYpE8cVMbW9C4ZkP3GbeTSxAWNmOr7h?=
 =?iso-8859-1?Q?w5OkpfCWUfwLIBT7nUYC7KVQ/w9u7hCwNBo/HwQ1exzsgJhEB3RfM3tPqN?=
 =?iso-8859-1?Q?Z95TYk6z3EBSpROPux+rq8yRfQmV3OuupAu8hhdWoFwTTzyrthlOK5R/Yg?=
 =?iso-8859-1?Q?BZFl+24mr21c6YKJWCPvxFKdhnexu9HDcuhe9aJMxpW85OAWAKWWo4Dgwn?=
 =?iso-8859-1?Q?1LTckW6844KbcWpyqyEgU0MVhjG+DmFiK6Tur/XCMK/BvIw3t3rwxM7VGm?=
 =?iso-8859-1?Q?St9WBo3jAOLszxSzbe5nspD4pnPSMEZaEBo+kRad/lZ8Pz1SzwtPftLgZQ?=
 =?iso-8859-1?Q?KRFwx3MHSgLjzu1EkFOMVtxmova8vjygRVBEHbp+G1+BtQSfYYFsCIcL7g?=
 =?iso-8859-1?Q?cxLnAKTR8ZylDq+vCDGB05t+3rDDTzU6/u9k+2d12jfxFapex2WNyv4Eqi?=
 =?iso-8859-1?Q?LhlYM+JN/RC7vS7h8vKcTthg28L2/bo+YyuM9mRb/QxEbqDEbPSC55Sdlo?=
 =?iso-8859-1?Q?77Wf5fXxIaZHNBd0GFvI9nXk5D4RfWmrYaD1UTYw8QnoOB4WbxqGH0po7/?=
 =?iso-8859-1?Q?C9UIoy0VjzaqVrVaE1o4Tg+xI1ivc10NCeOzrN8jby1oao9zr6seLVMtfY?=
 =?iso-8859-1?Q?+BPZttHAeBLRX98UFMvG5SKQ6Bqhy0kIzm4N1Tb7DmTyi1xq0UbltGi8ML?=
 =?iso-8859-1?Q?GlWa7E+Xv8PsuIsigHM/mRaKNZIcvLp8OVI+eeJtPq6iiyXAqyQdUnvwUI?=
 =?iso-8859-1?Q?eqSqxJaRpuAN7xtbgYOk94/v/7GQuiGeHzWrI5T49+U7E9xSd8EFhpCF4D?=
 =?iso-8859-1?Q?dba5WjFZ+plo3ySEOVtpOIFWt23uJAuyakNfWbT9e1POEe7k3T+2xu06CN?=
 =?iso-8859-1?Q?2zR93zoaNSVJz6F7EIAnqBy+9QazRoSduJ7h4h0BTR/Lns7acFZd9x7BtI?=
 =?iso-8859-1?Q?UDTRhDYAJiKIe3djtyRJ2o+uxbflxxFG2QZ9GHYjufcx46lzp4GxuS4Bbr?=
 =?iso-8859-1?Q?cX7DaBUSeHXOTam0G3/JhSW6Exvg1ptcgErmHy2+OkiGetvEA8NnHMBjRu?=
 =?iso-8859-1?Q?w1B9Cu/qkHYLgmAV353bBa6RfQIDi9Nvk+lRZ6n+GbvaqBYbJJeRnXvlgR?=
 =?iso-8859-1?Q?DODqJ1HpY0bKW6wHxmfePpYb8tGf6KEnxp8V5RmS61lcf1ooJAQN3k8JyQ?=
 =?iso-8859-1?Q?NjEXFzTcBE3Vgcx8suLKus8I0Pfd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nBBewJFZhmyNIgpiXlTVxh4imLbg1Uloe6pM6p+B2faCzc1fuaP9COJ+xF?=
 =?iso-8859-1?Q?E92kjEUfbK0DPZcXcdYN3TR7/bJy2GYwV+LKIo19yk9CvzDUIDQQTevlpz?=
 =?iso-8859-1?Q?xf/69KEHXmop2Kj9xXjM+DBaJFTZ/x5Bb8giZJ6HIxFrfzDiJoNDEBgwuu?=
 =?iso-8859-1?Q?GuLL3jhE5ibHx/ymwoZG163poF2k3G+hFE0C/En1mztsf/PxGS63TgOiiW?=
 =?iso-8859-1?Q?yScCH0Sc5B1KJsOEA9p6mkwxDLKbYzww3xPhztss6bk0OGttp1WECQjFbc?=
 =?iso-8859-1?Q?qX6V/sk/IMZC3BDWMRmKiYCC9TR8sUBchcEkwqJoQUUdF0Uu2hImuuMmYu?=
 =?iso-8859-1?Q?wUIkEQDbiVFytqdS2Pw36k+9duQowhI8XQRk5WHUK/2khdX9Oixa3bca3s?=
 =?iso-8859-1?Q?LEHeG8NtdBwIB7TsWzdAxxFCZvw5mzhNaslf+9OfgHs/mMkdhmfUPkyzP+?=
 =?iso-8859-1?Q?52tKlH+StttW7ZnS3G+0kHoPxSTwQIvhVgAHY3ImSTDwXRkIPTkSdSYnsb?=
 =?iso-8859-1?Q?xUXSXLB3lJMqpWGDfiBH6UwZJVIvkMAZCPS4XN4U6cQ3bKoHlhDfHF0TUJ?=
 =?iso-8859-1?Q?E7wLNrxn5QCgD3StONIlMi3A9TPIgLDORgq+KaVCuBpUsdSWZSt18BKgez?=
 =?iso-8859-1?Q?CcA8G1x4Bo+pKI6mSGlA7J0i0QgCuMD/Gca1+YWTbES134ryicJvTNbiWF?=
 =?iso-8859-1?Q?qp9aPPoik9pUAjh+GIM0zj4AA4Ly8QlH6vJcfDPWR/8qgsU0Mz+CnK8Sno?=
 =?iso-8859-1?Q?8WWjkck0QTSIfo+gxrHxPgOQkev2w9BcVMORyWVtMxrs5tb+Gxb3hoK7WS?=
 =?iso-8859-1?Q?1IC7IBwBr6HvVpKW4Bh98SM6nY4ZI0Jn5St3+sxmcnm78BSznRzzT3b8rd?=
 =?iso-8859-1?Q?lRY00DghASUZnTfFZNtWxp5pNGUL4fZx7EFn8HdYLKLv7/DTBrRwHSYGcj?=
 =?iso-8859-1?Q?BtSVjIQjhdFZnnwT/fhUHoLTKWUgZeHqiXoo1jZu/LawMXkUmn2dET08FX?=
 =?iso-8859-1?Q?Lh1GHYcj8z8X2FG28W5br0Qsy18VFg20ZWV+YFbp0kfZK2Gpf5zxOMETxy?=
 =?iso-8859-1?Q?mVIWMPrkOhA5aPBSUr8qY2Km3gZJ17+2yS0ZSoc33VRNaqtheCPbhx6fgO?=
 =?iso-8859-1?Q?M9IAbCa9qKExkxwL1vEulIad+ygDoH7MXK3LkoVxd9+6sIJE+J+oFaD0y2?=
 =?iso-8859-1?Q?6uiEwPzJLXpDvEJTnnWoWAr7Za5kBoKpmCDbLSlgfZkC6SwoOOpWrgt2hf?=
 =?iso-8859-1?Q?btr7SGB5G7srRMjsCK52JQ3BSgzjj+meSMol/15No54r+HlSq6w1wU1RMR?=
 =?iso-8859-1?Q?EDhI6EOLR6mzrlIvDD5nw/3f0uFaD54hxp3zXMoGqEoJ4+yHokfQBKy5bj?=
 =?iso-8859-1?Q?Ox/rdgf/gtlNckIbyH3LoDgZ+qdM/n6zkO9j0us5GXAxHcSpuyIHt0SVO3?=
 =?iso-8859-1?Q?+L9wa9wlOCXv15YblR3ro5AUpslbNwocZOYIOM9Wg+1MK+1vnRZOYpfoiw?=
 =?iso-8859-1?Q?xhn4X+FzBcG19ObYs5hbWrhgQ1kEp45DTr/cyOwxv0EuZINhnGt/dzMqgr?=
 =?iso-8859-1?Q?OCIVPODAubOiob0GPqR1ZHj7f4zS7KeCAVO51ktE+dOP8D39yc9B62z3gp?=
 =?iso-8859-1?Q?QhqDI1OPo0Md1pqi/IIcFn4B0g+oECFnEzgpAN4lf6HfDJ3nCYXKbHXw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230ae922-35c1-4708-2e33-08de34354505
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 19:34:12.8535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 20wm1K1OADc2+XdE+QbN2TqW6EhBypShZ40xa4uxGr5vlTwpl9Ugrdzsbj3smp+yf+w5Q7XchJRE0NBuZoRKiIXkUVUAI4W7r0DSDeGMB6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9129

From: Grygorii Strashko <grygorii_strashko@epam.com>

Extend coverage support on .init and lib code.
Add two hidden Kconfig options:
- RELAX_INIT_CHECK "Relax strict check for .init sections only in %.init.o
files"
- DO_NOT_FREE_INIT_MEMORY "Prevent freeing of .init sections at the end of
Xen boot."

Both selected selected when COVERAGE=3Dy, as getting coverage report for
".init" code is required:
- to bypass strict check for .init sections only in %.init.o files;
- the .init code stay in memory after Xen boot.

RELAX_INIT_CHECK/DO_NOT_FREE_INIT_MEMORY could be used by other debug
features in the future.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
 - add RELAX_INIT_CHECK and DO_NOT_FREE_INIT_MEMORY, those are two differen=
t things,
   both potentially reusable
 - enable coverage for libfdt/libelf always
 - enable colverage for .init always
=20
v1: https://patchwork.kernel.org/project/xen-devel/patch/20251203222436.660=
044-1-grygorii_strashko@epam.com/

 xen/Kconfig.debug          | 12 ++++++++++++
 xen/Rules.mk               | 10 ++++++++--
 xen/arch/arm/setup.c       |  2 ++
 xen/arch/x86/setup.c       |  4 ++++
 xen/common/libelf/Makefile |  1 -
 xen/common/libfdt/Makefile |  1 -
 6 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d900d926c555..8fc201d12c2c 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -39,11 +39,23 @@ config COVERAGE
 	bool "Code coverage support"
 	depends on SYSCTL && !LIVEPATCH
 	select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if !ENFORCE_UNIQUE_SYMBOLS
+	select RELAX_INIT_CHECK
+	select DO_NOT_FREE_INIT_MEMORY
 	help
 	  Enable code coverage support.
=20
 	  If unsure, say N here.
=20
+config RELAX_INIT_CHECK
+    bool
+    help
+      Relax strict check for .init sections only in %.init.o files.
+
+config DO_NOT_FREE_INIT_MEMORY
+    bool
+    help
+      Prevent freeing of .init sections at the end of Xen boot.
+
 config CONDITION_COVERAGE
 	bool "Condition coverage support"
 	depends on COVERAGE && CC_HAS_MCDC
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 24f447b95734..c884a4199dc2 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -145,10 +145,10 @@ endif
 $(call cc-option-add,cov-cflags-$(CONFIG_COVERAGE),CC,-fprofile-update=3Da=
tomic)
=20
 # Reset cov-cflags-y in cases where an objects has another one as prerequi=
site
-$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
+$(nocov-y) $(extra-y): \
     cov-cflags-y :=3D
=20
-$(non-init-objects): _c_flags +=3D $(cov-cflags-y)
+$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y): _c_flags +=3D $(cov-cflags-y)
=20
 ifeq ($(CONFIG_UBSAN),y)
 # Any -fno-sanitize=3D options need to come after any -fsanitize=3D option=
s
@@ -259,6 +259,7 @@ $(obj)/%.o: $(src)/%.S FORCE
=20
=20
 quiet_cmd_obj_init_o =3D INIT_O  $@
+ifneq ($(CONFIG_RELAX_INIT_CHECK),y)
 define cmd_obj_init_o
     $(OBJDUMP) -h $< | while read idx name sz rest; do \
         case "$$name" in \
@@ -271,6 +272,11 @@ define cmd_obj_init_o
     done || exit $$?; \
     $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=
=3D.init.$(s)) $< $@
 endef
+else
+define cmd_obj_init_o
+    $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=
=3D.init.$(s)) $< $@
+endef
+endif
=20
 $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): $(obj)/%.init.o: $(ob=
j)/%.o FORCE
 	$(call if_changed,obj_init_o)
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 22e929aac778..2a0b322445cd 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -69,10 +69,12 @@ static __used void noreturn init_done(void)
 {
     int rc;
=20
+#ifndef CONFIG_DO_NOT_FREE_INIT_MEMORY
     /* Must be done past setting system_state. */
     unregister_init_virtual_region();
=20
     free_init_memory();
+#endif
=20
     /*
      * We have finished booting. Mark the section .data.ro_after_init
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 7bbba76a92f8..280085c206a7 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -815,6 +815,7 @@ static void noreturn init_done(void)
     for ( unsigned int i =3D 0; i < bi->nr_domains; i++ )
         domain_unpause_by_systemcontroller(bi->domains[i].d);
=20
+#ifndef CONFIG_DO_NOT_FREE_INIT_MEMORY
     /* MUST be done prior to removing .init data. */
     unregister_init_virtual_region();
=20
@@ -837,6 +838,9 @@ static void noreturn init_done(void)
     destroy_xen_mappings(start, end);
     init_xenheap_pages(__pa(start), __pa(end));
     printk("Freed %lukB init memory\n", (end - start) >> 10);
+#else
+    (void) end, (void) start, (void)va;
+#endif
=20
     /* Mark .rodata/ro_after_init as RO.  Maybe reform the superpage. */
     modify_xen_mappings((unsigned long)&__2M_rodata_start,
diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
index 917d12b006f7..60b3ae40728f 100644
--- a/xen/common/libelf/Makefile
+++ b/xen/common/libelf/Makefile
@@ -1,5 +1,4 @@
 obj-bin-y :=3D libelf.o
-nocov-y +=3D libelf.o
 libelf-objs :=3D libelf-tools.o libelf-loader.o libelf-dominfo.o
=20
 SECTIONS :=3D text data $(SPECIAL_DATA_SECTIONS)
diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 6ce679f98f47..ae0f69c01373 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -5,7 +5,6 @@ SECTIONS :=3D text data $(SPECIAL_DATA_SECTIONS)
 # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during run=
time.
 ifneq ($(CONFIG_OVERLAY_DTB),y)
 OBJCOPYFLAGS :=3D $(foreach s,$(SECTIONS),--rename-section .$(s)=3D.init.$=
(s))
-nocov-y +=3D libfdt.o
 endif
=20
 obj-y +=3D libfdt.o
--=20
2.34.1

