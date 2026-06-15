Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id viV6OcHmL2rwIgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 13:49:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AD1685CFE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 13:49:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=EHCZkcNK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338173.1599182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ5oM-0003ka-06; Mon, 15 Jun 2026 11:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338173.1599182; Mon, 15 Jun 2026 11:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ5oL-0003iM-TJ; Mon, 15 Jun 2026 11:49:01 +0000
Received: by outflank-mailman (input) for mailman id 1338173;
 Mon, 15 Jun 2026 11:49:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZ5oK-0003iG-1T
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 11:49:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ5oJ-000Ouu-Ec
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 13:48:59 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2fe6a9-2eae-0a2a0a5409dd-0a2a450ad4da-2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 13:48:59 +0200
Received: from [40.107.200.27]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2fe6aa-56b3-0a2a450a0019-286bc81bc60d-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 13:48:59 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB8473.namprd03.prod.outlook.com (2603:10b6:208:544::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 11:48:54 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 11:48:54 +0000
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
 b=zTozi2vByTh1ysbp6XbLXym/EtRnIr+ssgrI0qQaHQmP/a+rPTOT3z22eKb5W7qFX/BXyqREGFUohvm2YAzwLHrgG2w8Upr/JsfYcSZ2prd2TumP406Le0NIAogn/6pjCR6JMgrxMfIc4GNZ0Bkp39YZ98RrUJa5WneWiMhBRjV/4DYDnwDYLWTru2pYS1LNrxHSB8Q3ASoNO14a5cheWr2gfcXfMxUexeuTMafDNqA0BlEMyDiSC3giIXtkdckTjObJNZ1Jo2lj38PABjyxEIkr6f6usHzBRxDTNYcbkq2ImHVY9t4ag3pNE+W7pFWBEcaeKN1nFdiZvxYfLDMUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Jvskeu8W0xely6F8Fs//rPh2teM3DB2jL/rinDkSgU=;
 b=PUeC5vraMNdAp7dUtLkT+6KnpTr+MhPoMionnknOwqouRjkDBZURDUMB55UiLVl7bFYQveMosygYElFwARenqCJdoThWkXoTcGuU3jRYMLSjmLWMy7foSIxaWhW80Oh3GUcrMJVT1nBQwM5VtjADYBdvUVv5ziILNswgKJu4pjVpNUd96aSYRBzxwvvmfFA2r/i0rFRIxKf3k9sjnXY4/WLDmYOWUDWVJ2KN3vKeeYOOFGakEJt7bV4ml8v1T8emDM0B25ODLhbjIso8R+rz5OBV+/0XOOir35JYJMRYGqjJ3Alr9abdyzzb1qptqxUnzxfaYID/92qgeqEzwoqWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Jvskeu8W0xely6F8Fs//rPh2teM3DB2jL/rinDkSgU=;
 b=EHCZkcNK0rb8/PypTn7Frvn/z650stDUKpXtrj3eE2KFLXtQnwy6oWXjahmN+euaYBsQTUEB9Wvf3A+5Zoj3ZSjN9PeKbLqfFFTDXwTWYw9clT1Ns+CLJNsaiwS3ul3Ea7PeGVmbGAi4NlWt9cfFwaqQC9iQnjShhGcLcpo+N6Y=
Message-ID: <547458e9-6d38-4114-bdab-a20a3cdfc4c0@citrix.com>
Date: Mon, 15 Jun 2026 12:48:50 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Kevin Lampis <klampis@citrix.com>
Subject: Re: [PATCH 5/7] x86/kexec: Implement new EFI load types
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-6-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260609154518.779757-6-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5e2395-86dc-4308-abdd-08decad41363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0KRjzF8V6dC2uDkvs4qgTr29mpmGn31NE9PtqHytwnfLYCexFezIpdVjWVFY9jDuoRNpoQ+VY/zrGh1NUvsenHuobvCHkS0O3uh/O2T6E5EusbnDkgiorVLBdtTf6AMBwHLKaWwS1jQCkAweyvyhAYTWBixiOe5LjBSXGx9pJdlmMQmQ0SudptF9FFdSHRyVai1BtVNWAS44GClQBtcpfq1YgHH5gLz53aQlEQttsjcxGXmoj9WPT+AOIhp2ZzGSS2zp+DLw9BFVZlN+6dptxeQu6NEBHeYpYeOabosAUYc1ysGescunpdtdfDPVEb27a8tZSDuda6n13EDFC3kMvmNNbDi3l5aQQs/UrLRdpq8+IC2azrtz2cW+skNRD9upfp0wSjysAuLZIG5UpjThpY6/BvpkMCe4LWVa2EymkxSnhvb4wZAGhNYKglvaOVGBI7VwCt+4kohSmeJWPAS7pBOmCX+J5djC0rDB+lqc0R32CvXpqMtKki3Qz4zyXIhbn6LP8/x7nfXA2wlBI7E4I69gfVYaON5pLhLKDHiKZKdTQuZ+UtVQExMca+7dFY4dCdCDNm+VXH7uvUBTz/+X2Gi5PZ9D3qEXdB6Lp8wms6dGVjloEQpQXzMHM208jPLAoGz8gWy/B1CTcBouEdtOpRen68LLRPsE064CG2rvsjvstnTq6aRt4omem9AJydWj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akRzQTdQblE4R0NnVW5CSXo3UGFNSmZpNVExbDI0LzJsVFpCMWdUWWY2NlFJ?=
 =?utf-8?B?T2JaVk1KaHBGVTgyazVkekxkZzlncFkyVjBQWjdxcmJOSXU2eWdYZU1YVno0?=
 =?utf-8?B?ZEtmZHBwUy9DL2xCcUo3d1lQS3BLZlUxanp3dkt1YWJmSURMN3BOc3V4OTRP?=
 =?utf-8?B?ditiTm5GUWtOOW55UDByekxiRHVQQ0RwSFhwODFDc2NiU0JLWHR4Y043a1dP?=
 =?utf-8?B?WWxzYjc3OHQxOXBCdW1oUHlWVjZXOTVwRUlpdFUyVmFKRXROdXkzR0ovcmJM?=
 =?utf-8?B?OTVsUW9OR0dRRGd0UXBZOWhyTHNUK1pHdjc3aUhZcEcvWmVQVE5uVmxNYmx4?=
 =?utf-8?B?YWtja1FNdnRPZGJVd2UzdHR3T0U5OVQvckhSVzd5a3ZydHlpdnU5RmtjaG5v?=
 =?utf-8?B?bllnK0lZSmZNSXNvMVJOa2RWRWFQekJHcTYwcjJkcWR3UnBGYjNOekhHdkdD?=
 =?utf-8?B?RWVaSWxDMkNiZ2NpNW8rOWNYcjdQVHM5UmNIa25LK044MVF1MktoUlZIR3NS?=
 =?utf-8?B?OGZ3UzFLMzI2dVR0UTdJaE8yZnFZZG9vODNVa2xDc3JQQUZBQ2VWYmpCd1Bz?=
 =?utf-8?B?UzdXeXlDMjBzZTJnZHNRMm1FSzVhYlFkZ0R6Y2xFc1Z2eEdpTWI3UmpNbHd1?=
 =?utf-8?B?TVdrcnp2cE9SSTVYRmNISjBOYmpJdlpwNWdrY0phUHFNVWc3cEwxd25zVVZJ?=
 =?utf-8?B?dW9aR2RlRVBrckU2UVVycXJGdGNaRlRTTlQ3d3prMjhJOHozS3liNERPWm1K?=
 =?utf-8?B?NkdlWitPbGdEVWlZMzlxRTNRNFRuVlgwZ3IvdjN2OFY1Tm5xcFRQL3BBMXdH?=
 =?utf-8?B?QzU0aDd1ak9pWXJTbUJSaE5LTVFRUjJPalYrSEJBdXR3cVpPeDhjdlFHWExm?=
 =?utf-8?B?bGswT3ZBbURod2RRem1kaEc3VmVZT0pvK0MvNS9uQ051M05lTE1kTWx3RTNa?=
 =?utf-8?B?c1MwVFZRQ0ZtNFV6RWtqeUtQRTV5cXl6RDlpTEJvanlSa0w5b0t3SkN5eHBt?=
 =?utf-8?B?cVh1dk9VQ3hJckJVTzh3b2xxT080UzBabUJiRnpzT0lhMXBEVm1JWEQyeUxr?=
 =?utf-8?B?bncvRDJtdDdXaVRBSWF6dVJRblRHRmNhRERXTTRRd3JqK3pudTBwbUJPZjNN?=
 =?utf-8?B?bjhlQW5wRDBNNjQwd2hJNThFTldtOFJBNDMyUC9yU0xzUE10MmNVWDFTbXdv?=
 =?utf-8?B?UllqRmZkalM2VlNkOWJwTUFFVmxxN2NMUFNRYURwWGNXMnB4eHcrOWFvajJU?=
 =?utf-8?B?b2U5Q1l5aGNRZXFoTkV0QVB6N0dIRHo0WHFtakxSQnZCcUdPVHpUUmdFUjN6?=
 =?utf-8?B?aTdFclpmajg1RW9IV3d3Umk1QjEwa3BtbU13RGFMSW1ZMDdhT0JnTUJpNzA1?=
 =?utf-8?B?V3BxSG8xRzhmbGVwQWFJT3FYQWVJMDJVNXVwNXR1RWNhT0VLa2JYMFFraStG?=
 =?utf-8?B?TkxucFJuMlNzekFuTjJXcll3aGlSSURZTzlPYlhaYWxoN2l5amlIc2Jxa3Zs?=
 =?utf-8?B?SjNFdngyTk5tb2dNN1BiM21TZnFsSWswS3VMSWtFUVFxc3VtM3BHSmlSUHl4?=
 =?utf-8?B?aFc3cElzd0ZxOUM2TUxJZ0k5V1hCQzZwYVM5VnBpV05XalNhNjdRemRzV0pU?=
 =?utf-8?B?TWlyTDkxNk9DV0VzNnpyc2RTY2h0bjlRUTNBckNMeXVPR2VqYXNuYjR5aUd6?=
 =?utf-8?B?Z0R5cHVyRmRIZDlEUjI4ZTA0QXZXVS9QbXhCNlIrc2g1S0NHMXA3NlRwYmhJ?=
 =?utf-8?B?TTBacHBpV1AyQnN4aHRCYkpFVm1RL2hvSjVCNmwrRmlsY0pzQmxHWFFaN2xX?=
 =?utf-8?B?QVd4cTB3VkdWRUEzai9CNmtWdVlRdXVCbUdxNEJBUzhXY1kvWXZxUkkxR3l4?=
 =?utf-8?B?dkN0azFWditCVExweEJvbm8rakkzRDY5a1FVbEkvTzl0UnlWU3YzMmlQS09R?=
 =?utf-8?B?NU8zR2tSZzg1MWxPRlRuUlgyelJ4MTY0bUt0WHZTU00wVDJ4azdoeExORGpL?=
 =?utf-8?B?M25NK1lDT0Fma0VJdTlTbUVPaEJmblFCanVHcUNIYjlyZ1phMnBwK0p4VnBB?=
 =?utf-8?B?M0kzQ1E2aUYwb2s5RkhyTDNlZ2ZVWlZmVDhRc09WS25Ha3oxUjViUHlMN0ZU?=
 =?utf-8?B?c2pMRlNLcVUvTnFLb3MvTVd2QVBVUnZNL3NxQ3FRRnpIN0Z1YnFBbTR2MVVr?=
 =?utf-8?B?dEU5TzN6anBJaHhFQVZ5aHFlYUVNR3diaVpCMi9ScHhEU1M1Z0xvTTVSZ0lR?=
 =?utf-8?B?RWdneGtCSmNIMXVhQmJyb0U2UDd3Y3hDMndnRkY2MWhiYWJnQWlUdmJJS1do?=
 =?utf-8?B?TTVBUWt3MHFxSGMzMHp1OEM0RjNxOE1PclFpQXVFK2VlaGkwelJUMmdXMVZI?=
 =?utf-8?Q?bsVxnxCRBPf6c18Q=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5e2395-86dc-4308-abdd-08decad41363
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 11:48:54.1518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJOOxBcLohpqmHTAUdD/joNdswnH6m7w7QnaQKnvsA++2+ydvsI6uP7HeDoW6JvANpwUn184+Ivc/ZpwVpihXPEyJlnmmrPZd8vDGH6v2XY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8473
X-purgate-ID: tlsNG-4011c0/1781524139-729768B7-70E3CBA9/0/0
X-purgate-type: clean
X-purgate-size: 2118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:gerald.elder-vass@cloud.com,m:klampis@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25AD1685CFE

On 09/06/2026 4:45 pm, Kevin Lampis wrote:
> diff --git a/xen/common/kimage.c b/xen/common/kimage.c
> index 1d872916b9..9b49455e8e 100644
> --- a/xen/common/kimage.c
> +++ b/xen/common/kimage.c
> @@ -217,17 +195,13 @@ static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
>                             KEXEC_TYPE_DEFAULT);
>  }
>  
> -static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
> -                              unsigned long nr_segments,
> -                              struct kimage_segment *segments)
> +static int do_kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
> +                                 unsigned long nr_segments,
> +                                 struct kimage_segment *segments,
> +                                 uint8_t type)
>  {
>      unsigned long i;
>  
> -    /* Verify we have a valid entry point */
> -    if ( (entry < kexec_crash_area.start)
> -         || (entry > kexec_crash_area.start + kexec_crash_area.size))
> -        return -EADDRNOTAVAIL;
> -
>      /*
>       * Verify we have good destination addresses.  Normally
>       * the caller is responsible for making certain we don't
> @@ -253,8 +227,28 @@ static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
>      }
>  
>      /* Allocate and initialize a controlling structure. */
> -    return do_kimage_alloc(rimage, entry, nr_segments, segments,
> -                           KEXEC_TYPE_CRASH);
> +    return do_kimage_alloc(rimage, entry, nr_segments, segments, type);
> +}
> +
> +static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
> +                              unsigned long nr_segments,
> +                              struct kimage_segment *segments)
> +{
> +    /* Verify we have a valid entry point */
> +    if ( (entry < kexec_crash_area.start)
> +         || (entry > kexec_crash_area.start + kexec_crash_area.size))
> +        return -EADDRNOTAVAIL;

I've fixed this style in the for-next branch, so you're not copying
around bad style.

~Andrew

