Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gng8HqWYNmptBgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2026 15:41:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7D76A8F4F
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2026 15:41:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=YakGL8w6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342932.1602747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wavwF-000881-BB; Sat, 20 Jun 2026 13:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342932.1602747; Sat, 20 Jun 2026 13:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wavwF-00085e-8M; Sat, 20 Jun 2026 13:40:47 +0000
Received: by outflank-mailman (input) for mailman id 1342932;
 Sat, 20 Jun 2026 13:40:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wavwE-00085Y-5M
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2026 13:40:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wavwC-000Eny-Dg
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2026 15:40:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a369854-bab6-0a2a0a5309dd-0a2a4503b180-14
 for <xen-devel@lists.xenproject.org>; Sat, 20 Jun 2026 15:40:44 +0200
Received: from [52.101.84.111]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <milan_djokic@epam.com>)
 id 6a36985b-a3da-0a2a45030019-3465546fc2f9-4
 for <xen-devel@lists.xenproject.org>; Sat, 20 Jun 2026 15:40:43 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by MRWPR03MB11612.eurprd03.prod.outlook.com (2603:10a6:501:81::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 13:40:40 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.21.0113.015; Sat, 20 Jun 2026
 13:40:40 +0000
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
 b=JK3lHoqCu9YWmt2ejE9vB5MCVHn0qERUGlPflwsE6OxwQiJcy9YNWRb81VkkAve5e1GgI3ckns3IVvsELUwC0vfVCg9nTrb0AfOo0WbKAPCEMKBTKytJD1WXD7gaieuseU+Gzk504f7+1lYE31myKtWSvr512f/p/vvKD9CTZ3g5aMhM5XAqjkpu5MBrqZWSBL7+lR7fSE2LSvmWLWMMkgLNcPyInpferp3uPjpvRVlzDXtbBqQRzSVEY8UKBg+2kkI/EK/0OkEOROeUWKXzIXpbAaqrRibUlNnXs3RngcWd7CMRVe5CxYxAexlwSfE+jfip95ju3D2CAU38fER5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yJFtsMzfsB/gJLtbyKtmk1TxcvytBiqq1l+GC+D3lY=;
 b=DmhScvquizcCJ8so6qwd+/UchqaiK5Ulj4/ofVXzf4Q9EVu4OFfdPXYHT8COVB0Pjt6EMaXUmfMuWiEwrzXhT11BYlKomOIMcfjIfgSqem7B2gsBP6pByjMsqyAEN8l+0BAbENN1yJB2QUprtcFtmH7YKGc9yV6E15FRDgevKlai7jjkoKv8Eoas21AhDqC34wrfJcMHYHG54v6DrRps6zP9558xbLQYoylloEdEzENnzGZxHd+Mr2w+LddDxwNfLrPElOsvY8kKyC9HdgQU/bZjyX/fTZfJn5LxfJacrK0VD9mbBNJvGGwajmaIBTjGwuuKVaeyVVY6cpQG4A4Hug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yJFtsMzfsB/gJLtbyKtmk1TxcvytBiqq1l+GC+D3lY=;
 b=YakGL8w6EflPRTzqhIkUht4feqJx+quH77xyQQLvKZhEA1zb2OW+IWPGtiYyt1lQuoexqkFfWgsPnfnjrhWRDfG55YLkj61SNyE8tuEasmENxrsB6rZN56aPrn2k1Ps3lr2fSmq/MnqiLtJjQrQ0irh4VycywGkB6RqCfaeP6Mg8qWbD+tR87vReyXHnBMQKBuzzNJ1VrTtuSCRqsOqI9X+TFrGorhC1HXtXKk9JWJGRneD0vwgvda4KVGWDDLOW6jw4hWFbDruJmZJH5hm59GBQ2FOikadOquQ8pncccRX7pVzd2gv4y3kTTrI4Z8vqXXytGCpbTgFSi832bBMikQ==
Message-ID: <3cfc1947-ec98-4d66-8bbf-0eb2fe34d330@epam.com>
Date: Sat, 20 Jun 2026 15:40:38 +0200
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v3 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <25adb33c4be3932c2d946cf7757c933eb042476c.1774918270.git.milan_djokic@epam.com>
 <6d1806aa-b009-407a-9a7a-476f9f4deb70@xen.org>
 <f7e7f42c-43f1-436a-9d06-ab44619f2da0@epam.com>
 <648f587f-8621-472d-9b2c-e88fe11444a4@xen.org>
 <8c57e619-7b37-49b9-ae55-67490956d12c@epam.com>
 <dd60f194-ab26-4287-98f8-e7a035ecf2e8@xen.org>
Content-Language: en-US
In-Reply-To: <dd60f194-ab26-4287-98f8-e7a035ecf2e8@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0083.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:349::7) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|MRWPR03MB11612:EE_
X-MS-Office365-Filtering-Correlation-Id: fca9aa1c-1831-4d72-4b90-08deced184ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	fd8NkLaphX5qMUevCObvwtXK1MqiLBjf75wGdOGjO+XvHXCrfdtOOemLIyooh1qHEeSuBieRZhlX7Gz6jys0iHtHROLhXYW1vya/VM0AsWm4428J5roXQGZo4EzKOVSyclJZMAf9gjbmiQwn9NvZICko1CoI87Y2+ayd+uCO0SnBh7zdpOGkhDaoAw9BoxNAt2mlGn1L/bFcp13CRTgu66Bn6NW2DTlX8MCBj/QMCqir9GMbv+f0CiDsVr84m7xfONGXBrm+SQUHhE80U6C/O0MttXi02Dbj4IC85SbwO97te691widG+gmIdtFQZBjt2Ribniy7un4fCbYsQX8+d2MYI3TFSzdFZs0R9syL4xL9NgDqwIOZ3QeSmPiSyi/ajn3PjaxbqgSxQtFyCP92/XOU/P2Dm4W20FoeUbFKWDjQfg+mPlZyM5oG4mKR8FjFNM+J/0iZ+c1qP5PmK4IiLWQDHsNHVZq2Vj/IbGqlaqVt/atKiP1fsrzhpJhColhevGyoanYxnzFkZe/a5SSMchoNTdNhsPuh6gn8Rrwn4oJpyTB41Y38ZB2z3e0x9ki+gjAuzsd077jxZ19e06Ghh7ormaUuzkz+Vvn1qrF1cBKKCPtVjP7Q0Ejq98uQUvgOqgmBXDu2Ae1o4HIZxzoeU7iESlgTpzp8lE74KQK+Ijo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckp5Ujk2NExwejNDekZHMUxGT2RKOHZMVVRuY3hLNUVZRzJDVzlZc1VmbHd4?=
 =?utf-8?B?SGM1NUd2L2pheExNQWp0U2JJR3VHMFR5bE96YWpUSVJwS0IwTzJ3SkdtSHpy?=
 =?utf-8?B?YUxvR1Q2aTRzQlpXVVpSQWlGbFo0N21seXlPeVZUOFRpTFBaVjluWVJkMDR5?=
 =?utf-8?B?N2dBM1BScHBEWm1FQjQvRFVlbHJPMkIzbHFXWU1rWXArZnFpMlRnL3lDTzh0?=
 =?utf-8?B?cmwzZlEwRTF5OWZzR1ZGa3QzVkhMeENtcTd4T3JEVG1CeC92TVpKY0VLSEd4?=
 =?utf-8?B?ZUJYMmlaV3lpSUhkeGJjRlZOSU9tUFlSa2JJRkgwd3JKbFRZRUhEdTdaZHJV?=
 =?utf-8?B?S0ZBdysxdFZYUVJGeTQrZTJ3MngxTE55bEhvSzZZK0k2cVVzZUNoU3FoeWNH?=
 =?utf-8?B?N20vd1RrN0lidE9XQ095NnFCY1lCcXpwT0wvTDZKTC8veXZCRjFpOWxjSW1l?=
 =?utf-8?B?RUJoMGJzVUtMNmwyalQzN3pLYWNPRVN0N0xBWklLZWY5N3ZGSURRS0NOa1FD?=
 =?utf-8?B?REJlanZTalRKVjEzWFUzd1h2RFlTVUN4ZmFHVFg1UjdBSFdKZUExZFJVTlpW?=
 =?utf-8?B?L2ZnUUpmUTJ6Mzl3RzV1MG5ITGVRS0RyNXhXYU9sTFFOZFhsQ2Jra0xFa3Bn?=
 =?utf-8?B?RnB5bW5QSEtiSVVBdTJHUGZQL05zVmdCYkgxQ0QvcmsyWUszYWQ1U2FGMFFC?=
 =?utf-8?B?ZFFjU3lyb3NTbFVTSUFBakdvR2o2djVGbFNwMWFFRzdjSERxQ2tUOURhd0dt?=
 =?utf-8?B?WjZiTU5QTVdiRTRmVXU1bHZzcnN0Nko4TmkzUzczem1YakI4TEdaZE1XRDhN?=
 =?utf-8?B?MGhxcXV3eDBWMjljNWFLdmtKVHRTVWRxOXZwTXpWMjNjS2tHa0dBckZLTVJZ?=
 =?utf-8?B?aW5uN25FalE5UGk4VVVNSUdEQzJVMlhLZ1c4OFNQcDBqM1orRDh3OXBjaXBs?=
 =?utf-8?B?b04wbzdjZzVZd3Y2RTBtbUtjczQ1ZGM1VThSelc5YnIyeVN4NUdIbHFPOHg3?=
 =?utf-8?B?eTR5VlAzN0VZRStWU0pWRUVwaktlamR3b3JBOTRVUG5LalB4T24xT253aCtm?=
 =?utf-8?B?UWtwU3pmYnpIR0tlVGptUGlvaXhJLzRBWDhGMHBhbjQ2ZUdPMXZjaGNPZzBt?=
 =?utf-8?B?eFkxMitXWmlpNjhiaHVHRHNBN1pTUmxGL2lSQWpQRWJpVG1sd2xIcFZaenpy?=
 =?utf-8?B?NVMrd05RSy9lc1ZFMi91MkRtcW5sY1pQdlRMdExWR1d6VzRSRndlNnlOUXha?=
 =?utf-8?B?RHR6YWU0OEdaM21KNHBwM3gxSUlFcUp3YlFGODYzWHhkaituY2NnUlFKS0k0?=
 =?utf-8?B?MmJ3Rm9OTUxheGZWMFQ1enhjdGU5SytncjFLYm56ckw4NmpTUVBlR0ZzTjlw?=
 =?utf-8?B?L1ljSnc0S1JTWVZxbnQ5WkovcVlnajVWWFBwYkpoREhzL2ZFelVXUXJ5VDJh?=
 =?utf-8?B?UnJlV2ljOU1GZE1YTFVoSjlPVFVIWEFwSzVicXRoQ1FQbUNPZ2VlczBTdlpp?=
 =?utf-8?B?ekZyVWJhcXZVUFNvNnNRZXFWc3VyN3N2K2Z6NUdRQ1ZxUDNxZ0lLVExOS3dR?=
 =?utf-8?B?b3Q5OEYxNDE4eHRzTFlhSFFDMlJveDQwbytPL1ppRG5RczNTMk1xK2JWWkFI?=
 =?utf-8?B?VEkvRnIxYy9nSmYxN0E2azE1djlZRHVxZnZwdXBwZU42UXBZME1mdDBpK1oy?=
 =?utf-8?B?VThnZnQ5VzdjamdwZnBWTWx3UUNiWmhtMm00UVpFNXhBQWpUMXNEUG1NT0Zr?=
 =?utf-8?B?YXdTV2FTM1dMYUFWZUkveHpkNHVLc1FnVUpPd3dES1lMemVGVFpiNkY2Q09n?=
 =?utf-8?B?WnBpOWZkSUZ2TVcrUVNBZzRqTUNObTgzWEUrUlJrd3B0SjZHTWcrVGJ2bitJ?=
 =?utf-8?B?VWtMelBLbzBzTTMwOE9BQWRNRkhaeG04RnJaN3hNTHJyNytSL1pJQkNBSEkz?=
 =?utf-8?B?cjhYanE4WGtQclpuTDhRNDEvMkI5NmlQTEcyMzlEenVlby9QSkRuWVlFWHNN?=
 =?utf-8?B?RWJvU2wvbHIwaURBTExRajZPbTJuZHAyLzNVK3RGUTFLYjhkSjZTZmk0Y0Nh?=
 =?utf-8?B?ak5wVC8xT0R1NUwyMnBld3RCbjgzN0pneGVkbHBCWFdJWFI1WW1HOC9XUGtE?=
 =?utf-8?B?ajdUeDNFZFJGN2s3OUNQSStUREFLdU83aE9VOXRrUk1ISmErYjNMNjRrcFNZ?=
 =?utf-8?B?dXRWbXArOWJQOHRmaTJWYk5kQXRtZnAzVEVSRnJRVytHQ0VJRDhWMlhhbkJi?=
 =?utf-8?B?bmVsZzlpU3ZIRkVScTJZSEs2Y2F0T1FValFEc3cxanNucVB3ZE1VdU9YMDZU?=
 =?utf-8?B?cGlNVmVIcmxqL0EvVnZ5UVBjUVVHeGZ3c2gvbWlWeWVxd3VBNnU0Zz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca9aa1c-1831-4d72-4b90-08deced184ac
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 13:40:40.5074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TT+U8vIZo7z+k5+XDsanL+GMJpNwhzCpf1Ca+/jhQhXY1hzw0tGwbvj7LISbBidydC4ARBXh2kQC202bGO6Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11612
X-purgate-ID: tlsNG-33051d/1781962843-66FDED84-393272B5/0/0
X-purgate-type: clean
X-purgate-size: 4210
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:mid,epam.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD7D76A8F4F

