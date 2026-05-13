Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBJEBJqLBGqvLQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:32:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FCE5351FC
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308128.1579668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAdc-0007rn-U3; Wed, 13 May 2026 14:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308128.1579668; Wed, 13 May 2026 14:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAdc-0007ot-RM; Wed, 13 May 2026 14:32:40 +0000
Received: by outflank-mailman (input) for mailman id 1308128;
 Wed, 13 May 2026 14:32:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wNAdc-0007on-0Z
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:32:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNAdb-007myz-3Z
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:32:39 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a048b7b-bab6-0a2a0a5309dd-0a2a4506a596-24
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:32:39 +0200
Received: from [52.101.57.42]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a048b85-7371-0a2a45060019-3465392ac272-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:32:38 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6450.namprd03.prod.outlook.com (2603:10b6:806:1c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:32:34 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 14:32:34 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1TNOYJM+spUKpOsaCXuw6f83SLzHr8NxTg3wlMyRxbAI3xV5ckHW/GGSHPJHTax1NsLLA8LeZlptzXDBCDZRmPxBTptILNWiIh0UC/hQKChb+v1/bNzFDuDj60uGjTxHRH0YOppy10nA+rqDa4skao6H1DAl7Wqkla86oIZKuPRwKV/zgTbkG1cq7ji8CupFLtXcrUHOaX/hAiTen+iCw385RCZ34eGNAI1vMBqNLsaToy+GLqJG+0iI3FHZR9oPVvTq26bfGNv9FDzENFh0u1bqK/udq5rVWaK1d3Sb01bNJYdswfgnGXQUtsSPImveNSxvr4eXv38KQAq8i1GOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MU1WW/LUf9BVWKKOnbaHTgNrJ1dHX/y9ePkdoldNbjw=;
 b=PcKTBYBCpAzqzgZII3JnXJrj2w4jL8XODGHYTLn3fHpebn9BgaX9PR7iuMqp9P0Deua6+SsRHXKO+E/viUsyovoZNdwRbi42Zs4bv9UXG4NJiP8W/LPp/iAd0oROaJT6ugOK0EwnYedzu9sYdMlC1ZhRd/vdKYMp9utx5Exy4XxgboopkG1ebTXOcWcdj0ovsxL00/luwwLe52RBqBd/Ic4wlsbAmD12zxxZvHIT4xrBLvi6tQ0I7OX1HxE1b7ccxpVfgdHvKw6imTgDdnLaEiUj8m0fODyPQOxMF7TuE7ISmidSXtLdSQp+ojg+MQti5D4p6+UlbtrIOwK35LRRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MU1WW/LUf9BVWKKOnbaHTgNrJ1dHX/y9ePkdoldNbjw=;
 b=AQL1N4TbZDo+1Z7bGHb3xgKXfcrU/m6Km3EpheAjnHKdXWY9tzYTBsxHp+CzJZq7QdJD3GFU24/sYJABeNt4rzHI3oJCfmS/0yEYwzk/dF2Xpn53ou2GAqvjJPS8u+i7OHSKUPTXpPx7f7gb90CaQDLgwypfpmS5CI6MrQGZADU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b47d1d49-3b2c-4d55-a19b-73df24488fa7@citrix.com>
Date: Wed, 13 May 2026 15:32:31 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] kexec: kexec_crash_save_info() vs Misra C:2012 rule
 8.3
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <13ca5f9f-d985-41bf-9c30-afd657dade89@suse.com>
 <0af810a1-3392-472a-93c9-c98fcb81c43a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0af810a1-3392-472a-93c9-c98fcb81c43a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f8a45b-e390-406d-d7da-08deb0fc7924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	jfiHHrHWy41vADZH0n3qwFI2cuMYzkqD4zKoNFmXq69KXxxjJ4jFMPyh/e6Bj39C9qYsL8zbkaDtPIv2unhkne7Cb5k6xw/dgAuJSigqp8n0i4fwLNKbUMwJ25R9BBrOaLWIYQHm+6GlBf7jIngdM7BX3ndBZr+0AUYqLf2Q9EuMi9lN36IxASbtm7BGl26Pb9BJg8s0WU7d85fnFGgxkv6r4cj6sTC9CuU7DW6XFUf0DWdfmhikwMfcjj/Na5VJI6ngd//VZtMB6b098TEPoY2FzEB8u8nT8ufrXNuOGNzEU6yXKAC+CT3r1H6eY1DcB72mk67PnCAt1Bs9LF0vtqYolP7l5186M/TOD6lTFAwyUEGG/L+lv/Eo156PM88YuILoEieU11/joifdYGa9bHTnbXwFiIvwQ5Z/uD59LZaSavZ3tqUpasDFx6norgh31dR1fC8chaKBhosA0A0Pa3g947WZMgeIsdkeHAKF7CnfOye7zh1vzuuo5cSIbhc7c/DuV4NcvhYK+P6/1zNYqj1AEZYnwWWb89zg8xNICvMmuq8eNUkXZrpsn9DW8vn2erkQ5+MgZbm4HOc65afGnMKdLZQ4ZF5zMBfKG1yFB2ZkUAotg0ekn9mpWb3WsWfPsDpaivQDnV2p0xuQde6sOdfea39R19bCSO8lrjHELg65k78xr2tYlOf368B3TG4J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFA5RTlJd2g2L1JzWHpGb2dSMUNGSG16bGpJWVBjRE91T3pkME1NMWFPQzd4?=
 =?utf-8?B?a0NmMkVzM0tMdzRhRmNSMGEvaDVwUDZ0M2EvVGlHTllSWmZaL1ppWm9Ra0lp?=
 =?utf-8?B?UmhjdGRVeTcwd2FyV1pwNVgxNzZBWFVjQldHT0ZaMWdiKy8wMytRZHpkYUhy?=
 =?utf-8?B?d2lHbC9MdDZkVDhYT2g0Slo1TFRrRm1MM0VXc2szQ1IvTWdWVUJsZTFFU0N2?=
 =?utf-8?B?Nzl1bFNlQVdkc016Z1RQNjZPYUVWSFlxNlorQzhPSXBoaHY3UG43dkN1SlVI?=
 =?utf-8?B?MG14dUdnaTNreWptcTJZSVl3R0MwVkFuZ1pyMEdsbEROYmhoeVRrbmZtcEtw?=
 =?utf-8?B?V25Ndjh6OGNtRkplSmJET0drd3NEMUY0ZVJoVXVUbExya05vRXVaYjE4Z2s0?=
 =?utf-8?B?U1B4dEZzWTlxemxabUJLMGZhdWFiT2ZOWTBkQ2JSdnQyTTlkVlZRVGgrZVBz?=
 =?utf-8?B?dDNueE9SZ082TVhkSW9wcU5XenR2K3NBWUR6NzZPRXBKZzBGcVVsQlVPTEE0?=
 =?utf-8?B?czdBUm04NG1tWjY4aWVCYWhnd2plVXdla0lLMzI4MVplYjMwSk1lc0JSSUxC?=
 =?utf-8?B?akl5OTRDODl0R3hCbE52QzEwVW03OFJJZFo5OE5JaVVwV09RSDNzS0x0VWR0?=
 =?utf-8?B?VWZaeHFNL3FNSjhNYjh0dEdFRDZNVC9DSnZMUmxVZ2FRalFkc1NDNncxMWNP?=
 =?utf-8?B?MmgxMGJpSFlUT1VFL2JlcHRBU1d1S1FmVmMxbThZcXZBZkdBUFRQYjU0VWxn?=
 =?utf-8?B?YnBLY3UyS1k3RnBpM1B3TUZSak16WFNHVWhMSDRkQlZ0OU5ueW1acHZ0V1ZP?=
 =?utf-8?B?NkRNd1dQcUxUcHBOUGNoNmFkVDJEakRISFRuRE84ZHhjdzh3aGtHRll5eGM3?=
 =?utf-8?B?QS8rWDA3NTk2TFp3WlBsZnhyY2FsZTUwSFRlNXBEVXkrZi80UWhReFdOTHFG?=
 =?utf-8?B?TnRmRlhxQzBZWk5OTmIwaG9lUkRQRHNMSm51WWdxbDlwckZDUE5CZHZyZ1M0?=
 =?utf-8?B?ZU85cHFKN2N2T1NaWTQ2QU54QUROWTNHMW9Xei81V3BEaTRDOXBBeS9HYU9k?=
 =?utf-8?B?VkZycHFwS2lQY2dIMFloY2VkNENKZzNhdTNKaDFjK3pJM1F6YkZrWDFEWjZX?=
 =?utf-8?B?UTBQbEpLY0dwa3NqdGVCRi84Q3VZM2VEZHNGcDJUMkdTWllaR2wzeUVLckZL?=
 =?utf-8?B?b3VGakFlMEtZdkdWUTROSzJVdFovZlkvbHlhVUYzMmh3TlUxUEN5U2RxUzR5?=
 =?utf-8?B?UFc3TnJCK25JditOMlExU25MYTQzWkZLNVRPMEdaeHVIcGNkUHM0WmltNlVI?=
 =?utf-8?B?TVp2QUk0M1dUYWQ1TUdqTFM4Uk5wTVN4bW5XNUxXZDRvTlRWZ0RVUzZzdG5n?=
 =?utf-8?B?UkRGV2UrcEtGK3NINGxHRHUzQitGb2tKNUc3TTlYcmxDb3B1RklOakNXSDQ1?=
 =?utf-8?B?WW9yOGFKd092MWJHVDlRT2IyblZXMUQ5VVZHdGJJVFNXbTdKcU9CclNwZjA0?=
 =?utf-8?B?azBzVS8xbXVhS2s1YjRVZ2p5Tk1JYVFiekl3UkVFaDcrbysyZ2NZdlhzVHY3?=
 =?utf-8?B?cmFta3BGNU51VmV1aEtyMDBad0czaCsxTnBEclFYdERiWVdXYUF4ZG1SeXE2?=
 =?utf-8?B?RmpEOWR3U1hIRVFPYTZxeWFqUlRIOEdsdHNjSkdDQlVuY2F6QVQydlRZV2VR?=
 =?utf-8?B?UGFqZkl2MmhVd2d6L1Y4VUM5RDdlMGNiUlArY1hSWkhMT3lxbkczemxLYzJt?=
 =?utf-8?B?Sk5yYXZZNytyL0d2S2RQa05VRmRqZnVUdkUzbHdXTUNOQnlUREFwaHVrTW1R?=
 =?utf-8?B?eEkySWFnV1RSL1JEOEJHZzNUdnplbW00WC9yRHlnNUVtdnUyODlNei9aNHhV?=
 =?utf-8?B?RDF0dERQL2wzRlFkVkw4bjd5emQwcytWbHY1WGxyY0hmTmYrWkMyaGx0RFI3?=
 =?utf-8?B?WnNWL0g1UTVWQUxYVWc2YkQwdVZWcThVZkhoRk5QeEZJWlJmaWpXWmFuaHph?=
 =?utf-8?B?eVU4Mm5OZCtoRXlZUUNGeHlJUFIyNmZObEVIclphWC9xWWl5ckNtL2UvbHox?=
 =?utf-8?B?M3RZaHBJaDV6V01PdFlXNjRTblp0U2hMY0Z1NzZtRHdJVmpzMVVWREY1ZUZ6?=
 =?utf-8?B?UzhFTkZBSlVPY0NFenpzcjVSQ0VydUxrWU4wVk1BSmJlQTJRYTQxdjE3bHVX?=
 =?utf-8?B?RzhzNThSTmdwZDFtVVROeXJZWlZCOXRQTEViVkEycnMyYVlmdmlyTy9FS00r?=
 =?utf-8?B?M2FpNml3WmE5aFpHV0ViQ05MMHNOZko4bHltWGxSVEpVcHhoaGdoOEFmR3p6?=
 =?utf-8?B?bmI5VUo2TjBhZnlsYUNsSks1N3d2cTQxOU1hUng1ZXo2dG9Sek50Z1BJUG9G?=
 =?utf-8?Q?/iGGynpbWeQ0AG3w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f8a45b-e390-406d-d7da-08deb0fc7924
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 14:32:34.5134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93AwcHopklMdlfpaH74nkLhpqWap3I6hwYFc4V+jWTO3l2R0LytGwJ+bKlUc1fu0oWgrOSLCuLIRk3uZdNRH7vWqvWmjAvMuAXibtMEyntA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6450
X-purgate-ID: tlsNG-16d1c6/1778682759-8F397D75-D7931DD9/0/0
X-purgate-type: clean
X-purgate-size: 638
X-Rspamd-Queue-Id: 76FCE5351FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:mid,citrix.com:dkim,suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13/05/2026 3:00 pm, Jan Beulich wrote:
> ... ("All declarations of an object or function shall use the same names
> and type qualifiers"). The declaration doesn't use the typedef, so the
> definition shouldn't either.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Really, is the typedef of much use? I.e. can't we drop it altogether?

It doesn't look to be much use.

I thought I'd tried this fix before but it hadn't worked.  (I dropped it
from my series as a result).  Perhaps the later include shuffling
addressed the secondary issue I was seeing.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

