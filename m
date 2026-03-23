Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOPgKIgnwWmbRAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:44:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E792F1612
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 12:44:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259250.1552554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dhB-0006N2-7r; Mon, 23 Mar 2026 11:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259250.1552554; Mon, 23 Mar 2026 11:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4dhB-0006LU-54; Mon, 23 Mar 2026 11:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1259250;
 Mon, 23 Mar 2026 11:43:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIW0=BX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1w4dhA-0006LO-9r
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 11:43:44 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011030.outbound.protection.outlook.com [52.101.57.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89ed20dd-26ad-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 12:43:41 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7732.namprd03.prod.outlook.com (2603:10b6:408:281::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 11:43:17 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 11:43:21 +0000
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
X-Inumbo-ID: 89ed20dd-26ad-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCNHQLzJ34zBcMFuFyWqV0d+SUJqVVnyqsYOAmIidsr5Hlg/9NomcuQW9eHm1Rn4wUgEZT8Iolg3BN+xXM7RQpHOvIf+YCSHuQUVTHPaJHtXVUqDtO/Rzpsux0Pa0gwhItiewTRs/6MzV4V80mav5/chdS3sCITJYisvxQSDqrxZr5i/Nt8ebH5ArE7eDGXivIPaA90U28IeTit1ljgsOc8lv1ZKKC0sn3kh8CgKscpunZTHxK1dxkRBCGzudEP+DOQ6Eihw9ss8p7gV3zr5zvG8ffrVoTrkPEn2t9DMR2ShGH+va4kKDxdOhlbZqUxApmhWN6XdsTwnzZpb1abMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNTTuv1mIpdoaYibkk8uRhnxo36W+PtBnwkguQRH78s=;
 b=TIVBUoQYyWtszcsf8okVIkgC5hicYx0zzv1ue/cCT96J24y16HYmSZUX7BgRAb/ze9xrcAlC694P0bGpEkO2Kazl91OLmM+gPBNLqcOh1T57kDPVq9G50W4g87MXz2yxSfFfD+CkyZaTQ9rM+o9byvwYbO1OYyEFrokLNR0MIJuCJxPNBMEDZT9Djoz98EdCDUNasY6urAjNJ4HYxE3wBTUunrzSYieqfPj6ZHSb0Cm8ay4+sYxJokBQIJIr/z3LXCgb1wihQxpwS/eYK+jvQ8cvVa/BUdlMDz4YzjBVZUUVTeK3PGFFUndRe0qUQ6E0mkWLAEhm1pLWRwMkJXQHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNTTuv1mIpdoaYibkk8uRhnxo36W+PtBnwkguQRH78s=;
 b=Wg+IupXO9ueLTOjrb2B5OUXlFaaeqAWP30LJQH38KCtBmxkvABm5HiYW6CjzoCXipvS3uG6kiCCbDPXpgMqjCHK2gKdwaylSqalPVNOpI2plH+SK2Om69+7jeYqk8Jk3EDOaB3DZ09geefxFY8E3kyhWcGth1c2TymeHNPsUYv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 Mar 2026 12:43:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/S3: restore MCE (APs) and add MTRR (BSP) init
Message-ID: <acEnZw1AS5F5G0y4@macbook.local>
References: <12fbad10-78ad-4679-a1db-3995e34da094@suse.com>
 <acEhF0NnlImMHwiO@macbook.local>
 <72f9adbe-6dab-4070-be20-3f40f3a37c2b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72f9adbe-6dab-4070-be20-3f40f3a37c2b@suse.com>
X-ClientProxiedBy: MA3P292CA0062.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 71432724-d25c-4bcf-d95b-08de88d16254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Y0KNplb1uQyE6wVgAP6uXC9l4BM3ofzoJ2HKyQD5zkK8CMxR5nCczlc5rdgsgp82xsKvtKXJXK9xIZoVhBQvdLiUqQWnTseM76r4VfSyOfgIuZeuwtuTTD2CahErN0imy5mh+XIG+pIyITkSHDFNb1OrmVvQTElOpeKoOi5WJ+p3CuyK6WduzYh1SfdK6rns3l6Lqjfop4Oppioma6BcDnYldwgu/oVNP9WIZVbdWC0GT3fIjK0JzvlFbPw4q1gwfiM5FLyf5XL4ZRaSzxcj4/zXBMrFMko0CJRjphMvEAb++CkObi4ibPcEXhrXWZ01ty7S5NAnuSU4Grdn64pEwf9NNopZdNomn1u/3WFHTozExAMmNDjHBdTWiwI0PYU4p0jXEfWdhIFa3On4nbYcSmf3uCzAOYMCIYGTASgONn72mDXLcvqw0xRm0loFZjevK4yNIaRmMsFqTybHSWE5/E8XNNdGidSpP2aXfAQJBUxKOecyR6E7Zqz2keeLHvCm6jjjaJ4te3jEZtzr+9T8YiWDhzdYNQtQ1kii72u0BYagpFl+5KvKIcW9iH8IZJ+aUjJjNTo4zG2jk9poF77H0mp7YxTBPdEcO35560zYbITvw2qEnY4aNm421pXD5E3Mnv9lf8N9f7J4M4XQcc73G1xaRZl3IhpWRQFu4toV4VucPNLnWpmnPvA8T6uXiwmIyqQ9C0wnwORIsUix97RiJj7tOHBiZ5EtqSXqLGOtRc0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0hSa1Bwd1VYcnZtY0loQnFqNzFzODhUdXRZM3NrL09BMXdpOEIraTYyR2RC?=
 =?utf-8?B?eDV0dlQrTEtESDA2N3V4NVkvVTg5RW9pR1RIWCt4Z0s2Y3lwVnFFQTAvdnFT?=
 =?utf-8?B?ZlJZSHdiRnRPNWIrV2xqV0V6dStCNG1xNWhySStkbG1Lenk3bXJQNllSZFJu?=
 =?utf-8?B?WjB1NklJbW9VeFVBdThTb3hoWDhzNlhSeDU0TXNjV1VHMWx2aS84TGdzWHFy?=
 =?utf-8?B?ZkRxNTBjblRmVnRHRVl5VkljbFNMek5Ld0YwVWtCWmRvc29VMWFvSURxS1VP?=
 =?utf-8?B?Q0VKTVdvb28vNWlKTU15RWNDL3laR1ZOVTd2M09QNVZJZlZ6eXl1UmhvTFRE?=
 =?utf-8?B?dGhsRHp1K3RYQnVkdDNMdWlEdGVmbU5taTVEVlZ5cGNSdVVBMlE4V3FZTWlX?=
 =?utf-8?B?N1dMVHBIUzc0WU9mdWpJb0lRNno0MVVXRG9jeXd4amlLTVFKVlJjUGxNbk1a?=
 =?utf-8?B?ODVtU1lyM0dhRVo1Ymo0Vk41eVVGVzZuWGM1Rk5aSHVEd0Z6MStDNjNBYjdF?=
 =?utf-8?B?cHg3cGdJek5QVTZjbkJKVm1NYVB6Y0RlOGhubmJoQm10VmRjRld3MXV5ZWFE?=
 =?utf-8?B?UEVzdVlyZUpkTjFVWURTeUp2M0V0MWxpWi81UUMxWnVTMzBYR3crWWxBUVB0?=
 =?utf-8?B?c3lMOGg2NkpWdlZRQ1VZak12aGtpbVkzYmk1RTFLaUtITDZwTlMyRThrY1Ez?=
 =?utf-8?B?M3dOZFZsU3lQRHUrZmp6TmtuaXpuYTJHWmI3Vjg4TThJT1QrQXhxTGpBZmtl?=
 =?utf-8?B?Z1IzY282QUV3a2hkQk9qSmFjdnQwRUpPTU1WOTU5YUgvZTRtLzJpWFN5bDlQ?=
 =?utf-8?B?WlJ0VXhjN2JQOHc3V0NDQ2M4V2ZzdGkrZ0JQNzhqcEtSNjlVYzM4NnYzTWd6?=
 =?utf-8?B?eDFYSWhvY014dTYrYVBJWiszNlo0cjR5UG4wdjZmVExmZmVEbmZXY25yKzVi?=
 =?utf-8?B?cURaRk1Yc1JpTXczS2NxV2tBbFBOREJCQlBEVVN4UWtib2pZc1NOdDFqZ3VN?=
 =?utf-8?B?RFhoY3BNVllQemM4WWRTQ3g0eWxKVWlzS2JIcU5DaTRCNHdvT0dpTUQ4K2VH?=
 =?utf-8?B?bndpRzRBYWl0YnRhVGZkczF6VVNzcXRBOUdLVHJKZWJ2NUUvUklQWFhiUzlR?=
 =?utf-8?B?L3l2MEZFaTgyTktWM2Y2QnlSUlNaOC9QaFlKbk9ucHo0RHhWMXdVMkF0b0dD?=
 =?utf-8?B?U2xHMVdiVFMvL3l4Tll5YXlzZkppQkxOK3AyNHpJeGxnejRDM3c5dmhSL0FY?=
 =?utf-8?B?SWFKVDNJR0wzR3V4TjVQV3JtY3lnc1YyRFVLOXk3djNQYURPelk2V1hWU3ho?=
 =?utf-8?B?TXRTTjJXK0tMQjh5NlB3TEpGazI3WGFJajNCbU1uK2NVbTIzd1pJS0ZzVHFO?=
 =?utf-8?B?ZlNIK0JqWGh0a0VVdFNpbVBSTW9CdDVjelU5K0tnSGs4a21pUGxjNk9Qamwy?=
 =?utf-8?B?eStGdW1zZG9Ud1JqcSsxamc3eWtZdnhwOGQyTE9lNnk1aVBsS1dlSFdEbzlh?=
 =?utf-8?B?bmhPVGJGSVZWWkpvcnI0bnJDZzltVGFTRFZXUXRJK3lycnp6eTNtYWpvVEM0?=
 =?utf-8?B?OGhGRGlEdWtaNlQwQ0NTNzhMbzRtU0NxOExHK1ZWdksvSjUyTG9wWUtCNWlT?=
 =?utf-8?B?UG1mREhPSG5MZEJZSzJXQnNIbWJGSHRZUXo4QWM2cmVTZFlQbU9LcWg1REhs?=
 =?utf-8?B?Z1FDcU91MWNjcjN1eUV1UXppRlR1MUloMzJzV3M4ZXVvMWRJOGJUVXFWTUly?=
 =?utf-8?B?ZjlqTk5aVGhlQWwzWjlTU2Qxb3MvckZXRld2dXNOT2djNlpuK21aMnNjQU11?=
 =?utf-8?B?d3hmRk1TdjFqVWNsWkVzemhyd29rNG5YUk5IWWg0YVFGaXNkUU40Vkh4R29R?=
 =?utf-8?B?UHIwZjEzMXMxTTVSazNqSStGVlJpbEs1ZU93RVdTNTFUUWpwSWtncXc0ZmUy?=
 =?utf-8?B?OEJMR2E4MzFZYkFmUWp3VDZXL1VKbkk2UkRja2NOTVF6NDRWZFI2V2tOdGN1?=
 =?utf-8?B?NnF6OTREZFh2TW9Sd2ZqK1BFL1Z4b0UxcmRzcllDbnFqamVELy9OZVplV2oz?=
 =?utf-8?B?RXpaWlYwZzM3MGtmYkN4QjFiTVRRNVpXOGk4MzZpbEx4ZE9MRCtJcnQrVE03?=
 =?utf-8?B?cExKMTVwVE5zZGl3N1RSbDh1ZmVvYTd2UVJSVDE3ZjkwV085RVorQ0c1Z3pt?=
 =?utf-8?B?NjRsVEFlR24vWUxtYjEyYysyVVRJb0tBSGJyam1aUkF3NHVDRUt3VmhUdnpl?=
 =?utf-8?B?TDRhOFVTTmZ0NFF4RFNKUUk2Zzd4ME9mOGxrUWtMYkowMUgwcE5sRUY4STUy?=
 =?utf-8?B?YkR3V0lzUUNJWFlnY0JhVTRTR3puL1dUQk1kUWUvd2dDVjJLcDc0QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71432724-d25c-4bcf-d95b-08de88d16254
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:43:21.4355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aR304GMbJZPDg+GwmhxVECclfXmATzag7A4VT5hwO/zs8tHFa2ruUUTplCPWKG15hPmuxHixQj+1F+GowRL5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7732
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,macbook.local:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 15E792F1612
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 12:38:48PM +0100, Jan Beulich wrote:
> On 23.03.2026 12:16, Roger Pau Monné wrote:
> > On Wed, Mar 04, 2026 at 02:39:01PM +0100, Jan Beulich wrote:
> >> MCE init for APs was broken when CPU feature re-checking was added. MTRR
> >> (re)init for the BSP looks to never have been there on the resume path.
> > 
> > I'm not sure the statement about MTRR init is correct, AFAICT
> > mtrr_aps_sync_end() will also re-init the MTRRs on the BSP, and hence
> > the added mtrr_ap_init() seems to duplicate what's already done in
> > mtrr_aps_sync_end().
> 
> Hmm, right you are. Had I been asked, I would have confirmed that I checked
> the code past the "enable_cpu" label, but clearly I must not have, or I was
> blind at that time. Let me strip that out.
> 
> >> --- a/xen/arch/x86/cpu/common.c
> >> +++ b/xen/arch/x86/cpu/common.c
> >> @@ -642,16 +642,21 @@ void identify_cpu(struct cpuinfo_x86 *c)
> >>  			       smp_processor_id());
> >>  	}
> >>  
> >> -	if (system_state == SYS_STATE_resume)
> >> -		return;
> >> +	if (system_state == SYS_STATE_resume) {
> >> +		unsigned int cpu = smp_processor_id();
> >>  
> >> +		if (cpu)
> >> +			mcheck_init(&cpu_data[cpu], false);
> >> +		else /* Yes, the BSP needs to use the AP function here. */
> >> +			mtrr_ap_init();
> > 
> > For symmetry with the BSP path, is it really needed to init MCE so
> > early for the BSP by calling it directly in enter_state(), or could it
> > also be done here?
> 
> To be honest, I would put the question the other way around: Is it really
> okay to do it this late for APs (during boot also for the BSP [1])? Iirc
> an #MC prior to mcheck_init() is going to be deadly to the system. Moving
> it earlier may, however, be a more intrusive change.

We might want to at least add a note to document this asymmetric
initialization between the BSP and the APs at least?

I would be perfectly happy with moving this earlier, and it needs to
be consistent between the APs and the BSP.

Thanks, Roger.