Hi Julien,

On 6/16/26 22:04, Julien Grall wrote:
> Hi Milan,
> 
> On 09/06/2026 00:06, Milan Djokic wrote:
>>>>>> +#define DWORDS_BYTES        8
>>>>>> +#define ARM_SMMU_IIDR_VAL   0x12
>>>>>
>>>>> I am not sure which implementer this is referring to. But how do you
>>>>> plan to handle errata? Are we sure they can always be handled by Xen?
>>>>>
>>>>
>>>> This is currently a dummy value used to avoid triggering guest driver
>>>> errata/quirk paths. I will replace it with a more meaningful value.
>>>> Using the Arm implementer ID with the remaining fields cleared should be
>>>> sufficient.
>>>
>>> I am not sure to understand why would that value be unused. Do you have
>>> more details?
>>>
>>
>> I think that the IIDR is always used by the guest driver during
>> initialization to identify the implementer/product revision and enable
>> any required workarounds.
>>
>> If that is the usage you are referring to, then using a generic IIDR
>> value would prevent the guest driver from activating any implementer-
>> specific workaround paths.
>>
>>>>
>>>> My expectation is that errata handling should remain in Xen rather than
>>>> the guest.
>>>
>>> I am not fully convinced you will be able to apply all the errata in the
>>> hypervisor. At least with close to no cost.
>>>
>>
>> Yes, this is potentially problematic. However, at the moment I am not
>> sure what the alternative would be, as I think that guest-side errata
>> handling could be applied incorrectly due to the emulation layer.
> 
> I think the risk is limited. But we could always check whether Xen is
> running in the errata handler.
> 
> Anyway, I guess we could leave this for now. But this would want to a be
> a TODO as I think we want to address it before the stage-1 SMMU is
> (security) supported.
> 

