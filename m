Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLEdOBShDGq8jwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 19:42:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F81858340F
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 19:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313307.1583507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPORr-0008RC-Kw; Tue, 19 May 2026 17:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313307.1583507; Tue, 19 May 2026 17:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPORr-0008PA-Hl; Tue, 19 May 2026 17:41:43 +0000
Received: by outflank-mailman (input) for mailman id 1313307;
 Tue, 19 May 2026 17:41:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wPORq-0008P4-16
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 17:41:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPORp-00EQ0L-9I
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 19:41:41 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0ca0ca-e002-0a2a0a5209dd-0a2a450ae8d6-20
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 19:41:41 +0200
Received: from [52.101.201.51]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0ca0d3-56b3-0a2a450a0019-3465c93393a9-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 19:41:40 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5514.namprd03.prod.outlook.com (2603:10b6:806:b0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 17:41:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 17:41:36 +0000
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
 b=hmHOZ5XQv78xpZwGTaY9xY3Lh48878RYySwULy0xMu+H2MXfrY8635GF8rr9cBEl39JnYIX4TKp57VniItMApzdYNpQGmvFnIcEdppt3H5VgAg8/YcoQIa82vY2oFa/TelM7Nyl9zNY0uGBGXEu5ORQaW2mwKd77koxUOY01Z4trzmCd7nlAeEVi7qxZqflRVrf/FNoGEQGn9MhJF88dXgq5VKthTLALONdIo/1OTEgkAebvoskjxORUgLVhqQXJao+I1IC/PCZ7Pp4+Bp8O+24vVqod8mG+P/caSbAymFd+CpIpf97rpgXpDATJQREB2/6o+4T7EwMoOmOMrjdrUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ymYs8xXL+BgwlisRTg8wWjBWiwq+CBJp9LiXK9OXtY=;
 b=QEtjOPotc7yLRV6jebkvSRlihUad40NEfATyTUtkLy7DEDCeg0cyPf+Z0JXMeoTINy6OCB+Qqmn8c2AOu+Mxs9Q3X39B0LIEtzrdXFzdOGDN0HkJMblc6sWRAfPDHoNQYkmuBY/OUiQJdla5AOTF6IooTfBfTLc+CwbG3UhHU0x7kYD8Alhu361JR5B43tdA40zW3iJcITHgtM/kfiAv8rbCebakTh7Fe0Sf50dfhkplhN1aAJ9cPqBvKGI/iGHjAHTB1Buu6Lu8/7oYge9PllQ81kprmoh/encEbJAuz2B5ovqJ1BRn1v6EiuNiunr+7wBn1OSqYPUgIiYucqy1HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ymYs8xXL+BgwlisRTg8wWjBWiwq+CBJp9LiXK9OXtY=;
 b=Y8xk6WGXokvzoS9pSU9tSg5lsb8Rf2EZiOrx+1mEq5pihYRDaFm9pQaswv98vvpIlwf93ALEhVWckTCuFVKyZvu4s2UyLNHtIpwghuSjz9bCMUl815KXL7ivWmCYTGw3WlY2RsTbIR7/han0d2Yh4HUipIyL8nNJU0lhuUnnRmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <340d782a-4720-4e67-baba-7b320de55a72@citrix.com>
Date: Tue, 19 May 2026 18:41:32 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 0/5] Small PCI refactoring
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779124816.8631fc262581453bbf619ec5b2062170.19e3c1a4a3e000f373@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1779124816.8631fc262581453bbf619ec5b2062170.19e3c1a4a3e000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0403.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5514:EE_
X-MS-Office365-Filtering-Correlation-Id: ab8bfac5-2c97-4c50-c608-08deb5cddff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|4143699003|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	75DWhjEu2oHqXan1quTrz18GzXvhb4aLkn5KLZ+EBW0MRDqiUNDmxQHV7/4DobOw19yhrFL3inX3rHT4joy3I9TwC2OiRVa/zsUvHFiCJAzU/5EZ2NIbk1j3lCyV2tNchuVg7uSCVDYLZw+RP0nHRPSjdBnXtySRS1FlNiScr+G3PUFsri+TQtkwh8R5LgUkf9avJ7nqrW7QAM38c52/cmTfyyukPAxwtYsqXElRvqQdfQQioMuOoqgZm8e4/2RBv6A90Myi7jXu16A9q+wtLwIFZdvbwQiRqeKz/qwW44PgasTMUgxJvHfsBn6VQ7TH4SCAd34uTbg1D4Ls2fhU0TNay3DXAIs6SCqbbstPLTC30IFgisuQGcTQZHmF417X6OHJH3rB6/tJ8gmxD4OPaiV4EyAG8/ZgonZ9RJdZ0Wy/g0uL6JhRfXUb4W/J8b7j/3RgGBYs+F1v0GPu/60Euc+07n49CxP5pEuy0IMrBAy8/gvbZ5BxkeaSj1LnYm7uReDtbZeLIOh9RvwN55XvKklJfYLiyh9dgXmHlzz8jOp7+3zFSMtTlNYIOtvgMHCjyGmQS4xgZpWknxmCoLNdAkWjWQJgpEHv8HRIlE0x5hHbcrk+mIzyEHMvY07+ZYCTPu+2WXr6CG8sSomrgKE8ttiNInkuUvOstMJtYmJeHrrxY8Hu1ups8ocWMLFwZ+cS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU9uZnMzRzh5YzlOQ2lZcENUR3hyTnYybi9aN0lTSUZCdTJUa2VOUllGa05m?=
 =?utf-8?B?T2RPbG5qSTM1blJKNjdVeVhJejg5dE4rdDdhbDZDRWxUbVM3Q2N2em1BSDVT?=
 =?utf-8?B?dXd0bk9zc0M3TGFNZUVSSVVlb0xPYUxqK3E4S2p2bFZOb3Y5NjM3ZG5hcmR0?=
 =?utf-8?B?MVZzd0RtWlVDZDZjSXVrWDFKRXVZMFhGMUVQcUdwQlNIdWV0NDdGdUo0Vlkw?=
 =?utf-8?B?MzJYa24wMTI5RWc4RnNobTg4S09yWHVHOTFkUDh6YkZIN2JTdjlpUkZFdmtw?=
 =?utf-8?B?TldiVjJybW5mUTJWZjgwOVB4cEFUWHMwdktiYWphVEZYRXgwTWNsd1pNYjdu?=
 =?utf-8?B?RjIxZkt3bGRWSktFYkFsTTk0Z1BFVVFjc2lBeVFVNDBjbWErSzhVOVJzQ1Zt?=
 =?utf-8?B?ZFVPdVYwWitJd2tqL2J5TGlzeWhTZXdVbnFNS3FtRHZ0T3BmMjdYd29VSHJE?=
 =?utf-8?B?cnhEcEhrMlZLUjViOG1hZnhRQUZVT2VlZVpZcWlROW1iVHJEa2xzdmpjdU9s?=
 =?utf-8?B?V3kyWXp5R3hZM2ZBTENWdUE2ejZPWWhHUDNMWE85a0lMYnNobzhJdVU5RXF4?=
 =?utf-8?B?YVN3aDZCbHllbUlpNVpudGJFWEt0L3dPWWtPZCtnb2cwTlh5THFwK2JQSFA0?=
 =?utf-8?B?SUI5ME5GYkdXRi9ZRGN3dVRidzNRVGtmeHU0bk0xTW1QZWJ4VXMxOFdVUzhC?=
 =?utf-8?B?aXZrSk1ENzhVaDNkYUV6cDNvUm1JWnRXa1lteDI2YXhEUE9adHBGWDNzdE9I?=
 =?utf-8?B?a0NnL0VIY0VSQ3BVR2kyd2pkaEp1ZGRmOTNPTzIxazZiWnNzaEpVTHJJbG9E?=
 =?utf-8?B?N2VhdzNkUXl6bHRqRFRPSHZ2N25KdzBXdlEweXZkSkdwaXplVkwzRDNhYzF0?=
 =?utf-8?B?dysrNFZkamtDNDA0RzZNN0pyYlFvRCt0MmFMZVppY1p6bzVGcDJTR0xiNkEx?=
 =?utf-8?B?RG5ld1lsQThjdndSS0dLbkJ4ZTVua2dmV3BvWEVWZGpNTlNRUHhrNWFzb2pn?=
 =?utf-8?B?NGpqeFlmQjBVRmJzRXhtS0FTdDVQUS9uTU9XVHJGYlBNRGluVGFKWXpadDFL?=
 =?utf-8?B?bFk1N0RIc3k5YnEvTGk4T3AvNGlRajZ4WkFmUjc2bWVKeHFMNXBlRExGUk5S?=
 =?utf-8?B?clJLdHpYSFlhK2JyZHp2QmlUYW8vUm9tWkw5V1RQeDRIdFdPNm1sMjUyQ1cw?=
 =?utf-8?B?OER5Q1JKWXVncmVjb2NvdGdVdDNJdklDUDNJd2NiSFVIMnFmZ1BTZHlmejVR?=
 =?utf-8?B?UnRKS0NvU0ZwVHpsd0ZqdDU1MTVXV2Z0eG4vdTV2VEJyckM5MFBsMjRycW5j?=
 =?utf-8?B?ckczbDgzaGN1QlpyWkN5aG93K3BqNGZKcnlrUmhwVTVWUVRaV0Q2bTRhN1FR?=
 =?utf-8?B?aFVod1lWUnM5UFNRZ1p6aEhtU1Q1eXptRVlLZzVNcWU3aUsxb0FWR3ZVY1Ju?=
 =?utf-8?B?UnIxbG1Sdk1xZEgvdnhWN291dGxLUnNDdzhZMytzSVJDeXMxejlCSkcvd3JE?=
 =?utf-8?B?eE56aDlkRllCb01xYWlUQ2NQU1R4MmpBNnhGbHRLaWwwTGs2bVhQYUdiTDVP?=
 =?utf-8?B?RDE5NFhGSjBlZlFjZmJTeXJOaTB1aHc5WWNxcUwrRXE5MWlrM2xqMHRPbytk?=
 =?utf-8?B?UWNmcGFxN3B4VFBwdlJxVG9nOFdJdjZoM1dEQ3I1NFJtQXNqQjduTTRNeW5y?=
 =?utf-8?B?SXg2SkpmOU9sSngwTjhVRE8va1NmT24wQWgyUVZQSTNUVmFMVmZISkh1SHdi?=
 =?utf-8?B?RXd4dVpDWXpmOVgya0J2NWVRZVpnQkNla2RweXV2L0hSd3U2Q3lHQ05idEt4?=
 =?utf-8?B?dDlJRHIxMVM1eVdzWndYdmtYSnBLYUJhUXV5QmZIZGI3eTNLMmZjWjdKWTNp?=
 =?utf-8?B?enl3ZVZ0L0lTL3ZRWGM1c2M2VHZ4cXg5VkE2MTZpRGZhYmhpSXJ3UHAycVFL?=
 =?utf-8?B?K0pHVWdvWG5ZZFp5bFprYTBLaFgybFlRY2Fna3gyd3hEL3hFTGhyZVMrblF0?=
 =?utf-8?B?dU5sNlBRVjVMakduWWdraHpYeWw0aWlUV3RvNXRzTjNPRzNNZWhmaDVNem1X?=
 =?utf-8?B?aCtQcTZucG94MlJKUHBFNXhDS05YZUxkczJlcVkvTS9UeDZsRCtsOEhzUk8x?=
 =?utf-8?B?bzQrT2llVjZNYkxLcWRaMjlxVXdmUHEvY0laN1dQa1dUMkt2MjZwV0lVQ1pO?=
 =?utf-8?B?Mjk4NXkzK1U5dHkyYi8yTEx3cnpUamQ1YWRITnZmU2FtUWR3ZTlBTW9EazJR?=
 =?utf-8?B?djRUd1NIb3ZodmFGUEJYNGo0UXJlZUYyd1pqVkRsNUg5SUcvNTlZcFFMcXVo?=
 =?utf-8?B?TGJrTGhVN2N2U0dNRmpKRGh5U2xid2YybktWSTFSZ2s2RVltWVR2UHNYMUhR?=
 =?utf-8?Q?kebkKi9jtFKzc5Ds=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8bfac5-2c97-4c50-c608-08deb5cddff8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 17:41:36.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLV2cpmFJl8RkuC264Y+iXBJ/cny1gpiWB1sxy3KeFJUtmgxZ4fvOPMeIa9D4SZU0DN293PrOHm0CbM6VybnjIqK5T4aPdrjVU/1pMnBkmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5514
