Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xqNuFFo7IGrTywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:34:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91263638A1F
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:34:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=mGtzoZoX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326702.1592057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmfC-0001s0-6I; Wed, 03 Jun 2026 14:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326702.1592057; Wed, 03 Jun 2026 14:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmfC-0001p8-3f; Wed, 03 Jun 2026 14:33:46 +0000
Received: by outflank-mailman (input) for mailman id 1326702;
 Wed, 03 Jun 2026 14:33:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUmfB-0001p0-5E
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:33:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmfA-007WFv-Hr
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:33:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a203b2b-5cb7-0a2a0a5109dd-0a2a45039098-48
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:33:44 +0200
Received: from [52.101.48.13]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a203b46-672d-0a2a45030019-3465300d076b-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:33:44 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7408.namprd03.prod.outlook.com (2603:10b6:408:19b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:33:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 14:33:40 +0000
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
 b=J+8xdWTkYjhqR1psIUbMfss7OF5TdnpU9+dwo9rmi9dleZEWCGlXMKypZY+xrDvsyqQsslDRxuXKz5wZI6vj2CgtXTFzhn9FNl84We9IDeHt3cVEMNkK54TNOcGqIsQldc00naX7GmBqxOocoe3kBgmsZyhhV84bR93Hazqi94GT/cQzVdw3nbIPznKAqTE1I2U6rJRjc7xYAcaq+IzuXrH6iTIUcz0krkcI5zyhItN2gH+5l02zXW0De9if1KYMUOXZIKXbGUcjChfZVdqnU8zsNx5fNV/PVGAKz9jj8BxlV70TowpD+uYYkLn4vr7sHaIptF4rl8QCIuzh99AAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koL+iUKKKz6cAzajbrY1sFHO4/L2u/l4dLA1R9g1DgI=;
 b=IokgsUY6aSUxKy/K4TueYWmZWvQZu2UQ8fXWuZkryk0nhH5vmRGkKfh+S9xtyo9nDC8hodPQK6dl8T6qThpYjiBzCka0lmH3NeiIZgEEcL8ZKJL3ifkKjy0RHfE9T7oRiUTb3UOEkQhpCGH60yo35sHrD14P/hs71Q0QiVisBKEwMa3z1Ey7YgCF06n3F1yYza7BlsouFd0yTPVIYySo0m0E9QY3HWZfUy4ND8OrR9epk+XMqX47gBSMges3D9bNkUW/WbzdwTd+S/SBpuQVir7u/EmZjadDL0C2OeUhQvOKzW5C3Yureq09FS8iw0t0UDHIc8zvBb36335zfaJjKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koL+iUKKKz6cAzajbrY1sFHO4/L2u/l4dLA1R9g1DgI=;
 b=mGtzoZoXsaD87zBKECMekJ4hGUtl3Z51K08T65Z6BcCNQNbSBQqtm+Uga5LnQG6Wc8tQCwNMJZN+iBM22N3ScG6uLelDxBo3xrmqLx9diaLlMxFQrComr6rPRRhknAObn5+jzwezSKToHKnBU9E8OE6QD4geAapYdd0FI+O/nlw=
Message-ID: <69f3075f-0daf-40d2-bedc-3d8b441199fc@citrix.com>
Date: Wed, 3 Jun 2026 15:33:37 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] xen/x86: Change stub page freeing to fix smt=0
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260526203114.40882-1-jason.andryuk@amd.com>
 <ah26nl95MgqhPPAi@macbook.local>
 <5cdfca65-50f8-487a-a146-86e1a68f459c@amd.com>
 <ah5_0vvipY2Wch-x@macbook.local>
 <cf275fef-27fb-4d73-bbc8-9a75c1836608@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cf275fef-27fb-4d73-bbc8-9a75c1836608@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0133.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: 870db995-9b41-48ba-b497-08dec17d1b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	B8Qd8hWSL0DVkELrwxC8JA/oed1OxX7UoZ8bEJFI0N7MFQnd+uKqFvI3MXAEakTJ/UCtQLsbQsYIpg8ZJ7GSCPX+dzDhz4qpc6rOGdrhcrZGPjbuWdhiP6mSzyI7Zm5i6t8BFW9KOcROi8i6sjybMzmv+/sIWrSP+ycuDAEXXK0Hzf7sm7ITKrf0VDDqXEn/Ri4EYsWJgeNzsh4pXKjMX8L10EikXe4aGdQPsCpXbTO6bi2CJJFUIHHPZ9jb/TJ1UwaExIICjlvFFZJN3htVA5o64iGVuvplTIsg9nRFhUxquAKlBTVQ/9aZvjvh6p5YRk3+kul0Wwrpxi5BdV977Ceh50lhMVSZVKdm4Du469V14Gnr8gA5KKMgIqVWWT9DdPG/Sk6qYx7AUqYC7nemD9IM08mbgDX5qvRpEZjHr4MP/F3TbEe+c+RxkziXJoeQNtSKBJHkmoQp7iaR5T18BGcKG9DaJF4jJWBI8ce5krco1Wwoy4r66vylxAXD61rh4NmlW2LlIU7cqnuVqxIgS8JvL1OL3tkJ6QFfwQ0XsD28KcZWrmu2sXBUfs0VnRr3u2tpIOaLTQDq1dwZ8P30DFPKuDmmnzrPDi8KOMHvTQBuuiRA2a6opYyI8l/fVOSyYz/9FNX25BWt+D/fFm+r4ktXsrG7t+lqpv+a1iVL75+6Sk3gk6Q7KsXN/5bjnZyP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUVmUnpnaXpuRHN1eFRWQkF0ZkV4d3pPVzJYUDdLd2N4eEEwQnkzNHY2c2dk?=
 =?utf-8?B?bCt6U0tyV2EvZDN3QmdVYURqNGZkK25vUFpVdUptWlVSTDJUUHkxRDBER2N6?=
 =?utf-8?B?cWZkVkRreUFQVndCVmZ1TlBHM3hpY2J5cEtnODdWNk1xSFJqZHNaeHRMWGFj?=
 =?utf-8?B?U0J3Y0hxUGcwbzJEcmdTd0VxMHJGSmNOcVdrMnlWNDgzNTdySDdYOGlvQkNM?=
 =?utf-8?B?MUtWQWhkRUh5SVZnaVNkYVhoUmcvSzg3YjdoSDVybkpoRGpHUDl2d0FEQlR2?=
 =?utf-8?B?QjhtU25obGxYeFNnYzVoczlxMUlQb3p6SWFQZkpYdHowY0lKRFpkYmkzenVi?=
 =?utf-8?B?bloxUDBwNzhUdGFXcGlFWDZNR2ZmUUplZEljZERSVzlrc2c3RDVza2V6cDNh?=
 =?utf-8?B?QnluY28zbStyTDJWMmhmdWpqVlNwSVhSWHU3OCtJTzdkREs2blR5Z0pIaU0z?=
 =?utf-8?B?QW1xWmRQZXl1ZGhWU1gyN3VqZ09yeW5XMGdyZ0o2REZSOUFnU21wSFZhdGlv?=
 =?utf-8?B?NlpTeEdIbC9pQTJMTVNoYXpvMkQ5WVVEK0Z1RDhwNW5oTWRFYVlSWnk3dWJv?=
 =?utf-8?B?NGRzYnhoUWd3RnRKdGRnd1NzK3ZKL3ZWRWpyZ3ZnVVBCRmxvL2pybmNzSnVq?=
 =?utf-8?B?RGh2cnR0SkxRMlZycFErU0ZEZHh2V0F2TkszWVByTGlVdktyT0UzSXFQbGlj?=
 =?utf-8?B?UHlwVUQrOGhzemxheS9LZytndjhyV0tqVVFWTkNnS3FxbThWbWc1QlJscFBF?=
 =?utf-8?B?cXVzSWZzNjZqejFJaU05VTVRRjdPTC9qczZpTm5WUHNKYjJYWnFGUlZFWlow?=
 =?utf-8?B?MnhjZzhmeWJNMWNLOHNIVU91cDB0Qm1xM1JXNWUzTVk5dU5RTU1wc0JWczhI?=
 =?utf-8?B?dWdLbzNBK1k1b0pjdDE4VmNaa3NvekovR01QY3Z6ekR4enlBYkZVK05sZkha?=
 =?utf-8?B?SStHRzVocWhaUU9ETTdpL09JK2lnSmtHeHVKT2RQU2RBQkp5WkNMR0lweXJz?=
 =?utf-8?B?NGE3Y3g1b2hjODI2NmRYaGxnd2hGYTNXNjlyYzduZnlzMjF5YmQzQ3B4MFQ3?=
 =?utf-8?B?V3BteERSZVZEKytaaHk1RlJ6MnA0emxPVU9FMUV5SFQwbHVRdmc1ZHpyVGhk?=
 =?utf-8?B?UmNvY3Zpc3VlSW1DWFFid2tZWnNiTWtsRnVhVzFodFEyRERLKzV5NWl1T2hx?=
 =?utf-8?B?bkp5Z0V1Z3h3NDN2dHRtLzNwanF3em5KamVPSUNKSlRrUEYrN1RkR1d6cTU0?=
 =?utf-8?B?OVl5L2hGbW9IcE9QYVR3ald6L0w4emRvTmlhTTJQS1cvaGhqUUx4bHZhenhI?=
 =?utf-8?B?K29OZzBuTXVxTXlUcHpFNnNVR2NTVVpEdnJ0dVVWY2E2N2NMSG5Xb0RoSlVK?=
 =?utf-8?B?ZG0xUm1wL1VFem9Hd25ZZFBVN1R3T0M3bDV1MlJmNkRQZmZ5OFdQaWt1Zlc0?=
 =?utf-8?B?Z0NpNzIwbG1BdFFmUVZhTmg4aVhZWkl4azlubk5idXg2US9ZYVNFNFJtQ09x?=
 =?utf-8?B?RjJNdHVOSGFOS3hhQUk0Sk9MRmRDdVB3YUlqZjhzeXdhN2NDZ3ByOXRaMXhX?=
 =?utf-8?B?S2dBYVlJTk5SR0FhNjRMNjFFVytlaVpFSjZEYXVoQlhPMjlrVHMzMGVlOHV2?=
 =?utf-8?B?Y2VTYXFiWGtIN1p3YldMcDJvKzhCVmdPdW5xbW9XWW1MMUJUb0lmZENITU16?=
 =?utf-8?B?TUNTZ09jSEJpbjVtQ3BvRlprSDA5VHZUYTQwRkEzNGxGNm1WOVRnckx5YVhK?=
 =?utf-8?B?NzNrcW5hcXFqOEt0RFBVQzMxbWxWL2VETlVzd0VzdWhjQmRuK3RadUJSL2ht?=
 =?utf-8?B?U255TC9lNWxhUkR4K1hGMVBHcndma05peHBqL3FHaGduMVhkREVpQmhpMStS?=
 =?utf-8?B?NHpMelA0Y3dweUpuVW1ZU3BRK1Y3Z25MODZvb0VjREtySElkYWZSWDRKa1dT?=
 =?utf-8?B?VGxOSENTT25XOEUrKzgxdmRMbHNnQUwvT2tGMTlzb2tEdDc3dzN4UjdJLzZn?=
 =?utf-8?B?bUlWekF5UWpVbExxK0VDZ242R0pGZkFtMVhKTlFXbktxMEJVb3BVTGVtYzd5?=
 =?utf-8?B?dGZkZkh2ZGhvWUgwdm1rY3Vydld2SFEwckVHSEJuQXBCREQyRmo5SVBjbWFI?=
 =?utf-8?B?dlQySFVUSE5jeVBIakI3Ni9CYXgvbDVINHYyN3RWSXZvck4rNHNCM1JxWUFk?=
 =?utf-8?B?UC9oRlo5c2hGRk1zSW5mVzZpd29zSkZOc1JJcm9WMkN3OUk1NnFOaFlGVGE2?=
 =?utf-8?B?MDl2V1ZORmV0dlZUTVdrSDE3ZFVoNFhBVzVZcnI3bDRSVTdPaTZka3d0UFV2?=
 =?utf-8?B?djJkM295eHhZZGhRWHJHOWsybFBaTC9KcXVBVmR0ZlQ1cnZwRTZlZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 870db995-9b41-48ba-b497-08dec17d1b55
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:33:40.7726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYdNcBWYXMnIlN3em9B4DKWRoT2Wc5vXhiVbNa18rahlmVdHIxy/OgvVPrXQnGc1WCFD9SrUB75dHWzgAWdYzoYo6mPSTWFz4vkhBLe/Ehs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7408
X-purgate-ID: tlsNG-33051d/1780497224-42F62938-80763875/0/0
X-purgate-type: clean
X-purgate-size: 5307
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:from_mime,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91263638A1F

