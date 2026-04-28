Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOCbHnCO8Gl4UwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 12:39:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC15B482C7A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 12:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295571.1572234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHfqb-0006N3-Cv; Tue, 28 Apr 2026 10:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295571.1572234; Tue, 28 Apr 2026 10:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHfqb-0006KX-9v; Tue, 28 Apr 2026 10:39:21 +0000
Received: by outflank-mailman (input) for mailman id 1295571;
 Tue, 28 Apr 2026 10:39:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHfqZ-0006KR-VB
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 10:39:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHfqZ-00FdCZ-C1
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 12:39:19 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f08e4f-5cb7-0a2a0a5109dd-0a2a45019c1e-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 12:39:18 +0200
Received: from [40.107.208.21]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f08e50-c1f2-0a2a45010019-286bd015918d-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 12:39:14 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA1PR03MB8263.namprd03.prod.outlook.com (2603:10b6:208:5af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.28; Tue, 28 Apr
 2026 10:39:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 10:39:11 +0000
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
 b=ObeP+bLMvvF03rCUFnBjJTaExIUipBAPsmvd/4i+wOWiLimCpyD1VZ+S9lISqz01+Gju8VQ74bQgtIa6Im270JD6c/JvNAMDsDvzTKAwlVsmaTW1OUwAEymTEFgpaIo6nFZ5rJfXG3xHl0QXsgKxyfS/9yf9F06zttiAC0yUn5XunZ9cpQhwxFUffqB6+INxX0Ctu5sUVQGoJ+UzUsbyYdUfJzM2zhltNvoKISwJKLXqhxUbLXCQNGb3zn4eykeWLvukRzjyhMEKP/ZU6aG4OGxrtX5i7w4m4R29/VNa4lxKpds9XOe9QB+Y9d5sw+r4RGY2W03VzhKQNTCOLSsnuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IkM6DYJPWEOkk4zTRWkdbZ5Vl5qZPKJws+9gqBpxn8=;
 b=rEbOoikp3spN8Vd+S2sjJfYNgIbGWPy0gsAdbKc3kPSGPj7caF3c5Ekdmuj0Bsyxb86wz1ilxOtBWZ66drtB6LOdyav7rUUf1T0RFVxVvp+fzKnpLZdHIpfexzo2ej2BJtNlO2t83EXbbkA1gmHAQESBqPH8PfomGqfv4mjlD7xVipUNXwWC2yXZANhC1aqwzKJ4zBpCCTjCPImAJAHmTusoJKevyKHo7nqKwGY2PTZ/+H/crLi9bt6hovlKp0BSFiLegk7HvIq26+S5aZk9JhASPPs/IPtWCWWZxADeh3F/LqH9j06E0y62OV3b48rMuYC1X2mZlUsSvPDDeTNxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IkM6DYJPWEOkk4zTRWkdbZ5Vl5qZPKJws+9gqBpxn8=;
 b=mgDUDnJbyo1JlMzgTTgTBeVinL040zNZosDfZeeDd/7oE0y4Z3bJ2ES6vkSLwhnE5xMOrRaxAaTlNj1J7osFtdvsn1InzcPs3+B5eB0Mxf9/odsMoK1adwFIz2t9akb6dWKdtKK+UVvlHzrki5oMEYOMFNTGS48nh9L83Tobtcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Apr 2026 12:39:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 03/17] hvmloader: add function to set the emulated
 machine type (i440/Q35)
