Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602B7B3A693
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 18:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099670.1453448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urffs-00057E-CY; Thu, 28 Aug 2025 16:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099670.1453448; Thu, 28 Aug 2025 16:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urffs-00052o-42; Thu, 28 Aug 2025 16:40:32 +0000
Received: by outflank-mailman (input) for mailman id 1099670;
 Thu, 28 Aug 2025 16:40:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCus=3I=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1urffq-0004ma-RN
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 16:40:31 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4583f2c-842d-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 18:40:28 +0200 (CEST)
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
X-Inumbo-ID: b4583f2c-842d-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjhsh9VSueEVae9Fv2lSz/ELdVuCtIFxhfm2H9s19dtQ13GeeZDViWwJwrvlKEzBC4e++g0O8FfgojVlNZQlsOQFKaXw3P9wE9BR2wHdPd4puXR/wrebJdF8kqQw80LSVVNBPkI/QidYdqEQvegATvZb8Z6RzMJplWfdsNxlse8CfhH7eGM8Ji9ebyCGfH1/n5MrDVnUY3gcbmINnO1bgcuCMnwk4CQ1HhI7T1zyqRQ8E+T3LLVa2aDjTjrbGlruH0xs/85HZdRIcdEb1qQiMvS7GekFuV+QUop8aZByegIXI5l1L93T3QVAredjImIdZKrkQn+SBySn0xAU2DrK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c++U27lSdSyCTRoYi9bnrQEHTsDjpkgg6K4INEZKcSk=;
 b=nbbHfDBqCqKKvA7xgTrBCdRDBz7rpYFYb+ksG0wBDOu9qV1nTREwHLO/zlykloisZ3KKTNubIVVgbsMixCShcoak9Xreh5Usi98/EHHFqNwx37M1XLQ8SjnQM3aYhBs8floujucyLaXQQVzQNRPhvlmiChXlNt9lAMpYnM7FpdfbvxTLPygOGaZNKBTLTm4bWMSa8nW9TbqPd6gq6J+lgOR0zSFjiIx71KNi8xbmQyenzTarjasNBmZ+832jQ1JATi9Zjnephb8doOHAi68AddG2mdq/6s6OgUw/skAOsGQu+mGcYcfBFrSZbjjvHfPrjE1Yaz8IpkoaRK3QDhVj8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c++U27lSdSyCTRoYi9bnrQEHTsDjpkgg6K4INEZKcSk=;
 b=fUjKkDfBSFJITF06FaOEI2ysJe1p9Yyxeq0Bq317UH9d4lZwtpMdekSkNbwJ3PVyDMPVyZ8Yrul1eVv7vBYu6zrygw0t3iuV3+7p4Xbz7JwkV/zj6YVEE+bfXpQ5ZZLz7in0zrj2fJHkqBg6ze5W2v+7sObMgxy0EnMiUauvMccFBbo+8peNTtcpjvXdDS9JXtBFK2P5Ui2ML16es3zMX95g0/ec2zXW1JUtixrwUt5/1aWYjuoLrf2AUCrUFuGC8SmEbM9eL1RlBxXiVEHw/fqbooIS/Qhx2CSbZ7kfPz17OHLrm6lzhpTY/NmpEioQAC+o8Ga+vFIgQLFJXWgIww==
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
Subject: [PATCH v6 1/4] xen/arm: add generic SCI subsystem
Thread-Topic: [PATCH v6 1/4] xen/arm: add generic SCI subsystem
Thread-Index: AQHcGDp0HddMWoIUiESW9wlppK7Vcg==
Date: Thu, 28 Aug 2025 16:40:25 +0000
Message-ID:
 <ffe5a45efd34d92c9f2c7307ecd0e9efc5b0d57c.1756399156.git.oleksii_moisieiev@epam.com>
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
x-ms-office365-filtering-correlation-id: 0b6822a3-bef0-40ae-9235-08dde65196af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?LeewmNwhZibRsf/oM0E4OOgUulbS207oAqTXcDD0QzXF5RLZeP9ZaYV+nv?=
 =?iso-8859-1?Q?gd3pvdLRSUl8YtooIpkjthOBXsKwbVBzGvKFGGDTIWn1p+HNm0fpUxn9zg?=
 =?iso-8859-1?Q?R4VUXsA63H7ZcoAhZev1V6NblG23BlFazV9ji+YNfxktkGeSMNP44Pg6Ei?=
 =?iso-8859-1?Q?STmp1vZT1otplTFi2LfoAj6U7X3So5kk2KiuPG6f5NQJyhGTxSSunalKkp?=
 =?iso-8859-1?Q?b7YfIhpFvMHAVjzSvqLQ2Y7bt08PBjMi/rAKJ1OyEuhT/PPJW407chig2G?=
 =?iso-8859-1?Q?y3A+3SGTBQZmRYaPFSBTG+2M7sdXv+C74RHgO4W6Gzd/ru/KgysPD48WET?=
 =?iso-8859-1?Q?HF+Ja54/hr36C/7/X+2NmXQ7GZGxD0EXucSk2J8gUz83haG/UPiRgBUo+1?=
 =?iso-8859-1?Q?7zQidrACosxsjAyd1oxPulahtmaPNjTzgyWv9Vh1/ntHZI5in4WWajtomJ?=
 =?iso-8859-1?Q?t6t+LrQVKns9PHIyIWTf7rRcEMy2uCepjB+bGpICfCX5ULpyTvnkrP9NCO?=
 =?iso-8859-1?Q?rHUsP+5uQeVG2H9FoohtqSHLVBGxmeXrG81ZZ6c3VW8xlukpReX+UuxLpw?=
 =?iso-8859-1?Q?PKrZ4seDc02Zsd+A9FpKypa6ivrf6YAk/9tj+GyH3+I45JSxZfypGra6hd?=
 =?iso-8859-1?Q?BPPIkBQlkwkpOjRiYyrGSODOiLmcsvLIdFKtXu20gd93MROJ/bCXfI1NOd?=
 =?iso-8859-1?Q?ID34gzfa76izU5I/Hy22YXEt9LaoCPHKUgecKlbh9Dkz4DTB03XbDBeTRQ?=
 =?iso-8859-1?Q?Kf149ba0Gto94vIq8ihHfA+k8XtU4XE/xqTZVP2h55UeLsElfFZU968SA7?=
 =?iso-8859-1?Q?7XMijw3X9LCdenIbjHRo0kuUH3FvC74KG8RQAtivbJqiF+9B85iT2bpUV/?=
 =?iso-8859-1?Q?wcNpOTaRL9bqyFvamBmCJOMdADxwyCuA0DylFDw8+hEW+GqbkLGJUOHf6s?=
 =?iso-8859-1?Q?ElscD1jR8V4rQ6WCDdu1I/VeP35OP0i26orKLLyf1FiOSMt/LXOaMZ9FZV?=
 =?iso-8859-1?Q?SvGwG5dOvwR2UhInPWrHu0CWpWwGot6vJ1S8SXsoCgpbIkHTQFVLVb7Y2+?=
 =?iso-8859-1?Q?gzZyw1fQ320xT4WAWTV0EU9D1NUFQffBVXWVN8+bk5JuEpHDDb2WBR0QIA?=
 =?iso-8859-1?Q?iWNFyZvam2HwiMTjx5kd56ULu+ldzYm4yhv4AXRJS99e6498RkFscvneMz?=
 =?iso-8859-1?Q?huCjXraxk/x0PaPYKO3ZFWMcBUxlMMFfezt7sebI55rMW3lk3aOlfDaKO9?=
 =?iso-8859-1?Q?X0bsr060cyCDw8kHzPenAmhPmO9JAv+4UM8i/Ypi/zIqKuBSJLuvIFRgco?=
 =?iso-8859-1?Q?+jaXbfEnFvCTTD4Knc/xUHdgTv/K3WTR81Yr0V64DRa0p7Lnfjvn+WYCcZ?=
 =?iso-8859-1?Q?9u6N/LPhVCL37OrxdcBmeG2aZ29ELEovJrN8+UAz1l52670CoLLkZUZnci?=
 =?iso-8859-1?Q?mEHeMjzEMy2D72wdBiDglQBGOlSbuPIFdNiT1fAddReMJTkjS/U2kprF2v?=
 =?iso-8859-1?Q?Jo6kFXiJeD7XRlHdjFsBkJlovA3sEtgOXBprLBVS6auQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?D2oVEzBJKxtbwpjKYCANPRUWfxyX+ZcE3d5Yr60dVsnB/NZ3C4fY87pKz0?=
 =?iso-8859-1?Q?uJE74TPq9Bws0WTCcmxSaqZv2BfQF/zOnwtQ0S2khaMA9mX0vNjPhAbEA0?=
 =?iso-8859-1?Q?w2eQKilOYCoCBvQwvXegKZ3GOKUzkBTybd/xzg2ZtczV6NMjSNcw9hmVVE?=
 =?iso-8859-1?Q?8l73pSr3FoxYV4VizjRBd+gAjS+XiU31ilucHlFJg9NVsc3R9pdTNjeuL+?=
 =?iso-8859-1?Q?tK4pBhTrP4lEglmQ6p0++yuUefgcx0or69yhqCrSCniSalmks2XrAr1pfd?=
 =?iso-8859-1?Q?T7ZExP0/bMGzduusWo5o7fCjxSohQzzlLXiSd3qQThdk2oO1d/kN86VIaL?=
 =?iso-8859-1?Q?bT6x8vhiA/hchxR6EF34cQNSfiHV3mN9LEkpnJfoXDsygr5s7UgOUySpRV?=
 =?iso-8859-1?Q?YRkvYrDqri/Cgbvl1TbKyeVjK83r/7xJ8hzFSXi1APjPAhML2QfKGFjB6Z?=
 =?iso-8859-1?Q?AX4P7N8wkro55tEeUCgJLJ+JEIJ1DddXCRfSKIWgDXKzAAolguGEIJYRqZ?=
 =?iso-8859-1?Q?ZQJZ5jHGcQtG3IBCuaYdKxUrR65uzU0VI+Lz85d94ce505otGngpGU4zlK?=
 =?iso-8859-1?Q?V2MUGYHijp5J9DBPzaMYntdKyY2xtITYzQ9N53x52eAR1rEP+jsPuqOGcv?=
 =?iso-8859-1?Q?oDx71UQuEO+P27gF40zvUWYTzhbnZnA/Zj31aKPBy26gjZmYDo8lkxuklE?=
 =?iso-8859-1?Q?k74/WZRar3SuXw1dPQoaZmkGnRwShJk2+UvGx+3GdwUcpoeMo00KGvHLhG?=
 =?iso-8859-1?Q?FfE2uTS+0zN89IIBQRa2ehaDDuMkLKLO04IBHLcjTsRe1xN9WlxbKCdVOO?=
 =?iso-8859-1?Q?iTOlQRs7tlrP+rzH9EozvrV7PawFApgV8l34PETn99MBOJTBN9uwQv6lC/?=
 =?iso-8859-1?Q?mI0JSMoUXA0qpOA5YWtt6S0YwtV1WYCF+Qr0vs6BslXWR8AtTSlJ11oozR?=
 =?iso-8859-1?Q?qjrVVQ2teY2UGECY8ch5AdfBMG2No8m60gD46OkdaSGakbyIYl8KuQB0oU?=
 =?iso-8859-1?Q?0EGEd5+c5Ses+YubYr1nBPWCmsu47NnGC4K+gaQOAy9mKEcg7ZubAMbscl?=
 =?iso-8859-1?Q?CuVCmmpkMVLFu+0vGbFthmYypn4Zm+O6ssX4WKjLRNR9Vz7SAFPqnp97Hl?=
 =?iso-8859-1?Q?z8o80sM4InyFxswKpZCUhksYpZVpuLO+aiCQLqq5xLuXXP3hzrEHMmh4Sb?=
 =?iso-8859-1?Q?DNJlhq8PVtBlGBZAjfqw2rZVJ/8/INXNL8dZkZMKibSLYCwbKvDXtkdeqf?=
 =?iso-8859-1?Q?9iOT8Qbots2qmRMcmHHFJWNZNJFdGuu5CUR8Eqd5imo3HgNvz4kn8lsCZG?=
 =?iso-8859-1?Q?hGlIJDAyAsNx85z5iY5sQGyvZT2HlfxSwQ8zbRSFkwo6IFByvrTjgiMOIr?=
 =?iso-8859-1?Q?GepBgCMmF/jEwytu1LQoswywt/268D2qP/akgsdtuL2UE/pkXlMuLwu7s0?=
 =?iso-8859-1?Q?TJT47tV9WK/VBfRaIFZjoN8GiUSuSCg1Me4DHKBNZGWL+Zu0vR+f7hzrIx?=
 =?iso-8859-1?Q?sR40qcT2mC6g6eKkygK0hZIz7jlJChqfO9JDu8rlW9t/Vk81E8LnpiUtNA?=
 =?iso-8859-1?Q?uyjtIcwhK/JuxN+8RuTAXbwrY6toMn5nthELUFE9j3ASRXC5VtUujDXtm8?=
 =?iso-8859-1?Q?04cSqNavV0qRfX/2ZIwMk8q+qsFqW3crZobzof4hcYM0TMO4ln5g21rQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6822a3-bef0-40ae-9235-08dde65196af
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 16:40:25.1171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q5vPE4vzANT7cxYgZbwLvs1OEJHN8PXa89/fo9uOGAHxzY17kIchO4iA585uI1AJTwffm796vjktYNYXTMBDf9AZJkD06Oy7IOd5vcCzCkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7705

