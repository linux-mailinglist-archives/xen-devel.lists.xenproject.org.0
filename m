Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xLSxFlXfJmqRmAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 17:27:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B817665807A
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 17:27:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=jpZCmhm4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331956.1594599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbrw-0006Fn-I3; Mon, 08 Jun 2026 15:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331956.1594599; Mon, 08 Jun 2026 15:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbrw-0006DP-FD; Mon, 08 Jun 2026 15:26:28 +0000
Received: by outflank-mailman (input) for mailman id 1331956;
 Mon, 08 Jun 2026 15:26:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wWbru-0006DG-KC
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 15:26:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbrt-003Lxa-KE
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 17:26:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26df15-e002-0a2a0a5209dd-0a2a4505db7c-28
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 17:26:25 +0200
Received: from [52.101.48.30]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26df1f-aaa8-0a2a45050019-3465301e98db-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 17:26:25 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH4PR03MB7722.namprd03.prod.outlook.com (2603:10b6:610:246::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 15:26:20 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 15:26:19 +0000
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
 b=adcvfO/7sGdLOmZRg4sSMcJKXFLORUQjNSHSPvNOXmJFF3XCazlAApuoiiUplankTza8T5vpVQc8+k/H19s+fhwk3eK1Cc1R/ScrWgvl+4nNjsyZocYoecwg+lK0TIuAp9/PZEIgIiwzxQoJekie+F64lmyouhoATDoYdWsSS0qf6j0eLVvuaMNMsFMSYyQG+s8eEvkD/f3u/RrLJ2nx2neD6hY4p3fINmysfJsiqSV+iLcKvRQh6puFsszLBAPKNDR2qoBzpckIf9IewcvtEfgyJY1P62/bpQ39+MBIwU3PgcCT71rtGK7olgyCdOKzzF1fY5FMyrNtmI3u7q58Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPrkclRkLfpmh/5uDYxjJgJ6rXp9wHZWnXRUIZVMw2o=;
 b=LeR7ZijgtKaH5xT0qn1IZEpo8VH6ZwQea0sHX4Joimz3KPQETRcB8c043oRJP2GGI/GcUebBXSRUdF2+lNdbMQvViByVtYBIANP02AoGS3RsUenTjv/FIlkL0BhyOQjfd1q1GRWrEZL6zTsxmbyHvIMnXOD2Q50MGB9zMxmg1NmfyGuo86nJR0Lhw1VKyMf+QkZ3/xWQ3XWokSSYdfMTyxFnE3+9KLun+tDpCltbvOwKpDk4UbkE2sWRXXfdh/GeXurv6HqviKa8uVp41CQ6a4qPXrOQ113WBA5nuV3fiV43B8Q140J5h0cufPvSnBI1FY+SBWAL/dPxkQU4AwrjqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPrkclRkLfpmh/5uDYxjJgJ6rXp9wHZWnXRUIZVMw2o=;
 b=jpZCmhm4J/E/LNPe+f9VTjWodB4f85zO7RaLQKFmZV3XIEwSAlTNROEtObNlypB4cgJ9pkClnV5TNouLKuKDgT7ehK16ojDhmQOvpCqxANrlrHKdjGoOX+O/uIBaY2I0zarcGtqAQ+M2peQZ+rQHT08Y65o5fIvbg22Gtw3sh6E=
Date: Mon, 8 Jun 2026 17:26:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 04/16] libs/guest: Use a single write_exact in
 write_headers
