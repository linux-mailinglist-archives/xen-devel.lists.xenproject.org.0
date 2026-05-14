Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBppIPfnBWqPdQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 17:19:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ABF543E87
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 17:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308989.1580204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNXpN-0000Z2-C5; Thu, 14 May 2026 15:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308989.1580204; Thu, 14 May 2026 15:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNXpN-0000WF-8s; Thu, 14 May 2026 15:18:21 +0000
Received: by outflank-mailman (input) for mailman id 1308989;
 Thu, 14 May 2026 15:18:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNXpL-0000W9-6L
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 15:18:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNXpK-007z8y-Ga
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 17:18:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a05e7a7-e002-0a2a0a5209dd-0a2a4507c4dc-42
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 17:18:18 +0200
Received: from [52.101.46.60]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a05e7b8-229c-0a2a45070019-34652e3c3262-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 17:18:18 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6551.namprd03.prod.outlook.com (2603:10b6:a03:38f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Thu, 14 May
 2026 15:18:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 15:18:14 +0000
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
 b=mVei6tQ6LwhrQ5eqPIcfQS2vYNOdmHlsBNVhIL6BmwCNZS6cdLDV2k/0GswWB6Zy8PshKzvaFeJcIHZWPhd4RXRcO45CWSRdnAypHKH+jipuxwghTcMU2S3YEAKGG6xyDl52luYQRgve2+y3fqY7PIgTEWrso7xIB+hbS/pV31suWa2y8iz4PK9lwhL/Li9fTl80l7t//vgE7rDz05Pu4TlzA/hR3gHyCtmQLGYMN1tvJrnRV3IoVTBn9tEjniXx7DlRawEflocHhSqY7705mK3mfMRZ7TtnmnWdS1Ie4vj1UIT6cGnyJjY/kxQklQq/Gdk0rX1ee2nI0cwEzuwRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEewIzKrGD2teehTLCQfFeoIYjYCO+02NSdyIynyf7s=;
 b=Kx8WQ4ZWZeRcK1SFG0v98vT0USKKUJn09JJu0R5sNsUccwHPPxTZ7sbgjSUmWbMExgEpIRXDT0fm2QuBQyFsDwZH9anqo9/+VnFCmBuT7eWGva1gj0CrX9D3G1DwYCuviV924WML795qTIeKX4/YI4PQSXsEXfdRED8wWKzOGj5CpsC53PoyDyAZO9nuA6FD4QV6yJ8COpgutzJ/Dj3A7uooIu9vXWF2j8IwogjUjKMOdVd1bNUQoqvoMNBPwDk1sc2p6Nka87/ceAA7Gucqf9UX0lLMFtpj+/x4SzPCxvIArqvL2gVfYOx6QzKOotC0MQIuPJxC7FL87cesQ0vROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEewIzKrGD2teehTLCQfFeoIYjYCO+02NSdyIynyf7s=;
 b=MJ2azzkBlDCIYG1t9mrERk1l8Z7//rXCWC/AqS64ObC/Saw+GJLXPe18ba9hOm1/mo2LuNoz7tA9TgHILMDVlE7M+l03mYn7IIi4Vus6nqKSCDgp2I0TGYKyqnWfLnq4l18E3MRCWVnYVG24j1oob9xSCZT6n9zme5JNjNnMS9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 14 May 2026 17:18:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.22 v2 7/8] x86/mwait-idle: Add cmdline option to
 adjust C-states table
Message-ID: <agXns5dpu-X5rspi@macbook.local>
References: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
 <8c46fedd-f1f3-4cad-91fb-1b3b8d58db50@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c46fedd-f1f3-4cad-91fb-1b3b8d58db50@suse.com>
X-ClientProxiedBy: BN9PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:408:f9::31) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 9237a0ec-4539-4f42-b221-08deb1cc048d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|11063799003|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OoM5YXVWmX/4Kfk0gevYOb8BC6HODBxXY4nJkC6kMZPmM3s/yCKRk1okP1pRsJVgNmytSkeG/jFxkPxbdACfQo+kPFrhC2yGamBwzTXx3VfNxCopdisFpAriuygvILm2te+xjojXZ7FLBAWj46zkU4yq0Q+auLemDx+grgvFv20zynN0+0jJBczTs6eH/lnlPJw0mIqHCACQ7UYUzE9bqMJJ2ERHoCsTicbypZBXNpHC7ILb9IUbpZ51OOVIb1MWhArwJ8A+hZ143JnE8QvEvQmbFF3q6KaevwJrJlecMf78g5VuqbQKzROZwh4L3k3EcVv6jcqqmT8NkHryjn0RN/gy82PvTSTsdwsicVXp0uhxQksU1yVss25wGjbX4HpJwuhWYmKCIsyfT3cQxa6kZTycP1zc6DrSmbObRVehXUuKhUSDXNYx2YTXk4mJHUSdI1cVMKYfecoCUfybjNTmLUZvdEL47kOj6iftNp8q/2JTMmKsYsuzgUGjhcZdWNWEmB1X2/VUzeGN6W2Fyua4RXA/ue/Bb890yVFqDSoE44JnaZ2Z736eaTnHIMsjbz26WvDBSCBOme9G+qJ1moJFIeldv7tLQaP0xEgMerTzlmH1Zp3Ob3jXViTXSiZ+FinrBBssyIdqoUKdI96sqMsVvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(11063799003)(3023799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk1ERnhNWTVncTgwZTdDVW91c0FSOFlNRVJXcnhmaFkyUXFIN1llK2NaREhm?=
 =?utf-8?B?V09kanhveGxmTTBuVVVYUmFjQWlaZG5WcmdnZ1VHWGpzeVRuaTU4WVE5NytK?=
 =?utf-8?B?OFdpYkxvSTI0dTBoYkkxczdkdDB4ZTN5MHV5WVdnUmZrczBpRW53MUticVMr?=
 =?utf-8?B?NXlQVHdqd2ZHUnRaRklRVzRYcVBrcUpacWpnMjJZVFZSNmtsZndKa1RXaElP?=
 =?utf-8?B?c3E2N3JzTXMwbGpjVkJOVjVoTzZOY25KWEd3WlpRVEtDZ3gyMm4rWHczWU81?=
 =?utf-8?B?OVo2cVk5SnFDeXZyOWlhanRSLzdlSktkQ2t3R21VZ0ozQzZ0T1dyUDZaMG00?=
 =?utf-8?B?cGtQTFRMZExkbTBpUmh1dWFKakxFbWZPQVBMbEt6RTUvYTMwcjFxL01KcC94?=
 =?utf-8?B?Tk05QzBXTWZ4dW4yTzhyWTZweXUwRlkvUlRMa1AzYU0vLzRxYmRGaTc2THRU?=
 =?utf-8?B?bWRRUlRRdlpIdGFMakQ4Tmo4MHNyeFRLR3RoU01ESHFyZlJTcXZDRHpSTFVt?=
 =?utf-8?B?MTVGamZJQlQ3NWswSVJLMlVQT0ZMcGc0UEdadEpzNHAvUC9WWWd1Z205aC8x?=
 =?utf-8?B?Mm9pY1NQYXh2RmhjOXB0amNGTmRJREpVSG5CU2VHdDhQVmxodFh4R2g2MGNL?=
 =?utf-8?B?VE5nTkpZQ2V0ZzRiczdoZ3FMMlhLM084dnFWc2piSmlvdTJWM0NPc0xVVUxj?=
 =?utf-8?B?cS8wSFBPaUpUbXZiZTZPOFRKNzA2QUk3T3RMN01kVWhDZkZmcFY4T09iWGtV?=
 =?utf-8?B?ZEpSVWhEaGwxWHlDbmUvdHErbHZ5aG9NWkcwQ1FBMHFwMHgyQVcxSWZhdzU2?=
 =?utf-8?B?Sk1rOTVJRnZOV0tyUU90RlEyWElab3lGQ3RxOTE1OHZJVzcxQ2JORjFSdmsv?=
 =?utf-8?B?dkNOZEhlYUVRcVYyQmlkMnJJQTJWZ3pMdnU4ZmQ2RndNc0xjdFBhRDd4dUZC?=
 =?utf-8?B?L1Jtamo5bTVaTEFnN28xaUNPVW90cnBWVEkzUm9mcGw0ZWpSem5WYlhkdG9G?=
 =?utf-8?B?SVZCK1JScE50U0JhaDlMUjdxelR3aDdCcnVEbzc1UVFhNEh6WmVOdmZSaDVj?=
 =?utf-8?B?dDA3ZWpCRmFhc3o0NTBCY0tvaHRMTWl0cWFvOHdVY1M5VzlwVFA2VzBsaVhr?=
 =?utf-8?B?dUNNdUdmTjRJam9veDR4OHB5TlBUelEzRlhIMmoxTDlNUklEc2ZMSnBnWGFH?=
 =?utf-8?B?Z3NZUEs4RWtOQ0x0Uk5pMndwYlArcWlLMHZuTFVoTlR4aGZLZFd0Q2ZyT05T?=
 =?utf-8?B?Si85OFNHN0QxWmY5NEhSS2UvT0NDeDVoUHdGNUd5RUJnUmVoSHEyYndMMFlF?=
 =?utf-8?B?YUd2bjVxODlsRlc1Rjh2aVNzVlljS3MzSzJBMkR5R2ZOekd4M01tMklueXJJ?=
 =?utf-8?B?YmRMU2hiV2lnWllFTnNoelZ0ZHQ5K3VLTU5OQU1SbDE0RUxDZDBLM1FMZS9j?=
 =?utf-8?B?VXJHc011Z2M5VlBwZDExSDBsQkVBNi96NkJrZ0hlcjJSc2VIaksvekd5TTNL?=
 =?utf-8?B?T3FGSzBITGJlSUtQejBGU01EcDN6dFRoUmk5TlplT3BucWlDRWprbE5Ibno0?=
 =?utf-8?B?bXVVcll6S0pBQ0JYR2dMd0l3NGQwUW9CeEpEYjM3RUhaNlErYmo1UXI4OGNo?=
 =?utf-8?B?TjNWZ2s1K3JpWlI2UkowNlgwR2hrZnhyZHVmS0lzQ256MFh2clBTM3FXOHFP?=
 =?utf-8?B?SHNFVTg1VUFiSTlGRHQ3V0NGcmZaRlJZV2RycEFBMjNFYzVDWElhNnRpdkR5?=
 =?utf-8?B?VHFLT2VWSUxhbm11K21NcGNuSmhFL1crT2pIZ1NvQjgwMTk1b21zVzJmaHNl?=
 =?utf-8?B?K210ZWNPZ3VLRU1TVURQT0N1RlNqZmdoZFQyS1lucGVtb3BSTUN4NjJBVTJv?=
 =?utf-8?B?c2kxQTcwb1EvRDZkbE8wejE4cGN2dk1LU1FwVEZ4eWtsYUY1elBkbUdJb1pT?=
 =?utf-8?B?RVVkL0txTHlXQVcrLzJXSW0wRHVqOHA5TTlsS2VvYXNLSkh5Zm5DWXorNE1w?=
 =?utf-8?B?dENneGg3enBVQk1EYU9LSDJobFB3RHRxR1pVVWtOS1lPWEdhbXVzSUoxNDdN?=
 =?utf-8?B?SWY3UXZoa1ZEeStMRng5RUxZMWtXNVBRZzNIa3VGK2V3bk5OYzNzUkpHc1Jv?=
 =?utf-8?B?NHRWNWR3eVo2MmVCMjZnclcxb1dsYWRvNmw2MFpmUm1aVWlpZktTa2FBeU1R?=
 =?utf-8?B?Uk91NzJLeWZOd1JwQTRCUTVaNmlCZnNOYU5JcElxSy8rR1piZ2FvaHNWWE1G?=
 =?utf-8?B?UVJFN2dObnh6YTE4MDVvYnJlL3pxK1ZWYXBzU0VzYkpVazd0UGk5ZHVGUzFt?=
 =?utf-8?B?ZEs5TGhPUzZZS3ZNbjNla3l1Yjk1S2o3dllHSEhPQlVDT25HTVVXdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9237a0ec-4539-4f42-b221-08deb1cc048d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 15:18:14.3258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+mthGM0T+2pIOTq9YrKs7UZ2lNqHSM2WvwEVpOvBnKiAYACb9zhahstOvpMvO5pyBq4+NyhxHZ5n5c7rvt0rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6551
X-purgate-ID: tlsNG-ef75cf/1778771898-08961C48-F523335C/0/0
X-purgate-type: clean
X-purgate-size: 9034
X-Rspamd-Queue-Id: B9ABF543E87
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,msgid.link:url,macbook.local:mid,intel.com:email];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 05:38:08PM +0200, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Add a new module parameter that allows adjusting the C-states table used by
> the driver.
> 
> Currently, the C-states table is hardcoded in the driver based on the CPU
> model. The goal is to have good enough defaults for most users.
> 
> However, C-state characteristics, such as exit latency and residency, can
> vary between different variants of the same CPU model and BIOS settings.
> Moreover, different platform usage models and user preferences may benefit
> from different C-state target_residency values.
> 
> Provide a way for users to adjust the C-states table via a module parameter
> "table". The general format is:
> "state1:latency1:target_residency1,state2:latency2:target_residency2,..."
> 
> In other words, represent each C-state by its name, exit latency (in
> microseconds), and target residency (in microseconds), separated by colons.
> Separate multiple C-states by commas.
> 
> For example, suppose a CPU has 3 C-states with the following
> characteristics:
>   C1:  exit_latency=1, target_residency=2
>   C1E: exit_latency=10, target_residency=10
>   C6:  exit_latency=100, target_residency=500
> 
> Users can specify a custom C-states table as follows:
> 
> 1. intel_idle.table="C1:2:2,C1E:5:20,C6:150:600"
>    Result: C1:  exit_latency=2, target_residency=2
>            C1E: exit_latency=5, target_residency=20
>            C6:  exit_latency=150, target_residency=600
> 2. intel_idle.table="C6::400"
>    Result: C1:  exit_latency=1, target_residency=2 (unchanged)
>            C1E: exit_latency=10, target_residency=10 (unchanged)
>            C6:  exit_latency=100, target_residency=400
>                 (only target_residency changed)
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Link: https://patch.msgid.link/20251216080402.156988-3-dedekind1@gmail.com
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 111f77a23348
> 
> Add __init to get_cmdline_field(). Put cmdline_table_str[] in .init.data.
> Other adjustments to fit our env.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One possible adjustment below.

