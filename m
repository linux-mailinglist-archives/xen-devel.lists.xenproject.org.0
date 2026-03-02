Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO38OMqqpWmpDgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:20:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF771DBB2E
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:20:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244320.1543760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx54M-0000ng-4R; Mon, 02 Mar 2026 15:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244320.1543760; Mon, 02 Mar 2026 15:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx54L-0000lW-W7; Mon, 02 Mar 2026 15:20:25 +0000
Received: by outflank-mailman (input) for mailman id 1244320;
 Mon, 02 Mar 2026 15:20:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OlTG=BC=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vx54K-0000lQ-Lz
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:20:24 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5413e994-164b-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 16:20:22 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7836.namprd03.prod.outlook.com (2603:10b6:610:24d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 15:20:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 15:20:17 +0000
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
X-Inumbo-ID: 5413e994-164b-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCVQmWzyHfIo486Eu4WQRMNKDu5qqMMeQ+ZVVwHMCnmQKSnRq79yZ/+SEPGakf5ZPm6AySOzmO0eIB+P90EBBGHgEmD/yQGtY37zb0PYKadHEzfF9Rg79SmASWfN6qAq9ReE8PEseXYgOOhNCuEa+/z0UT7kwjkv4dKBuChlK1scjBCwBmRAjQkoUQbh44dL7KU1IDvB3rwtlfzG3QMIRvUCLLTxhpSsnguEtm1yWteDpojgX9dp1mdHgMzVym6N+tlq+sTE6jv8BctcETW6kSE0/hUvuDYUeL2fb/oQNX7cF5lf1IE8OAWAovAL0j1e52JTnUB+JLWlcTFM6kkiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wOCTqxj/1SxmDnjiqGn6uc06WnJkoCDJt/Ihes/upw=;
 b=B/9uMl39sSPTd1MU4LsmrUdaevR7VYFC+70+49uJco2w2gvsXH8v0LpVkys9pQadPYa5164eDU6xHzZXX6RAPkk9sldujPCK8Xd+mZqsjmrUyWWd5ca9vu5NqDYmjohE6/atlLKfap6CxxCZJm6UYjuUXgG0pQvav5X3kB+qYqHFIWbCrPEuJolWZO+AILPK7QgpKiCafkf6vJMihqBWt+o5iOsFiKToEHwOet/dk3v4NnHGw7BUgegNUMYtLq0aX7Ru5VVxCz9mf3c3LdgAQXZGakcvPbLgSx529LUxrpJKqy8XtGcD71eU3vvPmxbYVBue3kK6rtxJgbEpT2roVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wOCTqxj/1SxmDnjiqGn6uc06WnJkoCDJt/Ihes/upw=;
 b=RKLtHFfQNDyTN2XEjE4N38Xl9skIAWHIQbGRcbcglcNBj07EHuSHREye/Lt3U8VmQmEBcFRVdO42NcsRW+1ALd+izMq4Wdgb2Ib50cwW9y+mJKulMP6l9E/6wt4DgHh/uXKl3R6SyXQAhPQRftN3H8K2PqmvEfU5PV/UJqP7nTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c0455659-b160-4e34-adda-cbaafb942f51@citrix.com>
Date: Mon, 2 Mar 2026 15:20:14 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 04/14] x86/boot: Document the ordering dependency of
 _svm_cpu_up()
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-5-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260227231636.3955109-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6592c5-3487-47c5-a4ce-08de786f360d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	ztzEAuidVpFfrBHAGuausN+x0kxBNuWrnt45ncDMpWKPiO9tFUdruwESCNndEMs3enRLzwaj05X0NUSVrnsSREcPfCBDlT5dPSdTgsKQMccBDENPS91V+tpQWv54Hc0YbkoIoynvdw7uRkXGXa/I1NwBxC2KL5t6sxYHboA+G9IprMpMxNbRbBbUZnygxSJV4O5I8Bik2xsBsfboBCyqZuwFme8W9aBlPdUHk460Z7L7M3N786/uXugryHB1wdbTQtHu0P0eL2QhwPk4LGYNXeALAQQEA37V7Wu4uVCYbQXnjvN1ZuLmd8PqcGLIBCihpLUGQiz9++ETosAXZ1Gh1wBNpjW028ytCMbpMQ2+u1RJVnVdfFYpx2YDr5nzCcr5zzf8Pirv7g3YaMKoY1GL7cbRQtH50OtRqHqh5v4lx2g+z4OLqgeUwMwGAm/UID5fWoVKCFUSMQCkt35q9mSUoKjNmfVDJoB46xCiLHdogULt5fRTplEdEYFp+aqlxXAWsn54KoT7pddkAPmy0bFAILJHa2X6FFkuDp692Dt4u3DEznD4QuDKcBuQqeP8mRa5FThm8I9HdtVnSjnK/MlVqp3f+OuLNcaNvcaw3YRbrEj+T1WfJFHUZVdSnmTwo3s0fMRcKnAOGBIJCVFqa4le5LS6oiLnohfZkMHSTTsJJsMbj/+TD2dLR4v2nI6dOb+xvOKDviSL+xpDaJv3dvRBs5+gTnqhk3/5bquJh6zx6Fc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZS9lUGxzd0w5VjQybkNYQWJuWHhMWUhXa1BXR05ydHJLNHdYQnVyaUwzdDEw?=
 =?utf-8?B?WkZrSHRhc3dabGt3NXFVY1h0ZHNXMUdnaWRpV2MvNW4vblVXaCtmZDJJS2RI?=
 =?utf-8?B?L29jNGw1d1gxZm5VekRiL1Y3ZDlYYmJWSUYxd05SNjVKS2lmeXB1MVg3Um9w?=
 =?utf-8?B?NmxjeitRUmcwMlBnczNqN01BbWt6N0lBK1lEcDNIMnRSL1dPT2l5bWZIay9r?=
 =?utf-8?B?Yms1cTVrNE12bVhOTjRvZ2N6bDhWMlNtWWxXVFZSUHE5UnRFTEY2QUJVK1l3?=
 =?utf-8?B?RWdxbnd1MGhrbGhncGxZRWFHYU9yTVA1NVBTZ0paZGNRMnI4QjNtdFZJWlZR?=
 =?utf-8?B?SG4rWUxEd251cEpxTnRhOFZCdHZ0OHJOdVdTRTU4Ymc2N2RXNjVQb1h2Tkk1?=
 =?utf-8?B?L1RuQ2UyeVNpU3NCZzZ4NXhlN2hWQW5tWTkxNFFyTTVUQWZnT21HREdNbWRQ?=
 =?utf-8?B?S3VZdWxRTFY4d2dkb0tZK3lTc3BSanFWN01qQ29zbVNUSytmSjE4NzU0SXVN?=
 =?utf-8?B?ZVA1QXIwZTdld2VPQ1ByWWNkdjdVMGxKQlVvcFN6UGNwQXZleW82ajdZZGMx?=
 =?utf-8?B?Q0NDTGJVVGd4RkQxNEZjRFMrbm5mcHNTbWVva3ZUV2pFSWcxK08rd2txQmg5?=
 =?utf-8?B?L0liTFY5VUc5Ump4dWNCVWh5L2Q1KzlOY252WmNpb1lWdXJvL3VCYjJKWDJK?=
 =?utf-8?B?ZURTcVMwdXRUZjdRVWpNQWhYUjJqUzkxZ3oyMk9yeE9FamUyM1dKOFo2WGds?=
 =?utf-8?B?WWFwUnhKM0FvTnpDdlVPZ25BRVpzbDVsdmo2L0d0Ukd4MUhlZUhnNjd2aUZi?=
 =?utf-8?B?d1JtYWUrR0x0Y1hUWm42ZHk0NzF4MmlyU3JsUXJ3SWw5WXd5S1YvcUEzMVI0?=
 =?utf-8?B?bnRVbDVtMXA5cHp4RFBHZGNURW93c0doUzA5QXVLZzcxZnlZMTBUd1g0T0ZL?=
 =?utf-8?B?cGVaajBrRHlvMlR4L2R0R1YvQjZQMlhkVDJLU2IxV0RNVnp5RWZtTmJ0WlZC?=
 =?utf-8?B?R2JOdWhxUG80TmJQVHNjRldtRC9xRG5mNTFvOWZka1FFTndVbVFxWmNkZEw0?=
 =?utf-8?B?ZmQzcGRCbUdVODhGcXFNRy9ZWU9SdGt4ZWNVTU1JT1AwRHhNOXBBRE5wR20v?=
 =?utf-8?B?VnJJY1NSSmtsaVFtTmpvMDZ0eHMxck1BcUVsT0p3R3ptZGttR1JacXp1K2ZZ?=
 =?utf-8?B?ZndlOXJYZkJhS0htS0FkNVJ5bkEwMjNXbFVvMEhiaVpOK2NsZmZnWGprRU5V?=
 =?utf-8?B?dkVGRG9uNFhmWjV6dnpDUGk0bEpXak9NNEtpcG56ckcyVjg4bVdqVHVaejFY?=
 =?utf-8?B?dVZwT0s0RlB1M2JJR1F6NFBPaFZDcVBHT0hXOTlXQmFTeTJWM0ZwV1VhUXh0?=
 =?utf-8?B?OHlFeFowN3hKRlZVZmlhcTRxZE1tQm5WcE54MWxieTdxSlFINnlwTnlxSVYy?=
 =?utf-8?B?bFhscjhrWWlQS0JERTR0R3Rkc0VaQWg4T1J6RnNxWUcvTkgrNmNCS0xrU0Na?=
 =?utf-8?B?TUhLVUNtUEdwQXRqNEl2Tm5wajNwYXBGZEVkWXB0ekFCeGN3ZGNxUktrL3dl?=
 =?utf-8?B?aW4vQXUzZUh6QnNQaU13bEVYRllsaEtEN3B3ZE1IY3R0OWdxbnEvbFRMS1pV?=
 =?utf-8?B?Um5zbU8vMVcwWGJSdUFoNWxJRW1tK0kwOFg4ZURrL2R0c2NxRGhLanlyWDhF?=
 =?utf-8?B?TVlGSVZqVUFZVkFodXFyTHFjcklFdDlvbFFXU25KZFhUeFFWc3FwL2ZYeWVh?=
 =?utf-8?B?cXBNL2xyNW0zZjZObVlBbE9NYWtVT21LcUplMmxHVnNvKzNsWnRZeCtIWUVt?=
 =?utf-8?B?QXRDUVJRSk1NakRKWnExMmp2b1Y5b2FvRHR4c2ozZnFCSXFRblhKb3VneXpR?=
 =?utf-8?B?dDJJYkFZV2NVSXVWNnhzVUc0M1ZuT3dKblpLUEFXSVQ5aVlReEVicFE5Y09E?=
 =?utf-8?B?MzIzTXhIUEFsVDdHemFqTVRqOVF4cFVuWHZXbkVtZDYxc0NJNGtzNk91dG00?=
 =?utf-8?B?VFoza0gyUms1bW12M3N6ZmlHY2dMZ2pINU84dmFJbzZzZU41Szl0MWZFL2VX?=
 =?utf-8?B?MEI2OFFiL0g1Sm1naVNTTENtaVlDbStJaDk5aHNDd3Y1VUM0MGcxNVRwaWEx?=
 =?utf-8?B?VkhuWENPdG5UemhnamRncHgreFFOT09VQis1MkowaTRpbTZOcnFCMmVneTAy?=
 =?utf-8?B?aEs4RkljYUdGeGt0N1c1c2xwazExb2ZhdjMrblh0Q0ZPWUdqSWdzekQ5MnBF?=
 =?utf-8?B?NW9OTGZHZFBXZlhsZFBLVDdBV1dKWWFsUVl6cXAzd0x3K2N2RnVlblhLNFVz?=
 =?utf-8?B?VmNjN1htNkJMNGlvY1NyOWFNNFpYL3hWU2I0VkQ1c3VNYWx5UGY5QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6592c5-3487-47c5-a4ce-08de786f360d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:20:17.8348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FG6QsstMdgRmenaFGgdANWvJy4G/9rq5uR4l2SZNIrZ4RBg+0DHo3gadY5wy2jWtmEhUdhEfvl7hjvmT6oiMQyJatU5/XRgW7ImWS0/DygI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7836
