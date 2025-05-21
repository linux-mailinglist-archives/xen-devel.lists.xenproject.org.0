Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EC6ABF8E6
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 17:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992053.1375840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHl61-0000gj-DS; Wed, 21 May 2025 15:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992053.1375840; Wed, 21 May 2025 15:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHl61-0000eO-9A; Wed, 21 May 2025 15:11:05 +0000
Received: by outflank-mailman (input) for mailman id 992053;
 Wed, 21 May 2025 15:11:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aEeW=YF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1uHl5z-0000eI-UV
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 15:11:04 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2608::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceaf27f6-3655-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 17:11:02 +0200 (CEST)
Received: from AS4P195CA0013.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::16)
 by AS8PR08MB6183.eurprd08.prod.outlook.com (2603:10a6:20b:29e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 15:10:59 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::e6) by AS4P195CA0013.outlook.office365.com
 (2603:10a6:20b:5e2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 21 May 2025 15:10:59 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Wed, 21 May 2025 15:10:59 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9942.eurprd08.prod.outlook.com (2603:10a6:20b:545::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 15:10:20 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%3]) with mapi id 15.20.8699.022; Wed, 21 May 2025
 15:10:20 +0000
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
X-Inumbo-ID: ceaf27f6-3655-11f0-a2fa-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=l4A0XbDr12NHpvkjisqdUrwL+ini0AKqHfDTLrWjP0f+yeCIAoVwTbfcYU69xpjqtQmCsoT46/2z8JPQ5+c123enjEim/0CjWRaaTUvgDhLL5fLysl7qTof0fc5EESa4A/0CabDw2ON4Xiy6Ix6Y8pVnO8K3oelOmZYhNyJU1qV/iGfc1z0oATssFB4wDPdQw4J0Ijm8yELGtWwi8SfOkEgHeGhbPZ/mqcybtSYoz8YYQ2TghxjyTZT4zQT6xVK5od4jbB6sT0loCt3bGkIk7RvRSQRGOzJSL9h+poOC/cAw5mU2Ph5ERuIin18Rwl6wkBKk8xJ1lzWtLNZd3LOB7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EITqOaiWriLr/iVAckORdiuzIDy3OOJFzeM3oEPCl28=;
 b=cQjabDpL569vdFTBUJppW17Fz7yNq1ilD+KfFqTOHosIVmDzFgVbpBwsBXEZ4aUD6nCwMpilztAo3hF4FNEwIiLS9lG/pE5YVBTV7g+5npYHmb/EJ6oVZeHhKWwG1ajVgWl5HCboVza4X9K2aul6s35FsR1KZ2z/p0pLDFpN9v5Wnpi9jF6qi37eMPhIcxU3vo3RN6pu6MY02R+TcBSu9yMlSEReAKC8LoBTobRvX2BCVI4O84RRPWI+TNNng83hJHSc6hngHBkLQV60zhjj6Md229FzJRQWGDpY4fAdEsqoA2MiHay0mq2jfuw1qV/Tqx6ghrKAjN5Z8RWnj2TGrw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EITqOaiWriLr/iVAckORdiuzIDy3OOJFzeM3oEPCl28=;
 b=Ml/W2YknWNaQlyvBI01O4y7LZhiiQGySxc9exKq+PDi+5MPRrIsZPc3d8lhAaFpxgPXr3cT2hO+7KIDrhxeuxUHteQBv744l+tJFMuLrw1Z3kNgdf179HM6gBtVhnVFrfdb6ViPbkhdOGlNgvjyIKOo4rBp/nflc5Q96OSstWeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9ncRARLprZyZdoZOndmFhpyayjtsns6fbkb8cO/Qy93WLC9RIMgPTfyPubduIA2dG0lb5NdR+DS4fmntKVklmduavjVYGF4BtmWXJXADwBLmLym93jEuzB1WdZ87qkTBgE1pXTAHG3/P+Jk/hsmR1q5UJybr2T7pzVB7RCE1Wm/srJFFiviFZC831rsd+BUy9eUSgj2iodlXG5XrA2+TMd5RrsKhAtr338+irv0YWZFn6CS0JQaBEe0bce2UvayIysZgi97mJuRuCA940WAjK7M8RlHz+nUlNrb/Dw7Hat6ov23DhGJ5yXFHx/Z9G4+jAndtyAdCPL18XpEqn4bvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EITqOaiWriLr/iVAckORdiuzIDy3OOJFzeM3oEPCl28=;
 b=ZrJdGtEtUKSoGkaplhpFBDQqlVOY/JCzk1lWQn8Hazxgd1CpIBTtT5ydhd9oAhRvilSyMSFToFo3gQGMIUL+KyhFQedeXGrIk/p6Jn2gylf+2ZjaFhSAyIaj4hmOCLlGeGDj4eK3VSlgUppP3KngWwKO1lXSFJTsxNn/YbTCMk/6IqGY/BCH6cj5D9ovS1GGxy40ALYGgX5flWVSzIZd88zFaWE2My7evB5eF+ueVBkfDJvzOAC0e1FCvfmSearuvi1dso6OyWkIUSiAVFwuRl2a6/juNQacmcdqtVFxPuXfC18IZkr9UVjBFXkaSIh3iT2C6jcCAU39CFkOvWtmYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EITqOaiWriLr/iVAckORdiuzIDy3OOJFzeM3oEPCl28=;
 b=Ml/W2YknWNaQlyvBI01O4y7LZhiiQGySxc9exKq+PDi+5MPRrIsZPc3d8lhAaFpxgPXr3cT2hO+7KIDrhxeuxUHteQBv744l+tJFMuLrw1Z3kNgdf179HM6gBtVhnVFrfdb6ViPbkhdOGlNgvjyIKOo4rBp/nflc5Q96OSstWeQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v5 3/6] xen/arm: ffa: Introduce VM to VM support
