Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kBCnBbb1H2oVtQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:36:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A07E63636E
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:36:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=lrNSI8c9;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325965.1591343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUi1X-0005Kx-Gv; Wed, 03 Jun 2026 09:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325965.1591343; Wed, 03 Jun 2026 09:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUi1X-0005Jb-E7; Wed, 03 Jun 2026 09:36:31 +0000
Received: by outflank-mailman (input) for mailman id 1325965;
 Wed, 03 Jun 2026 09:36:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUi1V-0005JV-Hh
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:36:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUi1U-0038Pf-Cv
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:36:28 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ff599-5cb7-0a2a0a5109dd-0a2a450cb104-6
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:36:28 +0200
Received: from [52.101.43.28]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1ff59a-62f1-0a2a450c0019-34652b1cdf2d-4
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:36:28 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB8253.namprd03.prod.outlook.com (2603:10b6:806:460::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:36:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 09:36:24 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igUz4kdlD+ET1pia+vCiPvfMq6qvwbsa3eEPad/irVGmIUf/8caGkKAXLjLzUjRLI8/Bc25VM+fj1QDLK8EjTaHojuKk8jYgkq3Qixno4zaWX156wal41Lq1V+x2IeizxmQrLk+O6tRGN8KWBqHY3hN+X1OkHReU0Ajrc5bC2aW63GAEAVYbdc/pqtYFeXontVc9ry0WwXBZCP+RQBPezNBcDy3mWUDMcINSk4muTcYrQKiFvzt+4AjXSYQO9wXaRYSSpflBUOMg5XR3AdahrfaDiX25yV8CXCOgLL8P3dqb808T5uVdXDiL1Bnze+cYEFmkUsx7E3PM1fqKKth8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c8F18BVImQIRFepP2LdR0tjzQrARu+l4rfmPrzXkSE=;
 b=WLGF+Hb+J7vGPJuY2YUoq2M+iwK3wwikuze/vpF+jYKAN7hrQjGAadTSIIgX/t3sGOFW4HbMKfvg1AUWCVY8Kt/vsmc2rcTu1xul6pAKcRs1STvUH/rhNFojb5hQaTQwgFFDjnjktYGjRRpB+/TnS/ZxQxgoryF1tsE9VtOLGb8XXE/k8VQ8dEQPXE3+7KbiXsSOtwEHpaM1g6XAb6huObnvtU7rohB/FF/rrcOeesIyVu6Ye/tsrIqlL42UWFI4TF7aazHybQWmJ6dHXLrNzpgn3Gp7Ueggn6GbFkzHb+srNSa8NXyFWUCPKPwjwMRaQY3nPV7LhPrpYrp2FGOvCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6c8F18BVImQIRFepP2LdR0tjzQrARu+l4rfmPrzXkSE=;
 b=lrNSI8c9jRyZE2nZ0msYmOAQlkm2vaQFKjLyWv6mv/JB0PYjqenHxNBKog/EOVrtM3U1jOUcPleQlWr8BulYiyj81WoOxm9zOURbsJx5Im8Su0FNguxKo54bmjEJL0jHQvEeo9xfNqcLKuu3Wv7ufvMCeWiV5X6142NhKqBSfVY=
Message-ID: <9fe33fbc-be7c-46ab-b32d-f39ac619bb08@citrix.com>
Date: Wed, 3 Jun 2026 10:36:21 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22] x86/fred: Enable FRED by default on AMD systems
To: Jan Beulich <jbeulich@suse.com>
References: <20260602164519.2634144-1-andrew.cooper3@citrix.com>
 <ca4eafc3-8699-4903-aad5-5cb95ea6e409@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ca4eafc3-8699-4903-aad5-5cb95ea6e409@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0394.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: d93e0162-ccb5-4f9a-1d88-08dec1539440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099006|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	9Nih1Vz0Yja6DiVt4fTWItlHNBXTSoSNuyBAZreIV6MRzVAqKLTylk3egqrCMOTgKNUNggPVJrxukjtaAUklrsj0X0Wc1/lKrr2iMJGgxIAh6mf1xZAdY2d3tZS93LqDS2xAdjALKNUQf6VAXiHJ6n+fa+R948XDW2V3fyKIybLhxgFGNnsrqOUii8nZ/43hlDTPwnrgAbACJojwEnwvG8xVMyyT3A+4bBS1C0/mygsoaQ674FpZODHpiijyoRlUUi8PEMNquAiBnk7OAeuX9g16QAcYNpk6431gqyMWUHExx0R841uMz/3NbsPLURfwUaAQeGmhpiPEtNEAOzI+XFqrTpcItMnlzT6Q5z4cWlp2QMLQ9lNfK1GotEvxhp29exfG+Id3yGmqdSmmX/1VCh48PVl0WChy2jkY8DuUuY7Z4Iee0387lpqzULLfd2Z0MsAi2S1vFCsPD+O31Ur3k2+AhDvsCU/Bez9RonMw3bFY08PC719sY7B20u3KqDwwgS1J4AJHQw7oOLVm98UioSa1hd8t34yWivfex/aZDEqdbbGBqbb72B3lo+WjNLE6Bm16PD+4L4C1beOJmg4haCvFFNw5siw5YhZP4Kv8JFsXzY09HQceS2FtgOIFrDUTpqQxXiahYqD4T64Tfptz4zt1LRo2LKz4/00h5sPX5T9LlhrK5fWR4BL8k4nywtJJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3dTQ1A3aDFYQUUzL2FPYVBJUUdZdnRjZWtTbURpTSswZ0M0QS9yaEJTWDJQ?=
 =?utf-8?B?clNEbGw3QXVrNDNOSDRsZHlSVklWUXdxMUVmeFA4ZFBmSGFBNTBaRGxoMTk4?=
 =?utf-8?B?NUJZS1AvUy8vd0tPeW50QUtLWHJVOGNyK3Vpc3JEaHJyYUtRTno4eTRheHdK?=
 =?utf-8?B?L0lSYjNRa1M0M1lmWkRzNHp6cmNYc1U3QUNuTGpkUzRMQUNoUUN4ZUIvb0lz?=
 =?utf-8?B?N0RtVk5hRSt4eitmeHhvRFFqYlFXejE3Q2U0bjcwdVhsQlh2bTJVREY4alZN?=
 =?utf-8?B?TmFYYTFIWWpYQ05reFJUZzB0MXE5Zis1NW1JTmM4Vmw3am1WbFJwS25LbDZz?=
 =?utf-8?B?bEtoQjdWTUFORlFFcDBZSnMyTDN1OHZXZlZTeDk1ZW1ZZlcxcmowQktOQmJ4?=
 =?utf-8?B?a0JFczJPcUtYZ2NKaFJmTm95UVNKR1hsL2JVa1F1SlkxMHJ0REI3Zy9rQWhU?=
 =?utf-8?B?bE5ZOWtYMzBCbm9pY1RlTjNObEJWSmxlUHBOUjRtcWFuaDM4dGpsRlpKZ01R?=
 =?utf-8?B?VURMNXJlYW1pMzI3K05vbWR1Zk9OanVKVCszLzJWempsM09xSktyY1NJSld4?=
 =?utf-8?B?NHhFaFN3a0E2cVNsbTF5R1BzNi94eXJTYmZ4KzNwc1BSK1lsMllSKy96a3Vk?=
 =?utf-8?B?UUZmd3VVUzZYK3Jra3dZREdOekMwREQ3VCtGdm5ha2g5N0FlSk1McjdReTl0?=
 =?utf-8?B?YlNwOGZjVk9CSW1PdE5kb1hTWDdvUjc3MG1ST0J1YnVEbHlTb2t4aXZNNFF2?=
 =?utf-8?B?bTlyb2g4aHpiN1NtOFAxbDNsV0JwQS9hWVo1YUgvU1VaK05ISGx1Ri9VYW5l?=
 =?utf-8?B?R1hkL09WWDcxTkZndUdhZVZzNHRQbmw3WUxMUlhGZ055VXBvTzkxVDkzaDRo?=
 =?utf-8?B?Q0J4MG44VDMyMjBxTTBMaE51VS9OYUZ3STF2TTFLZG5FZ0FzeW5yVzYzdmlt?=
 =?utf-8?B?VUUvK1RyVmRhYStYR1JQMjMydE5ITExPMmtiQk9ReUR3eVJRWmNCbFlObmNv?=
 =?utf-8?B?eFhDNGZQR1FqTE5OV25Xc245MHh4RzJ4RFFubVZhQjJHUHlxenlYOHJ6ajJB?=
 =?utf-8?B?TFIxbFJkK1FISnRLK3g1cURlSkJHNUkwQWk1c0plY2JTVmpjZW1nNC83a2FJ?=
 =?utf-8?B?YzhwWTZkNEZKUEJpaE5DNnk0aGk4U0t3a0lqejUzMXpVSXZMTElya1A0cCtH?=
 =?utf-8?B?bU5kSTYvVlgzWkRucUVjaFFrUzQwdXpsS2I1SCszQzE4aXhxQnNFYVR6L25S?=
 =?utf-8?B?a0dUclNpRHp1MVVzTTR2THVYeU14dnY5bHJ6TWZhcTZXMld2dm5NWmtxa0ZP?=
 =?utf-8?B?VE53T28xejZZRHJrbmFoZmxvZ2ZteVNrRU00L1doSlBDSnhVdVBDbmI1ZjZv?=
 =?utf-8?B?bERRTVFSWXluaERoVlJsTlFsaHFJbXJoUG5hVUdwNnNkanBDOUpYdytTVURY?=
 =?utf-8?B?eXVhR3B4NCtFOHVUUUplRHlvajE2OVoxbmJZaUVTSFJvc1V0d1NoQk1IaTNJ?=
 =?utf-8?B?Q2tUbTAySWdMcGwrRkZBMVU2MVJ0TVNUcTZ6ODM1M1BoWHI5WWJIL3ZWVXBX?=
 =?utf-8?B?TEFoK3lNMWJBeUlBRGIxUmRRNEdST3NPSzBSMzFMYzk4WHZaSmFUbzM5Z0tz?=
 =?utf-8?B?dHU5VzZxNlZOOU1qRHYzckk2dTQyV21SZ0c3SDNCempRd1BBUlYzTVFoZTEy?=
 =?utf-8?B?OU4zUW9nWFkrM1ZNYWZPL1Z3bUZ6a1lkV2NaZzgyZ3FsM205eU12WnVYMlJt?=
 =?utf-8?B?Y1J4d3RuUzBzb0VLRW16YVlUbFdVUnQ1WEZPc2pYdHNFU3BaQkJWaml4bDlI?=
 =?utf-8?B?Tms0Z0dnZGJsYVpUQnIycFlDN1VBbzdvVmhHaG5HcFk3aDlLTzM5ZjlTb09W?=
 =?utf-8?B?a0xCaGNub3ZoNE5zQjM3NlNaOFIzRWlsQU1aRm1sZWRiL0VnRVRYc2lVbnp4?=
 =?utf-8?B?cmZFVC9JYkJuNEVRUVBVZDFBK1NlQ2k0SEFaTmtwek11Tm5TMVZhd2ZwUEZp?=
 =?utf-8?B?NldHVWE3MXNGL1FFWTBSTDVIN2p4Vml0d2ltUGhXOWZpR1dGZXphNDZtekRP?=
 =?utf-8?B?QmFsZ3kwZDhvZU16Yi9CdVRlM3ZmV3lCREpqOVB0MnBSdExSWmtFNjNMczBO?=
 =?utf-8?B?dUJCM0tsekhCSmt3Z2VlQnpqTXBIYnpmaDVXMUtSaEh2REJjZjhIdXRKY2h4?=
 =?utf-8?B?VmFlMjZzemNWd0RjWDlQQU5IeXM0dE5mbjQ4WkVwV0dsRHpyTU5pN0xvS3pt?=
 =?utf-8?B?d1dHQUhtZ0FaSUpkUW9nYTVMWFNUTCtSR0MyU3lzdXJWbkNaMlVabXdLRjlX?=
 =?utf-8?B?WFJZaUZHUVp1R21VYnNjeDd6aW9ZVWRSVzN2Q1pMTW93eHQxQmdYSUpwWHBj?=
 =?utf-8?Q?Iiq29NDLi9gEPQ6w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93e0162-ccb5-4f9a-1d88-08dec1539440
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 09:36:24.8285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4//V0eN+JWKCFhs2kNZoocrksxYxNxTTByjNIX4CXKuwcZ7WedKf+5Ocyeh2ltja7WTxG4k8STTR6JsweS1U/ijtnlVDRHW3Q1d+SfX2Spw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8253
X-purgate-ID: tlsNG-d25034/1780479388-DA368CF5-216A5FEF/0/0
X-purgate-type: clean
X-purgate-size: 2872
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A07E63636E