X-Rspamd-Queue-Id: 5CF771DBB2E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim,citrix.com:email,citrix.com:mid,suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 27/02/2026 11:16 pm, Andrew Cooper wrote:
> Lets just say this took an unreasoanble amount of time and effort to track
> down, when trying to move traps_init() earlier during boot.
>
> When the SYSCALL linkage MSRs are not configured ahead of _svm_cpu_up() on the
> BSP, the first context switch into PV uses svm_load_segs() and clobbers the
> later-set-up linkage with the 0's cached here, causing hypercalls issues by
> the PV guest to enter at 0 in supervisor mode on the user stack.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
>
> v4:
>  * New
>
> It occurs to me that it's not actually 0's we cache here.  It's whatever
> context was left from prior to Xen.  We still don't reliably clean unused
> MSRs.
> ---
>  xen/arch/x86/hvm/svm/svm.c | 16 ++++++++++++++++
>  xen/arch/x86/setup.c       |  2 +-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 18ba837738c6..f1e02d919cae 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -35,6 +35,7 @@
>  #include <asm/p2m.h>
>  #include <asm/paging.h>
>  #include <asm/processor.h>
> +#include <asm/traps.h>
>  #include <asm/vm_event.h>
>  #include <asm/x86_emulate.h>
>  
> @@ -1581,6 +1582,21 @@ static int _svm_cpu_up(bool bsp)
>      /* Initialize OSVW bits to be used by guests */
>      svm_host_osvw_init();
>  
> +    /*
> +     * VMSAVE writes out the current full FS, GS, LDTR and TR segments, and
> +     * the GS_SHADOW, SYSENTER and SYSCALL linkage MSRs.
> +     *
> +     * The segment data gets modified by the svm_load_segs() optimisation for
> +     * PV context switches, but all values get reloaded at that point, as well
> +     * as during context switch from SVM.
> +     *
> +     * If PV guests are available (and FRED is not in use), it is critical
> +     * that the SYSCALL linkage MSRs been configured at this juncture.
> +     */
> +    ASSERT(opt_fred >= 0); /* Confirm that FRED-ness has been resolved */
> +    if ( IS_ENABLED(CONFIG_PV) && !opt_fred )
> +        ASSERT(rdmsr(MSR_LSTAR));

It has occurred to me that this is subtly wrong.  While FRED doesn't use
LSTAR/SFMASK, it does reuse STAR.

So this needs to be:

    if ( IS_ENABLED(CONFIG_PV) )
        ASSERT(rdmsr(MSR_STAR));

with the include dropped, as the final sentence adjusted to say "even
with FRED".

~Andrew

