Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lVjOHMRzT2okhAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:11:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF94972F6C3
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:11:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=gibgrAwJ;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357859.1612196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlik-0006BI-DC; Thu, 09 Jul 2026 10:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357859.1612196; Thu, 09 Jul 2026 10:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlik-00068R-A5; Thu, 09 Jul 2026 10:11:06 +0000
Received: by outflank-mailman (input) for mailman id 1357859;
 Thu, 09 Jul 2026 10:11:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1whlii-00066t-EP
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:11:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlih-00D8V7-RM
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:11:03 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4f73b7-e002-0a2a0a5209dd-0a2a4502ed7a-0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:11:03 +0200
Received: from [40.107.208.63]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4f73b6-5a27-0a2a45020019-286bd03f6828-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:11:03 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by CH5PR03MB7983.namprd03.prod.outlook.com (2603:10b6:610:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 10:10:59 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Thu, 9 Jul 2026
 10:10:58 +0000
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
 b=QlzMDs+QSw+V9yBgYcA+QFsMlk28fKRZq6UbrEMcd9tGqPWdbLry6KseSkbIzoWmRoG3b4drpKpE0ygnGqrqmS/bgjxgGYYE0CUZ2GQXfubaPSPZVogisMd11O7IEVVWfrSIzEi+KoILwsH91liNHcCip82rR1exriuT1D6NdtlrHA2M7p6eAvza6gRwP0c4v/K9Ucix2ROFJtx4nDvji48JrOwbE+SdsiIFv1D78I3VIW1qy4ufnHvyxTX16HlJG431JqIRHp4Mb/5Pr96AqMj9q6FjMx0sO19HRi9Oy+el5H8sanhjIk6t7Y91nzracfqrYBrex/L8mtEZIEVagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z//UiWk0wwQ7sqMhZ0vAqirxh9EQUYPXhuC9o9Cfdig=;
 b=uuw8aGX24mKbnEESgo8sZlvjqz4luQLY02Bh5npo4MHOk+EcF0flUOdqhBCr5mmprf7suup1Kl6OG0s4Ne0u5QiHFfOcg+2JqhSXIhj4kuSe8puI8HValjjlhVRFdfloS+Xnzwj3Cq+FkIMGBD6KU1Qb4zeJ7/5fNLBhL1Q25PPah7hffTH7ji2TWCjZOk5F/R7rjFfDACNc5dXPFe/bwZvE7TYH8hFoGqS4n/r9vfmmcCg/GnjhwGlHvQuRwKA9B5yD+wzXyRhp8sjfRxzsAhHvaQI/YKQe9Ah/QcP4f3+dIXMw9TvbmTCj9hnQZ3Wp241yRQfbu2R1cySBz9WStA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z//UiWk0wwQ7sqMhZ0vAqirxh9EQUYPXhuC9o9Cfdig=;
 b=gibgrAwJi5Ppu6TWjwx7IO55zqhHRdPbvJt1CMMz+rG2dPmU/jCH7u+vdtXXKh5i0EvCbto8SuVw4Hrypan1p6mQbx8RE96FEIUQsAEDZNW2V8B+DSDPu8onIPOPdFh8V7wKvCoxf6ovMPlBYhlUNcSaHAVoOhsona0/u2AUJ9U=
Message-ID: <a6547b1d-286f-40cd-821d-0e5e4773cf58@citrix.com>
Date: Thu, 9 Jul 2026 11:10:55 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22 v3] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Jan Beulich <jbeulich@suse.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <500cc80a172570f7fdde3287185398dc49460b2b.1783590032.git.dmytro_prokopchuk1@epam.com>
 <19771234-d108-4ddc-9517-ae420aa70e93@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <19771234-d108-4ddc-9517-ae420aa70e93@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::9) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|CH5PR03MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: e89cc975-be87-445d-2625-08dedda25f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|56012099006|11063799006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dXkp35Nc7Y8TIYvTWOiZUiz4koNPLNStkaNAZ0VoP8fAMPbelgl8klMkJlOYscyL/1TUiHhIkLyhybDtgxMe5QdVkTVoMmas9y55TsW1JfX2mvz6v0/rQhrQqPoiz7DtQvlyyxVJBnKAltorKAY/yHnEj2UAVQ2P/34MLygP2gCx3Y9zyRMYxrU9JRNsD9rVmyI5To/U+gkWD4gtwtN6mWFX9BfDA16GFvaQFD5Pz2ZzDuFFDOE6tdkAc57YnJUlUIeoKFmvO1WaXX2h4Dh8kvp61/WdA6V/1xnxEfyKjnvJav+OlKAtcWT8WY1+2m7w7Zl71Nc7iiEENlKA0DdwqHYFznJkdpfcnX6QutBMu2VGHr5ws8eY57gRVm/8gpnXniw+SV136uvKxwPGjVUWuhaYvrR3m8gwxk0zU+LSL7jPoiTjEmG9oIMmhAVdJVSesNK3iVd830KHjnHNBsOv3mcQPzaTSNyWrXeq+tu8FFR52CIIP9Rq9y0aQROY0kXxZWCvX5Aeg3P+0h5U1RYvcgMVMhwRNJH2L8J/ByJJ5z/drH2tWGYK5CQxw/Ioofm2mlE6BzdAC4UnceomQNy0BmefvtMmeElI0rw8EKaFpEmf0gGPY74YtaihtNW1F0dHS1cv+HVCAyAR4OTTiydvMbZnGgMRCD6mqgmHLgGyxkc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1ozUzR6MUFJUGZSa1JEbnljWDV1NGJrcmNNRE93U1g3RXYzRXY1cTNNZHVF?=
 =?utf-8?B?dGgyakIrN281SU9GbFlsZTBDOXk3VWNPZXhkR0tPNXlKWjNKN3VBZGU5YTFT?=
 =?utf-8?B?UzhhbVpXbXZXdTZONUZjM2lYTkorZnplQXJrbTVXeUpxRjR4ZWMydjJxZS94?=
 =?utf-8?B?cno5SWhkUWsrTG1GVnZZNmVqcmxEcldsam96dUM4eEMwdGxEMzE5bUg2emVq?=
 =?utf-8?B?NlZtMFh2bVVDSzRkWUROTnNYdll5dkVvQ2lwbDFSSUpiTjlBTWZ6OWozclg3?=
 =?utf-8?B?YlQ0MC9oUG9hdEd4RTR4c2RCSTJIaE5HNHR1SFczZVpjcjArQUpYN01LTFQz?=
 =?utf-8?B?eXh0ZWx3M2FsdFJxZFpoczVMTnNuTWE3SzNFLzdwNlpFM0hsNG1tVjYxMGt4?=
 =?utf-8?B?OFlDWmZ0cHRWT2h5QXNpSThBZ1A2Y1kybHFFUDkvbVlUT0NManduTHNadjVO?=
 =?utf-8?B?MUtrWjhES21JQ1lsbXNXNlh3YU92aDZpMHFUTjFIMEl4YUNGOXZJdjBVay9W?=
 =?utf-8?B?d3ZMQ2VGMS8wd3BVY3FRLzZUemJiRGRiQVFqdUY1aVBtOGhzTzVPVU8zZDFO?=
 =?utf-8?B?UkhwOXZvZ2ZmVVVaeERlQWhRMnFCSlpVOGhJWlV1Q1dyQk9la3JnanROdWxH?=
 =?utf-8?B?K2NOUzhVaGlHQk5NME4yOUl2WmptMmtNWmdLeUtSMDVlbVRkZ0NDaWhwWGQz?=
 =?utf-8?B?V3NQVUZXMzJLQ3pSRkJGVXNYSWZoR0hBUGdWSUw5MVFCcFJ4aXJ1UUVSZXl5?=
 =?utf-8?B?QUhNcDNnRVV1bHpDUWd4cTRtTVc2S2JLRXNaVDRkdmpSMXA5SG5PMkloRTA4?=
 =?utf-8?B?dUs2dEJ5OW4yanloK3lHdGlCV0hQVFF4K3NxQ3M3MHB5SWNoTVNrSWxZbWxo?=
 =?utf-8?B?eFhlWTVTaGRnL2xidnAvdFlkVkZ2dVdzNUxTZldZQVB5S0l1bU85WjRNV2VL?=
 =?utf-8?B?TXZybnpSRTFCMTFROHI5NjdSekNTekV2ZDFGQTEwNEg0RHF5SlBzMXBYb2xo?=
 =?utf-8?B?RVdxeHU3L2RLWHpGOTR6UGpveUFIQnlMRVczd3hFNTl4cE9OOTVxVXNxMVdG?=
 =?utf-8?B?Q0praHJiVmtnWmszei9vRFNqNTJWMU9palM4SW9CRW1oOHpKbUF6SFpBZ2lw?=
 =?utf-8?B?N0hKeXZubGI4Tmpya1BEcWUzTFZsMjlXbWFoRVFteGhMUXh4b0cwSm5ZSU5P?=
 =?utf-8?B?aXdld2RsTzV2M0ZySCtLM0JtYStRR2YrVjExeUFPUDhlbWZSdDNrNGZhU01z?=
 =?utf-8?B?d29FdHJzcXJ5blF4U0RlTkh3UnFTdnk1Y0JUYUpwZ1FHVE5uMDdMbE5RcnN4?=
 =?utf-8?B?NHRBcTkreERPU3ZUdDUrSnoyMXJSODNGWldjRjFQR2FrUFZQTDQ0eWhSQ1V5?=
 =?utf-8?B?bExWMEFGNG0wVys3djRvVDVZK1A1NWh3Vk9KVG9FajdZcGdOckhiSGxRalRa?=
 =?utf-8?B?VWp4MHdRZ1RPVTFHb0pNcFcxd3BGTWNDMjVMMkhWb1IvVG1MNS9INGhIRVhL?=
 =?utf-8?B?UE14S1pMQVBRNllyRTNyNVhERElsb29yVG5PRTdINVg1L01lZ0dXWEVrOC9r?=
 =?utf-8?B?YTlsU1lYUnBLS285WGRTWW1pMDB5aVZpOGRobXFEaXNPVUI1QTFYWnozYm4y?=
 =?utf-8?B?TVVOeE5hZjFQL3JMUzMvYWQvRk84L29RSWRkSGIyTC94SlcvQXBVYk9USmlY?=
 =?utf-8?B?OTJCV2Z1NDZKMHkxa1ZKVVJDTGIya0RtZElqTUdka1p6c2R1V05BMitHTkkx?=
 =?utf-8?B?OFhVTWpWb0JGRlUwdGx3ZHIyUGhkUHlQVUtaUHcwR1RBYVp5WjVURTh3RExS?=
 =?utf-8?B?UjNsc2wwemRYSlFPeDVRL0NqSDhRd3NrZVJtT2pQYy9Va0Nrd1krYSt4Y1B2?=
 =?utf-8?B?V1M0SEZTbnZzUU1pVmt0eUl0TjRjOElubjhsTFdEeTJHRDlReW90SGN5Umta?=
 =?utf-8?B?RkRjbHdGbXhwdVRZdE9aWkJCQmFzN3pMQW03aUxBV2k2UXdmL25QTFpzMlhN?=
 =?utf-8?B?ZW9jckh0MldaN1FEcUFxS2hDY3lKQWRETkhJRzd4M2Foa2pWR1hFUHBwUUJN?=
 =?utf-8?B?aXk4QjNRU2NoMVZQY2VtN3ZJVC83ME9XMEZTckJQQzF5TlFzWDhuM1czMzRW?=
 =?utf-8?B?VjVOdHgxRVlmOEZPT2Y5M25yNTJFdlNxNC8vOFh5eXRXSnBXWGNIejhIZE9Z?=
 =?utf-8?B?RGZUQUlIZmE5Z2NwRVJtTlIzZ3REaVZKb1B6dCtlRjd2SHBQQmkxM3hNeTJ2?=
 =?utf-8?B?TE9mQXFhUENmZGdTb2dhTnlaL1dza3FVMXVCWUJTK2g1WU00S2ZTSDhPcWhY?=
 =?utf-8?B?bUpHbWh2L09VaFZ0ZDROcHBvSE80bXBadVFWYUhqbVQyMVlEUXhMQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e89cc975-be87-445d-2625-08dedda25f55
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 10:10:58.8274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMI8N76HOBJdF74xDWiNjXJYbZ8HO6k5KoMgk/lHF/geLuJwh45xmL/pO4JOxNJWYGA+0ndEJEaHQ5pgT/2uieEhynQK7qGolg/4x4ctwCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7983
X-purgate-ID: tlsNG-720697/1783591863-4D3037C5-3C3C69B3/0/0
X-purgate-type: clean
X-purgate-size: 2471
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:dmytro_prokopchuk1@epam.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF94972F6C3

