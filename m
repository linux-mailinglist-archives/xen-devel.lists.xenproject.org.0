Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24B9ABC316
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 17:51:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989960.1373924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2lb-0005MB-UT; Mon, 19 May 2025 15:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989960.1373924; Mon, 19 May 2025 15:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2lb-0005JR-QS; Mon, 19 May 2025 15:51:03 +0000
Received: by outflank-mailman (input) for mailman id 989960;
 Mon, 19 May 2025 15:51:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWXC=YD=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uH2la-00055d-Lh
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 15:51:02 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20625.outbound.protection.outlook.com
 [2a01:111:f403:260e::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1008bc5b-34c9-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 17:51:01 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB9023.eurprd03.prod.outlook.com (2603:10a6:20b:5b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 15:50:57 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 15:50:56 +0000
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
X-Inumbo-ID: 1008bc5b-34c9-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyLDAoIahHy3xrUhup8FivNBw6/vv1fgnmocpFcmatiuFnFFTbfOZk5//Ynf/ejappjOktwVhcv5V5c1GHKK0Dw/lKgsuJgCCcFvA8mygygUskMih0TlL1OAYCHTYMvqWzcsuNmm20YLfoA1EMJKMcdilJCctv1923ugi3lhLG9hLrSupuKLzranfGR310+LY1Mr618ueF4JPjrFuUz86daqncC5o55mjI/9wesi3hwPDymLPgO3ivR5xIGgi0xF5KSx9oC5qSU4L6Rc6ChMnXMBjgm1/zq3kK/1LAJtzH0QJ6PZniOx5UO15gKyvOSVdGr8WXjOUl3xM7auWfwKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fk5Gs0tS92nr5rjRn//mXLL1DtK3sxSAdDHVHneMlgQ=;
 b=PYEWSQpruE9CrzMnBu/nkOUGv3dg4+7+WGDyAjVnJbsIMNA2VFz55Z04eHvkSj04VC74cRtrzAn+TXRFcC556LnQlEKZKZg8RoKWlUGede6j15hiczJZUOH2gRhsHCyZjMmR4oVB8A+Ksd2u4QUk7SVic8p7FOcJo19jp42hXm8QWiyteLMpLTywdyzpdQPbnu808a0uM4hpf332tkoWaNoLFOVO+nheQtdWABzIRD22mMtfQj+L96ig+DqmWJJKfWr7Ea0XkoRiLrMbZAQqJYgSVR802byUeLJEcnFOpflLmSqRh0HhzeUQQnYI0EcxuZ/5cxxdCoCcEsjA+kajEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fk5Gs0tS92nr5rjRn//mXLL1DtK3sxSAdDHVHneMlgQ=;
 b=CyzM5+tHsZu/GgQPVatc68oxjaAVk4gash6tLbEuR8+Vg0I0+5Db5u2MQV2DqmZer9QVXhFKxLF0jZT2pNGM/sxxY7u34OuRmgaJbJCEt85hRibOhwFqc0jtCkEfv1o6qVDl4tVw0nLfdH8aiSECtbU+nhLOmd639b/szx8RLOZXQAFadr5nqfe66Ryvt+PaUKMuWr00Jgi+THtoiQIYX3JnDzDH8nq61ZxOTLC1MWAHiQxuCOUKE1UgUfPX4K1jLWddl/Y7MKxfRnSVioj1zTI2d8ZVGK+S2tmXDmwY4VWCFhG4QqRapqtNSSf4QjN7OEpCeIIaMik9U2HE7gQVbg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v4 2/8] xen/arm: scmi-smc: update to be used under sci
 subsystem
Thread-Topic: [RFC PATCH v4 2/8] xen/arm: scmi-smc: update to be used under
 sci subsystem
Thread-Index: AQHbyNXPRF0tCFj/sEGmRLZ+kuwLjw==
Date: Mon, 19 May 2025 15:50:56 +0000
Message-ID:
 <21bdecf961b60fb0094b1f722444a45228aef878.1747669845.git.oleksii_moisieiev@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1747669845.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB9023:EE_
x-ms-office365-filtering-correlation-id: 2d345ae3-acfd-44a4-d9f7-08dd96ecf1cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZZEf7nhsvJc4orGtNmwSE3GYCpExG7xmMdr/9yp0koxdtuO4QMahIH4/o+?=
 =?iso-8859-1?Q?LnyPJA8ZChNu1FbOQ5WqdM4X1JsXqIWFoEDzA5vfCUhiBheP1ume79o6me?=
 =?iso-8859-1?Q?QCst1GXZxCXG4bhP7Kbr8CvcVFJE+p61RvnKXZjDt/gO45qfa9JlJ+pHC6?=
 =?iso-8859-1?Q?txMBr2s3iBI73qJTMN1gpKw8kt8es5FEKCNVjgKp/0wzAwbTH6T8TnAs8U?=
 =?iso-8859-1?Q?TGGSCcNi9jq8D9SIOFR14A1kdqNTe2kaRS9h1GypkUhN+gEUvC8YUwqqdE?=
 =?iso-8859-1?Q?e5XdEJWX9NofgcQAV0aSk8/Z713yOZPJp/OtpKN4ALJy55Ithqa2Re2/tF?=
 =?iso-8859-1?Q?tJXVfy1GpvYfqYNnFU6pK7icMJ0/7i9M7HQK37qvqTo5gtfdXTryLcU3xs?=
 =?iso-8859-1?Q?0ORi/wvBwOaejRknAZ6kCJOYEbW6KlSUmHOLZmi71mW6oKBusZxqPjPBYT?=
 =?iso-8859-1?Q?ertn3/1CYTK+3HfvSffQATOjtc2PHzC0z8dEx63qBwzjjDDKRqDyZn3Msy?=
 =?iso-8859-1?Q?8vWnySqiBmp5bcLfWRMH+As0tj+/kpgmCPcuALM3pbvNpHVXfzHnaeishQ?=
 =?iso-8859-1?Q?mMrj+KvFsdggCEQx/WFM/4l8M6ylI7GhJwCq+3yCNb8wJSRBp1m00WP/mN?=
 =?iso-8859-1?Q?7WT+HZUMsfhQACNJC1is/nMZcfQvvebAJ5m9VUG3c5phHjNEd63Tt3R1yT?=
 =?iso-8859-1?Q?uuu6UxpkZz9h9tVcShaLogwpVAyXgj9pZI6TB4fpfSOyoYKgiBUvEaW24F?=
 =?iso-8859-1?Q?om3PwezHe68oHLmtBwzDvI3GQqJSaJfnDi+3QUAOKq5vqld4vXEtMyIpLv?=
 =?iso-8859-1?Q?1WUfNcbawfUVzWdLrOk0FKdhrMeSPeBDMJeml94mTVZPEtX8KO5yrhEAxY?=
 =?iso-8859-1?Q?tcVbUzeCaHlrF0xD8liNZ3ZdK+u/NEQb95lufCMyR0tAr3o6Kdk0R85YuY?=
 =?iso-8859-1?Q?NjYfSoo6U4yYCkp9dWyOaEigxf9wC9vujpy4cQ2jao2+ue1FVfYRqCAdtn?=
 =?iso-8859-1?Q?1sevP33tkea1/mCWjJpDAZLg1h9IAImrk0KjppAGgqy+vqLUpUrMzkW/VT?=
 =?iso-8859-1?Q?cVdxfW2huqaw/AFBGbwL95w8K9WOUvGxsKIS6rUG+6X4Pd6+MJy4RoF2xy?=
 =?iso-8859-1?Q?sp6AJI5lCfC/N25UTIfFAPwUurMtag5esDrwHQv7NpnQXid6jA3RtA58Vb?=
 =?iso-8859-1?Q?6v+Af+Ub7UmAKwhe7su1JgdgCJ3IT+bfZxOWbWOuVr2kHyKG+F4kMSrOft?=
 =?iso-8859-1?Q?NlB46ohAu6RuoomgfGnsp3qEN7cujBBQZ/WVk+uLuenUm4LKvvBG0CVuWj?=
 =?iso-8859-1?Q?ZsEPpRoMI5jI7U9mSwpz9tDZDOeRnHGGDPcEARUP+o9QdU/7t7JHOYgX0n?=
 =?iso-8859-1?Q?qI78jSPftiM6RD5A2lPeadU0j1Uol9GzrKru+LoK3KFvi42zV3ruFviafj?=
 =?iso-8859-1?Q?W3xCIb3hENc2EdX1v6YlMfTJ88pMDmoG8QNxxp4TsV0Cl5phdQEoZAF6c/?=
 =?iso-8859-1?Q?mIdMAPcrwS73XIXb1CNGr4pbtCACTJPNeNgDPuOPFdYJH1v22jE03rT/a0?=
 =?iso-8859-1?Q?d4GmQPc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?uXO2gwt9+dnb2bkxFIQOYIBXsg09mwXvFfegzKOnWJFSNp4XXDrT8cycD0?=
 =?iso-8859-1?Q?PJ5vGbF4/7XYLXWkBp4wUt01rJpHCLE1QQwy9z9yFbvh3bo984DAylIXIG?=
 =?iso-8859-1?Q?W9sYR4IjPlN+yZ0eGJDz0A6BIpP4M0Gz8+h3dq5gpyeOjSPYGOlhSJvxC1?=
 =?iso-8859-1?Q?BFEmZZ05YGPPGghLbRu5pgRQsIZD+ooUhQxK17HQ2xDPRTQR1c7L8eCiJ0?=
 =?iso-8859-1?Q?XSmq5AYp3ENRQXNq3O1D2bCDEuaYW786jvwj1+tnGO9xQchNg7PFz3LAgj?=
 =?iso-8859-1?Q?YAW664LSKi2//ax2hL983XbU2REI7fpYr9mrsDv/v7v/WXrG4WQeCx0oy6?=
 =?iso-8859-1?Q?J4qGfjeYl9LUQbw+vm63WtFRa3xsW5RRuqEaDzVyg+n2drgaw05JD/Al02?=
 =?iso-8859-1?Q?JHElecsPcDmyDGZ0Q33WzdVoHfG1m2t/JpfG5ocavEseSWd9xs0NxNk/Um?=
 =?iso-8859-1?Q?G4gucwdITr3QjNFgZHnuRHokRurz1VtrOYQak5PZ8wUvuVz2dz2nDK3jWw?=
 =?iso-8859-1?Q?5/0TEul9/N+SjE0wwRAA3VI2MlH+oPYBN3+F5Ip9JdArXBQnRY9PhxI1NA?=
 =?iso-8859-1?Q?dvx+H534ZWjCHopY7tFcGtVT3bYd+Dl5Fn68fhEpe9/TQ6CsXHOcEOZe34?=
 =?iso-8859-1?Q?ypeh0U4KrrwUG/WzmUHSN5Ys51LvRanI0/Skn9ycvZrz5f9eeLtUoMvymS?=
 =?iso-8859-1?Q?9wQIBrWTBW7jJNj52u6vRjUR6AX0PYAmPTPPBZnUOeEga+mzgRaPxKiqR3?=
 =?iso-8859-1?Q?Swsf2EQgTj5yc7L7wZxDL0DRQ4OIQV9KgD449Afqa8IfmjraXSUWlUvkQN?=
 =?iso-8859-1?Q?mWB9OXgBXkPG7c0amOtCoOqAEFb6jAdD69ZK6zIeEG02l/QrunKAtupuGL?=
 =?iso-8859-1?Q?bEXjpDQp7dXUFSwGKe1pVz8TM4QHGwW8Qn7oLOeROdkTsdLRWULSun9pdT?=
 =?iso-8859-1?Q?l9Stp+TC8Pk96X30gUQC8NdLCmnQT+JkNQ/BFtfXUW1o2c+7p7qNCGSJP2?=
 =?iso-8859-1?Q?Kc1CSIKP9dfZmVpTg2LmMH2DidbrutTyR1ZNZnMzLq9g+zjs0GMvZj4SbS?=
 =?iso-8859-1?Q?i6u7U4snM0Pn8LaJE15GpXSk9PePLRc0G749IB2iqfSq3ZaZ0IWPzDh87P?=
 =?iso-8859-1?Q?EFn6UFqXOkeBmCPLAwhqdifhxEZXXqt1hvtK2isHOlY52BzK5pg/jdKjRC?=
 =?iso-8859-1?Q?YTog8BIJkcNrPNymIRLqQIVFkfYPKzc05HDMKZsUmz3uajrxy6eLbrqulY?=
 =?iso-8859-1?Q?fidSZy6PzbCEzoKkVG1jurPKroKRWXv2/c2KzIhn5lw/+FdnH1DX6I19QJ?=
 =?iso-8859-1?Q?bPI0OY7ipzR/TVeMYIbm3v6b3Bpz2qsYQHdksCePfndH7VmfjI4GZ3xK/h?=
 =?iso-8859-1?Q?iMZpZSIfLoGFp0QRhHGzw8DqErQuIBOjHCvb1+MnjPbCSdg3EyV+R/S1IR?=
 =?iso-8859-1?Q?PM1AvtRPQbj4wlYnHhZYjrQayBkcPeCtiHtxxfdzADb8oHN3OYtqMyEpGZ?=
 =?iso-8859-1?Q?xydB7M4A1hbncEitruE+oox+jL1hFtEq1vDopVcVsZiHhidz7486yApPCh?=
 =?iso-8859-1?Q?3SHhHemJWNPtAVViyURduq/67bs1o/4WDMLXoZLGqlXEJlh/jYz9fVsT9F?=
 =?iso-8859-1?Q?MA4lzOLLpS9QDnDvMQU+d67lAphj1XgCbAe0Rf4m3F24tcfh57uYKaOA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d345ae3-acfd-44a4-d9f7-08dd96ecf1cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 15:50:56.4809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZFLy79QpGYhsxpLOEcw4g1j9kKyl+veX1ge3CfyuiNnX7+NJiz68EiOuDvR72pK7DKmW1d9KdAz3yjW/d29T78EpRmcKDI4nN1mzgTqp3Uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9023

From: Grygorii Strashko <grygorii_strashko@epam.com>

The introduced SCI (System Control Interface) subsystem provides unified
interface to integrate in Xen SCI drivers which adds support for ARM
firmware (EL3, SCP) based software interfaces (like SCMI) that are used in
system management. The SCI subsystem allows to add drivers for different FW
interfaces or have different drivers for the same FW interface (for example=
,
SCMI with different transports).

This patch updates SCMI over SMC calls handling layer, introduced by
commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls handling
layer"), to be SCI driver:
- convert to DT device;
- convert to SCI Xen interface.

There are no functional changes in general, the driver is just adopted
to the SCI interface.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---



 xen/arch/arm/firmware/Kconfig                | 13 ++-
 xen/arch/arm/firmware/scmi-smc.c             | 93 +++++++++++---------
 xen/arch/arm/include/asm/firmware/scmi-smc.h | 41 ---------
 xen/arch/arm/vsmc.c                          |  5 +-
 xen/include/public/arch-arm.h                |  1 +
 5 files changed, 64 insertions(+), 89 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index fc7918c7fc..bbf88fbb9a 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -8,9 +8,18 @@ config ARM_SCI
=20
 menu "Firmware Drivers"
=20
+choice
+	prompt "ARM SCI driver type"
+	default SCMI_SMC
+	help
+	Choose which ARM SCI driver to enable.
+
+config ARM_SCI_NONE
+	bool "none"
+
 config SCMI_SMC
 	bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
-	default y
+	select ARM_SCI
 	help
 	  This option enables basic awareness for SCMI calls using SMC as
 	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
@@ -18,4 +27,6 @@ config SCMI_SMC
 	  firmware node is used to trap and forward corresponding SCMI SMCs
 	  to firmware running at EL3, for calls coming from the hardware domain.
=20
+endchoice
+
 endmenu
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-=
smc.c
index 33473c04b1..13d1137592 100644
--- a/xen/arch/arm/firmware/scmi-smc.c
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -9,6 +9,7 @@
  * Copyright 2024 NXP
  */
=20
+#include <asm/device.h>
 #include <xen/acpi.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
@@ -16,12 +17,11 @@
 #include <xen/sched.h>
 #include <xen/types.h>
=20
+#include <asm/firmware/sci.h>
 #include <asm/smccc.h>
-#include <asm/firmware/scmi-smc.h>
=20
 #define SCMI_SMC_ID_PROP   "arm,smc-id"
=20
-static bool __ro_after_init scmi_enabled;
 static uint32_t __ro_after_init scmi_smc_id;
=20
 /*
@@ -41,14 +41,11 @@ static bool scmi_is_valid_smc_id(uint32_t fid)
  *
  * Returns true if SMC was handled (regardless of response), false otherwi=
se.
  */
-bool scmi_handle_smc(struct cpu_user_regs *regs)
+static bool scmi_handle_smc(struct cpu_user_regs *regs)
 {
     uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
     struct arm_smccc_res res;
=20
-    if ( !scmi_enabled )
-        return false;
-
     if ( !scmi_is_valid_smc_id(fid) )
         return false;
=20
@@ -78,49 +75,45 @@ bool scmi_handle_smc(struct cpu_user_regs *regs)
     return true;
 }
=20
-static int __init scmi_check_smccc_ver(void)
+static int scmi_smc_domain_init(struct domain *d,
+                                struct xen_domctl_createdomain *config)
 {
-    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
-    {
-        printk(XENLOG_WARNING
-               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
-        return -ENOSYS;
-    }
+    if ( !is_hardware_domain(d) )
+        return 0;
=20
+    d->arch.sci_enabled =3D true;
+    printk(XENLOG_DEBUG "SCMI: %pd init\n", d);
     return 0;
 }
=20
-static int __init scmi_dt_init_smccc(void)
+static void scmi_smc_domain_destroy(struct domain *d)
 {
-    static const struct dt_device_match scmi_ids[] __initconst =3D
-    {
-        /* We only support "arm,scmi-smc" binding for now */
-        DT_MATCH_COMPATIBLE("arm,scmi-smc"),
-        { /* sentinel */ },
-    };
-    const struct dt_device_node *scmi_node;
-    int ret;
+    if ( !is_hardware_domain(d) )
+        return;
=20
-    /* If no SCMI firmware node found, fail silently as it's not mandatory=
 */
-    scmi_node =3D dt_find_matching_node(NULL, scmi_ids);
-    if ( !scmi_node )
-        return -EOPNOTSUPP;
+    printk(XENLOG_DEBUG "SCMI: %pd destroy\n", d);
+}
=20
-    ret =3D dt_property_read_u32(scmi_node, SCMI_SMC_ID_PROP, &scmi_smc_id=
);
-    if ( !ret )
+static int __init scmi_check_smccc_ver(void)
+{
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
     {
-        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT nod=
e\n",
-               SCMI_SMC_ID_PROP, scmi_node->full_name);
-        return -ENOENT;
+        printk(XENLOG_WARNING
+               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
+        return -ENOSYS;
     }
=20
-    scmi_enabled =3D true;
-
     return 0;
 }
=20
+static const struct sci_mediator_ops scmi_smc_ops =3D {
+    .handle_call =3D scmi_handle_smc,
+    .domain_init =3D scmi_smc_domain_init,
+    .domain_destroy =3D scmi_smc_domain_destroy,
+};
+
 /* Initialize the SCMI layer based on SMCs and Device-tree */
-static int __init scmi_init(void)
+static int __init scmi_dom0_init(struct dt_device_node *dev, const void *d=
ata)
 {
     int ret;
=20
@@ -134,22 +127,36 @@ static int __init scmi_init(void)
     if ( ret )
         return ret;
=20
-    ret =3D scmi_dt_init_smccc();
-    if ( ret =3D=3D -EOPNOTSUPP )
-        return ret;
+    ret =3D dt_property_read_u32(dev, SCMI_SMC_ID_PROP, &scmi_smc_id);
+    if ( !ret )
+    {
+        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT nod=
e\n",
+               SCMI_SMC_ID_PROP, dt_node_full_name(dev));
+        return -ENOENT;
+    }
+
+    ret =3D sci_register(&scmi_smc_ops);
     if ( ret )
-        goto err;
+    {
+        printk(XENLOG_ERR "SCMI: mediator already registered (ret =3D %d)\=
n",
+               ret);
+        return ret;
+    }
=20
     printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
=20
     return 0;
-
- err:
-    printk(XENLOG_ERR "SCMI: Initialization failed (ret =3D %d)\n", ret);
-    return ret;
 }
=20
-__initcall(scmi_init);
+static const struct dt_device_match scmi_smc_match[] __initconst =3D {
+    DT_MATCH_COMPATIBLE("arm,scmi-smc"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(scmi_smc, "SCMI SMC DOM0", DEVICE_FIRMWARE)
+    .dt_match =3D scmi_smc_match,
+    .init =3D scmi_dom0_init,
+DT_DEVICE_END
=20
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/in=
clude/asm/firmware/scmi-smc.h
deleted file mode 100644
index 6b1a164a40..0000000000
--- a/xen/arch/arm/include/asm/firmware/scmi-smc.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * xen/arch/arm/include/asm/firmware/scmi-smc.h
- *
- * ARM System Control and Management Interface (SCMI) over SMC
- * Generic handling layer
- *
- * Andrei Cherechesu <andrei.cherechesu@nxp.com>
- * Copyright 2024 NXP
- */
-
-#ifndef __ASM_SCMI_SMC_H__
-#define __ASM_SCMI_SMC_H__
-
-#include <xen/types.h>
-
-struct cpu_user_regs;
-
-#ifdef CONFIG_SCMI_SMC
-
-bool scmi_handle_smc(struct cpu_user_regs *regs);
-
-#else
-
-static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
-{
-    return false;
-}
-
-#endif /* CONFIG_SCMI_SMC */
-
-#endif /* __ASM_SCMI_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 51b3c02973..b33c69a1c2 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -21,7 +21,6 @@
 #include <asm/traps.h>
 #include <asm/vpsci.h>
 #include <asm/platform.h>
-#include <asm/firmware/scmi-smc.h>
=20
 /* Number of functions currently supported by Hypervisor Service. */
 #define XEN_SMCCC_FUNCTION_COUNT 3
@@ -233,7 +232,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
     if ( platform_smc(regs) )
         return true;
=20
-    return scmi_handle_smc(regs);
+    return sci_handle_call(regs);
 }
=20
 /*
@@ -301,8 +300,6 @@ static bool vsmccc_handle_call(struct cpu_user_regs *re=
gs)
             break;
         case ARM_SMCCC_OWNER_SIP:
             handled =3D handle_sip(regs);
-            if ( !handled )
-                handled =3D sci_handle_call(regs);
             break;
         case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_E=
ND:
         case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END=
:
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 55eed9992c..095b1a23e3 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -328,6 +328,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
=20
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
=20
 struct xen_arch_domainconfig {
     /* IN/OUT */
--=20
2.34.1

