Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353CC4F54C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 18:54:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159203.1487628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsZW-0001fM-Iw; Tue, 11 Nov 2025 17:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159203.1487628; Tue, 11 Nov 2025 17:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsZW-0001ay-An; Tue, 11 Nov 2025 17:54:26 +0000
Received: by outflank-mailman (input) for mailman id 1159203;
 Tue, 11 Nov 2025 17:54:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIsZV-0000bw-2h
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 17:54:25 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74995b25-bf27-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 18:54:23 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AM0PR03MB6323.eurprd03.prod.outlook.com
 (2603:10a6:20b:159::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 17:54:19 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:54:19 +0000
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
X-Inumbo-ID: 74995b25-bf27-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OycX37PFSRQ7kEwlQ7PN5S6yrKUfu9K9Kqvn/eGus2MXub8ly13AjXUA4TdH3B41fnXabLQDACYoYLOWb5C71QT9WPtTY0naPtnT6SPfeVzyUlPrZ6RDNNuXCGtNTrhtm9gYhVRLG/MEF6AcU0fkMYTtzVjGmUqU7o+fEOUoexFS8UIpYnsutmbR0S/MJbQQ9S8CXv54YLvMX3DbKIsQIdZQnc/qQiTAIieSwlQhQCMIhh6rKlRoQnxk1QX/I9whgmuXRFX5LUDeA4FJzJbkVLush/d8YNHs6g4wLp3f21zCAAA1idjG1Ufdn+RRe75scH1xI4GaFPXNGlnaj6BfzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3A7OT5/ufNOH81JW5rVPduye4mgGyIZJbGANJBYeD0g=;
 b=spZvHUtbIkqKEcf51X/JNwFYQQtSkSQ9++f5+pBEEGKCT3BT0iX+7o+iPQWjvZUcJkAiTVi1pvTL/Qn5hVuXkrQxcFJx6vfvjm14qyeX9dlVyH6mHoivTo6rrU1R2jC/oE74qU67mF5/ZUJtR/Q3H7ArbXsop0OvQQKVrykY69MItcwYPxZj3WavSYivMULadZEiVyb3Pa8eXjM+FN0/ZKbEvgkirPgx2tAX6PcCkEkR+mBh0QHpN1GpT4DMnFGILHgK6E45dN4lq/CNVTlQEPWztqG5YF5CYsWXAcfborMS7izx6UDOcMP+6BjpzQALckUAYtL0ItlWqW6flvTB5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3A7OT5/ufNOH81JW5rVPduye4mgGyIZJbGANJBYeD0g=;
 b=aKprAjUepm1ifDGVVrOQ3SNlnmUWmj4EPuLYOUrQIXEO4dqJQsub0nw07J7tjlVlID5oOEqDO6xC+rQKNHUsaX7FQuwDx2StaKKx+Ft80KIswcfoB7fetK3WOCu1ArNQrz6RjKmvdmPJykiNUD2E//oaidTXZz00nlQp98W9LnxLDm9REGjxI+qB4b+qsnzsFoZBXg1uqoLJ577Hi+rksgojQBBGZT7bgalpCbFs0EouBeMpVQFhobvt4HeKd8exMvflKp0NBLePNdnyqrfTUEvbxSGG6UjwgBiShTqU/KeFbVrEawnCvAnAV2fHQxqYtPABLQ9lzLVpTzyUInBDtg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [XEN][PATCH 4/5] x86: pvh: allow to disable 32-bit interface support
Thread-Topic: [XEN][PATCH 4/5] x86: pvh: allow to disable 32-bit interface
 support
Thread-Index: AQHcUzQz9f1HDJfsFUqvNYpVQZRYUQ==
Date: Tue, 11 Nov 2025 17:54:18 +0000
Message-ID: <20251111175413.3540690-5-grygorii_strashko@epam.com>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
In-Reply-To: <20251111175413.3540690-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AM0PR03MB6323:EE_
x-ms-office365-filtering-correlation-id: f5c5ecda-33c8-44ef-b6ac-08de214b569a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?34k2rtnZj29e9BFV853TVwW8+xOoIfwb3jUMT5PUZnH5QbROumJmvI06j6?=
 =?iso-8859-1?Q?mq+pp0BvDrLtP2sjFSlsa+RPXEPoC35wrYFVY3k2bLgSmlkF+WZZzbK+pt?=
 =?iso-8859-1?Q?70cntC+8V0U5X/pjTHsvr7mO2jUbGKV4euDuY5i93KZwCxUCHC6wv3OHah?=
 =?iso-8859-1?Q?7qZXUAkr/AMy2L4wqPE/dQPk1qudn4pcol9lNzOtlrcO3QzB9GfDbmbqiN?=
 =?iso-8859-1?Q?6Cv9YOmdqiptpM06S1Ifs1Q3Q0ETPkR4YcMA065vAbSnI+ivm5Ra7FvhWv?=
 =?iso-8859-1?Q?nGZxNyTSZmgyILkJlu1iD3PqGPzA+CTuyhHeQ56iu2dYAqdiNjyZ5UqntO?=
 =?iso-8859-1?Q?xEDzlmzvArVSMPUnxx6sF3iwGWseABrVrBfvk32FBzODLW5lVoShvaeT6q?=
 =?iso-8859-1?Q?UkjMAbpMLfOrYLqs0jrLn5lX7Cc8UkKiDe/i729LhxHo471U74b44WUMCl?=
 =?iso-8859-1?Q?+2E3HxNkO7wjyDQQu7vhT9anAVvjUJI7MsifB9QBuWCP8rHQIZ3hHJZtJt?=
 =?iso-8859-1?Q?lYdVO4h6M3YXfdYtPEyIPdmFihXfBCc1p03R73CmcGRMfyRvMJ14P40wFc?=
 =?iso-8859-1?Q?FFM3dT5+YjTfVU00mEDe46qGLjs1Cwwe2bELzDGBwKJfLF1RD6iwG56FG6?=
 =?iso-8859-1?Q?3dlvl9DMPXqTMOPxrVbaIC53FhiujoYEFiZfKBkUvw0WgVQ3NXHboQ0pI8?=
 =?iso-8859-1?Q?/TdlaMQ9OTUyH6sJ7F/NtSE+tbvvTdygLqjs04pHFRg3xZYHfVuknnGLIN?=
 =?iso-8859-1?Q?7z2REYJoeobEdjG2ms0myhNArayan7K2tYdpdDrWkhscCmgSnEUS3dpIYU?=
 =?iso-8859-1?Q?Aeefp2dFr6u/ZprabklLRxQOfOyahilPIfssZ911tikVm1dmytAg03WPPS?=
 =?iso-8859-1?Q?L0VlsQmVz2D/jP0HrqlC9EHPRFc0FVVkNVk+I0nF+zMzhTUGqaCayGyOgv?=
 =?iso-8859-1?Q?PcXtq3m+T5xdZ48k41cGy1JJaQ+FPXjRttIwrPqY4cYPFmS0pwwUDmaB4o?=
 =?iso-8859-1?Q?95wfEjBCiDlGhFfus96gV1bhQF7ulqwhnKxITku2nQuL6q+2bHKGgkAWt3?=
 =?iso-8859-1?Q?TIOOERfJi+vUUzV/MumihZkbbx7qS0dGmUCyUQGoCN005hhe03reomuM/v?=
 =?iso-8859-1?Q?SseDiGdqf0qyHPFz0pfyyEFTwhNsKZOPJF35UqY/Hbh7Pi/mK2NKmzh58g?=
 =?iso-8859-1?Q?UntIcS1dEJvtg5sj94vc0lG9upt34OeINlVTyUoPdPUYSAaQd7IcoB3+u/?=
 =?iso-8859-1?Q?IBfe3Y4Oeig9YiT+30wOsNUlqjAXNzTdlEUYJhnsTl5TOhasyZw7hNCEnk?=
 =?iso-8859-1?Q?/JzUprg6a7zEjjvxZQqHYFgMKFfSvyunKILBnciQepQMNQM+sruxEYzXDX?=
 =?iso-8859-1?Q?vxN9ng8PIriDpLH0tm4hF/ooMWdqdYxJ4uUckyTugyhzmABh2mJHPON0ix?=
 =?iso-8859-1?Q?rEm+5OnyGPqHvHImm/t4zVgfWjag1KLmpiZ2/MifFIZ5jxDckdP6ZJU0vH?=
 =?iso-8859-1?Q?Y7uqfD8GlJYfbRlRFTINPTSQSq2ez60ajVmhF+mXFhqzre+V1fSArRahRi?=
 =?iso-8859-1?Q?2ynd4oOlCf8F3fx17kM4ZoMW3/8L?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DqpJPe11S04FGPFBwb+hZMhbMyqEdFv7wYkEMaXjalc/DNiCAyO4GCt7xQ?=
 =?iso-8859-1?Q?lfXuY8Jk0I6AahwT+VF1s9PkPenioUJ1eBtwcMfEde9YWHapCfrHZ/bMOL?=
 =?iso-8859-1?Q?xR7jxONjGI9CBCNHbCobTeZFgVUHPXXbawcKZvifCHyOMnuL0JSDwGVgIb?=
 =?iso-8859-1?Q?OzElgKiBuGI5urfEb1pLUgKyxTmreATsqfKLl74CBCLmg9IV5rptbvf65r?=
 =?iso-8859-1?Q?eMDwcEmd/oKLBCfJVVs+LZL2aSzkPVrovfBGAA2Lv63Kvet4cYkVWxIzui?=
 =?iso-8859-1?Q?r0or5XHIgzQqcwe85fQ938vPx8XMSFLO//lnCjIw9k6YvrfBVthN+kPgZT?=
 =?iso-8859-1?Q?MsyBpivJM0XWxC6BTvEvDOWF/lu5/jEX26zjASXfFx0NpFfCf4zYyjicOF?=
 =?iso-8859-1?Q?BNCaGz9YBbPYwIWPDgJw4Dqg5fIR/kGvzDKgy6ktu/9FOudF+CG6chJuG1?=
 =?iso-8859-1?Q?5N1MgiL1uulCd2kQ5UMiI4SSHgpAtfDRKuyrFX8Ct7cY//e4Bq+lQLs5EJ?=
 =?iso-8859-1?Q?+OFbNM9UoOWTQgN/70P94TitHuE7+c052TDda8gIO2xPZondbB3CkdcAPL?=
 =?iso-8859-1?Q?OiBxVxxz6gHX4gJJZ3hfE8Qlp0ZaDkqjQqgU4P5y1cntrmmd6YvfSRMXuM?=
 =?iso-8859-1?Q?NONJ4Due82wSJxd7U5VUBUgouc+gd/zqA4obzp+LdhWSc9+Ps4aHHd5tyf?=
 =?iso-8859-1?Q?/CsB6nlbPRrvqhXq00Tj9yBZtI6t1s5ANkdyP9CsyF0racJLWpMO/qkqng?=
 =?iso-8859-1?Q?N0AtByKUmjCnZw/e/a0PnuWI2n6nzGl3ArWE9l537YxoQoqqdHfUq2K+sz?=
 =?iso-8859-1?Q?8mHwi+Rsj/E9S0PSwRwo9Yv3PFFplO8GjhU3X5EkcDSSC8dQOpacBzyZs3?=
 =?iso-8859-1?Q?e4IFqiClGK6amu6CFdQ92mOk9QHlqhA8NXU/WAypWckhaQRsVxpgsSR+Rd?=
 =?iso-8859-1?Q?Xv7oA+gPTa59rwJAykwjKEhPHBvL0iwKzRvNfZrnPwjMeYMKXAVqwZGhvq?=
 =?iso-8859-1?Q?SMUeOCZKrA9l8dEl1Euco1CmJpKDNgYSjLk3fRmWqE/WisvBdpRaRR4d5I?=
 =?iso-8859-1?Q?UxKCfR4ksGCLR4WBdE6i4Dhtc6LLNt/iwMuUVKvhmrKJeErAyqGwVceGeb?=
 =?iso-8859-1?Q?+bTKLvYcXsY35f12RySAa8STsorFmoo5LE8P/6I1I4+bK9vYxa8r98qzYb?=
 =?iso-8859-1?Q?w69VsCzzUPAzlB1ieiUaFREFrJS26hjH77CTtzq5cNu12ZgEallNdSSqqA?=
 =?iso-8859-1?Q?nMcLzPs9IvMM6BgLZWnzUmIvQCRjtbjFRLqeElVc0HdxtLBK+sfJldXvzV?=
 =?iso-8859-1?Q?pGzbUJQoW2tNTUW1siwl0/ioY6qSQgwClo4I8wi3/h73T0sYNnQnbe5Eqt?=
 =?iso-8859-1?Q?Q4c5ABgRp1LurYZmunfMApRG4fy9Ldy56GfskhTwZEbBSkBjLc6hhn3JqJ?=
 =?iso-8859-1?Q?hmWn+ZJuSRwJr4QDe6TsF+CHP/DVQoz5itlLchlhRda9kykwJ28nbSvuGH?=
 =?iso-8859-1?Q?QSbk8OPY8WKRWvxEGxoyLpQQ2SkdeXiLRrxwQJlQy2FiUNU1Whgat4FuXp?=
 =?iso-8859-1?Q?DDkK+5kkX6vxmzYXnmUApIMs7CMdDb8FwyXPkwQ69HoXCBVRA+Gnley4uO?=
 =?iso-8859-1?Q?qqZT65v8SEUPAwyR3+gYB0yTzNi3EsyELhKrI4mb8hxQd2ubBc0j2qBw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c5ecda-33c8-44ef-b6ac-08de214b569a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 17:54:18.0751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Um0gOsVvvd6DYlXT7iIs+/HLO4Ry7QLb03U1IRxCEkwOcZI9zL7RH+FQnkmvTyzvNHABNyCwXj3MOYnAGXlVkpTAYlh2tyk5zTPy1gQwfic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6323

From: Grygorii Strashko <grygorii_strashko@epam.com>

For x86 Xen safety certification only PVH Gusts are selected to be allowed
which are started by using direct Direct Kernel Boot only. There is also an
assumption that x86 Guest's (OS) early boot code (which is running not in
64-bit mode) does not access Xen interfaces (hypercalls, shared_info, ..).