Message-ID: <aibfGcDnEGXBqAsW@macbook.local>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-5-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603130603.776452-5-frediano.ziglio@cloud.com>
X-ClientProxiedBy: BN9PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:408:fe::33) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH4PR03MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0b4744-8bf9-4854-7a7f-08dec5724a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|11063799006|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZRpZOLXINJsuWm8C2TLJUQ8rCqFzBNKFxLMEBdDepNb3JFOmsQIdAMifFy0Fuy/JCXceu29uQ5dGZudzZgEGurWgd6SUZbKsSkUo5x9tIryXLcS9X4vgAqeuHH57cix4uChwptgC87lkhgaNP1v0DOfUMPmfGG0LRdu1tMflcK0AOUyvZFa3GtvCiLI3Fmo7tEiLjHhThzT1csXou4rnScbXCVU4Ud3/rVsQ9sTudgt74P2HVWgAUzepkXlw7qkNRRM0RvgIom5mD+Qm3exyKYun0oIFktPx3aSVAvtxaspahccMKNnlC4T9dzXU6hSGZktoJvSQa6dnl/AHwGH1MXT8GzTQGohBu+YEfZmBLZ7ls0CezSQXuVn3IHFNvydKqDAd5eDK+gZ0/0YMwKbMW8ikeI0nNsG48RP/qBbQ1ZjZIAwALaitGnq/Y0ubLgwqG2F8Tj31XeVVUtXXyQJTIHxy7zcPs/ry724wgNdKLKuuZI+Ff6aEyKR+s6st8ZBCSYqZoIGKZFAUjGD5FwEtvLfILbPcd6k6YWEIW8nNOC769ih0n7igXnco4N3MRZ05WOOs+dIR0bcAQXU9V88Iyh+Z/2+YSLAXoVDMV2ls7MwQqmHJJA/Biwj4gzex7WhKbw/zjxRF+yIPmMUbp+NFinx1ptTwL4JCWKFpiaFvrxZ/KX450rDPaAHaJnRZh0pP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1NPWlhsM1RuTmxVNFNGbDc4OS85MW9WbHNJeW9lUGNnN1VobEdhME9scWd1?=
 =?utf-8?B?ZTRYQ29vTEoxR0tCRlVER3pDTUNsTzdrbFpkTFp4MFk2S29yaDBhWVpLVnZa?=
 =?utf-8?B?cGFMVHhKTGFGSGplSG5JQkpQYzFDNml2N05ITFNicG9xcVRPcDJ2Zm5zdDMw?=
 =?utf-8?B?bXFtdmp5Nm9kZGxFY3h1azh3cWh0OHpPaWFLWE1VYW5mMXhIVWtMdHk2US85?=
 =?utf-8?B?R0JnbXp1dVh0aGIvR0ZwYmU1ejZwTGlENnd5cDRuVFJCdDhMTTRlbGxJT3VH?=
 =?utf-8?B?NndybGNXcDdSRFJoVEpldnAxUnMzckprRldkTmJDdFBZRXlFNERUTTJnMUtM?=
 =?utf-8?B?SDlHa1lrKzFmNmxBRzVBQlRvKzNkbmJSNTMyZ0R5SWw4U1RBcS9LOUkwZi9w?=
 =?utf-8?B?SGpXd2lpSGtnYnFOTFNXT05kUTVzMkgrSUFDVzN6S05oMjJvTHJVNmRTMjJO?=
 =?utf-8?B?UTBtZDNnN05iWDVuV2pXN055TzNCK2FjS3lYRlR6RFJKUVRYVmNDQUJkN1R3?=
 =?utf-8?B?UlVKaFdoOGhQWHRNUFhuZ3kzUFhPZzZhVDVJc1ZQcGJsaTJxaG5XclBFbUtM?=
 =?utf-8?B?QTExcmVqRzFia2FLVTJwZnQ3cWZjdlFjRXkzVGgrbC9VcDFyaDYwVWNFcFU1?=
 =?utf-8?B?dCtPZmJPRnRaU3BIbkJyNndXQk8yVkpJVUdoRi84WTNWc1RyWW9iUktkWmtm?=
 =?utf-8?B?Y2FORC9tMldNT3NvSnBIZWdBTWIvbHI2dFYrMXYzbWtZblEzdlh1OVBURUtB?=
 =?utf-8?B?OE9kbXU3Y1krWjU2aHNqdXU1bDFFSHM5YkpqSlVrNGE5N2NwamdKZUttZEJo?=
 =?utf-8?B?TUU1NytqeUI2NVQwYzNrbHBJQWRUSVk1VjdTQUwrelZiNFpoWUpzaWZoSWs0?=
 =?utf-8?B?MkE5b01HTDZVUVUySmVQOE4zVkc0NVNEUENVUGFpejRnWGxkTzByczZIQ2JP?=
 =?utf-8?B?dVVBcnltRHN3ZDVhaGMxSHpsRlljZ0dzdEJqYTNIS3FlV2VHOXlvN0sxUWh1?=
 =?utf-8?B?MTRKRnNFQ21LVXVEWG91NXRsTmVvK0NpaFZkZzdQNU53eCszTVpEckNyT01F?=
 =?utf-8?B?bDdqYnZ6QVJjVE03dmZpVUd3TE90cWNoaVltaXprdHgwUDdUN29manBNaDd5?=
 =?utf-8?B?Q2lDM3ZCZk45UzV3OWVVNnBPd0RyS1JMbFRwKzE1NklrWHM2V2NHMUh0eGZa?=
 =?utf-8?B?Q0habFpTSHBsa1VQRWVDRkt2MHA1VWdLY2VpZVNmSEdqd0VmMk05dmdiekRU?=
 =?utf-8?B?ZkpyUkR0MlZoK0srUVphdDcrbVYvNDJ1TEQxb0dSTmVNYllRNWpPcVZUdmpI?=
 =?utf-8?B?bXIxUExNK0hjdVd5ZTlwQlpaNVE2bmFiaThBMFIzNkxHNHFBMUdHSUVHSUJV?=
 =?utf-8?B?U3phRTZYem1hd0FZYW5WdVFIVmpCMjJ5Q3VxMGV1b3Zxc0VYaGRQUUloL1lK?=
 =?utf-8?B?T0VUV2hQK0M2U1Yzdk9tMlJMeW1CYjlXV1R3OUdyQ1F6eTdSQy9nZTFmTXVs?=
 =?utf-8?B?SFdkR2laYzdmY2ZtalZYejFrV2NDandlRlB4dXYrbXdrNWtBcDdEcUgvNW1x?=
 =?utf-8?B?L01ZNG5qV1NTdXZwRmhTU1kwYlkxVnh3MmU3Smo0MTVEWUt2cWlZcGZCa2lC?=
 =?utf-8?B?dnAyUVdRSHFBR0hQamlCMDBuVnB2TnFteUc1emVnWlVCZmg1djVTQTd6eHRh?=
 =?utf-8?B?VlRPSXBZYjdReUY3cnpIQmdFeGFDZVFiVkZlWTQwNW1mY1hFWlhlZWlocVhO?=
 =?utf-8?B?akZoRWQ4SEs4aHNocjQ5akVuaFpnczhKRG1QeXJ6RkxjVW56VGIvcEIwKzJo?=
 =?utf-8?B?MHRVNmdJaFMwVmFYWFdqTUVhNWx3Z1VlOG5nUTBISFp5cXliQUxYd29UK0d1?=
 =?utf-8?B?cmtWanlObmdFcFQrc1JHWWdLOGQ4WXNRNVZBWGZHZkdwMWVBczJWU09RRzZZ?=
 =?utf-8?B?ZW1MUTYxU2RRVSsxcFozYXNlU1o3dURDWmlueC9Cd0RZSGRyRUFiQmE4aXZa?=
 =?utf-8?B?MjhVSE1IU1FEazFHSUhwUTJFL3hQc29ZMGtIZ1pBeEhvdzEzU0VMaEdrUEdh?=
 =?utf-8?B?eWxISDVFNUtUTmRtd2lvVW5LcGVqTGF1aUJiUEY2SUhPVnRONjFvSml6NGtK?=
 =?utf-8?B?RzEwb09nZ29KMjlEK0dGQ1BYb0NqMVBUV01kTnJ6UVJ4Sno2MTdYamliTHBP?=
 =?utf-8?B?MmVtbllJRUVtNmtuY2ZLQW40MG13clRLelI3cU03andtZGVuRVBWQW8vWm94?=
 =?utf-8?B?OFZsOGhaQW02N21uc1h0TDIxdlIzeDV4WG5HSi9hZXBRRkFqNDNacmI0bjF3?=
 =?utf-8?B?a0Nxa2ZuTnVIKzBPNlFPejZvWFZFNzFiYXlEUHFzUytIQnpzUE5mZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0b4744-8bf9-4854-7a7f-08dec5724a45
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 15:26:19.7982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yCGYixM1F5g+YYD1wLS20tT/iGFRb5Mwti095vd7AcN/IYTi99WkJHHDeTBf1pIav0QsZVH49ciJBxCJsdWgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7722
X-purgate-ID: tlsNG-c201ff/1780932385-E3D67443-AB2C214A/0/0
X-purgate-type: clean
X-purgate-size: 1946
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B817665807A

