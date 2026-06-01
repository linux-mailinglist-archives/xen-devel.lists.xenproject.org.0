Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JGlNLi6HWoidQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 19:00:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF38622F44
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 19:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324011.1589681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU602-0004ru-2L; Mon, 01 Jun 2026 17:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324011.1589681; Mon, 01 Jun 2026 17:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU601-0004pl-Vp; Mon, 01 Jun 2026 17:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1324011;
 Mon, 01 Jun 2026 17:00:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wU600-0004pf-7O
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:00:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU5zz-007tRD-Ep
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 19:00:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1dba97-5cb7-0a2a0a5109dd-0a2a4502828e-42
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 19:00:23 +0200
Received: from [40.107.208.13]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1dbaa3-af86-0a2a45020019-286bd00d1150-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 19:00:23 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB5698.namprd03.prod.outlook.com (2603:10b6:303:9f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 17:00:18 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 17:00:18 +0000
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
 b=XpfvdqnMMM4IK/3tTJWL+CxS0D6O0qJ/gpHtIODfjVtsDhArLou3i/Ew/TwS/odwVCRTyteM4ypiM7cy0eqM4fXSdr4t+0DnQHBLq5Mow3CEVXLdI2iNb2I8rRZqLxq3ME2771BlL6BC6VFVuMADi7wljG+cI5O8cY5ZtIZTLCnsMN2Vrn/Dp2GC89BrMyXfXOr0rSNglTMEfDZJO6NVcHpBIZc6aB2ZwONtVWkTRtzkoPXwUCXEcxa+opJgHCyATrh4lkLn2YBzwgxFL8cphW+RZEjwo0LWOh+97Rt4nJQH8HdbFM1fYpmXkVmJVXIZR7ZC9z0ROPzq5wVD8NgPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MojUP8b1crQuLSR55Ve/r677t9vA76xR56gBrbRoU40=;
 b=cwq2qFgOgV58WSjqM5hTTqyTqrmCx+KWsPbin4Vhe6M9sZdmgnx3g8mBEP+kbk4HMzLqSkLZ84m9s/ucRQ1+lmRaRdSoX1QKR/ssmnPOqEAwOXf/ndrngxPBknKCY4gqNesWYkBEcLBnPWX2c/+Q3KFZwaoXhsnfKpp+hnoxHfu0clxCdsOqwLCFHZo/56Y8QNmDgDG7+OtmC0Qd79mmlvzY7P9kPSeEmGtUji5tqDBo2nFu3P1fqFiJZwyaJ7UySgXiivH+4cG9taW6ratslOAdjIjU0R9ck/Soc7Op/H6JqXDM5/uSJxRY/qqotA/cgBNvoKP9+/+EG0rgTZpchQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MojUP8b1crQuLSR55Ve/r677t9vA76xR56gBrbRoU40=;
 b=Ue8R+CIjuuiTI9zCA9stX4Ih3ZzJ0VbOysufgO3/YFyg8x7TNgayg6CPgo0So7UyADn6KEWlFzY4TxklcTnGCmPbeY6vE/T3GxbGVI5gJU+HuEKSNK9vXGtA41uQlG8j2SoBMnQVLQ3ozxS9n7ZAyXWgDw3yDyVigUDxW/MvmbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 1 Jun 2026 19:00:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] xen/x86: Change stub page freeing to fix smt=0
