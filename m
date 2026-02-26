Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CwkJo0doGmzfgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 11:16:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5C71A41EE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 11:16:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241387.1542438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvYQ2-0002X8-3w; Thu, 26 Feb 2026 10:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241387.1542438; Thu, 26 Feb 2026 10:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvYQ2-0002Uz-0x; Thu, 26 Feb 2026 10:16:30 +0000
Received: by outflank-mailman (input) for mailman id 1241387;
 Thu, 26 Feb 2026 10:16:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEVl=A6=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vvYQ1-0002Ut-5J
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 10:16:29 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3324e716-12fc-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 11:16:23 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5340.namprd03.prod.outlook.com (2603:10b6:5:24d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 10:16:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 10:16:18 +0000
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
X-Inumbo-ID: 3324e716-12fc-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0rg1OcKeHvCNz9KRFsUNw5iDLXIsUQhhZ5ppZqXECZlpfUmjn7LD+n0BOdNGfxDAX/lNxCkMaRkDTe5VzS3a2DJEnssO7HLk73+NEbMk3e1qwrx/OEst9htGFdkny47LoUHATJayhZeV6SDoHSk0+hGIMyoPl71oUwct0o9RlnloemI9UEt+Tx9vI6KaKgLAN3jDyd+roxnTJFye5z3DfjWv0eo8iitH4p+PLR41JExxkj/ekHhnIXgBub79QzCQ+xvmtmo6wT2VnwOJF8TpqBkhjp3I37DjglMOpcUMpNgm1pwBe+wNLkWTvy6o2s6gkpGdveBA5vucGMfxpmYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/Hi9Gj4Ebu+8NB+Omgb2Jhci6r4gNNVJo385G6jJ1g=;
 b=eP87jjF7bYW0Tpt6QImt9IMH8nLPOyB+PY+HasIDc0giSPYmb5koEAyaqeHYvpvrQnOhCb18LjUJeWd07wM0hGxqBgO9qIMolUvwSf7+h0UM2T6y2ad52oyx7cvqfZjxvd2thAGiRu0KH3EMZKBXN+Kudukx1Z4ZSiktWv6ARFvskDxJG7IDHHucwkihdBRYkRN08VZKR0SsrW6+ClAT1r1swmXh6iq4SKBOXn/pVCMleAK+nCKizaT5JyhdXTjYbCUQTCTDQDb6q6xA4+pzw14RUS3+ktmfIpJpYUQMPdfWwoTyYxYNOpSPAdI5+/ENwnvm09Li3BFcKt5Tx4N+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/Hi9Gj4Ebu+8NB+Omgb2Jhci6r4gNNVJo385G6jJ1g=;
 b=CQBRvtsTeoQhwd9395X/bUXaWNFaSnMHpwk0fcBcRV9MneMrPpTalgu7MeFQalg9gvn3oXJPoBZFG84ht3Nx65YPW1Ac0Ik4Xn7a+jLj6h5F5ZGKoZviAbGTnSF0GY4//DeP2LMvVpoO7DTjkejaa8WMhKtsydCn0o4oEjKwiE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f684c897-8147-4879-9dcd-6b130703fc70@citrix.com>
Date: Thu, 26 Feb 2026 10:16:15 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com
Subject: Re: [PATCH] x86: Remove x86 prefixed names from cpuinfo for amd.c
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260225094759.623258-1-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260225094759.623258-1-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0041.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5340:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b840cf-3072-4669-725e-08de75201504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	v+jbYhP5sD1myvDk1K0l9iG3FOpP06w5BNbJKXOX0et7axMYPY4nGjCEH3trRkev9EE+Wg2u5jjpvuNc068UoIrLYqwscSGf/Eo7ymhqO9sQKhBKWdczwMgva/nOI8NlccbyemHyCzQyhcdFvO2/XKpiDrKRS1wkqdogyJEg1NTQ6VFl0fLfyDJlliHH4wfUFp7f2YDZp7fFKos6umUc/JFyxrgsn2UnpwX5fhkA/lxgOG8vcAO0eAIuX6tWjVNBFOXyELYNnamELb3Lx0HKvnkQ9fOIzkZ1Bz0ygKd0m7lS9MQONAbI1Ofy5gesVTOP1I1v+QnJUi34iUB+oXVLn7d/rCTL4wELPI5CczC/FKOixwICkSmTSGEdKsRY78UAqppXKtnNtbTEqTgIQXRreVyY/t9l1YxiN0jhHm4RSP+XyHPamgN5gGOH+LFWB9WMQn+QxBtAXUyK3lCT/iL3r4Z+VeLrbRZWpAE/CYDPDcAXwZrQQBMTxntb2UjTCJRq0xjpVvBZcqr3BiPivHkh/DyIlUlJ4b3bcQM3Q8UI7fO0SaQFagB08ITnSe20dlOSAZvur5ztpbuk5NEncxWgyB3VbAbedXWhTQNjvdpgJ9ATDBdiPn3ABQT//moyWpO1CcC4vAKz0XLbI4Aow9CKIb5ZNsUG06ZMkyrA+LIocTgbIJL6pQ0+k/5OE3s48/dH6efy4Rsd+ixayiYLGqfcjs0qu9+gGD8EcvqvraRItPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTNCWmt3MWNEdEcvN3VjdmhTYkE5dnVzblBEUmpGdm9XeEhIeWh5c2tWMVVV?=
 =?utf-8?B?eENtb29BWHYyL2NRTUU2S2NJajRxaDNHcFRUYkpBU2llWGUzUTRDTGlmaEYr?=
 =?utf-8?B?Qytjd0NUMWFuNGtianJtQmsyQURIT0VTbGpjNllzeG9hL0ZXSnI3Z0VRM3NI?=
 =?utf-8?B?N1FsZzBBdEpHaEV3MkVUMVk4TU1Qa1M0UVQ5NmNELzJrM21qckw4RXNVWndE?=
 =?utf-8?B?RmlseElBcEE4T29uOXNUU05QQlNNeGsrbytxYlE5bzd6dDNNU1IzeFg4WDZI?=
 =?utf-8?B?VzdNeXhJTzYwQXYzNHlCaGR4T001dUJvcnI4N3hjQXhranJBZm0vWXJkWE00?=
 =?utf-8?B?YjlLVkdRVDhnM2VKc1g1SWFBdG8rUCttTnhqOXhaSFAvVWMzZzlDSDVXZFQx?=
 =?utf-8?B?dVJhYWVXNGhiNDBueE8rdkN3QWxmZ2hrT1lDU0wvZkU2L29aYWJXankzd1M3?=
 =?utf-8?B?UzU1T2VodUh5VjhITklCUTV0NHBRa1RYRXFKNTRHMi9IS2F5SHphSUE5R3JO?=
 =?utf-8?B?emlpR3A2Vk9WWmo5Umg4UUZROFVnWHdraDhaOW9NL2NPaStNREMrYjNXUXVX?=
 =?utf-8?B?SWpQTFZMMm4wMFpZQnN3dWV4NFFleFcwSzRWWmZSVVJSVXZHYTBYN2JvMUZ3?=
 =?utf-8?B?SmxEZHBtKzU0dGZNUXhwbXgrWUNzU0V6RWUzZjc4UWN0dktsZlVWem5KWWVX?=
 =?utf-8?B?Vk5XTHlNUnNPQ0JmRHpzWXFKWUZCVytGTnlqdEFpNFRYVlFoYnJoUm1lWi9N?=
 =?utf-8?B?eGtGamNpZ3hYaFg2Z1dWWDJTNUh4dVpmZy96U3RmV0FDa1FiVGRDMWQvV1Rp?=
 =?utf-8?B?bWxTZ3U0NE90aDNvOHBOK0hHOXFMYWppNDZUbVd4VWZnbXRBMC9hSTNVU3pG?=
 =?utf-8?B?TGNsMmpodno5ejZoQ0xwZUhyTzl3aWsyaVk3dkJJdG5YQnFtbTFGMW9mOFQ1?=
 =?utf-8?B?SHc2K215MWNCSnhld2l3bWFkRG5IRG1uTEYzZW5UbkhoVm9ITXNMb0U1S3JI?=
 =?utf-8?B?aUxSeW5BNXMxU01kamplNnhTaWdYUUZmQnpSM1ZicHhKZnloUHMzMU1DZHdX?=
 =?utf-8?B?ZURnZHQ1VHZNUVpGVDh4RUdWU1Y1NWVOeERpaHZ2VSswOUlteFlMOFkweDB1?=
 =?utf-8?B?RkE5ZUZ0WEdSbVNudnZxY3ZQSmsyL2YrT3diOVcxVzhSeUhDQXYrZUF5dzBC?=
 =?utf-8?B?Uyt4czVUVlNtUUIwMGYzWG5yK2haUGZaRFdkWmxWWS96dnZiUEc0TDlaMllj?=
 =?utf-8?B?WmRVcThUdHVBSDVzSUhTKzUwNmNDY0FITzR0NmFlWlpUMmxJVFkrL3ZyQURK?=
 =?utf-8?B?MC9VUXhML00xcXZOWk9SeTB2TWU5clFuQmhaQnFzS1FEVE9YOEFDYlBEVU92?=
 =?utf-8?B?MnV1R01vNWxhck1DMWg5Z1grUWgrTzdzbjRHb1ArTnpiVTdnUVI2YXErRFls?=
 =?utf-8?B?Ny9qODlZcGxMNjB3RXJhUmFtczhGc3EvTXRMK2oxUXNBNGxBQXUybXVnRlM2?=
 =?utf-8?B?YTE2N0ltc0ptUVR2dlJQazdDbmJXRU1EdTNwS2lSclRtdk5zbjNDa1FRN1dJ?=
 =?utf-8?B?dmY0UW1VWDg3S2dQSjV1VWJaZG4ydW9qU0wxeE1EQjVKLzJReWJhaDUzUnRE?=
 =?utf-8?B?bmc3ZDRlVlZtMnlZc3VXSVdtQ1FGN1cwZkxnaHRZbnJGNkgyYm9zcnFrK1Vl?=
 =?utf-8?B?elVmSUd1NTJKcG9kYncvRWtrRXhsZlgyNm5RcWc5a1JmeGhnV3F1NTRVRUoy?=
 =?utf-8?B?YUl1bjBoUkJHRVF2c1hoOG90VysvWWRkcTVKTVpPc04vVVBwbEtjOFNQQ1hx?=
 =?utf-8?B?N3paNzZTcnA1aDYxbEFGby9HRmNuY2dJN21WbWhhZHpSaCtUSFFUU01vQ0Jz?=
 =?utf-8?B?UUIyZzNnRjBHNmMzN3Y2VDhpM0l4aHRCYXFKd2trUU9tYVZQOWRJZTN0S2s3?=
 =?utf-8?B?R0NJMzNKc1JKZWQyOXl2ZEJhY1VEb3BsaStoMElGTTYzVzVFWUp4ZDFJRWNl?=
 =?utf-8?B?Z2FJS0dXanhsNnVEeGFPKy9OdmNrNGw2SndNMCtBUVFkSVZtZnlteXd3MVo2?=
 =?utf-8?B?YkpnMDlCaDdUbktUZWdqVEdtTWFSdG5iR1dDWUFGSUFLTTh3N042M2Erc0hU?=
 =?utf-8?B?ZVRmVm4wVGxVTXE5VGJzN2t0L09XZW1YZzczNTBNYW80TmRRSm5OalIrMUZT?=
 =?utf-8?B?MnZvL0xkZFI0dlRIUWx3OHNKdkhUMkVJLzFRYzFpSUxCOU9Ob2ZIYjZpMHhs?=
 =?utf-8?B?OFozSkF4MW5ycWFpR2JnZUlpYVByTXZxR3p0OGVpdzNLRVFnUUszK0ppQ1NY?=
 =?utf-8?B?bW9ubmJ1ekkxblF6Z2E2WVF4S3VMOUlIZU1oa1NuRHp6VkhaZmdlZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b840cf-3072-4669-725e-08de75201504
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:16:18.5887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzX+LPW192W9GqWNy/RolaaSeovK0hCAVGj9vKnaV9oXpezgcJVWUqbLE5RUEKLfv2ZCbg+UYdMZeSzAqgwi647uesgKZ7rjcplLdLpxufw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0D5C71A41EE
X-Rspamd-Action: no action

On 25/02/2026 9:47 am, Kevin Lampis wrote:
> And some AMD related code in emul-priv-op.c.
>
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
>
> No functional change.
>
> This work is part of making Xen safe for Intel family 18/19.
>
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

