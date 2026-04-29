Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPWqDr/68WmElwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:34:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E04941DD
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297324.1573396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI46R-0004yk-HR; Wed, 29 Apr 2026 12:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297324.1573396; Wed, 29 Apr 2026 12:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI46R-0004wm-EN; Wed, 29 Apr 2026 12:33:19 +0000
Received: by outflank-mailman (input) for mailman id 1297324;
 Wed, 29 Apr 2026 12:33:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wI46Q-0004wg-36
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 12:33:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI46O-005Dpf-Ux
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 14:33:17 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f1fa85-5cb7-0a2a0a5109dd-0a2a4509d2e0-26
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:33:16 +0200
Received: from [40.107.201.15]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f1fa8b-2497-0a2a45090019-286bc90f1668-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:33:16 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6592.namprd03.prod.outlook.com (2603:10b6:510:bb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 12:33:12 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 12:33:12 +0000
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
 b=pyfM8j7btGxW3NY2LIfVdqBXKoEN00aNYgNuoac4ciGeGusq8Kk5sYhXehMuTPXN8b66O+gnn0TPOhJ6d0UIGGNA47nRD4Ie+9KFQLKLm07HsxOKJalL+bStkB7mzgO0pBJCN47c4oJMOmdYi3LbgTEyys5WZdFEArVvDg3buXwr7/0at42jUOU1XvbduHiYTverNp/RyMQ5ZjoqsxOf3T899LzpPVvFQxgnlv7BTevzKN//eybYG7R7nbPdm0NSU/mFP7pa0gV5K4foyUYbptaoCJxIQlLB+DWCh+728+gYwmtaTrOtGdYXkGbECB1VB93P3OcyoSK14UFhQJjXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIvJvTbzEKBS8m4ch60WjE2A62ME9OLbMuZVTJJhbMY=;
 b=nmZl0fbqwyCvvTnfYAwuuKF0MfYZoyXWXzxifl9FFUq70ykl48KfFiXwTAPFphGRI9RABgiayUh7CHRTHcTNpsl/YD/f02mk4Or/w4pq5R+RJdsNmDyyWXwFJpTJ8j+HNs4kfG761xw035q4KTwafEGZMAdV9wAweCngFrNkjoWK8hZEAhBDLgmIXyTYYAhl+OI71jpPViwseLi9f2mbT6grGwOYSQVRvNPs+Hz/OWU2Lwd5PW/DdmC2z2JWKt7x/DMmPohSEq6pYEP0mz5Yj1WI2/9l7vS7KNZOqDSD9XcKHgWf3Zj63f+xrVJwPxy6+CYlXqpEZ9xsZSyjTBaDlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIvJvTbzEKBS8m4ch60WjE2A62ME9OLbMuZVTJJhbMY=;
 b=YO8C3C+7Ov5scPynNlc0QE8/8ZKB5RQ2au7K/FqYoS6r/+Xz72xVvXUSgXmEU8bKK+q4K9CcKWlVWAhtFf1C1X7JNpu5kk8AW5khUEfwWHcVq4uWcOHXVxg0WxuMkd8V553IO1YypmMNYdLkYUuwDweop2yDERvqlvLwgAICheU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Apr 2026 14:33:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 15/17] hvmloader: Set MCFG in ACPI table