I'll keep this as a TODO and document it as a known limitation for now.
There are still future updates needed for this, as well as for other 
existing limitations, before the vIOMMU can be considered security 
supported.

> [...]
> 
>>>>>> +    }
>>>>>> +
>>>>>>          return IO_HANDLED;
>>>>>>      }
>>>>>>      static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
>>>>>>                                   register_t *r, void *priv)
>>>>>>      {
>>>>>> +    struct virt_smmu *smmu = priv;
>>>>>> +    uint64_t reg;
>>>>>> +
>>>>>> +    switch ( info->gpa & 0xffff )
>>>>>> +    {
>>>>>> +    case VREG32(ARM_SMMU_IDR0):
>>>>>> +        reg  = FIELD_PREP(IDR0_S1P, 1) | FIELD_PREP(IDR0_TTF, 2) |
>>>>>
>>>>> As the page-table will be used by the HW, shouldn't TTF reflect what
>>>>> the
>>>>> HW supports? This would allow the vIOMMU to work for 32-bit domains.
>>>>>
>>>>
>>>> If my understanding is correct, Xen SMMU driver only supports AArch64
>>>> table format, so I think that we can't advertise 32-bit table format in
>>>> the emulation layer even if the hardware supports it.
>>>
>>> Do you mind pointing me to the code? The page-tables are shared between
>>> the SMMU and the CPU. So we ought to support both.
>>>
>>
>> The reason I assumed only the AArch64 format should be advertised is
>> that the Xen SMMU driver currently appears to require AArch64 table
>> format support during device probe.
>>
>> In arm_smmu_device_hw_probe() (xen/drivers/passthrough/arm/smmu-v3.c),
>> the handling is:
>>
>> /* We only support the AArch64 table format at present */
>> switch (FIELD_GET(IDR0_TTF, reg)) {
>> case IDR0_TTF_AARCH32_64:
>>       smmu->ias = 40;
>>       fallthrough;
> 
> Wouldn't this allow 32-bit format? Even if we decide to disallow it what
> would prevent the guest to use it (we can't rely on the guest to follow
> the IDR)? Are we preventing configure the stage-1 SMMU for 32-bit domain?
> 

Yes, it will allow it if the underlying hardware supports it. I 
initially misinterpreted this part and incorrectly concluded that the 
32-bit table format should not be advertised by the vIOMMU. I will 
update the vIOMMU to reflect the capabilities of the underlying hardware.

BR,
Milan



