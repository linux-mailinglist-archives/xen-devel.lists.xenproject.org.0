Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEVHOGfB62lLRAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 21:15:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C0462C09
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 21:15:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293950.1571313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGM04-0004ZM-1Y; Fri, 24 Apr 2026 19:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293950.1571313; Fri, 24 Apr 2026 19:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGM03-0004Wl-US; Fri, 24 Apr 2026 19:15:39 +0000
Received: by outflank-mailman (input) for mailman id 1293950;
 Fri, 24 Apr 2026 19:15:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGM03-0004Wf-0U
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 19:15:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGM02-006PQI-DW
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 21:15:38 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ebc145-e002-0a2a0a5209dd-0a2a450c8dde-40
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 21:15:38 +0200
Received: from [52.101.52.56]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ebc159-62f1-0a2a450c0019-34653438e210-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 21:15:38 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH2PR03MB5223.namprd03.prod.outlook.com (2603:10b6:610:9c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 24 Apr
 2026 19:15:33 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 19:15:33 +0000
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
 b=ZzvKsK4R6MmIQHzdw4Cv5/SLeZbPrwYEqzrYmCn6bHWH80N0LlgaCVmH4j3SS4xVlZKrqP2XqvlqAwBRipo8PPhUlkOJ8HUn/70zRaDxODn01QWETwtjUoaDIUuil8U/PIEiNTXit9NtKrdsI3jaUaqB+p/c1Thh8Er3N9RnJGwvbsp4tG4rVdCLOwSSxiA3S5lsm5EQXVKuLjObLp+b5vk9C6dmlswSHEfnfqeUoWWAqVes1ncxxDQtAvsc7JrxL4Z4vby205WcJ/wwV9CWNgga9qm5s2eMu4poy9MiGuBds9/bChIL5B4RXhmzAJuxKFDJgeE2djOmoSltan+/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHzQLGZqAPS6Un18SKcZpDDR3UEdvXn7IETSLm5u8h8=;
 b=uCSKl2f84tCXE7BAuT5u4kbyIYFwfEjxbe7cGKI1EqbFb1V+8CjQTVY7Dg5H4kqj65T5dA1GN1Ac4SKWeyT3c+Yb5j9/b2k9zlrbp2j4AIdqqDhWkRWfhNxAKInl9zzRckzbTgNQlk0xyMD7fiARchKDuvRBC7/fWOLM1A+arABK3m4A6SEBon6x+pVgUCkcGGYrivekGCr7n9wPe3LAmGmvNyyVQUXCF0kqgDQ+6IdLTYEc2HXGm1GbJhuYqsomCpopa/mGP0yH82KYD9puPuZwoUEY1dq4BLE7kwsiGJSBITIDXUylVJEDeVJsZETUyMeFKcteBRQRDYdKw1Euzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHzQLGZqAPS6Un18SKcZpDDR3UEdvXn7IETSLm5u8h8=;
 b=X0r3iMcIPjbrzh/fju4IEl7NSo3ZYs6/xuY5sGPS0cmaMZ/0eSsp/2BiY12SR4nxA6+wgQaT9YeoFniZcOTPu30nqdkEsGgMW2z3PhJQ6mXN1rzN+Q17zF6sRmTAw2ixjDT+Z+ZIwchV3NQGk104qw08/LyK6ZujOjBJzIcbG+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 21:15:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 9/9] x86/mwait-idle: Add C-states validation