Thread-Topic: [PATCH v5 3/6] xen/arm: ffa: Introduce VM to VM support
Thread-Index: AQHbrqLcUoVcqzY6y0GU3I61EJDkQrPdY1IAgAAESwA=
Date: Wed, 21 May 2025 15:10:20 +0000
Message-ID: <AACF07F9-7D48-45DF-AC97-B5B51D2A3AE3@arm.com>
References: <cover.1744787720.git.bertrand.marquis@arm.com>
 <f6c67adcae192bcbe9c7612fda1bef31c40bb9a0.1744787720.git.bertrand.marquis@arm.com>
 <CAHUa44HsTzvXtNGv+iSRP5X0JX00phu4yP08CWudU3zxWA-bsg@mail.gmail.com>
In-Reply-To:
 <CAHUa44HsTzvXtNGv+iSRP5X0JX00phu4yP08CWudU3zxWA-bsg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9942:EE_|AM3PEPF0000A795:EE_|AS8PR08MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a6707a-fa20-4231-5869-08dd9879b18d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WHNHMXYxSkYwZGljZ2F1aVhNZ1RrcWxxak1KY1ZwU3dPRjJsUCtKRTVEVnFw?=
 =?utf-8?B?K3ZtTzNIVEtUQjJKQWFTL0UzcVhDL2VjMTdOSUI3emh5RFhMVGhiYjk4N3FT?=
 =?utf-8?B?ZHRpMk9Zeml6MkVNcHloMm1WUXJRTUNxSWkwNTdZY0FDRGNVNXM4NHZmNjUx?=
 =?utf-8?B?ekVHNFQrVjVmN3djcE1adjZWRUtMRHpMaWpLeVJJdGRwQkdydUJoOTZsdUI0?=
 =?utf-8?B?MnhxbitXdUdsNDVqZUdmSUtWL0lSbHdaZ1hrcjhBb2dKZzBBb0F6ZWtqdmNy?=
 =?utf-8?B?TkpHS1dqcTBjZGNoMXM2dWZtZkhsYkNLTjlaU1N5VCswSERqYUtTV2hSVnBu?=
 =?utf-8?B?MlRKc1FYdEREWW9YQmZTM1dNbnlRQnV5UzJaR1JHclprNWJRM2FYZVZ0WFdZ?=
 =?utf-8?B?QTB4RG1PekptWllBaGl0UnY1aDVyV2JXbk9yRGp6c2VVU1ZJc1EyK3FHRGRa?=
 =?utf-8?B?c3VweFBtcEh1aG00dFRmOWhPYzFHbzduSzEySk5xMk13bGRUSVFQamErd2VF?=
 =?utf-8?B?V3BJajlhVEZSTnNQU0YrS2FhWTFIS3c4RTBmQmlibmRjNlhiVDFFWXhOWWgr?=
 =?utf-8?B?MkQ0UjFBRVplWDlUY2MyRVVnUXY4b0V6R3hQejhiWVkxS2UxY1dRbVNNUUx6?=
 =?utf-8?B?My9pUXZ5MVp3eEM4dmoxS3RoRkJpdStIUUJwNG5BSjRDc1VTWnliU29CcDBN?=
 =?utf-8?B?T3FhTUZBY1dobnMxTXVSeGRCMXFiNnkvU0lMWGNXZTZ5d1R6SDdMd3ViQ25O?=
 =?utf-8?B?L3QySmhOQW96UDJUM3dZd2FFZkZCUGtDdUl2eE1hd050ZkpUR1YyWnpIT1Ja?=
 =?utf-8?B?cHovUzY4MTNPcjJQaWRqYm56Nmg4SlF4c3ZMcTc1OVdRSWFyOXZSRzFTWkVs?=
 =?utf-8?B?U1Z0OVBCWkxGWWZRU0JvNG56SzI3NTZZVmJNWGhjeFBPTlo2cCsycU16ZXpu?=
 =?utf-8?B?Z1FyMkFxaU90MDJnTUViM3R5U2l4ZDE5THIrUHp3NjhRLy83MkcrR1lRMVFy?=
 =?utf-8?B?UU91cm84SzIxWFJCV3B0YnUxczN0bkY1c2FQQTIzSlc0cFJpeExZdGcxSGZ5?=
 =?utf-8?B?WmQzcFRrZk4wMnZXZ1d4Zk9YaTIxMDkwRllFR29tSVVXbDA4Vk0vZkJ5UFV6?=
 =?utf-8?B?OHlIYnlnUThwK1dSWHd6bU5Jdjg5WC95bkxiRUVCWlFZbGtMZkJGOXgrMzFI?=
 =?utf-8?B?cnhOMTBUeURKeml3dmdZcWZGMWNrNzRCQVF0UlJ1K1p5cUNoY3FCQWs2WmUw?=
 =?utf-8?B?aE9RRGRxRXRuMldBTENtT2owZXZNdXFWQmtKUjBvdWU5RlExb1pMZkxaNHFj?=
 =?utf-8?B?bkk5MC9nT3ZjUlgycnhWdnlRUzFFYTZ5RDIrRGtWRlRKYlNBeWwrWGloMFVO?=
 =?utf-8?B?YWpWbnUrdlV0UXc2M25lZnJ3T21JNDFQeTUraE9aRWpOc2o1TTNVdUZJTWtH?=
 =?utf-8?B?ejhxczNvZUFpa0RPSnRRTDBjNURTWFJVMVVQTTU1TUpvb0xacVlhTjUvTXJ6?=
 =?utf-8?B?V1VWTmZsd2YrNjM1WXl1TGRtSVBUME9yeUN3bzg2TXMzdUtaTzlycGxsTVFo?=
 =?utf-8?B?MVl1TWUxV2NBeGdLczhWNk8vaFJRQnZuTytXWTlGQjZxZ2t0bU5BOU5HNVly?=
 =?utf-8?B?NjZXVGFoZ3pPWnloeWxYcVRleGp6OWtDQi9UVDRGM0JBQm1MNHkwWEUwN2xC?=
 =?utf-8?B?anF1aWtnUEphSVJ5MGlEckpITlhNeGdZaXJkMmUvd3ozN21rQXRmTnVXUDlr?=
 =?utf-8?B?MDRZdWE2WVptOGl4djVrU1locUNnb1BSOU1DQ1BGNXUrMW5VUTdHZ1RQZmUr?=
 =?utf-8?B?L081RFR2Y3FzOFNSQVRKeHpVekp1bm8xeUw4WkdsZVdhOEFvZ2d6a1VXanF0?=
 =?utf-8?B?ckRqUDNkZjBPWEZhRlh0Qms2UzRiS0prVVhiZUtXMjMxdWtnRG9iOWpnZ0RW?=
 =?utf-8?Q?nkQHVEPc1hE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D64D65F7882EC40A441664970E298E8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9942
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d2be6e2-796f-493f-9e99-08dd98799a79
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|14060799003|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGl4YktmV25EK2lFRHh6a29zclNhS2hPeE43S1VsRThhck1FVXRzRDNDSDNI?=
 =?utf-8?B?Yk1tT2hLcmhoRkc3NXlydkpkZ2RPenVFZmlNRTFHa1hkeEtHVU1aS055Ymh4?=
 =?utf-8?B?MzJPa285N3V2cjN0UjQ5R2NVT05Ea2VxMVF1OXFUMDN0TCtaMW82NWI1SWRo?=
 =?utf-8?B?Vjl2Q2kzaElXQnAwZGFocFJxZjM5ZnV2T1dvRWEwK1cvbmppSUZtcitxb09a?=
 =?utf-8?B?bXlLdmVQNVlvdmZGb0Rkd1FseURIY2Z5L29nQVdiU2tzeGZpbDZsOFlGLzdX?=
 =?utf-8?B?cE11RjhDOXN6M1NGWlF6SStaMXBGQ0xpRjIxVWphMFlNN2pzWG5Uc3B5OWNH?=
 =?utf-8?B?UDVvODNhRkEyc3drc08xcnRlc3REYW45eGFvVVBRdlE0RkMwNEt6MjB3RDhw?=
 =?utf-8?B?dzVvV2lPYTdkOHNzVjdqcFowSTNiWktyY3JHV0pBcnp3WEh0aE1LWGF5Mmth?=
 =?utf-8?B?U3U5WGh6NzFvbkJtVXlGQkt0WUZ3YXZ6eFVtUlhlaHAxL1JoMHArM2NaL1U1?=
 =?utf-8?B?WEtsUHRFK2xlTUM5T0NIRWRmQzdzemdhT0p4azl0MVF5SG1TMHFOVzJQMFlJ?=
 =?utf-8?B?cUxFM2ZDNUV4V2pvMTJvK0tUc0l2Vk9xOVNnemMvY0p5U0U4QWl2a0ppQWtx?=
 =?utf-8?B?TWZ3bVZhWWVMYUJzT1RNR3JRUTBpcUM2dUF3TWtqc1kwa29CcGFqVHd0Y256?=
 =?utf-8?B?c29DckxiKzVQMU1GajJLbko4UDJBakZrNDFKNzFXc2IyMGRmNEc4VHZzcFdu?=
 =?utf-8?B?UzdIWWxaWm45dDdxQyt4UGZYSkhQUkJaVTN5azR6UVZ2WjdWRHJVVVpSNzQw?=
 =?utf-8?B?Y3lORll3dlBJRUlDNmFFSzVsNjkzZXVZc3JkaVdaZEsydm5KVFFGN1ZSQld3?=
 =?utf-8?B?dUNDRWE4SlNCRFN1aEUvcThEV2Vsd3hRWlVSKzJicjk2OFhrTUt4MXgzUTNN?=
 =?utf-8?B?NytDR0x4QlVlL3ArRnN6MUVEOVh6V1BRRHRiMnRhWllFOXNBcVcvMEdRRys2?=
 =?utf-8?B?RXlNR3IrTGVOazNvTE84TDNLRmRQQ3RMVzFmS2UreWw5YXdtRnR0M2F6TldT?=
 =?utf-8?B?a3VoYnJFRFdNTms1dlI5dXIwVHk2c2M2dHVjaGR5VkhQZkFTYkNiaXpMZkRW?=
 =?utf-8?B?Skh0cmRCdWE5M1V4ektWSVQrNkdxc0FHL0MyZUhoeTYrRXd0RGkyZHllcXZN?=
 =?utf-8?B?QWdmWHBydUpPWm5CVWxBcStRRi9LWXZlUWVSa2dKNTI3aUxGek1DUjNKcUlm?=
 =?utf-8?B?VXc4OWxoRXczSEtIUTdnT0lJbTNZWmdvZFNOQ0VHVHNuZThEUDdIa0Rlb2Rm?=
 =?utf-8?B?WDJtRlVkNHR3amZXckJJTzNOUXhXbXdKSll0Um40bXpieVVjWklqU2ZyTExX?=
 =?utf-8?B?TnNDQ0krRDNKMkoyajNrU3QyOVg2b1NDN0VWWExXQ1hIbytHeGxlUlNLeTM0?=
 =?utf-8?B?V1pEc0IrVGdLcFRqd0pjNzBsaUdsV09hZ1Y2aWtNd2NaRjRZa0NOZ2U5N1hM?=
 =?utf-8?B?N2RqQWpDRmlIR2c0ZCtUUkxadnNFUGUrV1crdDc5NHM3WWJVUGdTS1ZoZURM?=
 =?utf-8?B?dGxlNm5xMkxnSEx5d1Nvb1gzbXFsaW4xa0pGQ29qdEdKL1VXakRodG9hbUYz?=
 =?utf-8?B?QmI5TVNMcUJrUGNZVHFRUnY5R1lESk9Pd2s2c3VDNURFOXZrL2VqNVBtaTBi?=
 =?utf-8?B?TnZWMVh3UWp1aGdwdGdSZ0RvcVRuR0pZUjhEZ240Vnl5SEtweUl3VWVsQ2xp?=
 =?utf-8?B?Q3UvLzZGN0E2dE1VaGptb2o3dDNXbGUxMTVYbEswRlhVdE50b0VZQ3RiUHNm?=
 =?utf-8?B?RTM4ZTNOSWpHcTdHbnI4RTJoUkp4QjNoNWFSWUZjV2tBdVZ3Q1ZpeUh0blY3?=
 =?utf-8?B?VzFNd295c0d6Qk9JUFc0aUNBcFp2NnJMelpjT0dCOSt5ZUNhMGcwM1crb3BI?=
 =?utf-8?B?ZVphOG1lYlpGYk5hMWdBUCs5cGFIQ0NnU1FtdUd5cTN2QnBlZzh5V0d5b1hs?=
 =?utf-8?B?SURvbTJPRTlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(14060799003)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:10:59.2733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a6707a-fa20-4231-5869-08dd9879b18d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6183

