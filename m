Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCMlHEphumnFUgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 09:24:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DEA2B7DF7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 09:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256382.1551058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2mCQ-0006jw-O2; Wed, 18 Mar 2026 08:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256382.1551058; Wed, 18 Mar 2026 08:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2mCQ-0006gs-Ky; Wed, 18 Mar 2026 08:24:18 +0000
Received: by outflank-mailman (input) for mailman id 1256382;
 Wed, 18 Mar 2026 08:24:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cC/N=BS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1w2mCP-0006gk-4b
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 08:24:17 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9979f9b-22a3-11f1-b164-2bf370ae4941;
 Wed, 18 Mar 2026 09:24:15 +0100 (CET)
Received: from AM6PR10CA0080.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::21)
 by AS2PR08MB8309.eurprd08.prod.outlook.com (2603:10a6:20b:554::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 08:24:07 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:209:8c:cafe::a2) by AM6PR10CA0080.outlook.office365.com
 (2603:10a6:209:8c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 08:24:05 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Wed, 18 Mar 2026 08:24:07 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PA4PR08MB7643.eurprd08.prod.outlook.com (2603:10a6:102:261::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Wed, 18 Mar
 2026 08:23:03 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 08:23:03 +0000
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
X-Inumbo-ID: d9979f9b-22a3-11f1-b164-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mjgHQUOJi1HRJxU76bDSg/RA8J35tDV1xYI7SXr4Ts382I3Ny4jFCLQC0X9NUlX+EKDHQKwGXEvB8/kh8LXB3fkIyuybkTfAbMOUJMY0VUylupDFGNGJi8DZqK9rO9f/8nuzvatKbpHEmV46FWlWzo184NMDHg66l6u2FOzbQtj3sAElRtikefzubOrKBvB6B6Hxq+pnGevqWVHQflMR5Xxlb4la1Sq3eUV3bqbz/b5JxRXBcT8UlYxuQZirChTulGImSPnGbJn0V3sSL77IWTFfV3T74P7MAuu7wE/IWV51DMv3YelZ+liECBrOArIgcM92VvZKxjWxeWQ9BPOo4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtaGb9PXEb1Llg2Wp3eP4ELTAhLAmxG8cgEzoFAImbs=;
 b=KfhpGE5oqhalaNl+fBCSG4q/Q1+XORAPGqX/IYEdVqsqNVa0wwnrmZk9TZNZ+HR1jQ1BUjFcSIbz4VS2U2naibkQMoEJdGdorSOzB7tcHTva2kPbn4hZsehNFkqX95ndwPA7wJjXScefWKeyAJ0hOokofTAOWJfFjgC9KgFLFUmB8dWfXDv5Ld9LyJU8if+KPwrtSpR11XMZNItaRBhlyf4esv9IKev1AKaF3anz2Nem0AzLejCDA8NDSLvyRD1P9i53NFu5X7M8BK/a5CJPh6RHQ1rczS/BpoVqOiU2dg6sghYSSY33kl9fYfUaEOouEaSl2IgWTR6UeenuiC/Y2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtaGb9PXEb1Llg2Wp3eP4ELTAhLAmxG8cgEzoFAImbs=;
 b=Wn2hq27Msxc/UWijw3y7ED7VsEn/dMdAz8vSbdQpjaOayLC0WWDqiAEMa5QB1HS1JeEXkONEcFUEHDm7JADoqXhnUEZiBPQ4+VvinpPqMJMSpM7pxdCPH4avsTIG/qgZaZRK7ERIOcrhflK1UfdEUpdT9SqfD/vgVySJBQXWFow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aq0vymqEcxNYStp6K6sETu66kzuoKRTamax9TK228+ZNrPr6RWneEf6ToplkwNyhyZj4pEYBgRVkZzB9lQhlFC14Bvo0XwF4NJor0byJTcr/vAMEKF+oiTeemSAOZ0GQBnzlUzmz0/DP1AJp/8IXlT/oKmBwEq+95yyb3b3LiXJjkBYDCUzkMu0doxquTyaA3Y3Lkl5atZpHDUACRAQ2S79Hjb2sfjMI7KP+PlTSC7c/zUsXv0BayW9DamVLI4JyF0rt4ec28Fsm2B7CVBqADD48EEsD8P8YeM9k/aKVzREIepQlc3ZrNg26two4h8mjp+Ymf1e9kC+cmtYpLfq7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtaGb9PXEb1Llg2Wp3eP4ELTAhLAmxG8cgEzoFAImbs=;
 b=lyHqVzbfTBDl0XczKyZE9Bft+QywUhH99Qlql6ukaD5NI+T+VThi+GPhpXN3hgSMsMg2kIAhDziPlwbRUZPWX+n+7Nj6QiJd+lVtq+decxk19O7JUqbzeptHFSWrmeWiwAMf3HWWyPX+izxaNMfFNCzf59ug39GWSAglPQiloko2HTXAfZ63XRvCD2zhpXol4NTGXZjWJ+MXhrVlMVU/qfTdR8H/PseBgTKCZ/vpyeTFTvQXcRYtvczHLA6SidvSVYx6226SRob6BsUwiEgTpC1PUu6VPNit175rTmxQJ0m+XnwbNfw8f3uP/beoBeXtaGZbIEQGqX/6pP/TgA62Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtaGb9PXEb1Llg2Wp3eP4ELTAhLAmxG8cgEzoFAImbs=;
 b=Wn2hq27Msxc/UWijw3y7ED7VsEn/dMdAz8vSbdQpjaOayLC0WWDqiAEMa5QB1HS1JeEXkONEcFUEHDm7JADoqXhnUEZiBPQ4+VvinpPqMJMSpM7pxdCPH4avsTIG/qgZaZRK7ERIOcrhflK1UfdEUpdT9SqfD/vgVySJBQXWFow=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH v6 3/5] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v6 3/5] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHcsgQlrSHMHm92lE+sySYP2damirWz/MsA