On 09/07/2026 10:50 am, Jan Beulich wrote:
> On 09.07.2026 11:44, Dmytro Prokopchuk1 wrote:
>> A malformed partial DTB specifying both '#address-cells = <0>' and
>> '#size-cells = <0>' causes '(address_cells * 2 + size_cells)' to
>> evaluate to 0. This sum is subsequently used as a divisor when
>> calculating the number of regions in the 'xen,reg' property inside
>> handle_passthrough_prop():
>>
>>     len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>>                                         sizeof(uint32_t));
>>
>> This leads to a division by zero exception in the Xen hypervisor during
>> boot, causing a hypervisor panic/crash.
>>
>> Fix this by validating that both 'address_cells' and 'size_cells'
>> are within the valid range of [1, 2] at the read side in scan_pfdt_node()
>> immediately after they are parsed. Any invalid cell size combination is
>> safely rejected early with an error message and return -EINVAL.
>>
>> Fixes: 9ce974c47588 ("xen/arm: assign devices to boot domains")
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> ---
>> Changes in v3:
>>  - use Michal's idea for placing that check into other place
>>  - reword commit message
>> ---
>>  xen/common/device-tree/dom0less-build.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index eacfd93087..179a2b88aa 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -341,6 +341,13 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>>      size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
>>                                       DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
>>  
>> +    if ( address_cells < 1 || address_cells > 2 ||
>> +         size_cells < 1 || size_cells > 2 )
>> +    {
>> +        dprintk(XENLOG_ERR "Invalid address/size cells combination\n");
> Perhaps just for my own education: Is it really "invalid", or merely
> "unsupported" / "unrecognized"? (I can see 0 being possibly invalid, but
> it looks less clear for values above 2.)

It's an encoding for variable length numbers.  3 would be 96-bit
numbers, 4 would be 128-bit numbers.

64-bit numbers is plenty, and there are a whole bunch of fun bugs to be
had if you believe that nr_cells=-1 describes a good number.

~Andrew