This patch adds the basic framework for ARM SCI mediator. SCI is System
Control Interface, which is designed to redirect requests from the Domains
to ARM specific Firmware (for example SCMI). This will allow the devices,
passed-through to the different Domains, to access to the System resources
(such as clocks/resets etc) by sending requests to the firmware.

ARM SCI subsystem allows to implement different SCI drivers to handle
specific ARM firmware interfaces (like ARM SCMI) and mediate requests
-between the Domains and the Firmware. Also it allows SCI drivers to perfor=
m
proper action during Domain creation/destruction which is vital for
handling use cases like Domain reboot.

This patch introduces new DEVICE_FIRMWARE device subclass for probing SCI
drivers basing on device tree, SCI drivers register itself with
DT_DEVICE_START/END macro. On init - the SCI drivers should register its
SCI ops with sci_register(). Only one SCI driver can be supported.

At run-time, the following SCI API calls are introduced:

- sci_domain_sanitise_config() called from arch_sanitise_domain_config()
- sci_domain_init() called from arch_domain_create()
- sci_relinquish_resources() called from domain_relinquish_resources()
- sci_domain_destroy() called from arch_domain_destroy()
- sci_handle_call() called from vsmccc_handle_call()
- sci_dt_handle_node()
- sci_dt_finalize() called from handle_node() (Dom0 DT)

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---

