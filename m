Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCUNGQkzp2kjfwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 20:14:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB051F5C3A
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 20:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245026.1544377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxVB5-0002QY-Nf; Tue, 03 Mar 2026 19:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245026.1544377; Tue, 03 Mar 2026 19:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxVB5-0002NR-Kd; Tue, 03 Mar 2026 19:13:07 +0000
Received: by outflank-mailman (input) for mailman id 1245026;
 Tue, 03 Mar 2026 19:13:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KsTL=BD=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vxVB4-0002NL-0u
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 19:13:06 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc11022c-1734-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 20:12:57 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5503.namprd03.prod.outlook.com (2603:10b6:a03:288::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 19:12:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 19:12:53 +0000
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
X-Inumbo-ID: fc11022c-1734-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckPV2KqLhvv0gr4XgNi6DxkH6OB3k1a1bMQddtC6JHPwVrjZEnXwJvE6rUCkJCEuo6u83R1upYugu0LITpJiHwN436c2RynaJjyybbUqDJw7jtsThQtNXwUzDJbOVIpPZqKhDtKoLJDFIrNOY8fXPJukp6Kg0kFR87QM/2DOOMCc59/sE4wywPlzHjDDyw3y5x6s1VwSKMvXBq5yHf2OcHTwKO1hfQxKwsey5i9lx0vHevBIk9XzX8hF+AX3J0HCvVvylyn8fW56Lzc9mKtjcQufAu1zDuMecYbNQsE2D0HqAfyE1WJ9Q8Qj/ezpYtoXXWIcwx6gB2Sy0rNSddsDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzg/aIEl53JUjWu/8td9aBPGZTL2UamZUBY7hTm/Bio=;
 b=nRBjflV4iXkbgy8HppncOdzN4XZXuzSl2NJ6eIOu9yFzVq62mjhFixW88zZUfa5S5SMw1J/C37EDndC0bCA+Aqn/BIVGTRQF3NBkoabxrMLsxamAMtJ7MpozqHomg5qnlX/E1ayiJTOZ3L92n70c00aJqP9+v6mJex5cbCPI4XWSQkdZtSKsXvP7kE/C2Pwf/UY9kGy6bWisIr7LSECWQh5FHyf7acRl6tjrYCgPyjBQxLRrIhvo4sJS2VtMeCrXduGygU3wSuA0H/SphLC8XJQVAdblHukIj7mi3zKeAhVAh672ynrv68r0gkTbeK8nPU110oiHuPvEDKdz+uopfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzg/aIEl53JUjWu/8td9aBPGZTL2UamZUBY7hTm/Bio=;
 b=sdA+YwiAKtoqLtjxE0arX9atF68UBuiW4fDsqDgV3NQ2XVwhRWWY1ZcNDkYfKInLAJlfSzNZPd4Dej7pWr5TUJ5zJtqeIUD1HKgiOOV7qMvBZMCLOpFBHBXcQZwN/+iS13/MKE9W1sW2DPwmzYKlIWMdA2yidbOYQrFX4CsdSJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3db44102-66c2-475b-8588-960ad774ee73@citrix.com>
Date: Tue, 3 Mar 2026 19:12:49 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com
Subject: Re: [PATCH] x86: Remove x86 prefixed names from mcheck code
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260302191900.672460-1-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260302191900.672460-1-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0412.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: 074ad2d5-2e73-4cfc-3dd7-08de7958de60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	INDE3bGrAXpbFRk8yEaJN3lxyfJ1PlbYTVkpSxWF8wLRggHLtgwg8eBBrjrDQy1yEeYZgPR5GINYurhiAO/02vhQTkfFAAUzrSH274didbAzDEMIZ1QVluWGtPGNbRCBYBE01WzmgjTGzEAyQyUcpIdSKkF1hAV+2Lw+GWyORcWx1TGt/HgjxIB+0M4IGYvbmqKZrKF7j/8FWpDT/NjKQgWW96cYXOb4DnoxOq90QcFuYynL/RmI4URJyGf3yYrnvGn05N/j18FHkfCvJN0ibxEFaMOeWQzBcUxha1c76rOl7enZgHJ66v3wKJ5FMdQtLAJY2UnRMBI+4jhNmG3yZc+E+INPMdif8MORs3EZUFkz3xu/Tt+e3aQ8xl30NgO2L3M1uXSg/nyJoddZa6yzsu2Uj4wIRx9Lmo3bwkngDbF/eT3uLP3BAwePpYDbfm481C4gQlrMsCnokyBIokwRNYkrUNfHaMNDfdIzURJsNBrrq8mvV4v+P2i4eZDEfQuosQu8nJp/8yzFnPYwQLoWrOLk1XSsQUjVqcSz+29WfGN+TUEWcpHhM7ri3ol4jjORJbycQdpYu2vj9qycLdX6XZFD3RHp7Ac5+2uGpOT5B8KtQ8SiollbZ4UfMnqgvUHgw07Yw68PXxD70c9/vzV6WoSo+3OnPXGHUbDUaFkGO/tqD+HQnbtDrPs07+nOpfePQw51FsncxVfLZc+8M+xqqKeFJ3gCGLj4ONg9elb1cYg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlRCMG8zNGRjYWd0RXowUUx0dGdwS21yYzdyUi8rK1VaTnI0dDRucVM4aldF?=
 =?utf-8?B?T1BmaXNvRGt1WjZMTGVDai9JV1RZL2RpN0FidXVySy80NXFDUzk1aXFWVmpk?=
 =?utf-8?B?SDEyUlo1NVlEMVRxaERsUGRxQzdGN2RnRzNJc3B2SU1DYjhOZ09CSUVqQzNW?=
 =?utf-8?B?Q3ZvSDgxTFQ4cXRGR2EwNlZiZE5VUHlTK3RqQU1wdG9ISnBnelFmVkYzdU5w?=
 =?utf-8?B?L3JMSUZNb2JQaldIYjlMVW9zRnVsbmp1VEV3VVZ0SU1JMzlJbDZ2THRjT29n?=
 =?utf-8?B?aFhMVWwrWEltQk5keWlyUGFzcWlpM3d2OXEvTUdncTBlSkFMUWYvWFNOMHlr?=
 =?utf-8?B?TWpmODdMVTN1ZldRc2lOdHphZStZT25ZaXZMTDJDd0dvQkhHUFNtQjdLZ1Fp?=
 =?utf-8?B?c0lOSlBGamhERWlYTHl6dnh3bE9QMzRZVmZ0NVJMQlI4QWxoOHY3dkRmcTJB?=
 =?utf-8?B?NmJIOXordmVqeHZyZVZQcHpmeWpSS2VqWWdleHFzY2RRZVVLbGFXQVNoQ09O?=
 =?utf-8?B?UzJ6T01kMUFTV2c1WDgxT2s0WFYyWUp5MjVhSi9iMnErdDUvWjlNNHY3NVZ5?=
 =?utf-8?B?djFIbStLQ1VhWDgyd1RaM2tBS0h2QXdVd0JQb3N4TXJpWFkwejY0VFJQWU1x?=
 =?utf-8?B?am0rYU9PNVFRbVpFUEgvTFpWMzltOWFRb2RCVWc0d1ptaUVQSmlVaERKaEJD?=
 =?utf-8?B?eUZFaVRvbDZTQU1kR3VHVXo5MUd2aXJuNjNneFZtb3dOYWRBZEpxSnNyalRI?=
 =?utf-8?B?YW9SdWZYM3pESkdoUEV4ZUllVHZyNGliSXFTUldWZEI1MngvVXNWSnpYL2Q5?=
 =?utf-8?B?VERETGRGbmJkWHZqcVd2ei8reW9XdU9rZHcyM05qU3YyMG9SWE45RXNoaFhh?=
 =?utf-8?B?THhScENZOExuRE1oMDlGVk1yWGdRam1wR3oxbGJIelo0dnd1SjZhZXkyMHpz?=
 =?utf-8?B?bWlJdXlnUVBKQWNmdm0yaHhBVnZZclA0N3lwMVI3elIxSzVWZVRveEVvbjlp?=
 =?utf-8?B?d0ZreWJUYm9DTEMxWndtOThXd1J3UzN3QkpTajFKMnplS1BtbHM4alF1Rkcv?=
 =?utf-8?B?NXh4ZjExWXU0b04vcTBxRHlaV1pPVS9tYkZwRGIxVjBFcm1ldndoQ20zcUQv?=
 =?utf-8?B?bnoxb0lETjUvSWFGUnZJeEZKMHZYdUY4Wmk4T2MvOWQ1em5Cd1VQdGJHY0VG?=
 =?utf-8?B?WVExUU9WbElzV0VYSEVleityQ1lYTGl2UlpsVG5ySUJxU3U1UXBCMXMzUmJu?=
 =?utf-8?B?M0h5clpnTFZlb3AvNys4aDREemsraXIrMWptWFBpQ1pxUGR3ekFyL1p1LzVu?=
 =?utf-8?B?ckNLaWRMREFqSFFXUVU5V3lRclBDN2M5SXJyOHVZRk5HQm5MWk1Sdk9aa0pX?=
 =?utf-8?B?MmdzSm9mYThHblZrcG5FN0pKUThsSEpjRU1MUWh4eHJEcERkV051R1ZGcUxG?=
 =?utf-8?B?dnlZbCt1SUVLdXcrd3A5TXl0amxuaWZzZ2M1T093OFczOTZUUm9LeXR6bHRO?=
 =?utf-8?B?QXJDNVhZWnVQUHQ5RGcvVGVSK2R4TzJ4SWdBSlZqaUlXYlVjNDdtSkVsSFNX?=
 =?utf-8?B?QjV0UDUyQTFwc2orYmdMMnFudEJQb3FFK3RwZ0F2b2tGV1IzVXU2VEZPNldp?=
 =?utf-8?B?RHpQdThBQm16akFqOVozRGhTNVhIaGY4UEJuNWFQbHkydVlPN1lCbXNXSXZE?=
 =?utf-8?B?WTkzZy9WMVVjakcrcmNjOXBEWkEvYzV1c0IvZ1owbTc0S1RWSnhCeERheHQ5?=
 =?utf-8?B?NmpEVFFlRXhXVFM4Zms1UzhHY0ZOSC9RWU1TT1NzTll5WnVQYnNzZUk0emEz?=
 =?utf-8?B?dFhSZVFteWdMOGYxZFg1MHpxakIvR1FwbEpKeHhMNW9EUS9PN2F0VGJJLzZO?=
 =?utf-8?B?d2g5cnI0MVJYNFJWMzV1SkNUbjF2clQ3RWc3Sk1IK3ZXK2RUUm9sTGR0Mjlz?=
 =?utf-8?B?K0Q0blZXZ1NqK2hvc25JZ0RuUEtndmI3dTYycEZaZWMyK0lKVWxkZTRKa3JS?=
 =?utf-8?B?Q2NFMmdSV2xuTDYrVElsYW9mdkI5cXVhTUVQTVpWa1BBVHIxb3NTdlZBN09L?=
 =?utf-8?B?SGhHbWhXVTE5YkZySGJTZlpCM24rTXp6Z0VQR3BUbk5iTlNjMlR0MldUYTd1?=
 =?utf-8?B?Yjd2SW5sNjBqNVRrVkZ0dWhoMExHSEJ6MDRPbGtmV2ZmNnRjZ28rNHpYTFk0?=
 =?utf-8?B?Q093dkJ4R2dkS0dtekoyWVhINGdQcUhOalROOTdxREhTdEdabThKZTd5Nms2?=
 =?utf-8?B?bFBJeE5zOEdpbXJpNWZQeWkwVWNMQkZSMDFLU1FDUkdBWlhoUVBkN1hqUkVG?=
 =?utf-8?B?OC9NSmtkUWl1ZzNzNUtFaHY1QysweW5EWlJya3NOMnVWVVI4Nm5Mdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074ad2d5-2e73-4cfc-3dd7-08de7958de60
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 19:12:52.8940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0O1Pxxsx8xdJjkoPDmZb9sREcnWYKeWxyZUiqlyTY+tgYQ2QKGrrnvE+GNGMxahJ+WQ5Or82W+MjwdZ+G670N98eLzmqcnVy6/1sU8Kvfw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5503
X-Rspamd-Queue-Id: BEB051F5C3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 02/03/2026 7:19 pm, Kevin Lampis wrote:
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
> ---
>
> In xen/arch/x86/cpu/mcheck/mce.c: mcheck_init(...)
> Xen only calls `intel_mcheck_init(...)` if family is 6 or 15.
>
> Linux only calls `mce_intel_feature_init(...)` if family != 5.
>
> Do we need to do something like extend this switch statement in
> `mcheck_init(...)` to include family 18 and 19?

Yes, we will want to include 18/19.

The Machine Check infrastructure in the Pentium was very primitive, but
everything 6 and later should be fine.  I think we'll want to switch to
the Linux form here.

>
>
> In xen/arch/x86/cpu/mcheck/mce.c: mce_firstbank(...)
> The check
>   c->family == 6 && c->vendor == X86_VENDOR_INTEL && c->model < 0x1a
>
> could be re-written as
>   c->vfm >= INTEL_PENTIUM_PRO && c->vfm < INTEL_NEHALEM_EP
>
> I don't know if that would be better.

There's a subtlety.  This suggestion is for ...

> diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
> index 9a91807cfb..10e826e3a6 100644
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -564,8 +564,8 @@ bool mce_available(const struct cpuinfo_x86 *c)
>   */
>  unsigned int mce_firstbank(struct cpuinfo_x86 *c)
>  {
> -    return c->x86 == 6 &&
> -           c->x86_vendor == X86_VENDOR_INTEL && c->x86_model < 0x1a;
> +    return c->family == 6 &&
> +           c->vendor == X86_VENDOR_INTEL && c->model < 0x1a;

... here, but you've made a related change ...

> diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
> index 839a0e5ba9..9100ce0f6c 100644
> --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
> +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
> @@ -711,10 +711,7 @@ static bool mce_is_broadcast(struct cpuinfo_x86 *c)
>       * DisplayFamily_DisplayModel encoding of 06H_EH and above,
>       * a MCA signal is broadcast to all logical processors in the system
>       */
> -    if ( c->x86_vendor == X86_VENDOR_INTEL && c->x86 == 6 &&
> -         c->x86_model >= 0xe )
> -        return true;
> -    return false;
> +    return c->vfm >= INTEL_CORE_YONAH;

... here.

It's not safe to have a single inequality like this, unless you're
absolutely certain you're inside a c->vendor==$ME region.

In both cases here you're replacing a vendor check, suggesting that we
might not be within a suitably guarded region.  mce_firstbank() does
seem to be used from common code.  mce_is_broadcast() OTOH does look to
be fully within an Intel-only region.


Otherwise, The vendor encoding in the higher bits will make a false
positive/negative match on one side of the inequality.

It is safe to use c->vfm >= FOO && v->vfm <= BAR, because constants of
another vendor will not be captured.

~Andrew