In this case the Xen HVM 32-bit COMPAT interface become unused and leaves
gaps in terms of coverage.

Hence now all prerequisite changes are in place, introduce a
CONFIG_HVM_COMPAT option through which HVM(PVH) 32-bit interface support on
64-bit Xen can be disabled.

By default, CONFIG_HVM_COMPAT is ("y") enabled and accessible only in
EXPERT mode.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/hvm/Kconfig | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index f10a2b374448..33152f2a6bbe 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -2,7 +2,6 @@ menuconfig HVM
 	bool "HVM support"
 	depends on !PV_SHIM_EXCLUSIVE
 	default !PV_SHIM
-	select COMPAT
 	select IOREQ_SERVER
 	select MEM_ACCESS_ALWAYS_ON
 	help
@@ -70,4 +69,22 @@ config MEM_PAGING
 config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
=20
+config HVM_COMPAT
+    bool "HVM 32-bit interface support on 64-bit Xen" if EXPERT
+    select COMPAT
+    default y
+    help
+      The HVM 32-bit interface must be enabled for HVM domains to be able =
to
+      make hypercalls in 32bit mode. Non-PVH domains unconditionally need =
this
+      option so that hvmloader may issue hypercalls in 32bit mode.
+
+      The HVM 32-bit interface can be disabled if:
+      - Only PVH domains are used
+      - Guests (OS) are started by using direct Direct Kernel Boot
+      - Guests (OS) are 64-bit and Guest early boot code, which is running=
 not
+        in 64-bit mode, does not access Xen interfaces
+        (hypercalls, shared_info, ..)
+
+      If unsure, say Y.
+
 endif
--=20
2.34.1