Changes in v6:
- rebase on top of the latest master
- fix return value of sci_dt_finalize() call

Changes in v5:
- update Maintainers file. Set role as a Reviewer
- rebased on the latest master branch
- Introduce arch_handle_passthrough_prop call to handle arm specific nodes

Changes in v4:
- fix SPDX-License
- rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
- move XEN_DOMCTL_assign_device code in separate patch
- Add documentation for SCI SCMI drivers

 MAINTAINERS                             |   6 +
 xen/arch/arm/device.c                   |   5 +
 xen/arch/arm/dom0less-build.c           |   8 +
 xen/arch/arm/domain.c                   |  12 +-
 xen/arch/arm/domain_build.c             |   8 +
 xen/arch/arm/firmware/Kconfig           |   8 +
 xen/arch/arm/firmware/Makefile          |   1 +
 xen/arch/arm/firmware/sci.c             | 154 ++++++++++++++++++
 xen/arch/arm/include/asm/domain.h       |   5 +
 xen/arch/arm/include/asm/firmware/sci.h | 200 ++++++++++++++++++++++++
 xen/arch/arm/vsmc.c                     |   3 +
 xen/common/device-tree/dom0less-build.c |   4 +
 xen/include/asm-generic/device.h        |   1 +
 xen/include/public/arch-arm.h           |   4 +
 xen/include/xen/dom0less-build.h        |   9 ++
 15 files changed, 427 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c4886c1159..31dbba54bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -509,6 +509,12 @@ R:	George Dunlap <gwd@xenproject.org>
 S:	Supported
 F:	xen/common/sched/
