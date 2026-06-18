Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1WHrAE/hM2pqHgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 14:15:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1815769FF2B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 14:15:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=P5VrBL8Y;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341038.1601605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waBdG-000844-7P; Thu, 18 Jun 2026 12:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341038.1601605; Thu, 18 Jun 2026 12:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waBdG-00082Q-4f; Thu, 18 Jun 2026 12:14:06 +0000
Received: by outflank-mailman (input) for mailman id 1341038;
 Thu, 18 Jun 2026 12:14:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waBdF-00082K-1E
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 12:14:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waBdD-00CuF3-UB
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:14:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a33e107-e002-0a2a0a5209dd-0a2a4504ec54-38
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:14:03 +0200
Received: from [52.101.57.62]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a33e10a-5f9f-0a2a45040019-3465393efe41-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:14:03 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB989331.namprd03.prod.outlook.com (2603:10b6:510:3b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 12:14:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 12:14:01 +0000
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
 b=G5J5wZ1KnkVgcQCAUY9cxSr7bejKsx4xkIXg0XgXKqj95973XD+bFpty1nCPJcB6pLhBe3ijW1NH4K5avsNJRG+gXbj0kBI7I4apuTs6nLkqDnGdRpiO4FKimHiLofqB1ELcjMSOYttv9LFPpq2IqDO+xM526fhTKn/undYUHArpsHmgtn0GMW4lK2jyNXvFvI2zZD3tIuBCzNYVM5GhnBX/f8toJdtxH3onB0Ti/Rb8TW7ChWDmuRvAPReyn106rMUzKwpNI6QLpQYYGn0MAMvLORjdgXh8woIZ2L8A0dRXnJZv3LluO3HpSRoNDk1t1ShsTy2uKXgM8f7tpJrA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uT8j66Nc0BZs8m40iRTRh2GV7bC9ERCGBf0/+4CR94k=;
 b=wwfxXMlReuXJux5aom26JHTZLnqc0a/55s2L3mRmaCemfvvRxxUhkMZtVPaby6Otg+vkBwYAEbCwFKJgzHypvtreVYzJUqfSnhveVtZPiZBUiPKVMZu9nAJxDPN92UtprkfdENyfaBaJHGow6zFX7nh/0Y2zJFkbL+3MHba5FjjpeMNcdZN81Z9CthROH2MyBG4wL1vpYLn2iSd06LKvJTEDcJvzKIqQRgPgaEmfOHNfinVuTIE0aFnYwOuyBw0oPd0eYZBw3MsBtTpz69hrbjhtX3xdqcnO8+YU53lCiL//omV2qeY+aBvZ5WVdQA1hlRBR7JpxTiF8QdKRn8lW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uT8j66Nc0BZs8m40iRTRh2GV7bC9ERCGBf0/+4CR94k=;
 b=P5VrBL8Y1YqKJb/8W22WBY4fyHbmxCNgbsItBoxrw6or3A53LJX/YuS8YbjTyP0Z09+Sw7XIxKPRjFpmjarDRmajUAtNHU7F5+Y7dVyL6+TaXdC89l/rPsK2x2vlgJ5zsUXQmqDvmIM5oL/tkvNAw1+aSZfWzuQZPsScgFWMnOk=
Message-ID: <8536e453-423d-45a0-bb82-38283eca4786@citrix.com>
Date: Thu, 18 Jun 2026 13:13:57 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22] XSM: guard .sysctl() and .readconsole() hooks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0460.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB989331:EE_
X-MS-Office365-Filtering-Correlation-Id: 993547ea-4e26-462b-9cfe-08decd3314bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	g6xLyqXDwbjruLTjMDYsqaYODBEGtqYkC9cDJIFuh2RKwQq9ravuzE9KRRWXhJTYzXidLEtpLxGWwuEjXxtqDA6Pw6/rJxYkj9qtG+iTHk45u6nnBfRNyNlu2c902R3ewhnSL2GTQXP7Mc/CuN3Ecwcf0gW+ePuLoFKari84IsnQS2uB3Ugr00dywb9rWFsafW3JFpjyMouiFjnHe6xjCXN6QKSVAh3fT6eeLcEc7XNHQHPI0mceHzegLLx8wUIlluQw3xVa2PWqupQcmaANduLt+fzNaD8ieFHnprpJK3+BbYgOrZbsm7+77v8XClTiSQLaKF4x/PgkWSjuWS8CMvefRcEdbjf/mWV7VYxra9l2j5Xd8KxflWCFp/8XDAiPZd+uhuklmwXTOtKSPISXcvQEzQUxZmqe75iUh5wg1gkxkZayTyMnO+1iSD3XWW6YuSt5PgW6mn/vHiCtHe18ph6+stbz63FHLFO+9hMKtv9XJR3ugrElTaeFMlXsIaSrrkOR2g6yRDe0u93efoXBH3h6u4Hjlkxbl7miYJttGODnJ0S2ftHW9KwNdmqTvRqMGU6zyhMHEud0eCwOHGNobzGaZfwWw7PiUp+TwkEWQzu1bkd0ovFu2gLVrbW314Y0UvPkZ6HGTGQWRfZHPmDLjfHnQcmf0G6Wz3M5/9wUDwfQkNOO/42F/11UsHMkpgVl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjRIM0FjRDhWdWxFRGJoMTFuOW8vT1ljWHFoVHpiY2pBVVVNZ3dVdno3UGkx?=
 =?utf-8?B?R1ZCOGxDSEdJYnRnc2ZtY0x6bnJSb2tqcG5pRWtGN0cxcWdiSGlkNnhGMkp3?=
 =?utf-8?B?ZmZoYjhLbzU1NjRRY2k2b3BrNXFYaGRNYkpHYXc0UVNkdjlXbWRPTEJ3Nm9F?=
 =?utf-8?B?Z0E0MkNNYjJ1c05zUG5qRno5emJwRDhpK3p2SW5QREtnWmYyYW5vaTVBNGZD?=
 =?utf-8?B?VnlUNGltbE1rNHg4YTZwL0NqN3FrblEvb2VRTmVHVlhDcUJmSWxZOTQvN05u?=
 =?utf-8?B?TlAzVWtOQjA1cHc5c2hxdHdSWWtWSVNWeDY5NWNNWjl3TW55K1ZKYWxQQ1k4?=
 =?utf-8?B?cW1Na0NzbExxNThoRFdLRDB6cG1QMW9JZzNYQVZtRjdnMFJaaUIxU0s3L0dH?=
 =?utf-8?B?a1RQejRxYnFkQ1Q3OFlmNlRQeHgxMkF6TUtJaE4rMW04N1RzTjZlUmhwZS96?=
 =?utf-8?B?VGRTVWU1TzFFTllWY0lVYkdWU1dNbFdvLzBrdGMzUS9GODZ2VU1vMGVPTy9U?=
 =?utf-8?B?ODZmQmk5UkZhYVA0ZUdrVDVKOTlBTW0vYnRYSlpvY1BxZjBVS1NPOXh5VVBT?=
 =?utf-8?B?TVR1bE5adEZGR1RhWUF0bVBkcVVDWFVGVk02YU53YXdzYUUrSXBJY2lnKzVk?=
 =?utf-8?B?aXJzRmVvUm5YNWFFY2xWeUE0YyswdDFFdTJuSWJTdDlwVFlDWGtQNEJxdHlx?=
 =?utf-8?B?cno1eGZzcmM0c28vQVhYT1NmVzdHUUQyODdvdWVpb3ZJZXNCdDd6RVgzK3lJ?=
 =?utf-8?B?a3lOdG1JbXlISHpsS1ByaVFXTWN5SWYrRmVXRFNxMktYNDRHZEd3bjk4MUln?=
 =?utf-8?B?WXRUejVWbE9DY1B1UHpIV0c5QnEwWDNISTdpT0R5VWpGaTZiS2I5djl3akhr?=
 =?utf-8?B?ZUUzdlpML1hleTJFUHZJdVpvZHlwOXExLzZjQjhiZ1d5WCtYQWZzamtBeXBW?=
 =?utf-8?B?SmJwVUQvUFZMaUkvUlR6WWVlRnNIREZUZy8weVFFbXdZc2VVeDllNXFUNUNG?=
 =?utf-8?B?RUh6OXU4UUhuKzByTjRSdnhZR0JjYUhETXJ2M04zR3dzSWtwaG9Sbmhxb00y?=
 =?utf-8?B?c3d4YVVBL25UUnVFaVZQaGhjMXNkWm5xT25MS083QWVBNlRVcW84MjdEbGdG?=
 =?utf-8?B?SmNMdGNGTmx0QkpidTNRSUJZZ21xNHgvRk5uMlhRWlRLR3lKWjR0Y1VlbjZE?=
 =?utf-8?B?dGtzUkdteFMzVWpzSU9oODJHUkt3dXNyOWdWaFE0M1dYY3JMTG5jTEJNTkph?=
 =?utf-8?B?anpqUlgwa1gzMkVKbFcreEJlWERjaGRSMHhKcXZMM2ZZQmJ1MjB2a1ZHeGVQ?=
 =?utf-8?B?aEJDUDd2UlBKMDJBczA2aWk0RFIwWERmZEk0dE55WFZmU2RhMzdGYUtOUTZn?=
 =?utf-8?B?OUxIUkp3cW9PVEQrMzB3UllJSUFqY1NhN2VZNnNFWWRSMEdEamxyUEQzU1la?=
 =?utf-8?B?WDczUGg4UmdRZ0l1UGtUUCtCcjVOaExrMWpMM1hTOUN4RW0zeDFBOW94TmpS?=
 =?utf-8?B?TGMxM29UVnRhVGtvZ1VkNTRvQlVGc1VQN3NRMU5JaGlLd0lrMkJXRGFkUzFl?=
 =?utf-8?B?VWVmL0VBK3JPUDk4RE81cStKalMvOVV3Rzk1QkI5dDd0WU9sQVpGUjBmS3Y2?=
 =?utf-8?B?UE5TMTlVd1NkaURsdnBDMmFORkFZQzkwUkVRQjZ3Um50THgxV2dXR3FwZjNW?=
 =?utf-8?B?R3FieVUxbklVeTZEN2lYbXBYU244bDJrMEt5WHJkR3BlM0VsMlBkUUg2eE1v?=
 =?utf-8?B?MXVUdjN0RXBENXFtbGxGWnVhbEZzR2dHays4YlhJTVFJcUVDd09HYjhleEl3?=
 =?utf-8?B?Qm91bGxkYjdOMHd1RVlkVlFieFo2Uk5SRkcwWHZOb0F4MDZWUTZXaUdwbFMw?=
 =?utf-8?B?NlREdkliR2JKN21pMi9kcm8rbnNaWWk3MDNSc2o1ZGsvNTdtOFJUZVd1Titp?=
 =?utf-8?B?VUhwU095QnNpNzZiMjMvQlZzcDlTUFF5N0NaWXRjWDZXaEJJakRoVVZvOVJD?=
 =?utf-8?B?ZjNzb1pwYWF0S0JLVWZIRFZBOCtuelZ6MXovdmN1Yk9Vc1VJNk5GM2EwYThp?=
 =?utf-8?B?eEhVbFJxYVdkVTNhZ2daNE5zTGdyc1VNaVN5VUovVkxaVVRsT2hELzVTK1hj?=
 =?utf-8?B?WDBhWEFNZzlLSlRFS2RYeUVlakVqTlNwZm1UM3dkZExDNUJDRUZWamIxMnd6?=
 =?utf-8?B?b0pGLy8rTUx0NjBzWFR6TzVCMUZmNndpakxNdXBMU1IyZXFvQjJybWlsdHJ1?=
 =?utf-8?B?REdHNzBCVHhKcHhwcVovUmgvdFFzaTVjRzdKaU5jSVNoMDNlV1MvajJ2ODVr?=
 =?utf-8?B?a1lmRjZsZW9HdGNqSU5tNkp5dDJVQ3NrMEVFemxYRUxweVpFL216RjdJUE41?=
 =?utf-8?Q?Si4H+gspod3+cay4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993547ea-4e26-462b-9cfe-08decd3314bb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 12:14:00.9991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILsoDVPKM/lMm3obxNO8wiXrIBynESejMeVRwyezEVWhE9zEFs8WmR2a4Eyx5m8/pwVHoAkU+OOv0RT2yKJa/kmUErP1wqBt3Cpdb0Uqgb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989331