Message-ID: <afH6hfPLzCVUoXbR@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-16-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-16-thierry.escande@vates.tech>
X-ClientProxiedBy: MA3P292CA0018.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: d657a18c-7b58-4375-35ba-08dea5eb7a20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XWFIzSIFlyD+cAFPClmC99fwhV4PvrWuVMzed14gjIpFmK97CMuvd8t+s/zxH7f8OSim+15RiFvwFScvLYvFR9BR7RASoWDHx1qe23uJ7is24c0IQi7ET2EUQ72Z+kE4+pbqJ76RtAEE8gh8MsubtNeZeyHgu9g0iNxGpGGfidDC2VPW1sZDkGUa/JztyBf4fdTbRSg7JDr0HZyNQV/dSo9Sq/pfJcP6VAT9s1FunjWnOPIiiKh/ctVeJBdeQfhP8FicZUWerijc8bk9FVWhnnRyQHvpuyIQLRWKPpdeifrLlQ+uaHFnSwhNdPCei6H/Mgyq+dMg+udOKU3MkwqMPP9Gb0K4NBYjiYHvb2dA/ZFa9B9avuxzgElvdQNidju8sLUr5nqUWD2Lp3ynjmA+2u0+JoICy1LPY4MzP9VKfcObRQvUf6cGnUwwdm4Wpms4mNXf6EjLTTuxHcqQO3OzRPWihTHbHzYA2vVEeuhi1x4vDbo/zXCpzXwM+iARP1Q3fj0JpWHDUHUtc4VuGFte9AGmAsRuztmdkwqWFJQKaPwmy1zaPVEGRA978KK7Y+3q1Smfa+kXluokOUxo4GiUQi0z40cHYcOrNf6teGFtq3OKxABlLZghZ/NKNixSTrFSLTCtPTTqLb9QkCYvJ1UtSpN2j2zgZCcRJrtV/cMnFrSaSr4f/hPT5wNXHdJuJe6Gmmcvh6sJAIi24leTjQ1/iwTKYLOXlfzRUZE4g149Fi4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFZiSXVpT3dmNU1VRzRlNW9IckVPcUZ4TGFzZk1FZ3I0SlBVL2FPbm1Xd2dV?=
 =?utf-8?B?Vk4wa1NVK2JuZFlYM1VRRWtVaVBWOUNrSEROKzhFVVhUNTN6TE50anJETWRu?=
 =?utf-8?B?d0Uwd0FQaU0xaFU4MWUrNjBCVldxM2dvcy9kQUxJSm1iQWNKc3BabkI5OGE2?=
 =?utf-8?B?ckNrQThFRmtZSkhldXdGT2hmVGl4ZWlJRFNwVm5mdXBCUzhKOHhNazFST3Zr?=
 =?utf-8?B?RVI4aDJKZ3V2WGNXY3pUWDUyUDEzbHozaGo3Wmk4Qk81azBpNmRldCtUalVO?=
 =?utf-8?B?QktUT0J1U3JuSG1XQWFGUWpNRTJWeGMxWmJJeVdWZUVxb1pVTXZmWm1HV3J3?=
 =?utf-8?B?WSttYVltdkpkZHZqT1NjQ2xDR3pmRXN3L29QRUJjVHFVSDgyS1NMc2hJRStC?=
 =?utf-8?B?SkNjbjd3VjI2ZzhHQ2pjZ0tGWHpLK2FJdzJnS3ZUREVqWGdxbGZxbTExRkhp?=
 =?utf-8?B?Vk9yZC9VYVoyVmZ4UWM3VUFCdFFPSTlVRlUyRG1iT3VqK1F4RHhPak9IcmJ4?=
 =?utf-8?B?aWI4WmF1TStJcWlHTUwxaWZoalVYbzN3L3gwYnpLdmk4QS8xR0p4cExHMmo1?=
 =?utf-8?B?VWUvSFJiUG9QOXh2Mm5zRjJOME5TSXdMaEliTlN2QjdvVHNaQmxXQmkxblA3?=
 =?utf-8?B?OCt3N0dvc3U0cVVWd1hqalZ1S1Rlb0UwbFVndWlWeDgrU2hGcHh1YVZJMUsy?=
 =?utf-8?B?K0VJMXRYcmFHamlEUWVwVGNRc05VVW5pWEx4SUJ3WWNmbHlBQjNmQmFMNktD?=
 =?utf-8?B?MHU3TDNNMzZuVUdUbDBoaVhpSEEva1RhRDVEMHVNSmh1RTFEaDFGRXdudndn?=
 =?utf-8?B?ZGVTeUhYTFg2S2NUWUpHOUNNSWRXb2EycDZUR0pHSWJxL2hpMk5ya3ZhaFRJ?=
 =?utf-8?B?WXRyanYveTBVd1BIVHgwTDcwN251STV1eWdnOFpyK1NkM3hwek4zT1BwVHBn?=
 =?utf-8?B?aTg2NVFDVUFtYkZBaDhBRGpaQ1Y2U0IyVCtLd3FNMlp1SlV0djZHcXIyR0hK?=
 =?utf-8?B?UUViNWMvSWNCTk1wbEJCdys2aGY0Q3FOR3pqU2srUVE4bU52QXFmSHpzZFVL?=
 =?utf-8?B?QWpkd2wvK0ovRldrNE1CMkl6QU5vUE55VEl0dU1wV1J2U0ZELyt3elg2K09W?=
 =?utf-8?B?dWFDU1RjTmdTQlJ5bmxIR2xlVXVzZURTNFlEUG5TdkVqMEk0MStoYmRza1E2?=
 =?utf-8?B?RlZsR0duZEJicEE4RGgyNDhDcWlUMnBHcHEzb0xidVY5Vlh2cFdTTVI3Z1JQ?=
 =?utf-8?B?YW4xOUNmcHMwTWkvM1ZjQ3FTWjlNa2ZvaWxEOXFtSkMzUk5FS25kNEE4MU5o?=
 =?utf-8?B?bVgzdWJidjlsN2JqbjExbjh0MCtHRmF1aHBDTEZpcFh6S3E3R0NldjhiNlE3?=
 =?utf-8?B?ZUZVTjhGNFh5S05WOENhb2ExM0ZjYUdWR0tOcVNoNDJmdHZWdFArY2RhL1NF?=
 =?utf-8?B?NnRhNWV5TWpCQ1BXZ0htTEQyUW5ieDhsQTNoT2VYNExhdWpreThncGxxclRn?=
 =?utf-8?B?Qk9zaUlZdGwzZU9OT3JjeG9OemUxYUJIL3A1S254eDBtVFdWcC9qRVpIcUcy?=
 =?utf-8?B?MStEREdZY0ZzeHFEYVRVOWVNSVBBL0I4Qm13QytsSXAwamhyRUZsb2dKRmRQ?=
 =?utf-8?B?bXhlcUV1ZHNiazVFQlRKZHJ6QTdCSUVsMWtLSlhWKzREWFU1RlQvYnpUQ0da?=
 =?utf-8?B?Ry83TnFNNnBhSW9XTzIyQjYwTE5SYVoyeStDai93enZIRytrZ0Z3NlRnbjVj?=
 =?utf-8?B?emdOZldHTFFVb1lmc3JtMEpLYzJCL0QzSmdaaVd0b05oODhQZE1uYXVtNGxY?=
 =?utf-8?B?c2FHM1lSR1dKUDRYZmYybUZUSWhBUHVPQk50L01ZSjdoMFcxVHFzYUl5Q3Ru?=
 =?utf-8?B?cmJSNTZUWldKTUc3Mm1yK2VoMjgyOU91RnY0elZKSFFMSUlHdE5nVU43S3VJ?=
 =?utf-8?B?eVlqQW9QUlh0WlRrRXFiYUlRYzYxcGNaTklhVkVmd0lZRkN1d1VxTjRUUFBm?=
 =?utf-8?B?T3h0bHRjZnBFMld6aERiek5SSGpBSHRTVUJobXI5aWtERnU4cDBmbEhLd0xk?=
 =?utf-8?B?eWxtQ2NUNGdFOXNUanpWT2dNVmZaVjdkdGRvRGdXSXlGNnl3TzBnNXhKM2hh?=
 =?utf-8?B?UW43N01Rc1JkVTFqZXNnaHRwWE13Vi80bTBHaEhoWVNwQ3dNb2tVcEVSWTRs?=
 =?utf-8?B?RTlTZVdTYUFmUGx5WXNSdHdlelVXa1NUd042STBCd21VNm82Vit2dktiWng4?=
 =?utf-8?B?RGxTaE1qYUt2SDlvaHBHQkxYb1hQRXI3QUZBYURPVVVnS1dRV2VxRGVBUjYw?=
 =?utf-8?B?UWhEd0t1VjQ1RkxIcUcvS3F6NTY0T002TVhQN28wZE9oamhtTlNsQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d657a18c-7b58-4375-35ba-08dea5eb7a20
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 12:33:12.1173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65QuatiB/BmrfCSta+kfabU2MiCmHrMKcfB6eUgZm+P9UJuHlRSIFoq7oBOBkCT5opYS0A7Wq+WjSqWI9bZdIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6592
X-purgate-ID: tlsNG-bad1c0/1777465996-490B3A53-F8BF7BE7/0/0
X-purgate-type: clean
X-purgate-size: 1663
X-Rspamd-Queue-Id: B64E04941DD
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,macbook.local:mid];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
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