=20
+SCI MEDIATORS
+R:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+S:	Supported
+F:	xen/arch/arm/firmware/sci.c
+F:	xen/arch/arm/include/asm/firmware/sci.h
+
 SEABIOS UPSTREAM
 M:	Wei Liu <wl@xen.org>
 S:	Supported
diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 11523750ae..74b54cad34 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -13,6 +13,7 @@
 #include <xen/iocap.h>
 #include <xen/lib.h>
=20
+#include <asm/firmware/sci.h>
 #include <asm/setup.h>
=20
 int map_irq_to_domain(struct domain *d, unsigned int irq,
@@ -303,6 +304,10 @@ int handle_device(struct domain *d, struct dt_device_n=
ode *dev, p2m_type_t p2mt,
                 return res;
             }
         }
+
+        res =3D sci_assign_dt_device(d, dev);
+        if ( res )
+            return res;
     }
=20
     res =3D map_device_irqs_to_domain(d, dev, own_device, irq_ranges);
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index c8d07213e2..0094cf9e40 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -22,6 +22,7 @@
=20
 #include <asm/arm64/sve.h>
 #include <asm/domain_build.h>
+#include <asm/firmware/sci.h>
 #include <asm/grant_table.h>
 #include <asm/setup.h>
=20
@@ -272,6 +273,12 @@ int __init init_vuart(struct domain *d, struct kernel_=
info *kinfo,
     return rc;
 }