> ---
> For the initial attempt, I've left the new option as a standalone one. It
> may be worth integrating with "mwait-idle", but I think much of the
> parsing would then want doing differently. It'll then likely be much
> harder to apply future Linux changes there.
> ---
> v2: Correct example in cmdline doc.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1916,6 +1916,23 @@ Print boot time MTRR state.
>  Use the MWAIT idle driver (with model specific C-state knowledge) instead
>  of the ACPI based one.
>  
> +### mwait-idle.table (x86)
> +> `= <string>`
> +
> + Define the C-states table from a user input string. Expected format is
> + 'name:latency:residency', where:
> + - name: The C-state name.
> + - latency: The C-state exit latency in us.
> + - residency: The C-state target residency in us.
> +
> + Multiple C-states can be defined by separating them with commas:
> + 'name1:latency1:residency1,name2:latency2:residency2'
> +
> + Example: mwait-idle.table=C1:1:1,C1E:5:10,C6:100:600
> +
> + To leave latency or residency unchanged, use an empty field, for example:
> + 'C1:1:1,C1E::10' - leaves C1E latency unchanged.
> +
>  ### nmi (x86)
>  > `= ignore | dom0 | fatal`
>  
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -70,6 +70,11 @@
>  static __initdata bool opt_mwait_idle = true;
>  boolean_param("mwait-idle", opt_mwait_idle);
>  
> +/* The maximum allowed length for the 'table' module parameter  */
> +#define MAX_CMDLINE_TABLE_LEN 256
> +static char cmdline_table_str[MAX_CMDLINE_TABLE_LEN] __initdata;
> +string_param("mwait-idle.table", cmdline_table_str);
> +
>  static unsigned int mwait_substates;
>  
>  #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
> @@ -122,6 +127,9 @@ struct cpuidle_state {
>   */
>  #define CPUIDLE_FLAG_IBRS		0x20000
>  
> +/* C-states data from the 'mwait-idle.table' cmdline parameter */
> +static struct cpuidle_state cmdline_states[ACPI_PROCESSOR_MAX_POWER] __initdata;
> +
>  /*
>   * MWAIT takes an 8-bit "hint" in EAX "suggesting"
>   * the C-state (top nibble) and sub-state (bottom nibble)
> @@ -1547,6 +1555,161 @@ static void __init mwait_idle_state_tabl
>  	}
>  }
>  
> + /**
> +  * get_cmdline_field - Get the current field from a cmdline string.
> +  * @args: The cmdline string to get the current field from.
> +  * @field: Pointer to the current field upon return.
> +  * @sep: The fields separator character.
> +  *
> +  * Examples:
> +  *   Input: args="C1:1:1,C1E:2:10", sep=':'
> +  *   Output: field="C1", return "1:1,C1E:2:10"
> +  *   Input: args="C1:1:1,C1E:2:10", sep=','
> +  *   Output: field="C1:1:1", return "C1E:2:10"
> +  *   Ipnut: args="::", sep=':'
> +  *   Output: field="", return ":"
> +  *
> +  * Return: The continuation of the cmdline string after the field or NULL.
> +  */
> +static char *__init get_cmdline_field(char *args, char **field, char sep)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; args[i] && !isspace(args[i]); i++) {
> +		if (args[i] == sep)
> +			break;
> +	}
> +
> +	*field = args;
> +
> +	if (args[i] != sep)
> +		return NULL;
> +
> +	args[i] = '\0';
> +	return args + i + 1;
> +}
> +
> +/**
> + * cmdline_table_adjust - Adjust the C-states table with data from cmdline.
> + *
> + * Adjust the C-states table with data from the 'mwait-idle.table' parameter
> + * (if specified).
> + */
> +static void __init cmdline_table_adjust(void)
> +{
> +	char *args = cmdline_table_str;
> +	struct cpuidle_state *state;
> +	unsigned int i, state_count;
> +
> +	if (args[0] == '\0')
> +		/* The 'mwait-idle.table' module parameter was not specified */
> +		return;
> +
> +	/* Create a copy of the C-states table */
> +	for (i = 0;
> +	     i < ARRAY_SIZE(cmdline_states) && icpu.state_table[i].name[0];
> +	     i++)
> +		cmdline_states[i] = icpu.state_table[i];
> +
> +	state_count = i;
> +
> +	/*
> +	 * Adjust the C-states table copy with data from the 'mwait-idle.table'
> +	 * module parameter.
> +	 */
> +	while (args) {
> +		char *fields, *name, *val;
> +
> +		/*
> +		 * Get the next C-state definition, which is expected to be
> +		 * '<name>:<latency_us>:<target_residency_us>'. Treat "empty"
> +		 * fields as unchanged. For example,
> +		 * '<name>::<target_residency_us>' leaves the latency unchanged.
> +		 */
> +		args = get_cmdline_field(args, &fields, ',');
> +
> +		/* name */
> +		fields = get_cmdline_field(fields, &name, ':');
> +		if (!fields)
> +			goto error;
> +
> +		/* Find the C-state by its name */
> +		state = NULL;
> +		for (i = 0; i < state_count; i++) {
> +			if (!strcmp(name, cmdline_states[i].name)) {
> +				state = &cmdline_states[i];
> +				break;
> +			}
> +		}
> +
> +		if (!state) {
> +			printk(XENLOG_ERR PREFIX "C-state '%s' was not found\n",
> +			       name);
> +			continue;
> +		}
> +
> +		/* Latency */
> +		fields = get_cmdline_field(fields, &val, ':');
> +		if (!fields)
> +			goto error;
> +
> +		if (*val) {
> +			const char *end;
> +			unsigned long n = simple_strtoul(val, &end, 0);
> +
> +			state->exit_latency = n;
> +			if (*end || state->exit_latency != n)
> +				goto error;
> +		}
> +
> +		/* Target residency */
> +		fields = get_cmdline_field(fields, &val, ':');
> +
> +		if (*val) {
> +			const char *end;
> +			unsigned long n = simple_strtoul(val, &end, 0);
> +
> +			state->target_residency = n;
> +			if (*end || state->target_residency != n)
> +				goto error;
> +		}
> +
> +		/*
> +		 * Allow for 3 more fields, but ignore them. Helps to make
> +		 * possible future extensions of the cmdline format backward
> +		 * compatible.
> +		 */
> +		for (i = 0; fields && i < 3; i++) {
> +			fields = get_cmdline_field(fields, &val, ':');
> +			if (!fields)
> +				break;
> +		}
> +
> +		if (fields) {
> +			printk(XENLOG_ERR PREFIX
> +			       "Too many fields for C-state '%s'\n",
> +			       state->name);
> +			goto error;
> +		}
> +
> +		printk(XENLOG_INFO PREFIX
> +		       "C-state from cmdline: name=%s, latency=%u, residency=%u\n",
> +		       state->name, state->exit_latency, state->target_residency);
> +	}
> +
> +	/* Copy the adjusted C-states table back */
> +	for (i = 0; i < state_count; i++)
> +		icpu.state_table[i] = cmdline_states[i];
> +
> +	printk(XENLOG_INFO PREFIX
> +	       "Adjusted C-states with data from 'mwait-idle.table'\n");
> +	return;
> +
> + error:
> +	printk(PREFIX

XENLOG_ERR ahead of the prefix maybe?

Thanks, Roger.