Date: Wed, 18 Mar 2026 08:23:03 +0000
Message-ID: <4E68F534-3851-4FB3-9ADC-A01DC323F819@arm.com>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
 <206261ba0b60ebcff25e083c22d9e9b885645199.1773307749.git.mykyta_poturai@epam.com>
In-Reply-To:
 <206261ba0b60ebcff25e083c22d9e9b885645199.1773307749.git.mykyta_poturai@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PA4PR08MB7643:EE_|AMS0EPF000001A9:EE_|AS2PR08MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: 285d25be-b061-4ef7-aa9b-08de84c7b91e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 QSK93Fc6xPaD9tLLc0FE42U6OCh5rifrKD+/zfGMn7nWU6FXiN9+plqLaSE6L4rl7ng9j4MU/LputY/+OiKLaEEu9PmMXiF+oIBJuXwxnqQvv1ul2vXD82v7T0aBWCHH+fxglJ4OFnUdLb5CwO6G6YudP3/GhBz9qelhbR9e8zhHhVsPRlUAiHoq+w3XJWzkIiLikzniEMXwNkLVMYUw3vLYdRGw2sBgK3okLxeAAwFqrlGwBVEdTjerr8Drw3ySoH9b1yBVvPubXA1K5f2iVrEn8PuScn1wWr386WfFK9HqMRltM8FHTwth0AylE2XBDwJtNdJ5tYKGSjol0+O8EJ96eeiQym/XK4B53FgxTbyf68Cn+mjRA2iDreazGp8kqO02reVteGK4+hgM0tpQMuZsK1mTO4JgnmITwti2z3/zQfeH54TTB7SVthdmoHigU0z534hqvNVuTOjSKfdTil9lfJgzJI2yEhue1KHyaG2EjTdDJ1i32SzvYyVHzh6o+FnjSqr+hvG+saSiXMYZTOgnWtgDmaAcOWj+pNsTY9Rdi9bRmmRlcJWSRjysWIhSHrE8aU2SoMqN5PKA7QiSRXeWLKacpTYE8r7fzxJ062F957MDUj6TKwgPd03hdmafB1AYKAJaVMVyskrfqmI0xrl/dYzY4pJGnn7IS40Ev3cT8ltSu/B48uyRqas3h04v+pmBivP60XpYWmFUXeSvZSWCVwdKndhDNdYMMFGM+LQGVIRdui6M+YtxSYZhWOfYcMz8/Naxb3F3hA6hXH2PAYpi3logcJ3M72kRx1gFv1Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <52134D3A5AC95B4AB21A99AA8856E926@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 GKLqPMBdxzLKIK876gYmRW2bgAYi4lrDYb6RXY9VQYbUoEjTHCfxD4JLheeThzAv6fHNLjrxVb/sj/rLT8dwAecq5pdBSUHcmjNScC4ElHLOQqB3zF8UbWXOcDHjsj1J7qdI9YaMWzul3IGiITKqooEZQ0uU4GMvDrh7glfW73xa3A/fM3ufMPwzxyKwl8HecUKwGsAhJGnsXdefJVlubJv8orEBxNfRTwuUZFE5OfIbmpPjRe5tBQWc2SynMHsZlCc7ADE2rCv1a0V0Mqn+clyOeBtExWExl7vrzy20RKz1Gec3ECyNkrmiFxDs/oiGIhJCFXu+X3R1gs84le2fHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7643
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8d3bcd9a-d2d6-4701-8b79-08de84c79306
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|14060799003|35042699022|36860700016|1800799024|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vv8kfHOjKmePD9Yv66O8gr9kv9Z2DDy8Iw3mU2AmvUoeGNP030rkVJAeEe0P0EDsUyuNjiAEJvaMtN7qO0N0XKT6r4o9EODsu4FbJ/ZF/C/Q8cgIEqyI/hq9f3sYHnmFdqkL0dAmLjl2RVSfZOngMn7esBm+1bL6rvGiBim/rB5jRV8F7Yz1agAKpdJ/JBk/3cyR9oGUigRcTWQePwHwgiExyh/IwTPu9avchU65WOR45t0++Y3NO1yqnbWpyZfD3n8DemtOVRibbK1f6E2orr158+p+144xAHGa3QNi6oGn8fQmFAGrX40WDPh3K+TSzqTro1ygMICCskxX7MYfnVcLuCL3d96KYmLNmTevhA9AW+AYC/nyl/rzA2rGs2n6QTaARsaLyhrHKK4yJyRzDqc89gD4ie07txXIIUOQEuVPcYRf2bOXPNBwc1Qc7WuVfMaWVGFGLX1gaiN8YKxqGlsS85qwRMXZbkaL+FBeV2KN78jKKkH8uDuu4rR62z9/5HjFFncVwLldwdJT8l+L+CF8lhpXl3xKkhkQN7bv95CyCadKrTRAujRgTkC0jTiqkNAYEjWeY/pWfFpU4CFTNbTYKXlVwlZtRYWEVHBdsnZlNhJrhXYElcSTLF/d7gXWrQWLKjfC3Whi1Qr3M9p8CLkjNv+6bJsecNz/XsN6A/p3JbVQ/PWf3UV9kvR/wo9DM+kcXeLN2z7hpaR7+GC9KhNBvjTvTKzylMwItn+Hxq/QATYhQo2wiEF7o4vS3oN6cBO09K4ugEH2ZttxsTUWJQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(14060799003)(35042699022)(36860700016)(1800799024)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u5fvsfUZwfvE2UqwMWeqCEqyFPeRwFLi+6NA96PIXfYGgdDc2hDrQ2Ygj27slHhve4f0WhW+8T649x3ghlVsNf5V57aaTTO13/xjLKz38vWa5Ae4M7b19RQMoUBz8iyojaobhWV0Ty2jvBKl56DomC1y9TecK4lJ3jd0Cc4TDAACI1uDANQE7N15wqqkIHx1o0PfE4uV8jTj86lX59wGCrdTwC/osr/vgEIl+D7938ZmLpHwT9iNgfgp9HxbCccOpPtW3Lnz9Qa/R8ftdAFWM1nJDdPIQD/Cmq0aKtghRyXgNyiHpz2SgDkPfnjtJrNjOhuNJuBDWplPzW5z16l6DomwQeTRd8p+gEHk3nwO4f8xRY6mAr6ZMm6LLV5dgbncVVpTMgr7l0jFzhaS4naahj6fjdgSMkU6Lrn3peJwrFbacwZbpHCjSgY+6DVe7zkW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:24:07.1200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 285d25be-b061-4ef7-aa9b-08de84c7b91e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8309
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xen.org,amd.com,epam.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: B8DEA2B7DF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykyta,