Message-ID: <ah26nl95MgqhPPAi@macbook.local>
References: <20260526203114.40882-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526203114.40882-1-jason.andryuk@amd.com>
X-ClientProxiedBy: MA2P292CA0028.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::15)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB5698:EE_
X-MS-Office365-Filtering-Correlation-Id: 43095319-b2c3-4c18-794d-08debfff4200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1L0ZnprwoHHMUZnDo5kuq5jsDrWpEetgqcUscedcFL420brQ7ROM/YAH1LqT80ORLTqc+3rae7oyqdLwHs/YyjO8HIvt75v2xdbnhkqVvtpIaVm/dbS/N6MRLLEFT5bZ2pXLvvFDOQa5h90uxbesru0I7Du7/t37SFudQe9kOy4xVRx+sIgYwD2HbrNGvgw4UyHoeeUEhnxd2boksJ3tluk4I/INXe0oWUHk86ZcEabKeVmAJ+CG7o2R0OYqaC8TpBrMomgFYxqGE3xUxU723RcxgviivXI3mVyT/On2FOxh5sFbAzlygsXhHkvzkLQdAdPcvJGgWzbCMC6NFPSVzkGWvI4b5UsIPJSu4OVmSxePk5fap8pnPPWBaBhz3uXSsJCgK7q1z+M4oSA53BVyNlWt478Dgk5ijIHBh0LS+7qArn45OYRQHK/9ndtNAO/OTNdvXx2efu/mrLsT6w5sMq/+AfMc6NRP1zkd0zomVt3wTy2l9qVDGF1bug0I9lWG9KaFh4GEw/htytBiXB8o/sBRAG4I3QJobwLn9WQBhgfPOlNA8+HUqilmhKcnGx24bMavE6Fv98O3eO+FzQJGkVzLtQhX+n+ezCmXer7+4lWI5oZvk+RbOsh+MaOKBn5MPM37J3///vj3GZS6Js99Tq98Xr5xnDowlAI+NKCSZZQCCZKcT25NK1ExN/nN0K+S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXh6aFZDTG1RcHcyNVJaWmxrM1BLRy83RzFxQkJURWFIdVZ0VE04ZGJNM3Vs?=
 =?utf-8?B?ZS8zSExvT1lyN1JjWlQ1QlpLRkJTWWVjcWZUR2RYQ2xNVHJac1kxY0FrUXpk?=
 =?utf-8?B?Q1EyNzE5WUdHZmJka0dFcEs2TVF0dmM5K05jcFc3UHB6cFBKNFpFckdld2hw?=
 =?utf-8?B?VjkyQ0NKamNKS1dyVU5YbmtoRFY1a1VvSWhxVzRkc3BFZ1BLVTRDQytDNEF4?=
 =?utf-8?B?TDB3MTE0MStoY2lidUw3cmlzWERvK1RTMzIzVktYcUE0ck1ZYTZXbTdFYzU2?=
 =?utf-8?B?OVRxdkdLcXpVWlpjZGQ5aXBmM0pwYWNkTVBDZkpaVGZabk1uNFRzYUZQcDJH?=
 =?utf-8?B?TzJpbFM4S2VGVHpUYy9sNng4cDQ1cWlMRy9kcTRJSmg0Y3N2d2xXUzdUd1da?=
 =?utf-8?B?cUg5NWN6bTl1ZHRDaW9qOElYOTZrSldRK0xET1lNRGJxbiswZXJZaTlZdDky?=
 =?utf-8?B?MXNiNnMrYnRjRGNrKzFOSGlDUGkzYnUvRGtoaEd1aXBISUFoN2tUMmREZW9o?=
 =?utf-8?B?VzRrV2dia282dTZsUEdncmtYays2OGhKeHVlbGZRR29iRWNYRXIvQk1mbWlq?=
 =?utf-8?B?VzI4MEVCWW1BakJhT0M5aGR1c1hNTjlNVzQ4WHBoREdiWE8wb1oyWW5EMmpS?=
 =?utf-8?B?SDJqZ1dsR2hVbnFFVDBFRm1NbXlkZmJoNVJZdDkyTFM3Mms3VmwwbU5FOFB6?=
 =?utf-8?B?Rmx4SndEZmhTSVRsalYwQ3EzTmVFbHZlSzlvU1AzODBEVnhvV2hTWUtpRVN0?=
 =?utf-8?B?N1hFcS9jWWFlNUtCTW84MG4xazJMWGlUejFKYmlST2VkQWR6WHNGUTRuVVMv?=
 =?utf-8?B?aUN6LzdtMjYwS29Ba0VaMldBbllBOUVVOVZYQjVEaU1ONzkwZmxnNFZPMnps?=
 =?utf-8?B?OGl3Q3NIMlBVVzdjd1c2TFdRdEpOWnJLb1hUTTd5aHdKZzYzK25Lb2wyeE9D?=
 =?utf-8?B?OGNBSlVYWm9YZkl4RjlZelAwdHNMN1EwSFdzK3BnQmozUFhSTDhKUkR0UGNN?=
 =?utf-8?B?YnJ0SU5iWkJqelRjSnhFQUdHSGJvd0NUaDlTNEE3M3RDTEgwZktUek9XZkJE?=
 =?utf-8?B?d2hySTJJZENjQnJEajhYNWtwb3JONUpYanJpcGFOQXVzTGJQNjdQeHBYVXZ6?=
 =?utf-8?B?Z2NuMEJkS1pwQ0cxenFGc3h1amhnWHBBQ1lTYlVVNTFzSVlRMmxXQ0F2ZDJs?=
 =?utf-8?B?QW5FajJ5d2dtbEd1NUlpR0toRGJSZVZQVTRPM3ZaZU54VTNSMkxjZTZUMlhK?=
 =?utf-8?B?K1JramdGMUFZMi9XRTFPSTYvbjFVQXl0MExsYTY0aU9mQTBHMjZxVU9BSWRI?=
 =?utf-8?B?ZTlpcmQ4Ukd4enVGakIrWEl3S0tlNUlBTVptTFBTNjQ0UENlcjVvSXdJVGxE?=
 =?utf-8?B?RjZBbHlCUHB3ZC9kRm9rN0wzNFp3Z1Byd21FNVhaUW9BZ1B6UjNib2dJVGtU?=
 =?utf-8?B?a05yT2hrdWpFcWRwb3N1Z0lweGhISExZdXliaWZ6UHRxSGpVS0krSjBaRHA0?=
 =?utf-8?B?T3hRNGlZZHpXTXY1ME9QVmxFQ2tBRGJjMjY2UTVodTJyR0p1Mk40THVUVy9O?=
 =?utf-8?B?U2UwSUhPSFFuejZmTGJRdlVJL2RoK285SEpmdUdHbS9zK2kzZSt0ZlExL3Fx?=
 =?utf-8?B?NnNnMStjZVRmVWhzNFFJVDJmb3RzQnVoOW1ndFcyVk1GR0NVa0tDbFRaQXVI?=
 =?utf-8?B?eVN5UVFPVXdaMi91Q0Q0VTdWdGlteVdsWjRzbXhOQnhiTDNXWGx3TlI3cUMy?=
 =?utf-8?B?dmNvOW45QjlMT01nOWlyWHNxRTZEZjRKa3VnblNVTUZOZU1UWmI3WUlYSTdH?=
 =?utf-8?B?bDQ3OUNCcis5T2tmREJkOXU2cEZiT3NnTlNZcTZjSUl0NWx2ZGxDSWkvbEpU?=
 =?utf-8?B?TWxWRms0dE1lcTJVdlp3L01FOXk2TGFEdGx4WUVNTEx5c1lPamNENnJFeUw3?=
 =?utf-8?B?S2RMdlBBdUY2SE4xTXNLNUxic0NockY1NnFHWDYrUE9TMEJkTUxqSyt3cnlX?=
 =?utf-8?B?Ty93L1doZTZHcWYvYU9XalZad1hmOFNla1NlTUZXeU9BVFYySFpwMzJSVHcx?=
 =?utf-8?B?QWR0b1QxOHIvL0pocnlpUlNZNFFhc3lrS21zRnZXNDA1WlhpQTZFSmkvOU9i?=
 =?utf-8?B?K1F6bmxVaGoxdDU2YXB5czlDd3c5cUphQ0hNUDRLOEZtNm1NOGdFelRmNVRD?=
 =?utf-8?B?YmpwaGIvQTNFWU45UTlSQjJsQzNkd1VnR2lyUTBkVkVxaFpkN2Q1THZBWFhs?=
 =?utf-8?B?NGpFRXlJdkVmcFpzVVBqYVJrbXBLS0MzWVJvcTFaL0pBaUpDUkpsOHU5ZDBX?=
 =?utf-8?B?cGg0a1VtYyt4UDRiZm13ZGg0RUs3MUxHcnJRNm4rZEI1aEtXME9DUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43095319-b2c3-4c18-794d-08debfff4200
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:00:18.0408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsVEbFN3+ZxlK5n4ilcZRBMjcvMaXLrAsAX80nvd9EQP6JQduBO1nkMP/bdC+LjG75vFDAfFhXBgene536MV3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5698
X-purgate-ID: tlsNG-720697/1780333223-A8145161-4720F41C/0/0
X-purgate-type: clean
X-purgate-size: 3527
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2BF38622F44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 04:31:14PM -0400, Jason Andryuk wrote:
> A single stubs page is initialized with 0xcc and re-used, with multiple
> CPUs each using a portion of the shared page.  In cpu_smpboot_free(),
> each stubs area is checked against 0xcc.  When all are set to 0xcc, the
> page is freed.
> 
> Booting a system with smt=0, CPU0 is initially setup, allocating the
> stubs page and initializing to 0xcc.  When more CPUs are brought up,
> CPU1 is initialized and then immediately brough offline as it is the
> sibling of CPU0.  Since the page was initially memset with 0xcc,
> cpu_smpboot_free() finds all stubs as 0xcc and frees the page.
> However, the page is still assigned to CPU0 and continues to be assigned
> to other CPUs.
> 
> Meanwhile the page can be reallocated, which can lead to misbehavior.
> The particular instance was the stubs page re-used as a page table which
> later faulted when the entry was all 0xcc.
> 
> Change to initializing the page as 0xd6/STUB_BUF_FREE, and initializing
> individual stubs as 0xcc/STUB_BUF_USED.  0xd6 now indicates unused, and
> 0xcc indicates used/assigned.  When freeing a CPU, the stub is set to
> 0xd6, and the page is freed if all stubs are 0xd6.  Initializing with
> STUB_BUF_FREE lets cpu_smpboot_free() a page that was only ever
> partially used.
> 
> 0xd6/UDB is a 1 byte invalid opcode, which is similar to the existing
> use of 0xcc.  0xd6 is used to identify bug frames, but the stub addr
> (e.g. 0xffff82d07fffe000) fails the is_active_kernel_text() check.  It
> should be okay to use here.
> 
> Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> It would be nice to use get_page()/put_page() to let count_info handle
> reference counting, but they require an owning domain.
> 
> The listed Fixes introduced the use of 0xcc, but the smt commit may have
> made it more problematic.
> Fixes: d8f974f1a646 ("x86: command line option to avoid use of secondary hyper-threads")

Speaking with Andrew, we believe it might be easier to simply forego
the freeing of the page, possibly something like:

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index ff05955bae40..62c6cbf4b561 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -990,19 +990,12 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
     {
         mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
         unsigned char *stub_page = map_domain_page(mfn);
-        unsigned int i;
 
         memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
-        for ( i = 0; i < STUBS_PER_PAGE; ++i )
-            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
-                break;
         unmap_domain_page(stub_page);
         destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
                              (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
         per_cpu(stubs.addr, cpu) = 0;
-        per_cpu(stubs.mfn, cpu) = 0;
-        if ( i == STUBS_PER_PAGE )
-            free_domheap_page(mfn_to_page(mfn));
     }
 
     if ( IS_ENABLED(CONFIG_PV32) )

(there might be further cleanup possible if the page is not freed, the
above chunk is untested).

It's a single page shared between 32 CPUs, and offlining 32 adjacent
CPUs seems very unlikely.  IMO the extra complexity of having to deal
with the freeing overshadows the very small memory gain we get from
it.

Thanks, Roger.

