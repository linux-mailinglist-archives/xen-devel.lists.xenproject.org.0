Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E074AB67E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 09:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266525.460207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGzGt-0002Ks-Re; Mon, 07 Feb 2022 08:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266525.460207; Mon, 07 Feb 2022 08:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGzGt-0002Hi-OF; Mon, 07 Feb 2022 08:21:15 +0000
Received: by outflank-mailman (input) for mailman id 266525;
 Mon, 07 Feb 2022 08:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nGzGs-0002Hc-HT
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 08:21:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e988459f-87ee-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 09:21:13 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-RYPd-Z1KNluAVQgnyDyi6A-1; Mon, 07 Feb 2022 09:21:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB7130.eurprd04.prod.outlook.com (2603:10a6:10:123::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 08:21:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 08:21:10 +0000
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
X-Inumbo-ID: e988459f-87ee-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644222073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mTscNh/07aaJzB8pmmM9mgW6InXgsKWxhdU4rgAVIqw=;
	b=VDKcjzgsrbvwO9QpcJntshOxaJeWVbvzjAH6MNdwa+EhpYqoyfjP+IPkW0Wp4u7lqtRMVI
	pGi3KScFyvEIKhL1WrSEsQhE/GPZILxVZwXNmskQizzB8NnxeHZUh9plJtMeleEIRxwxaA
	G2yw2gR+iY3IrIcCORfxIie565TCZo0=
X-MC-Unique: RYPd-Z1KNluAVQgnyDyi6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTltv12dAhhfy7nlhftL8xwjQDuQBgTQkAnK4hXaO10Bv4yfLJYKSLYCnPgxlHeCsf9RwZECCKJsKUq/6MGf+FYnHmuwcJToXaxKnNFYq1HRoxI6k35wzmtb3Cp9NU5Wc8pZHC1s3vbw4/jwNYnarJcaVjomLQR6fhT1wnSNIYGD3wu1ulTu/BjSlWziQgjAI7LFE2Yaq1bpCWyl67S5kTB/qe/s6gIyR20EEfVAt+C6638hiApMU3jBuWOsATcN9c0/HhEoyjoKJFgfOTwRgyPG7CJki+kPYLerHmnWP+uEtKvWzvSi1JDke6+OA2w0q04f253ZyMvs8TnO8O2j5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTscNh/07aaJzB8pmmM9mgW6InXgsKWxhdU4rgAVIqw=;
 b=gCA+vkv5Su90lOlBXDA70uyjkvmuVowO6oAa2HPq9Z0dCMSoBJAKyv6v8thsl6JemrT7mHv3m8M6wHo0+fhMM37oMfx+CVup90Wo5UzSonLWVDJy5KNfzd2GkiHSFjFMNWID0+OujIEHm/SZgIJeKbMSqQ/cSLQl+zwrvrYBdcZAvBU5S4aGQO9IST35DiSX4LS7QrczE8ebA+TXH9dw9CGUptaeH5fiRe9+akaOCMGVmoHCc+np5FblAknjMz5xHyA/5PI8TGMcxNGahiBxklmq/4i+37yj4prll0sAwlYCdgcVhMKrfSFD8bdr1aK9tcWHybXPcgwRxjTJzGw/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10266b94-7399-2f76-24e8-57ac6a1ac258@suse.com>
Date: Mon, 7 Feb 2022 09:21:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dom0/pvh: fix processing softirqs during memory map
 population
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220205101806.35927-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220205101806.35927-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0069.eurprd07.prod.outlook.com
 (2603:10a6:203:2::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b7176ed-6a01-4ed6-55d9-08d9ea12cbcb
X-MS-TrafficTypeDiagnostic: DB8PR04MB7130:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB7130F0A909154F0991704FD1B32C9@DB8PR04MB7130.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1LVMg2FecOt4bgFIq6VKyzb1BmHenCGIXnft0AdIRqoD7HYlfQHaahDpXyrf/esdzvBwbG/VjYbUqkNyVk6k4QZq/v5SrlFbR0BiqircXCe8iCfDnFuCEmlGN0szPA/ZAgvHa+Bh834iMP3GD+Gt5PBGtu4tLoXD4MDrCoxoGTM1Ba3f2L8KBz9+XrhOEPmEI0Ne/WuF7b1McKnHFD8/AYDza7w3FIskQppPB/o7peiwv2yakIWjuNFyfLEgTZpi+St/XPilifOXsdYRFZmsz/9ZUzpf+0ts1y8mGKtoghK5EzAxwNfll5ly+D7ZhRz40Xk2dBE0gvdatwljUA3UrSPg2EvkhtA7hFHr8W9YvKnZ6jswTnS7MFAZUZOxXnSlJONPnwEjUOzSUeXcaNBkEsyFJvzRIrKxcxicKAXza1P5M4VKR0+o29nr/eJG7RmU3QthFeeN29wHVWKFFTvQTADIxk9xkLWqoA+sLjR12eHxB9YoDpMbrtdQCOH2YnccCfV6WW2fjsfo748UbvAyR7JPzRRhu4By9XKT8oOqzj98VEx07OviEDKzSsXO45fY+AHWqVMxkWPVxHsrsxkK6VbtX5pxnMa+djFj2UnDvs7ibss5Hjl41TxPfCc+9/wGA9zEJEe8bBCMRMxsHe6oOtMQfiviZL7BP7XV+/EeLJ/LQPkEpWZD4rMe2wEC3j0VenyFGQG0G0FNzKX18klNzYsB7cqGz82tWET+7ZhIcWg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(54906003)(38100700002)(8936002)(8676002)(66476007)(4326008)(66556008)(316002)(66946007)(6916009)(83380400001)(2906002)(5660300002)(6486002)(2616005)(6506007)(508600001)(6512007)(31686004)(26005)(53546011)(186003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1pVdExpRjdIUExPYjdlZVE3bEtPelVGa0s2azlDNFJOdUEyakw1RzdwNVA4?=
 =?utf-8?B?MktLZzlIMzhzQ29rc3Q5eHpEOVArM0ZIR04rVzEyOWpCV3F4azdUWlJhbVVw?=
 =?utf-8?B?SEZSZFdtUnpUMkVCbURYN3ZkYTYwaWRpQ2RIL0d2NlZIdjZNN1FUa0tDa2dz?=
 =?utf-8?B?TW9abVppcC8rWFpKMnl2T1FudGFYREh6SHpDa1VwNSt2dlNPbVZsMGMwaHZB?=
 =?utf-8?B?YlV6Y3o1R2RwZWcxVU4yYm12UkkrdEh0N0hVYU9lUDIyZzlzWVdUSUs0amUw?=
 =?utf-8?B?YkhCbXVhUTM5YUphSjNrSVVWZ2prTWFlTlBudXQwTjV4RGdZNkxRa1NkaGpJ?=
 =?utf-8?B?d1JYRWhVUWxoNkdhN0ZyRmtFd2Zjdk8wSVJxSWkrNFRJdkpnWXlBbHlSdVRN?=
 =?utf-8?B?bStPTGgvUkZGWUV3Y0I2NzkxK1o5QTJoWmRJOENLVFhDRXJNWTkwWWNRTzBs?=
 =?utf-8?B?Sm1WVUJNZ0dUT0VSMDRNSFV1b0psLytWNEdOWjVCaDFBV0ttSDNoQnhBSE1r?=
 =?utf-8?B?RkVWZEZnVVBwS1FsWEp4YU1kV2Q0eVFpNE9aZHVMWVBMdkxQMG11WTJsbDRm?=
 =?utf-8?B?ckkvVUdKYTdINWVROEhMVWlPMHVxRjFZaHRLK0V4T3gxdkpvb0xiR3lHUnAy?=
 =?utf-8?B?aG9qc21Xc043Y004S0VNWktQOTdsbFZlS3dKeUExdTgrL0h1ZVFQWTFraFFF?=
 =?utf-8?B?c2JwY1VNNG56T0pLVVltTmpaRFpSSWtUMGdwVG9sY0NyTElhbjdRc1hnemh2?=
 =?utf-8?B?TVM4TUJJbENpSWNNSU5VTHAybW83WGEzOTR0bHBkbDM0dnpoUFROV1A1cmRy?=
 =?utf-8?B?SHg4U250RXRoR2lKd1ZPUGQ4RWV4UDNmaVZIQ21wNVYzVTNNY1Y2K3JOTGUz?=
 =?utf-8?B?UVZXZkppU3R0U0JDUENSMTZGVXp2TVZFTzE5cUdxcU94NDRXbEpaZkRiQ0pO?=
 =?utf-8?B?U1ZxVXY4bnA4Y1cwb21vNjBBZnRBYWR0bVVkZ1dCNTZSUFZldmpvZXpRWUV4?=
 =?utf-8?B?d2p2TnN1Y280enVnR0I3N3hNRmpYK0lQb3dBQ2ZCd1VZeVh5Q1pSTzhIQjhO?=
 =?utf-8?B?R0NFa1JxYkFwOWd3ZWJIUktjUWE3dDRZUXNxb3lpQmthczIyZDRsR3IxcUhP?=
 =?utf-8?B?U3J0OFhIMXFtVEZLTElJYlRYbjZWWE9VSWlYeDZland5QVhMalNlY20zcGV3?=
 =?utf-8?B?ckVVQVJPVnE1OHQwd2EvRk9lUUZmT0xPRmp1YlJ1OElMZUZucmRKWmc4QmFm?=
 =?utf-8?B?MDFmR2dJRTdBYVUzM0ZRSVY5MXJyZG44eFk3NE1BaTBMSFp4OW9XUmszd0xK?=
 =?utf-8?B?Q1dwdGtuaDNoOHdqWFQxR1BpcFdzemxQS1grNTBOWDNRTGFYbXUvR3VJNWdr?=
 =?utf-8?B?R21DUEhQaEU0SC80eHNqNWlVbE1MUHdEUkVBRlc3emVZQmdHTzVPblRuU0o4?=
 =?utf-8?B?cDlTSTdPQ0x4NG5sU0EzSUhjYURMN0p3N0tsZXNYL3J2SkxlTTkvemM2b0hx?=
 =?utf-8?B?Rk1jUGtJMTkrTkloYy9jb2laMWJJYjMvbFh1UitadnZHZ0xMbzY4YmJ4VEVB?=
 =?utf-8?B?Qk1UZUI3b01mYXhyVmFVcUM0c3g0S3l2NlQySHk2Uk5QUmxvRmJEMVFOZTRo?=
 =?utf-8?B?aDBxRnlwYm9IL01yTEYwRVQzSjhnS044QU9xZ0FrN01LcXVmODZ6ZHBnRHpE?=
 =?utf-8?B?d1kvcnQzRnl4U2JHVkVIWHV4dWV5QkRxaE5yQ2w1R01BazU5YmhoNkJqR3hC?=
 =?utf-8?B?VDRBczNubm1wZXlxckJoY0RoTEg4R1RzeDVTbTJjSTBtb1JMRVg0b0NKelM5?=
 =?utf-8?B?WkZDSU15TDhwOHduYTA2VnlDV0ZpNlJBRVBjY1J2bU9QdWMzeHJ4NTdTeG5X?=
 =?utf-8?B?R1I3Z2pTSVlNSUxPR2FQeFU3RkRXb01LYlNrSUpneCtJWm8xMFRUdEtlS2Uw?=
 =?utf-8?B?bEMzdVNGWjM3VkdGNmk0eXFvdTNjNjhkdmZlR2tSc0huUGN6aXJHV1FSNlVo?=
 =?utf-8?B?WTlDeXV0dFZFRWthRUpaTXZDeFJhNitWYWdmb0hVbUlOMjdiY2YyYmhHZVJE?=
 =?utf-8?B?WC9nTFEzOVBFQkQ5QzBPTHZSZllPeXRPQ05RR3YxNURTcXQwd21aV203QjZW?=
 =?utf-8?B?Qk1mRlQ2THVoN2svU2hXdlhwdU1SdUxiRUtmUktsU05EclVnbEtJZ3hWY1pQ?=
 =?utf-8?Q?hCUMVYhJ9Cv1R5n0yjPHu4E=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7176ed-6a01-4ed6-55d9-08d9ea12cbcb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 08:21:10.0766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xwm4ZlJ17McR+MX1DYvSzq8S71T/Lm5qy6JqoKXRRnQRtyItPNvqt8tkLcKGt1nTaQvrLnYYohHZl0oUlUa+8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7130

On 05.02.2022 11:18, Roger Pau Monne wrote:
> Make sure softirqs are processed at least once for every call to
> pvh_populate_memory_range. It's likely that none of the calls to
> pvh_populate_memory_range will perform 64 iterations, in which case
> softirqs won't be processed for the whole duration of the p2m
> population.
> 
> In order to force softirqs to be processed at least once for every
> pvh_populate_memory_range call move the increasing of 'i' to be done
> after evaluation, so on the first loop iteration softirqs will
> unconditionally be processed.

Nit: The change still guarantees one invocation only for every
iteration not encountering an error. That's fine from a functional
pov, but doesn't fully match what you claim.

> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -186,7 +186,7 @@ static int __init pvh_populate_memory_range(struct domain *d,
>          start += 1UL << order;
>          nr_pages -= 1UL << order;
>          order_stats[order]++;
> -        if ( (++i % MAP_MAX_ITER) == 0 )
> +        if ( (i++ % MAP_MAX_ITER) == 0 )
>              process_pending_softirqs();
>      }

This way is perhaps easiest, so

Acked-by: Jan Beulich <jbeulich@suse.com>

but I'd like you to consider to avoid doing this on the first
iteration. How about keeping the code here as is, but instead
insert an invocation in the sole caller (and there unconditionally
at the end of every successful loop iteration)?

Furthermore, how about taking the opportunity and deleting the mis-
named and single-use-only MAP_MAX_ITER define?

Jan


