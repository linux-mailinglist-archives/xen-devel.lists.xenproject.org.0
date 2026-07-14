Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jt3pJD4PVmqWygAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:28:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D2D753646
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 12:28:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=ZifZlHGR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1362112.1614026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjaM1-0002hb-Rl; Tue, 14 Jul 2026 10:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362112.1614026; Tue, 14 Jul 2026 10:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjaM1-0002fH-NU; Tue, 14 Jul 2026 10:27:09 +0000
Received: by outflank-mailman (input) for mailman id 1362112;
 Tue, 14 Jul 2026 10:27:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wjaLz-0002f9-Na
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 10:27:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjaLz-00GoIc-4W
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 12:27:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a560ee5-2eae-0a2a0a5409dd-0a2a450ab26a-44
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:27:07 +0200
Received: from [52.101.56.15]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a560ef9-f2d2-0a2a450a0019-3465380f1ea3-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:27:06 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by LV3PR03MB7456.namprd03.prod.outlook.com (2603:10b6:408:1a0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 10:27:00 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Tue, 14 Jul 2026
 10:26:58 +0000
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
 b=dNAF/Hjw9S0WoVwh2i7oZ9lXwnSYX4rQE4VlcNsNOb+z0BaEz6rNsDP4UaDxA9mZh6IQhvXmjpnSfhHJlp7MXJOMwYru+1UwzpJ4ltZevys7dS437uxN0zLpM6tZbG62BMIwRVaCjmnr2YDojf28Ajl1aWSmUhs78j4vt+wiuKWMugl77JdP7qwf2nJKmdmCGB/h/ZPmei0T9L/ehmX8Tr4yr3SH+EChAe4lN1ALXrdSYS5uoH48C1GcTUNeOUOBOVma53M00TlXX2aUcE4A2KSmP0CBph6ZxwG23K97WMUkl2V8fz+BH5A2VbLS8MsoL5I5GwbGDAI+330+ARMugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tvKb6Qd0yeNV6HluNTdlmoFDN0fHnF3V7UZ17frJmQ=;
 b=a0p4RbBgToIcGhbbJTqcCG6OrfP4DYJmcPcnWPdbEg+bABL+Y+OegGfii+6dVirJHq/YwAICYkJl1YmeUGhCwrf23wjM3lm8XuLMQtWS8K+ZVKi2C4/F2eNK5ijYxSv8UvPDEY8cTVpDBL1w/d41/qbHe7knl7/93vmQ0yDjGln4DZRdvt2IcRqOlNhEwft0r3aHn2PU6lCy4eO5th3rDJ+vwCMYkZ3rO+KQ4GOouWp1Ga8PR5hPMntU8gI7g8jxNhJ1hJFMP/PiEmZ0S55jSd0tW5kxsbLtyFFtSLdrFRmP9IwItbuPgYuZ63NNsGn0UqqEo0e8YTxebAlJUHc90Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tvKb6Qd0yeNV6HluNTdlmoFDN0fHnF3V7UZ17frJmQ=;
 b=ZifZlHGR0t7F9LBYyBuRrDOjCTMxhVICoz3iXI614CJqAXd1Jm1qwzE2u6K3yuwxKmTqO5Z/g6o8/mh1iCX1JCK/mxZZGp3ATcHT/Bi561jcpmK4Y9GuG+qw7JhzWCt+nN/L1YVtXJBhXkJzasWQKwJY4s54pErCxqW1mF1cfMg=
Message-ID: <8c265153-6774-4904-9791-9386c7018e11@citrix.com>
Date: Tue, 14 Jul 2026 11:26:55 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH for-4.22 v1] tools/ocaml: xenbus - Fix handling of
 requests with len = 0 for socket connections
