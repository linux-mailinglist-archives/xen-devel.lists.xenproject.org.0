Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C193BCC31AF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 14:13:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187911.1509211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVUr9-000417-ET; Tue, 16 Dec 2025 13:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187911.1509211; Tue, 16 Dec 2025 13:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVUr9-0003z6-B5; Tue, 16 Dec 2025 13:12:47 +0000
Received: by outflank-mailman (input) for mailman id 1187911;
 Tue, 16 Dec 2025 13:12:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zuqr=6W=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vVUr7-0003z0-Ft
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 13:12:45 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e72d65f5-da80-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 14:12:43 +0100 (CET)
Received: from DUZPR01CA0132.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::22) by PAXPR08MB7490.eurprd08.prod.outlook.com
 (2603:10a6:102:2b7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 13:12:36 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::5) by DUZPR01CA0132.outlook.office365.com
 (2603:10a6:10:4bc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 13:12:55 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 13:12:34 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB6118.eurprd08.prod.outlook.com (2603:10a6:20b:29b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 13:11:31 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 13:11:30 +0000
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
X-Inumbo-ID: e72d65f5-da80-11f0-b15b-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NKCkjD6hsOeqbxrM4LWAU1eiTlzPKAkbtSNrrrL20d92BIqmXNFLjwxcleeecw7px7hkDkW1tujmEcrj0F6l04HWPNNd+YWSddggRY/Q6gHWRP+6wxduozfHZOYat6meUUhiQiGPdkB90tadZSQ3b0vyMdKGjLYCdJHiw2apomrXMmYYPnvntfTH7EmqQ4+g4e7C1lA/fSDJsk59zU0dxE9ylo969kAj04L77KzJZdKEW2hwWqZzu2v3WfJop2X6hmXRFvNpIJQpp/r/Nzk9lA5hj4agj16uagWeJLdWkOXXR/iZcsAHNmIZOqt1EQ5+jtQuL1KTJx9FI6UHaDc56g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoI7B1/zU8kBCvCQKWt8vAlsd5wE3WnTXgvKAvfMKkI=;
 b=ALvWPqP8wPjGHUoROcFKpDhZomx7ax+AnIaxEvep570p8Z491R/+ikuPzWtRNLMTPRy+PeyAV3J06tlzD+VaL0Rba6y6CQVGWH4A9LHBGOl7XaNBMr6b/vW2ajRNgMpy2stjUOF/8lyZFe/oY2dh8/tcPkg3N83dQCrMcrruJ3sy/gz5ioaU4MpIGDkmhXJBoqckShvWd89m6M+fDO0712qsFwppo9ITfyXvrCGiGGS8QBhz3YE4d6Z0t7jw4vbnoOWEYrpI6/anSV1sqOocZX957WFbUwT4h7BmVvnDSdnBM4QQWWcITt9wYIWuzbeGfsx6sZ5jHyhJaCuCVfp4rg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoI7B1/zU8kBCvCQKWt8vAlsd5wE3WnTXgvKAvfMKkI=;
 b=Zbnqq+4aGAQ/VhdbyNhn4c+0nD3zWPelCR/n8IKzRBXflNYMl0jlvQc4wGaRTKWWuQjlpTxPCOGQexTkNdm79mguQ7QeW25uwrW4iqDitp/K2521FuhmlZVXG6B2dxAaqKFQ3P6eZjp0wmDJCDQl/guVhwgFfSK+R1HSHfOMeNY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbaC0e/Ze0Ciav8HyeHfG7NAVGzNnLGifAqihBvU2j/UJzsZeNV22MgjgVCI8lJFn2npjZedkNIA11e2qH0ZUERBASFD68iyYkmsf0/E07lr2lJbR8YCKEa8WCi9TliPqpy3oQm6oZdksFe7Pj8MQz1jIVJ6LQAFnnZKu1Iq7s2VFbD412wqIRrbVJe8gxxFr7SSlGeWGRecyHXID/bcfZCQtTOlXQkusgezC68ii9zmcoRutU7cSc76gmJJKteiyL2R9yQlbRMKojvGpYmdN7JcjVw07KKBWmKxoU59O4gP5BkN1tt2nNvLR2vjG5NzLIGfLzy18LFxI86vwC078Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoI7B1/zU8kBCvCQKWt8vAlsd5wE3WnTXgvKAvfMKkI=;
 b=ia8wqr+i8RVj4Tvy+Up64GTaW9sEVJ7Kgd3v4DWKkmX3dubygNeCvIGpWOMhRgu6sAM97d4+t3+2b4TxL+MPKDDEpvY/PyFv+4t59inOnswtZukgrkVOe+iBxpVco9deEefFT0aD/n753htZ4HR58Ll1wQCzuOMBosPGUU7mpAla2gL4N/PUBRHq4B0QWBnxkN9xfDCYFVLERXw3NQlGXk/kTUblUYHaxRFAqdi0VDppl+yF29+zJsjtj511ctUnTTa+xwE4mBy+k1ggmP0MCf5cM/8gGqrhy2CHHYlYOHfI9zlxNUh7PtsdvK/slzXpXSrfPd2tpMpwf4sUcNr9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoI7B1/zU8kBCvCQKWt8vAlsd5wE3WnTXgvKAvfMKkI=;
 b=Zbnqq+4aGAQ/VhdbyNhn4c+0nD3zWPelCR/n8IKzRBXflNYMl0jlvQc4wGaRTKWWuQjlpTxPCOGQexTkNdm79mguQ7QeW25uwrW4iqDitp/K2521FuhmlZVXG6B2dxAaqKFQ3P6eZjp0wmDJCDQl/guVhwgFfSK+R1HSHfOMeNY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Hari Limaye <Hari.Limaye@arm.com>
Subject: Re: [PATCH 4/6] arm/mpu: Introduce modify_after_init_mappings
Thread-Topic: [PATCH 4/6] arm/mpu: Introduce modify_after_init_mappings
Thread-Index: AQHcbmyFulGILbBE7ECsCvfNrhQ4ULUkPf8A
Date: Tue, 16 Dec 2025 13:11:30 +0000
Message-ID: <1D457431-73BE-4FA6-A27C-7D130CB9EA53@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-5-harry.ramsey@arm.com>
 <6acc279f-15d8-43c5-b676-7312de3dde5e@amd.com>
In-Reply-To: <6acc279f-15d8-43c5-b676-7312de3dde5e@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB6118:EE_|DB1PEPF00050A00:EE_|PAXPR08MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: 11249669-e151-4b3c-daa7-08de3ca4c740
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Z2FiMlA5b3h2Q0tsbHV5K3psazNZTS9Ob0NMRzQwRFNwc00xUDd5bnZiU09z?=
 =?utf-8?B?K2xPQmxyRmhlUVBaaWlVOHdiRktiWU1iNHN2bVhhaFpEbE5vL1pRS0RSUVc1?=
 =?utf-8?B?T3o5bDZMZ3VvcVlMcjFOYTh4enFmZ1pXMUZMenNxTW9yazROc0JiK25Jb24x?=
 =?utf-8?B?T05waWpOcXl4OXVneHFRT2tneTJRQkJZRW9FQU84VFpXUjhkN0NBSFlHM283?=
 =?utf-8?B?Q1JNclVlZk13cHhubmQwMHF4QmZKQ1RMN2Y1d3QzdFEvU1lLZmtsTG92aHRz?=
 =?utf-8?B?Q3hReU9ub2xVWkJxZnd1cmVhT05CNEk4YTk0K2xZcDZZMjF5d0kydkN6V29j?=
 =?utf-8?B?d0I3eFJOZm44TkJxcDZFUENxeWVBaDJWbUVsUTFqVjJMbXowemNGdHRlYXIw?=
 =?utf-8?B?RFV4R3F5S2grNDNiOFpqWE1pRHdFV2lDYXlST2MwS1FOS2FScVd0eUVZYSs1?=
 =?utf-8?B?eVlVNHVjMUZFckFiZDQ2OUxNL3pYaEk0TjNkck1RL1orK084OXRIekVZRzBK?=
 =?utf-8?B?VGVQVzdqT25EeUNNM1hncXdZZ2pLQ2wwM2Fpdk5QWjRzckMvOXBBTkVTSGxV?=
 =?utf-8?B?N2tGa1krL1huSThrQXhFbXUyS2s1cHV1WXZhalBGTkcyd0JBTVBycXZYZzJ5?=
 =?utf-8?B?UWh2Y2o2UjlBNTJ0YTRwTFNWWmEwbDBlSzZHRTMwOUVXY1h6Wm1kYVZBb1ZJ?=
 =?utf-8?B?MTFnSys1QW54STlGRFFvdXhwenR1OXA0Z2dzam9IcnJ0ZjBPU0Uyc2RFQTFH?=
 =?utf-8?B?NThRNnB3ak1hREtGMnRUS1hqeWZ3NFlhbC9ML0pVVElrQmFLWE5XRndjRk9t?=
 =?utf-8?B?aVhYVXh6QmxDVmJhWVFGODBKbmY3RWxLNUhDbG1WbEFWcElXczdxc3U5U2c0?=
 =?utf-8?B?bWhXOEc2TU1rUXBrSllGckhBSDMyMUVkbklKcktvVDk5UXpOREU0aUw4SUU2?=
 =?utf-8?B?NGVJUFdrYTI1cFBxV29ERkFpcVlvajNLc0d0SzBtOUk3SVEyRkdDM2hQdzhG?=
 =?utf-8?B?YUpKZEMxeWdEbHNHd1FyT3NBUDljRmdDRTFqbmlnYUROMlZFZ01hZjdzQzVx?=
 =?utf-8?B?azhHcVJJY04rSXpWN0JNbkM1czAzdWp2bFZkcEZiM2lITVFpeWpuNDN4MUR2?=
 =?utf-8?B?WUV5OUNjQzI5NkVZS1NQSCtkVG1BdEU5RVBxMmVqTkh0bThaVGZVYUU4SUJa?=
 =?utf-8?B?dEV4Uy9IdWw1c1VoTHBsNkNTdXVJTm5KVEFJUHJBa1B5bGlQRHl3RituMGRZ?=
 =?utf-8?B?bmNJQWRtUTgwdDBTRS9vUXlKc1RjcmgrY2dOVWprU01odkt0Szhva28xV09F?=
 =?utf-8?B?OGJad2NuRFRVQklXWWZrS3p3U2p0WnNtVHJUWmVOd2lKb0VFU01nRFIzN1Zm?=
 =?utf-8?B?SDRMRWdGY1cyRzAvcXJ4bDVoc3pIRms2U3pTSnJmRkJkZEpZNkhxZHI2SFJP?=
 =?utf-8?B?TGZ4em8vN3BLNXNpVTlsN1E0SzdyeDhzM2ptcjlEM0p6cjE4U3JnSWxoMkwz?=
 =?utf-8?B?d0E4dHM0aytGbmJrZlF5dVlNTnhXZmlKNHBqU0crYTBaWThueDQvanNpYmIr?=
 =?utf-8?B?SmhEQy80Y2J4QXJMLzRuOERad0RkQ2h0djMrWVZFcjJLZ1Fqa3FmQUlkRWpY?=
 =?utf-8?B?b2tndTBVODhFUWs0cVRkeWVvaE1jN1hUMFY0Vm95em1PWFQ3RURWcHdwSUxO?=
 =?utf-8?B?a3BmMkJQRHVZaHRDd3hKaVJCdnRKdFlxbVo0Wm5WQnMvN2hvdjN2QjByZzNs?=
 =?utf-8?B?dGdBK0xmSjZuWTliWkpwaVFCeVhSaDF0TmxMMkp1eUFSaHh3TzhGZVRQNkdq?=
 =?utf-8?B?bThOT0EwQzEwQU9xeURzMTllbG54MmdQVkI2Y2Q0dGs0b2xJRVJJYzQ0bzAr?=
 =?utf-8?B?bTA3dEdydkdWMU0zUGdJb3MxQmU2UWNqNW9YdFpJL05ibFpoUVNib0x4cldl?=
 =?utf-8?B?Y3Y1S2w3N291R04xNFkvNjlCSmwvMEh6dzhYM2hoUjZvTmgybGVzK1VsaHZC?=
 =?utf-8?B?TUtjNjZ5SUx5ZmZNbGZwdnVNUjFyanl1U0xMRU9MZi95N2t5S3hDeWNCQllp?=
 =?utf-8?Q?fAR7Ai?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E9F3E102B95344C910DF712133C84F7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6118
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3da79cf-de0e-4288-a7a3-08de3ca4a125
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|14060799003|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVZHeUZvOW12dEp2ckh1M0dDeGxDZDIxVC9uMU9zM2lVMW1XcmlKZWVLQmNJ?=
 =?utf-8?B?YVZCdldaTHFGRVJNZGNYODZybm5lZlF2K1B3MnNZd1l2aWc5Z1FZMkJNODZa?=
 =?utf-8?B?aG51bDJXR2U1c1NQR3N2b2xad0phaExXeDR5VnROeExXVGpEa3JvMWpVN2xP?=
 =?utf-8?B?eDVTK0c1eUlHMEFXZVZMa09ZUmk5TTVkV0VoSzI2anF1MmZWK0ZBQlJyVnl1?=
 =?utf-8?B?Q2lyVzUxWEFGcHJoa3VRUHN5c0RRQU5QbmZ2eGFzUEdqYTlwUElRa1ZXZmhY?=
 =?utf-8?B?OExPVHZpZmcwQndOU3JtNWMzbUFnR3I5Mm5lZ1poaFloWlBMakM5ZmpSOW01?=
 =?utf-8?B?L0NiRmYxVVY1NGY0UUpDUU9mUGNON1RYVmNHcGF2VkZVTEpXODlqcUt4cmtU?=
 =?utf-8?B?SWhrWWJteGZqUit1bVVSZTUxSGtsMzFGYWwxMytEUVRKdWY3RjBYV3hMMGFS?=
 =?utf-8?B?ekp3RlZzeERiRnRzNTNreXM4c0lrWmFRZ3RyejB6bXQrcCtLNmdHYTBabW5D?=
 =?utf-8?B?K1h1NHBRUHhHcmtiWmdJQlZBVlpuZThrZ1VNdzhJejRwUkhFMVI2ZjNReG54?=
 =?utf-8?B?aWJhWE9VanpHZDVnQ3VnckRkTHFDRUVucWd5bVBRNEsxK1djb2tSVFpiNFhI?=
 =?utf-8?B?dE0vaVgyK3ViYjdUWDNLVVNUa0paRHZENERpbFJBbzF3Q0YzUXo2cFhlMjdT?=
 =?utf-8?B?bU5qNlI4ZEoyNDUxQ28ycXhhVEY3NVRFKytlK2FwdHN1NHg4cTZvVHVRUzRr?=
 =?utf-8?B?TGF3VkpLNTBSTkVYTGVhV2pZUmdyM0pFU1UvK0tIVnlmTEM2ZldhTFBmQzhl?=
 =?utf-8?B?a081K21aekNxMC9JSnNLeFBTczBXaUJPZWkvM2RRT29QcitLUkQvcDEwMldl?=
 =?utf-8?B?ZnU1Z0lqalM3T2hsWjJ5cUVpaVVFOUtoenVPVVZQY1VaSkZXNW5kaXNSeUlh?=
 =?utf-8?B?L3lpNXJ5U1FnNkdwQzd5UVhaRzRRVkFGWktVRmNUQ20zUHFFOGRkL2dickor?=
 =?utf-8?B?aGV4K0JMSjE0M2h5RHBOa0tnOWFlRmhMc083dzh0a2NVbCtWUmY3VjlOaVdT?=
 =?utf-8?B?dEhxQ0hmR0NyZkNqWTdnMEY0L1BKRFliY21UVm82SUM5MXJWNzdPMlA2bnR3?=
 =?utf-8?B?ZDFuelBva0NTbU4venBrQmhlb1hldGZHbXZyM3FyWDYvdDhxYzQzdmlNNWdt?=
 =?utf-8?B?eW9ZTWYvTlpDejVadzA2K1RqRzVLbUpmVFF3TnVhUjZrejg0T2ozcnJxR0lX?=
 =?utf-8?B?Q0k2N0V4VmpkV3NWZmN2cVc4OVUrWndoRHBmMWpGTlRpQndxd2pRZ0wxd2xx?=
 =?utf-8?B?MlVWN2E2NzNHMW5KeitlQnA2Q095SGdsK2JDTTA0WlpSOEZrbVRzNWRxY3Jp?=
 =?utf-8?B?bnVMbTI4ZTYzY1NUYlZCc0V2VXViYnhZaWM1MG1sbS84Vk1HcVE1TVZMV29E?=
 =?utf-8?B?bEJJL3BaOER6VktBMmlYbHNKL1pEaEo5bzNiSmdFYlZaMjBQMVdiZytnMXZT?=
 =?utf-8?B?VmMzR3hTajdHcU9QdzFnTGJybXdTdEt5S2VPUk5zSU42SGsyWStYeDFOSTBq?=
 =?utf-8?B?Y3d6dTUvZmlqWGorRlF0bjNOU2NJazMzdFd5U2VVR2tDejVnYk85WEVybGdp?=
 =?utf-8?B?L0srcThvaHpEK0JGRjlQTmJGUWV0N3N4ajdhamFpd2JKbUltME5uQzV4eGwr?=
 =?utf-8?B?NmFNcUNRUURKOHZDY1ZJRlJ3aUtMSndQSTd2MWpqWnlZSkhtNmJ1UlJRNjlr?=
 =?utf-8?B?QmtGaG9PUWRTcXJaOFhwZTdZK3hydmhnb0dqaWpZWWJaNWJBL0RKZEN5MVkv?=
 =?utf-8?B?OW5Fck9lWUxiVzB0a1RVZUovZ05TZGRIMVN6SGFyUS8wV0VSQ3RpNDhGaXJL?=
 =?utf-8?B?VGMxL3pYMXNzNHhsejlySEFXNGg0UkhueHZkc2RNT3ZyYlp1VkNmOXlZdWVT?=
 =?utf-8?B?b0c0Ujdqd3l0SFBnMzZrTnVHeXRjL2lvSzl0cUpNenQ4d3hORlhPWDZxWTU1?=
 =?utf-8?B?Y2p3a2Z1ZVZQb05VRTBHZHRyZEdweFJMOURXa3NVL2RKdWphSmZhbmxsUUg0?=
 =?utf-8?B?QzRPNXRmT2ZQZ0Exd2tGSjY0WVE3ZUw5WEkrRVl0bHhXek5TWHlTUEpYM2RK?=
 =?utf-8?Q?aLy4=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(14060799003)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 13:12:34.7333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11249669-e151-4b3c-daa7-08de3ca4c740
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7490

SGkgTWljaGFlbCwNCg0KPiBPbiAxNiBEZWMgMjAyNSwgYXQgMDk6MTUsIE9yemVsLCBNaWNoYWwg
PE1pY2hhbC5PcnplbEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMjgvMTEvMjAy
NSAxMDo1OCwgSGFycnkgUmFtc2V5IHdyb3RlOg0KPj4gRnJvbTogTHVjYSBGYW5jZWxsdSA8bHVj
YS5mYW5jZWxsdUBhcm0uY29tPg0KPj4gDQo+PiBEdXJpbmcgYGluaXRfZG9uZWAsIFhlbiBzZXRz
IHRoZSBwZXJtaXNzaW9ucyBvZiBhbGwgc3ltYm9scyBtYXJrZWQgd2l0aA0KPj4gX19yb19hZnRl
cl9pbml0IHRvIGJlIHJlYWQtb25seS4gQ3VycmVudGx5IHRoaXMgaXMgYWNoaWV2ZWQgYnkgY2Fs
bGluZw0KPj4gYG1vZGlmeV94ZW5fbWFwcGluZ3NgIGFuZCB3aWxsIHNocmluayB0aGUgUlcgbWFw
cGluZyBvbiBvbmUgc2lkZSBhbmQNCj4+IGV4dGVuZCB0aGUgUk8gbWFwcGluZyBvbiB0aGUgb3Ro
ZXIuDQo+IENhbiB5b3UgYmUgbW9yZSBzcGVjaWZpYyBhYm91dCB0aGUgc2lkZXMgeW91IG1lbnRp
b24/IEhvdyBkaWQgeW91IGRlZHVjZSBpdD8NCj4gSSBhc3N1bWUgeW91IGFyZSB0YWxraW5nIGFi
b3V0IE1NVSBwYXJ0Lg0KDQpZb3UgYXJlIHJpZ2h0LCB0aGlzIHNlbnRlbmNlIGlzIGEgYml0IG1p
c2xlYWRpbmcuDQpTbyB3aGF0IHdhcyB3cml0dGVuIGhlcmUgd2FzIG1lYW50IHRvIHNheSB0aGF0
IG9uIE1QVSBtb2RpZnlfeGVuX21hcHBpbmdzDQpzaG91bGQgc2hyaW5rIHRoZSBSVyBtYXBwaW5n
IHJlZ2lvbiBhbmQgZXh0ZW5kIHRoZSBSTyBtYXBwaW5nIHJlZ2lvbiBiZWNhdXNlDQphcyBvZiBu
b3cgdGhleSBhcmUgZGVjbGFyZWQgbGlrZSB0aGlzIGluIHhlbi5sZHMuUzoNCg0KcmVhZCBvbmx5
IGRhdGE6DQorLS0tLS0tLS0tLS0tLS0tLS0tKw0KfCBfc3JvZGF0YSAgICAgICAgIHwNCnwgX2Vy
b2RhdGEgICAgICAgICB8DQorLS0tLS0tLS0tLS0tLS0tLS0tLSsNCg0KUlcgZGF0YToNCistLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQp8IF9fcm9fYWZ0ZXJfaW5pdF9zdGFydCB8DQp8IF9f
cm9fYWZ0ZXJfaW5pdF9lbmQgIHwNCnwgX19pbml0X2JlZ2luICAgICAgICAgICAgICB8DQorLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KDQpBbmQgaW4gaGVhZC5TIHdlIG1hcCBsaWtlIHRo
aXM6DQoNCi8qIFhlbiByZWFkLW9ubHkgZGF0YSBzZWN0aW9uLiAqLw0KbGRyIHgxLCA9X3Nyb2Rh
dGENCmxkciB4MiwgPV9lcm9kYXRhDQpwcmVwYXJlX3hlbl9yZWdpb24geDAsIHgxLCB4MiwgeDMs
IHg0LCB4NSwgYXR0cl9wcmJhcj1SRUdJT05fUk9fUFJCQVINCg0KLyogWGVuIHJlYWQtb25seSBh
ZnRlciBpbml0IGFuZCBkYXRhIHNlY3Rpb24uIChSVyBkYXRhKSAqLw0KbGRyIHgxLCA9X19yb19h
ZnRlcl9pbml0X3N0YXJ0DQpsZHIgeDIsID1fX2luaXRfYmVnaW4NCnByZXBhcmVfeGVuX3JlZ2lv
biB4MCwgeDEsIHgyLCB4MywgeDQsIHg1DQoNCk5vdywgYmVjYXVzZSAoX19yb19hZnRlcl9pbml0
X3N0YXJ0LCBfX3JvX2FmdGVyX2luaXRfZW5kKSBuZWVkcyB0byBiZWNvbWUgUk8sDQppdCBtZWFu
cyB0aGF0IFJPIHNlY3Rpb24gd2lsbCBiZSBleHRlbmRlZCB0byAoX3Nyb2RhdGEsIF9fcm9fYWZ0
ZXJfaW5pdF9lbmQpIGFuZA0KUlcgc2VjdGlvbiB3aWxsIGJlIHNocmlua2VkIHRvIChfX3JvX2Fm
dGVyX2luaXRfZW5kLCBfX2luaXRfYmVnaW4pOg0KDQpyZWFkIG9ubHkgZGF0YSByZWdpb246DQor
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQp8IF9zcm9kYXRhICAgICAgICAgICAgICAgICAg
fA0KfCBfX3JvX2FmdGVyX2luaXRfZW5kIHwNCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsN
Cg0KUlcgZGF0YSByZWdpb246DQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KfCBfX3Jv
X2FmdGVyX2luaXRfZW5kICB8DQp8IF9faW5pdF9iZWdpbiAgICAgICAgICAgICAgfA0KKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCg0KU28gd2hhdCB3ZeKAmXZlIGRvbmUgaXMgdGFraW5n
IChfX3JvX2FmdGVyX2luaXRfc3RhcnQsIF9fcm9fYWZ0ZXJfaW5pdF9lbmQpIGZyb20NCnRoZSBS
VyByZWdpb24gYW5kIGF0dGFjaCBpdCB0byB0aGUgUk8gcmVnaW9uLg0KDQo+IA0KPj4gDQo+PiBU
aGlzIGRvZXMgbm90IHdvcmsgb24gTVBVIHN5c3RlbXMgYXQgcHJlc2VudCBiZWNhdXNlIHBhcnQt
cmVnaW9uDQo+PiBtb2RpZmljYXRpb24gaXMgbm90IHN1cHBvcnRlZC4gVGhlcmVmb3JlIGludHJv
ZHVjZSB0aGUgZnVuY3Rpb24NCj4gV2hhdCBlbHNlIGlzIGluIHRoYXQgcmVnaW9uPw0KPiBXb3Vs
ZG4ndCBpdCBiZSBiZXR0ZXIgdG8gaGF2ZSBvbmUgcmVnaW9uIGZvciB0aGlzIF9fcm9fYWZ0ZXJf
aW5pdCBzbyB0aGF0IHdlDQo+IGRvbid0IG5lZWQgdG8gc2hyaW5rL2V4dGVuZCB0aGUgbWFwcGlu
Z3M/IElzIGl0IGRvbmUgYmVjYXVzZSBvZiBudW1iZXIgb2YNCj4gcmVnaW9ucyBsaW1pdGF0aW9u
Pw0KDQpTbyBpZiB3ZSBkbyBpbiB0aGlzIHdheSB3ZSB3YXN0ZSBvbmUgcmVnaW9uLCBiZWNhdXNl
IHdlIHdpbGwgaGF2ZSAyIHJlZ2lvbiBkZWNsYXJlZA0KUk8gdGhhdCBhcmUgYWxzbyBjb250aWd1
b3VzLCBzbyBlYXNpbHkgbWVyZ2VhYmxlLCBsaWtlIGhvdyB3ZSBhcmUgZG9pbmcgYWJvdmUgYnkN
CkV4dGVuZGluZy9zaHJpbmtpbmcuDQoNCkNoZWVycywNCkx1Y2ENCg0K