SGkgSmVucywNCg0KPiBPbiAyMSBNYXkgMjAyNSwgYXQgMTY6NTQsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gV2VkLCBBcHIgMTYsIDIwMjUgYXQgOTo0MOKAr0FNIEJlcnRyYW5kIE1hcnF1aXMNCj4g
PGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IENyZWF0ZSBhIENPTkZJ
R19GRkFfVk1fVE9fVk0gcGFyYW1ldGVyIHRvIGFjdGl2YXRlIEZGQSBjb21tdW5pY2F0aW9uDQo+
PiBiZXR3ZWVuIFZNcy4NCj4+IFdoZW4gYWN0aXZhdGVkIGxpc3QgVk1zIGluIHRoZSBzeXN0ZW0g
d2l0aCBGRi1BIHN1cHBvcnQgaW4gcGFydF9pbmZvX2dldC4NCj4+IA0KPj4gV2hlbiBWTSB0byBW
TSBpcyBhY3RpdmF0ZWQsIFhlbiB3aWxsIGJlIHRhaW50ZWQgYXMgSW5zZWN1cmUgYW5kIGENCj4+
IG1lc3NhZ2UgaXMgZGlzcGxheWVkIHRvIHRoZSB1c2VyIGR1cmluZyB0aGUgYm9vdCBhcyB0aGVy
ZSBpcyBubw0KPj4gZmlsdGVyaW5nIG9mIFZNcyBpbiBGRi1BIHNvIGFueSBWTSBjYW4gY29tbXVu
aWNhdGUgb3Igc2VlIGFueSBvdGhlciBWTQ0KPj4gaW4gdGhlIHN5c3RlbS4NCj4+IA0KPj4gV0FS
TklORzogVGhlcmUgaXMgbm8gZmlsdGVyaW5nIGZvciBub3cgYW5kIGFsbCBWTXMgYXJlIGxpc3Rl
ZCAhIQ0KPj4gDQo+PiBUaGlzIHBhdGNoIGlzIHJlb3JnYW5pemluZyB0aGUgZmZhX2N0eCBzdHJ1
Y3R1cmUgdG8gbWFrZSBjbGVhciB3aGljaA0KPj4gbG9jayBpcyBwcm90ZWN0aW5nIHdoYXQgcGFy
dHMuDQo+PiANCj4+IFRoaXMgcGF0Y2ggaXMgaW50cm9kdWNpbmcgYSBjaGFpbiBsaXN0IG9mIHRo
ZSBmZmFfY3R4IHdpdGggYSBGRkEgVmVyc2lvbg0KPj4gbmVnb2NpYXRlZCBhbGxvd2luZyB0byBj
cmVhdGUgdGhlIHBhcnRpbmZvIHJlc3VsdHMgZm9yIFZNcyB3aXRob3V0DQo+PiB0YWtpbmcgYSBs
b2NrIG9uIHRoZSBnbG9iYWwgZG9tYWluIGxpc3QgaW4gWGVuLg0KPj4gDQo+PiBTaWduZWQtb2Zm
LWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiAtLS0N
Cj4+IENoYW5nZXMgaW4gdjU6DQo+PiAtIHJlbW92ZSBpbnZhbGlkIGNvbW1lbnQgYWJvdXQgMS4x
IGZpcm13YXJlIHN1cHBvcnQNCj4+IC0gcmVuYW1lIHZhcmlhYmxlcyBmcm9tIGQgYW5kIGRvbSB0
byBjdXJyX2QgYW5kIGRlc3RfZCAoSnVsaWVuKQ0KPj4gLSBhZGQgYSBUT0RPIGluIHRoZSBjb2Rl
IGZvciBwb3RlbnRpYWwgaG9sZGluZyBmb3IgbG9uZyBvZiB0aGUgQ1BVDQo+PiAgKEp1bGllbikN
Cj4+IC0gdXNlIGFuIGF0b21pYyBnbG9iYWwgdmFyaWFibGUgdG8gc3RvcmUgdGhlIG51bWJlciBv
ZiBWTXMgaW5zdGVhZCBvZg0KPj4gIHJlY29tcHV0aW5nIHRoZSB2YWx1ZSBlYWNoIHRpbWUgKEp1
bGllbikNCj4+IC0gYWRkIHBhcnRpbmZvIGluZm9ybWF0aW9uIGluIGZmYV9jdHggKGlkLCBjcHVz
IGFuZCA2NGJpdCkgYW5kIGNyZWF0ZSBhDQo+PiAgY2hhaW4gbGlzdCBvZiBjdHguIFVzZSB0aGlz
IGNoYWluIGxpc3QgdG8gY3JlYXRlIHRoZSBwYXJ0aW5mbyByZXN1bHQNCj4+ICB3aXRob3V0IGhv
bGRpbmcgYSBnbG9iYWwgbG9jayB0byBwcmV2ZW50IGNvbmN1cnJlbmN5IGlzc3Vlcy4NCj4+IC0g
TW92ZSBzb21lIGNoYW5nZXMgaW4gYSBwcmVwYXJhdGlvbiBwYXRjaCBtb2RpZnlpbmcgcGFydGlu
Zm8gZm9yIHNwcyB0bw0KPj4gIHJlZHVjZSB0aGlzIHBhdGNoIHNpemUgYW5kIG1ha2UgdGhlIHJl
dmlldyBlYXNpZXINCj4+IENoYW5nZXMgaW4gdjQ6DQo+PiAtIHByb3Blcmx5IGhhbmRsZSBTUE1D
IHZlcnNpb24gMS4wIGhlYWRlciBzaXplIGNhc2UgaW4gcGFydGluZm9fZ2V0DQo+PiAtIHN3aXRj
aCB0byBsb2NhbCBjb3VudGluZyB2YXJpYWJsZXMgaW5zdGVhZCBvZiAqcG9pbnRlciArPSAxIGZv
cm0NCj4+IC0gY29kaW5nIHN0eWxlIGlzc3VlIHdpdGggbWlzc2luZyBzcGFjZXMgaW4gaWYgKCkN
Cj4+IENoYW5nZXMgaW4gdjM6DQo+PiAtIGJyZWFrIHBhcnRpbmZvX2dldCBpbiBzZXZlcmFsIHN1
YiBmdW5jdGlvbnMgdG8gbWFrZSB0aGUgaW1wbGVtZW50YXRpb24NCj4+ICBlYXNpZXIgdG8gdW5k
ZXJzdGFuZCBhbmQgbG9jayBoYW5kbGluZyBlYXNpZXINCj4+IC0gcmV3b3JrIGltcGxlbWVudGF0
aW9uIHRvIGNoZWNrIHNpemUgYWxvbmcgdGhlIHdheSBhbmQgcHJldmVudCBwcmV2aW91cw0KPj4g
IGltcGxlbWVudGF0aW9uIGxpbWl0cyB3aGljaCBoYWQgdG8gY2hlY2sgdGhhdCB0aGUgbnVtYmVy
IG9mIFZNcyBvciBTUHMNCj4+ICBkaWQgbm90IGNoYW5nZQ0KPj4gLSB0YWludCBYZW4gYXMgSU5T
RUNVUkUgd2hlbiBWTSB0byBWTSBpcyBlbmFibGVkDQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBT
d2l0Y2ggaWZkZWYgdG8gSVNfRU5BQkxFRA0KPj4gLSBkb20gd2FzIG5vdCBzd2l0Y2hlZCB0byBk
IGFzIHJlcXVlc3RlZCBieSBKYW4gYmVjYXVzZSB0aGVyZSBpcyBhbHJlYWR5DQo+PiAgYSB2YXJp
YWJsZSBkIHBvaW50aW5nIHRvIHRoZSBjdXJyZW50IGRvbWFpbiBhbmQgaXQgbXVzdCBub3QgYmUN
Cj4+ICBzaGFkb3dlZC4NCj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9LY29uZmlnICAgICAg
ICB8ICAxMSArKysrDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jICAgICAgICAgIHwgIDQ3ICsr
KysrKysrKysrKystDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wYXJ0aW5mby5jIHwgIDk1ICsr
KysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0
ZS5oICB8IDExMiArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQ0KPj4gNCBmaWxlcyBj
aGFuZ2VkLCAyMzMgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vdGVlL0tjb25m
aWcNCj4+IGluZGV4IGM1YjBmODhkNzUyMi4uODhhNGM0Yzk5MTU0IDEwMDY0NA0KPj4gLS0tIGEv
eGVuL2FyY2gvYXJtL3RlZS9LY29uZmlnDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL0tjb25m
aWcNCj4+IEBAIC0yOCw1ICsyOCwxNiBAQCBjb25maWcgRkZBDQo+PiANCj4+ICAgICAgICAgIFsx
XSBodHRwczovL2RldmVsb3Blci5hcm0uY29tL2RvY3VtZW50YXRpb24vZGVuMDA3Ny9sYXRlc3QN
Cj4+IA0KPj4gK2NvbmZpZyBGRkFfVk1fVE9fVk0NCj4+ICsgICAgYm9vbCAiRW5hYmxlIEZGLUEg
YmV0d2VlbiBWTXMgKFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQT1JURUQNCj4+ICsgICAgZGVmYXVs
dCBuDQo+PiArICAgIGRlcGVuZHMgb24gRkZBDQo+PiArICAgIGhlbHANCj4+ICsgICAgICBUaGlz
IG9wdGlvbiBlbmFibGVzIHRvIHVzZSBGRi1BIGJldHdlZW4gVk1zLg0KPj4gKyAgICAgIFRoaXMg
aXMgZXhwZXJpbWVudGFsIGFuZCB0aGVyZSBpcyBubyBhY2Nlc3MgY29udHJvbCBzbyBhbnkNCj4+
ICsgICAgICBndWVzdCBjYW4gY29tbXVuaWNhdGUgd2l0aCBhbnkgb3RoZXIgZ3Vlc3QuDQo+PiAr
DQo+PiArICAgICAgSWYgdW5zdXJlLCBzYXkgTi4NCj4+ICsNCj4+IGVuZG1lbnUNCj4+IA0KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2Zm
YS5jDQo+PiBpbmRleCAzYmJkZDcxNjhhNmIuLmMxYzRjMDk1NzA5MSAxMDA2NDQNCj4+IC0tLSBh
L3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMN
Cj4+IEBAIC0xMTgsNiArMTE4LDEzIEBAIHZvaWQgKmZmYV90eCBfX3JlYWRfbW9zdGx5Ow0KPj4g
REVGSU5FX1NQSU5MT0NLKGZmYV9yeF9idWZmZXJfbG9jayk7DQo+PiBERUZJTkVfU1BJTkxPQ0so
ZmZhX3R4X2J1ZmZlcl9sb2NrKTsNCj4+IA0KPj4gK3N0cnVjdCBsaXN0X2hlYWQgZmZhX2N0eF9o
ZWFkOw0KPj4gKy8qIExvY2sgdG8gcHJvdGVjdCBhZGRpdGlvbi9yZW1vdmFsIGluIGZmYV9jdHhf
aGVhZCAqLw0KPj4gK0RFRklORV9TUElOTE9DSyhmZmFfY3R4X2xpc3RfbG9jayk7DQo+PiArDQo+
PiArI2lmZGVmIENPTkZJR19GRkFfVk1fVE9fVk0NCj4+ICthdG9taWNfdCBmZmFfdm1fY291bnQ7
DQo+PiArI2VuZGlmDQo+PiANCj4+IC8qIFVzZWQgdG8gdHJhY2sgZG9tYWlucyB0aGF0IGNvdWxk
IG5vdCBiZSB0b3JuIGRvd24gaW1tZWRpYXRlbHkuICovDQo+PiBzdGF0aWMgc3RydWN0IHRpbWVy
IGZmYV90ZWFyZG93bl90aW1lcjsNCj4+IEBAIC0xNjAsMTAgKzE2NywyMSBAQCBzdGF0aWMgdm9p
ZCBoYW5kbGVfdmVyc2lvbihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICAgKi8N
Cj4+ICAgICBpZiAoIEZGQV9WRVJTSU9OX01BSk9SKHZlcnMpID09IEZGQV9NWV9WRVJTSU9OX01B
Sk9SICkNCj4+ICAgICB7DQo+PiArICAgICAgICB1aW50MzJfdCBvbGRfdmVycyA9IEFDQ0VTU19P
TkNFKGN0eC0+Z3Vlc3RfdmVycyk7DQo+PiArDQo+PiAgICAgICAgIGlmICggRkZBX1ZFUlNJT05f
TUlOT1IodmVycykgPiBGRkFfTVlfVkVSU0lPTl9NSU5PUiApDQo+PiAtICAgICAgICAgICAgY3R4
LT5ndWVzdF92ZXJzID0gRkZBX01ZX1ZFUlNJT047DQo+PiArICAgICAgICAgICAgQUNDRVNTX09O
Q0UoY3R4LT5ndWVzdF92ZXJzKSA9IEZGQV9NWV9WRVJTSU9OOw0KPj4gICAgICAgICBlbHNlDQo+
PiAtICAgICAgICAgICAgY3R4LT5ndWVzdF92ZXJzID0gdmVyczsNCj4+ICsgICAgICAgICAgICBB
Q0NFU1NfT05DRShjdHgtPmd1ZXN0X3ZlcnMpID0gdmVyczsNCj4gDQo+IFdoYXQgaXMgdGhlIEFD
Q0VTU19PTkNFKCkgc2NoZW1lIGludGVuZGVkIGZvcj8NCj4gDQo+PiArDQo+PiArICAgICAgICBp
ZiAoIElTX0VOQUJMRUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgJiYgIW9sZF92ZXJzICkNCj4gDQo+
IElmIGhhbmRsZV92ZXJzaW9uKCkgaXMgY2FsbGVkIGNvbmN1cnJlbnRseSBvbiB0d28gQ1BVcywg
aXQgbWlnaHQgYmUNCj4gcG9zc2libGUgZm9yIGEgY29udGV4dCB0byBiZSBhZGRlZCB0d2ljZS4N
Cj4gSG93IGFib3V0IGEgc2VwYXJhdGUgZmxhZyB0byBpbmRpY2F0ZSB3aGV0aGVyIGEgY29udGV4
dCBoYXMgYmVlbiBhZGRlZA0KPiB0byB0aGUgbGlzdD8NCg0KSSB3YW50ZWQgdG8gYXZvaWQgaGF2
aW5nIGd1ZXN0X3ZlcnMgYXMgYXRvbWljIG9yIGludHJvZHVjZSBhbiBvdGhlciBsb2NrLg0KQnV0
IGkgdGhpbmsgbm93IHRoYXQgdGhpcyBpcyBraW5kIG9mIGltcG9zc2libGUgdG8gYXZvaWQgYW5k
IHRoaXMgd2F5IHRvIGRvDQppdCBpcyB3cm9uZy4NCg0KSSB3aWxsIHRha2UgdGhlIGNvbnRleHQg
bG9jayB0byBkbyB0aGlzIHByb2Nlc3NpbmcgdG8gYXZvaWQgdGhpcyBjb3JuZXIgY2FzZQ0KYW5k
IHJlbW92ZSB0aGUgQUNDRVNTX09OQ0UgdG8gcHJvdGVjdCBtb2RpZmljYXRpb25zIHRvIGd1ZXN0
X3ZlcnM6DQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jIGIveGVuL2FyY2gv
YXJtL3RlZS9mZmEuYw0KaW5kZXggYjg2Yzg4Y2VmYThjLi4zMDZlZGI5Nzg2M2EgMTAwNjQ0DQot
LS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQorKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5j
DQpAQCAtMTU4LDYgKzE1OCw3IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV92ZXJzaW9uKHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzKQ0KICAgICBzdHJ1Y3QgZG9tYWluICpkID0gY3VycmVudC0+ZG9t
YWluOw0KICAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQogICAgIHVpbnQz
Ml90IHZlcnMgPSBnZXRfdXNlcl9yZWcocmVncywgMSk7DQorICAgIHVpbnQzMl90IG9sZF92ZXJz
Ow0KDQogICAgIC8qDQogICAgICAqIEd1ZXN0IHdpbGwgdXNlIHRoZSB2ZXJzaW9uIGl0IHJlcXVl
c3RlZCBpZiBpdCBpcyBvdXIgbWFqb3IgYW5kIG1pbm9yDQpAQCAtMTY3LDEyICsxNjgsMTQgQEAg
c3RhdGljIHZvaWQgaGFuZGxlX3ZlcnNpb24oc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQog
ICAgICAqLw0KICAgICBpZiAoIEZGQV9WRVJTSU9OX01BSk9SKHZlcnMpID09IEZGQV9NWV9WRVJT
SU9OX01BSk9SICkNCiAgICAgew0KLSAgICAgICAgdWludDMyX3Qgb2xkX3ZlcnMgPSBBQ0NFU1Nf
T05DRShjdHgtPmd1ZXN0X3ZlcnMpOw0KKyAgICAgICAgc3Bpbl9sb2NrKCZjdHgtPmxvY2spOw0K
KyAgICAgICAgb2xkX3ZlcnMgPSBjdHgtPmd1ZXN0X3ZlcnM7DQoNCiAgICAgICAgIGlmICggRkZB
X1ZFUlNJT05fTUlOT1IodmVycykgPiBGRkFfTVlfVkVSU0lPTl9NSU5PUiApDQotICAgICAgICAg
ICAgQUNDRVNTX09OQ0UoY3R4LT5ndWVzdF92ZXJzKSA9IEZGQV9NWV9WRVJTSU9OOw0KKyAgICAg
ICAgICAgY3R4LT5ndWVzdF92ZXJzID0gRkZBX01ZX1ZFUlNJT047DQogICAgICAgICBlbHNlDQot
ICAgICAgICAgICAgQUNDRVNTX09OQ0UoY3R4LT5ndWVzdF92ZXJzKSA9IHZlcnM7DQorICAgICAg
ICAgICBjdHgtPmd1ZXN0X3ZlcnMgPSB2ZXJzOw0KKyAgICAgICAgc3Bpbl91bmxvY2soJmN0eC0+
bG9jayk7DQoNCiAgICAgICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZNX1RPX1ZNKSAm
JiAhb2xkX3ZlcnMgKQ0KICAgICAgICAgew0KDQpXaGF0IGRvIHlvdSB0aGluayA/DQoNCkNoZWVy
cw0KQmVydHJhbmQNCg0K