=20
+int __init arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                        struct dt_device_node *node)
+{
+    return sci_assign_dt_device(kinfo->bd.d, node);
+}
+
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
@@ -281,6 +288,7 @@ int __init arch_parse_dom0less_node(struct dt_device_no=
de *node,
=20
     d_cfg->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
+    d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
=20
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 310c578909..0f9db7a2d5 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -24,6 +24,7 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/firmware/sci.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
@@ -699,7 +700,7 @@ int arch_sanitise_domain_config(struct xen_domctl_creat=
edomain *config)
         return -EINVAL;
     }
=20
-    return 0;
+    return sci_domain_sanitise_config(config);
 }
=20
 int arch_domain_create(struct domain *d,
@@ -791,6 +792,9 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl =3D config->arch.sve_vl;
 #endif
=20
+    if ( (rc =3D sci_domain_init(d, config)) !=3D 0 )
+        goto fail;
+
     return 0;
=20
 fail:
@@ -851,6 +855,7 @@ void arch_domain_destroy(struct domain *d)
     domain_vgic_free(d);
     domain_vuart_free(d);
     free_xenheap_page(d->shared_info);
+    sci_domain_destroy(d);
 #ifdef CONFIG_ACPI
     free_xenheap_pages(d->arch.efi_acpi_table,
                        get_order_from_bytes(d->arch.efi_acpi_len));
@@ -1044,6 +1049,7 @@ enum {
     PROG_p2m_root,
     PROG_p2m,
     PROG_p2m_pool,
+    PROG_sci,
     PROG_done,
 };
=20
@@ -1103,6 +1109,10 @@ int domain_relinquish_resources(struct domain *d)
         ret =3D relinquish_p2m_mapping(d);
         if ( ret )
             return ret;
+    PROGRESS(sci):
+        ret =3D sci_relinquish_resources(d);
+        if ( ret )
+            return ret;
=20
     PROGRESS(p2m_root):
         /*
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a9e4153e3c..039aa71439 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -28,6 +28,7 @@
 #include <asm/setup.h>
 #include <asm/tee/tee.h>
 #include <asm/pci.h>
+#include <asm/firmware/sci.h>
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
@@ -1640,6 +1641,9 @@ static int __init handle_node(struct domain *d, struc=
t kernel_info *kinfo,
         return 0;
     }
=20
+    if ( sci_dt_handle_node(d, node) )
+        return 0;
+
     /*
      * The vGIC does not support routing hardware PPIs to guest. So
      * we need to skip any node using PPIs.
@@ -1740,6 +1744,10 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
         if ( res )
             return res;
=20
+        res =3D sci_dt_finalize(d, kinfo->fdt);
+        if ( res )
+            return res;
+
         /*
          * Create a second memory node to store the ranges covering
          * reserved-memory regions.
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 817da745fd..fc7918c7fc 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -1,3 +1,11 @@
+config ARM_SCI
+	bool
+	depends on ARM
+	help
+	  This option enables generic Arm SCI (System Control Interface) mediator=
s
+	  support. It allows domains to control system resources via one of
+	  Arm SCI mediators drivers implemented in XEN, like SCMI.
+
 menu "Firmware Drivers"
=20
 config SCMI_SMC
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefil=
e
index a5e4542666..71bdefc24a 100644
--- a/xen/arch/arm/firmware/Makefile
+++ b/xen/arch/arm/firmware/Makefile
@@ -1 +1,2 @@
+obj-$(CONFIG_ARM_SCI) +=3D sci.o
 obj-$(CONFIG_SCMI_SMC) +=3D scmi-smc.o
diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
new file mode 100644
index 0000000000..e1522e10e2
--- /dev/null
+++ b/xen/arch/arm/firmware/sci.c
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic part of the SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/acpi.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/firmware/sci.h>
+
+static const struct sci_mediator_ops __read_mostly *cur_mediator;
+
+int sci_register(const struct sci_mediator_ops *ops)
+{
+    if ( cur_mediator )
+        return -EEXIST;
+
+    if ( !ops->domain_init || !ops->domain_destroy || !ops->handle_call )
+        return -EINVAL;
+
+    cur_mediator =3D ops;
+
+    return 0;
+};
+
+bool sci_handle_call(struct cpu_user_regs *args)
+{
+    if ( unlikely(!cur_mediator) )
+        return false;
+
+    return cur_mediator->handle_call(args);
+}
+
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *conf=
ig)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    return cur_mediator->domain_init(d, config);
+}
+
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->domain_sanitise_config )
+        return 0;
+
+    return cur_mediator->domain_sanitise_config(config);
+}
+
+void sci_domain_destroy(struct domain *d)
+{
+    if ( !cur_mediator )
+        return;
+
+    cur_mediator->domain_destroy(d);
+}
+
+int sci_relinquish_resources(struct domain *d)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->relinquish_resources )
+        return 0;
+
+    return cur_mediator->relinquish_resources(d);
+}
+
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_handle_node )
+        return 0;
+
+    return cur_mediator->dom0_dt_handle_node(d, node);
+}
+
+int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_finalize )
+        return 0;
+
+    return cur_mediator->dom0_dt_finalize(d, fdt);
+}
+
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
+{
+    struct dt_phandle_args ac_spec;
+    int index =3D 0;
+    int ret;
+
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->assign_dt_device )
+        return 0;
+
+    while ( !dt_parse_phandle_with_args(dev, "access-controllers",
+                                        "#access-controller-cells", index,
+                                        &ac_spec) )
+    {
+        printk(XENLOG_DEBUG "sci: assign device %s to %pd\n",
+               dt_node_full_name(dev), d);
+
+        ret =3D cur_mediator->assign_dt_device(d, &ac_spec);
+        if ( ret )
+            return ret;
+
+        index++;
+    }
+
+    return 0;
+}
+
+static int __init sci_init(void)
+{
+    struct dt_device_node *np;
+    unsigned int num_sci =3D 0;
+    int rc;
+
+    dt_for_each_device_node(dt_host, np)
+    {
+        rc =3D device_init(np, DEVICE_FIRMWARE, NULL);
+        if ( !rc && num_sci )
+        {
+            printk(XENLOG_ERR
+                   "SCMI: Only one SCI controller is supported. found seco=
nd %s\n",
+                   np->name);
+            return -EOPNOTSUPP;
+        }
+        else if ( !rc )
+            num_sci++;
+        else if ( rc !=3D -EBADF && rc !=3D -ENODEV )
+            return rc;
+    }
+
+    return 0;
+}
+
+__initcall(sci_init);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index a3487ca713..af3e168374 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -120,6 +120,11 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+#ifdef CONFIG_ARM_SCI
+    bool sci_enabled;
+    /* ARM SCI driver's specific data */
+    void *sci_data;
+#endif
=20
 }  __cacheline_aligned;