On 03/06/2026 7:27 am, Jan Beulich wrote:
> On 02.06.2026 18:45, Andrew Cooper wrote:
>> FRED is now believed to be complete for AMD systems, and has had its tyres
>> kicked by both XenServer and AMD.  Enable FRED by default on capable AMD
>> systems (Zen6 and later).
>>
>> Support on Intel is still not yet complete.  Leave it as tech preview and not
>> security supported.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with one remark:
>
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1259,12 +1259,12 @@ does not provide `VM_ENTRY_LOAD_GUEST_PAT`.
>>  ### fred (x86)
>>  > `= <bool>`
>>  
>> -> Default: `false`
>> +> Default: `true` on AMD, `false` otherwise
>>  
>>  Flexible Return and Event Delivery is an overhaul of interrupt, exception and
>>  system call handling, fixing many corner cases in the x86 architecture, and
>> -expected in hardware from 2025.  Support in Xen is a work in progress and
>> -disabled by default.
>> +expected in hardware from 2026.  FRED is fully supported on AMD hardware.

Along with the year, I suppose I should name the CPUs specifically now
that they're public.

>> +Intel hardware is still tech preview and not security supported.
> Is having "security" here really appropriate? There's a functional issue to be
> sorted. That's expressed by "tech preview", yes, but it still feels somewhat
> odd. If you want to keep the word, may I suggest to insert "in particular"?

I was just trying to make things clearer.  One of the common audience
groups for this file is not liable to know Xen's precise definitions of
experimental/tech-preview/supported.

> May I further suggest "On Intel hardware it is ..."?

How does this look?

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index ef3c7371895b..ff6d08affb63 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1259,12 +1259,13 @@ does not provide `VM_ENTRY_LOAD_GUEST_PAT`.
 ### fred (x86)
 > `= <bool>`
 
-> Default: `false`
+> Default: `true` on AMD, `false` otherwise
 
 Flexible Return and Event Delivery is an overhaul of interrupt, exception and
-system call handling, fixing many corner cases in the x86 architecture, and
-expected in hardware from 2025.  Support in Xen is a work in progress and
-disabled by default.
+system call handling, fixing many corner cases in the x86 architecture, and is
+available on Intel Panther Lake and Diamond Rapids CPUs, and AMD Zen6 CPUs.
+FRED is fully supported on AMD hardware.  On Intel hardware it is still tech
+preview, and in particular not security supported.
 
 ### gnttab
 > `= List of [ max-ver:<integer>, transitive=<bool>, transfer=<bool> ]`


?

~Andrew