Message-ID: <aevBUh77IeMuXjw4@macbook.local>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <d13912c9-8820-44e7-8aad-d8ee9ea17980@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d13912c9-8820-44e7-8aad-d8ee9ea17980@suse.com>
X-ClientProxiedBy: MA2P292CA0017.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::20)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH2PR03MB5223:EE_
X-MS-Office365-Filtering-Correlation-Id: 368f3e49-7f1d-4c2f-63ef-08dea235db8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xZVb5I6KMuo2zFnVgK+xpfb0hu4kLZJbqqqc7vSqi9DiwzttFcRcu52P4awR9b0O/F+NL6wuiA48aJKXN97p3KvGI1k5woxtPNwGOH8O3ZL6UwzRAhyLF7xmiI3XLR8MfAFvnUa2KLFyw5eo1yI5GMsKsx68jsDe14J2v3LwibdcFRY1PLEEHDlT/VbQvqxkD6CBA09HWFRSMi/Ez2TPtR2BuQTw1IBHSSKjp5tlYlh1cAt7f0zDYq5KYPWVe9xXWace87hK4+MY/LpZb2PZbbg2dPEQmaFpspZi7jMRDQ5cblLRye1ozD53ajoK7whvDe6Mecl5P6VXzCiARMnl/EVPQQGbqoIWO99S0FckIYFJqrc5WzqCXsjr3x4L4+NJ7q7H4kc4sfSI2Ij5EzYTrKQAhxIu9n3SNCkcY8x7zMeRrzX3718ohryJ2S/nYHYpcCIsaa9Vo2++nNfulyxITvphtCZcBQrhLA/k5Od1B/bXWpT8uQc7WUsrQrvycEGS8DIniilZk3kg15VVycgMH7z4wc5Si1uowoytuyOXyoB3hmfO8+oZUZHKyuopMnWDdJo6HPZx+U3QWjerPh4j3BFwX8aq1/i8M4zeD+Y6Bua9n+FvNMbbewK5tkhbP1IqHk31NUE8F0sk73vz+CEPfX9R1Sh3Y3Tvy6v6uBZP8EUuXBNVnfP2aTufAfueArvt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFJ5ZC9qYUVMOUNSN0tjWFcrK25LSXN0QjFqUWZPbUpaWVdlLzh1elR1VVhF?=
 =?utf-8?B?bDBibDNETmJsWEd0eGdkLzRraHN1eUhOcVNCSnR2QnRkNDBEWVEyMmtlVFBC?=
 =?utf-8?B?OU0wZWdtdnA5cFVsRVN0dTVRV0JTS3FhTmFNVnlKaW1XY3FoL2FIVGxpSkE4?=
 =?utf-8?B?QThXMENub29LcmhuMlFTbmt6QzNFL0dEa3pUaDE1MkNuSENzaXlzZkUzZW9n?=
 =?utf-8?B?NWFZMzhLTDlKZFpCTmlDUkE2TmhTUVlieWpDSFJORVQyaUN0NGFIbVc0a0p2?=
 =?utf-8?B?aFIrRTNRWHlsMXNJZklpSDU3aUlCa2VNWHRDWG12VHE3YXB1aEZyL3hVWVlK?=
 =?utf-8?B?Zml6ajBZVVpyZWlNcmVqUmZ5aUpJZ3ByQjgvWS82VkxiVlJNT2hua2FybGlR?=
 =?utf-8?B?WnZDTng1R1VGMFhkbmpubkNJWlJDYzBrcDZtNTFJL0tmUkVJUUhkTEZRcTJJ?=
 =?utf-8?B?VjBocndmUjNFT3E0MjdYQ3BYS2VIV2x4ZjJuSTNOdXhnZk4zVXZyYmNPdHNO?=
 =?utf-8?B?aUpwd3VZM1o1L3JNaGxQTTdSUlhwYXVyTDJnTFBkQStveGVMd1pBc0x4elpP?=
 =?utf-8?B?U3JSako3bG5scGdjb0FHdTlNai9TSU5uay9WTWVqS2d4R2laS3hEM1o4QkhE?=
 =?utf-8?B?N0VKaDVOZytxM1pYaU9peHRCay9ZOEhYTGUxQk5NRjlkeTZwZWFrV1BEVEQw?=
 =?utf-8?B?cEMvQ0J1emZXN1hrUnFkbVJSaTZPWWlqWEhaYS9OZllSeXVsK3d1OTNDNmox?=
 =?utf-8?B?NFdVdk5WNU5pdVo0UXZma2VLcGVHVGc3U0NhSFc4R3lPYWo4MHFhMEIraDhI?=
 =?utf-8?B?clN5ZFpNY2hHbzhQbXF1R1A5R2hCNHJLdVJHUGlBMUllTFpXRVBBc3NIM04w?=
 =?utf-8?B?akFuaUtrQzdsYXdHUFNabW5mdkpOdDA0VWdNRG1ydVM5RkhaZzNvY1Y3eDMx?=
 =?utf-8?B?ck5UVHNkRm9VU09Hb0RSN3dCdk1ROE51MzEwR3daalRqdk5YdkxzNE1xTUI4?=
 =?utf-8?B?SUhwTEdOVEZYcjdiUFdrN2dCTkM3MFBDYU1KaDQ2Ylo5RzhsRnRRdzFHSGYr?=
 =?utf-8?B?anlteTdYUmtoNTBVakdzeUo0UUF6Mlo3Q3N5SldTRko1Z3ZkMFpCTXYxU2Rq?=
 =?utf-8?B?ZERCQWRHbms1WUNhU3VuWjVUYWZCeEFnRXRsUS9ySXFOa1BoVE01MUZHdWNO?=
 =?utf-8?B?cERMcjRVV0U0RjZpL3l4TzkrdTd1ZVk5bGU4TVZWcThRZWt3N0xVYXhFWTBM?=
 =?utf-8?B?bGw5aUJ2WDk3dFl5dU4rNkNydXdLQ3VsakUwb04rR0NibTRoeUxIcHVrazVy?=
 =?utf-8?B?TlFoUWNydm1LZmhqNlNnYUh4OEp0VmZycVFZV2lwYlVmZFNRbnliUjlFdVlI?=
 =?utf-8?B?TzNKcGtxdTdLbWtmTnFPUDNVMTJYSkQycnRXeThnTlk4MFMvWHhtZi9KQjBD?=
 =?utf-8?B?Q3pKTmorZEJzSytZdkRHT0xZRnM5REhlaldEMlF5UVpGYnU5R0FuZnhyZjJD?=
 =?utf-8?B?S3hYa1F0a0hKSURsOGZCSkVtWXQ0WXhETjcwZUpUcVBuT0dkb2QxV0tCSXQ5?=
 =?utf-8?B?VmZYZmJUU1B3QjlzQlA4a0F0aXhxaytvOU9kZUtlQlMzbVdQdjFLYy9nd0lk?=
 =?utf-8?B?bmtFK2tLQzZHNU9IS0xCK0FvcHkzZldtZHg2RTdVeEJTQldaWHkya1ZWeTVr?=
 =?utf-8?B?Smg5MitocTcxeXBQNEprWk5XSDFQYk9EQkJXVUpNUXQyZ3lCUXJrYURLVWxE?=
 =?utf-8?B?aXIyeHZYV3RuVzFLNHFIdEs5aEZXNzJvUmVXTDdyZGR3czZBc1UyNXk2eTRN?=
 =?utf-8?B?dmlXRHdlb28rdnM0ME52VFZRaFlsODduZDhydDFmQ3lGRXN4d0VueitTbVJH?=
 =?utf-8?B?YWV6R2RKbWpjNmFHZHRzOEJrcEtQdmFHeEdETmxqa1JTcHI5dEhhc1FvNTFo?=
 =?utf-8?B?Q2VSOGIzZUgxRjJTYzdBaGxlMHZVNXJwUUpoS3RkUkt4a3JyRit3UzlWMTVa?=
 =?utf-8?B?YkthR0ZrOE5UWXBoVnVrNVl2TE5qdWN6TjZ5U2diTnNLalZLYjJaaitqWEFL?=
 =?utf-8?B?TjlHMnFsc3VhK0R5WHZYei91Q1htL2VXbzRnek1zcUJnZG1Va2phbGxFVU5i?=
 =?utf-8?B?bldyVEJodjI5VjJCMWg5OER0TU5WdUxvZjZlRVNDQjN4T2NmQmFhZUZCT0RB?=
 =?utf-8?B?YmlUZjhWdVdEcGNqT2lNWjlOS0VLSFMwNUJmREhxSjFpMUwvOWhxT1kzbnky?=
 =?utf-8?B?QmVEZmVKbWpaTDR4VHJUSWRCWFkzYXJkQkJKRnE0YlRsQXhMQStZZlJWcENv?=
 =?utf-8?B?WWZsYnNscDZBd0xOdFMvN1ArR0JQcDJRUmRTMGhOMDVwaC8zR3Vadz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368f3e49-7f1d-4c2f-63ef-08dea235db8f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 19:15:33.5835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqMjB8LN2bjdPigusJcPMTd1M1t3Kn4vtPllbMfbDs2kWEz3EOWcS4lYcb9cc9xxU+4lZ5ru49nmQMbjOeNFuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5223