To: Andrii Sultanov <andriy.sultanov@vates.tech>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <1783598431.8631fc262581453bbf619ec5b2062170.19f46c03b15000edb5@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1783598431.8631fc262581453bbf619ec5b2062170.19f46c03b15000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::17) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|LV3PR03MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e4f7c8-d7ec-45f4-25d6-08dee1926f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|4133799003|22082099003|56012099006|11063799006|5023799004|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Rg1Sz55qHsCU6AiF3LxOlS5JQ54PfP9YTJEUD8jUjTzl1Sl+/erowvnVxqOYuJh5yMqDLOw5N1s851vLFe4G+dBMBiDRNbHLmIiXHuTzqzNxSis3zadh7nTpHGEOrLEZXyrRhdPeG9AchbNT03jGPTayFc7lW94/RbLWxR9TavceeBMU74MrjOY1N90DFePFTmQ0Y7miZsXWpyRsXBVqijyiPw954XpJQJQxTv5/tVc9OhMtbyoVpVcZwTHHAEO3CQQWbeCitbvszbjJfTfEMwPOt0YEOKyZg5Hj4Ppnjw8ODjz6qd3aODugWgit+PvNnbs/PHfRnrEP5rSWvmhDsdY0iFbp9tP8CwIBTL+t3w0JeAIyWesuelTvd/mocb0So8t8mzZ8DXGXPU+MTC437KdoHafDUv/Tx0sH/drl7lJWIononlXv2O8ZtbFJloQFmRFAvdS9IvMnG77+ACu4mq1fTm9xDFRUVjQJi25fEbXvazRGjWevAY9OquS3KOYfh9D8eoC/3RueTy4pnbiiqEjwwJGXePRxGMHa0Me8I2IIjLAZbVGjepKgSN7/+0yyIfqu3fH+EQd7FyWjO2S3a1IyhkLikMZCJZ3C2vM7LcEqGqeyBmJGrgY+J3mt/6Uy8Hv1iy2lF3MGxDzJO7Oqz9l2nVtGos1R/NqHbyxUia4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4133799003)(22082099003)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2RSamdsUUFSK3Bxblp6cHp6c2ljWFZnbnluWklSeW9uSWo3cldkZ1pIcDdO?=
 =?utf-8?B?UkdIYlBxRHBZMmVxNEJ5NTR2dlB2SFYwdmFHQ3V1NDdiMm1qeGdJR1hDeDV0?=
 =?utf-8?B?UVdSTGJON2dYNHVOMCtzSnd0V1I5UEVxQkJseTE2b0syeHlNa3dEODV5WnUv?=
 =?utf-8?B?Qyt0Nm5oc0h6ZlhlZVFjWC9BUWozSUZscTVIaFpLbG1hZzhLa0Q3aDZzZU0y?=
 =?utf-8?B?TFg0NWIxN0l6aWpsUDVxbWI2Qk5WM1I3MXBXNkc5SzM5SzNNZThDRnFUTy9O?=
 =?utf-8?B?Y2ZDY3VGd0c1Mis3N3JtY1R4OVBxY0kzZ0FOM2xwdzBFcWRPZ2tIcTRDUDVH?=
 =?utf-8?B?YmZCSkY0U1MzUy9lakJ2Y1NkejFpc1BDQVlqWGpvZFdmNENLV2R0Vk9HMTRz?=
 =?utf-8?B?eFEwcnowaGh6akZmL1VVcHo3Q2FsL1hDSmdSeEEzajV6NEphZFNHSkNzS1Vt?=
 =?utf-8?B?dk9jUW1uZ0Rsdzg4QzJhQVpYNW93MmZ5SVlYVmZzWFZhVEtvSVJWMjZmaThV?=
 =?utf-8?B?UmEyaC9qZXVralpCVEZBb2VmSTFkaHoxVXpuSDg3bDEweFJISTFnanNQc3lP?=
 =?utf-8?B?OUtzeUdHSVZZajE4RDBHV2JxcWJTTjkvek1nME9Zd3gxbXVxRTJxV21DK1FS?=
 =?utf-8?B?MWFLMlY0MFJMNHB0RmR2dktGMHZEd0hCS2NXSWFaaWVad1Q1RjJhZExxckZH?=
 =?utf-8?B?SUhZVzZUeGFYSldCZjBjQVgrOGtwcUN0T2h2ZldwUFdKQ1RjWWt5cXV2RXE3?=
 =?utf-8?B?V3AxV3BNalZKQ2lPeHlCTDRsdm15ZnRMVFpkcitJN05pZXpxbWppYU9pS2Z5?=
 =?utf-8?B?ZWsyT1JBVUNpbkFiU0xlRHRNUkNjMGJJNVlxRjRhbytYUnRVVktBbzcwWUNB?=
 =?utf-8?B?aXpsN2RMVjhrdWpDVU1XL1Z0RkVXN0U3VUpidS9YdmlrdGx1VnRlS05wYXhx?=
 =?utf-8?B?QmllVlVSTzNob09hcTVFVE8waW9IK1ZINWhzdDhGOFVDQ2Q5RWtVTW04S2lM?=
 =?utf-8?B?WW1YbVNFUVE5YVp2bFd1OFVQU0FLdWxONXRrMzRzdGJFTlFzaDU5Y0hONG1V?=
 =?utf-8?B?Z05JV2IwTkRtTi9PcUJmOGgwaVBwMVpHbmhlTkJ2YmE4QS9kekhNOEdUckVv?=
 =?utf-8?B?K1V5bVdNdGtqUTJtSzZXZHU0WExlSVcwSHdVRDA0bkhickpYVDdsZnlIbSt1?=
 =?utf-8?B?aDlTU0d1elNNb0haOUF3SUx4amJaWmxkUFZManJlTXpJNGYyeVNqOUMxRGFH?=
 =?utf-8?B?QjY4dnhDTGpleWZvYVYzVDBaNjF5eDJ6WXlJakwwVnljODU2Ymh6ZFFVNTlM?=
 =?utf-8?B?aGs2U1psVDFhUFQ2YXF6VnloODdyZkhnK3ZrS3dQWmpjZTdxVmlHaFRDS3Nj?=
 =?utf-8?B?bFhCVk9VS254QjMrL2N2OXdmWm00dkwwaTRxb0trT2hURmFLaDhrL3JWcHV5?=
 =?utf-8?B?ejdWK1JzZlVWMkEwRjFvMVZhdDdIQmZ5azJubytxZ1JaWTd1VmdlNWQvaXVL?=
 =?utf-8?B?RGFsZEptYmVRejJYMy95T3c5VDJTYWMwR0Y3Z0N5K29oWXM1UjFRZ28ydmlV?=
 =?utf-8?B?T3F6Y3dhY0FyVkU1c0RDd0ZCU0xMdnlUc1lhczdVK3BZZUpvUHI2c2NPVVh1?=
 =?utf-8?B?V2krSEJQZnd4S3U2eXZnY3c3YS9MVmNtUC9QMG1SaUJDeFRuTS9HZ29HNHAv?=
 =?utf-8?B?U1VpUzRPYytDb1A1MjRBbzVmN2pDb0NMWEl6WFVJbGJ5WmlTd3dKc29LVTRU?=
 =?utf-8?B?K1JqRnpnVGtYWkhrVnpVS2hOVGZUNm9qVkpFN2RycEoyWmVqdDZCWFdMdGxG?=
 =?utf-8?B?VCtmSWVSVTM2R3FQV1hqdUM1TVlocXJjL2xvYXRkdHRQczEwM3Q3YlZvRmph?=
 =?utf-8?B?T1Z6SDdpa0ZRYXRHUFNlVml6Y3Zab3g4ejQzZlpoZE0xWE9rNEo3TElhcFpa?=
 =?utf-8?B?clRDWHY3bXlPdW50aDU1dUdHRS9NSGRQdzZBRnRKM2RoUGZkN1k4c1VpMm52?=
 =?utf-8?B?dzAzaEpmTUNiSDY1ZStjR2pTNXIvalM0c2tpWFdTcnY2QVk1ME5jTE8weTFI?=
 =?utf-8?B?Rm5FeGV2dmx6ZDZSeENNN3c5bG9wdHViMEpsTlFjRStFZStieVpXdzhOd21N?=
 =?utf-8?B?MDlwa1pFeVdlWi9LbXMzUi8rYkJnUDRMWDFRbWNkMFY3Mk9HekFxblliNWVX?=
 =?utf-8?B?akhrWFl6ejZRQStmM080cWt6TnY1L1VoaEFjbWtiZEprV2Fad1B6d1lxTlM0?=
 =?utf-8?B?c2JwT0Fac2FNQkdwS3JwRkdibUZOemZxZXU4THo4dDU3NS8vN0hYYW5FdFBu?=
 =?utf-8?B?ZkxjREVOd3Y1eklUZnNPOWFjYmlKZnV0Y3NLT2REV2JORjdsSEpQUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e4f7c8-d7ec-45f4-25d6-08dee1926f57
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 10:26:58.3417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCDRPIU9MJ1CyMHKmKa+iTpl4ZEy7mOby44x4xbObVMNVIzn/sxdxTlsUDVSsbiFD5twDYW/tS9RDlOxB4mewhBCyL5ZuOVzB9JWpQZ5EUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7456
X-purgate-ID: tlsNG-4011c0/1784024826-4A9D9CFC-7E40983A/0/0
X-purgate-type: clean
X-purgate-size: 1443
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:guillaume.thouvenin@vates.tech,m:anthony.perard@vates.tech,m:dunlapg@umich.edu,m:andriy.sultanov@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vates.tech,lists.xenproject.org,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98D2D753646

