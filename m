Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIEFChdfymn27gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 13:31:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA035A490
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 13:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267422.1556916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ApI-0004MV-Qy; Mon, 30 Mar 2026 11:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267422.1556916; Mon, 30 Mar 2026 11:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ApI-0004KV-O8; Mon, 30 Mar 2026 11:30:36 +0000
Received: by outflank-mailman (input) for mailman id 1267422;
 Mon, 30 Mar 2026 11:30:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w7ApH-0004KP-5y
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 11:30:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7ApE-00B5T8-IK
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:30:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69ca5ed2-bab6-0a2a0a5309dd-0a2a450ad510-40
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:30:34 +0200
Received: from [52.101.57.43]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69ca5ed8-1772-0a2a450a0019-3465392b3c4e-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:30:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV9PR03MB8437.namprd03.prod.outlook.com (2603:10b6:408:375::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:30:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:30:31 +0000
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
 b=GWYOXYsaP2DRjYyVtQRJ9Z9+3lkdgnd74+LcGCGnwJ+dk7mgGGdTJpbKRwxJpmCsb/NVSVvqI6//F3BZ/mO3kNQpQ9cCee+Wtx6fGUJnSRPgAZrX9gCMaMJlArpC/YbW5Eq+S7WEOhrBZs8ZR6G0+INSGZkd/u9bo7YG5h//1L7b1xZrtHcaq1ZC4bvfd7ihXuupisQnvRs0rfTieDP/UTOAKbzA3PQDw77nGlhILOitNeFkU7qPq/JA6rQAVtBNwI9WUh2RjZsgxxCxlmiqPGOorA0v+XFmTOOU6AaLzLaXmJkdNZySrQsrbVV+Vsgwmw3pFYrGIg2NxV8NIsf9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKaciZHHuvlMpBgEFguwrZbjb6za9/FhxbeiKIO+mSs=;
 b=q+AJwRC/KSiyp4ZeNSFsXa07rZgD5stCO956kCEN7EhifyNT4vEIGK/3opKs+wZYijO9bysGwW2aIXf8s0M/rqML+Hqkw+U1vC9BewsMEcNCqFq7zaV6MaMfjg1grkY/yCVs38YaWblkUIMNjWhazkYEhPrbPa/+OZTEBohcAyyC6zc9gVM2+JjksYwVT0v/iooP35HntdaHvTume+wSl6BYqnJ3l4+SYe8niwBthP/4LlhRkv3C8oKpP+hjT8l8M2WFByNz8zA2Q7zGWIeUqYJ8Mjq6HbU8RDMmWkZPJD4GycU7orKz/UGdvKKyBIhfAxjtsxUjBJkXG6w44lMFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKaciZHHuvlMpBgEFguwrZbjb6za9/FhxbeiKIO+mSs=;
 b=uoYYm5OJvVV2nhIWvC9bbF0+Jc2uxf8nY9EmzEj+YYqlGfGYZ6sDDNsy+dOhd7UifWRIs0fGi++8pTuMKJhbpa3kBnOWYxzOCQj55NTtp8uBUxYBV4qXxEVzO4FlOQe0XwpoyQvMamtcAr+SKTimuTtBDOHquCb2IJq6TN/zEAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fa553d9d-ac4f-4ae0-a93d-8d34585d17f7@citrix.com>
Date: Mon, 30 Mar 2026 12:30:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
Subject: Re: [PATCH] unlzma: avoid UB shift
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cb5ad24b-03a5-4c1b-9d98-8df534854b2f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <cb5ad24b-03a5-4c1b-9d98-8df534854b2f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV9PR03MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: aeaf500f-bf81-455b-6c57-08de8e4fbfaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BwLSJUeyPIdONFZSkLTc+JQOzSriFV9wrmuTVQcivxJcblyOmcs99Pi47RI060gIHmSELG6M5d1w4rEOQVkn0XdnGobFgJkwdNfVMJREAsc8whttWXbEtYgSuzjxekF47jJOKr8YlcfMRcweuGTVjlMte2lSaIMeJKm8hCrw5/6fhkq8BBv7gDhgvyjW5y+Kr33ZLhZ3N0l/tzwNBHzxnZHFSz799UqQcmqP4iEYq0J6oZBqWYtTiFEz3KnlZL2JrepX2va1N1iv7elSQtI50D/QZ7CJav5NjIK3Z9Z1KYyTtqrV38J/KeO0COJKNGRghZNhldwyXT2egPO8tXru6yu2dsaP0Z8FmfCyw7szbSpluC5XLNLVm3I5UinnwkZk+CzY67SrQK4BRFe/IAOp4PlvIJAi+NN7k7eyM9HRkR9OZFdwVicdApDoI9I6C3QmUqClb1ssHaPO9B+aJRDsg4DquIILYnxxqNZqhPEgGs3M/1LJwjz596ZhLs4P4YCJ0TqKyptbebljIa2pXJOWrsNOe1gqW2raYdzGTfFHuH2v8XkOI1TwQLBpLFQ/ukrYhZLeU+leqzNS5PM3VNBsISI8Ww2Sy+v4OTzCuByBHlTup240Bn+rwA9rXpKVw2W60x4TO3dlHL20ep+eaHik/Vfm8GMXD4D/RpcxhSYuxYntIwN9Z4+UAwNNavC0aEdjPpvIsP9Xe4rb5usvGN5xLjTV5tK74itB/bWGBBDcbYM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGlYQXgrQTFpVE5CK3YyRWhzU0IwalhwQndIaTZLK1RuUFdwUjI0QUFMRDJE?=
 =?utf-8?B?dUpTb250ekxXUkxGRS9VTEpjNEhKSUlVak9hSk1zbUZOOExVOUJYSDdQT01C?=
 =?utf-8?B?bzlIVlhrd2dsZUt3RVNTUG91TUVBQVJ4OVRSS1JMTHJGcU9NUmFnckFrT3pl?=
 =?utf-8?B?bjBaSG9OUkJac1dWQmtiemYvZXliTWdTZ2NJd1ZvSjhmWWMwRnFQK0Q3bXNu?=
 =?utf-8?B?QzE0YXZ0enJ3NEZZVVMySktDMnZ1UUhzelYyQXB4UU5vNTBPTjlGQ2tlSzEz?=
 =?utf-8?B?di9FSVNTWGRZOGhtU2dYY21XRDc4cXJJd2M3K3VaTXZhZHMrd0FFOFVqVm9E?=
 =?utf-8?B?eWYvNC9nVVM2VVpWcjIrdWdqVHVRcnJaWGFqSDRpVXRXN1BCV0U1MVhBUS9Z?=
 =?utf-8?B?Qi84V0gzL0hrLzUxL0NhVXJMMEphdXFIdEVUZWNhNXphWEl5cmVxeWFSRSs5?=
 =?utf-8?B?SmdvbUszYlRaMVBiK2tkdHFjMlJyTExpRStoS0V4YkNseHhISEFpWWVFUWNl?=
 =?utf-8?B?R2RYQU56UUdPOC84dDY5M1cwbThnZzhnRXNVNGtBdXBaeVhYaGxVRW55blYz?=
 =?utf-8?B?dS9OK3ZtNEMweEZnWFM3ZTBPZDhTSUUxVXg4NG4rTXhRcWlSbGM1VUlVTUNn?=
 =?utf-8?B?ZHlBRnc3ZXp5WmJWcG9pTDk1SnZrU0MrbGNGaU1pTlNoRTA4bWg5d1NBdm0x?=
 =?utf-8?B?dVlENGt0a0srYno0Vm5mRE1wbUVSSUV2MEcyRmRrTVVtRk1PaTE2WlljQ2E2?=
 =?utf-8?B?YWRFUE5xdEJKTkhBdXFya2sxNWd1ZHh0Vk9RaXFRK1NubnpHZmRxWjRmTnZU?=
 =?utf-8?B?UGJQaXdxQnBLM3VtdlNQRVdIQllPMmZQYUxvQ21jVlZaT0ZZbXhFb29zWkhZ?=
 =?utf-8?B?VFBLcGJiVzRJL1d3M0M1Nmk2MFNDZEZWVG9DTlhETDA0dEs3dEw0a2NlQjdL?=
 =?utf-8?B?QUkzSU9oWktTa1QyL0FmVmllRHRTR0JrTnVhRjUrY2FRZGhKNXYydG9nL0Nq?=
 =?utf-8?B?anM4eGVNM3hERG9wRkNmZ3VQSEw3SnFUZmRvQ2pqaGFxd1c3N2RhZy84b0ZM?=
 =?utf-8?B?NDRiQmViMFdxLzNvQXJpaW9CQWd6bFRvY0FpRlpLaGVnOXh3RTc4TTNTcDNC?=
 =?utf-8?B?clRXY1hxR1J2bU43SWVIVnF3RVJUNlcwODBwb2RwbVQ2Z3ZBa2dBTlpvNHds?=
 =?utf-8?B?UjVnVTdOT1pTbW5UL3pnTktBRk05Q1dLV0ZGb0YwTzArRTd3UEJ4bmVJa0Zj?=
 =?utf-8?B?WmczcWZzTElDVzlRb05MWFA4akFld21qRmhXKzlTSVRqeVoyYkNZdFcyWm9C?=
 =?utf-8?B?YkZWZXRMeVFJSUxOMHN2T1kxdVV6cjZhS0Vya2lpZEZrK2dycVNVQVYyNHV6?=
 =?utf-8?B?bjBBdjJXOEZpZm9EbEV6QTdiY2ZrQW9pdUdpNitSQVBXS1lJTk1pQVk4TkZT?=
 =?utf-8?B?Mmc0THZqMUF4bkRuaFVuOXhoNFZSNGhYMUZuUlRIaUNIcFlmQWhBMnd4dG5V?=
 =?utf-8?B?YjFCZDA4S3NlTjNFZU1FSTJocEZyWUswajBscVhBOEd3SFFCbUxVRHRVMFZu?=
 =?utf-8?B?RjhHclpzeHNrQUdqeitpSjcyN1dzYitLT2FHbmx0azl2YVRCMi91R3p1dCt6?=
 =?utf-8?B?NWN4UlpjaE4vL0hIYkpUVU94OE4zUGFQRmdsZGtkSjJqUThRNkg2UUYwVXJl?=
 =?utf-8?B?T1EwdGRVU21xeVg3YkpLTkhpckc2WUlaTUpkRFoyMVJXaTM4VkpsTGNuK0x1?=
 =?utf-8?B?ZkZsaGFCV1Q4cnpYUEE4Z3RhbElDNTR5MlNGVm9iaFBhTFJaT0xKTXlvd09r?=
 =?utf-8?B?MVZ1ZndpRU1MUkVVZHR3c3FBQklSNVJHSmx1UW1JOHFCTlNnY1Nvdy9mK3ZM?=
 =?utf-8?B?cGl0OEJXczcwRTd4TVF6VFQxbHFiTFJ3MlpsaXVEM1VBWGNza2FrNjRScGxm?=
 =?utf-8?B?NEErMHNOUE1EeCtZZTlMMXRFN2tLZUtoQm1tN3lLOFRIdXIxQklFdFJRMWpp?=
 =?utf-8?B?UnZNZ3N1Wm9NTVNBdlZiMVQ4ZlN0RGF3NGEyekNZM0ZmR3piTmFGK2xxSGhL?=
 =?utf-8?B?aml3QU5ydEJUMW5rSCtzN0tqOXAzQjNNU3BTa0tibmNvR3VtWm5ZdVlvenZn?=
 =?utf-8?B?UmZDaTgyWVQ3WnNHY0lFUkZsSkhHVHpETjFSQWFRUGF3WDlNRUNyZUg2VXdU?=
 =?utf-8?B?OXdqMWlDbzI0bTNIblh4eGJLakdqK2VjeFJicXh3Wm9XRWJySnRLaCsyZXVH?=
 =?utf-8?B?ekVhb1FZamFUNlVDbnh3MTBPMnY4TnpDcUtMcGRBNXhmMVpFMWtLSy91bExV?=
 =?utf-8?B?UmRFc3QvUzNwNG5NTGNQTDc5ZVVuRnpnS2dDZXRKS01JWTdoRjcyUTlKa2wx?=
 =?utf-8?Q?CJOIkWQfS0d1033E=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeaf500f-bf81-455b-6c57-08de8e4fbfaa
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 11:30:31.3589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpkyRufgH0YNwKqs575sFdbKEZxLorKPQChYuyWHHiPNXchXJC0uNSZx0HDHnmsKXDL/sNIDbSFfexZTIGZ69yTMbrvHPcHpCtqBNP0Fq4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8437
X-purgate-ID: tlsNG-4011c0/1774870234-BC681900-7100F389/0/0
X-purgate-type: clean
X-purgate-size: 428
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,cert.pl:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: ECAA035A490
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 3:26 pm, Jan Beulich wrote:
> Shifting signed quantities has restrictions. Since the wrapping macro of
> read_int() type-casts the result anyway, switch function return type as
> well as the local variable to the corresponding unsigned type.
>
> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