> On 12 Mar 2026, at 10:39, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote:
>=20
> Move XEN_SYSCTL_CPU_HOTPLUG_{ONLINE,OFFLINE} handlers to common code to
> allow for enabling/disabling CPU cores in runtime on Arm64.
>=20
> SMT-disable enforcement check is moved into a separate
> architecture-specific function.
>=20
> For now this operations only support Arm64. For proper Arm32 support,
> there needs to be a mechanism to free per-cpu page tables, allocated in
> init_domheap_mappings.  Also, hotplug is not supported if ITS, FFA, or
> TEE is enabled, as they use non-static IRQ actions.
>=20
> Create a Kconfig option CPU_HOTPLUG that reflects this
> constraints. On X86 the option is enabled unconditionally.
>=20
> As cpu hotplug now has its own config option, switch flask to allow
> XEN_SYSCTL_cpu_hotplug depending on CONFIG_CPU_HOTPLUG, so it can work
> not only on x86.
>=20
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>=20
> ---
>=20
> v5->v6:
> * fix style issues
> * rename arch_smt_cpu_disable -> arch_cpu_can_stay_online and invert the
>  logic
> * use IS_ENABLED istead of ifdef
> * remove explicit list af arch-specific SYSCTL_CPU_HOTPLUG_* options
>  from the common handler
> * fix flask issue
>=20
> v4->v5:
> * move handling to common code
> * rename config to CPU_HOTPUG
> * merge with "smp: Move cpu_up/down helpers to common code"
>=20
> v3->v4:
> * don't reimplement cpu_up/down helpers
> * add Kconfig option
> * fixup formatting
>=20
> v2->v3:
> * no changes
>=20
> v1->v2:
> * remove SMT ops
> * remove cpu =3D=3D 0 checks
> * add XSM hooks
> * only implement for 64bit Arm
> ---
> xen/arch/arm/smp.c                |  9 ++++++
> xen/arch/ppc/stubs.c              |  4 +++
> xen/arch/riscv/stubs.c            |  5 ++++
> xen/arch/x86/include/asm/smp.h    |  3 --
> xen/arch/x86/platform_hypercall.c | 12 ++++++++
> xen/arch/x86/smp.c                | 33 ++--------------------
> xen/arch/x86/sysctl.c             | 21 ++++++++------
> xen/common/Kconfig                |  6 ++++
> xen/common/smp.c                  | 35 +++++++++++++++++++++++
> xen/common/sysctl.c               | 46 +++++++++++++++++++++++++++++++
> xen/include/xen/smp.h             |  4 +++
> xen/xsm/flask/hooks.c             |  2 +-
> 12 files changed, 137 insertions(+), 43 deletions(-)
>=20
> diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
> index b372472188..984f863a9a 100644
> --- a/xen/arch/arm/smp.c
> +++ b/xen/arch/arm/smp.c
> @@ -44,6 +44,15 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
>     }
> }
>=20
> +/*
> + * We currently don't support SMT on ARM so we don't need any special lo=
gic for
> + * CPU disabling
> + */
> +bool arch_cpu_can_stay_online(unsigned int cpu)
> +{
> +    return true;
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index a333f06119..8f280ba080 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -101,6 +101,10 @@ void smp_send_call_function_mask(const cpumask_t *ma=
sk)
>     BUG_ON("unimplemented");
> }
>=20
> +bool arch_cpu_can_stay_online(unsigned int cpu)
> +{
> +    BUG_ON("unimplemented");
> +}
> /* irq.c */
>=20
> void irq_ack_none(struct irq_desc *desc)
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index daadff0138..7c3cda7bc5 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -70,6 +70,11 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
>     BUG_ON("unimplemented");
> }
>=20
> +bool arch_cpu_can_stay_online(unsigned int cpu)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> /* irq.c */
>=20
> void irq_ack_none(struct irq_desc *desc)
> diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/sm=
p.h
> index 3f16e62696..cb3e0fed19 100644
> --- a/xen/arch/x86/include/asm/smp.h
> +++ b/xen/arch/x86/include/asm/smp.h
> @@ -50,9 +50,6 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_=
t pxm);
>=20
> void __stop_this_cpu(void);
>=20
> -long cf_check cpu_up_helper(void *data);
> -long cf_check cpu_down_helper(void *data);
> -
> long cf_check core_parking_helper(void *data);
> bool core_parking_remove(unsigned int cpu);
> uint32_t get_cur_idle_nums(void);
> diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hy=
percall.c
> index cd4f0ae5e5..e745151790 100644
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -735,6 +735,12 @@ ret_t do_platform_op(
>     {
>         int cpu =3D op->u.cpu_ol.cpuid;
>=20
> +        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
> +        {
> +            ret =3D -EOPNOTSUPP;
> +            break;
> +        }
> +
>         ret =3D xsm_resource_plug_core(XSM_HOOK);
>         if ( ret )
>             break;
> @@ -761,6 +767,12 @@ ret_t do_platform_op(
>     {
>         int cpu =3D op->u.cpu_ol.cpuid;
>=20
> +        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
> +        {
> +            ret =3D -EOPNOTSUPP;
> +            break;
> +        }
> +
>         ret =3D xsm_resource_unplug_core(XSM_HOOK);
>         if ( ret )
>             break;
> diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
> index 7936294f5f..b781e933f2 100644
> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -418,35 +418,8 @@ void cf_check call_function_interrupt(void)
>     smp_call_function_interrupt();
> }
>=20
> -long cf_check cpu_up_helper(void *data)
> +bool arch_cpu_can_stay_online(unsigned int cpu)
> {
> -    unsigned int cpu =3D (unsigned long)data;
> -    int ret =3D cpu_up(cpu);
> -
> -    /* Have one more go on EBUSY. */
> -    if ( ret =3D=3D -EBUSY )
> -        ret =3D cpu_up(cpu);
> -
> -    if ( !ret && !opt_smt &&
> -         cpu_data[cpu].compute_unit_id =3D=3D INVALID_CUID &&
> -         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
> -    {
> -        ret =3D cpu_down_helper(data);
> -        if ( ret )
> -            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
> -        else
> -            ret =3D -EPERM;
> -    }
> -
> -    return ret;
> -}
> -
> -long cf_check cpu_down_helper(void *data)
> -{
> -    int cpu =3D (unsigned long)data;
> -    int ret =3D cpu_down(cpu);
> -    /* Have one more go on EBUSY. */
> -    if ( ret =3D=3D -EBUSY )
> -        ret =3D cpu_down(cpu);
> -    return ret;
> +    return opt_smt || cpu_data[cpu].compute_unit_id !=3D INVALID_CUID ||
> +           cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) <=3D 1;
> }
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index 1b04947516..35239b73c1 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -49,6 +49,7 @@ static void cf_check l3_cache_get(void *arg)
>=20
> static long cf_check smt_up_down_helper(void *data)
> {
> +    #ifdef CONFIG_CPU_HOTPLUG
>     bool up =3D (bool)data;
>     unsigned int cpu, sibling_mask =3D boot_cpu_data.x86_num_siblings - 1=
;
>     int ret =3D 0;
> @@ -89,6 +90,8 @@ static long cf_check smt_up_down_helper(void *data)
>                up ? "enabled" : "disabled", CPUMASK_PR(&cpu_online_map));
>=20
>     return ret;
> +    #endif /* CONFIG_CPU_HOTPLUG */
> +    return 0;
> }
>=20
> void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
> @@ -115,24 +118,24 @@ long arch_do_sysctl(
>=20
>     case XEN_SYSCTL_cpu_hotplug:
>     {
> -        unsigned int cpu =3D sysctl->u.cpu_hotplug.cpu;
>         unsigned int op  =3D sysctl->u.cpu_hotplug.op;
>         bool plug;
>         long (*fn)(void *data);
>         void *hcpu;
>=20
> -        switch ( op )
> +        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
>         {
> -        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
> -            plug =3D true;
> -            fn =3D cpu_up_helper;
> -            hcpu =3D _p(cpu);
> +            ret =3D -EOPNOTSUPP;
>             break;
> +        }
>=20
> +        switch ( op )
> +        {
> +        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
>         case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
> -            plug =3D false;
> -            fn =3D cpu_down_helper;
> -            hcpu =3D _p(cpu);
> +            /* Handled by common code */
> +            ASSERT_UNREACHABLE();
> +            ret =3D -EOPNOTSUPP;
>             break;
>=20
>         case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index d7e79e752a..bb73990355 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -637,6 +637,12 @@ config SYSTEM_SUSPEND
>=20
>  If unsure, say N.
>=20
> +config CPU_HOTPLUG
> + bool "Enable CPU hotplug"
> + depends on (X86 || ARM_64) && !FFA && !TEE && !HAS_ITS
> + default y

I do not see this as something that should be enabled on arm or
depend on any of this.

FFA could work, conditions depend more on the rest of the system
than on FFA code, same for tee which depends on TEE (and actually
FFA depends on TEE).

So i would rather see this as default n on ARM64 and only depend
on HAS_ITS and maybe flag this feature as EXPERT on arm64.

What are others thinking here ?

Cheers
Bertrand

> +
> +
> menu "Supported hypercall interfaces"
> visible if EXPERT
>=20
> diff --git a/xen/common/smp.c b/xen/common/smp.c
> index a011f541f1..e2bf82856e 100644
> --- a/xen/common/smp.c
> +++ b/xen/common/smp.c
> @@ -16,6 +16,7 @@
>  * GNU General Public License for more details.
>  */
>=20
> +#include <xen/cpu.h>
> #include <asm/hardirq.h>
> #include <asm/processor.h>
> #include <xen/spinlock.h>
> @@ -104,6 +105,40 @@ void smp_call_function_interrupt(void)
>     irq_exit();
> }
>=20
> +#ifdef CONFIG_CPU_HOTPLUG
> +long cf_check cpu_up_helper(void *data)
> +{
> +    unsigned int cpu =3D (unsigned long)data;
> +    int ret =3D cpu_up(cpu);
> +
> +    /* Have one more go on EBUSY. */
> +    if ( ret =3D=3D -EBUSY )
> +        ret =3D cpu_up(cpu);
> +
> +    if ( !ret && !arch_cpu_can_stay_online(cpu) )
> +    {
> +        ret =3D cpu_down_helper(data);
> +        if ( ret )
> +            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
> +        else
> +            ret =3D -EPERM;
> +    }
> +
> +    return ret;
> +}
> +
> +long cf_check cpu_down_helper(void *data)
> +{
> +    unsigned int cpu =3D (unsigned long)data;
> +    int ret =3D cpu_down(cpu);
> +
> +    /* Have one more go on EBUSY. */
> +    if ( ret =3D=3D -EBUSY )
> +        ret =3D cpu_down(cpu);
> +    return ret;
> +}
> +#endif /* CONFIG_CPU_HOTPLUG */
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 5207664252..51a3dd699a 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -483,6 +483,52 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) =
u_sysctl)
>             copyback =3D 1;
>         break;
>=20
> +    case XEN_SYSCTL_cpu_hotplug:
> +    {
> +        unsigned int cpu =3D op->u.cpu_hotplug.cpu;
> +        unsigned int hp_op =3D op->u.cpu_hotplug.op;
> +        bool plug;
> +        long (*fn)(void *data);
> +        void *hcpu;
> +
> +        ret =3D -EOPNOTSUPP;
> +        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
> +            break;
> +
> +        switch ( hp_op )
> +        {
> +        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
> +            plug =3D true;
> +            fn =3D cpu_up_helper;
> +            hcpu =3D _p(cpu);
> +            break;
> +
> +        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
> +            plug =3D false;
> +            fn =3D cpu_down_helper;
> +            hcpu =3D _p(cpu);
> +            break;
> +
> +        default:
> +            fn =3D NULL;
> +            break;
> +        }
> +
> +        if ( fn )
> +        {
> +            ret =3D plug ? xsm_resource_plug_core(XSM_HOOK)
> +                       : xsm_resource_unplug_core(XSM_HOOK);
> +
> +            if ( !ret )
> +                ret =3D continue_hypercall_on_cpu(0, fn, hcpu);
> +
> +            break;
> +        }
> +
> +        /* Use the arch handler for cases not handled here */
> +        fallthrough;
> +    }
> +
>     default:
>         ret =3D arch_do_sysctl(op, u_sysctl);
>         copyback =3D 0;
> diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
> index 2ca9ff1bfc..04530738c9 100644
> --- a/xen/include/xen/smp.h
> +++ b/xen/include/xen/smp.h
> @@ -76,4 +76,8 @@ extern void *stack_base[NR_CPUS];
> void initialize_cpu_data(unsigned int cpu);
> int setup_cpu_root_pgt(unsigned int cpu);
>=20
> +bool arch_cpu_can_stay_online(unsigned int cpu);
> +long cf_check cpu_up_helper(void *data);
> +long cf_check cpu_down_helper(void *data);
> +
> #endif /* __XEN_SMP_H__ */
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index b250b27065..36d357cae8 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -835,7 +835,7 @@ static int cf_check flask_sysctl(int cmd)
>     case XEN_SYSCTL_getdomaininfolist:
>     case XEN_SYSCTL_page_offline_op:
>     case XEN_SYSCTL_scheduler_op:
> -#ifdef CONFIG_X86
> +#ifdef CONFIG_CPU_HOTPLUG
>     case XEN_SYSCTL_cpu_hotplug:
> #endif
>         return 0;
> --=20
> 2.51.2