X-purgate-ID: tlsNG-d25034/1777058138-F4AF8CF5-437507FE/0/0
X-purgate-type: clean
X-purgate-size: 2780
X-Rspamd-Queue-Id: 554C0462C09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Thu, Mar 12, 2026 at 05:58:21PM +0100, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Add validation for C-states specified via the "table=" module parameter.
> Treat this module parameter as untrusted input and validate it thoroughly.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Link: https://patch.msgid.link/20251216080402.156988-4-dedekind1@gmail.com
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git be6a150829b3
> 
> Add __init to validate_cmdline_cstate(). Other adjustments to fit our env.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -72,6 +72,11 @@ boolean_param("mwait-idle", opt_mwait_id
>  
>  /* The maximum allowed length for the 'table' module parameter  */
>  #define MAX_CMDLINE_TABLE_LEN 256
> +/* Maximum allowed C-state latency */
> +#define MAX_CMDLINE_LATENCY_US (5 * 1000 /* USEC_PER_MSEC */)
> +/* Maximum allowed C-state target residency */
> +#define MAX_CMDLINE_RESIDENCY_US (100 * 1000 /* USEC_PER_MSEC */)
> +
>  static char cmdline_table_str[MAX_CMDLINE_TABLE_LEN] __initdata;
>  string_param("mwait-idle.table", cmdline_table_str);
>  
> @@ -1589,6 +1594,41 @@ static char *__init get_cmdline_field(ch
>  }
>  
>  /**
> + * validate_cmdline_cstate - Validate a C-state from cmdline.
> + * @state: The C-state to validate.
> + * @prev_state: The previous C-state in the table or NULL.
> + *
> + * Return: 0 if the C-state is valid or -EINVAL otherwise.

Hm, I know we picked this up from upstream, but this function would
better return a boolean, rather than 0 or -EINVAL.

> + */
> +static int __init validate_cmdline_cstate(struct cpuidle_state *state,
> +					  struct cpuidle_state *prev_state)
> +{
> +	if (state->exit_latency == 0)
> +		/* Exit latency 0 can only be used for the POLL state */
> +		return -EINVAL;
> +
> +	if (state->exit_latency > MAX_CMDLINE_LATENCY_US)
> +		return -EINVAL;
> +
> +	if (state->target_residency > MAX_CMDLINE_RESIDENCY_US)
> +		return -EINVAL;
> +
> +	if (state->target_residency < state->exit_latency)
> +		return -EINVAL;
> +
> +	if (!prev_state)
> +		return 0;
> +
> +	if (state->exit_latency <= prev_state->exit_latency)
> +		return -EINVAL;
> +
> +	if (state->target_residency <= prev_state->target_residency)
> +		return -EINVAL;

I'm not an expert on C-states, but isn't this checking against the
previous value kind of defeating part of the purpose of the command
line?

Also, it might help to also write down those limits in the command
line documentation.

Thanks, Roger.