=20
diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include=
/asm/firmware/sci.h
new file mode 100644
index 0000000000..1b9a5c0c07
--- /dev/null
+++ b/xen/arch/arm/include/asm/firmware/sci.h
@@ -0,0 +1,200 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic ARM SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#ifndef __ASM_ARM_SCI_H
+#define __ASM_ARM_SCI_H
+
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/sched.h>
+
+#ifdef CONFIG_ARM_SCI
+
+struct sci_mediator_ops {
+    /*
+     * Called during domain construction. If it is requested to enable
+     * SCI support, so SCI driver can create own structures for the new do=
main
+     * and inform firmware about new domain (if required).
+     * Mandatory.
+     */
+    int (*domain_init)(struct domain *d,
+                       struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain construction. The SCI driver uses
+     * it to sanitize domain SCI configuration parameters.
+     * Optional.
+     */
+    int (*domain_sanitise_config)(struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain destruction, releases all resources, that
+     * were allocated for domain.
+     * Mandatory.
+     */
+    void (*domain_destroy)(struct domain *d);
+
+    /*
+     * Called during domain destruction to relinquish resources used
+     * by SCI driver itself and request resources releasing from firmware.
+     * Optional.
+     */
+    int (*relinquish_resources)(struct domain *d);
+
+    /* SMC/HVC Handle callback */
+    bool (*handle_call)(struct cpu_user_regs *regs);
+
+    /*
+     * Dom0 DT nodes handling callback so SCI driver can detect DT nodes i=
t
+     * need to handle and decide if those nodes need to be provided to Dom=
0.
+     * Optional.
+     */
+    bool (*dom0_dt_handle_node)(struct domain *d, struct dt_device_node *n=
ode);
+
+    /*
+     * SCI driver callback called at the end of Dom0 DT generation, so
+     * it can perform steps to modify DT to enable/disable SCI
+     * functionality for Dom0.
+     */
+    int (*dom0_dt_finalize)(struct domain *d, void *fdt);
+
+    /*
+     * SCI driver callback called when DT device is passed through to gues=
t,
+     * so SCI driver can enable device access to the domain if SCI FW prov=
ides
+     * Device specific access control functionality.
+     * Optional.
+     */
+    int (*assign_dt_device)(struct domain *d, struct dt_phandle_args *ac_s=
pec);
+};
+
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return d->arch.sci_enabled;
+}
+
+/*
+ * Register SCI subsystem ops.
+ *
+ * Register SCI drivers operation and so enable SCI functionality.
+ * Only one SCI driver is supported.
+ */
+int sci_register(const struct sci_mediator_ops *ops);
+
+/*
+ * Initialize SCI functionality for domain if configured.
+ *
+ * Initialization routine to enable SCI functionality for the domain.
+ * The SCI configuration data and decision about enabling SCI functionalit=
y
+ * for the domain is SCI driver specific.
+ */
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *conf=
ig);
+
+/*
+ * Sanitise domain configuration parameters.
+ *
+ */
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config);
+
+/*
+ * Destroy SCI domain instance.
+ */
+void sci_domain_destroy(struct domain *d);
+
+/*
+ * Free resources assigned to the certain domain.
+ */
+int sci_relinquish_resources(struct domain *d);
+
+/*
+ * SMC/HVC Handle callback.
+ *
+ * SCI driver acts as SMC/HVC server for the registered domains and
+ * does redirection of the domain calls to the SCI firmware,
+ * such as ARM TF-A or similar.
+ */
+bool sci_handle_call(struct cpu_user_regs *regs);
+
+/*
+ * Dom0 DT nodes handling function.
+ *
+ * Allows SCI driver to detect DT nodes it need to handle and decide if
+ * those nodes need to be provided to Dom0.
+ */
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node);
+
+/*
+ * Dom0 DT generation finalize.
+ *
+ * Called at the end of Dom0 DT generation, so SCI driver can perform step=
s
+ * to modify DT to enable/disable SCI functionality for Dom0.
+ */
+int sci_dt_finalize(struct domain *d, void *fdt);
+
+/*
+ * Assign DT device to domain.
+ *
+ * Called when DT device is passed through to guest, so SCI driver can ena=
ble
+ * device access to the domain if SCI FW provides "Device specific access
+ * control" functionality.
+ */
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
+#else
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return false;
+}
+
+static inline int sci_domain_init(struct domain *d,
+                                  struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline int
+sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline void sci_domain_destroy(struct domain *d)
+{}
+
+static inline int sci_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+static inline bool sci_handle_call(struct cpu_user_regs *args)
+{
+    return false;
+}
+
+static inline bool sci_dt_handle_node(struct domain *d,
+                                      struct dt_device_node *node)
+{
+    return false;
+}
+
+static inline int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    return 0;
+}
+
+static inline int sci_assign_dt_device(struct domain *d,
+                                       struct dt_device_node *dev)
+{
+    return 0;
+}
+
+#endif /* CONFIG_ARM_SCI */
+
+#endif /* __ASM_ARM_SCI_H */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 6081f14ed0..2469738fcc 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -12,6 +12,7 @@
 #include <public/arch-arm/smccc.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/firmware/sci.h>
 #include <asm/monitor.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