On Wed, Jun 03, 2026 at 02:05:51PM +0100, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@citrix.com>
> 
> Reduce number of syscalls.

... by coalescing the image and the domain headers into a single IO
vector array.

> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> --
> Changes since v2:
> - change prefix in subject.
> ---
>  tools/libs/guest/xg_sr_save.c | 37 +++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> index 62a39dfecc..8c4e760f8d 100644
> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -10,17 +10,22 @@ static int write_headers(struct xc_sr_context *ctx, uint16_t guest_type)
>  {
>      xc_interface *xch = ctx->xch;
>      int32_t xen_version = xc_version(xch, XENVER_version, NULL);
> -    struct xc_sr_ihdr ihdr = {
> -        .marker  = IHDR_MARKER,
> -        .id      = htonl(IHDR_ID),
> -        .version = htonl(3),
> -        .options = htons(IHDR_OPT_LITTLE_ENDIAN),
> -    };
> -    struct xc_sr_dhdr dhdr = {
> -        .type       = guest_type,
> -        .page_shift = XC_PAGE_SHIFT,
> -        .xen_major  = (xen_version >> 16) & 0xffff,
> -        .xen_minor  = (xen_version)       & 0xffff,
> +    struct {
> +        struct xc_sr_ihdr ihdr;
> +        struct xc_sr_dhdr dhdr;
> +    } hdrs = {
> +        {
> +            .marker  = IHDR_MARKER,
> +            .id      = htonl(IHDR_ID),
> +            .version = htonl(3),
> +            .options = htons(IHDR_OPT_LITTLE_ENDIAN),
> +        },
> +        {
> +            .type       = guest_type,
> +            .page_shift = XC_PAGE_SHIFT,
> +            .xen_major  = (xen_version >> 16) & 0xffff,

You don't strictly need the mask here AFAICT?

Thanks, Roger.

