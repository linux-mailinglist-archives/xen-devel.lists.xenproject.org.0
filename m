Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKcwEJ3iiWnGCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:35:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665F710FC75
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225374.1531861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRPI-0004BW-UK; Mon, 09 Feb 2026 13:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225374.1531861; Mon, 09 Feb 2026 13:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRPI-0004A0-QP; Mon, 09 Feb 2026 13:34:28 +0000
Received: by outflank-mailman (input) for mailman id 1225374;
 Mon, 09 Feb 2026 13:34:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpRPH-00049u-SC
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 13:34:28 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0987f398-05bc-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 14:34:20 +0100 (CET)
Received: from DBBPR09CA0027.eurprd09.prod.outlook.com (2603:10a6:10:d4::15)
 by AM7PR08MB5493.eurprd08.prod.outlook.com (2603:10a6:20b:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 13:34:16 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:d4:cafe::ef) by DBBPR09CA0027.outlook.office365.com
 (2603:10a6:10:d4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 13:34:15 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10 via
 Frontend Transport; Mon, 9 Feb 2026 13:34:15 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DBBPR08MB10819.eurprd08.prod.outlook.com (2603:10a6:10:53a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 13:33:13 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 13:33:13 +0000
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
X-Inumbo-ID: 0987f398-05bc-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D4SVsM5ZbEDmRaqePhDz6BpBSfzv6NMEX2leKGSvUr3sSIR0tyafV+doqCVp1zvBwZkfrLNKo9rR240VyARxVcLRu3aM0WF+rL8Nbno5Z7NsuSR7WWBy71IUJlVr+k59W6/CwfWqEtSxvxxMYLuJl1QgbZoFT92pJjyM6ul4Aduxj/C2TzwmF1OCiy7hx2pH9H5GwrK6Tu2Go/NNOYJ45GU7B90V9nrtYMR82QZtSVoosa9CYqvsWBK8crITYxIbYmyx1rCC11qyBBQvpqrDqYwWBq0P4lHC8esshkqOE4RLsuGLzPpmxv03DBwyJEVOvMMpWMIXjQlMKku9eMJgyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zS0oCuwjdEUcSjNp+B39e+RyraAaxOpDOqBht9vmFJs=;
 b=yHRpD5N1F4mnsI0Hq1G9bpVW/rSWgL9rTkecEUIETx3nvKNvewOalc7M4Z23/EeRUsBrQNZHHO4taFuUlpn37GHZlCUdLJY/dxIURpNsEbTN15cz/5Z15aC1tA635xwjDdeXMHc6gHsZ1P8Ra7vI+ZCL6ib4LzWHARBf8SoYrOjVlQpQ9m+rfr9QDqwtF7sVDOCP+lmmnW5HdLJy2W0GCfOorhitbfe/P4Or5ntgayZUaDB7kawlJSLDK8zDxES0/p5i3D1ueXf8XZJurzx6jkhqdJpunCeJPqGRasPASm6GMZYDTDNKHKUK5n6KBjpPPxJBJtdNIqVbKmtOz5fnug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zS0oCuwjdEUcSjNp+B39e+RyraAaxOpDOqBht9vmFJs=;
 b=fYQTkDPR6Hiix5CiplZcCdnrWrRfw/Kt7xH3j6EC4lhTE2WDTFLinl15EyLDGhG8/ZHYCXXALnSIqYSDO6/HXO+hRe9J0G9XoAzvvfohtbF3422Cm/paxWFU+Kv2DkRKAGjwN0UI6GOAcZeI37/1t5phF7+R0pRW5y0XlHWeiTE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tySZ5RCjxIIjfU3yGj9kEG6GzbI/6P85MLV08QbybXiFByCVzD3IYUwykMae4EqgQUCICQVCYGqAas/arThQjDM9AhMWnZgOztobiGONXQA38kJdxifFmlDS6R96neoO9sNiaAgvBRvWJbuIWNrJuHScQhcvkgQwh5m3At6PvR1OGQN3pHthimUweup4I6DrRaVCKFtT236Cb7EBuN226aWByJX1kdWGTgCHgoDDf11vt8beqN0ecg7DU72Ss0O05h1sHRLTUgqGYaRaXTiW/fN9Gs2sl44/x14dPF9ijN4/TKFxK7TqyNVZpEKaOOzcGKM3SR8OYZCJFhJggZdggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zS0oCuwjdEUcSjNp+B39e+RyraAaxOpDOqBht9vmFJs=;
 b=vUdD1QfseVYGIoiA/ppGKRYL0vvf43QlkuXF/9S3PuTARN9T3wbMHcT8l552odUmsgW+Q2kHpyN+3MTdl3qdpWhoYfRLc2mUPLunAeLVGF+i5S8ZmqbOJ+8DqrY1GWFQiW3arswcCder2nWD0DdpUk3+ZPGwCu/wzD2uBcJSCU8f2rqGD9owZ1MpmiPx/HZDzzQhBMudncS6njM9lPh0fOueqlc2qSypKdWDFfvrd9daT8Jx9a68p7pxLz9vPeY2bV3tdOdMC5CXLWLpxzFwGpa164ZctiC8kCCghlngqq6S5Ic6Q5y1DaJXcsn8calDZLk7i98IJfuZ1QdRZ1RKtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zS0oCuwjdEUcSjNp+B39e+RyraAaxOpDOqBht9vmFJs=;
 b=fYQTkDPR6Hiix5CiplZcCdnrWrRfw/Kt7xH3j6EC4lhTE2WDTFLinl15EyLDGhG8/ZHYCXXALnSIqYSDO6/HXO+hRe9J0G9XoAzvvfohtbF3422Cm/paxWFU+Kv2DkRKAGjwN0UI6GOAcZeI37/1t5phF7+R0pRW5y0XlHWeiTE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v5] xen: Add Darwin.mk
Thread-Topic: [PATCH v5] xen: Add Darwin.mk
Thread-Index: AQHcmbF131JHt0VrQEG2yzDmCYz1i7V6XACAgAAB1gA=
Date: Mon, 9 Feb 2026 13:33:13 +0000
Message-ID: <28A169D0-4454-4D60-B811-72FE377A4318@arm.com>
References:
 <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
 <aYngg_ym18d0G-fX@Mac.lan>
In-Reply-To: <aYngg_ym18d0G-fX@Mac.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DBBPR08MB10819:EE_|DU6PEPF00009527:EE_|AM7PR08MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9f0bec-7a64-4ec3-0ad9-08de67dfeb5f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ak9aSTN3QjB1cjBtb2xkYUZHVEh3TjJjK3lwQmtDMmVWL3k4QWhIRTlpSEFk?=
 =?utf-8?B?NGJOejRjUGIzTzJVOU5ZWVk2OTI5b0NNNTcwc1JydTVndC9ra3MvV3JUYXJi?=
 =?utf-8?B?eWxCNURUdmNXemJZalk1V1NFVTJlOUplaDFTZGQyVTRXODYxSDRpbnNSeVls?=
 =?utf-8?B?aUZSWUVWeVdIcWRLV0U4NWJLWDcrK3Bway80bzMrdVl1OVV1aW1QcmUxS1lo?=
 =?utf-8?B?c2RIV0RiZFE3K01OTUpiVXN0ZGhrQUpndnRYa2ltM3AvKzQyWUpXWDNYQXc4?=
 =?utf-8?B?aHdmYStGUzdyNXdnR1Q2TEUyVzJBSTRubmtQeE5UMWkvejhZdmtpN3poV0g4?=
 =?utf-8?B?ODhkc3FBWE11cTEzcGJ1cndYdW40Qk13RlZKM0ZVenVYb2VwbWw0U3NUZms5?=
 =?utf-8?B?ZW5Yb2lEWk9QME5CbVVrSURZb3JLMU05ZzgwYkJ5bnBsQkladFBmYVdYM29Q?=
 =?utf-8?B?a3dPZTY1SG9nMExuM0EzRnRpM2JCWm9NN0dnMnE4Q2lkZHpaYXBJMkZXeFFI?=
 =?utf-8?B?bGJFa0dRMEF6VFM2Zy9NaDJWdmIwbkJQMk9jZ1BYekw3a1ZLM1YwdmtWNDMv?=
 =?utf-8?B?TUtJY0pyYmNLUjR0OHJuczNwY2VmeDJHRkxuaExaSnhzc1dtTkNzcGJabTUx?=
 =?utf-8?B?dzRNVXpUSk45dWw3YnBPL1AxVXFKeXdRZk9tVVZtVnBRTU85cnk3NVZmVlAr?=
 =?utf-8?B?MCtwOWJjcXlwaWcrdUF6N2dmaXYwa1ptd09sK0NMWG0zQU15ZzY3clQ1VHRz?=
 =?utf-8?B?MHFXYjNSV1VGUG9URU5yeWh4Sy9PWnFIYUhsckN5WXp4ejRiWitzZTdjMDgr?=
 =?utf-8?B?VThCMHRnV3BYZWQxYjRxMUs5S0tHT2E4TkEyMzVzS002YXMvRmRiaUFpcVlB?=
 =?utf-8?B?UU9GN0Q4V1ZiQ3NKYWdpOExiVVgvdzk2QTZFTlpFRFhBK0tzRzBZTmxWSW5r?=
 =?utf-8?B?VFJBUHRxSmZUakZScUgra3gzWUR4UTZyZUtaVFdRcU51ZHo1cWx5RHEvL2NT?=
 =?utf-8?B?aGkvaVNsNU5wOTFCYWRaNXd6cHFGbFlaSEMzbHVOdElJY3pCSEJGMzNYSWs2?=
 =?utf-8?B?QjFaNWxIY0JoVzIwcVBsa3VtVW9FWGViRWZkak9ROERIRU5ZMmlodEQycE1N?=
 =?utf-8?B?akxPS0JCbUhidkFTVEVFdkY0anNmWnFFckR5emhLOWdGYjdXeUxhR1BSWE8x?=
 =?utf-8?B?azVicFBST0g1eE1iaUlxaEw0YTVyY3U5MEZaY0x1OVZOZUFjQjZ6d3N5RUt1?=
 =?utf-8?B?Zk4xb2tqZXpSblluVytoY2I5OVBWdmVYU2QxSXUvRkV0NG5NZ05DSm1pajhw?=
 =?utf-8?B?ZlV6R1FnYlUzQ0JGYm1YNngwVS94Vld6VitmKzM1cnJtUGN3a2duc2VCZmxj?=
 =?utf-8?B?UG1BeE9Rc1hkU3FkNVViNDl5ekw3Y3l1NkpXaXVRdDRlL0Z6SEFwQWYrdkdL?=
 =?utf-8?B?cXl4Z0MwR2VjelN3aUxnWDlxQU1JVnpCVzNPMEVDT09qdjBrTFEybUo1cyt1?=
 =?utf-8?B?MnYxdzJtTlp4WWdLUzZFa3JGMzFQblVsQ25Hd0xkQThUZldscEVoYmM5M3hp?=
 =?utf-8?B?azZ6d21wL2p4Nmd1RVBseEt3YUhaeEk5NzNJYlNENko1VGtQVnlxRXEyVnl4?=
 =?utf-8?B?eVFIaVpyK2RrWFNoS1N4dUl6RDluMkVmb0crd1g0amZxTGxoVk5KRzh3U1h5?=
 =?utf-8?B?RnVZeTl1Q2NnM08ydWxsRTJCSlQzNXdIYkdYemVGQjVWaC9VMjgrTU9kaTVH?=
 =?utf-8?B?ZFZpVUo4MTlqWmQ4cml6V3N2NllsRU9hL3Awbnl3MFB6dGJ2L1ZXN0JnM1d5?=
 =?utf-8?B?QXRPakppaE1LN2t5cEZRVzhyam55QlRmQ0txaDQyWmd0Mi9NUjFON2hqYXVU?=
 =?utf-8?B?TGtZS2U3KzUzdkJmOG44U1I2eWVmN2FDaUdHaVU5QlptSjFFWklLaFN5dk01?=
 =?utf-8?B?UWtTV0FzZTV1MzRyWGF3US8zRExzUk1ONGU5RG9mOE80U2wyK2xHeU01aWxM?=
 =?utf-8?B?Q1JCTkE2K0JiRXYvbWF6a05TTlY2SlkxUVdnMG96OC82UndNVExDQzl4dGds?=
 =?utf-8?B?bHZSUHRMQVVCMThRcnRVZTMweG5tOXhyZktGOTBCWmxlTUowcUhGOEQ5N1NF?=
 =?utf-8?B?clVLYThIRVArbWdIQTJYMys0czJmajAwTC9SSTh1Z0QzRit3V296RWNvc0Ux?=
 =?utf-8?Q?yb+ZQtcYa/rCNK89oYNnIJI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B1928650701914CA4CAE5EAEC47574A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10819
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c167b97-64e9-4ea1-8858-08de67dfc61f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|82310400026|36860700013|14060799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGZuVWNiZ2VkVEVYQ3dJeHZjNVVwVU03OU85aUUvUnBNT0lpcUhGaElIWWV2?=
 =?utf-8?B?T1JSd3RaYXRSK1hubk5PWG1xYVppcHRud2M1UmpOQkxZRHdOU1crYmloTFNp?=
 =?utf-8?B?eXB5dUdSV0VrMGN4MWZqR0hVbW1hTkNYSTBBMitiVllFcTl6ZGlOeXZvME92?=
 =?utf-8?B?RnhoZ1ZjT1JpdWszK2ZYVDgrSXBxellwRnNqdGd3RDA5cVcwOGpyZFM0eHg5?=
 =?utf-8?B?WmdCdTJDWEpOOHlQVUtTWUd1cXE5Wmo5ZzBzelQrdjgvK3VWQnZZQWhtaUZJ?=
 =?utf-8?B?cG50UDhyMnRDUmRLeXdPM2lBMnJNTTZWMkp0d29HRFZyelBLZFA3YkJubjFi?=
 =?utf-8?B?eXBHNWMvOEQ4SG9qUTJPb2FpdkVRWjJ5eWtFRU9SM1lKVjQyWCtaRTlYejRE?=
 =?utf-8?B?NXRyOTI4TUZwbWRMdzdHM29NM25LU3FMS2cwa241SXdHZlVCQS9TbG1USlJk?=
 =?utf-8?B?eDhtOEJtQktwbW1EMmR2UHB2alR3RTRmeWwwMzZsYWhLODIxd3hYQklzUEZS?=
 =?utf-8?B?K3F5U0hVdkhKWUsxMlhHUldyVnVBTkJ0eU9SMVJQNzM1ZDdiMG9FaFZSd1h2?=
 =?utf-8?B?UjVZY3BnS09BbUhJVDZxV3VrdDgweFB3UG9HMzJudjlBV3E5N3V4SkhteVYv?=
 =?utf-8?B?bWtHY3Njb1Z0a0lweERzU0lIY1BpRy9qT0NWVDNObDFVYmVQeUFpVTNZZndX?=
 =?utf-8?B?WjZmSEVadDJsS0M4ZW1xbVcyWXBLa1pCcmtLQjVlVHg5VlloY3dwNyt6c0t4?=
 =?utf-8?B?WEY1d1NqVzZzRGJnN1oxZUJlRXBGOHRidFR2VzcwTW9xQWJsY0U4MUwvajdt?=
 =?utf-8?B?NUljOUUxSmNtSXBCN25tRGhVMXVMV242cmxPaTk0ZExYSmlnT1g0a1ZTNFhT?=
 =?utf-8?B?emQ5bzRIUm9la0JPRUREcUhKaTZrdU42cWZSSnJHN1daSUNZYnBtRDcrQzhR?=
 =?utf-8?B?d3NCUjJKQ0RKY1dQRWc2QmprSVh3NGZpeGtmM3cxZWV6YnJvWDNlR24xYlJL?=
 =?utf-8?B?dWJrczRIRXpHU1pYWmJiMm1FWXlwYUkwRDRHdEYzbEJUOGNNdk5LcWZhUmJS?=
 =?utf-8?B?SnhEcEtKdVJHOFVhUmpJeVNnL0p5dmpPOWlwZzRJRFlJOFBKUGlNYlIzTUVu?=
 =?utf-8?B?S3BqSU9iVEc2TmZpYWw1VHpCdkZzbUlOSXE5eTVOR1d2MlkvNWNQNU1COUJn?=
 =?utf-8?B?TnpGclBjKzBKbEtXSk5vWEhJbnhYQXlaTDN4VmNRUDJjSDZlZjBGN05PMVVE?=
 =?utf-8?B?VWQ5NUN2b1diM2tCU2U0dFV0ZDkvVVBRWnNhNDd4MFoxK1grYlhUc21PZ2Vx?=
 =?utf-8?B?NkVLYUx6U2duQWR1bmRwL2EvQ0FSRkRmZXVDVzIwMTRQeUtnSm9MTlhQaS82?=
 =?utf-8?B?Qi82b2kwcDcyWjVnK1pYZTZzMXFvUnJQRDZ5TDlWdmdNdUtJWWR2YWRxekF5?=
 =?utf-8?B?WWhlcXFTVEEyOVNCODdwSmduUTE1bWxoa1hwaDNKNDE1YWNqSlIzdjBQbXp5?=
 =?utf-8?B?TGl6N0lwWndZUG9CSmtXSitYRFp2YjB5dzh1SmF4dGdkODFPV003Qis0NThq?=
 =?utf-8?B?T0tCenlpcUhWYUZvQ1c1azFvdzlEbEQwNmJSRlhwdjZQbHoyS3NGSDZJR00y?=
 =?utf-8?B?N0NrQmR3WDNsWW10eWJkaFpJaWRDZUJQTG0xanRnWDRvck9rV0NNdGdjaUhu?=
 =?utf-8?B?V3pIVlpnSG41Vm5kcDJBaC81N0hhQlFlUm1Kd1piM3JkOStmTzBQaWdFakhZ?=
 =?utf-8?B?eVhpUVBkcDh4T1hGNUZwMjhLTURWek9tR1REMi9hNWtJR3FjNnNDUmxmc0o4?=
 =?utf-8?B?cFZqYkhxOU0vMUhMaDhPRHJUVnA2dmtaTVFPaDRhV3pEYys2QW5JRFNVSDd4?=
 =?utf-8?B?VmNsN1NDM1BhUWZaQjE0Y1VPdzdmTng3UUtmUEw0MCtQNUpPV3E0bWdKWTNT?=
 =?utf-8?B?UHVOMS9ONXdXaUEveXlTd3hoeVBCSW9tb2pOd0FDQ2tSSXFwc08zV21uVTFr?=
 =?utf-8?B?N3NEZjRMc3NsdXZ2WFdnVnZwekZyTUNaak5tdks1YWw0S3dkelErSmhRQUJ2?=
 =?utf-8?B?MWQ4dTlCYjdCTVJmaFE0bEdYaDNQaEw3S05mZ2Nvd3BoOWpwUjB0bEVIOHVa?=
 =?utf-8?B?Q3ZvSDdJVTAvK3NJZ1Z4NHR2VVR1Zlg4cm13VDJ2ZHdhU3djQTBEZGpkTm1M?=
 =?utf-8?B?UTBaSGd4SVFvbkFZdnR5Y1VDYitXa053NEdsNkxzc3QwNUU2VnAza042RE9Q?=
 =?utf-8?B?TE5ObGprdEVGYmdaMEJoelhIUVl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(36860700013)(14060799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hcfcTupijiCZmjb24gXJa42bA29uQxmDgKlwdXCFNyu5cBCiBqCiiYeTSdoz3p3rAgWPu568UQKvXAuPmJT+tYr32+9nrtdrP2FoBJMLPBQNjdq01LXmvz96oqVY7HtipGlajUVM9Gl1qbdf5UTfIaOEA6vJEpAlP4Mq36xS+ewMqS8DhVAShxOaY9OfSjzAk3S4pcClSwuvTeSO0nkc+mW1jz5dhIdn4uSICruGymowZcHqoXsRbSNwMCoEnmiqUi/cRFoZUywz5L4uVA8CProiIlZuFT3QgM0ZaRYMYMHFtBPlGL8rZ+FqVhFhnSjyNCot+XQQN0J6vLpIlsTC1NiQlTRd8mWxgpWmJZZvLbzJMlN+SfAwLtKsFNI4etaTwMSZ5ZymTHODZc9i2e+VmS8c7wMKYjLxNAnPrmRl3uVf3oUBliOL/HqV7A3zK21F
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 13:34:15.6426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9f0bec-7a64-4ec3-0ad9-08de67dfeb5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5493
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,arm.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 665F710FC75
X-Rspamd-Action: no action

SGkgUm9nZXINCg0KPiBPbiA5IEZlYiAyMDI2LCBhdCAxNDoyNiwgUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBGZWIgMDksIDIwMjYg
YXQgMTE6NDY6NDRBTSArMDEwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IFhlbiBkb2Vz
IG5vdCBwcm92aWRlIGEgRGFyd2luIGJ1aWxkIGNvbmZpZ3VyYXRpb24gdXNlYWJsZSBvbiBNYWMg
T1MuDQo+PiBJdCBpcyBwb3NzaWJsZSB0byBidWlsZCBYZW4gSHlwZXJ2aXNvciAodG9vbHMgYXJl
IG5vdCBzdXBwb3J0ZWQpIHdpdGggYQ0KPj4gdG9vbGNoYWluIGFibGUgdG8gcHJvZHVjZSBFTEYg
YmluYXJpZXMgKEdDQyBvciBvdGhlcnMpLg0KPj4gDQo+PiBBZGQgY29uZmlnL0Rhcndpbi5tayB0
byBpbmNsdWRlIFN0ZEdOVS5tayBhbmQgZm9yY2UNCj4+IFhFTl9DT01QSUxFX0FSQ0g9dW5rbm93
biwgZW5zdXJpbmcgRGFyd2luIGJ1aWxkcyBhbHdheXMgZm9sbG93DQo+PiB0aGUgY3Jvc3MtY29t
cGlsZSBwYXRoIHNvIGNvbXBpbGluZyBvbiBNYWMgT1MgaXMgYWx3YXlzIGhhbmRsZWQgYXMgYQ0K
Pj4gY3Jvc3MgY29tcGlsYXRpb24gY2FzZS4NCj4+IA0KPj4gT25seSBjb21waWxpbmcgdGhlIGh5
cGVydmlzb3IgaGFzIGJlZW4gdGVzdGVkICENCj4+IA0KPj4gQW4gZXhhbXBsZSBvZiBob3cgdG8g
YnVpbGQgdGhlIGh5cGVydmlzb3IgZm9yIGFybTY0IG9uIE1hYyBPUw0KPj4gKHRvb2xzIGNhbm5v
dCBiZSBidWlsZCBmb3Igbm93KSB1c2luZyBhIGNvbXBpbGVyIGZyb20gYnJldzoNCj4+IC0gYnJl
dyBpbnN0YWxsIGFhcmNoNjQtZWxmLWdjYyBhYXJjaDY0LWVsZi1iaW51dGlscw0KPj4gLSBtYWtl
IFhFTl9UQVJHRVRfQVJDSD1hcm02NCBDUk9TU19DT01QSUxFPWFhcmNoNjQtZWxmLSBIT1NUQ0M9
Y2xhbmcNCj4gDQo+IFRoaXMgbmVlZHMgJ3hlbicgdGFyZ2V0IHBhc3NlZC4NCg0KV2l0aG91dCBh
bnkgdGFyZ2V0LCB4ZW4gaXMgYnVpbHQgYnkgZGVmYXVsdCBzbyBpIGtlcHQgdGhlIHNpbXBsZXN0
IHBvc3NpYmxlIGNvbW1hbmQNCkJ1dCBJIGFtIG9rIHdpdGggYWRkaW5nIHhlbg0KDQo+IA0KPj4g
DQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFy
bS5jb20+DQo+IA0KPiBBY2tlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQoNClRoYW5rcw0KDQpCZXJ0cmFuZA0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQo=