On 09/07/2026 1:00 pm, Andrii Sultanov wrote:
> Following the report at https://lore.kernel.org/xen-devel/CAFLBxZaeTMcF4tcV45MJdCVx4A6qbzQdjKei_Quh_iLrtARVFA@mail.gmail.com/
>
> Without this fix, the backend would be stuck waiting on the zero-sized
> body until the next request comes in.
>
> Instead return the request immediately after reading the header, there's
> no need to wait for another call to .has_more_input and .input
>
> Reported-by: George Dunlap <dunlapg@umich.edu>
> Signed-off-by: Andrii Sultanov <andriy.sultanov@vates.tech>

Oleksii: I'm requesting a release ack on this patch.  It has been
reviewed
(1783604323.8631fc262581453bbf619ec5b2062170.19f471a22b0000edb5@vates.tech
but on a disconnected thread).

There have been two bug reports so far; George (on list), and Benny (on
Matrix).

It is logically a regression vs 4.21.  A new feature in 4.22 causes `xl
list -l`, `xl migrate`, etc to hang when using the oxenstored rather
than (C)xenstored.

There was no reply at first because the security team were investigating
a potential security angle, but we've concluded that there isn't one.

Technically a form of this bug exists in 4.21 also, but it's not used
automatically on any path.  It's triggerable by `xl list -x` and nothing
else we're aware of.

Anyway, oxenstored is the default xenstored if you have Ocaml tools in
the build, so this is a critical bug in 4.22.

~Andrew