On 03/06/2026 3:03 pm, Jason Andryuk wrote:
> On 2026-06-02 03:01, Roger Pau Monné wrote:
>> On Mon, Jun 01, 2026 at 05:07:52PM -0400, Jason Andryuk wrote:
>>> On 2026-06-01 13:00, Roger Pau Monné wrote:
>>>> On Tue, May 26, 2026 at 04:31:14PM -0400, Jason Andryuk wrote:
>>>>> A single stubs page is initialized with 0xcc and re-used, with
>>>>> multiple
>>>>> CPUs each using a portion of the shared page.  In cpu_smpboot_free(),
>>>>> each stubs area is checked against 0xcc.  When all are set to
>>>>> 0xcc, the
>>>>> page is freed.
>>>>>
>>>>> Booting a system with smt=0, CPU0 is initially setup, allocating the
>>>>> stubs page and initializing to 0xcc.  When more CPUs are brought up,
>>>>> CPU1 is initialized and then immediately brough offline as it is the
>>>>> sibling of CPU0.  Since the page was initially memset with 0xcc,
>>>>> cpu_smpboot_free() finds all stubs as 0xcc and frees the page.
>>>>> However, the page is still assigned to CPU0 and continues to be
>>>>> assigned
>>>>> to other CPUs.
>>>>>
>>>>> Meanwhile the page can be reallocated, which can lead to misbehavior.
>>>>> The particular instance was the stubs page re-used as a page table
>>>>> which
>>>>> later faulted when the entry was all 0xcc.
>>>>>
>>>>> Change to initializing the page as 0xd6/STUB_BUF_FREE, and
>>>>> initializing
>>>>> individual stubs as 0xcc/STUB_BUF_USED.  0xd6 now indicates
>>>>> unused, and
>>>>> 0xcc indicates used/assigned.  When freeing a CPU, the stub is set to
>>>>> 0xd6, and the page is freed if all stubs are 0xd6.  Initializing with
>>>>> STUB_BUF_FREE lets cpu_smpboot_free() a page that was only ever
>>>>> partially used.
>>>>>
>>>>> 0xd6/UDB is a 1 byte invalid opcode, which is similar to the existing
>>>>> use of 0xcc.  0xd6 is used to identify bug frames, but the stub addr
>>>>> (e.g. 0xffff82d07fffe000) fails the is_active_kernel_text()
>>>>> check.  It
>>>>> should be okay to use here.
>>>>>
>>>>> Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
>>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>>> ---
>>>>> It would be nice to use get_page()/put_page() to let count_info
>>>>> handle
>>>>> reference counting, but they require an owning domain.
>>>>>
>>>>> The listed Fixes introduced the use of 0xcc, but the smt commit
>>>>> may have
>>>>> made it more problematic.
>>>>> Fixes: d8f974f1a646 ("x86: command line option to avoid use of
>>>>> secondary hyper-threads")
>>>>
>>>> Speaking with Andrew, we believe it might be easier to simply forego
>>>> the freeing of the page, possibly something like:
>>>>
>>>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
>>>> index ff05955bae40..62c6cbf4b561 100644
>>>> --- a/xen/arch/x86/smpboot.c
>>>> +++ b/xen/arch/x86/smpboot.c
>>>> @@ -990,19 +990,12 @@ static void cpu_smpboot_free(unsigned int
>>>> cpu, bool remove)
>>>>        {
>>>>            mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
>>>>            unsigned char *stub_page = map_domain_page(mfn);
>>>> -        unsigned int i;
>>>>            memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc,
>>>> STUB_BUF_SIZE);
>>>> -        for ( i = 0; i < STUBS_PER_PAGE; ++i )
>>>> -            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
>>>> -                break;
>>>>            unmap_domain_page(stub_page);
>>>>            destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
>>>>                                 (per_cpu(stubs.addr, cpu) |
>>>> ~PAGE_MASK) + 1);
>>>>            per_cpu(stubs.addr, cpu) = 0;
>>>> -        per_cpu(stubs.mfn, cpu) = 0;
>>>> -        if ( i == STUBS_PER_PAGE )
>>>> -            free_domheap_page(mfn_to_page(mfn));
>>>>        }
>>>>        if ( IS_ENABLED(CONFIG_PV32) )
>>
>> I think I've made an oversight in the code above: if all 32 CPUs
>> sharing the same stubs page are offlined, the reference to the stubs
>> page is possibly lost (if CPUs are not parked) and a new stubs page
>> would be allocated if any of those CPUs is brought back online, thus
>> leaking the previous allocation.  The simplest way to solve this would
>> be to introduce an array that indexes the stub pages, and replace the
>> logic in cpu_smpboot_alloc() that figures out whether stubs.mfn is set
>> for adjacent CPUs.
>
> Right, but I thought Andrew's point was that offlining 32 CPUs is
> unrealistic, so don't even bother tracking.  If CPUs are offlined (and
> you somehow keep running), you can leak the page.

Perhaps I should rephrase that slightly.

I don't think we want to fully leak the page (after all, there *is* a
reference to it staying in l2_xenmap[]), but I also think we should
bother having logic attempting to free it.  Software-offlining 32
adjacent threads is unrealistic, and not worth the effort (particularly
when the result is this).

Rework the code to use l2_xenmap[] as the source of truth, and allocate
a new ownerless page if the pagetables say one doesn't exist.  When a
CPU comes up, it can derive addr from its CPU number, and pull MFN out
of the pagetable.

~Andrew