Message-ID: <afCOS0Ufbk790t8J@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-4-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-4-thierry.escande@vates.tech>
X-ClientProxiedBy: MR1P264CA0168.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA1PR03MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad62503-90b6-468a-c160-08dea512622b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	B1yEYcCf3O3ulTIPNSmmQp7QngHdlhmac+TIJSolEUkj2xeQo8A5qFAlEpGv6i7mLfvWSywV0YjVBpit8l16Ab8PIqkS+7eeUFfpa8s5yvWJa9wdNRmh3vXzyttEpPtF/nM2bC+T1XdehEkUx0adhBvReSjytdj80T+LyZkllUOk/+qKBNGGGg5Wi++6Eil6+aBPUg6/tBMeVJyZAaskrXCJkF6JIRicjhGi7ouOjaXCwue7PtFIhJLJWXCXEku5mU5El8immnXhx6l7co4G98wlhj2KEjbUkw8FBedB2qAlAai16bG55rt9Nru+MjBXzo8dSvFKt1qQs5VUbZK1VQCk6iGi9dFkLqRbYM6zaNnTq44USxrphfjlNO8DajYQP7I6CI0Aq+3sg6nEAGB+46HJUsYhatE42V/Bh4EBKH4d1Pwd/u/2Wxr09oT2cLwzTWw/WYA97s4pjKw6uEBystuHBunkDCLXFRo7zxyaRE+exlajsMKNJwdxY70nSfS8YzR3IxYrfokXAenkpMicVbNwbWBvSvMlKVki1oj2+ZVSP/EHCkwP5hd4Y5h+rcqVduhG5lqH9pBY0fBjTVqPkVmReUAMjlRj3PgiSyKSvUroydIiy2r2FTPjeIKiigeQDl6WbDrZxDc9mLKZoSnYmZKcjh7S3imci6uV7RqvN8SX5Xj8fGtSyjTl7KShnzci5Cn03ijTlgTwukFrJxcQJIvY96qLWfcTz8YKp4NMdQ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFVJMnlZdjAyZWJuYkwvbXU0YWlxQ2hyL3hXNCtaTjFWMWFEbk1GMEVseWtF?=
 =?utf-8?B?NDZUenNRbFdoSkREdDFDV1JEYnFDVHdtSStDeW9tOGdEMGRvbnRZMnBCM0p5?=
 =?utf-8?B?M2lEb2ZzM1E4RnBMWkhXWk9oQ3lqQ2J4Z2Zja1J2WktKZUp1ekNYWHVkVFBz?=
 =?utf-8?B?WGg4bXE4Z0tQeExoa2cyZ0JSQ0h4bGFBbWtobm1hTDJCY1dQdEJqNnFWOGdN?=
 =?utf-8?B?MHFadTlvbkExVWM5Z0dFOHFSZ1VReVBqTkZVV1o5S3dFNllYa3V6QitIQmtL?=
 =?utf-8?B?RzR6TXVua2FhMldCKzhFU0ZHcHhhdGJpeFIxUEZ4Y0w5MDdZblc5UklnU2VX?=
 =?utf-8?B?S0hUWTV2aW9XdUVpY1dERnRuTXdXTENFbGx3OVRKSXZ0d0xUWHFkeUJPY2ZS?=
 =?utf-8?B?QTBDZnd3WWhpdmFXMndtWmZvTjRPMXJOTEhmemVQeFdoRWE0SCs0dHRyMGxF?=
 =?utf-8?B?cGIxM1dQRXZab0pLWG9SNDFkemM5Z3JBUnVlYU5kZm16Vk5wZU5IdkZSZ0J4?=
 =?utf-8?B?bGVKMjhoS2ZrTDVQVWllRGJ1WVhTZmdqYUxnMTFpV0I0SDh2OVlZWXFNSXM5?=
 =?utf-8?B?V0xVTWExc1lyR2Q3a1dWSGtJOS9jaGRQRUJLOGRaODRkY1pxdDRPcDhjaVhr?=
 =?utf-8?B?OGxxKzZkaWtkQXNFTFo2VXVhMkd5S3BRczVmVy9wd0gybDFLNEZpWVJ6ZFFT?=
 =?utf-8?B?c1RvNmpzUkdzREw2UnZzN0tvUm9Ebm0wc3hOUlAycDB4Y01DbG5IOE9nRElz?=
 =?utf-8?B?OUJQaDc4Wk93aFpldktNRmE0a0o5cGZJNVEyanRRM3JCZzIzSDgzdWFkTjdx?=
 =?utf-8?B?RjZjamhUaWRtc1ZUTUVRNEJTWkZwaHd1UmpCWTBGNE4waXpNSStrL2llSXpZ?=
 =?utf-8?B?SVBmeGhoSThpMS9uWVoyOEh6VUlPbHB3Mkk0NFd5azg1cTdLWnZMZHJheGpO?=
 =?utf-8?B?RmM4OU5Ob3IrTzZqNk9LTk5BaHFyREZtVlQyRHZSRm5CM2VjZmFpbFMwbmhI?=
 =?utf-8?B?M08wTXhjOHE4c1RHeC81bHBOTElsMVZEVEtIdmI2cElEVG43Ykl5MHdUVVBS?=
 =?utf-8?B?ZlMwNWgzNUNEUERyNGxDQmxqMHQ5OHhqTys4NHdnYkxYMFBJaHIwOVE1VHVy?=
 =?utf-8?B?YmFoWkFoZzlVYWtmVkY1TVlNWWFPdVI2ZkpYbXFra2Y3dHZ3QmZGSW9kZ2gw?=
 =?utf-8?B?Tll3aEt2bDdwVTcrYUZJZDduMXdoNElqZlhOOGJCOHp6eWJCM2VmMzBBRzRs?=
 =?utf-8?B?YmtWdkNNUDdmeU16L1YwNlJnWDhqYmtTU040MWJ4QU5HK3BJRXMxS2xQcmE5?=
 =?utf-8?B?Z3U0Q1RWMXNQbTRWY1hMcmpKNDVWZEtrWmFkTU5zSVV0NkVBS1ZvZzhncHAr?=
 =?utf-8?B?THBSakFLUkpUQWZ1Q3h3aHVQWkczWncxMGdJYktxV0RaY0lvQWJSMXcwdm1U?=
 =?utf-8?B?WUlOY1FYSTJCSTBQL3NCeFVnYURGMHBFS3NmR0UxbFgxQm45cXhVZVdPSlRW?=
 =?utf-8?B?N003bkhRN0ZJazFtYUduNkEyYnFSWTNRR2tXZ04xTDVNb0o4MkdET3FZR1kz?=
 =?utf-8?B?bXR0V0hLSHl0dlBnMVdRcVJCVEk3cGNaVERRZ01RSjRpUW94bzh0cHNYc2lh?=
 =?utf-8?B?OHpxbTFOT3FuUXRoUThydlcvdmM4TjFaUmJQSW4wVFVoRjJESXcwTTFNS29P?=
 =?utf-8?B?emtOZkRwdXBnV2VWQkp6K2dudE9jaklFaVY3WkdBSmxPNzZmcUllcElrdm45?=
 =?utf-8?B?NUlIVTVkUHE1K0ZFbTNKVGk4bjBBVW5kNktGc1hLRFRNUm5ZMTBoSEhVbFpw?=
 =?utf-8?B?NkxrUy9PeXgzZmNGSXc3OVhHeDRiWk50TlJ6Q1E5WW5wYjJSVzlXb2lSYW9L?=
 =?utf-8?B?U0k5cmNEZ01SZi9aR3JrL3I4ZVY3S09nN085SFQ4V1JiK3prTkZyLzZtWUxp?=
 =?utf-8?B?NFNHbUdzYU5oYXZFS1ZZWS9qSVp6OC9DdDExNU1tcmFIWndsUVJaaE84bmVX?=
 =?utf-8?B?VkhwY1hnRkFFMk5sczBhQ3FvdVlqeTNEZ2w2TzM4T1JTWTdpOHRCZ250bXY5?=
 =?utf-8?B?Z3lIeUhNS05YeVFPSkZ4eTN2eDNBRjE2TGlCQVA4bTZ0R3QvWmdYc3p1Y0lG?=
 =?utf-8?B?VjM1dkU2MmJ0dmtYL1pOdTR2R0RVOFc4TFR5NjF3RURPRG4yVEVJT1NMUjYy?=
 =?utf-8?B?aHBwZXg1Zzhyamt2NjBVRno2dmhNU1JYUThBYUtZUFBOUjkzanozWVlhaWw4?=
 =?utf-8?B?RzFYenU4SzZKN2szcFk2ZHdpMm0vZWQzOVpZUTZ4MVQ5VmVXcDdPd2NjNlo3?=
 =?utf-8?B?aHBqbC9TNHRMdkVraXlSUEdITGdHWGpDZ002M0tDRDdMaTMxTDJaQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad62503-90b6-468a-c160-08dea512622b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 10:39:11.0309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADfxTkibjmOTSxm5iU5iMoriQ+JlnLhpHa7AKOzCk6ZiwlLJ23Oo22j1uh+wWev0B2+JqHyp/sEpTCYsYS5WPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8263