X-purgate-ID: tlsNG-4011c0/1779212501-73D788B7-6D98A631/0/0
X-purgate-type: clean
X-purgate-size: 1097
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4F81858340F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/05/2026 6:20 pm, Teddy Astie wrote:
> Le 18/05/2026 à 17:22, Teddy Astie a écrit :
>> Teddy Astie (5):
>>    pci: Introduce parse_pci_sbdf{_seg}()
>>    vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
>>    pci: Use pci_sbdf_t in pci_device_detect()
>>    pci: Parse into pci_sbdf_t directly
>>    RFC: pci: Migrate pci_mmcfg_{read,write}() to pci.c
>>
>>   xen/arch/x86/pv/ro-page-fault.c          |   3 +-
>>   xen/arch/x86/x86_64/mmconfig.h           |  43 --------
>>   xen/arch/x86/x86_64/mmconfig_64.c        | 106 ++++----------------
>>   xen/arch/x86/x86_64/pci.c                | 122 +++++++++++++++++++++-- 

Looking at this further, I think all of x86/x86_64/pci.c wants merging
upwards into x86/pci.c

The arguments about constant-propagating switch (len) apply to
dispatching to pci_conf_{read,write}() too.

One of the two external callers of pci_conf_read() should be converted
to pci_conf_read32 right away, and the other probably could do with
turning into an if/else chain too.

~Andrew