On Fri, Mar 13, 2026 at 04:35:05PM +0000, Thierry Escande wrote:
> This patch extends hvmloader_acpi_build_tables() to detect if MMCONFIG
> is available by obtaining its base address and size from the hypercall
> HVMOP_get_ecam_space and sets the flag ACPI_HAS_MCFG in the ACPI config
> if needed.
> 
> This also sets the MMCONFIG area in E820 map using the same method.
> 
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  tools/firmware/hvmloader/e820.c | 11 +++++++++++
>  tools/firmware/hvmloader/util.c |  9 +++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
> index 86d39544e8..ff5c270f57 100644
> --- a/tools/firmware/hvmloader/e820.c
> +++ b/tools/firmware/hvmloader/e820.c
> @@ -158,6 +158,8 @@ int build_e820_table(struct e820entry *e820,
>      unsigned long acpi_mem_end = acpi_enabled ?
>          ACPI_MEMORY_DYNAMIC_START + (acpi_pages_allocated() << PAGE_SHIFT) :
>          RESERVED_MEMBASE;
> +    uint64_t mmconfig_addr;
> +    uint32_t mmconfig_size;
>  
>      if ( !lowmem_reserved_base )
>              lowmem_reserved_base = 0xA0000;
> @@ -260,6 +262,15 @@ int build_e820_table(struct e820entry *e820,
>          nr++;
>      }
>  
> +    /* mark MMCONFIG area */
> +    if ( ! hvm_get_ecam_space(&mmconfig_addr, &mmconfig_size) )
             ^ extra space

However, having to query the hypervisor for something that has been
set by hvmloader itself seems very inefficient.  Just store the values
in global variables so they can be consumed from here?

Same for the usage below.

Thanks, Roger.