X-purgate-ID: tlsNG-d62444/1777372754-B4A11FF4-F6B51C6D/0/0
X-purgate-type: clean
X-purgate-size: 4034
X-Rspamd-Queue-Id: CC15B482C7A
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,citrix.com,vates.tech,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
> This adds a new function init_pc_machine_type() which allows to
> determine and set the emulated chipset type. Possible values are
> MACHINE_TYPE_I440 and MACHINE_TYPE_Q35 and stored in the global variable
> machine_type.
> 
> The machine_type variable will be used from multiple places in following
> commits.

Is this initialization something that OVMF or SeaBIOS also does?
(maybe not for Xen ATM)

Asking myself because as said earlier we want to possibly get rid of
hvmloader, plus we will want ECAM support in PVH at some point.

> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>

Same as previous patch, if the first SoB is from Alexey the From:
(patch author) should also match.

> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  tools/firmware/hvmloader/hvmloader.c |  2 ++
>  tools/firmware/hvmloader/pci_regs.h  |  4 +++
>  tools/firmware/hvmloader/util.c      | 42 ++++++++++++++++++++++++++++
>  tools/firmware/hvmloader/util.h      | 11 ++++++++
>  4 files changed, 59 insertions(+)
> 
> diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
> index 6d23150fc9..626cc53649 100644
> --- a/tools/firmware/hvmloader/hvmloader.c
> +++ b/tools/firmware/hvmloader/hvmloader.c
> @@ -332,6 +332,8 @@ int main(void)
>  
>      init_hypercalls();
>  
> +    init_pc_machine_type();
> +
>      memory_map_setup();
>  
>      xenbus_setup();
> diff --git a/tools/firmware/hvmloader/pci_regs.h b/tools/firmware/hvmloader/pci_regs.h
> index 7bf2d873ab..4d4dc0cd01 100644
> --- a/tools/firmware/hvmloader/pci_regs.h
> +++ b/tools/firmware/hvmloader/pci_regs.h
> @@ -107,6 +107,10 @@
>  
>  #define PCI_INTEL_OPREGION 0xfc /* 4 bits */
>  
> +#define PCI_VENDOR_ID_INTEL              0x8086
> +#define PCI_DEVICE_ID_INTEL_82441        0x1237
> +#define PCI_DEVICE_ID_INTEL_Q35_MCH      0x29c0