X-purgate-ID: tlsNG-ebf023/1781784843-9DFC9141-E4508165/0/0
X-purgate-type: clean
X-purgate-size: 1484
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,apertussolutions.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1815769FF2B

On 18/06/2026 12:32 pm, Jan Beulich wrote:
> Leaving the hook pointers in struct xsm_ops when !SYSCTL would lead to
> the BUG_ON() in xsm_fixup_ops() triggering for respectively configured
> hypervisors.
>
> While moving the #ifdef for the corresponding xsm_*() wrappers, also move
> those for xsm_page_offline() (where the hook pointer field already is
> suitably guarded).
>
> Fixes: c9eabaa03a68 ("xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL")
> Fixes: bddd9af6049f ("xen/sysctl: wrap around XEN_SYSCTL_readconsole")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Ugly.  We probably ought to see about booting the RANDCONFIG hypervisor
too, which should be able to spot things like this.

This is a regression vs 4.21, so does need including.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...

>
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -61,8 +61,10 @@ struct xsm_ops {
>  #endif
>      int (*set_target)(struct domain *d, struct domain *e);
>      int (*domctl)(struct domain *d, struct xen_domctl *op);
> +#ifdef CONFIG_SYSCTL
>      int (*sysctl)(int cmd);
>      int (*readconsole)(uint32_t clear);
> +#endif

... this is now the 3rd CONFIG_SYSCTL in xsm_ops.

I know it will grow the diff, but can we see about collecting them into
a single region, and in dummy_ops too?  It will shrink the overall
result, and the order of pointers in this ops structure is uninteresting.

~Andrew