@@ -300,6 +301,8 @@ static bool vsmccc_handle_call(struct cpu_user_regs *re=
gs)
             break;
         case ARM_SMCCC_OWNER_SIP:
             handled =3D handle_sip(regs);
+            if ( !handled )
+                handled =3D sci_handle_call(regs);
             break;
         case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_E=
ND:
         case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END=
:
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index badc227031..aaa5e9b22c 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -228,6 +228,10 @@ static int __init handle_passthrough_prop(struct kerne=
l_info *kinfo,
     if ( res < 0 )
         return res;
=20
+    res =3D arch_handle_passthrough_prop(kinfo, node);
+    if ( res )
+        return res;
+
     /* If xen_force, we allow assignment of devices without IOMMU protecti=
on. */
     if ( xen_force && !dt_device_is_protected(node) )
         return 0;
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/dev=
ice.h
index 3bd97e33c5..cb13f7faea 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -18,6 +18,7 @@ enum device_class
     DEVICE_IOMMU,
     DEVICE_INTERRUPT_CONTROLLER,
     DEVICE_PCI_HOSTBRIDGE,
+    DEVICE_FIRMWARE,
     /* Use for error */
     DEVICE_UNKNOWN,
 };
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 24840eeaa6..55eed9992c 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -327,6 +327,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
=20
+#define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
@@ -350,6 +352,8 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+    /* IN */
+    uint8_t arm_sci_type;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-bu=
ild.h
index 408859e325..6fdd0552e0 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -62,6 +62,9 @@ void set_domain_type(struct domain *d, struct kernel_info=
 *kinfo);
 int init_intc_phandle(struct kernel_info *kinfo, const char *name,
                       const int node_next, const void *pfdt);
=20
+int arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                 struct dt_device_node *node);
+
 #else /* !CONFIG_DOM0LESS_BOOT */
=20
 static inline void create_domUs(void) {}
@@ -71,6 +74,12 @@ static inline bool is_dom0less_mode(void)
 }
 static inline void set_xs_domain(struct domain *d) {}
=20
+static inline int arch_handle_passthrough_prop(struct kernel_info *kinfo,
+                                               struct dt_device_node *node=
)
+{
+    return 0;
+}
+
 #endif /* CONFIG_DOM0LESS_BOOT */
=20
 #endif /* __ASM_GENERIC_DOM0LESS_BUILD_H__ */
--=20
2.34.1