In Xen we have a separate file for vendor and device IDs, called
pci_ids.h.  Maybe it would be better to use a similar approach in
hvmloader, and keep pci_regs.h only containing PCI register offsets.

> +
>  #endif /* __HVMLOADER_PCI_REGS_H__ */
>  
>  /*
> diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
> index f1ed1eb48d..f9116bea4d 100644
> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -22,6 +22,7 @@
>  #include "hypercall.h"
>  #include "ctype.h"
>  #include "vnuma.h"
> +#include "pci_regs.h"
>  #include <acpi2_0.h>
>  #include <libacpi.h>
>  #include <stdint.h>
> @@ -648,6 +649,47 @@ void __bug(const char *file, int line)
>      crash();
>  }
>  
> +machine_type_t machine_type;
> +
> +void init_pc_machine_type(void)

Since detection is done based on PCI device IDs, it might be better
placed in pci.c, and so you don't need to include pci_regs.h in
util.c.

> +{
> +    uint16_t vendor_id;
> +    uint16_t device_id;
> +
> +    if ( machine_type != MACHINE_TYPE_UNDEFINED )
> +        return;
> +
> +    vendor_id = pci_readw(0, PCI_VENDOR_ID);
> +    device_id = pci_readw(0, PCI_DEVICE_ID);
> +
> +    /* only Intel platforms are emulated currently */
> +    if ( vendor_id != PCI_VENDOR_ID_INTEL )
> +        goto error;
> +
> +    switch ( device_id )
> +    {
> +    case PCI_DEVICE_ID_INTEL_82441:
> +        machine_type = MACHINE_TYPE_I440;
> +        printf("Detected i440 chipset\n");
> +        break;
> +
> +    case PCI_DEVICE_ID_INTEL_Q35_MCH:
> +        machine_type = MACHINE_TYPE_Q35;
> +        printf("Detected Q35 chipset\n");
> +        break;
> +
> +    default:
> +        goto error;
> +    }
> +
> +    return;
> +
> +error:
> +    printf("Unknown emulated chipset encountered, VID=%04Xh, DID=%04Xh\n",

We don't usually use the h suffix in hex numbers in hvmloader, it's
more common to prefix them with 0x, so I would recommend to use the %#06x
formatter instead.

Thanks, Roger.

