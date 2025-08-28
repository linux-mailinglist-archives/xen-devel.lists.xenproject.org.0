Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9C4B3A694
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 18:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099668.1453431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urffr-0004oL-87; Thu, 28 Aug 2025 16:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099668.1453431; Thu, 28 Aug 2025 16:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urffr-0004mn-45; Thu, 28 Aug 2025 16:40:31 +0000
Received: by outflank-mailman (input) for mailman id 1099668;
 Thu, 28 Aug 2025 16:40:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCus=3I=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1urffp-0004ma-5B
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 16:40:29 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3b8630c-842d-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 18:40:27 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DB9PR03MB7705.eurprd03.prod.outlook.com (2603:10a6:10:2c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 16:40:25 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Thu, 28 Aug 2025
 16:40:25 +0000
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
X-Inumbo-ID: b3b8630c-842d-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8r7yLMgwr7RtrrSjW+HIc2rCgr88k0p7iWU9+N9JykTm3TEWFHfD5bPgE+815ruqPGkq/fe+B2r47EhjCJDpQKjD2R+tRb868wJVKnuY9OtFTzeGPahQHLFDS1BmAJps3sclOHHrzVOspSvtUtUwVESYXeOqKIFwfEbtCooIQsFsC26o4bY9R96OqL4EKyIrPtOw+hSRgA6R2fSHL8c/clwakHJxx1i995CPNmO+xpM2YMHBXNqNpIQyfsWLHPjqTcbyVOBUhbYkA+6q+rsHJ4nUn2hvPsAyzJsUq0Md4PKTWlmwWlilE2kSwHT4DjKBzBAOREVfBfWvcPfXsJFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8k3yZjVyBH+b7FNfsMBari909JIcU5Yo1qjKxByf0Q=;
 b=E0sBvuV6UtP2xS1Ckgsj78oUtv+nBp+OQ+s3jsU5ZbLl05PrGjXusTUQ4T50ZnIcsfy96Beopfqs3sGooK0JTFLUtBN8tHuoHoRZIuCtIXh2PkevYvTSK+uFH0UpT1hl1l49hMRvanSGLnwX3C9rRb+xaRAFbEjjJ0lbeB/rLGgvMGmevzoNy/BSJmZ+GZ9P5gNf05Eunptq4k1QXlvd2VcI+22NuZhEWCmiCa15i6TnGRSmLEJAcvpu747ToxNxEZQji1fZ75Rc5i0FxoJNIzux98UGAl18pnhD3dOiKp//0TFeP01rkb9ic91mU7/xsTEibxPnTFzPqOEdyTe6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8k3yZjVyBH+b7FNfsMBari909JIcU5Yo1qjKxByf0Q=;
 b=DkEV1gBsocUReeMRWlD8SwzSUaOhxtA8dX/trUQWziDs/0nQ/1TGH3ISxga8S/yHIvPQD5wvy6FynURKaMHy5oScZKsOiwjS28eVMf8nyJA7OM7u/xUfNLpSbagGRR9QVDMHZU71x2eba44HSkKsVRXXyY+ipsaOGTUwod4n7a7H3GhworBJcVoCsDgZe/p88jhD0Ca2z90hAFW2oBEH284K/jHNPktKGgf8erD68BUqegozsdjLM+FmhYfGfqhAgqZ+FEWJxbmqnFE34qWfFuPu5M/+jMqnS1HiOLum0orDKb63MC08B18t/kJ8NJoUQg0FzZGJmE2+eLnQk2a0wg==
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
Subject: [PATCH v6 2/4] xen/arm: scmi-smc: update to be used under sci
 subsystem
Thread-Topic: [PATCH v6 2/4] xen/arm: scmi-smc: update to be used under sci
 subsystem
Thread-Index: AQHcGDp0dNGz8RLSIkyOshrRMf8UOQ==
Date: Thu, 28 Aug 2025 16:40:25 +0000
Message-ID:
 <8e7e9dcdd643b6681a6127d56b68536b987141af.1756399156.git.oleksii_moisieiev@epam.com>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756399156.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DB9PR03MB7705:EE_
x-ms-office365-filtering-correlation-id: bc58d78c-4209-4394-c65a-08dde65196f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4i4yb5C5Ca1WronsijnHgvw7aONqy9mFxpdThYOscFMkFa46dSZsRceFef?=
 =?iso-8859-1?Q?QzlskWSWn07krrWqzkw+pWWCtVOSoViEJ5pVGZo42Pf/itgSH+R09mRZgO?=
 =?iso-8859-1?Q?2IaYPgc6cnkgc2SumaVeITvvxtRKIMiSX3GvWXCQy/8u6LCpIz5gk+dfiL?=
 =?iso-8859-1?Q?CB3FXKO4T1+yEfg5uADRHBy/NvdoUUg+gey2f1AjGlx6y9AaLVBFQGnT6M?=
 =?iso-8859-1?Q?8f6f37P5RTvYQz12LLmsH3bMbOtOmc7xGeaaEwLH18Ee924euiswd0r1bj?=
 =?iso-8859-1?Q?3fkXqsdfWH2lLCmPSMhHArBKlL79dm3fbzI+VOor6UN9A7TfQg72qXHxjF?=
 =?iso-8859-1?Q?/uuNiuqekspbIV+9oYL6db3NUcir9Zs+nJNysmXH1Cml01u+n/NJC17iR3?=
 =?iso-8859-1?Q?nZcTOTirP14l7QfWEaIak0Y2zGMwFiDg67S5rOZaMftY9LpmdLS4GalLh9?=
 =?iso-8859-1?Q?wHxT7G0/FXgHxiFmSuXiL16uct0/B3edQfPEPKBK8UKQcQQN0AvL/wZGte?=
 =?iso-8859-1?Q?c3pvwsrH/muc0qh6tGiZJj/Y+wVrtkYCYXjsYFD7UFaTe8adfH6EYWGVcT?=
 =?iso-8859-1?Q?eSANjS71qCF4hcR2IzYPu6zp9pgt/tWuSiBCjXS7bRcTmFIHuLGOktrR7e?=
 =?iso-8859-1?Q?RBq7NABWdWLxGA5xoHf6fcdnNiXAM9zPfURCm0p6y9BD+Y4/AjMybD7ONJ?=
 =?iso-8859-1?Q?KdmzCXXMCsGOMV2LV10NvfUHHwUzwg9O0av3Yo6jmNphz6cBB7tSvt4eNZ?=
 =?iso-8859-1?Q?HWEI+ln+qPfGNmFW4nl4ih01NmQskgUHBjYzITRIeJcJisxQpLZ1+5+3JD?=
 =?iso-8859-1?Q?iSYIMSbM1ofvFySni1mlaRXjNbu0g/bVqXM+J/SGBo1W0i4FM0iAeaQPxW?=
 =?iso-8859-1?Q?TrSSv42WXHPl918Gf82ByeMXNoviZh31TyMQ7CgAaQUzrNrj2GM0RTZ6dQ?=
 =?iso-8859-1?Q?VWM2XneLjXN9HypG3mbMewBqss42Tpbv3LMZM+0hJ8u0SCPVRnBNu+UMj9?=
 =?iso-8859-1?Q?MXPKq4ikaqm3Sm2dgrfT63C+ZF7g/dV+plMI5KIgl/5mLP/W0b+V12Ttvz?=
 =?iso-8859-1?Q?NGr8LdYu/e5p5zHdPaK55FMi4kiSwL7XKRoOgLH9M9nxkEW7c8fU8iuKm7?=
 =?iso-8859-1?Q?SWvV+iKrH42rSU179kAJO7RTGwmBHM8FoHANEqfXSi1WtHVtZYQUXq9FU3?=
 =?iso-8859-1?Q?5B9ieogEf7dXYFIgQrmDBMtlTwb7OcHZ4Jq9xjPmoJMn04qX8/27pNJ1Pn?=
 =?iso-8859-1?Q?eEjBvc5rijb+kf82/nm8J00U3QPJHkZGt2WFdnMYF7QuLWp2q2VMiQCFND?=
 =?iso-8859-1?Q?qVQNub4DWxlWXFb5h+ywwJFN4IoJFtyiS0kULXkCplNqXIyIK4oktO7dtn?=
 =?iso-8859-1?Q?yQrbu2Ofs/KuJb1d6gDgwj/7RMu/u3Nqp9Hi/yEZPRerNSJxI9lVStXInr?=
 =?iso-8859-1?Q?NfsBcGGCJGEzR0e1TEQh7zHVgDM4Rpg+Z3FMgbFGhweXRdQYKn19DFaNuK?=
 =?iso-8859-1?Q?G/TfXY6doyUoUsMwgeXuiQX+xeC7tygLarKlpmMbYYmA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4dZd2tMvKFiX67w/38zoJfgZFBwg2XhEmI5jBbcbFzCk//HxurOTxkF4L9?=
 =?iso-8859-1?Q?d3alA4AG6VRvsrixm1yyLU3PX9ERNLLMLC3hdsqAzg5SpA6RjJ9ktL4TJW?=
 =?iso-8859-1?Q?MrfJL6Vc0UWLQY/CfT/t/BnTmfqYtCgDFgf8q8G00EzYq/j1ZFAOdVhtd2?=
 =?iso-8859-1?Q?WCiUUeZ4TT3JRAMnIqtNSCTWRCmN0VnQ6v3swxEDUpqN7K+N06vCxHPuz0?=
 =?iso-8859-1?Q?ddWPRmS91IpFA8yuOhr0hqUuvhbLwRoBe5KFvDXhUf4iw+aIgSeere1+0n?=
 =?iso-8859-1?Q?glVhqTLkhxcocu8oONU8owCzyfBIUBBRHVEPzVZFzAoRZ5HNUcYOU5wuHu?=
 =?iso-8859-1?Q?rO1BUcJ5Jq2pDYWDNIk+3khC/934Cqf3x7eNm6Y7mATU9XNZrdSjM7Y0IB?=
 =?iso-8859-1?Q?pKnfCL7kHAZJiBFQJhBnm5eJxQtAyaor7U61vF0NFhOwaLUk4B8bpPggbJ?=
 =?iso-8859-1?Q?hhJdieonT5xzL2LZ+KBu93zc9gLeZPQRSCnhhX+UdMt64rFGFgbL1J5yIZ?=
 =?iso-8859-1?Q?nomF9X7id4kFUrBC2hR2XNOvFKh9IvJc6PzC/DdkJ/NEdeV6BdcwbJiwfK?=
 =?iso-8859-1?Q?24CV4hg11LfbKPOqIzELnSxSxHuWn6CXTOufCRSJi9Tlv+/oTMrCIkcYqB?=
 =?iso-8859-1?Q?yGYouskMVGDPlWCxrxUM4C+Bk6ukaQZXnXXpff1PIiqJQgutXckgKYxCDR?=
 =?iso-8859-1?Q?Xg1Y/y8f+CfkkutJiNj//03v/0S3E1VzMSSUH0WUQlSETdCpG5rk58R+DU?=
 =?iso-8859-1?Q?Vq8H6Xhic6m76xDBQ1jBphGZAPiwyaQRdhHJYLv6jO4dIRziTcowCkhm00?=
 =?iso-8859-1?Q?+ED11YPPWZLJlff6uLND2BlZ1hfH60ZOHpveE2eaHCMt8nxWhuzkqhCgsB?=
 =?iso-8859-1?Q?mVNsfqVRQ8ruat7Tz+G78q8bgdQiMHk5g49D5E9dQ8XbPqGpcV6Y9bwvz2?=
 =?iso-8859-1?Q?L1AInojMKG2Z64zMpcvQOjBRkKUMIb1CXqkFY5shzZCpdWvIOULBQJHmeH?=
 =?iso-8859-1?Q?c/McNihMuMkD08BA+XiZT5jR718jHDNpLPMosQ46kSeiinlOB95GKQSJbd?=
 =?iso-8859-1?Q?+N5KSjzW8a1yFWP1X0jhE+/eOi8S7XrSaV9RLN1wSSwKeJewyPyTTQWC7H?=
 =?iso-8859-1?Q?E6D2DWsrDjQAFsEtQvwow/lyJZ8O9AjK8MdYGILZl00bpI8g/Ptv/9MR9J?=
 =?iso-8859-1?Q?0bBO/EAxG5kcytDcPjXa8FwLeUbTUgUwuLVfG1rAMubn9GVoCuveQKfLWH?=
 =?iso-8859-1?Q?6f01NoJLjhLXtAGJRLzrM/fWot9y8Vu22RiqIWcSs96lo+LiUy+vH45Vuy?=
 =?iso-8859-1?Q?SGP/ausdcbuxHVOHyFCT3WOO7G8au+j9t0+UhiDEP/5Ma+FfJLHhm199xJ?=
 =?iso-8859-1?Q?tqCJPDYhY5+lyfRnBMKzLrfrLu/vJo7TAr1fPIWcCIHz/wdwiEFIyya+gu?=
 =?iso-8859-1?Q?67MJooWFKSUfOBaxcv7R+4we3GTwzs5Y98wVGZQIc7TGwzQMNU4bYFtaUQ?=
 =?iso-8859-1?Q?9BTzSJtfB6vvDQlxrwNtpTKCzkam1IAwhtlpiXkcJlLogRFshgayIPrrMa?=
 =?iso-8859-1?Q?YUjvKtw7UPsi/HV9T7FLMZzntVCvpq++vn5lMexJhmL2BgnXnGDNN3p1P8?=
 =?iso-8859-1?Q?JxhP1GqMO3iAGHsCJ3F4X8KOR4C9nFjBJvJ21/bh0j1lFTULb+e5wmeg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc58d78c-4209-4394-c65a-08dde65196f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 16:40:25.5397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pd6OAw0jS/S7rg00jZMSadmr6gKPVSe912lvrgqY7vZ54AopYOruIdERP+6LMpbmkYFyLsf3WYuFpOVYBW46Iiq6muteabxWmtp3HUgDXSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7705

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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---

Changes in v6:
- add R-b tag

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
index 2469738fcc..78d5bdf56f 100644
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

